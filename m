Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537F23BB22
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731646287; cv=fail; b=DYDmUfHAklRMdZGvmN66kXCr78+FdW/958bcAOjZDb/q0aBA3Jb0thQT8BkTYIZ46XsmyXghNB+O06o26GsbSolY2CGHrCUL+jXVYDsEPCGx0lhI7uv+8evvtHMti2/Sk7dwvSPrgafPsF/R1PV0CdWJ0JITbx6wfTKxXId/l5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731646287; c=relaxed/simple;
	bh=xlbcK9qUmf2dB7W1+oataFtKzxnhDH6oUH8am4eh1kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gew3Q66u80WI+X5bfULSrGmy3TgeSEESNYZcVapndfNkRFJ9xTa79YYINiDMNgrxuDpQQmjcrLNgh0IHHsXNs85A+ZPpSxeDin6s3k7pxwLkef+sw6okeqQ4ddlMobyVmgljf52w76SQCGBsfIkmDE9vBb9k6t05HYG1F7F5LIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cPzmPw7a; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JGKCe3DU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cPzmPw7a";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JGKCe3DU"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF4BaPh025311
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=lDmJooYpE7F6aGh1+P
	NBwc119s6WqDa4X6HMa9Yefco=; b=cPzmPw7adBGXxBcBE3qSIo7OkXoCHSRkp3
	d+4NRmxG3qVSoH09GOiAe/G2KLtCMuBuvrMJi/vbARdj5Wgba7uc5+iUktBdSznK
	yhxeMQ29MYB+MQAIZXsABLJxh69ybtGO0AGJj7FkdMpz5YaHnhVqdSiaj5vFvl+B
	YArBWKeTMADRJXvPvsSHbDAhcHooiSDKg9wpgPi5cawnl2jUlv6VtAccJb9ZyzZK
	RhzHkCVN+HJGTH6+jTUADVtfQZSVDhDiXCt4zZAtPkMFr6WutXQj8now0wcAVAps
	nyYd3244ICZfZKA53R5vmxX4AauQ4kkbIkdM2LoKLx/05EcvTm3w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0k2anuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:51:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF2UG5l000566
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:51:16 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42tbpb542b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Nov 2024 04:51:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmXYCEeKBwVkyIj+oBpYZDdi4xWkIJz5AF6ldJi4t8eJl6QD6/U4WINoW+BGYYOc5n+/jJoNMUCLzZmHL9HSoNIzSwEO7RhR7uKo6Ry0wECoNJIt5DFDLrXgoAw2SjO+HO2sBJeZXnoWLv4idrZXqdBBlFcnCRagOakcdwGv1fOqkUEKQqN7rpw4ZGYLNOtUHDm8GJEWDnFERteCYr93KwkHEihqxKYzH/ArkWyOfjrFlw1qx+FI8xpMlqB4MutT5UG3dxthX1XlrC39a40z1og9iAPIYefVf22qkMHjAVi9tnGRI4tK56CIWVXESTN1meykRcvfowF0UNGh6s2VTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDmJooYpE7F6aGh1+PNBwc119s6WqDa4X6HMa9Yefco=;
 b=M8tJTyW6pUXAZ9gP9W0F3EsumDKdKej2hZ6aIGpwQomhD5Kx5gen/gQcxbNWnJsttfT8nCNfcHyDPYudCNtOlSU2065vy08yjeyIqVhPZzZIb/0EL6b8mC70NVMwYOjM8McvC9P0C+v1eSfehqXEOMFnpG31EIvUzOeULmLsqlqWCKQ+Q2/1i2+lxv6Z1O4d38GmkgQyYepLtPAR+n+1wZSlawJ/tc9REAbGnqazBLgZRXqr+oq9KE/pJgkI4TG8+kNu7l3R2c8OqWh21i6l4rtqrH2a/s4Ff2WODdfLQurE/bRL+gDYrnFtEMQAqQeiJsasUfl/qe9r9UBdtatokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDmJooYpE7F6aGh1+PNBwc119s6WqDa4X6HMa9Yefco=;
 b=JGKCe3DUbGpBqnqj9BTxkN0uDzoowkJgxbSraKxQ9PG+AJNV65Z/b6RfDY8DtLojvsoOhnkakAKeUmS8piW34PEzplNsLw51CaZY1mcIMkJzJc5mZqeibUnhiEax1+gfllkSWilXhBM696SrqzpNKlxRxl/CdHUWmpy0OTDcA8w=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by SJ0PR10MB4461.namprd10.prod.outlook.com (2603:10b6:a03:2d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.22; Fri, 15 Nov
 2024 04:51:13 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 04:51:13 +0000
Date: Thu, 14 Nov 2024 23:51:11 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 2/4] runtest: detect coredumps in more
 cases
