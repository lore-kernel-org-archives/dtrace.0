Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E241B25634
	for <dtrace@lists.linux.dev>; Fri,  1 Nov 2024 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476660; cv=fail; b=EM669WmnZ9Fyu0QUpdy0+pz0niBhpiIOf64xWsFna+gwDaFHN3uRKGA9YEYPNlHva8XY+mVgYcaZ3Eme13LuqbrrWJ+d4X4Ds7aUs+AjIOvBAUK11L5a9OiH43X8+6hftbUajR5Gn2pCsUOOsJyWSreyTi/h4Jj9bxQsQ/3bTD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476660; c=relaxed/simple;
	bh=Fc3izSEBdO6IaY+ZoMf+kc9j4CygcX9NENJktQFekfY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O6LZmt/FYEEM3YM8ZHQAU1XxgfFmvk80B5vWKmg/lRkleQMLj4adMni1lY+OfZpKI04wLqC3SxpbJGZxw6MYl+LN7LljDz/hPEYfJwnPUmI5/RgR44W/P/BL3I1RJmsW2KPIEWWsjWops3gh7cbjKzCkN0Hmju8DAhIotYyVQoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BkRXJJJJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x2Rq2+U3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BkRXJJJJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x2Rq2+U3"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1EtZF0023014
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=1gPKSpoguQDjnZCTm28xMfpPPp4/eabN+Y1WjUqqQTU=; b=
	BkRXJJJJ06isf/FyrJ70x4R4Dy/ZSTaAEfTQbrZZDR35qYFIHahLolcpk294N39N
	hbwdyJ7HlP49ouMziS+ILPHJu7CHIy/xOyqGgooyDbZo9jVjLfZoXccr1p369RGG
	eayn4BXeMg7rqO3wNlGMNa4K6w6B6zhZJeWaPjTQtJJNjXIljZJdFp7kUewDKyJW
	F4NKwkV699XTiBm3w4vQQXO4hKeaN6XGGHxOP4TgS+DaWhdaxd/Xzvt4aZg7iRE1
	KmY5WhhBgLQptqMEBEu06GNeVcSZyTQUPsr7g3ROcZLcroV9K9Ae3KbCaqIxQnDM
	7OiMfj3NIJCwmxZlMctH2Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqmege-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1FHqFS008618
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:34 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnedn62p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dWEm5Df3kCpVSzfv5f7PpE+e8HwaK4wQyewMDQC1vLyNQOqSUPSHpOYaBsuhzNwkRIhqje2K4wbZ1lgNEq6LlQnxdhL6E1l3GGESNNQJiP/sIJGFDxskTXQIbfr4BZIEkkiyIR4J2veQ6rh+D4Ix2LqeyZ9cqfDJ1LBaODHLIc6FR2efssr4D0xXw2ti0HnFAqVw474sRFYytGDt5yl6aIpr5a/vfvxDhgZ5ItTNbiRJMDGFyBj7SsBZOWEBAnE/0Ql105bEcGt+AV3SJ300K3zcjxnq9NHaXEd3VEZ86rftpmSbLHxj4/0fitiUeogcLbY9Oq+7qUDGlJdovJ9S0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gPKSpoguQDjnZCTm28xMfpPPp4/eabN+Y1WjUqqQTU=;
 b=E5OEuO+6uaApfseXd4Mkcoet6KKj2AjX6mpiAElV6h62CxnFOkYqFfvkWEh7W0Pa1TcTer2AB7TLgK/0ThxJiFtm3F0srWyOgjFZTQHh8Jrb4bak30czXV96nntTC7CWOIvYMt0qfZoEEbnm7ljz2hpbQ3B3mMW4qzhy2HPdKI/efoprjvENurMXXOTDGHcwhMpdcRmVZLuk7cpqlM6L9AVTi/U02QtlEcfGJG1Bqz844mOUi5V0M2G9LC9UcX7mLMQuVl7cCVKQ5bC496VlNYyEN6JIrlTyJoH6Xj98uWakNGeMWnZ1KEaehncWD/yB9tHBdwE7SSClBQ0lvUicRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gPKSpoguQDjnZCTm28xMfpPPp4/eabN+Y1WjUqqQTU=;
 b=x2Rq2+U3JllD0GeFz+Vc4ObB6FehajIMR105FV0nrIpC2sdELnU25xWdsKIgf3c0xTuTxs7JrzjF3kxg/1rjaCp5Y+n1JCl0zkp3NKBgOuZOpKOaY8kxwioZ3nhgS4LHKKuoYhmPBEcDOhHmHMIlnYQsXywIdDp0zj7g+VvgKKk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Fri, 1 Nov
 2024 15:57:31 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 15:57:31 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4 4/5] usdt: typed args and arg mapping
