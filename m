Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C4C1E492A
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762788485; cv=fail; b=GUnVqRgnHxoyXyS+rK6KCeNuTaOgIjbz/nJOQAx61sijH9jZHo82pdrih6+/pnJ9K6WZbJlDDYqvbJ0yC5EAFSI6/urt8HjhMTQk6zkDSJrD56KEkhQMMt1rlfye6FF8Fthp6qAIALeagFdcoezjrmlMzDDjsYnQa+TrfiWFmzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762788485; c=relaxed/simple;
	bh=RAI3fDPWIYSrPXyIG1jdozRtNVwXt/q67xHaw6D0rj4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=QLSVLHut+YHjXyrm/0YShXCvq75izJeXFLn4p+ZeCeySEh9KpiRpOuIvpbc7qPmIs1kFTCV6Lq6aQw6GNIOFyyoJ5bY0OZ/O2hQqcxQbZ1ppr+9puvWbbs4WfcFab+9PaqzGPwhcY4m1SeA2g/JIreXTZGeunwxM+dJ0SQlBm9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oAAuYW2F; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j2xqqj8V; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oAAuYW2F";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j2xqqj8V"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAFFFb6005593
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=eIc/4i+zRMHjNyDUeGmTWn+2hUQZQqS3RiYZkJVYikQ=; b=
	oAAuYW2Fg9KGRBKvId2ge2DU4h2JRPT9gFm+T8b1LvCpOSxJTEjLTVKu9JR5RBlD
	7JaMpPj4dDvOdaEdKwpTUkBMwaRtgUpglrM+9hwUZR7yGKFxhyIjAcUWuGLizDfS
	sl943Hm8zavPFTOyYpULZYw5lmzlNhA9AgfZGN6OqtUjaONlwDCqC8pzypOMm2mp
	AgeYpZSzoMk3+fFWT+f9nRqXhDdefOEaK5x1dAGAhGh2DpreLG9tkN9jvdpjHWas
	jVZ5NF9N/wupNtQKbspVV3isb4gvFjDjaVPHKHFde6PvTVz9O7nfzkdY6eWMuO8B
	MyByMgaE4fLHLRLzWSk6zw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4abjhbr118-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:28:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAEHEwF007578
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:28:01 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013035.outbound.protection.outlook.com [40.93.196.35])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9va8t96x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:28:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJCn8RNM+VsXPdpOuqBMia31jGenePJieLcUGRiZpt8uluvQHSueuWUDfa8gi4QGH4HzMdcrJfBhaiJgmbgINd99D9zQJ4vxcSgHb1KQFEglhNzvNf/eWUto8ia9vc3RZySmLfMEpnlz44k11S5KkhitLxXY+PujMYbD1ioh2bMKVa1k+N+jwBWL3tJ5qA1N22s7+SnWwcs/lns1EllTUlOhsbobztoxhL3/DJ0qesCKw0/pmibE4glT1pqMWg6PYPAQSbHjgH7bDteeInLSQYuzdflH8tFLenY3TuTH9u//pi6vR+KD7vT0/t74Z0xWtCPoGTqJ77Rg+mHor1HwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIc/4i+zRMHjNyDUeGmTWn+2hUQZQqS3RiYZkJVYikQ=;
 b=RjUCZEULNyepaUjtCws3PJNKhfJicUagG9uG8IxgYS+LvkIxD0F3EKjNU2WzbsNVG2Sn1QRvnES6k+gqh1djLysxLM0hPwuQhgoVAkwzwYO+ADmPKwZQEpIt13tW/Vl53WMsbdnzjuvoOkjXBTa59H0bL9dJCE7ecAUjy7n1ocsvh3O7d4Gh4hrfBcE2ZBei0U1CUIduYyi68uH8Aqehh9kTyUEFo19k5ND+rmIna20gQfYhVDZfQKdaIxcQhU9dPQWdLLEVoKw6bQGFIEkTQhI8ooy/ZQNO2NJbMZlMkV/9XxzKP+f1m6Ll7ClHZJRuz0r+p8SJ2kjoUs7OUUIDGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIc/4i+zRMHjNyDUeGmTWn+2hUQZQqS3RiYZkJVYikQ=;
 b=j2xqqj8Vkth62vufYkdeNTqsKUxR4G+QtLJDRxGVQbmF5hQ2Ux/k2PDCh5Q3MstI5Bjn+aVOt6Ujnwq3ihzdXTr2X+roE0MuPmkP/+g26B944EKcwJKemIE41FV37IoWzrjPu4e0Na6dVbfJIFAeEYhXs8vTHBVvrgpKchjtPwU=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:27:56 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:27:56 +0000
