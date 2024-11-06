Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661831D14EF
	for <dtrace@lists.linux.dev>; Wed,  6 Nov 2024 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892615; cv=fail; b=amomRc/XdIWjcdvk9pG/vuEl8NuHhFbVNF/5yYu0VMUHyiv/caRcwD3kPW/qWMl8wrl+Sh7U0T37uUB/nNIoSiZHNRB7FsvMiZcYSYYQD0yQlwEHFQMweP7hz5RoUc8G4e0Ea8Uhh8L8m7uXZwoBoN9rREZa7IWZu7OPCdp41R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892615; c=relaxed/simple;
	bh=BL3hjR8digg3yYCSj0d95kb6BOPsZhvEEnEleRN0ZWE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T/1vk2GRPXGs1MCpRwDRYisWcMdiyauktdwrIm+igisE3Qj17Qzg9RouRKa/ENLWKCzYjAxfEOyttriSc9iRrQ9NhmnBesP4SoJoYxKuUl6TLdl8rcJwOLRWWyafB9EvurRRnLO8XEJ4tpNkuva7PMbTtM3WjVGrb6XLABQYHGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vx9gxcf2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tyMD9HEw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vx9gxcf2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tyMD9HEw"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69BZdK017313
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=OZbiaIxA/wAmH3UQp++t6mEx2Bwl5JCqJTUdHBygTok=; b=
	Vx9gxcf2Xl1dEIB+W6BYjfoK4/sa+taN+5mEaSbhC6jNAbzmNli39N1ithITeBAc
	1tSFSOveFCM+6zFktt/56T1rGUZSaVzj+bZqEnpxb3Xtdjmhcqjxsa6/dtDXOUda
	4TJQc0bNXv50zI9r3YjId0aIGL2bLIwNvt6KQ3wMLR1Y78wmLFrmCl7N/L50bLvx
	knVWLqQLEf19Dz/nd9TQ8HcyKbkSLV0rbt7smIj2PZwev9aDMaVVaEg4tOd94O9/
	UyXPxqa5z8kPbArgPukcfRVyvGI3M9rRtVVUAMJPQy2Jb808PduNNaI3YnOVhgyf
	eIGRmsDMPPvREmvNHNwQ2g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nc4byn8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6Au3Bq008396
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah8dteq-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u92w48wCvt9mRmCmDdn3lsr/lHGItV/xblnL1YUoQYzt60/oEk1UczOvRDsiaBp3btoD93PwttdREcCSkWTVZB6wYcF7I5vke/XW1NKWZ5j37Qy1QMRQvdlW9rkGEyk1+QrqDwOD4x3iApVebGokEptbPb8hNAmhXrnCu39OrnTAoFlq8Pq4Gvn4NdmH3Z+ymeYxn5LJjQbV3sk/rXL93pXGea4X8ESraWjKRIwSytCtUvxAxsWsD7Zy09F2GfpX5AGLIM8T3/welA1sbIX+XhsGkUbc6JA1m1ppxqRIClk9nNW1HF+o813U59RJOKR5loVqAKZcXMQeJcOLIvBRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZbiaIxA/wAmH3UQp++t6mEx2Bwl5JCqJTUdHBygTok=;
 b=hJ0Q3WCcWx/PALs8+QqjuEmkFHimskSiSrAis2hVhkRXAnLr596n5NHMOrUPRTZ5p0LJhs3sIOMNfnasJiwmlKx1Hj1/Z93Q66m/VApRjXL9zGq9T303byhPCVoBBd//g4gxQWoi6RKnufo3LuW5TGy5QnB4BhQJT+eFF8BiNBsndqEVxC07zdopJZvu6jdyU4H9cfyxitPJXEaSrzaZ+Opm8sh8rs0M6NBuCNY0DYlMUC9sRs4MUm0qcHw7nMZlEJikQionJf1hHaOwR3MULlj9l4wD2tTJT5OugUb6nbwSMD3duBT5uCAN0Y+1k02+Zv5tyzcsyaLRtpIgyRWZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZbiaIxA/wAmH3UQp++t6mEx2Bwl5JCqJTUdHBygTok=;
 b=tyMD9HEwCU+47O8EQyg6r3Pwjx8P3Y8ant7hFy8GEAHynS6MUMBi6j/0VZUnxVrD916CIl/V8aragkqYyLjixv3xiDrVF5yewc4BxUghBAf9E+Pfq3Uhge94GfTcWD0JvdFn27LC7T/NZHGgDrA8ho5LSlzOjsMMdQAto8t8lpc=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5837.namprd10.prod.outlook.com (2603:10b6:303:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 11:30:08 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Wed, 6 Nov 2024
 11:30:08 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v7 5/6] usdt: new tests for USDT arg sanity with overlapping pid probes