Date: Fri,  1 Nov 2024 15:57:11 +0000
Message-ID: <20241101155712.397674-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241101155712.397674-1-nick.alcock@oracle.com>
References: <20241101155712.397674-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0111.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::27) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: d0305e98-214c-41ce-2280-08dcfa8de464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l2jJCc5BRKWN2HTLxHEL1Lq2dA6vjPm79tTTGcGZSCI4q8i8DGV5GnT570Xk?=
 =?us-ascii?Q?jANk53molvWoD4fkTmKUC3xzn/2hoHTq5tgcsRg4y884/YpQ8/q2T8gYcrZu?=
 =?us-ascii?Q?WqieOttQBAKBhBXmyrsmkeQSqFSBFV4J5UcxkrP3konlIPccIakLL3pFr8XQ?=
 =?us-ascii?Q?od+QmU5yO1dNLlFPeyGcpv3ZTMit7vXC0lLR20qwiYP9nLLjqxlLcy05tbJ+?=
 =?us-ascii?Q?jxxjgYrTdnlWgH29kMacL19i6sg80GGgr/bqi2qOfwBn5Z/zHpJz+5ub7OZS?=
 =?us-ascii?Q?3HXRJMxeJgXQnuKVpAo1xD7YAIs/958MWCB9UijQgDW7a1kuRVZBk02tC5nX?=
 =?us-ascii?Q?Vhb62GSeZHFYBFVmx00KkEgojIeGxjwhb1SRX739AvK6yf+Eu7FIfV/RFT6G?=
 =?us-ascii?Q?kt7Cf/WM7caYTZQHxSa0fNYFlg7iG3NQsljJe2u5ZzdxYxAbhpRiPqGwQq+K?=
 =?us-ascii?Q?haaJRImh0P3mYBVtHwBac2B50VyGgyef7CyhRscY3rAFO8pMz0btFtMOEs6s?=
 =?us-ascii?Q?/aLCqRIwmoMCd6vB2JcAKQLhaI03yr4HLTTmet4WhBPzBSzEqsw4OLPd1v5A?=
 =?us-ascii?Q?PSbnok3foRCyOPVdj7alxxEuHXuTMFvZQpGIJN+k1zh7lA2UFCTpzoRl2ZS7?=
 =?us-ascii?Q?uFS62zHzb07ufJDKM9R9qtnhtDRSpBPJNLUh9Keo1K3HB8oX3wcPZcqWS6Vu?=
 =?us-ascii?Q?qIqMoLB0z14UMpTtjGbwQhl9ZvPwI7S1CHF6ecgSSvlMFEfjW8gUUOEUC4V5?=
 =?us-ascii?Q?mJ2bAYxdxqewPs/sA0l8IQZinWGYb/GIuLNg1wnWC9Y8z7ja+nk87CeKE4Sj?=
 =?us-ascii?Q?ae6MO9DYrgEeXKjwdp9au3xJmr19ybHsRDwPH3Fj0N3FcsSLMF/eDL86Rglk?=
 =?us-ascii?Q?RfgrQKGe+DUd0Im0Vqo98SjHLqPi0REQZQgN7rid/8/SsCjYg2Jf0T25KCLH?=
 =?us-ascii?Q?zNFSm+7W4UdwP79v+/ffrsM5aZuSs0dnVySigd64okSPR9yfejBl03f0TMyY?=
 =?us-ascii?Q?HIhAKyEEPKtpjmPBRDUaeGX0meXsDcRXVhF1MU5QWpOcC3hLNjp1HxHWCyNb?=
 =?us-ascii?Q?Ihkj+KqicEu1pgpuIeAm6Ctdj4CDT6Mfw00kOTb9e9Ampej7WIvm68Ev6yHc?=
 =?us-ascii?Q?q2dSmybLcs6AI1JAP6xHIoaxzlGSBHQj5W9aE53UysHOXGIEkX7tmxzsqKh+?=
 =?us-ascii?Q?+bv3X+wICUnVFOP6fMEFXg3x4LkZiGjaCTmUew91FfFyqzp3jQuCbZDR9qlK?=
 =?us-ascii?Q?h48waXGhyPvIPMW8eGIx0LmU2sq5BAxauegMVqvNVpE1DQkzuQbZNzLpdWOD?=
 =?us-ascii?Q?3D+SReL9P2jZQd931d1MOKlO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NVYVvcdVIUYOlAXdLT5C2Tq2SngOLF4TxfnZhbNCl8qQdFQ26rh1P/pdtrkz?=
 =?us-ascii?Q?KVva0l5TktBg1JdivYpylswsPdpHnDMYau3A5hUY/HRUMt6DElcisGdFgSWN?=
 =?us-ascii?Q?uzuBP8lJCUwoGmSA0GLBmJtLFoh9FciZBPFmXD675TlKMWE1eXA3TVPiFIJi?=
 =?us-ascii?Q?zf3Yasz86b3ZGAur+tjCb1W7tCRmsky9r/5miDhgOkbkRNea9f27CZ2hZXpA?=
 =?us-ascii?Q?eOaTMHjhC+Tzwgpioy4Ym/EeGUffslaRE1Qj9yblapz+sg+XNRQSl/b4J1JD?=
 =?us-ascii?Q?K8xYtC1gOXh1DjPYx1p/3Pd6WfeUD7eNhBfvLDLu8JbwYoQwhZH/fWJIEsVu?=
 =?us-ascii?Q?vTvwwoup7UvGPTWvFwuX0IaSEJlaNqt9j/SUkvllN9nvFSFVJOzl9GaSmS+U?=
 =?us-ascii?Q?AXXLSy/XyEpfVVV1viXAXTdxfsZYkuiw3OO5CzdING7Ujg9PV3WAqsYFmbh/?=
 =?us-ascii?Q?4r/WIfXbB5aPE/O+3IN//258Db/EPkNlI/5WSReYlXOqiHaU6rHn2SsODdLc?=
 =?us-ascii?Q?1DNW/g7HIyfv+HdxVsPwgsg2W4PpucaLCsZQzirYzN9nJn29bZRnF4aVrdn4?=
 =?us-ascii?Q?UFgKlEbxKJpqwIFkAP69NCQWP8wOFlPmtLew9eN8i23Gsz7yKEG824FlVIt/?=
 =?us-ascii?Q?e+mgf5JhLjvzhKO9WVg2alRV81Sj8CV+ubTttY5Lxpj8A6/qgElA8Mtm8hA+?=
 =?us-ascii?Q?Bup34c2kh/KaSWOnVT5yFu7lNZW1wP2LVA2dqwKiZrOe1gzKEI9JHzMViIf4?=
 =?us-ascii?Q?ZN5wt/CdgKvwbxu9R/B3bqwnUrpJryX07G/c/qM1aGIgJ8Irji9mlE6x5GtJ?=
 =?us-ascii?Q?k7r3NQRI0jevk6+6nms6imiXKz3MHNMJK23ylgkDpvdICRRmtvwkDu9WN9ia?=
 =?us-ascii?Q?D+MWPFAAApaXX9u0h+xNZQBulCdvp52NpIHQ3WwWlKWDH/xWtE/KM5jS3jWj?=
 =?us-ascii?Q?rvPtKdbhqOn+pXp1Olzl/Z9LukFNjNB+Lm8b9QfL3UuQXwUxoyQ7XF7r+0qE?=
 =?us-ascii?Q?j4JrGfnjJU9FmL6qgVVGLFRKpTrSyvSqyLyMYxJvLCqwtX0qFSLLQj4ToR9a?=
 =?us-ascii?Q?YuKcZ8sTX6JVuK1OaT6Tp5/Rrf6oDK+mXpi9koTJCv8erb5J2wA/FOdIcquT?=
 =?us-ascii?Q?IFccR6fskp0rsFIRDU8EjXU2NIU6gCZVMBStgSjSVqR9JTl3DnlXyxw0Y49c?=
 =?us-ascii?Q?K+r2v6e80QMoTeMjPO7WrKW+G5efBMeK/+rXqabtvyww3k0nVnclgzKQlX67?=
 =?us-ascii?Q?RH/MVSzE1+F1E1n0DFNFMtFQY5LzLsJ5hhhOUxx+9fLIUAMK1sn3D1nksNaZ?=
 =?us-ascii?Q?DtexQVfG5BHpGm0mKURCiwqanT27HrW1inzvITSbqEfqfKDnd0Sv5pDTTmxJ?=
 =?us-ascii?Q?YRbgM93haX/081GuJeRuZAXISnw0Y6DAV5/Na5jFxxOZJ8eXxxyInF0AA9L8?=
 =?us-ascii?Q?8i9B4glqPJqoBx2QtUdkzY9QKBr3PQl8gB4UM6HcF51oYH5aWApOOvP9cGxx?=
 =?us-ascii?Q?Uhuk3RYVs2fB9CFqiaswI3VLUDy9zH9EuRom188Bnie8h62WLRgtbCWP0z4Q?=
 =?us-ascii?Q?7r3zZ5P8BLpBDUbHY1mzZUnc4kU5Vksqg6XDwd8kcWGVg0YbI+UuqjY+apJL?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VhJUonU9EZ3cqaAzTJBc/UehFYJl4IZReBl22dSjWIFXTzUqJgoE4FECGBmLpt53+BDF3gL7Tw6qaX48l840Yc8CZAZ3FnNpg7eZr8ph0nKIn08JB5eGfg+iCOUBK1FwbsJVxlJ6vO+kVjk8hJKepuWtpQEa6L6H7rmWn0aNTDi37QYmoqR2H3OkxtE8octPkKifUtRDKMbfJ8GJK5ZnXwBZSw5kRPS58+sYp/gVc9U+IwsiLLczkPke07AxAxf5p5aS663GcLMvXbIn6YZITtFiS72/irg8rhmushbZNL+SAWDxe2Q5fTUXYBM9qL3tUJ2lfJTuXoyls32m8rmhRMa2uHf8eEsLigSn4W0HTZAYlmI6Pw8trDVBvAxj8cMBha2q0oahAAmSs1Y/nbO7lZT6OHsXxJm5BmmtrsNpZ2lK0H4JhSgaK41JZUAeQcQZOJW46BLkntvpi2tBJLqznMo3FsJrJdxV8+8VDbklG6pUbE3cj5B9NnWGuC1znAzxARVfHSmQBP4k6Kq43ayJA0iBGXC2BWZSkblPHIMhu43Bgi8D4nuDBtQEoAQ36YuGvYYyoJ5fKvUqFAGKk6DWaViXGQc24OJ+lQHH4NskLi4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0305e98-214c-41ce-2280-08dcfa8de464
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 15:57:31.0522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgRA8QIDIpBcFw/m6kOrCbUM8z19OU0AEaOCdr9b3qbqHBlq+X1ghLFu4O1G7lgVcDGYyckYo/iAb66cdrQ2oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_10,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010115
X-Proofpoint-GUID: gt2l6UuHhBh5eASTfWTPhY2uxJOsor7N
X-Proofpoint-ORIG-GUID: gt2l6UuHhBh5eASTfWTPhY2uxJOsor7N

