Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CB01A7044
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517802; cv=fail; b=TKiUlJ/kQzmh5vVuixEO0dyFpWNY2Qsa1hkH+cg6BpiQ2hjx9p+gC8PKfW9zeu4SJizfb6SY8/TOunn1T5czT9uitwWwxncTxilCQfigyzvwTMo1Sm4OUVy5v2suCcEug7JXtqnC8nWpkQpN5pxz6LZv5V9TgXfFdlBoZe3oNq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517802; c=relaxed/simple;
	bh=HFvhHJhRN8qleEjN6TE9jZ3O1DzYS1a97mUeKomMkfI=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OHyXv9OUQmngHS719/Vnw5WvHLBpO4SFLrumz9D+ihNXdu6WPiCcd2HOVPX2zPaFrJJ6BUxZSdlvYBRf29XZ2RQOIypwkzA9UqlPqj/o0qxWxUyDrs83+R4GzsDUlE4QDh+6a25bPYKvZdGsDEVk7UFuP/b3XFMOTfePTk72s/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Tr6Twd0P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pb7rrSG/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tr6Twd0P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pb7rrSG/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PIXftE026115
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=sXCK0Whrh13lI6t/zl
	Z1IkXM3wYihGG0QrSbVWidPfk=; b=Tr6Twd0Pf0RrEwbmuQK4ne1KMa3+twERht
	qSunyZUxn/tki14hufPmHqp3omaohujJZcDiQ4jezRf7yWWIqyIIUmPlKS39y9/P
	EeOKFx+nW4IeCPX2mXAy/tr9abCUOkfWnGRgPdEdm/2PBQ2e0dbLTX8fYVtwtmKb
	pnFxMpX+pYOP7PsMsO/sjUaLd/k9Hw5MXJq8rN4aKL7FDzUUjOB85EuCiEzYU47w
	sitCA2az4RmpsebXZC9jbfr7b13fDe2O2XC4xHfWqxFkVZanqbg/OaiMp/ocgruu
	BrwpFxPNth/9yIb5YrzDzJUo5L7oKpBAtvnv+dWcE9sI5cf84BPw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y5606bss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:09:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PJUYnn025216
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:09:58 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51gc8y8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:09:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqCLfb+ZFyDDOVDKdFYpFFp/JyY9aEK3UAcBwT27dS/VSyiADbyQHTA1sOb+kqCiqggiJ2h6LFWZaJmkC+KcVhh2ikcRKzuG4XQYIPzRLmKXsuxSh1XS4f0AZfOFO4awg4NpQV4FgGrkaiuvvVjh8FH4HI+Lbu1FKsbV7SrfNSRX0A6E2umgztAwmhvJdDqaTqqt3bMxIudV14WJVmXu0JbX6uE2jp5qCm8GdDlDdXlHwo8j/R46szQgdO1uM5bFHUpvBnY+z0eO2uLJLmhw3K300N5ywNuJUv7iJA08KZ7EJAX59eMBINh1r6TB99eWwarFPnHNmMoJBIGtFl2R2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXCK0Whrh13lI6t/zlZ1IkXM3wYihGG0QrSbVWidPfk=;
 b=mhIavdKkgwhxbjHkDyT/SY+GaOioerDuCxKTndyNCRqXyU/PIDotD8oxG1cb3fZZ+bCTAHSCs1eOB/3em4/PDFauJ4F2D0AxWRkF7ro27PcS0e9lLgr4HACtb8VpFFDs3Z3iQzUuJvfrs5voUptUOukONa3R6yWjoWiTmpWrI9sybJBvHFQv9s4PjmULof9Ur8S+L/j677U/uzuE/AowsIYj6yCp+2c14BVELls4s5FSnCH1ecSMmrMy4L3YCDsZnb3APCPLm6noTzGUEC8oibKa//rjv9JNzKk/rEMX3rqDK/C5mCs786I9Qd1wl3v42CUZgeBR4qOiQjEpeE0VlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXCK0Whrh13lI6t/zlZ1IkXM3wYihGG0QrSbVWidPfk=;
 b=pb7rrSG/qX2YTL/rIDP7zaAtSY3l403b2HxIpl502rQfSD6gQtLtIgKMc9E/quGHdZ18L5ok/eRSqp8sCYkMsRlJNOabKOX3eTQlNzsLsvi8cT6KqIGb4GImpLCFusZ1ahYs1pIAYZonw4NTBpC2M5eG+jqQGAZrX84Ajlv9+88=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH0PR10MB5131.namprd10.prod.outlook.com (2603:10b6:610:c6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Tue, 25 Feb
 2025 21:09:55 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:09:55 +0000
Date: Tue, 25 Feb 2025 16:09:53 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Allow duplicate usym/umod/uaddr if for different
 pids
Message-ID: <Z74xoR9U_q749CDF@kvh-deb-bpf.us.oracle.com>
References: <20241205191318.18587-1-eugene.loh@oracle.com>
 <Z3xFWS+WEviQKMtl@oracle.com>
 <Z3xq5aJR/HQjQn5d@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3xq5aJR/HQjQn5d@oracle.com>
X-ClientProxiedBy: PH7P220CA0174.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::21) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH0PR10MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cba9074-ae21-4ae1-ef16-08dd55e0c0a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tH3AuC0PTLZL932bYuGk3KIKCbW9GrXqg6OnoYE0oaJIie7KLdnOCJ9tPd2g?=
 =?us-ascii?Q?kxqnJtI6P7oa+wXCYkLSG80LKp19lt8XjgNqwjfrvN01e3GL11li46mMpcDE?=
 =?us-ascii?Q?VjmRPAAlp/bYjg7HByD98VdqZGBlGy/aOFkC/lvVAnYVqrnUJJCdCzEj549w?=
 =?us-ascii?Q?tX9SF5BfG2lpKPH4Z8+AqLikaaVWwvLqJWYSeCXad3SizOhHcgQ18xaYw2CW?=
 =?us-ascii?Q?Xl8GFdnch8bqI30sLq+DMy+E9ZDOPvH1On7HxWL9ZU74tdGFCbNRppBIq8za?=
 =?us-ascii?Q?OBzWKkCpeOXtR16PKAwpPYVxcc8hTl4cmIHv4ipHKQ1NUHwugc0hrjfN4sWF?=
 =?us-ascii?Q?q+6obdBlRGK3WD6jYGhO2bziliz3w0ruJtbdopc9w60gxQYwql+VL4AdEXwD?=
 =?us-ascii?Q?YRrivk3BqDl3B5Rk7E9gX/PAlX6UkrLytoqLNHNWSmBggj/GZksqTNWgafwn?=
 =?us-ascii?Q?La6jnRFY7jZduB6xk1YH1Q+y3hQ89Qunx5eV6G7scKOf/MHaVrb1JQpduklr?=
 =?us-ascii?Q?r17l6iK6SG1XCfuS1zylqbbu16tJjOZS+i/a9RLvNhFqZ2QHsF/IBuwCn15o?=
 =?us-ascii?Q?IEgD12u7IVJBilWwOLu6iL+anE3TydH+WrR+C5Hfg9XPIS/4K2GecrXQxvv1?=
 =?us-ascii?Q?lo/f++ldrC1p36KKHO9HoIfRC84feWgOCLQfC2tZsZmWWqCGVDi9uCnboVda?=
 =?us-ascii?Q?HS1y1uVDRdMnMAIPq4H+DqBCG0DQYX4awBFRV/gZt2KKFRDNCLj5jcx5TC40?=
 =?us-ascii?Q?78IkOY8AxZVsJQG0rEXmvZ/8rnpXKEnoCLzkuJYHOL3x9TAP5alT3t+VFipV?=
 =?us-ascii?Q?0aEfGADB5dNELrXZtkcGPYL681tXZVsBE7oPuYgSg5tr8ip4NUeCYcp6j7uc?=
 =?us-ascii?Q?G6pgoDeSnH2IRhBnglDl0bUDRKKqhWZffJnd9STQLI/QCeVnA1RXjtZzi3c0?=
 =?us-ascii?Q?QHPBxqBuy8BtupoCRMB4BsmEyU3oEvNQ+T6p2OyOnmhQpE4P/Jyh9gQS01wM?=
 =?us-ascii?Q?HeQ6SkTn2UjkBnA+SxOMP0GU73MkgaYG/Cs7ynbMP3YuLpIE7Jm643iAEROv?=
 =?us-ascii?Q?WrHvw8Qm3Z1UjvLqQoRqr+UDDaCMullxw5I6MfJRXl+FncQdZ66IRfa1yZtH?=
 =?us-ascii?Q?SsGjiHFyfroXeMRHxb8Ogkx8hre9ss4GRdXS2oj3ymFFjlzRByA2i3c8r50m?=
 =?us-ascii?Q?JIqRNwaUT/8MTrFn2QjQ8834Ryep6HAfRlpN4JVRp1mvC0w9tQX7hWaR8xW5?=
 =?us-ascii?Q?0AUXBUqdxvJik6Pz+/MP6JnAmtvfw3mHRx7iXPss+e+SuZz4Yv3HhqAuyK/7?=
 =?us-ascii?Q?9BZyI5e/yAtFqOX2g3c2pSIgJsDhdRFGVuqVGhlYm9+c4gTT0krXMH0R1NWx?=
 =?us-ascii?Q?/wF9OLdPY8OuMKRjbqB2yzlWncLH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kCngFzpNftk1UjxUe88/sVQI4InpKJUWSAn3Hs+MwBm5VHLsPFhv8O3t8EFs?=
 =?us-ascii?Q?+PaX9EXFdRJL0/88GdVzIHghd0FLkAYRybyqtrJeDjA3fWa4kfIRYCcF668c?=
 =?us-ascii?Q?CYY7Xt75x3Qgg4gYJudAYmDx45OmIvUjjOabtMCai5mbfkFom01ibg98ubD8?=
 =?us-ascii?Q?A1QwoAkL68KvdHFlNK1a0LZYvhGL9jXU3Xselu4uT4Fb7L7P35HkXbm0dVae?=
 =?us-ascii?Q?7cmr07w8xd5YkvSnP/a1WwLw+y0FFItsc7E1O/6cxm0TMqcVV7WW3xd5YJWG?=
 =?us-ascii?Q?aFm4K6QJjzCiR7/UHtDDPW/D8CtQFg7IuilvweG8ToFKzVehteYUDIYa9yMs?=
 =?us-ascii?Q?DXD2gA5eNLfM/1p57Us1gZz5jzH7PX88h97o4/xy1jQ3bLSrOYIRqvo7/ytj?=
 =?us-ascii?Q?HQwxbP2RCo/EsP4G8IWLFEqYpXI1T/luGjsERfE/6VDr4b1owMJd5mfOg4lH?=
 =?us-ascii?Q?4GZreQV7LmpiVR1ORIDVr3sFiPz06uG7GGHdhwnTqowupvXgOA8wjweBv46W?=
 =?us-ascii?Q?IZ4SO/eHILu60uq5dmOnHalnPwZqZHXwNGI0Qec4BjaOvb9cJKkSi3PrcmqE?=
 =?us-ascii?Q?NFHlLBTIWdNZVj//x+tLnY8U36Vg9P7SQl4nriT5/9jHNSIZxQb9Rz5RfPDG?=
 =?us-ascii?Q?0oPuSbZckwoG+o7ul3zsS2y5XjKqpBa7GMkl1siYHoDAsRf+xuB7dkPPTPxc?=
 =?us-ascii?Q?n0VxjpGdGQnfRN0sEqkxTbJJuc2IZjdoxpns1rF1kbD5vCNVxPzk36R84ium?=
 =?us-ascii?Q?8au6B1y0tug77gaOwTw305Wm/rcEmf1kCIToX5TRySfHzIQpIVZXX8A/yF+G?=
 =?us-ascii?Q?ytUqlqApsUDPkJ1J3MdoZ7ro5fFJxvcAnGxxO7PUv6d5sHb8oMXaQalXECC0?=
 =?us-ascii?Q?NlXK9TAR7eC86R1+RIDJ0lwu3gwNaUocwtRqOQ4bJ8q0LAvaCxB68Grx1pue?=
 =?us-ascii?Q?S74SJk9hi6CMxRqGOAJOAntCH54LX9Q46us6dN/HyUegIZmxkLZ/z1/g3tfO?=
 =?us-ascii?Q?qkSFM3x7yj6D5BBLRAJBQoP/4b1Wk3WOtpB9jwlk3tGEMfsOUYTnN8kdUv3S?=
 =?us-ascii?Q?75/7UfbkSCA07QM2GLZ7JTDQq43SlvHmI60aQV+/wd2RNyJCDWYfPgBtbr3+?=
 =?us-ascii?Q?jm/0AZ2/WnChFsKvhrMmhPRTfdCQCUxdH1hNW2u+KtXTgkuJGv7JCEACbusz?=
 =?us-ascii?Q?UapkH7lyhEqvJT4VhhtaW/lte6hyPHZ2lDwf56lwGN8+8hDYco9hmMtTtcHc?=
 =?us-ascii?Q?/YDYIHFiJfDShXMAQDAjDhh6J90cVvc8BH+FDtr/767Y0wV2tenrdXBkMNQx?=
 =?us-ascii?Q?h8/8G2PycNMl0hL6VD803mZfTbbLSmi59i2wJYsyiVjRhVonHQC8qWOUBeNd?=
 =?us-ascii?Q?BlGK7EYYffVsopmWKf6FLRaEE2i722daFAR8OVNUzh+zJbQ6bhlDR0YChyLp?=
 =?us-ascii?Q?pjRGC5JIeBNCmESO5r5n9ZyQHxZ/kW43sWnVPS0O9Om9PVMO9QsWKJvHESJD?=
 =?us-ascii?Q?01s/fx1mOxGWY5MNx7UGUBdOZHm9vKLpC+fDc5bGmWc40qEAMNf/mLe6gDoQ?=
 =?us-ascii?Q?MIK+huIEZj1fHRiAzVBjxS9lojXOMmxhl1wEj1bIAJtczvGwMebhiaCqbeSy?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bT0OxjxxrP82VV5ZS732n1efMjFq96ODkwJ6Kl7GCMkRkn+tQgNJ1UtPhfGi4HwpEKsZRhLjxpRVhqj1NShxnz66Dmah75WiU5eIsaswivIEP8b2pym535pcxzZKkP5A040vMlqau5dqBFCQvWL+FnyVorEtNGRauwiqMNtzvA3ExntsMrMO6tAaHZa7fSFvE2AbLNtCLijrqmV0ShPb6Ice8UzS9ckz6jnfMRWd8jslNeUil7wbjWtxfI1OkCnOyOB9Vt5ot8q4zTZ/Nen4d5IuedrbHIJnIJJWThmAiPacPO4I7+eEETvIqT0499+pcXyUJjrAmpsXUWaBsbdzQgZXiQF0HYuZpHqKQGx60ztLDNmtVzF2/GmxBdhR/Ub/76Q7dzKQKm9JGD71QV/w5WMeH4x5zKjIby4r88qx6b44/vhn+NhACFmnxhVhvI7AsU4Q2Kpu9IO+YWwStonDKaCBoLQNk682wHoBhWklZIXNfKg99vCXYGWO2l1u30BWNCFLbRTkokRDpde4ZZAPZE1MrF5j2VsmHYyIzRo1BN00NLH6kfS+umcvysWDwykBeb8l+SyioljowEdxwBZLhKJ3uiVQz+8nuM6zjunbO1k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cba9074-ae21-4ae1-ef16-08dd55e0c0a5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:09:55.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcEjQ5KjXtLU4quro2DufrQ0DtUBN/XTvqtm/b+Zq1Ces5EhXYfMlCSnhPFHHiOVeCE+d0uF9USX12LaLbSmfsEZYqrtfJJMRS7JuEgwHpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_07,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502250127
