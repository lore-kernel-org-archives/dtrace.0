Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2D81728
	for <dtrace@lists.linux.dev>; Mon,  6 Jan 2025 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736178936; cv=fail; b=eRzAPc5AuKCHbeY+76vF/3oNidGCmO3dzZZMDlOIfrDotQjOCwm6+sN2kmjYq2v0J0e+5oRWYuRem2KN6SIQ8VfyrmCFCHbtAQ1QPpyXIoSlDB4U2t4e/yvEMYJ40kxFSpRCu0ak5MQ+2UeZW001FkYGGJijfrVQNyhxQ1LGRns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736178936; c=relaxed/simple;
	bh=aefW7uUJsWgE8oC5X881GHbZBaysykhM+h0tqpuwYoY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=TnBssw0q2pQwtyeZhmBD4gkSyWmt2jAgKYBb9RPvlv3b9R2DW0/4oGE1VynMhJsah+/nc+KyC+34uZCdV1XQ8mpp/k7NFx0jh6R+C+JXSqXubhuPZbQ/cZ6qw3jzRAdW8d7YjIv7bPjnJ/oWgNscUnYzP9jnth6S/RIFjzWUu10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k+s3CZGP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Xhmurdyw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k+s3CZGP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Xhmurdyw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506Etob0024349
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 15:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=1LPUhbZj337nINMEkM4kC7qtQ9wLaHdtNJZv/3kaLBU=; b=
	k+s3CZGPRL+btVtG2q0G0FQwNhhZd1kSg/aBE+CGoGaqGk2Z9xfy2Zz6QNcyPBDT
	Uc+SH5shE93mfmWIPXLRxdZjqEBOzY43SLh9OYOYXSxbvkfFSZGx1q4ZD41jnyzW
	6rAq0vnlhrlQJfdp76it5fiATjBov+S3xN5jEql/QMsq8Le9q9CCuPGAWmQD6m+L
	/uK+3AY/JTAW3CNU/ypIZdAcnzYXrPEJCR5LycmEAHH0/78ewuKcwHwP2zlDRbeh
	HGryoFTom1HOnp7k73gpw2BK0QRogsabnR+cxxzLh9rXzH08B6qP8Ihhor4SDEbr
	2Shi6bj2FvIrQj9dBBLfdA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2aush-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 15:55:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 506EgmH8010996
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 15:55:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xue76rsu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 15:55:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDLs04t3OxiGFAK3ye4lcntFHoO8Fe+8ev6jqHG6FpBsqhNBD2CLKwkMvBZfgouSF06i5n+/jeZ9YtAr1G51KbsvIfn53NBCiVjW8b9JoOISJuUVxyfWzrmh5XmZOTQifvte+jRhqLNDO5aCsfmaErLioiZWVT6oygvDZqYJO3HM2vxlLv+l4UBSxhJzcOMeLC+oVIWfoYZu1PsaMS8/glCCyZrdfo7BZTVm8L3WZOOWRqCHrD8N3tqiJho3JFPAOtkYlUn56y/zFLswWWO4G3SFXoYavM7b7HiIMhwtsPEBwfk2cbSuWYuTlUyLXSs4E+9oLbnY5CMrG11E7VLyPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LPUhbZj337nINMEkM4kC7qtQ9wLaHdtNJZv/3kaLBU=;
 b=shhSM8oWu8jTP/dirEP5COqv7p43B9XPzPRw5T9hkUxFnHZbB5BQN3p1qckJtFb1YFjijTlS/TqXigYKCdECcdjRoY+cYtOUO+ltxRHx+6PwoTgRnUYVJ3Foaw+57zjL4bziEFVXpZe03gvCd1JeTUjwq9SdMcgu6PKbGWPHiaN+bEVeJj1FvMBKj4lwEBz+ZCwVdp/XB26YFAYJ6gvhsHmmr5apG+eGMhOljyRNCdkeJYSXPinqS4RHw+t1bWhTRMR7mVIPF+6H3J/eaT8MwI5ntluyAorYQ8F1avV4Xd0peiegrJBl2VeXIJdafj6jwGrNiG/qat6G1g34NKfmeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LPUhbZj337nINMEkM4kC7qtQ9wLaHdtNJZv/3kaLBU=;
 b=XhmurdywNNkQJHIZSYu3FZtgGPej7Yb9tkHTBwHKQQn2bozY7goI3T3LGTE5LmV7c/zMsIxnG8ivvCmVJcN6f/FN7NFZ2o6Pt8shHFwz3cFPup6vuHIbDgGGV3C1gVnhKa3D0frUaE1ZO1PK6NT70J9n4NSptEHVtM0rONnacyY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB7035.namprd10.prod.outlook.com (2603:10b6:510:275::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Mon, 6 Jan
 2025 15:55:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 15:55:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Move proc lock to where we actually find a USDT process
Date: Mon,  6 Jan 2025 10:55:25 -0500
Message-Id: <20250106155525.15499-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:a03:100::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1566fa-dd81-4fec-75c4-08dd2e6a898c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4CxRriVgQgSdstuIpgrU3dIbg6A1E6uj3Oscy6Jw7mT19XvY9PR8krxEgxcO?=
 =?us-ascii?Q?Q3rpbjkSgN8MGiutiD707MnyrA+lQ3wSzN5NeXi6CBvkhf6lNyFHg4kttQk7?=
 =?us-ascii?Q?MhbafkdOl/Dzc/as5J0CRi330fLisxxjpXbGP8xCuN9Eza4Z1eSED0a5jocr?=
 =?us-ascii?Q?mL/SkShdOkI6ds+53Xn2gKV5oF8kcbA8wWR8nvFph4uYju3o16EF6azD1PZh?=
 =?us-ascii?Q?p3f8ziBPtZglyFSAQvlmxAU3pwQzi7qUK3+Zj9mx0kkxYvATgGDcmIoAo067?=
 =?us-ascii?Q?It/BPGQ8Z/mRT7Ct8DerAcfkn2n+W2Er6ygqt99jq+62YgJ4fbvBh5GzX++r?=
 =?us-ascii?Q?9sNobds8y7x3pZyiymrDOiZ4UTTpVjDTAJiKKgZcUPblPuB4jOft2OmbdZzs?=
 =?us-ascii?Q?2o1xh6Z1EmZi7DR8djYqgzsEk8BhwArcvRSNZxzhCHEUDVSJg3agdgW6qeng?=
 =?us-ascii?Q?t+CSv1AqsfpKwijHb1/ZyWj1OH20PP1BXFnfTI+5oO3uF/3uS+MA8LUL2ZFA?=
 =?us-ascii?Q?kL9LVtJt4KDHqb2Du7Ing1tISPheMKgT0mhvgAvSX4eFERzbRHldp+7WtBli?=
 =?us-ascii?Q?+ZDQjZ4NPYD7RrzwsJugHul4h62qfXa22PhfRaPeZNYVmfGuocbLYXspYp0x?=
 =?us-ascii?Q?6QoY1M732fQ4lf3xCskUIgZb87RwsxLv92expg45nNlBEciWQ8Yv7yM5Vwef?=
 =?us-ascii?Q?tBizFPDsN1Vomem05mcUfBmLa+841P93dATuiNyHQImLz2IVvVG5gZsMtMKz?=
 =?us-ascii?Q?GcXg+J6gDTNcTCpXmwKbJbupCsTXB5oN9xRNgFCVedKtiM87lirXssWJlCta?=
 =?us-ascii?Q?C+pnZfS2i2EFTJMmDoFjR3vzZX7bTtibl+Jc4/ctlaUEa829VMe/w+GD/cA4?=
 =?us-ascii?Q?tG6MNUmMnQ1aA784SeBp0Az9ifPFhgVXwc14VXisPV7emsSMbYuyX8P+rB1b?=
 =?us-ascii?Q?H1j7v8v/4/2T8NYKNQPSR9HCG+mggwoGZgddma9/u1MYZYu/632JdxTG2W/U?=
 =?us-ascii?Q?SiQMVOxnMCXo8KVNadiMKW/u/CFypbO1gVqmccuQ0q+/NT1nUD07cFlPpM/G?=
 =?us-ascii?Q?0u323B4OB9qAM/jh+B7GmWriKv2wLF6rHCIlyd/7SjiIO9x2PGqjWbgx9MUI?=
 =?us-ascii?Q?pgzoxOIRrUhx8FxBWlphAdvLpq1/JDkf2gzOf+R6svbh4sF2eMD3eJcEjbXG?=
 =?us-ascii?Q?hyKXhbzj51WIquPJkC4u8Ap9zOnJFPPiy0v6lJC8cM8F5bJSEXQ5UkF4nm90?=
 =?us-ascii?Q?udLw60CvTWInWUE8tWps023uQPaUZCtM/Y7ze6X8Jp6naWHOYc/ZBsBbtPgW?=
 =?us-ascii?Q?vF95hHB2a2qsFFQICZWV+nG1OK5I3KMa6/7ngbw9NtTW8oTyWt0L+y3Ri5wZ?=
 =?us-ascii?Q?QY9C7wUD7aM6/Ihz3NGN2ktGFmDX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wp+MfvUpkIS1TGZUaWl01/ciwBgOL6PjVow0xyFfEWBpLpvP4ZRS8co4DnBr?=
 =?us-ascii?Q?ZJYRqM8c5bwFu+zGwu/xhfqf6Phf/HRHOfmcLCFfk3yL4dcozKAXsPsqeEKW?=
 =?us-ascii?Q?g3RxHn2cd2xwiUXFPbrHGC15ebAMq8XULNa9RAKEWrc3Q+Ee5XM+ba5nvPDZ?=
 =?us-ascii?Q?wsjel1ZSFQ8ROJh1Ac9FcRh2K/Zwvor/JN/HLkc8M7L6H1WFfqPQoHVR1WLr?=
 =?us-ascii?Q?apV7Kf8WZlCarNUClKuwRjUriyy/DjucWBC8UWJbeVcXxAustezXjCOoZcNQ?=
 =?us-ascii?Q?dJNxnMQMKFn5tisU5imwACFG+olpf353I0Rz8YXySxFguEsI8DA6Z3HEgXDW?=
 =?us-ascii?Q?9K3WuD+HSPYdk0b/TM08fi8WgsZEyO4k7F4MTYA1nIeOX5wH7mFpKdeRj110?=
 =?us-ascii?Q?DgFtSYr5yvYB57C94ySnnbpfQQuXQuAy1Hd+UneWdMxAka+hybJbUxOPjRlC?=
 =?us-ascii?Q?L5ofGrVKIJ7280D9R3pRPlVrA55xNU+xWLynWscjipYFUvMBezwz/R5jY1g4?=
 =?us-ascii?Q?VR4oiDsMCFyQqglWj7ljsRal+ydeeVzaU7dGL+/GQpzx5eWDz4xljbVxIZFk?=
 =?us-ascii?Q?H40qhdABVxL5mp14YJJBQ66olo0Gitp6/dY72QPT2xMLoVA2pt08/D+18g6M?=
 =?us-ascii?Q?N37DIfgsCsHYXY+Q0AK80i1eG12hm3ck2kR7Kk3kvdtPetC3wB4FcfMur3UM?=
 =?us-ascii?Q?0SHLDEfHzu4RNu/edWBzuQz6VykmxhmqGGs12RTb9dRWLyu7VJBHGw9Jy+gZ?=
 =?us-ascii?Q?lS+f6G8YPGMU1oSPT2Pbxh1U8cT1qjCpdyjQp50bgHJ/BosXinvcN8l57wOK?=
 =?us-ascii?Q?NP0Lm1u/9Wwb8QLiE+rYMUV2II6y5W+cjkrUA0IEAo6XyfIyG9zkCOlXIwLx?=
 =?us-ascii?Q?TzSSTEl4mXMs7C31ddzU8G/YDpE9bYk0R2B4eW0+obte4Sfd1EhXI1eXjGSF?=
 =?us-ascii?Q?SifxP790FAVgcWkEldLZXwtRGrk2GOSNYhVqlz3w/ALGSkD27bhHFtXuJLGp?=
 =?us-ascii?Q?KwFlWxD6qLrLdabUmsgWen1kEReP02il0OofZdy4jzCN6agmdIEk+oydvrfX?=
 =?us-ascii?Q?2hN2YDxHrJC23K+C+Us2YrNS7np+myeOhwGXXMFJBbRLIj69km3kgOh4DTD8?=
 =?us-ascii?Q?wQaE1XAmSHp22svLNPVEopLAB9X78U6BHmv/1xPD7ja9Wl0g3RFKEBkkDHVv?=
 =?us-ascii?Q?5DqMXnjPTkB7GkxZoGyZRRc+0F2o006RfjTzm69ze8D0YbII0jxftOWcaVEH?=
 =?us-ascii?Q?mJToT5iX0SVuHqab8jnKCVv5LrIh2GfYj1P+Aja0xmUHDs82dIb6j1FiALer?=
 =?us-ascii?Q?wi27M5Ydn6zf6uOaAakDp2AxFMTiPgBVyyu9W6TPr7DteDmio8+/6yWtpaGU?=
 =?us-ascii?Q?meRTS1Xuj++0OjO5JoBg+AwqYx6h9lsjqz2UOgZYg9EerjcTtfUCbZiXQm+N?=
 =?us-ascii?Q?ZiEvq1Fqoo8PMYZTJcLI2fTaT4mRvWjbCarYUpsxemPUC4h2NZ7cWpJQ2juD?=
 =?us-ascii?Q?evcKRkm24cEEZylUIpVUlHnTUayUbOmDIAdJ3q/e5F17DeEQWgtPQzIrcwhq?=
 =?us-ascii?Q?WVO7quPf5ZWueW6/sWecFEpBxOIO2m9hPZD6ICFE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L/qNtJYtiuywMSPcmCcuWjelMhmTt19QWXH6pV8pd7UOO7zpzAsdsdkP7PtcLdzFHSC1KZj6VNZbSPQYXA7NnpvemQzQWKA5sQvoGjGl0x59AH/gw+x8pb7EykOOKOIwGeWyo8AfZ3U5/Yyc/XGeBXumjHxBSvlub0IPyRflXOWGz2Vtmn+2Y9vwEpO47Uty8tRtCGeC9e6sZqzJ7LHCJ3xLP4N0fzCJSrrCqAuysdNYHNQRpmIYzJwtiBiXDkWkFYUS8R3Bn2abzhBcHdgd9t+0D/om1ncbkDTNGq9XHu15GXZJ6vSVUjle9gpvYuqEIUzN9168BQmyLYAp4M22hbLpLZAhngJlRiS+i/UgWBUTtOO4vg6SuRRY08HClOaa+JtrTkXQ28YxOhOR5NPukQzHE1q5gFTaWoRyBKmq4JG+mgQM6ww/FSSh+6Z9owqimslO/5QAx/3g3XHrZcUAb62N2CR+9TaLd9e3vrylfJ086/SJQZJOPY3EUHwGlsoN9YrazaF5N/k3wQiRorhLkctz9/t6s9DbOdI9UN6LBJo64uuN04PjFuiGhVlHPBZulvtYSJK/n9rzDqnJDbr+m/29ek22UCeDzalBsyTJUnc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1566fa-dd81-4fec-75c4-08dd2e6a898c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 15:55:26.6559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QxcR3wIhErqWTqMIr2SHi/03UONM+jvr4cd321zMvOHRvwlzQ/2sBBH/s0pnZPQkMrg6jvetZHlpO0K3hW1DRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7035
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501060140
X-Proofpoint-ORIG-GUID: mi962kPfmKxwAuzwTRXBJU7bQ63JgIo3
X-Proofpoint-GUID: mi962kPfmKxwAuzwTRXBJU7bQ63JgIo3

From: Eugene Loh <eugene.loh@oracle.com>

The function dt_pid_create_usdt_probes_proc() creates USDT probes
for a specific process.  It is called in one of two ways:

    dt_proc_scan(dtp, dpr) ->
    dt_pid_create_probes_module(dtp, dpr)

        The process has been locked and we are updating its
        USDT probes.

    dt_pid_create_usdt_probes(pdp, dtp, pcb)

        Here, we look for any pids that might have USDT probes,
        calling the pid-specific function for each candidate.

One problem is that the first code path assumes the process is locked.
This means the second code path has to lock processes even before we
know if it has any USDT probes we care about.

Change dt_pid_create_usdt_probes_proc() so the caller can specify the
process in either one of two ways:

    by pid (implying the process has not been locked)

    by dpr (implying the process has been locked)

In the first case, the function will lock the process, but only if
USDT probes have been found.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 70 +++++++++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 28 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 8110ccead..6db882059 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -782,33 +782,42 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
 
 
 /*
- * Create underlying probes relating to the probespec passed on input.
+ * Create underlying probes relating to the probe description passed on input.
+ * Just set up probes relating to mappings found in this one process.
  *
- * dpr must be set and locked.  Just set up probes relating to mappings found
- * in this one process.
+ * Either the pid must be specified or else dpr must be set and locked.
  *
  * Return 0 on success or -1 on error.  (Failure to create specific underlying
  * probes is not an error.)
  */
 static int
-dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
+dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			       dtrace_probedesc_t *pdp, dt_pcb_t *pcb)
 {
 	const dt_provider_t *pvp;
 	int ret = 0;
+	int dpr_caller;		/* dpr was set by caller */
 	char *probepath = NULL;
 	glob_t probeglob = {0};
 
-	assert(dpr != NULL && dpr->dpr_proc);
-	assert(MUTEX_HELD(&dpr->dpr_lock));
+	if (dpr == NULL) {
+		assert(pid != -1);
+		dpr_caller = 0;
+	} else {
+		assert(pid == -1);
+		assert(dpr->dpr_proc);
+		assert(MUTEX_HELD(&dpr->dpr_lock));
+		pid = dpr->dpr_pid;
+		dpr_caller = 1;
+	}
 
 	dt_dprintf("Scanning for usdt probes in %i matching %s:%s:%s\n",
-		   dpr->dpr_pid, pdp->mod, pdp->fun, pdp->prb);
+		   pid, pdp->mod, pdp->fun, pdp->prb);
 
 	pvp = dt_provider_lookup(dtp, "usdt");
 	assert(pvp != NULL);
 
