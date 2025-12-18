Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D103A1E66
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766089079; cv=fail; b=sq15h4VWWVRqVvTq4PpI8f9TLDg6ZURu2i7ABZN8hmWRWiSFTIpvQP3/DoSyVjPKrv2oFFsdajUKZlcQuZZbAT2Z3Uq8CpW6M9MSFTM6tVFaGkXBdxNkhfbUtGh/381zCo50gXPW2lRwAeFF2GPh6MFDFB3St2ydHf0ngmMRAkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766089079; c=relaxed/simple;
	bh=cDJtL0wyAnxQxKGnFV81820d9b+d4H5RL5GW/i2YeWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OtPj702hELC8SS9vdD0AVGT8bDtAKkifq6Geb6rDAsjz1p864lWya+dFJovg1S+oK3m4GcmtsJMnXSvsNle/5NXL6XBI3+Lhuim3zruYx+Q7/r57rS0nJXu2OTNj6i1BoQqrsJdomvGNIQBI/437a8s41DqiZozHVu30WcwwFuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pJlG71eb; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lG3Ak+Px reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pJlG71eb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lG3Ak+Px"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkfvu1641768
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=PpOchHDV5VBkt6fnjRL1oB7fGbc6ZKQ8D5ETeDUBTQQ=; b=
	pJlG71ebDeSXeXFb9S0f2e6npRPylbqR9hOzs9rCLpvItVFMc+SuouMB68vtHmiL
	46YnDIyAKZZZMmoD9Re9veOcAfyVaPPn/8ifVJg1Y5pcywu/io7KsecIpGuJ5He2
	cV/Q6v4IjMW9A2NvY7Sl/27vuo+AncGE+BXb5n1eLZwdaJHxtYXAYNlyjINA7lPX
	yOgJKx0+xQKg/A5olMk+iSSPrQpCEoNgzsrMhkj4NrHH1tPQ3bG4XmjEGyxkTno8
	Q4H6ISlYsvpmUmoidJjh1Qb4oEOTl35kOGhBjQYiRx5eYbwsonosQsw2AG7N4OFz
	aSlmrzn+OvDLB8yVIlYJEg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2901jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:17:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJTvUG035560
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:17:56 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011037.outbound.protection.outlook.com [52.101.52.37])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtrsu8w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:17:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pY5wSLPtsya2ml6ZU2UGvWJd81+OB6tCiuwlUDSA/47W6LwYrMF+Kh8i6npx2fmkTD+9czKc9o8cmC01o1STbg/Gxv3zFjZ5Ka6l4gw6YNRka3uoRAm0/dPBpBNWX/JI4BTxWoW6XvkLZqrBv9T+Uzn4Jky7N4svY7dHwUhhbezXgR7NCTZE/r9wmmZgE7W0cPgq5hvuqoS7VroOy00+hv564pFs3gEUrfBFdlFa45poW5c8Epym5+YTK4P2zF0Guv5WKa5Sw9bvx+5oGGi0R9iv+WoaL/+P4oNGueLEzLE1NG+c+29pmXLC7ICkRntyRwB3tig3qK1MJLVPK2MOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDxqIhjkAsNm9F9lZNmt4VBThqWAjFgMEbGkvRXtoQY=;
 b=yYh83p69ZVXxFXAbq0HLnXD80YNGngldCkNhlYzcqtHx6XKPW8G/Nwfqnb/C54zbZl+au8NVv5o9sYX1F9T/3FjAoiW02osMb3SlmA4cPfO49l0i3d0F6ip1CPmtS5qOlj0US0pXrVpr4U+RNEeDUtXi2QwXBt8rHe6eGTexYy7JZnM7qe0xndQfuP49sCMjKn/LpvntqwIerT8zlCSFX5vdB1ZOrtepu3O54oQG2TVgor+B1z2rs6FDXGl92J/W9L9cJ3RZOwlr8Th1SVbFgynJdWJH32B5WDQsmphU+XOWH3KGlnzR+iuRAO06xlIM/HCBcwkYJGN0iHqbUydH8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDxqIhjkAsNm9F9lZNmt4VBThqWAjFgMEbGkvRXtoQY=;
 b=lG3Ak+PxJtoNn7zBxqLK6kbIoqsiwHA6wmx6ze8NRH1jktGRVq61feQQOS1xBo4WpA36kV4EOQhm318IkCKWc30sGn5rB5OJ7mvmmkbd0n3S2y3ZzqrfI3tzzEymFc9Mge2xvj5bwlrgQ6+asn0Qz+UY+0AemDEMZ5IXUJ/4Yqk=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DM4PR10MB8219.namprd10.prod.outlook.com (2603:10b6:8:1cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 20:17:54 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:17:54 +0000
Date: Thu, 18 Dec 2025 15:17:51 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/4] test: correct file permissions
Message-ID: <aURhb26qwDFCqmKk@oracle.com>
References: <DS0PR10MB752274F3007546F6860EC932C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <afcf46e3-ed97-8bd3-7bb1-8268df5660cf@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afcf46e3-ed97-8bd3-7bb1-8268df5660cf@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DM4PR10MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1b8e4e-1c62-40c4-c173-08de3e7286b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?SDxhptaBTTVbQuguwR34M5rplEX/tw4mwBFGMRGCgF6g4BbZyWHVyoelmG?=
 =?iso-8859-1?Q?zTSToWz3iQUIsNtRPVROLB6/QvKOJcV05CMKTPylq0kIdGMH1hYpv0SXtd?=
 =?iso-8859-1?Q?Wiz6+Vo7ItZ9oCYpmy8TSQvjcL/cl6CVx0/J4Gjb4fCOP9MaVXHnbr/k44?=
 =?iso-8859-1?Q?a1JlDzCuhqs6bFEmGeGYS9KzE76NF72XrqTPO76L5y+AJ1uZt+8+u8X+ws?=
 =?iso-8859-1?Q?GnzLb45nEWOEAtO2nEPzV3kRfW8tBcG8OmNWgIEPrKyMI195iovKmwUkdC?=
 =?iso-8859-1?Q?XszmNb9MkAO7MrtJ7dKdz1U1T2lUyRRz6NifS6NiJXjay/9yd2RVsFrcfc?=
 =?iso-8859-1?Q?jENF4N7so9y+MUnImOVEYo/MIDDxlDpDZcx+223kQ6aBPn3hhbKmuubau+?=
 =?iso-8859-1?Q?J9QiyvGJBL/jbn4MvEF7/c41jTeMDR+B4ntC8opKHnWp+tcgLXTdNrcVDW?=
 =?iso-8859-1?Q?pGNVnWWNI/ruP5Ypn+ytS6upDj97rTOThUazQ+CCXVY0KwODgJ+KXp730x?=
 =?iso-8859-1?Q?GNd/QApg11pA9SoirQdsvNWI8jbgZ9PENhTSv/XIk9QJBNXosLn0g+cjZa?=
 =?iso-8859-1?Q?iJj7lv+jViZB/j+2+rhtXQay8BYTBSPBmbj0BNpObdprmQ4gbxpDp2aAxj?=
 =?iso-8859-1?Q?mQvXEm6rB95eHlRR8CmESnfJV3fmteGhFRufB7CTfG01vPSF5zPA5zzx29?=
 =?iso-8859-1?Q?t4cyeZzptj5k/a6fCNaNHoz1p+Hc+9vvoakUrf7+7baxouIIJNZ0hYnD5y?=
 =?iso-8859-1?Q?IlEKANY/jrygwfIMvsopxF7ImxfC45/H15dRvBNbHf2wILOzsm55+PGiIR?=
 =?iso-8859-1?Q?obWetUA+nWLBswYDO72YaJKmMYnPVW09g7OXwW2T5tjCREWDDr4CIAbn91?=
 =?iso-8859-1?Q?83EuHZKgSAUkXZg0yLa8+sfsoblSwY9HJc2ftebqM5ZyRDBvtYUCCtZG9j?=
 =?iso-8859-1?Q?du2ZphKT1a7H1cbnBS/VKNaBg28gvZBLq5N+amoDKzEHdxrrnMknEAvi8y?=
 =?iso-8859-1?Q?134U9efhtcOtIQ8RN4KHIBYG/BbSndr3Qff1XZ6LXcDCT5I0sJbibcEblO?=
 =?iso-8859-1?Q?wXfmbROfTtzz8ahhqduhlfa2tCcZqwMO7bFRpXjZrWCMxqVD6DrE2BiK1P?=
 =?iso-8859-1?Q?4mHy7zbC425X4czNVEFNalsFyxn4OeEaNUNHFjFeBGxrfbJoV8iu6MFW9s?=
 =?iso-8859-1?Q?AOYmis0vZSW4Oyuz3p/L+id+nXiyE7Gg4oXAmwFed4F3eYtLT2GOJDauyd?=
 =?iso-8859-1?Q?sFgYLNB0dRQ4Jy8eGyPlYWzKH8aCdmDSEKdj0G42cQj+Ny4vqGvCi6gI3W?=
 =?iso-8859-1?Q?KSZeAzmPuzIOWLjKh054IVlKHh2K2LCuv5tji6qs3wCafwINdkAzD1t5E2?=
 =?iso-8859-1?Q?ayPVLYN/U3SribhEyXBtu6EVYEKWo59VuZDDxTYoXPf4aN7TgRUZHqDNZC?=
 =?iso-8859-1?Q?NxqhnPFyX1Q6n3fWikw+sA2b1FiWCv0NKWe0tThgOehLnBPWUPSp8TcOQb?=
 =?iso-8859-1?Q?a+Q6Sa4aq80W9LhyDu4YeS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?sICwO9zv490CENVyIiG47YVk1AF3vb1Hq+00AerWhM0be7n5Beh1E3M6CK?=
 =?iso-8859-1?Q?NgYKRt2la1jQUTQ3NVELq3l257QLBTmuLxkKUNdY0/95JRKi8dpvji8gVf?=
 =?iso-8859-1?Q?jGNCLcMXSgjuv+EtCy9ReP9JSK4gyYKA8mD7UAiZscxIrBKZGgvbRqcWvm?=
 =?iso-8859-1?Q?U7IIAwKm2d0DE99QPj8qNCulbJMATeJCV6WSCKe9UdETCvtypR/6KgvGHX?=
 =?iso-8859-1?Q?9Y0YRP+ml214Jxu6BKJwl+i7ITHZZGGhrViJgJhA0hjwBQjK0HPw9eIv5w?=
 =?iso-8859-1?Q?qFRi/VLY8rb4VSWOaBm5VRNhnizJfPEZCIDlcSDGuz/G0d5w8d+Knd2+j7?=
 =?iso-8859-1?Q?tbxRVvZlNL/YPxK+tz/HMfpHUB32I0R9PvAPWPTzZzgCQBydPAoH8k5y9C?=
 =?iso-8859-1?Q?jYwFp1siwYADyDIb9jpYY12nNl/TKBDlDB4rdwOItEGu1nhM1/dxnyZWJZ?=
 =?iso-8859-1?Q?/ewngVr2Rwpv9G88CBngDHWwRUhZSNKjVEpoquJXWnQ5gq6TW0ySabDmrW?=
 =?iso-8859-1?Q?Y8LK8rfMz+ecM2qA3YLNqHlKo5sVvtwa0C6WkCl53SIJNetQ37aMi1cCpk?=
 =?iso-8859-1?Q?exxQJkD7rFVOXc8NkvxpyDRGCeFOCR5QMPiHw98QA5PpcPRnLdWeW8Z9I2?=
 =?iso-8859-1?Q?QJyt7iTGQF4pbXGNh3Si1tCewb9nNNkhq86P917S/Y18JoNzMhbCMyBRoB?=
 =?iso-8859-1?Q?PYq5gemNYEshNHT/U7/hek9g2ONRD7t+zQ3g5zQo7NxBP0qKpfOlTx9kc7?=
 =?iso-8859-1?Q?s9rme0wt0NV7lzQVBmw7JzD5mA1AJjc6+4I3oaKU+MSJb6/B1nhXDh8BH8?=
 =?iso-8859-1?Q?lwp6exSzz7h1fc/wvsT05dLpI6PEaXZirm0Yw1ENpd+Y3CzBex3jkithrB?=
 =?iso-8859-1?Q?2TxaVn8ERA3yIUmLXdCk647GznA3O9t6PnNbIzSmAFISUnZ1hcVwDWAsWK?=
 =?iso-8859-1?Q?RJz7WNkkyvQscwotnQvVNEPJUpYDmi551GRDSEzxE+4WTvqZbrXwB6cQMA?=
 =?iso-8859-1?Q?XPxiihQSjlidJ4fNFbY4hJpXsDmbcHM41nouIVXbAW5dKICDW1pRcsegja?=
 =?iso-8859-1?Q?v2IrTDWilXwoVkf5XaIq141FaiyiPruI4zco97bUb/Pw9qusM4NNoJ9R+O?=
 =?iso-8859-1?Q?cM8gHfvT2VRHvDlxBsGlnV4exzgpo9+GUOTP2oiYBIG2vmA/FJlO6GRA+V?=
 =?iso-8859-1?Q?Jx9oWSdn26lK6e5Zs444hhcT8zHQxtjP2WQl8sm0kdHDFo1d1c3TGrcXy4?=
 =?iso-8859-1?Q?uQ9jF2hort4v/UL6yj0hTGO+M6t2X/fLleyQHVCicWd9XMtsPWCyMH2tqn?=
 =?iso-8859-1?Q?0qzi5M1DvRLOeFTD9twBLrlEgdmDAQJ49eaORQG7rp0QsypJd3oQvwzs2b?=
 =?iso-8859-1?Q?tMicTkm8M/qctJcHMzRod1bSIqyn30Pt0qeEXTgKg2de1OwQG0RXcDjPzo?=
 =?iso-8859-1?Q?u7Hhyz9O4Q2obXywm9aUinNfXmC22aQM7WCjJj+eg3yMKc4NKZ1mF1fNul?=
 =?iso-8859-1?Q?6qRQGxiKWTKBDA6h4HIm1eY9xO3J6L60X7A9L/vLBMf6L+8QJ6BgSAikJA?=
 =?iso-8859-1?Q?Gb1aphY+j1rtbQaW4wUR8xWpJez0IypHEKf0OE68ngpByOPN/AjI4GUko3?=
 =?iso-8859-1?Q?GD7fb1HlmSi8FhFFi/2VPTLXHs1S8YiezOaKCefyzwrKgm7F97M86UNw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DYORPoy93Xr/JWZrQNmo7J4s0roSg+9XDChlPrV90Wbc4TxOpdshffcEIGyINzjoa3I1wJwKDirz6ZDxEXhgkXy+tUZiPKWitkCDZk2WaHN7WM8+DTit9KFMCjriLuZkyreT4gSNqrsiLOsKwabcfhn3RoelnxSQstb6876eqN7eGkkc7ttqJ23q5KezalejKXBi+xpZNdqA1/bHkx1n5lOoTOkwzhr0b7+fp60xJqlpnLbYmVaVJ2FMtO2mARdtA+DfhlHp2VxseGZ3ga6cC4r8NLzV9HmVfVwXM98L0kB1mMyO6hBd6XB4Xk8RybHc0Q/nRMCpkeufmyHnWggdmpLp3GUkTM0TSljpy5LcpYlXj6kRxnmKkyI7IkUzxwy3NauR6d3Smsy8OwrC4Dx5Zd5Ki8IGsMSFocAiCapj//EAOufsSiNQ/gWp7+Vo0xINyXIw0l2EdH8VNbsZd5/CBVK3b1TnN8nz5AvaiH7iRSPguTzrrrqNRcQXLMOoqUvskjTpeQ1AaSgKo/MO6OcZ+4+V5wgui8ia/+Y7mvzpI1VHGaGlVlCehrRydalTPw9yEBdj0i1Vvj8MSazTl4tbKwNxHKXGGDQ+NFDyEsH0Agw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1b8e4e-1c62-40c4-c173-08de3e7286b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:17:54.1634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79NkSko5naQna/hPqNriGhJqUtmOu/mo4bVSgeLlHDFJqqgyIkKfi3RCJEcL4FigYNmmTU8Ea27KlKAqfouYugwNvWmvOHUvJtmvX8YY3Tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB8219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180168
