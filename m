Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106402405F5
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755203628; cv=fail; b=TpZUkLzMO8W7azvjLVAWe5PX4vukPqUD9o2OYrPgdx4ApFs/kB7WLsVibxwYVJXz1Mmkl7iWiBt/8+jRuLZiCU+22Pc/sdxoV1Xe4QkXLW5WqH4Iy0N3hUaObqvJUv4LBUFaRPL0+wNkuxAQa2BidZjZIVrNTHf+qoAvkbazZwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755203628; c=relaxed/simple;
	bh=F+BRUC+oNd3wvM+ZsKj1WLoduIG2tiXNjdPLvZFitqY=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Jql4Bk4TUGg7GexIb7+5w4IJ+73NjYW2wfZtdxLSmG0e70Wlr4rEfr5ZKlySR7SKGwT5VE+mp+89B5JROH6j6jyWlVzI9bkHYXk65u3C/pxCQ6DNv5X3fAvNYOl1aPew//3GC0L6CixIZht07XM+bTwO6ZjE7o/ftbfsA6u93DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OEijrITq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Jjnu5ZFT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OEijrITq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Jjnu5ZFT"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfsR8018462
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=BrHDRJUdYagraHulXyJiqrauQMUaQxAEznIB+CtSiTY=; b=
	OEijrITqP3cfWPTYO2yG6kHxSJoWrErIAeg2v5+Z/VyM9dJYMmfnrgrN2H9zC+wT
	PvIlssjWHv/RXavBG2IafvJDAY+9hvNeBFoetfCxO+g+R1l61B0+veefylQVXs3M
	5cVSBOMCKDKa4Bjltz1EOXB/mq3z+oLeRm31qZXg6eTL3rxVf/q6tRfkf+VdHafM
	LTcInkmpxRPT78kO+61+1KdIQ11p31kmflPJgZAGSrK2IeQW4Fv21fLXud/l1Bbl
	PvklvK18gw5DIQYKaB/xI4lYeUYKSqdpNxPFwDeqqeGislKczRBaeIBHnKkh1a/F
	GyjpIjr9i4S5nflLAithbA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guchbcc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EJ1UcE030019
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd7ebt-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:33:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OP4MMHkR5wknWzES+hnTXqRZrOBOfQEy+1smykGGLhI/l2EFur9MfjuC6MZ7puCiR7P6gaIYmft5C+SSp3ASiUZ8DDH9o3bSAFnaU/DYLSTih1QOWlIJj+q+i/Cb2m6ChlB3fRjU/Fq6lT22Ob91z18k4AQpg/cVND4fZ0PyW4BusqF2imNGvclaHF9oYPqW5eALDlXN6HNr07cvxjM9em1xXu3gqRfyEIIEaIimthW/UIRT2tl597dlkVdoHMCa8yamMyDM9sAyX6JfXnjXcnuq2BLghSP1kWnI+DxvDUkXGMrBj8IguWngbeltWYAR01QGgdUVwJjLzMDJjo8pdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrHDRJUdYagraHulXyJiqrauQMUaQxAEznIB+CtSiTY=;
 b=xTXUc6uIUDYEYe0cj7UO3er/0/U6jrfuKKKygZPJgS8e5xveq6w9BAkxRTFFyFfbV0Ct+Ay4he+CqvdN1HjDY8cmU27iyHhCGV+W0pQTTVXwJGKpYVCDv61+c4S3pF11dKFcbZBapZSLD1vPsQjjXmfR/bIkY1LI2D7wFYiYRtSbtfZ3Buv1zjzJOo0Zn9HixxKGuhEJoyiDGEETQXu793q8UAKfmN/uM1rKRFNvTAUHZc5TfE0e3tW3iuoLq57j2U9g+AlAnSkyHQ/vb2mSENJSQQo8fZoOX451LDnjK4PK8wRhtkzmRqjs1kh6vN3l2fHhwqUhsd7o82heXtOEAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrHDRJUdYagraHulXyJiqrauQMUaQxAEznIB+CtSiTY=;
 b=Jjnu5ZFTdy3iDss6ehXVdopqOX8S9mEYhW8AzfR6+NviQEqV/d9n+4SpYBQHcBvzT92yIrWPTWprzUcF1UgBAs9EsBguLAD8aCIz5NuFntP53G8BgI88J2C0AVqOjnKQ+GtQmnizXeNwz56gxphwK+zpXCycMsPX+figQQK7Aew=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM3PPFA632C0238.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Thu, 14 Aug
 2025 20:33:38 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 20:33:38 +0000
