Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E08B3B791
	for <dtrace@lists.linux.dev>; Mon,  4 Nov 2024 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730733989; cv=fail; b=ECPW6LLmQGLzI/sXJt8BCsbthrgXG9qh60lDRa2zjHDk6j7ELyyyS4TYG5AX5IAP8kk8f7I/mdYCS/4wK/9fvnP0ODey6IOdJlAtknWM+xyyJFgt2sQAmRb52vY47yTI0ve68Jgmyo/Xq9mLO07Eq1ZKSlg5lDb415XNrHK/f8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730733989; c=relaxed/simple;
	bh=xEpqzA2DdRzU4ZwWfTxZ7bVDhUNbdIKTDuq9zhq0ano=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=qR761gNSCKYrqKT0Bl1b1y47apfvWuRwA9FGX7sGWI0hI+P4VKwu1S5iQSAtIeYHzXe4XpFINM0/DG94EXN4XTTHR7Mg9UI1KAGBdtp0bfh+aXb1+gyNALfuF6lRnKLfX0y2LxEVpUeU2M3QfdjxIN0qYpMDoen11a75B2savxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D64obZGW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sBGdTvXh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D64obZGW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sBGdTvXh"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4DNqii023920
	for <dtrace@lists.linux.dev>; Mon, 4 Nov 2024 15:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Z5u5V7WP7sEV/Uo5iC
	TNIoiokJDkHsbpu824BUlL9GI=; b=D64obZGWyHimAI3vEQy4Afm7FFSVf9kOnO
	BDoS4KGjxOk2qcaS2K78Uf4YqiQ2uzN5vhFisKZQS7g7V4B8bl6kS0l8jwVgbHHY
	H+yFzFbwqcf0TNc4tXi+RCPrLK5ANwbdNVwJBukGCP7x82AQ9yJZf60rk5arxjUJ
	jSy9kVYUHVm6XuMtvitfG8T0bv0wLG39b96h3iodkZHkFssAmX5uyz1vFZhoOJpu
	jz1DHRasICQErLnachSkUSyFIRarnVl9xqxJHJSZzV41TlLHUVpJv2XR3wqIp1E1
	lXka+RjguYsDgXNhzQvGsfTUNTGQW28bK51n5j/HHuTnHWyoPacQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nbpsjxuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 04 Nov 2024 15:26:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4F0MZB035609
	for <dtrace@lists.linux.dev>; Mon, 4 Nov 2024 15:26:24 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahc5gf7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 04 Nov 2024 15:26:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxC7/EV79TvKNZ9crMbYpDxeM/K+Io7FEcw/irvh0Xq356myWEBJ1Fy/SFBysL5AKpDSixegKzcP/wWyF6fAJ9BjcadQv3qHuqXYlIc6A7DF3EOK16qzYEElWoGLvOVQlI9tB4DJiS25XbTzrln+6gnyd55zPMRtc/plg9q8mZDxwNwR/sWFjKXcApBFP37dO1tlHcgtBVAUaZXuLxPNNBQiTYVYCMZQQET1K5A0GYucBCn5kTJ9NVa1FDc+swFa3ELGLbztsq207S4+0T3OzzqYjgu1g8Fxtl1rD8A/n8C+Tbl+uxQUf01w8K9axshRWWFobCP4VL/hV3+TJPgCVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5u5V7WP7sEV/Uo5iCTNIoiokJDkHsbpu824BUlL9GI=;
 b=zJFG+Hh5J4L23m6JRpb0KeveLBieq2lJGjAt1YAw39yB0hENfkz8QvvJY01pWWjajG02V+ndlDvciVFNfqq8I9m5GZB3dPBc4DKiHuPwKggq5BXBKmKE5xpHOAS+rWXw+UKQx5T9Zeq51ZfA8VWEou4h/B3v8Fl77huGB/IXBIaj+9zhgLWNAxmclajTl7ntJ2cvd34Gd7/W9DAQWIKLQKkqvNbgjHwRT9RE07+W4DT4LkINUqsr3DH3rjA5QOdWflMOZteJoLiduBXt/luLPJAa57jmDiut6zcZuUA8hcFoCd381L8gbqLVLzrwOOVgB1veUbet0aVqG0nuUcdIqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5u5V7WP7sEV/Uo5iCTNIoiokJDkHsbpu824BUlL9GI=;
 b=sBGdTvXhJKqm2h8nLaxTflypouQUBhHumTz9iqfCIw6kotvER4iDaZ76LNw5ItQCi6mIuuqiYA2GCz/RaqoKIBa+k/btRVp/cnHWkLDYVZvC/yk316cKVwe3NatHll+/BOdqYzQsYsFpIPgOI0q1cMMUN85zMiJqRg3UTVn2I8w=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by DS7PR10MB5038.namprd10.prod.outlook.com (2603:10b6:5:38c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 15:26:21 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Mon, 4 Nov 2024
 15:26:21 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 1/5] usdt: get arg types and xlations
 into DTrace from the DOF