Date: Mon, 10 Nov 2025 10:27:55 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] uprobe: remove unnecessary enable_*() functions
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB3987A07CB117002F8016B825C2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SJ0PR10MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 156fa001-4bd6-4756-3b19-08de206db94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eTTXdB0y3Yjvbx0qyFr3dOwgTT6/d5+cS8zXiQ11p0aro9gtdjuS9aefOSqp?=
 =?us-ascii?Q?a+2FxS8QpcBqylvNY34VPypLvm53ct8a2BTWVYX2J9+xuk4GKbJ7t6lvfFNr?=
 =?us-ascii?Q?Wsb0wBGwhWrsjApwtGABtugi2dEe/O5yAo4baERWX0HsvGzVLTAu+M2vybJt?=
 =?us-ascii?Q?es2OlOsi34hOFihCf4S6fo4t51XGE6HbcHTrmLWxI/0FIfNY/DoQR6+ng6R7?=
 =?us-ascii?Q?9eITBG2IhB3mIyYcAsiD5euut0f6sbDn3w6SAiYdYU/1zmIa4zVxMdTbKIuS?=
 =?us-ascii?Q?G5kavJQscX6uR6LsaReOSuLjMeYAViwHfEBV87M5NQJ/3AsPbXWld628osvS?=
 =?us-ascii?Q?AbymJebWq01qkEb3G/37m1dG7kSviE6srVGME8ibQMBi6TbDjTb8MMF4OY1x?=
 =?us-ascii?Q?nguAMT6/TpQTDSuYuwBOsVHZ1Quhe0Cr3XmTh3qgmEBbngnES+u/+flNN1Up?=
 =?us-ascii?Q?QUjKRQn9KTKacSoey2DAyHhsplsqS/OPjo071cYKDVi0cVCAbcP2f/h/8nnu?=
 =?us-ascii?Q?YygNmos9RQNDMAGBadR82SioG3u80aRjJlAiFCYAl5UR0ZIkxf2AamW8CdTg?=
 =?us-ascii?Q?7xZCmEnNjHg1OznElVA/OEnFYKZr1Yh5VxtMzzNnhxaznJhxiL5+0APm1jd5?=
 =?us-ascii?Q?0v65zlAukTlw2Wo+pW2U62tY/Elj3w28th8OKXYR6mduEJg+uLrUfX9Ptv30?=
 =?us-ascii?Q?h5f5Zm28v9vZZWpvmMTPayrdXwdKoRKOTeHNgP0JKWG/rFJDLLYNQVTaCSM+?=
 =?us-ascii?Q?Cw9dJjMkxabrmErWi+W3eX3KrJhX5srSoXMxo6eebpFqv/XKkdQzsqf5/k30?=
 =?us-ascii?Q?3Hl7ac+956JtKIECMCrt3gp59k3kj5ONa8Y8MKzCI2+BCx/RbLhtWcOUR89a?=
 =?us-ascii?Q?gv5QP6UezqwkAbMVsRpsveG2vDBK1LZEkG/s1dakTC7tollbXgDCBUDfMUic?=
 =?us-ascii?Q?W0FeMrpRu0r/nh9Mlvxx979WtSL2nr29ROY28+BgMapT7nUHRCRWoou1wW1E?=
 =?us-ascii?Q?ge/deTE90XFgaulSnWP+XT7b+JpQDO4CM7RUUAOfkseExXpjmLc3VAn30rsv?=
 =?us-ascii?Q?CiMSyXn53FP/y1oFubw+7vHtxm4h74W+pUE0wwyq5ieW8fBs9GRSU0xLPkWz?=
 =?us-ascii?Q?cvSfAA05heAdtAUbjDByJu9IyIeVEeX8kTIL5tH5itGIVGp6MxJTEM0SL6eo?=
 =?us-ascii?Q?t6XAcFkAcb01Kdaaj5e5HJpWMso8nrDh84cQI36Lqcpc3dt2xXQmIa4uB0br?=
 =?us-ascii?Q?F0DV5mYIUthUy4Xox+KxuNThFb73OnJeWmS8LrTab1QP5OyexFwoePI3PNw3?=
 =?us-ascii?Q?locqx5SZBikkw1D/dKmIrmdRBgIMLqDnT7/TXVJw58y4NZghV/J8lPg25n/k?=
 =?us-ascii?Q?WZaht6hkIfkALXDirW0FI3gi1ImYvrUtSVNJhAZ/mDK78Tc88ZE1fk8C0BAC?=
 =?us-ascii?Q?nT5N4GPY9KR87hS1+pmSgjAzVMTUnBFV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qdz9E+deVWH5cq5432zpifFhFs79ph81cSixVqV58O3+VnrA46Fo4+RK+FsB?=
 =?us-ascii?Q?2DH8hTZUSaaXBUHtU75DFJtq/ravrZYSpxvpcvgtmqGbHP/k+76DccdxrYUq?=
 =?us-ascii?Q?z6FVW9CmZVDqMfU5/TzYWd0xJUdVtjzaGFzkQgx8+4PYXiz4l+RMZYxKgkPi?=
 =?us-ascii?Q?MfJCEebYx30QEiN3czX8wM7cM8wjgcZcCwdK/mxK8wKmw+72WvvkxjqjCoSa?=
 =?us-ascii?Q?L+1/9BF3cv6oHNsIYDPW/LgAkWnECNVp8kO5WAUGaXP0UBhjEcLM/ewlaxVh?=
 =?us-ascii?Q?1BfBUMPYM3Zr0YiUhmtw4upbq8+ytL+cKJYc62G9dSgamLAWLFJ4dWTzK4BP?=
 =?us-ascii?Q?hihwUCdOsRT7rdRE1o07MJtRVngWF7lfs2aQb5KtMsUO+lWPe6y+KdmFjxQ9?=
 =?us-ascii?Q?nefSr3xrLxtu04UiYD9vOE7UGK5NStWIdqlY4zL4CxYhsocz6bZb8zmnWlT7?=
 =?us-ascii?Q?ivPzm4Tw65ZQsT6LeWnRFnmvPj86uf3zFSuVI5wV2ebT9XMbENr51XT69N1o?=
 =?us-ascii?Q?Qdt5FzVdyr+/ZDj3mx8WZyil2cbkSIbfo2lEhgKV/+FQbx7thm7arSJeMFJp?=
 =?us-ascii?Q?3FNqSnzhMp/4FP6tZcHY53JD7fHdzw8TbCulJU3x5GtPqG0ZUSe9R4+qWxmL?=
 =?us-ascii?Q?O6/IGkrkr7B3v7CE6PoftKzDtScHO7+mHWtRrboo0Mwnx+FP5mW8YqHXYLPm?=
 =?us-ascii?Q?48mtVbC8yC5sRdlln4vVvLC7VyUcVBrnONLlbwkxWw+MKz/ITIffgY/W5MoH?=
 =?us-ascii?Q?n251V20XX/gbTHQ0JPTT6p3h9C34VcsifFhJQ/Erc5Jhhh6qVEIIabV1KplH?=
 =?us-ascii?Q?uVuH5tMF+lftWNuDgqu7aiVv1mWthcIj7QOsbtwMw8y7R5IvQvVQIjUhqn6H?=
 =?us-ascii?Q?14SRMql/VZJXIQIEkC/+K8Qy7r1nSElZotgxIZBxLLF4F6s3Ha7hCuWlypy3?=
 =?us-ascii?Q?C2MXhgVqCVLUFHDzI+SkOFMZMTZyTi741SuGVGPlrxSEKVh6mxibtRTHgN6n?=
 =?us-ascii?Q?KWWRpjqoJ9BB3BEbpU19BXVQaLg80ohOouprM10aMjXDTR2PlClFCo0Gkb8b?=
 =?us-ascii?Q?kQn3hbCkhdAtHtvAiyKCvwhJCy52qiJn9b2PUWqoaMm5MvXhQxjcqMi/jWXF?=
 =?us-ascii?Q?Ld8cqrvn8KLHDM+mfeD5sPM81B4IUr1IHymDaXgRuP/RUluYGSFzMCyfQYbL?=
 =?us-ascii?Q?LvJUHnPpB1ibtFrEYEhNNmpvD6RoKWxk3d7REfrBQMa932C9ezAqxlywBg2F?=
 =?us-ascii?Q?RJh13i1JMvQTII94kK0kLfDN7ELONT/pf/CVqNVc9QMBbP+fBzUN+s1v2OJD?=
 =?us-ascii?Q?VePy9rhYSnaGuZucOWQ8zllJLLiuKi8RxePr7KgWTGpPKCde79cqaHxZ/egI?=
 =?us-ascii?Q?BxY0AcjmYx/R7mW4gnI/jlz/gzk39Onff/qEcpVsWIW41742RObN7Sn7lTUM?=
 =?us-ascii?Q?nosNgaR2Y9GJ2XjaxYjDIt6OJ6dqPeUPYFe9V4FVdfdPDvT0drCQaFoWBw42?=
 =?us-ascii?Q?Ov2Zi/woShFUFBCHsqgKAcNSRZsW1+EpnZFFkbgZ+IAoxi5T5S/iG/T2S+Hv?=
 =?us-ascii?Q?w7r9m5AP3nOLLGFviTE3dyXdMkX1WB4JEm91pKoxcs7INP9zvZFAxjbQePas?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XsI22nhTqNs126P6+/ctCkjE0oeOwFh9m3BnJ+AUX60nHcfuTW6JLcLvsqrfum8yfBE/qZN1Jw4LXGFxrGP5Ka9w8KMdfDNlxD3/mT54R62EtAXTaYtTMC8YrydhYmKPfT9C9phZUBpuddqoRk5ff+sahI6nZ0p3NtdqfsT2ozKtqOtwAqk37ZbB+VQlvIs3+2a7zlSUX6lg7gd6qln9Dg2Gt2y5d+6oy9NumpTlXGYjtQOac0zFB/hekOkNkUTgeCC3uxhAZ5Wk3q7DbbpxQn9l1rs47b5VzTkPjRVvxZB6wblysEjEyEYU7Qid2XboYIGMyJmcHM2nPhMAalGPNyEVm7xOGCfhHWZPcxe7agaAf7RkxPZ9MYjZ1iqiIG9l/6IWVNTv8LiPOeKD2OqIUwcmf8SdfCOq8fWU8/5yyaQ8E7jxM8Ut4wKioNMSmPEI0HPSXgd7bPgYBsRo4KK23LlDdJJ+E+Ktht0TtL5v+ufSwMEm8twO67AmPdnTdCMv5uXcNCy5jtOBoWIjdGdHJuL/GMcin71kWkIs91IJCoMBuGTVX8yNKvImLggFZJCfzDaA19KPAuACmMLKMLaXjR0Dg4O7PA2BvhbnLxbPthE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 156fa001-4bd6-4756-3b19-08de206db94a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:27:56.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CtJRmEKkuiUyJgVlbrSxRnLS/zhT7uCbAZujPC4f8TQhdRc9C0vjQpaxgbDqoLmhIKs4nd2VBGuS/eILeNWUTFxMdIKCoNuFR3WkunTKSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5672
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511100132
X-Proofpoint-GUID: 0bt6Swt9YPhe7I94xnA5HoojnENO-VWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzMCBTYWx0ZWRfX4lqSIRI9uMgo
 YMOJ2tE4SZOrjoEyU6X1Vst5MPMQnweTy3jslP8jzsOQBcp9e/ubUa3kFkcXCSM5p3F5fKex14I
 Vhqhw/336XLz8mcvpO11T5HE0QLOVx/IlEqbQa8Xtjy9DJfUgHuyneX1LtbGRnK2lrkLa0N85R7
 7d77RZpRDa38okTg+bgiGjo18FSFTyilNWm1uH5lhbebtziPpBBYU9CyLutAOnF+kC7xM6gA4qc
 oM8oyXyQ5zYOWc/rlPQMdxzc654gKIJ+O6wH9u54pldI/mPQ1GIxnfNgwenWK2dzFcOgUm/nEj6
 PIu8VM8ZzJhOx7EZuPwopt/epH0YjT0t4koBNa8iAL5v1zx1mBw79wWJgIGKtA8TcZCptqxJYzg
 OMsfMdwmmBK3RvGQy8i4f+wxk/zrAA==
