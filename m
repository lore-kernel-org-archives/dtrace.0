Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61AE1DED76
	for <dtrace@lists.linux.dev>; Wed,  6 Nov 2024 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892609; cv=fail; b=tkOHEtS6TCz5zafVlfON/kzIYhwL6Rl3PXV1rPDhFgP4wgZAARG/Kz6uiBB700hDGurnWP2+CSmrPngBIbvB1Uqx9Kor6fKIBdQoueMxT2st6CppcvcqrdebsqNdTDd82/33UltQtHXufaXGpDyb7U6M8GYqUdG9M7KhSB+gy5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892609; c=relaxed/simple;
	bh=YRwflWgLY6joLTOZN1zQgftdApErnmUtXOx2hTkMt1M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L9abzA/YhVaPUa3/2zxqVV9boYqoN7vrig8D7/ABYZGwSUK6j+/+cR/Qf9cn3w9oO5I5UyQ4TDL0mQIGpu7bNkkYSBToFbGhy4UYbH0VQLWU8py7YfjhqorfFrRaqDT+hpBBJ/J/ykYwYtH2QwlEAleBkTEMcKaBQfXqx34lMHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mqa+Akxr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U9RBr03w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mqa+Akxr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U9RBr03w"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69BduI003934
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=2TqmjQ8BwwCDXG5/C0926zic+Hj5nZ5He9TmywMP/Fw=; b=
	mqa+AkxrdZFDJCpyMFbhYImn0KiwP3jrnVCSF2hKI/9mxKaMgpCLbC3uoFmkdhN/
	bkqJoHGmqYrcPJVJ/tU13M3qykt1FCw03x/5qyhQyU/tq5yTJAKTeciJOFiJxB9+
	rem81g7kLkWr5rWkZecZZPfIitMmKUt6qwQRojreBgYs0/9PTwqzLn5Nid0c/HXY
	5V5y9X/NEsUPz38+iQXd3CygLtj29fIcoqkjR105nW6d2al6AtH+6tltYEkr7Jql
	gfB8dY4Aw6KLmi+GL7eDId3i8rrp4pMcEd2kiBADfz263efU6Gcx+WuOQ1YW1qbd
	br+8P4c3Ubw8W5D6JIw4Zw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nav27n7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6BHqOE008594
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah8dt4f-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFzzk87HQy0X3Tx2kfhdfmlBA0Q7v44AP9DZrg5D9vKAOhgzsckdwo8B6yNZKDZDUxXUkhW+YrNfaFkrAZO/tYMqNBAuXltJJmI6PHogHlsY6q6JqloV0nJX1k/3oYghYyXgp8IM3lZmZDjxfM2s0ooV5wFomGj+u3g23Aj4iTo7e769N8Q5RuuZloSvKq+Sqk5/SCrGV2z1uBDcgAUE1tmMp/ydIlcL1PGtKgfNjgy5Sm2KCSKR/62N6rPB6Qz3BhWbvVft9vycctX1JkHz3v0dQrDUd8KmJwi7tSIyt/5TqLuW5uwo8g88b1twxIhoFHyFfwMTRAptcsizIul29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TqmjQ8BwwCDXG5/C0926zic+Hj5nZ5He9TmywMP/Fw=;
 b=Ty5duM6jzmWzBGpxNNyn5SCR40ckE4KdISjYFGDQJtM4chkpsaNTNc0Ak1btzd/dVd3iKp2Txe83Nc5o6h5zGNDZloVSaEdwFDTD6T+c3lulrDESnANL1yjY9UQOou5kCKvvAEg6V38Bi03KL7Yo/O+61m9TV/wKa4y7Es7SGaoygMgNHrNGRiBG6daIxTaIPlh0TWCk7j+xfRR3PXjJlCjcG8TB9hxvgQeNAZ2dmquWaiCUKi9/PO1U0L1+OmGO5GI6PBHmxgT4qfv8Ym6c540sWLynxbKONOQY3CN0uCDeF5N2j5JIM/6FfmOzIqvQPYvS1jP53lU/IeApEoclsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TqmjQ8BwwCDXG5/C0926zic+Hj5nZ5He9TmywMP/Fw=;
 b=U9RBr03wTs/2Dm+Ag8qw5Ux/9DmF+iyia6bjfF5Kr1sFaFYAp8XCTbSmcD+c3O1gUdrEBzt1O/duSeI8zvmWlqVtCsdSpavyycgNXq18J7MSFVdWrVoqEsV5VqBTzCeEuin1qocdgOWajejuCZ4rf6ueWtpBxLLYKeCslvaBdHk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5837.namprd10.prod.outlook.com (2603:10b6:303:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 11:30:00 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Wed, 6 Nov 2024
 11:30:00 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v7 1/6] usdt: get arg types and xlations into DTrace from the DOF
