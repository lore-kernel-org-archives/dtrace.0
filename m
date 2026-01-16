Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7202FE075
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768598082; cv=fail; b=XphRDiW2OQYSC7WLABswJ1ZnzGW5eX0Cu+5L4m+JWhq6uWQqu4M02KimoIo73FGZg3OepK+05JoxSrqMEk/HOo8cXAxw5XWtpnG3ccYpY82T5fsPKGS3sxiQB1QbtFdFbnpzeokkg0lbrfQ1breQANJ5je+H5WxZpQQihsR/sqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768598082; c=relaxed/simple;
	bh=K9SIsr7i6t1POOpPYvBSgoVFmF3GM0o6tr6iUgdzahE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ujck/TOrxSiViAxWDYPXeVval70EPHFc+pagG8rQXaw+FMaBlL47jCpWApdYw314SJ4nVxwMHM5zXV5uW5rpocorHRQL1tEEsA90yQsIeJA1T/TcookNyp+7YIUca9lC8wsPs4R0dJPtS0I0wIAMRhmZr6z62MfJSCuyg865fIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GX05team; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GAuaqW4y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GX05team";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GAuaqW4y"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKYVAJ366933
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=q2kibWpwTGDWIBpApNDnl6UcDTa45SOnabO1V9aPyK4=; b=
	GX05teamuVvNSgmWWcO/Z7lSCeDW0OCLR/fo/NJg0o6mAtjt3RD6H+uXCMn2JGD3
	TTQnBjmQIFH4JW5+BhF16nqiapNhnPWv0JiXaNurH4guUiPtz8OPVtXi31MsOyDq
	Q2RO2QniIOShRaxgoT+ZwmeTvw3IGxpNuNaYvuZZA478PDU6qsgckI2/w/0MDUzv
	KULhD/F9gX0/Dv/vppHTiAwIKNqofQ14ciODxj+fFW9/vTPF7vQWwJZAy7gwk5Pl
	wiEjzRcer+mygQ48JMOfp9+Ikxc+c9wHGOl11y1x05LWyGM6LDsIW21gkgdoccJm
	C90U56qeiVVNI/YekmHA8g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bqvfng2c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:14:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GKFctQ012698
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:14:39 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bqv7a1rsf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 21:14:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4X5LM+/5D8t/J8uUR0CyE2rNrE535dZOM2YytKDomyXNZv/A3ftaPoZBKDhc5y72rXX8++mUDKDxCpcjJK611++QAokIF8AGr3oyydcMyYk2n1BXvfF0tzL/K0B8nXlTkAUjPYKYxpfv3qHZE2KA40y5kRTOPeZ/FUbhtxrqDZrZ4WvkflkMtomyqP/YFHheWNkGoIuKoitWn2oWGmRDzYHk5jxHYG4FgpHI+q41ShYB60x5upy82/z43CtfHBsxBIp1XVyamLKpuztydty43fx9RpYZ8q1ePsYOiW6gSM5hD5bDG582DkALpYFSFYyuWUOc5jnWI+XeUsds+g7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2kibWpwTGDWIBpApNDnl6UcDTa45SOnabO1V9aPyK4=;
 b=LNxh68OLVinT/dvtQaCKLzpXce4OvU51+vPSY58IbQ4YSauz/KsrMByk/iNsGnecWee9c5VKdj+XODoeJzYJCr/Sd4dOtSst0OofFtVHkR3oQq2y8LXt2p7AKApozZbfhesucAzOz+OD1LqipRO2791qkrDW4l6AbEuaDrtc4fQUmXSLkocuI+JtWuw/cHXbOkCTevlz1Z+QV86eYQk5tQFQdE9BvVu9RlzmX52WGjTEW03AT+D4ej1//krJScngIqJphCHGjweFVKUU/24lnYmTp5xIH51TEmieErOdZQ1lCPdfdAqN9ojlkc2o91K2YWs7UsL57hRvO0c7FQopfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2kibWpwTGDWIBpApNDnl6UcDTa45SOnabO1V9aPyK4=;
 b=GAuaqW4ymPEx/ARYehMJh4bzJk/tvHWD9kHSwBhuud7fkEoPbRdCtIeiX+lYJbjhyvc1LUfaAaipN8c3lianPM5Q7mdxMKAk7UmzeZohEKOibA3zXNjKepVV0XUUF/g+SYCunULCuhQ8Ocb52BlTOInbKkf28mFtdp/CBWB0R+U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA0PR10MB6722.namprd10.prod.outlook.com (2603:10b6:208:440::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.8; Fri, 16 Jan
 2026 21:14:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 21:14:35 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Fix printf formatting with non-monetary grouping chars
Date: Fri, 16 Jan 2026 16:14:32 -0500
Message-Id: <20260116211432.21975-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0047.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA0PR10MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b9407d-03ed-4977-d29d-08de55443fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AH/ETOiIUakyznHYI+VKcICWvv/+HBLqissqmcxZc3PNcji7XyUKoF3V6NUc?=
 =?us-ascii?Q?s2B368jDX1yBnxXqVkTGXlIAqu80NyHLqnmdgEkE0xwPHtRI2QHiMj1d3YjN?=
 =?us-ascii?Q?h3EwPD3Du3j/csrRd47m5g3YjakiS57GmRphuJssY6a3gCrVruySMgcePFwr?=
 =?us-ascii?Q?ByDZZzsLFrNzR1tzwGTlHBR70DWhSpC/k4WGVpYICXaRJy8UeDQ5OEBJxYSD?=
 =?us-ascii?Q?utYcn8woDiPZFYIghoPLc9hG0caAzLz0dR7tkHTPCRul+CqVvsWttjlErJCj?=
 =?us-ascii?Q?d1cD4ApFrExfeMOgKQWgLXOOrSOKwudQU/rNcqHCXOvAvq6oCicLV6ui4+/V?=
 =?us-ascii?Q?2jCLT+/SIMDoxpy0VWrR4oDDUIk1V9DgJFN3ngU8OUbAigsozCocWEY4Rv4/?=
 =?us-ascii?Q?zWxjODgHhC9oMxKzqeRf0fAdHgGoQJFn+nsRCcQ2dIZKAdF2bkol2+PgCEXl?=
 =?us-ascii?Q?MyFr8e+qq/i2tUEgUJQ7xkrjRqiYiiS68pMv41XPtq8MUTCnQwBdZkSIVj37?=
 =?us-ascii?Q?vI8T3jUGhwf/ZNf0S5FXNQDbpybmF50PBJzzm1e+QIVgGdJzyisLwPRglKSw?=
 =?us-ascii?Q?22iDimSiggY766K/bXExeOhUOffBhyaoq+KswaqhKtsadQjWYJ5UYGZQcweX?=
 =?us-ascii?Q?d7VtOVuW6+EnG14q7I+AKYM5pN2hs4z1V9uUm9s5IyAR6yXoK54zhwlI3UVa?=
 =?us-ascii?Q?wqJ4EXulNofsd7MxeXLZ5kT8ym2F4rSAslZMbSMu8hjdIwlAn3Xnqfpf8N+Z?=
 =?us-ascii?Q?NIM6bR4GQMoMsi5XmGIvLVIXrUt+syxLA08F+PL8htafP2EIkdcQ6Mo1hOe9?=
 =?us-ascii?Q?3DMoNbnEMTvRphFDzvF2wi9HSypQNNFH64QPdRpzoXrtA4ryX81J0+KuFIxn?=
 =?us-ascii?Q?31FC2qvlYr6AaFyGmQSNzQknvjF780hlnydfQrJmSNWMMXPe4vK6Cy1xp9ol?=
 =?us-ascii?Q?i2EwzIx+fqQmxx2WD/U+zD780LQZM94nHve7P4njja25C8DYL6YzipeZY8vK?=
 =?us-ascii?Q?8RPTtpFz78pnJRFp9Mxl2g+ck2eifxsRgMuJ3cfZCwhwDXjgcAIj9blboyrf?=
 =?us-ascii?Q?MX3xeIvdbkuL6qzVg4xwdZgYUsHLh+jO22MRXjTd8iWzvsO+uwJpe2s1uBmn?=
 =?us-ascii?Q?FctKzMpGThnMh8se618f0FsQJ/oId6EKQKwtB1rhG+OaVclhjBeO4gbLEMiQ?=
 =?us-ascii?Q?twsnJtgb60QrIHPQu97WfENfHll2seRDoCzfuXBD2yb1fv821qMeiieAW3Q1?=
 =?us-ascii?Q?Mjllu3CGh5iRcLhZoiwiPJ62K7z6Jc/KDLJWtRIuvNTYcVqATk8GqiRuJ7Nm?=
 =?us-ascii?Q?Fo/ERJV/2sU4foxpQ6mgdYWgM3B26EzMxeFfYz9eBeTbVzolabSZ4OSIhRCA?=
 =?us-ascii?Q?X54qnJ1LS4AOviXPqc8aQ7oqQ0h2Dd+SAoseLYpLqg2GhLeIL2sLxXdiYmvu?=
 =?us-ascii?Q?23H/tuIHjN9FaXyuP9J3OC8U4TpIeXSZqQGqNBz7Yes9RgEtZUOfFSBHrDHr?=
 =?us-ascii?Q?8yR6xykhv+3dLmcSMErbtOYX3bt3pJWltPR+X6II5FQkRv/Z4FGyA23F5iBh?=
 =?us-ascii?Q?VBOFWps1WlePigIVG9d984fUxapY04mDI0WARjjO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?94KaN0u/KSm4kHhyDieowU31fkMWhm05l/aHMIb+eO1XtQejySRUiT68f0hu?=
 =?us-ascii?Q?QhJCUYBjO3oSFKeCgEEY+mQNqC2qHWC9Btletep5grYmpKo59H6sW7Dv2Kg2?=
 =?us-ascii?Q?BJZuXho1G9qkcs30j0613yaKKwH2IvzOprYLmaj2B6trYDoYcKd3A8PWfTre?=
 =?us-ascii?Q?mJtIjXx3fon2Pd4d2zJ0mDgqSe22YhnUwxs9vhpvkvOl4MUypt2Mlr/k6R9u?=
 =?us-ascii?Q?RnZISCqdt8WwUgLuC6tJ7Pk40DdhmV2PzhCzdPCGziVnujpHn0GfnOi6hF5i?=
 =?us-ascii?Q?dRVlPF3OsFh/Aej4xw9yjLZL7oVJGUgimUo9EgziG3CLICtQAEI+I8t2QUnK?=
 =?us-ascii?Q?SA9XTHPiyU4hNswXQA1JWVCb1GzQZVSezasQb9TOoYpgL/QvI7ieATsEjAac?=
 =?us-ascii?Q?kYrlCt5XFboT1A/IWZhBA2l0uwK0B6+VhTtHAbq/28M8z4nvvZ3h+ibd3Gqp?=
 =?us-ascii?Q?8j1DxFEIfKFj5Rpwz2Udmzdv1JyMNWrBlQGIXNCZRrKTZ3P0DAbOwK239/up?=
 =?us-ascii?Q?LdFBquqgtSOKD33uu0Ss1lQYFEneYpBcG8oO7k+m6gb0qs+BZRvyc+0/UjyW?=
 =?us-ascii?Q?sWs/jCR6Z9pdvdGwMYvltASib1PymlZjZyQkVGwmFnnC36e0O9TylmP9A+l7?=
 =?us-ascii?Q?N02np8WcpSSxhg1SkHWvDkO2RKUlqaUfUxsz4MYAxtXeKuMSGCoaCwoZyAf+?=
 =?us-ascii?Q?KFBE4zITQvTcqThKZ9gpVKZ+8zV9ET8GMEa19epdgL69R94mEjsSc365aRJr?=
 =?us-ascii?Q?0SV03gP3wHxmop4oQo59/DwDXrT/SsVCQkUOSaykdAqxTqPdciWQm8xDOVl2?=
 =?us-ascii?Q?QmyAbaZ900J1IXVrlPE9VYIjn4BfsXiCZ5m0fbnRvO9aCbHqn7Gkhdv52SwY?=
 =?us-ascii?Q?C9Urkp3b0SOZnNsvLJ0WVi2NjBhNbpmNfxNi7THi2pyOGGrmZcv16dqg4ZKJ?=
 =?us-ascii?Q?5HeLci8apZ1hvUOxaKv3uXA/0COmmmPrV1mdptrkjK/IasGn7k5Y/IZHWkor?=
 =?us-ascii?Q?IELMiV1DYz+G+0OdzSw2Svz/1FmDayLtRq0ARiKO8U7htIemZraGV+ai3NzB?=
 =?us-ascii?Q?XvqnulzYSV8b0scInX0QpRFanFZUsZsUJBJREl4LWCCXYtOcb+P5YKnTwhQV?=
 =?us-ascii?Q?kazxc3KGcKquMcKh5GOzLgORhyYMiB64e5WNMvqy2Dy76YmzrO1Ak8IPiT6s?=
 =?us-ascii?Q?vLYQARHD8WjJUKBSgz8AZUEWLsVHk32ocX3UZ3a5zW6W13bdFKnIijXJ8BRj?=
 =?us-ascii?Q?Ol7lnBYJrB87Cqe3irbBxrp/ZG4BoF7IH3lQ00PMchbWYx4D38kcba20+Fqr?=
 =?us-ascii?Q?NtNUApWxG3JqUFdxDBwRATgk4XdHgo3MW9wd4vcKYlKciGD7qG8bmq9Umpr8?=
 =?us-ascii?Q?rKBc/l0aRk2J7IIVHkp9cM+JeqPBZs1PtvZ2p4YDexquqoFc/1iI2yVfpgT1?=
 =?us-ascii?Q?Y4aoL1PGDvTKBDF8TzKCpe0TrPf59Hl5N0uXnrs17xgUBz20pMbL2qqkkQcQ?=
 =?us-ascii?Q?wEzHRFkLIJx67lZc16qJ5+w/ReiwkiEdvg/mlnqX0SjMwVdi5cAvYy1lh2qy?=
 =?us-ascii?Q?T6ZAnpzJ1KOaELL2eTNJ2SQBZsdjLNnlvlXEG+D2gIZSv4cJUK9J5rjHiJou?=
 =?us-ascii?Q?Rvz/UCNBOmIslwjuVaRQ3lafrxBIgSP6g6xK5FyaxFSs5d2PpesBYmx/pU9v?=
 =?us-ascii?Q?iV59/ry3Ix2S19968vJ4dl24h3kElxFCC6ccXaCAUs5a73rq57jOihF6/4vn?=
 =?us-ascii?Q?5f7TkIYStA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8KdlbQWfBdvgItuwQ3nurLHD/vfNr0hw316Vg9sK7ZoQKJYujtv4hzLMfZpSvxYteOJo/hiyeNSTzJEI+/vP36T3kIk16IBlN3a9HfkNA3QhGSJ96+J/wjuay0WDd20n1Y9bQYTH2XcSukOZh84Iy6vZi1dGgcOcNnvmjmZebJ+/4R5psuMYgGY0PoUWpZCMv+VGxuCthEyc7G3sBSAYV/w6hsyho+MKuUpw1dnm0LyIDr5z9mXgJV9bws037s/sugJ/RRHymdbBRrU1q2n5eEXEKI5N0o5QTfp0KgIJvJLRU7TYIM1nUEX+tEHJBvCNsfyocpvhRXbcTRHUP3LO49imMglDSTciZT3aDeNzpJtEf6WwxpRh9R0OmNOx82ARW9ZVWu01TpONBr1pYgpLV8MHSoiY2lMDQEQ5bXpTQTBQ8iQKNjsHaZnQGxh5gHT3+9HIymY5lxwr2byaSzOflPqC4Ift96VOzPc/J46ExE5liCOrtvAR8wvABvdZfZDK7HsQDyMbIqCLvdFwgLNfptESBpI8fcw9VH1PQwvhjg0KeHh+MlH2O0C+Q0jooLzkvJJC9hqQqGLUUC+4lRtObM8Vs4qPJrtxtWzb/AoCT2U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b9407d-03ed-4977-d29d-08de55443fa3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:14:34.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TldaNWyZPCnttugRwvxbLvGYfOrbeXvhAv0hxaJnZ4mlM+b2mnuVeAcHAx8tuH71Gfsuv4kyiWbG3G32rGYUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6722
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601160159
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE1OSBTYWx0ZWRfX0nHpO4S4ENWx
 /UQPRMrWINPVOA4OI4tu4T4tLsY/i1DGmSoE4ZcnFHLbTbSDPiGei32eFlVvX9/A0uUG7/GsCse
 fEbrdv9kw6PiNZHWhEA4tWToH8XkUiZySE3sukwEuHxRIvQYHoqhRgYMwQNleMoiPWsCZZwoLv1
 Ii/wmzCiN+Iio0TpWke4Sp77ZhdakNm9LcQBmOy1rTT2ReNnUWVq0B9B8tYEhelMXGFgvbI0dmQ
 sNo2AvDS/7Kgz+BV/yz/ZC43atDAJm+Pcj4iKm2gcLQhEV/YDaeOAFi2czYChdhcTSLphe0fn0p
 0M0ai5cpi+rchhH0QniVuDLG5RxUlBZJLwUVfDtTNuKLQvmLW2ZR1QY2sf4QyMLp+FlIwYJYjBo
 5S0VLtQcltEy3BrfnlifwW6MMLk6zjZksTrao4Vy0MG1GFIhFhsyBIsJNbRlm3z620LyH9uwgmu
 TBC2YyDZoXZSCf9FYyv7b2BER8vL5Ie/jDCx2hNM=
X-Authority-Analysis: v=2.4 cv=POoCOPqC c=1 sm=1 tr=0 ts=696aaa3f b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=wC7XzNwN3FyG2dIMaH8A:9 cc=ntf awl=host:12110
X-Proofpoint-ORIG-GUID: HbjhsHuLgOa53IrCYBBrqz3-fjbgHHL1
X-Proofpoint-GUID: HbjhsHuLgOa53IrCYBBrqz3-fjbgHHL1

From: Eugene Loh <eugene.loh@oracle.com>

Non-monetary grouping characters are used to separate groups of digits
in numbers that are not monetary values.  DTrace used to document
support for printf formatting, using a single quote, for such grouping.
Currently, support is largely implemented, but simply not working.

Add a setlocale() call to pick LC_NUMERIC up from environment variables.

Orabug: 30430270
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 cmd/dtrace.c                                  |  5 +++-
 test/unittest/printf/tst.grouping-LC_ALL.r    |  5 ++++
 test/unittest/printf/tst.grouping-LC_ALL.sh   | 29 +++++++++++++++++++
 test/unittest/printf/tst.grouping-LC_ALL.x    | 13 +++++++++
 .../unittest/printf/tst.grouping-LC_NUMERIC.r |  5 ++++
 .../printf/tst.grouping-LC_NUMERIC.sh         | 29 +++++++++++++++++++
 .../unittest/printf/tst.grouping-LC_NUMERIC.x | 13 +++++++++
 7 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/printf/tst.grouping-LC_ALL.r
 create mode 100755 test/unittest/printf/tst.grouping-LC_ALL.sh
 create mode 100755 test/unittest/printf/tst.grouping-LC_ALL.x
 create mode 100644 test/unittest/printf/tst.grouping-LC_NUMERIC.r
 create mode 100755 test/unittest/printf/tst.grouping-LC_NUMERIC.sh
 create mode 100755 test/unittest/printf/tst.grouping-LC_NUMERIC.x

diff --git a/cmd/dtrace.c b/cmd/dtrace.c
index baa73e9d7..6cd7aeadb 100644
--- a/cmd/dtrace.c
+++ b/cmd/dtrace.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -9,6 +9,7 @@
 #include <sys/stat.h>
 #include <sys/wait.h>
 #include <sys/compiler.h>
+#include <locale.h>
 
 #include <dtrace.h>
 #include <stdlib.h>
@@ -924,6 +925,8 @@ main(int argc, char *argv[])
 	pid_t pid;
 	struct dtrace_proc *proc;
 
+	setlocale(LC_NUMERIC, "");
+
 	g_ofp = stdout;
 
 	g_pname = basename(argv[0]);
diff --git a/test/unittest/printf/tst.grouping-LC_ALL.r b/test/unittest/printf/tst.grouping-LC_ALL.r
new file mode 100644
index 000000000..077a0b7f9
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_ALL.r
@@ -0,0 +1,5 @@
+123456789
+
+123,456,789
+
+success
diff --git a/test/unittest/printf/tst.grouping-LC_ALL.sh b/test/unittest/printf/tst.grouping-LC_ALL.sh
new file mode 100755
index 000000000..970dc3420
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_ALL.sh
@@ -0,0 +1,29 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+for mylocale in C en_US.utf8; do
+	export LC_ALL=$mylocale
+
+	$dtrace $dt_flags -qs /dev/stdin << EOF
+	BEGIN
+	{
+		printf("%'d\n", 123456789);
+		exit(0);
+	}
+EOF
+	if [ $? -ne 0 ]; then
+		echo ERROR: dtrace
+		locale
+		exit 1
+	fi
+done
+
+echo success
+exit 0
diff --git a/test/unittest/printf/tst.grouping-LC_ALL.x b/test/unittest/printf/tst.grouping-LC_ALL.x
new file mode 100755
index 000000000..c55a29a9a
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_ALL.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+if locale -a | grep -q en_US.utf8 ; then
+	exit 0
+fi
+
+echo the en_US.utf8 locale was not found
+exit 2
diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.r b/test/unittest/printf/tst.grouping-LC_NUMERIC.r
new file mode 100644
index 000000000..077a0b7f9
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.r
@@ -0,0 +1,5 @@
+123456789
+
+123,456,789
+
+success
diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.sh b/test/unittest/printf/tst.grouping-LC_NUMERIC.sh
new file mode 100755
index 000000000..1e95901fc
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.sh
@@ -0,0 +1,29 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+for mylocale in C en_US.utf8; do
+	export LC_NUMERIC=$mylocale
+
+	$dtrace $dt_flags -qs /dev/stdin << EOF
+	BEGIN
+	{
+		printf("%'d\n", 123456789);
+		exit(0);
+	}
+EOF
+	if [ $? -ne 0 ]; then
+		echo ERROR: dtrace
+		locale
+		exit 1
+	fi
+done
+
+echo success
+exit 0
diff --git a/test/unittest/printf/tst.grouping-LC_NUMERIC.x b/test/unittest/printf/tst.grouping-LC_NUMERIC.x
new file mode 100755
index 000000000..c55a29a9a
--- /dev/null
+++ b/test/unittest/printf/tst.grouping-LC_NUMERIC.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+if locale -a | grep -q en_US.utf8 ; then
+	exit 0
+fi
+
+echo the en_US.utf8 locale was not found
+exit 2
-- 
2.47.3