Message-ID: <ZzbTPzfO/to3Khmn@oracle.com>
References: <20241114220108.95647-1-nick.alcock@oracle.com>
 <20241114220108.95647-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114220108.95647-2-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0435.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::20) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|SJ0PR10MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: b25b7798-fed9-4d43-b3a9-08dd053121dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UJtk823vfSr+LeU5spDEz+liwI84eqNd4fpjSv3CGnEOnVd0IceKWPtWG0ND?=
 =?us-ascii?Q?VWt9/0zytGLKtv2Y/uRaIuccLbbDdPmtfB+WbPt9kRyCTKYW0POWoeQXuuzG?=
 =?us-ascii?Q?eynAjvi/k4kPabDezuxWUeaKjlr6K/1j+cXtwETgDbblS9ZYBX0TIY39UhYM?=
 =?us-ascii?Q?X/hoqWrEaq3hPF5sItDv7Y19TWN3UzWzvdU86aGae6BEbHu+Or/ed1KmVhju?=
 =?us-ascii?Q?h2pGHILMl6yyHPnrdi4bR8XoM3m7sAsURlY8WICZCB1SOwXqBfFFzzIqaagR?=
 =?us-ascii?Q?V//fcZBhdnLzm7gL4oHTNrvSpdG22/ipMqMp5c4sxkTn7XcpUomPUqBL6ivP?=
 =?us-ascii?Q?rsSvhg6o2zLkE7KVXJGm74Ez8yF4w8oepI07GNs2hV1pIrUZ2f8pnoFGMott?=
 =?us-ascii?Q?BKk4oAk/gFkmUBJBENz0Lh6pAShXvqzoalULg/8VhjUTJ1PdWRZoVPWu9y4y?=
 =?us-ascii?Q?J3LpGmtWwAAjeR6ZI+fgutzOc9dmYx/aZYbLiLu0kJC0fu3CCwSCrf4zGd4K?=
 =?us-ascii?Q?vxtK3I38AFdThMNmABXJQ8rVgqFgh8aWaIu0xbWGUI4O6ne4HyiIYxzpRXjc?=
 =?us-ascii?Q?8HnbPVxUC5UiQeJwPNxBcfJVr7O1PNKODQxhtL2BJTdQB8PcertP7m8z6dY3?=
 =?us-ascii?Q?2vWj/9RGA3D7zc5UqctWuRiN4MO2MPsU8MJ+jEgijt5c0Flc7UNkAMmNH86d?=
 =?us-ascii?Q?RaTY7HxUGNcEXTN7+xs2f4spSj5HVsBW/kyR2JE2oB6NtvbaSgHY3wBH77/g?=
 =?us-ascii?Q?pufflfsL94KmrjdtscCgVPtkSUdLBNe9Y1mjlaCUQl8F3PfIa/REJaYY3KQg?=
 =?us-ascii?Q?jFWdepwDF65Wwnm7JQHVFirp2ypSxs+74MmeagCzSbPH7BGu18pvvI5INGpX?=
 =?us-ascii?Q?guJ79riCNaJe9e+7cW2d9a3X0pEoGgF6VqouFntubQK4g8MM+rMMWOkk5aAL?=
 =?us-ascii?Q?4BH+9/QP+XZvNnsC+UnEoCBFSNA7ehRUVLeHKpw7eKWluAZ/y+gPAeRwaccf?=
 =?us-ascii?Q?kdAfHbXBgixo15hRiBGIyFJB/0OD7ZmMRjj9qodIrTLjQplqtINTBZ5aDhM+?=
 =?us-ascii?Q?Ui9lNhKGrPO3aD5759+jdX1lXkawKOFEoI6NDiTSBMQ+GCl+Ych/W+/Es0Zf?=
 =?us-ascii?Q?cr+u8e5dauocTklJB0P4dzQHymG8KXOxG3TeBo6m1R4GGGiBSOP2xkNlWesx?=
 =?us-ascii?Q?twDK1mJilMgUFS5E62fikht3ZdYdqzh0jVt4i6UjXCuKTk0nZIPO0Sw/0KmT?=
 =?us-ascii?Q?5MHeUKbeLNs6B6T/AMA6Nhu3X5AdpGVRtZElBgL7nF/a5efuX5eJ7IM0s99T?=
 =?us-ascii?Q?BTuPBAdAFGSm5zXPpu5xvT4E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KbRencMhOsFtNWFIZnHmIphjm2A8Sg+VEiHYQXmtL5/gFf8cU6OlA3YPfBwT?=
 =?us-ascii?Q?vy7mHTcF72ulWFF5yQcfmh70OLWriEiqAxPrJ5/OEzSJ3JiE/xVh041b795G?=
 =?us-ascii?Q?tvoo0baG7TcgK3ulQx2H9wHpZ0q7rxtigt7Jmb7NWVPeG/yqoll6j4lP3M1f?=
 =?us-ascii?Q?1rWqkTPMsIRUhAIA+OCkdwSZq62btMG0hYTvbBm/Unr0OCJRB6/kyE+DxnXg?=
 =?us-ascii?Q?8WiwzTAXowrSY1x62byOKQuenmH7FZgSeORQERISWwX3jID7WNS2xOlNMXv5?=
 =?us-ascii?Q?adyTtVH4KFTHSIFocR/0ixWCgUpmmQcoNL8l4IM4uUV8yff75Ug/3ocZ9DzM?=
 =?us-ascii?Q?sYYc9aeSIbwpSTyvhEI49SdQEqgWdwSrq5u13Df2MqtESyMvcqaXOXAIEFls?=
 =?us-ascii?Q?WsWJM2Dovk4ET2TgpTMJENgiocpxFro6JnelchwjGYpeUrHxlLWDv3zxjhEV?=
 =?us-ascii?Q?ioqIe7xmsEuv951glsNdssbr25kAHvdhdTfXfbKWwm9jIrlghtIxBoFMkI4r?=
 =?us-ascii?Q?Kk6DHuf6KP+rc17T4tyAUbhyCAIR9OgErea+rI/KTIMPCjqwVJsgQR0+ynl9?=
 =?us-ascii?Q?Ds2H9rfUZJA+O4F7jcxV9NSttWusoz4P1wizUDubzR6OlF20LrPpx/9Qs50i?=
 =?us-ascii?Q?/42JojseY64ggvpBfocGzm3o1lTZIdfDuuxTU26mCqMTVSI0e6TrVGOFxeAF?=
 =?us-ascii?Q?9iILPj5SfJvtsM7oSSUc9gwWiSCRSPjQDSY3btLGTcftiPaaZB/Kw1CD52EC?=
 =?us-ascii?Q?xtxMfDIX0OnEtTgpmV9z3BQ4p45R+ABCtQFNC4nfeWaPidbcDz5WOz9cgqIu?=
 =?us-ascii?Q?ly9wlmAIwINdda51ezoWUMr+qKOodV+oBiyc7fY7s6DGJwUkL4FyEbaT4B6Q?=
 =?us-ascii?Q?2B1f3DfKaXnEfgLw7dgbZ2sikWfBhXm9HE8Ml0mfvpUiOp686eKv8nYtEPcc?=
 =?us-ascii?Q?OXwAzMsZlRaPfoONjudXBrw0o/DVgbG21TEwaxWDmyHm1FDepA5kQKobBi/q?=
 =?us-ascii?Q?AJvhU8DMU0/I8IBJFmgGzMuXp4AlMb2PW88j1eFyr5T3e7fZwtcIMkvbVnpp?=
 =?us-ascii?Q?YEJABMKXCh1bX5jBfKWaolJSez+2En01/16m7PWjPFm7kcEyFgHs2+g6bVw2?=
 =?us-ascii?Q?UxMnh0gt0wkdQKRjjGAYwEKVUKNvENUhnHfbwUVwFUVT5HZZ0g040A3zV/Dg?=
 =?us-ascii?Q?xQ0hjvACBvkwExqDBIpjFMN21/g6MLg1JjRG0seTHkr6T626inPmuOVExniV?=
 =?us-ascii?Q?s4cnid8SkZQQAnRtF3VkSpsBFT9ADcBRVNTAjgMUKPZVMV6L6ahGlrY5vJx3?=
 =?us-ascii?Q?XY5LMfVW0w/UAQq60EJaC+Hf2l3BwDgcB61T3JDE7KW6JPObqdvFFZ22JMgl?=
 =?us-ascii?Q?ONj4mfWq9UGCJ7APp7fW9e8PG4EqFzWB+756YTgbw+a37W2W7e0IxnHTvhoo?=
 =?us-ascii?Q?cs1kaMS6eMmf5G12ckL3IJKnKm9iwWm7UIXda6wKBVORDUTZ1NPP7vyU36Hl?=
 =?us-ascii?Q?xoXPz7w0U+x4a9RNsJPIYzE/SlSWzIzkO+FNXK2gyFrvfuE9bEGJZ+mZzpdD?=
 =?us-ascii?Q?XH2fl7/cbH87Oovfco1NEVVnziWGmy9oy0Was2cpDfCvMYtpRo5IpSn9YHh/?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EYGHD/nOHbAJq/K2AMe/NzDQJWzH/yhKfwyeIHTWMefk6BBX2qz+MzLGAK/fb0+jTQX8VtO3oHDQ4V1iSALtQtpKQWttXw1dmW3ZGestBrYH1smJoxZUv8Zlubwpzo0078eS0wO7K07ZsI3dx4v4fVhp3CsXhrBmUeGKFfEdsf7Z4UaNTvDy8zJ0z506/ZZgsfgX1Rd9y4aT+EZd02UUovUfChddZ3105jyRyQXTlM1H+S71plTlasZxfpv4rL5OROFHXZ0Y2fs9Au7m8Ga7wXGfxwEAKgPzXYiJZEBeimsNTiY+20CDMha2NPhOubFV19ZHzsFTYu4p1FuAns05jCf1DTcnn4uThCeghEGUH1gTuVkieKrlh1w+Rvnk3ujp9+Ed1EGjmkAchLkvCTPbCfb/IcV+99I91iKy3MaII4qmpZ4rJRHiSMlTpTsgIR91rGXMT5Rqj2gtgjt2kCYSvjAioMsa6huyusr0HUwuxsj74eJg4A/ZimP5LIiT47honBHyhpJfIYhZdcOP8KJR7sohvQs7tQ8sUkc6yDkUzr9L7wzDkeuQkQbowD9R/JdSiBgWZiGbPXNW3/4eh9pqPavbC9fcyW75C5fmHYb1ftc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b25b7798-fed9-4d43-b3a9-08dd053121dc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 04:51:13.7728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ewKGJS28kHSoI7b11TP0P0S0cOW4/nY1QQlR+YBk948CElPQFhAJEe34IuxOQ/czUmqebHCTdY1eoHdO+4337HqdQi5x0cnRv6O45Fua5OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4461
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411150038
X-Proofpoint-ORIG-GUID: CPa96iXKSC_S3CwTb5MfxwgaJuFfskkM
X-Proofpoint-GUID: CPa96iXKSC_S3CwTb5MfxwgaJuFfskkM

On Thu, Nov 14, 2024 at 10:01:06PM +0000, Nick Alcock via DTrace-devel wrote:
> Exitcode 139 == signal 11 == a coredump that should be reported as such,
> even if we can't find a core file anywhere.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  runtest.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/runtest.sh b/runtest.sh
> index 46b532d7e161f..94634f80c2ebf 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -1361,9 +1361,9 @@ for dt in $dtrace; do
>                  want_all_output=t
>              fi
>  
> -            if [[ -f core ]] || [[ "$(find $tmpdir -name core -print)" != "" ]]; then
> +            if [[ -f core ]] || [[ "$(find $tmpdir -name core -print)" != "" ]] || [[ $exitcode = 139 ]]; then
>                  # A coredump in the current directory or under the tmpdir.
> -                # Preserve it in the logdir.
> +                # Preserve it in the logdir, if possible.
>  
>                  mv core $logdir/$(echo $base | tr '/' '-').core 2>/dev/null || true
>                  find $tmpdir -name core -type f -print0 | xargs -0r -I'{}' mv --backup=numbered '{}' $logdir/$(echo $base | tr '/' '-').core
> -- 
> 2.46.0.278.g36e3a12567
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