X-Authority-Analysis: v=2.4 cv=WZgBqkhX c=1 sm=1 tr=0 ts=69446174 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=0aA67Smoi7zByNBpEQQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:12110
X-Proofpoint-ORIG-GUID: qhb3y-0u8A78GFW4u6-QzRuh-DKEXKn_
X-Proofpoint-GUID: qhb3y-0u8A78GFW4u6-QzRuh-DKEXKn_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2OCBTYWx0ZWRfX9NlIO9SALujN
 3tljeMCUu44+RfvGBy/iMIdLEikloBmpYJRSKY55UYpmje7jjNs6ehT8QgazgbZUJU6UJAHdPCz
 tz79rtJ7cf6dmkws0ECNKjHVlPkd879IhwbE8AZUFAobbFb7H6cbreJMfRoiuXgX14/oWgcRDkF
 a0wzsK2ZpBQWXHDIVsLGQKoyTiHWvABWoZWSzcEgjHhbT2KEQMSajDtwTVJ2ysXQHlebcgUQXkn
 Du5oC7w3c9oGUTYQMpRgdSc8FENzng+TsE209KZHWQVDDeI8qbs1Z/ldrfVXv5G64/jF1itdKlZ
 zUTo6lMgs7V1mLyut7YsMf3+/0nzQsgxLeRX81qmrSTy4YVMB0pEA7OZ6R2WZKg9cfmWpVoI75D
 ZtvSyDgbIl6k7OMnAVM9S0Oi4rkTUJQgMpierc67wsa0f+P4y9B2+bTtqSNNyq7fcC6l80Y+9GV
 340OsSFooyTj1fO1P4L3v00bLtBHFvRN9BHDZCcM=

