Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF573451
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721338114; cv=fail; b=ZeXDW5ICqkHtI94x9ruY8O9r7WPKd5H34M1xZA5koktuD9moRc0ijKK+atrC6P+FQe+WZnezE7D6eDd5wpHsXVmz5+LUsYOoTU9R+PXln8WL+Cgo3U4TIqhJOHEB9hJAS+Hh1fqoRq/oZIvePyM+YNV61zX2vfKzPTa1cTKP5hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721338114; c=relaxed/simple;
	bh=mpzRL36IW+LsBBGTBp2RgIk1lf8c/AKF4IrxTnVFai0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UNdlh7/Nj+b0L+y3lWQnAvufDSsHwiZtLTRufKvkiCFrWIpJlo7dRPnfyvt19omoHaWgUAVJWGLQf0hvIbDlPeEC9//Z3yFxYUn2O67QAUdhepACCmV7vQBI95F6aw4FVYcHxUKZa/j7BLO0G9jSRatdEL/Oq+frPbrTcbGVmTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DwBGKbZ1; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mWrut5wb reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DwBGKbZ1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mWrut5wb"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IL4J24010451
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=+GlAN3rlYbAeo8UyXaBtSbGyzC4iJoRytiIanYNq1V0=; b=
	DwBGKbZ1U+OIe1AMTmq1mZ4J7XBnPfgnm4ejtbDPvF2/QO6FiiegkrVyjtglpj0E
	bKIbrdjePjuo7tgSGWQ7E/b+wxLbVEhYGccZplph3dXX9VSW/gzQn9bbfqwoL7vU
	bMUd2WKA7+BzBpZ03JDhZlygSF4d6Riz827GmzBjmFZc3NQslfY7ZCIKMLm9Uym+
	FtQYbu5vikeJeJ23+BEdRCYlkJC1Ls5cpvL3YxwSEj8M5N7OmTChsADdBqWrlZhn
	0ftFXN/dFXKHD8yTD1R48A4Qe1zBEMnPr8z3CJbDu8YBh8gWuMXkjHMmcSKfEADs
	QZbobBTYQ4+n1kx85D5HlQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fa52g3v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:28:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IJoC2C021815
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:28:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwev5qjs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:28:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNwVH+GbfOIWI9EU7SpY0ijluyLh16jvuCm3xR+P8yFiZBOygsD9GsU3aa6hLFDdy51dXvKpZnn3Y95iVISisJnlB9Y8O6+tWetLmztptjjznybYcnp6jzZAVU+i5ewy9yYElVUGnyTIxZalzsTRxUbtIPpLM5XfBn4UZlXnpxiI1/LrasAqMfv9bXwfsPXuB8wmZd+pZVWS2XLokuJ1rbMOOvmj9l9XQrfhLkVukYkKaL3X21XgcPG0q6rwXumu7y28VsJIPSquQivjnV7/1dglABBE8zAAQJUK9hQu+yj7g4ToM/JRZ3veFWdF1dMZi7VGB6siBWh1hxcUnIWoUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgKmDDi9l1Xy5gAs9Mh9Lr4fYpQW+Nhbxhf4ySbxVKw=;
 b=GThdcaslRAtYmKpwhv1FiQ1PZZPaAFNqzmfAz1MOAIy9h5KeRSVd+A3M+YAzdQki4zcFLuwS1/Rhu258BejCMvXgpvGeLgYkaljqKrUCIsk8qfGB2dqkKmwHpIJ91g2qGuahz0q4dSvjI9A/XDqSH/EMXX9xS7GCbPfFNKSFATcLVVEWo4mwFWxGPftVjdnnsnp/Nvqd3o5Z46ymJdHWDGO0nGfxB1Q0CJcZV8l4Mdv2KwOeMNhltCvypRQY7uUS5rExXq0BRV+esC8Lv9m6f34y1w12S6raMjzSkX+SvM3qCQVuzN9ZJsoXt2JyId6H/B+yk+pY3jUWGdVldjbfkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgKmDDi9l1Xy5gAs9Mh9Lr4fYpQW+Nhbxhf4ySbxVKw=;
 b=mWrut5wbtfcyq9p1HpS9ACXiR9sB1/0soJaKJfmcmiaovF+5lyG6jX/rVXBr7SkPtvTwfSShaFB6N5BcdAOhH8DdUSBeHVBeGKVbhBZ2JB0z/w9CgTQvTURQpBsYFs8gju2QYIm7zyDzqmLIvXFRR9l9lDHDsLV6+aVkx5pg31E=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA1PR10MB6121.namprd10.prod.outlook.com (2603:10b6:208:3ab::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 18 Jul
 2024 21:28:14 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 21:28:14 +0000
Date: Thu, 18 Jul 2024 17:28:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 13/38] Hide dtrace_actdesc_t until it is needed
Message-ID: <ZpmI7O/iYc9xaWz2@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-14-eugene.loh@oracle.com>
 <Zpl00nXBgngkAvHt@oracle.com>
 <4518310b-abf9-2e8b-e2de-8ad358adab00@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4518310b-abf9-2e8b-e2de-8ad358adab00@oracle.com>
