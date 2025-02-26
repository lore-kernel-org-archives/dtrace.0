Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917352222CF
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588839; cv=fail; b=uIx7rek0kJ/e04PrxkaUVAyxNvwIaQBUauOmMx2CckgymYYvUevrh5zIG6DwKZCbCOsOA84oLlxos0UGZcnRuzka9FQHgHfuNvo6ZNWRZTZgDXjA/evre8fryiHiU7W/ocworU8ZoxxPOENxzeaMWUKpi5Sf105dYtAuldFzt2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588839; c=relaxed/simple;
	bh=3328HjzaMjiSTfYEiVxJaVhbc50uWGXoGSoT8sb7q8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jsiHvtYO8PB8IQIPL+AXY2LCefy4o5lTmZYTWA+58AOvID3ODRYgpXDMDiFPwn3QLjOH1GEdFLpoFVzuXPZuF716N0kiGgtdn2m0ZGFhyaQVZS0ygFvBRtgJmE+buYxuyEJEIXbD4Z7ILEBSDgniQP8Tgh8doKM4RVOUxnZV8nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N5+dmbUw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nye2H6cA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N5+dmbUw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nye2H6cA"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QEtaIV001183
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ZDsFUtk/xDXhEzOAqi
	BhKvjKjHDLj/syKhZxKnUZB1M=; b=N5+dmbUwjCktUv4bFYssSt0YWJ9CJAc/Z9
	PBDqEY6N13peg9xP0enS+lDxNsB9oIHO3XlqKmrcCFkxN5tkyN1R2tP/F26ZakYJ
	8iHxU1mZZeAJ/4qcERXyhKpM1xIEMYqhRpkCMTrWnqi2ViUTXb+RYmlZYdulMMFy
	D2YdrEUJYrLWYE/rHyk/0tvGW5FQjZgGsoQbCqp0m9NQEwKdVxceFR8mX1xwGiDt
	k6tS4WXBAvxBe9p3wsj3AKhQosOZD2UNrOcFi/Dar5ixCPuaBl86e2kajULJ7A3J
	uf6eNNIC0gW1nEHxJxm1znA6NLRnU1Q8wwPCrzZGrhskmGuaHR2Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451pse1nbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:53:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51QGmZ4V012629
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:53:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y51c6esa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:53:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpR0ZXEpyXXGBCof+90m0V/SEGKNrAnmULo3xCEGFynTu+M0KQLiv4U0yO2fmM7b2V12kpkAR1+eC3tz0wuJkeAJ4cx7BYZUv+6yFSCVm4bVApQ97hK6bWgbN6bwuqKzYsyEH56PxqveYUkCAlyueOypb0eulNfTgOHRfOwcmuDXw/oQ0v9t5Fzx9hQWybPonTpXxvnDp+Bl/A8u+r277YJ/JPBIGReRsqSqnlcKFTP5Awmu3Kl+zH2F7ctDQJ2Egj7/BzJIxVqu8XPO+6xZZVg1qPE9mX/Y6TUxpj2HkG+UcCoXDAJdZ1a28t0S+HXflLiexTPkmW94U3KiqOzZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDsFUtk/xDXhEzOAqiBhKvjKjHDLj/syKhZxKnUZB1M=;
 b=Esv9e6HPwZ61cSwjANPSZqnZd9eE2AnzYSFnQWY+h5QqDJRarNbrbfSvuC9Tm4GFDdr0H7y0ZfGue6F6c8OSQVNndbg5iEhQZxogOjlHfMEZn3RhGT8CD8ySo3uXpdScCo5Nn/H40pAH1UbRrMcM0zNQIgSG+++7SavZP3C7lZVLpwLNVK69C7UWYHAlobkzAraxXJmOjl7LAXlCE7Puly2AHfaA3lY2nEjN4rY2s3jNn0gQ+8pkdkklBg5x88fnn5nFFmasaArK8J5c2oWoFN4wbubYfEHoBBAoZOZueY067z1CAhAzq8eceoo8XjB4TGag2dmHbVgbp3Fs6Eu1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDsFUtk/xDXhEzOAqiBhKvjKjHDLj/syKhZxKnUZB1M=;
 b=nye2H6cASNcJSzE+yMFdBuM0qTfgQr3DWGhf7BRFsKjjYFwgUr4mzqyRgJfdyii0rGBIGo7mdD1PtCOavjxEb/MbDFKCSJEfnAVzOAcwebmnrhtaDVjoGI2CZRdz1KNkVIJDtmoF12nxK0uJhyC9b2m8NQ49RmsJSKUPzf2MAzI=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by BLAPR10MB5154.namprd10.prod.outlook.com (2603:10b6:208:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 16:53:52 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 16:53:52 +0000
Date: Wed, 26 Feb 2025 11:53:49 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] Move proc lock to where we actually find
 a USDT process