References: <20241101155712.397674-1-nick.alcock@oracle.com>
	<20241101155712.397674-2-nick.alcock@oracle.com>
	<ZyVoPD2QmbcoA0el@oracle.com> <ZyVu+Z1Q7IpckIg3@oracle.com>
Emacs: the Swiss Army of Editors.
Date: Mon, 04 Nov 2024 15:26:19 +0000
In-Reply-To: <ZyVu+Z1Q7IpckIg3@oracle.com> (Kris Van Hees's message of "Fri, 1
	Nov 2024 20:14:49 -0400")
Message-ID: <877c9jhvfo.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0635.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::12) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|DS7PR10MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b2cb4a-3689-4f44-083d-08dcfce5094a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7wooZlIGkft2lgby/3JlgXPfw/eTFNl03NGRxYu6QKZbqzDPeotEKMwaF3SE?=
 =?us-ascii?Q?jK/mQFikb0zvZF1d5Fo9o0tBdjNxa/JQqvmBMzEyXpjezZ11zXDIBSJAMDA0?=
 =?us-ascii?Q?M2iBS/v+u+VPwmouqZMUYHdrmFqmp1Gr65f+nlgy1Qz/1/eAm9Ekf8+NuJCX?=
 =?us-ascii?Q?o1Op8G9fKzyGIc+/jLl6+WPYu4cIEqFrsc2OGXCP9lPNUIgNvSN9mHtVuW44?=
 =?us-ascii?Q?LxEPEKTwxmVLAnS0qsb33RrpQkRyFkr18oqikeTwSdap8Z00UrMRBHXAIQZR?=
 =?us-ascii?Q?dwfJjjGdk570Cq9SFoormaeml0atQyBSK7NRx7xaH7fgNcRIbx5HlXRwQ4Y3?=
 =?us-ascii?Q?l5yCy7g0kvE8Ji8uaOAMrQS3PRnP590bmoh7IfpIC95m0EgeiXakp16JMP1b?=
 =?us-ascii?Q?z3IprcG8eAjCABM5JnDb/TX/Uwgh5lDLMi0q1BIiGSwZFOAbZ0dwmTSYI/5F?=
 =?us-ascii?Q?RXmtsZKQG6kQSf/4bsK49Dk9bLJTXYoKY/rabqiOi9u7NGhZ50ZcWrKR+tRh?=
 =?us-ascii?Q?vG1RvbDKz1hpnvaS8i72ZH0wY4wytLPz73fCgjWpwohGuTpK/Pc2D4zwON0k?=
 =?us-ascii?Q?S/ApavrkpKqes6z82gos0EXMAA/YU0WihHHmqf1NOPrWJfNekb3bFKSJLabR?=
 =?us-ascii?Q?jRBzt38dLkde4K4Yy9DyPuL6FpZM5wL3OFMnOu5anMS3vupbqOG5GeZf63rH?=
 =?us-ascii?Q?6IsvdsNdycc7hNb68TGvkhN7aUon8H4QbsqKEXs3vJGBF2PVwXfJ8Ed8Y74n?=
 =?us-ascii?Q?zHUvuuJrS/qII2vBUWs0Qt9e07wuGKA1I3tRS0EwLrBiDEUjHNV5sekHK+oU?=
 =?us-ascii?Q?3s6BGjGeR9i5gCzgzaB62yu1hwDQAgQic2fJK04ghxkt3V5UG949Sxhh0eTv?=
 =?us-ascii?Q?f0fYsby3P4yIRgMnRUuwbxlnneDD67OhK+CyKCUFpgch01d+byxIGVwsjjHP?=
 =?us-ascii?Q?9SsBaXYZwmDO3gRk4Npvk3YwQTflPIbMP9FmEWQs6uCKOkCjjEJBairt1oPV?=
 =?us-ascii?Q?Ex9eshfQ505zNquejQaA0TbqW7m0h+nEZ3BS2u4tKtJnwHch/zGhHDIhNGRE?=
 =?us-ascii?Q?owL7buKa0jhum/rBawdS39Fk6rHq0H1gzE4TVXl9FjhnAMUB367YkFvEMOZq?=
 =?us-ascii?Q?KRVK1vZZNmEYbL4KueI/mHp6spotr0775f/KWFF9oG+hZLZAAAIzh2kRsswd?=
 =?us-ascii?Q?aIccOf+a88CZ6xrctxD8EtjtqfCoqd91CYPBwE+stZp0Y3hT6S5c8eCGfl48?=
 =?us-ascii?Q?mUEpmJjgbwSp2yL2g+EVkxYswnl8VYZIN+aeXIeWnuR8IpCrv066kDLarHf1?=
 =?us-ascii?Q?b2dol2K/xF6uTT74Gk49ojPM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+TsCCvqYga1v6REQDpZgCSf1Etn3P2mtwtykfibZwpDG6HLrVSP+AEDmb/sM?=
 =?us-ascii?Q?UF/C7Bd8hn8QZMP6k6vB0Wdu1Ft/sC+hRqwO5+o5H0p4PYtvY8OT0nZwUWqQ?=
 =?us-ascii?Q?PyngvCBQbHA1ufqUJpOkwKTtT4EgNXf8JZdFs6O9a44fK5+hn+JN5/DcAcmG?=
 =?us-ascii?Q?BBrLK5oySJcMfGUfPJ5c+UQ3fKnUDcUJDtjp9c43WZITXf2a1dbfWoM6OAew?=
 =?us-ascii?Q?4e5lSVFv37avqMmNBbb4xEICtk3AFWhJDjwkvTdmQrYh3hpsKVeF6BZodeb3?=
 =?us-ascii?Q?tNQbAm/Zne2l4rm/HIyRRu2W4lcTnWnRExhfo9CviAV22iNIetVCv8QpG17A?=
 =?us-ascii?Q?eLUQZ4pwCkWcxDG9abrJBw7HUvvkOtrqEYDLNe0PZRzrUj6lfRY0NWoYzym4?=
 =?us-ascii?Q?qzoBy8DDyW2ql7AsyZZDHVe64n33k+svU0548Yz1fUlyT1RVndOeqXCKszHo?=
 =?us-ascii?Q?WiOyu3HEmdSiuRVhN2OaSxgrEc8Hho/nESrMyhobJK3DRRab7tT9eJUEWuR5?=
 =?us-ascii?Q?Z2FpttPfF6RAW0gnEr/nFKWaGCXJeMvAqVRdrxOB1lAc93DJjW47aO4ipuXF?=
 =?us-ascii?Q?ddxw2aKwlxRoL7hviC/pylwONuxvnyq5CiCzdWh7VdjX7oWwXPiOxsPwugT1?=
 =?us-ascii?Q?wRaNdvMjhpWm0Q8L8FI5EQ3XRshVsooWVbji2qoWcC1HyMSY9yvJoOYyjj22?=
 =?us-ascii?Q?MNCKuPalyRDt2J8mr5zDqPJ2Ewtf3MQADtJ47ORhZLYKnMvRwR2ly38glWOI?=
 =?us-ascii?Q?dV+FQMw9hd52D9JW++JZbUT7Q3mphewbUsI+9mDFI92VDs38IQ3Q/z4suCn3?=
 =?us-ascii?Q?4hjCGpBoeIvIe6XY+A9zqCUc28LmOX/XP7ab1VIJ0RXFbDcMtKzcgwoHlFTn?=
 =?us-ascii?Q?lX/bPhSWCDu00xQiaavJqnxusB8+xSwZoqkpTRB9XTU/+4gxWDAWeYlcHk0h?=
 =?us-ascii?Q?q/vWJj2AhAbMz1YvYRZJTuUPtnz49BIwqh8kovy3NN4nnCIIaZ7fU/Zkr8s7?=
 =?us-ascii?Q?Kn2b/ilNRL0B1ZVk2TtMwC0UKE4VHswgQXPLbE3E/CaMPtCRkxv3r8dD02T9?=
 =?us-ascii?Q?CZZ0BDcyNOsxZ//KhHUXZMjzc0ctinIQZpXt2ZHQcKZbKGnwLML9yFp03FmI?=
 =?us-ascii?Q?Zlru/IM89btXSujh6yV0fLmI6AA9VTsp2NI+mZGirxTslTmVHPl5srpV6IKX?=
 =?us-ascii?Q?nHAMK8bjCK8+dxvAvJZjXLXx9alhjpWyizb5lSXPFMQ7n6u+ou1xe8q3XugJ?=
 =?us-ascii?Q?2BqDH+gzLFiEsDDCVZgAywmSKl9Mrmpa/lhAd6REaq2bBMSFYL4x5byea2cm?=
 =?us-ascii?Q?vVPNBQxU4yUpc+isDxSG3ybtJXpQ2H7vvT1uALazqztpYKwTfbNsfw+Z8wfG?=
 =?us-ascii?Q?IlnZ+Un0vO6ZNET4zwRfUGHBvdqEoX/0zgwF5LT6aXnLgwadw8BPoUw61EWE?=
 =?us-ascii?Q?h4JsLj3tJB69IZDIuaamxxLEigpvItHpuiB4hIu85R8Na9XQQdzo1LyAHvb5?=
 =?us-ascii?Q?LZqqAE//BPWG51rf342qqyVQhR127pRuBP1Rv0mSLeMeg259+99kuq7dsBjX?=
 =?us-ascii?Q?D9dW5++Bxjuo33dar8sxe+cu3657fr43oO0sM66wDOY8VgbADCs2sdEIivqS?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZfKxp+Ix/3dHR6Mw2PQqq9ykDA5m0Pzp/N8Ao12TsDxWpKj4WqBUrzQop6zkmUVy/heJc1sAoKJLWVdbixPrPN3vpo8jDt9aYKkoYW9Xrf0nAJMEQP9x8fOGrFvNtrrdtU+9ls8i1qI7ZM5p5/x0RSWUTWQ5/vtLBRyVt2I7bbBscQeQ8JvesxmveZu8ceuLTL/8NkmVCi8QKoXx9ixrih9VS1ncFcQrFExMVXkiipmPJFICDKp3Q9+kLr47bKC36ufiY7mahBzrRnUxYDW0P1gSuNBd8MWex/nS4fdArFOBnS+gdCjyAsQK/dtdYIjBk6r1L963Xgn8aIMF0TR9geIDZFOh3mLm9H32ocdkgZa59Xl9DvL8LiTSETX6pJEoxljD0gX/UlPlwstlP2zOdUUTG1SvrLGMVbKR2Z8mYykWnlSQb0AwD/kYaijSIuYCpUOAsJOzmBxlUOh7vzD5Rqpl//rNc12woyOWD/yjgyGPlrhidXyZaDpN7m16hcVupQBxtsTInaVgKVfdYp6fZijylhwTE6giBr8z52daA7CJ4RnfEpEK9fgnG0bn6xLB8xvSz0x/ioD/TmtJjcnTD70amYXPwUnplpj3pohs3Mo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b2cb4a-3689-4f44-083d-08dcfce5094a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 15:26:21.5149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRix3wBqKvBAY6o9hXE9cyLtkyNNk0VjssZPIos3CMswR3DjdQnkfq87GaczBdF77dTC8QjppcaKk0SV5WSuig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5038
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_12,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040133
X-Proofpoint-ORIG-GUID: oRURW5p7jtyER4xJMnmcY4rwgQtU84s0
X-Proofpoint-GUID: oRURW5p7jtyER4xJMnmcY4rwgQtU84s0