Date: Wed,  6 Nov 2024 11:29:41 +0000
Message-ID: <20241106112942.264351-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241106112942.264351-1-nick.alcock@oracle.com>
References: <20241106112942.264351-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0183.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::8) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7a9f5e-74b4-4910-5b05-08dcfe565e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/1qyi9UI9Vc6hD+rTkYx7Kbyy2tz+C2apIjWIqIVV3tHZTl3x+31lmDQ+EjX?=
 =?us-ascii?Q?/L04ekQ5sbC0fst+279P1vLHrtAXeYrrHxAfugpAP5/LSTZxLwc/e6Owr6hX?=
 =?us-ascii?Q?tzxP2hRXDXy2Spoa6RE85fp9gWprK/WVHaKSgbJHYKXw3wz1bQbExguyTffs?=
 =?us-ascii?Q?s7w+h9YVC9jX/5Yi4f6jNJYeHdF3TxGsBmVIfMlpNkYGi9FVcS5bsLi8Hrs3?=
 =?us-ascii?Q?yT0YLM4MrG3Z4ZR+T1VT10u5jb3aN2qhCJlwtRxm+7uyt8T7qlzW7yn1sCB3?=
 =?us-ascii?Q?Jhl+xpGZ5chrz1sqkALx/110L3fDGL9dKDfg3fsoyxBp3UNyphrIZW+gVO1q?=
 =?us-ascii?Q?VVYw2DQSoR8Cp+F1BCwn8RGsn749rqGE1CylPsWfh3QM5Ekpf+KaLgNcxojx?=
 =?us-ascii?Q?yUgCeR7ib8CLAl9hVnt5RIXNNhwyMTCtWRN4/2Cs7/CWir4J3cHw1u0iNDt2?=
 =?us-ascii?Q?BLCO/7Itqc/4YfMo41LMW64kgqyCVKzQKoZ2zimOzvwz8kcgJ6bao6YC+5vm?=
 =?us-ascii?Q?2veEyHK3g6dzSxsQPKLZTxMXGTKIkMk0AeVRweut/JLrH4nXZYNp3NUcDIX5?=
 =?us-ascii?Q?9flHwgdWRu9Iiw+cKq/TjiBEx6ZJe6jScSIx5YcuaJZw5tZHvXb5u+SCHOsv?=
 =?us-ascii?Q?e14gElPkC9IuWTx1izYaww+cAJbFULQCpHQrztNAjjNPrK7wnIoDOr3Bm3e6?=
 =?us-ascii?Q?tHmJ/mM4LxBVOzvh+HCkFwxYe57Q3jx4B+tE6wzGZFOyKVaHc00ELSKa0BfF?=
 =?us-ascii?Q?x5QrWdmywyZcMcYy2jWjT8EPb+PcM6J6MAb7dn05UXFDbnXpO3R/4yJw+OX/?=
 =?us-ascii?Q?cdin/Kggo2DoSGXJQAfxZUYNBiBaMmgvBqz2Pxng4aLZwh9RCb17Z0fPBch8?=
 =?us-ascii?Q?Vq+icSWnFV+8t1vTtgZ44n7/OyfEdmrAYKVLDcadCvylsBR6XQHZGAZadUYS?=
 =?us-ascii?Q?huWI/ijXpD+Pj6GB95Cu6UlxZ8UTyJW2CjyRFYoMCRJgX+Z0u8UoNqNvM5wJ?=
 =?us-ascii?Q?/AEM3ArELqGxpZY4CyL4mTOMvzI2E48C8r0NWqz1KTybiwn3l2PeelFjrCy0?=
 =?us-ascii?Q?Qo+S2kztbrWBem89/P/qe6pSeLKzJTG/lo807JQOcxSwCrvxJaxLFI2jiGte?=
 =?us-ascii?Q?A3KLeRO/6tHPpCtBGOqx/huXTCZQo3VyYkbmEf0OfPZ5q1fLDMrykQyKzGDI?=
 =?us-ascii?Q?zj/FIc4lhKIreSUHsu4qeFgY81iuznrkpRoPov/jj3eSvFTKie8YL4M6ZFqb?=
 =?us-ascii?Q?yTRF6USJjjUxy7CshBSha96A/iRuLAmVx0VnIepJw/8wiqCkxgWsBFNRIP2c?=
 =?us-ascii?Q?mLYXXJgHHPUzidSGVMcAXahp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xYpFw+mqcGS63NYwBgKvjcyb+mtHHBphqDJMlncid8xIJeS30oGph4c7lJMh?=
 =?us-ascii?Q?21RbmupLzX+1KZq7ExyJGW2cfs90J4Nk7lhEui6iryJjKqLTcyI1wlKJKGP8?=
 =?us-ascii?Q?cL8kLgMy1gq2X9yUTDS4IvUqES5wcic4KknIzfnFoUcQ3bmKG89Y9xEgmTBp?=
 =?us-ascii?Q?VWG+CtGOwciqM7RCkFGCy1Tdzxi2nQW5ixstSDsalH4edimWnZT88hchBy3E?=
 =?us-ascii?Q?IPDNcshxp3ViUpZB5jjTgkYHdHbKvBM5ws6wkm5nQ/2HT7xsH0EkkalYwwCF?=
 =?us-ascii?Q?7CjIq2WxbQlo8tuMgoQ0Fhdm362elpKLT+efFF+zxZEHRNjG+8pCiIaph2Zo?=
 =?us-ascii?Q?PYXKhMhmIBRc4FjoeMIWsPt5wh6Ti3Lws00OndB2RywY+Vk3TuRm7bF1/Knh?=
 =?us-ascii?Q?faSIJ3EjPRJWqaWW20JeIHampBvOqklrBLzRT5G25z1pNzjmEvapUz6DSYyl?=
 =?us-ascii?Q?+Fp5+49mlzi4Kwn55X3E/9m2IgyMmCem+WofrgHW04y2xAl3tiO63/OPAHzw?=
 =?us-ascii?Q?0u03rZ/I5VCgfJ8rjVha9rK0q8+kPz75SisbpyQt6bEUv/AaC2vCi5Fgart/?=
 =?us-ascii?Q?iMUm9PH0F6BfvZ/RJ44IIiY+p/Y4sGFZANsT81hHsGD1yE1pVy891H7rpzgF?=
 =?us-ascii?Q?m7/y+qk+RL+y5JSjPOr+BMduWY+4x/mkvM3uIcD6GhP/qMNlZhqUg+zEHoFy?=
 =?us-ascii?Q?7IJPT6rNDrwY+VRSdui/aejBAVuxHVMJxfTwHdgVwy+sp9+e5WjvznscKJfZ?=
 =?us-ascii?Q?xmMnAWlJ9wCUSRWk2hKwv7vbr+put4p2Kz0yeNIBCtqR3OlZfTnPJa7jAED3?=
 =?us-ascii?Q?rDENuom7uRpU4z4vKOOTa42MPT65tiVDQ8OP4dS+MVw49R2J/D6dMUppmUDu?=
 =?us-ascii?Q?EKYK9EFJs7VfT48Ijp6nQ8j0YfCypPhNEhaaMeK+7NsykiV78ycmW6RGjKOt?=
 =?us-ascii?Q?ke5SfpyYJpUyyIoARhje+Jaahk6PD+uWOYik+RIMi5u60eV3yRlLKW2PzpYi?=
 =?us-ascii?Q?ETHinWiAS4VCkeqcevK9Xv8PWKgSYJRA/FaaeSw6EH8uKcL39i7LhUnhLxAu?=
 =?us-ascii?Q?y4oRwvFbDPxVbiVEgAo4mi3NGORdoLBZ9FQ+e9a1S7f8puYEcaiuaghZZ/5i?=
 =?us-ascii?Q?TznfWZ8D/FAbS6CvWMsj/z5D6c4nipthmMYrOq5xWxViYKbG1AXJaYriT6iM?=
 =?us-ascii?Q?1wLCDsci3GqD+jNkSY7BRXxFdSFy4UBvj1fjOKsFowlrlwQb5evMTXZ/BmLZ?=
 =?us-ascii?Q?1i+bsbo436+q6s1Bc7kAAV7kK71kU1CtOiu6YcANUIZugHOvVzSoqaIhY3K2?=
 =?us-ascii?Q?rmKWoGtDVatJpf8Er3G988ambO6a5YTmFf8B6g+UeYTAC8DEeMVQYMwQP6bI?=
 =?us-ascii?Q?HPng0uDziBNaFf8z7r/twF6LyiiWzesKLj+iq0BiEQQqHxyj7jgrftG8VgRW?=
 =?us-ascii?Q?BbMrYe50gEiNxrWDup84FMiNwSaWZk1qkW/+/bzw/RENi0q8W9VypWDoS0Hi?=
 =?us-ascii?Q?umcplC1IPLSs4VHodbeRr4QjhkdSGRBCabDisrnN4Z2IcaGTDlF5FPOnIPEj?=
 =?us-ascii?Q?jJF0zjbCggIJR1VyBQ9T4AGwCxYfVrvuUdiJWWfZG94vbeBtV5E3d2kKkC9j?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JEHmFJVtBKOddxKGB1jH9gVaqjqYeD2KkfnZ/nAfUCCgcU6qpbodYzLTXXB81maK9kn5PoaPdgDaqrWCX5chjqWjydGhUtFc6UDvLmSi7X8RabPnG/mAm8EQQqLQSSX2Ok+ZdI1s7P5+qqLHTv4m0gmsnTDgJF+bZM2KWL/AuzYDN9ikN7GUDkhhmHHFlaU9PoBd/0HyB9cKADfFSPjyLJSVOa/n5of3hN2/dFV7JRp0xkJPbSEYOMdYlYajV2ONaLqPu6gNtbvuesFNk2tsMjN0ZndsKllKQyhvAEG1M4jNfsTD2V9+UnloFQWonTFo/4wLMpkxIFhMOc0u/7LGNAICCkh+fn40SzOOuwZEBzjdUHQep1rqFQxuXyNstmY2MWTiEvk5CDzMpRkO+5jb2okn4T0wikyU0YP0ju5cwx6Y8h9PdkhaIt93ecG6LOhfro00ZYiQiiqyqKHDJ4M8Ki2yUcwDJuWCIwEQRk3MvVSVfYz6zJb8aPmt/TRXU6E7zeOeEwcFz2bYozLi8hrX5vh0VoUn6DSTMutLEjJP8Gse5njtXpLz8xHPaNf1ul/+GxsNZyDq+DdRXEfLjIB2hE1f4bdI7ZlwoJ06ZRCstHE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7a9f5e-74b4-4910-5b05-08dcfe565e32
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:30:08.2322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C69DxoEJscJccgYp4JxG22zus25WPAgzoGa+V7aUO0bqUJLadrclgp7crLOTDVvCF7ZmqC0KgqUnZ56jrz7Q5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5837
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411060094
X-Proofpoint-ORIG-GUID: tTUwbxbocA_x7_Z_0RTcLnD8cddE5knJ
X-Proofpoint-GUID: tTUwbxbocA_x7_Z_0RTcLnD8cddE5knJ