Date: Thu, 14 Aug 2025 16:33:37 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 5/7] string: ensure string size is handled correctly
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56727D85238D96378BB2542EC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM3PPFA632C0238:EE_
X-MS-Office365-Filtering-Correlation-Id: 0872ff43-d775-4f77-1e35-08dddb71d98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QKPc+8Ip6AF2/RP8DJ4WVOHjmM3bjB6u93Y+CpX/OekGzjobG8ngHsfafCPt?=
 =?us-ascii?Q?Gt76IexNgThuWVqmmN4B/1wXh8VLOgDfX3gsK9bUupG2Dd3cUKUU9jxg+Foy?=
 =?us-ascii?Q?ht1h+9v2keZ1k6M2FZC+mZCSZJ5RRviv/gge7dCpZV7Bb1I1pVW/wAp7HjyM?=
 =?us-ascii?Q?cTZZB++/chCpm0d7jUK223hKivmiXFNXm+zxIpQmyqaGl/Ta99MItJUCQHLI?=
 =?us-ascii?Q?qQSg1OFeuKyld1ntb4gp+HRTEv2zcYZZfFu6E/XDvSq+5i/N/BzDLBsHh90F?=
 =?us-ascii?Q?siKZa5XZMt+263CI8lSO7SxlSiChVOs52rZZ5ufncH6x4evldTe9aJgI7ctI?=
 =?us-ascii?Q?QDpbs2yN6zkTZYsLOEB0804HmX3Zl8ilY7O2Z/9gsYNkqGNVsw4VxOagdPzL?=
 =?us-ascii?Q?B5si3dr0IPBS7gpDkdT29bArE794otSqZGahITG7us3e3hZCyAu5AhOHPdkX?=
 =?us-ascii?Q?3weUBRzWMXjbqn8OJTZY+jwgKt9347jRhqlNl/MovIm+LYXTmx5/xYyvbXD9?=
 =?us-ascii?Q?inhhPuV8oIGOF0XyAyS+ZDQNGqRhrBkphTDt/Xt9/kHj39V3cpR0GmzUSraN?=
 =?us-ascii?Q?tzQGvEprfBRMbO8+UarWo3mPB3e0W9lJAMdLV9YbYDB1XLeo2GiFFaqG5VJi?=
 =?us-ascii?Q?4VQAMxqb1ksKR08wak1NIkvhUNvoGn0U+DoytxJmN2snByPcb+ih92zAcpNw?=
 =?us-ascii?Q?Jx1DKnN8PXX/mILaCfaQ8MLrbis9GA6IZzrQwpnBy7QV6fvY/R0FTCsxDGEQ?=
 =?us-ascii?Q?Y5Lx/Boi6WXWuQ5xIYLZvKRe53IXTH+4G4emnGdff/W6/zFe7W3WPmwHdyzN?=
 =?us-ascii?Q?RvpUiD++aoqSkBtNXh1FlTXXjFEacbW1VTSwyWovZnJi4bQ+my7UWmdDkiKg?=
 =?us-ascii?Q?lQ/sLuFxLY/ZxE7EpNnZ9yRAr4E1DWdbWf+GjmkWLqtw7vzRm2Guu4dqkiED?=
 =?us-ascii?Q?72mWQ7lQLI1bIKinTCW7jm7bTDRauWrh+WiixvFG1hO8eQOKIOT+jgbHvMb2?=
 =?us-ascii?Q?KGOmto/rFisYkcMgdnGskmgNnbzHOtrMo+GhueKkegJ+7G0g6fncGTnrxRzV?=
 =?us-ascii?Q?hAy9yj/b2QPqEFYyQillvTg+KxjW6D9qt/7ckkrzPMph/yn2oFISaYAqwuVY?=
 =?us-ascii?Q?9slwYWl3c3hWLY221wn1BLBJ4/mtLTncfarm0LNupr5mlNpFbIeoMFIUNcGM?=
 =?us-ascii?Q?VtJKiJuVoG8JaQ6Tp3FxFv/R5859ZRAJz8RRCbnCVDBuqwkUFni0zXqXVsBr?=
 =?us-ascii?Q?PDHgTGkyTpLrdFHB0NK6rrhr6lIaUWNRSb9XnQFJyE4dZrcAtAcDc2OSpPne?=
 =?us-ascii?Q?KrOLfwkNHlB1cn6YVpk+bo1GrqwDx4qIZRyfjDP+J0DP4C0NurGVvqXHedHf?=
 =?us-ascii?Q?3TLMWBE36uLKybh0ocVvYxdvF7dJFOlgd6lqfFooh30EHbd4eZZDEB2iP4St?=
 =?us-ascii?Q?V9WrMggsUhI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nnFIecrq/0pdPFjHF7jrI1tOves2Chl2Yksk2cNNYSvQ9cCpN5Mj73HOB9hA?=
 =?us-ascii?Q?ggIRqDMAm2zUftZ+RoDuNXEsYjWQyY4IJJx1RWgUPbWnzrIewc5f8GFlfDxl?=
 =?us-ascii?Q?mmJQwU1DQ67+0nP07/mOej4c56wIgtoPZBuc3kwMlGizOdC5tIj3MYfXOBL2?=
 =?us-ascii?Q?rtFpF+ZBKar3MNbhF+kQYuE0U0UKbWOPFxxUMd4FftEmC9OHtFEolNJEuZTz?=
 =?us-ascii?Q?KvDWY+XexWniQ7my3qrdyKYgI6tmAs+1F56pX6+iLs/hCBvBJEowMUWrdrDL?=
 =?us-ascii?Q?OjNM/IYcj8Q+pQEpu1Ujk30jehAjWbhvZwDUVmjm5vCgQtONXCKTRHhggilu?=
 =?us-ascii?Q?uQi6Ai2A/dehQ79AXeuEp7fBkukancXuZDMtU5eIL6IrE+CD0oddDuYC/ddS?=
 =?us-ascii?Q?M/J1JVfNCfndj2kLcD9/G4fiohU8V1HkkA6gMahpcGjr8px2Jut/PufJlA1E?=
 =?us-ascii?Q?aEPQzamld24hxtfrkk13eWzAx910Juk7K274MRtxaHytHJmxXQAzFPNwFaeW?=
 =?us-ascii?Q?Jm1dWH39ccZBh2EDg+3TcJKlOer3gSxAh7QgpESmW/JI6Tuzm5AmIkQ6p7q+?=
 =?us-ascii?Q?0BJ2IunCSah1CnqtLmSwiBrjlWywhUROQ3eYB3N/qRDBrMMiWLYER8mHrCis?=
 =?us-ascii?Q?8/VffA2CXtuaQelA5jwNVIs6w1xoEN1I+aqBeoWsHf5cdp8WA9MaQR6xBp/3?=
 =?us-ascii?Q?VZEckh4XjXItBvKnslqfvpZ/y7S9Vz1/5aP5oNRQQSIA640SmdUvo4+iSgYK?=
 =?us-ascii?Q?VqSgcLp4J9cTH2eGWVKDEi4GID0QZe895wlmU2PrkRy2Sl221HCP+BLjw1bd?=
 =?us-ascii?Q?PLO+nBLoE5D68Tn1EBN+G+uDJnDBDWO4YYRedhvk1d9io2Z+1OsYgquQ/7D/?=
 =?us-ascii?Q?ilVR+C+YWu4kwI2lCQgSgz5c+IvTiPGtc8LUW4QpeswTg9I3aDCDlqo5e85N?=
 =?us-ascii?Q?beFwxAl30iliaAWSZAVb6812nmCNyra85KizpH8EDnTQhhMBDpf8s+BITc4c?=
 =?us-ascii?Q?apYp3uF3ec4FgXCIWDyTviRUZxsqA0cJBMKlphlAgkOhWN6dIa6GSaFUBeRK?=
 =?us-ascii?Q?whoYgUK49u6pGxKnKP+mgMWWipYGtg32SvSo2qbV9GrAd/vLhKxDxiUu7zYu?=
 =?us-ascii?Q?fo5nxnBzbrOprjaoD/a3/g6G0LZJd+R/POpDri7/e+7Whsc47ve1Y1qnDh6c?=
 =?us-ascii?Q?u1RZflaelNAaAJo5MeB7e7vA2Pn6R9zAaABZsYM901zUk0jk9sjtLHhm6as5?=
 =?us-ascii?Q?NBoZk01MDPXyODKaT2ceGXFQPJKpnAieJvJ7Bbxz+CoSwhjIW5tfw3s7aAuL?=
 =?us-ascii?Q?nHMqjBOd658ldOINkhDmQchERgYQ+Blo8ecoNvVzriiGPTSoyBWkda7uJRPa?=
 =?us-ascii?Q?CgtILFJvsY/MSf07iDzQrSV39PrZQGeQrT0ndCqeQEC+opFbigiNAU7GjINT?=
 =?us-ascii?Q?ruSnDNH3FTRSCpIYg5LhwSgQyQ/BUajEtUPjXkYYTgTJiBhKc3Ktw8a+G1BC?=
 =?us-ascii?Q?Ema9OrQ6yGqYM59HnLmq5Qb1Zqw487Cz6bubaIFrCVOjtcPWfQ2sOmAaXd9Z?=
 =?us-ascii?Q?xl1NX+LG6GL4tALVB8zb+Tr0GAxF7lRAZD5zXFiAUWJjN1aV5gjNpvGVlDJe?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	64jlUhN5SroWWoZD3byRr+/qxGI3WmRJpsXpryhw0sX55Tze2OIHw4as36Vov+P8A2HKrxhi7pn3o9nuQBZQOtreDWqxCCp6+o791kuXPvZSgb6bvpxjqs4t+IMGOackCOJ51vZrvF8r2kezUPHopuzaeSOY/q/dvzyxBbiRU9G+MFhaAw7AgszuxgMsy0TNVjBXdh9Qd+ENm9yElD4SqIUN8CHz9DCoAcOlq+NwzRNW2UaXnWCV5ghFqqILo3yGwFWyyXs7xGVoOMOuPTTm3kdC8x9/O0Txbpuh+F9Rc17/xqp8YjUDmm9aCU96/+ge1A+tAYcOthQUBQ2v85r+qsjEdD3VSq5jtwMPN/cFjtGOsrS33wZbsD+HvuiCXwSrla5S73/S/R0w1rmzvbrxlW+PRhWGkF8Ej/3hN/gno0FYmJS8G19bOdJi04wbteAgq/bBcXpKDtYxfz3qV02rOXeTQzDz8OnDUYGbY0q5AknWpnX5X83OINy3OlMwzIZGkn3IriCgJGinYhBRKLYUsKa/G7FeJPSumie9BkZXsm9j0YSCV7tUS4XSb+Px7E8eDZ2yTFS8wgTssE+WfL5vZq3yaM3l5NBTcKWqcAW/bZU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0872ff43-d775-4f77-1e35-08dddb71d98d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:33:38.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpFNUqRnbw9rmMJKCLO6t6o14/oRCNDsfco1oxk0k5Zywi6FazMedo5iMEEM0D/zZAJL1SUW2gSXTnOM+o5TE7KD7+6Med5Pgq1bRB3CO5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA632C0238
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140176
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689e4825 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=GP2RWJTptT99kr5Y_3wA:9
 a=c4aZcHS9YNZo4y4X:21
