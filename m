Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06683BA21
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770922581; cv=fail; b=neBlYpvFEVVNHkLH4XZQhI6x8tr8HkgVTJiGEoecpwocwAH/8+5vgEoUvp+P8zLb/vG7hAh9/BEWAR3u+dY+MwlExOJO3eTQXn0tybBiD2VtpZ9CZvp+K6BCUsEmvJ832ediuKqB9TrMsnjJANV5NBEFy5h9EwqFgjTJFZU3wUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770922581; c=relaxed/simple;
	bh=zw9fSNp+JpnkNsrLLyuok1cubrl30XbS2pyaUt9IWYI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=tAjHXR3GIvw84YznRO/3qn82CA0aBFPOvZBCGyYSjJ6AaaKaMOAijvLsDIsDEVa1zs5IQSOuDIXbdcGzMiSp/9qzeU2wf2563VClpk11gTL5yP7Kotn4Cply6oDXhsMo20tBIJaEtYhsO7bmGDDJRobtpDasOxkMwHh/jxbU13U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=q9Yp5U4L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yTfjanoB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="q9Yp5U4L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yTfjanoB"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNBNK591591
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=biAB0rE8g5XHDEUjZx
	ex9Oakqxci0Wy+E2m8IXz3JAM=; b=q9Yp5U4LtztiA1SdWq+WMdTGXPBTaTCa3k
	VwgfDLkYNx+O9RmRGs+JH92epX0VSOWYMXKDZO3146cSgFZbRvMkX0/oZymGJ4W4
	+dTBmZd7Vm08Mq74vFFT/D+59sOyhHC+EElv1q+ouEZTaTwFm7LFHwtIS8JeqOWo
	f14HMO7coJwvUgy9Fjb8i3gSPbwLVN8Jc20eC8t5mGKUJf9+3muF2nggE7cOEqUz
	nagiTBxX62Q6Pe9ga8JCzuoUzh0+pZtWPAz2zixgaR1qFhp9476GKxhCAUPwv199
	8Hzl3D6RSWGb51vC3w1mvNy0qh2qZg+OYdzX5dgeRdYKVS7ymAoA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88qt40mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:56:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CIZUgU008547
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:56:18 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8237j3a6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQGAb3nF+BOKW74ci/p1pA7+gSnIgMYx6GPWAC8mNI4tbag/vsaBB/D2N7xfJMtnM4E8Y9QHUb1g56KpR8aYiQG45/qt8pIa1ff4cvrhXl1c/AG6VbXVfl5bYOBzAqkGAK+QeZNzpzOhsUlzRqQmX9KKbcCJw0wX9etx09VKG+yXrBwJN+F3AjItof4xJuWOFgLkug6BCIa9H4yrVnPDk8VRNRB/rsEu7fSHR6jTl59gX1bXdxHgMu+IRmTDnQeLPmQCtMNMDsUULHDuCPVnJgJJMiIYgqoC2h/kZMFtgf8Cc3zZ05omvC13CyfxzTq6LfY8+wglKF8BvynGvCIhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biAB0rE8g5XHDEUjZxex9Oakqxci0Wy+E2m8IXz3JAM=;
 b=El09ws/ngs58cusaRes/hj/RWSUNcjp6qDCQ0gW0qPDE3yx7P1BsugUKN3ka8kOmkS+LK3ni0tVr6IEKOsGrEqFhzL7IwPnxGL7g8cTlpgNG82EAGYLcU73pMF503RExo7GiMeJPEOqHztQpjP4zy1+uNynfBz6qZ3THIeGyCeCuDV0HBIH0CQEVuf51MiVSB8jqvysg9kHWM4tAgSwvpGqXMMZkDXEKIWiX3qx8BFSX1TVlJJ+N4qnHVAQnMSjduTi2F/fy4ikjQsKw7FpuBDoqHVB5rwygkzyWlc5sPyGKGKHntEKaQN+AuUlZCmysJ8ZHOfHRqynbYnZlVimZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biAB0rE8g5XHDEUjZxex9Oakqxci0Wy+E2m8IXz3JAM=;
 b=yTfjanoBAVAGl1JdQz6JXHo0jL2YlZvRYEjZOQMcplrOGFj4mzQQ8jfEiB+Y3Gcp/teYmJkYDD8nEhCjue41TTSVSByXP9rr8+IOuGCPFzouKeruCF1kxfJ2Is77qYHDT3gv0PSn/6JMxOF9vdgIeiKeqxAv/QwwaJW9UNFt5x0=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SJ5PPFC322FD87E.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7c9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:56:14 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%6]) with mapi id 15.20.9611.012; Thu, 12 Feb 2026
 18:56:14 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, Nick Alcock
 <nick.alcock@oracle.com>,
        <dtrace@lists.linux.dev>, <dtrace-devel@oss.oracle.com>
