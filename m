Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5779E1B4123
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 23:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733440856; cv=fail; b=GYyCeRsNTYAe0zjpn0T8oETbq0UpVhBf2hFPs0qJDzSgNFJuBcNHWc54f8NWEPJQ/gn9gsSIod/ftWsbDy4Da+WjGoYnUQe07ssO2LCxp+lGJ9p4+WzgBZQBuSV8QCR4n3ZCq2ZFRKQ7MKSvgV+0TM8vS5NzjHY0QZvQMIZqlHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733440856; c=relaxed/simple;
	bh=cGYa+XU8rUwYpz3gnHssRpAZHmD6rL8kQfFkavCwSqs=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=DlIbYq/r4KA/zb4/MPgtUWKpnL5wqEeLoNwP/GTyrojwnhsMMUMmBbWDtmSaP2KqPi9YRgsUvWVjMNXk8ygQtKyen3/BCpCEu+LsWVCe/sXZjDDNIaLokQT7kwP/YSGMxAVAV/ugjgzODAo/v7vu7rtWz3GtFAIleo2NgOO54VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JdoOjq1N; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vzuBRh4q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JdoOjq1N";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vzuBRh4q"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5LNX28017845
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 23:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=8ylJqHtdoVcxGmHjrLfPf25XPxXL0wjlrhivv0CVKWI=; b=
	JdoOjq1NfV4CiHfciiHFI45tRO4+SkYueWLHfp1m3bKDmYtr5CZDmhZJrde1R7TO
	4mJF5CLEffFtKPUpDjPZur41Dj50F8yu/LMXiaxtFwL4nk3sic63j6TK2u/U/1FK
	pS/HrqM1UkOkrT56LeGcKQkXd7diCGjCjWQtAgNWPW0hfPIxPrPyECmy9SPHFnLI
	VrP54OLupVdEKtnNKsZ50Ff0+XAOJKJOr5ROPFIm/zdiD8rBZuas6CT2I0IqSUl2
	OCncZ7s/iYJZTbqDWMgWVXwYgXzC/i+ZhsX2DVRlr+4pEBjB9uIcn7AyyHTj5UPY
	iT7Gxtb4NzfcPsSIUOd9tw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sa04faf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 23:20:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5LVnLb011691
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 23:20:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437s5bjv5q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 23:20:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivqDQDv9bwZ/0Iu2WqeYQtMbOvV8xE2YBvCyaUVKJszDPpF5Zd7HNrnC7HrIq0uO/N8e8oBFbEjeK0J6lQBUMVdobG4Zmi5lYV9IoO4EluMfI5ALW8VDdOklQkDU+4NfZlx0er5eYjLuzQiL/rxGkA7rdmq8IfueqVnFzsdcAoeO92bKBdCC+9TrlQVa0+c6ppIchI39594lcOApv5qpYpXmiiMDf3V1E9eq8BcdbDM+h3FfnYuuA9EwSN7XSJ47jBvj2Tn4oGP18fzoTgwJF06YvOkrr8ufVGvzsr8WeOr1BKfD5XEy9SrJXmUktdY7jhwSGNdij4wW8Y2ZWR/RRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ylJqHtdoVcxGmHjrLfPf25XPxXL0wjlrhivv0CVKWI=;
 b=D733ornzwAiDVL7CCJe7VAS8kM7668ptzdWUioFRprpU4uMpxqCElr4OkYrxF3DrCUKKHyKJNEIuTcvLt5b9ZJhSzYtY7VF5Aswt8sjUei5TQpupP8ebyG9oS+NZ90yEB9HludI83su5vGc+6V8Zti6wo1Pnt9fAo3AKcLOBjTeyfWNdXl6vjMXkxo1o/n991UjOPFE+JUqbEoyBtlHinG5wBuY+ss7TwuglmGo1mzWrJxhwqb5pFfuSFCuO5YyVRBSn/Dm43zlPGSjpH2QMyPr3UQOMCl44FPFaFeGPD8oF1W9FLT2vVcKUgdzMEfFcXekue42hJsawJ7KTh6a9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ylJqHtdoVcxGmHjrLfPf25XPxXL0wjlrhivv0CVKWI=;
 b=vzuBRh4qZe0lk6COUI1uRpc0neFkB3qAlbdKQ3KNvHTj9GhVVHTl1kjkOLolxY+rxcJv1feiWE/w1Y/F43vnWWiJfnCUIAphJJ6RcA1GLt4MIGPgKoI1EnUhiiAaW2dq/svZmKjFS+MZ7Es7KxbkF9z/QXyn1BstRLrNGK/5EC0=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by MN2PR10MB4350.namprd10.prod.outlook.com (2603:10b6:208:1da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.22; Thu, 5 Dec
 2024 23:20:49 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 23:20:49 +0000
Date: Thu, 05 Dec 2024 18:20:47 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/4] fbt: clean up fprobe/kprobe support
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0444.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::29) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Message-ID:
 <SJ0PR10MB635036FA69C3F542A5518385C2302@SJ0PR10MB6350.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|MN2PR10MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b82adb-e363-4aa2-a3d5-08dd15837483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xyGSWfpWin9JnbGJbiP3NH0yMLO2L5QwKlQNvuHA6k+HD8M3g4S5QBXq6CBV?=
 =?us-ascii?Q?1GTdBoUxChtomhqj+axYvaPD9gVk1eg6vV+yZ9Ou3yViesjGMCY+7t4zYEaL?=
 =?us-ascii?Q?D8G3alX8XAv12Ncx1veTPVlUzWa168ckGYaERcQtpdPcX0ZgGnfESuB5pX8j?=
 =?us-ascii?Q?+pNtZZTUYgRQOshcDlcFMBM5ZhnM7ZaVyNZ38YkjbmE5hfhfbutnFAwWjxwU?=
 =?us-ascii?Q?+3AiTo20TP9ZAF/M8+jYhGa9psDX5lbepAC76wZMPtrhIWvsQ0Rva+F0BLpT?=
 =?us-ascii?Q?6PDwk6NludahCt9j6z7U8k6UaOYnCW8uttgOo1NLvHQjCGt4DKKfTYuD7zC4?=
 =?us-ascii?Q?rwL8drs+ni6UztDUJpG5cayOVTQS7K2n3PjxvckpQ5WmkuhYrapP7Ny8y+y9?=
 =?us-ascii?Q?ZtZKS0IJUWMG1C6SjnMpzVQ+eLjwvZudHOTyC/WXcogasG2PmkK34mPHaR9j?=
 =?us-ascii?Q?jBnwJYDhGJ2gZ6HnszUSpjsOUKRUloF0Yt0vEevpros2T6/q4y4yOBy353F1?=
 =?us-ascii?Q?M2IZ9zKTzgE2+OBeadh4KTXl6i8qSdhouOTq2hXngADdMK9zM1mxmlHmjhp1?=
 =?us-ascii?Q?DJCo59lJmC9ye9w4SNxrNIZ9ZMXcqxQIfI5EO/NMqqxRkm8Hqik4fXq5P7sT?=
 =?us-ascii?Q?Sm0AX7Gk8nNJJwhRWlcIobG9yxqzl22oZ4wBsAAQVY5ElKdtub/uSLDPetT2?=
 =?us-ascii?Q?tS/ijQ7ddQn54x9EvjMffg59tH18hM15iMtUPkuK4yFHMP9aznlhCes73Ao6?=
 =?us-ascii?Q?bTBxXXeYHNwkG2P701LsEPCokQaKIDSvSiisUsnzZUyadvpOTUz2sob3iRLS?=
 =?us-ascii?Q?pkXYAJ3nBT8nczQljXOex+8HtMWtIuWlC/ouIJmkpW8cnyFMrdfPogo3Pc/3?=
 =?us-ascii?Q?/gBs+F0vT2U7Xg3Y0W8ojDodwNLvrCSTCBSWsET4Ebcz+VyHYz5qIQ5jmm1g?=
 =?us-ascii?Q?/y/uyhv8DxbJ1q8pDgsv1t0+RlX4moofquyrlIYv1MKbNhdqm3oW5L6Ixqxl?=
 =?us-ascii?Q?ZDVB1HNuCDKPcAqBIcvhCZlAwvgu9QYgztSauW6OpjeQKwQzKSoH/+VhANs/?=
 =?us-ascii?Q?oqCBl7MGpTPCDxpiQxvR+tPHkBHXv58nn3meimInVhaECNCh+OXZ4uKEeWUT?=
 =?us-ascii?Q?/OFodHTJ+ENMGLbiUqeTNSKHV2oK9DNrJNkoJhcEP1Pd5mKm2+4Yg0GBxwUv?=
 =?us-ascii?Q?NxRsvewcjJRhc7P/WQQvn4hwK5LOl8uBTH7XcvYBSyXG8XYtHTN0C9qJ9ycG?=
 =?us-ascii?Q?jDTSO6Pu115YnzzENceE5RzVzioBVg5LpdwOjtHjhV6AaKc3Rn3yxCQWnuJ7?=
 =?us-ascii?Q?jG2yQKHf9xiGWPQfaDqSCsXP3ru72BDlEAk9L3AgQUhWbA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IR2l0FunApOGRHzbBCw3v/R84du0A16iAs+qQuKEzX5eHrwaDE1A6sTQW0Le?=
 =?us-ascii?Q?GfQP5Lhc2eomTPEsVnchq90R+B+BCCb804zThUQ272/mQB2DfRz/EvfVqKUM?=
 =?us-ascii?Q?Xy9DlWs4aqPXmYgZDuRv1U/NOwXoxU2DM85ad6mV94MkERCcP3WQMdUVHk6K?=
 =?us-ascii?Q?tyJ/YTxXglVNluejOb8hMAcEs5ivpAlVaFKRV1GiITtAu1qDoVqe28ytTzIw?=
 =?us-ascii?Q?bJLgaUIqH/psJ4f3HrurDRMkv8C7ecI8R9L3Cxs6Zea048zGmwoBJTuvhTul?=
 =?us-ascii?Q?RlLN+rqeMX2YzKTc9pg0/P2Y1uuczJiBW+NaNTvalm2JbUajMpxJcEgRiRRw?=
 =?us-ascii?Q?1VgexA6RVXVtJXEy3GU05l0707G/dQv3vtb/mFAChhEyUzhFv4J8sIJ7QzYG?=
 =?us-ascii?Q?Li11Uq/MdfRViFL+VCBG9s0NQAxqBpwQRjTu0WzAQAXdKw0G66dGzlB1Sm+i?=
 =?us-ascii?Q?VJUpFJHJlfH9oiUix7VYL2/3xNSMzmjseK9DUkZjGEYpmSjNA22EeoqQfaOI?=
 =?us-ascii?Q?n5pA8KgZjXHu8BKgNwheJ9ojczPeHfNB/Mc5rhjuefqJsKOgqxdDMCHCx49T?=
 =?us-ascii?Q?3wHVNAKMTyAH4LXy8JehXXCnlS44B/4nXUQ6Mo6cMgmVAqxZ40grVsvWg+L2?=
 =?us-ascii?Q?t+J488GBxm3basrd3w6rS2OLTV7qmUP1l5dvBAJMbKuiy4RIIG8MwDXXg/dT?=
 =?us-ascii?Q?JecwveAyf94GcCahoNk8teZMAog0bRyoyO3ehofc4DUzdc2CXcHqA5xW32cV?=
 =?us-ascii?Q?zq8Ku+ECPiMdFHrMbml0RLOVtDAEAk5/P9DEaH0q9wRIYa511UZhW9+ZFw15?=
 =?us-ascii?Q?uTvrd7HzKIPUbbnL3OQmV+WI4LAQLkhXwCb9nwBLDN1pyI0zfpoa2S/1ogDI?=
 =?us-ascii?Q?OacehVf83B0wNNp9HF+088Bx+3kVQiuBJRfp3Z4zVmzYWsh+S6cIxy8Qv/Fz?=
 =?us-ascii?Q?6BArxbfpj7vUID5e6OxIE9wFE+2uYsOxmkq+QceeDToTRIB1boiwLVtlneed?=
 =?us-ascii?Q?QjOlK+kq4SmLv9t/cSkjaOfsih5ZCPAA1WRgJiJ3oYsdtKqV9b6upYtQBgg8?=
 =?us-ascii?Q?xxlsJMVG6cf3EYbKyNLpfnxmmpz2VFOx3K/ljQu5A/52lbJi37295rAmpOmo?=
 =?us-ascii?Q?n/iTQrmC2lr9zJ66F/dx42h3fmqsmuGrTFGG+j4kD2Zm6yKsgtgS0as0ZMFn?=
 =?us-ascii?Q?FX5RWSMMb2etZIha+kqHFl1zYLu3vB9BgtGC8kfP3j2NWJBjaLTjXRzV48oN?=
 =?us-ascii?Q?J0kilhguA1ndOxH/DJzQw0HzpgSOfKoOE6278LTDYqCkbmBjY33ytfnWql0Y?=
 =?us-ascii?Q?K5808jq5ICtR7iRrFWjNiRzrN0Lc+XqV6ytP/IcOwCZW8jS4upHJvifFt9kI?=
 =?us-ascii?Q?LNV/f+4IerBxSFBp0Q056CYFUsgVeaOiOBIgR/NlkAxoLxHbC0QASvZC2erO?=
 =?us-ascii?Q?Mko3/1A507mEvmR21YWlXMSos+3M2bKOXrFShp3iABBzKFesc9ftZFVNCIdR?=
 =?us-ascii?Q?vk8TG5IWYmAAiR3MriEgGYXmUGsUQ1OST7EpuZlufGzJiJxhCiIbQ0XXCXzI?=
 =?us-ascii?Q?V0HFu9/b1xQHaqRJGwDe7R7l3+uvGhkSQ26MQDK/J+cmGuJxE+hqkOyqbJlx?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fnC5tONBUtbaWNLlL/alL1Gj1X/jNGjBHpwCkAWav1YbjJtOfR+Fy91iZhxdRREieNTenvcQVuggVDiHAWY/rh01CTi3hWoetUfwFlSMHrE5bHjXXLphlsSRNwFYjTp/2dbhslFAL+cmW+8NRc3s5VnlE+GEsqtcRvyYv82CGLF1yNUs5mCi+vl0DMK2tWwGXBTyqGm8RwdlvJ4cm30QNPHJY4wqwn9vEBDmVIqno3NDpDexWAvhVL8mg6iUoXRLltSlDwwdCtEfVYIZdCyH43WBLTCJv/whQ1h4kRJcfzSaNNUPt0hN8L9Opxb93EgvNzNRiS6obJIdFZvPSYEFtxNX63aOHKb8TaZuZ41YRmbDUufh7qisVT6sMO/gTTikJwtFYdUxQpLfxyMUyNH5JMk4ceZVrkOXgiuE+1b4QljamXQj/Z19pnGX75XF3MN1fAZe2vFxPisaKtiYEcAk0EJKDk9kieB7PnjGNvy4DffEc1B+HoSuh6NTqk53pqWg5YWwXJI4gm8EZ6kK1berduV782Jb6aGUaqaRDCcfIdYGr43ThZpY0ur6dMFjmfk8hDIF9GLY0gsjI0JWVSd1up40GmEiHeSnBKv97HgNFJ4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b82adb-e363-4aa2-a3d5-08dd15837483
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 23:20:49.7953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqjuoCFXg+Yc+oGJVvgKLJFxMsouwIYTIVNQGnoB+SUCFfz5koBCPeFU6AH4+DuA63KcB1mgPIgDGp4IJtAKRWB3oq0hH7lzOou3JCfIqPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4350
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_16,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050174
X-Proofpoint-GUID: 5bI0RYxiQfUp7kZV_w6YucVWKhwtOcYH
X-Proofpoint-ORIG-GUID: 5bI0RYxiQfUp7kZV_w6YucVWKhwtOcYH

Instead of leaking dt_fbt_fprobe outside of the FBT provider so that
there is *something* to represent the FBT provider, use a minimal
dt_fbt that does the job of providing a hook to the populate function,
which then will update dt_fbt from dt_fbt_fprobe o dt_fbt_kprobe
depending on what implementation is available (fprobe is preferred).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 13 ++++++++++---
 libdtrace/dt_provider.c |  2 +-
 libdtrace/dt_provider.h |  3 +--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index da288401..8d8545c4 100644
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
@@ -73,9 +75,9 @@ static int populate(dtrace_hdl_t *dtp)
 	dtrace_syminfo_t	sip;
 	dtrace_probedesc_t	pd;
 
-	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
+	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_kprobe : dt_fbt_kprobe;
 
-	prv = dt_provider_create(dtp, prvname, impl, &pattr, NULL);
+	prv = dt_provider_create(dtp, prvname, &dt_fbt, &pattr, NULL);
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
@@ -463,3 +465,8 @@ dt_provimpl_t	dt_fbt_kprobe = {
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