X-ClientProxiedBy: MN2PR20CA0033.namprd20.prod.outlook.com
 (2603:10b6:208:e8::46) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA1PR10MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: e96267d7-88a7-4601-0f6c-08dca7708840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?RPZqHoUoEypEFKwjY2s66LMclv9DIr6nxXzNV6Jrs//mncOPpN/gqjQxM7?=
 =?iso-8859-1?Q?n5v09PLWmAp9rUXtmaABvh3pwCuWnOTMY/e1tIFz5ke+jXTM3R2gm1tOeG?=
 =?iso-8859-1?Q?wXK4zkg3umAaGwF8DlNto3LChNdgZGJxlKMGSJF/pB3gBd+xs+p1aH2oZC?=
 =?iso-8859-1?Q?q4ZxjUqId60yoNc78TYg1R1bO0jM5dUEZytijxFtrtVd8y95EUeDs6Yl1S?=
 =?iso-8859-1?Q?wtETe0GI+2UTtP1YM/70ujB8Cs/Lg7hyDUBysG8bA+xqRzunlDvxPzklCZ?=
 =?iso-8859-1?Q?onYGFX0NV2poKq3zGHYolgyVu9vzH3C3FDGWtsfWnQRQ5ig8FNNgubzF0/?=
 =?iso-8859-1?Q?SaPbHeAg6hfvTinrjD9/L6urJrFxhmc5dluQ1GM793dNmDVstlpF5ZyUqo?=
 =?iso-8859-1?Q?IPr7GiADSIBg8UOQqI1vFIsnzMHmPz5yk7+MivSePXCEFMXZgmVdHlbVT8?=
 =?iso-8859-1?Q?5UDi+r7mYqhNFlZGj/ujFA33uWP74fw+aSa2nAwzcXzBHWrxhTIDBYeDvb?=
 =?iso-8859-1?Q?KkTmwe5mQyEyF4M+d35F7oyOErxd2yjsHLAleF/gg9Wc66/Sc6wu4LPV7R?=
 =?iso-8859-1?Q?ZvCdPxwercc0OO09vBHGL6Tr5Q9KkiN7MoePY378cJhmpZLmX1gYfv7p4k?=
 =?iso-8859-1?Q?GcvIQH9xjkw71tDO2FVgqqy6QSIoqJqYB9mpzPOgL2/hbwDl6SQGpnTQti?=
 =?iso-8859-1?Q?tmwXUfCE7wjg1jVyv1DpopccKPZt3tPfewUlf+bZT77die97CN+eecBdPs?=
 =?iso-8859-1?Q?q/BuAazIyEGepBxB23pF7BMMZP4E/elrXZ8DlEVrva+pgmHmyFk7l8tTqf?=
 =?iso-8859-1?Q?eyDhltNtgactP16xYGDLuO0DeSckME+fUgZcVArNl5X/0QsRISnH5b479c?=
 =?iso-8859-1?Q?vvGL5xxcybKInBDo/zDNZgSh6v7DwH0gjZb4AC/YsTE7/XgPfTIWwQ+c8J?=
 =?iso-8859-1?Q?Tqt3935aSP8ebmHGMOcKB4LjhdWOR1EYsGn/N3wC7eLJrYm4q/9jZ8eO8Y?=
 =?iso-8859-1?Q?BQ5GbetQ/QNUgSGrhfHmrW04FC7/h3Tj8xr4WRJ7v5Jnzt2Ic+OLXIgaoE?=
 =?iso-8859-1?Q?VLvlmJTYdPaLxkfl2ETsttF4w5rUcrbBeVkDV83KAy9sD5zgl93k5U8RJo?=
 =?iso-8859-1?Q?grN/U7/INlnd0NyNuOibhTU0seDTlmi/AsaRXPKH9MGfcq7JmLgRN/xMpg?=
 =?iso-8859-1?Q?IdAly+EO7x/HWj0GUk2jPRIEBp02Ikbs1ggjJMGPnegfIi9rAQC4uscpXb?=
 =?iso-8859-1?Q?HBiFgppXX2+F4a4u0Eg29GVrEsurwehEw/IPxFX/6YfY+4GcAK+QysbihD?=
 =?iso-8859-1?Q?hnTDTbvaIqs8gmWNb+KffmeQiXD6Q4TMnhatFI0MyAgc9WOTC8OaCFXwae?=
 =?iso-8859-1?Q?0O1A2N+qiAMBKAWUmg909WnCBJOINoDw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?EVytl1Hx8itZ43G2EON39K3Ntg5Mu8MkayhO5p8B1oeykppQKIMG959dJW?=
 =?iso-8859-1?Q?GKnvTyYSQW9hw7+YKIoyX3IHUpJELi6KdUvdkEJgdhCSyr3Yi7xAxjeyCe?=
 =?iso-8859-1?Q?vndqSwmIBAPm+hS8Z9fJ+LeQFM/PtEErOvR+1oAwUfTkqiVw5WCaWX6K/m?=
 =?iso-8859-1?Q?nohKFaoF4N2bQEntQmgevWiL1ZFVnUqqF5t1E6UhqSqfCkYH2Oiec6qRbq?=
 =?iso-8859-1?Q?rUyyo7MK8dNs8nj3pSmqymYK3hDmFJ7q4vCpFz0TYBTD9M1H3Iyq8MYkCQ?=
 =?iso-8859-1?Q?bBX05UDda9fB8eYoZTZXC1cIW2f/SJ0JH15GLlwJ/k5MlnDhuYhW3n/Ltm?=
 =?iso-8859-1?Q?dznfogA65m6SsHE9iDcskq9qMJp90z+q3/s+7rSYKoSe31vQDjGj2dHZMS?=
 =?iso-8859-1?Q?h0lQmadDhbTCFPMnPOhsGyFutdD5RYKWqaCn7N2MWeypU6KY8Zy3AYbfSU?=
 =?iso-8859-1?Q?TVg2mAumOK1kr2IveOuNCAtShSze7jN/RJY/kUj27i4Vw/m6YJLx1ceevO?=
 =?iso-8859-1?Q?JB5JlPypAFBPa/c4mHCAwQ2jasKGazE/r1ywbn//kylli4sMWMeWxkuRxU?=
 =?iso-8859-1?Q?C/qnHcgOajqiXXkVwIpVxMdNsmKOxJmEEjVHxX85AWN5qsPgPoBVV4rgIE?=
 =?iso-8859-1?Q?KYGAQSE/6Mf8DOCKuOth2uUHfU677Ln9cjelU7VMo1v06NNDn0BFFAADPE?=
 =?iso-8859-1?Q?H7q+SWqo5lojR6vMSmjZG8RUG3DBDY1y0Tj0YU8wpCqaFr/yFyOMkmhgGl?=
 =?iso-8859-1?Q?RD9TVeK6du77jlsz3J6Xig2VK8H193AqK6EGznkYQJ8pWqOgK+tWsPBHji?=
 =?iso-8859-1?Q?4G21Q4IMxSGVq0tUQQou4cex1Onv4WQXb7Ko0qA3eu2bJP0/RNjDZ528cD?=
 =?iso-8859-1?Q?RfZ/PRP1pqu5I3xWH6h1Eu5JdLVVx5+VrHL3e9/jJs5/PAZMYuNUzmDjHa?=
 =?iso-8859-1?Q?8UqPN/oJIXKedbAF9WSacfgDtE6kIJYIASx7s76eW+23Eq2EZdZMbDBA4H?=
 =?iso-8859-1?Q?6tXmsMieVennPc9WFUlrPeyz4sv97+xgh9ErK2goelYXHSLLL7qbNRUe7k?=
 =?iso-8859-1?Q?3YHHccNL9HEAYdEl3G/P32iRgpnjGP3PvnMtuEK3g7O880DvxmbmMPD3nJ?=
 =?iso-8859-1?Q?I5pX6y7xLi906In3kt0Uc+c93bitykwWIFlPX6XZwcbIkUYA0wIpPXjFiE?=
 =?iso-8859-1?Q?ixGWxX78w3bz127k8DqKPTdUMy1whd55fJmLCA6lrqf+A9osdCNoows/4k?=
 =?iso-8859-1?Q?BzzsOwSRfr89fVFs5dlSQuBPZJPzw2COq+JzbL15cntEEzdkVfBOWOyHcU?=
 =?iso-8859-1?Q?zrehNOyHZzvpaG88iph4zsvQE456N8Wwq1iDa1+VHZpdsqAlUXgUM+/TGZ?=
 =?iso-8859-1?Q?8P//fcN8B0V3E1Lvb/iID5lXyxSOLknCV5fSS6JUWN4xRglLfHlLupJpvj?=
 =?iso-8859-1?Q?k3rd5wHP9kGHxCqdbxmt75NBOdpZqaqk8Gk6s7hHdkuXg8G5/SsUqGqQeD?=
 =?iso-8859-1?Q?HbyQ+j75aPxN9Cql3NDbL8pp1R59Rxz/bopyE29dQcNSCnTJSnOQCrZQ76?=
 =?iso-8859-1?Q?MoijEI+oENGH0gJ5S50fUXgjv0q91QiK9IU1H1+qLshr3XuKayPCdL5Frn?=
 =?iso-8859-1?Q?CIQ1LCU6/xsMbYxDEQC5DmdrusWMu3YZAZen7AMCi4Xnre1ul/mbYdFw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	K+OE/jdOQDoJ6yFdlA6vhhYwuyY4Q3smAyZqAElTEHzT7zrshr/yv9Fp59Gvtxr4P1XRWlO9vrbp63yIMk+d6gOGpiSbpQfi26lHW4vycXEzX/ySsWm7S1ddgRi23feGe7C8zo/XiwPNndYknOLUPZdgyWW2cWKjtVf+lGigMKsZEOUyROI6pyckgA0uAoDfEZ2qVlVFWVg1LiXfcX0Ih4+1vWrVJ52AL9wRQ6hfpuvRwnd91wWyqIPknp5dnX6Vx1aW83SArhPd4LmZjo/1igkcM744hT5DetD00aX0Mav7Qmq4mikohR4GgpGu/GX/APGCjJiI6DJ0+JS9SsmFYLKv/vpVST09uUEmRSledoxlWIbFwjQEEk6xxZ2TYelkNFRUs5SgzBw6py5gnQHJh0FVyXG3PttdfmWB+twQLwOsOTv5t4rjqQ2cilS4OihGtHDddeHdA4USHNQnnnZXqIXn16q2kTtGbPL1t6geSedHgNfZuORrdBblH07rfdL79DDO6V6xm0zpDrTBwz1QitqM/M0XPudJTnsWkzO3xA+iQn8AHQV61YZzFjkj1aL6evlyEG30oymK00xMAEbpkqVB7Ft9qNB4TfIOfeLzO0Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96267d7-88a7-4601-0f6c-08dca7708840
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 21:28:14.4775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krCW74IZxZRaYJnx7k+443+sHOSn8wGkMrXi8SbKlOCv5xorZ2gqhSZIrPfYWeVJUKEAdqwz2yDKuRuz3bYfVtfR0EiqBbdAywNOLKnraE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6121
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180144
X-Proofpoint-GUID: wHyrjNoP0Gj5AEbKm9urOur_1ZS-NOyF
X-Proofpoint-ORIG-GUID: wHyrjNoP0Gj5AEbKm9urOur_1ZS-NOyF

