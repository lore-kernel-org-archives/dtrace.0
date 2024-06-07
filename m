Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467D546558
	for <dtrace@lists.linux.dev>; Fri,  7 Jun 2024 22:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717798624; cv=fail; b=XnmyeL+nmSsJB1eOlAJjCdz7/bzdqwyBhm07enZO9jThuONXPMXVsvbdik+RptK3Wmyin3KWTUXtWGptKEZ2i1r6yyeWvwJV8s9NpbhIHTbf7Jmvb6CYwgtU6fR4dK5TKnav0unr50Eid0Ysz5whApYhy9ZDUCwMKKomprVtwSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717798624; c=relaxed/simple;
	bh=UK59RBqCn15CtccP00cmYrwzv+v/W1gCB5t1L/AwLOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ch6CJGPLmOOCqqol1Hv2oO8Zy1Ml9/WOZD28KViW3X/MBHAxsyqS7XZjjlauUcHQcZjajw1ZGkXoXO/8n945zWjn0bg6KEXBNeiAVMw9kSP2iSYiNSl+PqMI7UctMHI64/uTmErYBiO29A0MV3BUObp6lXkJCKlNkeUdVxhn4L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UIG1IEgZ; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UtP3OAmN reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UIG1IEgZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UtP3OAmN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 457LnUpW021555
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 22:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=PS3NIkBgpKNU7XvxoAUcZ8d4a9CPcQmGYQtvZFq6Yvw=;
 b=UIG1IEgZFsiGAr9ttd3UrGBEG6WYzkTJw2kXYoAQsiij7WjSzKoQ8fDvxOW5Adm6UbpZ
 YZWvZyEJZNc0QvCRaylGEUkCp1fMiTFwIktKkdyYbTqMeOdF2G+LWhzQ8OKuBL+e1+Ke
 BOXojdz2cyb3r/r9arbtONqmL0jIxklcu9Po2bv8dG0igxiS21dLmiksPG6nd7yPq/0/
 L6/qB5/RHPnCYfv+JKk0/7bZfoaV0s+W9Bk7oKzOOfO77lX8k0G7yGL7awlK1L9zg/JW
 vFqGl/l3N11xIzojHzQZZixkzxZ+9qDH0OqjE6i+7T+EXdaa3UBI0973l62OQBjwyYGm 9A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ymaf700qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 22:17:01 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 457KW3HD016286
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 22:17:00 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrsf1sk6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 22:17:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fC5Lb0i95PNA6JdooWPTppXjYhHlOTiS7MAk2lIarOVSkqhiwSWnTDYZWFPDN0I8JxvzNRi1Bz70UeAYKERtCAjCsLItQ3Nz7O3wg4295K3eoSV1xqJFipO9gNf0NVbbu2KABzysQBOnt3fzlGAcSR8zVsk6VfkAAwbyYa2KWZUoqHyZFaYYGusk3cjC869Wy/XrcZ3lq0Wdg5yyhOajrZ8De6mcZ0vTmFtcSDrmReaaIk/8LzVJh3BrkAknqK5pTo6g8WxrSu8eVjTZ+1lCFctNcJEDLWgJnk+y41eHtEarWdeOE6RGndluf0WUWbc8cuMcLZn3aPntkryipL9cbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UepezWR8QBXigG3geiy+EAuWX6F0MSjsiw0e10hbXGE=;
 b=Af+TYG4PdQX5dYuVc5VpVm+8tRjg5khUXGeuY/8lAyGP9swsPMhb2gV3rSXTvZPlLEEdx9ln2AwMar0HzXWDzlWQIMVQatHdhJmE9AOnVLdyAdxXTiZoQ0878LL1+oSzCJCcit0y4Ku2xmnjcq2h+KHnZRM/GSoA4FKCux8vK8jZiQs/dYv9l+l59hj1c8zexinKe7cs/LawTR3lDiahMct/+UzSrgjcdIJNbQZVZavJhUXfY8efUhVj1a2V1i9A/T5wIE0GtBIjdSY6Cocl5JUinst/Z4zYiEvrH49WQxqTrVYOneXgdvBfHTQeNTLhNISb6KzXNiCD9Fip3Nl5gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UepezWR8QBXigG3geiy+EAuWX6F0MSjsiw0e10hbXGE=;
 b=UtP3OAmN8WffnV6h3ZsSLkt04dNMW16MUyTxneeDeqGxBAxg2ksoJWJEB5fsMUitRMaYc3Du1IN+7FsUhyRqBPHWNCDepJ6A5ZWGeKu3tCxR1+mtCpVzgBWILvbJ+ZJikWzUd5fKrEeChxGEOwQ0NaRzTEUHaIRwH9S5diFmqhw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB6851.namprd10.prod.outlook.com (2603:10b6:930:9f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 22:16:57 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 22:16:57 +0000
Date: Fri, 7 Jun 2024 18:16:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 04/14] Track uprobe provider descriptions
Message-ID: <ZmOG1p6wPx77nc2q@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-5-eugene.loh@oracle.com>
 <Zl+CwFHv6bSJTNHw@oracle.com>
 <c1d70ac8-ee5f-4b1d-9e8c-75075b18db48@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1d70ac8-ee5f-4b1d-9e8c-75075b18db48@oracle.com>
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a41d39-c53a-4a82-c801-08dc873f8ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?32Th8mKlSXOpnTek3/0xDNcaI2gCPEU3P1vVv2z1pJlD0WDS5Ag/SdSTlL?=
 =?iso-8859-1?Q?MrKVuOkfWXBhdgdY6Fxax9gsotFLdK8lytr2dxrher4DsFM/OXmJ6c92tX?=
 =?iso-8859-1?Q?LKyQHSDgUmL2NTey8E6l61h3HyWonzMy+BpyVsWEYOAavjaoTcNV8ogFTj?=
 =?iso-8859-1?Q?AFMsXWj3OE1DS18zqBlkHk03mdN6rKJxn5VOkplz8tdOaKmv8Pul87e7RV?=
 =?iso-8859-1?Q?yPUQjaVCSZNmtD+hvpwnWp6sJzyIAC+fT+bls3FdlJA2QaJKHRhgML1cDz?=
 =?iso-8859-1?Q?mjQrpEpodi/AZclG2zAgMLkdx+5XUAtayJEXhknLkC3+JdBDkncJb0bZD1?=
 =?iso-8859-1?Q?qqkM8uDTreHdRhH+ulYS707hNQ388Z8+0IaSDywHHdYQr2OlTyjY/YHGmD?=
 =?iso-8859-1?Q?LfFyI/TewzFaS3SD+RwIYqqHZzAE+CySqwQem27f9FiK0zwWgMWB0WRKEN?=
 =?iso-8859-1?Q?UvZRuraPYQZ5Po+Aan83FnbE8hJor/rpE3R8R7g3Lj5OFT5mi5vAirJwOk?=
 =?iso-8859-1?Q?CkY1opgwNrfO5fxeAN21BTXKDoiT8+OlPNBDvKwyJES0ZU6XWjj2sxYtlL?=
 =?iso-8859-1?Q?Aq3qgRDBPa4uNyhuVpDAKgdXivMWy1t+LqeB5FEULTIT9YsufGLpJ9+Bku?=
 =?iso-8859-1?Q?6HwodYQZdxbGXsFU27C6vHgMO++vWgkA1roYOa/kKh+mI1u+GmnIdFv9jI?=
 =?iso-8859-1?Q?590BDdk+C6rbg8WcpBSVa/ZmyrIZlTytS5E2Id8kCC61ysQGJ3fwiWTv9e?=
 =?iso-8859-1?Q?Rv9NmQLeQdhl/yDmHV8J6xEMyoVZx77S2Vepz0djb+dxmbjZwnVaJMsKbJ?=
 =?iso-8859-1?Q?g4xbssy/DJw44jTSuOfmXPOYuMtlbB91qUpQS/a0GsWyRHlDMmxfXvC5Jr?=
 =?iso-8859-1?Q?2PseITD+KV2ptRVj81MEac6J3UngSc4VL8Wb0gSAWBAUVRzBosqWhy+tnG?=
 =?iso-8859-1?Q?Hb+X7wGrSXt5NeYHOGwseGLXxPwUuutUP7w5q8dda7Nxf6A9evqI5dUs2F?=
 =?iso-8859-1?Q?1wlduuVSb9PlI68xzqBydfLfvFAuIGdIUDLTjF39VNFbahc41iGNW66BIe?=
 =?iso-8859-1?Q?PPOT5GqHvzag3hr7AeAJK5hI/FZlJqxuf25Hkqk98RyHPLqBYHGPuZS5C+?=
 =?iso-8859-1?Q?NNFu7tYJVjJU9Id1WRgBusv54bauf6x/IIWZDiztPSSSeP7vMpZRNaQjYF?=
 =?iso-8859-1?Q?pWiUm1zZfvX3HsqHfC/Xm7i+A0LLrt4QyQ3BCDq06Wed8LHVKSUzzdArf/?=
 =?iso-8859-1?Q?Vt7l+9cx+WaMIro4b40txKdAKE52VFaZ6xuXFHQ3uAUV63tvgdtNgfGyS8?=
 =?iso-8859-1?Q?gHXWtLD2N4FvUzxmqHKZEG4j+OddLtHbcUCXjXkHuZn681CgUPsTuS7YQG?=
 =?iso-8859-1?Q?tXDBuxzSZG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?A/GoQOKtf8lsGHGCxjPC4gzGQwJ5yA5EavPkPg1WkNwfJkZDsxqz4R1Iq7?=
 =?iso-8859-1?Q?AhIPbGtlgS4Jxu3A4SN0cyy68ke2d0Q0ZKXEVIKbg2DLwEiY/PAlM07R9C?=
 =?iso-8859-1?Q?dECAN3nEspTaUoPof4K4jYs966oZAFDOBrSm4KrN3mD7Aiklv1ahO107hb?=
 =?iso-8859-1?Q?fNdxLCAh10hptxL1JwkNptUIDBLwyM41BUv0ZQ1Ju8v1kjBWqcIX5W6hbY?=
 =?iso-8859-1?Q?stjETShedOx/Ofi2hzb3k61tcRf+a3KH5+y/g/b28RLpi+NilxQVpT5Qnf?=
 =?iso-8859-1?Q?F1WvAiq4hVaqh2zuQut6GzVn+qm2iZbwJVVxLfEhfVdZzSOJYhOwtNwWWu?=
 =?iso-8859-1?Q?dR1jy8JAIUUtad2AOmU1qZd2xIcOBHlie5pT7UJRsQ5x8bAonDZvzdhl66?=
 =?iso-8859-1?Q?D2cWDPDeqn1q3zGM8vKJIGMNGCrJVhL/P+/8Bt3XDP2iMVm/Ksv9BQMzQg?=
 =?iso-8859-1?Q?2PSEOKqiB+j89HNKJOmV+iGoJcgMKVaLNTv8rYNlv06hslj/mk7V8Q3Wuf?=
 =?iso-8859-1?Q?4pGc2P8rTOtH+RLXbHiZh7Asi9oV6kCQu6mBWoAZLKM3Ww9RFYW2bG5VND?=
 =?iso-8859-1?Q?IgeXRqEQyzIQFUqWsWEgsW9AQgWPR0yn15z1LpvokAk+2+3YjtXSwQq4VM?=
 =?iso-8859-1?Q?bER4zf55TZcn9wrThO4E/vjAesRwpcHdO3iydcy2SNtlFzxMWmmIgb6S8r?=
 =?iso-8859-1?Q?/T2ZhTke7ik5+hVVlabq4Q3F76fuD6fFUP1h685njnVxuqXlhJH6D311Sb?=
 =?iso-8859-1?Q?H2Sz1F+1yfJbpYSXqLoKK/x5DnDL1+B3kFneRMVPCGZt7x1WI067HB1n9U?=
 =?iso-8859-1?Q?b5aV1DuO0E94Wmusn8kwtSX4RmyJFmIfVXy4TJ0RBxAqOmsvDBjS/tpM2K?=
 =?iso-8859-1?Q?CnpOMRcWXn4+kIE/9G0LUZ89yERg2SwGYyVnk5Qd0P4tZSS3eSDZG3nGj+?=
 =?iso-8859-1?Q?PB020X42Z90psDELHTyybPc+3pKNfvKd08PuNqMPhIHFFgA5O8pQFfOQUp?=
 =?iso-8859-1?Q?IRsXICBbdnwVyURng2QlW10pvjM+RbYsY0+LijmbMI7dfUuppOiXZJzMsP?=
 =?iso-8859-1?Q?V4DyJhk0o281g53UyU+Pogt6CZJLg3l21TPUwRcr2+qhVJk/TER+/TzY8e?=
 =?iso-8859-1?Q?wJMVihmsGiiiZlWtK/1WIDUig6fy6+7A84mO9TiVS96GB68cD9AjU73Z5k?=
 =?iso-8859-1?Q?xt94tHOyfBRXxVqsqAEVDmiQfD6AMbmKueote3Yfs842ygyanQsTJMaG2Y?=
 =?iso-8859-1?Q?5OF+DoCtpgeEnlqnB7daL6soIOKni5C8PIfoBoV0fosF1wOJul0j1geYlw?=
 =?iso-8859-1?Q?o/fuM9TWxLYtj/RpxPP83P48vBu0woNoo8gnG6+wWD7SElXrurlRW/FFNm?=
 =?iso-8859-1?Q?hlP7ogqkGxYf5Ij3AAAPx6D6HwL4kpYgd2lp6MIa43lqWVNvHn2LKzIWt8?=
 =?iso-8859-1?Q?juZYeWraL+VXDrBd5vj2ESKeF/fRu05EUD61hHUBCXNyOglC3lXvnSTSpT?=
 =?iso-8859-1?Q?29xvvGhPOlTgoBHp1J3CXqzgwsQsn5yqIGMlRY8KbQdt5zJhZcLEc0NTbD?=
 =?iso-8859-1?Q?EdzGY47Po6qsXH8qo0aDs25+rKxDhtuOEwGlIyY/bF4VnSpfBlCud4Hx0a?=
 =?iso-8859-1?Q?z/5N166Y7aJdMYJftQWJRiCsIHKhftqyHVwIzvsZjOSACOZ/zhu74hbg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	H5PC5lmkgGDX/LpZOffz9UzrLEvizWPBU6FEkDIkQ/D9FQgOwM3Sy7WuEviZP14ifAFf6AslCJhp0teztsnib3fHeWmK9YjpBTzpoG+CHhS3uEi0GYyj2OslOjTUSY09bLrfccjqu/xM73a0sAMmcatpEo7gfx/AxHT7mDskjTLilPsyuVMBEcwDng9BhRJxtuSfJAClffftMGUKqX+FUdhp/TvM2b/neTHdYIScIDtzW5PvfPfw7Np9zZeuoR0eqO0qQAs22sY7F2bMSYT0/htlga+eRq2odjtB77xffotT/IQJ311QnDpegra2v+iQWz1Wx0KaDeAZQ46Fj0W5XlADhbjNPOgJsA8CR4nZ7xNMXOi9xo15RMrW2EOAhdMQYWR+LEbLHztCoEV49nNc1KpdQd3h9EMJH08uyVTTcSL/ml4NsCDme8XMQIh+pUpXXR7eM90ZZFUADFaJa+TyHMciWcSDPpdcILdgpjSphkvO/+z9aU1VTTeXIQ12V3GM8QLQvRmDSMXlQWKs2zhDsmph7fKEiRBvMi62tPejUiyRaHF/BDZCgMzl7/G5aOADpSY8rj9F5d7VxNhyDi0QcVK47/LDnvI+Tg19yE9T27c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a41d39-c53a-4a82-c801-08dc873f8ba6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 22:16:57.6282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OozrPKesrtEsIyOCl89bZS0DMS7umaVHW8qQxp9UAJ0IjF5qKFdZrnCO9i3lhuiM6RSGJkVvblPbifFEY+UTM6/M91FelYYrcX4wVdCyqOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6851
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_14,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070165
X-Proofpoint-GUID: ndRJxs2U97ihPpWPJ8S8clnd5o5MjGOL
X-Proofpoint-ORIG-GUID: ndRJxs2U97ihPpWPJ8S8clnd5o5MjGOL