-	if (Pstate(dpr->dpr_proc) == PS_DEAD)
+	if (dpr != NULL && Pstate(dpr->dpr_proc) == PS_DEAD)
 		return 0;
 
 	/*
@@ -835,7 +844,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 	assert(pvp->impl != NULL && pvp->impl->provide_probe != NULL);
 
 	if (asprintf(&probepath, "%s/probes/%i/%s/%s/%s/%s", dtp->dt_dofstash_path,
-		     dpr->dpr_pid, pdp->prv[0] == '\0' ? "*" : pdp->prv,
+		     pid, pdp->prv[0] == '\0' ? "*" : pdp->prv,
 		     pdp->mod[0] == '\0' ? "*" : pdp->mod,
 		     pdp->fun[0] == '\0' ? "*" : pdp->fun,
 		     pdp->prb[0] == '\0' ? "*" : pdp->prb) < 0)
@@ -858,6 +867,19 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		return 0;
 	}
 
+	/* Set dpr and grab the process, if necessary. */
+	if (dpr_caller == 0) {
+		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
+				      DTRACE_PROC_SHORTLIVED) < 0) {
+			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
+			    "failed to grab process %d", (int)pid);
+			return -1;
+		}
+		dpr = dt_proc_lookup(dtp, pid);
+		assert(dpr != NULL);
+	}
+
+	/* Loop over USDT probes. */
 	for (size_t i = 0; i < probeglob.gl_pathc; i++) {
 		char *dof_buf = NULL, *p;
 		struct stat s;
@@ -1051,10 +1073,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		free(path);
 		free(dof_buf);
 		globfree(&probeglob);
+		if (dpr_caller == 0)
+			dt_proc_release_unlock(dtp, pid);
 		return -1;
 	}
 
 	globfree(&probeglob);
