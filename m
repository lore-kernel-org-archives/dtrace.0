Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A2E81ADA
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721330658; cv=fail; b=DEexjv9pq2+eopps3hIluzBYc9/YZ//SyVDplFaaRKOvhvyQr6O9Hgnv5Ht6gmlGtZv2SjzZg6cbZeaMQBsw9NRGNBstj1jm1ZBJ9Z//uCsbNkvopxUX3ZUqJzNvN7mxmuq2g52Y5kLL+B53pGXtOzjPVgl0L4vi8qiUpYliYsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721330658; c=relaxed/simple;
	bh=37OE3AY0aYHvZbznf5Pofbt9Gpa0cf1unNUclAJMl4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gxYmrN1p5vVE59SUJqkGAQIEp928Q4LBVRgHOSpjBvoBi9G/FuW4+cKFQddImvLR0q7cAreAGMaibYrsTtDDzPHxnDUaIGInpRdWbSI5gBfXcxvfrUmRPeXzDcYSOFxXMdBJlbanRvKG60xkw3mYevoggaTUo4PPqBwqgVEg7t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RAjwEmM3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lnt9Swzz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RAjwEmM3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lnt9Swzz"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IJMYK6016616
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=np2EtlkZNBSeuf6
	pwU9nq294I6EiyOm+gdodDghP/rE=; b=RAjwEmM3kXLEIFrLpITxGzgHa2d1MiK
	PxXv+nqaEwCa6QgLAz64Pmgno1psl6YOzgMj8jrSbccVtEBxpB8gdQtAiD3ya7R1
	k21qhGp55A8liMRJD7oRbAbwzSt0oJ91qjt5mLSKtJblI6Pffa1tp35/CyFSyhye
	91QoDPvJwieELawoWQ4a36eAERn0Disnjbfgx6MuPff3/QkV6/goWX4ebK0fBPCQ
	+5PDJ4wwZOuVfYWvzZFGNszSEIJsu/rO+iJPoHoBnJ+++OfmuoIn9qwZ389PHpB5
	ZQNludlv4KSx4jFRz+L5Ag6kvEklYQ8TjATEK/ULQf6sa2WBQieT5ug==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f8w781j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:24:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46II8gcI003856
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:24:14 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0ux4s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHHL+n54tnKqxIUPAa6S1mYr9bNl7LLKAh9J/D+MzgdiBo3DU0e7PLGh2WMq+6imDcJYrniuLk0bNvGsp4pT+VVQcBO1HztC4ICIXBagy3avhIcW0DAXsOJMoF4TE50ak00jfHy0+vkZK6vM91BDaiyUsT1W226YmdYgrFOor3Og8AdLF8uuKZh85q4qhpRa/X7+2JlSaMmKTfKIvcogXJBQB1vWHdFjpa7miGbVNew8Cw1p4UawoR0AD9nvOElKbr3M7OTz8vdyaKH1/Yr66uJ4tJE4LI2F5Z0qTVw+KKWaGZOpmDVWoLdCfF8wbzFLkZchw3gzrBDE0FwjkDMWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=np2EtlkZNBSeuf6pwU9nq294I6EiyOm+gdodDghP/rE=;
 b=XQGfnoPZRxv+EJvzKIWehtz9+q2tGxs6QvTQQexlU6+7/C8ZxKi4oLilz8ZdmjD1DA1GR39Bi1IfUpQu+IBAjnMVwln94Ei7hIGwy6qK1iThC1z6pWW0qGACnoYg4bYKFaeSd0+J4l4gakzmCC7FzT5nwkWWJhJQJUgZx0jbRSFbtWFZTyeP+O0Wt0JPEpLtao7SfOEs+cBk5m8Jd4b+WlwrhgQmCOpGxQE9YIwcOUaYumoJmgS+Dl2rrrYaIZpxCMWrG1BRSpsInrvLjWXC4ovi/Gl0ugSvXBHl5RocS+GgcS+AKm+rNBqyNASzHQvWAgWB3BJDrVt2Sj5bX4CEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=np2EtlkZNBSeuf6pwU9nq294I6EiyOm+gdodDghP/rE=;
 b=Lnt9SwzzkbjMIXzp1yZFgdU5c+yGEn2Az7Gu6oSY2k03SqK+Fdeu6zRwlTr9+KJA4mzg4f9NAmWAhtdC+4+SzRluDssFI/uQw+3Dc7MjXA+ypiIv0QBLvaBcBKl0HGWrZW9hNHnEXdVbz9bKgPu7SCw6lcGG2hcLuoCkmzmmkHM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB7803.namprd10.prod.outlook.com (2603:10b6:510:30d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 19:24:12 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 19:24:12 +0000
Date: Thu, 18 Jul 2024 15:24:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 12/38] USDT module names may contain dots; remove
 incorrect check
