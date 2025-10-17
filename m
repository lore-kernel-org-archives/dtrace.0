Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98B52773E4
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 17:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760723440; cv=fail; b=PDoHnZu5AIJZW5i1KI3LdI/nBtszahSTTBK4G6pqViaEY35w5ewxHs9mPZdldi+2Geccpwnofpt/bfWqM4/k9cFY3nBCG9N8UhWwTAx9CqPksEYyRc2CVNExpSh9pKDFK5ihf2V072VeLEAvR3XtjcKuiecuhMdvv1JgGgqkJ7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760723440; c=relaxed/simple;
	bh=AyEfmid3ZpcsZV7CVcj1THT126+QQfp8D5yakPxstWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UHjytXZcUVtu2IHqv1fbnvFmmpTcGYBBdTNSZKhFbz1KX9rE0nwsiRj714PWF0CEhAEKSjyMsYQ3mDPphBLl/mEFcow/UjHuZJ+PUhj/z+zoAznwJnmlzTzsN/0tCrBkFMWkK//sUOazfEzw3bzsnDOIwL8zjvMX50o9hIpT7bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KZKcunSS; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PbFHwD9i reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KZKcunSS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PbFHwD9i"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HCdZRL021083
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 17:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=GMr69v2aJCq4WY30MPu8eef/tB6oa9WbnrmUMFC6yp8=; b=
	KZKcunSSUGXuOlU8bwHe6ADtN7c6c3gXFFiEgmrgagyAUItOYykwfVj+5wGz/wC/
	0Xc5pQLvs1ypQYaJvZ7aKg6b0rUWtfXFLS/4E9NbTVQQAVV8NwxlMqnAfXfXLftS
	5S1SG+PXXZ8rBforQ2nShieyBq/BjET9CDGFLh+zsaMq75hxyCGwGojY4pqKb8am
	SDHEZJd71s619YfACZ5EdzAgFj4bAdUbnXzHwGBJL46a8oHIXF/LNLk1kuUd2fET
	DYQQ9UEmpiiOfewNmzchVcht042T7ZSZSgbJSBbd7FD+BiXU4hueYDDEC0TvTpcv
	E0gJegTlRUyCuUkhTqj4KA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ra1qjhyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 17:50:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59HGL6Pr017915
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 17:50:36 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpd5fsm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 17:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IefwD++jQF7uDLj1EYpH47ttbWZty67/cmxISVMJLBp+SsAQD/ZqmfpVJ3HMTyYlHBcicIJ8Vm/AdHpjPOMFejd1sa6Z3Sxthgy+yQLHvUbnO/WMSmHPwa5lHBfQTopnmYLvnBKGjqeU7CEaxSKGwfm3FcTP+2MimsE7X/tKtUkTodR95XEVnZNIGU5JVZ1PoKVNAruFmTFjAkIjpgG7TZOyEaUX5HMFAESyZviQgKFPO91tcAKVt+enmRRkAuAn2hfP/ve3BVQ6Nis8vUgST6N44BLgwmLEFLqqZ4OQkJvJ8nccv+YrTyq83Eb3t+1YF4+1BvHtO5t6eQH8czQ81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2QAn7Yl3lKTXad5ItnZBlMbhv4mkbs32/HU/z2K3AM=;
 b=bNW79WUs1M3/b2/ybsJvP0icScIUzmzsd/s19SdCRDZn1hcz6k0Ad0HxMhuPMLK0Dc0O1zZzM3egGIDLAfD85EfeuN5vHL9SeaICx/kQRa41CMHwYY8z8SzskA+KFQKbbLvywqlfjd8X4FIyQITNXDPe6YDCMIpMr26IeTJAC8yLOI3JL5MqwcA4WbkO1a4wR7xzFe2VSS6Np1Ep6SFPIjmUHWQ4lfrd7D7+EbSlkqiIqqA1NZMTI3UZvYOyYFRKyBHAcOJKpwfmNpUbzEs/0xnQvO1hrQYYMT9YJ6//v/+9+z7+9uEDn5go2xS/IJowfnsL1dwPxlYgGuvFBBWoFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2QAn7Yl3lKTXad5ItnZBlMbhv4mkbs32/HU/z2K3AM=;
 b=PbFHwD9iWC9p0bjwXphnqXT2yx4vkn+iwsMevbwc2EpzoGc7taJ8jJYdPqf8C6tIwScnFX5uI+4OX89+hTR6U2aLW/S3M63l0FOoj1fmpPpncMllgLofzYRBf0MXBAx5K7z1FYN4dsz+jMkX4OnJ62GofHuj3rtqFk3wIycOPdk=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by IA1PR10MB7540.namprd10.prod.outlook.com (2603:10b6:208:445::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Fri, 17 Oct
 2025 17:50:32 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Fri, 17 Oct 2025
 17:50:32 +0000
Date: Fri, 17 Oct 2025 13:50:29 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Clean up stack_fbt test
Message-ID: <aPKB5Qd4L6aBoSe9@oracle.com>
References: <20251016205641.15446-1-eugene.loh@oracle.com>
 <aPHf07N4ISwnhK7K@oracle.com>
 <87c44286-dd57-9368-da23-b2121febdc5c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87c44286-dd57-9368-da23-b2121febdc5c@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|IA1PR10MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 12642cda-23d3-46e9-cfbf-08de0da5aae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?n1nVI3ct2Dt3FrtTD4OdVFtIz7+/bSvt55x2cnOWiiyqVyzjG4DmGKo9KU?=
 =?iso-8859-1?Q?cArHrn2IbvkAIJuQ6skiDhxBFbHvKAPADAfqSZEeiTYrGCpKAuoSHOZYK3?=
 =?iso-8859-1?Q?IoglUK8IH4eRTPZdDuNkkirWmekiArcPi+wvcEHoNjk6PnIeYITB3uIokl?=
 =?iso-8859-1?Q?XAGnDTvF3fWMvxPsTo9TQXIxtkigcbdhkSpQEBmLGR6c7pN1xM8db1/sW/?=
 =?iso-8859-1?Q?8KkuDFbDzJJM7PbkxL5vKbkepRZu0zlPtLJYv/eZeLl0KEWWHz4e4b7tz4?=
 =?iso-8859-1?Q?aO7wbhaJmALzxA58GIQsHe+40AbJ6KN7pMYnXTWQK2iR7z7TOS3fRZ1SRH?=
 =?iso-8859-1?Q?eRKUuF4issz4qunmIPA5QjvuCPiSKyh6i2y7oeXLYuFizOfB9Tg8uhirxm?=
 =?iso-8859-1?Q?DPSUrICVPOj9pcmcjwtvf9u2JekrCXViXA7MVtnlHSdBo4Zgiui+5Xmui3?=
 =?iso-8859-1?Q?tryuOmLH6OEtOQ8x7jtLVRQ/q+iZ6M6ceYt3VeZkiJzb63Xr19AbQb0oEg?=
 =?iso-8859-1?Q?abCzcg8FYK6r5LDcNz8UNpbEMWq5bOjAZnqutkDhqEv6tDjT0X4aVhEh+M?=
 =?iso-8859-1?Q?k5H/cjYh038kV+n3tZ54NIvOvhbdJQDlTimYb6sJUIOc6hn0qNttJ3rcub?=
 =?iso-8859-1?Q?ZLMjipBnFxIcBV4U98C2k9PNypk/PPCpDSxIS9Jf7OFlTdp6ERNEhjnyKd?=
 =?iso-8859-1?Q?FP7tzwQQy9kcyNBcToX8yZp+ZBmsq/Tlqv5Hb6Aig02i7lWE6gqHBfV62y?=
 =?iso-8859-1?Q?oA6dPGy8ehSj6wfNSLIRik7HNOInI61jVl6KU0Q9zMAuFSo8qGHV/16aQj?=
 =?iso-8859-1?Q?VIGCKwBD8Z4wDJ3ENPKg3nSOTb9ADfc7AZtiB2URy0+klwFC9GomC7i3tK?=
 =?iso-8859-1?Q?MxHOj3is9lJuRM3WnxUvWTiAAF6vEOMXc99mjkH0Xg9QEr3OAcAhwiLj25?=
 =?iso-8859-1?Q?B6BjfXI0tVc9Mi/4JWKQ/LPP4qzX36sub4GehDIZixDfFLyIiegyvJfZwX?=
 =?iso-8859-1?Q?jr1oI2Ckc4x9kE7vwearpgnZJMakdv+2kKfDtwcxtPvqmpSHVwWLrx50Xe?=
 =?iso-8859-1?Q?Ip3Om4G1V4pnW0tbDu7syTK99J964+MwxIvz5OLAJu57EdY0oVSWia1Dr1?=
 =?iso-8859-1?Q?8kr75mWltTxreTh0096BGR0PuFDfDGIxKmzkpO9irw8YzTX1qqI0+Zjyhc?=
 =?iso-8859-1?Q?FtuAunyGyb/dz0acdwiW43mPW/7b+xqZZEfSm6CvEzeUNTEpsPwPMiUQ/h?=
 =?iso-8859-1?Q?Fnek75/jetnJlttJht5rmze+IXkYdXQAhIvG9Saa0FSroaQ1o6hTWGU7eN?=
 =?iso-8859-1?Q?NJGtmeE8JjYPUmNcxyxeoaulMSqUMUw2dJZixsS8jYLb4nhQIb9tODPyqz?=
 =?iso-8859-1?Q?Yed5RuMEQ+x7G7GqjAQEuFZt0JW5nAcwfVQKchoPjt1IKMz9EpXrsFdDYS?=
 =?iso-8859-1?Q?B0Bsr4q/W2bAunoupw3212p+z3hRm3M7iQXs1SIKQMws7nrkZPL6nE6aei?=
 =?iso-8859-1?Q?SY6W9IY3C081X9kCDOt/PrjOETqNyBSc1hXRoepGYL9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?NFdwVwR70AhpDzJ5PLmOEpUoXNETSHA8lQDRxJxOCcOiP9JmCmYPuRNfKA?=
 =?iso-8859-1?Q?RKukeKgRr3SkeN/goi9weA8RQyoPduhgvT3ZFlWxnkrdwD9i9k3/VQzpfS?=
 =?iso-8859-1?Q?APvRrhCveDl0MdhJa6k4aXKysKzPttnEUjYOjU1wJZwvBwCaUojMD/kc/x?=
 =?iso-8859-1?Q?hhHwVlzcPaeh8LVRoms7uWlogKcIJlY7okuGiBmPdpA/jMeyVVPGBSjD8n?=
 =?iso-8859-1?Q?INp/DfN8qclgMJB3LJzVm64pVuVOERkmDMep1q+9KhZ5n36uoDOm21ULKO?=
 =?iso-8859-1?Q?PZqEkuO/CCUUiGO4FC4dkcw3zrehH7wq4jhYMkUeMnnGEaawtMss4HmUQq?=
 =?iso-8859-1?Q?+MjJHtONFB0COcZ0qkC42/OYxe4xrOoR6vatRJlnb9DzzO+iMkiFPDpdx6?=
 =?iso-8859-1?Q?y4XmLE1q2dWxxDJodpWDWTL7OdWDv2tP/s4Tfgg1ctz4nY4Hy78wyH2F4t?=
 =?iso-8859-1?Q?178TElwzqOX58Q3BSHQ8ZT57Y6fCQySmR/r0/HWw1WzYUQfIg5+aSADGU5?=
 =?iso-8859-1?Q?w26LxpnE6p1rY6kCUK2j++E6TdimxPr+YOqG/f3G9xJchTiTtQYHu+P/9z?=
 =?iso-8859-1?Q?Y8O8o/XwslPHFIpYrTy8alQtCIr28psJF8a893w8A41IozBDBTXkrj3MfR?=
 =?iso-8859-1?Q?YVDJW+3cci1DrRvgDu3TT+HPI7SGicAzaTn9b1zWPDElA8OYZTuToxVKwN?=
 =?iso-8859-1?Q?jhJzvlqKeKvrIq6ysLHD4hUAX42GUVtOCExCrWe5NNZ8StbNUQqMIloHSh?=
 =?iso-8859-1?Q?1/1TI4R2Cx919k8HxyvtpO2lvwuzBIIP4lrqvN16ivYBdN4jgSACnC62Oj?=
 =?iso-8859-1?Q?ZNxZTEhmG3oFsqD9GKilCgYnZLleNN8eH2ZUElfRHS2cx1vCQ+n4ncKCnM?=
 =?iso-8859-1?Q?j0lalgZMQA84ki+NE4jsEDv5FcGRdv1mwen07tMz0vrsGg80E77Pn/AIJJ?=
 =?iso-8859-1?Q?9oIRCs6t0BYEjozt6z+Y1FFFWc8A8oTw1CIIT8VymdpP3EatcBrM3SZspH?=
 =?iso-8859-1?Q?No6GGTmmUrL9+hbwj7QDggbRTWPMEVR80GfEcMvSyfjwCJZi9K4gHvroRK?=
 =?iso-8859-1?Q?7L5K+QIC6rSuDZsDs2C0FI7dGlvCBVjTkx7ENhN509S1XPtsq4K7wIl0ek?=
 =?iso-8859-1?Q?8vYMWOvbcTuCghosn/eZFxGaL6KhwoPq838mvCS74sBTTFQjdFPQSJe8pe?=
 =?iso-8859-1?Q?QuUvJNka3iPWYNnLVsxIP5lfYMplK52/iNVdGqSzpmkada9uBg63Jj20Jn?=
 =?iso-8859-1?Q?8Y25Agk1HyATrGTktRKP0afqxD5ravkc0tUycE15ke2/0NjA0v6IPayXdJ?=
 =?iso-8859-1?Q?Zw4RMGsZkUSPTaYgVJDoaZ9pc9AQ5T2/Uw4C22OdHlTEX+PBA0UuoUXTqW?=
 =?iso-8859-1?Q?rmbKjVKE4AAOdvEp+Yusx4kq9O7OPpiobEu31EoZF462uQNjgRsdpzhkdR?=
 =?iso-8859-1?Q?uQ/TIcrW7u5NTLSzebDJ3lk5uEHn7fnTpdGpNKaWYSnY7GDHXzDsvyjPCS?=
 =?iso-8859-1?Q?cRTFNx7CqlAB07S4rWOkQb/f7Xw1/zODh9NMoSZBzCufUkhh2+Q9rU+iaq?=
 =?iso-8859-1?Q?UzSbsbUG3/QS6/ypNXhHf2CsGk4n6AagHYwpVdiunEzWc3/DSLMr32dPgw?=
 =?iso-8859-1?Q?3ayaPgMJeDRVGf4TzB1L63uxcZyEO200tGVjZJR1D7jPVXI7TxQuMBYA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vXRF+fvbircTsZOz2ZLMJ5CQBwMQBEny8Qd2Yk2a1VepjbtaRlfiWDknbLA50mXgMWRd0AksT0Rdt/qMeNIcMDCHIY/JYPEbtwiyouNL8nwa+DZg4Hh6F4vN5OaT/GdUYvhcHlDCvQK5JBPI1fWKe2LS+01iMY14ZvmpGiczzFZLAO9sALsGAWKBJgBux0076yKLLhvB4N06Vn1bcJ5mPsyzmBs/7Niy2ffp6NOxrD/aLojM5OJn7XBlqtDMEaF7mQ5+UoaeVlv/FiA7OfSrLAET5DBPvuj+MZqRhn+xsci1pepOzUzKy7/fW2jP0jqsQJpJPp0GtnTzUJQxnsdfncW62yPFcQw8AOMAf4bnNx8enFKd5+USCT5qeNNhbbyfgKjmMAqpooa7XuD825zQ3LZKJtll4vwN+TOYXEvVwW2U1X/4xhD6yaBopadUn7HoXaWOSXOMQx387IGixv41W+vo6jj1kPZQ1jjwn1L3VV85SPNvLaqbF44UMQjq3sS4lEp2DUp/717LW2mMZ7JT6e9Bq0C2d9ZYCX5Wb5mhOcG2LLYQmpeAfYv1SNcG+/cHiRCWHe3hH/Yrwnt7elEOGLMmQCreYUQOaKA6YEYvykw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12642cda-23d3-46e9-cfbf-08de0da5aae2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 17:50:32.2036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1LZKVF62CJQZxFV7/qk8N1bw/P2i3YO43XFY9YHJbkx+GlHw7Bjc2cj6LahGaHwOKdtqe7Eqv44Jq59NaQe4VKQUGeIM3HhUjaUBqJ8rQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7540
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510170134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA1MSBTYWx0ZWRfX5tdRMZ2RAsxM
 qj2Saz0P7XSAjyh4THluVEmf5BcqfTbNZ6lBEdWT0FI+gr0Qv2MWjWT9ZlYYnibd8R+y1KfG9UT
 DkllhI6TcxQilNAqAs8lX3abjZA0H+Cds2JyN8QpRsDipMZnax4kC8280wxpPcwYq9DfE/VO/RV
 Iz6wJ7XLB0X7NP/SPkLHq8Ehkbx1yQtCmuixMcia+5YuCira4mIzXv5vo7xymJJbFVGtVdopa7/
 2dIdZWZRHHaNvAMR2RD6LE4meMm5rjunbE1rhuqzviwfMaQFESrnEUDYnz9uvjYHH7Fbikuybpc
 2uOBsXDiYnv57rFM1YQooBs5aczSLCTerWuYlyl2ok3fI6gBsThzeRmOIoZJlO/xEeN+tcMW4Ob
 tS84BRf0KJmcR+/HAj7bP/TGFm82UQ==
X-Proofpoint-GUID: uxFRy5KePyHwjLyXI1GbZXPVpOxI6iv6
X-Proofpoint-ORIG-GUID: uxFRy5KePyHwjLyXI1GbZXPVpOxI6iv6
X-Authority-Analysis: v=2.4 cv=GL0F0+NK c=1 sm=1 tr=0 ts=68f281ed cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=mKwMhQp63F_iS45tCrAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Fri, Oct 17, 2025 at 01:32:46PM -0400, Eugene Loh wrote:
> On 10/17/25 02:18, Kris Van Hees wrote:
> 
> > On Thu, Oct 16, 2025 at 04:56:41PM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > The idea behind the test is to check the stack() output for some fbt
> > > probe for specific expected frames.  An attempt was made to specify the
> > > exact stack that was expected, but there are too many variations among
> > > kernel versions and so maintaining the test was difficult.  Loosen the
> > > test to check for only a few expected frames.
> > > 
> > > The test was also checking that stack()'s first 3 frames matched
> > > stack(3), but such a test is already provided by, for example,
> > >      test/unittest/printf/tst.stack.d
> > >      test/unittest/stack/tst.stack.d
> > > So, drop the stack(3) stuff.
> > Since the kernel implementation can change between versions and architectures,
> > why not just verify that the function we're probing is the top frame, and then
> > perhaps for sanity ensure that the rest of the frames are resolved addresses
> > (i.e. symbolic nmes rather than hex addresses)?  Although that perhaps might be
> > a bit strict because I could see some architectures implementing the syscall
> > stuff somehow with dynamically generated trampolines or something that would
> > not have addr-to-symbol information.  Or ksplice might even cause that if the
> > splicing took place while tracing was going on because we never re-read the list
> > of kernel symbols after dtarce started.
> 
> That feels to me like a different sort of check.  The intention was not
> simply that the result should be visually reasonable, but in fact that the
> frames are "correct."  That's hard to do (because we don't exactly know what
> "correct" means), but there seem to be certain specific frames that we can
> generally expect to see.  Maybe there will be some systems where the
> generated stack frames are totally different from what we normally expect,
> but maybe those situations will be scarce enough that we can just look and
> make one-off judgment calls that they're okay.
> 
> Anyhow, the idea is to check that specific frames are there.