This change propagates the arg type and mapping info we just got into the
pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
types before handing off a 1:1 mapping to the dt_probe_t, and calls
dt_cg_tramp_map_args() to apply the requested mappings.  With this, USDT
probes should now have visible types which obey the :-notation translators
specified in their .d fils (this is now tested).

The probe info has been moved from the underlying probe to the overlying one
as part of this: underlying probes don't have any user-visible args to
get info for, and their probe_info functions are never called.  We do all
the arg reshuffling in a function ultimately called from USDT probe
discovery via provide_underlying, so it predates trampoline setup let alone
probe_info on the overlying probe and all the args info is present before
it is needed.  (We intentionally do not shuffle the args in
dt_cg_tramp_map_args specifically so that we are not sensitive to the
relative call order of trampoline() versus probe_info(), but there's no
escaping the requirement for USDT probe discovery to predate all of this:
but this was already a requirement in any case.)

We make one assumption for simplicity, noted by a TODO in the source.
We assume that overlying probes all have the same native types and mappings,
so we don't need to look at more than one underlying probe to figure out what
they are.  DTrace always generates such a thing, but DOF specifying multiple
overlapping probes seems perfectly possible for other programs to generate.
This should probably be validated in dof_parser.c in future.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_pid.c                            |   1 +
 libdtrace/dt_prov_uprobe.c                    | 159 +++++++++++++++++-
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
 test/unittest/usdt/err.argmap-null.d          |  41 +++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/err.argmap-null.r.p        |   2 +
 test/unittest/usdt/tst.argmap-null.d          |  32 ++++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 ++++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 ++++++
 test/unittest/usdt/tst.argmap.d               |   5 +-
 14 files changed, 455 insertions(+), 13 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100755 test/unittest/usdt/err.argmap-null.r.p
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 71ac1754d343..189b15f61a89 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -950,6 +950,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 
 			p += args->size;
 			seen_size += args->size;
