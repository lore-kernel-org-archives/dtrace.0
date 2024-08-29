Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608333AC28
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908957; cv=fail; b=dx0DVpxQFgmijSGe5vYBDzROXTQJZXpk/WS+WdNX9Sww1vcpttF6HwaN0sMlehfTP9zRfcXaqqHh3m7n1JOvH6BjsHx3nYD1ndt4MQvQYNvnA6rsEOUmujfsDUV5S06RIfTa5z0wkja2fpI77G7epYfK8xsYvnfYPSfbFpe3JRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908957; c=relaxed/simple;
	bh=yMZeILTZd9eRGnD4K1SECgOm68MWMsnIwW+llyOSqSg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ef33QZZ3NMrSiNuoJE0k03sqMGCguBAJ9+zRmen16FzsnFjbgAnrkg71H7A1Asqoois9RaumYt7rFVvfpOzT9eI6NXLeNIjH3iM9XBgm2ESW8Ee6S3QUXEQb4IEjhy+FlYBoOkTaTGlDlC8twZaeqboLT0AX84ldhVRKJApSGW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iiRajtLt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OK+RshKL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iiRajtLt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OK+RshKL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fXEG032616
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=JtvlENMLrpXi9/
	/gyyvlg5fobx4/bNu67PQLOUhxGBA=; b=iiRajtLtzWMgrb3LuC1nKsUXB2650n
	SVE6cpr1OdTNaN9f3+w5C4CsEVuyfmnbtuuFazOmAZrL8LJClb3tDpEtOFxNypqi
	cTwOJgdbHn1Qxej2LmqzaD3W9Xk/pHZDkoxculXty01fWU+KzJ8/dWIGjJ+TVXXD
	ysEJWfc07BiugYBzWRqccjSruRpFm+U5OJbNl3CGIjdYEAZT7rHVmcVhUOUVbQMH
	a7wfr0glEHPl0xKqUqigKXYRRR8BQ7xwiz2+MSBq9lg3rA1KxieAHxCVSgwg2kVH
	ub3SQGyBjJsOEy88LCAQkOHXq2nH3EcUQZ9pOMHc0qsfpkM6DXWAzdrQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukub4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T2jWbb031872
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:34 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0w80sn-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVxcKFbomnSaOrHuEB4sA7b/anaStpELaTe/m3m6I4Ui8y6CGceo9MiLi/QvUE+nkflnXqLlU3U0xY7cPJenNpVHxlSDKIWmETvUP32Kg6eQneFzN+U+V834+b397mjQp2l0BaWX8oegTWeSw9RX/t2aA2T2RgiKmZts2LJO3HETw+En0K7JWeODqM7gBvxQC1hHAjDnnCZ6ATjgH4R+Rc2LBmIHTy0OxeoKoD3fuRFx3RV0e64l2BhWs+DwRWJymlJIE/5DZbaKwLAUGJJjCmt2NDV/oQL9T49l/wtk/wjzx8i2C1NGEHFapj647M91hYKFLjq9sQZuQebt6M8V+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtvlENMLrpXi9//gyyvlg5fobx4/bNu67PQLOUhxGBA=;
 b=XB1TMKdvC4VmtGn4IQ0azqBwkU+1uywWPzX2w1iIPiuydUk0XOI3VjOaGQdXv7h2+NUZyHdnuqyxsRu67eluA5qPGFB+mQODipnvZBMQ0+2X9xePJ1LuDkv2vQx0FZqL3Ow4e8W2MyFXuFVfLdc4BixOH5zUR/sPKihuv8qzN77FalwS4LJfeLrpyYGRRlml2mJYKIEO1QhDXJBCb4Lujv1ZM76UsMRH0CbjhQJObRVf2eBjYdOWMlJ6Yxe9dx5mfYri+9UTnY5uFKEWpjb8UkxDur9Tqkc4cTNYlkjVnujVV/UZLV7iFys5TPWMpDt/bQXuq6YvsD7n6qQCUPDHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtvlENMLrpXi9//gyyvlg5fobx4/bNu67PQLOUhxGBA=;
 b=OK+RshKLgvKr2Z1WI2iEHuIgQ2a3P6na0WGyHVjuTcZ7Kgmo4Krfskm6zQsAvlDEuTLL4k7H2Be6M9iQ/JP/cZIT85/eusZMca+pdJ8E3peb4+3Lraim7P7EoW9fwYahF804ePvh3KfQ9tkQFVijqQ7ONmpPWc7/s3aqPLA/kXA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:31 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 08/22] dtprobed: Fix comment typo
