Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870EB800
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 00:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729815266; cv=fail; b=C8o0A5NW4e5S1UyE5cLq+4E1vOTtWF8s+8jQPnGtvMy+sdStohJGsQYGOK9UdVK5WtYPxfacyQ+WSe9d91te29ydazhv4LgzfHzInOyIDiz1igFSKCNFE37AGSlsBIMjXCMJ7xFy/toCLmBSOZlW6UyrMSZjMiRYYizb1qwYGg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729815266; c=relaxed/simple;
	bh=v8Jf2KcJWMN2txerFtoTqyWjc5xKfLpIyAmdy7YN85g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bbKzWLvYArDUZpBs9RAMl6ym19/G+f619Irz41HcIwnmT5EMBoPk0zzYkUHy8HBKcZuZDjZui6LpVduejVNSduDknoRx/R0H4Eb3VPp/ZDPth9NSynUfQxgoNFa/9NXCJ6SwIa90F8K3GiGNmNmUj1+QE1g/ISFyu632LMCMGYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L/vqVIlB; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lJitnSWh reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L/vqVIlB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lJitnSWh"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OLMnth016089
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 00:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=GyEh+/foXUszH+Hdi0Czx30DS49lIuctdsf0DvEXgV4=; b=
	L/vqVIlBKOied1sKguNZac6xsAQcaP8uq1DarRXiejMQVxQq8TMWA+G9URbM6vb2
	+Na1qnd0Q2sgOL9ZThRf541WSGd6XA2TfktCCgrjGcJWoC39nvYaIsNiKzHHsObc
	YJW+sScqKZI+4iAnLlOqLeAHhOQ//Csa9A8wRgsX2OqeWe2XZ51hNASamboswlSV
	AT/SV1OG7eoLTtdRwZbRZM0tPImf6R6dXtZsW9rQuoUPpr5MGU7QLdcrO6QpR9gR
	1CVXAJzYdhjJL7QsbMmNN0qEpu07URaO7yVyEXzI2EkJb4Aernu3IGrVzpRKcE+B
	1hB+5sM5NhOl+3I2cgpwxQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c545c1jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 00:14:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OM01rD017761
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 00:14:21 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhmr04p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 00:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cj86y7YSH8lCKLyW/Pw6jXn6enPgkWYZVRJUJkD7ujULMSzzUpiJLmbKY0mwbZLg2LbbAjcQNpPy1dAfYDFOakqNM0dqNTU6CQowhGUReirB7E/5vXFcSltl9Br4WHDCkYYpF2glYGmzmCiLYhl1eH8hRwhZZnxiKFb+Lk0AuUMH3/Rs6uWIWeVThjm+uHV81HQlXIRMcyOEOba/ACZ3ZVV44gi2cVQ4MsiZn5LP6PrJ3BnvV/o24VBOIh0nYtwguwgjL9zq3fZ4dBfI9RagWdw+MZRWUccD4ws46h3pvTs7ZqHvMPQJh/hCuvuePyiiMTP99zars1RlpSwUz5tUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NqI4ibnI++RtVNguxk76ZZz1DbwRmKQ5YIt8eBpi4M=;
 b=xADjr2Z/AjkgvX8zdCk1l7P63rsDgEv1ybtUUIzHEnpK7ayQ9o4ZEFG+oLiJUvJMFQvTI7ZRGQ1Z+uZ6WsAfvlHuOPHil1sC1F1DS84DYRlofUJCHPWVYREiJq6z8wZmRFZPYOh6F3cZ/WJd5lgHXNJnTk7kkKeIn4b7ryRHsbk2rg+MOBh0uYjikhzYBD9LMOdowpQvuOYUwduZrgr/4P288Tg3bGkTfdOh9n3hxjCQ3A4aldwqX1xJErsHzLnyYSu4CjHghs9pu0XSbx2Y6Bza6cFcadC2dizWiwlmhJaOKR0pdspnzhYcWPV21JpA83anZ1BkLTl/ngxWq4XFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NqI4ibnI++RtVNguxk76ZZz1DbwRmKQ5YIt8eBpi4M=;
 b=lJitnSWhMULMfdwRndSwT5FH4w2rTSa/iuFFtEQHVdMulGqcCS6YyY8p2IN9zMz87Zym9UgMRnjgV/yMZgJjRnn7E4gRgKqLMqByt7z06UpQBwFk5uc3wwTM+hZgakKTRlomYFElr0CKbipzmBGlX+DOrWN47TTQ8SJ2OM0BHSQ=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ0PR10MB5696.namprd10.prod.outlook.com (2603:10b6:a03:3ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 00:14:18 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 00:14:18 +0000
Date: Thu, 24 Oct 2024 20:14:15 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 08/19] Support multiple overlying probes
 in the uprobe trampoline
