Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63AE16130C
	for <dtrace@lists.linux.dev>; Mon, 20 Jan 2025 18:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737398992; cv=fail; b=smtwETG/s8T5CwAFHSZFlkT3XWfP55Nvv/1sOYbjM5wzxVN0ACqXvdfL/vvnIG4OgaguNo8Nzz4Zpj5B1XMv1sOQuxDtmg3/feEIcI5FEQNLvEwkewmUd+tp3AY3g+Q3CcrkOCDW48Yq4/J4MEa7v1E3jqyqdYT4fRgLXBc6/u8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737398992; c=relaxed/simple;
	bh=eyE1qUmINjp84kAIAaUGbSzz/HM7uRF1SbRlghHGxAY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=o9/SEBbLu567wSwXnxeAUJQud8BL5MWvVP9QJqC2hQMz3VAYHDpff7NFvwjw08+f5ccLGZvTAoIdM7dfGosA4hOLt8j6QzEpSx6DoglzYdwKTdJ1AeNIzxqK4aqQeF0V1mcpovgRTPhoq3LYB2r23PVyd/aD931/K976JUhxnA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=egLRjJgj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QtHb6Eb5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="egLRjJgj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QtHb6Eb5"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KGMrZw007838
	for <dtrace@lists.linux.dev>; Mon, 20 Jan 2025 18:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=etDbMl8s35+HxRvc
	HZXs1WBB4aYL4gzCxWq94MRWpPY=; b=egLRjJgj+Fkr9SoaiYqNMK386dWrGzFD
	pRKLDtZViMXuUyh2h7yIu09C61+v79g2laPFafdZfwf+vr9vAe68Jla7hQ5fCouq
	dti3nJZy/U9wRariF1/jZEPBaTD4amvdFvEQOTju1ZxYn1vs0GFW1KVkB4BEg1xm
	OedhnJ7OXan0YU0nEkD340FRR5mM9bBt4Cuac2AZvlp2dA36WjjDq0OROr0v4/86
	0K9HKrS6jkaYqpOra576kht/Z3PTBl2c7x+OqnCKDtqPecjxOdIWPLEabnGN0BfA
	CgwLmZL1mC6235j4psJQf8gtCxmnls6SvapAifS8CtkoV2A5gcUPBQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4485qkv88t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 20 Jan 2025 18:49:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50KGGwEG029758
	for <dtrace@lists.linux.dev>; Mon, 20 Jan 2025 18:49:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4491fgw9hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 20 Jan 2025 18:49:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Of3r89B+dKqkRlksuMrAyFoXSyHmZOEI3FV8wUi2PgVThbvsS2lDOL3agB50PqRMmbAEC5+Iumx3Ax0zgZ8UeChqCD9rtFWl68Dqdt/G5eCDSN6pR5zwPemHIZ7T3U8kkMKaSQ8o7YrwkXiiZxaCPzm9G0yHd848qSCnOCUYXMblHg090LYNt0Yj8yWAFLDDMUTqIL7WumgRWU2m2YAcLkuCqAlSUNkBRzSL7+vK+DpRfXkG43S65Fp+RmXvx+rbsPEcgq3R0p5nZB8xK5BF0c73pTEpxgTgrdE7v5HeJrdpl2VPjXV3K6lE3mW5Hjt6tjXy+MAfoz6AYcbxI7gfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etDbMl8s35+HxRvcHZXs1WBB4aYL4gzCxWq94MRWpPY=;
 b=rQ7+S8k51iNViK1ALuxKrhe2JAAGDvG9wfiyOb+i0RFSVu83bS/Wfzgxzadx8ng3+V+1iZjMvSk/IjUBZI2ngrrwVglwJ7PN11ZU9IPDCnYZ9yG1IrbPpug0ZQf7WChkO0LderIPvjIKR5IdevND4UeB+XLUXfDxGK1epY6NlS2I9TWGJ3vJzODiUn8Es9mNPqIDYQit4RDhEq0fQ4yPGkWFD+qkIXOb2EaQfyBAH5gbZkb7qTe7Y1LhvooXtzPXAZLq+L6NKGdLeA9CFZ8aJkborn8SIyWFLgG4LFRhlf/ccPfpEHlfoTkioTygeoUMVT/IAu8yp86EGKAqyckchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etDbMl8s35+HxRvcHZXs1WBB4aYL4gzCxWq94MRWpPY=;
 b=QtHb6Eb5jtn0za10NdyVMFyvy7I/S4Pmo1ttJcMMtWuK3ARQr0nNI7/A7fDWJHUp2N7CwTVM8wpsnv1azhdttMpAg6m41wzLwIb5BOl0F0dCX1K50ZhO+RXVmCChq8BZOiFj5iN85n5YCVE17XhNPbRFBXzOee3hvpKtpFW6cfU=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MW4PR10MB6632.namprd10.prod.outlook.com (2603:10b6:303:227::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 18:49:37 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 18:49:37 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] translators: fix io.d.in devinfo_t.dev_{statname,pathname}
