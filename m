Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418C0224FA
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771391239; cv=fail; b=MnWl5YsKyZ7GF92Fyv5gZXEloiIXxLVEalLwpFzFCysPIVEwM8Hg7JuVrx4dRc60kVBq/AGU+1YoWOiZfYiKzFb83DsN7BeqarINeQTonagCZZcdVosTI4wGVlscz804LQiADJD4c9klS3ExFlsvn/r8wnrXV/A+9iC2/IKWZ3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771391239; c=relaxed/simple;
	bh=5Q1oFvLTxJtKRTMsg86t6EnNp49/NCXKYBUAIuY9/jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qHRM9Sc3ku+3O5vN6RcdYiGD2sxsgFRwwGR88TtT2OqN/5BzHX3gNaoHr2cNFrzJgt3oLmT7cPl2fIGlDWBfYK8HLE7UzjZwd6KESxHCttaTsby3IeFVNWQaeAJ2zR8LTnDGrfUPGsldBfOrhIrkc1aqNMNW4u0/Q9euJOxol6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AhqMyUYI; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZH1PftIT reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AhqMyUYI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZH1PftIT"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNDZk066038
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=84uFxtqFqcLNsN7it9ujSNFt9gBQbAdA9Bc5O5ko/vQ=; b=
	AhqMyUYIavjsYxCYBmljqylAGLpAt8Q/QIbLqcd+jzYDNT6zdqp6h2m+eBQ5Jh9e
	rED3PLpUlfSAUXjioJZRyr3qyuWw/Smcsth623Q5lNxF+ijUcMLfAyzqMXCwDlTr
	DG3jYt/hTuccuqUCSpMqYkPjL1VveRm3RL5kTtBHpx9HDJpUcdMcxxTS2840qg6F
	w8tiACqKJ3TklSDlraS+x2nyVzCWjrcywRLJUO32Vr9Z+ObIGMdP8cvM1ZCLbdPO
	wRHR87X5BFWNl9kyvObgBJzOCdU66VHLYYn0tnan6kjXaMXIj2ezY6kmRkl676R8
	gV8d/f+r+9dhzdfj40f8Dw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj044vbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:07:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61I2ODE1010168
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:07:16 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb29mjsv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:07:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=valGr98PBhuGHNLGdFBZrLMi7UJgQF1+mqv6HMUq+dBq8LtJHBZQUlQ8y6BrT8Iewfemk/4tXrStgQ1z6EyfzA2AS57gSWa3YmMGjKn2Jii4hGMwvx6mk5RvarjtLmpHU10x4sAochJBwZ/u/VwXnlUodHs4bG8dmMBZ8FI7URQ/cb4AwWthjNYQdW/qRwgfqWWyU7kkP7mG6EB6qtn65akFmhr0xZyR9AzbfO6D8PPi6FurIhNwPlkLD2BITTZ7FSaXCWaBtEvJu+eFLJ+G20Aiz9+9LSxFSaviRiB64ZE6yJBQDYCYul6/eTq4lUvEeonRC/gMYeEWcmhXcufasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBYX27urbZzjJQYDFrV+L8kGTOmFzyeQncRKNaldYh4=;
 b=Doeca2eft8TplCmUZA7kgfupyadFoR/xFFvGrrkRx/x835BzH3DDiU16HNuiCS6j6aVCIekZZOzvvBCs59O91DeTB402jB8qGa4/JeTTdHDdqEbucb5xAvYAQq2Vf1L9L/m8yHTpeVoL4qHN9zcGs1DmrrG99nBlJsnq6/ytqIyYNRj++pKdqzACWZFUXL4Gc0HHVwal7rgCfYT+9zxy3R+SiQXAWvsGwFYtz6vYz1e8pIABgYH2CbItSR1cerqYR6YsvEmJsW+2bzlUp1z8FExTEhcuVOjuu0p1aY3Hdl1uf+1u/e3qrNHBf+yI/89sNsR7G0t0YjzmP9MWpUiuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBYX27urbZzjJQYDFrV+L8kGTOmFzyeQncRKNaldYh4=;
 b=ZH1PftITDPmBY0Rj7rz/mOgQv58J2KZ654l7HVKIOAaubQUNOkA1HPYiIOKqd3xCniGLpwzkFTpHqbouwcgu/LeIbkgrxQXeHiRp4DLXfZ0BkuGyp87FK8NGusvgF+EWY7/vMWDXa/rgiEOIzk52uqcRE5auUtGj+MnzmJMNgug=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CY5PR10MB6070.namprd10.prod.outlook.com (2603:10b6:930:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 05:07:13 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 05:07:12 +0000
Date: Wed, 18 Feb 2026 00:07:09 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] configure: add support for
 --(disable|enable)-dependency-tracking