This generalizes the existing tst.pidprobes.sh to check the args
reported by the probe both with and without arg mapping in place.

Everything seems to work.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 .../usdt/{tst.pidprobes.sh => pidprobes.sh}   | 56 +++++++++++++++----
 test/unittest/usdt/tst.pidargmap.sh           | 11 ++++
 test/unittest/usdt/tst.pidargs.sh             | 11 ++++
 3 files changed, 67 insertions(+), 11 deletions(-)
 rename test/unittest/usdt/{tst.pidprobes.sh => pidprobes.sh} (82%)
 create mode 100755 test/unittest/usdt/tst.pidargmap.sh
 create mode 100755 test/unittest/usdt/tst.pidargs.sh

diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/pidprobes.sh
similarity index 82%
rename from test/unittest/usdt/tst.pidprobes.sh
rename to test/unittest/usdt/pidprobes.sh
index 25fee85537fc..aedc6256f195 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/pidprobes.sh
@@ -5,9 +5,12 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# This test verifies that USDT and pid probes can share underlying probes.
+# This test verifies various properties of USDT and pid probes sharing
+# underlying probes.
 
 dtrace=$1
+usdt=$2
+mapping=$3
 
 # Set up test directory.
 
@@ -17,13 +20,21 @@ cd $DIRNAME
 
 # Create test source files.
 