+			args = (dof_parsed_t *) p;
 
 			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
 						 dof_buf_size, seen_size))
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index a8c1ab2761f0..fd7ad1643946 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -57,7 +57,11 @@ typedef struct dt_uprobe {
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
-	dt_list_t	probes;		/* pid/USDT probes triggered by it */
+	int		argc;		   /* number of args */
+	dt_argdesc_t	*args;		   /* args array (points in */
+	char		*nargvbuf;	   /* array of native args */
+	char		*xargvbuf;	   /* array of xlated args */
+	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
 } dt_uprobe_t;
 
 typedef struct list_probe {
@@ -123,6 +127,9 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_tp_destroy(dtp, tpp);
 	free_probe_list(dtp, dt_list_next(&upp->probes));
 	dt_free(dtp, upp->fn);
+	dt_free(dtp, upp->args);
+	dt_free(dtp, upp->nargvbuf);
+	dt_free(dtp, upp->xargvbuf);
 	dt_free(dtp, upp);
 }
 
@@ -516,6 +523,87 @@ static int discover(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/*
+ * Populate args for an underlying probe.  This really relates to the overlying
+ * probe (all underlying probes associated with a given underlying probe must
+ * have the same args), but the overlying probe doesn't exist at the point this
+ * is populated, so we must put it in the underlying probe instead and pull it
+ * out when the overlying probe info is called for.
+ *
+ * Move it into dt_argdesc_t's for use later on. The char *'s in that
+ * structure are pointers into the nargvbuf and xargvbuf arrays, which
+ * are straight copies of the nargc/xargc in the pid_probespec_t.
+ */
+static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
+			 dt_uprobe_t *upp)
+{
+	char	**nargv = NULL;
+	char	*nptr = NULL, *xptr = NULL;
+	size_t	i;
+
+	upp->argc = psp->pps_xargc;
+
+	/*
+	 * If we have a nonzero number of args, we always have at least one narg
+	 * and at least one xarg.  Double-check to be sure.
+	 */
+	if (upp->argc == 0 || psp->pps_xargv == NULL || psp->pps_nargv == NULL
+		|| psp->pps_xargvlen == 0 || psp->pps_nargvlen == 0)
+		return 0;
+
+	upp->xargvbuf = dt_alloc(dtp, psp->pps_xargvlen);
+	if(upp->xargvbuf == NULL)
+		return -1;
+	memcpy(upp->xargvbuf, psp->pps_xargv, psp->pps_xargvlen);
+	xptr = upp->xargvbuf;
+
+	upp->nargvbuf = dt_alloc(dtp, psp->pps_nargvlen);
+	if(upp->nargvbuf == NULL)
+		return -1;
+	memcpy(upp->nargvbuf, psp->pps_nargv, psp->pps_nargvlen);
+	nptr = upp->nargvbuf;
+
+	upp->args = dt_calloc(dtp, upp->argc, sizeof(dt_argdesc_t));
+	if (upp->args == NULL)
+		return -1;
+
+	/*
+	 * Construct an array to allow accessing native args by index.
+	 */
+
+	if ((nargv = dt_calloc(dtp, psp->pps_nargc, sizeof (char *))) == NULL)
+		goto fail;
+
+	for (i = 0; i < psp->pps_nargc; i++, nptr += strlen(nptr) + 1)
+		nargv[i] = nptr;
+
+	/*
+	 * Fill up the upp->args array based on xargs.
+	 */
+
+	for (i = 0; i < upp->argc; i++) {
+		int map_arg = psp->pps_argmap[i];
+
+		if (xptr) {
+			upp->args[i].native = nargv[map_arg];
+			upp->args[i].xlate = xptr;
+			xptr += strlen(xptr) + 1;
+		} else {
+			upp->args[i].native = nptr;
+			nptr += strlen(nptr) + 1;
+		}
+		upp->args[i].mapping = map_arg;
+		upp->args[i].flags = 0;
+	}
+
+	free(nargv);
+	return 0;
+
+ fail:
+	free(nargv);
+	return -1;
+}
+
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
  * uprobe.  Since multiple pid and USDT probes may all map onto the same
