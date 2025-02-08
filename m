Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714BF241129
	for <dtrace@lists.linux.dev>; Sat,  8 Feb 2025 19:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739041633; cv=fail; b=dm8EQ1A6MR2qZ8OjnjtFS0kXtKzSNtmhG5hy+Y7BmBEPalZ7j0mkhcqJv+MN+Tkl7KfxHBPZ2ILXaCQ0CZ/oaRw5hVhuQKCtOZ8bIPOSnMvhxqH/f5644a9vDFlWQSt6GpcQNUidnAkXBK3Q3ep0brZtwMlc2gMm+GDpBWYhU1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739041633; c=relaxed/simple;
	bh=uwmyi84+YV5y6uzRa2jgAPH0EEoKuDyBSk7cJ78Tqiw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IaAnceGCwudE0ipnffAOG1kyBW+DWvzyrLoMLMnr5/qokLDdSfHt+Av/vopEs6n+oBkgeIo5ITI0fN+rIGjP3tPL8tJXVnChQYpulngjywnbe4URseUllmXpENDijbhIHN27wskjRhWZ1jD7NCYyUCVB8o5jqKHw5pJiA6/+wK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UbqFHUtM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i0ilUerC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UbqFHUtM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i0ilUerC"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518CQ3EW013547
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 19:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=YEuZrbJJyUsLTHIq7i
	wRWXwwmwQcjQ26N26bv4LXbAs=; b=UbqFHUtM20lG4lu+b41lSRSHNHqZYflzzc
	zbeaOVJqihHCgUXyC9bS0GR1nwB0Fbul+eWHjfVs9rEJ0dRGWRqXLMtVpDb33lXO
	2x9EX3F6keTkLAXr7eB6eEasiOy5ZxGLE+TD5wjo9B8nX5HDiUqgY+HQRK7Majh1
	ZN+cUqNID/lUYLOC+Y+0fNxe08+MtAZDeEi4lAO8Gg2rfcyOiJjjHYfULjNXuRwD
	yBDtPkuOTue0v6B5p8vkjbtAw/jbzsNWBFy9P7F6lLfexfIRUZJALvW7riucq9Cr
	InypRmf+3gcUP0XhEVPoG1AzDVK41EPCgeyBNUWqu2O0UCrP9e3Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0q28etr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 19:07:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 518EG9nv001870
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 19:07:09 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44nwq607dt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 19:07:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mohJdRgDM9moPQ3vWkYH8NKjvr6GPJiGOp8NzU1r9gYJz2AkDQIBYfCyHpR+T9Shd36hFEbkyapUGbtHUfwGVcpDfiXuq93BLnM9+X3AJ/eHWkyLzuSnrk6ihh1/enAkCZ6DTOC/ndqQKH0KjKezQuOzH3SHv5ZAE37oThsxqcvKfNtn45C9+//Yurj7u8hctTLuJBdg4cwzrrC0tLMJqq6kv+VrHNVgudVOwidHhrKo38cGWAjU2sRetgJ3EUNiFG8/pTvas4KJ64oO0eOVz7KJ0zGT+hPAHejF2LmHExoj1TVWSzSQxZxWpmApxFZFhtHkSmi4cuYoawvTHCQEwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEuZrbJJyUsLTHIq7iwRWXwwmwQcjQ26N26bv4LXbAs=;
 b=T9Rzv108dD+eMsF24JjLPVtBxN4OLB5dxEiw98ePKqs+IM+kvAx/Fkyj5v42hzjXHkU0kvaY1VK+RucXYh0C743FLqehs3g9x77LRWp1Q7CFtQUHbGTFPrZZs3EV4ceM9n1+oKlOuruGINQcymnXXIcJgRS3OMwgkTYT8ak9V2GessUrNnkw7XKPFTKNzk7sTDabtmFvLVHV94Jt590jGdnGkkL0CMd0pfL7IqMZ7GrH1pwvM6qpUNja71dSTb1Wq+mfSCcquhf42ljcjpuEpT3LBrn6k08lbTsnOLuNuv0Wj/F4ujGAMfpjsn7htQihUka9j6zgO8aX7DzpYiyz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEuZrbJJyUsLTHIq7iwRWXwwmwQcjQ26N26bv4LXbAs=;
 b=i0ilUerC/Ehk789jLj5GHabaXojnHKZGSrLZXVMxXqGD+3XE6N8UnD//O9uQHgosE8h9siHQm7tznLaVX2O7cywW4FqBrgYcp1ZXM0SrM+/XytuBiJgDILo8F6RWo+vKemCelzL6vHvm03IjAfKzL1cYJGzooHv9SRY1lCcU6to=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA1PR10MB6147.namprd10.prod.outlook.com (2603:10b6:208:3a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Sat, 8 Feb
 2025 19:07:05 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.8422.010; Sat, 8 Feb 2025
 19:07:05 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] Sync up the version numbers