Message-ID: <Zplr2Xq+aa0BvmhJ@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-13-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-13-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0768.namprd03.prod.outlook.com
 (2603:10b6:408:13a::23) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: d92dcb9c-7a4e-4b6a-fe96-08dca75f3439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LMN975xq+cM4szUzH3SerjHlTqRyLqMaK1L2qorBemAenvm4+q+qAbUQxPgM?=
 =?us-ascii?Q?g9VE1oBGAkgGNNcmcGDNfQqpObHjZYK0kJTikR6Vyw5CV5MklOG8SpGgx7r/?=
 =?us-ascii?Q?+HMaUJa9j9YS88NW1X3K+ny2IP2jSXnr5gGnIn3miPT99WMLVNHeTO60VTzD?=
 =?us-ascii?Q?WYK+ZvWWKMBV/+1oe+jDzcOw6pUukmjXgTrX1Gb830AE5XF7FyuWJp5Dad6C?=
 =?us-ascii?Q?wd8TMM/nH9aFTFsmAz7MTCHoRHWwa254G6b9wRbdptERI++LXstzKDUBtrhW?=
 =?us-ascii?Q?Ahw1sK3cAZ3VVqFBf9gAQSVXhfSs4LbVrrMAxXoLpcuR9a/pFjV/1BfCxoFh?=
 =?us-ascii?Q?3FI3a81MbYjrLOpFsS6TIZMGwFVObYhfonWIxYHKi2x7b+4prFvuB5Zn9mZv?=
 =?us-ascii?Q?snl7wOfhnhWGJH5x2+jdfkStnt3LB5zNBBDjZzYMSfu206rE4V4HWu9WqHtb?=
 =?us-ascii?Q?dGkZ+iHxUhAQdr124+I3icWxSlZ2xh+hsorDTm2kCoeqLCpntaHgrcsbI4on?=
 =?us-ascii?Q?G2TBQ7ZLRHoV7mqpIY9KbYJTdSx1GyCG1LhF/5EIri9KHAJyd7FmnIA7FvD8?=
 =?us-ascii?Q?mZOfajGAxg7rdc8oO06vUuiW52gvpS6kQ1wLu+BBkRvJqo23949WHjQ8KUIX?=
 =?us-ascii?Q?aCWPWbHrYQN4QLnPD9XCALSqMHROVL7o1n4hjkUfPdl3rN5QGfvUPXOt3LAo?=
 =?us-ascii?Q?4H1m9/6R5GbRbucK/lwkA52AIFbavf0D1rppb0ZnZ5q3vKTWp8PJfDGvcyj/?=
 =?us-ascii?Q?22UXQN7hmhhg5gDnF8uBb0s9bGWFFZN/YHtlcW9eRJdWCuMk4yvFOhH7h4g6?=
 =?us-ascii?Q?MBk9L6fjlB4EHHo/OCJ5K2LGhI7fFpifDj552mVvx0bL9+z+euoADPYerWHw?=
 =?us-ascii?Q?RSbCc394v12JYZy089kPs7aYACOm7KowBCCq8To6ECS5KHH5Kq80LKzDWOmo?=
 =?us-ascii?Q?yLW/Uam8QA0gM9Z0/xoczilYLr7+CSEztfOPBO7kq+VAPI35pLf5q36ex8yU?=
 =?us-ascii?Q?zFZzInsLTtmErgQYnhYlwVYbJYDzzMzApZH37nBZEeM6T214GIFW9eCm1dE+?=
 =?us-ascii?Q?XNeWKk+/kOhBAj50GKg+7YcMhbgzAstLXhUaO1SSIV0+gAUvwY3uFrpMMubn?=
 =?us-ascii?Q?7PP/0BfjQombLHkfOe1dt1cdtspOxyumsinfw5/XwlV1V9f9mZkyTEvJ6KqN?=
 =?us-ascii?Q?zm32yvU9GWx0PSDaUwKLh2Zwww+rx533Vt14mWDDyFvIcHe5my2DM2VSw/7g?=
 =?us-ascii?Q?WXRc1SftJCsqkdvySiXW5icCHm9+OOtViUMas9adPuUM2EauZca50JjsUfJF?=
 =?us-ascii?Q?x3uJ3LRrBV6XF7QCekXgDJxMJ62q1toBGN0NAtrnz5wxlA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4KkkQYXVwsLLiaabgtWFR9XL5pf8Es5n3jH+1z0rvYslQASjid7s+gGBbCsy?=
 =?us-ascii?Q?4n8jK8MIVtdHXkbrByuRIsRM1QJ8Cy7bTAQ6bTiWUdVOsYB7jgYddohIYJHG?=
 =?us-ascii?Q?bHeye3KWaXZWdsmj2OR0bVSIcbCcVP6VJhxcMdOVByZr+p6tpCOITjX63gpS?=
 =?us-ascii?Q?1Foyg4XguyLvaeXVZ+ljFZzLBk8QKffVfwM4uYgJeZ4jNhRinFkXcsGh7R1o?=
 =?us-ascii?Q?HUKVbBUZRQ2Ng1uF7XfwAvyvcyxY22+PrfV2qb8A8qz52ZiPorfbABkyOtgh?=
 =?us-ascii?Q?/AX4q7ZeN6BdLCplIzN3rU0wH5ZhS1jbf1khp+KReirm836BzGIXf4pUO8nG?=
 =?us-ascii?Q?rehUahS/hD6/8rhjGrpB28ufpqyo2AIed4WGCWKh72Hmq2fsAcBsLjryaWJP?=
 =?us-ascii?Q?ZHFU87GoZeTptJ1NuKgNcF0t92znM8PkMUEYQTcSF8xJFOH6zrr9wNto8O9t?=
 =?us-ascii?Q?/mfRqa47OdgX87Q2gA5GyEgaSsBMGenhA5ZjYLUU9w8UzKUGSbCZtIWzswuZ?=
 =?us-ascii?Q?9x1EkSG/WOEoWjherH5MZKwbvjFShwcz+eh14mNFlrkmfS0pv8oFP6nMy8jl?=
 =?us-ascii?Q?t4JtGLi84Qz4rsKdzAzLa8N0l8i4XCB+ZR0jm+K2BJO0h/4V3s8sjNXu3lsR?=
 =?us-ascii?Q?aqyvr3WwuR71JOTsU1ImYrfWuQygiLtRDnCJ5q0xGsc/zWGVLAXGRGp4Fx4i?=
 =?us-ascii?Q?Z5QadYchMehSWEyAUEm9qY2hzaC10O6VwL1plBpHVBbKeyI8KGx569hqMP6C?=
 =?us-ascii?Q?5B/uhUSg8zVl8pXcDmGB7ljXut32IycH5M7ZrMW72PQQLjjufM3Iamx373E4?=
 =?us-ascii?Q?WZUdxdU80qfEW1yulyWEolZQGET4eWo2b7UkQqqk4SHIq+B3y/BsnKRctUiI?=
 =?us-ascii?Q?zd/kfzn3a0ExS5tpz4pmFX+fvTaMwEXgcAs2i586yoGFMx2mtRGHaywDNvox?=
 =?us-ascii?Q?qJTvoU1DYv/+uzzxQUx1SGn6EecYrQuBaOqDZLxWGNx1pLXXJo6TnMwHa4bU?=
 =?us-ascii?Q?9z21qxL0wnLf9hx/lR/k1rcDB8CTaWyiXEXbRabLtR6v3eM7an+nGKDNaUwr?=
 =?us-ascii?Q?4uIC0q0TRbnNz+ep4172zqtRn7im3taeAcnAilG0PI+4istXzI8/oeLr0P79?=
 =?us-ascii?Q?Hmt6bdz//PQlU+GheE0lnhg0MRsoVuMEuouLDSLwY9LKPdRnPCn9eCyTb0b3?=
 =?us-ascii?Q?F+tFd9tp0LRCSEwJhNaioy+geiJKveBrmwGhILuNhMpELHa2g/6v/jpbJwZ2?=
 =?us-ascii?Q?2p7AZLCqCzaKxXQClEsk/B0Ao0Za+nRxJhjjTbMkxB8CMVSjKUtljhp3hpgU?=
 =?us-ascii?Q?vmHRt9BcQ8aOWvJIjfb1CtZu0zBTy4ThpBbeUAzCzOFzhW93u+hZymXejAxM?=
 =?us-ascii?Q?pLYMoj02Q7dIvECb/yZOI6DL7Wu6JwamggArB6Zs1envzGr4RL+K7mMEU1LI?=
 =?us-ascii?Q?T+mlRZHSkpixok1u7sa96mAkZW8Yz4LuUOVvbJKe0v7UUH5I7lUJ/5+nFDpQ?=
 =?us-ascii?Q?SpbFQkhOlEQoqGlS3rikCo0Sf0qsqjla3jQhrdO03M6FiZUvxXPoyq+QscZR?=
 =?us-ascii?Q?RdqyrC5JAm4icyA/pHF9UqtaQ1/RYr9QrQvX3ZbL62pJn3av8qbagw5ROtUU?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Y5TiKDa85j+hkWsSPWAYh8vTWfRBnYLyEtmcULKTdKQLYx5ui+MH/0JpDXp0jxdKV3K7zNyRx7qA7iNNWH9ECswcX5Q/o29ZFIE19QFn31ctNV4A1ErpdP5dufFYIEWH+0ivXMR+atI1YXIZ/db5BnzLht2rIi2TjRMXJJXnS1pOxkoLCEe9XlHSjlnmPHmCzJYwB9Q0fs3u8Bxpjzzo/tpX0MAtmfiOQadW4jlXMqAKB1K0/JRVn+yqiH8umTo8xyHjD7Q3NqWPGpnPDFpd+oRe2wukzxOvniLqmloLwGcesaW2itlm2FBmZ3KF0YiXDjv9zcibOeIYloxrgIwFaKxmn315tUFdM81pN/VhGKzWOzqgdMUkq8Gx2EQR4q8QNctaKSoGQ2qQkasv1VyT0H+CEhCGMK8mwyH/kFgTEzLgcX3WEaRlhTNDQeW332Tno8snCdgjJY2u9ExF425vvxX/vJW+V9QXkarOPd5C0rQ7+GwEpXneayJrDy4ys+bd5sa93WLWiUPtwQcLti94b6fc2FRgaFDrr5SXUgjhlDIcQS60YmyUvR1OX0ROhNyB50oWIgUVUUpMwwuLTT2UbIBKks2ALfR0ZHqTlALbwJE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92dcb9c-7a4e-4b6a-fe96-08dca75f3439
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 19:24:12.0807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPHXG5Pk93NdKP4YRTI2E/3pIDgp7Fdhc4U6ztnFNUCBjB7oat6+qnVmt+rd0WOJDXT2m4bMI7gI5sfTn2L95QVC9PwE8/C0zOUZWN1gTkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7803
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_13,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180127
X-Proofpoint-ORIG-GUID: 8-rGKr5piPXzIBqFPXwPhjztldWj1SFC
X-Proofpoint-GUID: 8-rGKr5piPXzIBqFPXwPhjztldWj1SFC

On Thu, Jun 27, 2024 at 01:34:29AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_pid.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 7c7d7e30..996543b1 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -833,14 +833,6 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
>  
>  	assert(pvp->impl != NULL && pvp->impl->provide_probe != NULL);
>  
> -	if (strchr(pdp->prv, '.') != NULL ||
> -	    strchr(pdp->mod, '.') != NULL ||
> -	    strchr(pdp->fun, '.') != NULL ||
> -	    strchr(pdp->prb, '.') != NULL) {
> -		dt_dprintf("Probe component contains dots: cannot be a USDT probe.\n");
> -		return 0;
> -	}
> -
>  	if (asprintf(&probepath, "%s/probes/%i/%s/%s/%s/%s", dtp->dt_dofstash_path,
>  		     dpr->dpr_pid, pdp->prv[0] == '\0' ? "*" : pdp->prv,
>  		     pdp->mod[0] == '\0' ? "*" : pdp->mod,
> -- 
> 2.18.4
> 
