Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6252F20314
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727490149; cv=fail; b=mk7Vt4fGn+QayNnqiGiSi6M5D9B0gc9/80cNnyuYQFw0Adv6sa67o7zorRfK6ftDxEq0AVc4/0ubIa4eWZOtelVyjKPiRgFxRklR+VaL9GAeXsb/h9UWr4lvJA46NQaPrgR2uBPvtWevzj0bZUG+5vBaDyA+xh7Uzf/V/0VZ7Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727490149; c=relaxed/simple;
	bh=B/RcwYkAGG884Iw6wJRJ6nlIqwZdPLfcA5kmDEBX1IA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kolIzxIiHpOx1qgijCHBLhoXmykpjtJuJzfw9caf5k0QfMWW/Hc4+tRYVKb84Fyhwm5rueCi8QJcbCW71WwDlEzw6ZJCJF9hjCcFsnsRcbA0ygBBG+/dJ6yVu1V8mfKh7jb2fEsq7cK6yml1Twa22t9FeqiHbkW/sr56x++lzBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kiaPqvXy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NekX6nMV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kiaPqvXy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NekX6nMV"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S21AoU029509
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=2XQxFvfHdpk0cL
	WhLvbyh/1YVCsUcEIwa1p7SwC4kYc=; b=kiaPqvXyRhl/cFNzDz4TQnJ0pxnKhs
	O/Yu1PPIMRJfeHjAwKJ14X233R501TW4GgMRRseYMPzHBnySPxUTN4GVZEYTRAgg
	ofOvPgRa5ZSL45UGAOh+7JKVbLWJdcOhh1mey4HHHhhaYT4KhtOP3iMDTga9Wugl
	qrRXEUQjEn6ykxrwTlVQttq/ds6NdU/M7NVxs0vLvIO938T9+SNlKjRRCskgSx2c
	mM/eFZ/XXcOkVuLwWBKI5JqQUdCb3NFRzyIpHWxsi7aM7wtmJ2tbyt6bfHZI3PmI
	dhLJRuOKghvzaioH9YHdsV3N4AJ/vCnDFk4hHsApp/iOiYq0McJpoMeg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x87d0100-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1XKev039307
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41x8848q1e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0iqj7MhL/jVrnLa4kTNKRq2sbD6vqdipA4+tvWODFrWMob1xlKmGmMD+KVueHXlRy5wlOx4Afb5ZjL8bIDkj4A+I5AB7liTuZI1LILDawdSIHz+s6iAN4+YEyATiEC0RA8tY859XoQVQ4JZM5J6YOSMUE6GJ6IsdeNHbJdG6hYlxxekr8ofLV6b4AKDGb1ToPLz6UUW9jqmUgLXk8j/wiQeqf2riGUdDeC1vlM+lE1N6ZKT43Ssq1AqmOWdH2uxAh2+/OFK+O+109eQDLHvihs5VFhPOWWYkGgOsjby9N7z8Ae3YTcKNEpbOeltuOmDkD9vAp2V263kq8qQ8YIy8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XQxFvfHdpk0cLWhLvbyh/1YVCsUcEIwa1p7SwC4kYc=;
 b=iw8iqIC3qGAqUcA47kv/BmhyMQKR5pDGNvAbCfn/Z1/n3Yid6VnmhRzG4fVR4KrZ13enZXEqaIRFF9F99Uh2vuI1W6AWbZWqapCLGE2adXueGY7dcKHHqzBRsc4dtvy2MFt/13f7IwArERdfQW1dGl3lQT1/1Y5bzLl0/+jLVLWWj8iOhZI1Kn9swvnHtp2og8lBEFMg8kv7symJuJ50n/PGhmnNmu+a73JSKDvWTm1h0tEiCwt77yHd2j9b87c1A0sJ4ndlUWQr4S4TW9gblWzIjkTyvnrRo2fbhgqIf3saGwznGTPbsGTK6Bow0cOskqAC+pPQ5dif/WdDHI/Kgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XQxFvfHdpk0cLWhLvbyh/1YVCsUcEIwa1p7SwC4kYc=;
 b=NekX6nMV1MclIQ2p4DfGZ+NAN6fsQA57CFHUvgL08vP3QMIjNG1/HVmo7e+VqbZc3GqUpfdIYxbImtpGqxjmyOQPw0EhxuVYsz85yjaV6AaoiVXpBBbmXU2kG+Mf9IxSZiyB1UbUt49YxX1aVIQhpm+ILLPG3APV6PrEnlX2L8k=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA6PR10MB8206.namprd10.prod.outlook.com (2603:10b6:806:441::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Sat, 28 Sep
 2024 02:22:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.009; Sat, 28 Sep 2024
 02:22:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/6] test: Add a USDT "deferred" test trigger