Message-ID: <Z79HHRNbPHV8ypSU@oracle.com>
References: <20250106155525.15499-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106155525.15499-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|BLAPR10MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f2b26a-fcf5-4497-ff5e-08dd56862603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7v1tJUkCTPOy8FInbv5C8XzssBXbQh8z3MIWke57m/cDl2PpGxEJkCX/C72K?=
 =?us-ascii?Q?917I433qkGoJ8O/i5LojYbsYJE4wtiLv5/tB3QVo9OtMy16IcqmFVvupsQam?=
 =?us-ascii?Q?79zeuK/G/BRx6A2oncgsGWiaJfSJxg6Cm+cfaPQgtaNDhrR9YmzAKbEZWWu1?=
 =?us-ascii?Q?WOWC9wVXQKajNrLBfF5k9phQNvKPzxT8THS1D6QdMfK6jjcbP+YYQDaPYYMT?=
 =?us-ascii?Q?DXtjBKq7pPQXQT9u5meukJEFN48Ci8M30mfaTHNTFPqaq01CVTYlMuv4Q6Ik?=
 =?us-ascii?Q?tYoIQkMHLZVr1psnwzXQjcFt6zHjfZaW+PDilUgJ38fjILJR7bChXPbxdZZa?=
 =?us-ascii?Q?1XXZCEu/kULFwA0i07D7lx8vlsIrVzUGIt5ACBoUY3kgfUDTTNBNVvurNsDn?=
 =?us-ascii?Q?EqjG3Vz8kiHgU6tFeDpsjwCtjMyp+AkULN2KEEmFlRMeEs/p9vnzkz59++es?=
 =?us-ascii?Q?OCqA+eijSTLByzrg6dIRkPLsUqMSsBxOv6dUiAZXS8aaFm5mv8ABJ2OgoLrn?=
 =?us-ascii?Q?kUgi2zNjUP497nh4PIM4xAdyaXRXVK4HgGojoOw/W/5X+GMqT8/dDRf3SmN8?=
 =?us-ascii?Q?YDVlGr8gFTZ/AInvAqmfIvmk8XLevM2hJvpiKeYNNsNrF3sWFmLVig/nkT9n?=
 =?us-ascii?Q?eta6knZ9HvTLOqpN6B7YbmgLqTA4WPJ0oOScaWWAAUOgD/muQjrBH4OhYOk/?=
 =?us-ascii?Q?YM+bF6Gu1bdKVTmzL0FYQrkVwfjmcyZMpdZH8aZ6209YK4JxAUGOYz45nMET?=
 =?us-ascii?Q?xX//Z8gRzMQWn0W6XiCk9naZIt1+MVVBSuB5OiiJV6xz6QTDpU0R05v27IAb?=
 =?us-ascii?Q?SknEe7qk8CQkvyOd9DWFr51XXj1EiUXFrOV0W+y3a2c0WAv3xqu5glFTcI1E?=
 =?us-ascii?Q?ZDUZ//CrOrf/Gzpyx3Lso4ZUEk1bodzoYjTm9o1eSybYtTzw7rYXe05uuu/d?=
 =?us-ascii?Q?wRMqJF/UK/z4shnY43ZlcpIvsngbd/CV+/4L50ZcMATOOBxrcN1daxyzv3V0?=
 =?us-ascii?Q?SFIPHq21cXeVGCTqt8MHYqoLJ9cFmu0B6g8LOlCjMkS3IyLmD6yGRpteOG1p?=
 =?us-ascii?Q?Grh+7vB9aU9IVMFThIJ0CX3i76E7LQ2zFm+iTjMBI/H28cOMRH5U1oAW9AOM?=
 =?us-ascii?Q?fe9fmarBfMZpECJ9IdEvDqvLPe1apQ+u/PZ/fJfeHbnzKbG7VOuW++tkr+Z1?=
 =?us-ascii?Q?zcjIDybKXTs7PmFrXamI2F3RJXXZpDU6bTVHTHmT+S3rlyqsBfe+Omba7o4V?=
 =?us-ascii?Q?fOWCZlbtSt+llU8JMsx8KCHSKous2TjmnWGPZaUWWKCg56V+MAgZcD8OxX4Z?=
 =?us-ascii?Q?qxsdxLLEIPsdFjH/mgQqMUwmpNaUTSHhWomVaOOwsMfIwhvKL13Y9xe5rwnW?=
 =?us-ascii?Q?JT+hnmUk1XEzvkHADxXiWu9GPVT4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?20JY9YRKhv1s/W+cdQbVibqY3sRbVNUM2uj4META6QUtCKe7u9ih7XVULgQt?=
 =?us-ascii?Q?14sJ8XfCJir1AQ2QIrdk6sfG7xzyDRENT0rRsCIZpqxnyHJpcothZjSz0TD7?=
 =?us-ascii?Q?eCW+/ifNC3LVfbh3ayzX4NDwBkk6JrsCI+v5TSwVG8wOlR2Wvfat/Q6QEMdy?=
 =?us-ascii?Q?f2X12JByxYkr+bBz5SHH9d9oXoZNUpqIJK4tM39KDOKB7KKbJgOHkl2wNzvc?=
 =?us-ascii?Q?I+CG9cWldLLKMB0mZVQJWGkAXOp9lMpSwOzwUq8Cw/uzcJzcLra/n96vmzPs?=
 =?us-ascii?Q?2BYFFgMz85PlSqoQYxASoOtWCYB5pB0q3FJigoBvuupxfVkOH4MVLvTd1RiR?=
 =?us-ascii?Q?FBUqltkxWu+94lXivdJRSLWAm0/rN16+EVy/qWwYUQG9gNg95dWCjuJ6WnWu?=
 =?us-ascii?Q?dsBbcra2iPQZnZoqu7tf4W+rCi2T3d7U4BVQSQ/gObRqc5UIBQLXGZy/3sq/?=
 =?us-ascii?Q?J5iI53RBIk/MYtK+v68bisuL9uL8o+Uq8KmmgBp0EHuFjY/cnkoQ1eihEgEg?=
 =?us-ascii?Q?3BNK5obvVsTV8RMFGUgcYs5tAx8b93xgAYFy5CJOppznx0hZxwoGsIvTUn6v?=
 =?us-ascii?Q?bG1SkKPp5tBZQFzXvQpIniCU3o5mizaHHGDRnGRoRRyMPR8ZpthgznKT3UnT?=
 =?us-ascii?Q?DDK4EIeTyKj7ToiIN9yWrRncK07arSCjzHnHJ6DNqSHNJQxb9/G2lyhxuLtK?=
 =?us-ascii?Q?+ArxMlPbDyhCXE8FFuyo/LF/EKAZedKWqR0ld4g+CqF/9Qy/6rjifkeObQH3?=
 =?us-ascii?Q?FPz5UJYx2tXLjUlOMqymLRP9mISd05Or/mk0NXLu+neHWh452n1TNfT9ULxN?=
 =?us-ascii?Q?wB3/X1dtQ1Uv7IqTrfb95+4cxq9yq0QR0ToOfv0t2rrD7Qj+KCOOoAqlU9T7?=
 =?us-ascii?Q?/6YIlGeIXp2VcozguapB0eS6ZTCwAkC3aVT9d3eWivE0KYDaIvzuwror/g67?=
 =?us-ascii?Q?qWl3mpW4B/ElGTHOxiTqoS38++7h3REDbNl/E9smzhEXFALQhciwAfY91vUX?=
 =?us-ascii?Q?I54ze64zmZmyTlatBuI2Sb4oLCYO+QkPMNZmReRsAkWIqaMPzn1hipWBDFf2?=
 =?us-ascii?Q?MExmWlE/yj8B3ey1cANmznWkvkhgxCQ+dkhKxVzASdjNbDIErSQNnIjsOppf?=
 =?us-ascii?Q?LjoJBGUgo67SULa8ILvk5F8YsuuAf92+nVaYLZ55M855txd74rQpIm8oVI+j?=
 =?us-ascii?Q?j206+weXA+kYoD1KJzEDzM2J0r5N4yOBTD1RTWEq9axX+/9DIYBecewDbCvM?=
 =?us-ascii?Q?PH3+JHDuUnPJB19kTfacn97fkwTJQBCHiAXFQEsH3S5UzHYoG5gkQ53r1dnp?=
 =?us-ascii?Q?J9kJy7jnVD/MsygPHhne+D2QXj2csjIcr8IQGkJ1Ga38sH5FDUSD5bH8IqZi?=
 =?us-ascii?Q?b9pzZlK1+5dKzOxcjPWp8RCuvHxHrOaERslxkfwsK92clac30OIpddg+p03F?=
 =?us-ascii?Q?4v67/CrM27t0ukpOcMtk4DOcK9r5R1Oy/Zz1suQTwxky1+K7GDjhTu473Z6u?=
 =?us-ascii?Q?I2NmbIx2rA1apsGtqvBsFuZH49Y02KUJvijCnrIvsTiLNZ0WwDY/NL+ELkS3?=
 =?us-ascii?Q?aMdyEYiovDtmoVxLA/WY+TSkt7HYS8NfxYXIHRuwthWhTQH7c4ItfuoeV8DC?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rV7dPHexDWEgxNTGa161MP11pVsuMc3cwskcsl2AKbUnWbNmN7Qu9JrUUI3NoUflE7CThm9RTkKtMNDKUD1WRz6lUdnjHooCQ7KSsyO8dVIHCKjbvm6ayepKJXKGXdkLHQcSGOR0mf712oXky2fgnrM4mcc1A0WrqYfO/n3OnQigk76mwKPAVwr0JC0owm00lVTPEblWV/GbOJ/Jy1MqGThti8XNsA/Kfns1C0edTR30rsNVh2t3jcKIv3p3Yz3qNkZJB8lhCIW/XJk9OUP1BAXyTQzkSzDT63bsNuLbl8oQG8mHdwzk/NRx180JMHNtW0sfota0mc+tOPQSmSinK2PlVlbVjxgVs6jpDYsi+LpKIcsQ9NLN+EvPmKDJJEK/j8cdMTWyTthc/kDVH6/ifFGzPun2F++aWN9bqHI+a/FI+bTJYv9z3bkWWV00qk5WzZiS21Qio1LW3hsJcj0j40KvI7O5ohvvs0q5kbLhzhbeAyH/ODg43JRWXzqHSU4VIkT9+bsVLRM8xc2cFx0I4As5R4las5MckyDCQviI+Ywh1+s1xxGO8Y/ngiFW07oPFzOvf19vixZjuKhjBdr/zXi7TDyEet1XZuxSdD8m2E8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f2b26a-fcf5-4497-ff5e-08dd56862603
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:53:52.1804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CI1TqTWZ7AR4QbF8PDavFT9lp+hcXKkHZQ/53icpAFg9dhOvab2cCbLPvDzji//cqQ+PoeoKKKt+lYQJ9fSAukO1zFg8WcXRzyFhJWmwgf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5154
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502260134
X-Proofpoint-GUID: SmjzWlxS2_SuNvPjizQrlV-7BT5YH31j
X-Proofpoint-ORIG-GUID: SmjzWlxS2_SuNvPjizQrlV-7BT5YH31j

