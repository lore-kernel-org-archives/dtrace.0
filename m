Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28108F5A
	for <dtrace@lists.linux.dev>; Sat,  2 Nov 2024 00:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730506504; cv=fail; b=BYd65DddngbanQlr89/zDDD3pqdOZN95TDhSU45ejyP+oQd3DWB8apVSmpjEP5C3TR8AJmQh5eoq3GtMNe/4NDepCtk1V5+KwZ5D+U0OxWWY/xjZ15ciUawA46+KXACr6FOK+lnilWsiaYlsFGXIUtSq2kSB7u52wdnCKRFve+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730506504; c=relaxed/simple;
	bh=JzaITpzUrG6FTg1HDGUReVte5L+f7rZkT/oli4X0AZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VG/pwc2TtvLP2XPH5J/gLZfo18xNymq4WZCacsvXrEoQ9aRIZz9t0QD/XrMDoEqw47JiUSJY/6K02fGFJgfVpjaZXuTUEjUuYO11HFlHMQXHDwsW6C4R4qqAId+q7dG1lqS9y/oiBnZGGE+G7M33fypBDIxPVL4OlaJf2Kilppg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U4hYFcmn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=M+06xTLq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U4hYFcmn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="M+06xTLq"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1GBxJe018616
	for <dtrace@lists.linux.dev>; Sat, 2 Nov 2024 00:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=q5J4IBdIoM9Dx5zUzu
	8uKhAMrkeZBpwjS09XLUIef2g=; b=U4hYFcmn8IkWBhLtER7JVAX1eQoL5g4JOX
	U+nFtB/kIVB/aH213cz8RJpDNPkQNBg+SLmm/KgRqVZYG7CsyhhDFHQ7qusLcISH
	TqO6WXGj18I9++lUFhNu/ALIKsFx3QJvG1743rASX+++a32V0RKzbVrwR1C/AP93
	EjdZOGA/midvsF5jTW36/neoDDwxhO+5OzI7oHgf3ZI5nLiB+CYKbP6CyguV3yhg
	Dwyfs6Q0zjHbV99v35ZB7rEWowe5MOwgBvqOXKTayWvKXHoey0TjxXCyzyHaCLt6
	sSKj3u3tP3mYfH6lg/QaJfnSZ8eJ0JD3V84eFv5MQIWphCASWYQA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmncsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 02 Nov 2024 00:14:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1MJeg6004798
	for <dtrace@lists.linux.dev>; Sat, 2 Nov 2024 00:14:58 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2yn26f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 02 Nov 2024 00:14:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqeNcEmclU/udmAHPKzW6STEJxacv7Kt6+q0CwgFDRwo6D3xW0Qq7Zs2qDE2uApqzwvzV/7tKJQFXUi83eriKJ5jzqUaTi/NbSziKPVuy10Ib7r5z5BgO1QZDMDrnQ0aS/4heCpvd3phRGZb8cPL6gt0kAg0bgaBTeJcqJfy0lReGemX8+NWvrjy45ccwzeKgoiJuL+pTLpqUD55iPAqBaBy4hIl/m4BxJn+XIDyfbuZ4ovHuZE66BSYHqWXV/W+U6WAGK63a1/CfedgrF+EDfvX3ozuoeevMg941eIg+H21y3HLJben4WAgMYxYovw8dLKpnq/rvFlrDTIojd4kpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5J4IBdIoM9Dx5zUzu8uKhAMrkeZBpwjS09XLUIef2g=;
 b=HUS5NAjO4HGaaaJ0yFaL/YA5qWbaklzMfsaEMyx6bkBXJyCawpH9sfvzQKGmb8BKLBEEKfIE7bWQBWTBKG5kXIriTn5b7aCDk8OJzFJ0zxh1MazIqb54O0Zgz8N5PuY2R3eugZpIqyoCNbUx8MQsHhj2IRSn9PKv53oaCdxDTlTSt92am/0Zu/oVRhci7xerPzJWaq1MIyeONyLq8++AxD0p0X7lj4A+9PFuCP30sDMP83fyF+XzwzfrkLTxyGIn/dMkDAjksudoHadf8jB81IvFlpD+DGj44i7sywJWIFBc7hzpTiWKZm4A0pyTv5pEtdmsDcMzvL+/M+56AL80FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5J4IBdIoM9Dx5zUzu8uKhAMrkeZBpwjS09XLUIef2g=;
 b=M+06xTLqO/NZ4YTcdQX96NW1JopzLNk8l4RzoyQTlapwN9YfoCeCUBTYeRe7nhKu0fYVYKm/dA3fEZBd0LeXEtRPawn684THjwOEIQ/L1ePm6Luu9dj7pO33+0ZoebDyC1MY1Oob0rqnYK0rSIoVWe8uoLOZAyS5XcDkk7k95X4=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH2PR10MB4278.namprd10.prod.outlook.com (2603:10b6:610:7f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Sat, 2 Nov
 2024 00:14:52 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.023; Sat, 2 Nov 2024
 00:14:52 +0000
Date: Fri, 1 Nov 2024 20:14:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 1/5] usdt: get arg types and xlations
 into DTrace from the DOF
