Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540324DCE3
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334421; cv=fail; b=OH1WZh8K8//n8tPDpcrnL2+zEn0lyso1iUtdHVcYubMtvg9BjDmhxULaRJ+9OYEtdwhxVO9BDBHjpoD7Tbo3dnm5RtcZTNO7yF3biBNooA1TVkIqD3+5yytT3RvoQF/DRY+XGGQguKTEUrVsfERJJ58N5smgrT196vsRdmTtEf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334421; c=relaxed/simple;
	bh=iZaBccLETupCml/U3UhIP4yFAmQlAbkkUV+oDrmOce8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Bjg6v/LO4RyUgEn5ZiniPG85zwpxcGwHKKz4DYRjdBvm5Vu0nx+Bf8J3xJrZVuVEw7xWA7tNxuje7SYqWCkfGraHVd+XfIiDHKWa1GMnzBKdjlcQXgUZeUqQf9gX84QTup+sG9uUMoT7Y7WivF6OinPXnYZiTrwj2QiHQUREhLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hzWlr03s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BSGk2lpB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hzWlr03s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BSGk2lpB"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0g1ri013970
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=kqwNrKheYpzCxnPe9k
	khfsrJxIntZoQqaYsowXFOO34=; b=hzWlr03sd5JezIntJ0kpAEPxl7SGCMqrqH
	+CGkQ6gFEgUJOZLj9x+wEwtuAJ2d25y+a10VQdeO+JfjmO06S4K5T+czyP5iTDmq
	8DYbGNy1JW1JCTaLFT7+5aitzbl4dtfcAttfz/KvfSXFS6UgQqVIsUkOWH/HwiMD
	TzjN2DLpBHnY+acC6IwdPeWTBAGBZ0cCnvqaAQ+Lwy2+75HzPViJ/ercrVErbDLp
	MEJhFVFNeRRVF5ONHQxkRGr575tKm09+RKuT7wd3075TxS88uV8wYHZbB32Sj4a0
	ZRo3rGl2/8uQOOZW3KnaiXjmRhqU0aPV1id8wBtSqROBB8IYS5cQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn96gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:00:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JB1FZd021547
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:00:17 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbk7qd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 12:00:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7lWK8CH0rhDwRF2Yra2f0BxGGxBE7UNEmALFm/EF6biPqBAWW83SmnOxKOkRurMmU4Ub5GR/9kfY5d0ZgYRCO+LNp4dQat4ShwHDuhyiDtDV3A9jtb07P4fImY3MQPcwwfHfqVC2CkDQ1LvgxuAz32fW2gH6X/Pkp1MkcooJ/CZ8rgz5Ufh99ZCsPovMx+qg+BIbEQWUO3hSWmpgm5BqS2dX3yaFMbzcrohAZ3nQv9SpQOPM7aDw4girk3VVF8NeAZBcvzUms1eKDBa1DXLsEoHMIH5qprgWMISJh3nzTKruAIb2AUVXvWv07ru4tn9LVHXa0VI80Glq9qD1osKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqwNrKheYpzCxnPe9kkhfsrJxIntZoQqaYsowXFOO34=;
 b=H1bEnwg4v9OoG631Irts4xueMB7lHyzYHQPTzAgBGBwXheW8Wxt9xwGD0vk8l0DdFuvjjJHAX3XFax35pVrPQfKowmqBCXbnMxXKFva3E/ARb4P2yK1gnizLDZILqBxAbW1MkdE0FlpOp8lazJDqxctXJaxdhmDCFSShvCpIEspFo8R97onsTmRJcWcu6y/LLswILhNSS3EUSY99bGd0HhfFsM+r/JyWIRjaHG+IOSVR7cQj1FeK0Qxj3mWeqemRpgJhl6HVl2gKNyTaiummSOPhJqlfcUoHJIx+YGxXzGvFrCUZuIZD8Uw39B+R1lV86ISE9A5aQDTzpPHp9QnGSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqwNrKheYpzCxnPe9kkhfsrJxIntZoQqaYsowXFOO34=;
 b=BSGk2lpBCN4xWaZnpUw3neoJsOLnzLO9ehWau48OZhJUuRoANcHlxfaq6ZQ6783XkdQ/9vtsL3OYx5aBHJQus8mXQidbM07Nx0GcdiELKamy0NiIupYzV2q7rrCI8i8wYTY8rCF4xU+IOGs8sQfpk26ukAvhTh/8eRG+hpcdXnE=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SA2PR10MB4459.namprd10.prod.outlook.com (2603:10b6:806:11f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 19 Jun
 2025 12:00:11 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 12:00:10 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: <dtrace@lists.linux.dev>, <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH] libproc: make Psystem_daemon() detect modern systemd
 properly