-cat > prov.d <<EOF
+if [[ -z $mapping ]]; then
+    cat > prov.d <<EOF
 provider pyramid {
 	probe entry(int, char, int, int);
 };
 EOF
+else
+    cat > prov.d <<EOF
+provider pyramid {
+	probe entry(int a, char b, int c, int d) : (int c, int d, int a, char b);
+};
+EOF
+fi
 
-cat > main.c <<EOF
+cat > main.c <<'EOF'
 #include <stdio.h>
 #include "prov.h"
 
@@ -48,7 +59,7 @@ EOF
 
 # Build the test program.
 
-$dtrace -h -s prov.d
+$dtrace $dt_flags -h -s prov.d
 if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
@@ -61,12 +72,12 @@ fi
 if [[ `uname -m` = "aarch64" ]]; then
 	objdump -d main.o > disasm_foo.txt.before
 fi
-$dtrace -G -64 -s prov.d main.o
+$dtrace $dt_flags -G -64 -s prov.d main.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-cc $test_cppflags -o main main.o prov.o
+cc $test_ldflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
@@ -75,7 +86,7 @@ fi
 # Check that the program output is 0 when the USDT probe is not enabled.
 # That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
 
-./main > main.out
+./main standalone > main.out
 echo "my result: 0" > main.out.expected
 if ! diff -q main.out main.out.expected > /dev/null; then
 	echo '"my result"' looks wrong when not using DTrace