Date: Sat,  8 Feb 2025 14:06:21 -0500
Message-Id: <20250208190622.23484-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250208190622.23484-1-eugene.loh@oracle.com>
References: <20250208190622.23484-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN8PR15CA0037.namprd15.prod.outlook.com
 (2603:10b6:408:80::14) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA1PR10MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 38bde1f9-2cc7-404e-c560-08dd4873c6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8M6kycf2R4ORr6QgeTxB7XFspIbIFeB1YjC8GTE4b/kB6gsPB0unBQnWkNfN?=
 =?us-ascii?Q?8Fa7gUViRqlrFfp68od7GufTUv1vEmS08Xs2QRRaJR6vFrXvbDw4rKTLRUsT?=
 =?us-ascii?Q?HD2fTpBlCVf3FizpZjk1XiVQS00HKKqOevuB1YOQ/bjzslYGgo2OcKOgnQEU?=
 =?us-ascii?Q?YwWGl+qdnxvpXurYsuWp+Xaoq0eK3f1Z92AiRiwcmXLTkpsBZJ1bVSIzxUzc?=
 =?us-ascii?Q?gtU6zFZcPIxkqGSoUXtrJSM+DM3HHPv1gzmAYp6M4QXSDRHg+FvUsb8wwrnw?=
 =?us-ascii?Q?/1v9yd0gjzytrOigXEaI9PfLD6+6o0UDLUYdTM71OIleWPkJJFyARFNLKV+V?=
 =?us-ascii?Q?jsvkgM+VD3uVa1pko8adrFr7LDVnln4m8L57QUYysbLyuae3PpMVyD9bBG9d?=
 =?us-ascii?Q?5p9ljAqBCm6k4sISkEeuRyjYF2nK/p+ZoKI0Pxvzq+V5DSy66qp01f9ybrd/?=
 =?us-ascii?Q?afZKpJdj1txYgOTP9b1jO4MGxIJtTAIgRloFYZAH2+/tkRx3ayESjQHz/0J0?=
 =?us-ascii?Q?8YxCZJL9t5RLxUdDJaLFTdOBpFrDeE3KV1DNnW1WtYbwwV2P6P1u5ELFUevD?=
 =?us-ascii?Q?4HjxsYdCmv9UBTVMC71TOH3wlHZQxrzfCmKc3CeG95UpZFPj4aPMlUWoItjd?=
 =?us-ascii?Q?qdqPQ5RgOVPCUGZ40wFUxM9/3vEvK4t7ATmgcKm7CUZdq9zfxBhDC+TDioYB?=
 =?us-ascii?Q?OHhXEnkQu+ybS9fRxiGe8nFNOJSs5KuO8IamL2k0nbXzX7XB1DmstOu/nFHo?=
 =?us-ascii?Q?vy8r3ZvAftseepGxpiBHlM+Q0BsuYygOnOVjrITrfjruQXvsfc5QTdeknIXZ?=
 =?us-ascii?Q?DaY2iDctrIx/JzdB6tNvxMpx2SIcLp47pUVrHkJbV6lJgNBw5k0WXlxrAwJi?=
 =?us-ascii?Q?TOe1nRortSue7Ury8NdrxeF5yD6JPK6I3t5mUEp5Y4Es8MTRq1jSh66jnXtY?=
 =?us-ascii?Q?/bWCMhxyXIU5COpmHPoXqtxSYmNb3FMG5NaGdg8sCXUt4QXHniOiCeH33CoF?=
 =?us-ascii?Q?r56P3BUjv0FTveu+B8+z5dJ7BxDsAIxWlhzCLfAZBbhR3367VFGlHck0LJDZ?=
 =?us-ascii?Q?IWXlFSmrVwhoqBndvBW+ezvxl14MOcEKu1iuiJvw78h0gm/okm0sEwKQ5uYv?=
 =?us-ascii?Q?Zz3rnkTLvTMBouzvWrCpv1vp/8REs6uG3rWk+TmZYZ+GFslRkwtJcia2GLm0?=
 =?us-ascii?Q?fcqZugjgpRp2oA5710PPl5DYD3C+wxpUgtHm9M9dkgl3m6dTA1oiYoFkLKHi?=
 =?us-ascii?Q?sM4rRs12CA50GI4VE9K3Nivx2wigxp1Zfz7B8pSClacpLg5RiyzkOxRHdzzd?=
 =?us-ascii?Q?No5FNTwjFQWRAEXaj0fXtP8wdjBLxmFNhWaQ/wGpTcT48Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I1qZQ+yliVCfzdiyfE9+/K8OUINdpaqvchQ6cmWuiN+O8LEA3TzHYe1vV5Ab?=
 =?us-ascii?Q?libQB2QZt+zOEOlivlTvuvrvnLV4INI7R3BwlOPLR5FJhz1xEkkQkiB6qFOS?=
 =?us-ascii?Q?BLR0hUpYB7wtCk7iQNzYBgyWdOB6hn+pGWE0387daWn1OtPg1B1Fhy+zo9v2?=
 =?us-ascii?Q?ye+dRbo54AQZeyLf8VBxWZqbqBfuTQrvtRoO8tl/8KCH4ZWASVLdG+2Yb36o?=
 =?us-ascii?Q?zqYSVoPVnOwACtKCxVjsulClKwFZ4FTKoyGdNw+RI0NSjck0GdlFMyujWvJz?=
 =?us-ascii?Q?XYpWJ+z718SU9OmKFZDeif19/B2Rimr2Tt2NDeHyp/uzIhWl2YVtqL+Xq8W6?=
 =?us-ascii?Q?1P0yQG4njb4rRGVufqSgcxtulHISyqA5Id7/WgSrqWbDVknUtgiZjwQKMJaN?=
 =?us-ascii?Q?PUWoQRLvpeTvSH01N3YAG2tiKj6tCIanN2MndW8FUzG9wFx7XurfAi6hsXYJ?=
 =?us-ascii?Q?07A6ZbzACwWpd1cP60ADXI4LvoOmn+yQQHm9Xl/vPpQmXdL4/1CAgWpebP4j?=
 =?us-ascii?Q?v4r02PU+JeGhBsDe4RuAc3VhoMUCI/dxlS+ZyNU6QHyjZG//6i64MK3JEtJh?=
 =?us-ascii?Q?AZR1JP1jugkKuU/KDkh0L5cM78f86FZZFqPtI5OdtZ+ad8izHVBvGKnvtThw?=
 =?us-ascii?Q?supyJRmZjgdy+f2orIo/u4eq6CUkxrxv4aVFSh9HuJm/ARu+QzYtkmYChE/w?=
 =?us-ascii?Q?sLiFJeZAgF3IoBzorIDcDtlh4TBNKD3OzlBVGAVq+Njh9fjg7pzkWGfJrBV9?=
 =?us-ascii?Q?96/23jzTG4aUlnfTqefEclfjJ3HvbIcIu7aLVtlDXsmAxjaJfZ/q/A6tLO0Q?=
 =?us-ascii?Q?lh6GBtXXTZ0OhlXHl9Om5oCrb+fIVZpz2z9e1uDN96FXzpgq8MNPNfI4Jvpb?=
 =?us-ascii?Q?mSt/zVMc40S+1g22F0KdNH7Bwdzs1Eaf5gm1mDx8l/6ItNuScsZELqbAefEp?=
 =?us-ascii?Q?bqMcWy6alEbX51PXmZaccpAZ1W5tgAT+xMHHXVCssTQPQZ3UQE1DIqaWNKzh?=
 =?us-ascii?Q?DNj5ztznKcL05EIL1CiIMkH3rFRqMfMOzY8srxWd+9oSly9N1duOCu0vCmOr?=
 =?us-ascii?Q?RNWunDtvLg4H1d/usc1PjZgp3YL1EdScH4MemreBMzmNkXbMug50esNsJLNU?=
 =?us-ascii?Q?VZoagDpGVfpgkCkYiqCGyIoWEyr7KlEDpyNISMQX0HjcRx7qkgXqmHav7F0K?=
 =?us-ascii?Q?G1UWD9uYItJlcElv2JEpfhi4Wh3f2AXVKCGLlMQlZLk9BVMouo4c+YXPhPhY?=
 =?us-ascii?Q?Y0pBmuI1yda/uvoaKvYuSrtRD4ydP+evDehJti/DMkzoTwqo/dVh81TTEvqG?=
 =?us-ascii?Q?nmRyATmllbtgLvqGt0eyhKX9zNMmCA+SV3U1bZLDXqfpWJ801H0+3O9jBKm6?=
 =?us-ascii?Q?tCqqAX2KQZpuiqpAcvam5IZqV7PXC59EKDgPVIAKAAcx+qv7ICWLhPzYXwae?=
 =?us-ascii?Q?DYFM1dZkwQ2mx2vJstoHc9xy+HRhmUvvuqN4pecsSlLfaTWTReGYfqTZqxII?=
 =?us-ascii?Q?XP+XENshCpamFmvxI7M10rLyh/83+GSxuq6trMSGN2Bva7BPfm31LsPEHXAt?=
 =?us-ascii?Q?HD1WWInQipTIeyPPzxndUfur0qdyCNS/e38UIb69?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HOFpgMTfwPWogED3ax6AlMkc0r3/dlqHs8BFXHtgMdjwdS6kL2Dnyl73Dh/j51HpXL7wXMZysvu3hy5HLjlT1/sg+rnNMT1+4CwjPyVjLYazZ1UGBCGIVNRAc6P3c9PbwjdNJAFDfisKPbLPhudPWnK8oJpkys/oi+COLJOotSvcbuKzvlRmcRDZq0hOeJ9MmWnpcbjJk9pHavixWsetSV9sm7GbCMc0F0kdIU8sEFf0twcPu3HBZSfNTtpqQwiEhmsTDqnM9zwHBsovOkvER+Cfr3wAOdneFiJvW5HUdFVyojgBtlNq6Bx3I7h5P95XNbfDrLQ3hCfTx4p2qGf6hGLrAy7fND19ECqHibz/K92I0p0voX9Wjg9Hm+VCIls8BGjCv37THMqTxiVpJK0bEVFYZzQUNb4Yvuo2ihm6zmIRkqUlMPbtSMvxYZPB/Qe7KpbQMWQ75kYNHRRWGszqNNNL8Ofd8f+OhFjr8scAYOvf9m/YIEcEZRYfwh8/20epVNy/R5JYNVkkHp1lToziifmhNW5Vet2eI/Z3t6JLmm1uwbmH7mLgb4u1g4n5/8+5lmfdy4+Qq/c388K2DI65mBu+YDEW2fYuB6me7BTPLOQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bde1f9-2cc7-404e-c560-08dd4873c6c3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 19:07:05.2254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPQDC4ITt1mL8oyPXmAQCvAFCaArFpr8/dwVjSLnPsi8DBCROurXCNS3mtFv4ABrAmNR3pyJngKINQNUn97m+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502080162