On Thu, Dec 18, 2025 at 03:07:29PM -0500, Eugene Loh wrote:
> I'd like some context here.  Why are these permissions being changed?  E.g.,
> 
> * There are some *.d files that start with "#!" but they're invoked as D
> scripts, not interpreter files.  So, they don't need +x.

Well, yes, they do not need +x but then they ALSO do not need the shebang.
(See below)

> * There are some *.r files given +x.  Why?  They aren't being executed, are
> they?

Some tests (I believe some you wrote, actually) generate a shell script, with
shebang, and expect it to be compared to a .r file.  I presume that the intent
is that such files are expected to be executed, and therefore they should bear
the x permission.  If they are not expected to be executed, then I think it is
best that the test does not generate a shebang shell script at all.

> * A D script is turned -x.  Okay, but not consequential?

I agree that some of the file permission changes may not be correct - I did
it semi-automatically based on shebang presence when in reality a lot of those
trsts probably should not have the shebang.  I can go through the list and do
a more thorough job at this.  I admit this was primarily to get lintian to
stop complaining.  It is very usrful to flag potential issues, but the fix I
did for various cases certainly may not be the ideal one.

> I'm not against the patch.  I just don't understand it.  There's more to x
> permissions than whether there is a leading shebang.

I agree - when I included this patch in the series I forgot I had not done a
full review of the changes to determine whether they were the best course of
action for each case.  As mentioned above, shebang on D scripts that are passed
to dtrace is pointless and should be removed.  Except perhaps for having one
test that ensures that shebang presence doesn't cause dtrace to choke.  That
can be a singular exception.