+	if (dpr_caller == 0) {
+		dt_pid_fix_mod(NULL, pdp, dtp, pid);
+		dt_proc_release_unlock(dtp, pid);
+	}
 	return ret;
 
 scan_err:
@@ -1237,7 +1265,6 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
 			  + strlen(dtp->dt_dofstash_path)
 			  + strlen("/probes/");
 		pid_t pid;
-		dt_proc_t *dpr;
 		dtrace_probedesc_t pdptmp;
 
 		/* Pull out the pid. */
@@ -1247,28 +1274,15 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
 		if (!Pexists(pid))
 			continue;
 
-		/* Grab the process. */
-		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
-				      DTRACE_PROC_SHORTLIVED) < 0) {
-			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
-			    "failed to grab process %d", (int)pid);
-			err = 1;  // FIXME but do we want to set the error if we end up return 0?
-			continue;
-		}
-		dpr = dt_proc_lookup(dtp, pid);
-		assert(dpr != NULL);
-
-		/* Create USDT probes for this process. */
+		/* Construct the probe descriptor. */
 		pdptmp.prv = strchr(s, '/') + 1;
 		pdptmp.mod = pdp->mod[0] == '\0' ? "*" : pdp->mod;
 		pdptmp.fun = pdp->fun[0] == '\0' ? "*" : pdp->fun;
 		pdptmp.prb = pdp->prb[0] == '\0' ? "*" : pdp->prb;
-		if (dt_pid_create_usdt_probes_proc(dtp, dpr, &pdptmp, pcb))
-			err = 1;
-
-		dt_pid_fix_mod(NULL, &pdptmp, dtp, dpr->dpr_pid);
 
-		dt_proc_release_unlock(dtp, pid);
+		/* Create USDT probes for this process. */
+		if (dt_pid_create_usdt_probes_proc(dtp, pid, NULL, &pdptmp, pcb))
+			err = 1;
 	}
 	free(globpat);
 	globfree(&globbuf);
@@ -1341,7 +1355,7 @@ dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
 			 * a USDT provider.
 			 */
 			if (strcmp(provname, pdp->prv) != 0) {
-				if (dt_pid_create_usdt_probes_proc(dtp, dpr, pdp, NULL) < 0)
+				if (dt_pid_create_usdt_probes_proc(dtp, -1, dpr, pdp, NULL) < 0)
 					ret = 1;
 				else
 					dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
-- 
2.43.5

