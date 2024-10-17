Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF591D5AC6
	for <dtrace@lists.linux.dev>; Thu, 17 Oct 2024 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729206018; cv=fail; b=LWwjPt8XEuBWZJAqfN/bYNTDPitwqBj9aDswQV4T3kYlIZ+lsZv3fy6C//WK3kBrE+Ryfu5VgD+YIqpjAMiCNGEWJNAvXgJn+VgZcIZDwZLOKqYBW3nPQxVsBqPIAhPYlnt+KTGaczgE7zxFCzRMCfecmGRhTkiYTt1w5+MfaZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729206018; c=relaxed/simple;
	bh=EKA1t/NUSqphzMjFPCKxbubanZTsPv+8fkxOldaUvlI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jYddAxV6v/8UFJprpy31jdSF6qFljrivsCy3rZzURUeA1RQ6bvXXC4INBOqDyw/V0UxJDxk6yNEexYsJvmqPFvNjQ0u3CEXVfMUAAExzbpwqlw7AwENdiVzOVeHuVIH082x9k4XXRpcoNcZZIJQs0zni4jkCWqnU61A+FU6hqfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T3KF91cp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jnlCy89X; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T3KF91cp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jnlCy89X"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HKtkZR010309
	for <dtrace@lists.linux.dev>; Thu, 17 Oct 2024 23:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=i904G/syP0XwwjGuCg1Qs4kDx1TN69H0bngUrebw71g=; b=
	T3KF91cpHLZWBQosIQizybuNvHY2wdXkRthha6CWRVdQgTmIKnIoNnl36I4E0DWW
	A1pQei1aJ8P3lKt6Oo6K5auuZsx3cfgMWfvZeHUYfLrnLwvL8Cey+Y7rbUD+b3v6
	TTsrUPOjF1LaGlZ46+LNYxmL62HRhjnBQLWy8Yi6NBJoZt3asztDdJ8lPGzY7f0j
	K+37oVRfKsevxL4ylmSpHDYKlwUJFjzI+ncdnzUcPEOjMdBL0dhno872735dUNoC
	m+RogjEFAB2yHAD567D/EdllOjI5uXfC95Bq7+xiJC9jOjtllXm6vEnpiYft6K2w
	7ZmYccfQj5k09pfrFg1oBw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h09q07n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Oct 2024 23:00:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49HKnYmC019936
	for <dtrace@lists.linux.dev>; Thu, 17 Oct 2024 23:00:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 427fjaw4yd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Oct 2024 23:00:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvecUDctktLw53fGZb6qbB8G5jVRFW/rgwqzWNykl/+A8QY4zbxStME4Q+Bc5oM3wRPIizC0OpGc+zuwtNQFLmpJ+ohC8JAhQpIhaNkaMjrixrHYfLnqlJEEf84ZW6xrd0Z7taPBI6JIfEIRYmenWpWQjvd2BW1raIk5vM0dVjjc7zaQM3mNxb4T2WuxzZzGYuRhOMxHPYAsV+wavcUuUsRmCLFlDL1M0IaQdiYEaxcrrTtK2jyb1/NvcnHn16P6Uam6j1fFeW2z6KmK3HGa1b+9UWwEoxx7FKyGq9qFvd21s/W1kOZJDwMMH5HwT7r6OxCo6uSZgonTcsFAyGAJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i904G/syP0XwwjGuCg1Qs4kDx1TN69H0bngUrebw71g=;
 b=mKgpqDm216IMC3e+mUTx+ikFh3AbFeW311qRN4JrdnTr54fho3PiCksyOx+kaR5cp18ffsZgJkKbKD95O6qBR4clKLhNyYjiA/EFPUqdCLVrNQl9iMSJeYCue0aesJp1uLHqQLyLFSkPGipGeW75XgUlyvmyDS8vgRMDOEQ8a+PRxEtiRIN9iK42gQGWmRmlqGHP3QBCo5ZDtduVVPmgbgzVd2onOSmE4+tuz09K/1ENHQ8wtIF7jX4JzLqzE5hhRXCkFfRYhN81PTnTT7XXcdjG48fOItLiz4KQYWy0LRvGJwFmbV7KVjE0N5lmC6mWj89z5QzMBthvT8RfvPIqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i904G/syP0XwwjGuCg1Qs4kDx1TN69H0bngUrebw71g=;
 b=jnlCy89XHNlp3ShnUsLXQMKU2hYzNukm6orVG+EY071TT0bVB3MRY2i/ycB0c9U/OY+tDuKWX8Onp9AEyxAIczSRKL7i7Qqi3Ili4RZEVpEwcf2Y7rTvJM7W4Izs0Rk4QQET6tp+8+m4qoPzV9dhQnNrZ+AmyRjfRQgM0j3XKaM=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by DS0PR10MB6870.namprd10.prod.outlook.com (2603:10b6:8:135::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Thu, 17 Oct
 2024 23:00:09 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 23:00:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 19/22] test: Fix tst.probestar.d trigger