Date: Wed,  6 Nov 2024 11:29:37 +0000
Message-ID: <20241106112942.264351-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241106112942.264351-1-nick.alcock@oracle.com>
References: <20241106112942.264351-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0250.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::22) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aea14d8-3fdd-423d-81ee-08dcfe5659b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?exvmDfs1H0AcmVV0pZDEldO/P1bP3r2nQIMG4nS+PPXF9Zd0x2EDNxcmeLS5?=
 =?us-ascii?Q?eOtmtQDjfdIzeBBwfPrgizrBb7efZpOnVYTRA12eHIhIjkoCZSyB6SSsnO3L?=
 =?us-ascii?Q?AGZE140xYb23vKfCuQ9D/1MRBO77cGq0gWpVbF72goPGTkRJvhXFS98jgCm3?=
 =?us-ascii?Q?iQ7gGyDj7KfLctxtoH19eYrICbZuagBDSGdfpUXj4YG6dKKKk4u/ez0GxJZ1?=
 =?us-ascii?Q?80VRDQtdRi0HjMmxm+C8PzRA40DjxblVnN2T8x5INIApNbf/NhaXR/gzpC7I?=
 =?us-ascii?Q?q0eHOsWrE5WZTuBiTNZ9ZQadHsfTglwTc6s7ncDULayq20/eOBJWBJC31KV4?=
 =?us-ascii?Q?Qk0ZX5mcIIhRHJPK9zOwV1sgVqJIQ15eSLOz3Pa2l/AO6uRjJgWqflpTQHaR?=
 =?us-ascii?Q?iuKm8nrkcK48UYSSkO5qxZ9GVvn0ZqwROsVXyo7afvgpPYn53sL+GQsnCDhT?=
 =?us-ascii?Q?lnfjVJJeD18XB7E/u7Jyc+8B3xijML3Q1IK2x2qP3KPlUmi6E2r03lnAyt12?=
 =?us-ascii?Q?65yXtlCyAox/bp7iurgHht/keiMGSA5UFldCSxHLAwdsx/navlyVv0h7tXcm?=
 =?us-ascii?Q?8OZOLkOM40mFrvpKXccuWnINFcDYMy2KzNArCafcg6rx1Y1VgbhBU0I7oR1V?=
 =?us-ascii?Q?bxa0REH2Fl+kYK+UwPXgIBE91yE8yK9+HDSZqah3D1MlqTqNUXtzn3qDulDn?=
 =?us-ascii?Q?ZMWScVtkbpFDCZ8XWI5vMi8u/O6T7wCEu5sU2JKorTyt3KHoyv9/mKkuW1tI?=
 =?us-ascii?Q?in24g1BrALhWM0sc/EvrIxQcJtgVBuYboEmLwiKf8FhQ2qH7nEcLyvx4EZAo?=
 =?us-ascii?Q?6wLwj89ZOYW9pMtkAne1x9y9/wgLQkmgo0nLc4b9En/MPOMuggxRdJXCCOs3?=
 =?us-ascii?Q?IF/aMdkNMHZV8jfyq8Odlb4YGnutyuj8wl0OKB01DgObdVogJcLgH2sZVyXA?=
 =?us-ascii?Q?l3giZVVV5UlAw7+jYQuPeQbVy9D6EY76m+i32dD1hAOp/Z2K4uF9xSRkT64a?=
 =?us-ascii?Q?LlEGbhoWwdrqbFqmf3h6M40Gab8LFE9WBZ4yfFlh8RH6tmfucLKlTOnzcMvB?=
 =?us-ascii?Q?/IKqEoQ14jJFo2Md+L0HTL/m2ksr9KaxKU3O4xkr53aKZgM5utBb15+I6z0G?=
 =?us-ascii?Q?3l16Wzx0yOYk141HRMPxqSTy0omyfu1/mMZWMzn2CUIcKirYe0lin0BoIPA0?=
 =?us-ascii?Q?TKsM+r+uyEOV/TmIl8r2H979I6GNfsyVSOlUfIABUGS/xXPnW/ivobtdsJtK?=
 =?us-ascii?Q?hsxk0CUmad6m4g/wkar7l3SGR7GRqmrZwvIDFUkHMY+CQKUxp7IPVe/t4Yq1?=
 =?us-ascii?Q?8F30pM9LlXsvH7TIy3LcQhJx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AXYK7L4cuCjMHmnrp+GrZwxsR1QNy3fG2VJL+Stb+f966rjKInnaI4qJEpqn?=
 =?us-ascii?Q?dN12hzUInzLOl+mstHgXEZNkIMVghm5Gnr1wjD2pyv8PkFjP9p9bCUnWm49W?=
 =?us-ascii?Q?0PV5+zkjf5zCqiRcGrxNMSYqfgshfuzh9Hi5scFjm3+q11CLdo6muBUgmSic?=
 =?us-ascii?Q?EkaEKtjYN4zGRzsDDrrBsYywVu/aCNJZdk+2Ex4L6+RfX8XgseIsBxUAFmK5?=
 =?us-ascii?Q?TZ6FoQBuJqXY1npRdXCPD7wAsu+YInE/mLfX7+c3JI5TKGFNoP2zfzYzQLwf?=
 =?us-ascii?Q?MKNVX6xMgQSJNPVvOw5HIKjPpZv5eqDbS47sXgpBWXE6ZvlKfHDj0voVJK7D?=
 =?us-ascii?Q?sYWXlYTc6xH9tIr7mWU+Q1LH1UBydq9qPTmoTFo6MskU2BIwckmKFZIaKZuz?=
 =?us-ascii?Q?nqwsoQJHDOjHeB3tpAtX2EsyQLCkz6PRg1AEdsRqgR4Jbw2Slwv+mhVFh8e1?=
 =?us-ascii?Q?HBIcFFTPxjydgitIQibhByWELaQgcfRJoVwPbRdrUMpxK5w0EBOkY8tgCAfq?=
 =?us-ascii?Q?tnSzQVi+oJqms7bPL0EBwqpYo49fjKH/2LXPoUw0J3SyENHt+gWyj+zkIigG?=
 =?us-ascii?Q?JUyvU9CHQiwDQwVt1en9t2gYC0Zvu6yuAO5vAgrtO8i4qqWho+yT4iVnVI+x?=
 =?us-ascii?Q?Xe42ejnqRCRtaRvwj7jrTa12POFBxjgCRKtxuhfttlwmatlLb6utJ9Gfbmoe?=
 =?us-ascii?Q?JAmdwNA6dFgA2VlIZGDMz/zCAjLFaJ6iMqE//zzl0RPeyrO4xhZdxgCt5Wd7?=
 =?us-ascii?Q?G6yhHy3aROs6fJVtVThmyb7Z3TLvVxyj2j3hHGQjvKx613ioGyBAxAswazQd?=
 =?us-ascii?Q?zKfKe/dubKj3hh0BI/r2tcL4Ltu+TaImytHvaf6eVwGUeppmicIM+ftXajWW?=
 =?us-ascii?Q?fofYCy3vAzaV7GVWej4fYf9O5FmB/PaNRsDCUxUV1pvdLLbSpCyd4oO3rEtK?=
 =?us-ascii?Q?T83F5ct4aMsQpyLJKxrE0nbMOCMAeI6517O7EefCZTYHiUsMXFkl/xzzE0I8?=
 =?us-ascii?Q?1otdBO0IDaeWPgzdc3T3mGb4pleiTxPvoemxJsXU8/N3qpKhDEyzlv/n3v7e?=
 =?us-ascii?Q?BCAJ+EoBsVceu2VJbFSiH2Tiz3g3ezjr3p+liJ6C1Ovp9q3L2kP8K5yb6hRh?=
 =?us-ascii?Q?hAGvbB+h/UpI1fGTODFW0r5H8mixxjvXFvJMXYuXVcV//fP1aSzTWJ3I6GNn?=
 =?us-ascii?Q?dUXFRfwWo4FsY6YP2m2Z+2lreq3ZhFtihCxv1gx/VS02uXbFd2aL/fHH3Riu?=
 =?us-ascii?Q?EgCy2M4+A2mZnnNmkzMh97LenkSPEmAx3MurFKIFqLqQBVD5gtTur4MaMXjK?=
 =?us-ascii?Q?ZvJSzEuNf547SzDcR7UOITGJbIBmZQirNjM8lTz0d8g4V5naeIdAN7DblMTo?=
 =?us-ascii?Q?2WZeXgciAIAGXKz8zhXPRsZbOwDN6cE32pcx0xoRBKLQu4mlaI8t7GuHydYq?=
 =?us-ascii?Q?SOemAU2zGANs6N5/z7UsisLEgYaE5vCaKQOEySZD4rC02cmhxGIy5IB13w5p?=
 =?us-ascii?Q?VdMkmiGBzjQ+pLMr4DAkSSKtAGpkRT2QepukXQRPVgNR8ZozHswlq8vSStTa?=
 =?us-ascii?Q?SlrnnokJes+o4DNcris3rmu6QygZ6pFdB5L9+KuUQITlB4+1XLQFTUUyG4tF?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nb5C3WIODedSd/aofn/HOoemQAdxre5wmSEehGZaF0wBEZBz7rsUw3HYFPAx7aY7sI03H218KF872g7b0LR/8BIJPF68w8f/HsPekgvNnt0C1MAznST9YVNz5yr7b8PnJCaNqHfzizLngGmgMnyd5b7DK0BPfmIwN9pS1EnQHgikzImpR/50rsRFZV1rpHBxEELpRiRtOsLJUH7rgO+K9npdpahpr6mkyt5S/AcWAZqAwXMw+DZNVlFUhW+5P2XhWSWHqCvNDcZ0Z2ViJTPCU53KlkIbUCDbNbE7aMcpZEMNvDRJaBQDH+61ZmXW7jMwx2+1QzIvEA3Ilgu1dLV9oOUYOqhPcBWW1I0Ses57yLYJ533R9iP6MhnxuCrebbkzDiFbfyixH4rq4RzS+URs/Dw+dd1yTq8RDkTr3WI8kmPysIRU8HkXog5mJgQDNKaqVv5xZR4+NsbqCdwk1cYxvBRlv76xnv0wKrvdaXCw6prrV0qtIlzT3+geGo48UiECEwMvwCz/DdJlnB3/UiI4XNtuHM7UQGXeCYkzzz6deoBpr+qBMeR/FY1+kgaw18jjkj2P4Nal8inqeA80xBiufQxdgPrKGvU8RFa7LMN5a+I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aea14d8-3fdd-423d-81ee-08dcfe5659b7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:30:00.7374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /t2vbiiCpVY4hf8Jsoq2he04pQX21Ds7ew/TQaRxIggkVkzvL/YLg/oUN1BomjYTM3ls2ObHZWGwT3/zPtYnTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5837
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411060094
X-Proofpoint-GUID: 0sr7SbLgJyuFjIbcTdFFmyFRLnjgJ_7E
X-Proofpoint-ORIG-GUID: 0sr7SbLgJyuFjIbcTdFFmyFRLnjgJ_7E

