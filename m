Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C80225797
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 18:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424793; cv=fail; b=PWb3KBVmvTyRbGJ1vunNAR469GgTZocLfowR8cSwvvy6bDnX9fTSfWGzxWzOKu0Z2VJhBysBZeKPihXf8i0NpghcrJG06j3GbWtyLhscLNIe6nfEPXDqAXr+s4DPI3+Iawysx61xHfy7wSbcBv0iJ5jH1nOjOt6rMbRSQzpk0kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424793; c=relaxed/simple;
	bh=nN46dlFehgFgQXf7OJlcGQjoglWjgHRXuW3th98DHXQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=VWbVipJBXMYj/4sxkXXObuHWFacSQP9iYo1WXUr+zBQcikhABtHhW5LtpdOUdN+k6jmEsoOqk2ILG0HXTJlY/NSYu7m2Uuj9c39jQCEazZxFJMxCt6KcP3DdXZhh6b1ippWcsbC1pOuakl8ZVKbImj+n8aFtl2Xf+nlrq0GN4PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cT/SagFA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yeHlRKte; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cT/SagFA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yeHlRKte"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5IYK75000975
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=0GKh5F/ArgWlYLOTcth8gvsXCBCqDGsFLh+70thIaec=; b=
	cT/SagFABvZwiKZDbonYQyk5cXYSZHO6R65KiEzLdrX7WwUmDLUfQ5Y3omqpfcdQ
	dL7DZg9HOxiB/ycJ9+J7T6wcktipo5wvDINU0WmaR2yqrzq3koB65T3TOalHh5zV
	3jgWV32vnFGBz1wbgNK10AKzeEBGNdRXrqN+v+PtpoOtLAMbwcscNefePWavfKdz
	RJptqsRjQ38fkHUux3I3J189Opue8wI4nRTVdScamk/ZUVQjrxjtWmp6WndSOcYp
	UYuq5mddnZhQg2gpfnk2c0ya9CTXXPTQLGhsWFVvChG5SZ4taNKEKHgm7JkYNyDq
	nWDpcs/fJrEbal4xh2MiLw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tk93s7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5I7mbD040206
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:09 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836x8k1u-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvakdaAVGfLYcRNndJ8G5QMt4iqK6vxagDCsBqed/lYHTkHXWXlWwvKr201G6aMaO5gtay2pbVx/8OWuPd9rVoZB/eBy6q1wthem6Q2Ie0qbFlUqRkbdCU147ERt4yTmlXy3cjbUHmt0RYmq0t1mVRRCjFdsoaSIzrEDsLZDHQqKE0/IS1zkjDGVC08O/XxjJ6tKH+IoRiYFPFz1fzXjzTQr4nrrsE0QKSrPVm2cLrgw+KFXH8wJuB7a65Gt3NIYbwZcbd++uqJIvZUEGaqapHzsHRwbsfdqk7FeUM0Dor/rEr76iaiqDOFq7Lzm60pOPkuWOWWzJAxrtlt6UyORyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GKh5F/ArgWlYLOTcth8gvsXCBCqDGsFLh+70thIaec=;
 b=hDW1WNFvbDrmy1f4xkTefbzT+dp08D5kZ1X5r4sb7ExwK7zKXkF7k7C0VgtH19t9n3wlYSVLH7eb/quUj6uV58e739yTWkts2iwfYfHSsr1rStC3XKr5KzIWJpqtZQxa32jRsu5pGFWLQR1K0Ne8yLGIqgjdyc042X2aLcVsxnLgwrMCRCEreJrdSrelHRSsgt02F8+vXD8aDf0HMZPgbspImNNdx+fUw1IRMJYXoGaP+mcOE5Z5sq6h0LevKMrDnpuptSopHeXH8twR6Ah48R4wYVTywrQ1KucdbMh9KVAvIQScQzjldpZNOdqhvYliOAh0zGaKwHAQ8fNVvoSAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GKh5F/ArgWlYLOTcth8gvsXCBCqDGsFLh+70thIaec=;
 b=yeHlRKte9D6cVNwlm6dJBOsn5oQNWdN98+3Gh9LTw+sp1Zb83IyIY2Smi8a1TcWWrRxnDR3I5r0R9jOzHFQdxTWJiQWfrNuwXGxVoyZnemBZC67vHmK3lonRCBXnXJKKe6VBHIZ637FEPCxHGukhAS07DduL9gmKkpWuKLSncFE=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by SA1PR10MB6447.namprd10.prod.outlook.com (2603:10b6:806:2b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 18:53:05 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 18:53:05 +0000
Date: Thu, 05 Dec 2024 13:53:03 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] fbt: clean up fprobe/kprobe support
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0428.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::13) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Message-ID:
 <PH8SPRMB0037F7EE6EC0D51EECF963D5C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|SA1PR10MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: aee057bf-bb09-427a-3beb-08dd155e0d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?unlwx4XypYhL6P0o8KfJinv5z1Vz6T1r0d2TiYo3LaIzV0ZuLHyUNBAPjO5X?=
 =?us-ascii?Q?/aJleS+Z14RwaN+pIwi7YitqmjMsjpkuW3rdq8mHX7AQ1macozQS/iZ5PaMe?=
 =?us-ascii?Q?ZxIBZ90RFvyCsGRDG9VnqCQOJkvyeXwQIIujL++2/Gs9CclsUSIvCJplKk3A?=
 =?us-ascii?Q?KydGM6a8Z/QBC50yfBPDUmQZINZ9Xhsi89hmIJIn2pl7MaP86fw3o1EJMIEX?=
 =?us-ascii?Q?ZnIxLXuSl7zE+SbaYVPzEqseP7l6EAbSKUS9giR8w5Skojdo6DbX458epjFA?=
 =?us-ascii?Q?NHVM2RuDArnvn95wLME4MS4f4pKn2Crm4aSjvsoOwn1tJPYtQJe79PUgkKH6?=
 =?us-ascii?Q?69cmfrnKmml5oQPulIBUXOLnzBVlVUIQu6XL3sjho1rVCcn/a5TMtrAux4fZ?=
 =?us-ascii?Q?M9CxLv140DucASdlBvhPema0DrrSUGfh+5AVE2KypTnS9U0aYUK7lFYSM+rr?=
 =?us-ascii?Q?afWHNbhOKAJaleywws7Mm/RK9bW6mGUnqBTGVSrX3tsfT4PHhyq0xyYFZq70?=
 =?us-ascii?Q?ouDT8+IYGtc1dY7SXxeTy5efNYXYNPFUT/bZAz+MqoqrnNTwHK8+runUA64u?=
 =?us-ascii?Q?okjUlpmF7An5zKVnwniaf8mOzu+WOq+eKtaEj2lAcau1W9IVheMVp1qwHCD0?=
 =?us-ascii?Q?op6+51C0Eqfs1gu0jYQPtwxhATOzJeM9dVfYlx6Z9ls/0gEKOdhn7A5ToJJn?=
 =?us-ascii?Q?dotdPQoEdIvCNqzazmgUiGIchjlWlQAfngQ6D4/uQMUPG0MVXVLeZ4TGhnYk?=
 =?us-ascii?Q?owlwjN5GRxbUQX2AumvL6GCAFlkKoGUE+NfnmNqsU2W3rP4Qi9c/RClQgLe5?=
 =?us-ascii?Q?JJOFlJzV2EiAp99promKOoc6G6wW9q4LMABCwvof+UfP1/qSy/mQPwep59xn?=
 =?us-ascii?Q?S5bucLTT3ZuE9OQg4X3/iTNsbH8m4m95lI8oLfbN9TMEsTL3J5/YkcxGAp3v?=
 =?us-ascii?Q?KEqEtetpUXccZO9uOoegohMAEORggu/Naz+Cu9zCU946wlA3GG+3fyKLLWk3?=
 =?us-ascii?Q?kHXrfyK6J/5S7ESZZccE7Tr18HFo0oebgvn7IQzs0tOY4BuxIrihO9WVPR8D?=
 =?us-ascii?Q?t++M98iYS7eXMOFMLh/zeR4SbDIUo6WmlnR9xEYdLcYlaxdfUeGgDBQf0e1d?=
 =?us-ascii?Q?tiq7GuAX/40PjqcNqlfu6qW/xfYnro+TOcstcJrLlL0ZgTiasGiUS61ZW7S6?=
 =?us-ascii?Q?u3f10Puw0YoDGIJo1gSv6ESZCAAis5ZkTMXZ/P83arcB1iBOQzSS8BrdOJWH?=
 =?us-ascii?Q?1qrswYlO+PTYAVsBeXGDxM1cf7grxaf27mLpjKkbBTLfr/0/VyYqsobAXLqp?=
 =?us-ascii?Q?qYkRLwpOMRTnmhBdee62YqbS3jB36wfnaEct8o6nRgcAwQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W/v6fmde0ihFszMIOwEX711LSyA5jjqtg4N9N5rykNFh/gINO7YGr5k3wR0I?=
 =?us-ascii?Q?/smSyfxiAII82gfy1SfeVDXeet5wwJvooCDbL54QUD1lFDY8XmcyU+MZDyxp?=
 =?us-ascii?Q?lLnz2jE9+s9JYZWHz/KaX5uBjez3mPSJzicyE2W2SkIHuSDVWyZF6oDTDL4w?=
 =?us-ascii?Q?pRxEIgoK6rHdQQHq+9UNtT5iI0+uoERSBev2A4PfwVp5BMWAI4eRkI45o03x?=
 =?us-ascii?Q?dOLT41bfdkTYYpZ4BRxHfTuknvGORZGIHngkmblNCGQTowO9h+Y0IrGQnJ7K?=
 =?us-ascii?Q?5tEBM/0J7qk6/58DqZn23KIsOeQpygbIPXduAlFuBE8HU65UBxAANeaO2XtJ?=
 =?us-ascii?Q?vBGfpgaGAMD2TVnKk1dGjEF+ehrCXAkEhe9u4TQCquFu+6MSoBR87n1az5m5?=
 =?us-ascii?Q?3ISn8eKeVQS9mC1FoT0k75NzQu/mvlMLBSwcTPh+KojJ+PxDFvYlelgNWUbU?=
 =?us-ascii?Q?NY+yeL9BG5nnIvbXQWigfWFY1ZTYjBCfVcQkQRs//SdP1IW+33ABtUI/GHYx?=
 =?us-ascii?Q?yQ7xEdlRA3ET6hn84C/HOGcn1QANG8PaIvqFTUYCZHJdlKUipCUxgAvPrVEx?=
 =?us-ascii?Q?3Kv1ckQoWfPs8Su4jXKYgaPgLhNwx+iLisJxIDPs5I1wWfHBN+JDJkv1LkLs?=
 =?us-ascii?Q?j6LwtySjCZecxi4sj4u0HrfSS2Z0eHnpmBoOG7o0DebkeaFxJwLH77NCw9Rl?=
 =?us-ascii?Q?wxrz/n2b/H/eJtMJX8FBKqGsKKubF8G1/eqHcZT1rXord47bv9cU7sIy4zoo?=
 =?us-ascii?Q?MJAFzEFmO7e7TyKd6Jt7NXiEu7sTpiBZOTBIs2+a3E0pxSvxV8ywLlWIPzAU?=
 =?us-ascii?Q?4/APhWqNIHCaQigoI0sC+T4JQoyDiKdXRNDUdyj44yiervGu3HqcMZyRCUcQ?=
 =?us-ascii?Q?kxMV8lJePAA6eThJvPzcWDtXMNiXPsL+VU6LNIpCZe3k2Hie2mUMLInCXswq?=
 =?us-ascii?Q?UPydjGuk2nMhj2YZuGww5xGk4nVZ91xpePIIRo63xzjJf37uOPOVUF60xxMC?=
 =?us-ascii?Q?QTgaY2SkmQ++V8jIMutTr95VjA09ndxKWJZvACMWiZFsXOHt4FqMXg5OkTno?=
 =?us-ascii?Q?w8vkM9za1xJ5T9wRcYll/2hxrvwQ7J0B5VqyVRV4bcxcYnXIrblCzn6GQ/cM?=
 =?us-ascii?Q?0Wy/H86AFMDqpXxwH1uJOnqQGsDbOSy9OYIQkUqBRgm6jZoaNEcDm4+vSawM?=
 =?us-ascii?Q?PUa7MEc0TWp++C4VVx3Zvd8+GefGlRl+Fgc0gqxqsCGekugsYGXXPlrsTY3I?=
 =?us-ascii?Q?JnU6H8HNReqHFzP3wVgZxFSv3olIyMYDt+hxmFhmw16McIq6H8+x2iQkbEMT?=
 =?us-ascii?Q?SPdyVRX4QoZVs7hv+c8eyTcXJ86enEy3o7C6ulX59NI7/dIAqUPo5ovpSKZ7?=
 =?us-ascii?Q?p/saGj404FiFFi1OjCIosp4kvW7bAyHs+oTWtqjowzbWyiRkwvUlOzIcQMhX?=
 =?us-ascii?Q?u+F0cltYk6hTzUENY39ldtO149vIIWFeS0wV/Kr4VPscP6KLfzhkMe9NTUC6?=
 =?us-ascii?Q?dz5268rS+ygtgEUSABfqBZo26R9QpgAhOYxPM8gwgFvhFyJ/HrpuOyfxUO45?=
 =?us-ascii?Q?S3LYZqVSQeqy03M+NxK7lrQcL1uWd3cs4kNL1RG6DwrtFRXAkYns8zJSg1AS?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z8DmA/yKJMQNnWgiPPZde4s4uxBPrloCnM1TNpc4CiPlu2TIYUZH9HYWlf9AjetY0zvtetiPi6vJU4uspSZp3DwzY1bDlOYaufMumwnMKpTUN1xvzWvhzFrPG8Mr2tloh6XxBxKWLEeKIRsecpGgsabRnhNOImcnly1aWy6QAlqXLsqgJqISpo2dweLOsYCBxgKSAdiPf1G2QMn+b0HRksxPXX/WjExRmRKzKftWU5eo0SkCS0jbvJwm8357KQmY1qrQ2iC5GaImlTCIzoSqf7lkfUwXed4AygHCpHiVaHu4Hloc+MjH25u1a98gG1NzcIxL6rbN0cp+g0hoY+eygY3XXJERAVxfwsYs3dItdNU1l7eXP7DRKqTaVEfir5lpDXGxqSDIUTh+GAG/5utxZs9rQuGfWN0dNJiiFARb3xUhVmQ8gbA57YfmYs6VFG0ZjgH1S/v/oKlmHzDrYq5YDLBLJoRvq5VzkYoP+VzrqqudizAaUWhzi03/7GBlWesmKBxOwkZJg5/lJ0ej5rpWZwNoIwcfQDe6KQwLLjvNYnE1PFO11a/l+UTNoL4ZtTcSYomMr1kr2XuPAWEDhIZzSEkOc+AwZRmd/1nbuZ1mt4c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee057bf-bb09-427a-3beb-08dd155e0d42
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 18:53:05.1358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S068z8rGWyNjG/rh0CQJ03QeeFcWVgbEnUtu6Mk8QKnKT5dC//CSlGlgJ7GV0/DR41MSmSY4pamYeGk2Zb0ehDMayIvZVsaXFbdsjW1/6GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6447
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_14,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050139
X-Proofpoint-ORIG-GUID: 5C7L8ASdULqWCxoVF9qdV-f_Kzi9eFTi
X-Proofpoint-GUID: 5C7L8ASdULqWCxoVF9qdV-f_Kzi9eFTi

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 14 +++++++++++---
 libdtrace/dt_provider.c |  2 +-
 libdtrace/dt_provider.h |  3 +--
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index da288401..a60a2e14 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -57,6 +57,9 @@ static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
 };
 
