Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B1230BC9
	for <dtrace@lists.linux.dev>; Mon,  7 Jul 2025 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751907226; cv=fail; b=pHUlxGk2ocjqPN6tobDBzqQhz+FtdWD8vME+EZo/G6Q4T6aU4quCUNFjoPLEHPSOD8jJxzR1xpte+hqtJGMuxyN0H0Ngo+OmpcDxQs5C3E79CRGW8zo3yY41PUvO9XVvS7N+OzYPK0nUwhCUFDjwWYnEwH2+Nei4Fgl0XgkQ4F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751907226; c=relaxed/simple;
	bh=trxp9Ngmht7B+jQXoaiBokCJfO/qHACMTXiY8FaBtk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q5XBSwft7+oQrWxbCRR80hf3Y820vOjXpSTXX8VPje5caFkFEzBk+ubZ0sS1YTXhFPuEKio025svYSE8xUQkw/6SPkW6TAk6YulVwIm8TD4TYMr+xPGCBt+4IwnRUn7odQIQ52jKfCH209tZbbyd7aV+HcztEj3JA4STwEYaGnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JSNntMvW; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mMLeX2QZ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JSNntMvW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mMLeX2QZ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567GbPBs025261
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 16:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=SjhhSqWSqH4imwFP+IhPFal3HP1MGAKYtzO96Q/9qdA=; b=
	JSNntMvW4nhyr8X4zkhrr/a9DU7wx4ejPsAqcjKRzAyahc8wlLd1C/L7EU9rbEIz
	c6Nvl1ALmLCAEBtgQ4c3ioiBNA9ZhMuFGnhNo7vVjR8TqpN/UVjXEXMSlwUk4hdw
	eJv2EsmSkIcnhkVQsRHLeHWHMRaNn5+xuum+ZOX74DUD/v4B/yvMhPyzVrZUmO6o
	2+mRp060K1Sk8eLb7VmmZNQtuSpwQObLkjOdzlCzEQAHgGERyWxAiK62lX4et/Nv
	qLKVfSDzQ+H3c4nvwWmY70rw4ocdjxNIA0xGwp0IfeLUDsAl1+n9TJBfoCnLs0Mr
	G31iKmDSvT8If/lAI8ikqA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rhwmg1d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 16:53:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 567GHUQ3021542
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 16:53:43 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg8g3pt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 16:53:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVGRStik5V73IzeF3oZsyQHPjjOXhW90fSuHCQ5wFZD0+M2UZGsfDfeotAY6+ULxq0JFAsG+SAUftGoQH35fj0du/JUl1MUpkgb1X8RUps//i9RoswL7TnzOhThwDYEobXzNbWl8+0fmH6hw2AUfGHhxPGfZwv3V0OeP1gS9HEjTbZOPa6a6/ATDsdi0BPEf4Tvlr6EdQDOeh7/6z3GxIhHOOAzy4Cn29Rs1d2baJTIN9r9AYGnAXu8FF1EtRnnsqhKSUj+IcN2tRwjP/pTeU/RHdEEw8p0zBpG30q8Spd0BpCH6TT+t1dnFQlyttUhws8n7gRvMiM35XPfwb8jaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9j6JclrGmeu3+kBE/5R/02Pw++n7w36yCJZuZgxWao=;
 b=Hip3LnTKBAslQCEmjYE8PeVarbVxFvasM/s7W9HvHIQ+Vk1gZ7Zm9c6OtAWa0OWLcuSV0i3n7evwmHsTVDKa3iiyDd/DzplGSDPxk+HrGx6G/dB4T1K6bm7gUxImq4qVaL9mbcRgjnMXGA2xWyVjt9S4afCGLCvt0MxxQdlH1kA4ERoU1jrANhRoWy3PIRKTkGg8vWqpdfeZfQCuZukefsSmENSKCjuMcvrJciSFT6oTaM/SPoxNWlRdvsr9oh8HeGLNcdUbOkbn04yduY/obViRXcaQqv04m6BBTWVIesn/gcrVIUyc9VpSGqH7a/zDPe74XfR3nZ4hmTMFvKiMDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9j6JclrGmeu3+kBE/5R/02Pw++n7w36yCJZuZgxWao=;
 b=mMLeX2QZmsMF/EUUiddy7+TTQYW9PnZfR6eGATBPUNGm8a1rAF8mZMMztH159Kd3JnROXjq0KEhtIuIkpepRxmX7JNawIDorsXCtve5EWgvmizHzZrnngtWXlAwx0iFP2K6zBaJuLilz+Y7z8mf218BUgAW++RxruiOcJSxR28E=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH2PR10MB4359.namprd10.prod.outlook.com (2603:10b6:610:af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 16:53:40 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Mon, 7 Jul 2025
 16:53:40 +0000
Date: Mon, 7 Jul 2025 12:53:37 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Message-ID: <aGv7kQqlPZt6Kmw6@oracle.com>
References: <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
 <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
 <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
 <aGbLTOzqILN+3J93@oracle.com>
 <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
 <aGbT+p0DjRTFl7Oc@oracle.com>
 <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
 <aGbvQAmqsLA5+LaH@oracle.com>
 <aGcF67vQ8M942gh0@oracle.com>
 <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH2PR10MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b23795-007c-4f7a-7e08-08ddbd76d30e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?4kc9HulAo+NmcqnIak1NTl4SiqaorJkixbl9WDM78MTn9SOGQRheZJ9dMv?=
 =?iso-8859-1?Q?XOIhaa1qbgbFPPHzl+uL8HlHh7zCcc2ro6sjnXINLYfRcG77T+SAeElS4y?=
 =?iso-8859-1?Q?JMer6HaIlpHAF35pq1xTKtsdxXe/1YbKGaQRL2TrvTsoeeg0nFC/EaqBIg?=
 =?iso-8859-1?Q?VN64DmIMxJIhtaX2vrp5JbjfLQobTHuPN2C/AuAnBzbY+LZJ+36pgWIXbB?=
 =?iso-8859-1?Q?oJDt6+aUYrfgdy8zm4YymdAQ6uA3ik9v9g/PnbqMCIVt2SDRoBnZsC0JXL?=
 =?iso-8859-1?Q?BlVCu9lU3hPgUJQUsFAYcq+ZkRJoXfGY0xD0QeVKTo8HHzptmXQuM/cxRp?=
 =?iso-8859-1?Q?bDiC7r7t4P6yPNIhb3zhnzEHoOSMa86kFpMlqEHLCfFQA3Dinvigm70GlO?=
 =?iso-8859-1?Q?r9LZNLEuiCpQLusUtqm+2Irkx6N/qwUGaP2mhgoI0vflhwL3PAN2+y7R54?=
 =?iso-8859-1?Q?byKgXRQpmhuKvJSejGR2jDIs4fFJOMGX79krsJNURqAxDpB9WGzRP1N4Xh?=
 =?iso-8859-1?Q?CtLD+DZI8+MBkpeFiBAyKAXENicBnEyxYlGJWchA9XsQEXBztkfgPSoNMP?=
 =?iso-8859-1?Q?uVUa9zlx5zHK4vzC6FLI+x6KRTAcz7eny7u3mVuY9rO9rvAlJMgVawredM?=
 =?iso-8859-1?Q?oUehK7C7zEH2X/z3BjLg9xHVVGjqEnQmSR+dTK71ZmTdaicMs9ltH3u9ti?=
 =?iso-8859-1?Q?F48wvz/FaARE7Gw/0EcaQibALzYGoJlLypN2/L126XsSCRlYEdiB7+EJLe?=
 =?iso-8859-1?Q?YhUzhhjZfqCJpTZAPykFpjEJoHSId1Y5M8BTVQvyIAf0yRiKMAjazuLzKu?=
 =?iso-8859-1?Q?W49Ty9XOVVdJ2hxlueYF44+KDZ5YGTXy/UrtVPOmsaBf3zn3hVfmaVIl0g?=
 =?iso-8859-1?Q?16uAMU5Bt3PlnI6JZSZf7LxjqD1IbeHW9LCll9sg0/Q+Yox3KTg+U81Igk?=
 =?iso-8859-1?Q?RPntKGjO24RK0k2+qaTrX2i5781OItZlRS5Ec/ljKDbOVr5x9eSY7fZ9Xn?=
 =?iso-8859-1?Q?PhcCzlCluT2qvMx8EKTZQOpfcMN+eLw2I/i9Lxt7Ud8VhWVqsiAQONtOzx?=
 =?iso-8859-1?Q?y1guQ4wMYqGbLefQRcm5QEfy9ZXwLYfYjTGrz+TZ9mxrezYAP6ZCy9L37t?=
 =?iso-8859-1?Q?J74sjJRbaApvQt8rnVF/sXfwQ3k2qUPnupPpvw/744Dg9SDgg1uBa5TbIk?=
 =?iso-8859-1?Q?FXxbtSbc5DDX8aNTAJ880sKSKpzlGiV5KECq0ysIyVktCTKsKufjjeVXJB?=
 =?iso-8859-1?Q?vQdxk+wCmPLojCu3MAKyRCItzIh6JP7FFeMmKl+s0DqvcXmJ/zczDr7wFv?=
 =?iso-8859-1?Q?d0w6bYYlGH68YQbORakr+0D80Yd6VN42kJCl23Gxo8Z2X3cf0nvz93y6Ye?=
 =?iso-8859-1?Q?fvK7s6nqfC6rqW7wCr8Bb1jwevWzxagORhflwC6eIY1svd94Pn4Wyo5ycl?=
 =?iso-8859-1?Q?Lhf5l+q1uUkmjY4k0e9/WGP/xZJjBmtBbDm4nBsjAxH3i8K4ICqXVdid+v?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?40mbzCliB0V/IUMJKOWpBscWRen2Gfb5v3bQVM67+ddRJ2cOoGiKfTRY5d?=
 =?iso-8859-1?Q?Q+1pnX1Suku5Sl/pj1gE3p7j5yafTDNnsPTQO612UXtHMDFT+D36Q3h9bO?=
 =?iso-8859-1?Q?Yd+Rwfh3QJqkP9O5hT7P7WyJDBKzXOu5P7gNrrxzU8eewnSrL8Rko8m1m6?=
 =?iso-8859-1?Q?HHPejStQaTdzIHkwnY0tPyMJhoZ6B8p5l3xdg2IWdZF0Ia24kAlXlFhkHJ?=
 =?iso-8859-1?Q?OvSikMJep3gQUwMElOilPvxq7kSCLlNmLRdfyATECWpQG8UEIaBfcTtRjU?=
 =?iso-8859-1?Q?Vw1pqYxKEyvk9CfOjy8hfJSleR/adgf5t13XjzHyzdGAC/ru0BjkZ5qHzP?=
 =?iso-8859-1?Q?MihsRBx+KuwrAKHCjBYjtx7gzuypWLvrnjupD14Yo2WPRoIyv5SiQ3gRwH?=
 =?iso-8859-1?Q?FI3igrntnAtUpnQ0FDMG39MIzSyKbfNmjwwfa73aO+AUnNpDNaFcEth/Cs?=
 =?iso-8859-1?Q?g5woP5D4jEONzAz8o9owtBbEP0EI52xa6PlPe0Mizjgkl1rOpk22r6kx4G?=
 =?iso-8859-1?Q?VuUna6yWm/maFpMWwElFeJtJQB/icQgANVD1x/h/MENlikXo22kbg83zgB?=
 =?iso-8859-1?Q?KL7J0kSHCbp0KYMdEH7NhF3goPDEA54nrkunFgzgyVXLj6+nzZnv5rv+qS?=
 =?iso-8859-1?Q?To8sjRRw6or+1EMhq4fJz0tu7ymXSZHMJp/CDhK9qFI+3iI+ZF+iU7W0je?=
 =?iso-8859-1?Q?3WpUnT+FGb97X+DVNa6OWKUxrjcwJNifZxIhCAVOWM33vGTDChRT0MiX+P?=
 =?iso-8859-1?Q?55mpivCTQfbCZn8guvYjRh7lt8esGoD7UjRgH+w38FDbkMfcbmtfn51xF/?=
 =?iso-8859-1?Q?ouq0wFTs+hmapO+7nV/Wg5EPe6V25UUjsqwBZAvTKHpOc0uXsxj4bE44Sq?=
 =?iso-8859-1?Q?Obqc8ltK6Ur5P8aUk5e3NFKHMUJzRxZGhisIuZAWLEXxLJPOtypfd6IdYD?=
 =?iso-8859-1?Q?cXMB3cZOYdPVA7oCVOBodxxYrTPQkV65oYEM5K5j/DK+evkA4EF56okTVC?=
 =?iso-8859-1?Q?6+HlICX1Q1T9SLtFqHbQLtmsfGxiKNegZQ7/jMqP0RIcnPcsQSazuHA7ii?=
 =?iso-8859-1?Q?KTYjDcn/sJDRfKb56MwPsgPkFciDpfjya0nSWel2ZVld8LtJtXrob6erq0?=
 =?iso-8859-1?Q?7ZJSSZ+cKqS1hbIUDjsi5zq+SW3SaHi/Ac84FldQ+UEeIcXbEYCu9Yhf2A?=
 =?iso-8859-1?Q?IRnR3GNsV5ITvwJTYEpux31mwNRN5S79qyACI28OLo1hPM/KuMfT3LF+Mz?=
 =?iso-8859-1?Q?Vb98C+/uxnPuGhlFvHOF6B+q0MnuprGId4EpYMkkvb/ljO2nubO9zUGlfJ?=
 =?iso-8859-1?Q?DloI2e4MaD7uTjBfFuInwnM9vfYhR8ovyDZjl9kGsTd8JzkesL1upa66HF?=
 =?iso-8859-1?Q?Um7odzLbnjP+AD00Pms3pY8yowIG1e11x4GJ/Q5GscqUK9AaVP2acWFhda?=
 =?iso-8859-1?Q?VjAH59foIAlpL3mHbKQ2D5nFGrjxHBehMGiqddsdhXSfqhFTNxwoQs7IPZ?=
 =?iso-8859-1?Q?evxVHYwCfXJQzAkm8A9vbrqaCKjwHteVPVdIkrAGmKPFJj75u56MK4NUBH?=
 =?iso-8859-1?Q?hTQ9p4cHu0RVAOK0n2lFS7n2SuIYnl21e6SJ2o+z6V85p7CKNXIrt7PyX0?=
 =?iso-8859-1?Q?lT1zRlNy3y+bwtE5LEMe93DZ3tMmfn2vtJRBcQOAiCBuYW18HnEMMMhw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s8vVXMoC5WpHC0CX7W81XNljsioMcZa1bRK0rxaa5URDKcE+Q34Hrueys2ygU/HS+LInKMUpEKl40UwzmZsprFjPmX3AjRbrQZF0014ZItR4LeSTRiPDX6AsTAO1oiMmuAiNfcjTBhM5TPljhgxNZInYBWxhc3PWerU+D2R570uhiVrkPvRQXXVDZgumcWbDt3UeKzlMJMsiFSC1pfeF/UW3EzgYe0R5c3AexsC5wcBugh+71L75CA8OtlcJjm1cEFNtZfogvE4OK2zvIh4wMHDcIUaIdTsWDrkC7dDU/fvWk+RsTVEdH8EMcBMd9JqAlw/52PovF7A2KS2v2HIFN2wF/g2a4t249eLOfcvwJ/cqbFqLd+HTRAzTXYZi0lEzBMdhO9JbKWxeZmeQWfLpGc+hy1+sxHgxEXwSSqyy7QcWaH/9VxjDTy97hb8yrPJq02L4ftYjreq1kUAwfs/7XKwuhl+I7WTkMEXG0iXWL/EDba7PM+PtxeU9617pwYYd7yvEktxRznTcw26McGcBgsOmfqRV1/V893f1AZN9lmu21KSpCosThW9ii28cA5TfLsesRgxMstaMoMBT1N2YZvwcLfulUo4sP8kA5GQcxpM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b23795-007c-4f7a-7e08-08ddbd76d30e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:53:40.2027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4ajStlnd0D6EBIBPEpRh7wcyjX8CxtRGk6DfWzii21UMCcOJ/ZC8WVsxE72p6hbUXPz4u5gjV+xvdgnkuPEiIDZRtG2G9LmZtYk2bgbFiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4359
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507070106
X-Proofpoint-GUID: Y1cmPlJMlEX0w4bugwXfkJN5MdzKKh3e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDEwNiBTYWx0ZWRfX+XW81iwY0fwY PtUEH1lg4NiQdkUnveDXnOBSiD3x94YAIXrB8UeLPTl+1fZt4CuN2ALB637BGz/5TyLNZMgC6IV z3FPYX2QV360DFydOtqFV38vx7BReUcGeQKD7Ge+U5QDJqDwkGChFWYPSI30WEXKErm/nyFTPOe
 46OG44yq1JnyNEBrJelr8GxjgNTFfToiQoKSfeT2s8+E437hzEAVY/ur9/zgYsPHQelDKrN/n7X acMx4Ozb9Jp4IyQYM1Xbt1NrkVaRMVA7fm8Uj6lCKPAWZOCS6o/3fFn8AO3DIC7YH/h8SpZNtCX w1X3N5etdReCNUAq5rYvsUcSANek3IwZcrOX+KwSb3EppU6PdoX7rmdLZegx3DcPkONymeyGU+l
 GZwwywmRVVzRGzx1clzr76RIIWiduPx+TfaTZQhWZ8+lBoCNlId1V7xWH5CryrcfjSaUjrIm
X-Proofpoint-ORIG-GUID: Y1cmPlJMlEX0w4bugwXfkJN5MdzKKh3e
X-Authority-Analysis: v=2.4 cv=Pv+TbxM3 c=1 sm=1 tr=0 ts=686bfb97 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VFYlf-sQXAEEEpTC864A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Mon, Jul 07, 2025 at 05:32:19PM +0100, Alan Maguire wrote:
> On 03/07/2025 23:36, Kris Van Hees wrote:
> > On Thu, Jul 03, 2025 at 04:59:44PM -0400, Kris Van Hees wrote:
> >> On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
> >>> On 03/07/2025 20:03, Kris Van Hees wrote:
> >>>> On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
> >>>>> On 03/07/2025 19:26, Kris Van Hees wrote:
> >>>>>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
> >>>>>>> On 03/07/2025 18:06, Eugene Loh wrote:
> >>>>>>>> On 7/3/25 12:59, Alan Maguire wrote:
> >>>>>>>>
> >>>>>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
> >>>>>>>>>
> >>>>>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
> >>>>>>>>>> patch 3/4 feedback).
> >>>>>>>>>>
> >>>>>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
> >>>>>>>>> send probes?
> >>>>>>>>
> >>>>>>>>     dtrace: failed to compile script /dev/stdin:
> >>>>>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> >>>>>>>> inet_ntoa arg#1 (ipaddr_t *):
> >>>>>>>>     Unknown type name
> >>>>>>>>
> >>>>>>>
> >>>>>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
> >>>>>>> need to add it to the core set of typedefs and add a type for a pointer
> >>>>>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
> >>>>>>
> >>>>>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
> >>>>>> this I believe?
> >>>>>>
> >>>>>
> >>>>> Unfortunately the #pragma include doesn't do enough; it just defines a
> >>>>> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
> >>>>> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
> >>>>> typedef to net.d and doing the pointer lookup/addition but that doesn't
> >>>>> work either. Seems we need the core typedef + pointer addition or we hit
> >>>>> this failure.
> >>>>
> >>>> Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
> >>>> you should be set.  That is what I did in my priliminary tcp provider impl.
> >>>> I do believe that works.  Either way, we use inet_ntoa() in the ip.d
> >>>> translators and that works with that typedef in the file, so this really ought
> >>>> to work.
> >>
> >>> Yep, I tried that in the v2 patch series; Eugene hit the undefined error
> >>> in one test and I now hit it consistently for all tcp/ip tests
> >>> unfortunately with "typedef __be32 ipaddr_t;" in net.d.
> >>>
> >>> My assumption (probably wrong) is that the include of the library does
> >>> happen but nothing triggers the pointer type generation for "ipaddr *"
> >>> in the CTF dict. If there was a way to force that type generation at the
> >>> .d file level that would be great, not sure I see a way currently tho.
> >>
> >> Well, like I said, it does work for ip.d so I don't see why this would be
> >> any different.  I'll have a look and see if I can figure something out.
> > 
> > Looking into this more, I think the problem is simply that you did not sync
> > all the dlibs for the various kernel versions with the updated ip.d, net.d, and
> > tcp.d files.  So, if the kernel on the OL8 instance you test on does not have
> > your change, it will fail.
> >
> 
> No, don't think that's it; the .d files that matched the kernel I tested
> on (6.10) were synced; the use of the 6.10 .d files was visible in the
> error message. The problem appears to be around the fact that tcp.d uses
> the ipaddr_t * in inet_ntoa(), but unlike ip.d (which uses ipaddr_t in
> translated types) it does not have any other mention of ipaddr_t.
> Adding an explicit cast in tcp.d to the argument to inet_ntoa() to
> ipaddr_t * resolves the issue without having to add ipaddr_t to the core
> type list.