This change propagates native and xlated arg types and mapping info all
the way from the DOF, through the parser and dtprobed and the DOF stash,
into DTrace, where they end up in the pid_probespec_t for USDT probes.
We don't do anything with them once they get there in this commit: no
user-visible impacts expected.

We bump the DOF_PARSED_VERSION since we add three new types of record to the
dof_parser_t, all optional, covering native and xlated args and arg mapping
tables; to make life easier for consumers we emit them in a defined order
(documented in dof_parser.h), and add arg counts to the DIT_PROBE record
that precedes them indicating which will be present and how many args are in
them.  This means we retain the property that you can always tell which
records within a provider are coming next purely from records you already
have: there's no need to make decisions once the records turn up.  The DOF
stash hardly changes: all that happens is that the parsed data written to
each per-probe file gains some extra types of record (it can have
DIT_ARGS_NATIVE, DIT_ARGS_XLAT and DIT_ARGS_MAP entries following the
DIT_PROBE record now).

As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
refuse to read probes added by dtprobeds that are on the other side of it.
(Restarting dtprobed will reparse all the probes in the stash to match the
new layout, and newly-started DTraces will pick that up -- so this only
affects running DTraces picking up new probes, which DTrace cannot do yet:
so no visible effects are expected.)

The code is a bit repetitive, with nargs, xargs and arg mapping all handled
separately even though the code is very similar.  In future maybe we could
unify them (but my attempts led to code that was much harder to read than
the original).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dof_stash.c   |  15 +++--
 dtprobed/dtprobed.c    |  10 ++-
 include/dtrace/pid.h   |   7 ++
 libcommon/dof_parser.c | 150 +++++++++++++++++++++++++++++++----------
 libcommon/dof_parser.h |  64 ++++++++++++++++--
 libdtrace/dt_pid.c     |  60 +++++++++++++++++
 6 files changed, 257 insertions(+), 49 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 0e639076f655..8bf465678217 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -59,8 +59,10 @@
  *    startup if the dof_parsed_t structure changed.  The file consists of a
  *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
  *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
