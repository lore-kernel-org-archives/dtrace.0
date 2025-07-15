Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6F26281
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752595587; cv=fail; b=YkvAXYnTCNo1dmkjlTtUSF9FIqfjaSe33vXHB8fL11LT3iShLNTtY2JSeKvdgYnA7kSRvsk6bJ731TDTrCU5yzfCFI0/zfnL7mqftfnuuHyrFIcRdKMo5+aNK0R2RxJKjl8N0PiKjxGBtmkmpvtQKux6W3Ux8SS4ixRkyAp0q3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752595587; c=relaxed/simple;
	bh=7Y/677fc2Tpm1cQ3KPHiABt4XPhaf1MUKJuqAQLpniQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cfmu1E87pgwVSVyBf9RUV2qdMq8eg/ecD6CqhLi2+KrPwk6PPppt6/Hqbai7OCJG3pH6//sJYM2xoUIHIVjTYi5NI0oJ4EoOFek+SnMEAGAmMJ6qyKNWEa89KGLl837GbLe3d0aYLaJGbxF53IgBCRDpscHWl0wMj4MgefpL9RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lzf+kNi1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FDy/sBMX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lzf+kNi1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FDy/sBMX"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZFfO013533
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 16:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=sbCfb2oCdnYan78DKm
	B7e8yeJ8JCGqWZXiDtAmZnHdY=; b=lzf+kNi14fzwpA6Rhz04pEqOGUBpOHx8Om
	YgrHHWF+4666N1Opozs1rQlaW3UlMJrhFlR+VXZra6s0/USVkXSyrZO6+9X8692S
	YrOPZgaNJ471xTalYHNnCLiBoVr1a7KsEhyh/8wdwoiJ4WM95fqVkjJN8RFMyM7L
	ZgyYVXZ/1G7HLzGg7+0tUWT82TUdUYeKKu1GXqJJFX4ZxZi0vvaFX5K83cilk6rl
	dFwoXHxfjQsapvOAH9eHj+twIerv3wbAfEyBeuxH1RK+08OOJ1ivMEKTCI8HAjlL
	yvmhzSvfYMvVneq5TJy7SRbGiiGrPupYXd0J4SLrScSvWFPT4gjA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ufnqqtkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 16:06:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FFPEC6029677
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 16:06:17 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5a5p2g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 16:06:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OobPhMuGxQykGjZ1dP85BBQLFCqMCs8qEL6iRGsx7Xha6YR4N72ed6x+i30CerMCDCJnijD+21VofFNHYIz9pITl9ZKFu+mFGvddpOMQQmNNRNl/MIO3Va23hFU1aG6vOXdvjqLw1pJnUWeYt1I766yF3xWCuZl464UhxVTWAmhtWy/uiCM6sb7PN+XKg+YuMjUNMW1rg9i33C9bhm0R7FggLOn/Dgn94CDpFBgZtPbWTZUtAYW8qCB6MzNnwJOchqh9IU4fh3c0CIuVSggKrpjDRnIN5nBN5VBFwK5CT0wRbC/lJyAv9B9YWvlEMFaIHgvvtN47LjxwPbndjqf7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbCfb2oCdnYan78DKmB7e8yeJ8JCGqWZXiDtAmZnHdY=;
 b=Vd/4gJSn4s1fj4iWmxTCcCcbCdveZGj4yzO5s1RNg6EjHkmfkLX2V/oA1SG4GsuxqW6J4StQBRvW3rneDhRpV32vM7BDwjzL8G6/IsqvD7jUS10dsNKQS0tfFmv+SrZvqdjOFeC+ZDz2wqCyuLqzn1jopUDVSfTyuzIrp81dGtRoPrngkI2iZ2ZWFl2LovY3WgzjCQmNKfNhHfaS/hkKq2BOQKpcPbccF+l0DmxRGicebPxS8p4KcQUqIql+bVSN3sN20T4hAEqcYW4j199muI94g0eYggsKQWTrjFyhvKVzXKhW6Oly2HaxU52muUqtW94IikJgzSSdiuoIDgDS7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbCfb2oCdnYan78DKmB7e8yeJ8JCGqWZXiDtAmZnHdY=;
 b=FDy/sBMXTjOpU92pODbxzwxVIuJS8G+Sb+pQny5tyZH1Z45Ne1G2MoJTiVfnag38IEyY02rmPCcauUyNA2AKA4D3019YSCJkFEYvk3fwq8oAYaJWDI5pIf/3yWlCMOybrd+7gcDh0JBwYTESH7kOHmHcvU3lzU9i5C4kWAsyxAM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB7524.namprd10.prod.outlook.com (2603:10b6:8:15c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.26; Tue, 15 Jul
 2025 16:06:13 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 16:06:13 +0000
Date: Tue, 15 Jul 2025 12:06:10 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>,
        dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 4/4] rawfbt: selectively allow return() in
 clauses