X-Proofpoint-ORIG-GUID: F3z4PmUeyqb8QchGf9pTe6EJy2HEkgOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE3NSBTYWx0ZWRfX4K3HTjHu4NMc
 dBjR3tyUgdrrRqdqLBhKS6S81IXBtqw+EFFZaKbdNLzt/a7jisIvsD+uwCsoqWRb5fwjucGfL54
 8uw1lQS/oQPLXmHaVK5LsjIT/g8udaqzcXUNc/SJW9olQ215yoZsO46TcayClqD3uIVNodilIjO
 9xNf7KzuSen7EPC2sGN+jPnlQ7Cf+uONfC3MjOmgWB5Jsf1KKF0t/3LO4E/RMdklHEtDhQ1BBVI
 xQZFRFPNKA4Qa/uAFJO6Lxt5qtkF1rdZ3gWOTVHygymNd46JcM7fBOb83bcx3wCSyoXKzXLe7Ik
 m5WKaCl8xU3mga6wzbxjW9AAgB/S+9cfkp+U8x4Uwzmsjz7Jbi2j+wHga1ls1IRi4S3ddm/KQY1
 b7j5kbIx+/If2RUERlE+B9D+qDkV6iGsP0wpK2N8bYgTrYvJ7jEdyMr423h7HP2gjTr5Q0sr
