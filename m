Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D0526657B
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755203885; cv=fail; b=tijvy6CletDfUvqLqXmuo7Hj32nz9+GyUQgeeIU8H5CdBdymVFI67434e7oYp4IAkwcmd97TaTyrik+9xPnAyX0ZNEoA/lBxOrb1ZRlvpOxMMqKNSB1CIP0zTf1qCMd9SG27YoefbWuy6HkJViCDFMOF9b5SKuJ5EiW4tuwYG1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755203885; c=relaxed/simple;
	bh=0dqjvi0N4K6BNO+U32kW1ANwMO808std0wdqmnU7apU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YWesouotps0DPnhyh/Dm/zDwEqwwO2jgUP+3inDQo3LYIcw+IHdsd3F7RkewxFvCWWgnR4TzfknjYKBM/FyVLlNVldG8bgM4bZUsQ4NqeLSYammxGRMe1dMHgPGQmZUVXzQV6IrtBmm0WhEK913PIpHHpIuNwd4wAglkh3sqT90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kwXAGiw8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OczRU4Iq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kwXAGiw8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OczRU4Iq"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfrcm018379
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KElqjPPg9+nlKLvywD
	OGnSHlkB7GkDG+nQnFUAzTk5k=; b=kwXAGiw8GHS0mAQENX6gzu49TZ/gTe1NoU
	DjB1vaUhhgF7oe+fpHRL9Y3iaMjG26NTEkzJ/Fm0dStC4uuflYxPE1CWrwWIn7+D
	6NyqDC0Oz2BXKiPcVW0AC8ebmKJo/JxyFztGM0kAqAOWp9CZrptnwdPfP4senNwS
	TEBHRgH0sASb1XUO/gVaz7Z4/52gB2x/G+aRDywCSH5cLY/rZmJb8id8xW7NtHOG
	+uZqXGBSrOCle/4oxbJrHsf2mXWEH/RrTxX7AIbOySlTrjyWF1lKSVJnWhG967l6
	GBeKZLNOpXCTDS6zNPDcd+WiMiOVxhEitJ7K3D4VZH6ovLxQFEzA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48guchbcnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:38:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EInfX3017415
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:38:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd78em-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 20:38:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b54HoD16QRgsvK+Dt5fWa5bqDtXzcYBkgiC/Dwv3TrHNPLYvU0vD4LangmtlX724HrUchHwAH4mU8rqgv6XMKY4P+tXcwt3YlAsHyrexBpcw4AVrVwBxiRP0RT7xTtCSW2RwKz4FxPyOdaGKqQecXgGByJtNEPFx4w1vmNcFJAb9DmiazHnNeWJFgcCM+DLkyNeda/DSC0myDDmsQXWf+/Rm1fM0WiqW9GNYLIs0LBsr7RD8kSuCJAabLAUE0kBsv+iYz0/7OHE2PpYoyzE1/dGr8Z91guz/b6DUD9q2xWCJFxDarHDA3uMmeQAvcIobvatXAaDyIyWwPDOFu7KN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KElqjPPg9+nlKLvywDOGnSHlkB7GkDG+nQnFUAzTk5k=;
 b=NCUxe9iih6lmroqp5/sUyp4GYhBhUM6yBJNUgwPQNI9CQzpijHDZwzgLczCDdghVka6xPWyXyevd7x/D7OGeQauBcYpOCoRESZsTlS13DX57vDv6oVmNuGWA11oqZ7gxmBO5o4qVyGpP84McqWodS6/Ggfg2Dt68Rq55EWfP4GMqfZgzu86mXwDqvP91+FT5gSkpHOyQOKfropLkHpeqJ5dnrueB/BuRV57AkQbBAO1owT9Xc/s8AKtP5L9tejxylSXCkd+bWeb2ThjRlHGsxWVWWd77amCo0QREkuaQUnantKy+R2kNdEqEx1uNckzZ4Vlc2J6UMbEvjZl/O5tQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KElqjPPg9+nlKLvywDOGnSHlkB7GkDG+nQnFUAzTk5k=;
 b=OczRU4Iq2zUvJ+wusAgxNzgCNYrA6KLZoGkEXD7k26MTbremLh6fI832eBxoYws7LQMrY2E97bF5UyXcZVUIa37Sw+f0KxMLgZCWlwyJcdAcV6cQ7x5GUfiGDfwg1lcJKFYapqadccZLTNnzNS2H10gR5e1Q3XjmJ4+Wa/5w9XU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SN7PR10MB6286.namprd10.prod.outlook.com (2603:10b6:806:26e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 20:37:56 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 20:37:56 +0000
Date: Thu, 14 Aug 2025 16:37:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 5/7] string: ensure string size is
 handled correctly
