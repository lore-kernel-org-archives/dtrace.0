Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664F24634F
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 23:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749339920; cv=fail; b=FSfQlWFdHaPkzu0ZyG5ixjOeMTBPvFVa4f+icQvXSGp5raYnnynmWTDD+hV7ViM6nG8sOWGl/NVwmxlO5xa/bMPLMhg/IRbIDXShU0kPLhD5OS29JDArE+aRZJ/RlzXHX2DLUzlVp/TO4sx9fWPc/MiAtOvsMTfHPflmmI8zt6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749339920; c=relaxed/simple;
	bh=ffIL561/AcbVczbJ8bWloj2XA8U2voZc8kDHiIRKv0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P60lBdce3akvfdxXoU4YbLLfB+oIm41JPuVtEw/l4A1B7Sy54IITpk8NOwA/JW398sooZnJDZPHIbXFHeZra7Wc+Xh0mwih1xnkcECgYo5mc1ol9oit2cmSfG6bDrdUgb7X20/3p4DTt38eldMnrfknlVqYgJfxeokV0DTsFtYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MEVGFLr1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jJG3gtI4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MEVGFLr1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jJG3gtI4"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557Ne2AG000760
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 23:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+8vSJ9TYnI0enjhfiG
	ijpxpt0sdt5BlkXA5WmeO/LH4=; b=MEVGFLr1x1BgkH6mPsttTHUY34/jq2QNro
	hNCOm4RKPnlNUxGsFyRTH4WwJd9xfRnrQLdygzgeEkR8DG9Cf+qaTnbAENax0w2R
	QtQfM0UJOt+mVLjsRHIPBqKw2DP63IMrcwsHvMuEw9dCOuas8vNeHkAfVjhzAGFt
	yxzzkew5WP7WqjlgFuQTpE90XeR6hT6fvszDGVSpmiebXXwCDIahJvZzbyaG7heG
	DNtBD6eCvauKs0DQdfq85/YGxEsZ37lZhiAdVWOz9baM/yDkSzmGrn3fSgy3JosL
	TXU7++N+Hl80a1DO0R15N2abOdM8VpE4WpDiGcYAiaEYMLRLLaLQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbe8hta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 23:45:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557IDt5l003281
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 23:45:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv68t7n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 23:45:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMftoegC8IQLzyOLQW+shUZIQoNJgCgBuT103b2DjZvTVpEBTdUrhrUuuzYoLe1W6cZupblBd9MiQwMUjw8SS08QAtYnQrvt/QgB/oVWOi3i0OfqeCWJIOQfMbfa7AVRoBfTx1lVIBQDyS4/o0LLB2GP1yMrd5G2Yqj6erA5yI1w+rU59UYxY1z17jQrnRZyQOPNSlJJwwS42m1G+cQ409Fxb1pRhh3R76ggflD3OLI6tl7X/a+/sZKi+3dBfi72JeicTkgK6VeYNZ2M4S+DhW5BVJZT+J5I2izhsFuak6lSfwkVsiPHxhvEUhkgfXOp947VO/6xTvMqA4arpLrxWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8vSJ9TYnI0enjhfiGijpxpt0sdt5BlkXA5WmeO/LH4=;
 b=wyT1QmEewUwgtwRWpgi7FAWKjl9Uhx2VB5UdtT9dcEctViOxAY9UPqJ5bVeU2Ael3DhI1RljBOxezqcucqE/79kDvAYD9gaW/6vG01fZSJlwok5AhpXlRONJ0dBfzT1OeJVFzotICR+Klp9eqNEMrlWUDX5wyNv3Waxs4+/t8RmQrGEpEd+8zxv6dzXlUozfQUkhdrPwVdHeJV0lqo1ZhWmY6CWhsWk1WssWp+15aP3Hi+kUjcKv1waJk863ngAzzV6jTtUqLES9jzSIVGRsVPrzvVQ74/11Y6uccp5EBLBgDGR9ktEOwmMNIDAokhcb3PkRaC1FLvutp4s6FPS0TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8vSJ9TYnI0enjhfiGijpxpt0sdt5BlkXA5WmeO/LH4=;
 b=jJG3gtI47+qrB1mSjn3P7By0JVs8XVi2/yK9PDO89VQqTpKWOJJyGE+OoeYniXVNLnk0mr/iCM+vCaOuHajZJGsjDuyTiNrXIfCfd2AR0VdyVO6NYjzyNH9ZV1HGyQUgiOahEOm3233Uk1Fddy6qCPyQbQrRM/QhNvDt4vyLtbA=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by DS0PR10MB6976.namprd10.prod.outlook.com
 (2603:10b6:8:14b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Sat, 7 Jun
 2025 23:45:13 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8813.024; Sat, 7 Jun 2025
 23:45:13 +0000
Date: Sat, 7 Jun 2025 19:45:10 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 14/17] usdt: implement tracing USDT probes specified in
 ELF notes
