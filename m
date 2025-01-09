Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA68F510
	for <dtrace@lists.linux.dev>; Thu,  9 Jan 2025 17:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736442559; cv=fail; b=sK2IG8ZRwNFPOw1LJQsey1hM57DAa//OrDCbAdg55DnH8+8qXZmlTyMH9Wd/yDXFJOoh2EPe+9EyfEtBAYcFEa4Otp7ACiAHgqAC6HwsLYRipHkKSJ0Bp/h926ry14Swo5UxNa+iY6jHqDFIrHH6OAXuHdWAjuesGTuzmPWL+zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736442559; c=relaxed/simple;
	bh=MWpm8N9CsYX4+7tHj7swIlofQy0mxqXV2MUxGDdRAug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dfiWiLekT9BFS9SpQI1QE2YH6Q/X7Ggbc35UaIgXftjFGLlZ0bJ0Y85eTi0xxBCisdikvYQEKQcwCJNjNSyo2A6aeV+mhRlNCk+vTmfBgbb+sPmdnrnrpw1Kas30pS9beJaUVX4Yf6QtfHvdSWXBUNZj6hX+aDV2SoK8td2xfdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DSfKFCgf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gcsPP7V2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DSfKFCgf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gcsPP7V2"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GXu5U016275
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 17:09:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=eA1HKUDHt/w42ToLpj
	vA4foBYbOIEWnrURwwBKdxwck=; b=DSfKFCgf7g26QH6w7BhL5PrKCj6hYdT0/l
	ccOAXK4scfHm6IAwW5SQVex1fr0LXQqeZ7ZtttOf+6bfXfKLEmijAdZ8YPhXm5by
	3LNsjruB2g2crAIcX03LRjdWYS7LUWZgVuDGkBFdjVHls7qLUt/re4ul+FRc19T/
	x9CN9U0g4u3HgmQFb6cqkmRVdhqc8nI1tDjtrqPUIITljkhUaz7RobbtIPmHtl05
	K9G2n0j4fetHFCX9yf+uaXzkgw5E1C1jD2J3FFUaTNBVkz7UX+iquNslW1OO/Ank
	8pxYxu3CXCRRRWpjmsFY9BJi6n1/wYO78XmOJJ2+sJy/qerD9VAA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442b8ugvqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 17:09:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509GOqcv004864
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 17:09:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xuebbrj7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 17:09:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAB3dmsNgUnKgP1c/rFkn74qT/iPY+fodp8pzvioLoKNcxjZOyvkoBOy3xHrP9RUxrAgztbQaWRUknkDazNuDaZeZdFwV1MDg6znxEAXfOlHFuYIbzWgpIOmPFepdyV2Uf4d/YpCJRG54fvav8iX3OVZFyx0vfhZvqqouAMlEHk44ofoa4k/CON5YRwoTujylCDkXuBEEFRCSi+hD+qjuu6esI/UyY6GZDzas5QJoO7nJqMC22IxmoiWkusLRs/Mu0jnYGHrDui9izEzNZrPqINS3B/Pt6hJkWyQyoU3ONxnmiw0OnkkvfaYb6UfUpZehcUtR8XfKrO/R9+tR08xLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eA1HKUDHt/w42ToLpjvA4foBYbOIEWnrURwwBKdxwck=;
 b=jSW/ZsjAtKHAooa+W7GX1zHbD32cm4E/H6tWcv+ZktW0cv7929E2ZXaL5jAn+cg7oKIvQWN8v0Nm/G3hFLSvhZqqfGLXcWEVBzY/X3X4ZXvSrBqAi9EyILUYpd964eAV8N+SznjSu0WhBGiZAe4yoWZ6O8aQ0Frn9Vm6WeSfxY+ClOgrElYRW0d14ySpF5sq1hi8oCOqtC5VaP3rBPk5n2y6idAGzOwOGogWEcENXuVuGtx7fShHyDOw7YIVET+2in0aRDKjqaUWp/qt94OhDSHqrDMFx+5TuZU7J/G2z1blE2JawPwhfU5KWkHtE/cnGN5apchupYzAp8JhDXTiHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eA1HKUDHt/w42ToLpjvA4foBYbOIEWnrURwwBKdxwck=;
 b=gcsPP7V2WzpGgj3MOl2SgKd6NmB9C17E1u8pg1e64UP9gLhdpLy3jOhRexKDHXS9Nrwehhs4aY8zRDflEUGp5P1C5WhPJfiAm8Ki+2ZqW/f340UyBQacTD3FhExojtKK4IwPwo1NbSx0pIWdKuoCM5jc9pH29uhCECjqJgIqQoA=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH0PR10MB5097.namprd10.prod.outlook.com (2603:10b6:610:c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 17:09:12 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 17:09:12 +0000
Date: Thu, 9 Jan 2025 12:09:09 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] tests: add test for buggy deduplicator
Message-ID: <Z4ACtZM4LgprWyCO@oracle.com>
References: <20250109164711.232013-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109164711.232013-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH0PR10MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cb5ec99-15fb-499e-f398-08dd30d05694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n+mrfaNr0aWGsvEUI7VlyeDAhu2OY7LteWljEqYACqg4ee5W5g1tIVm0wMqr?=
 =?us-ascii?Q?yRvuFkEvOf7/x0Wtb/5vfvdaiRdAq0OpjOj0LzVm7Txrhf3XbguVSbvWHTAS?=
 =?us-ascii?Q?DtdKK0qsieRMPwWa0718/bHi1Ax/LhbFocZKDgktURdcgZ0eiPNTIYhtsa4v?=
 =?us-ascii?Q?F7lqg83EIZmshaLq7sq30Bbx71q0JJg8MzXV8n3kov6WbRHynVQKKcbKVEm7?=
 =?us-ascii?Q?07I0qUN8eQeLOE/ebnqzNzeWm0H/LdUlg+nFV2dlegFaBheHspLununOPKQ+?=
 =?us-ascii?Q?iPtsCoc5/qdDpCy1jL3xcE6KueW0xjo850/xYF7yCnIRGveC/5DEUdD05+3S?=
 =?us-ascii?Q?o2N7is0uOYCRNVqWBpFrzbQjuaGaLiilpyuvZTENu8r3zKJHDF7O3utW+o+M?=
 =?us-ascii?Q?0YkrQtEvXd4CW0GuljLUAZJsFVLWMX80d9bO05Z7IxMHX4d0BWE1QGv87F3Q?=
 =?us-ascii?Q?pbcXETxR2tTN+xQUDs0JwSThdR7w8WpS+nPGbjJ+EGLYHXyWW35aOg080NTv?=
 =?us-ascii?Q?g5sOHYDKp5c9PB4sg7tZjGe4paxyiR59BkMt3BG869L5bbzsFZ5u+Eq4pVxF?=
 =?us-ascii?Q?tSNc/nDxW2DmoI4stplWu+lasEG/2kwUKCtiZVtZlc4F3E1hzz3G42jLUiBg?=
 =?us-ascii?Q?Ir3eATz//U018JPJ7JhfqN1TYejTWU39QYqYgmuVbrXTi26plgWXE/npe+Rj?=
 =?us-ascii?Q?p4ifKmLSTK6pvAPlBdrwyS2gU5TgqP/L+KBVatQi6QBAyXFnGzV2K+chqxS1?=
 =?us-ascii?Q?CrNgfiJccaGHcQ6Ed+xeRWM+AlsY2gLyhGtiDXhk13vhQdgq55pdc4840eF1?=
 =?us-ascii?Q?l0sBkROOk1FQEVqkQHOUvxfJz/+jc1InYFTUhNI35fqgl/ksoymuivINDxOq?=
 =?us-ascii?Q?90jRN+vlvbMPvpxcyJQxoa4Dj2Rbode+eAvUA24Tpq3AxtwMF74kqT5udl6L?=
 =?us-ascii?Q?dH0iWo4Y/M638oEEpCGJZGGlBRAZfb/WtP3J4qQ+XAJZ1ldjoL65ihtYcpXc?=
 =?us-ascii?Q?XNRGs69kDUfzgFKEXj8kZu0YNebPWliSXzOF5ZYJril1OXf1xFflR81qMsnl?=
 =?us-ascii?Q?SeeD8BE5KvL86UHfIex5mtN3idSn+GgZeGsDqQWJRnYHg0xRr2WJ9Rfmc5U1?=
 =?us-ascii?Q?GrE9zJ7b+Zi3tTeV2QW+MQvZOJF98epxA9Q4sUAsN1YeDDGfEBAN28C8B8nB?=
 =?us-ascii?Q?3l5NM/pJoJlU65Mm2ftXwcV+AiORog3sXaZrTpULx7cwhQ8JWFn0XBnNTHXb?=
 =?us-ascii?Q?6pP263iCW8xGoUCpGn4V9HfnkTqvylNF3GLNstHme6dYk0LJALpWWcB+36RK?=
 =?us-ascii?Q?MF/OKgL+Ov0T2rbJR8y8jDdhIj6njV3yhjIASaZYBKYLwA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B3SrcypooylcDzRVgoNu5QZwTKlXqYTK9YpFMWIeL/AOCz+0O/5/W+l9QSMp?=
 =?us-ascii?Q?MMj9Oi7pXND20uxCsqZb8vxvyDMg/P9x17sVOMbIkU072zsPpRta8+RGC0nW?=
 =?us-ascii?Q?enebyFLO7LMI7LdhuGHsG2nCzLXprjVbjFHTTk8Ak6j0Hd4ys81E/OvRnycu?=
 =?us-ascii?Q?8n90jOQs2+Pwhxzd9jjZo5t0HF9xnhpAKtUCINsyynv6eNffmjjUkDO+/P14?=
 =?us-ascii?Q?5u6xuwPiGIpLH3q8l334ia70Not0Awt0NnJPZTZK778PEqjfJhwdELTRFSHv?=
 =?us-ascii?Q?AsreKrdrYjNecr7B5Y7Hdr95tXR4cn7u8h+SBMxpOlbo8Nv9v+Zg94cD5VfW?=
 =?us-ascii?Q?Yy08dVRcrfwUCofBX9scibe3xyXb2u/qlVx4N0DVcRl98CCytwFmcoz2wlW4?=
 =?us-ascii?Q?TODC6bI/YpnUS5Oyhy9dIVYleZ1KNjQLyGNeICaVCRHlpUYOLPRgGv5KAsDi?=
 =?us-ascii?Q?ebkniyUxAYQPaESOtiUzjDMX2wphFrlkxqlcJPyKfSeZTnT7RPxuZFPSA1gn?=
 =?us-ascii?Q?2n2BUgAxIeasEICkwgbgPKimVG1LbJvbdUMsr+KHzg/kCgrTLki5L7g0Wbor?=
 =?us-ascii?Q?YlyJzJZHwlme/IdEL7yiP3Sg5+UUnKPaJad6SLwzQB1piC4IIENlkjrgxcmk?=
 =?us-ascii?Q?blW4LL5fEFrl7dVjhIq4IcPU4pljOnOsN1D9w5DcWvL6+tiGBblHLuanSem3?=
 =?us-ascii?Q?jrKkmvA/GLP2ZyIkw6FTUqmy2xU8OX7IJN69S5tN8YHvk3+TUqkq1SuTPGkH?=
 =?us-ascii?Q?bQqwd8tmjni2njFwROSaiyKZiz26LHZlscRz3IwroIhPddB29BTA7YTQoyLb?=
 =?us-ascii?Q?zgS8s4LI8uLact7plpMr8NwDmg0AN937+T13LuqF/o51jyoUgsdfuMfUz3eL?=
 =?us-ascii?Q?/D7Nya0cnTOc1P7RJxsOCmYLSmHgK/WGQotXvKZCsd2ufWwcFfVu2+JNv7Bu?=
 =?us-ascii?Q?JV/VS55kvs4tR7Txg4ClZ0gu66I3kzFhDd4Df+qXO67LFRWKsKdI/KDiBv93?=
 =?us-ascii?Q?oI+bxVpn9RtKPwB+0a5JChLfQiTsHQkzcEqL63P2uwJ5knX/v/gzIauSF/J3?=
 =?us-ascii?Q?nXXPKDB/WZI74DvjgPVqeIydmKqHihEJYeIa/8t2gdNiKlHhbQk6ztV0amNJ?=
 =?us-ascii?Q?jAwvAROKDTtOJY3DXRUnxG/qNuNbh6Naah//xON0FkVB+Qd7lv4m3XzsOy+e?=
 =?us-ascii?Q?tqhgQBPOuPrPCZtL3MY02RE0O77q5QIWzRlTu5kEP01rTIy6LNFJUPqOdf7W?=
 =?us-ascii?Q?+/5X9IaU+h7MgZRHtFty6UR4xtE/ayXh5d+cMGx6qmAJkiUqnL6OwcTSMlnK?=
 =?us-ascii?Q?husBTJ7eqvz0Vd0cxwWZFpiy+JnvYkhhZvAPZtUyr6WM74eccvMZyle1daS/?=
 =?us-ascii?Q?6fZ5geKzhKZMvi4NqeaRSvFRLz33kz2xJNVqzmTBEY3Qvmbd6xsXNuaUdBhe?=
 =?us-ascii?Q?f1/mrG0f7P3F0+vJJsJo2MAfIOx5Ee2HTQ5oTsz9HT/iGa8LS33irR5nfs67?=
 =?us-ascii?Q?ixeOO19QMJ/wFzU/P0XRSl8tIBjVVBE3MgkZxhsE3WW42War8lk12uLIkfDZ?=
 =?us-ascii?Q?j6HWe1BH77UiZHM1OX7Ah8a5OAWBeLl5rbbIj69/OpepUHr/KRzrH4/12GAI?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F4Ew3Dl5wdd7vmqDGZ5JVszMOQMO1weZpFE9rSyLHD1d8/aHwGdEuPwq9FZuUWBaFmU6eLIc7e82JYmv7J7LvKpKPMCGSRDlmNI60H1i83fyjpP1l6td41/8kCrtz+w8w47BovykvJflep14O5ID0BzHeWCKD4B0yg+TuspqI2a0FTQ9r4SOLBBe/XyujrVGbnCEe3J4sYK1sSYvogeoE0AyBYNDi+Os5FUoQde/7TDc7diqHWAA3O69yZYpVC5c/EPbvXSXg3eHfyH3JN+eYwZ81hpg2CsrdXwS6Lu7blYwUdbYABqU1pNRTB7PgbeK05h40iJv5au9BquwdqQocqTt3pQqhORgqld/SSlgnzOybch9a8PzWS5iW7M5fNcxpaDcnOknswIP9FnLxGlAvs2jY4owUHB5pJT06tJY+/Em+hOv8VdPzFlcZ2llOKaIkHWWlkrglns6Wc4zUcclMkTljFfqVALsDNuQhEGCWVQCkySJviDJIjMwxmR9dOvwO2XqMziNCwvHmsb7hJ71YzIgvufRaR+ETwOIP5fkQz0tGKWqzaso9pFe0yogId+7ZAWAIyUIM0kqrSOzwLmc8OCRZMzafbs7CJ7qy3UEhXE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb5ec99-15fb-499e-f398-08dd30d05694
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 17:09:12.2422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AYDDQz7CuD4Y/LpsaLY8+/RXYhd/XK8G9OUlj/2/yodw6hsq7CcfUgE2IvDO9wVbwzuWRaTKBCIHqPgH1EML+bIV+18n4A09RX/rcftrKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5097
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_08,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090137
X-Proofpoint-ORIG-GUID: QGV5LoHimsgYE8E6OjO2kEKU_lwsiMLJ
X-Proofpoint-GUID: QGV5LoHimsgYE8E6OjO2kEKU_lwsiMLJ