On Fri, Jun 07, 2024 at 05:40:51PM -0400, Eugene Loh wrote:
> On 6/4/24 17:10, Kris Van Hees wrote:
> 
> > On Tue, Jun 04, 2024 at 02:11:03PM -0400, eugene.loh--- via DTrace-devel wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > A uprobe will have to decide which of its clauses to run for a
> > > given pid.  For now, keep the provider description for each clause.
> > > There are many shortcomings to the way this is done in this patch,
> > > but it is quick and dirty and helps us bootstrap real support.
> > > Clean this up later, probably turning it into a growable array.
> > This is the wrong way to look at it, I think.  The underlying concept is that
> > DTrace supports specifying probes that do not match anything yet (-Z).  Those
> > are called retained enablings and they can exist for more than just uprobes.
> > So this needs to be more generic.
> 
> Okay.  I looked at legacy-DTrace retained enablings.  They seem to be a
> linked list -- (mainly) of arrays of dtrace_ecbdesc pointers. And
> dtrace_ecbdesc has dtrace_probedesc, dtrace_preddesc, and dtrace_actdesc. 
> In DTrace on eBPF, dtrace_ecbdesc is much simpler -- it's really just a
> dtrace_probedesc.  So it seems to me we could just make our retained
> enablings be an array of probe desc pointers.  That would be a small change
> to this (small) patch.
> 
> > We also shouldn't do this non-discriminately for all clauses all the time.
> > Obviously, when -Z is not used, there is no point in doing this because there
> > cannot be a match-after-start.
> 
> FWIW, that's not how legacy DTrace seems to work:  there *can* be
> match-after-start without -Z.  The -Z option only addresses whether there is
> an initial match.  If there is, then -Z is not needed, not even for
> subsequent matches to work.

