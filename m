Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510E26ACC
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 20:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761078669; cv=fail; b=pQJfGtAo9ahsZv4vkqgGL7DGU2dbYpdPbkRPzti302ikGZLtZ0rye5wlAl7NKubp6FKI5mvDsHIlNDtqXYhF7P8SJONpUF6NcYi0sbJkJ3px+ci5MhCrEiaenWF8HsssWvNbomrhipUrntnUynVsuB/ITB0eUK4IWenFS3rvIpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761078669; c=relaxed/simple;
	bh=va1u4JGqMEbGca7kENs8zBEwEotm5H5nUEfSRWiBgx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fJ0nA+jK16WA2xy5xKCYNA2/gpwMseaZ85OAdY9+FlxfT4Lk9dr/XnZcOmMJ4hB0ssbuug6uZVEPEjJOqjzna/3wMsuGKfU+BUDWFD2fCVhFHf8499TkbL+XJR4UWC9zdfdC5oAZFyjiV1R7Y0/uiO3ahdWDv+ynA+5Tl8mCmQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sCGEEkCs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lRN3QWE4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sCGEEkCs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lRN3QWE4"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LI7ZSw031108
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 20:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4JJeJZa3hzE0q1qi20
	8Bia8/ztCG5z/UuxWL6uRzRjM=; b=sCGEEkCs1AoOdZ0L9oIyDTc7fydKxBV245
	+qY8DUBfnqNoDXEMv/pN2QWFIwnQalcf8ZTQ+CFy0bf57BMJfPdZrbkZeo2V07g5
	3Cd2kNpBZ1HCJdulDGXRktles00KpxhoFzX+hi6MdB+4+L04GhbWU3F2X0DkohQl
	t4vXvaSMmzUQhM/8DFpC3QE4aprouHzBBqhsLC4oxMFmHIP+BTSGkPUyT3r+VY/F
	80huyGNzCU0LAb3d/prpo4hhc/qAZDRuaAlY+JsSEQTOxe3/cELhy+BzA8bAdHiG
	Tmr0tWAiyHPeWmD1U8RlrsE9+dOfwyXJBZ/Pr3gKL+dNNTK0Xnmg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2ypxjs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 20:31:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59LJAKOp009394
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 20:31:05 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013061.outbound.protection.outlook.com [40.93.196.61])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bdjq21-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 20:31:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDPh7dK6128/4NWX4YusVHLrX6IZ/LGWFKo0QIhI9PnjlbrBE4yPcpvkdB0QPxyFQP6ugBble2NxAWyf6FqM3pMcckAfX2y0JYW3nHpVxIoYcs6zMo+c+M1umj5AJzpd8iJam2wOaGcuTL3iF2VbB2R/JCVas/eO7wJGybqP9RstEd+eiu1tMBGg4CbK5ArFek18x0cIGlVhf6JcPKAV68nwQ9fuC3go6Vxri71QH+XBalsc5cVDcSHSiwuX7sGoctVsSkWboFuxCwKeqthn4VBTzAGqFBQUziH1eMg7QpzNuqG0ZlNbmzsdEFL6go6KMuZNnW8eqK7AYPJn8qmlww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JJeJZa3hzE0q1qi208Bia8/ztCG5z/UuxWL6uRzRjM=;
 b=xkwE2EQh/sGG1oeUn3sthNeW7IBVWqeoSfj8pB0tnnZMoKkxczlcnnBFyHOaLa/2A9IUN6PTGVuixnsSWZcdg1krbt1XicTns7JX2SMesijHwr/r6NNWzppBmFV0paIemU01RwQhH1ViunbYFeHc/tCIrXeuGwo/08Qu6BzwnfjxtXD/ajnre5+rjhxg88q00VkxrdJR3a8zV46xdZesHcXaypf6pAzJHYhjT9N4Z6w+HSpRrG67wz8J5IPHqB0KBqaetguZT+5dnWqxLEyjU1KwU5wl4/UUr9Tu4gfN7k3Q7WtP8sdBduVvwZbgQID2fEWAWBoNECLSEmotnYD49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JJeJZa3hzE0q1qi208Bia8/ztCG5z/UuxWL6uRzRjM=;
 b=lRN3QWE4cag9PF8/M0063WagHdlfYzrE+W+NVGX7uLl7Mx71Tnn+4pnQb8iVWSO66SYxe50kKg+GAmGigZM20IFCTRteL1Bl62RGjpXcV73SOdPcTruly++Ua3+6nmj9m6Drp/OtZxFIsCMFaIhInOTBiaca00VnOnb1bXhCNmI=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by DM4PR10MB6280.namprd10.prod.outlook.com (2603:10b6:8:bb::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Tue, 21 Oct 2025 20:31:02 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 20:31:02 +0000
Date: Tue, 21 Oct 2025 16:30:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] doc: Add rudimentary documentation for using [u]stack as
 a value
