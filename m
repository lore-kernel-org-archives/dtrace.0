Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6481E8350
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403939; cv=fail; b=A/MPUX2hY90+0eZ8olkH8F078O/8H+DCcx6Q/+BI2+CMCixbaxC01bc6frGqtI8FmSjoI1C6vNmEmmVmoxnUbD9/VRwBdPqLf1S7znOt83wyNOL574cJnRX3TnTJeC/IAxHULlU3Yt4cgP3uMz0qd5EWVUhNYuTGuw1xos3qoqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403939; c=relaxed/simple;
	bh=Rca06/Lewp1oQkjNPZ38RmxTxeekspVV48K5us13tdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uhwcWoVd3qq6U20/O+BPgOl7zg+i9ErxGdrR9jy3Qqz4op7BqBoXKt0ovbpcsZzHr7PL88E0Gsh2ddKvgz+K33A2v+ARJEuZ//omMXpVtKyawSfvVuFZgIH5VZEzf9+xvR9xlEIE0ID0Wl8+l2DxN1aqAhcHYmZNsyRgB5iDCoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T+eMdi5K; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UOjTOEPf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T+eMdi5K";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UOjTOEPf"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BKbBdW026274
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=aAgVIpn//fneIel0+b
	7Om54eyZ6F64oc4KqD1KHoHXQ=; b=T+eMdi5KqOEGh2yM4YYZ5k+FJQsjZvDwII
	sQwJjFA6TL8BSg1Pbk1+o7GFRt93P+6ZHk+1BF/eYgjt0NlmuRKdIGXsjP7lvJze
	5NWsZx+7d8PrV1LHVny94eTH32XB+P0wl6crrnIaoumiDEtWYhTKXW+ffEqZDXA4
	/MLo2pFuCS72i2X9I7EZjk108NS+fTo6mtk682xo6ntBg8bcB981kacl6Noj9oh+
	QXELZr5KzyWbvjPBZKhbOvc+G6YZHJ5ByctQh1CN60KehgGIe5A7emexDiEIktGv
	/H+byIh1cfHs6naqOtPz8GNr9vMQLQFJNLeaOnw6FFQDZ2kNit1A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45ya96802t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:38:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53BKa2Me016090
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:38:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45ttye4qx0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:38:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zi038fuml75J+2VzRJdBsG3BHet2FEARc3c1pGD5NztfbpR6n/FpxGoxWnCYSZosFwcbraD89EmCzof/iXjhgNk2QAbxgK965TvC/u1bdgEOrkLFs4YR0dE6UJCJ1wVaXeBA6kIHzvNQbfY63W5VD9rQ3JZrsXsE495/T5BzYjJLVnlr3Y8bivoO81YCTiuX8efAe4O7UfuRwXFM1Q40YhkxI8/33cUp1Nz1NjGHOWa5o/dW6l2nZ91XVQtL319uxo8TkzHcyZxi/4tQEB0wrC+0AiMLTzowZS+GKwMmTLy2KHfcmkhegaMWjCmv22Z4KX7UBGUXNv2dfPEVyGkttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAgVIpn//fneIel0+b7Om54eyZ6F64oc4KqD1KHoHXQ=;
 b=IX+9qebfykzvaF5Z6GTvlUVY7iQ1OSDs5Bu8CA5Ou0OIf/7yJQTBTfo1P8JRiEnfwkYgyjC3utRnjAnbHSqE43Y630N3GiY+pSzJFtai5JWSlM8qZauEOjm9qhbHUQYl/OKi2qM3cUdHB9/KNdlDypcA51o8ZSifjyxF+hQQJwtPjwU/GfqmXMsEynEBdQDd4Av4Ok4nabZqcJAEedUaBKvsui++fPCnxD1zgn9cH2qKYVgUmdYVMlumk+LPcu8sbwsS8sfGKGYV+aTj5h2mN/XnYSGaI3xHLwr4ExCP4cEUWHUtiqC9OciEPwT1KymRJvFY93D56R8qotFgdlZq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAgVIpn//fneIel0+b7Om54eyZ6F64oc4KqD1KHoHXQ=;
 b=UOjTOEPfFwSt5LDjqnqaHpsGSwDcAgbAitmq2YXg/DzE/tGJs4ScV6Gmy4N33gQx5WHuroe/QmT9bWvLeXIssycw6V6rZWIMs+6SdyaFPEwiTFS0/oBkYd+3qvYzUzJN9oUO+6tXFVdvv8GNkcSBTCBjcUMHUXMjgiPK5fOOtpA=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DM4PR10MB6159.namprd10.prod.outlook.com (2603:10b6:8:ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.40; Fri, 11 Apr
 2025 20:38:53 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%6]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 20:38:53 +0000
