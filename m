Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D673721C9E8
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740589065; cv=fail; b=TlPZHw7OErsyq8Dgz7DOKWOmp9Q/pOQpwDURuuZfTcX13OAmK+4kXummmkzDrUvCoQogmavpQAVoC//TQPjBwNH/ouOPJaAcKAJ9wfcSOpaBPzaw75RVMy1OebXz+7mwm/6JMmQ8uzZaMDPvO14/IoOn5lgOTfcFw5J8CAn7wT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740589065; c=relaxed/simple;
	bh=D362ZhDIwSgCM6zAANk3kk8x8IwFzFTDlm3YU5ppl4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y+JMrCZxksQxAylxWEJyw996qhBEk0IcW+3Bk8TW9HTUXIknWTx4FSokOt4zBq5V0EtXf19Ibp6kMDl3SoHblDhu4blAqBHddHQx3CzppKHQaFY1abugCjCt1iQ7C9OAWJ7pvaG1tL0+INc2W/0Z42q6Ff2dRIM5fvY/4tumcLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J/62D63S; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WP/S8pxI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J/62D63S";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WP/S8pxI"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QEtaqo017016
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=OIbfTIh6LkjGKUf4vd
	/7N1YCjDSvpKND8EYpJrfInwU=; b=J/62D63SvqZIBjOEFZzhk8ZoPO/aAIevVA
	uRokiWX7puDeDvfwqqtQOFcazvNI/M+12jaz+NMRFbJEqvkmmkpkicUeFT60yZi7
	dGHcg75+n8/HyS4CgApP75WjeTwMbAiwovKVr+sVnn2YroPM+EC1Ws8byPnuOUrO
	4ASn50bKQwz8Dwx2sVNDwgtnvuKdvmSsZGZYlN4jIRYHiFMoV+QiWhOQdvWT5yxr
	Qj+zG9GGSaDmT51rOa+a1WChF6Lyt85Mpb7L20rEuDRa5duVgL5NJKE8PD4IUxw6
	lHmYw7NyqrFXo8lUjG/1vtbWoeHomr7ZDBJb3IDIZa6NwHCaRDNA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451pse9k6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:57:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51QGo9gs027322
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:57:41 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51ayk83-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Feb 2025 16:57:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KEO1InlITzDckTzZ9jNNDJo3IFPBAlNmKJkZA1WUm9RiDnGDm2w20V87VHi6ilAMw2NpUY+3m4MibpLAsgBXGiv/sJI5fAOPQ5+2zV7AL8KLHaqWIzI0zyHPmWzEGe8i8CSrLueALdopJZantrJivOuHAg0QPgWtFA4KAINNCBXUric3ggvQBv9CiO+63N7dFwL0181yi7oQfqyn0DUZpBFaL28lRsNrLGx4hZrBPBM4YqWLwqBffKZ9/dSR5EGUSuQasHW9LGp9AlVaD/OJI55eS44eAVX45GmY6sI2czYkD6gHHOUBCoD5yWufybn8jHlHWdjQOY2JGVTbmLccQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIbfTIh6LkjGKUf4vd/7N1YCjDSvpKND8EYpJrfInwU=;
 b=yMi6CMaO2/Emoth1nQ/1itbvJiIC8jpFzUcwyDZk18SKpkHrf4xzfiVD0ai0+XCG3t11f3DcPdtxsmmP9r4BVNR8hp6sMtDyrEoMv2SCgySr+q24fcP+InnGlD62USSdoFRT3eua+MQxznMCvieV6U5lAwI9pBBWp5Io1pLquFWiphlNHJf+wxkrTTlnv+2IRVo8ZSsW/9A63MEjFS5V1ZfRWSaUWwZVx6JzyqTJJeYxepmwOMyUcyBNmv39GDKOMb1NCfytLd9SZlG6ciuf9xLePZFuzQRBGI5U+b45riDs6vuD+sKOzob6lJfTo2rZ7p2AGHrYG39mli5x0znsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIbfTIh6LkjGKUf4vd/7N1YCjDSvpKND8EYpJrfInwU=;
 b=WP/S8pxIz6HIbpGZnnxz0PUJd1/syyZRXjvIKXAWDnrvIAGJ/DgHj89S0iwMcoVNZEd2+cR1g/aOAEoJFWwQsZ+vWKHrs/hfW8EsYtJViBlBb93D236V0e9R1WQkRjLplItXlqJ2B/Cj+7Cff7XSRIeZjclpNOhgBWCl8gAoYkg=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS7PR10MB7299.namprd10.prod.outlook.com (2603:10b6:8:ea::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.18; Wed, 26 Feb 2025 16:57:38 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 16:57:38 +0000
Date: Wed, 26 Feb 2025 11:57:36 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] Fix trampoline use of BPF stack for scratch
Message-ID: <Z79IAPl+30g4d3Nc@oracle.com>
References: <20250116231414.32553-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116231414.32553-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS7PR10MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aaf5e49-7da3-4637-5a60-08dd5686acfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wJomtIYH2WHFmDWuXsAqvewRKAj6ckZqIkPbxKGSdEmV4nkZPFs3+38Fyu0M?=
 =?us-ascii?Q?ieZAKvRbw4oyDpaGQycvcNQA0xD8R/VK0WLTaUer29fgDxYL20c0iDWkRpV+?=
 =?us-ascii?Q?tRiMHm9o/Hv2a00ceim9b8BkVKMGs6VkPBoydVRlOel99jZDuHTwwh3ZqP6w?=
 =?us-ascii?Q?qvDxqSQcV4jdf7bPm4fEKwCXM901mOutymKoZiEDV93/Of/ZZF+34HSwYc0Q?=
 =?us-ascii?Q?ioBTdT0eQbISk8WSrrxdAyVZhzhkfRW/IRuafkXqmJStBY5ssSUgyOzoEigs?=
 =?us-ascii?Q?nGWVr5ar4jyVIC3uy9OcRu89NUswAVHOxKChCL0KR8Z6yLrx9jgpC6wnrCDe?=
 =?us-ascii?Q?ezW4SyAmHlYKaRKBcix63bRsOPkem62wThmcRDXcrQFiSkepdrfxxREoWH9M?=
 =?us-ascii?Q?wdqDMO8cJagiXxt2yiwFpXjAQWuA1H1japUjg2espdpPzg6NclhoK2gQVBGo?=
 =?us-ascii?Q?6H3KxBpAKjOSXfqMKOludBz9DgQz5pVWqBP2EaJawYk/sZ+0iPDw/dMcMoqY?=
 =?us-ascii?Q?LsPyDV3/dVqthHw71mb+xcaZVVZ6eXuN0/mv2d3+Ca91JvzFu3wj0B3+94AQ?=
 =?us-ascii?Q?TM/jShh4Jzq9UX1KaJ55yRiOPW4dpt3d88raVd1pPiez43Y2WrNr6q71KSls?=
 =?us-ascii?Q?dSWEf7VjulThIc+I18Sp2LNcS5BxiuyYDd4r15Pa8Jhh0XIEPdZA/P8LH/Wy?=
 =?us-ascii?Q?eh+07s+JDkpq/Om5Y5QYJI3mf/J9gFUiffNFV+Q90Sf7udtffZgjjgdljEYr?=
 =?us-ascii?Q?LAJGBK+meLRumUT9H3jcHLnt2ZEdMhNQR9uUp4zl92EB65pS1eSPdSXV7OAh?=
 =?us-ascii?Q?ui++OG7l4pA3fSJCzTH5tkZUTUgUSnWGpZQhbl6NHxxLemDgOQUZJL11R8zy?=
 =?us-ascii?Q?6CDR0YPDWOMAAlD+oOwUJwU8Q/dsujlD4KusHkPZapCvG4J7Oaq+6s7Yc0pr?=
 =?us-ascii?Q?VNx7Th4gtvR3+N9x+mACjdwdSWj2GcRs3I4p7nlstsBbn2PhRvvPWIZfVTiH?=
 =?us-ascii?Q?urVueykaFF211U2b36LTwjpecxiBZpsEtb+9YhsaQLdj3NpvvDzp1IkadCq8?=
 =?us-ascii?Q?fGiceLhx7jD7+SSMw7WVsLxXA2oFtwIOjqbqSF82nTWNY2Pt54Ynp7aEQvao?=
 =?us-ascii?Q?5OMBzamQ1/qZykkWNJduyu7aQItAIXZs9Q5YgZJzS+vI0jupQm04cGWX/zhk?=
 =?us-ascii?Q?o7ChkxGo1m4k8Qx5W3N2zEn6bFh/bk4MViVi65XEgIvcGGgG6DYCquU3QFiW?=
 =?us-ascii?Q?sb7RanzFnei/VJUnKcJT+s48lFB+ibjpKyDEq2RcCu/T4xEhDULH0cPclcQz?=
 =?us-ascii?Q?ix/bHQrARjvTNcIIZGYARoGXI/NE4tcilEgJmlHEPnLaFQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzeTC2y2ey7UkUAGAYwKeNsqY5EsQVqd3coTEg/AaQKc6i1WrG+TQmEMCNcw?=
 =?us-ascii?Q?zEBtJ4CnX05A8f1XI5//dtMIjgDWy0GcQlWN9ufk/BM4n27DO52Jkm0FdWcr?=
 =?us-ascii?Q?WBQjiuQiIfAq7ExXjSMXgqHVDK53KqfAMTHW1mfEDW7xK4iqAToj5xkdkLKi?=
 =?us-ascii?Q?uRwcz83Ilzr3HBGAxQmu+CnhKCjbspAdUSqsjA4BuwFGMDOuVoVG89RwQv9w?=
 =?us-ascii?Q?u7dpBkuor9GjM4NlJO3hpRiS3YiZMc2RuSSRuoHIutyYj9EVeaLDQIO+xd/y?=
 =?us-ascii?Q?fjojF+XNpcARDd1VEQMl7P7QA1XaWabs46n4HUw+ZkRzkQ81s3FuoxbRojyZ?=
 =?us-ascii?Q?GkjbGKNYgw4kfoWwlROsM8ya2TZ4OIE2qxsKZegiTWaRWqsKEH7ocgTUWKA4?=
 =?us-ascii?Q?Jqk2NemEj6MXq3gU7egrMqJ61ZbNKJfyLGdATt4R7q8MSl/sZXjZN21p5ZD+?=
 =?us-ascii?Q?rUmGF6KYhA0wwHhvFBuy+xS78elq7mJu8SyhRodiIOJ4AAYgjszuzpMi4Dxp?=
 =?us-ascii?Q?kCD0r1VIi60CTYkgtpITLKg5XM7w0fZsekRqvLP2VS3b8dw/3X0IoWrfGBmd?=
 =?us-ascii?Q?68uaDo9efnTjmjDzB7O4o+eAmvF3Q4ePmj9vhcAgyet9ylX71hp4a01JRemK?=
 =?us-ascii?Q?T1mRl67BxEIelB41PA7Qa+64TOFnimhA5iRtOnsmWVQdnpLBBXAWiXyT9ApR?=
 =?us-ascii?Q?mOflNK+Qd51daPanu+gIgNipfvz9THE8R7YwZiikisnmba8Bd6Xph/nPilga?=
 =?us-ascii?Q?MA0uPsfPTvb02wLDxCNXr4vTbbJzo8W7+UOG7mjT3PyEIlzn7LGjMfrRwqjy?=
 =?us-ascii?Q?fYera9z8Fo9AV4ygJ4jz9V+CfTgJd6xHF9wpz4vsJeVM3bv8QDPeGBqrFQKF?=
 =?us-ascii?Q?4GntMpJUVeeXbAo9RLOJU53t5cGgBYwugxPVMf0TZc2MuntbR0js4zedjmkE?=
 =?us-ascii?Q?9BJ/JPzjmpTCWXtUKgXCC/uLqnAJslV5IXH+0QwqeU/kxEp9x8ZLE+4alJgH?=
 =?us-ascii?Q?2yVqnTec9/XsU7VwpLhBKkdtpVwupl9jFxNP6Kyy6hoE+l08dieicnZFPpE8?=
 =?us-ascii?Q?Od4Lw7YHxAXwuK4B+Af35qhB6w++FgyzHwGtwDfCB6R74j6+IeSfGTOKeIp3?=
 =?us-ascii?Q?HkIHvdZPNbwq4fhvxGnY9AlDu0psGb3d6TwAmDdTDV9iL+PvFUT5V1Y6Gw9b?=
 =?us-ascii?Q?FsntB/bCVyWxAjqo13/DiMIwOfvI/uV3rh6s/Jz4pI34YEQL6/rzleYQBJVB?=
 =?us-ascii?Q?e/VMQYFJ/HjXbFEm5K3f+EraXl4brnV2FBXR0lMfLP8IRIM9N6Qhyk2W2vNl?=
 =?us-ascii?Q?/4RHBq+80+7t1njhw1tVb52TJlaOgkHK20dIiklqoV4eTLpbv/yHRIg6gimn?=
 =?us-ascii?Q?srziXlF431Zv1/IwZ5gRxJVT/K0RuLXnHHS+O/abZmSMFxIhlldWZjc0LCuV?=
 =?us-ascii?Q?UUeFioqrZ0qCe/XSPRaxYoD4EfwuCugnucxDdVqFQ3cVfH4O79hZcvYSXbIM?=
 =?us-ascii?Q?w2zBr+eO3TUu6BQQNT7mvYWXGK6ltJ89G8kuG4LSxT2mN4zIMkOB0ZbxNeet?=
 =?us-ascii?Q?HuWKQRRRjdy45jEx0VwLHQrk0GK1bAPpEAJgGJDcumaOAh6Z6xN+QxNPlKAf?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	klyCZdlOpyeG8Whi0WRBQeetFviCK/mVQ//yTJ2noqqsVv3/OvNKrEZOiuHpPFcoa8sbsB7MsRF7EmlufipF7fhjA01lqYSA4y6cFZYVz/4IJX9Zj9kvxOHfyg4YE/ksitPzAiJa/lX02eNVt1iTj9c9BLrgHHCz/EuSDYkNdsGw/Gt4pbXxfUmwUWnIvg4ZJvQzO0d3TJsG9P2r7dzupeqkF2cquhE+9u6OiB8wiYwwD6MkCXjTuSkcC2j9z1I95b5o+aWEDNpM2rD40LKC6kiGTi33E1g9+KI1qlawcTO6rbTTNr6wtQqWfLTcKc6hFrf5wBrh1Ek7ZVJSzyxmG7ZcFUFa/irkZMTudLajpaE1B7hMHzLDRkCcj7IArZvg1HhyFUCVZVPjY4EEv60vKdKFMslsNjguj7pqIi31Enhsad2eGIvZYLhzmSDd+szTisecUfUgfKD5s8OsXU5qrWD2L8LDZ0nhotSTsy2WpU74jt0IyvO0OxOQL2VHFB4dWkq0W3E1G5fQSw4aKs3dWnu3IxdrNJaRtIucwcAXJeqIKHkxlRltydYI7tPWDA/1puzxZZpuIy21dli5AY6W3b/hN/GtOJXvfPHPVjt3BBk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aaf5e49-7da3-4637-5a60-08dd5686acfc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:57:38.6053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4fKBJC71L+qIdYTDXy+39Kr9xikRNlbRmQ+pCYmGCEl8rNzC7LCIBO5R9ph+ZdJrOe9w6tbJ56rI1u4g9zPDkjye7oa8r1HkGUvTeD9mFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7299
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502260134
X-Proofpoint-GUID: yoZzEZDEIcF0drj1KzhdEFxDVTyDh-a_
X-Proofpoint-ORIG-GUID: yoZzEZDEIcF0drj1KzhdEFxDVTyDh-a_