Date: Thu, 17 Oct 2024 19:00:05 -0400
Message-Id: <20241017230005.12504-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN8PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:408:ac::37) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|DS0PR10MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: b45db3eb-4ccf-43dc-6b33-08dceeff72d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iSXO3JHfIbTwxdNrQ4yKKMJV0/Tr/f17IchG+Zukjj/4VgllfOFh+oSbtutO?=
 =?us-ascii?Q?6/qHqnmzwTDWCG2I8Yk95Gy4TT72rwdI1ujH3PXlP0yzoIqYiarlY5IGjNhQ?=
 =?us-ascii?Q?YdKrsrzZXJWy3SCmUbmAHhQvzK/RvnjMFIPvRUZUwjF0oERwl0VMOcUpvy/k?=
 =?us-ascii?Q?id0V2cBntk5decN5fCwTpz8fUq9wZUIId8Yr/pS+7fOBx+FVd+1Jlc+Bu/Ul?=
 =?us-ascii?Q?gnDKHT5XT9axsnwXJT3eSM6x7J5/5uZvpTDtc+0T/xrTw11+IuypHY2juf9y?=
 =?us-ascii?Q?mZFJbNN1HrlHo23BG4W9rdtDmNHICPQ5Vr338bJ0MfdGgbJs49i/wj2QBBDh?=
 =?us-ascii?Q?LhuIvgbTnT69fxZLWZFq4+DeNw5NjDSmcWZbLrba+b4qj0oaBEosMRsMkKxF?=
 =?us-ascii?Q?QRWbmUTj1nS8S5ogo0/JlFGHw7sAUBjM5dee0G9jb1eoW3o8qdaf+4T4e/t1?=
 =?us-ascii?Q?OkUQCLWZ56JtwZh/r/52kYVLCVfKHczYEMr9KocX3jvXGvxqWAr6KppJLRlC?=
 =?us-ascii?Q?tMyhhX++8joraxT0jpORTtGs2V0T/WZazPr+gFx7eLa2+Gq1DiJmJoSSo4nV?=
 =?us-ascii?Q?EMax6duEx5R3VsukZ9Z6lZfGMf9YWkGzOL+gWiOvJqMbwh72QbYt24w71EXE?=
 =?us-ascii?Q?egP9fqWa2yuJThIjIxK5UgROp8PDzMCZxIrMMqzWw6hAcN6LD2CgtCL4iyTR?=
 =?us-ascii?Q?ltF4ie5iUylKuftlWLkrJ/22lPLzvOnphxZ7NaU0+onZzBXhUCiGNH2GCygv?=
 =?us-ascii?Q?vVDQx6/7MeKqQuwVQENM7D2q6Ejbfy1beF3JVhtJpLLbLgKy7P/JZ7fp/AZN?=
 =?us-ascii?Q?5SFxm5pc1gJDTuVOu2TL2dQLjdNQWEWJ+YByV0US/Mp+vIhleSoYjXKwlhLN?=
 =?us-ascii?Q?V1mLzGNRuIjbDsPv5H556XCaUIjL+fU3Su3EfY2r1TTWKYuuSa3Hpt/OCsQN?=
 =?us-ascii?Q?LFdVD4DACn7FkO8S6b/mzMocUVQksfvQedlWSNDDH5EzbNK7BVSydZQUlXnc?=
 =?us-ascii?Q?PLK51ylrA4B+G9M7SWNNjXUq+vlpAte8LATCMZT1P7W039DTt7iQiEI2UuVq?=
 =?us-ascii?Q?2sCf4s8iXYF5JmvHVlauYq+pw9+IK/DXLZJC6O9svG85yB+wC00jkgXOecYS?=
 =?us-ascii?Q?DzH302uqVuhUIpifK34JY2bB1XiB/RqR1GuxbrzvLKlJYlfcsCxy6xg/DHvm?=
 =?us-ascii?Q?x0SdixuJ7PjZRq66ugTent44lpbd4tGeSsNV9iXvmDkZxs8NJUWhVIJU3Vh2?=
 =?us-ascii?Q?4mS+M7kck1uIBnNDzQZKqatyGeQMr7mwq7aIf3TOdOEX0FG0uLoX/k1Far4N?=
 =?us-ascii?Q?pCchFrkCb3DdcbiRLUNyiNtE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dgOftivVLMNjZcvcMBcKlJg4YVHVMb9N1w8p8HlUVFDL6nO1WL1Up3ia0wLf?=
 =?us-ascii?Q?AiDFTjkcdaEOzJx+b2y51ZrSJioWRA2tWAO2UTtz3+6L03N2vdxWwT0SU1kF?=
 =?us-ascii?Q?+gpvNpFPqyi4Hq9OkFIPAjQCJNVMtBzJhN7gN3U1gKU9149q7PSm2eUg6NrP?=
 =?us-ascii?Q?I+xFHESB3BUBsPZyL8lnxNw/JX4AmS3BOkfkwFaozlrvOM38oes68LW2HPJw?=
 =?us-ascii?Q?8y867A5nzL9aZCtcYv2EhWVkkuRQuS9cKtP2e754ymsoAzcy8ywrxwMNNGUy?=
 =?us-ascii?Q?FR8UrmKjD4yZvlGRGWgGJykDWFklZKF3ClXorCADUVAx6zaDk/EXH0maXha8?=
 =?us-ascii?Q?MR9IEuVIXxMj28S4wExLO2nOi28LWwKFWmJ03hegD7oTC24HbyTv0+QAbZgR?=
 =?us-ascii?Q?KOd05aKFXE/lnCjMd86KiUFzBPFjOhuuCmTn3/1EM7DeHxJkP9FmOGXD+jxq?=
 =?us-ascii?Q?KN8crK87rtBmzx4E+s4JVNu9JyC5ksW+nvx1U3+/3TtVhLw2G0nCj6/BwqLj?=
 =?us-ascii?Q?LAUgXdUc1yn4dIG+XZVreYsWBj82ySSlQBFESw56eaD5wfCMsH2yl75xuH6S?=
 =?us-ascii?Q?pkoYXz/9Vmrkdphh0oLGSWNwMdBxCcbMS4oCbjjbF0KWXDKTDQ8SyWCIRE9P?=
 =?us-ascii?Q?3LSb/RRrJOZLHD7lH9oluqDr0c5HF4n44XjBJZuy3mslslTwwwzhUhv+o+dq?=
 =?us-ascii?Q?v8KokYrb90/aGBDCFMKpedfYEwP8ClIAQn9BIPoePz+39Wnzw3VK3Ht/YGH4?=
 =?us-ascii?Q?9xEgJb24v+ZC3Y+kyQbpKiIx/JefqOlGA7S7/JnnAAPBAuIp8ucbYdn/KycR?=
 =?us-ascii?Q?gHXncB3yUrG6VMDlkoKkN9SYoehJAn3kfRasANFS02vV9ipnuUrPY/KCFkP9?=
 =?us-ascii?Q?RH8c6l4ECWO+oSCh4ngRVa0zF4pOcgmXz/qI9NTEzmJ+R5uQK0DCerVhZntr?=
 =?us-ascii?Q?KInuxKDjO4ZTfg/7GiKaWF2ipFZA2HU14UEMrl25GRH/OL7Wxe0eCzqvWWCg?=
 =?us-ascii?Q?4oQTLxAkPQYt3HKl0fy030LdPTdTHa3cngnwzUZOYO5H5gK7K6PTiSqrdILz?=
 =?us-ascii?Q?oZKbPsUiKdBXWawdZyCfC9GckuKSQw//EAp1OsdnIKjP5mxZKNRASJpVCVgn?=
 =?us-ascii?Q?x4ZAo2IzElyMZiB10fzDPBlUf2KUspMxzMK5tEEVC96cn9fx+iSA0nt/5Cif?=
 =?us-ascii?Q?cViifjpsdOOYHFFgP3uR7rBJ2eQdx9UmsnnwDbu1ZvMvU2rmrUlevd/2feIb?=
 =?us-ascii?Q?+pzZXjAw73XIHqrmMsUwe8UrQo8jrLHsXsZZsBVW9Y8cfj7Zz+yi8Rhv0U4Z?=
 =?us-ascii?Q?qMBk9m+LddNM7sHYwWSNbuMlzaAkhsHZZ2Pbtx13ss/yMxUYGUAJRORnEWTh?=
 =?us-ascii?Q?SRYqkXbk96IRg8cVreE1gw83bNfAIB7A7en8FVXmUjY06gsdH1Aob8sOYstz?=
 =?us-ascii?Q?yNA80MpT/WOATHjtMg57wwxsFVxC9HzJsQx4dImitAhL2aM2yXsDuQeluSWN?=
 =?us-ascii?Q?CCKkxHc6NA4NJB3Hm25MMUlKL+17yio1yJn1J59YLfgJNGMwtbG0yvmW/AIZ?=
 =?us-ascii?Q?TSQla0Ia2Z4j4NMnBv0fAujweSD7eu2OrrLGvCZT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Jl7sCshHfX+tM2988hACp/HV5ZNjssoWChD1GhTJEYLmEIRXlci3byLG4ArJuyWM94kIfMJIvmq+BXnJgeSlXSfJoxgzaAI2hPVlLf3PJFRHtyglB1KOENwTLjVHFecHxOEGD6qReb5TzkkWS0BmPXnqUA6FYslzWylikjikahNu+D88xX62as2C8mG5IPm7XUkaeD5Fayah+yifjCDm0KiWT/7YduCbcEIZwyzQrIk9pFYhgzjv9F8xOEiusQ4wr+mhaZACDws0Kd8UakxhDlwoNQfUWa7KWgk82+etzhXDlt7ynpWs3R/Y3c9pCfeLB++40YStf9yrI52PrnobRYvrU2pBlP2Htr/g25DJf3FiGRbdzD1awdaS2apOW+rxJzuYToC5BDE+rLPXoSRd41vAaIeHO8nyxQR+baJ3ORUsDBMrvpe/uXLW6YhOd7e9zWdKPg0eoLqVzBAtnrsruQVR5s5DmC4M0MSPMmefwN3xG+wMYZfsCSTwS6EgQFUFBqU1UrifU7tT36ODrVikKqgJ62meb4SyvO1P4zYwMhZbC+29YBETqJyGypfJwzmjNOSCUNpEN+SLT2xEfJKMj8Ja7Fkmq9T6VOx91Ifha34=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45db3eb-4ccf-43dc-6b33-08dceeff72d4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 23:00:09.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zm/sltt8BcFqyLxt++Hn8vQl1w9zlHrmZ2RNY1ROs7scbSP9eqPJGKZnh3T3b6oB/19f8a3hdn0L9sWsyU/+Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6870
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-17_25,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 phishscore=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410170155
X-Proofpoint-GUID: -pXiiS4tj9U9-v34AxkkeRi00t_lgMTu
X-Proofpoint-ORIG-GUID: -pXiiS4tj9U9-v34AxkkeRi00t_lgMTu

From: Eugene Loh <eugene.loh@oracle.com>

This test was relying on a trigger that uses the obsolete
dt_test, even though dt_test is irrelevant to the test.

Use a different trigger.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/probes/tst.probestar.d | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/test/unittest/probes/tst.probestar.d b/test/unittest/probes/tst.probestar.d
index dad7741e4..1f433d900 100644
--- a/test/unittest/probes/tst.probestar.d
+++ b/test/unittest/probes/tst.probestar.d
@@ -1,11 +1,10 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2011, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
-/* @@trigger: testprobe */
+/* @@trigger: readwholedir */
 
 /*
  * ASSERTION:
@@ -13,10 +12,8 @@
  * Call matching probe clauses with given name using "*"
  *
  * SECTION: Program Structure/Probe Clauses and Declarations
- *
  */
 
-
 #pragma D option quiet
 
 int i;
-- 
2.43.5

