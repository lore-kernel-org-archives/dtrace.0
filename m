Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE2615F306
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936889; cv=fail; b=eRFblTJdGBqaVESId0k1wA80e1VZCKEJnn4IAAv8WbV4EwTMvcXtY+a6eD/hR3wQ+Gqu2jbuSUqMBWSJId9Adb2afEz/BxzmrLUucxqiZOeMpvQ75WA01eGczeT9PCA67ZU4uzdTIxIqWCtfbPO87XqvuoKznZuJj8y56XmM6MU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936889; c=relaxed/simple;
	bh=Nq2dqkDlo6WkUImHhmgnTlceHYMLWjOI14bSCzhjCFg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uDXc1DNC1JnhT/x5xLDuaFwDaWwjIjiz6iEQOzml5eZlZXs2I+WKx05QOJ65BNw6Nrpsh9vjUjhvakyColmzMHrUJglndgMp8snrnqKXXHymsvtuLxl2KP4S1RrYZWSz0qrlAFoOYYlRqscPk9LAzmPBXzME8o6UMcfPpsaO3EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nE/X5wIe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dAak/ADC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nE/X5wIe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dAak/ADC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH0rSx014482
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=JnuCeDQBQSK9qvNNqwqbcCt91SP2Y8l+7CuE+UJkqnY=; b=
	nE/X5wIeI5G4TFVUrgJm0SRM9N/qzUQ8k48jWly8EXlRlLd+Q5St4cwGgJeLnNTZ
	HeE+HG7+jL5gLlIVQ/RtDlqSgKGDhbJCaRnQfghGtzCO2j5K76Oe3aE2R17ipa9d
	P0VUZMdpae7B2PtE/w0X8jAMFRrxaT12cMVPY11VLASisfAfOQCsqQNoIy6SRE63
	nfMw8FcCogxce7GVz0VIdr+s4W8l8UbYDUcOwxMTtfwAqeZzdD90e3RJg9LKHaz+
	8GeLXV5vKZeEcceh2tzH2uhcdlzAznI+yslUMkI0eoKFf5YjH2Cz1gTeF4iB5gDE
	VvYOGo4x6coclZ76MIp3YQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t78389tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHbBRC033565
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:25 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013040.outbound.protection.outlook.com [40.93.201.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rweq0e24-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfP3UMmyTl8cufEjaQ0wKfvpzMjgLpCdsy6bNngPS1mFsxpBXLLoAFwhOdqBskjN/MgEP7Wn9yBGFzVkvJnrLf5Xs4DHHViPPnQ7ql3S0CTYhJQzxf3tof7U0rj1CgSez6/J7cVbN8QaaW8lnuFUs1TD1isnE2l9oyO6b9/efHXH9pKZ7GeLGeX7YQxhF839IdpPTM5mqXun9pidO9IOjyosCoGcmtPd+TOFZavHg/6PMIMErj3Lth8OEKOjox5+U0yseYZL0aTwa1ZwXcohBfp3DsQir5kdpKs/cgsNDxWL1Cs2iGLc0EYIb62bT3O92J0cwaEAg4tI9PY3z7XrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnuCeDQBQSK9qvNNqwqbcCt91SP2Y8l+7CuE+UJkqnY=;
 b=bQDtSi9eYH7c/l7RjHT0nm8gs51j66YwYGC/dKA7pqY4UNrVkVT0PoJY3Zk4ov5Wf8hTkvqjdX8wGFqY4qrvI56GgNWtlcn7ToS5pgClzRA/RZo7Af5qGa0pgVdY/QUy99XhkJhpus6ZhMazKad7Kg3Dw9rWP6+YSk0IfEO62ERnd+cme6YYRqQYwiZis/ChlAmjU+uWTM+FblEEBMLAkIAjGt7qZHBYKZD2uZmhgGnHQBQrbJcIZGwgaoAKLP+hbVZpRUVlz4RtEr8zygGkTDQesst6HSXJUWynkuR05E16Of76Zj8cywUvCc641JlwNOFM45bJTdDoR+2+QO5Mpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnuCeDQBQSK9qvNNqwqbcCt91SP2Y8l+7CuE+UJkqnY=;
 b=dAak/ADCIoT6U2N47yztgQN7v/vJC4X/xSd/fiKu3JJmt2maugrlt3409HFF8398bMlo0qSDER17qAmuV/Jbme8nGTKMjaMm2prvjBzSV7PdRWCkJB1GJIYEgcgriRXpo/GTwRKSM2jDmn8Ag4iyPG5JDxZt3OR98l4J1NdUQ0g=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7590.namprd10.prod.outlook.com (2603:10b6:303:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 18:01:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 01/14] Fix stack-skip counts for caller and stackdepth
Date: Thu, 22 May 2025 14:01:05 -0400
Message-Id: <20250522180118.27343-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0002.namprd08.prod.outlook.com
 (2603:10b6:208:239::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 76244d61-9074-4f9a-7a48-08dd995aa94d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kSSAJ5wpDS+YiQIO5FseYlsIBZSPBVfSiZsCjQdhE9Q6uVXbiLCO+6mjeMW1?=
 =?us-ascii?Q?mXi6F2648mQwhpQ0YC0F9px7G5DjklUm0D3KpWfxns0V2+PJ8MWpwrPeHP6B?=
 =?us-ascii?Q?7NiDNI4Ho5wuGkTtc6uKbSCXS5Rub+7P6iTJ5mntkYdVAVHgwLTd9IxazwQs?=
 =?us-ascii?Q?tGoI2N1Ja4MHAjFnFuYBgS3B4pOaTQSr0G9miVEN8qPmayqZgTAfa1X1IwMs?=
 =?us-ascii?Q?/BIMXQCion6UD+Jt8T+c28pg2r5+iXX4OGA/wStUFH7jplZAQDjjXX/IO6fn?=
 =?us-ascii?Q?xsnLCohruUcfLOwDQyzyKmPzlQ7QFBYfJFGKdbxAv6e+QKQh5aR8YG/t98hb?=
 =?us-ascii?Q?Ldx0smZgI39sq9rmThYSOIixdKreRLu3w7Jn20TKj1YW2LkxZVOD4/FfaPIT?=
 =?us-ascii?Q?Aem2Kc/Yd7bJtQu5G/hoGYg/mmTO4uSZVtoC0DyJYLRZLOIMIIYY8VTV0bTs?=
 =?us-ascii?Q?YsihtsTSM7VqCtEl3a7gr71KvGOdxCHKjVFG/3GxPX+GStUzdQXfXQwL4bw8?=
 =?us-ascii?Q?BF69OnR2J/+Z84SXhFZ/tleMpOw+wLKDFGM0Ulp6oiykzTie4S5S5llLPTfn?=
 =?us-ascii?Q?X22wYusrV239eb4lRlkIgn0qtFB0CtzX9oEkrL58LVzRgqHr81/w182iqfGd?=
 =?us-ascii?Q?8D2QLP46KZaGOH1SN5vmuRXTAGMzKJyZjsvoPa6S4VkwB9dm4dlRe5iQclqi?=
 =?us-ascii?Q?ujW7rwjhN+xxrixdHhhWG3cd1OThB4h9AxdziKGD/7WNL3MSeCPapB+6kvGp?=
 =?us-ascii?Q?5H4G4Akkg9YZj8VKM1DfFtUW4nUOIoSz2iI9cuygon+XoWvtuMa/QVV3iLhv?=
 =?us-ascii?Q?JevNCoQ0PYPQVeMG81UwbvEbS/51/LtvqgCmNaJGODmLNd2kPP4UNpltb9jx?=
 =?us-ascii?Q?RoT99GO2vjSgdU7qd6tn8J8wG88c6jwUfXvoh4+kutriYj9Jwta7W4i/YG1M?=
 =?us-ascii?Q?1FXrhUjX+j+DK9rxrCVOKuL23HrAb6bUt+JVhXFxFdv7venNc5oQvYs6cMRp?=
 =?us-ascii?Q?zPYfdjyqJbBljCP6zw4KNgLiZh9p/p/m0kwBRm5t6Gach8L1tfYrsgDBcozq?=
 =?us-ascii?Q?Ul4RIo6SmNlpl112AAhBV1dup6bKsBQ9aVG+8QbGUuJWeoFoTA2HL3bBeIoN?=
 =?us-ascii?Q?zwyFcuGmfhu+xIrdzgT7qbWOhSFe1IIyqbUf1KTR5ePjJa7p0wZuy0k1b3k7?=
 =?us-ascii?Q?NjU52nV8EwBDtYO7ZFzNqtlEWixa/i4KoPHwdyU/+R+a87aPnQJZGNcZRhYZ?=
 =?us-ascii?Q?CtLvbw4dEEi3zoJaE0TsgPjnzfrlTyyQap5Byw9wWBQ5O2+nir12ioH6k0fC?=
 =?us-ascii?Q?0xD+7BSHH9reMFHG0DskldSg4x5BTPVyVEjG4dKo/b8h6ymvuJJDRH94O53R?=
 =?us-ascii?Q?SSRurd8NZ0I3Fi/xkzPY3HDBFFMMlpGouIOiXGS7WO2a6qaOs/Z/x0CDIZgk?=
 =?us-ascii?Q?0p8lFFeWu9s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dPgg64w1PeExBtWT3FfTUGUY0inYGHhYZRKNMr5zuotCypBGk+LknU12BMWu?=
 =?us-ascii?Q?2Mv8xl5/e7yXCFGIC/ls9Ood1Gae3LCwExm/W1DQ+gBYX3PZV0h7nkfqtU/O?=
 =?us-ascii?Q?Y2jxnpJC3WJlR2IWDBXdRNs2Rx24sk9kAo9bik1kzOW6bKoTESKOlMTWU/hE?=
 =?us-ascii?Q?t9bD1glo8TYzbU7YC9aw59hme/JApfZcyOJU+Skz+LPPaNMTAcAJHj2zMCxk?=
 =?us-ascii?Q?GyDFtorPdvu6V0vfxvcUnR3NAJ6PleaaTNVuIvaFVh5TmwFDgBkq0FWUIkdI?=
 =?us-ascii?Q?iQ7BUDikGKpI5jUwy78ZOsTEk8U+V0wFOmB6j0TDJN3F/LJoEi7KL02qH4PY?=
 =?us-ascii?Q?/urop2fErhrhnq7GEYT9tJvsOojxVJJuMLJQucpyX4ofhi4a61BnbAO5/aig?=
 =?us-ascii?Q?DvIRy1+8N+m2cahWaLHF5V7gziaBdx7zEdIugB5KpR2/jsaHD4hR5KOu5HKS?=
 =?us-ascii?Q?9MINBQpLjLb2I06tOU0T04nGVhFuulsQC3NsXyMVoVIq0bqqgor1NtncW8b3?=
 =?us-ascii?Q?T4F2VxgzPR5HK/3MNR3aC+J/5dVskUG7+uwfVUw8mKsjiiDsnXzpTDo7+B8h?=
 =?us-ascii?Q?QbETPdIsD10wThH8I3HYU2gndhomixKoCbwjU6T2c6jw9kMzOQzwPd5XnrAq?=
 =?us-ascii?Q?rwfCwZzUuboVT/gTR9pMZn//u0Uxn8Tgm7Y1UFFIEXwRB4o+1Q8wrv70HInB?=
 =?us-ascii?Q?7k4k5O6buFZWf/rA/Sdjz3b+MFYL6+/4a1/ACnE+xCOyWDaLtM6Lm+BhM7vj?=
 =?us-ascii?Q?6H0cuTO52W1hfn9Ur79BnyOwILiyO3ap2wtquOj9TUTpn+AHW/r5YJg+6dq6?=
 =?us-ascii?Q?WlHkT2CfP2JttE1IlrqKPeKUvtPvV0MD1fimRPcVRm6p+RgYSKN23FT/W8Dn?=
 =?us-ascii?Q?Iz2yGNc3p1/Noa5fliX/MOguhbZKRYIgyveX7Ol4uLwL+DTPVIGKr57kjgkj?=
 =?us-ascii?Q?qjGU8N0Pt/iDnOqE0UsV6b/iHz37r4e2l33yAOtwuUoC+Lcbnx1PHxvwAWL6?=
 =?us-ascii?Q?XtZDq/tHzyecKtrr4SYIKMdZU1+dk8srAjEEa06B1BrZEG4nGGLz0NCSOmvu?=
 =?us-ascii?Q?3ztGKapUau2gXKrIkRmtxSBwvXF/8fx2FNl3rNoycXapRXUmXelYn6UWXtRP?=
 =?us-ascii?Q?s/DqbmIFQcGlcFU5LfNY+7Jxqm4v2kKs2HgDi5nOOvFBdTZBdfGE+DbArm8e?=
 =?us-ascii?Q?LbHm22BpN0ExZ/t6wsU2jZ93tvy1zFO6f9N7j1cvYM4rVEIZMd/SllaYzNRG?=
 =?us-ascii?Q?ADmwVHD/HZaCMI+V0NK/buleUMRZWcRO77z11+oh0Ae81tFypylOJyof831H?=
 =?us-ascii?Q?NW8uBOIs65WPU5SR9Qp9xXWm/9pM1uFfSc7pGVli9Amq0O91dwPpPF6Gz1h5?=
 =?us-ascii?Q?KnC9X65hzMusKWRJXUO/GOL2qXPwKCjJnqL7MSdOzPGUC8SXXHX/cipdCc8t?=
 =?us-ascii?Q?VwM/+/ONj0FI9szKiPDCGli55zOYYud/BwYVRmhRbBw66lTuWokMxEAN20fy?=
 =?us-ascii?Q?nKWRthxNq1MNW+S9VnWgghbEsDFEZPMhfGiat8o/PyX77mTOPPC0wA2z+cRa?=
 =?us-ascii?Q?zvan1llmr/WeFuaEips6Glk9qYGXopntyxHOTj1j?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	urel5Bo/THYFvrV9kxwJxIiYxC+xqbcal9BqPvoSChAQlH2/ndvbnaWMqBnq0i0INiWBimOpJ6klWNyJPGsdBdjBYndZeQS33cCiiyZwGJzVYVlrwq4kCuhPG1FajAllUQ+n73f4W8vNJwNhoBE7Z7EvmRXHq56RTDw1osCpsag9aYjxo4FP34kcPcLa4hPCuzejjKmeS72jIkktnMbhHm6PTDJ6DQ3YcvmZ8izEX1/SoDjV8RFv9QVIrPE43JKjdnraQv0P195JmoCWqQcdj0lDHeRx9rI340NEcpp/LEhMpInIKKydqlj0R3bAgNtpLMbQekujuEakT9ZqRtSr2/wKu0RNiFKnT+v/B339vSfEDc7PkJwcnkbgS3+Af4wLPoEARJMGje5ijj3S943B5PPxfIhTdr+1cOpgy0uYz0zNCvaP/FHR4nftJNW6zBb3WsSFu8XpOKYUi6FwPZ1//5z0nYH0970tzlpJBc+8JG7EdDbwnZFWSUI7RdbdtNWRHBPnSSmI4hzx98t3pkXNT44mxW8kbY/EH92T0o1Pgpar2PHwWwrdgPotRtoRod7xNs/hHfbEi4YNsQd99ACr9r3p5hZeK4OjxtsAXS214vM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76244d61-9074-4f9a-7a48-08dd995aa94d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:22.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBGY4W5SmdLVHftsPru+ETgUUV1tEV2DYjdy+yAZ1PyOdt9X7JaLjzWhhWpdkN/A09GucYdSCEDutcDOQAJnkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MSBTYWx0ZWRfX2LobeitamdAl mCvoQm8yRHhhaZ8Dyk/e4YXxq3w937Olz4FMyrd/c48tM5l8RwQOBk5YPGuecazKosQo8aqJi/g D1oiq4aLzmoCgVsA4LJff0GUWEQR8TF6oFAGewpcVV/NKWPlk8hg58GlB7dmrnUIsDrloFINJcJ
 OR9BHLs6DUh7WvkPbGJbPiuulO85yZcfp+ZRTt5EWxbJ+gVcxVEZRikMUbNoGMipKzuKtd3ilnh I8Y36bY1EEKlmfDpADNJk9W0EvsFWFfxckuHZFgslyaClyCilhKIfR+8D9M49/ZORumUXHbX+ep XQKHloj5DqWMw3YOkczseHJLcfLz+Cl7iFnxRpU0mN0CCozfYyCxqfgPanS/1OxgtwotKzWl6uh
 d23FtvlxVQbR85q/OghTjbguaBndk1cgO73nFwyN/EV3lCDJjK/LR0OeNCDJjHJi42skQRI3
X-Proofpoint-ORIG-GUID: Q4cj-lHwwqp_JTkGLXszp2VAwbUbwF-1
X-Proofpoint-GUID: Q4cj-lHwwqp_JTkGLXszp2VAwbUbwF-1
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f6676 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=hAL8PR_slyO0inLZDI0A:9

From: Eugene Loh <eugene.loh@oracle.com>

Apparently, when we call the BPF get_stack() helper function,
it generally knows how many frames to skip to get the real kernel
stack.  For fentry/fexit, however, this is apparently not the case,
and commit bc65cb44d
("cg: allow providers to specify a skip count for stack retrieval")
added the ability to skip frames for fentry/fexit probes.

When this "skip" is needed, however, it must must be even deeper
when we descend further frames, such as when we call dt_bpf_*()
precompiled functions.

Add this support for dt_bpf_caller() and dt_bpf_stackdepth().
That is, if there are stack-skip frames, skip yet one more frame
when inside a bpf/get_bvar.c function.

Note that we declare the skip count volatile.  The compiler might
optimize code that uses the STACK_SKIP value, but we will subsequently
perform relocations that adjust this value.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_bvar.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index 9625e764e..99a6503d5 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -53,12 +53,17 @@ noinline uint64_t dt_bvar_args(const dt_dctx_t *dctx, uint32_t idx)
 
 noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
 {
-	uint64_t	buf[2] = { 0, };
+	uint64_t	buf[3] = { 0, };
+	volatile uint64_t
+			skip = (uint64_t)(&STACK_SKIP);
 
 	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf),
-			  (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK) < 0)
+			  skip & BPF_F_SKIP_FIELD_MASK) < 0)
 		return 0;
 
+	/* If we had to skip any frames, account for the dt_bvar_caller() frame. */
+	if (skip)
+		return buf[2];
 	return buf[1];
 }
 
@@ -203,9 +208,11 @@ noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
 	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
 	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
 	uint64_t	retv;
+	volatile uint64_t
+			skip = (uint64_t)(&STACK_SKIP);
 
 	retv = bpf_get_stack(dctx->ctx, buf, bufsiz,
-			     (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK);
+			     skip & BPF_F_SKIP_FIELD_MASK);
 	if (retv < 0)
 		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
 
@@ -217,7 +224,11 @@ noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
 	 * If retv==bufsiz, presumably the stack is larger than what we
 	 * can retrieve.  But it's also possible that the buffer was exactly
 	 * large enough.  So, leave it to the user to interpret the result.
+	 *
+	 * If we had to skip any frames, account for the dt_bvar_stackdepth() frame.
 	 */
+	if (skip)
+		return retv / sizeof(uint64_t) - 1;
 	return retv / sizeof(uint64_t);
 }
 
-- 
2.43.5