Message-ID: <Zxri14+ABi7LIhJj@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-8-eugene.loh@oracle.com>
 <Zxm0GsvMqDP0lO8c@kvh-deb-bpf.us.oracle.com>
 <ZxpRGdMvnZLAYt+7@oracle.com>
 <c16405d5-d7c8-71cb-35d7-8f7ee232e88f@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c16405d5-d7c8-71cb-35d7-8f7ee232e88f@oracle.com>
X-ClientProxiedBy: BL1PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::35) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ0PR10MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: 196d7ce1-3362-4083-9efa-08dcf489f764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?XNrx4qoOUWpIjLSrKuWrOQfgq6TFMx2QvfUu/NYlAadyCwQWolhOop5E4c?=
 =?iso-8859-1?Q?5rys2gW7/14G4z18dMXy1jotpW9pNbKotnlpe/kCAyjr85LeDcw/I1ZZVY?=
 =?iso-8859-1?Q?sxh5z5/cGSqGYFkShH4YPRsjyYfVyxQ0GuwXdqOLnX4WjSK0VlrPwh+l5y?=
 =?iso-8859-1?Q?SsIjE4fOoA9JkiicZ+Fv5pt1Hqh09jk3YLKq0HCD78c2tUDd5hp8Xcn6Pc?=
 =?iso-8859-1?Q?rYahZisEZ9IY7PV3BxwtEsBFg/Ll5Dw3ZkzwKwvSp1mja1Apw2c5rbnutH?=
 =?iso-8859-1?Q?G3YfZ96tvLgY1N8pHGf2gx6iFNd0TNa9KPOtvUzGpgkHlc4VpxM95hCQew?=
 =?iso-8859-1?Q?dKftTI6cbHw8jfwrklbLcPaqYykTj58mCCtWQxB5REpGPuiflgzZDw9RWA?=
 =?iso-8859-1?Q?SMNSatSO+iq1Smk6GLtc9NSXU3ylpP93g9NuLHvLedBwGk/lqY/5+nTgYI?=
 =?iso-8859-1?Q?7LcLPEIgg3QbBdrH7uZWH/wqEAG3owOD4aEfQFa9sUV8nVc2Ki3kVIQiB8?=
 =?iso-8859-1?Q?NA0Abty336pb18KaHAx5+LM3YiY6djAKYbfUqdVG9LI49gzJzs6gjr1Gpt?=
 =?iso-8859-1?Q?QTTn8rh03KMk6ucAdDwiiaLRc6l46n2pmfVbgSh4jqSoFMZd3FiC1Gqylf?=
 =?iso-8859-1?Q?x/nENrO9/8673vMwGc70UGX1rai+5sTEoJOc3cP4Ibsj8BBgQLGTyYRAoJ?=
 =?iso-8859-1?Q?4oT2XKmBwlElBqHEdOE/97HZKBfxaibE7860pAOi1MC+M6empmgDgF7fqN?=
 =?iso-8859-1?Q?AJSub7UrTr+Yd0L9oTXIdTfcQIo68DlnInF0Jp8IHYZelEwiftDP2Gcy/9?=
 =?iso-8859-1?Q?bZPkjjp8m2Oa0TkYfsenFCwW6X8woSS/KLtjH/YhDMJn7McbJIY7A4Ddm2?=
 =?iso-8859-1?Q?RwenPdPitOqNJRSrUA6s7hzhaq2bbM6GV/JIJnoq7KRYv4Zr59f7ua+a6t?=
 =?iso-8859-1?Q?xod9by3RYToRYeUdYfvBIJFdd60SumZ/vfCGk1/7WAlOIhZ6Y3jF6r8PEK?=
 =?iso-8859-1?Q?o7cowjIJBStOydtmQcKkcrEKSf0n7xvlMHCDPtjJpFdQluROy5oc2GQ903?=
 =?iso-8859-1?Q?hxEeA6CLJjv4PC3MKfWDeGE8pi3i820185aA2dpv/NpPH2Afs8oxU3jPXj?=
 =?iso-8859-1?Q?UTnh+lQLuqXPxcT7rY5e2A9rqb3Av88C2pCI8S1mWyq8SQ3kog7kRzE2wk?=
 =?iso-8859-1?Q?5nQBHUzHUyIxhlEps50c3M0OJHtRFVzAcE/K4sHaQnYy4vyFqkFPza5D+I?=
 =?iso-8859-1?Q?Y28WsUlbBrwqR8uBNwCF/ev7tRWKPm/R+YNbM5e57TSioUdFYRhaepUIq4?=
 =?iso-8859-1?Q?p0QuTWEAJyktVlfaDTCw/zsJQbzbcTq8M8t2R+HSsqWOdszNSC4mCbPE8B?=
 =?iso-8859-1?Q?VLo2uqk70o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?x8uH9uIR/jncN8OwhSQQ6MMmASE6BBlw2dDaKL9JyGfn5oBrYLv/aYTrhr?=
 =?iso-8859-1?Q?VE3Z21AOi04fK7dnuTduQhJZf7miVRMwnvkIfmZo9kGUQ1cQgz/U5MBV9i?=
 =?iso-8859-1?Q?cejApKH6/DwdtTgztcKHB8Kl89nFSrbX0Bx9baW2hrCaJD8RqKfTwb9Z0H?=
 =?iso-8859-1?Q?rVAdWX1TB38ZgX6BjLmLIzNn/3pFUD4gQ9L/N103XNy5qCE+w6X/KS6hdz?=
 =?iso-8859-1?Q?ezdxvVT5YU5t/fMuoxWUiP1X7KtEfq149fIPXSkdHfR+WXOtUA0r9pa/a2?=
 =?iso-8859-1?Q?OcY5jABPtaT0jq2byBipjPWxCcm4XYY5By2YgxtAbghwz3bn0Pq9226bes?=
 =?iso-8859-1?Q?SbKRdSeAEU9mWYsqj7UwkoY/RWiOXjAE4qhTuL3I51P2JO23o5CsB9lYv4?=
 =?iso-8859-1?Q?ZtMGpqqRa0Rvlc35w/9KvpNMKMxWnVz5efroDke1TbivDEN2DVZTeZmeWT?=
 =?iso-8859-1?Q?czZrdnnrvkFKGTPhHwHWKYtDIzWK93vOcBdXvjvKVUM59PCPcLYONXEdvf?=
 =?iso-8859-1?Q?yn6shcs2tA50+gAjufYZS79qCgtaMdZRnH7Lzhvdwz25e/UtSzD7k2xixN?=
 =?iso-8859-1?Q?gaRAZ4NrpR5dClNlCCPBmzyge7geGczfdEwPCEwBKCIkcToqLKAiHMeXIN?=
 =?iso-8859-1?Q?plAUQlSdyKVE35V+rFId6eROt+Cb2e+LqDPt7cZNDLqGsvhDocoO135kMA?=
 =?iso-8859-1?Q?lgdBZiM4hSu8Llai5KE3pqPPWFlnEj22tBizpsVYDJ5/lEmFIfNg1BA6KA?=
 =?iso-8859-1?Q?yXCqEaUmr6q8IjuSG6glm18Xx/fYr8iIp8pnTseHeyo88l3PBBiJPyvJQ6?=
 =?iso-8859-1?Q?HTyhnn7edGjtS5vyDfq8iG+7A3xUTUuRdSoqqOJn7wm7mOIZcYo8R51LYg?=
 =?iso-8859-1?Q?P+C/DIyx/xsLE65XfB0UzuNXDEroBL8hVzu3EUW9KF6Ww/xOMXvMsCnAOI?=
 =?iso-8859-1?Q?pnPdALKo7N38xsXulPDvEVRVr83llBX1VFDPiey0zEOQjQPbWuW7RxSdQl?=
 =?iso-8859-1?Q?MuSDM+C8KT3UdFqe79DtSa/RLZq8E/ul7EoPakLUDVcTIa6xp5S53lX/XS?=
 =?iso-8859-1?Q?cHkfY2hbnCFCwvXU/xBOsdLzSq77ENQ+mC5Yr3y9i851FqNNPgrD/GvCXZ?=
 =?iso-8859-1?Q?XoeqadgXkoich2hpAtvWO39xYUiqSMrjd/mNViopm6fdVaUIzN8bs/1Xw5?=
 =?iso-8859-1?Q?OQSbuGFRtDhUvsxy0DPHB8Srw7hKF/cI0BXMmFDdk1AAQ5YjAho4Sl/Vju?=
 =?iso-8859-1?Q?g9ZInjm7gzF73GhqnKrYgSGH7dzCxm2DgS/FpKq+M9buFhR6MMj6S8NRZk?=
 =?iso-8859-1?Q?reb82gxs8twr+9ZY/HRh4AeDIk6MKEbJQe6kl+S2Ea16fPyfFkaynO3Syr?=
 =?iso-8859-1?Q?xv3VJsGe6jRK7K99lmmU4h9Dx5LRmyJrF/MbwGMJHO0a2xbKIUtXpjCid9?=
 =?iso-8859-1?Q?WT+g/NFbThMoka/nbZ+DIjrgw1MWPl7okfttFFSWZrlF88f/xwqG2efp3G?=
 =?iso-8859-1?Q?LxL2U5dwFkqLkif0vI9IfIAqutele8+qMHxkjCsIPt65x8e7/I1gJwxcdR?=
 =?iso-8859-1?Q?SNPtNmRAO3omAJxLXwrd+5UvP5QGmvowyDcOwPrS8POMWjFJbqZ6uZEEiA?=
 =?iso-8859-1?Q?haBJL9MPjuJSXVhl2zlwmSOX+SSkOi4DLzKylV+afOEBxCdKWsN6532Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6VcWUfmhxJKsZddxwM5EymaT3Q1fnzQpK9EGZx7PFtzryRlcTzJs8Z3Q7l4raoEdzeh6F27gKR4q3129CeGedE0ct8Z2v5dG4ll6ElIBjnlfFh51L3Fr5XRglQdTbeHXtK1bVF8d7OyFXTbV4BlC/S7r6LTtA3zPtGgPDe2Oe8er0tOjLaA9X6CcUoGYPnaaRnLpMLsTwjOUFKLQvzk+0Rm2kCfoJYqlWNpe2vHpY2trOOCtsZPVO9wL8LG5gf42UtUmQoR5c0iSsRB1IsQpW3AtgPtM0hblOHxiHaK9JTefylW1QrP7liuFgUZ52sZqcv4WnFoabF44c8Kiv/fTFg2MXShhjIaXWW4XwTRTlQiMUBGOhSONMgnOwuXIjtorIu1cZpjDnW4Ph4klzWp7D+EhvpHjMRTOO9ELbKrUeMhpUdAiouvYyJ8B/WokLebfh5z0JumWtnyGd7a7HUX/YmZae5DtHL3NZAt7FSdSjtftHSGnycMzaoNn/JAgyZUtYUoBx8c9/xgbIrQt2n2W/IcVlrpJ1FX8+bDKzItU93xvbz/mpXdyastiRmL4BjUzQOLyZPzynMQQNXbAk1cWh6ASQv5wpCVCtzh6woT2Ptk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196d7ce1-3362-4083-9efa-08dcf489f764
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 00:14:17.9629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lqy2eKQN624s+3Bsex7m287npwQ+Ee00KGMMYoGIn5l7hGpOL/fAPcvJZLykXSFcRSjAkqr4qi8b6r1r7Kf8fRLu10TyBI3fEcXZnyDHAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5696
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_22,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250000
X-Proofpoint-ORIG-GUID: jxZx4127xtcM4rutRwN7cFJwNGiyBs3N
X-Proofpoint-GUID: jxZx4127xtcM4rutRwN7cFJwNGiyBs3N

