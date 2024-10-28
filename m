Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CA418EFEB
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147788; cv=fail; b=Cw8KHPiKgFi96hdjUk1gg8oaLwL7BV1hqN8cmlx3m2PDeGChxDrbFfegz6Bqa8kGjtRfmm2RynM4xb1dbzgXeBupd4g9Wa2rcLFMDND3hXHO4/Sdd8AtW4D4BRpkpIPIilEBIxYQAhWbONjveyyd6CBvvtRQqWCrQl2RFDmO80g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147788; c=relaxed/simple;
	bh=clwaHwCL6+6ITvUabw/RCy7ZzF87FXc9JWSoZkd25M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eBGjSW4tziWJ6XBaFxiO2d/9crUVdB0ENRQ5wHvSoV+QU++K/htyXONJkFxHBa+o1M0mllZEQuyR++h/QauG/kTjMZGQBQmJWK/MPvgQCoHbW9/AeCTm4btwaAT3xK5wvuYN3S6CA4Jl/aoG3SOJcpqHIiN3Q8WEk0ysEplnl50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Pi/YBLJV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ps/Utm/O; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Pi/YBLJV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ps/Utm/O"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtdte031463
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=BofLkwZvZYRVUqEX/0
	zJubOGlAyo0EIOKzl4X22jH+g=; b=Pi/YBLJVzXORlYqVTXz9WhxXiIYZIFril3
	ZxQuadaZ/m55z26eYqczOfLAXjlhHFMMq8a9liQ5SZ0wI4ti21GzznBkb4kVx3zc
	o9BwaSpoN0kSi0PYP8zh29fhoNru6VjwDEN6I+4VlCUuoxL7uMIAtnRZFqif/JVD
	jdm8N8qP+WmtS/g+eYfKDlNGtZT++GLoEG50FTVbWppRJVFVkUTcTvzGak601BVe
	Vsr2gxIei96PvUXsKskifaFeg85qMQz5y2l/cEF7EEDAMEHu3/NBc7QRqT9wFdgl
	e7B82kKvDBSOEXlAhqP1Fi/pdj0/zJMsXOI8tttTLkGwAykENGiQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxkxk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:36:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SK7xFA004209
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:36:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2t5nw8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:36:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tgf5ONr0zKCfHpOp+y7zNZCONxlSYjjsNKNwmKWIz2apE29y1vrzI8dvY4C31foGO2PHV0hzyH50fGrYMvYda9enzpqTGDaNUXcCx0VuTelxA9MYMh1FFfoG6c0r/fdXxFT4jO5nz3V34iPPeD45IxsrEKa6zjIu6hDMekroMUscwx4QMW2qGlHY15ZwHOcvetCX7EenHVKwhuPKihBcliufcbKzz4UgI9luoth1Up4MgEjyJB694B6OXOnads1ZAVZCTPe2OE83qm+ATr4EsPyusQ0sj/CKHZ9WZP3UvgeQXo38dEwPVTDY2H90AQ2b2djCDzE6Kj66Fq+FiA6AZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BofLkwZvZYRVUqEX/0zJubOGlAyo0EIOKzl4X22jH+g=;
 b=k8LgWRm9XjY5kU5XXqKIkXCPmt2FOQ/ofQrZ7mmVflqb9bfLDFcAdfQ3Oy7otSVDcX01yr0wPNPDjaYtHP5oW2TSosEuSwIWSjxOdaerDPgi6nHKBansFZXMX0zCxK+mieJSz872fIaWLWZxh4Jpo8MfQlmbkqt85jS0zAfhJPmx3oPVyqLJMQ2oXckKx1WS2JkegEWYHbmk19VqxsSKSN37YIoc9P+X+d8vzOfFK+nutM8Iukntt87ygHZ8kv5uPbrr4El4aB2EP0aNhWttiYEGh0R+/bLYnO+GsQhZChByesFe7i2eUB90HqGIrKqZkVtbn9Httf9l7HUHgL8CBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BofLkwZvZYRVUqEX/0zJubOGlAyo0EIOKzl4X22jH+g=;
 b=Ps/Utm/OJdeiuLi26NbPpfEWI292Meg+pP6XVCioomTcl6PFWKteNGdPL3y0aS2WEIb4dmkHX64RxUdXdp+eOoooux1k82HIYdGAq1Gzwc9Zkp5Is9XlABY+RtcQqPVYz0R14ny0QR9u6FnHzt/e+aQMkqG3IK+GPp1LedIhbN0=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CO1PR10MB4676.namprd10.prod.outlook.com (2603:10b6:303:9e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 20:36:21 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 20:36:21 +0000
Date: Mon, 28 Oct 2024 16:36:15 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 6/6] test: Add USDT error tests for -w and -Z
Message-ID: <Zx_1v3pzaAlX9FSZ@kvh-deb-bpf.us.oracle.com>
References: <20241004045508.26235-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004045508.26235-1-eugene.loh@oracle.com>
X-ClientProxiedBy: LO2P265CA0387.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::15) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CO1PR10MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: 627e3acc-e653-4166-62e3-08dcf7902ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sZBxVq6S+4D7ryWts+TrKyzoEPk+AVaVuZ5U+CLnCe9BRahgl1bapYtCDIia?=
 =?us-ascii?Q?E2hIiIamsO9u2Ex4lEjKw1UxJMJXsl6CVQJthWZTwu2RkbACzWsJfPpihdL6?=
 =?us-ascii?Q?tWMXaXu4D4tsFId0XlrdvpSM2M3LSACD9qvT3PKblsUuUmj6iXCJnqfJYDWm?=
 =?us-ascii?Q?K191YFTcesBkMOPEoCfFDC98KugjvDLondLgSMcxlM6DurMeX2NTeXUGWTbW?=
 =?us-ascii?Q?2dPmUBuiLcObxmhfDKKKU7fZM9TLmnO/8ga1wH3jr5Yv0P29NwyZ0NT87k6F?=
 =?us-ascii?Q?UZIvkza5xr+psNXBSiQbh7WLMliUa4NQeRmhcgSaDmClRwJSw8SLY2C/k6U3?=
 =?us-ascii?Q?Fk/PmJbPINUEKl5lzNfG8Fu7hulK+UWeCSF3OC04oQD17CXrgm3p+kVwcNzI?=
 =?us-ascii?Q?J719+ypfYp/4JAgrRuEG/IQoD+gDlCugyJ6T0CguIUS7PwEqTv/AGMvri7gl?=
 =?us-ascii?Q?SK/TVNMRc++Kdqxtr1gSl3SDaZzP/m7mZKrS1042Yey4VoE1X25OKO7csQ9k?=
 =?us-ascii?Q?WcjgpY0/pbynrOGWyjm5NBp6Ov00q/eBeiB2xnBwMH7tqk7VAwITsgS/9Omt?=
 =?us-ascii?Q?TgiYOAMvhbgoF9nGVW3F6ZZ5it6xzdirF9Y8vsiH6NIrp9gU4xW7z0Hlkb/w?=
 =?us-ascii?Q?gwEIUR4phcVWqNjTNHgdwuhDUVruYUvE8+0OGrYaCSDzAPAE0ISS0qqOizFy?=
 =?us-ascii?Q?ZkP7fHsnS3s/barI0mlfVfCc9vVogFA8CR31BdrqHPTTu/YyNTtLD+BBeFr2?=
 =?us-ascii?Q?hjYfguPn/UdFZtX9X7qt65EUK4KsfG0QmcRgvw38AccGCInfEd6UgNGnKSnQ?=
 =?us-ascii?Q?E9bEt6feA6516CgXs1aWHoHrAfEnrvgP+1XJcSTGPjjQZrFi/UBwthcYhfit?=
 =?us-ascii?Q?YR8Yj2cOhaaisfyJCpgPjSC1sK/HEJdtQJay2o+SaHwl5IbSqiMF1QYhU8Xi?=
 =?us-ascii?Q?PIXWBNDs7dN27YHT3QanxHIZ1VOBmj2/xalp/9cfoByM6UbSQc/AdUrsjwhR?=
 =?us-ascii?Q?C0Dc1d6GQyrTJgp7xeQtc2C5Cd/nHZY/YdL6vAoGL8XPR4mUUnHQ4+4S/FOv?=
 =?us-ascii?Q?bjg7rciePC4MRbuuPRAx63Y1f2dteqADiSEXQck3cg+AUYo8AX1sE/g6a0Tl?=
 =?us-ascii?Q?D0fC50vCBbI4Ey7lj/EptNldcKpjFqRhBWW/nGQ5+6wM95FVxeuB65rCcaLA?=
 =?us-ascii?Q?9pMCI8GGi7e2bxEUPw6cK9P/27MhwKAFFeHFfdwW/Cksn6jw3gpdTXCA2W4+?=
 =?us-ascii?Q?XytiFSxRDtpNSZsuzgXEFDSZ/38d53cL2ec6VqVdk8F8BRBNKM4jcXUs6upP?=
 =?us-ascii?Q?xx/XBneJkK6admzpZkPjEgMg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6/btPCuIZI6P1CrlqUEljHm/Bye5aeNmlCt1+2IrubUALEB3Nvu0rgM66Xbh?=
 =?us-ascii?Q?6tg1PhwjFunEllcRntH1VNACLLl7i/E1hfb+es/p+UI3y69/q/Szkr9Jn2Mo?=
 =?us-ascii?Q?AgdTZfEmWJxaXbcDWIkZ++/0XEa7vxz8V9tfOYt10LESXOTWA+Df0L362Tub?=
 =?us-ascii?Q?D6XWJOzStViWZkLxl67vQzIU5EblDhOOoPnag1SZNUjHF8ErB1L2IhPhePc1?=
 =?us-ascii?Q?FWE4CW7rrHhSm9XbBXD7bKHpoOFOiV9tpp1QZsyo1EwwLHxAaQsWotebo9ou?=
 =?us-ascii?Q?hyTDQv3Yh3nDEkBXtKrdbZWao1Vclpag1GIY90CaGGEiVcU15N2AJ2vVEHc7?=
 =?us-ascii?Q?a6DaD2ciB1xNyZ3jyi0mLSPS+cz/Xu6Lxj6guhEBmPB9vZF1Fvya+vJN8uVU?=
 =?us-ascii?Q?1pTsFWXcOoTL8TwCu5ewYE3Zm279JD2g+bd+vJme3ZGo9R/gObRtr5IVSrfb?=
 =?us-ascii?Q?oXB2zoHr7q5fQGKlzWoCvFUeFvbPpEKnoPwZflJDSNsvNBBvW/MS9nZYMxbj?=
 =?us-ascii?Q?dy2WkUe26XVvLrZ4vhrrm/BPL3+M4Vrt7ENEvaax8Vvx2ncyIK1kiegFbTC5?=
 =?us-ascii?Q?WDMZ6N/q3ylcvGsdgibbLmHnyyZe5ecrFHqSLj7GyDXWoUD974zD2Da7xGjc?=
 =?us-ascii?Q?T9tfn+9h+sT11zXLoKPP5nd0tCEBe88f0wLN8H8+a4d/iCAUVB3OymA6G3dP?=
 =?us-ascii?Q?X7oaECR2tvMpKbbPM0UJ0MSfQglKcCS4390H3AoX4W4uWU+IrtDlaTcsMNJZ?=
 =?us-ascii?Q?1BC6QTxmwJkanV7zFa7SMmok1VgCTu6VxHRpIG2/yeTiK74SqBiHtqrx/bcw?=
 =?us-ascii?Q?ZhOse8178/H6QsTYlu07HGVNLGCTQre8LYMVYPd9ahzCA9bbsHbojk+jzL6c?=
 =?us-ascii?Q?0uIvGOo6c2BSFyaZr4WBNVDT+k8WH5+BJ1+RHi7TG2C4QCpWJeLdhOQG5Bx2?=
 =?us-ascii?Q?8nPBcjuGi1aLxBAQTXwjHmU6vsuQn1aTDWo0nca0BDw/+TuM8bh27FzQLXnC?=
 =?us-ascii?Q?OXVe3tK7fiTdVRvOVr9spCHe75mK5JnKslbwz+Ne2BwRHlOApSTDkPUzAugC?=
 =?us-ascii?Q?yQ41p42MuLm6wvu9k/sMaY9FVWwqENnmeNzYGaIa8hHtSW1MDOCwmwddAf5H?=
 =?us-ascii?Q?oO6EamyJRrN/1jI8EiSJFA24EYKNmczQYtg6crxdCFQk7xgy8uAvt26XXcNQ?=
 =?us-ascii?Q?fwQzKsw+PU3jiMTyBA85yZcIjOxG5AvOzrJY0Fo4ouc0MMBrnI2ncfb5/aCH?=
 =?us-ascii?Q?6DEgvlOO5R+WKCk2zSGBN+0GAE2rYdzxvPF6v72xZBxxxwIZWEvvhAVLYq+L?=
 =?us-ascii?Q?WQkoleGl7C6DmfdJS85epqn3g2rPKQQNvm3CcEDS87T2csF9nK27D9A07Itp?=
 =?us-ascii?Q?jjT0q9DPqb3NjzXYM3LbCjAKvj92G0cju4n4MLOezzKPSoeEk9toL1VsERvg?=
 =?us-ascii?Q?6uHT8dwlcj+wPhSOFeRhqXl//JxsDbbAESmW2HENvYP7J24HjQnmNfvO3vt/?=
 =?us-ascii?Q?z1Za9jC66LK7oRbyPy7GUDNCl5LlYQVPKaBSlhbB+9whDlcISVae1Ao2Qkbp?=
 =?us-ascii?Q?Zjc1muB8zonU2c1JbfWIdNosk8P4RQNNkAkR84xqYsRiXYoPJbBTXm/kXW1a?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E5r4mNgB36VIMJPZYIxkdkfPLE4AjDhyZi0ciJiN++upNjTvl3dEGQKOBFLSG5koKFHc1bu0mYTCDXE01YZpb2n5/PqyxA/Ow00QnKQvk2oIECZ/xlIMQQfPUcJxoCTaxxccnPhLhbAhX/ZDaI4TCaFhxxfPuAi43vvQP3+DjHcZpb8BZgm9UDKK+cflGWDWmyT5cLHR/gcban6bULEpoAIcLMd8k+T7e3DRsoDK8qTsyos9EaA8hAD5otLIaFYpmMmzcuhjZYrrKsD4RHBAGY/T27s+4CXSFKlcML8FRA7QGk7g4dstgenltku/wtyGspD6fYpQ4YmNTzfrmYA5qMfmYNPd08tpaE2XwMoLx7e5xGG8whTw8Q9RBq2UaywETBbju8Y5SXae1tSzNP/IGENKnArKrS0+LxkSyvD86afZinYKNFt8IOc/ZySDnbgIHQCsFK75a4+Ejkg6GCDt7tyF5OPYuy07YEbgjJQ0DzAofx09GzmGh0/oiozUssaUsaH4EB/nFSL0wDUvyz/EVG5/KRXZM7IQa5hfqw8Bjy3mpt7BVwOCkmOZXzayBa1JyUdZsWg8MoPRZmJivEk8BJirH6IrNyoUrMIysbKsnts=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627e3acc-e653-4166-62e3-08dcf7902ea6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 20:36:21.0829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpsvDOwOhI3EbdwFzo8H+IuEIk3fIu17SXEEueLlE9sfsme54d3pY4GKzHyo42FXm3V75eGqKbZgNTy7iC4j/E7n5Z4cFpAnkN/XZsXPYkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4676
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280160
X-Proofpoint-GUID: rI50FV9BYPjS_YcLxmUE4-TWM7Lndexc
X-Proofpoint-ORIG-GUID: rI50FV9BYPjS_YcLxmUE4-TWM7Lndexc

