Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB49413245
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 19:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770665839; cv=fail; b=tGv6jy2xYH+SN8Fi0E/FpNhIhHhI7iTIIm+iyaz44hNfci7ZW9DZ3VMHNHq2zO0Nu8j8bh06rRUnwUtHlGM6+dqxJr4g8PbC1LgGYCQaJGUyPi9e66IvUssJ4xW7l86nBmMKeRjpJWuPVT/FxZ2+la8zHL3kSh/5OWiKFzUM+0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770665839; c=relaxed/simple;
	bh=G4YutwWYtNlKDxR7lU6Wi/KA+zOU1jVNeTYr0Bz7890=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KeX73iyVJ7ik5OeHDfUmKYHyZfL8i+8Q5pPboxJCR8Nr8RtzIKuvLG/kM7aFuDkiccYYNW9msWnRvzcmkuTOTW9ZUvJ8MYsA5aK264zZWjCE5qhwYdtssdo1YIneTQjzk8F+0AgBE9bey+4OZxg270fgTBZ4bxe/Mu34NjCGLlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lh+MNdlC; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D7OpZKDb reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lh+MNdlC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D7OpZKDb"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ED3er1229649
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=41YGWgK2ZSYgsQKTiF+l6+phQRP5X9uZghQMTHma3mE=; b=
	Lh+MNdlCdiWTJPp2uVktOeFlBsmL/FHDXt02WL+h3AnV60y925R170xeM8YyCfYE
	jqXPR58J3kmPpPKCX3W7PBZ7WhP99lSPJoZ5AbCLiL3yi5iuBRgRjM0z/52KIXEN
	B5cLDjW6XLdiob+DqI7Cfxelkz8FjIRp2WY7mZzCOS3SoP3cYWlHe5k1U40tdX36
	XeEmzvWbysPM28H9TG+U7Hw2d5bQvUXSxKtEz76RCo5pScrotH36t4DszNZfA5d0
	BRV68YIm7TD9k6hRbUG27DLucVTlxdwtbWdvgAHBDwfA+bcYubYwV+ShE41+D4nk
	r8UOtlQOM+CdtU0tdD98/A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xes2n9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:37:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619JDqYU035428
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:37:17 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uu9g282-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:37:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZABJRtiwBNnKo1piRf0Gp8aiCUX+xg1c72v8jWbCaoRzyEe5uRcTZBcrDV9qdEZoSIvUUxdCFkLegfw/4XsKHhm5kL3NIYpThC7klt0YgBhemncsjLXqY91vE377CfyO5jsPl30+rnT3rho4V2SwWB5yWPB6UG2F2OqRSH0iW1WLB97QJumuEkJ0G4ORdbYzoACpNm1W7h3XwuyL7FuVu2lENl0PF4FT0oJ2d2fqj9wa7oHegiZ3GhxsAesDgUdA8PYi2jl7RKxr+/MqOB0+QQIy9Fq5qQVXHDXdA+1/KGI3XXroNQCM+EunCaAkkeI4nCgxPMXCubZB3Xsjde0wIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRi5LyUEa3cbu50YLN9lSMm2Hh6mpcy0kIaFe4lHAOs=;
 b=hvNkaZ6h0A8CukJxvsiDJ+VVEujCRBoGvBytGGwDpodOk+hI5ceM9vmJtZykltyhGWYusDJjCcIzXS9B37rRumCI/bHGxLdw73p1kzzXxtDLTHYYm0FBjAYpSdbZP7JsZ+wm8yG6OFrzPtL8c2PvpZLaxbRueOP8QvvI338BG3zjYwrdhdZpGM3u4Jj+112LOJYiiOiD69oXUrSBDjYPZKZgvV3OaPnRTAwQX7k88NI9LX21uChc64yQFnXgsA7Eqm22dmOgU5/QNbpgFTpH1yHWLJgXeL5+qftCM64p9qCNWEnxv0AddFRTLd71OVhmIOmjXWufs8JznhlsusnSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRi5LyUEa3cbu50YLN9lSMm2Hh6mpcy0kIaFe4lHAOs=;
 b=D7OpZKDbwF8nYWTvBsvzsbWLBcXRgCVjg8JPmhre2Fj8TsgCnFlOewvZgDjCGsXgS8u5eHUEfHgKGJreSbep3Zs07/8bt5c9d4g0do0Y4LHDHcI/6QS3H1faH66KzEpMyPxxtV1/tB9inzVd9pSf3U76moa9BiBS5RPlCdTvOMQ=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH7PR10MB6108.namprd10.prod.outlook.com (2603:10b6:510:1f8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 19:37:11 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 19:37:11 +0000
Date: Mon, 9 Feb 2026 14:37:08 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] pid: USDT probes cannot have "-" as
 function name
