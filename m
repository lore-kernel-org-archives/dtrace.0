Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6F158520
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737065307; cv=fail; b=e5jsYBr+2C1OE1hhn5HxzZYdMJDKoQxm2YuUBiehUYfIVA5ZotZTTYPzzIT3oU2/fdWS9b3Tr0zt2eG11y/BBKNjdH8VX6pDEWRSExuW9gFtWOPPsclKJL9VSyI7EKn/TujVq+XGO8wglaQmUgAf2GKs9i7Z3gSBzIcwueZwoAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737065307; c=relaxed/simple;
	bh=uBEKOAWwtWODoHslEdNl9ShlO9HmE0bceQ6o/VmBdMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bCvpyKjWYNdd8X29kYLXZgr9VCChZagqkODCiFfgpiWBAMUqQg0NdollH/gQWoXkq3bT10gQY6hjlSybJqgN5AOENHQe4G8/X/uPH7KYD/ehnD51KEt9Q1FNrEckcyf+s4FsztqXEwAMH8vJ96A8aCjLem0XOIJV5PUKNmRZTto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N9TuvdE9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ovt4/qvc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N9TuvdE9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ovt4/qvc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GM4Wqn018433
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=iyvpcxJwnZCqs+bwLr
	nWHAijBC5H7p7ibSbpcLu11Xc=; b=N9TuvdE9TCQnxUdULgNdc7ARpiecvBa33y
	ADUSymX//86VR0I8vrX+/+Y06iexBG3NgqTSkcOuG9MS/fyyUU1UO75i8L+KrjGk
	X6A68rqYmvwvbbQJ1BYm2urImRboxBYrc9Ch361NEMeQqocO0FgVfJZ5VnJ9Eb5H
	1a+Fh5t5VQroFaVj8vY4HwOUwNmpAui0dwBg9L7nZQBuGlgKO/P67/rvsiG+yZCD
	eOuPaAjyEefTC87zE/fu97N+Y2OBgld//RuVpl2q6/9VAusFAkYMGI8rgS2uDZHa
	qPszvnQAcc9tGnkamkTNSTsjSY+MorryhJHGsTmkIkb/oljBTjDg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 446wtp9nf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:08:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GLnqV0020268
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:08:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3hrwyb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/2hn15uz7nK3X26o1ZMaCqsIfgG+tlEvvCfOTxk4gSrU2kS7lIZEoV+hlK8HR5wz+1guiGZHaX844WSZIH6hCk0a6jXKO4FXeraRhdskjV6aQA4Z0v0vTTbYl/mWY0zT22JUPLpUeAigpDkOpyENn6sX93vbUIRJN8R1nuLS7kZOsvRhyIMXxHQ2ZiOe74xfuNnvpB2cG1zFXjIX0VIUkxHtoUh22zDx6EPSngp7r8/Df37LCVTTby9yFIYqH8pJskQGlIaLrCBH5tItPDZyC93gkkTfZmyqUTk8TaQG3VVQkA9zeb8YUKAkDPFHJ3K74GOrkN1/iJPf2rZ5zNVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyvpcxJwnZCqs+bwLrnWHAijBC5H7p7ibSbpcLu11Xc=;
 b=gq9x99VBJC69ocQmkriz5nBZZ7dnnJlYf/ra2bU3hknkL8O/Var5uvgawsdSFD7zgIksH+dk09OarUvTp4/NMDVMvGQYUNHn9/PqeXd0zs6VFIMRFIb0/Q9DHc6NLvKNQDBPGXK/oJaQkwNpO1aw6+9+B7kF+ewW4eRRQ45UcG022JK6FDj/mSgupXA1AlV3Y980NLfbyZiSoRABx7+xw32Eihj6qjEzNfgOOe3gcgWMI2ncE/oqHmWAv7JQJgU/wib1azenBl7bG22/+tOue6cljxmjwcq71BC8ngAka8c2kv2xp6DfkT0slIIEepHp6hKCNzDc+dO9Oexx4N8Yyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyvpcxJwnZCqs+bwLrnWHAijBC5H7p7ibSbpcLu11Xc=;
 b=ovt4/qvcIQ6ZSk9XajIleSgEXcn0OmzA6p99d2UiPF6+QlIqoStvVgwl8LLie+85ezhs3TcR0GTerBPAD3ttdLD6Z4uPrc/fayeXy4nEfcpvQRndQ9qH0e9KAjwtlB/0uhzIx29IEpjHWbessmcWopDHVah3rjgF5pxmfK6oSkc=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH3PR10MB7162.namprd10.prod.outlook.com (2603:10b6:610:122::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 22:08:21 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 22:08:20 +0000
Date: Thu, 16 Jan 2025 17:08:17 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/2] dtprobed: handle a crashed parser
 child better