Date: Fri, 27 Sep 2024 22:21:56 -0400
Message-Id: <20240928022158.9206-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240928022158.9206-1-eugene.loh@oracle.com>
References: <20240928022158.9206-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA6PR10MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: db198bd3-1a5f-4fb1-5f19-08dcdf64627c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vp0y86OzmvLqjRdjCZZ4qUBDcIBmlyajyHSSazpJEGv+bZw9pnerdoZYerhU?=
 =?us-ascii?Q?OGhZRWDQD8Hye3KT6wWNE2HJ2bHlEHCBb6MRHifJNPi8b/K4WJqZfKyW+fnQ?=
 =?us-ascii?Q?CQAItTJsune/5MUhWWQnJXBakoXPqBMBhaNcR2J7BpXKK1lbwpLa3biSCPk0?=
 =?us-ascii?Q?iqcfsenUWqHgdPn5k7vMY76xT7wz2qpqTd4K+wyYJ+0q6FdwmRyDcqG/Omvp?=
 =?us-ascii?Q?1Ty87KRhoy0AQ6H2gcxmGAD+Ot4ho8wlxL5TOwiSeU6773RyGJuS/ULNhQIX?=
 =?us-ascii?Q?qNYrnwaCI/Nb0Lqcj5zjSgsDbwTLCgn+nTtwFRBhbb9Q6Y/gjDmgssOzxVgM?=
 =?us-ascii?Q?sF2pyYZ8TZuCRPriwXwVguk8H2atuuUveudJklThybOucoH2boeeZ2RjxHfI?=
 =?us-ascii?Q?bd6qbIOIWlxL/WXKDMbpTfvPE77xVLNCkSWGtaRv3On+Xkxe2hQC9hvmWQr5?=
 =?us-ascii?Q?/jWP257jMbZABT5JCuFQwt4f3taR3dl2WTzmOPxj+KNguJeSXRsWG6fctOgF?=
 =?us-ascii?Q?bsIs9RJFHoNFLxuTW7p+2UH693sOIeIdy9XK1M18/G0VSJR9FJJYWE8shhAX?=
 =?us-ascii?Q?aEOZx2CEWtd880+thVMoNsFSBU855WpvbqTPfQwzZWfS0fZTSkx10sCOhU6z?=
 =?us-ascii?Q?62LsVdnFMjnU/PuF5xtNrbs+3ETrr637SFk2In9GKj9Edo5eWhlEfcqd+T0S?=
 =?us-ascii?Q?OCakmEowa7NU9BVjzSVR12FU/ChwUPck8zFSXEdhsSC0t5dGSWZg9QgsQ7RL?=
 =?us-ascii?Q?+KnFQxoJ+VYQOYeEalNHi1z2BLGcI/G3soWQjjdSgI9QeBt0MbEI6Jowpq6g?=
 =?us-ascii?Q?+mXUFHbIcuyaQ2qPio5Oas/KTerFa4Xs0nLvPtuOJ/5sc7b0uGuG7FTGidAb?=
 =?us-ascii?Q?kQOxzCv7mPFgNkGetsfUkvDYPav/NDe3VstiRWHjnsfXZi9Y62azeFIiSzun?=
 =?us-ascii?Q?zgo/b/tV1ZkVpVUT6HBUv8ASV35C/HH9nTf3QyWP/n+c5jIig+bA0XZwsVs+?=
 =?us-ascii?Q?MKxME/ZUcsfgUW62+aX6ch0EwfR4wphM8TdDVSR7DKdtjcjme9KGcuswFAXT?=
 =?us-ascii?Q?2xbYz+FMMi7+x93uxm0FdTSALpHBfwULv2Etu4MRkuLkZU0pM8tuR44phxgU?=
 =?us-ascii?Q?xgWCZ4ipQ3gW9cBndh/6wWtXjg7ORFytjxKKmH7BW9JTf8mbsQtyTbRHe8H6?=
 =?us-ascii?Q?rSN0s61TOS53YjacyoQD3RUZTCbsnzcXsW6bAFXrlsPWlHTMLLWSlsd6sIPj?=
 =?us-ascii?Q?2LBUWD8n4UXTLcr5sr2M4pF0nXMcHs0epwsQGbviOQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lWdU03RRducqgl47QJrwoZCWW+HXwHL1LlxcMiI/w2Xgrr6UtSCD5fqxxoKa?=
 =?us-ascii?Q?Msyg8KtcEX8Sw2U42KD8TYc59pvADG49ZqVI8L/oUoimejWZH6aDFy8KPx1e?=
 =?us-ascii?Q?1JEGhE1ASUbjwpJAhJJTs8xnv8l2HdRks2tL6k+W5NiN3oNjgZ7uIicZKk2a?=
 =?us-ascii?Q?f+oSbWW8QMwN22HYaFTvYWMJ0g4MZtbucfDEr3V/BeCvuLIrGM6AaGh3tcWy?=
 =?us-ascii?Q?KfoRvO82p3QCsnswaUN5Qn5jUFD44uLilLdkkY7hmMLjGka8PbxFqF37UO5Q?=
 =?us-ascii?Q?3NEuSspvcqGhKrVDWyBfYAleJFjXpMg0FJi8IEhbUMxU18osbH7nLUv0MMOD?=
 =?us-ascii?Q?G7VW+ZkXITfGM87ODI433tdI1wrX8c7NXwniQJLFZ7tbWYtzkO426MR5UxDl?=
 =?us-ascii?Q?2n1249gWxA8uRez3by3UgTJ2NAgEBgqPlgNvFRavQGZkeEEw1IiXpOjZGQ4I?=
 =?us-ascii?Q?mT823od5cdGYU647lbqvvZXqev3X9Xx0dsrb1q4SanO+S22S8XlbTTj0Brum?=
 =?us-ascii?Q?jo9cXgDVKDXrejP0gcYXYqfQzwNNE8H6GH0qY3NYmn5LeZg8TIqluAjy4CjL?=
 =?us-ascii?Q?rPxz2G1eJTz+OWxDXnupysUIu1uO/lbZKMGId09lvnhZL50LJPOmBd/OjXto?=
 =?us-ascii?Q?yWCOx9PNAgPz+Hl0AGroy39MNEjjAgu1SaclNVQLD5NLbRzfg0uN6tOkK4VH?=
 =?us-ascii?Q?FvFLXpEA+Dr7RWoxytP1+Ku3+/I4G3BGiB590/wJuCLDDBZyGbx6uTLmJesS?=
 =?us-ascii?Q?QLWmdvU1p78WO915NKmFFkVNZJ83xTpsWFLPU0kNgyrVKiMEL6x/5jVx+KS2?=
 =?us-ascii?Q?R4NfX4HjJTePTadT03ktPoDQKJTzmeJFd6EpijRBSeAsvlo38TI7SbdswLIV?=
 =?us-ascii?Q?WrBvyhcUUySr+Ufo9VjAtx4u1ZSDS9T/nPsL/e1MpJH9BEMG7WipTX9N/ZyX?=
 =?us-ascii?Q?sY7iQT0rLjNK7ABvNWxOiIkw1nxslf/i0ytjx91hNJatb5nEKcKGbpw00/m0?=
 =?us-ascii?Q?awLSIqxM3NhPrRK8NdLR5o3cwjWrEtGvoci8EkE438Emd1d+tMw9EPn8b6We?=
 =?us-ascii?Q?lcFRlDuMhe+WLT8OOvte8KmcriTSZGwJwxaekTjTaRsCUGnYOiJHBu/YNODy?=
 =?us-ascii?Q?fkwetXYiz9HMgrsqauMcM8javJvdphjlNC5FRpnXjbZs3j3Jr8iHeouHS7T/?=
 =?us-ascii?Q?9bzu5H4xNR6sBcIjcjlQmg5TNlrpDgevc5eVTyQYfAr0kuN+leRGgoo80VWP?=
 =?us-ascii?Q?WgngtWODuuEWmJ2mYo/Q2h51ucXKAL2V/PVDR6PIgS7zK3jSBlp2iTkOwPnS?=
 =?us-ascii?Q?3L7mk/C4I4OBHGJ3gMKf4CA0VHVzcA5BFIb76PDsNMfYC5/69b5DCf3WYxhl?=
 =?us-ascii?Q?N3z7GUx2qgeMxFnCOsI6nN+p03TXA+rlzBzW4lngGg+X4eNN97FejL03BKJX?=
 =?us-ascii?Q?sUgnZYO9+IH65ZhtwE/8dkPFOyhJ85dL6quZQMK1+jAwJhcrt7pOGxQxnTl1?=
 =?us-ascii?Q?pdMBtSTsaUEN8BHx1psBEVY75qj31slIqIlSpp4YV2esX37i10qwHsfQb20b?=
 =?us-ascii?Q?mVraZHCo+ZMBHCV6z3kxJoI09H/fY1yBw57NHB1w?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l/uWZbveBVS1yRpde5sLYGW8z9adNvWdWoe8sTdemF6bERnlvpLOf5A/2wf/x3YJgnNeaCt9ximFvl8gHtw8SdVjpwigOaWWw2QMQY9v+bBNfzdBjBpfHTwiPv58aTwebZWSlY00oGl7IA/l/UWSWXyeMQtshh5GxnW7nFwSzkSyT8rRan9uO3b/1W4CXR6nC0iEgBO3xk/H4d0hi1WgtUyGquer7uWlYuhs1yKzDZ4yd4BGvK4bMFyVpPj1ycZBgl9k1612b4NTITrZnObvW1Vt3yCByKAgmfabbAI8xQSehD1BaL48Fi4/2kk5xjjOqMS5An5ARKPYl8/lHqKsTAwofU10JmHij99ONTKJ51YIScieCOn935tvBPZAEj5hp+auhn67M9iwmSHZKa7PhmNtdFd1mkXsYNfGywcFY6EESSAumFozXtx0Jvo38fIG3xxZuX+w7Vkm+Wv5lwRbHBO+Gaeq1wo3c2qjZMwlOP1qOXUzL0ADx1z81C0X7Je9qQezGwMfcGYROdQRDMITcxF8ysOcM+PaUjeoo8fAWAo0Ap6a2zJ3gqW6fKS3B55CCc9KSDcJ60vSlbkzHxD5ZG2oWagW1LYPf8A+vw905mQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db198bd3-1a5f-4fb1-5f19-08dcdf64627c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 02:22:22.5880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcv/qJpVMCRtuwWmwDV/MkYuI8icoC3nQep1CckfOcKlt/DjYztPfuBTrdPYXHkPb1NhYMmwVlfF4La3G12jCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_08,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409280015