Yes, I didnt think of that.  But -Z is still relevant in view of the stuff I
mention below...

> > Even when -Z is specified, you might be able
> > to determine whether the probe specification for a probe matches perfectly
> > or whether it needs to be retained for match-after-start.
> 
> Maybe.  But what if you have pid1234:a.out:main:go, but pid 1234 has not yet
> started up?  (Yes, that's an extremely weird example.)

No, when a pid* probe is not able to be resolved, dtrace flags an error:

$ sudo ./build/run-dtrace -n 'pid12:a.out:main:go,BEGIN { exit(0); }'
dtrace: invalid probe specifier pid12:a.out:main:go,BEGIN { exit(0); }: failed to grab process 12
# sudo ./build/run-dtrace -Zn 'pid12:a.out:main:go,BEGIN { exit(0); }'
dtrace: invalid probe specifier pid12:a.out:main:go,BEGIN { exit(0); }: failed to grab process 12

> Mostly (going back to your "shouldn't non-discriminately" comment), trying
> to decide whether to keep a probe desc seems unnecessary. Just keep them
> all.  They will likely be dwarfed by dtp->dt_probes[] anyhow.

The issue is not space...  but any retained enabling would have to be
re-evaluated everytime we need to see if there are new probes to be enabled.
And this will be happening while we are already tracing, so avoiding needless
matching is probably worth it.

> > So, let's put some thought into designing this in the more generic case, so
> > that we can avoid going down a rabbit hole that gets tough to recover from.
> 
> What do you think of:
> 
>     struct dtrace_hdl {
>         [...]
>         dt_list_t dt_enablings; /* list of (to be) enabled probes */
> +       dtrace_probedesc_t **dt_retained;
> +       int dt_nretained;
> +       int dt_maxretained;

I don't think you need both varoables.  Just keeping dt_retained_sz (which is
your dt_maxretained, but made consistent with dt_probes_sz) is enough since
you can know what the last entry is when looping over it by checking if the
element is NULL.  There should never be gaps, so the first NULL indicates that
you reached the end.

>         struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id
> */
>         [...]
>     }
> 
> 
> > (And whatever we store the retained enablings in probably should be added to
> >   dtrace_hdl_t after dt_enablings.)
> 
> No problem.
> 
> > > diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> > > @@ -215,6 +215,7 @@ dt_compile_one_clause(dtrace_hdl_t *dtp, dt_node_t *cnp, dt_node_t *pnp)
> > >   	 */
> > >   	dt_cg(yypcb, cnp);
> > >   	sdp->dtsd_clause = dt_clause_create(dtp, dt_as(yypcb));
> > > +	dtp->dt_uprovdescs[dtp->dt_clause_nextid - 1] = strdup(pnp->dn_desc->prv);
> > >   	assert(yypcb->pcb_stmt == sdp);
> > >   	if (dtrace_stmt_add(yypcb->pcb_hdl, yypcb->pcb_prog, sdp) != 0)
> > > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > > @@ -310,6 +310,7 @@ struct dtrace_hdl {
> > >   	dt_pcb_t *dt_pcb;	/* pointer to current parsing control block */
> > >   	ulong_t dt_gen;		/* compiler generation number */
> > >   	uint_t dt_clause_nextid; /* next ID to use for programs */
> > > +	char *dt_uprovdescs[256]; /* uprobe provider descriptor per clause... FIXME turn this into a growable array */
> > >   	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
> > >   	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
> > >   	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