Message-ID: <Z4mDUeHf02ZnvHQN@oracle.com>
References: <20250116213332.415905-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116213332.415905-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH3PR10MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 6751fb57-2c6d-431e-96f3-08dd367a4962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mRfFSlbO823xBCjBC5WDFDEeIeowmsyfIs2Ml1Kf84rrowbfYBHlTWM0p8ly?=
 =?us-ascii?Q?VI0AhvJri9MCFo8cm+6+vgYM6j8v3L8rvZWbCuhydW6k/rT0TOTRXyM5KdVP?=
 =?us-ascii?Q?gZx9gv3zQY/YsTuNIgVGl9SrAkZq7i1rm6IqtN/t+GCffzcZ+kGDct85tS7M?=
 =?us-ascii?Q?MQNJSQsKgWlQjTJ6nyLD4U2xBbQnd9SIs84HkbvdDtfg9YS3h9dfSFAA8PAb?=
 =?us-ascii?Q?tmoiYEqSI9KTYy2xUTLNGHi5PWwiEZMNjjKRZgJqqcuxMbbfrw9BG+rGthA4?=
 =?us-ascii?Q?T3zJzzuhRmVPWRcPfs1HADsNAf0jFDne/8Fpe7Qauu5qkGEtwW2AudCVDslS?=
 =?us-ascii?Q?8PGrK9KPvaIJNESqiNqLNHMniOqlBfZzerTu1nOKOaca7oiqQXNf7afY9pvX?=
 =?us-ascii?Q?2Pfj5dGpxLLGr/qXHw+eSK0im7ZFBROBLtL7zkPEpsgBxNuTJBHddG/hgAkC?=
 =?us-ascii?Q?Rf3dfGbjNDwZwdcIhkJXMpfLc0kwYgXLMFRKpc4rGH0IUNQ6wu3fea2/m/Rs?=
 =?us-ascii?Q?y050MStpPocvdCsieA/dHJm9cdDYiDXJK/zzA4dT2Q16aEKcB9D7AabvJv58?=
 =?us-ascii?Q?7HlNoOTBOxsYO8QgJnG9WzxnnK9rP82bSS4JKdeXETe2SFsD3x1AJKZAB2rU?=
 =?us-ascii?Q?4VbDE8tvw3mn+TkUQZkXqxzzueUSs0qsp0VX8NndRBUEb5Rm4oxDyjT5S3To?=
 =?us-ascii?Q?fwfaUKN/NoNzi2/L9MFVwNcDMvSjfh783loyxSLu7EXkaHQ76pG1DuGHebbd?=
 =?us-ascii?Q?L7gsse756Tr86tGhMFtHMUAf/IEf+nBGEJ3B+u7XarSNtCx7Cp/kfqSteve2?=
 =?us-ascii?Q?U1IyMi5qYF6lCO7STiu63P+zWL+KBKWKPtpkiD7fHuakfuffzFnqdQXyG06O?=
 =?us-ascii?Q?9rh6JH/FWYt8H4qR3ig5r/cogAT/tgpcm64Wlr4m84oShEKEYx6OM89wyYdD?=
 =?us-ascii?Q?ST92KDiukeWMuQ5bRMyz19dqboDIYsKl4l6D0XafzRUYkQUNrGGEKFt7FFBg?=
 =?us-ascii?Q?I4O1woidv8lcbGeteQxmOYNa9WwQr1iDLEu7ENxntjgpHkrIkMptEpTsnPHA?=
 =?us-ascii?Q?kLHFUgQxm3VxurBh8TWsH8aOUh8AM3h0AGCF2zK52UfYCNMMR0M0BiPyYzi9?=
 =?us-ascii?Q?hRRQbeMHdCrH9PEaBPUKM8/vMmbRw7eTXG04XRFo2jj1NMqyqMEeV7f2yCDC?=
 =?us-ascii?Q?g92XA/+nQ1v7yqq4OOfdTVUa1y93f1WevVscK/j0/ZqCCsDIVsABO5CEXdcg?=
 =?us-ascii?Q?8eFPF1XRVo6+CUQrMYF31aq7/npqGzA+wRg7ZbkOJfbM1lzztUGCE3AOceN7?=
 =?us-ascii?Q?54wuny+/BMj1OIvckIwLTFfnk3R9nKX67QTCerpzPTVxJopHSoe6ci/u55Ms?=
 =?us-ascii?Q?n+PnrjJXZsrsrq+ElaMWFwq9j4pI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MdN/gaVvAFgVsq6UU8PtJiAGSevFYz1pxBtM3RwHHFK1M7qwOvhaXKajENnj?=
 =?us-ascii?Q?jfWpdeJUNoPl5ElU7WGZQlrRR7AweaupINLhbqRqfssU2WhaQIQsnQitXZws?=
 =?us-ascii?Q?g5SXl5MVaSm6vqk7HEnIjG7S+D2s0i8AFPcAJZSiJs6XO9qqhCDzcf939Aen?=
 =?us-ascii?Q?dYo7RKsuq5PTGLrqVluv1GQ/rklYEwGKBuY7f45Rb2ek3tKIV3u2+MIFMIhK?=
 =?us-ascii?Q?0VFxDAGr0RgUoEGerqS7pJGq3wuwsMDS+7dJjPg1TX/8CzTkynVvdWkMAJhE?=
 =?us-ascii?Q?mTSCrKFnyVJA6Rqtm/+m0NRe4pU8zTR6v88qSVyqkhWYqu3SyFUVvRM2b+Bb?=
 =?us-ascii?Q?4pSsATz08ZVlsDNcY2WqMl4yegsVVkPBjSvfbIvRrrvH8IfYoxUG4FSviGA6?=
 =?us-ascii?Q?DHDT+cPvjcLvFz/Ov/OaNa1LnNdjMfSHfNwGf//YoT7usQ0B0jQ5snrmhlso?=
 =?us-ascii?Q?US9a7kVcBmqLpbJxkG6qAm+XZyB98bhiZ5F1PrCAjYnyLwbnnYn1pXKvg50v?=
 =?us-ascii?Q?zj+fkCCaeeESRdU2oFAvBCi3gudWZAxcQEdc0TKy5J0WqKD7rGDKNGEdnRwW?=
 =?us-ascii?Q?9ozw9Bk45EKZazFAKzbCA010LlsvfR0fFQ0iXgp4BdWzY7i7TvJA6N8cE2ZB?=
 =?us-ascii?Q?Qz9xcdG1znVPX37r3ch02ek2pPnPw1eskNLaLVadW4SNWqHFYrfgY10pRYIP?=
 =?us-ascii?Q?3+ox5LijBpv/1DVQqZurxtQtHjdUNfrCSmvsn03p8+31LDH5r//WcoRkQht8?=
 =?us-ascii?Q?8xSRMd66KXo1nBRBa33EZqgSoyFTwSECQvgG9gEhhr5mPzumX+hspOjrHHvZ?=
 =?us-ascii?Q?swPcyQuBL3Nols/Bfrw4qLQQuzG7pCW5WE8VAWN0KkAKP0ulv8QYkOY73GHy?=
 =?us-ascii?Q?5gjMlYa2caBBt8iDn9Opm7jHr2cQb/RlqhZAumEbZlbn8ii7SVB5ZraUwSld?=
 =?us-ascii?Q?SxWyxMyRLLjdwdKYR1duOxm2/JzrxQZB5l6ij8HExSC2DbvS/tvYs5kIBVDO?=
 =?us-ascii?Q?16BmLfkKoZHP88RQNyZ+j5H82Wcbb3n7sKnAfCKZAb3tKNuxEGOJMaM3ZUQe?=
 =?us-ascii?Q?oqhP+HGVl6izHxXFTW3tPuaWhXHLeOLEFcO3BAW3x28Pty4yXS02w8wX+V5X?=
 =?us-ascii?Q?gbYFu+ezIcCd3k5dpjMVGScnooyJ9Rp6qmYmHc1a372tiVh6MJJjqWurU3hW?=
 =?us-ascii?Q?xqxPxx93nkVrXNuUKNhSGW3BU8HmUw4RbdAROA2K/Lci9Iw6lWTKna2wt4Py?=
 =?us-ascii?Q?otw4vPQbtO27yHWj+TVnrGcPfmZXD2aNU3eseTNvSw//PP+jVYdvXv8Fmlot?=
 =?us-ascii?Q?8Xt2bnP6nbcJ4Wl0qINzfe4B3AycCELf5ZHij5ndT1/qA3SiFRk+9aIhG+e9?=
 =?us-ascii?Q?E+F5q+TG1xLgng3dglvX5hImL5mbtAhwM9Ihou5itD30XUf+kb6I3ruXiIXT?=
 =?us-ascii?Q?9i0RaD+8sxeotubABuPCTL8bVggtOWyxNQbXI/t/GvZjP7TLssqL6rnB0fUH?=
 =?us-ascii?Q?F/qFZAfYlnlFzpzrbW50EsDbgA9DLHWypM3QQ/VJxmcfBMxlL4/YvrlOg1th?=
 =?us-ascii?Q?Lx6Ihhq9KP2TrbK7eovt1rHt/m4RZjoCERJMemns5UzeNFZ8VJ/YOQQAHsu5?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9h/r6bs2hYozu7Or1GhWQeaEjOyV8G6B0uMu3Keh2+PCE5u1jRDcqhoraqgoCWOGx5acoqsY0WwPAjd6bzuKQRY8Yl0MGgZXYLPB7Iqbe/2Wu8iFKHq9ikUMIWFa3jeM5va/8tM0O2c6+C5QnGM64N4LwzyCBMiHw2we3Baod64MmW/TSbutNSIBPEaMDZK5vtXPFIbSWp0lIkH767JjAK+4I33+lhOj/RqRb5jbnFXLIsYWtZsT6oe6/9YbLbkVe9558A4U6F1OxncmWw7OlL+fR2Liv7VRUwUgqxAodBd+LmET/4dpCwtVRlc9rtMQJ/QkV9IeoExyvxi4ksO74kB8f7JfKuK7IQ6Q06kSkfy1uNWx6+6StoFv3F/e+KXvT3dgRfr1UDpIbshqnOrMFmOVqeaXh5VV32dB5bHk24AvBC/UGlmtSx1T/T4jJRCo+TcVreKwhhZjR8+3jPTzL0A0dxq1rqqBeetZ0sm5HEON/wt7FSwJOFfW0UuDoO1s8s69iFTBdQcPOOJGh2y9gHWb7Y3euy5K8yIijij7RNCLhHtwMGzoevA4trtfCnbOojUoh2Z468zMAbFmUkmwD1SfL9b4g0hDs8I18FSXrBE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6751fb57-2c6d-431e-96f3-08dd367a4962
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 22:08:20.2681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9kefmDcF9kfcbXbgu/YUAHliGkDSRueSDmrErXfyJaBsOq05VYsiKZIVIh/cpej6PQqDLlR21cvgzLaRN2lXZhQgdKdy+PIrcaFUfl0FZSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7162
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501160163
X-Proofpoint-ORIG-GUID: _b9dc9LCmT1R8UlHZEywU4d6mEDk4eVH
X-Proofpoint-GUID: _b9dc9LCmT1R8UlHZEywU4d6mEDk4eVH

On Thu, Jan 16, 2025 at 09:33:31PM +0000, Nick Alcock via DTrace-devel wrote:
> When a parser child crashes and is restarted, its file handles
> might change: we should pick up the new fhes if so.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtprobed/dtprobed.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index 86865eb467b67..c0597b7329d37 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -769,7 +769,13 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
>  		if (!provider) {
>  			if (tries++ > 1)
>  				goto err;
> +			/*
> +			 * Tidying reopens the parser in and out pipes: catch
> +			 * up with this.
> +			 */
>  			dof_parser_tidy(1);
> +			out = parser_out_pipe;
> +			in = parser_in_pipe;
>  			continue;
>  		}
>  		if (provider->type != DIT_PROVIDER && provider->type != DIT_EOF)
> -- 
> 2.47.1.279.g84c5f4e78e
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