Message-ID: <aPftglDfrOU7YCW6@oracle.com>
References: <20251010033337.4397-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010033337.4397-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|DM4PR10MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: c51e1c8f-e7be-41ab-c3cb-08de10e0c038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AvXcUfLqiYMNcuCH9uKPAiMuuXmBbQeFgBASpIAs1WnmGK0tBv02lh1MYlQX?=
 =?us-ascii?Q?Qw/PXwBOzmyOS8645jxsseZ/eF9xrffDg5yENjR1OvTmPrZzJnSW85RCu0bJ?=
 =?us-ascii?Q?7iui9B6p7wRPbY46NHSsnMtpmWNeIsFwm5VuhyztRbEA+Mq+kzb483H3NmxR?=
 =?us-ascii?Q?dAnTYNhkEB6cTUTHYapnjg+ItdLQ6+M/GG/H6e1OdHMXVc1i3/GU25WhOcI9?=
 =?us-ascii?Q?ClT+9uIqZRrcdfjG8vNC4/8JHS4sLi+RIQXjzEk1tGTGfjypakI1jsXyLDBh?=
 =?us-ascii?Q?REbLKgeMdRerA4WOx12zziuBU074ZyxqB4JiPGL1AwAHk5RbX6KgR4UXDo8V?=
 =?us-ascii?Q?xTz7as2GvshVC8ccbKr+bx1gGoQoPrw2hzOgj+Na45XxiH6ldzvIuKuc6cHG?=
 =?us-ascii?Q?lNkjBPTziBOhirPDAXDT045ca7QHEAxeC8xl7cMvk1yNPQ/IUOz3xUFZqtPL?=
 =?us-ascii?Q?VSxtEl/amRCUK7RKFiNjDLnvWX3ry1dobHUYkBThNI1MmdaxGmnVaqakoH13?=
 =?us-ascii?Q?8Gg1goDGb9KLK5YR7acIFlBnNRdckkw/qJKMuIYa+0MR+U+chouQJPeKNmZ1?=
 =?us-ascii?Q?NnDYCZsWXSdzURXgMSkeflUuKnCmkp1EUh6JdBzb6seHrjfRIy3mLZU5ilgs?=
 =?us-ascii?Q?5k44W+rEwMtbhOkwBKEzgL1RcAeqh6Fpy9I10Z1TH5JbV3jq8kYRls/XxaIG?=
 =?us-ascii?Q?1OREofaxL64SXe0Ssar28t55C0kUbTac7sBIujhuCzI4W+qHWelpw27TAWs0?=
 =?us-ascii?Q?bKaTZTjTL4OA6UX9idK1+aeQRc/9IGyfY+4/E4hYCYyp8ZVsbAIKqIzGKRXz?=
 =?us-ascii?Q?0jKerfJznIttg25QCJpevlmgkwg78Zi/OSKgJW0d9PZqq9HiyrOBhtHENBgR?=
 =?us-ascii?Q?yBwIwLvptNInYPO6Wb6upPbU0HWXeZLDvXHlsN41PXoIP/jIdpYBgiYrNZQB?=
 =?us-ascii?Q?fQRW77N71D65tr5n2tLV1ycjTnBzBaK6H7l2B3FV5VTJqZjgsjA/p8HinsmI?=
 =?us-ascii?Q?Z3qiCWRyLFXPP0e8bjmrJFX1Up3IQiqqdM1Vs2hW3Tfp6bCJvgsUYn6CZi1A?=
 =?us-ascii?Q?wrjCU9zM+IRAnrHtt0i5c56oXv1zZyubke7UNJCv8D6XWH8GafVTx95CR6g+?=
 =?us-ascii?Q?07Gp3hfQlFHugKDfPnjFJ/kPPr6EOLTCom7oqvTKJd0GgTAR8Nx6f3N5puL8?=
 =?us-ascii?Q?OFof6AlHRxvKRhobena6deAqeu8N58eKv1kBe8fxabpl+2sSGEEoTLLYnjLM?=
 =?us-ascii?Q?f2dkiMXZdhf/TxFg6/DrAbQ1tEDxPLZUiOjTiMRIG+QMaGw/l+z49zwrZFFy?=
 =?us-ascii?Q?jWPEalY/I+2A6yU3KOYfaACLCI9VcD9OQxVdaOhB5VWdqgAodhnYzAZm902Z?=
 =?us-ascii?Q?NwxIAl9+Ir/XQQ7LFF1EEDk3pbE44bR/gYMDaWAHdaXyeO3bn0jHrCPHCMMr?=
 =?us-ascii?Q?5TIYUd8dfFfJ6s2lvLKI/ggYvJ2iyiss?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?54hAanyy90bDttdmg6DsSvomYhPx8XffcfZdNJKjGpghjuhitZN4mbaYa9V9?=
 =?us-ascii?Q?41CqxyZwV0co5rKvQLaZWQlCzkdMpRkGIKanGrOKDV6bsnspJqxmQFv6iTxX?=
 =?us-ascii?Q?qmKE5nxgCswFzhIA4R0zSKfQNGaTR5Rns3ykHut3SiQBeN7nYlCMN2MDHnHS?=
 =?us-ascii?Q?fhG+V2L9BRNS4MXvHMSV4RtM9V8RYcmKKBZ53ajOiSJxXMq8J/n+iy0b4g+e?=
 =?us-ascii?Q?fTkiDtvd8nTSl1JjkHHy45IPACDjIy4rFXRll5z4CqIVd3zJWYslvckuF1TB?=
 =?us-ascii?Q?qpFihw+Q8B6vYfvJU71Rc4bFY1LDbj2FumO6I3f4f8VpS8xV7NBRI24Iivb6?=
 =?us-ascii?Q?+eXmZvplf3jNeVyNx8KcaqcWeSnH3hyalQYC6jVlznErx1lhXelElpDJTIKR?=
 =?us-ascii?Q?8JxTjT0yOKQ8bTfRMXx2NsdYby2fLg1DPNkYlupbSwqMKUejEWIAOXwlBf8z?=
 =?us-ascii?Q?tNuVlhmfOUxcAoMGzesCW9SQ3n2S2e1e0i0p+DX7Xk64DE7AFKKA1FBfuU8N?=
 =?us-ascii?Q?NEEqy2Vj/SXmtsegBifvdWnhmjSxQoQnVeoV0we6RsGwJoV1EUjkiMzPF/DO?=
 =?us-ascii?Q?jj/palTkyFJmghXzE84OJHrbJ+8E9C+nCoT/gMDs/LrPOusS82PjYGmWB6qz?=
 =?us-ascii?Q?LaZehlH94oikHDhcivOkbFNlPFsszq6GAiBQQrg1N0/KjDmdUojFQfadn6N7?=
 =?us-ascii?Q?uGKnqe6G6FhSMYf7/Mnbm//Qalp8A+zY4ZAuAjHY3ruxnei4eIWRvBoj9dby?=
 =?us-ascii?Q?v1vfJCZW+vq8EigXyGIBcFExrEPp2hRGn51CsqUdXYayVwUnyaJRDwmmUxaV?=
 =?us-ascii?Q?eoKrsjnCH95Bjmku2awZc3SjnRIjxpEhhVWGbHdeLrmpal/iP2wO8yp7uXcy?=
 =?us-ascii?Q?zes6IZq9caQhwiBqxqyoys6E/Vwi9ZDrD1pmlrBHePpW0Y6QvkX1Qdrtwyw4?=
 =?us-ascii?Q?u1wmighGAgIEFR8z0rUNhO28/VuOVuxRgbz0UA7lrN/1GYGpUVMeSTV7azh7?=
 =?us-ascii?Q?v83eSGebJfl9KM2lbICqOqNqWCWspwpw/B1emr1GzjtFjCP8p+xyDaxZfxA9?=
 =?us-ascii?Q?MDn8hJ4PuxFKXrcFyEj6D4Is0tZrF40UU1SMJkeXgubTM1g5dRjiLcrkZw22?=
 =?us-ascii?Q?ktxNpLrLAxpAl821IsubSUnGAZbuVK+OEvWD6uQo56ZBTpXpsUZcuKXJiDj2?=
 =?us-ascii?Q?WnDkExvD3sFHPLol2vtnwLdx/6uAG8cF2IdHBHATkcwz5chsxbkcDDX6Czqq?=
 =?us-ascii?Q?Yb5Nn015d2d1RrqYkmmNEew1fxClNN8KREw8QSRggV/lTD9rgYz5opEZi1U3?=
 =?us-ascii?Q?03jLApM57P84bu8DblE0dyQ51ng6f+wbucnZ0A7MFexGPHPnKrq59pJ+6DP0?=
 =?us-ascii?Q?tK7QoRMrpZI0+GmxaiMRUpq4Zq/9VHhHD6l8rhfzMw/EDUIXZPyemXOuGOpS?=
 =?us-ascii?Q?AbCMli2R03Oi5Fc/ua7Fs/eNDKzmRQmkWT6T/mcMtBdTrcDOJGgymMaiCVy8?=
 =?us-ascii?Q?kelSaa3Rjf7/FMC8HqTF3Eade+IcfwZTgdwFzdzdrB5k+AMQ6sdGTv01JEQq?=
 =?us-ascii?Q?PH2GTgjIZ20zBECkyR+dX/kRIba1csDXrNVscaImVi4y20gwJqEa0GzW68ia?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sbfI05y3BOOs1Glck1Br4G3+rgGkljolUWkQoX4qPk5ze/ORi0OGxJwg2XrGRd88mJbUw8o1jwRDRuSXiIvQ/zXkG/8mSrphhd7lyQ1brJEsBhOI3IfSqpSuTXmk1gRbgBs0B1Ny8ucX4Y6JoFCCxc51TvWp0bcZk9X6XMo9gIp3tM/YzA57JX6zCbdlJA5cnimXGOAb/PaPmdu7qPOCCJyLUJWkiqUZp3J1kYJQxRILPSNH/I9JohEe/jrhFExpP8WKfM9wmKDMCYLXRc1NPkpB5LIhYll4bBM/1KfFkruDr0PyqIcR2HDxgQE6RBv2kIorBmbrgqUqXnyLQSGxHUiCOBLgtTpBgx0BJD9dSLbB/KmQKhC5qBBJzGM1W8JfiuxpMUUrkzBAX4qYpSrO91MpWMw/mkMbWaBIjVpwE+pQthdCAASIWkxMGvBcCFbmdMPGs45hVCkOUc8B66st9x3d4lB91fIdtDTpIDg426Ehzzu4fddDX2M6wGENsGZ9KC3VDhPj6UjyqzTpFrNT/1/wsj/DbTX6/2r9DML/6fbIQOYqb3U63/4zXzmOep7O3SUsrdpAWxxPLb1IzcLhMe5thCHDWi9614zJXX3Vk9k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c51e1c8f-e7be-41ab-c3cb-08de10e0c038
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 20:31:01.9651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWElP1iN2yaS+HF9IUjmybjovV4CG+hd10p5AJNM45NG01JZBRetxX6I1vuBU+43h1iLRIWviGCePKV3rvjonExsTUQPiE/YB2yOfZP+hc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6280
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510210165
X-Proofpoint-GUID: hRgHgHAmyhmxluzndoTOq_1mTVWmgFJX
X-Proofpoint-ORIG-GUID: hRgHgHAmyhmxluzndoTOq_1mTVWmgFJX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXwfuzg1ZD8Hcw
 zxdWhf0pNCGqUCwFfshC2YU968nw39dvERanGEop6osajXaoeWXP/6LOWB4/la9ZjoXminIbOXc
 GZpwNPJeYcrE/uIcJsNdwZVjSAfHuQDjlAQaM2nr//IWardAbRhaKJHj48j1da93x1a398aaOEV
 dHv/OQI0zv6FvLvhhJVpReb5liHv8LVRv/E3X84eHTvct2VQZtYYhWDOliy/kyrBU3UAdOiet3f
 FkTEIiADlrZI9Rk6MfjGlMsHPDml1ZaYaw83Js5TRvzh+Z4ReOed+V25a/8HqGjsSTx3v2G9L+/
 AlGmuJ6Po1fpVw+qZAWET5y5SexRE5OpRi8hyAV8MmuQft9MP3w1p4r/N0vI+6DiIsf5M1DXPUU
 4D+1b8uxwACIwmMmiL9Z1zXKLW8jkJAdMIwZg5Ckd0owDzf7KPY=
