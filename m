Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1731F4CBC
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 19:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769456372; cv=fail; b=azeNpONUNkjzIDj9G8niHNjAr4N5FNOloQK6poveF5XKKNPX9KMLnnbd6rdGgNc1zhH/Cna3cuNGPpmCiyRylMrmdnUWCBe21t4t9T+Zb/zc8k2WVMkoLBcuuJR0PnFxfcWTc7QIzKEht6vAA+qLCf3DrikOtnLHf54BEfGL52c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769456372; c=relaxed/simple;
	bh=R8is6jqYWAQnsaMER7lUwlFv44hD6p/oDXCfN0v1hhE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PpnBEYB3UJJGpPjc+siz61H6aljxvKk9ui1euFxUM5VRoN1jmtEBKOA1f8poYlK1cBSOQiCYYav8vUbqMN8XzjV7je9roOI9Yb3pWtkqJvbntF+xjf18TqT4tHeFc3AHW9do3GMEwlpfAdAkpCQgRFBhCVo0Pt/em8CGnwNWtsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XJaoBOXR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NkzlTBF/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XJaoBOXR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NkzlTBF/"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QHFlqJ871441
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 19:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=WbozviLvjgb+gm4eshbyGOK3kGenR9LC+49lDBXpUnM=; b=
	XJaoBOXRtBxkzvILdk5EKYlxGjJxaaSz3LPFCN9xFbgn+xk9MyByGKpy4GstND3n
	pLbF8apRP61CuLf6b1Ef6nt3Z2qrT3gYgt4GZ66sX5Z4N/LmpXwabuA6Kcld2/Sz
	r09CObQfYQXb1BnVVWR8+rpMxFUnVKAeXmBIOuNvLRkxxdpmIhU1Liy1aNxu16ul
	rGk3+68gmlMlUhU3sBsvkHS9LIPqDI3pFIFcW8zU7/cGaxUJah3k+f6sG3xvd43u
	0wYdCr2CKb8+e7o6JeD/Gpi6cZl0jHW1Tjth9nTlMlR4JrNpV88zPIwot4qF+DSw
	4DmXpa3Ptr9d6hJph7odSw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvnpsapd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 19:39:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60QJ1td0001716
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 19:39:27 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhcwmqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 19:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXG1UXC1sHq85Cf9Jpclr1Xd0lc2HD6WDsxcLYgP6U1m0BcTKlZEP6UHulBDwRWkRAHGm38CMUMTzh/Z61eh+JwFIOv9/JpjF1j/2CnyiFAoABSwWEv45Iq5EkQzxwJa8TqMJ1Y+Ga1pck4fJ/0HJMiH/b0RoEltYGsB/BpBhi58cMBXyt8k6sth53Fpv9Yh/SIPalcExdCpI7hVRX8mItODnNMpuTK/4p2AKxtlmRUufuf7t1idXQq2Tfj83ekPUtREOKz699Cnz++khgaexVMQncRxdULGn2AtZ3MOyO0mQYglkOZHham9xPkhHvClIb25yb8xwH8hNqc19pnglQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbozviLvjgb+gm4eshbyGOK3kGenR9LC+49lDBXpUnM=;
 b=eWOA/NZJufEIP4Wr7YzrPe1PGyArKjTchILRbUN4L9h8lwlbdfBAGK+2JhfSOlvTSIpWQF9rbfBJf5c+llw6QoJBWa+5BskBQCoedKoLqANUtnjbldjKVNh8WdWnKxt94EwH3KK/+5QMeRJmgKV5Cf00vuab7y8gbWQbb0Bbgaa4onZ6JW1R+JtHak/HYeANgqc7yvROit3glXx4gxFHiNe6a1Pz7SmnPlQscCPGh1lkyo4aOLQ52InKl92M1KlwMxx3KUxbtzYj8gXbEjocC6QyLn8Ij0Dfx/WAQ6IWUY9/Ai9eGSNi1AQlk9rg5YuA/2OcgFq98Us44lR1mZsavw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbozviLvjgb+gm4eshbyGOK3kGenR9LC+49lDBXpUnM=;
 b=NkzlTBF/sRsR3vyCHwFvLpyrxt90U+VsqGXyFOY6eug1Ta+yxyrSvUjEuZZfLTpd0umCRZkAyag1QTs9bm0POmD8wWkZ6SmLYWzHVT+91wCgozhLS52QH9CEv2X4iHHPkBwcNZIoeblJ0i5KaEGMDXs3KvGbT6seXCgebpCZoMg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB7709.namprd10.prod.outlook.com (2603:10b6:806:3a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 19:39:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 19:39:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Add llm directory to installed doc directory
Date: Mon, 26 Jan 2026 14:39:20 -0500
Message-Id: <20260126193920.16930-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0037.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: a09460ff-a79f-489f-2475-08de5d129adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QZc1Qt3U7o+OjbPuv930dUApO8s1Q3p7WtbikRgDsUFs/RAmWz5qdWwdBbOS?=
 =?us-ascii?Q?CIVS7JT/l6SaephdD5CJtoxLyoa/gu/lepV+Ra6p+8MGEM/HuAaYfS2eUN9t?=
 =?us-ascii?Q?mgdAqTjj+8XJd4eq4Q6HZOe6Dc8691wyjJD3pct5XAfSggAg94VBZwuaorVl?=
 =?us-ascii?Q?CiVoQF76sTzuRPnEuwY1jJ+wjeUWoF796RIuQWL65KDk2O15ftuH9jtQfAXZ?=
 =?us-ascii?Q?AGl3OQtMhQ2BecgoOQR61d50owSMDsy8qa1iD5y6Qf8n4+Xmri6m1y1GMDnO?=
 =?us-ascii?Q?8O+6Bxn2SL/6zHZva17GRLnIuJfYQ5InPW3F8xzFeyflmHt2uAkvJLYi3tIH?=
 =?us-ascii?Q?nW+36h2dmnQ4p4+xcamNG9etg7WQaO6+mF4wV9Pp8i3NHJON4q9MiHA1/o36?=
 =?us-ascii?Q?8UtJR8zmrowDO3BxomdMwOcNiCltRAuLvBzm0Qatz5ySZzLBqxq6qofuLkXP?=
 =?us-ascii?Q?sC7eacHeR9YUtvFylzCUSCFiERL/TmYjjoKko3sz8EwRvIAt3aosof0IT2GH?=
 =?us-ascii?Q?sExBiTMWkRrQJChfprBuwqQFJR6xkzYueGLfLxGyEJGPyKYDjsuCIcd++uAm?=
 =?us-ascii?Q?Ql/POqaEK710hBI2wN9YoeuaBzxkW/2mI3UxzRexIN7l0vXO3O+41VGG2VKg?=
 =?us-ascii?Q?anMVA2cSNiZXl9sX6Cc4mCiVX/yQNMdilB3UshiJ2W2T1xjasJk9H70h0CX7?=
 =?us-ascii?Q?updLLKBzmCtFebYWvD4aqfIjkmf15XnWTcKTX/uR+9o9qD9dic1hJhNZcgm5?=
 =?us-ascii?Q?Eyn85Dq+C9WbsypIL9JnGZy9r04BuEwPJLPA4cGoIv13o3BcLeHUkaVtCbVc?=
 =?us-ascii?Q?gJqgpmQZTBVkePj2r7q/je1qcQsTG7+iPLKVmmsa4sUeyv9ItO1btQKo7Qnk?=
 =?us-ascii?Q?pJLRsAs+wS0FwXqygskM8/O5sC/q++krMTsqbQlWytIWLtoEqTT8UFWgHRp0?=
 =?us-ascii?Q?TCmlY2KVS+wQalLCwdFteJhGH2yc3PAONjRnZji5J05rz4X0tBeRm1RYwoAT?=
 =?us-ascii?Q?qrV/SFchlNC0C7TTx0yaOzSoT1ZEsnRExeX8TmPhJ4Vs73I0PWOO/34D8aFu?=
 =?us-ascii?Q?PXRZGZIrS4vcXbBU8NUyjKP77kU16terSTOevLJ9gkpNYgHbmGQB2q3IJGur?=
 =?us-ascii?Q?Uz1OciXn1ZV/m8/jCav8dhRiFln48WxK+lKwIkZj/IoFPFrUy28e9lpcNEqA?=
 =?us-ascii?Q?6agc+v+ibMxP3cwGf6SmhZ/9BxJVcc9txPaV5mLcJbflPZDumxooaBm4bV8K?=
 =?us-ascii?Q?uxS/+iSups86v8+C4MwAuw4y/6mDUkRjcaQjkS8NTz1YJos+5CHJcWhiLM6E?=
 =?us-ascii?Q?eftNDCVCmy488wwI6PUF7nb8AzCPrpjrS2DNWmtEwQN6dSsy6nu1IpGdYgkN?=
 =?us-ascii?Q?kF4KyLS5gh86JGdixRaf3GetjQ4z7AI96KgayeXVzaHnEg1wCfcja7b932+T?=
 =?us-ascii?Q?LSoqmcnLQnAhk0vvBWg1Ht8ytFtGO3fgb7XbYStZL6F81PwA19PHKHHLXePE?=
 =?us-ascii?Q?BcyGiEO03Qr8we6SSBqtYkz/Q8gxOWWFMTy+eKPjQqiw4GgK+SwoQjYMYH3o?=
 =?us-ascii?Q?louGnk2+vFN8TPkGoUk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JfhOYx7LqnWX1rP9hG7plw58jGEmxaU1d0E1sIPKAnHNvG+n+pg5A21saGME?=
 =?us-ascii?Q?MNlhTLbu067jyTYGRQRh/Im6u+i/64JHlpUeHxvM/86DS9k19pUDJsETguhE?=
 =?us-ascii?Q?Hc7hsJ46mNFeRp9QvgmfXmrfc8mQ2iP+I/rpES44Yo5UKUzODUQhEns+tREm?=
 =?us-ascii?Q?jcCAYJGu2MfMeaafIuZkYzCA/CNIlSrE1WBj4dLJXL+q46/9MQMPR6d9ZFhA?=
 =?us-ascii?Q?RekmPteWxxeb2htP2M98MaX/9ttHfJvLUwrOF83o8KMMYcV0i3Kd4xLP/cNG?=
 =?us-ascii?Q?4uDSwUb6MndMvSis0RwMO+EJ4fiN3Za4VfvGD7k5NCCPlhP1XieX3c46U7FT?=
 =?us-ascii?Q?2Yy+z4FPGyBTirIqXcn8BtEspGY36Y6hhhAz9mwidIED2hqDHysEWywjVTRq?=
 =?us-ascii?Q?3SJ663ZSFHtDIJ4DBjVEVxtpZoMuatEwA23xndElA66zCjPVJ7rHKDUgD5PE?=
 =?us-ascii?Q?+Wbvaxln3r5dglWtSSzigxayj4jcCHzLxZhTnZyc/VLxLQRX0450HmM80zLt?=
 =?us-ascii?Q?Se8WM1M4BPTGl9KNsXz5R1VanmVNW8CqISWO4UCSGoqUyeaCGWzD9wbyOkVE?=
 =?us-ascii?Q?i/GDuuCq1y6zRL6ktH9EOcBqlJvgF7iVj8u663jrdH90ogCE/jao0AuCLQhG?=
 =?us-ascii?Q?JjTJb9dw4DZ0PrD549o9lV8Y68Jhu6An+3fxAg6Nrz4QE/Evo8D7RCIVOWZn?=
 =?us-ascii?Q?KegOcilKcOORPQ1T1AIEZ6kVVZ4mM7DfYP7S1RIiv91Iy6GDtwiEh290Ij6q?=
 =?us-ascii?Q?FFRi/8hwx/oJJ9g9JY27FW4sHSqg5BpMme6nYvN/K36lsixeyK0EWQAjyAI1?=
 =?us-ascii?Q?aOdeubdsHP2v5sbAcPRY2FknTdmgpjpxAWi7aX59t+3g0jFXgZH5wBhN+I9w?=
 =?us-ascii?Q?ZVZyPZqyw03ChmpRtNb+b41qDZdWrD7/ULSbKiPRyUeeegsHmq5lcY5ZXGqf?=
 =?us-ascii?Q?ZuV8AvqpJ3BiBxF6RAeBxTkOr8akehDiWMpK/6eL8sWCmdPurJ7q1AdLhqGS?=
 =?us-ascii?Q?Z757JMw9WxhHxkQgjzkQ0gjGEt877GkA9qSCIR6rQSlzyFotFU/pDqaCrjjS?=
 =?us-ascii?Q?861nQr8jL49z/zfj938thqDNKpLdCr6RRmXnWcro7WYMZ24izXBHBov+wtp1?=
 =?us-ascii?Q?nDXZCnjzLqTuCq99QUxIQW0QRK/8pdFCoSPbo+C08eum6tZ8tC0Fh6Zxd3pM?=
 =?us-ascii?Q?XXoDTWwpHeLFYl4U5xB7x1Ner+a0M7VemczdqAYBLqltHJqPOR97VCc2GqdZ?=
 =?us-ascii?Q?aHX0POuX3Bgi7OArKru8qF70qmwpOb1laYYbZ6OscecnGWZ1u79nUbz2vvCf?=
 =?us-ascii?Q?w4Q5uxs80OL0WRA3cEKqo2NkiyelvxveF4ZOWniqhN3nXyukgis8gy+cK0/C?=
 =?us-ascii?Q?srQLFX/qCkB+j/7VxZMNzfEPZ/Pi8xq/N/ilExL7nErYWG6HJ7V/s5AQGA08?=
 =?us-ascii?Q?W6C0RWwM3B+yFswche4gMzp9Af3MnpLfnrtOTt9C1cqyj4EnYR04L6HaE180?=
 =?us-ascii?Q?dE0NRX6odASekX5FTem2n7ky7aUsWLpA5vpIuzAsNGBI16iMN14mJ1Fe3jVk?=
 =?us-ascii?Q?sH3YDfK//vQKtwla/U62s2H+dkvG3c7alRTBJl18d2jLEw/L2ip7t5ezr+Sm?=
 =?us-ascii?Q?TYN/vg8y8KYADyYBb5typ6jl1yAn2BHAhDIwWi/jgLMBL8+AfaHopkBa+XyO?=
 =?us-ascii?Q?82f6ELLzE7eRvdV1P5za+vIILhAF1MRAWE2+l9KcA0ydfHeGYtd7wK5ECMB8?=
 =?us-ascii?Q?xB82QUWAWg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r1MZZ1S/avBLST9zUy/NhjcwAZwUCICJjozij3O8YQWLScWI1FbySB633o8kpkO1Y8JZLpsDMgt43DtFKLu+rE8QMecDbBHpswm7/L/JIhuUBoBPSS/sZo9qcTXDi0bm6WVa1lH6mw9ceoXfAYeFHH2dWqtPsU4GmoT4ZKhUKmMuB1Tf90L40eRyxpaQ6jo/2ymc9lPiosot2WZoHeQr0EVykwgX/ygFjazMflG2y57f+68lcLm/jC2fE8chLpjDejOWQTxoIUFdOVcm9NOwVKNEzCBmRNbzntdHdw9jVPzHPXpT9QErkojUzmUxLR7kpNkj25dUKb5n8uyE42TmMTXxglFafyuEpgpREeTh0MSO/9pU+QQM6OC5RMDtnJE71hxeixs5CcqoM7/AdTFItqApoM5sdHbw8w5EF9QYYKs5JU1P2NA+C8JKqD8CKPwhH8J7jwhGS3LsMQX1SwFRr3HAC3cGVgZWRBAUGN9Fg4Q6WICjSXenRN7u/zZaAzK+3fsHQVHylrgc8G3299BYs7wOnrQpfi02Dith/Yju6VcunSow970A3go70BRS5e963VJdtStc1gvn4+kb+U+FXk9K9cdy3NgPCzWlobIU0dA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09460ff-a79f-489f-2475-08de5d129adc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:39:22.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDJK/wgf+Kd/WwmlqHsGBcji6Q7HJ7iyGbZdftoO1YXiIR0K3imRiHV4foXKEQhE8bam0rt57rCOWgyaxJB3Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7709
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601260168
X-Authority-Analysis: v=2.4 cv=dY2NHHXe c=1 sm=1 tr=0 ts=6977c2ef b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=OTha4PE077Qd81cakVQA:9 cc=ntf awl=host:13644
X-Proofpoint-GUID: 3wVWjzCbTnZa2K2XsGWP1BDlSCeRt_cW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE2NyBTYWx0ZWRfX4GQ/LF/yNk+o
 WxLDT0uYfvRo/NNg/1qLW0hNzCnJii77h82VGqt5ZkdYX4Kwd02TM8OakUA8pKlO/iqH2mEa0uJ
 MfzQKHmwdMb57bTJcImJzbcnE3QYuKsaKtFh6ELsfPfLh/F5FOE4Jio54DA8H/YdpkCHLGuUKf1
 tOfcCRFrVKjc5EAz56uF5DkuUFu55axBUUCgaxDDQ7wYZ/mDknt40sspLfVpbeJHxBd0uCRU/w9
 hEUl/wJNjRKCMDvb8eBt9FEIPbRoGBKH+WLKeWwxiMdIZYNk5x3Gd2uwKWw/63TJbdi/bf8InnA
 3GEmc1jcSKlwL5MPt1W2rHbeUVt5APIreIoBZ9pf3btRnlUdz2D1PH7+sEKFgM80ppkoH9HS3lM
 C9zJg8M2BOuNOg2IxH9c3f27vfebvntimxo3N1Np8HOffB6HliJztNa9BRNZMtKV+b9uE7y9S9M
 1yEZv8MrDL3x7XjolM1ou9XJ5o9rBo6xlxxIAziU=
X-Proofpoint-ORIG-GUID: 3wVWjzCbTnZa2K2XsGWP1BDlSCeRt_cW

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 Build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Build b/Build
index 434f8ad92..cb8db08a3 100644
--- a/Build
+++ b/Build
@@ -10,7 +10,8 @@ install::
 	mkdir -p $(INSTDOCDIR)/userguide/reference
 	mkdir -p $(INSTDOCDIR)/examples/
 	mkdir -p $(INSTDOCDIR)/examples/language_features
-	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS tutorial userguide examples)
+	mkdir -p $(INSTDOCDIR)/llm
+	$(call describe-install-target,$(INSTDOCDIR),README INCOMPATIBILITIES NEWS tutorial userguide examples llm)
 	install -m 644 README INCOMPATIBILITIES NEWS $(INSTDOCDIR)
 	install -m 644 doc/tutorial/*.md $(INSTDOCDIR)/tutorial
 	install -m 644 doc/userguide/index.md $(INSTDOCDIR)/userguide
@@ -20,6 +21,7 @@ install::
 	install -m 755 examples/*.d $(INSTDOCDIR)/examples
 	install -m 644 examples/README.md $(INSTDOCDIR)/examples
 	install -m 755 examples/language_features/* $(INSTDOCDIR)/examples/language_features
+	install -m 644 llm/* $(INSTDOCDIR)/llm
 
 
 install-test::
-- 
2.47.3

