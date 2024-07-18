Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5823D69D31
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721333074; cv=fail; b=h3dEzCcLFoVkSy0BQmkAXDKI77bs2yrOh/ZNijCX3+buhp7ig7XVCPrp2MOtaDUp7GNkkvqV/yGhadoO6236oqOuhybWFWFxTcaXRQ2JG1n8gzUr2xrwaJ14TuNTlG9KR1k8MeNsNXauD0YCxxe52VQ6eYs5ZzHXVxqoFmj4+Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721333074; c=relaxed/simple;
	bh=VU5Q1L3pAE0wyYYRqqk0bRV/e8Vqk+v3fkr+Syfz+ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iDOMRSbUVv3TMKrII9JPtQJJwsgTitAV5w1WijPlco1TGrDOHFBnoGMmB/IQjOg45ON/iJpccbazYT8O7ozc/7+B4nNUPLldrR/n/FnKAubZDVG3vN5c1dTtLkB7+DWDqjHq3Ul6DAP4cvJQ9q79CDL6kQUM8a31pG2yNreGqqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eKMX8/dk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eCwo7KWl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eKMX8/dk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eCwo7KWl"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IJjEaL014497
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Sn7qRfEjdVdIXVl
	LHZtJAPjWcyhkgK8WhOK2BAGLqS8=; b=eKMX8/dk0Y0xG+kFjDeWtb99b8cSyhI
	EmtGtGjV5hSegN2vjdFtxW8+L5zP3uz6ztJMNA/BQ2AgVWYsHwFUyjGH36dylfAl
	nxbYM1Wcsf0UA1U07f/V91BtdcV3K+XULK4Nj58Hz7FNJaKb4YeAp76fT/HN20+7
	vGU1GjyGGVOwerNaBbNQtll6Mc1gRUnn34q6jzrhHV9YUPjwLsb0AstYu7CxqaeX
	KSeqYRZLJ7oZJXyclhpxQtrTlzDdEgeQf+pUc5G5noxetyIBKeA6Ai+0762dM6sm
	x5u8nDVPe7a41iKF5FVohX0FA85Q1ExKyiVB4+ZkRyDWk7z+BT2Iyag==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f9frr1w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:04:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IIYW6J003809
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:04:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0w6a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:04:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iwee07PeUriUsv5nFzWBwn1BI2tquYoMvh7Zz6+A+VOx63Pystbsj8t10uitbhGE113x4psSe9cDV8YqQ2haslKuWwWiMyZb9p2AlkcryEPJuOVJ4JuG7EqI6V2LPs6MKVWZpBS8w2wzExKO37E4l/TBPOc/O3EcfTNCqckAyIHRW3psuhsb/5w8fCG9iNPBNQU3CJTn/Tp1U8u0/ThnJGPRbMvr9zYxLpJrXZaGQadj08bsoykLoAY9axRfNRjyXRwwzEE/6MdzV+3UPo4Ho7Y+peTFxhB3tb10R+ZW/5H+/S9varzyh7Ue7l7FQvHZ2+SWG/ANwsoifeWDeGQJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sn7qRfEjdVdIXVlLHZtJAPjWcyhkgK8WhOK2BAGLqS8=;
 b=obF/BNlMsWepIrdR1RiLcDa+R+Lx1g+MjMCDa1CENmHXO1Ck8xJPr52s25DKf1sJoj+p/dTf/EzWx3LI+YlardTfLtQD+KmNKpBv9CiqReudlxoDPYeNLKXLuMYaDkL0BQ5TdqG6HmvT0IlqkH87tcZZOEaDO2zwby9coZxZLm6NVL7hOyuXF5SxwI9XPB0wkuBOxmY7QE0xQRlJYdK53Tv4WrrqRBXAiboeJ2duqBwbPZTcJDeQodFTwDr8aZLtSYyEZIqxjnB2shPKNxgIUcJ6Y5vTMb9v5gYwnoTdcaLDnJy6kaurtDg6isyRu5AjtdgaWBkAllcL4cfbt7LBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sn7qRfEjdVdIXVlLHZtJAPjWcyhkgK8WhOK2BAGLqS8=;
 b=eCwo7KWlThNfTl3qvPk3e8z6jxyRb7HxYBv0g95X+BiDV1oe3Bc7C6yKGtymbiBWOliMdSyc31asELfdJ2c/4ryVjpVzPh1DarXmJClDUe5AiCMX20kDI1W79MIqpSvgVXtNHo7j+93Nhf5ogkYXsPXHp0v+C9oINP+DYwGzSMk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CYXPR10MB7973.namprd10.prod.outlook.com (2603:10b6:930:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 20:03:52 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 20:03:51 +0000
Date: Thu, 18 Jul 2024 16:03:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 14/38] Remove orphaned dtrace_hdl_t component dt_maxformat
Message-ID: <Zpl1JB80fmcbDuBQ@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-15-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-15-eugene.loh@oracle.com>
X-ClientProxiedBy: BN0PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:408:e4::28) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CYXPR10MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d9c8ba-1d9c-4f12-37ae-08dca764beb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/QrKfqZg2fLFEtiS4jyAKCIRHnLwASEP1jRU25hl7e+WJl7FzDdUz0Gpzux4?=
 =?us-ascii?Q?oHd7W27Utkxr2/vrs/f7vvqXKnANOv3Sn/BfxYyB0lPN5es9YHCH4qALc5HQ?=
 =?us-ascii?Q?icn6WNuYqhHhxYccdm2btWDJzlHM+RYeKUutVKvbBUCGsxwDvsuTrbZ+9lcu?=
 =?us-ascii?Q?pF/gQ7zaWkacnnth9HsNIfpK4kruLxUHThW3W9KwWLfA0ayRN34dWyLvE7Gr?=
 =?us-ascii?Q?PiFtj7h4jRJMRcQML6kognnUap7qp9v1165mgEbkHRUfcfuogPJ7e3qlTL/p?=
 =?us-ascii?Q?ogVwBYilORkND+0bLtuQ5au1l6WrPjGS0X/qa/6Rum3e3LA8/yzCyLvY3VAD?=
 =?us-ascii?Q?6JQLutglXIhHMr2RW5gXuHvCwLIuvLERsZJRdnEBkd+Fl+y3ssZP6i/ZHKoS?=
 =?us-ascii?Q?J+hGUuwVVxLnhGzkmtMcLINXcxKtt3MJJ/IPz6h1JO0KQ3dmlfe1Rkwf+96+?=
 =?us-ascii?Q?QGyfdzTU+ednP+/ep0nYxn6DAHDWQ1bvN1xmYSu0plMNmUKSfCzBnsQMJ9hY?=
 =?us-ascii?Q?3+08fXOqarwQioibjYKN3Rd1I7VX8i5O1r0Q7tnKwkLVN2XPG0bKcUCB/UkI?=
 =?us-ascii?Q?HlWWNNwrMrCJZA1kO2VS/n4WDLnRxsV3dV8LnFO6HWNoHIiGWBKl01ObJE32?=
 =?us-ascii?Q?uk3JzDVTBntDqW1JA4BEq7F7S5yRrPXsNcE74rqZdGWopZyxQyoDo477JPhF?=
 =?us-ascii?Q?53NL7z/rD1PfkNfBiSb2fyuf78YuTH3CF/r7Dd02oMfCBbAIeQWPeZ89cxH6?=
 =?us-ascii?Q?Fw7qhwGybO0SpE3hsl0Sdwp22BP9ycOlTBr1hcYKXyNXlFwFZRA5oA0OYw4R?=
 =?us-ascii?Q?HDxiexX5zpR1HVjlb45/fIzZcU6A+hPaOtO9NN5dbQR3xu6F9bSMcSpldAfG?=
 =?us-ascii?Q?VDj17DL4XekgVlNkmWH8SQhtT+sOcdqQIxgT4LFtNMVpOlUw120b3IxOlo16?=
 =?us-ascii?Q?nAsYRw3K5Dlt6AZ+wtRNan6QhS4qqEbUwRC5oH/pac47o8jJ8r5IIulzb0bN?=
 =?us-ascii?Q?18kUtqrX/wB+H3gNPx8jLTQYpiH/nouU9YUqX/3wxQNPLCnJjpUyy3nLuh57?=
 =?us-ascii?Q?zmtOsqUftnJhfnxGp/QDshc+6zdeeI7Eqv6YNym4Karc2zxn1ujcpt7YGLAe?=
 =?us-ascii?Q?tTM3z/baP4k8JuzDs//6phe6vz01sa4K0PmsCL6B1NTA4h4GJWWjN0dsEL3K?=
 =?us-ascii?Q?uZicGZcK5BcQpLeTaM42PPKriZRpZ50IVuivMxqrDwJAJxbhKaStP5QMIuri?=
 =?us-ascii?Q?+iuZcIvHRvP8jm+ZoR5ctIRlGj9QiW/PFngzVBVS6A2I9frHf1hCCYLxaloy?=
 =?us-ascii?Q?Qr6Jf7yLX5oxs3wEkLOrPyeNXSbpwxTUq1JouYzE9mr51g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WYxxz7C1kWqS8y6e8qHcdxp/hPcFw7qEU5wg5L0NdGXA5xA7z0/PF75k7DLK?=
 =?us-ascii?Q?mlEhGb9vxothaB6TmyXGdKrritrpH/mp9SFfBSo6mp4CRgy7iYV+pM+QmSX0?=
 =?us-ascii?Q?yXG1qUBxSdaslCCa3c2QCChz9nEJyfVptgLNz9IlbDrtWiKg6e8pMAwtOBZd?=
 =?us-ascii?Q?S7x1Q4A/9/ItmMn1DEtVjzYm3z6lwrQUi5Bz/6WiBT0a5Q+oLJOnpO/E5aZJ?=
 =?us-ascii?Q?ZgKz5HPTB1lagRYBdrmdmM1sWhvfKAkVeh05eocj+4Yq+Qjddux4btaLzAu3?=
 =?us-ascii?Q?73txfpRMUI5JMdZHIa5J16SevVO0E2PJX2+D1+I+BbmO59F5854i2vFk1N9O?=
 =?us-ascii?Q?kw3Gfff/ehD7BfPJslb/PrA+MdGEIZgaA+o6u07P7JpC+DWUZcfLsus1tLLN?=
 =?us-ascii?Q?d3edHhAbmHjhO5wxCVHuht9ZowKYyUKH5uiqj5qpTY9Yx2o8S8+J/3me2SgQ?=
 =?us-ascii?Q?jwUdB8xIatmDxa+Tkk3zkIqfILiiZ8zzs8Q8m/qYWmhwc0vVXIoqgLV5s+VU?=
 =?us-ascii?Q?V/zkBStVP1u4jhYMna+/aW9RLYYyBB0JuvPpovCxtrUZBqP5515Ij95z7Vco?=
 =?us-ascii?Q?j79+wVdV+GIGFQIpWvutwA1ddseIlMwDvizeh/yqmtGQRoMyP56T54Mf+EER?=
 =?us-ascii?Q?VJNU33Ly+zAMN74WoKOvjD3Vwk3qvqSVAgD9lKxPpSimLhfepoSC1Fk0XbYZ?=
 =?us-ascii?Q?JdSrOGoFPLS8lcpE+fqO4HNXOiyVYG2Z2Unvj9JzAQJ4fHKpYPRG2ZHS0aau?=
 =?us-ascii?Q?kls0Vb97wJufTA4w6XlaNfh4aInWI2BYltryAX/M8K7LiijhvX+ZIKSnVVlw?=
 =?us-ascii?Q?MURvKvpTO/IgY6nodj5ogbMXPlLOCJ3YvY7fSveWOZUt4Out+HpRZODsxSLK?=
 =?us-ascii?Q?DGkT3lHtnvaJuKjIhHg0uYMXtprQzdIrkM8W0FUb6Oap5HAWlO4cnbokhJ8X?=
 =?us-ascii?Q?4/b8D4GR1kY+KwOME1zPPpysQ9r0/bEuuWUYMV6jPWZjJJKafwyCmwB3g+Js?=
 =?us-ascii?Q?2MdtZD7OGt2EBrfBmLXJ//2l7TFTySrB5wcNGsxfePR3d1M88+ekQAud13s3?=
 =?us-ascii?Q?Xewn4LxlaYmjQsDOvhHj4PnoD+WbAYY4e1mdv++ft03l/gaQxr5SZnpFm4P2?=
 =?us-ascii?Q?z1R4WmriJRKAj2c6Lm6kbnGOtKcQLEHcHQZzIN4xlSoJYMkBT+CG9oDXf9lo?=
 =?us-ascii?Q?Fw81Ug9O+MMdXlG+rWY95OwXHOCAYpZqrMR8xPZCoZwL1Jgxt+09R1B3bKbz?=
 =?us-ascii?Q?kcAUnwaSr7yNyq/JdnBfa9O8pOaspzEJJePk8cZ02cFysVPTcQcEhnK+UeFd?=
 =?us-ascii?Q?47LF1fuM+xM6uEWzJC9Tp46wO1f9VnDAktQ+7QO2VIbK+xK6LcbEzti8+v9b?=
 =?us-ascii?Q?9dimvYrLQh2aC85y5T7dxtT/yC2YDO7hVMs+B1xDT65S+X1JBqdX1o5lQdU8?=
 =?us-ascii?Q?qbT/BONmpfVtv11qM+AS1O7SV0WNh8tV2jc1mOolSmen512TXtW7VWXPA/ex?=
 =?us-ascii?Q?cl8bMKKLqfB3CrXdhlqWPERLFiUg/vgveQIGRiY93rmvCFAztUeq+VPL4kMM?=
 =?us-ascii?Q?mIuHrP30n1noTP1sus//qq3SFx8H2remQYsEwoj7DuPYlHS+Rhwv/9O6wwFa?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	LXt790A1l16LiXCh8cNtAok+31CEwlboTR1r3I1B/pwYp4ng/VS6HWjbkqtqplFuKaTdAA/91syy0I3srqm1U3OyU4N7sz6lc5NboeJPrTM4Zuw7+aPsgO4spE2EzCYjDJ6+5/WEUK9Ft3aJrH6qLzNx1AN1piQWaG5A/ucxVnZUIWCUyG3qewFwSQsEa5EYHkpB4GOOT+OLmG0bwkUjvvLrEuc+KFwaFxT2rt/w6k/kpsc2uppsW4iS8QOC1OWyH7U3I8DmLom3BlzO7/JqClij9GiCGGtG880nhhmze0CX0z9+oaDvto76jkg3UYUh7u4U1JsWsiCdaBtZ7gCmA14yO//6YBI5gKgt0/jbTJlWk0t2DufVPmr1MgEAYEsNY/PhBoMufcZYp0tZwd8LlquE+qwqJBal7KVgqTyZ/bB6nz095O5W4Eby784QouynmT1yt0JKyJ0gHL6h7m0sTJxbt8R28e9glmkHLYUnVwIhPa5naKUaKO/cUNZ6ScTaINnzytmgXc+/OM3hMcExGwfRH7eNtnG/JfbQv+Ag6YwU9czZstp80QVuZ622BBDxIK9yxvF3wlc6Y+3nVKKaBCipybJ2JG2C7tEO8HWCCqQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d9c8ba-1d9c-4f12-37ae-08dca764beb4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 20:03:51.8740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtYYIFwR0H3GSR6ciMiAm7Pm7yc40a9V2xaHnOGP4YhFW9+TjLmLkYtzVSCIkwQCDYCjKqzxweyIgFTElwqed/39WmNqAanZA2zuhos1pkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7973
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180134
X-Proofpoint-GUID: GvzSp55qp15lDltrVczXGDcZUQ9grok9
X-Proofpoint-ORIG-GUID: GvzSp55qp15lDltrVczXGDcZUQ9grok9

On Thu, Jun 27, 2024 at 01:34:31AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_impl.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index b5408c1c..3d3f58d5 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -368,7 +368,6 @@ struct dtrace_hdl {
>  	dtrace_probedesc_t **dt_pdesc; /* probe descriptions for enabled prbs */
>  	size_t dt_maxagg;	/* max aggregation ID */
>  	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
> -	int dt_maxformat;	/* max format ID */
>  	dt_aggregate_t dt_aggregate; /* aggregate */
>  	struct dt_pebset *dt_pebset; /* perf event buffers set */
>  	struct dt_pfdict *dt_pfdict; /* dictionary of printf conversions */
> -- 
> 2.18.4
> 
