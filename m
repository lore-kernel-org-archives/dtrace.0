Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F9188938
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730132361; cv=fail; b=OY1QiXfg0+Utv6G8WL7E3QyfBSkPkE9d9qg3XJ8oJ2+B8ds0y2LwLGiZwjDoYGfBSa0D5vXHRXkPA1brYaC2IPNHIQPnYSWe15hTyEPuXugzIl5gIt3sj1oy1QKIL3qzl3hRJzZsAhckmFfP53P/c9R30U4Dm8nOUdA4SFvtcRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730132361; c=relaxed/simple;
	bh=KdfLgJJADB8ELXz5mPJEaMXb8isxehbM3FAgwwtHWfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cIxf4DEihXXGhGkFv7tRM6spUM1vFzJea5tQkxlnJXr54Y3BPLspyYNJxnrkBz/nZqi59e1hoJ7JgOcTQYDCmT276PhOfKtCV8duKqrwHyDmX51Re4e8h2zy9M1GBMP6A5waCCn/YJm/hFl61Qijpk8IGH9mI1IBxphGJFu6Rws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S0T8O5iD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HAdlMfa9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S0T8O5iD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HAdlMfa9"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtc4X022376
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=wmKg5cQF13smeB+eqJ
	e2Ppo0y53Y6QihMOkahevFWT8=; b=S0T8O5iDXjfpvVbwCg/Pd5PBlLeLsQPz+i
	6ix1KFfQ/4z8quYfWP81os7ZppOH1rtkdTICSYmrzvwFLuRtiEIqEuODc72e/rEW
	TSymWzEE4e8dfP9lK9fjr3+YztWFGyhma/a112lZLtA4AECdES1zeUiKrlSMWlrD
	qCly530LvDyDldJahEx5aozpeVeYNZ0a7v3RbZPSET4mncTFbsmyjCW/IlcbvcbF
	XBbibcLzPe6W6hBUwpNiQPN6bRaN+Y/zyHgrt+AkwWqKIkE+n9ddM+YjeynhA7gz
	I/Qr67JZM79yyXrKootyVlLs5/0XbjkOMuMFU61V0XlKTH1IOhzA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp39ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:19:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SG4CTK010118
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:19:16 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn8vcvdu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:19:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJjjTVlU/qFQoWQ3KkzRK2ivS90jZCVXM9cbZdppNapIBOb9JVRzeMxC76ocul0ZfaVAcTsJkRtP+G5mQ+GVfJW5bt+Y+HJnaqMdc+Z8plVUviRfCPlwnru2j+9v5rNudEX2PNE0GYw6Cjj0oMpyn/pkJhcaPXBKbaU8tu70vAZNe7VvL/6iMLzOW3XR6npklcHtPlwnFGf3QVxNNmhfN0l7L5dyLKK2QbzFbaZM5oyfHcwKMGcJFQrxnpE2pHKn7NCtkXqRaXtXYmSZaAQpj/beKgfn781VyrPpc9OG1GlpBRLLDJUu8Vzrte1/ObRrD+YF7/DqYJxLVOyzbEV4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmKg5cQF13smeB+eqJe2Ppo0y53Y6QihMOkahevFWT8=;
 b=KfJdDRKbKJny6AJqnMQYOs/s3o9AdgydeTSkTZhlFHtGsMBzMLcXRYJqT+2zkHW2KFs0WjHJ+TcRsctits3237zbHz80gctndY7hnwwWWaTzr9qMY0hktt2RolkDWxS3afoKTdU6S2770wTtYX3dFWRpArOo4kXFV9dKzWBoz0KaBn+QrcbyY/9LpkXAuNnFcMYUQhTsyMAyqRH7wIQOZ+guBobuHnAqInHzdL8fCYzVX8FQoAUuQf01HaG9Ay7zd5S37UjO1zwfp352v+wyQsDtO0HIJYmiiZNBLZBgGdb1eaL6xT/LOXhPWG/XXEgSpJ4wcbnqoZOMApEygaG2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmKg5cQF13smeB+eqJe2Ppo0y53Y6QihMOkahevFWT8=;
 b=HAdlMfa9sVD8hY8r72vVGtYZx9O8izq7FpPeZHV/3JVH2ori9gBjLOdcTQUxxVqlpV67N0k05mxEDGlzazOSPLTsJNHw072o2wa7jZqC4/ip8tHnRW1w61A6TG2Bs6X/IQ5OnBnxk3q69Lyeoax0GOwEMxYHCx3e8TKQHwEucWA=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DM4PR10MB5944.namprd10.prod.outlook.com (2603:10b6:8:aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 16:19:12 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 16:19:12 +0000
Date: Mon, 28 Oct 2024 12:19:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4 02/19] Add a dt_provider_discover() function
Message-ID: <Zx+5fSxGQpMEeIGO@oracle.com>
References: <20241028051836.16792-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028051836.16792-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BN0PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:408:e9::24) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DM4PR10MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ada7a7-b73a-4a9d-6928-08dcf76c4290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2GInKjxIzzj8iTi9i68nv8yXupgv4wR14uKtQkUXeAO7y8S2wMuh3A+HowFk?=
 =?us-ascii?Q?O+rF9qdv0IolcIiDS2JkLbesckySmhLBx4Jc4fb1ekQqVweYQobHZQwTP+Yc?=
 =?us-ascii?Q?Z7awybKtG2QTBIhUguFHt4xdZwWKOFODUnSsi04+P2Bb0wbOkB2iyNPpaCZL?=
 =?us-ascii?Q?DPJH9RqqtgDKv4B9KH6lBJFYb3pHGjaulPETQFl/sTNC71Nq1vKTga2KD9zC?=
 =?us-ascii?Q?YMRdHs57oQ9MtK6mz0H2DOcOIpDUxZFIG6MeLy+4FxvSz3AO2wcF2FRL18YR?=
 =?us-ascii?Q?6wY63C8Ckv3p6mMpzfzfkL2pfR8qGyFJYFM5A6fNIxK6cJa37QiFpwT/D0tF?=
 =?us-ascii?Q?UTmO2lh6dthahkLzWHY5vnmHP3BKj0uKsxIJHE5Q+I/wlnMBcoKwPSkwikKK?=
 =?us-ascii?Q?qXC+L+lsjsQApICp6alV3ynT41S5Q9ovZr9EoYxGC6w5ZtVlEmUlERg+xfK5?=
 =?us-ascii?Q?RNvdVcaW9cClCDf7bKkgInFEVeHHAg1TkL+E2oGLIDIiVxhbHkMHhwAAxjAq?=
 =?us-ascii?Q?y4rgmqMMNPYx1OYf1PGZ5iyK7gUjy+wxKjm0ONCgx7aJdhJjB4DZRvPhWX7L?=
 =?us-ascii?Q?cGoP8mi9Fj4x9zDfHAr387VMUre0N68Eo/LUZtAh//hGBmZ/QYwNxFFPzao6?=
 =?us-ascii?Q?tT9Bg4neNxws01UuglsTFBccxueemqoPwJjkxmgK78cAkXBXUZ6rugYCH5Pk?=
 =?us-ascii?Q?v5OjMv5VTX0dNGI0jdZXgn72eXDo1LZQbs4V2VF2vt4/l9ZsRhHkYD5pdmoZ?=
 =?us-ascii?Q?0xt2ErGHotMy4m8X660sHNsdHImSFPiUUHRF6snjuRaslbZ2Qi79jMDT03Fu?=
 =?us-ascii?Q?yyBVFTZ7cVUskiaCp//J5Z9Xp4KeqHMFACUzUf6eKluXEE730zha0D3/VCds?=
 =?us-ascii?Q?hr8tUwf15m7/PNXkHLHUFVvYLFhLQoJsIAnP0EZ78bAgef6+MtKBZjEtKHMP?=
 =?us-ascii?Q?TBC5JW9AK+A+7OTvLB4nnHHf/uKnZZRTl38Hu4vzyThOecWjJZAUJPpKTl/S?=
 =?us-ascii?Q?sBu6sduRwlA+KpnOgsZS4L+pAJ3bmirG6FmAHGFYECrbdq/8EUR7o2cqfFSs?=
 =?us-ascii?Q?bOBZLgSk1XyvT2Jt2YAyqCFcCUztMqZpheWsdjFC9NhdLpJ5pneEhPPhV05V?=
 =?us-ascii?Q?VNp4qw/HqKH6wHCP3IMGbJXv1DYPvasQq+thpyZn+7sK1PJY/UOOj/mXs7TJ?=
 =?us-ascii?Q?se2lHoS1hMe4jCc/45Rfufe/7OaEfF8T2U/UNDeYNsdO7dcw00BVjZxSHKYQ?=
 =?us-ascii?Q?r6C7OrogYt7Ji2f28R7mVMIy0Ig0/OnchxOBInkvzCOyCWGzymBXZE6jszBL?=
 =?us-ascii?Q?HEoYFfhe5IDnTMGuP+SxyO84?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S3b7jWLdCoM739j+jLzm+hrK/TpdNsOxWmDM1oGdb9LxCuKuTuV4+8VMFrN4?=
 =?us-ascii?Q?QXTRXy2F13a5AgVxxaIpUxBzKO7sf/P3og4S0wO9mYyi8ftXWfN3Ci1/ii7W?=
 =?us-ascii?Q?dQHzfO7ulNJJ4iOYGd4VbmfsFu0wPR3mWr8kZr6QiEoo5+GZhEQ3o/GK2UQx?=
 =?us-ascii?Q?wQXZ6oUEXM7wEGLxPBKdg6GwhDr2XMhhKMVd19Wg3FSBFx09Ekpnx0+2iJOz?=
 =?us-ascii?Q?c4xDBk/j6vx0SxvjdieJSpdiSP+RyGoIRI08fcr1zBYle4kHMIXYCY2DZnh/?=
 =?us-ascii?Q?G1W6QiS3EyVZK837H2hx+sk/+YgkBHAgOVMQJedWk/RniKRCprF2jFqHWw8c?=
 =?us-ascii?Q?pxXBcRXEeHlds/b3htdziyb2BcO2DBYV5Z9xsIINIPQ8XJoY8nMsNd9tdgZ3?=
 =?us-ascii?Q?aGFkNzwpcAv8bOe1HOujeqheOfA3xRM82u51jesdTcrq8Ol+AXxCWdWEoPcD?=
 =?us-ascii?Q?5Hfe2yO4bXSSkonzoJsfQFps2AVGAWuXWxZwYODze8EymshZ6cNaghREXiz+?=
 =?us-ascii?Q?oS9yu2+lfdm4EFKY2BfhBFM4jXM0cHp5dP5Sa1QZBKbSaaHLhIf3bWhuPr0F?=
 =?us-ascii?Q?xcsqEXp83zZEN7S6omr34ACViVyhFgHoRHd3kcuu36aKVbtvFe4s3DFcLucs?=
 =?us-ascii?Q?Ru7c545gp/UJdpvJ+/RPB53nDCQ+ZAe+tv/rTwIBD7Sp86FWn8NPqYtwDJ0V?=
 =?us-ascii?Q?XsbE5mJKWIo6DWMUTaekok5PxQsCKzoW9ZW2sp0gcOMAR8n9W4XGpbFSvczv?=
 =?us-ascii?Q?algVgxMZJXUEVCATr87ZY8+tu3wbkDQXE6w64vsdtUWM+wRt4VGj5ZS21FVR?=
 =?us-ascii?Q?xFcFUqrohqBDyAf0iU8XMFpWy5Zj9osm5E/bwYZ6qW/ddrv1/21NdIgmTPpz?=
 =?us-ascii?Q?rBVYgpfjF6TKC1+VuWlQaQT6fxHXKZ+2jAg/53JopRtTadbMgs4ObxcHQIyy?=
 =?us-ascii?Q?tRzGOT1cnXIcGWpOUYzOBWwlm4rgpI183KLXbTKeArHs9waseDcnokr02ocM?=
 =?us-ascii?Q?lzqSuyQrhiSm3+rkXLQldinTkqoGxWGcsA04LWel75I+DJb6Bnm4A3Kxh7eD?=
 =?us-ascii?Q?z2jpZSo9o0V4ke44MtcqYU+FN+WEP9RnurWSxmDdNSIHSqlXgq4BPsQoCwIV?=
 =?us-ascii?Q?W+S9qr1UX5Ow3dUPzbxaqmbV+vR8jdbMQtUeW+zPI2inEX9ULOspB+F5mmnJ?=
 =?us-ascii?Q?XoEa+Xhwv+A6YM4nXN2HB4D7PimvkjQYf2OBiwZlUCir/vdzpIzXmCKWmeSW?=
 =?us-ascii?Q?iFdL/BEx3YTJh2+dJzJuqt9arI2iRTlGBeCYh4Evceg4OIy2L/EsM5qssZgF?=
 =?us-ascii?Q?kxwNJnosPWo/z0W/WtKw9Um3QLjosWipRN2FiSFrCbKkaRtzCJA3UqixesLE?=
 =?us-ascii?Q?+aTfdyugLr+jeocwnNawygcTln5yj3XvfIfZdBKiM5I/nXobxsLZnQhD7z+S?=
 =?us-ascii?Q?fRaxbOyxPEJEwY0f2zbtK4Kth8KzhrGw1gxgMVq2y3IVL0s2IGsi+5kXu/pC?=
 =?us-ascii?Q?wvRPl520B4wTPNXoXVrHQWHIbEvQv4DDrQLVQtQIO3BB4cZWWlXQ8G3FlBVD?=
 =?us-ascii?Q?wNKSsIQ3tO68p9Hu6OUNZStYADCK1LQq2rVVM8mI1up+gYJFfKNzqullhxKq?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7KYmqjErOPCRqFYBJq44VuDsBgryhLi11aKKkc7wdgYYhUQNtnzH1MgHApALbRJmrcfL8fNhChqA3yTaHTRp8NBIllEs2ZZbNvFh2AMmgm8QR4WBFGRORi3vZGnUnIEBvrgeAbd+5yZk1ag+7CcikM5Dst7P969Qg0xOU+34eBOWClXB+pcoZKgIbJfY/D/LvVJrUqAWkQOGAkfuTHkX07iYQSpCG4GShiBUabPfF/2xySvww80SXAIMsl6XCLzFMabxP0JT/S4evbIEMu1AUg8o3Cc0Q9a86NyweBgwPh6cR3aEOwc1IfNmKjHAe6AZ1umUtA3hqYPh6rlTrrIn95iTmUVHfMCkXrTGAybSIqL9d/wgsD608LkHIVw516UYNs6k9GLlOYBNpQzeZvJUdP1F7PUlKoHlWL6dyudtXMbrFXecZ/DoZH3Ed1ReJQqpFokrk594asFtN+xdxehAWsGAUz7bf0QNKGce0ab5Qqy7wTI6suidbcKnfz9bupFkZvtwr8hpCu7rYKQg7iXse69GKDhx/q9Hkzqn0eTImZiy+louJ2vb+qUIQUEmGBIqdpPEZH+ap/WrnVz22asuMjRWrzoLqpU7pgKf0/QISyA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ada7a7-b73a-4a9d-6928-08dcf76c4290
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:19:12.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Syx9KTWhzHU+MsQsoFeztU9cFCCGzBCb8gg+LaFVru5cbOJmdvlkptFEAuy8mPUvHpV9lohGl2NRn46KxxqKf7zDm4BII/huKLkpfC1SCgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5944
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_06,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280130
X-Proofpoint-ORIG-GUID: vw5FUyCHDVSXTu6ttpywlNBczzHk6gxk
X-Proofpoint-GUID: vw5FUyCHDVSXTu6ttpywlNBczzHk6gxk