On Thu, Jan 16, 2025 at 06:14:14PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The trampoline starts by setting %r9 = %fp + -DCTX_SIZE -- that is,
> %r9 = %fp - 88.  Then, it fills the BPF stack from %fp-88 to %fp with
> the various dctx-> pointers.  Calls to clauses will reset %fp.
> 
> The proc provider's trampoline was using the BPF stack for scratch
> space for the exit and signal-handle probes.  Specifically, it used
> %fp + DT_STK_SPILL(0), which overwrites a dctx-> pointer.
> 
> Switch to DT_TRAMP_SP_SLOT(0), which is intended for this purpose.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_proc.c                         | 14 +++++++-------
>  test/unittest/lquantize/tst.32bit-bug26268136.sh |  1 -
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_proc.c b/libdtrace/dt_prov_proc.c
> index 0223c5d18..9fc499aeb 100644
> --- a/libdtrace/dt_prov_proc.c
> +++ b/libdtrace/dt_prov_proc.c
> @@ -62,7 +62,7 @@ static const char		modname[] = "vmlinux";
>   * The dependent probe support should include a priority specification to drive
>   * the order in which dependent probes are added to the underlying probe.  This
>   * is needed to enforce specific probe firing semantics (e.g. proc:::start must
> - * always precede [roc:::lwp-start).
> + * always precede proc:::lwp-start).
>   */
>  
>  typedef struct probe_arg {
> @@ -350,12 +350,12 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		 *	else args[0] = 2;			// CLD_KILLED
>  		 */
>  		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> -		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
> +		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
>  		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, sizeof(int)));
>  		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
>  		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
>  		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_probe_read));
> -		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_FP, DT_STK_SPILL(0)));
> +		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
>  		emit(dlp,  BPF_MOV_IMM(BPF_REG_0, 1));
>  		emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_1));
>  		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_2, 0x7f));
> @@ -406,17 +406,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
>  		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, off));
>  		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
>  		emit(dlp, BPF_MOV_IMM(BPF_REG_2, sz));
>  		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read));
> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_FP, DT_STK_SPILL(0)));
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
>  		off = dt_cg_ctf_offsetof("struct signal_struct", "group_exit_code", &sz, 0);
>  		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, off));
>  		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
>  		emit(dlp, BPF_MOV_IMM(BPF_REG_2, sz));
>  		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read));
> -		emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_FP, DT_STK_SPILL(0)));
> +		emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
>  		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_keep));
>  		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>  
> diff --git a/test/unittest/lquantize/tst.32bit-bug26268136.sh b/test/unittest/lquantize/tst.32bit-bug26268136.sh
> index d5f143f58..a360fd17e 100755
> --- a/test/unittest/lquantize/tst.32bit-bug26268136.sh
> +++ b/test/unittest/lquantize/tst.32bit-bug26268136.sh
> @@ -5,7 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
>  
>  if [ $# != 1 ]; then
>  	echo expected one argument: '<'dtrace-path'>'
> -- 
> 2.43.5
> 