On Thu, Jan 09, 2025 at 04:47:10PM +0000, Nick Alcock via DTrace-devel wrote:
> Some early prototype deduplicators dedupped types in one dict (more or less)
> rather than putting conflicting types and module types into
> sub-dictionaries.  Fail if the running kernel is such a kernel.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  dtrace.spec                  |  2 +-
>  test/smoke/tst.ctf-intact.sh | 58 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100755 test/smoke/tst.ctf-intact.sh
> 
> diff --git a/dtrace.spec b/dtrace.spec
> index 902ad7d8bb980..cf960f14b55c7 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -151,7 +151,7 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
>  Requires:     java-1.8.0-openjdk-devel perl-IO-Socket-IP xfsprogs
>  Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
>  Requires:     coreutils wireshark %{glibc32}
> -Requires:     perf time bc nfs-utils
> +Requires:     perf time bc nfs-utils binutils
>  Autoreq:      0
>  Group:	      Development/System
>  
> diff --git a/test/smoke/tst.ctf-intact.sh b/test/smoke/tst.ctf-intact.sh
> new file mode 100755
> index 0000000000000..d737a2b162fcb
> --- /dev/null
> +++ b/test/smoke/tst.ctf-intact.sh
> @@ -0,0 +1,58 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +#
> +# This script verifies that the CTF, if present, is non-corrupt: in
> +# particular, that it has at least one child with 