+dt_provimpl_t			dt_fbt_fprobe;
+dt_provimpl_t			dt_fbt_kprobe;
+
 /*
  * Scan the PROBE_LIST file and add entry and return probes for every function
  * that is listed.
@@ -64,7 +67,6 @@ static const dtrace_pattr_t	pattr = {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t		*prv;
-	dt_provimpl_t		*impl;
 	FILE			*f;
 	char			*buf = NULL;
 	char			*p;
@@ -73,9 +75,10 @@ static int populate(dtrace_hdl_t *dtp)
 	dtrace_syminfo_t	sip;
 	dtrace_probedesc_t	pd;
 
-	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
+	if (!BPF_HAS(dtp, BPF_FEAT_FENTRY))
+		dt_fbt = dt_fbt_kprobe;
 
-	prv = dt_provider_create(dtp, prvname, impl, &pattr, NULL);
+	prv = dt_provider_create(dtp, prvname, &dt_fbt, &pattr, NULL);
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
@@ -463,3 +466,8 @@ dt_provimpl_t	dt_fbt_kprobe = {
 	.detach		= &kprobe_detach,
 	.probe_destroy	= &dt_tp_probe_destroy,
 };
+
+dt_provimpl_t	dt_fbt = {
+	.name		= prvname,
+	.populate	= &populate,
+};
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index ca8b53df..1e2e844e 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -30,7 +30,7 @@
 const dt_provimpl_t *dt_providers[] = {
 	&dt_dtrace,		/* list dt_dtrace first */
 	&dt_cpc,
-	&dt_fbt_fprobe,
+	&dt_fbt,
 	&dt_io,
 	&dt_ip,
 	&dt_lockstat,
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 8f143dce..f62137de 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -76,8 +76,7 @@ typedef struct dt_provimpl {
 /* list dt_dtrace first */
 extern dt_provimpl_t dt_dtrace;
 extern dt_provimpl_t dt_cpc;
-extern dt_provimpl_t dt_fbt_fprobe;
-extern dt_provimpl_t dt_fbt_kprobe;
+extern dt_provimpl_t dt_fbt;
 extern dt_provimpl_t dt_io;
 extern dt_provimpl_t dt_ip;
 extern dt_provimpl_t dt_lockstat;
-- 
2.45.2