Message-ID: <ZyVu+Z1Q7IpckIg3@oracle.com>
References: <20241101155712.397674-1-nick.alcock@oracle.com>
 <20241101155712.397674-2-nick.alcock@oracle.com>
 <ZyVoPD2QmbcoA0el@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyVoPD2QmbcoA0el@oracle.com>
X-ClientProxiedBy: MN2PR14CA0020.namprd14.prod.outlook.com
 (2603:10b6:208:23e::25) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH2PR10MB4278:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d664e3c-54ea-442d-92d8-08dcfad35f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sp81LZ5LfCYH/Ui/UeodyTDOL0ceS6rsuGOrXcxj/QpDRrUkKaaZbYTu1JPN?=
 =?us-ascii?Q?5iizR0uAmu+2Qf2qCZAiXQdJpioY+WKXo21xZT4fqXr4VPSrKe6FTqGzlTgW?=
 =?us-ascii?Q?SesDHN33ccQvxeEmrFMTWXER5eYzQzaOfxJdSQPHrmcEGxmxOv+daMjyQs1U?=
 =?us-ascii?Q?O0Lg5X37RADKCpad6LkvpiRx3jBhT/dQaUIlWKFgrq3S4+b2cq8TF8i1VaAQ?=
 =?us-ascii?Q?LrCgy/gVsgG1xwpcmTj4x77IlRZWC90fWp2FIFdXcXvWj+Gg+cycG8Cvg5Oy?=
 =?us-ascii?Q?tZyi9LRhU/8+Wsn480SSILyxrPD2LUZtsvRxAhz88TPLxKrg3zsrG2Jk3Egi?=
 =?us-ascii?Q?btStSHhtQX7PRWa+CkyfPC20l1beUcGsTQ7aifa3MIPvxCGcePI/Swy6RS6P?=
 =?us-ascii?Q?ipF3xxPSHBuD6OE+d3FyT8Mib+nX64GClgo3WxX9AdakT0ZfYfikrMbhUnHp?=
 =?us-ascii?Q?hhzzA0WWthkP+qqueB9Uz6SSrRwwCQITZTdujf0wvIdbm4Pw50lMmBwiYwtR?=
 =?us-ascii?Q?2otN0JwXOpC+Hn1G0aHqH7HOrV3LFXGJ5LSy0M+YcpFewAWNp0bNJBqbbYAB?=
 =?us-ascii?Q?pIBtezMB3KwcoSaVb4iNpritAGiBA0F73cb6s8XA0eZuxsj8tGR0fzSgcsno?=
 =?us-ascii?Q?6hpyYn1xmxEzRp36V7/+OlplNusFtCLOmfllnsKof30ADFqX6Q2qPL5AOPKz?=
 =?us-ascii?Q?ndwAmcbkcgj/pLiaoEMFZym7Q36RxAwW7gzxmgqC/BNWIfKHLP5gXUbvlY+Y?=
 =?us-ascii?Q?Zb8AW46/xGpCrIMoc5ruyKEW3KCS76TFFmdBwvN0+4gbNcDv7q2UmlKAJZxf?=
 =?us-ascii?Q?PZj8AkspjUnTHHTM0+F9sJbnofu9yzaPr1VoMYGglLYYLk9FMVmfBNsjerP7?=
 =?us-ascii?Q?ZTWruW7noyrEPQi9QDYU5InKxa6/eQOi8zX30xILrDuBuMjbkl9PGnrD3UNY?=
 =?us-ascii?Q?df/YKpbMWb5pxVtg8s85jI4HKJQw8Q8Xhxy/Gml4NaoIc9oDt5z8sktWtCsc?=
 =?us-ascii?Q?QWe8BH43Rqzr8xnR0N6SJ7mf9dFjnxyia84rUW7kkSNQ8adf58UhjEtaesaj?=
 =?us-ascii?Q?Hr1no+7NlHvxE1kINd3dit5Dt19HuH+uEWRj63zFUUAXOQ6LIvGINUW53A8D?=
 =?us-ascii?Q?/PVYCP2LZjlPmQIrICZpz78f0ZMsGyUz5GG7g8Qsot50ezvrYVdQa0ZjDAEV?=
 =?us-ascii?Q?1jBCzrGMMCvMTMTM/1SwfYd+FfVdnn9+Rpi1NcA02WddrGaRxx0ELgIlxOMe?=
 =?us-ascii?Q?QxkkKJVwdU1Hat+OVbYsCrkiNkImp9jr+PBNyuqetXfrMh7T3geP1K40qa0s?=
 =?us-ascii?Q?CZVDEgcbLGc9oK3LN1KDDVGg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iL2zxkQZqZtoLIvPM3ueYAEv91U0yzwjggE4mpIE8M+/+O7LAWcVz4GyGd94?=
 =?us-ascii?Q?aU+t6SB5Y5zFGAFnmD0R/mUC5Elhpvi9WdVCwMsFAilx5g/WeBtprl3aBd+R?=
 =?us-ascii?Q?xaoTkg2pytp7yBKnsbnGn5G9FMmRxpjbSWm8Fmt92TbYPeILwUVhZ21Qiu6c?=
 =?us-ascii?Q?cqyMm4wP1iwZfiSjkiJqzxsTVYvk3ocTEXSh+sFuRrOXaeKlckFnf1XyLc1w?=
 =?us-ascii?Q?TXFUYkHc9ZrcUZPDXmUlHHslXmtypKcWKWN/P9i4fa5HmRHOt81SgmuGUx3Q?=
 =?us-ascii?Q?020Eq5SQm9033LD6nnMnK3IOPZX7o0hx+Sayto046eagwOgX94d0gVu/MkCb?=
 =?us-ascii?Q?3exvH525rnbMdrIStPfTs/afEPAe7dmwWC64M/ZBpK+wxCALn/L4rPwo/8T8?=
 =?us-ascii?Q?loQ63dYlvLcct8mOZ5asEkhJNFVrjWLyQxAg555wUfxkqpwVcyUYVsf0SWnf?=
 =?us-ascii?Q?VnQSOmADDOqUXla+AT0rEaV77nZTF5IziZ/BC86RyYIfIC1X2CLzrX57UEd9?=
 =?us-ascii?Q?I9AB87PSl2fQrqNqTeBWQ7wcxh/7w+Ay3cX67AorUvwFj2EivhwzuJygutUe?=
 =?us-ascii?Q?wV2Sr+VZvcCoEcsaTCON5IZCC7eA5ULA1UouxD9K4OGIHJ8x3bSs5WaW07zD?=
 =?us-ascii?Q?Pd/hZf70Yxv7eBJ5uznuXqilMJ4xHpE1WMMq2569IySacLwFLi7JlN3Jz93I?=
 =?us-ascii?Q?oQBnaqJCWRCxbUr2WvN4DFUuT0Z3FoZz6pgdUg9h1ldRl0chCth60jjWN30R?=
 =?us-ascii?Q?yJ08a0xCWrB2V31gz76ibb3nysLxS2JXa5Jcg38wUEaNvSgHs+7iz4pNIEFg?=
 =?us-ascii?Q?9l41dPKK8CS/y8fjiRRndoe7rOFVUmqf2YdhLItDzG0GjxV2GsXsANBUawoS?=
 =?us-ascii?Q?ZWGClAHSYLzJJHy6uyX/OTvCGX+6kr5D3H40n2jf8DQtXhWSwcbZDCkjZf/y?=
 =?us-ascii?Q?INGd2qR0k1TNJEh52UGLvFnB2jkM0d1Uqysa/AwUWb3XEgfTdBT3GSb4rMX9?=
 =?us-ascii?Q?ryEHxUl+UrpeBLsJT96DnQx8ajXr2E3iEt3D+Ni4Bgp3+vBlyzuYQ8Ry8xJY?=
 =?us-ascii?Q?XPPRx3rO8UGj+XMjApZqSKZbgNW9FBYAND/FoTkxgURgzqqYcABp13G2bVAE?=
 =?us-ascii?Q?f1MhNnzdiZWXJPCxQ3E88cWhgmAgg4rCY6p+y6TJqvmqEKjvQFuWx8UN7cJh?=
 =?us-ascii?Q?PncA3IfTyrVKlsf1czIfgxfjx3kvp3whsrb+h+PfoREQMRTI7xOM7W2HVv32?=
 =?us-ascii?Q?SukMmJAJWlgCae6dg+sf7ExGlfDQezLHb2A6KES0CkEsfoy11g7pf4w0T87o?=
 =?us-ascii?Q?tdvQ1HEv3CwdqNOC8sVtcOWnKPPRkLV+mKVbBDuVBUHYi4a2IsOAS6Am9y+z?=
 =?us-ascii?Q?bcnbb2RGBHsalaIe5n7kJBmSKVyNM/yzeE7QCvVqg/REimdXZqDB7pHd22wZ?=
 =?us-ascii?Q?qpPxmrPGq82LQ/ooud3nCYAmPVXGTlOhVb/3P1y1vj+bt+T2hQfobeshvVpU?=
 =?us-ascii?Q?z0WJ+sZaCIerrAtoXKrMDwdKMkWBdba99ln0sn7/spkWfy+iiYRFMHA5QoNF?=
 =?us-ascii?Q?+fGSRuY8N+NG2/tYFaHvPM/soi0kPL4GV9RKv1RgEQNMb/653BIx8N9vJ6GP?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sCHmhWfP10j37tv5D1IkIiur/0KyliHVbdFGQpZxDqsbTsPrC9oA0Ss/OHPGF+vmW9pMEPttxOsdpX0rbFtFW/dQD/3U6pq6B1qmQHbZ84lYtKM5A0K5sKrq2s0Ja7yiIgCuWdJnBhM4lr0Z+yBhvyhRVZbfgrF/aJgeh/FlU6maVk/0g60N3F4watOJCQq61ptXfXGLeM3UVo+fjdVUB0FjlleWKjxJj7LfT7bgr9zpF3huYlf5hWyyAV5UBQ+vHp7XzlcUwMBZnx5HgZixqn7+sbVOj66vJ2JbiRPLX+iHSSv0uBl21sPpORuc8rPfBHVzV1xZ4ZoJ4taQvQAKX1rDHiARwJFmhJfaBVBW+R6u3x+4LpceH1kG7moccILqtSRtLhXj/Es8dMxUayKVkt0RFdWnmKM3TcX0T+vnXpvzXMfvh/FJF2TlJPgK0EzCe6+Vygi3zRiQNs9luJhMBuJ+xadXLXjlMiTycMTvvy+Ro7ZXQOo4LJnaJo2qvuIvsM93wjqDPj8w0fjKK3VNPCS1SiAuqeM9RUzKUqa5amUsO6lDO2Wow1Y+BvJh6dgSyUdjCBAGTYOllGI5rzhT/BqsD+yD1N6qodzZjEgmXhU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d664e3c-54ea-442d-92d8-08dcfad35f5e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2024 00:14:52.5939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gk9HxrmdPVqX5zsMdNEr4cY5rYe1/4WoC2A4ihqXD/mLBHspbC6P67312IZ+4k7uyS572FnLhWIsE4yP+zWyd6zRs0ZEvg9x/ljLkjbzIoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4278
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_18,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411020000
X-Proofpoint-GUID: s76HYBXvYdEJE8I-wEU9xi7t16N6itpi
X-Proofpoint-ORIG-GUID: s76HYBXvYdEJE8I-wEU9xi7t16N6itpi

