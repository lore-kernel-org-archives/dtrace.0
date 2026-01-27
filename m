Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECF9354AEC
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532979; cv=fail; b=faYihsUu192ZO39m+boPrpifaV/HHd8UjjeSWWnGMFR5zaqFqSQkmgw822OdLsRcjuPZr6iZ5c9g9+Mg+sPAg6rA5tyqKQguocb3HLxhAg13EdI+q5SU8DXqIbk3/xKT6XZMMMNlI9iMpWBqVubYr3XSi4IOCndxJ9hw2VyhImU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532979; c=relaxed/simple;
	bh=ObetViu8EfRcg69fGO+weqe9OfQRyfn8SIzJBvUvQrk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=eXQSe/AC/mMRN7qzqaXtnYdO+EcwZo819Tl+z83BJdwtRgULqZa1glMbdJR8Dfo+2IePLvfHmqQajC8Qygj3y/vczO0vsQOWTco+ZvZHOgViD7r96TetX6TDVWP9/qLtZf0TwTmlkszfjlE/dB7AD9igAh81YhCfkYvCGlrmxmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rCk4IH6Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lrh2YIFn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rCk4IH6Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lrh2YIFn"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBI57P3545330
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ObetViu8EfRcg69fGO
	+weqe9OfQRyfn8SIzJBvUvQrk=; b=rCk4IH6QMglue6iBHLxniL4GvQAoRG87x2
	rkuegbQfktKfnKB/h+kHnnT9SzusQiYH05JkyuguKRHXoKfqmzYr2vaah+wu6W1+
	Xrnn5EkLaIkAt5zp6O6YDwiQV8i0BzPDa+VfJCWlnWBZOzTBmq8zmQxP/ovwyWr8
	Jko6IYbNrZiidWQS7lCoNwy8lMckn/KYo+yFuy+uJcUx4Z4h8cpv93hwz2MPOmEu
	kNviHmMQl1yyqIf7UTMHJ83c47Ok77KVLDtRjXII33zpkbt9B+PKVSJPm6Z/gHhc
	xMJty0+BIq5uAdlHDxooCMt0xPU5Gm3MKAPj3XPfrBUd4ceEgPEA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvn09mdp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:56:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RGe7xP010533
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:56:16 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh9q0y9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:56:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjAnDa1ULv86Tqom0lNO0H/zhWuzfPjRWh1ii8Dh89PHfMDgS/CLN7oEFEegGtpcdA8KYZzYc5RVASUFrGJwDsSR4a7JYDvo8oOU0ZSlzBw9V+kRE860W6swK0H/Bre7FB+VzC1jFdPS9D4RJQR54HVqdSjn8fCXtaoDIEjg79y6yw9Xv94ZJeJkvgi6gVK2TzBqa5SUoNhkXm52MfLXwlA2/OM/r79kKtupK0OLbv39N3CmtPD4Cl5e/Ic5OeoJe1QDL4SPPWEn9RcOLyMv7i+z5/UL6xPffVPv1AZOxyxZQ8IvIjHkKJvkIcgmr8NB/2X9urPT5a5fq3T2qVJ9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObetViu8EfRcg69fGO+weqe9OfQRyfn8SIzJBvUvQrk=;
 b=BuLUFq3+Pf/72LUl/00LHctP+KnFaB5kgMXx8phQ8D9AwZkfO+ZxFcGoxdJmlSEzASbM+66HhHFU/aluradVPdaBsjdsF5EmPg7i9EPilI5jmXxikxiY7lTgQGt2awLV+n3xCf0BT8A6LryTdWEnOOUOmfUMkRphw+xurlL6rJ5P2DkADH9oGHd9DM1DESZ4l4mF66d9m0skhlA4KqD47ICRPe6HCMkNTMgmPuFuQdfye+fsOlylbJSYm/xwT2nrtLbCq3DLKImw5gMEMXv7ONa+rmeequPuGSnxpVNsQ3aMUy4uke6M9n+MHyQhbWP9jMg/mgJmCo8dg0kO3eOMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObetViu8EfRcg69fGO+weqe9OfQRyfn8SIzJBvUvQrk=;
 b=Lrh2YIFnBKfR5Z1QXpVhHFvBVV7d/u5qTSYyhAeV0MXcN+EflGQ4JRk6vPl8MJ6lM6g8fH2N1/LX27qyhSLDQFH2HdLRRraK3qEZOna2GwVWNIV6j8UPJkXfN7D1ivfj+g1RzEn4X+7Oqc1lN2p9lSQtEQk4B/aK0ZxskShtrwE=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by DS7PR10MB5197.namprd10.prod.outlook.com
 (2603:10b6:5:3ab::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Tue, 27 Jan
 2026 16:56:11 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 16:56:11 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 2/2] Update NEWS and dtrace.spec for
 release 2.0.5