On 2 Nov 2024, Kris Van Hees uttered the following:

> On Fri, Nov 01, 2024 at 07:46:04PM -0400, Kris Van Hees via DTrace-devel wrote:
>> Two comments below (one tiny thing, and one explanatory comment that I *think*
>> I have a better suggestion for, but you may want to rephrase it).
>
> Actually, another issue (see below).
>
>> On Fri, Nov 01, 2024 at 03:57:08PM +0000, Nick Alcock via DTrace-devel wrote:
>> > +static size_t
>> > +strings_len(const char *strtab, size_t count)
>> > +{
>> > +	size_t len = 0;
>> > +
>> > +	for (; count > 0; count--) {
>> > +		size_t this_len = strlen(strtab) + 1;
>> > +
>> > +		len += this_len;
>> > +		strtab += this_len;
>> > +	}
>> > +	return len;
>> > +}
>
> What if the strtab blob does not contain enough strings?  There is no check
> here to ensure that you do not start reading past the end of data?

Then we run off the end! We rely on validation already having been done
by validate_provider() (which checks all this stuff), and if that is
buggy we crash and dtprobed restarts us a few times, gives up, logs a
message and rejects the probes. That's the worst that can happen.

We run in a seccomped jail specifically so we don't need to worry about
things like this :)