On Mon, Oct 28, 2024 at 01:18:35AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> It is possible for new providers and probes to appear after dtrace_go().
> Add a function that can be called for such discovery, on a per-provider
> basis.  Each provider that supports such discovery needs to provide:
> 
> *)  a function discover() that performs discovery on behalf of the provider
> 
> *)  a function add_probe() that adds a particular (discovered) probe
> 
> To support looping over providers, move dt_providers[] from
> dt_open.c to dt_provider.c and extern it in dt_provider.h.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.c      |  4 +++
>  libdtrace/dt_open.c     | 22 +---------------
>  libdtrace/dt_provider.c | 57 +++++++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_provider.h |  6 +++++
>  libdtrace/dt_work.c     |  3 +++
>  5 files changed, 71 insertions(+), 21 deletions(-)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index ad11d178e..856110306 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1275,6 +1275,10 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>  		int		fd;
>  		int		rc = -1;
>  
> +		/* Handle probes discovered after compilation. */
> +		if (prp->prov->impl->add_probe)
> +			prp->prov->impl->add_probe(dtp, prp);
> +
>  		dp = prp->difo;
>  		if (dp == NULL)
>  			continue;
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 848141ddc..1f586fc4f 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -61,26 +61,6 @@ const dt_version_t _dtrace_versions[] = {
>  	0
>  };
>  
> -/*
> - * List of provider modules that register providers and probes.  A single
> - * provider module may create multiple providers.
> - */
> -static const dt_provimpl_t *dt_providers[] = {
> -	&dt_dtrace,		/* list dt_dtrace first */
> -	&dt_cpc,
> -	&dt_fbt_fprobe,
> -	&dt_io,
> -	&dt_ip,
> -	&dt_lockstat,
> -	&dt_proc,
> -	&dt_profile,
> -	&dt_rawtp,
> -	&dt_sched,
> -	&dt_sdt,
> -	&dt_syscall,
> -	&dt_uprobe,
> -};
> -
>  /*
>   * Table of global identifiers.  This is used to populate the global identifier
>   * hash when a new dtrace client open occurs.  For more info see dt_ident.h.
> @@ -1210,7 +1190,7 @@ dtrace_init(dtrace_hdl_t *dtp)
>  	 * known providers.
>  	 */
>  	dt_probe_init(dtp);
> -	for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
> +	for (i = 0; dt_providers[i]; i++) {
>  		int	n;
>  
>  		n = dt_providers[i]->populate(dtp);
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 8cfef0ba2..5f9766183 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -18,10 +18,32 @@
>  #include <port.h>
>  
>  #include <dt_provider.h>
> +#include <dt_probe.h>
>  #include <dt_module.h>
>  #include <dt_string.h>
>  #include <dt_list.h>
>  
> +/*
> + * List of provider modules that register providers and probes.  A single
> + * provider module may create multiple providers.
> + */
> +const dt_provimpl_t *dt_providers[] = {
> +	&dt_dtrace,		/* list dt_dtrace first */
> +	&dt_cpc,
> +	&dt_fbt_fprobe,
> +	&dt_io,
> +	&dt_ip,
> +	&dt_lockstat,
> +	&dt_proc,
> +	&dt_profile,
> +	&dt_rawtp,
> +	&dt_sched,
> +	&dt_sdt,
> +	&dt_syscall,
> +	&dt_uprobe,
> +	NULL
> +};
> +
>  static uint32_t
>  dt_provider_hval(const dt_provider_t *pvp)
>  {
> @@ -149,3 +171,38 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
>  	BT_SET(pvp->pv_xrefs, id);
>  	return 0;
>  }
> +
> +int
> +dt_provider_discover(dtrace_hdl_t *dtp)
> +{
> +	int i, prid = dtp->dt_probe_id;
> +
> +	/* Discover new probes. */
> +	for (i = 0; dt_providers[i]; i++) {
> +		int n;
> +
> +		if (dt_providers[i]->discover == NULL)
> +			continue;
> +
> +		n = dt_providers[i]->discover(dtp);
> +		if (n < 0)
> +			return -1;        /* errno is already set */
> +	}

My apologies for not seeing this sooner, but can't this simply be:

	for (i = 0; dt_providers[i]; i++) {
		if (dt_providers[i]->discover && dt_providers[i]->discover(dtp) < 0)
			return -1;        /* errno is already set */
	}


> +
> +	/* Add them. */
> +	for ( ; prid < dtp->dt_probe_id; prid++) {
> +		dt_probe_t	*prp = dtp->dt_probes[prid];
> +		int		rc;
> +
> +		dt_probe_enable(dtp, prp);
> +
> +		if (prp->prov->impl->add_probe == NULL)
> +			continue;
> +
> +		rc = prp->prov->impl->add_probe(dtp, prp);
> +		if (rc < 0)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 17b1844cb..384d4fd33 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -62,6 +62,9 @@ typedef struct dt_provimpl {
>  	int (*probe_info)(dtrace_hdl_t *dtp,	/* get probe info */
>  			  const struct dt_probe *prp,
>  			  int *argcp, dt_argdesc_t **argvp);
> +	int (*discover)(dtrace_hdl_t *dtp);	/* discover new probes */
> +	int (*add_probe)(dtrace_hdl_t *dtp,	/* add a new probe */
> +			 struct dt_probe *prp);
>  	void (*detach)(dtrace_hdl_t *dtp,	/* probe cleanup */
>  		       const struct dt_probe *prb);
>  	void (*probe_destroy)(dtrace_hdl_t *dtp, /* free probe data */
> @@ -86,6 +89,8 @@ extern dt_provimpl_t dt_sdt;
>  extern dt_provimpl_t dt_syscall;
>  extern dt_provimpl_t dt_uprobe;
>  
> +extern const dt_provimpl_t *dt_providers[];
> +
>  typedef struct dt_provider {
>  	dt_list_t pv_list;		/* list forward/back pointers */
>  	struct dt_hentry he;		/* htab links */
> @@ -110,6 +115,7 @@ extern dt_provider_t *dt_provider_create(dtrace_hdl_t *, const char *,
>  					 const dt_provimpl_t *,
>  					 const dtrace_pattr_t *, void *);
>  extern int dt_provider_xref(dtrace_hdl_t *, dt_provider_t *, id_t);
> +extern int dt_provider_discover(dtrace_hdl_t *dtp);
>  
>  #ifdef	__cplusplus
>  }
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 11335345a..5318cdb7e 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -362,6 +362,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
>  	dtrace_workstatus_t	rval;
>  	int			gen;
>  
> +	if (dt_provider_discover(dtp) < 0)
> +		return DTRACE_WORKSTATUS_ERROR;
> +
>  	switch (dtrace_status(dtp)) {
>  	case DTRACE_STATUS_EXITED:
>  	case DTRACE_STATUS_STOPPED:
> -- 
> 2.43.5
> 
