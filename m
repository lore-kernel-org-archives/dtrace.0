Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBF13C39
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721423547; cv=fail; b=co8GhHovwS4guPfzsTfCbwUyvzMVUfq/EUNa9DqnMmwhxcV8qDEQJx+XtDwgG3HmAOOwf4jw7I5NLkqX3xJ1iiMrSUrBFgePE76XKWKzWvPQHzL+My05So5fGuLmIkKld2Yf5vtLRJOMOd/v1TDzQ83fOTQILV9xPRcum/6PBBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721423547; c=relaxed/simple;
	bh=yjkcR7TSehryA53a9DJ4klzlLrWxcPEHOa+sfdUFS6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DuuiAeapENtbomo1yJ6dan4utTLuEETZ6ScFq8poA9Uj3dySvEWKWd+pyWSjg+FrcPYbHfItTko3lsg4AaOe+mDTmiX+GXtKfk1CBaQzTX1ZEVbhZQvTR9uE1y7h/HmsL2POUnaar4TA44kabYrxZwxi4C00ON+0xwSFChtiy+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ggAyNvTA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OEiTbcVf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ggAyNvTA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OEiTbcVf"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JLAi7q025500
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=n9wnaf2f8worIk7
	EP7HYqEtAV/TE+ha+ZmGkHbL5nqI=; b=ggAyNvTAPFm0kcAhwRTJWk3iGKeE0Br
	KA+p2yHUMWW/rI24UHC5NkGQGEq7u25T60S4LJI019rdXroJRrqE+lFTkCAOToXz
	SlD/4tVx4gfn/t2D9GMGRWBw5+O20k7dYXpEJCupLLAzY72Jg9K4u/PMdmjLJeMH
	QDIU4s2dE/lJMlkwucQ8pRv1VzOTem1f6PPjO3aKp+omNv89kTm7ZPtLM6YAiRe3
	MsWNX6YGB9TlwiMl7r3W4E9hLShEtD/Fyi/omqT8M7RUAR87b3wosH63IUNrsXRr
	xeN4PW8BYdfixJJofdtH88+3zCrcHksJlIUySlvGv/DWt1g422BB7fg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fytug01x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:12:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JKvgZv004508
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:12:24 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf27pj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:12:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKC9tQznrkY6GCWwIS0sj9JsX+Zb0DKjZ9+YAxTdmJBAaldJ7QdZpwMrR90ecJoQThYgJH4b0a7OB/Ka5RPMjiTjLhNz4cFREu/VPh0ru7ot7+CCT0AHXUZriTuA68a0LCRJrPuNk/3AKkmd3dEduxqNqMDmUkoJwOuNj44E+eUrub+x/9JA2UJL+zPx7bWG8rda8aFGUupRNzr8M+xvnzUcMwVkVY2TFxhHFn9+57UIL1YcPV0Pbqm/mOJDpNL0IT6+4GfPjjhGjd2qO25DaowZSTN/LBbdtHaQ5kNZgssYqwLvI6IgH41WNGJsWBabsQYRNb2Rb0dG/LXeII/RvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9wnaf2f8worIk7EP7HYqEtAV/TE+ha+ZmGkHbL5nqI=;
 b=yv2sDEOWOEvE5y9zj49nlVQneuKuGkPEhaF6Pbu2n1PYbECg3c0px2HE17PrTPKMHc27cwcpTDdObeI2A6EovpkSczdAosNbraNImzfdPSAiXVcOk7Z6eZdAbzz+gpwXvdryMZgC78lA5qAQlWIQ5S5G5y5lthEs2XB8gykGcI89r8nKD7hLm9lqObKWA/tY89yUytVDLtlxaE8OMkZlK/0JO192s5tWr/41//Bl/AO6KqOXNEih/KMepHyUVh/AvDMcUaNIrdqOU5vKQZpmw4XnJ3TxbelBtkl98uKhLmGAvdNO2cUPKTfxRAvSpy6bvMtVluiwLMea6gDYAvfjtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9wnaf2f8worIk7EP7HYqEtAV/TE+ha+ZmGkHbL5nqI=;
 b=OEiTbcVffEY1UOGuchV4ZQiXOgAvpQTXJhKHpf8jzGuH4ufX5jQAmzS2txvTjYX7QfBUsWw6CE7OCiLeK6cJ967/98kwdxI4Zg7YXzFJyS8N9rUvDu43SEKdbdefITdukf6IgLVJQWDP6MVzyoHV9d6gQOgeUHa2mUtoTQxvC3I=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5172.namprd10.prod.outlook.com (2603:10b6:208:30f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 19 Jul
 2024 21:12:20 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 21:12:20 +0000
Date: Fri, 19 Jul 2024 17:12:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 26/38] test: Annotate xfail (chill not implemented yet)
Message-ID: <ZprWruD8mYUA7zW0@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-7-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-7-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0449.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::34) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: 4af90404-6244-4188-3a5e-08dca83779c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mKfrIXpMcjd9QaGwM3KfqDi5eCLrRkwVuJj+oiDV8BG24UtbcraJzhldPZzT?=
 =?us-ascii?Q?ZaK9fHvcDQYUuJJlsNdVn5c2yymK2JoRgttWtSEgbOC3EhWpa4VEseTKZq/+?=
 =?us-ascii?Q?iPXL8JrLY9vNWwm/F5LDnnn/IvC9jLfM2E8TFh3lVfHpfLh2qWESqg/jzByR?=
 =?us-ascii?Q?dtBf8PgHvImfOT3M/6D0R0ai85CxBtjfjxYYX8bJxDRh4/jLzbH+gU1R33z+?=
 =?us-ascii?Q?/bmd5GnQKVXQ4DV5WwYlnoiLhGNtsf47Inm+V2HfFranjDzvNbkpDSe7urWs?=
 =?us-ascii?Q?J45cAMu8QDurdRtCGOYIcRkS8ocC0sJSyvm0XAy1nJX+kOq+KCestYxVlvsP?=
 =?us-ascii?Q?wVmqU05ILFNVeBXdcdB2Ls622/Tbwtg9vBp1D3+dHp6IWiLkZVEXn0ceRNjF?=
 =?us-ascii?Q?l+whuSegEhdtCMa0h66mYGQTxit/qdvezICI73U5BBwWepc154bFRo3zAZTj?=
 =?us-ascii?Q?yS5vy0GzzL3EnQprCA63FJkUDq9NHCKKqYDe1TDi7vX7O8YI6KPXASbo6q7F?=
 =?us-ascii?Q?JGrun8onAcVcUHfa5cg/UA2AHApEG/pKXXMs31IkgtJaIeGuYgs8YvrhbEg6?=
 =?us-ascii?Q?49m4fGu0INY/ZSjLJORsgcFgvf4LOHc+c+1e/ef7fOGDxtJst86iR+SY56my?=
 =?us-ascii?Q?sTKShnv6nNAC+cmKcx3WsGb8Hpw7w44WQSqSjNuGyH/TJfsnSj/Ma2vjc8Zo?=
 =?us-ascii?Q?sfjElU2rpnaK8E9clZAMIovE4uVhpf9tbqBeyDh78oGzvT872jsYrYkZUTnA?=
 =?us-ascii?Q?UGWIv/G6Oa3bdtyOPnBn+MK/iIKEfgvLzemUWb67nd/6ts5PNXwJ/bgzm1PK?=
 =?us-ascii?Q?+qO+jeypvlIus2h31aB9BQf734BVLRuPumABXGh8unU1fV8o+w4JEdn2EaGA?=
 =?us-ascii?Q?Kowv6xczF7yIRt7nTz4Qw+ub9B3HlJS9imfAabYNwk15E9eEM+vNrqLGJ/OM?=
 =?us-ascii?Q?xFEd0FYLHqgRBSZALKm/aCgF31cdefxxo8ZU2gFJazuIRt2FxfWEZozUkQBR?=
 =?us-ascii?Q?+IzBLNeIzy/qrXgMEpjwPv7gZq7YRDrv8iB6MBnfOnsLIDgBiSB1ifPYxpC2?=
 =?us-ascii?Q?zxxAKCyHxEg4J5XNVogMzqqtG1mYl82OrdmEI4/1B8lZRihyEpbWUk1/2/eg?=
 =?us-ascii?Q?lPiZFQ6NlAor9t4eF2Zm9mH0KxGo8kZQKerrgLRbGqm2aaM7uWcygs7PuDxF?=
 =?us-ascii?Q?t5onvP2nptaaQtA1TZdkE3tvQSZNyRMY3ijYtXiWZTPNZeiHRLgK3QgxHPkR?=
 =?us-ascii?Q?LMv2/eLroS9Se/KIVXfiV32MutvEkXYenOT9BJWF+uvp4djYjTK8jE2xP/gx?=
 =?us-ascii?Q?XWQb1s/T/ZIEmyqDdqm6Z9L1q+6yaqKRfG5J5bzrDDK8DQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KCxpAFlTY/uoizyx8tUtTDNKYZM//plH9YVrgz/9bSSZwAhG9L9q/npSkajS?=
 =?us-ascii?Q?Tc6s9ozIe5Bwbh8LIVoeMHbACkA7KGmMYnsB77lBPeJHGmG6fmDG5499P4p4?=
 =?us-ascii?Q?GcLHxfxo4EsmHx/K9fSbxeyhmZyV/gzJc7q7+ZCNUpU7XsiCqW8xlvWdWrhE?=
 =?us-ascii?Q?GEGuKRHeOamo95qhprxjNsaJcK/J1+BkoUZtEo9It+GvY5XiwCLmztYmn1r1?=
 =?us-ascii?Q?5/3VwmO3N2M2IEGQM+RIAizW3Sfa4qjI6cTAQi0ZPSEfvOf+P2SnPB7FNFXa?=
 =?us-ascii?Q?d6n1wn71VXHSIcvkyyAZ8AtZhmTBWFr0K/Dclp0dRdFpTgeuqXD+5gdsefHg?=
 =?us-ascii?Q?m0Q3QXp+bcBvEGWSc0kD6+ttkUSfwV/fmcx0PwhVaV+xroIt6aTxespCKu6o?=
 =?us-ascii?Q?jwI3p3PQssaMjACXhlS/3thMJKm3Ht7whlWALKxcCD3Yr5SnNWCOVWO1N9cv?=
 =?us-ascii?Q?7022SLSVO+SLWRqpvUBj+g9wNR7iyCgZoGRlPxm9hZC4PqaQvkzvsKoUn5ge?=
 =?us-ascii?Q?SRNAZ8wv0epScZcZnro6f+0qrAWi5hj+RGzvYtFwV+s1X4SQNHUuhw/jA5rT?=
 =?us-ascii?Q?pJVzLCjCgw+CMj6kPWdCIV6fWT3m29yrUkdgMKUkluNDIy+JezUU29DPEGoD?=
 =?us-ascii?Q?Ih20vqSPZVcjVBoqfWGbJ9J9bFulSQQOBC4SY86Ex45yG+jYhM3dA85sEOAX?=
 =?us-ascii?Q?tsZ9Z5TvcWSHrHg+lYQfQe5ng/zkpGAoCmcN9O5Vqhm/BSpQMLExUnJs5Rw0?=
 =?us-ascii?Q?GHi450pe7IL6j1bcnucMiapaE+VXhZUQ6MQQYd1A9LY8/h+9r2DM/1HQaGp5?=
 =?us-ascii?Q?87R+wCrvlGIgUzEVlknO9Nf+tugDk5giAn1oh8JZtnygoABVYasqXC64gtMU?=
 =?us-ascii?Q?GeQqspfOfvABrfv6GsJ61sCJ7lsDmVnt+w6M7avavdJjxwTzFti/MTwfrA8f?=
 =?us-ascii?Q?RQupQxXNjh7Lj8YjRFoaWSSvhOhmGqKXQxjy0vC/ZVRQtxbc4Bcvq/T3944s?=
 =?us-ascii?Q?X0E5UQbcwU7FffBYsKeFL+nHf0AiG93JHPcGNIHLnJFesF159MdUGuFY7VU4?=
 =?us-ascii?Q?D1AEtFjwXgQXFRjlPPXLJjV0pQeCDZa9Rss+EByfNl+to5pI6wbStgBxk+Bs?=
 =?us-ascii?Q?H+1VN48ok+VAYv2JYgBWHN4JRYv0Zx/RuWK2qR6lLP2kj2Qp3sLS2PWSWUKo?=
 =?us-ascii?Q?Uzic6H+WItCz0/zVq0ZL9o+zoecHBDFPkPNhYaDCo28/vizg9MAxNCKjrcgI?=
 =?us-ascii?Q?c63hjY/znv+iXMo/SisaV+EzkyhxbX7fBEC7uap2KTHAfICiApTU7ka+njZ5?=
 =?us-ascii?Q?L9+DiJF3gSEqU0XU9xftqyv5HZV50rdB4TorjLc1Ir8N2G0f224bYmeCJbr5?=
 =?us-ascii?Q?sGOizpU755x/qav7fzepL1f57EbNX6ynyei3OEG8SsSK9vmfdOWE10+GYNeb?=
 =?us-ascii?Q?nOd8LjpIw9Nsch9S6epxobX6FK9f3INtpGyPMXhuf9VWg3D5cIileyOmO28e?=
 =?us-ascii?Q?fsV6M/NKFqGSR9Km9Y5ZHfWbWnNK7Ul2E6d1qaEBkYdklhtny8z/vv0ob455?=
 =?us-ascii?Q?rGSVXom4gvbceqd+N5zm+bCX4WE9Kx6EJf1JchtaIv5JtFC/3IocjzkFM/4q?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	td+KPuoJ0mKExt3cg8pUDo+HXnou7XVcl7T3vVEo5+vJra8UtFpujUt5/FFWzGT3/ento/JNkajtntZ/apivMuHJ2pjjXNA46VSUcXjwCaIgb+IQ9I7f+dLoXzSeuZoJIzoMUg1fZpIafrgVoX6tNZbZOG3UQggVXXT+PCGo2NEF1uHW2BCw+GRTIUhgbQutJV7DlHpxfzrt5SXKGzTc08cuu1p7UOIqI/HK6I/2lfgtBu0zeuMzn9H8mlUFHjFi8rpw7IZgAzIX32sIew8rpaabtNilZxmpqg0VANrBwtWFlsibRHTapauO2L9NYkfUzlNtRIF+vKXs+k0TeJnpBWG4gxpqxKRuWNquiJOwakDlS/9nFQdfX8zb9tdYRC1GqVUGpRC9DfmmbgegXseLNeihae/PCk9SMigP/00bmNwlFrrvq4Acg0ZweTOPeMrMcQagvd9EDJD7+KiyAey2NP68oioF8GIcRznojF5qOUwAn1HeAsCNMKzbFa4oXSS8b747OirFuIqftNhE1dad2++dys53ptS9Z1GbyoGadHdtJC7Rv3r8SLrCEWHssXNKvXasNM40abE2Z1evhwN8NrKw/UcNc5j5gYiWtpjU7fU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af90404-6244-4188-3a5e-08dca83779c4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 21:12:20.0500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQELmd6K/VccktIa90GeggmEl+sURtTGVdqBN1v1y9jWaEp5EhhXo6IUe9et5fMeVflq2y/yu89MrZfO/G2rLeTDhUYrvuoXpphyPFjsaZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5172
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_08,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=904 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190156
X-Proofpoint-GUID: UNSMIFLsldyVQyD-H_A5_EUh7SSvRtN1
X-Proofpoint-ORIG-GUID: UNSMIFLsldyVQyD-H_A5_EUh7SSvRtN1

On Thu, Jun 27, 2024 at 01:38:52AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>

Before I can really assess whether the annotation is valid, I'd like to know
why chill) is even used here.  I.e. I don't quite understand the test :)
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/speculation/tst.zerosize.d | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/speculation/tst.zerosize.d b/test/unittest/speculation/tst.zerosize.d
> index 56c1fcea..996f1257 100644
> --- a/test/unittest/speculation/tst.zerosize.d
> +++ b/test/unittest/speculation/tst.zerosize.d
> @@ -5,7 +5,7 @@
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2, chill not implemented yet */
>  
>  #pragma D option destructive
>  
> -- 
> 2.18.4
> 