X-Authority-Analysis: v=2.4 cv=Nu7cssdJ c=1 sm=1 tr=0 ts=68f7ed89 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=j8ssfbmpGP2Rcz6JDmEA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12092

On Thu, Oct 09, 2025 at 11:33:37PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> While we are at it, break up some of the super long source lines for
> future maintainability of these files.

One initial comment about a complication in the userguide that predates all
this...  It uses 'function' to mean both 'action' nd 'subroutine' although they
behave quite differently.  I guess we are stuck with that, though in documenting
stack() and ustack() I think you need to spell out the two forms because it is
going to be more confusing otherwise, especially because:

    stack();
        This is an action that records a stack trace to the output buffer.

    n ? stack(n) : stack();
        This is an expression that does nothing because it calls stack() as a
        subroutine, and thus the result is thrown away.  It will not be written
        to the output buffer.

Clear example of action vs subroutine usage (statement vs expression).

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/reference/function_stack.md  | 21 ++++++++++++++---
>  doc/userguide/reference/function_ustack.md | 27 +++++++++++++++++++---
>  2 files changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/doc/userguide/reference/function_stack.md b/doc/userguide/reference/function_stack.md
> index a92c61a0f..d172dd017 100644
> --- a/doc/userguide/reference/function_stack.md
> +++ b/doc/userguide/reference/function_stack.md
> @@ -2,17 +2,25 @@
>  # stack
>  
>  Records a stack trace to the buffer.
> +Alternatively, returns a `dt_stack_t` value that can be stored in a variable.