> On 12/17/25 00:09, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/demo/script/interp.d                                         | 0
> >   test/demo/script/tracewrite.d                                     | 0
> >   test/demo/spec/specopen.d                                         | 0
> >   test/stress/fbtsafety/tst.vahole.d                                | 0
> >   test/unittest/funcs/substr/tst.substr.r                           | 0
> >   test/unittest/funcs/tst.basename.r                                | 0
> >   test/unittest/funcs/tst.index.r                                   | 0
> >   test/unittest/lockstat/tst.lockstat-summary.d                     | 0
> >   test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d           | 0
> >   test/unittest/scripting/err.D_OP_LVAL.rdonly.d                    | 0
> >   test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d              | 0
> >   test/unittest/scripting/err.D_SYNTAX.concat.d                     | 0
> >   test/unittest/scripting/err.D_SYNTAX.desc.d                       | 0
> >   test/unittest/scripting/err.D_SYNTAX.inval.d                      | 0
> >   test/unittest/scripting/err.D_SYNTAX.pid.d                        | 0
> >   test/unittest/scripting/tst.arg0.d                                | 0
> >   test/unittest/scripting/tst.assign.d                              | 0
> >   test/unittest/scripting/tst.basic.d                               | 0
> >   test/unittest/scripting/tst.pgid.d                                | 0
> >   test/unittest/scripting/tst.pid.d                                 | 0
> >   test/unittest/scripting/tst.sid.d                                 | 0
> >   test/unittest/scripting/tst.trace.d                               | 0
> >   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d | 0
> >   test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d     | 0
> >   test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d   | 0
> >   .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d | 0
> >   test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d     | 0
> >   test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d     | 0
> >   test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d      | 0
> >   29 files changed, 0 insertions(+), 0 deletions(-)
> >   mode change 100644 => 100755 test/demo/script/interp.d
> >   mode change 100644 => 100755 test/demo/script/tracewrite.d
> >   mode change 100644 => 100755 test/demo/spec/specopen.d
> >   mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
> >   mode change 100644 => 100755 test/unittest/funcs/substr/tst.substr.r
> >   mode change 100644 => 100755 test/unittest/funcs/tst.basename.r
> >   mode change 100644 => 100755 test/unittest/funcs/tst.index.r
> >   mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
> >   mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
> >   mode change 100644 => 100755 test/unittest/scripting/tst.trace.d
> >   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> >   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> >   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> >   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> >   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> >   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> >   mode change 100644 => 100755 test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> > 
> > diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/funcs/substr/tst.substr.r b/test/unittest/funcs/substr/tst.substr.r
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/funcs/tst.basename.r b/test/unittest/funcs/tst.basename.r
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/funcs/tst.index.r b/test/unittest/funcs/tst.index.r
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
> > old mode 100755
> > new mode 100644
> > diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
> > old mode 100644
> > new mode 100755
> > diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
> > old mode 100644
> > new mode 100755