X-Proofpoint-GUID: F3z4PmUeyqb8QchGf9pTe6EJy2HEkgOh

A string is defined as a character array of size strsize.  Strings
that are less that strsize in length are terminated by a NUL byte.
This implies that the NUL byte is part of the array and therefore,
strsize is indeed the size of the array and not the maximum number
of characters in the string.

Tests are adjusted to reflect this behaviour.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c                                    |  4 ++--
 libdtrace/dt_cg.c                                     | 11 +++++------
 test/unittest/codegen/tst.str_const_length.d          |  2 +-
 test/unittest/codegen/tst.str_data_size.d             |  2 +-
 test/unittest/codegen/tst.str_store_var.d             |  2 +-
 .../funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r      |  6 +++---
 test/unittest/funcs/strjoin/tst.strjoin-bordercases.d |  2 +-
 .../funcs/strjoin/tst.strjoin-capped-size-2.d         |  2 +-
 .../funcs/strjoin/tst.strjoin-capped-size-3.d         |  2 +-
 test/unittest/funcs/strjoin/tst.strjoin-capped-size.d |  2 +-
 test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d     |  2 +-
 .../strlen/{tst.capped-sizw.d => tst.capped-size.d}   |  2 +-
 test/unittest/funcs/strtok/tst.strtok_long.d          |  4 ++--
 test/unittest/funcs/strtok/tst.strtok_long.r          |  4 ++--
 test/unittest/funcs/substr/tst.substr-stored-len.d    |  2 +-
 test/unittest/funcs/substr/tst.substr-strsize.d       |  2 +-
 test/unittest/funcs/substr/tst.substr_nonDPTR.d       |  2 +-
 test/unittest/funcs/tst.basename_nonDPTR.d            |  2 +-
 test/unittest/funcs/tst.inet_ntoa_nonDPTR.d           |  2 +-
 test/unittest/funcs/tst.lltostr-short.d               |  2 +-
 test/unittest/variables/tvar/tst.str-size.d           |  2 +-
 21 files changed, 30 insertions(+), 31 deletions(-)
 rename test/unittest/funcs/strlen/{tst.capped-sizw.d => tst.capped-size.d} (94%)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ddf703ddd..31781ac9f 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -910,8 +910,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
 	while (buf < end) {
 		uint_t	len = strlen((char *)buf);
 
-		if (len > strsize)
-			buf[strsize] = '\0';
+		if (len >= strsize)
+			buf[strsize - 1] = '\0';
 
 		buf += len + 1;
 	}
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 88dddb087..cd9e7f4e9 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1741,11 +1741,10 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 			dt_cg_check_ptr_arg(dlp, drp, dnp, NULL);
 
 		TRACE_REGSET("store_val(): Begin ");
