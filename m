Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A63286348
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556593; cv=fail; b=V8ATTJyXN2cifYsj/FSXmq6STFPud7Z9GtnNiegPUTIsRwAM9xwCpqE/rtet39z2oKBi9/HXWacWby7Y3cojLO14PV29uiy/6daIA04CmroSVDLNitYXUgeyM8FXh/N5kkX7H9aIaZuWFmTzzHaA+74uvoxYBzTfrvPHBiJ7cw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556593; c=relaxed/simple;
	bh=BE2tovaQT72E8hdYEIDaqKoinpTJa3gG+JUCARbF4Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=V6GRuadpM3FNRhKsbj0eyNmgiywhrCRdEZx5MeRfCy888ddtvWp0eiO9PzISzNvQaMKXeTmsPZLSXZY/6mPljHD7M4PS9Zb7HRVbJC2+2EwDfmgbAYRxAeB2o8l/Y2DLYC5kjrxFWAECOQ6fIs9mz3SZF75HD1o26b4MU7495YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=knMvEEc0; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q1ynsA2I reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="knMvEEc0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q1ynsA2I"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563DZ7eA029196
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 15:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xb0KqvokRJoXn82nkwO8ryO0js20tDyujPxg5z8jesI=; b=
	knMvEEc0H/pIc6GNrZoOeu4HFXICvZ49IXmlNObNy2HYFa9Eu4FaKmRYLL+R8S4C
	NdEHujuezO9BWO4TCb3Adou25cck0aB+CANIzXN82TeopNnNJiwQnKoTn656jjKP
	2p7UOZg7wrZHVaa34KGehxFfLjXgEfsuvvMRvWODmoWWKn/yIBejNDYxcFmJUnKa
	mKgAgJuygqaaJ1UMpvDtbEGeJdH8Av3S7tEe60pX7weTClEi/tGgKJxlhXnYt4a+
	v0knqrQC9BQiJKdEzIKAdLvHAmCwB4mx7Hl12rEYHsGFKV3oF2E9BrZ0Fo8e7K+o
	dvpIbaLVWUNXLANPVTBZiw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j704hb1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 15:29:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563FJq0r030244
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 15:29:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucshs3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 15:29:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aH1YDGy2SWuJIg1p61+Zc4a0qW3VhMmYjKKS3r2K7OnNcOQlpbgWuszbvY43ifLd+PQeYKweW8V9KrcvT9dGttKA7PsvIyOxR3JOalecPn8CMlva1uLo3v6vOnwYNbSLyF0PKrn9rBR0a8LlmkMskuGyh/dZ4bXCCVaGC8TqV3FemrMyUg1+SQx9Asz+7bOZ/uI4Hyh7dpExYImZmWmiShMKpR/TqvhHeeHjwVCZnCbQ974ELF0v0DaJ9EaTd5qJO0uyCv6pCXHMyItJUC3lzDwv8BJuv1QWToqqyW4E7vZMwnhCuoiZ6pM1PXUDHLPDsp2JARpSLVVoY2mI1aX/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLqU/X+n/Lj3IUCmbbT6hCdFyXS63UGY6v1Ukx2gVUI=;
 b=P0Lyxh1XFOsbjSL5J8lFZ0I915fB+AyqeyiX/HWvGRl8JZHj8bReNV16pkAHXa9wDGBskyObeaaIiOayDJWWgTmFxMKVQkVsgPbz4JpFSTiG5k+fJTH+pZH66n4rnSSurjEOlhoTRmFzvWyCK5t6YcFd5m6ob09RzuXHxPr/iujUDRnAEC1A2N76nLXyQCBGtPDWbKfNDbMhfmwAgiKu0+0XLK6Fvz15+QFjlRZ7ahH91ir+yJNz3CTct0RfD5Vf0V1zUkTseHX+Nkv71CPOiax8w6w/fjeHdNDuKS6aTs7btZjnZ2dY3fDqgzsDLS+KBOOHLgJEELlk231NIGKCmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLqU/X+n/Lj3IUCmbbT6hCdFyXS63UGY6v1Ukx2gVUI=;
 b=Q1ynsA2IVkHfJzDxbSzuivwbL4dHSi0ObqrdKQIG1rVXy4o0Gd1lK4gfPdKQy+R5fZ/tMoe2iAUd89lqo8ROQwiB9Md0SEmTOPgp/G2aYBb09kbhYoaOj+RpoHnHZVl24zQus1QVogBVkfQxotkqFWYVh3rbE9jlzi27gvUmLBQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH2PR10MB4311.namprd10.prod.outlook.com (2603:10b6:610:79::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 15:29:45 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 15:29:45 +0000
Date: Thu, 3 Jul 2025 11:29:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 3/4] dtrace: add tcp provider
Message-ID: <aGah5oXmjKCjhI7L@oracle.com>
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-4-alan.maguire@oracle.com>
 <8ed88a3b-6e37-a696-d6bb-38745c144995@oracle.com>
 <fb5b1e66-a2a5-4dd1-8c58-2477b1ca6894@oracle.com>
 <148eabc7-ee00-33fe-b013-0f48fda0163a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <148eabc7-ee00-33fe-b013-0f48fda0163a@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH2PR10MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ea81a8-b978-4759-d7ce-08ddba46707f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?LFfX5hn/Zk804WLT+VBaUlQfhfLbJhEeu4qAyltCcoeYRJ2G+pBinFq0vL?=
 =?iso-8859-1?Q?wcaRYtPrDNOcEtmFLnFxqB+MQF5/RndgdP84s2nUptJ88PsBdnk7g+p4oX?=
 =?iso-8859-1?Q?pn4NCir6RTqxNmQpQ3xCufG4Jvl0G8MDRayLN61HbZsDNhyw6TUdFbvi20?=
 =?iso-8859-1?Q?tft49z73m5TFoxwM+XokSpb+9fanLHlAdJjWrKESiQ4Bo/9f8ZhRoJKRtS?=
 =?iso-8859-1?Q?oU9fPcp/drdn9saR8PrVNrfSwVmJ3D2w+PcK3IZKAsE8pA55DGCIx5jh2T?=
 =?iso-8859-1?Q?YkbPzw8VIqJMwLMrFWjbE4UTU+3mPrMdtIYzUuoVmXXNarVuPz7ayCC0kp?=
 =?iso-8859-1?Q?jZoT7ksYggcduavoSGHK7Evi6Z1Im6FITxYdpkllF0wkkQqM7bwwQ7hTjl?=
 =?iso-8859-1?Q?ZIPy/t8QZtqXA2fufNlgerBt45ocq7YWZl7VffRCROlsrfA7Iba1hS/zik?=
 =?iso-8859-1?Q?TOqqGSTlXjpjMIKgRajAYK0yuEasxANlinMMLE+KEFjDIdCDaoQpCPXGmE?=
 =?iso-8859-1?Q?wIufgabUljDqYGJvwrz5Fe6v/G324kOE39ERqxLMMSLuRpiAjywT9H8mbT?=
 =?iso-8859-1?Q?sn03YwGqeRVR+mbvn+ePVWMG+331B3cdDvqZ/65qRMFv/ncjIeHK3dPb4p?=
 =?iso-8859-1?Q?5Yl1GpiunhuIMwNGJT7+m2coe7JOT8qfkgVJbZsfeHaIksE3zACXALtGiX?=
 =?iso-8859-1?Q?wcv2tcOHs2m584xoVKPq3DITTHEfMwXzscTDEPsfq1eTdQlqKP7gPAWc1Z?=
 =?iso-8859-1?Q?GFggKheqLl0HmtqnUXncpmlmABLUw2z2bVnGNgrEAi+zMC089B15nzFt+t?=
 =?iso-8859-1?Q?3Z4ZB1D6hpEVGwfcAkLKfqOfqiIwt9IjkUPRQW7lHn5UY2e5WcuqerqdJT?=
 =?iso-8859-1?Q?MdVv6ALE6cykRfqpVaW16Wvpb5tT7UlmtzyHd7SGGMbQXo3FPQTC5hTCbY?=
 =?iso-8859-1?Q?rhckDNfu73WS/agxjZIhfQNvnqLUhMr1tgOC4Hc5DshOYF4hXWeb4jtUPr?=
 =?iso-8859-1?Q?gjnVS0sANkgcZ8j4KewQ4xM9u/MGhQd7VyO35XZnMZW1vLPGBiTzTSEwns?=
 =?iso-8859-1?Q?GdZnQMi5v4NUCya0Cmyzhu+twXH+1y3TSeWmCwoUOVWqncifu9bAoYzSJI?=
 =?iso-8859-1?Q?+GwvWl1O7a0Vcx8M7135zqKZYbA3zr7iSy40s1Z4YLpXKSJ/Chy6jSCR4X?=
 =?iso-8859-1?Q?0438r787UgiP6MVJPS9YCVXGYZb7c5Zunm0w0FNv/Jm/GGL5sj4KwEJq5S?=
 =?iso-8859-1?Q?9JOiYdNaO/uY2jxEZRPmx7gDtfbLGCESzN4TZBTWGiss2X7XJ1CgSXyBqg?=
 =?iso-8859-1?Q?1h53yKcQxVfM+IIGpi9ElN8PIZAScum1ARj7kZ5satBfAXcEptIOE7gu+4?=
 =?iso-8859-1?Q?NLjtCNuDnEgE7O2z4oNARo72O3RnZJ/v1h1xYEtp1WAv8dz54qQUwOllZb?=
 =?iso-8859-1?Q?t5kU1KSQydIW1sgMIb5ipYg8mndagoB3msqtqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?i0ntPwt1DWyf699LWBEiYIjdXtV8QaK5YLuD0Se88wtO5aOvCfJmJibKQc?=
 =?iso-8859-1?Q?XraYqLiAY+nEzKM5RHGKMv0A+EbwNu0f9JgWoTrE1nRifrcSdLmi3nTNff?=
 =?iso-8859-1?Q?vkeSwtcKTDTNYojgY2DfmUpeE0HK/7rCj32AN4yF6iz1JapFmMSPQk40kz?=
 =?iso-8859-1?Q?UgkVgevHnu326U5WN8uwVOKjJ+9xxKyBpVEYUDKn7yL5LezVG/NBva5Ty2?=
 =?iso-8859-1?Q?ogiv+8TZnBkcnvrEM55SBLd8Xhj/cuLSf1Wh9PUnZZYd742QlqXXeOQJk9?=
 =?iso-8859-1?Q?HHPj/38HgJ+thvmpQT8E5B62FYlQVPEiQ2ypaNvOPRJE0c9uszM+Jfh7Ad?=
 =?iso-8859-1?Q?U1hwkfq0OvVBtalVt+5KGwpnbYDd9BwBzoPShD/n+ld1ZuG+v86w+9sw5h?=
 =?iso-8859-1?Q?L6PtmjbDRIx/FNUljAkGyhDa0StyLW7aFhlIt/fnyBKx0+1HFRHDubbnQs?=
 =?iso-8859-1?Q?dGvkAwQx3VVGoVynnF0jb22qLgquzPLGDz7ROtsikPOkudZHpwlD0d7ZLf?=
 =?iso-8859-1?Q?r4Vle1qYIeDRinFVFq7YkixTanBgYeJ89FZK3v34qKNfSA0TMXd6TdrWgo?=
 =?iso-8859-1?Q?YtL1DMqWfuCUtoH3P/7Vn5mASMc1S5ZoiL6DAPZgCoMvQAreDR/byRfIQh?=
 =?iso-8859-1?Q?5r3SyhTrYWq7c++i83LJeNTt/GPGF6P0UILgP0/59F1/5AK1RmFiZXP7Jb?=
 =?iso-8859-1?Q?CTFRst5nGjnlXdKoIfHchrfeORLNe4Y69+iauwK3qZ3F2M3SDCF2f/S1JC?=
 =?iso-8859-1?Q?5+HlsrsFmejfnTPFOJB1ro2cAjrJ61wJIaA+Fqzb0RnoWJHT29Ejui20Ud?=
 =?iso-8859-1?Q?9ThNlkTt7a0gTbvX9fFTaAFJ8MHoFe4o52F/qYe+lweN8irwEWWuk1WtVb?=
 =?iso-8859-1?Q?3QePEJ0HaYzdZYPYqLJlcBmiXg1PHjT6nyWexEzMMXqKtPAgQMHSl0WOuC?=
 =?iso-8859-1?Q?4dFtuAM+JlUWbLVDVXOLucvXy0iYoLCO0dw9yQ1uBS+HLapIhjS6jeI1wU?=
 =?iso-8859-1?Q?Nc/XVQXkdCJ7huU7ah7Vis+Kyi6Qj51D//bAgslDz9qDvicsbndiShsvHL?=
 =?iso-8859-1?Q?C4cGCBKuzuORpzUbDgmeHecTjXiKz6Rr8gmQ1G6CncfcF/Yq6R9+sCUCxB?=
 =?iso-8859-1?Q?YGUWsO/aaZyK676+5jPK27vQEnhjwiQWfwGmG+kHj4qmy9YKZmpc4EQQZ6?=
 =?iso-8859-1?Q?lc63mi7J+vfFeqRF3WffOiFzASS2Ihj6Fo4tZIz/OvPj5oDe7NJnN7cfzX?=
 =?iso-8859-1?Q?eD3N2o6WiFweB6c1Ulwq90OwTjz74wTsREPeZYN1dmtuOM+pKi+Psa6Wdd?=
 =?iso-8859-1?Q?12WK6AbRR+D3SK17+5YJYAOuFBXQ3MKoZX8sC9532DXmJO1JoRnKdgZbIa?=
 =?iso-8859-1?Q?27HDXjWy6XZ0LoYTl2I73mR1kHTHrYVK3fTlbKPzAA1s0puyEGiBB2K2JP?=
 =?iso-8859-1?Q?vSKPVFKDOsSoNHPEgVo7H9RidgLJPQoGfRK/GOf+KhtaPdW31clf0j+A1e?=
 =?iso-8859-1?Q?hoxlpVWSEESErGTdXvsQ+W9TSw+8vBR+MaRrjo4cTEY/6mM5L6AdY1KaYg?=
 =?iso-8859-1?Q?BIyJ/P4smFYEk7zjy7/8iQoFfAmadfiAMqqzrkC4uoPD/mH8p59jV0MDVE?=
 =?iso-8859-1?Q?uLt+f1U+36eyBA+WueBacel5eyb4pptTP42dn1ZDURWc21NOMzi+Gj/g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1PuXEbOpYXcxQkk4uTb70bnc+Nide9MxqcQDyGZmp4YybtZw2P22ZpQoO4GyDkp6OxRcMv5Np1p6xOZPH97h8DJJwDID/s4X20tpduco3Bqiccb92/3r2F4Oag1TDN91cuph4yGlyWxER6MhscpMDUAfubCx0a2lDXXzGB8iQP3LKOKb0J0gJYb6DZ07LmMLF92fpelETQ1BPHvYi05l9UJiwyfAGCwnFkrWHKjp4nlQzeedEfu1gRKRweaZE4Xiqk4V9NOwtdAce0+5mR+KHjRdlJDPr00/MVF92ZdiKUO9881QJMkV/FBfh/tz2DjucAlBnu4A0nsvcsx3cpwr2NhDvjA6RJtn2j4MD/HpoH6PwT8U1e+iUzKMZfVRMm3P3FOC+vAlQtdQqoGnXB2mOEKrglyODH/u06fXVTfzn2znylq90puHsbgxjfUoS7J9mySNkKnqQPM1wnFDtWokm0iNNbDD5g5j0wOZb9dmP9aLBWs3P0TB7Rqo7rmkAgYOM+Iy0G847gxhyE3fgPhzGVfpvrV9hO2EIC7ftNy2RN22kRTIjkacsmjd5au0lPwUcpmX3AYEUKsZF7Ujvs2uQAR3hreIZChpLK7y1vXuSq8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ea81a8-b978-4759-d7ce-08ddba46707f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:29:45.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qof1y+6d0EXu7R4SB26v9KhdZpYrgwXFcWwrC3XYVrXP0i/ZLwtYAoieV9kSGoSw8Xz/wMXjsZCHIFDqVxpIUzwtmaPn+q3goFToFIgZ0oA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4311
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030129
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyOSBTYWx0ZWRfX1E/O1snZQVI1 nBcI79Pdj9lsWU8vuKmGyPWO2gnwtWRGSzH8kX0F4smHt1ckFOblrWIYSS2TXx40IQjYepX2Tgf gA9HYwX0LK2hLRWH8ls3Ai/T5kVbMt53bIKLfmjTHF0gn4xaqNCBJWT1T04DFMOFnGhAdhE/5qR
 wiJNcqUQf48MFK9ftNTtFWPGt7DXh336zMg+ugT0DyKX+RO45QzijzrzoN3jGBuNzf+N/fhbpgp H/DFgOJHEda9GRTEK9TANGxEz6SCZdmVIfgAzCNHuHD+bAKSONnNRcQs6k1sUxLmUr88DmZFome P67DzNPC2QGHecUmCMpDrVgRbdHMGdgCvRnkLL23o5X0OfIttusEEGw1s67lbsqUTJekByXqRGT
 qhxFHz/DEsQqDnFZL1ESXP80pdj/irLjt98nUcQyvRT8LnvI/WCam12Hz7TcYMK/m4nf37ku
