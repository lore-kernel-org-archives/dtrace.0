Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A88C20262A
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730208099; cv=fail; b=SWkqacZhcq1/LuC1n4c6HjjlP9PSU1n8DGUh5jaD27IpbvK4P3xe2XWS0AyhZ9chW4t+gNW4/EDhhpvfA/LQSuYofH3enIlC9OfCTClAiMjnVh/NQ0LW71QjvxNY0OU+yof/H1wnhgyCsBgjM5KJCODudUz1+j9F96aZzSrib7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730208099; c=relaxed/simple;
	bh=RbeSX8kIsvMAb1R5v0tNjHGzTnI8JNLscZPlnPIi24U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=pVxHVycWvv4RdX55jibUpA0sXQ+NdjE+8Ff/OkfNUhm9HGhAylf2/F2CyTdO6T2dZY0qMIZeGG0mC9Ufa0IaPAZ1K16jsbZrf1jymk7BW2Ikm1yw+QTwGQoRV2SHpzLHJbDdD61sKJDpv09FHNTHzxcbYU/bWnZgLiPQR3l7Wh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OMCSRmzS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0Ks72RpF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OMCSRmzS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0Ks72RpF"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCbo5a009702
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 13:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=oZShcgmEBcDuyQMZbt
	z/rDAJb+eRWUpdZ71B4txo5EI=; b=OMCSRmzSbu8AGlCN2TcCHaMQJDWN6kotv/
	zRG/AL7g6mcDk7Jj3PzCIE7gtFTk/TadKDe3OevEHE+7DBlNLvyj6i7qXqJ+ICnC
	7tBJrYT+xSzeQyC2pe5CGbLDHXiJvsXJBxfvfw4nKTwScmD6aaScKj11k0qQ/Udi
	aZmr7uTqTHp5nCkdFM2bwASAqdbrJhIVXUw/3JOxx2i+gWEak4s/MVfABF6BEGK1
	N1hMI3zq7iuEx6gEYvo9Klc4QKK+pfraZmMvstE5AHjRSMdGtLOeC2be1lNFtXQt
	f60EE+kgm+QkGSoCmnce/M1MP8qB391RrTgTWuIP+Bu+CV7fTDbQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys5ebe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 13:21:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TCeZ4s010165
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 13:09:31 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn8wu7e5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 13:09:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ4qwmdISpWqbzjqRDkZTyRC0GOdU0wGTesSjLOw8V14a3RlMwSlNXPim2adsFcQ5pB+CnFx6SKWOLfA0YRHVZTcov10b6iHoaSW9bM07h6YhVKEWJ2cXIB2wvg+faK9LIuIsy+peHS4EvAMUgRLQwZ5hXox+QBYtHyIESBFPcodbV+fVzA9PoMoq9O03qNTPN9VzmGJfsFIOz3Smktyx9tTlRoof/7Vnr/donWYBgJ6YXgDBRd8yPW2IL0rx5gA7zr80ay5NT+DVoqd08CiRGBJmgBCRbw1uBRwGIQF9zpSV2L9hwKRTLkuGsS+KDBli47nFRh4siGnCMjtWkThJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZShcgmEBcDuyQMZbtz/rDAJb+eRWUpdZ71B4txo5EI=;
 b=bQc9oN/MkrcvGeusi2ElX8kwrLIRhmWx8rusQaZLaxZ6v1H2JZ0gFxFd5HPOf/Vn+/HEKL0TEQ+yiAHRgS1kr8PpUET3euxRx113++sj+nwSivjbxMTActcplorR60vfKXY2UrQaYkXcw6GXEtsHDpco+wiDHgEbeZGllGB6X//p/myNzZHB2OsshDYPhmkwqeLgpGLynvNuYCJfjO4f17k8h4OPyZ1gLbwoSebhF5d9wJYuuZSrayXlXME6K5lI4uY1+Jhawh/OaWcBQOkQKOQ8cusXgzMF7ZrB0zLP1xvXw5g79yUPwo5K7TvagFCKrn7b0O3ui6UVIVlKwVBoqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZShcgmEBcDuyQMZbtz/rDAJb+eRWUpdZ71B4txo5EI=;
 b=0Ks72RpFc4qL1z8BQciMXTTXy9bzOh4Ad2es7LIRoJvppY+RuvbUHtt/cRMNOY+vs/xXDNAwZPblektvppQBdTqUp+BJBaEbfxRXoiFQi/UYBivyszUgP+EJgnxqGWm1pFs6QKTIv3yJro2lDYygzbh9wXylws/Imnx2tcGsOo4=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by BN0PR10MB4920.namprd10.prod.outlook.com (2603:10b6:408:128::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Tue, 29 Oct
 2024 13:09:27 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Tue, 29 Oct 2024
 13:09:27 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/6] cg: add argument remapping in the trampoline