On Fri, Nov 01, 2024 at 07:46:04PM -0400, Kris Van Hees via DTrace-devel wrote:
> Two comments below (one tiny thing, and one explanatory comment that I *think*
> I have a better suggestion for, but you may want to rephrase it).

Actually, another issue (see below).

> On Fri, Nov 01, 2024 at 03:57:08PM +0000, Nick Alcock via DTrace-devel wrote:
> > This change propagates native and xlated arg types and mapping info all
> > the way from the DOF, through the parser and dtprobed and the DOF stash,
> > into DTrace, where they end up in the pid_probespec_t for USDT probes.
> > We don't do anything with them once they get there in this commit: no
> > user-visible impacts expected.
> > 
> > We bump the DOF_PARSED_VERSION since we add three new types of record to the
> > dof_parser_t, all optional, covering native and xlated args and arg mapping
> > tables; to make life easier for consumers we emit them in a defined order
> > (documented in dof_parser.h), and add arg counts to the DIT_PROBE record
> > that precedes them indicating which will be present and how many args are in
> > them.  This means we retain the property that you can always tell which
> > records within a provider are coming next purely from records you already
> > have: there's no need to make decisions once the records turn up.  The DOF
> > stash hardly changes: all that happens is that the parsed data written to
> > each per-probe file gains some extra types of record (it can have
> > DIT_ARGS_NATIVE, DIT_ARGS_XLAT and DIT_ARGS_MAP entries following the
> > DIT_PROBE record now).
> > 
> > As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
> > refuse to read probes added by dtprobeds that are on the other side of it.
> > (Restarting dtprobed will reparse all the probes in the stash to match the
> > new layout, and newly-started DTraces will pick that up -- so this only
> > affects running DTraces picking up new probes, which DTrace cannot do yet:
> > so no visible effects are expected.)
> > 
> > The code is a bit repetitive, with nargs, xargs and arg mapping all handled
> > separately even though the code is very similar.  In future maybe we could
> > unify them (but my attempts led to code that was much harder to read than
> > the original).
> > 
> > Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> > ---
> >  dtprobed/dof_stash.c   |  15 +++--
> >  dtprobed/dtprobed.c    |  10 ++-
> >  include/dtrace/pid.h   |   7 ++
> >  libcommon/dof_parser.c | 150 +++++++++++++++++++++++++++++++----------
> >  libcommon/dof_parser.h |  64 ++++++++++++++++--
> >  libdtrace/dt_pid.c     |  59 ++++++++++++++++
> >  6 files changed, 256 insertions(+), 49 deletions(-)
> > 
> > diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> > index 0e639076f655..8bf465678217 100644
> > --- a/dtprobed/dof_stash.c
> > +++ b/dtprobed/dof_stash.c
> > @@ -59,8 +59,10 @@
> >   *    startup if the dof_parsed_t structure changed.  The file consists of a
> >   *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
> >   *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
> > - *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
> > - *    the DIT_PROBE record specifies.
> > + *    DIT_PROBE, then optionally some DIT_*ARGS records (if the count of native
> > + *    args in the probe is >0, you get a DIT_NATIVE_ARGS: if the count of xlated
> > + *    args is >0, you get DIT_XLAT_ARGS and DIT_MAP_ARGS), then as many struct
> > + *    dof_parsed_t's of type DIT_TRACEPOINT as the DIT_PROBE record specifies.
> >   *
> >   * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
> >   *
> > @@ -640,9 +642,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
> >  			break;
> >  		}
> >  
> > -		/* Tracepoint: add to already-open file.  */
> > +		/* Args info or tracepoint: add to already-open file.  */
> > +		case DIT_ARGS_NATIVE:
> > +		case DIT_ARGS_XLAT:
> > +		case DIT_ARGS_MAP:
> >  		case DIT_TRACEPOINT:
> > -			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
> > +			assert(state == DIT_PROBE || state == DIT_ARGS_NATIVE ||
> > +			       state == DIT_ARGS_XLAT || state == DIT_ARGS_MAP ||
> > +			       state == DIT_TRACEPOINT);
> >  			state = accump->parsed->type;
> >  
> >  			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
> > diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> > index f4c6be1e045d..2ca39b26f88a 100644
> > --- a/dtprobed/dtprobed.c
> > +++ b/dtprobed/dtprobed.c
> > @@ -791,16 +791,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
> >  		if (dof_stash_push_parsed(&accum, probe) < 0)
> >  			goto oom;
> >  
> > -		for (j = 0; j < probe->probe.ntp; j++) {
> > +		j = 0;
> > +		do {
> >  			dof_parsed_t *tp = dof_read(pid, in);
> >  
> >  			errmsg = "no tracepoints in a probe, or parse state corrupt";
> > -			if (!tp || tp->type != DIT_TRACEPOINT)
> > +			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
> >  				goto err;
> >  
> >  			if (dof_stash_push_parsed(&accum, tp) < 0)
> >  				goto oom;
> > -		}
> > +
> > +			if (tp->type == DIT_TRACEPOINT)
> > +				j++;
> > +		} while (j < probe->probe.ntp);
> >  	}
> >  
> >  	if (!reparsing)
> > diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> > index 0129674adf0c..25bfacfdbfe2 100644
> > --- a/include/dtrace/pid.h
> > +++ b/include/dtrace/pid.h
> > @@ -35,6 +35,13 @@ typedef struct pid_probespec {
> >  	ino_t pps_inum;				/* object inode */
> >  	char *pps_fn;				/* object full filename */
> >  	uint64_t pps_off;			/* probe offset (in object) */
> > +	int pps_nargc;				/* number of native args */
> > +	int pps_xargc;				/* number of xlated and mapped args */
> > +	char *pps_nargv;			/* array of native args */
> > +	size_t pps_nargvlen;			/* (high estimate of) length of array */
> > +	char *pps_xargv;			/* array of xlated args */
> > +	size_t pps_xargvlen;			/* (high estimate of) length of array */
> > +	int8_t *pps_argmap;			/* mapped arg indexes */
> >  
> >  	/*
> >  	 * Fields below this point do not apply to underlying probes.
> > diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
> > index d6631a1afdcb..dd3a6cd2b887 100644
> > --- a/libcommon/dof_parser.c
> > +++ b/libcommon/dof_parser.c
> > @@ -807,10 +807,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
> >  		}
> >  
> >  		dt_dbg_dof("      Probe %d %s:%s:%s:%s with %d offsets, "
> > -			   "%d is-enabled offsets\n", j,
> > +			   "%d is-enabled offsets, %i args, %i nargs, argidx %i\n", j,
> >  			   strtab + prov->dofpv_name, "",
> >  			   strtab + prb->dofpr_func, strtab + prb->dofpr_name,
> > -			   prb->dofpr_noffs, prb->dofpr_nenoffs);
> > +			   prb->dofpr_noffs, prb->dofpr_nenoffs,
> > +			   prb->dofpr_xargc, prb->dofpr_nargc, prb->dofpr_argidx);
> >  	}
> >  
> >  	return 0;
> > @@ -879,12 +880,26 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
> >  	return 0;
> >  }
> >  
> > +static size_t
> > +strings_len(const char *strtab, size_t count)
> > +{
> > +	size_t len = 0;
> > +
> > +	for (; count > 0; count--) {
> > +		size_t this_len = strlen(strtab) + 1;
> > +
> > +		len += this_len;
> > +		strtab += this_len;
> > +	}
> > +	return len;
> > +}

What if the strtab blob does not contain enough strings?  There is no check
here to ensure that you do not start reading past the end of data?

> > +
> >  static void
> >  emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
> >  {
> >  	int		i;
> > -	dof_parsed_t	*probe_msg;
> > -	size_t		probe_msg_size;
> > +	dof_parsed_t	*msg;
> > +	size_t		msg_size;
> >  	char		*ptr;
> >  
> >  	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
> > @@ -893,35 +908,106 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
> >  	if (validate_probe(out, dhpb) != 0)
> >  		return;
> >  
> > -	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
> > -	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
> > -	    strlen(dhpb->dthpb_name) + 1;
> > +	/*
> > +	 * Compute the size of all the optional elements first, to fill out the
> > +	 * flags.
> > +	 */
> >  
> > -	probe_msg = malloc(probe_msg_size);
> > -	if (!probe_msg) {
> > -		dof_error(out, ENOMEM, "Out of memory allocating probe");
> > -		return;
> > -	}
> > +	msg_size = offsetof(dof_parsed_t, probe.name) +
> > +		   strlen(dhpb->dthpb_mod) + 1 +
> > +		   strlen(dhpb->dthpb_func) + 1 +
> > +		   strlen(dhpb->dthpb_name) + 1;
> >  
> > -	memset(probe_msg, 0, probe_msg_size);
> > +	msg = malloc(msg_size);
> > +	if (!msg)
> > +		goto oom;
> >  
> > -	probe_msg->size = probe_msg_size;
> > -	probe_msg->type = DIT_PROBE;
> > -	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
> > -	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
> > +	memset(msg, 0, msg_size);
> > +
> > +	msg->size = msg_size;
> > +	msg->type = DIT_PROBE;
> > +	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
> > +	msg->probe.nargc = dhpb->dthpb_nargc;
> > +	msg->probe.xargc = dhpb->dthpb_xargc;
> > +
> > +	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
> >  	ptr++;
> >  	ptr = stpcpy(ptr, dhpb->dthpb_func);
> >  	ptr++;
> >  	strcpy(ptr, dhpb->dthpb_name);
> > -	dof_parser_write_one(out, probe_msg, probe_msg_size);
> > +	dof_parser_write_one(out, msg, msg_size);
> >  
> > -	free(probe_msg);
> > +	free(msg);
> >  
> > -	/* XXX TODO translated args
> > -	   pp->ftp_nargs = dhpb->dthpb_xargc;
> > -	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
> > -	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
> > -	*/
> > +	/*
> > +	 * Emit info on all native and translated args in turn.
> > +	 *
> > +	 * FIXME: this code is a bit repetitious.
> > +	 *
> > +	 * First native args (if any).
> > +	 */
> > +
> > +	if (dhpb->dthpb_nargc > 0) {
> > +		size_t	nargs_size;
> > +
> > +		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);

No validation that there are nargc type strings.

> > +		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
> > +
> > +		msg = malloc(msg_size);
> > +		if (!msg)
> > +			goto oom;
> > +
> > +		memset(msg, 0, msg_size);
> > +
> > +		msg->size = msg_size;
> > +		msg->type = DIT_ARGS_NATIVE;
> > +		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
> > +		dof_parser_write_one(out, msg, msg_size);
> > +
> > +		free(msg);
> > +
> > +		/* Then translated args. */
> > +
> > +		if (dhpb->dthpb_xargc > 0) {
> > +			size_t	xargs_size, map_size;
> > +
> > +			xargs_size = strings_len(dhpb->dthpb_xtypes,
> > +						 dhpb->dthpb_xargc);

No validation that there are nargc type strings.

> > +			msg_size = offsetof(dof_parsed_t, xargs.args) +
> > +				   xargs_size;
> > +
> > +			msg = malloc(msg_size);
> > +			if (!msg)
> > +				goto oom;
> > +
> > +			memset(msg, 0, msg_size);
> > +
> > +			msg->size = msg_size;
> > +			msg->type = DIT_ARGS_XLAT;
> > +			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
> > +			dof_parser_write_one(out, msg, msg_size);
> > +
> > +			free(msg);
> > +
> > +			/* Then the remapping table. */
> 
> remapping -> mapping
> 
> > +
> > +			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
> > +			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
> > +				   map_size;
> > +
> > +			msg = malloc(msg_size);
> > +			if (!msg)
> > +				goto oom;
> > +
> > +			memset(msg, 0, msg_size);
> > +
> > +			msg->size = msg_size;
> > +			msg->type = DIT_ARGS_MAP;
> > +			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);

Is there any validation anywhere that there are map_size bytes to read from
dhpb->dthpb_args?  Is there any validation anywhere here (or in a later patch)
that the entries are valid (between 0 and nargc)?

> > +			dof_parser_write_one(out, msg, msg_size);
> > +			free(msg);
> > +		}
> > +	}
> >  
> >  	/*
> >  	 * Emit info on each tracepoint in turn.
> > @@ -938,18 +1024,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
> >  	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
> >  		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
> >  
> > -	/*
> > -	 * XXX later:
> > -	 * If the arguments are shuffled around we set the argument remapping
> > -	 * table. Later, when the probe fires, we only remap the arguments
> > -	 * if the table is non-NULL.
> > -	 *
> > -	for (i = 0; i < dhpb->dthpb_xargc; i++) {
> > -		if (dhpb->dthpb_args[i] != i) {
> > -			pp->ftp_argmap = dhpb->dthpb_args;
> > -			break;
> > -		}
> > -	} */
> > +	return;
> > + oom:
> > +	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
> > +		  msg_size);
> >  }
> >  
> >  static void
> > diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
> > index d3a6836f15fd..8f42d00551e3 100644
> > --- a/libcommon/dof_parser.h
> > +++ b/libcommon/dof_parser.h
> > @@ -15,10 +15,19 @@
> >  #include <dtrace/helpers.h>
> >  
> >  /*
> > - * Result of DOF probe parsing.  We receive a provider info structure, followed
> > - * by N probe info structures each of which is followed by possibly many
> > - * tracepoint info structures, all tagged.  Things not yet used for probe
> > - * creation (like args, translated types, etc) are not returned.
> > + * Result of DOF probe parsing.  The order of elements in the parsed stream
> > + * is:
> > + *
> > + * DIT_PROVIDER (at least 1, which contains...)
> > + *   DIT_PROBE (at least 1, each of which has...)
> > + *     DIT_ARGS_NATIVE (1, optional)
> > + *     DIT_ARGS_XLAT (1, optional)
> > + *     DIT_ARGS_MAP (1, optional)
> > + *     DIT_TRACEPOINT (any number >= 1)
> > + *
> > + * The dof_parsed.provider.flags word indicates the presence of the
> > + * various optional args records in the following stream (you can rely on
> > + * them if it simplifies things, but you don't have to).
> >   *
> >   * On error, a DIT_ERR structure is returned with an error message.
> >   */
> > @@ -27,7 +36,10 @@ typedef enum dof_parsed_info {
> >  	DIT_PROVIDER = 0,
> >  	DIT_PROBE = 1,
> >  	DIT_TRACEPOINT = 2,
> > -	DIT_ERR = 3
> > +	DIT_ERR = 3,
> > +	DIT_ARGS_NATIVE = 4,
> > +	DIT_ARGS_XLAT = 5,
> > +	DIT_ARGS_MAP = 6,
> >  } dof_parsed_info_t;
> >  
> >  /*
> > @@ -37,7 +49,7 @@ typedef enum dof_parsed_info {
> >   * start which is the version of the dof_parseds within it.  The data flowing
> >   * over the stream from the seccomped parser has no such prefix.
> >   */
> > -#define DOF_PARSED_VERSION 1
> > +#define DOF_PARSED_VERSION 2
> >  
> >  typedef struct dof_parsed {
> >  	/*
> > @@ -59,18 +71,58 @@ typedef struct dof_parsed {
> >  			 */
> >  			char name[1];
> >  		} provider;
> > +
> >  		struct dpi_probe_info {
> >  			/*
> >  			 * Number of tracepoints that follow.
> >  			 */
> >  			size_t ntp;
> >  
> > +			/*
> > +			 * Number of native arguments that follow (if > 0, a
> > +			 * DIT_ARGS_NATIVE will be received).
> > +			 */
> > +			size_t nargc;
> > +
> > +			/*
> > +			 * Number of xlated arguments that follow (if > 0, a
> > +			 * DIT_ARGS_XLAT and DIT_ARGS_MAP will be received).
> > +			 */
> > +			size_t xargc;
> > +
> >  			/*
> >  			 * Probe module, function, and name (\0-separated).
> >  			 */
> >  			char name[1];
> >  		} probe;
> >  
> > +		/* V2+ only.  */
> > +		struct dpi_probe_args_native_info {
> > +			/*
> > +			 * Array of native args.  nargc in length.
> > +			 */
> > +			char args[1];
> > +		} nargs;
> > +
> > +		/* V2+ only.  */
> > +		struct dpi_probe_args_xlat_info {
> > +			/*
> > +			 * Array of translated args.  xargc in length.
> > +			 */
> > +			char args[1];
> > +		} xargs;
> > +
> > +		/*
> > +		 * V2+ only.
> > +		 */
> > +		struct dpi_probe_args_map_info {
> > +			/*
> > +			 * Mapping from native arg index to xlated arg index.
> > +			 * xargc in length.
> 
> This comment is confusing...  I think it might be better served by really
> spelling out which is which.  I.e. each of the xargc elements specifies the
> native arg index that the translated arg gets its value from.
> 
> > +			 */
> > +			int8_t argmap[1];
> > +		} argmap;
> > +
> >  		struct dpi_tracepoint_info {
> >  			/*
> >  			 * Offset of this tracepoint.
> > diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> > index 41a87955ec1b..71ac1754d343 100644
> > --- a/libdtrace/dt_pid.c
> > +++ b/libdtrace/dt_pid.c
> > @@ -866,6 +866,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
> >  		uint64_t *dof_version;
> >  		char *prv, *mod, *fun, *prb;
> >  		dof_parsed_t *provider, *probe;
> > +		ssize_t nargvlen = 0, xargvlen = 0;
> > +		char *nargv = NULL, *xargv = NULL;
> > +		int8_t *argmap = NULL;
> >  
> >  		/*
> >  		 * Regular files only: in particular, skip . and ..,
> > @@ -917,6 +920,47 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
> >  		p += probe->size;
> >  		seen_size += probe->size;
> >  
> > +		/*
> > +		 * Assume the order given in dof_parser.h, for simplicity.
> > +		 */
> > +		if (probe->probe.nargc > 0) {
> > +			dof_parsed_t *args = (dof_parsed_t *) p;
> > +
> > +			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
> > +						 dof_buf_size, seen_size))
> > +				goto parse_err;
> > +
> > +			nargv = args->nargs.args;
> > +			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
> > +			assert(nargvlen >= 0);
> > +
> > +			p += args->size;
> > +			seen_size += args->size;
> > +		}
> > +		if (probe->probe.xargc > 0) {
> > +			dof_parsed_t *args = (dof_parsed_t *) p;
> > +
> > +			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
> > +						 dof_buf_size, seen_size))
> > +				goto parse_err;
> > +
> > +			xargv = args->xargs.args;
> > +			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
> > +			assert(xargvlen >= 0);
> > +
> > +			p += args->size;
> > +			seen_size += args->size;
> > +
> > +			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
> > +						 dof_buf_size, seen_size))
> > +				goto parse_err;
> > +
> > +			argmap = args->argmap.argmap;
> > +
> > +			p += args->size;
> > +			seen_size += args->size;
> > +		}
> > +
> >  		/*
> >  		 * Now the parsed DOF for this probe's tracepoints.
> >  		 */
> > @@ -967,6 +1011,21 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
> >  			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
> >  			psp.pps_nameoff = 0;
> >  
> > +			if (nargv) {
> > +				psp.pps_nargc = probe->probe.nargc;
> > +				psp.pps_nargvlen = nargvlen;
> > +				psp.pps_nargv = nargv;
> > +			}
> > +
> > +			if (xargv) {
> > +				psp.pps_xargc = probe->probe.xargc;
> > +				psp.pps_xargvlen = xargvlen;
> > +				psp.pps_xargv = xargv;
> > +			}
> > +
> > +			if (argmap)
> > +				psp.pps_argmap = argmap;
> > +
> >  			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
> >  				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
> >  			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> > -- 
> > 2.46.0.278.g36e3a12567
> > 
> > 
> > _______________________________________________
> > DTrace-devel mailing list
> > DTrace-devel@oss.oracle.com
> > https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