On Thu, Jul 18, 2024 at 05:06:00PM -0400, Eugene Loh wrote:
> On 7/18/24 16:02, Kris Van Hees wrote:
> 
> > On Thu, Jun 27, 2024 at 01:34:30AM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > I think you should just get rid of it.  Worst case, we can always revert the
> > patch.  But this type is only used in code that we do not plan to revive since
> > we no longer do DOF the same way as the older version.  Even if we were to
> > re-implement the functionality to save compiled probe programs to file, it
> > would look very different and certainly not be action-based but rather BPF
> > code based.
> 
> It would seem to me that the declaration (this patch) and the code that uses
> it should go together.  So, are you saying the inoperative code that
> references this declaration should also be removed?  It would seem funny to
> me to remove the declaration (this patch) while (admittedly inoperative)
> code that references it is left alone.

That is a valid point - in which case I think that (for this patch series),
this is not a relevant patch and thus should be dropped.  Instead, a work item
ought to be added to either get rid of (most of) dt_dof.c and related code, or
to actually implement it in a way that makes sense (i.e. do something useful
and be in line with the new implementation of DTrace).

> > 
> > > ---
> > >   include/dtrace/enabling.h | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
> > > index f1ec444c..2562c87b 100644
> > > --- a/include/dtrace/enabling.h
> > > +++ b/include/dtrace/enabling.h
> > > @@ -43,6 +43,8 @@ typedef struct dtrace_probedesc {
> > >   	const char	*prb;			/* probe name */
> > >   } dtrace_probedesc_t;
> > > +#ifdef FIXME
> > > +This type is used only in #ifdef FIXME code.
> > >   typedef struct dtrace_actdesc {
> > >   	struct dtrace_difo *dtad_difo;		/* pointer to DIF object */
> > >   	dtrace_actkind_t dtad_kind;		/* kind of action */
> > > @@ -50,6 +52,7 @@ typedef struct dtrace_actdesc {
> > >   	uint64_t dtad_arg;			/* action argument */
> > >   	uint64_t dtad_uarg;			/* user argument */
> > >   } dtrace_actdesc_t;
> > > +#endif
> > >   typedef struct dtrace_ecbdesc {
> > >   	dtrace_probedesc_t dted_probe;		/* probe description */
> > > -- 
> > > 2.18.4
> > > 