On Thu, Oct 24, 2024 at 07:30:04PM -0400, Eugene Loh via DTrace-devel wrote:
> I'm going to do a bit more testing before posting the next version of this
> patch, but here are some comments while they're still fresh on my mind...
> 
> On 10/24/24 09:52, Kris Van Hees wrote:
> > On Wed, Oct 23, 2024 at 10:42:34PM -0400, Kris Van Hees via DTrace-devel wrote:
> > > On Thu, Aug 29, 2024 at 01:25:47AM -0400, eugene.loh@oracle.com wrote:
> > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > 
> > > > An underlying probe could support all sorts of overlying probes:
> > > >    - pid entry
> > > >    - pid return
> > > >    - pid offset
> > > >    - USDT
> > > >    - USDT is-enabled
> > > > 
> > > > The overlying probes belonging to an underlying probe match the
> > > > underlying probe -- except possibly in pid.  So, an underlying
> > > > probe loops over its overlying probes, looking for a pid match.
> > > > 
> > > > The trampoline would look for only one match.
> > > > 
> > > > However, more than one overlying probe might match.  Therefore,
> > > > change the loop to keep going even after a match has been found.
> > > > 
> > > > Incidentally, it is actually only pid offset probes that could
> > > > "collide" with any other overlying probes for a given pid:
> > > > 
> > > > -)  pid return probes are implemented with uretprobes
> > > >      and so cannot "collide" with any other probes
> > > > 
> > > > -)  no two USDT probes -- is-enabled or not -- can map
> > > >      to the same underlying probe for any pid
> > > > 
> > > > -)  no USDT probe -- is-enabled or not -- can map to
> > > >      to the same underlying probe as a pid entry
> > > > 
> > > > So, possibly one could optimize the trampoline -- e.g., by adding
> > > > BPF code to exit once two matches have been made.
> > > > 
> > > > Incidentally, there is a small error in the patch.  The flag we
> > > > pass in to dt_cg_tramp_copy_args_from_regs() should depend on
> > > > whether the overlying probe is a pid or USDT probe.  We used to
> > > > check PP_IS_FUNCALL, the upp could be for both.  Instead of
> > > > fixing this problem, let us simply pretend it's a pid probe --
> > > > a later patch will move USDT probes to a different mechanism anyhow.
> > > I think it is more clear to just keep the logic that is there for passing the
> > > flag, even if it is not exactly correct.  At least it is not a change from
> > > something that might be wrong to something that is more likely to be wrong.
> > > Either way, you are changing it in a subsequent patch so the change to a
> > > hardcoded 1 is not really helping anything other than making someone perhaps
> > > wonder why you changed it.
> > > 
> > > Alternatively, you could perhaps change the check for the PP_IS_FUNCALL flag
> > > to checking the prp->prov->impl, and selecting 1 for dt_pid and 0 for dt_usdt?
> > > Yes, you will change that in the subsequent patch, but it would be actually
> > > fixing this to be the correct condition anyway, right?
> 
> Okay, I'll go this route:  I'll check prp->prov->impl in this patch and
> simplify the check in the following patch.
> 
> > > Summary, wrong -> different-wrong seems silly, wrong -> wrong (keeping it
> > > the same) is reasonable, wrong -> correct is of course preferred.
> > > 
> > > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > > 
> > > > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > > > @@ -740,6 +718,20 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > > >   		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
> > > >   		assert(idp != NULL);
> > > > +		/*
> > > > +		 * Register copies.  FIXME:  What can be optimized?
> > > > +		 */
> > > I would drop the FIXME.  There is not really much of anything that can be
> > > optimized because we need the register content in case some clause makes use
> > > of regs[].  And arguments need to be copied for argN and args[], unless we
> > > want to implement arg-access using a provider callback during CG, and that
> > > would be an optimization across all providers so definitely not something for
> > > now.  So, no need to have a FIXME.  It's biger than USDT :)
> > > 
> > > > +		if (upp->flags & PP_IS_RETURN)
> > > > +			dt_cg_tramp_copy_rval_from_regs(pcb);
> > > > +		else
> > > > +			dt_cg_tramp_copy_args_from_regs(pcb, 1);
> > > Per my comment above, I think this should still retain the code that was here
> > > before (well, higher up) to select the correct flag to pass rather than just
> > > hardcoding it as 1 and mentioning it is a bug.  It is easy enough to just keep
> > > what was there as logic, and then change that in a subsequent patch.
> > > 
> > > Using (prp->prov->impl == &dt_pid ? 1 : 0) would do the trick, right?
> > Actually, since you already document that the pid return probe cannot collide
> > with other probes (but there could be multiple return probes, one per PID of
> > course), I think you can still keep the copy rval vs args outside the loop,
> > right?  And that also still works after subsequent patches, because you have
> > this before the loop for pid probes, and later there will be a test to be done
> > if it is a return probe, and after that a args_froom_regs for USDT.
> > 
> > I see no reason to move this inside to the loop.  What am I missing?
> 
> Ha...  that's why the "FIXME:  What can be optimized?"
> 
> On a more serious note, it's an interesting idea, but maybe not worth it. 
> Your suggestion is to do this once rather than for every loop iteration. 
> But the reality is (I think):
> 
> *)  If it's a return probe, the loop will be executed only once.  So there
> is no difference between doing the copy before the loop and doing the copy
> each iteration.
> 
> *)  If it's not a return probe, the number of loop iterations could be:
> 
>     *)  0 (no pid probes, just USDT), in which case the "optimization" is
> counterproductive
> 
>     *)  1 (a pid probe), in which case the "optimization" is neither good
> nor bad
> 
>     *)  2 (a pid entry and a pid offset=0 probe overlap), which case the
> "optimization" helps
> 
> So, which is more common?  The first case or the last?  I think the first,
> but in any case I don't think there is a strong case to argue for the last. 
> I guess we could check if there are any loop iterations, but this is
> starting to sound like a bit of complexity for a minimal gain.
> 
> By the way, this "optimization" would have to be in the following patch, not
> in this one.  In the present patch, the overlying probe could be pid or
> USDT.  So, passing the "correct" arg to dt_cg_tramp_copy_args_from_regs()
> would mean args are copied differently for different iterations of the loop.

Yes, you are right.  So yes, fixing the flag but keeping the call in the
loop is the right action here.