Message-ID: <aZVI/VAgoFjieyb7@oracle.com>
References: <DS0PR10MB7522C462F5DF76BD9E145DEEC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <abf2b87f-940f-1444-73d2-30d5b64a5102@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abf2b87f-940f-1444-73d2-30d5b64a5102@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CY5PR10MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 1545a582-7314-4b13-a529-08de6eab930c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?8n6tvUWGFzAobBPxaeALlWDsT2Bb+HZq0rQmjNziOpUZjfEQGFYwfUdvdC?=
 =?iso-8859-1?Q?aBzfjWwLgUPJ0nr7t21PYV/LtVrq7RbLMZ9QMeon/DeFzLJ8nHAuueeTVs?=
 =?iso-8859-1?Q?+jVktQ/uwOHaWnXYpeHWOsYPVGPiM70nje/mON8zToqqDAxp+f1qvhbLmR?=
 =?iso-8859-1?Q?/fPeAfwjntGHh649h2lOUNcupeW015dBA3F5Yiz+V1wTyVY9P130+aS3kA?=
 =?iso-8859-1?Q?qhKxL0tPLCqLDLQwSNQN7p1qcHibQjM4BHos0ivAqHfpKdixh36K6oFD2O?=
 =?iso-8859-1?Q?KMjN6xLPZ18g9OYxW902bxDLi3huxn36enncdI83bbte7QyZObpby2vWaZ?=
 =?iso-8859-1?Q?C9EUrPPq4aa0NBFHDyp/x8aQVGkLbdDHpLaofOCTNJTGNHrGlJS5/EZBQd?=
 =?iso-8859-1?Q?FNK8KxjKHKydkjCtDoU+XAuKuIq8gsYvGazCc4CZAnIVasVCWuqo7bVGPH?=
 =?iso-8859-1?Q?GZGY3USXUfB4B3E0ZDiuEeqCugIqh7Ll5S341Jdlmt/WVgbfKwcmeCISWx?=
 =?iso-8859-1?Q?1fhpqrMCTldmO3ZcNb+Z7x9P3bmv3QMBcz8y1VBedOOXcTeJDHzDnPY1Pn?=
 =?iso-8859-1?Q?gKsxzP63JIQgbViGSqfFyW3pHh17IjrAWHOb8VSnZAIe9t63UBEhFZQSOn?=
 =?iso-8859-1?Q?7KZuMXwjwq+s8csMAuKFFU+LL0YFYX8tVTV67aaPMjRO19ahNrJggIAUki?=
 =?iso-8859-1?Q?LfqkMuJAo9KpA2ZIh5X115ZkmEFcjyO9gIWjXoVvn6pG3WrmV42HLE+DfW?=
 =?iso-8859-1?Q?EqvJwTM18N4VkQ4kHEs9Ab8S/zDYm1aKqHwtAcrx28Hny1w5hitFxbApni?=
 =?iso-8859-1?Q?31RY/L/HcJGI+85sBrK3hldOCAYTkYvpySKlxtlTMpqmyxnuGbYjPhfbyF?=
 =?iso-8859-1?Q?DO+FYXUkD9nPpAQ4MdEQnUoTn96EiOBFNq5n+GTP8na3+HCaY2S7iaKJMK?=
 =?iso-8859-1?Q?MAZMfduBlxOAgUrrqSOa0ZYWFvs6IWTJoQ9vo9i6i81K1rn5DuWxB+6BjU?=
 =?iso-8859-1?Q?lN0w2JFCeOVNyhnCwK0yFsBTiY/D1CppOuUeuO0z3WAJ+d6XmnfBdRaVJk?=
 =?iso-8859-1?Q?eqrcWW9ApjswfxwEICLCOK32qvTedu99/UOU3flirZ2Q1UwCFyK4/B5Xu4?=
 =?iso-8859-1?Q?AU+UIOmcRhPXOvM1OIaes0qe2KfFeTd1uKGkyO0uklrADSe+DP7aIhn3dV?=
 =?iso-8859-1?Q?z1ncbltSWpbKW/Yj/MkTaovcQncPxIvk/3kRC+nFqZiAMVymO9CUyA6DRF?=
 =?iso-8859-1?Q?dJj0PK6YXLnyLTB4/SMMakJtIKVQ/Y5mih9DiDxQrYn0Nqv+Jz3+bk+jPo?=
 =?iso-8859-1?Q?W8+PiCzbG9oiTL3SKaLG+4glYd4sTSGtn9fIkNrpECpsT3ruUYOjkf/NOw?=
 =?iso-8859-1?Q?lDQbTTA2jnXZfy/iNj5Y6mQlKF57MLMw0tlFfCgYuKniUcCSsiuIkabMxC?=
 =?iso-8859-1?Q?t7V12eZgjyUPG3btEDDXQWYXJm8GeTTwrMt5kxFauw5E1wvUswVaXekZI4?=
 =?iso-8859-1?Q?ekbTfG0I8PpqsVLll5/Y2obzzkHWWrZwzBmsoCIK8oG1xDiL+x8kCjp85t?=
 =?iso-8859-1?Q?HTXS3yCszdCMzwaIw62GL6x/RU4zpdpmzgyawaVr9fNP9TNe8XqAQUSmP0?=
 =?iso-8859-1?Q?nZ3AsGlyJ5znY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?GoID8MTezCtUm7JM8vb6LXYlptci5QPF9P5kl0TZtaoVaevAnjVUE8PKD2?=
 =?iso-8859-1?Q?TOLSqdiwl2ahCAlHspGWSR1lkWVW/iGvyw87ZG13AiqDhbCAHQcw7sYROk?=
 =?iso-8859-1?Q?+cs4Z6U2xVpKGxqvL3aK51MP+V5ncimrD0tGRb/meL6woWw8ykcLFTdz6U?=
 =?iso-8859-1?Q?tEgmn1DrqA+QtdPccfd70cMXupE7AP+geLqS1Bz1QR+z9/yI9hjgWtjShY?=
 =?iso-8859-1?Q?et7L5w5tJyynQkJRPrqZZUeoer1QOigtxK/Y5V4WHZjHdBP7Q66ELCQkPY?=
 =?iso-8859-1?Q?Gg87RSGGqjG+lnMPoxw1nyfBgo5jrlzTavPgZvxD7aCCEK294kpC0SzrYe?=
 =?iso-8859-1?Q?SUoFiiP40Y1BtKddO9kTeswn577pIgJ+0EhU8DC3Acm+69t2a1o7Utcw5V?=
 =?iso-8859-1?Q?pHDBkAUBeP6U46c+gNqFY9QUt4gtw7CFDYMF44cuLKRWixGIiFo601tMII?=
 =?iso-8859-1?Q?Z106ej0pZxSFTGgCxrxkLWX8YIOn5dxQIQEadN7tp4D3t5NioQk32hkpof?=
 =?iso-8859-1?Q?N0uT6ft6vA29R5CCCy6P64uoQmAqBakNmehfei4qarfzDCOJjdFPluYK4X?=
 =?iso-8859-1?Q?SIy+h9R4n4u7AaoQi+/ySxqxsxRlG0XjPa6rAJ2qA4O/ngzeADOu2rC0Se?=
 =?iso-8859-1?Q?e3KO+cFGR+4n7rljs8MlRhv0xedct1TWdxZ9WEFFSnJ7bGX+Xm+K3xa5GW?=
 =?iso-8859-1?Q?rkAianOVVP1uCW3wVuF1sFpCarEFqf9vZzj9zFfxTtnxkyGTeQKrffF7rn?=
 =?iso-8859-1?Q?zq06Iup4X5pEjBMjNPKMVx6uvL0y5O9h/gTymK8QKnpZ6hPt/1D43Ab/J5?=
 =?iso-8859-1?Q?va5YjjdViOrmABje+2+lycFeyX9c3Bi+TNiMFi/Fu4VD0ZZ/5jXZa3uk4K?=
 =?iso-8859-1?Q?dFBNz7/ILtqD7TxOHDN6GWgeQAA+drAVLqKSu5UNMOmVVPJB7jL8eUg6B0?=
 =?iso-8859-1?Q?J1jE0QZvIMIWpmNmSvI9fb/l54je46cFZqxEuRgALb6lX6aFJ6Qj2Qq/Sl?=
 =?iso-8859-1?Q?R6Cb+/vlob3SHk0WWbjMAh6ke7+xoDf1w66Riki9/dCKaoNiqu4KLDI5sr?=
 =?iso-8859-1?Q?ueYKcvjVl7A06OCpVQ2LhCLIcS+EU9/weRlztFZsIUaBDaLU9V3YAZWGG3?=
 =?iso-8859-1?Q?hraUUq4wxUdKFmVRx4uL3Q5bTQPANBdsIKF2bexBAT//JVqA2/QG+5bm9D?=
 =?iso-8859-1?Q?EWhn68aElYs7yiysG4VO5WEoImq/lx1m5IHaOImEStV/zoZIzNIjqflCa9?=
 =?iso-8859-1?Q?3CQQI8TKbdyO9ndbcRRFnZnr13jkOulRP18GmY2/FAJnxeo6zFJh+jBDMe?=
 =?iso-8859-1?Q?xMdi3tXhg4EOLP/GKn6by0q7s11Zj4yW/uoXKBxi7BMRNNmTIqyLDbAqbk?=
 =?iso-8859-1?Q?iadwlj9S5ZJ7t9KwR+/z9tMQMrWCXbyzZGomBI0dKDg+Z0h5LMBpOUKuIj?=
 =?iso-8859-1?Q?9tTbX2/BFCBsio0KMKXqVjvSCI5awZmPJCFhScdZtZ6mnuWj4GemYv1IJY?=
 =?iso-8859-1?Q?PEffhzDToV1Cy52dM4uY/XTK1DINF0UnVWr66QiFIO60Oapx1btv31/EgY?=
 =?iso-8859-1?Q?32av7TXpQnDk5/qLahGsh16CatlnUE7KvIGR3WA9I1SRWG7yu9f1Le0UxZ?=
 =?iso-8859-1?Q?2MInGTPggHy71QGEfxXeac+Fv+bIAxoQM3BdgxFoqacjhyZ1o44q5nOIa4?=
 =?iso-8859-1?Q?n1J8pHqYPHiESr4d9lvi2bEHcNSdROPyTN2urQcwvMOHx23wr0UGJLY60I?=
 =?iso-8859-1?Q?WH1YApdbFVEKIlIK0/j1J8X4P4orsy9HG/kYDiHzi+6oa1/Hxsd0wAcjkO?=
 =?iso-8859-1?Q?zTNWL4wx0Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QavPpNt3esboxuRL9Yx1DymUXgN77btR6lTxkn3GQMbTtKPkAPQUSnH0oZgTTmpZbwZQgS4Chn6Vb9vjRk2+LLIZL5LXeArD0XFhQlwlvO2o3AV0FuATBS7VCY3EMyVe+D7spLR1+ttcHuA9MFlpEjpt2cGQSB+mGNcOFP5S8q9ZNSXKs5sASZnDRvlkY01BxHapO1nNhqVQ8QZmqPUSHU81oLwSthWUN31pp/sIlrtDN61mdDerEwCXHefMEqgz8Rd0fWI9/99A9mMfmP/solyrnr6Y2wgeCQvAa9Kz6CsXhnZtPr9sY+xM1KiKGa9Wd0kJ8AfUFXHnVPUg5JoKXn1Ypo/4U/GLOVfB81eZDLDVvmEKF4J451/bWyguDwykBAPrEzzn18NOuJgpomBm5EaFOiLA+SJ1Gegd9ScY1ePEzz0XkFE9Jhus4KN2Fu3gi4jGFL6cx8+a/PCFjD7c/mBGKPnZz/mdD2+QJ7ap6JG4T+zYOq2W9Dv4/AMzqzUUNYXDqHpOnUCj7bPzFNMctbRhYnfjWvIFT5Mn6ml1XTETDHsHIWENrQUKqopmAs8yR9HdvW/qz/qq44Y5VERntYiB2psh0lR2cgcITMnHgY4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1545a582-7314-4b13-a529-08de6eab930c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:07:12.0117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLA+YQAA+qWxNnPYytsygKMUicI/3Wg+WVIPjUlA3L2vyoh0iQ98stDDSSDiqTK5yA6/T8WzVSMzAzoq0egEh0jXW1tkhNplGWdUMiPdbGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6070
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602180042
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA0MiBTYWx0ZWRfX8Zd1NbEiWKRq
 Lvw6tjMek7jAsd6uFkSUQcmhlNXxsX3h6Vfrn0umJWriNvRTw7V3p7hTyJNWjacIAIPFUfLAAci
 WOzBLYzzJXO6H6Prb4Kaekjt5TXMVtIapqg37pL9+tPjX4FkTsZcuzzZl7f2A1lnV1dSaInPycX
 zWH61faaS+jtf2erhv2261FFViGWDsXQ7yhfB7msOL5tHbfhOQkQ82CuygUJ5C3ZWw8L4OcuTir
 328PZdcnmWYupbUZvOJA7InydhwSI64SZ29FLPz1ei7Th667y2P5XW5VVtcZUR9Bu0M59VYLIJQ
 b7UsMrvaLwwQRkqTQ9Duai7XF4lU9oMa4EvdLYAiSd5q+Qe9YeQp9d1ikIrky4uGgbirOhXReCa
 y9Y8HlfbcIstFrW/CmXGzCObyaLkJviuMquTLzREraIp+Lc2mYHHCdgfRkYwTpbRJJbb7eHPMwk
 tVWDe/vciVTMu67Hj7tJFX9OePeYuXtwsk6gpl7o=