-		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1, 1, pfp,
-				 arg);
+		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, 1, pfp, arg);
 
 		/*
-		 * Copy the string data (no more than STRSIZE + 1 bytes) to the
+		 * Copy the string data (no more than STRSIZE bytes) to the
 		 * buffer at (%r9 + off).  We depend on the fact that
 		 * probe_read_str() stops at the terminating NUL byte.
 		 */
@@ -1754,7 +1753,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 
 		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
-		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize + 1));
+		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize));
 		emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
 		dt_regset_free(drp, dnp->dn_reg);
 		dt_cg_tstring_free(pcb, dnp);
@@ -1765,13 +1764,13 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		/*
 		 * Pad the rest with zeroes, if necessary.
 		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize + 1, lbl_ok));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize, lbl_ok));
 		if (dt_regset_xalloc_args(drp) == -1)
 			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
 		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
 		emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
-		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize + 1));
+		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize));
 		emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
 		dt_cg_zerosptr(BPF_REG_3, dlp, drp);
 		emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
diff --git a/test/unittest/codegen/tst.str_const_length.d b/test/unittest/codegen/tst.str_const_length.d
index 1c58ba13d..bfdd00a2e 100644
--- a/test/unittest/codegen/tst.str_const_length.d
+++ b/test/unittest/codegen/tst.str_const_length.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=5
+#pragma D option strsize=6
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/codegen/tst.str_data_size.d b/test/unittest/codegen/tst.str_data_size.d
index a928e8299..c93174a4f 100644
--- a/test/unittest/codegen/tst.str_data_size.d
+++ b/test/unittest/codegen/tst.str_data_size.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=5
+#pragma D option strsize=6
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/codegen/tst.str_store_var.d b/test/unittest/codegen/tst.str_store_var.d
index c14714c01..cfd37404f 100644
--- a/test/unittest/codegen/tst.str_store_var.d
+++ b/test/unittest/codegen/tst.str_store_var.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=6
+#pragma D option strsize=7
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
index 5e7d49b03..8090daad6 100644
--- a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
+++ b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
@@ -1,8 +1,8 @@
-fe80:7060:
-1080::808:
+fe80:7060
+1080::808
 ::1
 ::
 127.0.0.1
 127.0.0.1
-::fffe:7f0
+::fffe:7f
 
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
index 253b2d6ef..1ac5ffd12 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=5
+#pragma D option strsize=6
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
index 625c786b6..44a6acd88 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=6
+#pragma D option strsize=7
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
index 52718325a..d2982a70b 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=6
+#pragma D option strsize=7
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
index fe5b323f7..b54fd2f29 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=10
+#pragma D option strsize=11
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
index a1816f975..2b700a5a8 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=14
+#pragma D option strsize=15
 
 BEGIN
 {
diff --git a/test/unittest/funcs/strlen/tst.capped-sizw.d b/test/unittest/funcs/strlen/tst.capped-size.d
similarity index 94%
rename from test/unittest/funcs/strlen/tst.capped-sizw.d
rename to test/unittest/funcs/strlen/tst.capped-size.d
index 4e473236c..676ed185e 100644
--- a/test/unittest/funcs/strlen/tst.capped-sizw.d
+++ b/test/unittest/funcs/strlen/tst.capped-size.d
@@ -11,7 +11,7 @@
  * SECTION: Actions and Subroutines/strlen()
  */
 