@@ -88,11 +99,25 @@ fi
 
 # Run dtrace.
 
-$dtrace $dt_flags -q -c ./main -o dtrace.out -n '
+cat >> pidprobes.d <<'EOF'
 p*d$target::foo:
 {
 	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
-}' > main.out2
+}
+EOF
+
+if [[ -n $usdt ]]; then
+	echo 'pyramid$target::foo: {' >> pidprobes.d
+
+	if [[ -n $mapping ]]; then
+		echo 'printf("%d %s:%s:%s:%s %i %i %i %c\n", pid, probeprov, probemod, probefunc, probename, args[0], args[1], args[2], args[3]);' >> pidprobes.d
+	else
+		echo 'printf("%d %s:%s:%s:%s %i %c %i %i\n", pid, probeprov, probemod, probefunc, probename, args[0], args[1], args[2], args[3]);' >> pidprobes.d
+	fi
+	echo '}' >> pidprobes.d
+fi
+
+$dtrace $dt_flags -q -c ./main -o dtrace.out -s pidprobes.d > main.out2
 if [ $? -ne 0 ]; then
 	echo "failed to run dtrace" >&2
 	cat main.out2
@@ -106,7 +131,7 @@ fi
 echo "my result: 10" > main.out2.expected
 
 if ! diff -q main.out2 main.out2.expected > /dev/null; then
-	echo '"my result"' looks wrong when using DTrace
+	echo '"my result"' looks wrong
 	echo === got ===
 	cat main.out2
 	echo === expected ===
@@ -262,8 +287,17 @@ for pc in $pcs; do
 done
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
+if [[ -n $usdt ]]; then
+	if [[ -z $mapping ]]; then
+		echo "$pid pyramid$pid:main:foo:entry 2 a 16 128" >> dtrace.out.expected
+		echo "$pid pyramid$pid:main:foo:entry 4 b 32 256" >> dtrace.out.expected
+	else
+		echo "$pid pyramid$pid:main:foo:entry 16 128 2 a" >> dtrace.out.expected
+		echo "$pid pyramid$pid:main:foo:entry 32 256 4 b" >> dtrace.out.expected
+	fi
+fi
 
-# Sort and check.
+# Sort and check (dropping any wake-up firings from deferred probing).
 
 sort dtrace.out          > dtrace.out.sorted
 sort dtrace.out.expected > dtrace.out.expected.sorted
diff --git a/test/unittest/usdt/tst.pidargmap.sh b/test/unittest/usdt/tst.pidargmap.sh
new file mode 100755
index 000000000000..0c83f8703539
--- /dev/null
+++ b/test/unittest/usdt/tst.pidargmap.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT and pid probes that share underlying probes
+# do not apply arg mappings (incorrectly) to the pid probes.
+
+exec $(dirname $_test)/pidprobes.sh $1 t t
diff --git a/test/unittest/usdt/tst.pidargs.sh b/test/unittest/usdt/tst.pidargs.sh
new file mode 100755
index 000000000000..53cba7c39624
--- /dev/null
+++ b/test/unittest/usdt/tst.pidargs.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT and pid probes that share underlying probes
+# get the arguments correct for the USDT probes.
+
+exec $(dirname $_test)/pidprobes.sh $1 t ""
-- 
2.46.0.278.g36e3a12567