Message-ID: <aYo3ZO/boPXs4NBW@oracle.com>
References: <DS0PR10MB7522231ADA11F5C6C606FC8EC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <a1051394-2811-d0e7-ecc4-f421396b2bf4@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1051394-2811-d0e7-ecc4-f421396b2bf4@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH7PR10MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 1819c1a5-9a19-429b-859a-08de68129e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?mJHD/EUrcSHR1BXVHyYnlgMvN1oPA+sdA5E8+kwu6hQ43M0+N35WRHFHns?=
 =?iso-8859-1?Q?7AwwhL6B+Fru9tZpTqrpWj+3VZnmWmtjJbldsn/p5aigtC/GSMQVaBY4J9?=
 =?iso-8859-1?Q?9HXCiBldQZa9OPIHmZO9xr84P1+0yIg8G/dofI6gBbtPFiTfMHjKnBgNKx?=
 =?iso-8859-1?Q?tORsMMhaSxav6ws1dBcWaCLGdcCuJpmFxq+vfWij7N12tQM79+f7igYJWP?=
 =?iso-8859-1?Q?3wSi7bId3iPM+mSvfdaLrhcC5fQDLuWg0pEcUVseYUZ7ty2PwHYPa1PHym?=
 =?iso-8859-1?Q?a/EIFxQ96eFlBIkyv2ZW/E2mjPGuGugQ/cD89rFUgGeA5XIWUAiC4bYG80?=
 =?iso-8859-1?Q?1vsZi+rLLOHa/JNjtFzQln9ur70LMK5LZYcF188X6LZSD+tsE3sxmbqhcF?=
 =?iso-8859-1?Q?XGPA7hSKn0iu0X7Hj5Atopp9BFg2fqo+d7JjTfYhtnAy2WGkU8XyMsUJzn?=
 =?iso-8859-1?Q?olZv8wG4bsMOb4u8Sz6W5M5U5eLvIe+GTch5DVctHKRlj1szoUWyTGM7eV?=
 =?iso-8859-1?Q?5/Jhs/A3nO09rgR3PNEQL4QvZTEhfRosqAQjrMfYNCzR9hPBu7TL/83OTC?=
 =?iso-8859-1?Q?TM4GMVgXL3I5wRxRTWHyGWUFbkKzzFcfmCbuTEU11GIMRhsVrajshACSs/?=
 =?iso-8859-1?Q?lOLaUS72fMaC4evD+TL15H41OJ8GwXMnWt0gn9krCXcoxSXnHDFw5IL2wA?=
 =?iso-8859-1?Q?J2x5gfc1VQtkgOHmQcKDfdNcXfKQPEY+335Bplr+rE5wX0ESOWs19I1POZ?=
 =?iso-8859-1?Q?iBTU71uRZ4S7SeE9huCG1nKE9vWTj1JcR1TZ+KsWLhpUKlwNTVtxbhbdJm?=
 =?iso-8859-1?Q?3r5or8RuqzhyL3Ovp3u8JH36t2FyeD+Mt3/PbyvrF9+Ak3GFUbKNY0g6H5?=
 =?iso-8859-1?Q?/rvc6aQLBZxDCD5XbWmRNrLWynRXZTPo6W9gIzcHzjQao2VDEP8XRAsXPN?=
 =?iso-8859-1?Q?AWRQqejtbYKXwYNq/SByTqx11dShAQLewjl29MjEcR1cMf/MpeqKs9/wpk?=
 =?iso-8859-1?Q?Gm9lqwl55sINoTSjYnFxO7Ml2QncV5OizbSkbZTiZZWzz/KIukDyw/RfOm?=
 =?iso-8859-1?Q?4KMA3Urrr0LRXK5U7ygDmSCF+wzsVfKMGSGXPTnazmCASkrbwZx+8OoZ2q?=
 =?iso-8859-1?Q?0pSyuR9WQAq4iHk7pzD3jGdDj7YUDrYNDQUmeS6PoYb+f0Coe+UVEm4DQC?=
 =?iso-8859-1?Q?9QxtagInQJUvqutNYL7P0fIOocFctdDhYAgX2vidU1mS4zk8xR7HopJQjX?=
 =?iso-8859-1?Q?YIEoL0T6OGOAJqFUQ/evAhIH9UKoK44hXhwX7ZEsWQsx95DyLEghscTcT5?=
 =?iso-8859-1?Q?ZMriFes3rLwE4vIkyViPjVUkRjM1/5bQ3UiLB5ExQ3iBYwRCFybLypEzjj?=
 =?iso-8859-1?Q?UiDwai9I1WQQa9rJZ2GLS79haUrlYr6MN9ih1OFCeJJixMQZKWcMDTozRK?=
 =?iso-8859-1?Q?HmD5XcZGNtUgKlaSiGUVPc1Fsgm+yiLmCIjzK7UHD4mTTe9qfhjaicmSia?=
 =?iso-8859-1?Q?gndHjDz2nAvo68mKcS9Bwu/0DnMijvCPov7bV3iQBsS5b7CJIfxvMpV3u9?=
 =?iso-8859-1?Q?GdNXh8cw9j5t4/IXsh8kUot7NFz9042+0c3QpBnyTSSxzi3oLf8OqTKdpI?=
 =?iso-8859-1?Q?aWJKaiyge6DDw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?8PTICO6uFpQ5tqbd5HJpjwPIy2tJyXZgAJQ1fD9WTdMsZypPpa7OQ4ND0j?=
 =?iso-8859-1?Q?KGNI6lrfIqykaj86ckCwJdp9UREGTjQnZRQsnItzPXu/m1hUnXhx4EuiD3?=
 =?iso-8859-1?Q?rkmvktdDhnhhYIQUfRqoieydr74oWiFIkYFKRx8VVjjf+3GKUwF4x4QLIP?=
 =?iso-8859-1?Q?H77WKrYeel2UrTYBKsMm0tNRJlN86mL7vjjJbd3+72T+pjUWqQmgA+jH7P?=
 =?iso-8859-1?Q?L0mFU8MpMJvHccf6plnOfWlWMFKSWHc4nYUU5PeZkc7Q1/wa6c0J27n3Md?=
 =?iso-8859-1?Q?l3Ywttw3gj6/F9BkdIU8wdM/w+5rsUmeXlmsR8RxA8uTRvID2EegmcUJzF?=
 =?iso-8859-1?Q?HQoet0DFsU6XWCkrVliYyf32hIaL6AUqoc5T3OvXyS7ZODaEWjJwBPpWSe?=
 =?iso-8859-1?Q?2xswx2edkqo7/d/6njMOSIas3CPThYOVLAF6/vxTG/EnX/RsOpSUcl5ib0?=
 =?iso-8859-1?Q?GwT3K/st8V0FWnGi0V6xJadhjE4WPChouEA9acWU/0B91tuuyj0ha2gY0B?=
 =?iso-8859-1?Q?r0oLzM5vBvKNi00DvBe+noyy//Wj3B7arfJyO5RzOtuyxagVjACXEOnj0J?=
 =?iso-8859-1?Q?tMFj/zku7+//FPapuwj6UvZ0LfUFJiJnhDV3sYeCS8tIPIn8lV485rMkV9?=
 =?iso-8859-1?Q?cT7A9xKXKPDhMz00E9yU30SXpRfZRlYRwHpGK8ULSoO8GDTxGH4FsataIY?=
 =?iso-8859-1?Q?et41S8o1VideN1qtIaiG1tm+goJScdYbJlW/eHMkJ2pT3qwv/TLsxjL3rg?=
 =?iso-8859-1?Q?18+xCPgtiJcdw2YSPsMir08Jjbq/24Q2QCHtVxjKL6e0uiUH36RUrsf/1O?=
 =?iso-8859-1?Q?W2GLOogFF8CZiV0kkJkNoCXXTqpTnEP3jYcJN2dhU1XQ1F/sY98gTFsBsm?=
 =?iso-8859-1?Q?EK0dCyuI+oYI2tj8zOP01fLhbQ/0bibsMDR9WmYGjLIMqu94OGsrvweQHj?=
 =?iso-8859-1?Q?peYSTtUV603Wa/x4AzdJz11coQ6cxwWR0wjqxDyP+tbWiWh+Zjtwwylbbb?=
 =?iso-8859-1?Q?J69l0/QPNjePLAimOFo/XDAcM0MGAd6lqzwVd4EQ0cBzAZP/ixMP0eXLu+?=
 =?iso-8859-1?Q?eCB2DAAwumxvslNc0s41ZX9xVd5bVce3HLap7m9+KIx9bPFhlVLef+3IIb?=
 =?iso-8859-1?Q?GAbg1b0Um367GVn8L2xbil+EE6oSHmOBDogqVmthH7BMz2xMDrjo7ATfMA?=
 =?iso-8859-1?Q?qxA7rNJVM3AmVG0IITsmWjrIi8z/QwnJgnNhke1Semjgz6RzuGpV7F6uqe?=
 =?iso-8859-1?Q?JUX/veYKJplajTIzmcBwdh8K1r6BkHNaF/VJLCtehVUVX/CFySxMa3R79Q?=
 =?iso-8859-1?Q?4vK+/6vVut9xEcKLDbNUY3K6k78W7UhzXSVqo7ytb5J9uGEL4m+EuaLPIp?=
 =?iso-8859-1?Q?em0GARxCvU7U8aHaMNWuARzvXY3YBkjDlu/eX+aL0zgAg9YLmWo1ZmAwNG?=
 =?iso-8859-1?Q?sJzshhNmPpgRSkFeo2+42dMWPWyFy2twxI0QUGX5qP0wRO/fqccnpio1jB?=
 =?iso-8859-1?Q?mfj1wP2EzdP4RCZQIYoOfo0fasXywfLQnbJKEkJEKiM3GTRhxpb3MxkX3z?=
 =?iso-8859-1?Q?t0vTTXF0tL1M1J+d0xEIuQhWA0io7k+EN4HT1H/Lga38eHZqn+2d/wGeLe?=
 =?iso-8859-1?Q?RKAM4OQJ1p+8aVjnGzWb0LD06OnaL8rsejI4TAzyR05LDvTb2BlFIIrwQ2?=
 =?iso-8859-1?Q?vXhmN5Mq+DM9u2ZVxkSs6mKDwoqfJ9rxHOXsXRdwWksJiSkCXrYeolwZKT?=
 =?iso-8859-1?Q?e65VLXoOFQyKGESlmQSu/Ah6NNgqgPzb1seqHJYvpiZel/BfOJZe+hdIQQ?=
 =?iso-8859-1?Q?9x8+bln/zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ko+epzUe+MOYxdCxqhBAyMzyqAgKT+AR/SVMxQknky0nLkvqdAyn3fPJbmOj3U2OuQmFd2WiaBvZJwchV0bHutVGdhNatu/cE12589PvG1bL/BHjeg5m6IADgs5j8/iTIX53V+VcmuTYbBufbRHtNf197NjhmnPQr3tZHpGhfAxzbf2PFqo/23Hqmotah+2aLfwa6mXvA387CpfJKW3kAmthszQbi+M9tpc0HkOT5Vs7zdZ8Vs4G8Hlk9368iWKV8gjHU9DrAM54lDxZ1lndOQhsY/uuVp4uDnEouWXmXOzGSOJmRTXRyVGGpFmZl3YtK77mlmBCbOQ1+bnTpWk3TGHunzRWMVMFfLiLQ8kkIEXubz4iB6WsEDJLC8SRnZB+BQ6rgDyp21LgORa2apU4jtiGZZaFke+q1pNK18bPsl/eeqL8m1o0d6/5hfmzjxp0jpY75NHJPJ/23RYpXX064BVZ2p97+XYk4yXHxV7X7/XNABkcal3mCQqr2yYpH8m3ofpFlehnXiMkn5tbAp/Lh3W+bcayrjoJAqbzgrS8VmexZUyAJcQ/nGpBMPrgGu/mrYPj2HFz4OgGlXtZXD5EEOdUG7sSzVhcaeb7WyeQCkA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1819c1a5-9a19-429b-859a-08de68129e83
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:37:11.2727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJdHuxPCliVjAQN5UJFinwbxZIfS1PyA+ytleZHPD2w/8A3AL6hYItegLtoS3LWsmGFLMYgzga9WPd2icPseKOhGkEayvNJiud2T9Jxjp2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6108
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602090165
X-Authority-Analysis: v=2.4 cv=KaTfcAYD c=1 sm=1 tr=0 ts=698a376e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=FFWX5lzQArNWmrkoG2QA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: SNKuget-TC9MiS1zwTIYlHd0ouH8dNzv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE2NSBTYWx0ZWRfXwMh39WNCowBA
 8ee53MhQ9r/SO8ABAFvIQFiTfbkFfamG+ZTHDuT71gZqrJZ47JXOSK7HTwyE7Raeb1sMTyoMGDW
 0Vwg7SaoC8NVR1h5M5MJsct5OZn8atAoff2LPCg65NIoDvx7Q+2ozipjyb/MG3Vvnx134BpFuue
 6UG6DXCZK73xyOmfWaV9TM6dkytf27Xn4vhjfE43g3IG9q1GRJdUFG43nb4g7AMBIQr6/ANRh3M
 e0VbWFhZS01vi7rjxKnOCR5mn4qcHbhJU+waVitthwjOd1hxwVtE4SiR9P1pENhrTqZ3lguO6kZ
 97hzWTzc6G7x8fqQLBFfgD8diyoYktl9ASOffIFGeGoMAgBZ24pdd/lBdbElAr2mJxigdf35idn
 kWoTG3HAtgTcCIif/ws2EITSata84EkVHycg2s+agoT7Zd9d+JvV0Avo990w4Tio+LF5DRCfGhC
 3xlu9XxXIgJDRwLPp1A==
X-Proofpoint-ORIG-GUID: SNKuget-TC9MiS1zwTIYlHd0ouH8dNzv

On Mon, Feb 09, 2026 at 02:22:11PM -0500, Eugene Loh wrote:
> Could we have a little more explanation here?  Like, what is wrong with the
> current behavior (which is... to complain that the probe is not found?)? 
> And should any test check the behavior?

It is an optimization.  That is why I added it right above the test to see
if there is a pid in the provider name.  That was also an optimization.  In
both cases we bail if we can determine immediately that the presented probedesc
cannot be a USDT probe.

> On 2/9/26 13:35, Kris Van Hees via DTrace-devel wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_pid.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> > index 517b9265..ef97c8d9 100644
> > --- a/libdtrace/dt_pid.c
> > +++ b/libdtrace/dt_pid.c
> > @@ -1568,6 +1568,10 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
> >   	char *globpat = NULL;
> >   	int err = 0, i, nmatches = 0;
> > +	/* If the function name is "-", we're done. */
> > +	if (pdp->fun[0] == '-' && pdp->fun[1] == '\0')
> > +		return 0;
> > +
> >   	/* If it cannot end with a pid, we're done. */
> >   	if (pdp->prv[0] != '\0') {
> >   		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