X-Proofpoint-GUID: wUTFID2nFm4t39xt8CtFW-mT33pugNb8
X-Proofpoint-ORIG-GUID: wUTFID2nFm4t39xt8CtFW-mT33pugNb8

From: Eugene Loh <eugene.loh@oracle.com>

DTrace has many version numbers -- e.g., for the release, packaging,
and API.

In reality, the variations in numbering have become nearly meaningless:

- Packaging numbers -- like the Version in the dtrace*spec RPM spec
  file and the VERSION in GNUmakefile -- have basically been tracking
  the DTrace release since 2.0 anyway.

- Stability attributes for idents are haphazard.  Generally, they
  are 1.0 (or sometimes other 1.x), and all the BPFs are 2.0.  While
  this is generally accurate, it is not exactly robust, and idents
  are sometimes introduced or modified without careful regard to
  the version number.  Further, the stability of user D scripts is
  likely to depend more on kernel variations -- e.g., the contents of
  available_filter_functions -- than on D changes.

- Version number updates are susceptible to mistakes, and so there
  have been version mismatches.

Bring the version numbers into sync for 2.0.2.  Clean up the descriptions
in dt_version.h.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 GNUmakefile                                  |  5 +-
 dtrace.spec                                  |  1 +
 libdtrace/dt_open.c                          |  3 ++
 libdtrace/dt_version.h                       | 53 ++++++++++++--------
 test/unittest/dtrace-util/tst.APIVersion.r   |  2 +-
 test/unittest/dtrace-util/tst.APIVersion.r.p |  6 +++
 test/unittest/options/tst.version.r          |  2 +-
 test/unittest/options/tst.version.sh         |  4 +-
 8 files changed, 50 insertions(+), 26 deletions(-)
 create mode 100755 test/unittest/dtrace-util/tst.APIVersion.r.p