On Fri, Oct 04, 2024 at 12:55:08AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Error checking for USDT probes can be different from other probes.
> So add specific USDT tests for -Z and -w.  Specifically:
> 
>     err.no-Z  No USDT process yet when dtrace is launched
>               and -Z is not specified.  Therefore, dtrace
>               will not start up.
> 
>     err.no-w  A USDT process is running when dtrace is
>               launched, so -Z is not needed.  However, the
>               action is destructive and -w is not specified.
>               Therefore, dtrace will not start up.
> 
>     err.Z_no-w  No USDT process yet when dtrace is launched,
>                 but -Z is specified.  So, dtrace starts
>                 successfully.  But the action is destructive
>                 and -w is not specified.  So when the USDT
>                 process starts, dtrace fails.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/usdt/err.Z_no-w.r  |  4 ++
>  test/unittest/usdt/err.Z_no-w.sh | 65 ++++++++++++++++++++++++++++++++
>  test/unittest/usdt/err.no-Z.r    | 13 +++++++
>  test/unittest/usdt/err.no-Z.sh   | 31 +++++++++++++++
>  test/unittest/usdt/err.no-w.r    |  3 ++
>  test/unittest/usdt/err.no-w.sh   | 31 +++++++++++++++
>  6 files changed, 147 insertions(+)
>  create mode 100644 test/unittest/usdt/err.Z_no-w.r
>  create mode 100755 test/unittest/usdt/err.Z_no-w.sh
>  create mode 100644 test/unittest/usdt/err.no-Z.r
>  create mode 100755 test/unittest/usdt/err.no-Z.sh
>  create mode 100644 test/unittest/usdt/err.no-w.r
>  create mode 100755 test/unittest/usdt/err.no-w.sh
> 
> diff --git a/test/unittest/usdt/err.Z_no-w.r b/test/unittest/usdt/err.Z_no-w.r
> new file mode 100644
> index 000000000..b81622481
> --- /dev/null
> +++ b/test/unittest/usdt/err.Z_no-w.r
> @@ -0,0 +1,4 @@
> +dtrace is running so start the trigger
> +dtrace died as expected after trigger started
> +-- @@stderr --
> +dtrace: processing aborted: Destructive actions not allowed
> diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
> new file mode 100755
> index 000000000..3833b4400
> --- /dev/null
> +++ b/test/unittest/usdt/err.Z_no-w.sh
> @@ -0,0 +1,65 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies that dtrace will not run a destructive script
> +# for USDT probes if -w is not specified.
> +#
> +# Specifically, the script is launched with -Z and no USDT processes are
> +# initially present.  Only once a USDT process is detected does dtrace
> +# fail due to the destructive action.
> +
> +dtrace=$1
> +trigger=`pwd`/test/triggers/usdt-tst-defer
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/Z_no-w.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Make a private copy of the trigger executable so that we get our
> +# own DOF stash.
> +
> +cp $trigger main
> +
> +# Run dtrace.
> +
> +$dtrace $dt_flags -Zq -o dtrace.out -n '
> +testprov*:::foo
> +{
> +	raise(SIGUSR1);
> +}' &
> +dtpid=$!
> +sleep 4
> +if [[ ! -d /proc/$dtpid ]]; then
> +	echo ERROR dtrace died prematurely
> +	exit 1
> +fi
> +
> +# Start a trigger process.
> +
> +echo dtrace is running so start the trigger
> +./main > main.out &
> +pid=$!
> +
> +# Check again if dtrace is still running.
> +
> +sleep 2
> +if [[ ! -d /proc/$dtpid ]]; then
> +	echo dtrace died as expected after trigger started
> +else
> +	echo dtrace is unexpectedly still running
> +	kill -9 $dtpid
> +	wait    $dtpid
> +fi
> +
> +# Tell the trigger to proceed to completion.
> +
> +kill -USR1 $pid
> +wait       $pid
> +
> +exit 1
> diff --git a/test/unittest/usdt/err.no-Z.r b/test/unittest/usdt/err.no-Z.r
> new file mode 100644
> index 000000000..52d9492ab
> --- /dev/null
> +++ b/test/unittest/usdt/err.no-Z.r
> @@ -0,0 +1,13 @@
> +expected failure
> +-- @@stderr --
> +dtrace: invalid probe specifier 
> +BEGIN
> +{
> +	exit(0);
> +}
> +
> +testprov*:::foo
> +{
> +	raise(SIGUSR1);
> +	exit(0);
> +}: probe description testprov*:::foo does not match any probes
> diff --git a/test/unittest/usdt/err.no-Z.sh b/test/unittest/usdt/err.no-Z.sh
> new file mode 100755
> index 000000000..29d63d9ce
> --- /dev/null
> +++ b/test/unittest/usdt/err.no-Z.sh
> @@ -0,0 +1,31 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies that dtrace will not wait for USDT processes to
> +# appear if -Z is not used.
> +
> +dtrace=$1
> +
> +$dtrace $dt_flags -qn '
> +BEGIN
> +{
> +	exit(0);
> +}
> +
> +testprov*:::foo
> +{
> +	raise(SIGUSR1);
> +	exit(0);
> +}'
> +if [ $? -ne 0 ]; then
> +	echo expected failure
> +	exit 1
> +fi
> +
> +echo unexpected success
> +
> +exit 0
> diff --git a/test/unittest/usdt/err.no-w.r b/test/unittest/usdt/err.no-w.r
> new file mode 100644
> index 000000000..7a4d60cd0
> --- /dev/null
> +++ b/test/unittest/usdt/err.no-w.r
> @@ -0,0 +1,3 @@
> +expected failure
> +-- @@stderr --
> +dtrace: could not enable tracing: Destructive actions not allowed
> diff --git a/test/unittest/usdt/err.no-w.sh b/test/unittest/usdt/err.no-w.sh
> new file mode 100755
> index 000000000..407654981
> --- /dev/null
> +++ b/test/unittest/usdt/err.no-w.sh
> @@ -0,0 +1,31 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies that dtrace will not run a destructive script
> +# for USDT probes if -w is not specified.
> +
> +dtrace=$1
> +
> +$dtrace $dt_flags -c test/triggers/usdt-tst-defer -qn '
> +BEGIN
> +{
> +	exit(0);
> +}
> +
> +testprov*:::foo
> +{
> +	raise(SIGUSR1);
> +	exit(0);
> +}'
> +if [ $? -ne 0 ]; then
> +	echo expected failure
> +	exit 1
> +fi
> +
> +echo unexpected success
> +
> +exit 0
> -- 
> 2.43.5
> 
