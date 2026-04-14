Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2796A314D0D
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776190817; cv=fail; b=WVXEBoSkqFPOP7jVZT1jNAxkjkhHg4v+cGBQfqOLk+T0K1ZPvnahpxJiVCTs+0KgEH8wEz3yw8L1l3BOfXaOn1yuEz2Rx6u8RPZcKPHhJRIJsggGe9nfOMX6LC3dsvRunj11iEDE7jdXjX+ZNaLhDSIxyZnC2qZimEEi6Ouu5Q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776190817; c=relaxed/simple;
	bh=kHF76z1EAonYb7Y8tgyvT1tvtVixnJSCDiEqOkGSku8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=G0uMyKCAHuY9GrpeYmB+GZWGSmJ5u+5trYwQyAp/+m+kzd7owC/Ph+LcB3bttBqDil9bZnFFw5tMxN9QNS8NXCkyDxrnjEpKtcqWZxeGZrqqPl2vI9453ZU9W/R9xVNAqT6nKpguZXQODtHSfb5OoSOghWdOEH+dMlP6U3Rlx3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WuzYtgTr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nV9nar/+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WuzYtgTr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nV9nar/+"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EI8l6Z1734706
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 18:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pVdXfNLpeeae9p2XE+
	BAPL5nJyddxtoCqt7XUoQokf0=; b=WuzYtgTrba3vjkm7GouatNq00Uz2JW5RX3
	/+egg5hx5FuOT41DG0MREHk8e37A71VgPPC/K2XE3u0VZQMf4G7/jfmYfTwX1y8K
	KYyLj/Q1+G3lH74bevvmhv1N+7F8nS8TN9iJhu6TsEEryU3hp4Lruq2wPCIf5FFe
	8pn32WTZEeUvuhuRcYAoDRO0zEav2SwDziTPHZeyIEzm9sBtfcVz8Lhpzbh9jOgI
	6P7gya352X6lhjyD8epD4iwJqu4l4DorKHiIEj70IkaKiSF3hzEznfMpDL2/GB2v
	42zOnGyCLXVsayZqzrlqe0xULwn4YyNuf4FEpz+poabBJv9sDFhg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85qbj1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 18:20:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63EIJpbN029318
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 18:20:14 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nmv1c0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 18:20:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4jOUYzjk75TaxllPdic+XsGr1RpXgUoybXUqxiirezhVK7+RffEtvBHxjEfh4SMlMpHwbhA5UGByLOmG21OJ0HLcfwRMhCBMjj64qp2nq+4jiPxYGhOnFUpC8zLiCojkvMmAKLu6cgbwXPFXtHYOlRanlLA6tdzX1BMDLWQGVugdP+KTzG/xz5R312yVg4ytd+rli+dzDksEGiBi51dpYa2peUpjIqhoVk6S8Y3qa5M8XtNVj8u76wXiPllKzBCCWJxBT7NiR0wezvoBDZbx7ULB/LREljiFV4xbmyt20307ss28izXQ/ssoElZHbczT6Q68yAy54k4PMziEPhCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVdXfNLpeeae9p2XE+BAPL5nJyddxtoCqt7XUoQokf0=;
 b=d7CWhHRbeBVML6Fc1YTHW/pzLuT/jeoG6fuVQZFwHEvQv6Td2ZOVzLw/zt0YVsvzAOy11jRvb0mBUrnGio9TvUqc8dsg+IinmO1z2cXDJTZj4Pkk+P3Fwgh3ODHsS5nji0joA5uCdWvoGtTELCTsroPRjWdP0SJ1MRZDDqasMv46yQMFZLqNa3+IdrTP2vAgzOuN475HySa4+XEawck2XljE0drInfUGh6rd4Jr31Usd5EaNAgqt10ihvB7+tTe/wQvqxsOVtbtTmK8ITAJV2FtRUsms4dvpiJEAJkBdBmHy0jIX7aVGEFnSztjSIcplwZzt55FtOPLQE65hXYhrwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVdXfNLpeeae9p2XE+BAPL5nJyddxtoCqt7XUoQokf0=;
 b=nV9nar/+5zfsy7oYfepJMFWjtDZGs6H5XrVnXCOIEpQAcTjEFcIJaXqlWImERFsKFvufBt6GDqhWm3SxA1rm+w5ma/k4uCS/gj2Kcj+29YHx/CFllkZ1/w+ANH8U0AAc0AaXWyIvFZO4+mxwbTFjD58jw6JmWgl+VA1+7Vc2TPg=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by BY5PR10MB4259.namprd10.prod.outlook.com
 (2603:10b6:a03:212::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 18:20:11 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 18:20:11 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Fix progenyof to compare TGIDs
In-Reply-To: <20260328164159.15149-1-eugene.loh@oracle.com> (eugene loh's
	message of "Sat, 28 Mar 2026 12:41:59 -0400")
References: <20260328164159.15149-1-eugene.loh@oracle.com>
Emacs: it's like swatting a fly with a supernova.
Date: Tue, 14 Apr 2026 19:19:51 +0100
Message-ID: <87pl412ym0.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::18) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|BY5PR10MB4259:EE_
X-MS-Office365-Filtering-Correlation-Id: a769d1df-86db-456a-43f2-08de9a5276f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ju4fGhnDb5DJ2aob5hNyL8N5C6iF4HKxJQLzp8KemqWB/TVXs98hlhU8j14sycc0ykUBeKE/CNfKKs6UFfvOoW6R8R8xmdJRbMNqP4CXDtX9aggj9vPErhfZTuI8W9lcy8w7jkOhAm/hRzXKEzcauWarGi+C8EiI72jx/mfBOW0eZoHrcFD3NVevkOVwgwKpfLiKB4aAwBPSah2CANrgjIhOQB5oDA3MlCq+gAOUMrlASptoFKBj7rsOjdXbD1KRCiHpHWNEgWeHuCZczgqnR6iuhgY+CwSCiOL9SAIKKf3koJ9VQ6QQYNZ7iWOepmMRmgvwv2bW9PIKWwiptgQE9tq+y5FEs8gGP0u6UoxD2mkD7OnPdzCxazA5oWp/5h0IeNgtVC9CcoZpQfhKsFz6qDDI6hMo0ENIMI8OucUItN1wQZNBicBlVSTjeAcQry4EvZfFIUfdBu4TL0gROT85IrU5AX8xuo0fqcz2aUD8mD0cOMqVHPRDiOKmrHtPLtq6FnB7Gz9xTcHub49b2dPhup3Hs+NYb+hAVAxoluVy+TmgxTIDEEKZRMVVqn+MbKTy+mCYPYzkx4Z4gOV0+xbg06Pdw49Lpf2cCf673raIddpMqS8XQ+XUMVwrfXc37f4fNvW2wx0a08+8rVXzIxfwQqo0O2sZ55H4JKP7V7TfbVfgMW8kHEoZrjLDcnieq210qgLG8BNzwaBb0TxJNsD5mj08BAojnJu8OVuS/vKVwIuTTfaEAlVWk0igKKQzdJZn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?laVnKhwPcegdtriE/gEqBV1X5V0Im0cmORjdolJblVkjFzym9D5BTTFDPioS?=
 =?us-ascii?Q?RZBgu6GxqMnP/C0Dc4GVUjyy3WBQQ0d9xPrmnGrRY6Ecq5ZvK+NBZaTDEdGF?=
 =?us-ascii?Q?4j8x6lIi3CMQ5QyclelnENZ91nceK6GMwBm263V/KNiJkQ6SEjhhg+MjwXrw?=
 =?us-ascii?Q?becBz0xAsFB3JpDvMyizNcwG4tD9++A6LG1lHBm8TAE19ic4gXMyVJtjObvu?=
 =?us-ascii?Q?wSxPL7nh7ZcpRXIIHBQbFmFRZu8hiQVSxr+mn1f6oSh1p9Ulab5YGJGqSfZM?=
 =?us-ascii?Q?l9fTkbi8JNGBO94tVP/UgxzyxI6p3EMGLKuB+Se5wCG1hKxpsdLKNByxyEpx?=
 =?us-ascii?Q?pKORHKPS2ado+w8mwkjY8rBmWeGts1LeRvpY3A1/3e3SvTew84SmVi3GkfhE?=
 =?us-ascii?Q?bTuL0QOO2nI2bBodcFWixtHLvBe9s7n7uMUPnNrS8P0CurQWv//Cx/0K3AUd?=
 =?us-ascii?Q?yEVRvaADyWRzcH/Y7P/5wZ9ty+sNM2Nav1k57BiQ/UTCPgWdflSgjMjSTg3+?=
 =?us-ascii?Q?fYDpXkQ8NUwFNa8ItZpoW1+JieR2EGjQx8/725CDlNMGOpijDdnNTomZ1xEG?=
 =?us-ascii?Q?IHA56xWe3+aFMQ4a61JvqvRwmhY0MzziZKTsTxpnnYZYLlqg9zxVU9FHqzHh?=
 =?us-ascii?Q?D7dNhIy2UEnyTPKgra9B5HXv57V/QII1YqZAR13XbiEikeSg/Xrm81iX3fvm?=
 =?us-ascii?Q?MOBBkkF63oFg1FeydW4abOqCTUxI3x+KwOlfNu+q4Cc3bMwoVCgisLL6TewM?=
 =?us-ascii?Q?su8N8f2MNtEDuLPd+Kx3RL+QEb0Rg5XNs2HNq/DfOawRmSawAZr0N9eSjZph?=
 =?us-ascii?Q?Oeu3rYKuf5ntu9LgytocKgCnwJRu1vgAcbo9VqwssX0+fgDUxmqhDF5iqsuD?=
 =?us-ascii?Q?wxk7fHru5qbPsPE+2/05x9ntQhtrDP0zGshOoH11BBZ4U1t5XUb4lkDOks3E?=
 =?us-ascii?Q?ETAHFyF2dsEua5hTVsCRSW0X/nqo71EmV7b80QmmHrv1Ci+NmymM2mv2VCWN?=
 =?us-ascii?Q?io6hEunUJeNxbWGT935CUqLa+M9qnW+POwOTN6gnVjF1aDlV91rELQU8EYdg?=
 =?us-ascii?Q?J1WkEjQGacy+PwW5CDzfxFcQG//Npdy9pb859q/dFJeTvZ/fW2i6txHt1GIL?=
 =?us-ascii?Q?XEa6dZvdfy2di9vzsHQVoAt6GVb57hNiBGCDRZLfXYOtGL/PtMnEuvmbRCWh?=
 =?us-ascii?Q?zotCEoXe+a0pybOW5L1ZjWR0+Txu6GSLbByXG2lJv/9KtYhZmv7Dlh/cvbrc?=
 =?us-ascii?Q?HDwo7HT1ZLWCUtM52aiTa16QxpWQrdYO9b1X5VOcreqMfJW5gM9q2S24eYjw?=
 =?us-ascii?Q?jgaS0AO8Do18CaclVGy1DdeyR2lEUfNAdjuBwFs71lPMP86WunTNtuVJhzMv?=
 =?us-ascii?Q?Vr1YKscWHwbfckbvhPp8YUw8zY/Cl9KR7Juta6+CQOtN/LR4XMWZd5G/j7FR?=
 =?us-ascii?Q?IdXJ6Ih0ekee1MNsVN6+JuNO/DjVYPiDtM3G4nKZdeQlN8TDKWl24roYW5tQ?=
 =?us-ascii?Q?84KBmopPgZpJRcPYcntJCBsgsSShb3MP+56xrkcknL8HE9gvnbljweyZnC2z?=
 =?us-ascii?Q?wF1FJMxaGgEhRj5qxALgwfP+odAn0GDfcXPEzhKD7HOR8lSRo1WLvgIFeCzG?=
 =?us-ascii?Q?tHkLANdcQdTKK4dnpNor77e3EbgnRJF/xo3VlbWfy/R0AgxSnJwUyn7dhogr?=
 =?us-ascii?Q?DFqxZy36itVy1jlnKpqkruDA/gZE883EbI6r1E2Us10h4mOqD3PcNjn4tLt8?=
 =?us-ascii?Q?Lx2LycvH8Q=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	YfGzMJA/nTUHkp79JGMEbSW6L58Y6z37BAMQx1lXUZy/mbMIXw8T//ZTOp5ldZxnvc+2ACEAP9Xt2AfG9XteQae6iBXk+cgKuFZAFjaQ1ma05Zp5EN7LoPiBreWgNUfPNnF0SF/EHI3wk/IwCmd6XjW1toSnG8K6FX8iVhCzgJEwihtx0gViiRh8G/Vo/kMlfqa1ld24YjrxWmHcU71b0c6Nz1GDtl7UhPOcrr5+IYUc94PUOwiUG7bqDZQI4I1eAhnYfQCMU9tLz67tr/Ojdhpdq7UE/Nz9YWiQJAtEupOLHFR17B43xVSS/zeSGiUgPtcDOx9o/7qGnei+suXj3A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SDYluZDuGN8wUSlAwEw3Vp/AHvMqT1tiPJ6bxJRlMIramSxYkDNm9Q3ZNf9tdh49Y3e6Z6UBWPiUsF80fNjzRN0vRnJNT3WqXbAbAC7vj6UNrN2MpGLGtp1+z0wPlAx6l4yRBUJuN3uUEdpbuuCI8Xkx5vpEhji3/2Y/+OCPp74dgbTVBcT3fQdS+WTO0uE9TttNc0U98eQYbZ52cPwBJgF/IDLMYym5dNegrHWy+s8GN47OwT9fhyMXogjuI77KbaNe2dzK4HbXOPUwxNGX0E7KnuxQ9j4bawU/oeT0Yd6a6GHPRN8BiwkR/tR5ozrgrlH6Ew4pEg6HlAJF19zY3Sz1rHIPMpY5uqZaqzUYJ6VxR+gvB8ZISoHUnliWtTybBFvpTQcPSeNE5fBn3Eyr7kLIjWUDv9gkmr8878J59brgHlx/Vsm9pLTsgEoMkGaYIsuPWqlY4daeKFzJysdNvY94EH6UXNGwpDFHolVjxwZfeWRJksD6KdOJZb+eX1CNtbiCksTEXhJZ1nlmL89DxM6+GGKdD06H9AIUjEpUu9EfRO5eoIKMNjgzJY8hzG8EoY1WxjCf4tl1HGzmY8GW6vAoZ9G4GWmARPmOYpMM39Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a769d1df-86db-456a-43f2-08de9a5276f1
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 18:20:10.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKW8seeRpAkz75VSGt5SkVdi4PBtaG5DfB7kx/woA9Wk5ydpwKvNB1BFMoGvkR4wj+A/8TxkFpA4NLj80lxdHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4259
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604140171
X-Authority-Analysis: v=2.4 cv=d77FDxjE c=1 sm=1 tr=0 ts=69de855e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=R87deAqUyNPidUK3D3wA:9
 a=O8hF6Hzn-FEA:10 cc=ntf awl=host:12291
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE3MSBTYWx0ZWRfX/DDMco5bJdqa
 Ljpg+K06LwtzN1gIDqb6H+uDusJ2IvYWm5L7QvRhx1r//w02nTNKo+L0h8JNV0ueZFlClcnnDai
 uJl5hZ6a32m+BlqVuf2zIo2dX0cJd9ER5OTW1gfZr2BXLBO8RASEbqIIfnFCUqAMdtKsSLq291K
 d1jK9F+6ED9EQ6F+svz6dSYXM5xHqN1nV88MFS4LZWBNAV7M40GAFQWKpY7Gofe8Fx36FAUdejG
 a3SLgSSQ3htJQx+jkV1hD+NPNM0l4yYgugUQb/Efto0HlqQnmyIKvbhByAYHxRhlvNnRo3TWfV8
 EHN4iJvsEFZlfdmaJbyt5NR5pu6GKXUJanT4HpwwFITOBsGNOgUsfwOsl8o7UqXFOH0tWG8mCvx
 q6r2Addz09jbO2B26B0qAwyG2OKt9NE2CsGwFnRr28eLivO4aHhEw8mj9wKX2SeXpCZDIKtcrI5
 9GDuyhC8TqQgRP80ERkwFlnTLTKRVpAJSnnhEPKc=
X-Proofpoint-ORIG-GUID: M9RG5Zykmvb3y08vjfzIsUcd5s3x9hP2
X-Proofpoint-GUID: M9RG5Zykmvb3y08vjfzIsUcd5s3x9hP2

On 28 Mar 2026, eugene loh uttered the following:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Switch the BPF progenyof helper to read TASK_TGID so it matches the
> process IDs returned by ppid and expand the progenyof test to cover both
> pid and ppid.  The original tst.progenyof.d only exercised probes in the
> main DTrace thread where tid == tgid, so it never exposed the mismatch.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

> diff --git a/test/unittest/funcs/tst.progenyof2.sh b/test/unittest/funcs/tst.progenyof2.sh
> new file mode 100755
> index 000000000..1f284cdd8
> --- /dev/null
> +++ b/test/unittest/funcs/tst.progenyof2.sh
> @@ -0,0 +1,31 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/progenyof2.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# make the trigger
> +
> +cat << EOF > a.c
> +int main(void) {
> +	return 0;
> +}

It might in future be worth creating a thread in this test too... and
having a variant which has a process which creates a thread and exec()s
from that thread.

-- 
NULL && (void)