-#pragma D option strsize=5
+#pragma D option strsize=6
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strtok/tst.strtok_long.d b/test/unittest/funcs/strtok/tst.strtok_long.d
index 1fbe415dc..254a65485 100644
--- a/test/unittest/funcs/strtok/tst.strtok_long.d
+++ b/test/unittest/funcs/strtok/tst.strtok_long.d
@@ -9,8 +9,8 @@
 
 BEGIN
 {
-	/* 256-char string ending in "XYZ" */
-	x = "_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
+	/* 256-char string ending in "XYZ" (255 chars + NUL byte)*/
+	x = "____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
 
 	/* check whether the last char of a long string is seen */
 	y = "a";
diff --git a/test/unittest/funcs/strtok/tst.strtok_long.r b/test/unittest/funcs/strtok/tst.strtok_long.r
index a752554e8..4b172ca1b 100644
--- a/test/unittest/funcs/strtok/tst.strtok_long.r
+++ b/test/unittest/funcs/strtok/tst.strtok_long.r
@@ -1,5 +1,5 @@
-_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
+____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
 zyxwvutsrqponmlkjihgfedcba
-_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
+____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
 Z
 
diff --git a/test/unittest/funcs/substr/tst.substr-stored-len.d b/test/unittest/funcs/substr/tst.substr-stored-len.d
index 97d2b0f61..fa3e5337c 100644
--- a/test/unittest/funcs/substr/tst.substr-stored-len.d
+++ b/test/unittest/funcs/substr/tst.substr-stored-len.d
@@ -13,7 +13,7 @@
 
 #pragma D option quiet
 #pragma D option rawbytes
-#pragma D option strsize=13
+#pragma D option strsize=14
 
 BEGIN
 {
diff --git a/test/unittest/funcs/substr/tst.substr-strsize.d b/test/unittest/funcs/substr/tst.substr-strsize.d
index b4d0cc63e..04eab4297 100644
--- a/test/unittest/funcs/substr/tst.substr-strsize.d
+++ b/test/unittest/funcs/substr/tst.substr-strsize.d
@@ -15,7 +15,7 @@
 
 #pragma D option quiet
 #pragma D option rawbytes
-#pragma D option strsize=13
+#pragma D option strsize=14
 
 BEGIN
 {
diff --git a/test/unittest/funcs/substr/tst.substr_nonDPTR.d b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
index 9d847ab6f..3e10af08e 100644
--- a/test/unittest/funcs/substr/tst.substr_nonDPTR.d
+++ b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=13
+#pragma D option strsize=14
 
 BEGIN
 {
diff --git a/test/unittest/funcs/tst.basename_nonDPTR.d b/test/unittest/funcs/tst.basename_nonDPTR.d
index 4f93685f7..cecef827b 100644
--- a/test/unittest/funcs/tst.basename_nonDPTR.d
+++ b/test/unittest/funcs/tst.basename_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=14
+#pragma D option strsize=15
 
 BEGIN
 {
diff --git a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
index 500c53e86..f079c7ef4 100644
--- a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
+++ b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=14
+#pragma D option strsize=15
 
 BEGIN
 {
diff --git a/test/unittest/funcs/tst.lltostr-short.d b/test/unittest/funcs/tst.lltostr-short.d
index 969045667..65a5714c2 100644
--- a/test/unittest/funcs/tst.lltostr-short.d
+++ b/test/unittest/funcs/tst.lltostr-short.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=7
+#pragma D option strsize=8
 
 BEGIN
 {
diff --git a/test/unittest/variables/tvar/tst.str-size.d b/test/unittest/variables/tvar/tst.str-size.d
index b4ab6ea2b..bd8aac132 100644
--- a/test/unittest/variables/tvar/tst.str-size.d
+++ b/test/unittest/variables/tvar/tst.str-size.d
@@ -12,7 +12,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=4
+#pragma D option strsize=5
 
 BEGIN
 {
-- 
2.45.2