Message-ID: <aETPBgxJmTPHA+Z4@oracle.com>
References: <IA4PR10MB8374FB7BE674A6BF4DD48B75C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
 <87msajjso0.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msajjso0.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|DS0PR10MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 0805b4da-ccbc-4c64-e812-08dda61d5920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0V+f+7Buu+5DMaMoX6sUq7CRBCw+httyJtldz0Pe4RkHxlW3JONQAvScsB31?=
 =?us-ascii?Q?0eTc5l7DHP/5tUMfpZw//VmBO/ObtFa7er2h0KgY7HQTd0PJLmksaQN12KUO?=
 =?us-ascii?Q?CqGgPqEw97AXLLj1OVVWCa0Ad78MAM62FwFyAQJpSuqVljhmmPLLay42meNz?=
 =?us-ascii?Q?mNurj/DqroLmseEzhxSc/Mq0qB1sh/reOEOoVzFCrkVz1GUqOJHEwgWlp6Gj?=
 =?us-ascii?Q?ITiRNd4qTxrQfJioBbEKTbm2iX5vbEnezFVXqW457jDAiO20lErOE8QojTx/?=
 =?us-ascii?Q?2dnHmgx0rLFg2XRBkMRcOXjWlThn8moIAHaDzyngfqxqQg+NY3iop8172pEo?=
 =?us-ascii?Q?5jN765KPDkd5J6s6Bec7iLrlu/NHLCy7Q6/Ff26rAUmLjPGE8Xoda9+Pp6Na?=
 =?us-ascii?Q?e/TCZ3L9jNiIXGTYRINFOcYdwCz2uZDhYRjzJ5VnZbj1IkoKF7PArFZalGVz?=
 =?us-ascii?Q?cXO1rcEKVFygwVXPT42sDfzX25Whp/KvFB759SHiHNkO0T9VjFnjU+otDjwH?=
 =?us-ascii?Q?1KAnSSaoU5uo5YJNNEgAOlmOLECX1z48NqD+ZOqcIHPxo3On8EwL9ZF0a752?=
 =?us-ascii?Q?WRrZ/TEqaVCZEiMx88bwm/zJhj++KFh8huXCp+B7/B0IXn8i0WuJ93cRl0VE?=
 =?us-ascii?Q?6pyE7XCIHbEwR2jaMGCuB0bFak0DNLzo+nxHG2b8C6M2XEBuQXoD+Yq/pIvz?=
 =?us-ascii?Q?XB7ZMue5cUFrYv1N/BCxB7P5DOGS8VaGksw7TIxOcWl3yfFLZNgjBfpcmtFT?=
 =?us-ascii?Q?YYSJEkUfju6hvlJvaRwUbEhthAv1znWbWf1p3t89yEoStDuARee5mn42ttyt?=
 =?us-ascii?Q?SLrpvHQ9vA+43+8BIou3/46GHtPwsNtpSJry/6qAYOona7vt/If9cdVU5XXH?=
 =?us-ascii?Q?+y2Hi8VgvcOt/5pC0wfBIMTqhalN/Fre8TCGHhUA7paHX1Cd4i50x4GSum1M?=
 =?us-ascii?Q?TU6BrqfO9qu/v8S2x9YWDxiboim9IxkYjxmYIS93DDqPrtZGsyf/GFCObWEx?=
 =?us-ascii?Q?S7nEItwRubEYGRdQsb7l4AulXobEwJlAUUIVCWP78IaWu1uU08kYdml/2aGk?=
 =?us-ascii?Q?g917IjKkQ8vCl0AYnkAKITk/y52wMpno8iqHbi7EEvg4CyBWP0ECKxc6Uu9V?=
 =?us-ascii?Q?dbtGa6g4FzKf90GrgZ/S8eL/BZwK+fDLSyeaqWN5XMva7jCquwfpyAqC2awS?=
 =?us-ascii?Q?T53/apPURZ/1mj+eSyBOGX3qeg3LPc08KZ54Eza/mnC6Vg1BhyPrlr2BilK/?=
 =?us-ascii?Q?fsAbO90a7JvewK2FNcEweSGcltbwmN2kO7ZQfMy06ue3hc3XNkTW0JJkmuRE?=
 =?us-ascii?Q?ss262cU9gLbX2wrq9147FcdObCi79YZk/YbPQ/Q7tZbuev8sJFvsgaB8esro?=
 =?us-ascii?Q?UoAapD9JAO79muBWIm5CktC+P5HDP/Yt+5favBk+PWxx3f0DKeRGYvw5QThJ?=
 =?us-ascii?Q?c1s285i6hVo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wtj+93uUYvzrgR2K4E8xM2zCfp/E587mSnQN2mp78NI3tOYRWP7ZI5KQ37zU?=
 =?us-ascii?Q?HlspIEOBpJlNrub9LyZe5X7RT/KBQxtMXo8e6Yq5CtyY/NeyzBR15d9rjakm?=
 =?us-ascii?Q?QRzRWmUtwLwWbbAMrer49j+3ICWjJIpNpE103bY5ImyQn7xQjAV1P/LofTJY?=
 =?us-ascii?Q?ugO6aAatg4VStAO59XJaySbCS2iKLOH4T9hQgdIMUE9UlyDkB4zTOFm2+Ynb?=
 =?us-ascii?Q?2mju97pAP1gTDs6jOZlqFIXkOquYHICfphTcDEFfa448kd/5+0j2P/w5+bEN?=
 =?us-ascii?Q?uWxQR0BwkLBFF0pjz5R7KsVRvnwRyxNF//6i2x94cGJM+GlRtQGXMRvDneOo?=
 =?us-ascii?Q?R7Ha9l5J6rHR+fZ0xsSO0HD99S50pl4VbQcuxU+nEGrQ/BnYi2+XVrRV9RfZ?=
 =?us-ascii?Q?FjbEefXH6xz5SZ7mKOww231LRbm5T1VtAXEV6hd27HiuMakABJ80sEuEzlEN?=
 =?us-ascii?Q?aB7x/0Tn8xT/mbCq+ZQTYBuDvTgG2jynpT4L3z16glUGDbQDSMuJas0QSyyl?=
 =?us-ascii?Q?2/36ObU20tCfBk8SIMpC1XRhRqSrXYGYZMTAVdW9VVYLBiqDkrUyfbPz2/+g?=
 =?us-ascii?Q?/R5zb4HDykeSFYv4A6r8/CtHEBJXuCDqnJfb4N0eSwzTW7BLrYEtJrrO1Rdx?=
 =?us-ascii?Q?22YwToJne4JZs/EzcVEVSCvPJoUUwnsRC/Lpp+90R/BZI6NHM1nl2nLpWAb9?=
 =?us-ascii?Q?/0umGWK+HXZhLqZFv7uBLUB6Tl7So/qKb+E5elnx/9Edd56Tws8YzoXAP3+t?=
 =?us-ascii?Q?H8jG9HO/gslH9+AfGmoxtzKtSvNZHSXsHU1IdQCM9TRyAjpA6tIRD5f8OL2g?=
 =?us-ascii?Q?6JqGk53SlZBvifU2UF4XY1YZRQRhLhsVQkhIpBuvqD7NJ4F3iMKpGVFSSVsL?=
 =?us-ascii?Q?9+Hf+9RPZp/aCPaXP5Zl+23Df3S+jYEnh/w4O14ARDfkk+TLzz4BuzGnxbWf?=
 =?us-ascii?Q?IKyooe0XIKizRm77ZJa029SQmtKswcNhYKimAsBhCXFkwwEhvP9pk/ZMaHdd?=
 =?us-ascii?Q?Tz1okGfgT5ydH92tn4Tb3veFAck/cEI6I0yRgY8M6sMR5brpM76mtiyoiw1H?=
 =?us-ascii?Q?Q2YJRldJYizsF1Kkxogxca3kv66pQ01fKuqc4sWLktiSGzWh1Bf+XxXLIVM3?=
 =?us-ascii?Q?4nXKvjdSsWoROYPCJH/vBktuYBeCoSkVWIjOOOF/WDIOHdZSE1lJM1oKvXeS?=
 =?us-ascii?Q?qQWhdJSWbh5Rc4ron3MC1a1yEC45+YrXzlnWcjfEHp/Rqjqh6eRtLzlCYVKl?=
 =?us-ascii?Q?JWd8iRUTDQ2tkQROLRFiC954RdMmn4IOK0Ws58JlbMPsnbxB9CO/N/JttKNs?=
 =?us-ascii?Q?ROvNJwkLjjSaNMrneSLGUzT+zKzd30wBENdXntc3Ahr3g7iwFnR6U4tBGsyg?=
 =?us-ascii?Q?gFPcwwUT02wxTMnrrjNv0sc1StYIwaoInXl79dmzo8L/RsDAKq3XJ+VxyjgT?=
 =?us-ascii?Q?nWotymAIM2lj/7rph+Wp3v+bSpzmdXZW8N1oiDzgJbVGwR2e/tAfr3ensCOG?=
 =?us-ascii?Q?l56GwiJCBEqBlQFntZ5ydPuMEiVD33+P8D6obIlLUp6vR34kx++2UzMkIBTF?=
 =?us-ascii?Q?kBRgwqoVsQnUDWeA+NRW3xo/SF7uVMw2Yl9UApgChH4CtKgek4b02H4CtRgG?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CsCT/3G8qDzoJkcrHSeKZSD/5hiM4iSTwZYIdRfIjIf/qUcfwnmHTpLH/tBWtMHJcobmn3YMN3mrFvBkiiy+R5PZrYLH1KM2OSQgl+gbjbwp9ZEj9PWxe/YPw+GMVEi4dlM/UV9cljZF+ffMPEt+soa/cyqnLD+TJFC+ghYTy9OUEZ5Q1WtXsYn5rZlq/sLt5/+voMOuKty6pCc4lM0k2a6K0vhDBArpNpHlT4H76mWAk9GoK7r/+Mg8S/8U+LWjS/jP5OVWBYmcnMlTyX3eSE3scN5V8SWjHAOuvpDOcaKmykQxor+mm+RxwdiQtfF3ke5ySzXVEp/2/RQrM278BrCjAJc+O7j74CmfEnG4gGR2BdxKseeOu7lelIzfzR9OGStB9iwrErPpdDluJeN70yBj6n/haCA5KNCEW3CGihn1U4gtjyQ1cmavrkg0ZD4xJoARvN1FN0fa5MJ2XHLKTUZn9G7nseA4tQCRg6IZSIkfOwcc9X/YC3yXnhyadGItQwMqSn8YXMQEa5j36VOy1QZCoa47EhZiCsJGe8A9oRBzxb6bRO2ELVRXUV8QKiJYzkEiLkJJT5n1CqkIOsxK11GoiyZTG2QwLQiX1D0c62s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0805b4da-ccbc-4c64-e812-08dda61d5920
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 23:45:13.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daza4BqeO/3lYhKzj0rKklMUTvcmBpayIMG09BBJbdwXFdAmweSH4T+IXdRu0d9W6b5T00aabGSqhJiE/0viVQptUBiKI/uILt/Xsl/iX4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6976
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_10,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070174
X-Proofpoint-GUID: 1slD3kG-1KARSBXoPkWo-0lcc0NcOGvM
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6844cf0d b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=lwwgr7LZCFuneoIwKz8A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: 1slD3kG-1KARSBXoPkWo-0lcc0NcOGvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE3NCBTYWx0ZWRfX4+JJOWRhCFv2 W5MARVgJDewQZgADbTrYC64wb9maEcjAy7QJZkFpIItOJE1+xLjI+p6uXWc8Q0uRLHA3B+1Q6F6 tSW4Oigzjh1Coo2Q5Bn5ZyykTLpOdZim8HKZ5Z/XBvyGKyjScLk/B5JAZPFdF59ldghPqN0Oc97
 Z8OrtioO6eFw6M39J1ttqv17JU6JpdCmHSt8LTnwfpICG1ccozD3u/RKhOdRof2X7+IYO1UUnbX 9tRJbqGr4t8/Vt8+TOX2S1K4PACIOsrIrouZd8kdfKgabbpejV46Q5eLZwoYJmGihE2Dx6EIwPZ oLeJ0ukfM8lzue+taC9y4g0IaPoLDf07Uh73HeJAy3WBmGAfXOwt4dUa7auc3I0AqoB+3wVVRGs
 ZNqWQMOYaqf/+0ep477rKRgXfBkN9F/p3gVWR0DBuqQ/NfnaJgsJsor2Tx9otpCKiS0d/YGN

On Sat, Jun 07, 2025 at 07:46:55PM +0100, Nick Alcock wrote:
> On 7 Jun 2025, Kris Van Hees said:
> 
> > ---
> >  include/dtrace/pid.h       |   1 +
> >  libdtrace/dt_cg.c          |   4 +-
> >  libdtrace/dt_cg.h          |   3 +-
> >  libdtrace/dt_pid.c         |   3 +
> >  libdtrace/dt_prov_uprobe.c | 590 +++++++++++++++++++++++++++++++++++--
> >  5 files changed, 573 insertions(+), 28 deletions(-)
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

Thanks.