X-Authority-Analysis: v=2.4 cv=LcU86ifi c=1 sm=1 tr=0 ts=6866a1ee cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=ht1t9o-gTpNC7LUjvMwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: 9WuMyXSv3xA0o32Qigrdke7Gc36-xMRx
X-Proofpoint-ORIG-GUID: 9WuMyXSv3xA0o32Qigrdke7Gc36-xMRx

Not sure if this would confuse things or help, but here is an early attempt I
did on implementing a tcp provider:

	kvh/2.0-branch-dev-tcp

From my recollection it was missing stuff, since it was WIP compared to what
Alan has worked on.

On Wed, Jul 02, 2025 at 08:02:00PM -0400, Eugene Loh wrote:
> On 7/2/25 11:06, Alan Maguire wrote:
> 
> > On 02/07/2025 00:16, Eugene Loh wrote:
> > > On most VMs,
> > >      test/unittest/tcp/tst.ipv4remotetcp.sh
> > >      test/unittest/tcp/tst.ipv4remotetcpstate.sh
> > > xfail due to missing remote.  Are we okay with "shrugging our shoulders"
> > > like that?
> > Yeah, I don't think the remote test is robust enough. Specifically in
> > OCI it seems to always fail. I'd suggest we replace it with creating a
> > network namespace with IP addresses configured on top of veths to
> > simulate the remote case, the codepaths will be the same. I've done this
> > in other test suites and it works well.
> 
> Sounds great (if "we" is "you", haha).
> 
> > > Meanwhile, my one non-OCI VM ran those tests.  The first test passes.
> > > The second one consistently reports
> > >      -tcp:::state-change to time-wait - yes
> > >      +tcp:::state-change to time-wait - no
> > I hit some of these failure during development; adding the
> > fbt::tcp_time_wait:entry probe helped. Is that inlined or something
> > perhaps (grep tcp_time_wait /proc/kallsyms)?
> 
> On the VM in question:
> 
> # grep -w tcp_time_wait /proc/kallsyms
> ffffffff92ad25b0 T tcp_time_wait
> # dtrace -lP fbt |& grep tcp_time_wait
> 49373        fbt           vmlinux                     tcp_time_wait return
> 49372        fbt           vmlinux                     tcp_time_wait entry
> # dtrace -lP rawfbt |& grep tcp_time_wait
> 51079     rawfbt           vmlinux                     tcp_time_wait return
> 51078     rawfbt           vmlinux                     tcp_time_wait entry
> 
> > > and occasionally reports stuff like
> > >      dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send):
> > > invalid address (0x1fc0c0000000000) at BPF pc 287
> > >      dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send):
> > > invalid address (0x225b80000000000) at BPF pc 287
> > > 
> > ah, ok there must be a null deref somewhere. Haven't seen this before;
> > what kernel version/arch is this?
> 
> 5.15.0-300.161.13.el9uek.x86_64
> 
> FWIW, I can comment out all probes in tcp other than:
> 
>         { "send", DTRACE_PROBESPEC_NAME,
> "rawfbt::ip_send_unicast_reply:entry" },
> 
> Then I run
> 
> dtrace -c "$testdir/client.ip.pl tcp $dest $tcpport" -qn 'tcp:::send
> /args[2]->ip_saddr == "'$source'"/ { tcpsend++; }'
> 
> The disassembly shows that I look up args[2] using dt_bvar_args() (including
> checking for a fault).  Then we try to dereference args[2]->ip_saddr.  We
> first check the pointer is non NULL.  Then we call dt_cg_load_scalar() to
> bpf_probe_read() from the desired location.  This call is problematic.
> 
> > > The non-remote tests fail on OL8 UEK6 (x86 and arm).
> > >      dtrace: failed to compile script /dev/stdin:
> > >      ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> > > inet_ntoa arg#1 (ipaddr_t *):
> > >      Unknown type name
> > > 
> > This is a weird failure; I see it on some systems but not on others.
> > In tcp.d we have
> > 
> > #pragma D depends_on library net.d
> > 
> > which contains the typedef for ipaddr_t ; it seems that's not enough to
> > pull in the typedef reliably. I suspect there is a timing element
> > involved here in when the net.d library is included. Perhaps there is a
> > better way to define ipaddr_t ; would using a builtin typedef in
> > _dtrace_typedefs_32/64 work better perhaps?
> 
> Don't know.
> 
> > > The probe names are
> > >      tcp:ip:*:*        Solaris
> > >      tcp:vmlinux:*:*   DTv1
> > >      tcp:vmlinux::*    with this patch (that is, no more function)
> > > I guess precedents have already been set for other SDT providers;  so,
> > > okay.  Just noting for my own sake.
> > > Meanwhile, the typed args[] have changed in number and type from Solaris> to DTv1 to this patch.  Does that merit discussion?
> > Hmm, that's not intentional (aside from the additional INBOUND/OUTBOUND
> > etc which we use to help inform translation).
> 
> Worth mentioning somewhere?
> 
> > Do you see other changes aside from them? Thanks!
> 
> This is what I have for typed args[] for tcp probes.
> 
> The typed probe arguments for probes
>         accept-[refused|established]
>         connect-[refused|established|request]
>         receive
> are the same as for send.
> 
> The typed probe arguments for state-change may be different.
> 
> So, the typed probe arguments are (wide screen, fixed-width font):
> 
> args[0]:      args[1]:      args[2]:      args[3]: args[4]:     
> args[5]:      args[6]:      args[7]:
> 
>             send Solaris         pktinfo_t *   csinfo_t * ipinfo_t *   
> tcpsinfo_t *  tcpinfo_t *
>             send DTv1            (unknown)     (unknown) (unknown)    
> (unknown)     (unknown)     (unknown) int           int
>             send DTv2            pktinfo_t *   csinfo_t * ipinfo_t *   
> tcpsinfo_t *  tcpinfo_t *   int tcplsinfo_t * int
> 
>             state-change Solaris void          csinfo_t * void         
> tcpsinfo_t *  void          tcplsinfo_t *
>             state-change DTv1    (unknown)     (unknown) (unknown)    
> (unknown)     (unknown)     (unknown) int           int
>             state-change DTv2    void      *   csinfo_t * void     *   
> tcpsinfo_t *  void      *   void * tcplsinfo_t * int
> 
> Here, "DTv1" refers to legacy DTrace on Linux.  I guess we can ignore that. 
> By "DTv2" I mean your patch.  For state-change, Solaris calls some things
> "void" (not "void *") and tcplsinfo_t* moves from args[5] to args[6].