... rest of the sentence is missing?

> +#
> +
> +ctf="/lib/modules/$(uname -r)/kernel/vmlinux.ctfa"
> +
> +if [[ ! -f "$ctf" ]]; then
> +    echo "CTF not found in expected location of $ctf" >&2
> +    exit 67
> +fi
> +
> +# If this is not an ELF file, turn it into one so objdump works.
> +if ! [[ "$(file "$ctf")" =~ ELF ]]; then
> +    objcopy --add-section=.ctf="$ctf" /bin/true $tmpdir/ctf
> +    ctf=$tmpdir/ctf
> +fi
> +
> +# Dump the CTF
> +objdump --ctf --ctf-parent=shared_ctf "$ctf" 2>/dev/null | \
> +    awk '
> +BEGIN {
> +    intypes=0;
> +}
> +
> +/^  Strings:|^CTF archive member:/ {
> +    intypes = 0;
> +}
> +# Scan for each member, capture its name.
> +/^CTF archive member: / {
> +    member=gensub (/CTF archive member: (.*):/,"\\1", "g");
> +    next;
> +}
> +# See if any non-shared dicts have any types in.
> +/^  Types:/ {
> +    if (member != "shared_ctf") {
> +        intypes=1;
> +    }
> +}
> +/^    0x/ {
> +    if (intypes) {
> +        exit (0);
> +    }
> +}
> +END {
> +    if (!intypes) {
> +        printf ("No non-shared-dict types found: probably buggy deduplicator.\n");
> +        exit (1);
> +    }
> +}'
> -- 
> 2.47.1.279.g84c5f4e78e
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