@@ -530,7 +618,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	char			prb[DTRACE_NAMELEN];
 	dtrace_probedesc_t	pd;
 	dt_probe_t		*uprp;
-	dt_uprobe_t		*upp;
+	dt_uprobe_t		*upp = NULL;
 
 	/*
 	 * The underlying probes (uprobes) represent the tracepoints that pid
@@ -590,8 +678,11 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		if (upp->tp == NULL)
 			goto fail;
 
+		if (populate_args(dtp, psp, upp) < 0)
+			goto fail;
+
 		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
-				      upp);
+				       upp);
 		if (uprp == NULL)
 			goto fail;
 	} else
@@ -613,6 +704,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	return uprp;
 
 fail:
+	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
+		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
 	probe_destroy(dtp, upp);
 	return NULL;
 }
@@ -787,6 +880,9 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  *
  * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
  * the firing of all dependent pid* probes and their clauses.
+ *
+ * uprobe trampolines will also arrange for argument shuffling if the argmap
+ * array calls for it.
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
@@ -864,7 +960,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	}
 
 	/*
-	 * USDT
+	 * USDT.
 	 */
 
 	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
@@ -873,13 +969,19 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 	dt_cg_tramp_copy_args_from_regs(pcb, 0);
 
+	/*
+	 * Apply arg mappings, if needed.
+	 */
+	if (upp->args != NULL)
+		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
+
 	/*
 	 * Retrieve the PID of the process that caused the probe to fire.
 	 */
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
-	/*
+        /*
 	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
 	 * will be used on the BPF stack:
 	 *
@@ -1083,8 +1185,49 @@ attach_bpf:
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
-	*argcp = 0;			/* no known arguments */
-	*argvp = NULL;
+	size_t		i;
+	list_probe_t	*pup = prp->prv_data;
+	dt_uprobe_t	*upp;
+	size_t		argc = 0;
+	dt_argdesc_t	*argv = NULL;
+
+	/* No underlying probes?  No args.  */
+	if (!pup)
+		goto done;
+
+	upp = pup->probe->prv_data;
+	if (!upp || upp->args == NULL)
+		goto done;
+
+	argc = upp->argc;
+
+	argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
+	if (argv == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+
+	for (i = 0; i < argc; i++) {
+		argv[i].native = strdup(upp->args[i].native);
+		if (upp->args[i].xlate)
+			argv[i].xlate = strdup(upp->args[i].xlate);
+		argv[i].mapping = i;
+
+		if (argv[i].native == NULL ||
+		    (upp->args[i].xlate != NULL && argv[i].xlate == NULL)) {
+			size_t j;
+
+			for (j = 0; j <= i; j++) {
+				free((char *) argv[i].native);
+				free((char *) argv[i].xlate);
+			}
+
+			dt_free(dtp, argv);
+			return dt_set_errno(dtp, EDT_NOMEM);
+		}
+	}
+
+done:
+	*argcp = argc;
+	*argvp = argv;
 
 	return 0;
 }