- *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
- *    the DIT_PROBE record specifies.
+ *    DIT_PROBE, then optionally some DIT_*ARGS records (if the count of native
+ *    args in the probe is >0, you get a DIT_NATIVE_ARGS: if the count of xlated
+ *    args is >0, you get DIT_XLAT_ARGS and DIT_MAP_ARGS), then as many struct
+ *    dof_parsed_t's of type DIT_TRACEPOINT as the DIT_PROBE record specifies.
  *
  * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
  *
@@ -640,9 +642,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			break;
 		}
 
-		/* Tracepoint: add to already-open file.  */
+		/* Args info or tracepoint: add to already-open file.  */
+		case DIT_ARGS_NATIVE:
+		case DIT_ARGS_XLAT:
+		case DIT_ARGS_MAP:
 		case DIT_TRACEPOINT:
-			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
+			assert(state == DIT_PROBE || state == DIT_ARGS_NATIVE ||
+			       state == DIT_ARGS_XLAT || state == DIT_ARGS_MAP ||
+			       state == DIT_TRACEPOINT);
 			state = accump->parsed->type;
 
 			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index f4c6be1e045d..2ca39b26f88a 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -791,16 +791,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		if (dof_stash_push_parsed(&accum, probe) < 0)
 			goto oom;
 
