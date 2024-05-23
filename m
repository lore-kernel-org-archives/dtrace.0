Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B2E83A17
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716490180; cv=fail; b=KN0t+WbDjqsgCx5GBp5CBud6dhcyJe1yfBST/XcTLZlojTlZlSXUq6yhUsd07HfHJDvfN134f4gsCbOxHGrM7yAYauC3IzyTINmo4jD+MNKq4cKAVOwAiYlhXkZ8yVE+Bo5ERb1rlKFOo2zMTt73uG4iq2WhqjrYIfWuguDZhhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716490180; c=relaxed/simple;
	bh=XOn5zoZlCPDmCNw+3sZ63/oh38p9gh9iKc225F3o5R0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=T+pwNnrSschoe+CHQ4LLzhZukNiyS4ymvs1/mdIHuOjsPl6xIkS51t9X8I/He9MhSMNV84R1+jXZQ0z9vMWCmaf350cEMCGqeaFANifxW8UwtOr6UO8Y8px3IfbhTRZ6yCPSvAnNJf3PR5pgtTkgvFNzz8dGQBTnJ8JZHSgatM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aZ1BbBGv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VlUVBwGL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aZ1BbBGv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VlUVBwGL"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NIl4FF022768
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2023-11-20;
 bh=WAHVmcENaFJYyME9hoR6lnyS577gMMCZyPFNyQlr4Gs=;
 b=aZ1BbBGvrswmvZDHjIKOyzgmK7gfPGEZ//8vDK/vlI47qTCsotpQhsaCPlx4IIcaJZ4X
 dynki6c2n0h/36iAIxEcmeBU9vwW0xcSHWjwbqgwGnEEBsPeyHVybY0n8HgCOzAhBsGC
 0kTTp32pdvaK5o+XSOoMqV07UFwjCgkbg7MwfORyQ9EFD9KXWj0atiR/E+w27niZNqps
 MtPMMHc4CJYvPJC97Oh8EqoTpq/8B+/bHddlAcFk6zNzjCAUK2Jo03JovS8415u2PtAy
 C9WQ1MrH9XBnzk71KoGhQN6D1m1qCmbTiqGfKUhabfSvjGbt8wEdS3HpnnGWJ4roUVcC sw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6jrets6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:49:36 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44NIA2Il036006
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:49:35 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsaxu7r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 18:49:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ST2K7iHX78HN9up7iXsyDy4CY1mga1TZW17e9au0R/t7UBZ2ijv60bZUYmdJsZGNOzk0wvuf+YnIjSSyXTBfUjlNcbRDkAVs69ZzgekU9uefX8jxRVzTKQoJlC8e/iHOLOs+c/OcpqVCegttWAuNDeHKAkto8rsUZUNXUEl/Rpx9brE/hOSFcKy1uCfAv87P2ePyJZ9T7JCc8ynLoutzK+S/WDIjLZFtzRYGPRbNJHdGoB46OvsDlcToIW8u36lEYK6uMo3uJ4tmICJduE7ueUVhk208LYA1JyN2LylRAcl8yfQlTkn40zxSAcpdyBMHu1sVLyRIJaq5tJSd/dQI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAHVmcENaFJYyME9hoR6lnyS577gMMCZyPFNyQlr4Gs=;
 b=hx0uMTHaBx2/E47tuOJYwMD9xcOoeYIgLjxpFzDAcRkOGFkOI5Y3CHcgG+ncCnwsatXMppUb/uT0sF3/ZYjdWoX2IyS1h31zmw5EoWAQ7sH0k7A4wrl8X4xpzhkjarF5DZrk1ahDR2Qj44FgHEcq7hPr6itX6VYvNfyvhDZPm22IcgQIAfa0zQKiIAB1JUCL7RbLNxRNZ36CuBI22/bspqdLX4wK3raeAWCHGbrfqm2/NnRPOIhFXrdIKSyHfOeUqa7xKa3k0B60LqilDswxcaSKrtdxy23S9NHFtafH7ChiOEqQ6eD+tWDZzuP2QraUik8QkXBMY0baxAMyGMn8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAHVmcENaFJYyME9hoR6lnyS577gMMCZyPFNyQlr4Gs=;
 b=VlUVBwGLqXL6gtf9EXuyj5fUwfyWCHQ1CfY5U+/JRc0cvyW0mEnBYo11ygTs1JngHziIQLopr76yEeI8QqgSgrnGE9KRC4Lov7gHXvjUfqZQTy4Nj23GaiIfBXnPwJAGLfRXQ62QBUyPQswMsVS8+z0ZGihjcAfCqsysEJGkBUs=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by BN0PR10MB4966.namprd10.prod.outlook.com (2603:10b6:408:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 18:49:33 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%5]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 18:49:33 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] build: install sdt*.h in /usr/lib64/dtrace/include/sys