>> > +	if (dhpb->dthpb_nargc > 0) {
>> > +		size_t	nargs_size;
>> > +
>> > +		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
>
> No validation that there are nargc type strings.
>
>> > +			xargs_size = strings_len(dhpb->dthpb_xtypes,
>> > +						 dhpb->dthpb_xargc);
>
> No validation that there are nargc type strings.

See above.

>> > +			msg_size = offsetof(dof_parsed_t, xargs.args) +
>> > +				   xargs_size;
>> > +
>> > +			msg = malloc(msg_size);
>> > +			if (!msg)
>> > +				goto oom;
>> > +
>> > +			memset(msg, 0, msg_size);
>> > +
>> > +			msg->size = msg_size;
>> > +			msg->type = DIT_ARGS_XLAT;
>> > +			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
>> > +			dof_parser_write_one(out, msg, msg_size);
>> > +
>> > +			free(msg);
>> > +
>> > +			/* Then the remapping table. */
>> 
>> remapping -> mapping

... I swear I fixed that. Fixed again.

>> > +			msg->size = msg_size;
>> > +			msg->type = DIT_ARGS_MAP;
>> > +			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);
>
> Is there any validation anywhere that there are map_size bytes to read from
> dhpb->dthpb_args?  Is there any validation anywhere here (or in a later patch)
> that the entries are valid (between 0 and nargc)?

Yep! See above: validate_provider checks all of this (you probably
missed it because it's done under another name: see the end of
emit_provider for where we shuffle things into their new homes.)