Message-ID: <aHZ8cuwbgbqEXGmd@oracle.com>
References: <SJ0PR10MB5672917714933FF0262E814DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <874ivdwwwi.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ivdwwwi.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 2986bc69-a397-455a-ab57-08ddc3b985a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?//kmOKNOCgJUjJ1Oym/qXt3PyWtV9kr4PPyk4OsjsUi3CMhVPVcpRWKTDBdV?=
 =?us-ascii?Q?9hY4BKnAfc5HJNQ1chR0l41UpfxvIiNVK8v0RLWzcoiuYdm7zsLy1lx8/mH1?=
 =?us-ascii?Q?zlzSvkeT676GC0mCHpOutOss6GVvJ+6jOrdkuoFnUX1ks1LLFJRv8JlGUL1+?=
 =?us-ascii?Q?RAYe9nuFiRsXzRveV99nA7rFhhKphE9ZzZybS22IA1ChCjpXS2quUjwp2oXP?=
 =?us-ascii?Q?fzWyKFdg1zBg8S3ILH5+pKMcH+XstzghP1Jn5aS7fklehXivWGVrTrE6rciq?=
 =?us-ascii?Q?RUqjMCAXTZlOLCAR4+k7YRrEOx9I+sodWXoeKHxYp+hWyZOJT2IqCX0Rcco4?=
 =?us-ascii?Q?bfoqi9jlA0d0vFArCb6HwvlLVCoenY06NNzH+JhDvkyknsnXYFZqf3p3OyRr?=
 =?us-ascii?Q?q3olL8/WiXPYaIy+YDXaxcxo5h4pwSf4PYJ3tOOB61WTFY5xHCBYEmcQRl9j?=
 =?us-ascii?Q?B1Tw58PsCz0xfPECqESCY94MS7hNnnWviiO5RNLynDqpxOdbFU0962bUr20U?=
 =?us-ascii?Q?Uv08GYBUfSCZ3k93z9vgDkCuhdDjLVNDDUsfUMx7HBpHcJbCfRYqsOHk467O?=
 =?us-ascii?Q?0x6vSZH9S5AE8WFjLQZQHzZ1hcstAmkdQJbKDDSkKgzUOM/4N68NTvmqGlCT?=
 =?us-ascii?Q?AsuLy4xCXes1WXXd4I2FGxBsDlKx9GUxIOKlfjlsx6nU+z5OJZa4XoDHxKSg?=
 =?us-ascii?Q?6NBtFenrYuQXYkTXlC7BDAnE3QBHMAo+S1Y2XNuJWfX/3xVpQG7rrr3IQVGb?=
 =?us-ascii?Q?GxqrBa0bb4pNfHacmocm8vGxQ/3HOW4TYm3fFN9oCNx0DdmLLTdsuEarPfZ7?=
 =?us-ascii?Q?YWLkZ3b8oNKyttFmaELv2NCJ1InRj5k9pOaptSR6CrqLDyikC4d0Ufg2cB4/?=
 =?us-ascii?Q?/j4Tgzitcwh3rwQ+Fd4MmX8gqYOYy6vQ7o+A15gQPqAU/a49Kud+6yoSKAni?=
 =?us-ascii?Q?BYHNpD15tTYL1KJaLlYyRB22SyZsIwUZ23LFm1DwhUTPl0HbHqBZys6v1ZCD?=
 =?us-ascii?Q?VsOXOm/VqnI0XyB72U8SPjGaEzXFch1QIgStwkPiMkebQLhS+eKo1MhzoRoS?=
 =?us-ascii?Q?RN+WM17q9VdpKD6uZf4QjmmSAW1IgalOWAVCS1uRI0ga6oI2ANYfRX8zC566?=
 =?us-ascii?Q?ThzykuKUoPduVAJ4jknVeGFyF24ws4tQUulf7lLLoTGKY7xz8iy5q6jd8Vz+?=
 =?us-ascii?Q?okxW6VEui2z7kcyROTO86yTzZ6p2hQcGN8xjQqWeWVMkNsK9bMw368WRCARH?=
 =?us-ascii?Q?ZgWXojz01LLCkV/ACKMq6Et1orozKacK39iuuj8AoxzTBBXSBvroYgNBhz8R?=
 =?us-ascii?Q?AnB1/T7nWFR7Oqm6jyAJe1vZRfg0GCAJo1jPMX7r9rrziTqDWNiOo7GXRpvl?=
 =?us-ascii?Q?zNNTLOgqGGMz8QXkwpp3ZHFOFZFFAkQWUeqXmliuGi/c84Y42s4xLsKvsdvH?=
 =?us-ascii?Q?yg8+hUtXNTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?elFWpXlSyR/r6K3qShZ1iU47azz4WeXRxaNGGz4kT1tW1Nk3BMID8Iy4oNIC?=
 =?us-ascii?Q?xlK7HCSUfVPgTyBx7BH0h1yQ5QSZGA1W+bWrNUYwk8v/ycqhouhFzmG50gAG?=
 =?us-ascii?Q?WXSyBsbvygnw0kIkl8bwssFb2dz3hqIiEMK/UNmKRC56sXAHQvra0OwzvdRX?=
 =?us-ascii?Q?p330tKs5ca/dimFzFCCDM40owd9AIQxWRmtRKfuHp4STwq6yRI4V5w9r+Ehn?=
 =?us-ascii?Q?IUaSJrxDI9qHKZouKksXBSAL9nbSEmSGB/sHpnHKbfNBYcT5fEkd+ts59WZ4?=
 =?us-ascii?Q?vnjsGIixO9U2y3Ob1TP9X11/bUUdN+verRouPc1E3C9KikTCYjyKaVOle22h?=
 =?us-ascii?Q?E3hYq5Mtw3UM8MSKrmYT4UF2vAUEiFm21+uSXcdODjrvTHdfy4TQO+36WJN1?=
 =?us-ascii?Q?ggkTcOdubkEzr/Q+HFMHoeR6ScLS9nxeJ+JkXzQ8e5aabhAvF+nkOxiMbTe8?=
 =?us-ascii?Q?Cf8/jGJujmLQVAf+d9c5PNr6IdUT6B08DHBlnk2z201KeGMLM2spT00rYPlc?=
 =?us-ascii?Q?Uhv1KQySTSufIXycvIxI42FjBZTGw2cEe2ZCtbd5FMMvZS/47aCtiCnEPsOf?=
 =?us-ascii?Q?f8qCgdQO3+1Cb91OrRyg9J9gaqg1EI+DdbJ+nAHoeSzhEXdUM2uS5OpChQ1f?=
 =?us-ascii?Q?a0bvFrFoQzZnLg5LRh7mPCViTCu9ATqzHn0Tzv3AXbko9ZcWUMfixEMl9zu+?=
 =?us-ascii?Q?oly0Je3lWRWNInXahaMFxwGYUK17GyNR0i6artjCewqODVdM6PrLxOBkuDo8?=
 =?us-ascii?Q?5Dm9xtLlsxWTnmzj+Exi2x559S3k8zykOnV/QhiKSPsrqWPBVippA1LznSmF?=
 =?us-ascii?Q?IYp5Lw6wARvTFJSr9ZEkeUuihSHbW42MDyeZhMYXvNS+H+J00DkyH+1bHF6X?=
 =?us-ascii?Q?o0hGLioBnHazGo7UEfomJUo3mlGH2rMciDTALaIRRfxd2q+sQGWlHIa1W8m+?=
 =?us-ascii?Q?K7WXXR4zgp8BbkYjlIxOAXiMmEa2aTk+7XJ4gCIPLYAvNThgjKiiZWUg2VYG?=
 =?us-ascii?Q?7VXxa3dJ+/tgmegCgzlnPf0Yfuoq4O/QnZwdxAiwSzH50NmFDZNF+nlgwDu6?=
 =?us-ascii?Q?tlAm7h5r/Dg4MGLGFLju7G3wCMrKQX9p86jhqUVW4alq7NKmJ68wHxrhSHw4?=
 =?us-ascii?Q?odCPLXb4qMVJIZ9yEtLVCRwuYQMdn7o8izvXVfD6fGFjVs3uTbXPNfz3LKRv?=
 =?us-ascii?Q?52FfIUE008QZCVCncMW3ltrFLSqUEGjRWtK7EcMc/GxmkCTr6Hjjcl5WwI1O?=
 =?us-ascii?Q?2h7Sbr71fdWa5FKJwlsVH6QAwBaS4ZCtz6fQ6Nse3Ppa/iRPmQ4FMkAXUtWj?=
 =?us-ascii?Q?hcc9oEREHwl4T2sb7Zl0vj60vWgsZmjyuXT27iYda0A5ietQwEgL/4oxgmtm?=
 =?us-ascii?Q?Z28XabOdql7cH63+dXNxVVi5wWPm6suVVTgpR3yERSxF9wwTfmsgE127Fqcj?=
 =?us-ascii?Q?d8JhucgE8KwVEhJtKOhfKJ0fTKAyK1RzWRywqnzjuLJDqGK17Gc8gZeORi6L?=
 =?us-ascii?Q?9pldt7nnE0Qe7Sr08Rc+15dYbG2do/XhFI3ZDoPiojfJ80gXXwBNg6cSwDJ9?=
 =?us-ascii?Q?ihdCiiBeCyULNIaY02nGgi2giVczsZffL6qU0L+vmk5gzImU5l/SOYdAxycz?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3wN6RrMEyU1OyiCzLLGUAcWvSEWXyuYRCXmF0UEekYKHv6oqjExuTAOwEpIqJ0jZT0jViLqudV5Kl4+Z2Z4BqjxiTrGYa9RlxGK55XxQb8oqEMZpPNUHKr2gVl4svZzN7z34LiqmogBNqEpgj3eyuvGvbiTv21bWwJwaDRpt2UkpjhhWlJ1yhlNSeAJJFlw1ciVJvVuQLp42VPXCLy0GDz6se+x4iy2p6aTezo6Yi+zGGe1PPPbMfKuf46EO8hzpH3LLsnYeRqcBq8UkzITnXhB0WW5ixu0+k9Vz/WI3tC03hwGI+EBJpRXB3uWGHZkGmH7cIPiEZnFXTsKzFvs9sj/6b3YNTq1y+miIzWwQnOwEIgUlp0yEZKncjFJ8Q8d/0dXfVROsGJsohseyNtR8P5xYAs/i74GA1fHdUwtW/xSSZbY1C+E+ZskwjiFdgTf2jJWcXHAYOfDkTXg2wplYSnKguqqdiO8ofcKRoGpXe5L9cLX3ANZbM9PmASxU/2DvKDCfwvICXzm1Bsz23jfY4sfZUkJk3nfodu6e4CiW0OFwhIRZlfxRrkYj7bJCIQqFBLbY8kE3mmhNnh0hUIEM7/h4E1PLKCXGaIAzU7VDd0w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2986bc69-a397-455a-ab57-08ddc3b985a8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:06:13.6171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iG02KaNIv6guVFUaqo24iqBfOaiVRU0I7TaytgQWGE1cYDXoTwgUzhV8nowY7xNgk+ycthT+ZTf+jHEOSAvnfYf3hUa2qYcpymKOM2AS9os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7524
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507150148
X-Proofpoint-GUID: izsWD0vmFtz7l98V3PgKQUJz-lBJGJvi
X-Proofpoint-ORIG-GUID: izsWD0vmFtz7l98V3PgKQUJz-lBJGJvi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE0OCBTYWx0ZWRfX3VzoLQslAkPj PF+mqF/43ooPsFIFLk+23mXm9UKhKWWecd/nLeq2cfLiJfMXzU9yNRfLWSvMDwylka6DoC+aV2L tHlMq6SR4L9ktO5sBpsLW1y69D73X1wkJNKKiwKwlUrYwk7XJKRGgbY+He7SQ1VOGCW79rPqDIo
 D+A3kjruWzVar2ppwNiZmeVPUC5DFc1KxHjtzJkI81ZhhYvupS2/7aVXVqRHGJ+sOlt4ZwK0bVW OdhPvZ/a+PvrF3u12YQ4T577wVbuQzqVU3u8NtYO1gb3ZpHIclzB7+aPAmeRTpdxnzwhRSOjnVw A1p5o3iPoqtbCCLzZB+xyQIiL0NiP6VPuDhhrH23eRutA5zvIaLzgvdQAL7wa4fRnNb93WusqEp
 VwfM6eNLH9Tkv6rHbNHuAOyHyNclXe7xInAxNRZ/WeyrMknIGCuomIBKi4Lut8zq5nmmdLqo
