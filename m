Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B647F510
	for <dtrace@lists.linux.dev>; Sun, 26 Oct 2025 02:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761446533; cv=fail; b=VraZhafPd+etVvCdsDHvGzT4nTvY27hOCArCKNjiqFHqtVpVO9sqD76YLnELM8sszK6J8+mq+DnLrEvZHTv5EcKkQJnDZMpkdP3R5c8Uvc4/NQp6axaABQlXiN5qJhNtvM7uKirnWCjdW7QlIpbCZ3U/B3M5lF3x6FYKT+b+tXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761446533; c=relaxed/simple;
	bh=04LDIZBbj1VQspKhNcD9cnlSK4e/eXAl3r1Se6Ew6kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NLrTBXz7WArq1+vW+g3t6qTIQ29KLg+Hz9uV2Ou8ZgG0u0aFhhDy6xJf2sLShNd6Bv7h322gC0yIhf3s9c+uN5njzrvRCYuiW9dT0wR4dee60INa5d1QRCG/4MteImkTYzdtb/srhiDd+dNWWGl3v8+JAJyB5SxR5CZctgG2yVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oy9K4Jot; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VolYOljc reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oy9K4Jot";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VolYOljc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59Q21VDP011501
	for <dtrace@lists.linux.dev>; Sun, 26 Oct 2025 02:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=XeQNPaZnDQBDqZK/m9X4Z2jj6IqnZYkPw+0w8CuRids=; b=
	oy9K4JotMEFiXnaOc7a6y34K7jptyuxMhPl5SbKk4xFdEUoRYhIZFu8s1NLcvfH1
	o8IwS29KDSvTgoJWWs5FqGzVv0KNQVTHb/qTJ4SAk1/pA4/yj6dYVDEW+f8yfxA0
	lu7U+yaOBh7h/JjkTjIEvEF73ay0PD0sjLZJBFyCIdAqtbDj0mLX06nUpTjr2xCo
	JMgk2k4yjCs/O5ltVeaIPzTxwqoRo9EzIy8fDs4aFsmgK80LEDS6dhPsCQsrAahj
	cIKPQh99F2aa3Sysv+6fz9yoOIZDrP89XYLy+CJ6yALjfo2mBmtqkBAYkmfUJrAW
	P0exxBomLrelwZj0ZAg8tg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a0q3s12gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 26 Oct 2025 02:42:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59Q0KbjM025068
	for <dtrace@lists.linux.dev>; Sun, 26 Oct 2025 02:42:09 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010049.outbound.protection.outlook.com [52.101.85.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n05vhps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 26 Oct 2025 02:42:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rP2DZFtqgizTjVciR62lEBS1Yf67GaVTn4AoBtoLXgNIqb9mS/m1wa0aMGpwU4XmwuizhtRy3TOKtQtoHZBk+DXbNYReD3modPvRY1pYFvYeWuI6wEaKXG58LWNU2wY04387JbKvtyBob0ontz4AeYXzTkYo9H2HV92egNG48fgROYLaukU0s/Qltth1zd0Tj5v3CihCzktQnEOy3ztLvPE2qeYsJfGC2rcX5cbJgesUD6ftddcFDB4BI1e0vVNOLKOZnJu61YwG+hXrtRHsncVrkVVdBcGQO0pWtX+5/1O1Pj7Crpcu06rpEeRHrCOUSUI/shASWfCCxelwpU/7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sRsGgz8eh7LeIfBxD8jOEbQyHP5EPjqIcN5mtAKCXM=;
 b=XFWhvD/++xCwZXcURRHHQdIIVACG7JdCloeDq1Ez8+9mGJKljFaa9hqpA4b0m822jOuvCsqAJnDBgZ8iBrWnK92fmU87z2i3i5oKsgRz9C+VZW05hYaop97SYDxDFI8BimlscugfVBFio1hY3ea/hh4Znt0UdT3oL3UyCpkSeAr9tnqhwNpgKIvnj7JfBWc188QE3hFIUCLxIGvIg7qEzvQSi2SLY54NM3RFY2jxNhgBPP/4Wcon/YRH7c+mz45dLRJX/VN9kvaeV9VWGVcGD+VjZUi+BcDcLbd/bn8OibtLPmKuRvMn752OIOmlHDSTW4nGKfiDbSGPNmx/6z/OrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sRsGgz8eh7LeIfBxD8jOEbQyHP5EPjqIcN5mtAKCXM=;
 b=VolYOljcVTtRrFfzAjRWoVunt5h0fXSLO+ZvCyac/Nm3tTvL4H38bppCYU0FKoQgGTpeCeVEqm8+bfpI6EPlzMhNXlL16pVJGerWhcRZk/zul/MRz5QIdtj8K9X/wcjLGMet3s44yLakg56hL+exXsPc7nIUVEcUKY8cisEw77w=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by IA3PR10MB8113.namprd10.prod.outlook.com (2603:10b6:208:50a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Sun, 26 Oct
 2025 02:42:07 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9253.011; Sun, 26 Oct 2025
 02:42:07 +0000
Date: Sat, 25 Oct 2025 22:42:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Bump up the version to 2.0.4
Message-ID: <aP2KetXx/ChOiCov@oracle.com>
References: <20251025034446.5894-1-eugene.loh@oracle.com>
 <aPxPZG4QJkAwS7fu@oracle.com>
 <9d62707e-595c-975d-3674-cbc172ccd32c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d62707e-595c-975d-3674-cbc172ccd32c@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|IA3PR10MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 8596a423-b912-41cc-65a6-08de14394100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?XDV478Rj8CogNlrSCu04DTK6UXiGQuTgdEHDPh+Apl8mzftLm+Uclj5oqA?=
 =?iso-8859-1?Q?40n4giQmFngBYjLrL80tm3x1nyHLLebGKp0Xju3zhxhKdSW4QyNYLfrS5r?=
 =?iso-8859-1?Q?Ej0dYDyKPvZgXcEhuaMiX8V96YnhtfitDjkFaHnYnMyAfUGOaTnPCBWNje?=
 =?iso-8859-1?Q?1OuyH4jPYTqyonVW/w6RFpovDTIIukir0d+Y6CXXTEPzVDRgzhGTpW96sa?=
 =?iso-8859-1?Q?oj8tDEBz2Cp3C2kbSOWQd7n+/pYXjkGqzW8h/KljgidgvmtpjhKaCq2K5a?=
 =?iso-8859-1?Q?dWmvBEP4zzAPbYSpLHZvpwPhDh2axOf2oPNksvhqMrg3+PNb7JBFTjSvtc?=
 =?iso-8859-1?Q?RAC/muUxGWL4JtxkI3LjrQxUDueBi7bGPVDFjSs4pm5RzYjIKG1I5FMK7U?=
 =?iso-8859-1?Q?PvgR7CnJDHCG8/gj3nPZRiHmfiLxFzKkkW+bky7eh+9J3RU5O4AcdhKSYS?=
 =?iso-8859-1?Q?IhUia5fKDPG7SJ8livUR2Wc1bdobJa3RSNOlTgsxUbo/m97DkS4xUvUMSm?=
 =?iso-8859-1?Q?+o+KXrSXUq92FEGQTA4QGwfHHLKr1YnbClR3JuQsV1nsokETy02c7v/a28?=
 =?iso-8859-1?Q?UG7QfmI1vLvHYEKnSvsN8exHtOb4FRkI5hiGEm5gOgNv9DMHCqsR3ntAJ+?=
 =?iso-8859-1?Q?hs62IlNuqpip8d10H/frkssjOULmaQdVAA7t0NCFHhJsGyss5/kcEK0QXU?=
 =?iso-8859-1?Q?6wvkUKQnMMQ45rnQzsvvp8ZjzW2K8d1oP70sfUYc8TrUEAt+6b6BqPAtmF?=
 =?iso-8859-1?Q?kMwSokMtcFihQxCiiZoOs+s+h6T1TDVCgbwjaXmwoz8RYLpg7PZYo1cQx9?=
 =?iso-8859-1?Q?9LLovb1XNvkfWjFqBA9DpmRYC+Vu4Sq5tuZISbKaLvMwc4cGxaCEBgCSqY?=
 =?iso-8859-1?Q?9zxM2GaIw2ZT2RN1HaIxzrL7wQec9KccOHV/IERfEGfKRTbBzZARZTor7h?=
 =?iso-8859-1?Q?6uiWCBB2RjSmwlcVENy57oXcoaVuqIyN8+QDbhfWdDNiv0omXbe708sHYm?=
 =?iso-8859-1?Q?XbhgbGWefNRXa1hbsUW2omWdj5KOLJgg+S4uFC3HPDz1pLR2zt29ihqdpP?=
 =?iso-8859-1?Q?72ulqamZ0uYVvUwMD4jnqkZ9gQq0x9JiO1NCiNzanKcTeOzcsJZTRjcFPB?=
 =?iso-8859-1?Q?5HnIze1jpm3vUAQqw1WzfxvExfVtKNuJOVkM77KK7smJPPnvn/RrGWsg7I?=
 =?iso-8859-1?Q?oJgWlyPg4TYiWF5GnaGM70PyiHZhy7OHzBv2r7XLEL+9RltppWNHUwrAa8?=
 =?iso-8859-1?Q?ZR16wQzl6vMxlxeXNIv2dwAlvDDE3LpEf4FzoI8PCbgTA6nqGVl2ZTv8ak?=
 =?iso-8859-1?Q?d4weuJyQZ4X3tdiea+Y+qD0iEuj8RznIlwcXjrWts2RUKZLQLJ98mmBIhD?=
 =?iso-8859-1?Q?9xUWPFPmYtF4QOmFKtDjnEJuivsx6EAPb5QqHIWJPL1ZRW3Sv0mY/12Btl?=
 =?iso-8859-1?Q?+wYond6CmRloiw6jf7udCpH2qYJzegPA42ZFB41s9IthNCNhklRSabr/68?=
 =?iso-8859-1?Q?1SL+i+mmf1zyZaqMJI7KAV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?PlN80AbbZcwi2qa08wjKs5whMF8qpLAjcAnI75W35lNMrVRD0Vffb0ME0g?=
 =?iso-8859-1?Q?d2yisanf+y/imfvABQ3Za2zgXLrNGUAEpr2IuR9mcs4HafFX0uaTeXI+We?=
 =?iso-8859-1?Q?bbCtY++HGzkuoTDNvy4FCGi1rL2CGV8OFfsjhO/r0UnpQImMit845r3lJq?=
 =?iso-8859-1?Q?c2pcpKanOi9oaU67zRWPlgbmhFXO1dFGAlRv/EVfpgba8jFuKWHP/r1NO9?=
 =?iso-8859-1?Q?N2zZdYdyJzFeLmrvYtMNoK+PvSvqXyLOnN/Z949Rf54Q8ccW+YndwvqD5r?=
 =?iso-8859-1?Q?5ivOUM5nHxdiVJ11R2yjEo2OWyQ2z6tax2owNu5OoQLYuzevR6t09+of+2?=
 =?iso-8859-1?Q?Pl/s7o1UNVevveRtyKEZshCOPxQBrj9UC1qF/KMn7WPxTOASnrBz8fv1Ec?=
 =?iso-8859-1?Q?IM1y4q/NvgXzy4/piv9kgVWnVPq5oJzVJ/zWHKjIjr604Grxk1h+AZTcxN?=
 =?iso-8859-1?Q?5z86sRV7nwjAFOLWKEZrbXKWGOM/QGqn+ItBxjM00jihUZxcTUW3RwPMLB?=
 =?iso-8859-1?Q?gDFDHmpOdJy8eoTy+urSz7h4X+0vYZ4StpVdofKF6+ua5CH+Vnak42Y1+X?=
 =?iso-8859-1?Q?a95ahqkUru1IpOh3u00FSI4RfGmGxIC7rCV1wPXyN9GqXFkFawApqQSali?=
 =?iso-8859-1?Q?dSQO9n8N+GOOEfkFtdUBVX/Z8TvfLBZrC1vHY7taBioIOdOs6c5geZm2pi?=
 =?iso-8859-1?Q?o8BguiyEOVZZ/jyLNZFcxGvzhT8SWtbfFqSuG0pQcCE9rAiZLRlPIC+/fx?=
 =?iso-8859-1?Q?HVUPvJYEkv/q9H6+/TpwjRWtldhwLSIg2hFMSWF/wEhB8IISSiNvp5BKkc?=
 =?iso-8859-1?Q?Bf2zkmVk7I9fOPgF/agqTTzNaPIYl1eS/31yxAbDihB8N35XZxjRHtA/MT?=
 =?iso-8859-1?Q?/ESKVcgpTnHOs876O3i0jyiUlLwy1pU0Otc6934z96gytgEWnrO11gcRXe?=
 =?iso-8859-1?Q?XJIrFj+pZH1Cszz2NJfOrp+TeoUCIa19/0B6guNu22mhGUVQj1xWywmT68?=
 =?iso-8859-1?Q?e1RWI/pTPFYVLX1/UDud/FoBrIjC12TSR+yFLlZaWmMd+xd2lHkXeFW+Fc?=
 =?iso-8859-1?Q?o5/h9tINegpEXANEW76DbGf71Ca3MdtouNAlKqUJa8U96SnpOKOAgL3yQF?=
 =?iso-8859-1?Q?bKCmOEy5RSZ23qybgpBff+vLk2WQntAEEN/qIFfz+M2XV6NAInMCTz2u+n?=
 =?iso-8859-1?Q?B5qTd7ft6qWR/Ouvsm7lc1kSm+UYtGsFPFHJbUtCWYXP9PmZoEMv4HPzzS?=
 =?iso-8859-1?Q?Hm+IQphmYFj5G46CRYDDOzRZQLlciQ9FQ60RTFy36QyKDGj030FgPH39Xf?=
 =?iso-8859-1?Q?eXEH/UiPWHakP43XQ0EmCqG01/D2LXPqUEbMdsEv3SqBL8Hih4R/Kgei+e?=
 =?iso-8859-1?Q?0Z53gWtZceSDk6ZKowcbws/9u5WvkdiPv+RUbIf0OWRZGFl557XQSSmpeX?=
 =?iso-8859-1?Q?V3KncJ1F+jmvGyg/QFW65vgPjzyfXq/GvB2sBQUYiv79Y4zbJFlEV8zmLW?=
 =?iso-8859-1?Q?CLyQzSOV7i8Qh56Hc1skW35qzoSCm7szk5Q0VQKzUs8u+x0RvRL/nlnCT1?=
 =?iso-8859-1?Q?ejoFWgsrxq+LwBavbE6SIi8C20sgXI4Knjb17m4wZFKkTqbPSTqoITZbwV?=
 =?iso-8859-1?Q?+LCvPv3joge7N8NUw5QYKxtF4LReMR2VbLmzffzkpU8gbxwlE6/sLxig?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vKoZwdr2jV2kSOt/FhnGDz0ruC/gn08X7nNl4edwg8AR5kUhMgtKaP9+UlaGUqniBs0f8mpy1F+4oQpn6VpUWr/1ZwYTj7x5eeSdmCojRBc1SHkzL0W2llKlHhblQ3fQG5fQhL97hQNN7SM2mSQvk1G1Qo74FKh6Vrp53eVD+Nsjhj85ZfbtT8HxheDomPWj4BqowtOj3KNGXSJwsnYZcM/cZNO6fcXj8dsi+ak05LERO79OFdBQ+x5EBP2iy+/LBz35Vc89Mtm7YRslmhbYYMXA6CKUbBI0uZJX2d8eZ+cjn/Gk0mjF9jv4Z5VDYpfZeMUSr2qDQHZBP1TntFQOedzUJwd/vGAXXM008atxP4gKZCKC0MZ1GfItOrqgeFL6GIo9jgU4u08H8XvOQO68PwE5KvGPbJ2VwPKFuOqZAo6b2J12mSYSFWxFsGdzJWUIIUhFHVRDD0D7hMNzrD/PJMOfCBkPX8k7hEhUpgIZO7dVwM9OrA6NvZ2YwvzqT/dqtzQxeQCMoRW2A0OVg4SVZ1vADQ/fBhtO8d+Ri9Ejh2QqJ6A+1eLU9Z4gPdp/yjO/ZgX3D7IfwOcz98DUkn5W59w8cOCL8cn5UtvylqVkjxA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8596a423-b912-41cc-65a6-08de14394100
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 02:42:07.0921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TewDhxIcAez35eHijQvuPWtIuo3WIu7p0PxPe7YIW8mUN+B5OHMJHZL75p97LrlKOivwiEpnR87pnS40hddFX10b1thS5cM3ILeC83GNfJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-26_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510260023
X-Proofpoint-ORIG-GUID: b2feK0L0Rczrm0hQFU56DlRochpmw5WS
X-Proofpoint-GUID: b2feK0L0Rczrm0hQFU56DlRochpmw5WS
X-Authority-Analysis: v=2.4 cv=Q57fIo2a c=1 sm=1 tr=0 ts=68fd8a82 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=n_LER2LHdZlFGtt_QWcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAzMSBTYWx0ZWRfX8L1xhCOLzlgF
 2Pi5LW+f0XdV+/GcizE33elwkefQ8O/KK/GrcyE5QyTrYG8DVJ23Hwq9BVc7/68ldquqqI33Ojz
 sMZnu60yWUgGpRpVg3nYtkHR0lc7Y43P+Tpj30ksAzM6rpiCieYX+njllPbIBfgj9rLsatX5Gkv
 BSwd7NBKi7s2wIVsEEraBdzhcnWIvn8AvlcqRFn9Umn0qnqNjqGgKl9MZcz2cC5fLjI4XgR+Na+
 m7x1mIjyQJa1r5JfeUmSGp0PMfoxJTU6/vJHmwpw2MdamW1rkUOdhuIYMYBUvtalz1FipnPra1e
 HfxJTsbLsy1xgrzhT7DhNFL0yTwC9bE3aOcPLXMbsgic2zfRWBauJHVifvxnrx2KpZ2pR2YRAI3
 c4JXc7DPZV6gRDdR2+rlk1CIcQnJtg==

On Sat, Oct 25, 2025 at 03:02:34PM -0400, Eugene Loh wrote:
> On 10/25/25 02:05, Kris Van Hees wrote:
> 
> > On Fri, Oct 24, 2025 at 11:44:46PM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Note that test/unittest/preprocessor/tst.predefined.sh checks that the
> > > __SUNW_D_VERSION preprocessor symbol is consistent with the "dtrace -vV"
> > > message, and both of them simply use the last entry of versions.list and
> > > therefore will be consistent for in-tree builds.
> > > 
> > > When RPM packages are built from the .spec file, however, _DT_VERSION,
> > > used for the "dtrace -vV" "This is" message, comes from the .spec file.
> > This is actually not correct.  THe value of _DT_VERSION is always provided
> > by the GNUmakefile, which takes it from its own VERSION macro, which in fact
> > is set to the highest (most current) version of DTrace based on versions.list.
> > 
> > So, the version that DTrace reports is always provided by the highest version
> > listed in versions.list.
> > 
> > The version that is specified in the spec file is only used as version of the
> > RPMs that are built from it.
> 
> I'm confused.  E.g., with the 2.0.4 RPMs we're testing:
> 
> $ sudo /usr/sbin/dtrace -vV
> dtrace: D 2.0.3
> This is DTrace 2.0.4
> dtrace(1) version-control ID: 1ac1d4aaf8fb2ffa21187eb9e5227a487f7fcd40
> libdtrace version-control ID: 1ac1d4aaf8fb2ffa21187eb9e5227a487f7fcd40
> 
> The "2.0.3" is _dtrace_version, which is DT_VERS_STRING, which is the
> highest version mkvers finds in versions.list.
> 
> The "2.0.4" is _DT_VERSION, which, um, okay, yeah, is set by GNUmakefile,
> which I guess gets it from "mkvers -vcurrent=t versions.list".
> 
> So if versions.list was missing 2.0.4, then how in the world could the RPM
> build report 2.0.4?  Where does that value come from?

I think that the issue is found in the following line in GNUmakefile:

INVARIANT_CFLAGS := -std=gnu99 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 $(if $(NATIVE_BITNESS_ONLY),-DNATIVE_BITNESS_ONLY) -D_DT_VERSION=\"$(VERSION)\"

For regular builds, that seems to be taking its value from

VERSION := $(shell ./libdtrace/mkvers -vcurrent=t libdtrace/versions.list)

whereas for rpm builds, it seems to take its value from

make -j $(getconf _NPROCESSORS_ONLN) VERSION=%{version} \
        %{bpfc} %{maybe_use_fuse2}

That is the only explanation I can come up with.

This seems (to me) another case where versioning cleanup is needed.  I think
that the version string should be defined by the build rather than the
spec file.  The version in the spec file should not be anything but the
version of the packaging.  The version of the implementation really ought to
be handled by the source code tree itself.