The implementation actually makes using stack() as a function (subroutine) the
default, and using it as a singular statement (like an action) is the ore
specialized uae.  I think that the documentation should reflect that.

>  
>  ```
> -stack stack([uint32_t *frames*])
> +dt_stack_t stack([uint32_t *frames*])
>  ```
>  
> -The `stack` function records a kernel stack trace to the directed buffer. The function includes an option to specify the number of frames deep to record from the kernel stack. If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option. The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
> +The `stack` function records a kernel stack trace to the directed buffer.
> +The function includes an option to specify the number of frames deep to record from the kernel stack.
> +If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option.
> +The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
>  
> -The `stack` function, having a non-`void` return value, can also be used as the key to an aggregation.
> +The `stack` function can also be used as the key to an aggregation.
> +
> +Or, its value may be used as a value to a variable.

This again makes the use of stack() as a subroutine more of an exception, or
almost an afterthought, rather than reflecting that this is now the default.
The use as an action is the exception (preserved for backwards compatibility).

I would highlight that stack() returns a stack trace that can be assigned to a
variable or associative array element, or that can be used as a key to an
aggregation or associative array.  And then mention that when stack() is used
as a singular statement (action), its output is stored to the output buffer.

>  
>  ## How to use stack to obtain a kernel stack trace for a particular probe
>  
> +In this example, `stack()` is an action that prints the kernel stack.
> +
>  ```
>  fbt::ksys_write:entry
>  {
> @@ -22,5 +30,12 @@ fbt::ksys_write:entry
>  
>  ```
>  
> +Alternatively, here `stack()` is used to assign to a variable and print later using `%k` conversion.