Date: Fri, 11 Apr 2025 16:38:50 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/4] Remove orphaned dtrace_recdesc_t component dtrd_uarg
Message-ID: <Z/l92uyLqfUsbxsf@oracle.com>
References: <20250325222521.15224-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325222521.15224-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DM4PR10MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b5d7ec-dbc3-4953-1bdd-08dd7938df6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nDR39XtibvqWYKtr5Qlg944KqbhWJNodRkbTW6iZ3YEzF7PsgdXZkUL3G1/p?=
 =?us-ascii?Q?rKMSV9u2Yra3F+qoxTtPifXsmpU5RTyluVzMD8wbseIl35wDuTze7sXtx10q?=
 =?us-ascii?Q?7BIl28/kUeFg4gO70ILwW+haJPsKyw/xuEgg8vTQ3YLCq1g//RzR7RlN5fZv?=
 =?us-ascii?Q?dVMGwR12naLmDqvlSY3Itac3Rq98iWc3N+OZeqBOkA5XvM6ObIEvD3lqYlfy?=
 =?us-ascii?Q?J5c++dpe1QtLBjnOG+NHvGkTDSZi2NLDoGWrs2kAKpVlW5FKKrCaXyhEzgOM?=
 =?us-ascii?Q?AlIhKeo7x7ExdxPL8xKGqFHtgu0hTLH6tAoRtSH835gH9B89OnSfk2C7rY7Z?=
 =?us-ascii?Q?I5jP+2xvT/gbrPscajTRcKa8JKN1wF+snFX+1Cxng6YRKsRVcycAposqfGLP?=
 =?us-ascii?Q?4vsFPzo4HJsvSAOBClC6eXzzvnRZrJ7TAHmn0FWJvSaLkRS3990KaNGBvGNF?=
 =?us-ascii?Q?5vJrQRWKrbPeD8Kql2tKWf7c6f9O/qHcFxHgYT5XDERfepBfHeKgpYqmJKJw?=
 =?us-ascii?Q?P+Apf01HAx2Egjafw9NuWrJh93ajd/2NG0s1XTWX6Bfik0xCpM2MQIIlNMZQ?=
 =?us-ascii?Q?bYlOBoVEKvSYqOMdvp0lj86TSgocbDaFl10+j+GIx85LdXpRsGvMPz55OHbh?=
 =?us-ascii?Q?Mr46pJ6shgx3Ryten4/pG1ZNi0NOEBXUsWUTZAEC8OhsmjlW4rGRKEGeJv3l?=
 =?us-ascii?Q?giOfVH6rQLz1Mnj3+0fX+mgDXO7SUlm4C9H99G1yk/T16R6zSVsNwY39BVz8?=
 =?us-ascii?Q?sIed7wE1QJQO+5dvef7y/dh9qiiNCl7+rGTjxKWBfPW2y6WP4d0PgwDMFk0L?=
 =?us-ascii?Q?lCqy1XIwgTsI4UaaPJIrLepwJwXHTrXh3KH7lAORqzIqpYE4BpHvIJg0S/Hd?=
 =?us-ascii?Q?MTjgRWBv6+sWpfEpTNk3qKVAsk/9LKKjx/GewDsvM0bB+ZsvTX4bobz9PC+z?=
 =?us-ascii?Q?E6d7t/4XDE/YUR2WvTMnHfFHy+yhZgZmPilDO22Fj/Zz6AjhzBtWYDWopAyy?=
 =?us-ascii?Q?Pe4HdDvXKjKYuVFCz7Z7EyThvUdK93rgh6XWK2h1NE5BIHPC3z6h75K+MCfC?=
 =?us-ascii?Q?lu5ds9sbxCVu1bz9qEtbP1ABe6QQC9nLuvtNELwO83rJOTjH48Vh9wzmCFLA?=
 =?us-ascii?Q?qrq2Hg1TBpiU8VGVy/U+GCgNlMj2YNbVcF3p92zF7W+ps3rtEf2YquYDvDdW?=
 =?us-ascii?Q?DWQWRPvKHr+W3l9DQlXpDBNYrCapSh2+zHwjaBTI98aKMAu6rb33+FcZ2CMH?=
 =?us-ascii?Q?IYp9RIpuk7dQGeA1aYRZAI13y1lLak5sGcnpZMlAVgDhFcfPeFNHlAzvbokA?=
 =?us-ascii?Q?knvcU5iw5KogIsbBxB1+KT5glwWDdiIqzetqmYlXthgCMshKcIbC2qKDoBd6?=
 =?us-ascii?Q?A4rMhfKOoAlFyBxT3MNTl2cp4QqH4DI3mBwKToVTjZNm4aby/5ERMFT8W/IP?=
 =?us-ascii?Q?FGjmrvg1Y8k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zJsi2syuDIlbIYK1xO+e2HVEc+VEjXK7CNCcaf9w0gL1UnIIzP2p5+tVhrSx?=
 =?us-ascii?Q?69Idt1gpPibp0YqccfMZWlp7qg+KQ+F+wkEWKpO9oP91B51Dp118FdrwAiXt?=
 =?us-ascii?Q?IAOpklN8H4jjIvCpsnKtZdRWOlpRyL7AH/PKwrSU9O1J759xEfQrah9PJvhx?=
 =?us-ascii?Q?Tf61vofAqBTxe6+iQTc1UI1uwjY0G2VS5tqnh3jNyDQXwRKIOCLa65sv4GsF?=
 =?us-ascii?Q?6lbtMN+cn+b0ryOyUJ9kg74PSXQbwkzeu1ZQxsR/7NoWVIV4oTquIJ3gK+tu?=
 =?us-ascii?Q?9NZzMHPT/R0IZWUzaFLEKK/MI5VmZa5abcY8r43X3jEE4CrugXJoNTLpsf1r?=
 =?us-ascii?Q?cu9jeVzywaKViSDhxyqVT0VZxW0uTNMu+Nyw1RntTc8iE9Ga093KygPeZK5H?=
 =?us-ascii?Q?+s6F3dTyQbTfyZPDEtDMtmzh27MsTDReRGdFF05uO7aVG9ia4fEvaDbygw24?=
 =?us-ascii?Q?NboBOSnrvKCKf4sC3fSoT9vSzN3CloB7MxmTXKGpwKfJV5ctsgQQUjeuXxLH?=
 =?us-ascii?Q?1fGxqNwU2AhtM8d+refu55K4h3yOq6CsomiYV/JVNyRkBV3gXI7PtbDnIlxu?=
 =?us-ascii?Q?nPVQg5Oo6PgnQOabhHvZfTdyXA4ZnYkJps1P9AjcJFMj6pQmKF9Q4mGn36aE?=
 =?us-ascii?Q?3bd/PpnEpAqSu/yf1jCo08Vq7FW6zsjnnTFwgDk0AXggaYXVJesd1Hu6VtFW?=
 =?us-ascii?Q?JuKlh/atw41OY6UU0lsglN9syuj+881XD/61Kx33bY42F1feXivTnef2SJFQ?=
 =?us-ascii?Q?7wTJdQxAEIhyOc7d/b1nZ+U8wHdjtMjlvBO6uskizd8o6oCBT7fhcbdtkq9v?=
 =?us-ascii?Q?rI5+lngrp3K3IdwfJkACoqeV2CfZ/vP5j7m9IYrJo9lxhRZue6Ait53L/Ey/?=
 =?us-ascii?Q?W17n7JuvSlmIaBsCu4skWhymAlYz5ZDdLYczP+ZLNJNhzLuNNtklHiu9sL5j?=
 =?us-ascii?Q?QK8H6WbLEjUdRkMCE4o9VKSE2oI7eBWQvynmASBSHt/nYMHE/y2m4LrQnfAU?=
 =?us-ascii?Q?jXYAYemHOjJjgA8O3eeb26WljVLs1bKPEOO6axsIZ/p+vT8gi3iB/4Hn2krN?=
 =?us-ascii?Q?rJOTWiyVDL8vK9GqLnTUujK3XiJw/IpSYxfQ4MhST2sJ+gF2IYLbao9J+3Kv?=
 =?us-ascii?Q?qW4szqY7pbrGgkz0bM/SoxV2q/GKk04uFl+wrOYRzOF8RX+qhtguri6Dpb7v?=
 =?us-ascii?Q?npH4uGFO2HObmOWV4MBcTTKk3d7PT8BdyAzxQGcF6IrEyZKSPn0O1HdT3yMd?=
 =?us-ascii?Q?6WTpLSTgQpyIE9AU2B0lYMO9fdUfYeaa9/Q9j8zJfCAzbeKstxdYAbNCK2Wy?=
 =?us-ascii?Q?Z+6h1z5p/XBkmGCMuXQQ4s9OXrTMycLrdXTQ99zdKgNB3shBFUTavtVmZL3r?=
 =?us-ascii?Q?S+vDF1qGggoCmHESysaaob8GU6pTf3m4AJEFOHc2Lk+xd9OzyIwX71Z6Sh56?=
 =?us-ascii?Q?+7gbt1ftFMWIpSVv2H0PZRe1RpdsBH/+12h73BEW9iiYl+tiv1CwIJHICmot?=
 =?us-ascii?Q?zsIXjQzrCDZXelLi3dwKoso4Q+NGSmmfUmBs9KV3qA9Ur1R9vlPZ49YeEJTR?=
 =?us-ascii?Q?KBz7nNEv1LV/HPBoTkxmYmzeM+antrsxkjcFlL5BWfkRhnvlNxyvxdpLo0PV?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D/vV1rqxIfVNO8qiMUBCBoFea5eeoqcIz4zWtppzMYbv3JH+SI26INBWg+Ul1rnxROJK94wnQH9oRLnG65yBA0ZFfIq7lYV0C+7be6VQd0vfETkitf2B3d+dFvj3VqUyYWK81s4VBFYDxhK+3Prm8JCwKaX/sIDam58H8/UxbEAbVy8ipm5yWCw7SZrH/3EhjavsHos2GrbHIa6f6yArWv5qyVZAMYynG5IPRcRDCDPKY7/VEWSDI3+NkXXySDTeMXrgZRrUI15hDucvrg3FTckfSalM/ij2etuWUiduCct36YjqNtKBttnYdHSbRB94CzukyfR6lS7XySuaXlFZLOgHc4DqJ6VKeU5Xbi1uLt/eKLIzDWH4uml1eTy8Pr6eY0JMouVJVCPhNoPd5QsfvbXUTPWqijy3GWkSXXgu3gjLIQd94dcqjCXX3Gv/8TMpC+BKkOnEiQAYPza3tLVjTAx+akr9PIB5KVX8sZe6D4g/KuG7TTlBjw8YO0QoVcpA/aWLG4DvQwqUYj0r5aAT2oFqhbRWuWcD4p/bjScfGuWEiWh3SReWPRi67GXw7Sf86dCY73q9r00+GdnpcLIewLop3h3UJs4Qt4XI+uu9uUM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b5d7ec-dbc3-4953-1bdd-08dd7938df6e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 20:38:53.1710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wf12f8sn+hqeVmura8ac66mCYPN26U8E6vXOVlcW1U2Gr92+fZQYteBBEMGHDIRAvavJcb2XbyUez0Hn3si8LgiqjANaRdqAfbtTaFRwAfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6159
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504110131
X-Proofpoint-ORIG-GUID: sEEwNPR_ujEcpNKSwqA6EmG9BchQYi5_
X-Proofpoint-GUID: sEEwNPR_ujEcpNKSwqA6EmG9BchQYi5_

On Tue, Mar 25, 2025 at 06:25:18PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  include/dtrace/metadesc.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/dtrace/metadesc.h b/include/dtrace/metadesc.h
> index 8a4add255..b0f789932 100644
> --- a/include/dtrace/metadesc.h
> +++ b/include/dtrace/metadesc.h
> @@ -2,7 +2,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   *
> - * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
>   */
>  
>  /*
> @@ -39,7 +39,6 @@ typedef struct dtrace_recdesc {
>  	uint16_t dtrd_alignment;		/* required alignment */
>  	void *dtrd_format;			/* format, if any */
>  	uint64_t dtrd_arg;			/* action argument */
> -	uint64_t dtrd_uarg;			/* user argument */
>  } dtrace_recdesc_t;
>  
>  typedef struct dtrace_datadesc {
> -- 
> 2.43.5
> 