@@ -1152,7 +1295,6 @@ dt_provimpl_t	dt_uprobe = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 	.add_probe	= &add_probe_uprobe,
@@ -1178,6 +1320,7 @@ dt_provimpl_t	dt_usdt = {
 	.populate	= &populate_usdt,
 	.provide_probe	= &provide_usdt_probe,
 	.enable		= &enable_usdt,
+	.probe_info	= &probe_info,
 	.probe_destroy	= &probe_destroy,
 	.discover	= &discover,
 	.add_probe	= &add_probe_usdt,
diff --git a/test/triggers/usdt-tst-argmap-prov.d b/test/triggers/usdt-tst-argmap-prov.d
index 28134baa6fa3..d8c3e88c4616 100644
--- a/test/triggers/usdt-tst-argmap-prov.d
+++ b/test/triggers/usdt-tst-argmap-prov.d
@@ -1,10 +1,13 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 provider test_prov {
 	probe place(int i, int j) : (int j, int i, int i, int j);
+	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
+	probe place3(int i, char *j) : (char *j);
+	probe place4(int i, char *j) : ();
 };
diff --git a/test/triggers/usdt-tst-argmap.c b/test/triggers/usdt-tst-argmap.c
index 89a0a53fc1d5..9244092514ff 100644
--- a/test/triggers/usdt-tst-argmap.c
+++ b/test/triggers/usdt-tst-argmap.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,6 +12,9 @@ main(int argc, char **argv)
 {
 	for (;;) {
 		DTRACE_PROBE2(test_prov, place, 10, 4);
+		DTRACE_PROBE(test_prov, place2, 255, "foo");
+		DTRACE_PROBE(test_prov, place3, 126, "bar");
+		DTRACE_PROBE(test_prov, place4, 204, "baz");
 	}
 
 	return 0;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
new file mode 100644
index 000000000000..8bcfa92ff6b0
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
@@ -0,0 +1,34 @@
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
new file mode 100755
index 000000000000..ad8dc2e7c267
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -0,0 +1,83 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+##
+#
+# ASSERTION:
+# Testing -lvn option with USDT probes with a valid probe name.
+#
+# SECTION: dtrace Utility/-ln Option
+#
+##
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS=
+
+DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go(int a, char *b) : (char *b, int a);
+};
+EOF
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >& 2
+	exit 1
+fi
+
+cat > test.c <<EOF
+#include <sys/types.h>
+#include "prov.h"
+
+int
+main(int argc, char **argv)
+{
+	TEST_PROV_GO(666, "foo");
+	sleep(10);
+}
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${CFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+script()
+{
+	$dtrace -c ./test -lvn 'test_prov$target:::go'
+	./test &
+	PID=$!
+	disown %+
+	$dtrace -p $PID -lvn 'test_prov$target:::go'
+	kill -9 $PID
+}
+
+script
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/err.argmap-null.d b/test/unittest/usdt/err.argmap-null.d
new file mode 100644
index 000000000000..ba765bea7a04
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.d
@@ -0,0 +1,41 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that a probe left with no args at all due to mapping
+ *            has no args.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+/args[0] != 204 || args[0] == 204/
+{
+	printf("this should never happen");
+	exit(1);
+}
+
+test_prov$1:::place4
+{
+	printf("nor should this");
+	exit(1);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
new file mode 100644
index 000000000000..215475e39b48
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provXXXX:::place4 args[ ]
diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/usdt/tst.argmap-null.d b/test/unittest/usdt/tst.argmap-null.d
new file mode 100644
index 000000000000..dacf4c4f569a
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-null.d
@@ -0,0 +1,32 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that you can map to no args at all.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed-partial.d b/test/unittest/usdt/tst.argmap-typed-partial.d
new file mode 100644
index 000000000000..8c4d7273c0ab
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed-partial.d
@@ -0,0 +1,49 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when mapped,
+ *            even if some args are unused.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place3
+/stringof(args[0]) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(args[0]));
+	exit(1);
+}
+
+test_prov$1:::place3
+/stringof(copyinstr(arg0)) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(copyinstr(arg0)));
+	exit(1);
+}
+
+test_prov$1:::place3
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed.d b/test/unittest/usdt/tst.argmap-typed.d
new file mode 100644
index 000000000000..1243e059b8ae
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed.d
@@ -0,0 +1,48 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when mapped.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place2
+/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(args[0]), args[1], args[2], stringof(args[3]));
+	exit(1);
+}
+
+test_prov$1:::place2
+/stringof(copyinstr(arg0)) != "foo" || arg1 != 255 || arg2 != 255 || stringof(copyinstr(arg3)) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(copyinstr(arg0)), arg1, arg2, stringof(copyinstr(arg3)));
+	exit(1);
+}
+
+test_prov$1:::place2
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap.d b/test/unittest/usdt/tst.argmap.d
index 7896dc07e0e2..a7d68da3dfbc 100644
--- a/test/unittest/usdt/tst.argmap.d
+++ b/test/unittest/usdt/tst.argmap.d
@@ -1,17 +1,16 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@trigger: usdt-tst-argmap */
 /* @@trigger-timing: before */
 /* @@runtest-opts: $_pid */
 
 /*
- * ASSERTION: Verify that argN and args[N] variables are properly remapped.
+ * ASSERTION: Verify that argN and args[N] variables are properly mapped.
  */
 
 BEGIN
-- 
2.46.0.278.g36e3a12567