I would drop the 'Alternatively' here.

> +
> +```
> +        v = stack(3);
> +        printf("%k", v);
> +```
> +
>  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
>  
> diff --git a/doc/userguide/reference/function_ustack.md b/doc/userguide/reference/function_ustack.md
> index be9436f82..01d282c7f 100644
> --- a/doc/userguide/reference/function_ustack.md
> +++ b/doc/userguide/reference/function_ustack.md
> @@ -2,14 +2,29 @@
>  # ustack

Same comments as stack() (see above).

>  
>  Records a user stack trace to the directed buffer.
> +Alternatively, returns a `dt_stack_t` value that can be stored in a variable.
>  
>  ```
> -stack ustack([uint32_t *nframes*, uint32_t *strsize*])
> +dt_stack_t ustack([uint32_t *nframes*, uint32_t *strsize*])
>  ```
>  
> -The `ustack` function records a user stack trace to the directed buffer. The user stack is, at most, *nframes* in depth. If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option. While `ustack` can determine the address of the calling frames when the probe fires, the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility. If *strsize* is specified and is non zero, `ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel. Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace. If such frames can't be translated, the frames appear only as hexadecimal addresses.
> +The `ustack` function records a user stack trace to the directed buffer.
> +The user stack is, at most, *nframes* in depth.
> +If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option.
> +While `ustack` can determine the address of the calling frames when the probe fires,
> +the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility.
> +If *strsize* is specified and is non zero,
> +`ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel.
> +Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace.
> +If such frames can't be translated, the frames appear only as hexadecimal addresses.
>  
> -The `ustack` symbol translation occurs after the stack data is recorded. Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible. If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
> +The `ustack` symbol translation occurs after the stack data is recorded.
> +Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible.
> +If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
> +
> +The `ustack` function can also be used as the key to an aggregation.
> +
> +Or, its value may be used as a value to a variable.
>  
>  ## How to use ustack to trace a stack with no address-to-symbol translation
>  
> @@ -35,7 +50,13 @@ Mon 20 Feb 17:38:15 GMT 2023
>                0x7f6d63fc2e65
>  ```
>  
> +This example shows a D clause that stores the user stack to a global variable,
> +then later print it with a `%k` conversion:
>  
> +```
> +        v = ustack(3);
> +        printf("%k", v);
> +```
>  
>  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
>  
> -- 
> 2.47.3
> 