-		for (j = 0; j < probe->probe.ntp; j++) {
+		j = 0;
+		do {
 			dof_parsed_t *tp = dof_read(pid, in);
 
 			errmsg = "no tracepoints in a probe, or parse state corrupt";
-			if (!tp || tp->type != DIT_TRACEPOINT)
+			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
 				goto err;
 
 			if (dof_stash_push_parsed(&accum, tp) < 0)
 				goto oom;
-		}
+
+			if (tp->type == DIT_TRACEPOINT)
+				j++;
+		} while (j < probe->probe.ntp);
 	}
 
 	if (!reparsing)
diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 0129674adf0c..25bfacfdbfe2 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -35,6 +35,13 @@ typedef struct pid_probespec {
 	ino_t pps_inum;				/* object inode */
 	char *pps_fn;				/* object full filename */
 	uint64_t pps_off;			/* probe offset (in object) */
+	int pps_nargc;				/* number of native args */
+	int pps_xargc;				/* number of xlated and mapped args */
+	char *pps_nargv;			/* array of native args */
+	size_t pps_nargvlen;			/* (high estimate of) length of array */
+	char *pps_xargv;			/* array of xlated args */
+	size_t pps_xargvlen;			/* (high estimate of) length of array */
+	int8_t *pps_argmap;			/* mapped arg indexes */
 
 	/*
 	 * Fields below this point do not apply to underlying probes.
diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index d6631a1afdcb..1792a8bfcc84 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -807,10 +807,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		}
 
 		dt_dbg_dof("      Probe %d %s:%s:%s:%s with %d offsets, "
-			   "%d is-enabled offsets\n", j,
+			   "%d is-enabled offsets, %i args, %i nargs, argidx %i\n", j,
 			   strtab + prov->dofpv_name, "",
 			   strtab + prb->dofpr_func, strtab + prb->dofpr_name,
-			   prb->dofpr_noffs, prb->dofpr_nenoffs);
+			   prb->dofpr_noffs, prb->dofpr_nenoffs,
+			   prb->dofpr_xargc, prb->dofpr_nargc, prb->dofpr_argidx);
 	}
 
 	return 0;
@@ -879,12 +880,26 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	return 0;
 }
 
+static size_t
+strings_len(const char *strtab, size_t count)
+{
+	size_t len = 0;
+
+	for (; count > 0; count--) {
+		size_t this_len = strlen(strtab) + 1;
+
+		len += this_len;
+		strtab += this_len;
+	}
+	return len;
+}
+
 static void
 emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 {
 	int		i;
-	dof_parsed_t	*probe_msg;
-	size_t		probe_msg_size;
+	dof_parsed_t	*msg;
+	size_t		msg_size;
 	char		*ptr;
 
 	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
@@ -893,35 +908,106 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	if (validate_probe(out, dhpb) != 0)
 		return;
 
-	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
-	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
-	    strlen(dhpb->dthpb_name) + 1;
+	/*
+	 * Compute the size of all the optional elements first, to fill out the
+	 * flags.
+	 */
 
-	probe_msg = malloc(probe_msg_size);
-	if (!probe_msg) {
-		dof_error(out, ENOMEM, "Out of memory allocating probe");
-		return;
-	}
+	msg_size = offsetof(dof_parsed_t, probe.name) +
+		   strlen(dhpb->dthpb_mod) + 1 +
+		   strlen(dhpb->dthpb_func) + 1 +
+		   strlen(dhpb->dthpb_name) + 1;
 
-	memset(probe_msg, 0, probe_msg_size);
+	msg = malloc(msg_size);
+	if (!msg)
+		goto oom;
 
-	probe_msg->size = probe_msg_size;
-	probe_msg->type = DIT_PROBE;
-	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
-	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
+	memset(msg, 0, msg_size);
+
+	msg->size = msg_size;
+	msg->type = DIT_PROBE;
+	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
+	msg->probe.nargc = dhpb->dthpb_nargc;
+	msg->probe.xargc = dhpb->dthpb_xargc;
+
+	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
 	ptr++;
 	ptr = stpcpy(ptr, dhpb->dthpb_func);
 	ptr++;
 	strcpy(ptr, dhpb->dthpb_name);
-	dof_parser_write_one(out, probe_msg, probe_msg_size);
+	dof_parser_write_one(out, msg, msg_size);
 
-	free(probe_msg);
+	free(msg);
 
-	/* XXX TODO translated args
-	   pp->ftp_nargs = dhpb->dthpb_xargc;
-	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
-	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
-	*/
+	/*
+	 * Emit info on all native and translated args in turn.
+	 *
+	 * FIXME: this code is a bit repetitious.
+	 *
+	 * First native args (if any).
+	 */
+
+	if (dhpb->dthpb_nargc > 0) {
+		size_t	nargs_size;
+
+		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
+		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
+
+		msg = malloc(msg_size);
+		if (!msg)
+			goto oom;
+
+		memset(msg, 0, msg_size);
+
+		msg->size = msg_size;
+		msg->type = DIT_ARGS_NATIVE;
+		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
+		dof_parser_write_one(out, msg, msg_size);
+
+		free(msg);
+
+		/* Then translated args. */
+
+		if (dhpb->dthpb_xargc > 0) {
+			size_t	xargs_size, map_size;
+
+			xargs_size = strings_len(dhpb->dthpb_xtypes,
+						 dhpb->dthpb_xargc);
+			msg_size = offsetof(dof_parsed_t, xargs.args) +
+				   xargs_size;
+
+			msg = malloc(msg_size);
+			if (!msg)
+				goto oom;
+
+			memset(msg, 0, msg_size);
+
+			msg->size = msg_size;
+			msg->type = DIT_ARGS_XLAT;
+			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
+			dof_parser_write_one(out, msg, msg_size);
+
+			free(msg);
+
+			/* Then the mapping table. */
+
+			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
+			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
+				   map_size;
+
+			msg = malloc(msg_size);
+			if (!msg)
+				goto oom;
+
+			memset(msg, 0, msg_size);
+
+			msg->size = msg_size;
+			msg->type = DIT_ARGS_MAP;
+			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);
+			dof_parser_write_one(out, msg, msg_size);
+			free(msg);
+		}
+	}
 
 	/*
 	 * Emit info on each tracepoint in turn.
@@ -938,18 +1024,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
 		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
 
-	/*
-	 * XXX later:
-	 * If the arguments are shuffled around we set the argument remapping
-	 * table. Later, when the probe fires, we only remap the arguments
-	 * if the table is non-NULL.
-	 *
-	for (i = 0; i < dhpb->dthpb_xargc; i++) {
-		if (dhpb->dthpb_args[i] != i) {
-			pp->ftp_argmap = dhpb->dthpb_args;
-			break;
-		}
-	} */
+	return;
+ oom:
+	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
+		  msg_size);
 }
 
 static void
diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
index d3a6836f15fd..8f42d00551e3 100644
--- a/libcommon/dof_parser.h
+++ b/libcommon/dof_parser.h
@@ -15,10 +15,19 @@
 #include <dtrace/helpers.h>
 
 /*
- * Result of DOF probe parsing.  We receive a provider info structure, followed
- * by N probe info structures each of which is followed by possibly many
- * tracepoint info structures, all tagged.  Things not yet used for probe
- * creation (like args, translated types, etc) are not returned.
+ * Result of DOF probe parsing.  The order of elements in the parsed stream
+ * is:
+ *
+ * DIT_PROVIDER (at least 1, which contains...)
+ *   DIT_PROBE (at least 1, each of which has...)
+ *     DIT_ARGS_NATIVE (1, optional)
+ *     DIT_ARGS_XLAT (1, optional)
+ *     DIT_ARGS_MAP (1, optional)
+ *     DIT_TRACEPOINT (any number >= 1)
+ *
+ * The dof_parsed.provider.flags word indicates the presence of the
+ * various optional args records in the following stream (you can rely on
+ * them if it simplifies things, but you don't have to).
  *
  * On error, a DIT_ERR structure is returned with an error message.
  */
@@ -27,7 +36,10 @@ typedef enum dof_parsed_info {
 	DIT_PROVIDER = 0,
 	DIT_PROBE = 1,
 	DIT_TRACEPOINT = 2,
-	DIT_ERR = 3
+	DIT_ERR = 3,
+	DIT_ARGS_NATIVE = 4,
+	DIT_ARGS_XLAT = 5,
+	DIT_ARGS_MAP = 6,
 } dof_parsed_info_t;
 
 /*
@@ -37,7 +49,7 @@ typedef enum dof_parsed_info {
  * start which is the version of the dof_parseds within it.  The data flowing
  * over the stream from the seccomped parser has no such prefix.
  */