Message-ID: <aJ5JIVdM3rPvtN70@oracle.com>
References: <SJ0PR10MB56727D85238D96378BB2542EC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR10MB56727D85238D96378BB2542EC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SN7PR10MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e1b127-53d5-4459-991b-08dddb727367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZIv2P4TxVx6uRMvPpHFy9SCWqaiFzUIwQ6gUnb6qEFNUwQcZbRgxA7nGh8m8?=
 =?us-ascii?Q?ulYy0L1764vk8ZHrYKY5G/FN7dooNFpuLSmXDIXCC7UlJlQowPFkIetWWJ8H?=
 =?us-ascii?Q?HCQhc+Y0rptiel3jHJLQUuub0X9Rn2uQTcqOxPh2OSzSm1343v9BSZI5PD2M?=
 =?us-ascii?Q?mjBJQS0bS1MEpsFOqF7EPdmWdMuZWgwXfsc+XL5DFXqug6JFbItRKIsiAFvz?=
 =?us-ascii?Q?/e1xGDpn2Q56bhJKjJC68ETTEUh6mw0oUdUgfwGbYlonXryFCIZv4TJOqpAG?=
 =?us-ascii?Q?PBkRDPQ48MrVNrr8bjF14R3DSJqWJ59sGemxsY/caS2DiGYb+q0HJlSQHxNV?=
 =?us-ascii?Q?5qnyOI+ai67zfuwfGywCjBOmt5aMTZ/KHg+J7pviSDkvyK9aVDe6IEYCegOL?=
 =?us-ascii?Q?jjDdFeQzIQPNb0r3sN30e7pWr+6prYMTFP4Mf4wQm/9m1+rXNdrZ0NR+cCy1?=
 =?us-ascii?Q?5ABCqW2tA/BpzILMNRBSNJXekGH3IVkCKsMVtkoIArdKl9JjoMIYxZdt3DlS?=
 =?us-ascii?Q?MZSvBjNa/fM3vueJ09WNygwv3maK1uEX5ndjIFgxFxqWxDxaY6VhbM9sNTFG?=
 =?us-ascii?Q?wjWniBaz0u/RP3QDpdiEzokLEy2iHuaZIg/l0sb7mUHIbY9V8/6bu82wtMRZ?=
 =?us-ascii?Q?mJxpavn4hedipwJLlS6wD36OgaNIWcwLfoulTNzvqd2zzCIZqCOp58oSyeBe?=
 =?us-ascii?Q?EGTFURz7MmU6BHGB9BY9IWEuG2Qkt4g6xZfa7CYIWL2Xh/Lz6Zq1xSu/gUGT?=
 =?us-ascii?Q?L27cVbkZxx+g2FEs9Fuh08OfVxWAu1mStHFSu0913zIE7YjQZRqUfCxcYtFA?=
 =?us-ascii?Q?w7R4rwQLuIN0bOjkVn89BJNfKwGTIs3nmJfCjqseHaHJl9h5taNQ1HlyoGXZ?=
 =?us-ascii?Q?9m6SFhJ/WKlyoAflZu5KBBVucK+Xpyk272I6zlHPoVY4SpsGUh9OHEYnIagr?=
 =?us-ascii?Q?mY7W54VcS7AxMm+BjLB4rPhKv1VHKPbzomR20AaTyuD208QUNIbKbCxZzyOw?=
 =?us-ascii?Q?Pt4GSqWkdNbaIPQyz5Hs6WaIXrCCQdHwuGd23kDF57YeVr56n2rxwIHP6kp3?=
 =?us-ascii?Q?8zHCvsKIx1X+uwwGNc9FBSibnI/vGB9Z8cCzlBMHHlMa4g6iJUnRHeHg/jVa?=
 =?us-ascii?Q?CUFmgredfOipkg66R5Ckg6j29tg9iv+43s+sPiPqRsryDnaxnLjk3qQ4AaJH?=
 =?us-ascii?Q?v3BB9bhRpbIGZx1X6lU7dLMcO6kXgRevqe4/HYsD1P9qMpvjOcHG3GFl++Sr?=
 =?us-ascii?Q?leUepcqmNL/yEEyWgbbp5MiNWjUmew70jcnG8Y5Rm1QrBBseA4ciDOCMuEHl?=
 =?us-ascii?Q?IJT6qKAs3TSnv9mb1WvznzpKitVyqp/jz4z0PV0Ra7Du6vXrC/+bA4pEEONQ?=
 =?us-ascii?Q?jilU5elIL1gYbOwq93H+wSOSQp0wZTS6Qf0vXE+wEqRZLZkvrqc9wuIy8iAP?=
 =?us-ascii?Q?Is8wJBkaGHo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+R7OpdVe6hC49/Y6ZIPVHQ8LufoLPLeoLfz/OfrDD9Ve/C8mtr3/P9+Fg12B?=
 =?us-ascii?Q?+x76DuItCZ54vD46I3KHEQ2xHYIbX5pdNBJo8xF8nYV392nhzZCgUSzMgsWt?=
 =?us-ascii?Q?EHjJpNNAYxwI9ZrTiVUYYNzevAwe4CdZtXWkVaxI9dl+xGJWcjHj47osKJmf?=
 =?us-ascii?Q?vgWwzp2B+5Xulu2BK6fTMlWBNsjP/yjA6jSBIP7Cz47ga1SNUb0KVaoMtFvV?=
 =?us-ascii?Q?zscvocf+PnuGUOtB+RCKgnfl1X6b1c/i+VKYD3VugtTVv4MUpMtDCR+Ewo0N?=
 =?us-ascii?Q?nqhqgXqz7Ce7nFTCBP99BMJARBjjy2zyTKCnppkWRi25wPjI5r2ybYHmpCcB?=
 =?us-ascii?Q?ttgCkaYtw0zlH3lwhOPno+LesPu09Hd/kZivXAFgLvUIrhx4aoNouRwJUAq4?=
 =?us-ascii?Q?/Xb4lrCGEAEjAa8B9UvadC6C59E6GsTQHuhWRtmtp9TrEcCpmkrlnA500tpD?=
 =?us-ascii?Q?zeuQS3RaJmRXsmYQmpTh6kZLX6xq9GgUEMJPf1htSDL/szfvTbAEnstnQJrX?=
 =?us-ascii?Q?MZGNzojXdJtEDpv/dQtkHNChINexSOjshIQ5aKcsh7fLqO+WsTT1nFNTKI9d?=
 =?us-ascii?Q?YIbCldgK+m2yAN2UpVMnQLP0XrUBB3djwCWWEHQ1Z2k2l/dw4u1fMI8tj/4E?=
 =?us-ascii?Q?xV+PTTkj9FefeU2/70Ngk5nSp0o7OrmjPIyZrvLSZu7nDQEJITp5oaQ5EOcJ?=
 =?us-ascii?Q?sLmFNKjK+R0CaS63DiBTQZU/vkL/YCckuczXWHcfwODWdV/3/gQfqAtd6l9s?=
 =?us-ascii?Q?OmcSKCa+lPBCU4UKsG38xcMlgNT1Ig0POsGF3I6KfAbTlEQwO/OvkfmHAR/r?=
 =?us-ascii?Q?njcp/DFLkNvJJ6B5JXEd+FUifwytEzcFacf4f5BP5njNDdgKIILvEb1c3Pqm?=
 =?us-ascii?Q?5OMq4y0us1J2VhshgWSgMPIhi9uvFTIHUB9mIis6tC5Y7mGFqJEXmVAYefso?=
 =?us-ascii?Q?a30C9U3o950C09cIX/niVfjxwTXvIKoFv8Yc8pQ3u2Bh5UDkPEVihYhLJ6z+?=
 =?us-ascii?Q?7l3q2yJp1J4h7HD9DTh4J+dJXNM3vElZSWiG1oSFnaV1RKVpTR3M/iS/hiew?=
 =?us-ascii?Q?w2TfsTQltTGIKZij5/4OjT3h1aOWMDY7uDKcWAsxvJd2oXCIEQrMPMNYPzYX?=
 =?us-ascii?Q?QSj+25hsVEmUUEkhJIhSfe3+uvSNoiEIvxIKQ6TynNI46tUGYEI3FUsIUB5W?=
 =?us-ascii?Q?76/R1GwfHP2ZzkfygYIpWGW9Aos6Ce2uK8bVHpMBj35ZhMxn7SVPgOWpP44l?=
 =?us-ascii?Q?WmGB4WujlWZLTND9e44GW4XPhjCY7S89r0X0LmxJvkXXqAtg/vVgHNk1DtC/?=
 =?us-ascii?Q?RQmiuhKVjftjOC465TSqgqIf2pu5WkRK+BaG769WlLlvgO9SJDR19BovuWwc?=
 =?us-ascii?Q?HUOfgmMdsl7hKumguWpBpnr+rwqnOOGO0dloZjwwDBbll9NEOYcUj15K6JBT?=
 =?us-ascii?Q?IFCv10eDCjbdzNNjPUCm8fk4FgNPe9itUKZSEdOlOSF+gKBZdEYKAEJLmxuB?=
 =?us-ascii?Q?PMa5+fjAks88Y9zMf/AO+3kUlpoS7rb2zh1cHYKo7gRXgoyCq5epRAsD4UIi?=
 =?us-ascii?Q?3elrXYf4ObcTr0rrdb5G2fD0gKnwh+9JKsBfmpxH7CstvsgO8v+yq82TR2Bd?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VnM53GN96ZHAsnNvv47l/uufz2FgbRnMafVd8mFHz/aPEN8W+rWfV9nQAv1kh23RsuxKXy1LZ2umuG6uoJZfA9ErMwSZEP2RHoADUrZlGk7Tw6XCmoEtiVLtX56btjwrqR53Mz1mWspsi5UMsUneQiz729FIXC7w6obvvyOpQzisZwIfDVW+J5kq0ML9tYmwb9iA9UKAMNxyPphef++tCaBVzN33jer4vXihiJbdzHo2Xlxzsgygu8M58sSAh2yk03a4iJwEPur9Sa+l9aPcskddqwKRdcfgmZHQhZC5UW7lDKyo5pfJ4MjHpMovBUI0pSPl4eUrtiRK1x5K/GHBMtGjk6YVyIppovyK0uW5VWSo4ynoW105SaRyJRdG4UQVcGgLjQ34nNlzFzdIK9AyeC/zaN8EY3OcRIHRW96rdPLlSDKTlxnzwoVsUoahXZIKqsUrSod7OCqQeX6OGNnhHIgjqT6MKsr338poO6+ZR+OzTdPXXCRGhXZMM2xxqyNWB3bLMl2sL1jndojP4MPBDPaFdDX45WbxxU4tnz8Y2F8isn87ZsshOuIjl/40fYyJD6mdgmRkQ1pySCgJZKdyIv8U4zgYt4rbSK5ocUS+nrU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e1b127-53d5-4459-991b-08dddb727367
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 20:37:56.6680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIUMI9uE2q/+WSVY1aXhMgsQQQs08oHEu5LdBkQM7HTAplKI7rdSyauLOZ44VkoESgQZmhKpSrALQL8LhstlQtyE4+dF7bpepphzUHm5i/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6286
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508140176
X-Authority-Analysis: v=2.4 cv=Eo/SrTcA c=1 sm=1 tr=0 ts=689e492a b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=cE1wqEjVz1BTdD8JjFMA:9
 a=c4aZcHS9YNZo4y4X:21 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: rw_q5Si6USPzWPgHYskBZyvo8E0LFPrz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE3NSBTYWx0ZWRfXy4K3LNlxvH4X
 D9lpk5uY3SCP7/vO9GLrxbs6AQCjPDkL8MWkgHCwng+FHdPjo8uC19nvBjzrDT6TNCf9Vajd3oB
 t3HkMV8PfB7KSaf2PsgITkazrq05IxpDhvReVc1WakfAe1pMP35MuZ3FnWcZ2vDRxR8DJw3dzg7
 DWdCfoJG6nihWK7lIEwZgNxMnIyuEGhALEXgArZ8fpOgdPgXHcLr0Ol1wEYY2NsB+pbIC72L2/4
 wez6ktfWPgHzvpQI/N48K/zNaC7frT++gHD6v1Ti6EvRPduqHBkgzaP3+nIMUjX4DErKPYwn/WF
 qsYrHQ2Us7KT3miiVuau6tq9qJUR+AKN86FTzOLEQTTo94itXK/2ZHz1O1Nth8Pb+Xx++vvzT9F
 RcCKYeig0aJeTV63hyCaysFDY5omK3wkn6TWJcWKHs0iZ/TNwQjLdiKWL4BLVP/FoA69rS8P