On Mon, Jan 06, 2025 at 10:55:25AM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The function dt_pid_create_usdt_probes_proc() creates USDT probes
> for a specific process.  It is called in one of two ways:
> 
>     dt_proc_scan(dtp, dpr) ->
>     dt_pid_create_probes_module(dtp, dpr)
> 
>         The process has been locked and we are updating its
>         USDT probes.
> 
>     dt_pid_create_usdt_probes(pdp, dtp, pcb)
> 
>         Here, we look for any pids that might have USDT probes,
>         calling the pid-specific function for each candidate.
> 
> One problem is that the first code path assumes the process is locked.
> This means the second code path has to lock processes even before we
> know if it has any USDT probes we care about.
> 
> Change dt_pid_create_usdt_probes_proc() so the caller can specify the
> process in either one of two ways:
> 
>     by pid (implying the process has not been locked)
> 
>     by dpr (implying the process has been locked)
> 
> In the first case, the function will lock the process, but only if
> USDT probes have been found.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_pid.c | 70 +++++++++++++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 28 deletions(-)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 8110ccead..6db882059 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -782,33 +782,42 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
>  
>  
>  /*
> - * Create underlying probes relating to the probespec passed on input.
> + * Create underlying probes relating to the probe description passed on input.
> + * Just set up probes relating to mappings found in this one process.
>   *
> - * dpr must be set and locked.  Just set up probes relating to mappings found
> - * in this one process.
> + * Either the pid must be specified or else dpr must be set and locked.
>   *
>   * Return 0 on success or -1 on error.  (Failure to create specific underlying
>   * probes is not an error.)
>   */
>  static int
> -dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
> +dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
>  			       dtrace_probedesc_t *pdp, dt_pcb_t *pcb)
>  {
>  	const dt_provider_t *pvp;
>  	int ret = 0;
> +	int dpr_caller;		/* dpr was set by caller */
>  	char *probepath = NULL;
>  	glob_t probeglob = {0};
>  
> -	assert(dpr != NULL && dpr->dpr_proc);
> -	assert(MUTEX_HELD(&dpr->dpr_lock));
> +	if (dpr == NULL) {
> +		assert(pid != -1);
> +		dpr_caller = 0;
> +	} else {
> +		assert(pid == -1);
> +		assert(dpr->dpr_proc);
> +		assert(MUTEX_HELD(&dpr->dpr_lock));
> +		pid = dpr->dpr_pid;
> +		dpr_caller = 1;
> +	}
>  
>  	dt_dprintf("Scanning for usdt probes in %i matching %s:%s:%s\n",
> -		   dpr->dpr_pid, pdp->mod, pdp->fun, pdp->prb);
> +		   pid, pdp->mod, pdp->fun, pdp->prb);
>  
>  	pvp = dt_provider_lookup(dtp, "usdt");
>  	assert(pvp != NULL);
>  
> -	if (Pstate(dpr->dpr_proc) == PS_DEAD)
> +	if (dpr != NULL && Pstate(dpr->dpr_proc) == PS_DEAD)
>  		return 0;
>  
>  	/*
> @@ -835,7 +844,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  	assert(pvp->impl != NULL && pvp->impl->provide_probe != NULL);
>  
>  	if (asprintf(&probepath, "%s/probes/%i/%s/%s/%s/%s", dtp->dt_dofstash_path,
> -		     dpr->dpr_pid, pdp->prv[0] == '\0' ? "*" : pdp->prv,
> +		     pid, pdp->prv[0] == '\0' ? "*" : pdp->prv,
>  		     pdp->mod[0] == '\0' ? "*" : pdp->mod,
>  		     pdp->fun[0] == '\0' ? "*" : pdp->fun,
>  		     pdp->prb[0] == '\0' ? "*" : pdp->prb) < 0)
> @@ -858,6 +867,19 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  		return 0;
>  	}
>  
> +	/* Set dpr and grab the process, if necessary. */
> +	if (dpr_caller == 0) {
> +		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
> +				      DTRACE_PROC_SHORTLIVED) < 0) {
> +			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
> +			    "failed to grab process %d", (int)pid);
> +			return -1;
> +		}
> +		dpr = dt_proc_lookup(dtp, pid);
> +		assert(dpr != NULL);
> +	}
> +
> +	/* Loop over USDT probes. */
>  	for (size_t i = 0; i < probeglob.gl_pathc; i++) {
>  		char *dof_buf = NULL, *p;
>  		struct stat s;
> @@ -1051,10 +1073,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  		free(path);
>  		free(dof_buf);
>  		globfree(&probeglob);
> +		if (dpr_caller == 0)
> +			dt_proc_release_unlock(dtp, pid);
>  		return -1;
>  	}
>  
>  	globfree(&probeglob);
> +	if (dpr_caller == 0) {
> +		dt_pid_fix_mod(NULL, pdp, dtp, pid);
> +		dt_proc_release_unlock(dtp, pid);
> +	}
>  	return ret;
>  
>  scan_err:
> @@ -1237,7 +1265,6 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
>  			  + strlen(dtp->dt_dofstash_path)
>  			  + strlen("/probes/");
>  		pid_t pid;
> -		dt_proc_t *dpr;
>  		dtrace_probedesc_t pdptmp;
>  
>  		/* Pull out the pid. */
> @@ -1247,28 +1274,15 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
>  		if (!Pexists(pid))
>  			continue;
>  
> -		/* Grab the process. */
> -		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
> -				      DTRACE_PROC_SHORTLIVED) < 0) {
> -			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
> -			    "failed to grab process %d", (int)pid);
> -			err = 1;  // FIXME but do we want to set the error if we end up return 0?
> -			continue;
> -		}
> -		dpr = dt_proc_lookup(dtp, pid);
> -		assert(dpr != NULL);
> -
> -		/* Create USDT probes for this process. */
> +		/* Construct the probe descriptor. */
>  		pdptmp.prv = strchr(s, '/') + 1;
>  		pdptmp.mod = pdp->mod[0] == '\0' ? "*" : pdp->mod;
>  		pdptmp.fun = pdp->fun[0] == '\0' ? "*" : pdp->fun;
>  		pdptmp.prb = pdp->prb[0] == '\0' ? "*" : pdp->prb;
> -		if (dt_pid_create_usdt_probes_proc(dtp, dpr, &pdptmp, pcb))
> -			err = 1;
> -
> -		dt_pid_fix_mod(NULL, &pdptmp, dtp, dpr->dpr_pid);
>  
> -		dt_proc_release_unlock(dtp, pid);
> +		/* Create USDT probes for this process. */
> +		if (dt_pid_create_usdt_probes_proc(dtp, pid, NULL, &pdptmp, pcb))
> +			err = 1;
>  	}
>  	free(globpat);
>  	globfree(&globbuf);
> @@ -1341,7 +1355,7 @@ dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
>  			 * a USDT provider.
>  			 */
>  			if (strcmp(provname, pdp->prv) != 0) {
> -				if (dt_pid_create_usdt_probes_proc(dtp, dpr, pdp, NULL) < 0)
> +				if (dt_pid_create_usdt_probes_proc(dtp, -1, dpr, pdp, NULL) < 0)
>  					ret = 1;
>  				else
>  					dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