-#define DOF_PARSED_VERSION 1
+#define DOF_PARSED_VERSION 2
 
 typedef struct dof_parsed {
 	/*
@@ -59,18 +71,58 @@ typedef struct dof_parsed {
 			 */
 			char name[1];
 		} provider;
+
 		struct dpi_probe_info {
 			/*
 			 * Number of tracepoints that follow.
 			 */
 			size_t ntp;
 
+			/*
+			 * Number of native arguments that follow (if > 0, a
+			 * DIT_ARGS_NATIVE will be received).
+			 */
+			size_t nargc;
+
+			/*
+			 * Number of xlated arguments that follow (if > 0, a
+			 * DIT_ARGS_XLAT and DIT_ARGS_MAP will be received).
+			 */
+			size_t xargc;
+
 			/*
 			 * Probe module, function, and name (\0-separated).
 			 */
 			char name[1];
 		} probe;
 
+		/* V2+ only.  */
+		struct dpi_probe_args_native_info {
+			/*
+			 * Array of native args.  nargc in length.
+			 */
+			char args[1];
+		} nargs;
+
+		/* V2+ only.  */
+		struct dpi_probe_args_xlat_info {
+			/*
+			 * Array of translated args.  xargc in length.
+			 */
+			char args[1];
+		} xargs;
+
+		/*
+		 * V2+ only.
+		 */
+		struct dpi_probe_args_map_info {
+			/*
+			 * Mapping from native arg index to xlated arg index.
+			 * xargc in length.
+			 */
+			int8_t argmap[1];
+		} argmap;
+
 		struct dpi_tracepoint_info {
 			/*
 			 * Offset of this tracepoint.
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 41a87955ec1b..189b15f61a89 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -866,6 +866,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		uint64_t *dof_version;
 		char *prv, *mod, *fun, *prb;
 		dof_parsed_t *provider, *probe;
+		ssize_t nargvlen = 0, xargvlen = 0;
+		char *nargv = NULL, *xargv = NULL;
+		int8_t *argmap = NULL;
 
 		/*
 		 * Regular files only: in particular, skip . and ..,
@@ -917,6 +920,48 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		p += probe->size;
 		seen_size += probe->size;
 
+		/*
+		 * Assume the order given in dof_parser.h, for simplicity.
+		 */
+		if (probe->probe.nargc > 0) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			nargv = args->nargs.args;
+			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
+			assert(nargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+		}
+		if (probe->probe.xargc > 0) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			xargv = args->xargs.args;
+			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
+			assert(xargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+			args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			argmap = args->argmap.argmap;
+
+			p += args->size;
+			seen_size += args->size;
+		}
+
 		/*
 		 * Now the parsed DOF for this probe's tracepoints.
 		 */
@@ -967,6 +1012,21 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
 			psp.pps_nameoff = 0;
 
+			if (nargv) {
+				psp.pps_nargc = probe->probe.nargc;
+				psp.pps_nargvlen = nargvlen;
+				psp.pps_nargv = nargv;
+			}
+
+			if (xargv) {
+				psp.pps_xargc = probe->probe.xargc;
+				psp.pps_xargvlen = xargvlen;
+				psp.pps_xargv = xargv;
+			}
+
+			if (argmap)
+				psp.pps_argmap = argmap;
+
 			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
 				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
 			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
-- 
2.46.0.278.g36e3a12567