References: <20250613164637.3110-1-nick.alcock@oracle.com>
	<aFMWVZrhuGDX2330@oracle.com>
Emacs: indefensible, reprehensible, and fully extensible.
Date: Thu, 19 Jun 2025 13:00:08 +0100
In-Reply-To: <aFMWVZrhuGDX2330@oracle.com> (Kris Van Hees's message of "Wed,
	18 Jun 2025 15:41:09 -0400")
Message-ID: <87y0toym9j.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::26) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SA2PR10MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: e79fcb95-904c-4086-3ca7-08ddaf28d77d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CNF1vvMWGR7dpqBUICL6Au1hBNgCy4AwubOsDlxDkBeG5XHs0rr/NYfbNiLj?=
 =?us-ascii?Q?EZwiQiYRz0f5xD0whCXePgOsWrNvCt/tSJicicjtuczuJei2GSVDVFmMhhLO?=
 =?us-ascii?Q?jzMfOlPAiT9D5hw4tJlP+uf/lqepI46nCrJzLH5qhezjYmEqd17Hc2u8mWa6?=
 =?us-ascii?Q?KXFvzq+Z+1V3i1Du1jlRa3ms2JON6DwZvI0WuV1oUUrt2Y8BVJOAdxINJROE?=
 =?us-ascii?Q?TLZVfaVK87ibo0E6DZQCBxVmyJhIyskp/yobeQdm+/WVmqaHfb+gaitAboxY?=
 =?us-ascii?Q?Q5o35kdNXK64tPS3ANvom0d9WLmTnCOKct5nFYszlqYgNb86IT/sKHMmfkbF?=
 =?us-ascii?Q?+H+eViDAACFmTqdaZhLJKZhZNnAxnhwiKlaZY98VbPyxtA1hglU7kyj1dFhA?=
 =?us-ascii?Q?joN64+URSC5aYj20peKmEU3xwpR96t1rJDbtiEVAMuO6N8JLpgms1dpwJ8F7?=
 =?us-ascii?Q?eME/DgP3rm4zkhR2iUneg+6pSIVFS943q+4QzHgQX7HULuzMqsNs7EZJHxff?=
 =?us-ascii?Q?/BKERJ2OLRovtOGXr/31kuuwlpKLxs3KqavGs1c2wXNlbeAXjkxkBvB4dx2s?=
 =?us-ascii?Q?Iw5UsNhM/QindpXIFZ1zh0C8yBtRpvC89L6EgswAwt1H2K0jrx6Wkl9pDVSs?=
 =?us-ascii?Q?2l93u3VUHQvbwLrxdvpxDypUP7fGlMsaRiYNxETdYVCheldNbqXuF2fVJ2Cq?=
 =?us-ascii?Q?UdWp+ORCcwbdik+8FeTYObYuVzF2jtU1QXpjlO4u8kHy5muIJzC77VRjc4mt?=
 =?us-ascii?Q?Fep5ztftjeY7pmwnN6VmIXvdE3AcQBsEalMSkwFFvIJbvzVNb0NpFGmGeqp0?=
 =?us-ascii?Q?2U2Mxtqt2+y79shMW1NSX4X/KpBIWf720Ro4kpyif3FYJDdfuB9TlAkbcHSE?=
 =?us-ascii?Q?PAvY3Aep5oPzGp/GMj8NB8hcrluPBhJZfT22ho6mewwXPqePExajE7+GyaMH?=
 =?us-ascii?Q?rF9lt0ayqsbUz1ZQP/lz0G4LfXmbyQXFQtyzs4wp0W3cs2KZAAo4WK1bAvMx?=
 =?us-ascii?Q?UWQeBxEYt61O8wpDgAyzbglp/HhDl7L8BT1ep6LNlsScW8j20wO+LdMi6tF2?=
 =?us-ascii?Q?k2jv8WiT2SZdSeeY+i1jTpoe3sodsveiFuYXLRPAo6HvCpKiT5+YpFCHyl9k?=
 =?us-ascii?Q?rGupNhQ7wq6w5Qxt7BdppAetjtG7+SZ3Gocblh4g4L0ow8yOV9OA5Lf4KQbW?=
 =?us-ascii?Q?rsefVAowkoc9to73qGzf8Z1Lc93zB70qZ0Xd0caiHZEyTJjHw44HewkfIjRA?=
 =?us-ascii?Q?0k0tY25f1wHXGHG+E5ATqV+Ed0PPIkst/lqbd0UhG2qT+OyeiMXpddlCMIcQ?=
 =?us-ascii?Q?fB2RwvUv7KfGp5OPqHsbHgmShzNwyVEFP5z5rwjdRWndP2T0hfIkIA5uWMLW?=
 =?us-ascii?Q?tujkJPqIJpF+cAcjqPVjukPPYl9THWXa0Q47ZNyzRdzYq7v2OdSi84Ws9ZDS?=
 =?us-ascii?Q?pDLNISlYY5c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lLJdnYLVMg0axqi3h+sN50ZwMHbCh8UI9eHbn00mqKVN2orXlEH5eDj2W72T?=
 =?us-ascii?Q?H2isAz5MC1xHrTXh97ZO9uTxgMaAiwCuZzxPYWF5BwCSzEZSEzy3eEIod9Jw?=
 =?us-ascii?Q?yk0HBVEDyYd8aZFuvp337ydE3nZK/yF4JiQvOVF2TbaEZNLSda57QFAcl1Bt?=
 =?us-ascii?Q?duwhtivZ9YnAYC5qDFCTYWVZ/b5N2Wp+IuAoEXUN/v1kHs4ZdWyhnhytSDJk?=
 =?us-ascii?Q?gqajH3mbirbkUebv6r8RXVJrkmFMbY46PG4f2hdJrArMin1zz4CpC6sBKfVz?=
 =?us-ascii?Q?z3v1OrprHm7Lkjv2k/llW9uyIc1/Kpz2vSZIeyysQcsusLwxPevAll0g7WPk?=
 =?us-ascii?Q?zOGxbP1xR6Eyl5NzS0KFOpShRUQl7KEPLmqMI50TJXkUsJUQOjVbadVCmKlk?=
 =?us-ascii?Q?IF2JKMLQ2OdAADyLjm48Y3R9hbyXWDSKN9nzeBKYAiEN3F0/drLEUFKLWLZ5?=
 =?us-ascii?Q?l+n6GmN/ohcvpX2paJb/2T8zEb8SXBc5XNHQEFlZ+ZWsLNRTtF3+i2Oe3ci4?=
 =?us-ascii?Q?21s9cdpLRw4Sq7pMVa9VQNncEN5gmFiVGruZuJkwt5lyLKZQGD7mMdh6kwhY?=
 =?us-ascii?Q?h6NgxvBi4hvfpGKbIGyT8Wk/VtFCFQtxYNX+Ryd9gKfsq1QeFAaCnjVNy3pn?=
 =?us-ascii?Q?lifYuu4e4+PmVBXqebLCZUqzLVQDbh2kNsOkP/+upM5RjIRgFbDJsqrznwTD?=
 =?us-ascii?Q?ZCokdYuHtHytrTyNsLNUvYj3FHnCf6o8/XAYB+OSKUZP9tXWQj3riZ7amOzK?=
 =?us-ascii?Q?L8jhKMnR2zmPvZEsDkoeNZHe6pK2llg9kYMb3iiGnQUw1kvKK7/DIHAvjRxm?=
 =?us-ascii?Q?f59/GkEziG4RBwpjzpkat2uga6HkZPXOttydlJSYaN6HDVxP27ZJCcZj32LJ?=
 =?us-ascii?Q?NaFCbi0vSAVu7+5Mn3heBgrvNaqUYY7osa+R9MjC57wcVQS2xXXWIrDh/wfe?=
 =?us-ascii?Q?sGCCZAG78bCMqdwWp/ClONrgvV0fxC7k5DnXa69ExcYhaRsTwawxbGa8Qi5j?=
 =?us-ascii?Q?dRZzVG8ipEfaxLIDBCd+2iaYNisxNAxwaFvO6Pi3foIvrJzvXdHPq93Sjg17?=
 =?us-ascii?Q?ctfV6P/q8mj6zZXcxLysbgEyXXhs4H0GkM9yJM0sTXHCF61flcI/Y7HDwHaM?=
 =?us-ascii?Q?tqwEVCfi/xSnMi7qRwKsXfZaurIM3GBlS4dg9k06siGAr/wxFYUc/AWfI+9j?=
 =?us-ascii?Q?v84B3rO+U+USaey4fQdamX/c5b5nZiXpNO/8Yn/CsBLUAY9dC0RWYSnDECKB?=
 =?us-ascii?Q?mAMA0jqvZCdKdqQp/YQ0YcfTxgc2mX2QDVB+nowPDomTOKXxep4JYNBhxZf+?=
 =?us-ascii?Q?wapyX2Ak7gg7frMoJTwsY6OAipOAhF+19G0KAs5k72/pmsPLsFhPP6ymItIi?=
 =?us-ascii?Q?rgunTuAeUqRkpCkHmJ8S4Yf6w+M7Ym89f4CYnwoQDJwqeukHcIzwS+E3tAsl?=
 =?us-ascii?Q?VAevR52lw4ucYAvnfw9uKopIawpNh3efrUqTxT/amXZZ2SpnzCEUKGHFW/Dl?=
 =?us-ascii?Q?+2O9HD7QIhLybCHZ+TUlmvCWWFIW6OBTSFFxAAqyYKidViaK+NvrOp1uU89H?=
 =?us-ascii?Q?Py1uS8+bmPQGsKGzUF5LWQdUmkWaduhYS3fvy453zYMuGCCutb4Uc27PbEpB?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HORWEvMg8stEpuUKyl9dN3Sjjpr5ARtZYEUbMRsXZJJz/3DHv6UsbrnJ/NUnSs1H9xqzDpzTYtRXBvuKFAiBr/QJkUDRSd7cQAB+cyYBwzeAlvAjQG39MyIX5q5bgkKKgZi9Ek0LiD6l5dhBR7AFHzemkVunORDBhH+z3+Jd4OBs77VFWuHgCB99Tr/5kQpOZxF6VLWyFie5CP212GviY4VvCJllpQENmRnEgTcXjrXOIDmGb5xm8RF/7p6Rd/iFZKRqGFXGzAXnbh4VyzW1e0WUXfAnveo03nyHIgUCfnqlIqGd3F9T/5zeFeHh0RapR4qRj+7keNUCHMYNFOzcb2VONcx7SxGiAI20yzBXWDqM0JYYcS0sHQsFTE2ZYXhnDl9OF3RsjSKAEKFcKRo1cP5FfrR0dm05Nrws0RRRPS7yEKCuJFiLuWpGoW1PYKOAn8PnM5qWHBTzR4yshQj+FYi7VJeJXe8d2dbR0rGTdAun+ybs5Kdxsf0XxI2i40ETTr3Upp6PeNihu1SdBUTbk6WfCgM6mK/TJioZ2gzVZut5pl8dOuGBqVWuG83joWRVVxU320BJE4tjhBkD77ZqZs5VT6HYUpTKn5UACq8PUxM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e79fcb95-904c-4086-3ca7-08ddaf28d77d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 12:00:10.8941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axefpHn+XAO1YB+vvj0snro7nXABTJO8YvtvuBr8lzRngJ7jmvnEjUSpv9KLFbZB9zWwrZxt+aLsaJSBxReyIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4459
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190100
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=6853fbd2 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=YnDwWPBWNvSZ6oNODYUA:9
X-Proofpoint-ORIG-GUID: JoP0FKQAvhm4uggz2iDP2E5hSrCKVnEO
X-Proofpoint-GUID: JoP0FKQAvhm4uggz2iDP2E5hSrCKVnEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwMCBTYWx0ZWRfX0tiU5y4qUOfe sjiGCUmHUtYXqLEW1bz0urq0hlV+nbHGejHbZ+EKC1rjwlqnM9Hi6Cv4xiS+PdGaWlIqI9kloyE tYLWniJEkk3bPSWYvO/0t+/vvsuL2NjiQj1jyoUpbMMMaMJ4Ptu50VX30L2w7OLQV9sBshcPdQ+
 BdvwWP5R6RJQgl2+Zv/fOCcsF7FL/mpHXr80qH7oK4qdJ/MsiibOsWStSiHyJ535PIAB5RAytgv H5S4yC4vu2aZE45R3+sZbz++CZE+5Y5i/XiYnJgvrBvOHn6chBnY253Y7AEcXXy7eHXLUGpn/um NTkV9vOIWbu6nlxVdPNdb/OwF4Hy5tW8ygxu0tLBObeTVOQFT2VJddjtZIuKA1Qx5JTZIxKS1ty
 rLYyqDjz4Y9Gy7ClkqZEY+U3lEMaWwBwv/WAh5D1bcO7KPd3T8lmkHcg7S4yUb8hJz771O1x