Date: Mon, 20 Jan 2025 18:49:34 +0000
Message-ID: <20250120184934.36967-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0150.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::11) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MW4PR10MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 957eda97-a59a-460e-5db7-08dd39833096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9TNttEA52hOtnjmoHVShtv0qgFcjtzVbCxAu6ANxOtXExPdPVoxOhWV41Rw6?=
 =?us-ascii?Q?+EKQW+PI5tW0RYQOl7zK1lGk4I5BXwbXeFNhFFJwEdtXhGEwb66OgsBRHUeP?=
 =?us-ascii?Q?NNF1pH1OFukV1yDX+4LpzWjXcvtyABfG/lLoJC6XBcnqbDk7s8TrH42qLO9J?=
 =?us-ascii?Q?zZVPZDdAAXEu2GYwND7k0sdb/ZQPzqsby2+fy+qzAT+9t1Yk7QLLdGQTtRrl?=
 =?us-ascii?Q?TI+pn+WZURK5y8T89Bd0LeD6zBTNQYmnQOq9FiDZj0C10Kn2YNR9Ty9fFSx5?=
 =?us-ascii?Q?gMNaxQ+VvgAgcrR0FWnKohvmq7eWtSw0jfOuSrl4ZZK4PloUJ1O+XhZcm2oz?=
 =?us-ascii?Q?jYqpUk+EpPy6eE4A8cyrlc5gu66Y5bWsKuHG6SZhnk2Qk5btxWgqa5YeO+fg?=
 =?us-ascii?Q?MMu+HYUwYDEeZFUEoUyXUD8hUTUS+9CMH4WPWx0v7g9XJ/N/9Kkr3sKeZbZS?=
 =?us-ascii?Q?XK93g5nTMaKSjFCboPWb7jdnp8bgP9O3lf8PWYdeQ4s0b0Tql2iOzXuaen0l?=
 =?us-ascii?Q?Pf0Ypw2RIwEsDfcLwxkm1zzhMCl79Hb2tpWFOWVkBJrTHIuExgHBak6GCjI1?=
 =?us-ascii?Q?+vbKNMEdxnD4LA0lE6WodT8jbN585sakrkhIsPDp0+l/mXFRJskPhd2LHYia?=
 =?us-ascii?Q?uhTpzZbRXudj18Ca4DbAVlyeUEfqPc9lFGGin33kkRrKYTCruFaczI2FCIOG?=
 =?us-ascii?Q?AW596c7GynIDI+U2eWEmN9yDPpvitbFdr5scoCKkGV6Q5d2hRSaWpMt5utZD?=
 =?us-ascii?Q?BsXibXC2sJsuwJnLlz7aJY5mALLXT5Waze3xLESaZVHx1rhBNaD0+8u0LOhd?=
 =?us-ascii?Q?BuHBfcu2YSulOC+MKqTKgO9Ft1xebY/518PiAwC4R+lq26No2AMOB5ozfolK?=
 =?us-ascii?Q?BJzD7LFuzRPBVhKuV2n58dnwegezbi6HibVdcQYuPc7RHXOmS7vEOTfUk1Rn?=
 =?us-ascii?Q?qIWFPOCQnxwnK6liPd6DX251071LViAGda2nepeLg9vNWXcKsXU776VXKyZC?=
 =?us-ascii?Q?mxvOEhutbG6ql3job1HOHbY6FVsOT+4nqrmejJyvolfvLyJASM8dAC7jXgwp?=
 =?us-ascii?Q?F3xijfoNrnlFCd6vr4Q30/K4WdmER0Fv1AvsBw+xHUGIJAHtztnECUTKZMXU?=
 =?us-ascii?Q?rSwl4Uoo4wUbL7VutGcV3kn+NISzUIptSLxEHtKbFh684w7+2SkROFSWRU8L?=
 =?us-ascii?Q?B0iYdelOvMF+yZeN2m7g60ZiuIfCPB+kK2EyhHMtXGfvzit5UXJqzdkzLL59?=
 =?us-ascii?Q?R92O7j6TIBkSSv9sbll8gH3d6xLnsTxyU2Pba7lKltYQ9lfBK6xM4uQ8oE4f?=
 =?us-ascii?Q?nWj1DHe+BNX+C2kp8asZVpkxZB6TtQRJf3htRcLV9S/fdlPPzNYps4jgWOdd?=
 =?us-ascii?Q?EZWAIFByoy8+P4U4rY7T4k7fkMs9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f/Nc2uEXSeY9gHLsnR6VC5KAHlV24HR+zyBuNZ+EijmHgJX9AIt6CBkHlFC8?=
 =?us-ascii?Q?vBiBT/BbRKYjB+urxJ1MjtLUxD+uMhtm12U4Puf45NWtx5pq8L9u+7c5pNcp?=
 =?us-ascii?Q?3CZ1VdwLozoSs8BE5AvcVc1p+Hgti43n/Ugm2yrH9LJED1JIGgRY8qJ0WXoB?=
 =?us-ascii?Q?lXBYf0CttCAR8Zl4taTGTosabtfUHdR6sh18lqOGx9pOhHOo06uOIrVYOWJJ?=
 =?us-ascii?Q?SGQnrLsGoY1QHnQWCJm8bHkfG9voI5rhfkTi0yZjziqVouFMXYQGuYm04QUB?=
 =?us-ascii?Q?3gpMxiyZUqWAdYaHlaNHYG3zlxABlGkYGQ9V+qdrgPLbU5vSNwFHz2QgEPvx?=
 =?us-ascii?Q?Fifly7EkzSzKwdY/91z4iFF9ZS6R1r36Q2qHlF2lnc2bU7V31p3YyEI9uzkK?=
 =?us-ascii?Q?PTaf+5lHo68BA9pjY077EUXbv8j7+ViLyDytNwMqSY+qoWLU56e8tDZgAL25?=
 =?us-ascii?Q?RmV0jtB5umusbkWSqbFy9fKkwRoJ2KzvF5+B1D5huhonIbBtiuh6FcJL+lRi?=
 =?us-ascii?Q?xHjNSTq2S0WoqWx20hzFa3KT30y/msZKSOIMQlb3rek+SiJmRC7ZyFPn12pB?=
 =?us-ascii?Q?xWLIFfRKrs3YvOAYeyHYCvY0clq9klF3hr7S+G6z+IhsG0mgyghMFSpc9sUK?=
 =?us-ascii?Q?6DUDda1zCiJCJV25jJkONybCkDHnVuK1jZSw93cUUiUSGxT7udKuTPNjZ0b5?=
 =?us-ascii?Q?0OdxeBxjmRjRKvjJvBsPZlAEBrwUlPA+/gixPo50dBqeQgXFBD9tAfHr2+6t?=
 =?us-ascii?Q?XpJs/ZCKgXSjUavxSir9O778XYmnJat3cjK5XvYOkYHjxFYWy0vINdsMHsXU?=
 =?us-ascii?Q?1zw17y/xQ99MTRU2Qyfaopb5tIT6b1u8jd/bx/0+AG+7Zbca5mZaW8EvlkNO?=
 =?us-ascii?Q?RRFQwnUq5PQxyAzA3+hNOCqj9qn5ffMYUUaWJBaSLOM88Zr0diE2q+jpAbwY?=
 =?us-ascii?Q?/XuDf8b401wPDTIkOGF8Bm9s6MnvAVtBwgYCalEgvq621dwiHFWMsCsF6Ev+?=
 =?us-ascii?Q?f/O3rmtPBgRYclIMAfe1f8xrizir1TxoTRbQm8xFxI/AwX2lqwUXY/zqTK5f?=
 =?us-ascii?Q?vCyE83F8iAPE0ehl4ysfSS5fvwG2bydYq1sa5DsKB0R8LGqby0xQPdtnMze7?=
 =?us-ascii?Q?WD+sRKsvtaWYRRV4ANQxFX3zNEtnFOY6zewuf8/yhWvr7hk6sb0lw9DMDkyl?=
 =?us-ascii?Q?kHoqR1mdbS4uLwK//0JeWxP6jZ0RtZt2GitOvVdv8wUlJhymLpfAH5mRrf5u?=
 =?us-ascii?Q?8RQwsizP/wriIWwBqlwJXhrR2dUkH+H/pB2oFaW3vXpRWkFLDH4//PyF9hrX?=
 =?us-ascii?Q?NUg2pDjJ9tbFKWGiEj9M+7qHH3v/PEJdlS30pIWPtswGEFej73/V/9SOTBbd?=
 =?us-ascii?Q?cKcABld+D+gB8O7LLuJVyMLfQu/n6+EYTI1rjjaiCw0SEJ/wdX6Kj9NVCU+1?=
 =?us-ascii?Q?KqjTlDj+hlcANyf8CvH6HjzOt1FRLcJKibz8cLCv8COcMFgXn04uq1sT2WmD?=
 =?us-ascii?Q?CNHr5+XDsRQELn++okuuP7xfqsC/SR/hMf2xjeKYBh8e1SmthmcfSPySw0FV?=
 =?us-ascii?Q?P6pYhXOrYAuvR8iwowFPJ8xWL7o4Zb7WjudSbb2KXzD0vBm/ujtGBFUmKKF5?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eo8u4nbFJvyioYwFnYK3Er03ecx/2wOBlXGwnGd2/GvTk7QvL5NcH2PETpJxSpTYWGnFJzALVwiDDEp+5UD22n2lX/Yz93wV5HGzGn0QT+k2KfpN3XmI12IjNH+en41EvUCo2LYKo2vJHEQYWryBgoJy2CSM5Y9xi5PLBnlq4LKy9fILvEnEXjIPsTaEqSU5F9SgMsTemCLCw8Kwry3mh7RGMlW89dxnZiYQpO/fmw42PDlJhwFTkVfxk5/JTmVQXkLACbSmXpt+2fQS94SNOAkM7R3b9JX9CE8qPUwu91V6IMTIUKp1maLNwt+yk8sALlQI2yHUB47VfRtK7ZUg0wD6EoFMvB1QheVCBDl8f2H4k4dnj1qdxTT70NLCk06Z1NCbfuaFWF2cbgAExvFnXnl5dvTYoU0KYeqRlKua8b3fhrgAEyGzPOjcEyeMBgjCJpWBw+Kmlw3HFZyMABIyDFDQnKoV5wksx+3Rn52DIEpQTwpvfVK9NCUTI5epPS1ahGzSbJCxLtu0q12S/1QKQQz4tiIIGAAmQeJm4nTHWo9xbYeEQv6pewMLE70fLTD43U51nveYEN6S7IK9c2ZDY4HeNN6SB+JS8k3C9O9E9M4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957eda97-a59a-460e-5db7-08dd39833096
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 18:49:37.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xo3x+No7S8xZTTI87XUTqPzq54isdZGbM4b21xO9oqLkS8ojTY3AWygEvEqi2+HCHVkNfK8C6tiPPV3ZXeJQDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6632
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_05,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501200153
X-Proofpoint-ORIG-GUID: ca0HYre81oeLSo-KyQMiJE7pHosQR9mx
X-Proofpoint-GUID: ca0HYre81oeLSo-KyQMiJE7pHosQR9mx

