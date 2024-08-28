Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722651A01CE
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876249; cv=fail; b=Qs38l86J5umkbdOFY1NySrz8YI+7aEB1vU0KT6ZzTj3FcY+GJsjAol1X0CQFqyRp4H8fZJAW6bh/DhWlYws9bjU1KJphyIEvv4AomEQ24hCEKelodA6hTSKmbj2H3aaWrX8X07dDi30jAkWVYqmf3am6CmRdWsfdITPfiShEXXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876249; c=relaxed/simple;
	bh=HWSaCySCP6k702FlxehVzriJW1W2OoCNYKvqpgK3l34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TplQn/bPgXwhy8AS3UsgrGXsYFnNFoUN3AxZ8nCykH079d/nqWkb7fGV74uw/TLX9LkYCdqQMZIWssxz+CkzqulRMwlvS0xzO8WYyn8dcOCldguHXNwCXqHWjV+mCLGQ0ng+CkeyOfHAMBc3gzyUb4jAcSGkV1oEQo1rsJmPCt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kC8swQZc; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WLJ4Mr6i reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kC8swQZc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WLJ4Mr6i"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJXZn8026022
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=kPUGhS89UzTPnpm+16iUEfM/7uFvXzQAJpd2dc2ZRuA=; b=
	kC8swQZcXat8H/ZoC0ZiSRb45bp1dQwXY/FzJrYhze9xiM3ecRdSsOXH7fzsl22l
	MZNNqsSZY7wqALCW7gZRC91ol9+S+XGqcoxQ7Pz33apweKfm9nHukbbJBka0x1MJ
	SDDa3qhHgFn3ALyLV7ZbDooCSxSlyvyj3s/33qLboXPYVuFhMuSc2sa6SBumEzWH
	2GoxLUy4CADq8TcGICWlKd9U3G8RgKRldx4u/VmihVc3jRwyMwHoME8l3NyvhxeV
	lsbP5V8t7qF9q56EQ2UJ3dUtXhZ46BLyKL5a6GUWzc4KKS7VlDmvNWnRIUheMgHH
	br5nX8M3AfXNA1yr191x5w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukj6d6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:17:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJns2K036544
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:17:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jmang7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:17:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIltnpuevKT4NxmWMv+4J5c7MCKK/oMTACQTxJDKmT85VTTa5y7lQlVAxMDDaqSBEv5RhSqY8dqQNXeuLaSYS/lRjylJhj2qA8DtOxwFwFfRxOfS4I8jUZaGFdkGkzjIV/mrM31w9OhKp8k1gnJ2uUWU5wPPJJLlTKtAPBFRnB0cQpUkWEucEh3XEuRoO8iS0/XpJ4WyYw0Ia+4MErM9yFB07XLEOVwAL3QLLXolwwVoo55AeH27DKfAf2QZf8klduPG+2r5l8IbkWZdgPAz8BlLPSktkVwpceTwJSUzoIaiV3BbAbgrp9q9nTizgURwgIgfH3pAhfipHj13Zn18fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQs7/OVerzsx7b/cf7gFHOND/KDk0mOpSKZffxah1b8=;
 b=wO3xN+fGykOEoplqfxOIj4zlWgkyCm5Y/ow0bxHb2QTZnt6PKSM4aydWpLwAipnu+v3YyJ9CLM0KRNTZDN5ywru6BoNbLjHhm8pLsa0iZtoZMGdaauPs2b6wFpFwMQTYC2l0Trw7yjhx8Mu4JSUtdIxHEyvXOXhUh0zK296SR9YYD4YlXYZvjZyi0dhesgOp4aToq0my5W6UN+fJIT6wAdUcyq4HngkcvfxW4WY2PnMN+RwKYzbmErRpgKEBNSk297iDgXseDVA7PzINAGw0CsbGX/tynSFGexbRclk2/DIJ7ZPoznOM2pKCW0583rNa5zYyGwSa1TrzRh60Kf9Fgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQs7/OVerzsx7b/cf7gFHOND/KDk0mOpSKZffxah1b8=;
 b=WLJ4Mr6iSmTPRt6UBJcZj4ny2S736bix4EyFCyoFYaFfkzqCNgekTVRM/aDwoEKbPmR2u/r4kFOaaei5vOjeUSdl7iZdqwCEZLCNSp120yYWXfif9CFuPmMhh6a0+cqn9VBi0Zew6olO1P24ZjvuGsITthNv/CdLZxuZq3PW55M=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH3PR10MB7283.namprd10.prod.outlook.com (2603:10b6:610:12f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.17; Wed, 28 Aug
 2024 20:17:22 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 20:17:22 +0000
Date: Wed, 28 Aug 2024 16:17:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/8] Reduce stack depth if kernel returns
 NULL frames