On 18 Jun 2025, Kris Van Hees verbalised:

> On Fri, Jun 13, 2025 at 05:46:37PM +0100, Nick Alcock wrote:
>> Psystem_daemon() is used when carrying out shortlived grabs to detect
>> whether a process is too risky to carry out invasive grabs of (you wouldn't
>> usually want to stop syslogd or, God forbid, try to ptrace PID 1, unless
>> explicitly requested via -p: the process just coming up in routine probe
>> firing is not enough).
>> 
>> This has two code paths: a reliable one for systemd systems (which checks to
>> see if the process is in the system slice, which contains precisely and only
>> system daemons), and an unreliable one for other systems (which does the old
>> Unix approach of consdering anything in the user uid range or with a TTY or
>> with open standard FDs to TTYs to be not system daemons, and everything else
>> to possibly be one).
>> 
>> We were checking to see if a system was systemd by looking for the systemd
>> cgroup hierarchy name in any of the victim process's cgroups.  This was
>> reliable back in the days of cgroups v1, but alas in v2 where systemd runs
>> all the cgroups if it runs any and there are no longer multiple hierarchies,
>> systemd no longer names its cgroups this way and the test fails, causing us
>> to fall back to the unreliable pre-systemd approach.
>> 
>> Use a more reliable approach to detect systemd, the same approach used by
>> sd_booted() in libsystemd; check for the existence of the
>> /run/systemd/system directory.  Fix slice detection to work in the absence
>> of a systemd hierarchy name, and everything else works unchanged.
>
> Is /run/systems/system guaranteed to always be the correct path or is that
> configurable in systemd and thus could change depending on distro etc?

It's not configurable. I got the path from the manpage for sd_booted(3),
which also recommends just doing the check yourself directly :) so as
canonized as anything like this can be, much more so than the guesswork
we were doing before.
