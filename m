Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F19523AE66
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 04:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753416134; cv=fail; b=cT88fbd46KHopwDGpP0PUqd2YV2bh+1iQMkgzBqmqashsNZGD9Tdsf6hf1UVAWFs0laqS7WwBtuZqDXSfJRUyZi6aHOlW2xitBcz8j3h5eegPpc8sEZcf3bv49CsgKHlx2zhbEwtXC3AceycE5raGvQG88kgKFS1tl2Hiu2LgTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753416134; c=relaxed/simple;
	bh=CTYGgzT0gK4bK8k3LzxPNnZ7dyx2DPY4LOV1cWfcUpI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=hQYmUFmAS2qd6nxlGRcVrrlthL7pJzIMMrWKF8N5dahGLWnKX8TizpXHvaBCLJG3a4yIobs/Tn+38YC7SeXDcI90EcZBgtCay3EIuiZ24eXvQLIefC1fR076VM2ZAmCs9JQn14UjecmELKBKZBlLnobAe7UtgwL2JG/U5WsHDZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Bv+zv2CZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=snWxoMr3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Bv+zv2CZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="snWxoMr3"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ONvedf002515
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 04:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=34RxMLCgSXYIsHATsXmOqB1CgILsKC68OTHN4BITVbU=; b=
	Bv+zv2CZzqcL8Pv+O2KKMrHi0GXMQR8Pu2csyD7lVtJeJ2T6a33ZL4chtbtNwypO
	aM6VECRAaHXzG037Sr4hB+7Xl9HQuxttozJLszosP0v3COLmilyI5SfW1yVxso0t
	POBz256C19GVhPEtUE9mhqkQ9xXD9Mozib/9gGdKMh/CQzoZTN57JBped4MEsKgj
	/Ts48Yyou5BE9v+IBJaWjYLOcWq08EYJQNb5MDCgE8rxAL2Ck/XtdysT3L0OGPa7
	yVwnGtTofTFt1beTynoDmqfqtli7H6dyhoARLQ26dkOWojpUrd1Hsr0H6S5xF/uV
	6OuQ1e45lBPecwdY2+RqEQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w1jg9f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 04:02:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56P34FIK005819
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 04:02:10 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tckr3g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 04:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oh8EK3tC9ggYtcQ/BxOb/j1jKXzytaMYL+z3yDK1kPIGtpmcjSE0kscit6Ii88oOPH+KNQvWjdrcaOCiH1fPH/ZSuZvlZpQq2nnaMoufttkeO/EHaDYIeouOAG7t0Pqu6kBPj3JrRG/H2x9IPZ+xzkk2FrRSxkMV6IMV6Inda2nhq2HsnwCg8L3qZSaQAmCJm5op2s22D01KYMqwXHCOsRE8PCcg4JQWdOiwaMZNqlVZl5gqphIq3x5YERpffVabTNFvwkweGkMrIe8usGRiuII4AaxSy8KLPEqhTqSv1dLfTb1X9cHoCfq/F9Pi7nD8hgndzKQlLYpefq/YVHjofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34RxMLCgSXYIsHATsXmOqB1CgILsKC68OTHN4BITVbU=;
 b=ZhxI1uzE2HAKTM7uK4JtFF1K6cLsJPhRHWfrETyfiF+kDuIT1vAZNNC5JiucMQ4lVDk4J18X3B5aHQ8SYujWuHwlobOsAGUFa3KOPpAuXNjhOOIEJ+Hwc/oPyF/K/P3Xwz+f8PMyYLCSV+t53qkTfSJ/HqT7RLYCzJOf0yp59ZK/hlSomeJe0zj/y21NFyWS5owfjO1L8Z+KByRtTvpF2+/MBE1waQ4QkIxZXHFwzXBOCNAojjUCllxPyS7p+/14RqiOcUsJDY3Ozxw+EuZ06RLGRZ8NsEeSzxQ67QBgNKrR+bB1RkadH6YY1/AUeQxr0xZOzZwLxcY6Syk9A2SXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34RxMLCgSXYIsHATsXmOqB1CgILsKC68OTHN4BITVbU=;
 b=snWxoMr3EUYDLcX6iPCBPW3LsV0W0xAihXBCqHGIO1uG5bTbn6GWuzj24XzilCHu4Lyc9BtCBEH8LgeD4QB94o7SJU05Gonr+AmRJ8udS/FzSPjSOO/TjBJfIAFWALg+HOGWXdJpV9Akwtu5vPyrwsGmjTnxVKNjg/qfYni4gyc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8735.namprd10.prod.outlook.com (2603:10b6:208:576::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 04:02:07 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Fri, 25 Jul 2025
 04:02:07 +0000
Date: Fri, 25 Jul 2025 00:02:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] install: add installation of libdtrace header file to
 install target
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56726AD8147AC2395763967AC259A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 154eb920-7745-4adc-775d-08ddcb3005fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?maTfugfs8KNTV7FLIREtlS+w/Kyj79L/GjJqAquo8N5/u+tPCkfUKOIeyUxu?=
 =?us-ascii?Q?xtcmlqmXUfpTtNoSHUFmAKFOzyP32o+BiJ4GqD9eH980Bij6ydf6Ez+08EXr?=
 =?us-ascii?Q?Epre+wizd3cTHY0cknYah4wQoB0m7IhNQICw8+p9cgr/TTev9+AcQNkB+n+N?=
 =?us-ascii?Q?fNHHOHhJF1PP8BzpTXLRDUCfrjuFCuHfj592jP4yZtAZ59JzO6sSusEshS03?=
 =?us-ascii?Q?YPZFF5RBfxEY8BqFDVSa6HmXbu2gzMqB6DRR/MWSPXRie1zEr3rpMVOlmrWB?=
 =?us-ascii?Q?QMSArOPhSlKrF6/VTJwhCzaDMjolLHHFcKhAjGaJyfB2JFIa1ui/4b2N0TQx?=
 =?us-ascii?Q?fzUPa2XzG2eb3CmvPXyzfD7sSPoUi2tlcO4wDENsO6CSBeYAayNbI7+UZT/O?=
 =?us-ascii?Q?ovjmXjeb2ktMFFLX+nxOBjnzx+RRvZaVY85qnbhx+W8Tw05Kr8S3kkHuxRw/?=
 =?us-ascii?Q?H5F8FGknHhpWe2jyKZpJMp2cSer4wLEOPH5FMI06nTyUUIm3sbjrwVk+p8qn?=
 =?us-ascii?Q?Y+TK6Og0sgNmaSvCHRUaukwrQIRnHBoDT61fT11Q+No+f2QsKCKYYtMZxTFx?=
 =?us-ascii?Q?lWy2DlxU0ZBZrDE5Mvqy6hFRA+voJNrJGbamqB1BM1kUrCKR88pu/fyLlqNW?=
 =?us-ascii?Q?1PbMFSWZDCWTs5w8bhKYR+otnbI+uyOUDBRbbUmxNA3+GreEyutUDZ6Yf2/f?=
 =?us-ascii?Q?metWHnvnBmWCvaDlMHvdkFqqARY0YuLCuRivvguIWjKMSAvn25SFl9G6sSal?=
 =?us-ascii?Q?3eS11Wt/jc1sEduzMa9Fc3gv22CRARVL34C8jqOJRnT1OgPUZ0fQrpSaDiuJ?=
 =?us-ascii?Q?rhsu8e0Hz5h053Ea4OT4BFR9QXgGRZgIuSMy2TrMG6KIz2glqOWp7xVJohKw?=
 =?us-ascii?Q?qVNW/IZ6orCVaF7msxOF/wpIgCVx2fZR6seKOsjh3f+Sg1CpO+ecnY6NTV7o?=
 =?us-ascii?Q?riDnlUAHzB1Zc7tWIg6ytyMGR2FcN/LoZqeHMNNQFev8wPeegv4SmMTdsCnW?=
 =?us-ascii?Q?Y3aG+5A+hfEsqFXviteyVk32dJ8mE8XWsESp/TkAFQ6zYBnMI1JS81y6HJFv?=
 =?us-ascii?Q?AFRZ6P5oKurnw+7eKgwjJBodg0eIe/ELAitHZZM4dB1z6mhVweAsTOvHzh6x?=
 =?us-ascii?Q?kxZP7Z04oBey2/3M/ICdFv+1Z4r0sQbB8WGCXGxSgnigQZMp7jUGWdbfhI2D?=
 =?us-ascii?Q?hq+ynXUScv0Z5jLvW2TSBk5HL6vc6rI1R6Uq3YIPoxiabKjbLsOI1keYVrIm?=
 =?us-ascii?Q?Smu071bqkV6GV7keCP/jPYPJm3Qs5HrGOv61oOXvhWZJ+gdt5JG5hMhmDmD1?=
 =?us-ascii?Q?Yp1OvnODlm8gykLld+FahAE2TPAF7Jx8cXQaMa9NyZ24INPPeBfizxPn7gMy?=
 =?us-ascii?Q?S6xjCkSUgCr6wyKVKcpMRu5di2q6ViYnhQjUXic877jMcp+zsoZqbs4sc0Pt?=
 =?us-ascii?Q?QbMtLomLiZ8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?paHgaU3ehshTh5YHgX7hiIdMYoOU59rGDfXsheVoBDXq7KvhC1ZRjt9GmQsv?=
 =?us-ascii?Q?DPcRYkjqIcecgHTTYV+5kLDQIX2f5DVIp4aXWu81yzvs1U8ed4el2t3tejag?=
 =?us-ascii?Q?iY9H0oRzXTcjbjAWhMDPxZ7+T18wYXPyrwV0ZeB1ECRhGU1DoNXG7/M7oyaI?=
 =?us-ascii?Q?YvF+g5Kj5lwIaTHQHsCOwEXr1v9aO3MIeMsluF1uMuCN7c5Z8oYsauBKzRHn?=
 =?us-ascii?Q?d0TpYPcYUOZuH90sz/edUQDeRAahTuIDV2AA4E/WDT3T2DKCA3UzoWZeol2O?=
 =?us-ascii?Q?OrONn8u0rsu9njikW8n7Zxvcc/7tYTsoXsgStDvFlToBdXiaNZ5zV22OPAlG?=
 =?us-ascii?Q?IitQ9ryc81McbuDzUqNwCn56NqFr0vVJJapToI5kTHvM+r3kCLrSgkqOiesg?=
 =?us-ascii?Q?3ndVIVv4mtqX6dR4BVJzbGDkszZmvad//JLFI9kUC2tZXUWV2ayStRmaNZAY?=
 =?us-ascii?Q?qzwYHaVSj7k//77IrfV07Ip44xcBe9Ra8vNZOoTndE7eqUWN5LX1fppS01cl?=
 =?us-ascii?Q?K61HQ2RrU8VTWUzPPOt0JlXCUcZYBhBwya7fDUMVNErK2YZnEd67nTesungs?=
 =?us-ascii?Q?Pb6mPpDsJ1k1NpI8Md/QmjoW7sjnfyQaKnW8zBi9W9Z9gAbmJ4wy9Us6D+vk?=
 =?us-ascii?Q?v3JIiIUgMF0Cpdb2feoGxRg6x5LKOjXOQQMpJpbf5GQba1gqg8rD9xp5qVsR?=
 =?us-ascii?Q?oW2pEJAcR6ZvzvBKNS4cuvWZ3+U55/33AsovtZM1IXifOFaObfNEBbjfNTuW?=
 =?us-ascii?Q?vnlNsFOR/Rx9o8t/vyAbitv3x3NLSUMvJLzOPuDkBtY1tBNvBRToKVTw5VQD?=
 =?us-ascii?Q?n+bf2WNLNKN0Un7JfZXJNaxN3ySzT4qFcuejRC8RTggagET3ZMczQ9Ximrit?=
 =?us-ascii?Q?yLRSBmdNmRvz5SISyJVEytQHfEqUwXFFqbaw2GffDMtJBOAxDl4bvVGfMogU?=
 =?us-ascii?Q?1HN2ZruKqKPv2JfTTf393w7TjkKpTkImzJxbAJ7vLFMNvesq+VRhPIFLa5Qu?=
 =?us-ascii?Q?ZvLRDV/K9jtyO16GJ0p2nfTBL8zkd7HlRlRXSbwggps8aTqQhWzNu29wAP9I?=
 =?us-ascii?Q?bSolGyaWetXKFvvleMqyuvEE0JIjiq3Bvdwt3tr6JmHhbRSJJDWdXYPeHWPI?=
 =?us-ascii?Q?UUSHifQCRNC9do4aqpFIwv+ds1s1BBYoO/54x2sSVlqdk5b76SsL5X5QDqi1?=
 =?us-ascii?Q?3vJWosWI9/BV6FnVZAr8LSKNzdcbwZcUXZ7K1U1emnWxySLRsYF/h80XTvdJ?=
 =?us-ascii?Q?ZRetDA97lzTzRAvqU5nQACtJpEBgtvibeAV9FlcjpLWyg8MgU0I1NbmkI5eb?=
 =?us-ascii?Q?w0JRymukRj0bmLbYDGtZyBxSJ5hrwZ3U1wq5cwGBqPd5Mj0WEFw5bjNC1sPb?=
 =?us-ascii?Q?juzDfQrXeh6AH76TET1zfuZMP4353xbHsIg7fPi4Ho61sdjy6N0f06JM+jl+?=
 =?us-ascii?Q?KUeoDJfAbBcqvwYBgDS0U9O4LRt8QscZjDjTktwheb8EnZAZ8xEusPK5Janc?=
 =?us-ascii?Q?EKEu27uaNhEP4SGYqqw6zGLQ2IKEMqtyOjuddGnnj+oX9aaI2KFkkjqX/7g5?=
 =?us-ascii?Q?MhpSjAfbfD0H5klZg6pLuPOcIjIzLtzKKDzACoOB7zZjSWZ9SdZ5dhQl84gm?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Vpm/TF+wikEJrwaJGaqdznJe8/+D6c/wgs0amNWVX3yQdwZmk2bCvcl7J/rmG4hK4YIQiiTXkqujefNwhpaKkLcVnsHhgnnrVEgfQUDgsM5NcTobmv2YKGUT0L4sJOoREfCwTBRR6m88uHOlMFNJayYptw7e3TUuuQ+O0B4x85kqUse7EaMgxQ+FAAjCxSrwMYs8zZ4VsHKd0groNlsNHvMj841ZmQWTwaSFGx4uxlaLaGCPKItMoePdtR2JnPWa4ovIUXdgIeM3fE/EQWj4vZL6TEhTJIde8gMJPOkMwyw+aU3LXQxLRddtjNvU6pyBE/jqEtmckLDNCxEczx1vctZDMaLOenIBcje9Y3eZ4/htlFDlO0jg2DG4ymn80sLo9t23Ox9QQPTFo5u/c8LgsTLUNsGpiJrmD1DyZFpDnHRcatL3j+cK8tN/6I+EuAsnT7EX4XUfeTCyGqlYTk78vtU487fXeXd/xwW/gxNZaJbY9KemeUs4fnroKQrQ5VIj1q6Enlwy+ahCAsVV3N5U+39HIGsYu3EpfnX/+b4vqskH0eum+3cTO+0GYverMfREuxAshVb8zUFU7gp9brqjf2WPNcjUYInW/dvibKx3lK4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 154eb920-7745-4adc-775d-08ddcb3005fe
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 04:02:07.6839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7joZ6V4r8hk1nWxc1kCYrDFd/jLKqrY/BJtYBuqkL6fDvWo3EQPb07ji6tuum6CVfHbJtRTcK9IJspLPdUY0iyIOQJCn+bNPcQM7iWfaCo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8735
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507250029
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDAzMCBTYWx0ZWRfX0nq8V0LTcRUb
 lcMTLLuVdUKIXe8dFGGGBTmwgPMA5MGgCOiJQ5s7W+WWfJi4zdogE0iSxLUNLI3YAEIAlPkGGWw
 cJboHoX/wkI4QIHPcttngWZ4zkkzQhFymJ/QbkgTnhmSHw8IuQA/AIAIPB3NAPQErKXLkSG8AYY
 jr5pLePod8N5kBf/3KHDBGQUJG9YFdw/6s+fV36dPqaBJ9mZZOzn3b98m4JmxzNdWFZ7fUZTxh+
 HGtkBfviRTLfD7z9NVJyuiv/bHln9ZNZt/b6D21z62I6OaLrCLJEs3usFvZKkKPw+Nxzq05hsxX
 tBW4l0NbZInUt846Vv+BrRXoS6wnBvGX6Ja/Wh7YN4j4Y7tfCmbMLKyxURoBrV7C3hnebMqYjlV
 0pqpiABkawMv8+m+d82auCJIv7PQsAvLrBifaPs7ASwVVH56Rsh0sHGMrCaI788l6a4JGglf
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=688301c3 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=JOUhddOknQ7eNWvmtMAA:9
X-Proofpoint-ORIG-GUID: sX1kAuHhvkyPfamr66y6-Ca-qIJhUqLP
X-Proofpoint-GUID: sX1kAuHhvkyPfamr66y6-Ca-qIJhUqLP