References: <20240523175654.462908-1-nick.alcock@oracle.com>
	<Zk+N3P7NnwzL1ZSz@oracle.com>
Emacs: because Hell was full.
Date: Thu, 23 May 2024 19:49:26 +0100
In-Reply-To: <Zk+N3P7NnwzL1ZSz@oracle.com> (Kris Van Hees's message of "Thu,
	23 May 2024 14:41:32 -0400")
Message-ID: <87cypcs6rt.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::30) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|BN0PR10MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: d36cef2a-90b8-4f61-0671-08dc7b5915f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?imPJakkVU3KDCsxEqjGIeEwXiB6OUM0VxvBKaml8Q36csnNKXpqJFo1IO7Ih?=
 =?us-ascii?Q?s059PylgCZzjcQu2dHKe6JpKbFY0915aQl8xEOn9uqrjRxculER9cpZtwHgL?=
 =?us-ascii?Q?NzwjoyNC918rbLk+6l2fuc0GOKomK2z04WagcCkWwR5Xljf4LSfpmfj+CVaO?=
 =?us-ascii?Q?sPbC7IhRZY8HOm6lorZ+qagZOWLGMhvvXjW6OScjGbMbtGjrkqDTZWsIq8u2?=
 =?us-ascii?Q?j2RiqjTI9BvTJdqo8l3ghJDZOXhqMDO4UKAPbIbq9VmDP1R018LjLAUFfD2J?=
 =?us-ascii?Q?YBZt9hlJ7CoR1g67KWw6hM23ioWkmqMFzSEY+6VDD7aRa85RGyOZPJM6XYMS?=
 =?us-ascii?Q?66pLxp1vB224BQgkYkcRb0qViuJ1wxBtQb4rWZA5rGNbXnTnbbS3MF+xw8KQ?=
 =?us-ascii?Q?3W9TsMhEsDCv1l1QM/hPwstYI0f1t3ugcY7WV/wIuy2AYHNz08SsXZ8E4K/L?=
 =?us-ascii?Q?AZQRRTvkYhfCPxU17W8TN4/fqHdx+EWnfUvNFzbyA3yc3aw1UWMrYmC8Mv7z?=
 =?us-ascii?Q?E/DjqgdXq7Hpp3TqPuw+Go9S9m5EVDuD7KAJt7dIZD8ameNXTmvmj/cpL4je?=
 =?us-ascii?Q?dYDEjWc2myHpgJPB/RrJ4NRHNM/M2myuNVUErg9gbHatjdK7h/clblpmZGSI?=
 =?us-ascii?Q?gae+OpQ2GRI9YyaQnaQjS+f0L/BoOLCsNHlHE4Z9SfZo2COqeK+Z8Ik1sk/u?=
 =?us-ascii?Q?2903aKfgEFmBRRIThkYlEkc5ukIc6iSGxhXyrNjigPdCT7yIKZdRHMbuJ+F/?=
 =?us-ascii?Q?2NszStbSKvknUaXSK/tZh0iVyNudLjTwxIamfIkQEIGILwFd5veo60qPImVr?=
 =?us-ascii?Q?i7c92WtwS6ZXPkalIfoa4tGQrxurgks8a1Eo76QbpNUttR/ocL4FZAb+OSEf?=
 =?us-ascii?Q?WcIv3/RguxKMtJkcSc0M5cLIYF3g/rqBWD8LysJmXgZ1/GLCcd7Fhq+xzZ8u?=
 =?us-ascii?Q?ENUE2+lNy1jwdi9zE/xZ2+h12FSL5TfqohNeGYOEB6CBbK+V1/OD/YV5zQbH?=
 =?us-ascii?Q?VVY4/UhlnBpJiwa4AJqtp3ZO+6A1R3fFfnDTIhaqdb27Vm+zNflNCm6W+7gQ?=
 =?us-ascii?Q?/rQxW0YnGTXtR5evelPsurMBvHssZh3BT8B3EA3W5Fpfsk43uSMot9k5UIg8?=
 =?us-ascii?Q?eXr3F2B+4bwZSvKBd/DtzdgtnpjrXQjPQwMhvgj/MVWsYcN2GC4vaxvUig0o?=
 =?us-ascii?Q?uCThQw85djNlPONCb5d9TEdXJoWoim3M0n9rpp+yJBNeGIn/uz3UGnSErQ8G?=
 =?us-ascii?Q?1wJNfnqI2Boqhnmjp+9MPR3+aiH4Yklc4kGqJC004Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pq7SoD962MDt/uVMGpz+oigMtYZ8pYADLd4p9zeqjzMW7bIAxPa5PkHJ957Q?=
 =?us-ascii?Q?THrD9m30pXzMkoDw+sKVZLdKMXWKoAYcI4zB/UI/waDqgWQ9QNQdzBs8L+zs?=
 =?us-ascii?Q?vknL572tOaF+aG+VagERhIzE4veZElkDi0Jy1+tk2pdyF3jji1a5fLZ8JII2?=
 =?us-ascii?Q?eWCY10hxaV+EK31wZdf8M+6nkuDXnfBIIvDnWYHaQoFZJdUg2sek4uhLON7j?=
 =?us-ascii?Q?OCYMSL9zvfxlRsJybOkCAcMCRyQa4oUOjQyNxRaZin4OKPcCz/InqgJQ1QU7?=
 =?us-ascii?Q?Yul907fxQUUCP45zIw1OwLmpyz4FfSJXD82Sr+s9jca1bAzFciPP9G2P7mWA?=
 =?us-ascii?Q?PCdD+o/af2JqTojjxfeTAr3gDgZx2F6dmQWrfzSODu21MBnts64ZXxypDxgJ?=
 =?us-ascii?Q?BvjY5dMUtwhjmqJpR58EwOTVbl8ccQFwKgs++juKxG8KTtOsprpHHbinSfx5?=
 =?us-ascii?Q?e3YhbZqNVK9jAcbAd56RW2u9ipSK62b84pw22JfaFJpVE1GbFGzhZBrbH09x?=
 =?us-ascii?Q?Oaspa5NtntATcQ9tf0RWqh+T71G+b5qcvQj4SbiNOFI6Dmv2a7o+eUQzChWT?=
 =?us-ascii?Q?Y7GwEVjEnpQZ7OFwQuI/ccOhNBldmP5ExzKhKUYVfi00MQTEGDaIMn0AeaM2?=
 =?us-ascii?Q?IxPszoFHYBe52RbsMM2ZCNg7RQmxUJyCn1/W8zYzol7+UO20/NSiKIlB0E4Y?=
 =?us-ascii?Q?7n47H/4pCbCF442byUxkearPxrVeravFnH1ddAlG2eftY+qKhU2vdbXvPnYf?=
 =?us-ascii?Q?zkUSr4HXNRJvM+uMZGrJpokFTfyBmJxmh8sdIpicx7NXxo6WPcUCnsFBy5zx?=
 =?us-ascii?Q?LUUkkofb9Qk7RuSC8D4UKiEIGjSb45NPZ5HcG2RfkyR3RHdlT31vt83AtNl1?=
 =?us-ascii?Q?Frdos0ldYQlUSNAJ9Nfc7HoljN4AlroD63pS9AgrOGR7v09Mo1/cV9xTdlo+?=
 =?us-ascii?Q?273h4LNIF1bubWI56o81f8I2NzQcUaesjDIz6vqBwhgdr4zGqvJbF4wRxM6V?=
 =?us-ascii?Q?Iac6nzDrtkaDYKunsFosBr9PYVuY9uzMNoJODggNlP2GuXLZ24ZcHWi7Eafd?=
 =?us-ascii?Q?uC15ZSpqUPNhOu9akHszQnSwidWcxw+5mN5uNOwRjB6veERU7ZOgIBXNjMsG?=
 =?us-ascii?Q?0UJeuxyjnn8y5S9sBDVPuzgKwy0i4CcqP27luD7Y73jdq5/UvGOaLPo4hycV?=
 =?us-ascii?Q?H/OBY9C7dOMy2fD6HeE1d1btcCgYKvSKwwN0HQHh3PB2dmED43b2N4LXo+es?=
 =?us-ascii?Q?r5+qlHw5FGCdKeSVL17S7M0YUp4+tCyrSMC3+i8kzh4134/YbHotdRI3PZhx?=
 =?us-ascii?Q?wi5YC8d6TdpAmUtl0KhBm2TXpPR8SqxAlY0tyjF3Ezhrv1sNnzzNUliOC8Mo?=
 =?us-ascii?Q?AxUyx+AZopSe3g3Vxrxf0NyXO4QROJocqOqDw8kYUaccB/Ld6SysMoG4YG5+?=
 =?us-ascii?Q?PyUw7mGNfSZu7PmwzM47zliWmbNUj1qEzpdtJaQB8p/R7vkArnOI2rPDRR2T?=
 =?us-ascii?Q?xtqfM7+ecp/qgByn5QevVp0UdOC7nKCLA9P/77DWxp6ORi0N+HcMJ7/7UkCD?=
 =?us-ascii?Q?cbhm5Bh8VjxiVv/2h6siE3xiTd5+iEGJYYbimmCgM0T0T9BkV3G50jkJ7Hr1?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	djOUkWmo/Xp7+lXnK529hFsQFldFkNkftMX/u4T0Mdi7ottp7cqlFoJQG5RpnVZPRLVKAJAJtyHpUpm3/pfAnI/YphuORXLuRz6WUYfwHJeUiiuyUFJb6HsyIEdMgmdNg9wHFs+gkeM9G1JsEWTtUbB7lzdTvJqV+ewLR1a2nYLCvhvs946qTKZkJeAlsswerhPMUefed05tIAtyrwQkxwhpZmDhNDb4vTUr68rXKuoxAQ4iLHTQCCrihxxnHDRs46TIEbez21UQt36jHiJXu0S/zI/pdppdFToN045NQdYsMv5Lh2cApI+iuO2wKLNbjr7GPpCtsLG/WEPCLK+05X9iaMfEmXWqW1T1ASAwApfWPxemUKBRAocRl337XrWxCLiSbJQwlv0aH/xPcpwUQAZp/x2T28vBei+DgiIUNzrzZWvARpEZUTHezr7ozsHP3+sWlRu6wDeY6+IlaiZd1f3Rrw2SFZe2fjn7WGn6PQY3b6EZzi9yeCpwYy0O3pAdmPGuWsCMcnf4TuVmG9rv3qQ9ugXAjSHK8ToC4hMi5+oVOwU6GufIc8WvagbIbh2WKR9kLgYEgzYyIXZl4dyxKlY2F1/ykOy6/GlzElTKqjs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d36cef2a-90b8-4f61-0671-08dc7b5915f7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 18:49:33.1403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tf5XQ+t4N4WsAq5ivyU5J62mX5mFTvCTgatvARAw8XIgw6K1DuV6W4UOBSPRR22htpYXi0UyqBga04Q3nXSICg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4966
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_11,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405230130
X-Proofpoint-GUID: BuDLJNUWAqY36XTXAu5l4b7yKwDGJrFt
X-Proofpoint-ORIG-GUID: BuDLJNUWAqY36XTXAu5l4b7yKwDGJrFt

On 23 May 2024, Kris Van Hees verbalised:

> Can you split the move of sdt.h and sdt_internal.h into its own patch
> please?  And I guess the pkg-config stuff in a follw-up patch?  Still
> need to look into that a bit more because I have reservations.  But
> the moving of the header files is definitely something that should be
> in its own patch.

I put them in the same commit for a reason: doing otherwise would break
the installed testsuite in the intermediate commit, and I don't want to
implement *two distinct* mechanisms for locating the headers when we
already have one that works perfectly well (pkg-config).

(Also, splitting them up runs the risk of your integrating one without
the other, and they really do go together.)

> Introducing pkg-config as a mechanism that people can use is a separate
> thing (and as far as I can see, could use some extra work anyway because
> e.g. runtest.sh still has other absolute paths in it that cause failures
> when the DTrace build is configured to install things in non-standard
> locations).

Well, yes, I didn't try to make the *entire build* relocatable in this
patch. That really *would* have been too much for one commit.