OK, bvut that seems to be outside of the scope of DTrace testing because the
stack traces that is reported is provided by kernel functionality and we are
not testing the kernel inn our testsuite.  So, if we keep encountering issues
with changes in the kernel causing tests like these to be updated, I think we
need to reconsider what we are testing and ensure that we limit ourselves to
testing DTrace rather than things like the kernel.  The kernel has its own
mechanisms for testing that its features are accurate (or it should).  That is
not the purpose of DTrace and its testsuite.

As such, if the stack trace being reported has the correct top frame (the
fuction that we are tracing), and we are able to resolve addresses (which is
DTrace functionality in the consumer), then we have tested the appropriate
functionality that DTrace provides.  Accuracy of the stack trace itself is not
somehting under our control.  We can only report what we are provided with
by the kernel itself.

> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   test/unittest/stack/tst.stack_fbt.r  |  1 +
> > >   test/unittest/stack/tst.stack_fbt.sh | 89 +++++++---------------------
> > >   2 files changed, 23 insertions(+), 67 deletions(-)
> > >   create mode 100644 test/unittest/stack/tst.stack_fbt.r
> > > 
> > > diff --git a/test/unittest/stack/tst.stack_fbt.r b/test/unittest/stack/tst.stack_fbt.r
> > > new file mode 100644
> > > index 000000000..2e9ba477f
> > > --- /dev/null
> > > +++ b/test/unittest/stack/tst.stack_fbt.r
> > > @@ -0,0 +1 @@
> > > +success
> > > diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
> > > index 15b85be13..f3d321e7f 100755
> > > --- a/test/unittest/stack/tst.stack_fbt.sh
> > > +++ b/test/unittest/stack/tst.stack_fbt.sh
> > > @@ -5,7 +5,7 @@
> > >   # Licensed under the Universal Permissive License v 1.0 as shown at
> > >   # http://oss.oracle.com/licenses/upl.
> > >   #
> > > -# Test the stack action with default stack depth and depth 3.
> > > +# Check the stack action for expected frames.
> > >   dtrace=$1
> > > @@ -26,8 +26,6 @@ BEGIN
> > >   fbt::vfs_write:entry
> > >   {
> > >   	stack();
> > > -	printf("first 3 frames\n");
> > > -	stack(3);
> > >   	exit(0);
> > >   }' >& dtrace.out
> > > @@ -37,17 +35,16 @@ if [ $? -ne 0 ]; then
> > >   	exit 1
> > >   fi
> > > -# Strip out
> > > -# - blank lines
> > > -# - "constprop"
> > > -# - "isra"
> > > +# Ignore blank lines and strip out
> > > +# - ".constprop.[0-9]"
> > >   # - "_after_hwframe"    (x86 starting with UEK8)
> > > -# - pointer values
> > > +# - "+0x[0-9a-f]*$"
> > > +# - leading spaces
> > >   awk 'NF != 0 { sub("\\.constprop\\.[0-9]", "");
> > > -               sub("\\.isra\\.[0-9]", "");
> > >                  sub("_after_hwframe\\+", "+");
> > > -               sub(/+0x[0-9a-f]*$/, "+{ptr}");
> > > +               sub(/+0x[0-9a-f]*$/, "");
> > > +               sub(/^ */, "");
> > >                  print }' dtrace.out > dtrace.post
> > >   if [ $? -ne 0 ]; then
> > >   	echo ERROR: awk failed
> > > @@ -55,77 +52,35 @@ if [ $? -ne 0 ]; then
> > >   	exit 1
> > >   fi
> > > -# Figure out what stack to expect.
> > > +# Identify, in order, a few frames we expect to see.
> > > -read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> > > -
> > > -if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
> > > -	# up to 5.8
> > > -	KERVER="A"
> > > -else
> > > -	# starting at 5.8
> > > -	KERVER="B"
> > > -fi
> > > -
> > > -if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
> > > -cat << EOF > dtrace.cmp
> > > -              vmlinux\`vfs_write+{ptr}
> > > -              vmlinux\`__x64_sys_write+{ptr}
> > > -              vmlinux\`x64_sys_call+{ptr}
> > > -              vmlinux\`do_syscall_64+{ptr}
> > > -              vmlinux\`entry_SYSCALL_64+{ptr}
> > > -EOF
> > > -elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
> > > -cat << EOF > dtrace.cmp
> > > -              vmlinux\`vfs_write
> > > -              vmlinux\`__arm64_sys_write+{ptr}
> > > -              vmlinux\`el0_svc_common+{ptr}
> > > -              vmlinux\`el0_svc_handler+{ptr}
> > > -              vmlinux\`el0_svc+{ptr}
> > > -EOF
> > > -elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
> > > -cat << EOF > dtrace.cmp
> > > -              vmlinux\`vfs_write+{ptr}
> > > -              vmlinux\`ksys_write+{ptr}
> > > -              vmlinux\`do_syscall_64+{ptr}
> > > -              vmlinux\`entry_SYSCALL_64+{ptr}
> > > -EOF
> > > -elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
> > > -cat << EOF > dtrace.cmp
> > > -              vmlinux\`vfs_write
> > > -              vmlinux\`__arm64_sys_write+{ptr}
> > > -              vmlinux\`invoke_syscall+{ptr}
> > > -              vmlinux\`el0_svc_common+{ptr}
> > > -              vmlinux\`do_el0_svc+{ptr}
> > > -              vmlinux\`el0_svc+{ptr}
> > > -              vmlinux\`el0t_64_sync_handler+{ptr}
> > > -              vmlinux\`el0t_64_sync+{ptr}
> > > -EOF
> > > +if [ $(uname -m) == "x86_64" ]; then
> > > +	frames="vfs_write do_syscall_64 entry_SYSCALL_64"
> > > +elif [ $(uname -m) == "aarch64" ]; then
> > > +	frames="vfs_write __arm64_sys_write el0_svc_common el0_svc"
> > >   else
> > >   	echo ERROR: unrecognized platform
> > >   	uname -r
> > >   	uname -m
> > >   	exit 1
> > >   fi
> > > -
> > > -# Add the first 3 frames a second time.
> > > -
> > > -head -3 dtrace.cmp > dtrace.tmp
> > > -echo first 3 frames >> dtrace.cmp
> > > -cat dtrace.tmp >> dtrace.cmp
> > > +for frame in $frames; do
> > > +	echo 'vmlinux`'$frame >> dtrace.cmp
> > > +done
> > >   # Compare results.
> > > -if ! diff -q dtrace.cmp dtrace.post; then
> > > -	echo ERROR: results do not match
> > > -	diff dtrace.cmp dtrace.post
> > > -	echo "==== expect"
> > > +diff dtrace.cmp dtrace.post | grep '^<' > missing.frames
> > > +if [ `cat missing.frames | wc -l` -ne 0 ]; then
> > > +	echo ERROR: missing some expected frames
> > > +	echo === expected frames include:
> > >   	cat dtrace.cmp
> > > -	echo "==== actual"
> > > +	echo === actual frames are:
> > >   	cat dtrace.out
> > > +	echo === missing expected frames:
> > > +	cat missing.frames
> > >   	exit 1
> > >   fi
> > >   echo success
> > > -
> > >   exit 0
> > > -- 
> > > 2.47.3
> > > 