Commit 35989b43 ("spec: ensure the include/dtrace hierarchy is included
in dtrace-devel") assumed that the include/dtrace hierarchy was actually
installed with 'make install' but that is incorrect.

Now it is.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/Build | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/Build b/include/Build
index 84cf11c0..706e1ed5 100644
--- a/include/Build
+++ b/include/Build
@@ -5,8 +5,17 @@
 
 dt_include_DIR := $(current-dir)
 
+# Header files that are needed for consumer development.
+
+DTRACE_HEADERS_INSTALL := $(notdir $(wildcard $(dt_include_DIR)/dtrace/*.h))
+
 $(objdir)/dt_git_version.h: $(dt_include_DIR)/dt_git_version.h.in .git-version
 	sed 's,@GIT-VERSION@,'"`cat .git-version`", < $(dt_include_DIR)/dt_git_version.h.in > $(objdir)/dt_git_version.h
 
 $(objdir)/include/bpf_asm_helpers.h: /usr/include/bpf/bpf_helper_defs.h $(objdir)/include/.dir.stamp
 	./include/mkHelpers $< > $@
+
+install::
+	mkdir -p $(INSTINCLUDEDIR)/dtrace
+	$(call describe-install-target,$(INSTINCLUDEDIR)/dtrace,$(notdir $(DTRACE_HEADERS_INSTALL)))
+	cd $(dt_include_DIR)/dtrace && install -m 644 $(DTRACE_HEADERS_INSTALL) $(INSTINCLUDEDIR)/dtrace
-- 
2.45.2