References: <20241018195808.270688-1-nick.alcock@oracle.com>
	<20241018195808.270688-5-nick.alcock@oracle.com>
	<ZxfkWjbS1c0vXLvn@oracle.com> <87plnorxat.fsf@esperi.org.uk>
	<ZxvuWjuWbfweZmgj@oracle.com>
Emacs: it's all fun and games, until somebody tries to edit a file.
Date: Tue, 29 Oct 2024 13:09:08 +0000
In-Reply-To: <ZxvuWjuWbfweZmgj@oracle.com> (Kris Van Hees's message of "Fri,
	25 Oct 2024 15:15:38 -0400")
Message-ID: <87msinoy2z.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::6) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|BN0PR10MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: 69441973-3903-424d-b602-08dcf81ae8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tXW9zvSDrtOiKi3cZwDtcFLI6pijQMwI86db5gcXks3gXYE7ZWf0ovfiLA7q?=
 =?us-ascii?Q?xSD7TtFzPu/L/6Y/HW6sV+KAyS+vD1OopfYzVeuW8XiUxFXbSuae7d3rU21q?=
 =?us-ascii?Q?jQAe5aQl3G8RU3gU/OHakZfaVGEm+JZVZS8ICMoFFO8kFL7pw7UOaNjUYNBR?=
 =?us-ascii?Q?/styiKi1liO29gaQW3rdUYK9/DCRefvGPNbMlg9NHHOc0PQ/0G6hmMvkldzs?=
 =?us-ascii?Q?wN1i913C6xk4XBzronpk7xTaAhZuNYSj7756NNng/N6IVFVu0HrdAoxy/vPK?=
 =?us-ascii?Q?EaW1csY15kTSXTceTnOIf2PL7cLg6xhc2yNh4TUw/BbX6PJCDL2vlzJNygtk?=
 =?us-ascii?Q?/8w/AyOdDdSNEEHBUkUX/nyu+ha9fLxkbyZurt167FuuAahwLDBny8iiJZuH?=
 =?us-ascii?Q?a1vxS81QvGUwX/dHoNqkw2geFSV+lhT/5+aJVuUFhA4RKkL02SoWsriXNo/f?=
 =?us-ascii?Q?+jH5OJSRFziiuIECjxuADZO516dTO1e+4Ic+J+hY5HF2z8WO932E30rpna1+?=
 =?us-ascii?Q?PRLBeYiwpEFH1swVg5Up4laMHHoN/Gl9HZPtgu6MQf3lIXUg0ESMQIpXRKFT?=
 =?us-ascii?Q?BVCuLQI834tepkNfYELE34BoI2Jj/F4xfj0FiAN1a0pzfjq8rvuSza9p/1O7?=
 =?us-ascii?Q?iC1EGJp4SCOZqKSJvav6XrEq8iTzYNiLhY/NQ3K5ctRIlxn3eL28NoUHgJq5?=
 =?us-ascii?Q?PSFc/On9dDUNDdqqP6Py7PW13YBcWBW9Vqk1dBqu95bN3KBO9kkY+UtwvA2s?=
 =?us-ascii?Q?8c2BDINWIQT1NICOiQXBd8ejtOwcElFhhZH2Fz2DY5j2Udq4gcGqVfbkvfoM?=
 =?us-ascii?Q?W/r0bSyTisjkhgq9bcXdskTeB9F0DPzZZZJ4GsEPDecanfIXvLa/yiktOWbV?=
 =?us-ascii?Q?6FjG4WjWqJDjcUvAF91nx/rreJHsrP8fKOuLF1WbS7/cQFxlBAx+IiTAaE7E?=
 =?us-ascii?Q?irNSiHYxoZMoMVxrNA8uOapM/SOmBpugWpO0/MAkJQRkfKpUEfV3yKXrCvHK?=
 =?us-ascii?Q?2suIYyGjBiB0K8bu9mhOAZoh7FmINSGI1cwrnvSkUGVe2Zo/Gt6Xz4I/S+B/?=
 =?us-ascii?Q?Ue1L+C/tE7BaszrEyMqXB3MFsLmBGCqtupJYzBwwsRGXaUltswcL9EJx1rZJ?=
 =?us-ascii?Q?4by+5Cnd/fMGRs0uZAYeWbe4oRWjR78scdusmckPFs0zUT24dYfTI8BKOxhO?=
 =?us-ascii?Q?08NvPbPjsKYJ2/32m4if8qGDuhSiTscoFLoXhIb7p81xJFg1Io8tnNSTiDm7?=
 =?us-ascii?Q?QPClqCw19iPIoyii4DF8u28fuQNZsOQltRAMD1Q3xMZauXiEIQgqCn+zNuYZ?=
 =?us-ascii?Q?6VuLUcUuVUjnGcdw2pmb7LjL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UUz9ZXQOo96H6ohOpC6nygpLC5KwFqBz1oj6aFS1yMa3q8rOCQuqnGsg84vx?=
 =?us-ascii?Q?nTl4BrtVDtqk9QQtm/eAR9KR8V4VFgLL+Rxwx9NiD9UTfFFX89gaAQAH04X2?=
 =?us-ascii?Q?7sdjx3TL3W7KaU1IFRDRfWo/CYtq87d+XZqtV27icJCTWXjmm/71+DyK0ZRh?=
 =?us-ascii?Q?CoszZI/9cUv85ifO/Yf9q8SRoOxtsugnMghA0PpKlQ2KQ0dFrBmu2td3EZsH?=
 =?us-ascii?Q?miu/EfNvnT2tVfykthPCbQ3yT8h40r+lQLG90ZxKk6J8ysrwGeTtQcYUm0zV?=
 =?us-ascii?Q?AxTSw7VfcHiM4V8Gf+As1fr4LVsoGlWV4bQRY4avUufWo63M9CItvI+Zemoe?=
 =?us-ascii?Q?2d9nbehTRGB5UvFkY3noHswCZKGAbCuS9YvpaULanHpe1p5zywKMvXreKr29?=
 =?us-ascii?Q?XPV5SwCcNqh1sCU84L0FOHNYj8cF0OoL5ZiTmyKi2tRZwAtXF5bMVMXK1NiQ?=
 =?us-ascii?Q?Jb/WFVJMk2fLoSWfJhPz2Gzp6GrvXyeKIFQNh5P435ryGh9WXZpz7qrbxvWq?=
 =?us-ascii?Q?Jgm+tH+thaQnbkVJRrsgVqcV6huYfF2zjkG5u8+ux4J/ueFIrPTKk80aHNbq?=
 =?us-ascii?Q?l0tmUMDGuOOCmrJF/3JufOTH+mCC3KW+YCHvkQ9iJ5q1xKeSL32R9uH93jvG?=
 =?us-ascii?Q?cTvhLOPxnaH0izNkBxkYTBsY5rDQS/67me6UNQCsWGD470z0EaKpCi8bc678?=
 =?us-ascii?Q?h7oj3MEXa4GEb6nEIVFQi9wjUi2Uh3GDG9sN0+LcHZC1bw5AEaReaqbp8NOL?=
 =?us-ascii?Q?LDUqNw8HLUl8c+RBZpYmHlxeyog31R2Aaa4x7AxNkmkr0cnTV3ZUyAg35Ohq?=
 =?us-ascii?Q?c52YuXgpUUhTf7tDKzK9F50LtJpwrQo6xxIsP3nt1v+WbI76glKVOZxtFaEm?=
 =?us-ascii?Q?DQ6LZNJgilUiczLV2OF42Cm+52G0WvS3AoFnO3jtdrDP77DGDgXu7gqGhtxO?=
 =?us-ascii?Q?ySwM0sZTiZ63Vj4/vAwEZR0eslGSvsX/KTA2Hip3lc4OUFL4dg4Xo5dXEJD1?=
 =?us-ascii?Q?U3zhWMxJa+GxjheVoPr4XBD1bknu4UJ0ukxNNTm3wdAgo+LvwN0/Hs6C5ndD?=
 =?us-ascii?Q?1QZW5HnmvsskRR67Hx7axaZFm0OYa+djBP2OY7KcWrB8eBUPW7XZguoj0d3E?=
 =?us-ascii?Q?OrHSQlw3fRyEKZqsLj1W4458sxFhzoy+76ecpyWeF8QLu9D9L6XAolJaURvQ?=
 =?us-ascii?Q?7dh3/ytSei++SItvdOpERqkNG5oj2HhreQ/2NCfl5YgvDuVAPyS2uZHLPn3d?=
 =?us-ascii?Q?aSV2eVpF2hxEpSnvM0uIcsUuXGBtn45QhNkNb++soIgpM7dpL9juYLmZ1Lnz?=
 =?us-ascii?Q?JOXfSJVS4SH9rK5vIwsoJcPlMXszpYOx/AZzVyOX7NETWnHvW/NBg5AYSWty?=
 =?us-ascii?Q?nqb2VuIIudmUGB5Bmu1pfLFL3UzJa3sARNNj2PdqnEWC7xJ4cG8Xpjy7CgUL?=
 =?us-ascii?Q?XqC7HF5vOM2gOcavE8s2tG2zJbmFe+hX74xZ6LtTC1aelljZ5OzZ2N4AeoPU?=
 =?us-ascii?Q?9rE7NoM+cTaTWH/MlN5Q1il7kaQvetyXi/apfUxA7kh80jQFUa5CgkEAQ1yF?=
 =?us-ascii?Q?3ooW3JhTnMWexso5gW0GJ9vEtMdeHQbsmETIr1bGXz0vXgUYANtKQr22T7PL?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	00I0QQbulzfEh9EFt2mc2ER1LUX8PqxrGxMIMInzm6tTt1KR4p+23lo12XkwVCyun+Ei1DENwJalU1yizdrzwWI0LuBim2qCg7iZg+MthFu3hBmcsJirBQUkXmsJhcA2LDRlfUaSV5M4VOSaYplrh6T98gk5+dDi6nHfsGkJ3orYdYY8H4no0TOZYt3B5GpPCGAfpBZ2Z79NH35iwFcBf0P+M/DjW1G1COVJKJg7UTlMmzK3psuI8qkgqGT1HakiZOdytndXmJRbKg+sny9OWY/a6zL9yKHv9KXJwnlqYUGg/S6fLrHLiRIarPzozpNHrx7+sgaiJGyAEsGOJsPi1AnPxWhYaSX6gCwXGqgTypHkHWAcWIH14nqv0+z0Usb0/UKTVznGxlozJXqNPLYarx4/Tv962oPeUQA3Pmozwjr3kzBl/fdER1HCqH1i7tHBty9IzGdWxkQsCf21SoCDoUS2iixw6AQ4ADe8Otbw19CtWGnmQPY9kFH9XSfvvkdL0V+boVnVERZX9s6kDpjDgi+UPRCWPi+VrFCQnOLefMBNgKyLt1rNQacmrzoR5HNBxaAjya2CBybIxkhk8jF2zcLC6bRmgQAPR4ZxCqaioHk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69441973-3903-424d-b602-08dcf81ae8dd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 13:09:27.0978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V24BNBthxat5l1+NNVR/g1eVFioSLVxB9dAvNOCPWWSNswUiYGbFm8HpENiZxmYTgMtj57l5Bo5UwP1TluA5FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4920
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_08,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290100
X-Proofpoint-ORIG-GUID: a5b8ENv2hVx8LrGxndWVxlUqQRwIYNCf
X-Proofpoint-GUID: a5b8ENv2hVx8LrGxndWVxlUqQRwIYNCf