X-Proofpoint-GUID: rw_q5Si6USPzWPgHYskBZyvo8E0LFPrz

Apologies - this is v3

On Thu, Aug 14, 2025 at 04:33:37PM -0400, Kris Van Hees via DTrace-devel wrote:
> A string is defined as a character array of size strsize.  Strings
> that are less that strsize in length are terminated by a NUL byte.
> This implies that the NUL byte is part of the array and therefore,
> strsize is indeed the size of the array and not the maximum number
> of characters in the string.
> 
> Tests are adjusted to reflect this behaviour.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_bpf.c                                    |  4 ++--
>  libdtrace/dt_cg.c                                     | 11 +++++------
>  test/unittest/codegen/tst.str_const_length.d          |  2 +-
>  test/unittest/codegen/tst.str_data_size.d             |  2 +-
>  test/unittest/codegen/tst.str_store_var.d             |  2 +-
>  .../funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r      |  6 +++---
>  test/unittest/funcs/strjoin/tst.strjoin-bordercases.d |  2 +-
>  .../funcs/strjoin/tst.strjoin-capped-size-2.d         |  2 +-
>  .../funcs/strjoin/tst.strjoin-capped-size-3.d         |  2 +-
>  test/unittest/funcs/strjoin/tst.strjoin-capped-size.d |  2 +-
>  test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d     |  2 +-
>  .../strlen/{tst.capped-sizw.d => tst.capped-size.d}   |  2 +-
>  test/unittest/funcs/strtok/tst.strtok_long.d          |  4 ++--
>  test/unittest/funcs/strtok/tst.strtok_long.r          |  4 ++--
>  test/unittest/funcs/substr/tst.substr-stored-len.d    |  2 +-
>  test/unittest/funcs/substr/tst.substr-strsize.d       |  2 +-
>  test/unittest/funcs/substr/tst.substr_nonDPTR.d       |  2 +-
>  test/unittest/funcs/tst.basename_nonDPTR.d            |  2 +-
>  test/unittest/funcs/tst.inet_ntoa_nonDPTR.d           |  2 +-
>  test/unittest/funcs/tst.lltostr-short.d               |  2 +-
>  test/unittest/variables/tvar/tst.str-size.d           |  2 +-
>  21 files changed, 30 insertions(+), 31 deletions(-)
>  rename test/unittest/funcs/strlen/{tst.capped-sizw.d => tst.capped-size.d} (94%)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index ddf703ddd..31781ac9f 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -910,8 +910,8 @@ gmap_create_strtab(dtrace_hdl_t *dtp)
>  	while (buf < end) {
>  		uint_t	len = strlen((char *)buf);
>  
> -		if (len > strsize)
> -			buf[strsize] = '\0';
> +		if (len >= strsize)
> +			buf[strsize - 1] = '\0';
>  
>  		buf += len + 1;
>  	}
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 88dddb087..cd9e7f4e9 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1741,11 +1741,10 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>  			dt_cg_check_ptr_arg(dlp, drp, dnp, NULL);
>  
>  		TRACE_REGSET("store_val(): Begin ");
> -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1, 1, pfp,
> -				 arg);
> +		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, 1, pfp, arg);
>  
>  		/*
> -		 * Copy the string data (no more than STRSIZE + 1 bytes) to the
> +		 * Copy the string data (no more than STRSIZE bytes) to the
>  		 * buffer at (%r9 + off).  We depend on the fact that
>  		 * probe_read_str() stops at the terminating NUL byte.
>  		 */
> @@ -1754,7 +1753,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>  
>  		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
>  		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
> -		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize + 1));
> +		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize));
>  		emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
>  		dt_regset_free(drp, dnp->dn_reg);
>  		dt_cg_tstring_free(pcb, dnp);
> @@ -1765,13 +1764,13 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>  		/*
>  		 * Pad the rest with zeroes, if necessary.
>  		 */
> -		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize + 1, lbl_ok));
> +		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize, lbl_ok));
>  		if (dt_regset_xalloc_args(drp) == -1)
>  			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>  		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
>  		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
>  		emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
> -		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize + 1));
> +		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize));
>  		emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
>  		dt_cg_zerosptr(BPF_REG_3, dlp, drp);
>  		emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> diff --git a/test/unittest/codegen/tst.str_const_length.d b/test/unittest/codegen/tst.str_const_length.d
> index 1c58ba13d..bfdd00a2e 100644
> --- a/test/unittest/codegen/tst.str_const_length.d
> +++ b/test/unittest/codegen/tst.str_const_length.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=5
> +#pragma D option strsize=6
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/codegen/tst.str_data_size.d b/test/unittest/codegen/tst.str_data_size.d
> index a928e8299..c93174a4f 100644
> --- a/test/unittest/codegen/tst.str_data_size.d
> +++ b/test/unittest/codegen/tst.str_data_size.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=5
> +#pragma D option strsize=6
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/codegen/tst.str_store_var.d b/test/unittest/codegen/tst.str_store_var.d
> index c14714c01..cfd37404f 100644
> --- a/test/unittest/codegen/tst.str_store_var.d
> +++ b/test/unittest/codegen/tst.str_store_var.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=6
> +#pragma D option strsize=7
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
> index 5e7d49b03..8090daad6 100644
> --- a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
> +++ b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
> @@ -1,8 +1,8 @@
> -fe80:7060:
> -1080::808:
> +fe80:7060
> +1080::808
>  ::1
>  ::
>  127.0.0.1
>  127.0.0.1
> -::fffe:7f0
> +::fffe:7f
>  
> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
> index 253b2d6ef..1ac5ffd12 100644
> --- a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
> +++ b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=5
> +#pragma D option strsize=6
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
> index 625c786b6..44a6acd88 100644
> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=6
> +#pragma D option strsize=7
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
> index 52718325a..d2982a70b 100644
> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=6
> +#pragma D option strsize=7
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
> index fe5b323f7..b54fd2f29 100644
> --- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
> +++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option rawbytes
> -#pragma D option strsize=10
> +#pragma D option strsize=11
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
> index a1816f975..2b700a5a8 100644
> --- a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
> +++ b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=14
> +#pragma D option strsize=15
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/strlen/tst.capped-sizw.d b/test/unittest/funcs/strlen/tst.capped-size.d
> similarity index 94%
> rename from test/unittest/funcs/strlen/tst.capped-sizw.d
> rename to test/unittest/funcs/strlen/tst.capped-size.d
> index 4e473236c..676ed185e 100644
> --- a/test/unittest/funcs/strlen/tst.capped-sizw.d
> +++ b/test/unittest/funcs/strlen/tst.capped-size.d
> @@ -11,7 +11,7 @@
>   * SECTION: Actions and Subroutines/strlen()
>   */
>  
> -#pragma D option strsize=5
> +#pragma D option strsize=6
>  #pragma D option quiet
>  
>  BEGIN
> diff --git a/test/unittest/funcs/strtok/tst.strtok_long.d b/test/unittest/funcs/strtok/tst.strtok_long.d
> index 1fbe415dc..254a65485 100644
> --- a/test/unittest/funcs/strtok/tst.strtok_long.d
> +++ b/test/unittest/funcs/strtok/tst.strtok_long.d
> @@ -9,8 +9,8 @@
>  
>  BEGIN
>  {
> -	/* 256-char string ending in "XYZ" */
> -	x = "_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
> +	/* 256-char string ending in "XYZ" (255 chars + NUL byte)*/
> +	x = "____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
>  
>  	/* check whether the last char of a long string is seen */
>  	y = "a";
> diff --git a/test/unittest/funcs/strtok/tst.strtok_long.r b/test/unittest/funcs/strtok/tst.strtok_long.r
> index a752554e8..4b172ca1b 100644
> --- a/test/unittest/funcs/strtok/tst.strtok_long.r
> +++ b/test/unittest/funcs/strtok/tst.strtok_long.r
> @@ -1,5 +1,5 @@
> -_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
> +____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
>  zyxwvutsrqponmlkjihgfedcba
> -_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
> +____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
>  Z
>  
> diff --git a/test/unittest/funcs/substr/tst.substr-stored-len.d b/test/unittest/funcs/substr/tst.substr-stored-len.d
> index 97d2b0f61..fa3e5337c 100644
> --- a/test/unittest/funcs/substr/tst.substr-stored-len.d
> +++ b/test/unittest/funcs/substr/tst.substr-stored-len.d
> @@ -13,7 +13,7 @@
>  
>  #pragma D option quiet
>  #pragma D option rawbytes
> -#pragma D option strsize=13
> +#pragma D option strsize=14
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/substr/tst.substr-strsize.d b/test/unittest/funcs/substr/tst.substr-strsize.d
> index b4d0cc63e..04eab4297 100644
> --- a/test/unittest/funcs/substr/tst.substr-strsize.d
> +++ b/test/unittest/funcs/substr/tst.substr-strsize.d
> @@ -15,7 +15,7 @@
>  
>  #pragma D option quiet
>  #pragma D option rawbytes
> -#pragma D option strsize=13
> +#pragma D option strsize=14
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/substr/tst.substr_nonDPTR.d b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
> index 9d847ab6f..3e10af08e 100644
> --- a/test/unittest/funcs/substr/tst.substr_nonDPTR.d
> +++ b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=13
> +#pragma D option strsize=14
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/tst.basename_nonDPTR.d b/test/unittest/funcs/tst.basename_nonDPTR.d
> index 4f93685f7..cecef827b 100644
> --- a/test/unittest/funcs/tst.basename_nonDPTR.d
> +++ b/test/unittest/funcs/tst.basename_nonDPTR.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=14
> +#pragma D option strsize=15
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
> index 500c53e86..f079c7ef4 100644
> --- a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
> +++ b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=14
> +#pragma D option strsize=15
>  
>  BEGIN
>  {
> diff --git a/test/unittest/funcs/tst.lltostr-short.d b/test/unittest/funcs/tst.lltostr-short.d
> index 969045667..65a5714c2 100644
> --- a/test/unittest/funcs/tst.lltostr-short.d
> +++ b/test/unittest/funcs/tst.lltostr-short.d
> @@ -6,7 +6,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=7
> +#pragma D option strsize=8
>  
>  BEGIN
>  {
> diff --git a/test/unittest/variables/tvar/tst.str-size.d b/test/unittest/variables/tvar/tst.str-size.d
> index b4ab6ea2b..bd8aac132 100644
> --- a/test/unittest/variables/tvar/tst.str-size.d
> +++ b/test/unittest/variables/tvar/tst.str-size.d
> @@ -12,7 +12,7 @@
>   */
>  
>  #pragma D option quiet
> -#pragma D option strsize=4
> +#pragma D option strsize=5
>  
>  BEGIN
>  {
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
