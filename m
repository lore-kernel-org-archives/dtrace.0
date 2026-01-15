Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F214315530C
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768517597; cv=fail; b=GVDZMPZMshbik/8gKLYUjCMz0aPg7uZJvABJswyZxPT31OG9/DuOXQpPtEVtZLErR75vTqAEJ9wysx8i3bdE+dUt2OWz29puMiv4E9W2UOZuTaA1f4EEVdLP1sHzlYihywqMo5GGZS1l5YFxRZlXcdJ2j2+rUm4lDepU14ukI+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768517597; c=relaxed/simple;
	bh=wEcmeN5oZqhYVnDwNqA8dqwRCjsLu8vLwCmdhQxBveI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=evthveGxy8jlOLTpDC4609SX9xMFrVywTIP00cc5RJPLaS8KVJU/f0QVtJA1TkYosnP2MWGqHRb+LDXL1HWFCnCS3SqW+v0RbhU/MdxWDo8NTz+s+N9ztVJEzQm1dXbKArzKKLlqK7fMwTCgaLzxTjEUPnwmQ1W3R9yYDrviwfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QLkimyBo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PsOF71K1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QLkimyBo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PsOF71K1"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFq8YH2395990
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=OqZ6pF+aYv8hg4axZg
	cHm+N+ISp/U/V+r2FaFnv3Uh4=; b=QLkimyBod+zxl9QBvtNTRRKp2/yytuK6G0
	w0+486k2RMwKu4enHVt2SyWQTn4rn76wGY6reSwuhu7JcZD7e309Nyv5WlGmT4dm
	ra2XdQcFInnQdwUS2ELAWfRcv419d60vBgSmIA++fTmLy0JweJiZSmVfOP0XRlyw
	8K3ZPlXRFdTqRIhzWbYXnfJX8tg8kZUrXCABsw5vLiuHScNBoNo1ILavGuskd2/7
	5B317ZlmBHFFGUyCkRLfD36/pCkomfGJZmXch4ePvagLNC3hhoQD/F5jUqxc1l5M
	cxM7DzqglzGhBE2jNJcUtMHWPSPLMuObJHbaRhqw8IYa9L1TIaYQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkqq58xxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:53:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FMjd3I001864
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:53:14 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013014.outbound.protection.outlook.com [40.93.201.14])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7bxe1e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 22:53:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDjOHr4SPoAUwjxFtvBj3gbl3NscAH0DWVEtwf5Hwj9yXjjt8/UcO6VIJWZftFAxU2krnAjlsaIpy/NfIZtQqjGk0sV6BFGlsrlTyibhVd4waB/mQr8gKbmTcq0VW6TNAO/2h/2mZ/jD+rZ9lg3i+DGkBqfXt7q5aTJPzvd6VKqTP59isRPeIW3M8GSyoDdUQk/tL8T8Df13mVe2zWOZMFe0AZWUBqc1xAa3EvpOTPGUpfe1cFfBkvaCFH94ymJEn1Viu0ngPOPR7/Z3DUD3G2RGwnvcIxno2KQrMLL7lB4xYLTRLwTbOCdP2ItG9a8tPSU0f8mYje9f0tguOb3CgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqZ6pF+aYv8hg4axZgcHm+N+ISp/U/V+r2FaFnv3Uh4=;
 b=M4Gs5CLeJxFahLFNCr7a4Wg1CGZ2iH+b9jRldGQziSfh3jzWX7Nvn3AUO7F4pg5y/5ilboVKevWEsJ90+8wGxg0jMGhmdrxQoF+HORDTdkQKmcKKiJUB0AIqgXsScPi7X613Ip8zDbuinFrzYkPDCom0GFBP6P6RYYWQ1A7ib6Fo4n/8CMWk/fbMXwnfkaqdcqXDNxqJOnGGT6dGNXp9N8bMened2PSyhMRDNOOHoFkNxb5eBL4lYY2RPX/Vqemf75bzXhZCwT/WPgRwO82e182eJ/9ux/IIFvxZHel1bcgvyx9tg2wFizA0YR/sQ+0XUR8oyCfsdesOiz9h1tfw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqZ6pF+aYv8hg4axZgcHm+N+ISp/U/V+r2FaFnv3Uh4=;
 b=PsOF71K1fZt1dxGQ80D9JCBSRe6jJaImlFP1grODSn83sdfkmqsCUkBE43rAsLHwfFF5eCjP0esUancAe/cN8clU1ZFztoB2puOoPEkzEKDK8nsQ9hMWGWoff1Zpv4uPCHqPIVkIp2mZnlVtDqjd6ZXRNOu40dNGiobC7GRb3q8=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SA2PR10MB4811.namprd10.prod.outlook.com (2603:10b6:806:11f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 22:52:55 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 22:52:55 +0000
Date: Thu, 15 Jan 2026 17:52:53 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Fix a minor comment in the fbt provider
Message-ID: <aWlvxVuprdL9QUFe@oracle.com>
References: <20260115222314.7290-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115222314.7290-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SA2PR10MB4811:EE_
X-MS-Office365-Filtering-Correlation-Id: a39e8b2f-c9a1-4593-3470-08de5488d24c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lkv/takPE1jsTVWnByKleD09e9oqldfMXt6BpjRYOuo78jDIRPQwsK7YWj3I?=
 =?us-ascii?Q?HQ3JyRMtN8bkECZbhZDhnAXrATNuYzP+ZabqjgbeKRbylml1nllRo4GUXAdX?=
 =?us-ascii?Q?b+mN+Eo71poTAwoz+YNgRqUMYF38WYtWsLFUOb1RxBFOeL2rPKKWsk5yv6xZ?=
 =?us-ascii?Q?er9oI/hQbLb7hT9WG5DtkKrGbM11Sq7ABMEL24UWaKgQvyA3o2f0TvMosN6v?=
 =?us-ascii?Q?HsRI3yPiQH/7APm1/VX3LyrCVRCdN7AT3/+eyDu3hu7WdnLVWWWTcQkeMaIq?=
 =?us-ascii?Q?L9H8qT4qeSXKlOowZXtUHuP3VoV7mzNn7r5XVPIjTrOjtvS9iRsx2iBPknZl?=
 =?us-ascii?Q?2n6/RBn68j7TqingJPYqLuOAg3NNPvALy1ewveWmK3l8cu+4dvUffvYvscp8?=
 =?us-ascii?Q?A2oTCerZuLcDjthg8xVyf0roxlXeH+rwIvsprWb9K+KpOF5ZPW3oqLYc9AeJ?=
 =?us-ascii?Q?uFJfeh/o92YQElvEISkFonT1EVasoldEWm5WFQLNqc0nof5G7ZI8InfiPVdg?=
 =?us-ascii?Q?1aDmDBeGdDglMqog1CSiK3RgbearUAVBfctr8P/OELTJiIjBXxiyJQ273oHR?=
 =?us-ascii?Q?4cjj3AATPt9bVo9r9akNpGsbfYOZXbeyEjCQD+MuY4RJcp/2vICiMIY+8zMF?=
 =?us-ascii?Q?ZCN8nzXDl31ghx6rSCBSg0ASAzDuk8MUJ6TPGhb6FkKGPsVDT1V0IcPJurgZ?=
 =?us-ascii?Q?c0aUJR6BA9vD3kVrSQ1e3KWQhesynjv7eteYHe7MVR/xuIa/rnA8XxXtDMys?=
 =?us-ascii?Q?2qrTFGuGPO0b9uwVGZQgietARTy6jyRLziGjnBbqWQo/Qws6e/XwbJs0Wmxs?=
 =?us-ascii?Q?27IhkKnYHqMI8IN+el+2C9qK0iBeOv64B7PuMBQiHu2qhiKF6Oa1iu7G78y0?=
 =?us-ascii?Q?ZVIXA5gl0hfhzpbIAR+GQq0VNmWi3nhB9bDYy0T1KtE871xoGd/7XfiiCsd/?=
 =?us-ascii?Q?zKgSzzMjESESzVfV8/Qrk5PejAwENCJhh8XuDMUga8X2YuDiv2QuGrmLTozi?=
 =?us-ascii?Q?isROOy2K6X5sFkdmH8GnBN7j+hFHaPyv7RziDRExjZQgULDCon39+eRD8MT1?=
 =?us-ascii?Q?B3htyLRWlH4488hLYUfooc63iVJXHTKj/TubUFYMIkPzcIRam8eSNwsJ22Is?=
 =?us-ascii?Q?rcbQTvFthZ0rCJoJFuAyzA358umU4L7F+L9gBBsmsJJYWRqrP77Akbdw1KZ5?=
 =?us-ascii?Q?JIFhf3EuvO5GQB4VEwlCte9koYorRx9xanOc9piMN4v/W0+gmixT3d5Zx/Qn?=
 =?us-ascii?Q?CevXNVdRKxzKeNG08NYw51Q5aYLcrduIq1zDFttPB0oKo26/lqcfmlJvXsjH?=
 =?us-ascii?Q?291/szC6GxENpbbdnOeu/XOTVk829gRuxuFC/J0zVmAKpIJrEHBKO752hWg+?=
 =?us-ascii?Q?PkrVfTMGIOe6fz2RrX/JwVt7Lllk8UhlZJLsL3Px/bgGlNP9ZVPukgjAEewX?=
 =?us-ascii?Q?asrYkpKPW18jbvDYad5wcHEEOnR8Dt7u1IJN6XlofuqdoRvAINpOJIppmKTV?=
 =?us-ascii?Q?Nw4DXVIgNWSy4cZeI3fwxSSnvVpTvMdArR0xqktuMo+/onqMnmQsdVD6gYfw?=
 =?us-ascii?Q?HAeYzPBXDWmztSXnxkE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?43XwmPLy1se5czcmYpvevd3NO+jadrUAsZ0e8JiMpRXMXNO+SPP+UZ6DVfF6?=
 =?us-ascii?Q?lAmsRsBPmRFZJbOctAtogn8OVmENWDZyNDgBTzOcQOs0Tpfq54SObf8qh02R?=
 =?us-ascii?Q?iVz5TGIAv9ZoVIVkLi4tZecen4q28StrXhePMz4fb8L/Vkn+t2fwqhPQtNrt?=
 =?us-ascii?Q?L3HLM2Slv3AYWKjM9J2edFSrNQJiUxWKuz0+scCJRq3FDNtpoY32+ahFmY1e?=
 =?us-ascii?Q?BWXAbK8iyu2IC7VwR30wwDh7dwJnQ6jRXT0eDlOETb5RnvWXW/8iDYXNpwU4?=
 =?us-ascii?Q?t9N6dNLq9BblDmajLxFC1uMYd6r0dIOtpxl57sThpC1B7vYJxr4WF5WVOLNx?=
 =?us-ascii?Q?uQvLwAisCgcnnxze7Bah+5aZUl7I4GT+7tjYYzx6hia+OoQVgZigEr9+xe9u?=
 =?us-ascii?Q?6Snc+yUIane+myRpUFl9FOVb1AnFkd2luQ5lE89SjG5bjQ/7lm7G//LbfVZl?=
 =?us-ascii?Q?ucsIpSVhsFiFa8pspFrm/2UA47RAEDOlNx9FkprQPbv8BspCKRofFGP58PV7?=
 =?us-ascii?Q?Cvo9KaH5GxlnDsH0elDcU/fuAvEX8EW7UaF4wZpCL9JlvDR4xEKLlHYoMBWx?=
 =?us-ascii?Q?kfubosI5fXG+daCGIQguN9LBvxSTuuMxNBZDQ8c5r8clIA6HU7JI+e+rNXrG?=
 =?us-ascii?Q?fYxsdUibFDv8jMTZoCnaAnfiP0LXwpb3xC8JPlyv7Ev3K8fV2GWWyO2J7ySP?=
 =?us-ascii?Q?+jbTJpx29gl/SNgQVqxNIg9NvUEewd1RlY1T06hds9u3Cp8cJx649OHqwVu6?=
 =?us-ascii?Q?b0uuXfMII1u+mRD/Pn1vECi/X/FxcfdAG8KfgzMLDrj5HOMPYexWPFAJpohx?=
 =?us-ascii?Q?goYOGFsZM9UX9oO1uA+PB8T5DY988Pbbb2JTp3KqL2/iJMefrrI+mFvAG9/M?=
 =?us-ascii?Q?UfVZdikhi2jkZxtk2ZxgiL5tAQ5tDcmsN+ErnDaDsIT7E6tmgGAG9nrNJ2Yz?=
 =?us-ascii?Q?qfFC9R+CFgw1rdLv6UdZabChAvMMRHEqeczjApdP6t7NJXZmTYJMB0X++kEA?=
 =?us-ascii?Q?+GhvhLpCvaLmwAXjPTG5vNTgpxNvbjbalK3nKA2UCKuQLA7HCuyjsXPQf2UW?=
 =?us-ascii?Q?zrjm51awc8NeJF3n+q09QqTPtSnphEU9VaNhbh+U9n8wmE1Jc6pWYCe3st0r?=
 =?us-ascii?Q?hgsQcnQOLxNLYaRq9rrsmKNocCS7Addrb5XMVzpGRMitV4x1TUNlEMCCyk+Q?=
 =?us-ascii?Q?Wyh/YBKs5dclBjWu1me0p5BLilHlmJyiJicf1ByKC3iekNqSstC/XiZ0ihaG?=
 =?us-ascii?Q?uszXDH+Y6+X7knHMn1+65ytIDKbPxyeXHKcceQbjmip5TAAlI981ZduDQDL5?=
 =?us-ascii?Q?mpqU9bDRCGcage5vLLaDvU8prnZFM55WpWtAg5F7nvi7SJxnMO0QuuPom431?=
 =?us-ascii?Q?JXQUvMrw5WVuNnf8w+VayqJmxU7JX6wHJ8UvcXsjAm3GK+wIzUePPzunrUo2?=
 =?us-ascii?Q?EvHUqDu8NE6GOQREwmbtRn4ARNP09tOaIN/wvkgpmeSJHwmaBTUCS35phsuC?=
 =?us-ascii?Q?PwiaVC7OPMFfF3OHGCu+6L07dFLiB47sbPys/moSCae111dvK+Xt33IVJN1r?=
 =?us-ascii?Q?Xa8/OiDGMscBPyU0RmapqeEV62ADF+Wet9ntPfJLF1+N8UbfdtRP7OBU+mR4?=
 =?us-ascii?Q?qLfB9/7qHtJa77zVj4Yh8goHdg8usX1x/9hL5IaN9Xk2JP8MOECywHDQjtjj?=
 =?us-ascii?Q?chTF8u4/9j1zsvWK932/IMtXV/CtuL+/L7NrEBcL3pqrzlvA9dqVIpBVwxuY?=
 =?us-ascii?Q?6vLyxXOdFQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DXquRNYyDd1I4QwuzSG0A2Sr+T14nqyiMIdXj29Wluk4y+qXu47rGGDjNWMNi4NkiQuPwMQLeAZG5Bplt+cayfIWbniLKe95+2oIOdQTEoccdc3jtyxczXao7aAvbvBO1fgsXOQ3i8YRe4ItjrTzIahwfFiIjzZH7T5pLMgrsI9WH1jBZ7Wx06FZRxM07hhtlJoebXwuQT6gDfx1YmuA0qhsRvXlcmt8BluH9Ea32LpLlepbr19EP9vwpbrIGBxsJK4XnAByp4VDKqpI+wvx70vOYybrDOM7eneuwiuptoLYK6LxPfj5Re7Q73Vbl1i8nDI6rvV8Ez1vi+iLucIwsCai0tXgLqb5yGyyjZE736mnujb6luOlL9lyuhapYuT3ooF+d9Qm7arLL8fdbq9SYI3mIjEXnRZgeaK3o2Uo3EbYpZJYzTwKd8t0vTi+9gx4D+n8FOAG+h/mgTiDg+2GSimQM+EAgHphVr4kox6RpXM8/fEq+0xSfXufYRpLvryGDm4HYPiIqvmVKdxF7XsjjvL0D+tyWvjHI4Ik3LIJtYLGr9kTZzn9Fd1dfxPlQyA49o+ghJZ9QeA7nXXoQTij/chdo1jOdYSNGrj+BXgKcA4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39e8b2f-c9a1-4593-3470-08de5488d24c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 22:52:55.5212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3SzPCIkvHgxeQqoN4hNiJnmz9+38ho26qHpUz3M+Kqx5SK3KDnZmPTnlJRA7cKPEEKg/FfcWdSayYMUYySwqq1vspQkkTM/OQ204Mh9bxrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4811
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150181
X-Proofpoint-ORIG-GUID: lF0a8QPvp7B_tTs-QomTl2QXeT74qq11
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4MCBTYWx0ZWRfX5d74W07W8yLi
 eVirnoROo8OEkyhoqPfsCFEGPbOU6Gxu7KYUuNqqesVX6YJOinU0x9MEst2wrj2Ae6Q4foSC4QW
 N8WQa4sq4Og+NhK0zPQJSw4KN8dL3XOkzZgnRCVTnMvI8pfZm8Dr5p2kzjO4HsRIn+fQJETbK1J
 /Eb5Bahf9TPuleeBIABFSx2TAMXlFsUDohuKGbkJDdHz8igKTrQcGUtVVP/RK5jbet8u88wMPgV
 KkTyQEOa+giv5mM7tj4J+H5r2H05V45VF2b/TyY927nfEhNthgYjvoGN6Y1RBYoPCzivtxJXoZx
 8Q+KSChgvWtA18MMSyflWQz7IZONJcixaRvx5qrKU+lT4aEjhol/JZzEAjmU/vCXq1KOVV3EvXE
 qiX6rwauJ1tp9Kr28vvTwpsDvsDKpUSpHUYD2TnXXkTtFM+IfeMqbUWHuBpvc8DFTpHGfHIt3/j
 gQ4HcYTdYTzJo5GpMzQ==
X-Authority-Analysis: v=2.4 cv=J9KnLQnS c=1 sm=1 tr=0 ts=69696fdb cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=vHlFNBb_Y2DRt0c2SgoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: lF0a8QPvp7B_tTs-QomTl2QXeT74qq11

On Thu, Jan 15, 2026 at 05:23:14PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> 
> ---
>  libdtrace/dt_prov_fbt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 0ba209882..7f4a4aed5 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -228,7 +228,7 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  		if (!dt_symbol_traceable(sym))
>  			continue;
>  
> -		/* Function name cannot be synthetic and must match. */
> +		/* Function name cannot be synthetic (unless rawfbt) and must match. */
>  		fun = dt_symbol_name(sym);
>  		if ((!rawfbt && strchr(fun, '.')) || !dt_gmatch(fun, pdp->fun))
>  			continue;
> -- 
> 2.47.3
> 