X-Proofpoint-GUID: UJo0EKCM7LEmqfMnmpocQgfl73wdCKwg
X-Proofpoint-ORIG-GUID: UJo0EKCM7LEmqfMnmpocQgfl73wdCKwg

From: Eugene Loh <eugene.loh@oracle.com>

After a dtrace session has started, it is possible for new USDT
processes to start and for there to be a delay before dtprobed
and then dtrace becomes aware of the new process.

Add a test trigger with USDT probes that waits for dtrace to
discover it and send it USR1.  Once the USR1 is received, a
short workload is run to completion.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/triggers/Build                      |  5 +-
 test/triggers/usdt-tst-defer-prov.d      | 11 ++++
 test/triggers/usdt-tst-defer.c           | 79 ++++++++++++++++++++++++
 test/unittest/usdt/tst.defer-nodtrace.r  |  1 +
 test/unittest/usdt/tst.defer-nodtrace.sh | 49 +++++++++++++++
 5 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100644 test/triggers/usdt-tst-defer-prov.d
 create mode 100644 test/triggers/usdt-tst-defer.c
 create mode 100644 test/unittest/usdt/tst.defer-nodtrace.r
 create mode 100755 test/unittest/usdt/tst.defer-nodtrace.sh

diff --git a/test/triggers/Build b/test/triggers/Build
index db80b30ed..107b3b4d1 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -13,7 +13,7 @@ EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie
     ustack-tst-spin ustack-tst-mtspin \
     visible-constructor visible-constructor-static visible-constructor-static-unstripped
 
-EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-special
+EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer usdt-tst-special
 EXTERNAL_64BIT_TRIGGERS += $(EXTERNAL_64BIT_SDT_TRIGGERS)
 
 EXTERNAL_32BIT_TRIGGERS := visible-constructor-32
@@ -203,6 +203,9 @@ usdt-tst-args_PROV := usdt-tst-args-prov.d
 # usdt-tst-forker calls USDT probes based on dtrace -h
 usdt-tst-forker_PROV := usdt-tst-forker-prov.d
 
+# usdt-tst-defer calls USDT probes based on dtrace -h
+usdt-tst-defer_PROV := usdt-tst-defer-prov.d
+
 # usdt-tst-special calls USDT probes based on dtrace -h
 usdt-tst-special_CFLAGS := -fno-inline -O2
 usdt-tst-special_PROV := usdt-tst-special-prov.d
diff --git a/test/triggers/usdt-tst-defer-prov.d b/test/triggers/usdt-tst-defer-prov.d
new file mode 100644
index 000000000..a4ef8323d
--- /dev/null
+++ b/test/triggers/usdt-tst-defer-prov.d
@@ -0,0 +1,11 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+provider testprov {
+	probe foo();
+	probe bar(int, int, int);
+};
diff --git a/test/triggers/usdt-tst-defer.c b/test/triggers/usdt-tst-defer.c
new file mode 100644
index 000000000..2df5401b2
--- /dev/null
+++ b/test/triggers/usdt-tst-defer.c
@@ -0,0 +1,79 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * The main characteristic of this trigger code is that it allows deferred
+ * DTrace detection of the trigger.  That is, the trigger spins in "phase 1",
+ * waiting for DTrace to detect it and send it USR1.  Only then does "phase 2"
+ * run a short workload to completion.
+ */
+
+#include <stdio.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <signal.h>
+#include "usdt-tst-defer-prov.h"
+
+static int phase = 1;
+
+static void
+interrupt(int sig)
+{
+	phase = 2;
+}
+
+int
+main(int argc, char **argv)
+{
+	struct sigaction act;
+	int i;
+	int nphase1 = 0, nphase1foo = 0, nphase1bar = 0;
+	int nphase2 = 0, nphase2foo = 0, nphase2bar = 0;
+
+	/* set the handler to listen for SIGUSR1 */
+	act.sa_handler = interrupt;
+	act.sa_flags = 0;
+	if (sigaction(SIGUSR1, &act, NULL)) {
+		printf("set handler failed\n");
+		return 1;
+	}
+
+	/* in phase 1, loop on probe "foo" to wait on USR1 */
+	while (phase == 1) {
+		nphase1++;
+		if (TESTPROV_FOO_ENABLED()) {
+			nphase1foo++;
+			phase = 2;
+		}
+		if (TESTPROV_BAR_ENABLED()) {
+			nphase1bar++;
+			phase = 2;
+		}
+		TESTPROV_FOO();
+	}
+
+	/* wait for probes to get set up */
+	usleep(100000);
+
+	/* in phase 2, just loop over probe "bar" a fixed number of times */
+	for (i = 0; i < 10; i++) {
+		nphase2++;
+		usleep(2000);
+		if (TESTPROV_FOO_ENABLED())
+			nphase2foo++;
+		usleep(2000);
+		if (TESTPROV_BAR_ENABLED())
+			nphase2bar++;
+		usleep(2000);
+		TESTPROV_BAR(i, i + 2, i * 2);
+	}
+
+	printf("%d: %d %d %d %d %d %d\n", getpid(),
+	    nphase1, nphase1foo, nphase1bar, nphase2, nphase2foo, nphase2bar);
+
+	return 0;
+}
diff --git a/test/unittest/usdt/tst.defer-nodtrace.r b/test/unittest/usdt/tst.defer-nodtrace.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.defer-nodtrace.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.defer-nodtrace.sh b/test/unittest/usdt/tst.defer-nodtrace.sh
new file mode 100755
index 000000000..e5fd2855c
--- /dev/null
+++ b/test/unittest/usdt/tst.defer-nodtrace.sh
@@ -0,0 +1,49 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# There are various tests that use the usdt-tst-defer trigger.  As a
+# baseline, let us run the trigger without enabling any USDT probes
+# and check that the counts are as expected.
+
+dtrace=$1
+trigger=`pwd`/test/triggers/usdt-tst-defer
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/defer-nodtrace.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make a private copy of the trigger executable so that we get our
+# own DOF stash.
+
+cp $trigger main
+
+# Check that the is-enabled probes are false when the USDT probes are not enabled.
+# That is, nphase1foo == nphase1bar == nphase2foo == nphase2bar == 0.
+# Also, nphase2 == 10.
+# Note that nphase1 will be undefined.
+
+./main > main.out &
+pid=$!
+sleep 1
+kill -USR1 $pid
+wait
+
+echo "$pid: undefined 0 0 10 0 0" > main.out.expected
+if ! awk '{ $2 = "undefined"; print }' main.out | diff -q - main.out.expected; then
+	echo program output looks wrong for the no-DTrace case
+	echo === got ===
+	cat main.out
+	echo === expected ===
+	cat main.out.expected
+	exit 1
+fi
+
+echo success
+
+exit 0
-- 
2.43.5