Message-ID: <Zs+FzkKIbqs6HSA6@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-2-eugene.loh@oracle.com>
 <ZsPVqitlZpZp2lcA@oracle.com>
 <4098cfc6-ce97-e8e4-28c6-b5306c23e51f@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4098cfc6-ce97-e8e4-28c6-b5306c23e51f@oracle.com>
X-ClientProxiedBy: LO4P123CA0355.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::18) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH3PR10MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc5f3fb-8404-4538-ece1-08dcc79e6d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?fWINbbNR+gKOpKOVvVyZ9W+wlHBFhn+dNmOS7W2vxNTcBR3W4G5N2XVKvw?=
 =?iso-8859-1?Q?nW02Jmd8ard1Q+moot5GZ3CP/LClewKn1qw8L6EWaJ923xI/h3rPkQyiKI?=
 =?iso-8859-1?Q?q2r8F5Mgw4hgvFMZOqUAqrVOkcYXijD3B91u/lb9pVSGBZC0MNdT2iWBIs?=
 =?iso-8859-1?Q?Zy84Odg7w1WIAtjqdErvAOcA6UCfjUUNM7fVgyQhOSoJrilWbz3wbAKLey?=
 =?iso-8859-1?Q?mi4netUjo1jxeeAFreCI+GD3M9KbSgnD4dQDeaCc/oqR7gJ4cJVeHVsqZB?=
 =?iso-8859-1?Q?2sh23KGijubUnuej/cn4NFAcUpXisNu6AvlAwDH7C1vUs/iOH79zQ/MVvG?=
 =?iso-8859-1?Q?tVTymp3cv4X8if3A+2k6gI7Ux8MPeuMuSSXUHAdncQCLiv8opGHGIoK7Q+?=
 =?iso-8859-1?Q?6apJn3LdwkpzQZxYzgS4eG6QXxsMyEAz8CFhbp0x1izN8trcuLpxuR8a3D?=
 =?iso-8859-1?Q?3oAi7cU/YggiAJ0Z/Tx2Sn3KZB+Y01xk/pDfrECDcRf6ygG1cCnKRQHQtU?=
 =?iso-8859-1?Q?Avq9j+6h0smGzJ7VP76dYPAuemCUXepAE1L+2z7T4VHQ+09RXeK5Uvqs2j?=
 =?iso-8859-1?Q?w5pV7ycA3e8B+P63CwBrjT2T3o6ca8rBSm414ZVhbaOtMu5GkDK7e8Kp5O?=
 =?iso-8859-1?Q?f6/ejR/07E1MWo8lMjpwJOTw+O19A6sx5jJsDjoelhj9MtG06oAc3kubxg?=
 =?iso-8859-1?Q?Y2jkCMI5CpSmhEKMDbArR1ihMjjWLnPXK3l5CUQZ2bKb88oV9twp8ejKm1?=
 =?iso-8859-1?Q?TeQD0Axx+V9R+1Umt+MECsylJmMGQL3x9WcHHSaudcViGX3qteD6HV+16n?=
 =?iso-8859-1?Q?JQC1ei4U+Hy7Ro+pNTwBT9k39TksxCKBnmQv3HVkQGgWDedrORJSs3lCYZ?=
 =?iso-8859-1?Q?o1d6dFRm+STRHKM7V6VKvDGU8qsh73nTah6RhXX4Oab8XyJhAmV1TcwOB0?=
 =?iso-8859-1?Q?I+8qgWXq2xl+UbPrOZ9Teizwbq8a3EB/zdjdcrlhhkPAbFDNdH4/liwCSp?=
 =?iso-8859-1?Q?ssh2Cd0Vg8VvrslnboKIeZ87qNWfFtnGo5UXfI81AiaahyNGuFjfJJIPlV?=
 =?iso-8859-1?Q?z1V6XCRqOhugYv/wm8ECL8KZOgTgTbcieVkFrDJKOqSuX9OPrd5gi3qI0p?=
 =?iso-8859-1?Q?xjxqBqCgoL98D4F7aGdLMtU0CywYDwvWaBeMuN9FI8Skfn66tIhNlzGfhd?=
 =?iso-8859-1?Q?/pZWi7L5+aE6F03wcZghQjVQt4RCQTZ3rUmOOS6SclPWdQaTRSfkhYqslr?=
 =?iso-8859-1?Q?qS3MNnta2lsdPIbsSRas78J+m5EeQlsF7Inbu+6rGWFFclq/RXPTWm214u?=
 =?iso-8859-1?Q?Mnz3n3QG6s6DFOA/Ts2tELowxzDrqYq/lOj1SAOhY/lpjTtCXDQXjjr9UK?=
 =?iso-8859-1?Q?Ia7tcwza54qtvRAKPkJLQwlsgYfTvZHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?tD+fSjUgOTFX7lhrlhaloMYGPArSUNtvQUDVY95XkMYpWc4gqqFEcxAScf?=
 =?iso-8859-1?Q?rk+d/tEYyMZdZLYKN3sKADDB1u+Fv13/SFyNJXsq5czgjcNFstQO3c7yJy?=
 =?iso-8859-1?Q?rwPaO4gymWIdN748HbKY4axjhatomJxT1eVsU+N2aPZ4MxxVPM4Fpi26Y4?=
 =?iso-8859-1?Q?AFvWCvYXbYUGN5L7GvK50WOIs+W2Zue7xJEdKHniEkT0WoAVcPQnEovmWT?=
 =?iso-8859-1?Q?yCUqhfVd4H2HaZLnd1seRpPwqt/z3WR4phvkyWsQ7ZpXOZAx7akkrvzqd5?=
 =?iso-8859-1?Q?lT0tCOdL5dpjgXafdStORvK7Chf/wbNit/EcPHWMUB/GdQUV04D1vN8tsS?=
 =?iso-8859-1?Q?rUF1FMtvYo/PNi0CkFM5xj9EOAXfHQMqSsuPMiKQn0KjG39l2jvkFikoR1?=
 =?iso-8859-1?Q?iWAuIu7yAfPE5gJOBM6aXPD0r07iAC3gTz/beWTIRqOoZVd+PykB+H5XLR?=
 =?iso-8859-1?Q?UursZOkG28f7/2u3Nhz0TF3gLBzIo73wNxHfvhX8nTYxIBTNh43jiga+NO?=
 =?iso-8859-1?Q?pJq66L3HLTcXxE+U9VkiAuJDLDP7EZsU3sbKXru8BxlOsHefStbzTYma2K?=
 =?iso-8859-1?Q?NG6dCf+9gGvLyIp/6OGz/pBsWV/tkktUt5IMM8yspR7/VlVTOPJ+9WHM9f?=
 =?iso-8859-1?Q?pRcEnNv6ggBtVEX9V3rB5K2VqM9QjJKGYdVUC1YsuWfUXHxvVHeu8cUw8R?=
 =?iso-8859-1?Q?O18H88aA5hglt+2YoEWGFcLXjV61+phQpsx4KTND292HOHY89SRmXl+qRK?=
 =?iso-8859-1?Q?LXdeo7Egcj4xuyB+1e/lDGF/A9dqiIYGli6dQi0PGAWI77FnTXhxqLPDMw?=
 =?iso-8859-1?Q?GOZid4VxPmNNhWGmPnrYUYtpUQeozS0FNrDV2e4igMRSl3DICQ8rLpE2NM?=
 =?iso-8859-1?Q?eLO2oQqoaaRoB6jOPaP86Dmuhu+gHLwgMKYDZkhC3LYy0gCgll7E9y1p7m?=
 =?iso-8859-1?Q?jjXZ4YdhjG++xmmbobeXVkNlccMwEXZEpOObxxS5/LBBJpyyCQQsgOJq0H?=
 =?iso-8859-1?Q?7J7LaGfWgiOYHqs63yGCvzA5BuQh3jGqnEXrZAMD959qUxRm97AdbyGjx3?=
 =?iso-8859-1?Q?uCoIfDUxZzBwqnQQHQunwla/PHCcrICO/Cx/bh+XEefCrAtLA5yqi6lBIP?=
 =?iso-8859-1?Q?wCvZXyc7cdYPWJAT++WmsPwz8grNrQTLEDVFKOIe8J/Av5ig92VzDKWaGF?=
 =?iso-8859-1?Q?suHB/1yZifIsxxHDfoN6N81rvgSC+CtOQQ+wFBlFVqkuj9+KRljcoCA/qL?=
 =?iso-8859-1?Q?T2wM7S4l6Y82Y7oIQVb4GTP2zq47UHIy9RiVW+z/wJwBolzDh35gVWCxcY?=
 =?iso-8859-1?Q?Zil7wClmjY7uJud78lAS322YByIlXp6/jr1Lcbn6GQcyI5CgV1Ika9N6QW?=
 =?iso-8859-1?Q?mvK/gjnZiNZ1iBN8OIwfbpDY7Hc9J6XzM1wG3vaEj9z157SEhN7TtOSTA+?=
 =?iso-8859-1?Q?1wXf9RX+oFu7I82KMDN0lnfo/cvufsv2vK1LWgpVwYONVKuNAq9mMWn6/f?=
 =?iso-8859-1?Q?zxM+fgvs6tUz3J3FmZS9qwco8clJ8HVZmWeruHxwkh4UaJiywZ7wSj1Q9L?=
 =?iso-8859-1?Q?tJ1iyysK/9nKb8v3exs0c4BG8gB/niVnXgv+ges0/aap7ivXE5vNTpKEmt?=
 =?iso-8859-1?Q?XReNHx7OCANlGRK7aaY11wdG6VyQCjsslD/0QP+566XeJsxjFrVtj/hw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wegujiH4y3+C+F8N/f0pREZAbJwSmqupxkM4GfGmG4CL8KdgVITKf5+8AdRM3W0CuIr1qnK41vlje0nAzhXJl9MgXLsW59gn28rEiEMuziwe2ZCDUYyWE68nJvGCvq/52uklaOloi9F3ZeaDCG7SMDIVm5zoc4ERIBou9P1CPQmLiPftjmOtzJKaTNTISw2buL4v8LctDj1ZYnOOD0DUgn4RXLuy9nGEp3SFeGPt5DQPuTYf5J4SQBbX9YWLXWuvL4qop1DI4CKoP5JO2e+EBiQZdQmOfObBE+PPpa0skERRFxSeDDBDQljFYhpDS+lnPyvl9jXddRLnlxKRzm8gCdDl7/evGR7KU2QVLNWxSsrZmgdSgagaqbFCfsG8wYAAn1kCvBB0oxFuuikHwbQZS9tg6nPU2ctW4TU4Hcbkz/lwpANL6xo2FO0q2jVNUWcBpld4F/tJ8UBTwQSWgHqeGf/Ar4H5dDReg2fRMEdq8r3Ts36xzBcZaVJA6MfbzQPn5CkJdN2OH0JzH6yNQ8uXzudMRiri/GXBstEQ1gMdAx56s9pHFM4Y7RZC5spe1HnWXdwcoUuB40uM4qGfMMm044L2DPlyTUpNOeDNQu6Zt4I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc5f3fb-8404-4538-ece1-08dcc79e6d05
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 20:17:22.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmwPnhaQ8SZXzmymIXtNtdLpSL7L9R//+JEb2biqftiDB8A5tUTJeM6qQwAqXjiDZk/Kg4JBx0tR0gSnHxlhjg93mQAJkIgeVVjWzQ3EG8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7283
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=632 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408280146
X-Proofpoint-GUID: Hem_D-PsKKEO_RF6pDy8_q2EcFX01NiS
X-Proofpoint-ORIG-GUID: Hem_D-PsKKEO_RF6pDy8_q2EcFX01NiS

On Wed, Aug 28, 2024 at 04:11:29PM -0400, Eugene Loh wrote:
> It's been a while, but if I remember correctly it's actually just the other
> way around.  That is, to make stack and depth consistent, we're forced into
> this "depth reduction" patch.  Put another way, the stack simply does not
> include NULL pointers -- there is no way to remove them.
> 
> E.g., let's say we have a buffer of 8 pointers and we ask for the stack and
> get back:
> 
>     0xdead 0xbeef 0xfeed 0xface NULL NULL NULL NULL
> 
> Looks like 4 pointers.  But we don't count them.  We just use the return
> value from the helper function.  If it tells us "4", then everything is
> consistent.  But for some reason (I haven't looked at the code to figure out
> why), it can be 5 or even 6.  So this patch bumps that value down -- to
> attain the consistency I think you're asking about.

So you are saying that the number of values that is actually filled in is not
consistent with the return value of the bpf_get_stack() helper?  That would
sound like a kernel bug.