diff --git a/GNUmakefile b/GNUmakefile
index d1e18bb1b..ddf997878 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -3,7 +3,7 @@
 # Build files in subdirectories are included by this file.
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -14,7 +14,8 @@
 SHELL = /bin/bash
 
 PROJECT := dtrace
-VERSION := 2.0.1
+# When updating version, see comments in dt_version.h.
+VERSION := 2.0.2
 
 # Verify supported hardware.
 
diff --git a/dtrace.spec b/dtrace.spec
index 902ad7d8b..46950bf5a 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -87,6 +87,7 @@ Requires:     libdtrace-ctf >= 1.1.0
 BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
 Summary:      DTrace user interface.
+# When updating version, see comments in dt_version.h.
 Version:      2.0.2
 Release:      1%{?dist}
 Source:       dtrace-%{version}.tar.bz2
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index b4d160359..b843228b3 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -58,6 +58,9 @@ const dt_version_t _dtrace_versions[] = {
 	DT_VERS_1_6_3,	/* D API 1.6.3 */
 	DT_VERS_1_6_4,	/* D API 1.6.4 */
 	DT_VERS_2_0,	/* D API 2.0 */
+	DT_VERS_2_0_1,	/* D API 2.0.1 */
+	DT_VERS_2_0_2,	/* D API 2.0.2 */
+	/* When updating version, see comments in dt_version.h. */
 	0
 };
 
diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
index bef3243e9..4e230ceae 100644
--- a/libdtrace/dt_version.h
+++ b/libdtrace/dt_version.h
@@ -38,32 +38,28 @@ extern "C" {
  *
  * These #defines are used in identifier tables to fill in the version fields
  * associated with each identifier.  The DT_VERS_* macros declare the encoded
- * integer values of all versions used so far.  DT_VERS_STRING must be an ASCII
- * string that contains the latest version within it along with any suffixes
- * (e.g. Beta).  You must update DT_VERS_STRING when adding a new version,
- * and then add the new version to the _dtrace_versions[] array declared in
- * dt_open.c.
+ * integer values of all versions used so far.
  *
- * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
- * explanation of these DTrace features and their values.
+ * The major number should be incremented when a fundamental change has been
+ * made that would affect all consumers, and would reflect sweeping changes
+ * to DTrace or the D language.
+ *
+ * The minor number should be incremented when a change is introduced that
+ * could break scripts that had previously worked;  for example, adding a
+ * new built-in variable could break a script which was already using that
+ * identifier.
+ *
+ * The micro number should be changed when introducing functionality changes
+ * or major bug fixes that do not affect backward compatibility -- this is
+ * merely to make capabilities easily determined from the version number.
+ *
+ * Minor bugs do not require any modification to the version number.
  *
  * NOTE: Although the DTrace versioning scheme supports the labeling and
  *       introduction of incompatible changes (e.g. dropping an interface in a
  *       major release), the libdtrace code does not currently support this.
  *       All versions are assumed to strictly inherit from one another.  If
  *       we ever need to provide divergent interfaces, this will need work.
- *
- * The version number should be increased for every customer visible release
- * of Solaris. The major number should be incremented when a fundamental
- * change has been made that would affect all consumers, and would reflect
- * sweeping changes to DTrace or the D language. The minor number should be
- * incremented when a change is introduced that could break scripts that had
- * previously worked; for example, adding a new built-in variable could break
- * a script which was already using that identifier. The micro number should
- * be changed when introducing functionality changes or major bug fixes that
- * do not affect backward compatibility -- this is merely to make capabilities
- * easily determined from the version number. Minor bugs do not require any
- * modification to the version number.
  */
 #define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
 #define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
@@ -81,8 +77,25 @@ extern "C" {
 #define	DT_VERS_1_6_4	DT_VERSION_NUMBER(1, 6, 4)
 #define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
 #define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
+#define	DT_VERS_2_0_2	DT_VERSION_NUMBER(2, 0, 2)
+
+/*
+ * When the version number is updated, the following must be kept in sync:
+ *
+ *   libdtrace/dt_version.h    DT_VERS_STRING, an ASCII string that contains
+ *                             the latest version within it along with any
+ *                             suffixes (e.g. Beta)
+ *
+ *   libdtrace/dt_open.c       _dtrace_versions[]
+ *
+ *   dtrace.spec               Version
+ *
+ *   libdtrace/Build           libdtrace_VERSION
+ *
+ *   GNUmakefile               VERSION
+ */
 
-#define	DT_VERS_STRING	"Oracle D 2.0"
+#define	DT_VERS_STRING	"Oracle D 2.0.2"
 
 #ifdef  __cplusplus
 }
diff --git a/test/unittest/dtrace-util/tst.APIVersion.r b/test/unittest/dtrace-util/tst.APIVersion.r
index 6bc7b9d72..02bf03150 100644
--- a/test/unittest/dtrace-util/tst.APIVersion.r
+++ b/test/unittest/dtrace-util/tst.APIVersion.r
@@ -1 +1 @@
-dtrace: Oracle D 2.0
+dtrace: Oracle D 2.0.x
diff --git a/test/unittest/dtrace-util/tst.APIVersion.r.p b/test/unittest/dtrace-util/tst.APIVersion.r.p
new file mode 100755
index 000000000..32ec94df4
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.APIVersion.r.p
@@ -0,0 +1,6 @@
+#!/usr/bin/gawk -f
+
+# The test allows the version string to vary in micro number as well as
+# other suffixes (like "Beta").  The .r.p and .r files still need to be
+# updated for each minor number change.
+{ sub("^dtrace: Oracle D 2\\.0\\..*$", "dtrace: Oracle D 2.0.x"); print }
diff --git a/test/unittest/options/tst.version.r b/test/unittest/options/tst.version.r
index 15010b3db..882e208ed 100644
--- a/test/unittest/options/tst.version.r
+++ b/test/unittest/options/tst.version.r
@@ -1,2 +1,2 @@
-version is 2.0
+version is 2.0.x
 
diff --git a/test/unittest/options/tst.version.sh b/test/unittest/options/tst.version.sh
index ffffcdd8b..684120af8 100755
--- a/test/unittest/options/tst.version.sh
+++ b/test/unittest/options/tst.version.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -9,7 +9,7 @@
 dtrace=$1
 
 myversion=`$dtrace $dt_flags -V | gawk '{ print $NF }'`
-echo version is $myversion
+echo version is $myversion | sed 's:2.0.[0-9]:2.0.x:'
 
 $dtrace $dt_flags -xversion=$myversion -qn 'BEGIN { exit(0) }'
 exit $?
-- 
2.43.5