References: <DS0PR10MB7522719EAD0A273DB4A749D6C290A@DS0PR10MB7522.namprd10.prod.outlook.com>
Emacs: don't cry -- it won't help.
Date: Tue, 27 Jan 2026 16:56:09 +0000
In-Reply-To: <DS0PR10MB7522719EAD0A273DB4A749D6C290A@DS0PR10MB7522.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Tue, 27 Jan 2026
	11:50:00 -0500")
Message-ID: <87o6mf0zbq.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0419.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::10) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 866a71c5-4d4f-48d1-fdbf-08de5dc4f999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GKilsTrvhX0vSuAj3tzYWbwS6GaghBAYVEEKJzWcF0M/844ALhGNnDTEj9kX?=
 =?us-ascii?Q?WwKQHRfbaGTIGp0hY67+YTZPxDrDT6qb3FWVnVXyRmS3JejIhmP6jQygqmDK?=
 =?us-ascii?Q?1KNWigTs95EN6aKSqlTFKibjg30UVjz3UPretSYtXKr2rZfSqA9vmKnpQ85a?=
 =?us-ascii?Q?r072rXjQp+JKxm3xsbXKiEVBJDBhQ6gjOGhWSaacmntkDdWjfTYiVYHmQ2+d?=
 =?us-ascii?Q?QbU+zAlPVPxCxAsOen57iIwKvzf53JNvGcTByTFs+ulkE+tr0y8vXM9yquZU?=
 =?us-ascii?Q?CsXwjnOqmEQdFTAZ18f1aUEYNH4hAguT7k7kxwXFmAg/P5yc2Z1hZyXW0+oV?=
 =?us-ascii?Q?I8ceLdKSXlqI+p42G+iA3RgOqJVh1oYC7wdE1rHoc9iWHtvRxu6rUcR106b0?=
 =?us-ascii?Q?awvePiFdsSbrmBwdTBpZM1IYjcZQZr7kFS2NcV3sUK2BN3gNlmV3/Tl2ZTAT?=
 =?us-ascii?Q?nR+jTNggEzbELuTeDiApVFF3C6INYRgDadjDB0IKnsw4KoS05mjEl11kL4aP?=
 =?us-ascii?Q?AALLR3ZQgWSDvrpY+Y08z5zD0+9TfWhjKGJFhnRKna9TMurGMkIWCFF89tfq?=
 =?us-ascii?Q?yzPzHCa1wY9eYUHOF/8VSWRAXjnzkkMalRUasQezdH/ZMNI8FlbShLHj/lvm?=
 =?us-ascii?Q?tZDiK6lScXgvdN3UK0AO1r+3YXQkA8Sxj4Zveulb5TB+JKxeBc707r06I2ao?=
 =?us-ascii?Q?qsOiTSjpQYPiL8zkcOq+7UWU4RMML29eYipqb2y/sIe2AH9GuIf5EldiBgkM?=
 =?us-ascii?Q?GNV2/jPOkWeDBy1p9q8ZUQRRBhj9MrlHPTaqVmhp6OILPTdecaIChMmYZ5Ki?=
 =?us-ascii?Q?Pc+lOthpeOs1WbM5Qf6ZwcQ2TpWe/rEoI2W+4T3n9XA2mEWtisfqDrpy7BZi?=
 =?us-ascii?Q?RseVrvTM36DZkK38m84BgaJKWG49RTV40c8+4f3ok/s1ftLLVHmQU0nrI1/g?=
 =?us-ascii?Q?CydZ3XKDWOZSc56WF5eSrCDxCLPF63Hj3eUEMCaqJ337y0jAvW1q+0UlJElx?=
 =?us-ascii?Q?vijFCHSPhJgH4yGpltWWaZSSdsjWJ8yRd4iHoYbKl3gonlMwm8ZIVoUuwVvC?=
 =?us-ascii?Q?0ocmfuyMqhEXyvb9F/FqReGwztnbHyIleLPRnzPs/8QLXzAQQIUXw5ow7AKi?=
 =?us-ascii?Q?OKtXygn0lQH2GvZlhXuu8g2TG9qArQH79LQRSypM+zklNCFytSjSYFq8d55k?=
 =?us-ascii?Q?iKVrc0nL5DzW15xetigG4s2RyhRGjBRCaK4iMPB7mmK28W/nk9+fDYoSJyDS?=
 =?us-ascii?Q?WCmZ8izFIPPbRB4a40vsDYVdRbXdeepOJGy4UbYsLFqW2VWL+nUWt4n8hJGF?=
 =?us-ascii?Q?M5gV0FzQoTFvLi/zl045BKjVIJaL1M6gTTJCxDPDuxfna8GsBgjTedHb72Kr?=
 =?us-ascii?Q?28G4S1lHe49g2571wjrY5csqs6qL+Y33hgBt8OvhYxAMB5V62bhL+mbGb9lm?=
 =?us-ascii?Q?zf4H6XNYGefbkxk1lClYwkpRmZhQtjJKGMrKz+YVZAIg7utJnhiZb7f9XSsr?=
 =?us-ascii?Q?vcRuANZLpVYi+toNlMTWlrt2MBPlbGdenuEb2Ob7oBZ6dm+JgSkgS4SDsocr?=
 =?us-ascii?Q?/WLj2qafYANipeqvM/M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JXKtTgLiQOm/+AQUfXDxGzNCfb22UgcLju7x4v9nUbIJeIT1p3p1a98lN/DP?=
 =?us-ascii?Q?/k597nqMEIUaEd7y3IODaf1kUV3XpQcEv0zrHQUoKs4KcmIJVLrQEnLWIOrr?=
 =?us-ascii?Q?0wxzw2Jfh5P2rBYV3C6+nK/PDO2xOVPA0ego9smc7P1f0Aclt4Ypx1/sWtO6?=
 =?us-ascii?Q?MaJfbuCmdqf70Wkf00EuRVnvl796hnjwSnR6fBvjYbYlPLxjArPEvJmle3jp?=
 =?us-ascii?Q?fj6bdPfJ2o45dbVtQbw64JiXF84gEaOQ+U/t51Fbsh+5RfN2ut6K78H8vI0L?=
 =?us-ascii?Q?mHkA9wYfwAp8ZQRClDd8qW0XIsYbxDaeOciGEmOAuB14lGCVKypS+rYwdMCD?=
 =?us-ascii?Q?+YAuGH9S4pxYiGQwSApPQGC5Bf8bFhlgLlZA0bjP4Y7aaInR1Zuhq/0y0krN?=
 =?us-ascii?Q?6ZmDo5LH/6MpsgTavR19eknqsZyP/5k4A9KMYmIshpzMjMCyFzs+mpxrNaRq?=
 =?us-ascii?Q?hK7QnJ/OdfRLj5+yBEEehbw1ZWFtY3kv6P8136Yj/0TCTm4tUa1dr54MSwwW?=
 =?us-ascii?Q?77HLQsJjCCzMT7KtyhYdqTzT2vDIjeU7ASSYFM3pqJG7TGE96HwHr+wY1x5O?=
 =?us-ascii?Q?Zhv0t7xwk2+KAkFjfIAvIJh8sn1m+ECZcqaxrjqLfV5BBwXyI2QcM7IDjQHJ?=
 =?us-ascii?Q?A4nZMVVnPL/5ZT7UcgILPr+ZfX6wEhrvgjsGxTgZEvzh4GHRclXOV/N48NLq?=
 =?us-ascii?Q?9EhzSwVukKTIMkar+1DUdYeYFe8G2031sbwJvbof6ryYxWOYRiUR4dF2SgZ+?=
 =?us-ascii?Q?sk7qNQPWzBXoKq0lgMGYR3nrQRNrEMNZfKJPV+iuS49MzH5H3LmkuF8OyVaW?=
 =?us-ascii?Q?bkqesQyasVmduWYeA9b7ZjkhNsGIE798tiEu1wNaDxFn/4jcs72Bv3gpYZCi?=
 =?us-ascii?Q?fl+1EHxyXnZuAqEdpflLP5KGBq0N9v74Tm0e58PuojMrdZqpE1cGA3igLF3G?=
 =?us-ascii?Q?U5ZZvwjlQTtVs/aVKqCKWDJuEWdl0Igkr+/If2YDAL7vTIagE9F9s89Yxq/Q?=
 =?us-ascii?Q?f3dICvpWVhHkSIIjBvPpMPw2bEYeSwp27YhuoUvh6VGhuWhha68oex/9KdFB?=
 =?us-ascii?Q?lEwZRvqL5STp2R4paA9iUKjeY9lxRd01Ga1Qmb8yM1tRTNaGexiyYLdZl2Ff?=
 =?us-ascii?Q?sJxPSw3EVuJdlcPNLZ+54r8tFDb0zXRX5ApG4pEo1CUJJuE8KDOYQJXIoSCh?=
 =?us-ascii?Q?UeEo08C2el35QX2f349iub87fjCCTYwuDtRcfmiQHuo+SZrjmRyHhYNRhkJp?=
 =?us-ascii?Q?zjLW35y5zSW6WfJfBSTWjm+o8SbuP2sUajd8u9QyF6VReM0keW1WOTGUqP16?=
 =?us-ascii?Q?9ANVGd/hsQw63ikv4JPfCepSrftWrnWF2RWzSjLDThc12JilSMEcqA0K5rht?=
 =?us-ascii?Q?GTxmSx0k1DSW2SkQmhDuNsi7RdY/YzaefkMnoyQogE9Vn/rqIbJubLBkFwU9?=
 =?us-ascii?Q?xr5GDDGPPSDoVFhtLmb+WgnDhP/hjOjLNo/GqlLqZkLwQJd+rvPK2p91d+p8?=
 =?us-ascii?Q?YlVh26OBp5TOZEqw2m7NecBa8iuVznPCnzqdjARjfXLSI3+EWghB9Y9ax9gy?=
 =?us-ascii?Q?kpi4f+wO1QFWn5jb0s2JYRL4dxtaqgRIG1pAUqDElCkMGzuPEK7K21vbSFtl?=
 =?us-ascii?Q?N6l4s68lIJEf7ySGgksE4+0Pn/gW+ArnvZc8D5P6Eg66NdiCHEuqEOqBvpQX?=
 =?us-ascii?Q?sZ3ti3T9Tz7XVuHM5ROIJZybcRPh1a9B+oaSqUNfpJsY41xI0ppbchzohW3y?=
 =?us-ascii?Q?t2y6beE4Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7HsTnvShvryt4v3rerW/BO8cJc/3zyMy+7VCvug+iSetwXRtv0GiRX7ICUwajnHHzooLbiBYRxQCmzfTzS2RrVIEBugcWyyGCcp/LwcZSR+SW8kaw1lOFa2fzN6QCgtU8fVylwOfI0kSBxWz6DuBm5o26QwvIJvidFa3+sm6XyQptkXM1Q/3z/B8kk+EReuYmPBcS6pg2ICW7MaJL0HLa1x8423+rLHE4pM/hjtdBcrgS9l2ORiTMHtTl9/q3JmeEZjtCepkmiV5ycSfDZYeao2VvmxVU3S/rhctbbVhRBU8WWWU5i9DnALxqDF9s6UKqhs+ZhrYM0QKsKmNfLgAEuFfbtP0S7LHgh3FLqwFjFqQDDRp+bSYRa0Zz1ryA1+UKKs6GnbdDUhTPrwwjb9u689OmBxuXJ6gbrPjQTTdtV5Mb6wWO+bb6jf5nVmIivL62VIZMF4tpXv1IAcyISnuqJqRaJ2hA8dpHWbFCTB57FYVqQiR6h3wHpuqa3OTDcUBOPCwIIMkHa7PZ1GHX+3ta17bVnBy439ijAF5qNG0RPIQkwFFOpjkOzDqM97dgj+7z04x2cJKaZHlTvZJ7OYFLo45GfhmQqhFyQ7cb+KvAy0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866a71c5-4d4f-48d1-fdbf-08de5dc4f999
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:56:11.6886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzXaAXhFw0hW2/VJOCHfziO+Nd7z+e4UDTJjO6s8gKhAD8VuB78+OUWYWuAjbHAWba6cm5Xwt8drb6/iwKO7aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=989
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270138
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzOCBTYWx0ZWRfX4tpzhmy6YDx3
 6zHW2ifvKBlHhsfDZeimovUqkuL8pepAxVorlkJesJwIrAExOTtyrVnsKa89M0HfF4T9k9HgU12
 CFlNjGc93HMBFyG+V0VZMazhI53HhkUd2MBc07bKbtnyZnoAICrhKBI2jMfm/zJzfjBlKdQ0cHH
 vp3qkIX3zckxdv4AXMR+qGwK/l2ZklR0RiFfpHAJXTuShtyUIpMzAwePKWtBBl7I4GFWFA4JMQ+
 YXvNERKCaIdN2OkpEd5Zkj/ejQAP5zWAhNXGB/uY4oimqM+fQB9BbxkuAx0iCF0OP/1MyvNuUjc
 7LiRXbq3GICeEt9RqdDFyGIelfFCghO0ouDBiuAQsWYvPJCYWbST5WeI3LP2Iog4VHsdiEcsyHV
 t3J4USZP0ocl5AkIA1oHrBC+DvITJzHEPhn6jetjRJDfDnxrEeRpEw9aWatEeAgX86y/UiKUpat
 QyRvqg5to5dpFc7LpGw==
X-Proofpoint-ORIG-GUID: J8C--mNpkSPwY2Ny5a15Unk3-I2l210P
X-Authority-Analysis: v=2.4 cv=Rp7I7SmK c=1 sm=1 tr=0 ts=6978ee31 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=eVXAutJprV7vab0VpwoA:9 a=W8W4e29Vb2oA:10 a=DVKqRkKJf1IA:10
X-Proofpoint-GUID: J8C--mNpkSPwY2Ny5a15Unk3-I2l210P

On 27 Jan 2026, Kris Van Hees via DTrace-devel said:

> New release will be 2.0.5 instead of 2.0.4.1.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