On 25 Oct 2024, Kris Van Hees said:

> On Fri, Oct 25, 2024 at 04:56:26PM +0100, Nick Alcock wrote:
>> > However, I think it might be a good idea to have this function actually rewrite
>> > the mapping data to become a pure i -> i mapping.
>> 
>> Can we guarantee that trampoline() is only ever invoked once, and that
>> it's invoked after probe_info is called? If it changes the remapping
>> array, any subsequent invocation will do the wrong thing. If it's
>> invoked before probe_info, it becomes impossible for probe_info to
>> adjust the xlated types appropriately.
>> 
>> This all seems like way too much coupling to me. At least done
>> this way trampoline() is idempotent and doesn't depend on being called
>> in the right (undocumented) order wrt probe_info.
>
> If the actual probe arguments (argN) are being reshuffled (which is what you
> are doing by shuffling the arguments in the trampoline), then the mapping
> needs to be updated to become an identity mapping i -> i).  Otherwise there
> could be other code at some point that tries to apply the argument mapping
> and that would be really bad.

OK so I tried to implement this and it all fell over as soon as I
thought about it in depth. The problem is -- and you might not have
realised this because it was different when I started and I had to move
things around before anything would work -- trampoline() and
probe_info() are functions defined on *different probes*. trampoline()
is called on the underlying probes, and emits code for them that
reshuffles the args according to the mapping info (while ignoring the
types entirely); but probe_info() is called on the *overlying* probes.
It digs down to *one* underlying probe to get the dt_uprobe_t, but it
has no idea which one (if there is more than one): it's basically
arbitrary.

So we cannot possibly have the trampoline() for the underlying probe go
changing the dt_uprobe_t's mapping unless we can be absolutely sure that
the trampoline() for all the underlying probes is called before the
probe_info() for *any* of the overlying probes. Are we really sorting
things like that? I thought this was a TODO, if that...


I tried storing the arg info in dt_argdesc_t structures in the
dt_uprobe_t too and it rapidly turned into *another* nightmare, because
now instead of one allocation for all the args at once we have one
allocation per arg, plus up to two more for its arg type strings -- but
we can't just hand the argdesc back to probe_info()s caller wholesale
because it frees it after it's done with it! So we'd actually have to
loop through them and copy the whole thing (including all the arg
strings) and then do the *same thing* in the underlying probe freeing
function, and all this complexity buys us what? The ability to save four
lines in probe_info() going through the nargv so we can index it like an
array (which we'd have to do the nargc *and* xargc in your scheme).

Sorry, this seems again to have zero benefits and a great deal of extra
complexity.

-- 
NULL && (void)