Can you reproduce this at will?  Can you give me specifics on OL version,
kernel version, etc?  I'd like to be able to reproduce what you see, because
so far, all I tried actually works once the ipaddr_t typedef is in net.d.

> Further debug logging shows that the actual type addition happens in an
> order which can cause potentially cause problems in some cases; for
> example with the above changes I see:
> 
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/errno.d
> sorted (1/2)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/io.d sorted (3/4)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/ip.d sorted (5/6)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/lockstat.d
> sorted (7/8)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/tcp.d sorted
> (10/11)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/udp.d sorted
> (12/13)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/net.d sorted
> (9/14)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/pcap.d sorted
> (15/16)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/procfs.d
> sorted (17/18)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/regs.d sorted
> (19/20)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/sched.d
> sorted (21/22)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/signal.d
> sorted (23/24)
> libdtrace DEBUG 1751904270: library /usr/lib64/dtrace/6.10/unistd.d
> sorted (25/26)
> libdtrace DEBUG 1751904270: typedef processorid_t added as id 2147483677
> libdtrace DEBUG 1751904270: typedef psetid_t added as id 2147483678
> libdtrace DEBUG 1751904270: typedef chipid_t added as id 2147483679
> libdtrace DEBUG 1751904270: typedef lgrp_id_t added as id 2147483680
> libdtrace DEBUG 1751904270: typedef cpuinfo_t added as id 2147483682
> libdtrace DEBUG 1751904270: typedef cpuinfo_t_p added as id 2147483684
> libdtrace DEBUG 1751904270: typedef time_t added as id 2147483688
> libdtrace DEBUG 1751904270: typedef timestruc_t added as id 2147483690
> libdtrace DEBUG 1751904270: typedef lwpsinfo_t added as id 2147483695
> libdtrace DEBUG 1751904270: typedef taskid_t added as id 2147483696
> libdtrace DEBUG 1751904270: typedef dprojid_t added as id 2147483697
> libdtrace DEBUG 1751904270: typedef poolid_t added as id 2147483698
> libdtrace DEBUG 1751904270: typedef zoneid_t added as id 2147483699
> libdtrace DEBUG 1751904270: typedef psinfo_t added as id 2147490324
> 
> [edit: following typedefs come from net.d:]
> 
> libdtrace DEBUG 1751904270: typedef conninfo_t added as id 2147490329
> libdtrace DEBUG 1751904270: typedef netstackid_t added as id 2147490330
> libdtrace DEBUG 1751904270: typedef ipaddr_t added as id 2147490331
> libdtrace DEBUG 1751904270: typedef in6_addr_t added as id 2147490332
> libdtrace DEBUG 1751904270: typedef pktinfo_t added as id 2147490334
> libdtrace DEBUG 1751904270: typedef csinfo_t added as id 2147490336
> libdtrace DEBUG 1751904270: skipping library
> /usr/lib64/dtrace/6.10/udp.d: "/usr/lib64/dtrace/6.10/udp.d", line 10:
> program requires provider udp
> 
> [edit: followig typedefs come from tcp.d:]
> 
> libdtrace DEBUG 1751904270: typedef tcpinfo_t added as id 2147490338
> libdtrace DEBUG 1751904270: typedef tcpsinfo_t added as id 2147490340
> libdtrace DEBUG 1751904270: typedef tcplsinfo_t added as id 2147490342
> 
> [edit: following typedefs come from ip.d;]
> 
> libdtrace DEBUG 1751904270: typedef ipinfo_t added as id 2147490350
> libdtrace DEBUG 1751904270: typedef ifinfo_t added as id 2147490352
> libdtrace DEBUG 1751904270: typedef ipv4info_t added as id 2147490361
> libdtrace DEBUG 1751904270: typedef ipv6info_t added as id 2147490369
> libdtrace DEBUG 1751904270: typedef void_ip_t added as id 2147490370
> libdtrace DEBUG 1751904270: typedef __dtrace_tcp_void_ip_t added as id
> 2147490371
> libdtrace DEBUG 1751904270: typedef caddr_t added as id 2147490380
> libdtrace DEBUG 1751904270: typedef bufinfo_t added as id 2147490382
> libdtrace DEBUG 1751904270: typedef devinfo_t added as id 2147490385
> 
> 
> Notice that the ip.d typedefs are added after the tcp ones, despite
> tcp.d having a "#pragma D depends_on provider ip.d . So it seems like
> the "depends_on library net.d" was honoured above, but not the
> "depends_on provider ip.d". Moving the core net-generic definitions to

Ah, but depends_on provider is different from depends_on library.  The
dependency on the provider means that DTrace will not load the .d file if
the provider is not available.  The dependency on a library file affects
the sorting, because it indicates that the given library file needs to be
loaded before the one that specifies the depends_on.

> net.d alone was not enough however; including the explicit casts to the
> argument to inet_ntoa() (to ipaddr_t *) in tcp.d was needed also.
>  > Also, I do not understand why you removed the pragma
> > 	#pragma D depends_on provider tcp	
> > from tcp.d.
> 
> Yeah, not sure why that got removed; I'll add it again for v3.
> 
> Alan