X-Authority-Analysis: v=2.4 cv=I81ohdgg c=1 sm=1 tr=0 ts=69120482 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=7Y3peNtNeq9Yyo8_x9cA:9
X-Proofpoint-ORIG-GUID: 0bt6Swt9YPhe7I94xnA5HoojnENO-VWQ

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 3b7145a5..6cea7f4c 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1166,7 +1166,7 @@ static int provide_stapsdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
 }
 
 
-static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
+static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
 {
 	const list_probe_t	*pup;
 
@@ -1190,24 +1190,6 @@ static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
 		dt_list_append(&dtp->dt_enablings, prp);
 }
 
-static void enable_pid(dtrace_hdl_t *dtp, dt_probe_t *prp)
-{
-	enable(dtp, prp, 0);
-}
-
-/*
- * USDT enabling has to enable any is-enabled probes as well.
- */
-static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
-{
-	enable(dtp, prp, 1);
-}
-
-static void enable_stapsdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
-{
-	enable(dtp, prp, 1);
-}
-
 /*
  * Generate code that populates the probe arguments.
  */
@@ -2035,7 +2017,7 @@ dt_provimpl_t	dt_pid = {
 	.name		= "pid",
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.provide_probe	= &provide_pid_probe,
-	.enable		= &enable_pid,
+	.enable		= &enable,
 	.probe_destroy	= &probe_destroy,
 };
 
@@ -2047,7 +2029,7 @@ dt_provimpl_t	dt_usdt = {
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.populate	= &populate_usdt,
 	.provide_probe	= &provide_usdt_probe,
-	.enable		= &enable_usdt,
+	.enable		= &enable,
 	.probe_info	= &probe_info,
 	.probe_destroy	= &probe_destroy,
 	.discover	= &discover,
@@ -2062,7 +2044,7 @@ dt_provimpl_t	dt_stapsdt = {
 	.name		= "stapsdt",
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
 	.provide_probe	= &provide_stapsdt_probe,
-	.enable		= &enable_stapsdt,
+	.enable		= &enable,
 	.probe_info	= &probe_info_stap,
 	.probe_destroy	= &probe_destroy,
 	.add_probe	= &add_probe_usdt,
-- 
2.43.5