X-Authority-Analysis: v=2.4 cv=U9ySDfru c=1 sm=1 tr=0 ts=68767c80 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4pB8Zw7eNyNgUX2SVHMA:9 a=CjuIK1q_8ugA:10

On Tue, Jul 15, 2025 at 11:50:21AM +0100, Nick Alcock wrote:
> On 15 Jul 2025, Kris Van Hees via DTrace-devel verbalised:
> 
> > The return() action is only allowed in clauses associated with a rawfbt
> > probe on a function listed in /sys/kernel/debug/error_injexction/list.
> > Use a reject_clause() callback in the rawfbt provider to enforce this.
> >
> > The list of allowed function is only initialized the first time it is
> > needed, and its content will be stored in a hashtable for faster
> > lookup beyond the first.
> 
> Pluralize "function".
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> 
> modulo typos and other nits above and below. Nothing serious found, just
> misconceptions of mine being squashed.
> 
> > +/*
> > + * raafbt only:
> 
> rawfbt
> 
> > + *
> > + * Accept all clauses, except those that use the return() action in a function
> > + * that does not allow error rejection.
> > + */
> > +#define FUNCS_ALLOW_RETURN	"/sys/kernel/debug/error_injection/list"
> > +
> > +typedef struct allowed_fn {
> > +	const char	*mod;
> > +	const char	*fun;
> > +	dt_hentry_t	he;
> > +} allowed_fun_t;
> > +
> > +static uint32_t
> > +fun_hval(const allowed_fun_t *p)
> > +{
> > +	return str2hval(p->fun, p->mod ? str2hval(p->mod, 0) : 0);
> > +}
> > +
> > +static int
> > +fun_cmp(const allowed_fun_t *p, const allowed_fun_t *q) {
> > +	int	rc;
> > +
> > +	if (p->mod != NULL) {
> > +		if (q->mod == NULL)
> > +			return 1;
> > +		else {
> > +			rc = strcmp(p->mod, q->mod);
> > +			if (rc != 0)
> > +				return rc;
> > +		}
> > +	} else if (q->mod != NULL)
> > +		return -1;
> 
> Ugh, that's quite tangled for how little it does :( can't think of a
> nicer approach though.

I am hoping that perhaps in time a lot more functions may allow this, plus if
someone is going to make use of this feature for error injection they are
likely to use it for multiple functions and then being able to use a hashtable
rather than scanning the list multiple times is nicer.

> > +static void reject_clause(const dt_probe_t *prp, int clsflags)
> > +{
> > +	dt_htab_t	*atab = prp->prov->prv_data;
> > +	allowed_fun_t	tmpl;
> > +
> > +	/* If the clause does not have a return() action, allow it. */
> > +	if (!(clsflags & DT_CLSFLAG_RETURN))
> > +		return;
> > +
> > +	/*
> > +	 * If the htab of allowed functions for return() does not exist yet,
> > +	 * create it.
> > +	 */
> 
> Personally I'd move this into a function just to do this initialization,
> and call it from this one.
> 
> > +	if (atab == NULL) {
> > +		FILE		*f;
> > +		char		*buf = NULL;
> > +		size_t		len = 0;
> > +		allowed_fun_t	*entry;
> > +
> > +		atab = dt_htab_create(&fun_htab_ops);
> > +		if (atab == NULL)
> > +			return;
> > +
> > +		prp->prov->prv_data = atab;
> > +
> > +		f = fopen(FUNCS_ALLOW_RETURN, "r");
> > +		if (f == NULL)
> > +			return;
> 
> Might want to at least dt_dprintf something here, or more likely
> xyerror() out, given that this probably indicates a kernel configuration
> problem. Right now this looks exactly like a success (!).

Hm, ah yes, I did this before I added the clsflags test before, so yes, if
we cannot read the file, then we should also flag a compilation error because
it means that error injection is not configured in the kernel (or for some
other reason won't be possible).

Will fix.

> > +		while (getline(&buf, &len, f) >= 0) {
> > +			char	*p;
> > +
> > +			entry = (allowed_fun_t *)malloc(sizeof(allowed_fun_t));
> > +			if (entry == NULL)
> > +				break;
> > +
> > +			p = strchr(buf, ' ');
> > +			if (p) {
> > +				*p++ = '\0';
> > +				if (*p == '[') {
> > +					char	*q;
> > +
> > +					p++;
> > +					q = strchr(p, ']');
> > +					if (q)
> > +						*q = '\0';
> > +				} else
> > +					p = NULL;
> > +			}
> > +
> > +			entry->fun = strdup(buf);
> > +			entry->mod = p != NULL ? strdup(p) : NULL;
> > +
> > +			if (dt_htab_insert(atab, entry) < 0)
> > +				return;
> > +		}
> > +
> > +		fclose(f);
> 
> free(buf);

Oops, thanks!

> > +	}
> > +
> > +	tmpl.mod = prp->desc->mod;
> > +	tmpl.fun = prp->desc->fun;
> > +	if (dt_htab_lookup(atab, &tmpl) != NULL)
> > +		return;
> > +
> > +	tmpl.mod = NULL;
> > +	if (dt_htab_lookup(atab, &tmpl) != NULL)
> > +		return;
> > +
> > +	xyerror(D_ACT_RETURN, "return() not allowed for %s:%s:%s:%s\n",
> > +		prp->desc->prv, prp->desc->mod, prp->desc->fun, prp->desc->prb);
> > +}
> 
> (end of function for comparision with "error" path above...)

Yes, indeed.  (See comment above.)

> >  dt_provimpl_t	dt_fbt_fprobe = {
> >  	.name		= prvname,
> >  	.prog_type	= BPF_PROG_TYPE_TRACING,
> > @@ -628,6 +761,7 @@ dt_provimpl_t	dt_rawfbt = {
> >  	.populate	= &populate,
> >  	.provide	= &provide,
> >  	.load_prog	= &dt_bpf_prog_load,
> > +	.reject_clause	= &reject_clause,
> >  	.trampoline	= &kprobe_trampoline,
> >  	.attach		= &kprobe_attach,
> >  	.detach		= &kprobe_detach,
> 
> So unlike what I assumed in the previous commit, we're assigning to
> reject_clause() whether or not destructive tracing is on...
> 
> ... because dt_cg_clsflags() is turning on the destructive flag whenever
> the return flag is on. OK.
> 
> > diff --git a/test/unittest/actions/return/err.not_allowed-1.d b/test/unittest/actions/return/err.not_allowed-1.d
> > new file mode 100644
> > index 00000000..246a68b1
> > --- /dev/null
> > +++ b/test/unittest/actions/return/err.not_allowed-1.d
> > @@ -0,0 +1,27 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: return() is not allowed for fbt probes
> > + *
> > + * SECTION: Actions and Subroutines/return()
> > + */
> > +
> > +#pragma D option quiet
> > +#pragma D option destructive
> > +
> > +BEGIN
> > +{
> > +	ok = 0;
> > +	exit(0);
> > +}
> > +
> > +fbt:btrfs:open_ctree:entry
> > +/ok/
> > +{
> > +	return(0);
> > +}
> 
> This seems like code that will rot fast, given that btrfs is one of the
> few modules that actually does have error injection. Why not pick some
> of the huge mass of the kernel that doesn't have it at all? (I guess the
> rot will be easy to see -- new test failures, every time...)

I used this probe because the other tests for error injection use it as well,
so at least if there is rot, we'll notice it real quick across multiple
related tests.