X-Proofpoint-GUID: RusDy_dbEX61yjnDrOgePuDTnyJ5Dbc0
X-Proofpoint-ORIG-GUID: RusDy_dbEX61yjnDrOgePuDTnyJ5Dbc0

Eugene,

Can you re-check this against the current dev and ensure the changes are
correct?

Kris

On Mon, Jan 06, 2025 at 06:44:37PM -0500, Kris Van Hees wrote:
> Withdrawing R-b for now after seeing these tests fail after this patch was
> merged.  Needs further investigation.
> 
> On Mon, Jan 06, 2025 at 04:04:25PM -0500, Kris Van Hees wrote:
> > On Thu, Dec 05, 2024 at 02:13:18PM -0500, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > In 83da884cbdc5 ("Preface usym/umod/uaddr with pid"), a bug was fixed
> > > in which addresses in the same module (or function) might be mapped to
> > > multiple agg entries.  This fix helped the associated tests run much
> > > more successfully.  Nonetheless, tests would sometimes still fail.
> > > 
> > > Another problem is that the tests themselves were overly narrow.  It
> > > is fine for a module (or function) to appear multiple times in the
> > > aggregation output... if those entries correspond to different pids.
> > > 
> > > Further, odd behaviors can result for some of the processes running on
> > > a system.
> > > 
> > > Change the tests to add a "pid" agg key.  Filter on only a few, select
> > > pids.  Distinguish agg entries by pid.
> > > 
> > > There are still occasional time outs observed with these tests,
> > > presumably because the tick-2s probe is not firing (when profile-1234hz
> > > is running).
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> > 
> > > ---
> > >  test/unittest/profile-n/tst.ufunc.sh | 12 ++++++++----
> > >  test/unittest/profile-n/tst.umod.sh  | 11 ++++++++---
> > >  test/unittest/profile-n/tst.usym.sh  | 11 ++++++++---
> > >  3 files changed, 24 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/test/unittest/profile-n/tst.ufunc.sh b/test/unittest/profile-n/tst.ufunc.sh
> > > index 243822407..f5174a1e2 100755
> > > --- a/test/unittest/profile-n/tst.ufunc.sh
> > > +++ b/test/unittest/profile-n/tst.ufunc.sh
> > > @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_ufunc.$$
> > >  script()
> > >  {
> > >  	$dtrace $dt_flags -qs /dev/stdin <<EOF
> > > +	BEGIN
> > > +	{
> > > +		printf("dtrace is %d\n", \$pid);
> > > +	}
> > >  	profile-1234hz
> > >  	/arg1 != 0/
> > >  	{
> > > -		@[ufunc(arg1)] = count();
> > > +		@[ufunc(arg1), pid] = count();
> > >  	}
> > >  
> > >  	tick-2s
> > > @@ -52,9 +56,9 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
> > >  	status=1
> > >  fi
> > >  
> > > -# Check that functions are unique.  (Exclude shared libraries and unresolved addresses.)
> > > -if gawk '!/^ *(ld-linux-|lib|([^`]*`)?0x)/ {print $1}' $tmpfile | \
> > > -     sort | uniq -c | grep -qv " 1 "; then
> > > +# Check that functions are unique for each pid that interests us.
> > > +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
> > > +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> > >  	echo ERROR: duplicate ufunc
> > >  	status=1
> > >  fi
> > > diff --git a/test/unittest/profile-n/tst.umod.sh b/test/unittest/profile-n/tst.umod.sh
> > > index 45d2b1e9b..7cfe2a073 100755
> > > --- a/test/unittest/profile-n/tst.umod.sh
> > > +++ b/test/unittest/profile-n/tst.umod.sh
> > > @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_umod.$$
> > >  script()
> > >  {
> > >  	$dtrace $dt_flags -qs /dev/stdin <<EOF
> > > +	BEGIN
> > > +	{
> > > +		printf("dtrace is %d\n", \$pid);
> > > +	}
> > >  	profile-1234hz
> > >  	/arg1 != 0/
> > >  	{
> > > -		@[umod(arg1)] = count();
> > > +		@[umod(arg1), pid] = count();
> > >  	}
> > >  
> > >  	tick-2s
> > > @@ -52,8 +56,9 @@ if ! grep -wq 'bash' $tmpfile; then
> > >  	status=1
> > >  fi
> > >  
> > > -# Check that modules are unique.  (Exclude shared libraries and unresolved addresses.)
> > > -if gawk '!/^ *lib/ && !/^ *ld-.*\.so / && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> > > +# Check that modules are unique for each pid that interests us.
> > > +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
> > > +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> > >  	echo ERROR: duplicate umod
> > >  	status=1
> > >  fi
> > > diff --git a/test/unittest/profile-n/tst.usym.sh b/test/unittest/profile-n/tst.usym.sh
> > > index 634e633b3..8e373b976 100755
> > > --- a/test/unittest/profile-n/tst.usym.sh
> > > +++ b/test/unittest/profile-n/tst.usym.sh
> > > @@ -11,10 +11,14 @@ tmpfile=$tmpdir/tst.profile_usym.$$
> > >  script()
> > >  {
> > >  	$dtrace $dt_flags -qs /dev/stdin <<EOF
> > > +	BEGIN
> > > +	{
> > > +		printf("dtrace is %d\n", \$pid);
> > > +	}
> > >  	profile-1234hz
> > >  	/arg1 != 0/
> > >  	{
> > > -		@[usym(arg1)] = count();
> > > +		@[usym(arg1), pid] = count();
> > >  	}
> > >  
> > >  	tick-2s
> > > @@ -52,8 +56,9 @@ if ! grep -q 'bash`[a-zA-Z_]' $tmpfile; then
> > >  	status=1
> > >  fi
> > >  
> > > -# Check that symbols are unique.  (Exclude shared libraries and unresolved addresses.)
> > > -if gawk '!/^ *lib/ && !/^ *0x/ {print $1}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> > > +# Check that symbols are unique for each pid that interests us.
> > > +dtpid=`awk '/^dtrace is [0-9]*$/ { print $3 }' $tmpfile`
> > > +if gawk '$2 == '$child' || $2 == '$dtpid' {print $1, $2}' $tmpfile | sort | uniq -c | grep -qv " 1 "; then
> > >  	echo ERROR: duplicate usym
> > >  	status=1
> > >  fi
> > > -- 
> > > 2.43.5
> > > 