A precedence problem caused us to never accurately determine that
a partitionless device was partitionless, producing erroneous
names like "loop00" for conventional loop devices, etc.

Fixed thusly: translators above 5.12 need regenerating.

Fixes test/unittest/io/tst.{local,wait}.sh.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/io.d.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/io.d.in b/libdtrace/io.d.in
index f44f53f092dce..e5d5c19930e96 100644
--- a/libdtrace/io.d.in
+++ b/libdtrace/io.d.in
@@ -69,7 +69,7 @@ inline int REQ_SYNC = REQ_SYNC_VAL;
 define_for_kernel([[__bi_rw]], [[(m4_kver(4,8,0), [[bi_opf]])]], [[bi_rw]])
 define_for_kernel([[__disk]], [[(m4_kver(5,12,0), [[bi_bdev->bd_disk]]), (m4_kver(4,14,0), [[bi_disk]])]], [[bi_bdev->bd_disk]])
 define_for_kernel([[__disk_chk]], [[(m4_kver(5,12,0), [[bi_bdev]]), (m4_kver(4,14,0), [[bi_disk]])]], [[bi_bdev]])
-define_for_kernel([[__bio_partno]], [[(m4_kver(6,10,0), [[bi_bdev->__bd_flags.counter & BD_PARTNO]]), (m4_kver(5,12,0), [[bi_bdev->bd_partno]]), (m4_kver(4,14,0), [[bi_partno]])]], [[bi_bdev->bd_part->partno]])
+define_for_kernel([[__bio_partno]], [[(m4_kver(6,10,0), [[(bi_bdev->__bd_flags.counter & BD_PARTNO)]]), (m4_kver(5,12,0), [[bi_bdev->bd_partno]]), (m4_kver(4,14,0), [[bi_partno]])]], [[bi_bdev->bd_part->partno]])
 define_for_kernel([[__bio_part_dev]], [[(m4_kver(5,12,0), [[bi_bdev->bd_dev]]), (m4_kver(5,11,0), [[bi_disk->part_tbl->part[B->bi_partno]->bd_dev]]), (m4_kver(4,14,0), [[bi_disk->part_tbl->part[B->bi_partno]->__dev.devt]])]], [[bi_bdev->bd_part->__dev.devt]])
 
 #pragma D binding "1.6.3" translator

base-commit: 0fd90283cc03c640de3695d5f276dd6289a022db
-- 
2.47.1.279.g84c5f4e78e