Subject: Re: [DTrace-devel] [PATCH v2] dtprobed: use /proc/$pid/map_files,
 not the filename of the mapping
References: <20251202230453.124306-1-nick.alcock@oracle.com>
	<20260120162051.183028-1-nick.alcock@oracle.com>
	<08f076e7-9573-7ca7-f89a-a3fd33bf683c@oracle.com>
	<489a5755-af8e-6eff-48a6-9fbeb8c9b4cd@oracle.com>
	<878qcxomfi.fsf@esperi.org.uk> <aY4buJOhWlmm9CvW@oracle.com>
	<aY4d0ttnWiIzwfWu@oracle.com> <aY4fWtW6pHgFUkEL@oracle.com>
	<cac20746-0207-711f-ada1-c96b1cc6603e@oracle.com>
	<aY4hQajn7use525y@oracle.com>
Emacs: more than just a Lisp interpreter, a text editor as well!
Date: Thu, 12 Feb 2026 18:56:12 +0000
In-Reply-To: <aY4hQajn7use525y@oracle.com> (Kris Van Hees's message of "Thu,
	12 Feb 2026 13:51:45 -0500")
Message-ID: <871pipokoj.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0256.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::16) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SJ5PPFC322FD87E:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f219799-6cb2-4063-b442-08de6a686576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ijf0MGK/XE/luRjTyTtw1uG1Ycy1alpwE0MCp2yoeWVp/e94riu1goBDaml8?=
 =?us-ascii?Q?QlpTvFw8vAWtDrHilYDcj4Y4X7QQwjCS7syubkC6pfhlUhDfB02p3PK5qknH?=
 =?us-ascii?Q?Fu/sZhVDw/ucWKOAPWhnwJ3nvjsKWWPBmFn5WMDdgmApaQmYIECWKyUxbbPr?=
 =?us-ascii?Q?vdiJsdgKS1qzaHLEQ5IIontbDpYrfUnjELjtrr0AolzNMYy8t+8T61JFMfD5?=
 =?us-ascii?Q?G1K4XzPITVs1OqASLGPVq+pE4me2S+RKhUfVMZQwwg7Hyd7eYNElyhQ3rKMo?=
 =?us-ascii?Q?ioNIHoXYLWj2WUMI0jDnfdC8QiuJRlgkKttipbHzq1ycC0VcQ/kUciSZRAWa?=
 =?us-ascii?Q?hT9X/C5Yzz3yw6gLpjOVrWoGAQ2x4BnPzBvjRQtPcp2SYBXryyEJyW0pE1dR?=
 =?us-ascii?Q?yRR3KJdY2V14pJf3NPKODJd5NcS8TA2xpjn5ncKVg/0PxBz6p+roIknjQ32a?=
 =?us-ascii?Q?aAzzbwYxwLeg+T3HmH6Wp2FKaoW2XKiSmINWllzrPCCV7UPI6Qsly/VMolRz?=
 =?us-ascii?Q?4UUDtZNXT+ruu+xYTHTgFM1803bSdWYgE63l5osPmtZDGpkH0+ciRiNkyxW9?=
 =?us-ascii?Q?3D3legK1RQcbTtwjzAr/Cgt+GJ8CE7l0sjdlE/mRlwGObM16UZ9ComXD2vwv?=
 =?us-ascii?Q?ocUXLxwTfyzQg0O6q4fCK8jpWLub0Iws+/0SQgcoHW4aV2cjlXVLvhq6Q3Yk?=
 =?us-ascii?Q?hOT6P3JEmMlMJV1WGVzk+SeNZwrSBvpfvIbCTzOdH3w55+DvsqD1MvkOP7Ib?=
 =?us-ascii?Q?XV1Vp67ZwgAZWuAo7PiRJBg0wjaXZ91Nw8Z76BJM7oqGxuXApjqnGUkpR8O7?=
 =?us-ascii?Q?Acch3+I2YWXDBakaplpMlc5CL0MpcKObiekFA6hoBRmz8NSzgn4PXSquuVzz?=
 =?us-ascii?Q?mSP6dLoEkN/TPFUoohHqGUPrXwG5fxB+5LlzkhSpMkId68YUcTwfozkB46OG?=
 =?us-ascii?Q?9YH6Kyu52sIa03cwHDkeWzOzAE45w1l4xdCEHwiWIbAFCt07nOL7d2z/wuvJ?=
 =?us-ascii?Q?wmNkoPebxMWA+iFB0KAjm0NGdeudEPAIQMwn1cQxzBqHxmiCWkoIVBMLoehM?=
 =?us-ascii?Q?szbfutl7nnVpnrXE5bh7vCcIrfDFcTaZGhqi4201OKEMh9oQsuEtwhc3Obpn?=
 =?us-ascii?Q?AGBpyfKPuFexLkZlRidk0EOToqwpD8k31Qb41cKHEEAqEX35LzdOpapJo/Mo?=
 =?us-ascii?Q?Q/awXc5lqk9TOFt1GuJhnX4Jb0XjX10TS57cRYSBFZ06eFO3gQ1JzRygzA+E?=
 =?us-ascii?Q?u5oN1YLPAV7FUNJwYQQ5CVyvegHWBwYxLZVnutH6m2WQZvfHHH4XMoT9uYKH?=
 =?us-ascii?Q?uP/t3BibLD3pSrgYIJm4EtmryYkU+d/xSkRuYY5/s/OwWZXIb6e62mjntHdm?=
 =?us-ascii?Q?x+vXKLDffz4iKFpQhRHq2JK3M4T8mscMPMj/Qn81z16IuPinl1GNVfQBhcox?=
 =?us-ascii?Q?vBvdKRYMp54ztMU6AYHSBb4k4ecT+yZlvGiK2v0c4Lu4iGpWO+i0JldkNz0z?=
 =?us-ascii?Q?KpCiTDl8jai+eL+OaKc/jOunJN5zGACqioetGOvUi9KZs/o43nWSRUrtYQLm?=
 =?us-ascii?Q?gFanVKYJse480c7efMQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SwjIFxzo4Cl41PidaBgF1aAGdnAvz7UcZBMA8xGW43V1wCOVf+KAWKaLqNaO?=
 =?us-ascii?Q?mTT6BpATQHr3/idq5HexwKCAc4OcwVqRdZycarNFSYpkMvqK+hMFqHd2sly8?=
 =?us-ascii?Q?lFdB9edy56NyfMZQci6kG2Yz7xb47Z/hura8mRIi68qBJtX+Mp+6Lr1+u4HI?=
 =?us-ascii?Q?m8z6ax3tkaphJ5SFjuEgeV5M/gYz8oZGcChtEodI8wpKEBg9YunIZd6rF1GK?=
 =?us-ascii?Q?9dxNY+xvtfxaYg36+6fg4t1jYPZ1fmB8f5nQxXTLkAdsRGmFXzZEP7kiE7tX?=
 =?us-ascii?Q?YdIfENZRJrttb3roaK1utvA9FOgQmq5IMoWnVmB5dav0LAEkdycmbmkBejSE?=
 =?us-ascii?Q?TyqfKCgMtWeKdycvRu+9h7XlEyDs1RY6sgDiLkbPc1VMXjHxvbvsSnbbp/JI?=
 =?us-ascii?Q?szlHeSiHRCfDHVof12Qetn0Fd1p5/wf40TAXo8TOKtVc7J9UUinuDteKoM/C?=
 =?us-ascii?Q?DCKYP9WwZKuY8LXAJKsJMZ27qUyJasLOYZEVaS3IBYo7pOktsskoear2/8OP?=
 =?us-ascii?Q?SpT9WtOeQlHyA1g8QQwZJrzC4zsi/khM+2sgZV3+dV1b/kJlK2eK0Cf34aoU?=
 =?us-ascii?Q?c7u29C04xSB4D0q+5T66z6p7Lp+eR86ZOP9HoM4B1ArZbB4ZYsKI7ZsL+z2/?=
 =?us-ascii?Q?xdNzd260ZtQexuaIO3E2GqW+LPU90+A7JiLvnCgeLVQPLH0u6xyeK6eQUfnE?=
 =?us-ascii?Q?/ecynf64xHydwMPr+/Vb3FdUx1A2p2SqqEbqkvN/KDldwjQ0LN9SfBxgmDhS?=
 =?us-ascii?Q?J5TvOnw8WZgViZDnpz3Oqb8SR6COUxCNJMdE07zbiQyaS8NDbFZiVKo0Qb70?=
 =?us-ascii?Q?jtTSr4YSM8WC3yNLLsTGONcP3g4qTTIgHNQsp/MKUXw65iJkG0lK8ovTyN7V?=
 =?us-ascii?Q?uU0RDN9hWpgjoO20Aa03NjobKMivN+63cmvXyKoWIO5STPYHI53MsnL2eaBl?=
 =?us-ascii?Q?MOD6iE84TLOzkcjsDOy/NyZmSGhgoS66SAAeyCaaeUzGFI41dgEw5mWRFBpz?=
 =?us-ascii?Q?/xjRNyhokyVlK/prV6GSgFPraXn6Z8Z1fYWdCkq7IhZRskn8POQvSw+36Ssd?=
 =?us-ascii?Q?x+Uf61/bep6dKRcn0yc9nFxXuvzLoT39U99BCI2ro2kS0szp2g00BwgQHDRy?=
 =?us-ascii?Q?UnqsPa4mJngL4fDg11p/CBEuVecSU2jmAn35NJGAqmdb5K9d2f0aSpJIvenE?=
 =?us-ascii?Q?01jYhPeAFNJ1v1YsFVZIzFkGQ8PjdEdWivrOvOzANJm9mWztYLvn80Ilq851?=
 =?us-ascii?Q?icExYoHmvqyrSF0iYt8g5csBYtytH6vvDfo1O4aD7horj9ga1YvBqIWCgQ+E?=
 =?us-ascii?Q?fYrUYybKs/F23raG4c3hruqgEPo5XPia4rtJvEGcrYzJdTVz9ry8rasO6tXs?=
 =?us-ascii?Q?ANYB2sr0aoT+qVVh/nVit8blLYFdD9rDFYn0qhqNoHGLxkPynFCxrZWjJasy?=
 =?us-ascii?Q?2Fy9Y/JALmixQv0jQsVMPt4ogC/Ez0jq7acs9ctbcvhodMf9bSmT4aKdDDZr?=
 =?us-ascii?Q?P9VHnpg0VdJ9gIHjb3n4uLE9yoyT2hzRRai6uuJqbZBDp2+lraJph5z43JJ/?=
 =?us-ascii?Q?pOYuKXcUWGmJzjilBaenGjdpZILQNQ3KD9cqzjFd4lPE5SxaeRqRGsRMGWX0?=
 =?us-ascii?Q?xJbsyDSqbOLynbuQ06KWQvnewL9XBds7PCB72Q7hF+LwUwMfi7dpwxZoXY/j?=
 =?us-ascii?Q?FmWUzvpWw5Lq3xIHYj6Nu80E+vubBvk+/5Zlr6a/3CZcD/qRzgY4L28VcddK?=
 =?us-ascii?Q?3dcMtHSsCg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FkM3pcem7nP8cSmp+HHKTQyxrZTnoRGk+cMhIMY8rKN25by3Y9wDOPQsINsbpYQNGynNOA8RLMRbOn2kBZUKExdI4eIIqJcAlndzqP5fEuFhM1p62pc50QsxPa2xbLLQEqJi2/XeUSFG0VnIf51mlFHjYORBu0jQ9y6bCUcDe1LBF/RLYaHJ3RQ22ICXIgFM6Gxg1PxZ0QxeyV2T/Xqkv7iowE5VCxqkEMhxrN+kioKhEOj4HoAZQ0Fw3fryOqtFHd0mA5Qt/HDNY8K4Hf7/PY+y2qn6eCN5Gu+Zs7fVUgkLiSkhShspCfhDYfn2OKqEKCn5k4/mrs/vf3YehJKr/RkCnyGoPNbb6sn4LeP333CTG53ITVigYVlHS5E+TmgiEcxHape0MejzyFYVJNNlwJXYHu1tRmFKMFmRziu2uGiLG9mU/RgdYknAhvJ9dm64s2T+pgaK1CnsQ578p14ql8FVo5Ok7GU1X9tloDm3fUPF/r99XNziYXkJRHHkqww8/37arcJmIA6sbEXbWrOmJCE3iEBC6YNihOeTbtjFCdRlpcxQF1dWOTJxfiIC9dbi/1IWH29d4rdR2gAR4dAaJ5SuPACLgLyJC4Dy0CVet94=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f219799-6cb2-4063-b442-08de6a686576
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:56:14.7167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxd8S1X7++eMoMvAC2MV+QBRJQ6a6sjIeA2MbvT88p/kZe/0ZqpmV4tv8gEU/noqPpbxpU+b/ivyWaoemRLazQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC322FD87E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602120146
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0NiBTYWx0ZWRfX96qMSCrHE/Oz
 gf1Hf0EUPNyOB7EVmmDd6I0Hl29k6edL/Nw9r8LuBiuy5FuA8QzvhnS3mo6nVqcO8AqvLFsys/K
 RpTrvbNHkEdUQyEB6A5aywUJQeuO/R3Lc6FH4qmHxkODNt8TojiR+Y5iLiMik+94Zg7XVDIbRaA
 EteHKZDkfaoDOLl62tu3TgGKvA9lJcGKKv1p5k5B/vIWXWoBTUxlJyDIpLqVP7vNPXD9OxON42G
 z4bd1fKQm8aM06sAsy2h9/4EI4z9wxtGI04MHRKcJvHYv/Xx1zDOw4KDnjtPdBnNoCmsvTINuyO
 /L6SbVWYZYfbWYvkRG46Fwv466Wr/N6uUX+sYBWE1SsC6VLKPj9ci2ZvTcAM9ojZ/UTjYZHl/5u
 ufFuVAuS/GoVW9LdpTryFjbbO9mohrrEezJxy5REC8NEDkFZcLYzv/0ODkl6HEopaMDuy/dP2Gh
 pHa+8pWS90506g48yhg==