Date: Thu, 29 Aug 2024 01:22:05 -0400
Message-Id: <20240829052219.3234-8-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0096.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::37) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f72477-e8f7-4b8f-5e48-08dcc7ea94bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OwyyEHKAI20KRRxITHvtYjt2CiCO9wEp4HlgKv2Oo7WmTaAwWB1iOkkeLVjv?=
 =?us-ascii?Q?ipux+Lga1BVMuTZ2SlLV3ztRGLkYI9fbfJa/HBAYQLK/0bX8o/nwm1R1sdUr?=
 =?us-ascii?Q?Tgf8okiUURIuZT52Dak3dpMCB81LOLlCIQeI9T82mst8DZlPVgAXXSt5GuXT?=
 =?us-ascii?Q?xSZzyxijX5ODc3aJwhDlNgzrJYA99iVVVzUiA6zjgEtDBAN0rCI9YUYOCaXr?=
 =?us-ascii?Q?bJY+rlzNJkF7cOD4ogNEVsMBray1/wJYDmkMVISVPJXy9r0NBU36sci6qCn7?=
 =?us-ascii?Q?QawEWMjh0z+xFtZh2WWj169Wb2koHojF6VN4Ej6dTbkyUtyF9ou1W2SCMhrW?=
 =?us-ascii?Q?rlynwlHbHGf6n+dFCxgu6NrzOEDpL34lRzoxJTOoubNL1+atSHRUZJGC8Ugp?=
 =?us-ascii?Q?UjDixgM+ZHddnRxLYQZun5LPx1JmdfKfgIyGsESmOnRvbEyf5r87/iu7rxQc?=
 =?us-ascii?Q?ZGHMI6LUu93EoC8dB0yzCC1YMKbcm+K5X6n9fCS2BcR56lNzm+gp/MAuZf2b?=
 =?us-ascii?Q?aFcRvlMT62IZrV5J4UpvCkcvfQ2s0k1kQm1BUUZMfmYBOnrhXjZTlZru2EjH?=
 =?us-ascii?Q?vSZ5hLRkb+j2aTsHztzgig1WZuF6XuEWmwAHIOa7gIbpHbXUl2C6tH7/lmnn?=
 =?us-ascii?Q?Lm2PScMwz0Jo4jhOh+Ts6feg+oWoXb0mws6Eii4HDbPhGWIOGzWQWrJEoQxI?=
 =?us-ascii?Q?tuKJJdPBrn/t/XUYoKWl20k/Ov/JERTmzJo4Yk0VGGcOsuMAx9El+J2up8YN?=
 =?us-ascii?Q?jQakYKLW+5qT7O0Jg/qZN5Vl9ou8YkriimjQVWu7jA8fTBamEhz9ydQbYjBk?=
 =?us-ascii?Q?LFW3n7vC1B7a6XETd5BWyl/CwaRfHwPDQOOE9VVMfoBRQqF0YTxpgrCgP0Ql?=
 =?us-ascii?Q?v9G+N+0zANVvRfK6zMKbV5TapBKxIDAAzdK6WV+ksV73bH/k8EF2DpBvWjMo?=
 =?us-ascii?Q?9J3WwUUyLPrMd/ywHo73XQlAI7g1LJTpFpzdmFizDuYGpZjnuqCbzoL+ABpl?=
 =?us-ascii?Q?k/Hs+L91Evhxh9URg/gZMXR7GcKwUFrc9+K3kbNkhzRc3uGOTyJOvDlL103B?=
 =?us-ascii?Q?YN3OCV/uMVwgboggBuBBdaoOzdQTcnINsSX4jvhNTvtj5DnKR/q3yDTk9uxc?=
 =?us-ascii?Q?RxH+5Lj5g8T3qxvOE+ZPO+CD/BwWfnIsXhT1GTSF8wiX6iPNDLIxNhjTdcvR?=
 =?us-ascii?Q?pAffKIxrVKwT0Dg2s+2a3UMiHDYJqrqk9ZlC1OnYsYHxu35zkndcvCsphapY?=
 =?us-ascii?Q?KuG8+2VyJ+v9x49KGYQzP1+UCx3igs3wZvYsc8+cH3lJJQkWs32Ab4jGBW07?=
 =?us-ascii?Q?WUlwXK6Uaf4zi+BLUR6ijhrR5miQ4PgslP4kFXt56tZ/1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uwUbMdS6O1h9Yj/kvfO8jsJZ2OGFJ5MGijbJwnsBV4hyJbLMEJjC+NW+IU4h?=
 =?us-ascii?Q?RJ6T352mbZjXq2/2/2PQIv4iFg81oet31V6baAbQHLTIyCih2muYuQMSZ1ro?=
 =?us-ascii?Q?u2Pp5HKgOnrhquwjreENfkGcMjeaEp5L6QU7R3tXA3w7VQzL18Eza3GgSMCM?=
 =?us-ascii?Q?AXtrLRlRZfgXSkrWIC80Bgt2icTVn1c6I1i8GoCpxQV+wubusfXEGAOkLiaU?=
 =?us-ascii?Q?DhRpLteK8o4eqwHZLZPaHCN0jxPc1LeiRVZcXzqaGkLluZEzuLZ2Gfs+Y0I4?=
 =?us-ascii?Q?W7MpExjMyucdGlAiZn2v0RNEihIKathsavWgpc/rjd/dAAHboV9MLNJt03KC?=
 =?us-ascii?Q?xahXWFjm548Mu5K68+vNgKo9E+BKOqPn74116Lj6qCNbXii11Qj8yhLCrvUS?=
 =?us-ascii?Q?RsD+FUCMlUYnkeAKzA+4CuPHrf5hkU0R4wnET/2pTF7y0dPBvsfLA7ZMtby9?=
 =?us-ascii?Q?o7GoxM4ZYWg8RK1FkMtJE+Xs0STDdAOAQRBm4cyxmnNz+HRjcw9dJdqyd2hp?=
 =?us-ascii?Q?nbnWzgexG8vnbXMh+l7YJJccX9AUfO67K/uH3EOAfNHgyOi62atF1JuRwu/p?=
 =?us-ascii?Q?oTo5wCD7FSnKUKowc3k8d08k1TmzGqB6ncy51L8Fu2YI+gpfqIqHH5n1tguu?=
 =?us-ascii?Q?NyPPNVNz8bQcBkrqvy7YaB6Gv3lkveG+Jc8noe6cnbTIkbdXp6WMIVRWf72R?=
 =?us-ascii?Q?G4fM2QH34VDvX/H7W0iYvxXoCI3+wc/sR85C2WfxV0n3MLujkZ+aw/PtMYsw?=
 =?us-ascii?Q?7eIbYW4Zp4MTy8jQ6puE21hn31iTPj6aNz2sdNPyVRV0DUM6WbX6DmO9zlpw?=
 =?us-ascii?Q?1xVClYes5jCavXVvLgStjpwZeOeWjrOi2csARzsKeN7tdTIrE27goB6/PjUQ?=
 =?us-ascii?Q?tiwSzmJzw18iYgofi4yBk/69xwr/FUJvDAizbNXTJWZy5tjhepdNz+sjWlaY?=
 =?us-ascii?Q?rHDhgUM/jG4ULxzaFH0zG8ToYytY9PjCxL1ehtEN4pHcOVE108gw2yDbouRx?=
 =?us-ascii?Q?odhMHH+/lournHY5vYNhXzcfTEXKtqg7XNKTuoPoOHkxDVWY3EMavr61UnxY?=
 =?us-ascii?Q?IP3BfTuxHXwfqHjuJqAnoiL2rN1Jdc39cRA52CQF94vix4JD5BIdda/bDpfu?=
 =?us-ascii?Q?rPsh5M89FaEBOcoHle2q4j/DyeYgf8Wsol679xRKK0ZYxlH3q8KISmT8AxkL?=
 =?us-ascii?Q?6SbKFGk6bz3paz715NwzMCa0WnM/dGBWdIoyoxkgITUXFl0WEZ3raASCRTeJ?=
 =?us-ascii?Q?hTPi0YmuXeU3MSCS8eO7I/IR39S0Luhz0ur8Ll9drya3muZ12ilEBIHubHFT?=
 =?us-ascii?Q?jjMwe5xPuzi/SRuqwiWH7k73HeZOEkpVSFvXBvGrC1eiNVKCw2Zoul6Vf9LL?=
 =?us-ascii?Q?pt+71EbEEHYma2iiCX4fZbz2HHhDbI97afxaKiJFunZVk0T6w4nyEGPBu5zM?=
 =?us-ascii?Q?ElT91TeZUvWPyazVOxkmRnqHCbMtOGv+CKAVJBf9EwXJ7/C8IuVLdC7ninqs?=
 =?us-ascii?Q?rTlBAIly+UgH2R20wk6TVj/bEsbuYzv6a3X+l7TemhS0uODe7U6fhKeqJpwW?=
 =?us-ascii?Q?qxO5wQrlH94slgBXJ6tYFUTlt+CMWoVMbV3ULeDF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QkFsTUUOyg8s3UOtAT/aQSpjGAmObtAZqAHDL8TRpPv1+aVPNBFP7EkB1IlRBVBnt14CNBoDchGng6gddOL78KIlMj/t16JPpRAx4eDSO3teCqfpxGkk/i7N9pv1f0NWwsWqcHeC3IkvigyVzWHl5tpKJe8gmkwsipD8i3v/4Ea8UeoasAauwVCeqCaXK3tVUUzso6Kbc9Gsagwcs9Bf51Xo37jgt39ZNQg/9Ns7BvoA9uJRed1Blx5uEngZw/okPwauqqDZiw8QM+6PGxqYKe2M0QO/uTztxaStowylaocG5dl/90fUGyAkvrwfL6T/EvhW34sTEF/tyFHkTs7PkQCNcpoiqskVSgDtE8SYmNClMApENhZNZ5LjSpQ7ckeI1dW1+nK1c7EF6INl4OtAFJgf/aE0LWRES5BIrcQaRVktZdOXknJXTHRNwkIz2woH6/X0rFkhNg2BGg96Sh8U+zs+LEpDa7I+1USNy8fSgP2NvEwefe51pye2mUyDr3XKr7Fi+Ife13cXc+jwScCdohiLjgw1Bh6SiGrBHG3CM6D8diL84y9B2QMvP9jZ0IKd89z98tJozvA5eviPJoCvi90gTV92Wsl3+5L3Y+wkGPE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f72477-e8f7-4b8f-5e48-08dcc7ea94bf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:31.2303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9ccf/ObkQWnlMobpkYxQGv0WkvFwO5tYRpSEq5KNlojFAdTrttZDQN2XhZmUUnVjVXpaAZf7OO8pRoNXk/KQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: oBACzuA-lz1wJz1WTeyojsZOCvvVO_eb
X-Proofpoint-GUID: oBACzuA-lz1wJz1WTeyojsZOCvvVO_eb

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtprobed/dof_stash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 625572d5..0e639076 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -64,7 +64,7 @@
  *
  * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
  *
- *    .../$pid/$prv$pid/$mod/$fun/$prb: Hardlink from $prv$pid:$mod:$fun:$prb
+ *    .../$pid/$prv$pid/$mod/$fun/$prb: Hardlink from $prv:$mod:$fun:$prb
  *    above; parsed representation of one probe in a given process. Removed by
  *    dtprobed when the process dies, or if all mappings containing the probe
  *    are unmmapped.  Used by DTrace for tracing by PID.
-- 
2.43.5