X-Authority-Analysis: v=2.4 cv=O+w0fR9W c=1 sm=1 tr=0 ts=69954905 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=iBlt_aBLZMFZwVcoTv0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf
 awl=host:13801
X-Proofpoint-GUID: M_5jERGJRTz0odtgvmYG7k1HMc9YRKk2
X-Proofpoint-ORIG-GUID: M_5jERGJRTz0odtgvmYG7k1HMc9YRKk2

On Tue, Feb 17, 2026 at 03:44:05PM -0500, Eugene Loh wrote:
> On 2/17/26 11:35, Kris Van Hees via DTrace-devel wrote:
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   Makefunctions | 2 ++
> >   configure     | 2 ++
> >   2 files changed, 4 insertions(+)
> > 
> > diff --git a/Makefunctions b/Makefunctions
> > index 15836dc3..1f308967 100644
> > --- a/Makefunctions
> > +++ b/Makefunctions
> > @@ -52,7 +52,9 @@ endef
> >   # Rule to build a C source file.
> >   # Syntax: $(call cc-template,primary,filename-without-dir,optional flags)
> > +ifndef WITHOUT_DEPENDENCIES
> >   cc-dependencies = -MP -MMD -MF $(obj-name).deps -MT $(obj-name)
> > +endif
> >   define cc-template
> >   $(obj-name): $(src-name) $(foreach dep,$($(1)_SRCDEPS),$(call src-name,$(1),$(dep))) $(foreach prov,$($(1)_PROV),$(call hdr-name,$(1),$(prov))) $(CONFIG_H)
> > diff --git a/configure b/configure
> > index 04c28369..fadac05e 100755
> > --- a/configure
> > +++ b/configure
> > @@ -172,6 +172,8 @@ for option in "$@"; do
> >           HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
> >           HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
> >           HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> > +        --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
> > +        --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;
> 
> Maybe add these earlier/higher?  Where the other write_make_var settings
> are?

I think it makes more sense to have them at the end because they are not
really common options that people would use.  They are being added because
the GNU Coding Standards require them (and having them means that distro
build systems that expect a standard configure script can pass typical
options without complaints).

> Also, should these options be documented?  Like in the file's help()?

I'll add them to the help.

> (Come to think of it, how about --with-libctf and --with-libfuse3? Should
> they also appear in --help?)

Should be done in a separate patch.

> >           *) echo "Unknown option $option" >&2
> >              exit 1;;
> >       esac