X-Proofpoint-GUID: -She8sVsv4hzeK25MI2Y_8JcBn4yHKkV
X-Authority-Analysis: v=2.4 cv=Mehhep/f c=1 sm=1 tr=0 ts=698e2253 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=RvFcgLhRURvdgVFd-A4A:9
X-Proofpoint-ORIG-GUID: -She8sVsv4hzeK25MI2Y_8JcBn4yHKkV

On 12 Feb 2026, Kris Van Hees outgrape:

> On Thu, Feb 12, 2026 at 01:49:54PM -0500, Eugene Loh wrote:
>> On 2/12/26 13:43, Kris Van Hees wrote:
>> 
>> > I believe the following on top of the original patch should resolve this:
>> > 
>> > diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
>> > index 9a692805..34349deb 100644
>> > --- a/dtprobed/dtprobed.c
>> > +++ b/dtprobed/dtprobed.c
>> > @@ -487,16 +487,17 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
>> >   		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
>> >   			 pid);
>> >   		goto out;
>> > -	} else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
>> > +	} else if (prf->prf_mapname == NULL ||
>> > +		   (fn = Pmap_mapfile_name(P, mapp)) == NULL) {
>> >   		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
>> >   			 pid);
>> >   		goto out;
>> >   	}
>> > -	mod = strrchr(fn, '/');
>> > +	mod = strrchr(prf->prf_mapname, '/');
>> >   	if (mod)
>> >   		mod++;
>> >   	else
>> > -		mod = fn;
>> 
>> Is that a '-' on the last line?
>
> Yes, but it is missing the last line (sorry about that):
>
> +		mod = prf->prf_mapname;

Given that...

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

I have *no idea* how this worked when I tested it. The whole testsuite
passed...
