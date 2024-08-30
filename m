Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABE124B28
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724984780; cv=fail; b=Lpfz8nbisNi8Pad+LtVmWq4i3QaCrrY97b6quyQZMqoRZjIJgQf888ziquSVb7cQjYOPchb3Ym6AoC/O3GgkeKEMweC2rlD/vsCkDLxrUiF4k+oI0iMuA2sWgHbRadpqfk7rx4s26VpDPYbRZgVLd26bfj7RGLm0uK/yttiaVs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724984780; c=relaxed/simple;
	bh=fZhVLt8DF+MvTJJSag9BWnznjkWN2haJzd6H/NOuwBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cC4UluL0S5AB8MJ55d+k6l7zy4oQQ+0sBEppY7TiU4xGB35cGwwFlOtsae3aLsgOGlji/8n8IzQPyoy0b2zP/J0M3vvUGRz0svkI8DpUA3xN/lrQeeq8pmoXSkKW9eaPUF2vOOKIfyrOWEbyiKgU9tAYcWbbHbMqM/ONlhwTYk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gQhNukk4; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SWA7GkDX reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gQhNukk4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SWA7GkDX"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TMctMm001374
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 02:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=l1H2EhB7ec4fWVTin1FKzvInZr/m0l3jY0MCYQET+Nw=; b=
	gQhNukk4U6vcB037YJPjV7FIdNEhpoyGqbWTNxqLZ+Ysr0h9X2g2il/tdE8Ya7GV
	2qqw1lKsB8jG/jjZNw9uNJHHo+rida9izNhTJ8bnsusUw6O5fhtV+8kD59p//1Vt
	c0Vg9ftHCgxuJjcYEFNrdWv5BUWWEBrdMmU1/dXr5XBCUps7on/Vxm/hJEF2uno1
	Eu2puqqf6u+KxW9Z2p5gmxBZNXZrUBjVbT4BiDVIPis68tYNoVoUYB3v+uk5ES0T
	oRNgEh6EKx7UKwGtJOnwKSWCCcp+KhtM5+H3MgNHQJjonWHkFGFyw0o27lQyqpBh
	LmGj9KVlks+DMqS6TvX58Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41b1y3r6rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 02:26:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47U0UWnE035155
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 02:26:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189swspwd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Aug 2024 02:26:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKTZNdGleAx5XrWfPnE0oDhyrCWGF2MLEOmd5F4zH4IWbYIN/avoKMdQsxzlrrSKbnWu6iNi/a6OyyPCU5y6u+NgERuQW8XrFeYVchakN/CXdp6uhQSzjYqqKs1TM0bWKwB5z/ATqcOfIWp1hyjKZBpRnnoUWl4zhuI8onkCFePjePvwnD3I7BxnhsR8AP1uaHO2A3/w5E/VDn52oSyl/Cg4da19Ek13BbAfeaXoUDZB963eDqZRsjwxDR+MeFcY/NgQZRfAmdXckk1UIUK8EciUlkPcYM/vrL48JZZBFQGNGxX6MnKGR2vbPUiDLPONybbUt67lZCgOQo1qppmUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIym4D7ZVsxneIWDXalctJJPqeSa25eUkCb4mS9hWiQ=;
 b=XK+3siTLwCY1pexchO+V8M2eiJecx/8jXQ1BgV6K/jnhDGmKSSmM2qf0vSj2AqlyLMjqkiiAO4Fz6FUpb0kuvhvHzjK5gV0yrchC32RqH5ZHyTcxYFcIKYFR7BUNxmeGJaQ7pplkAkLRiXGxunNFz+WlhnD5OIyK2Db0I0nnhpVo8M3TaS4dKi+hGeVg8I58GintI+3z6JOtgmA+yJ7nt0aLmFa29KTwLwjHdD+2FLfzlFeZdzXraGqMUqlCgUsenj4xfbUHUZT79HyGacuB9eq5mqi/nhiz05DEXcYBQtxU9uxaLgWVTkUipwFJSYK1aA2FOJiaxtgddfd8D0fClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIym4D7ZVsxneIWDXalctJJPqeSa25eUkCb4mS9hWiQ=;
 b=SWA7GkDXwULVAFWrVFwYsO5I6TR48AjUQ3wRg/1qlTC0r03ifQiVJdMVlsoylygu+rDuKzRkSPLxrVTdRY9ZQpsJCeJz9x/CXArOvyId/u/mjNS/Sun4nF62azJLU/EG7fnds0bA6SUFooo9jVswU85qwHUitP9WTylqLJbVdK8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB8059.namprd10.prod.outlook.com (2603:10b6:408:290::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Fri, 30 Aug
 2024 02:26:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Fri, 30 Aug 2024
 02:26:13 +0000
Date: Thu, 29 Aug 2024 22:26:10 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 31/38] Fix dt_pebs_init() call
Message-ID: <ZtEtwnkc2gWT3zwD@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-12-eugene.loh@oracle.com>
 <ZsyRbgnYtFelMhM8@oracle.com>
 <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
 <ZsyrTYUHihmORaU5@oracle.com>
 <9a232070-92da-3d5c-8337-52286fe66c4c@oracle.com>
 <Zs+Tm8LO6naCCQz3@oracle.com>
 <01996fde-0909-57a0-3178-2158b377f53a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01996fde-0909-57a0-3178-2158b377f53a@oracle.com>
X-ClientProxiedBy: MN2PR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:208:fc::46) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 33767105-c7a2-4c0e-df5e-08dcc89b1e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?XVuDtHY9oJaVLNTz+STo+QjPWBWkG5XHLCaSqJh0zgyw1NXa4hpCFzqv4h?=
 =?iso-8859-1?Q?8yDnkHc0WFE+zC89tt70GBB7Yd1Xr7I45g3zxTwKv/W+tMhlCEOz/QSPFJ?=
 =?iso-8859-1?Q?hoaB6Cw9yLD0IYidgtzj/hF5e2pQxLV3C0uUFRYs0s+N1vee2MKp/KL4VC?=
 =?iso-8859-1?Q?5tzTIchuit50s4ReC3/8ZvQ+UhWCPcmMhFqQy8hq9slfDyz+1aaGjbtM6P?=
 =?iso-8859-1?Q?u9Tie6lB+eFkBQQanuZFc5lBDloJ/sjEAU51NHjccWtyn9uG/kk2LlbYdC?=
 =?iso-8859-1?Q?ITrgW0vIfVr96sNdAbxrivZDeQA9nsLuvQEQWw34k+CmTJ1S8MWPcecFhy?=
 =?iso-8859-1?Q?pTo6Src16sk06aG8rnoyr03vNArUWJXyTCMOMIBFKH+2V/gxDOpwhoTm/F?=
 =?iso-8859-1?Q?qoUL6/Sv03d/ugCcN1aXjnSWVSJq9yuKIfH35qXRGyJuBJt9AIWA/RYFYR?=
 =?iso-8859-1?Q?0E/77OtDQYYM6E3iBVC7RJW6+inwbLBb53QrwCN+7Gx7l/xF4uJnV96YGe?=
 =?iso-8859-1?Q?yZcBXW7J/9/Zm3N6XJqbcaWfNAk54VW3hqcOIUeTvN4ePaw3mjvtQn09qY?=
 =?iso-8859-1?Q?2xecLZF47nCNplWYLPLDzpqbpUIszBbsHqT/d5TW32rwEVk81lcYACoPWZ?=
 =?iso-8859-1?Q?liDmhZRhlsapOOVDUsNQOXoOBa7H73V+VwsHZM3mkcjxl8BuduPfMuBhvN?=
 =?iso-8859-1?Q?p9yl15Zu1FJP7u3NFfiEpGAyeJfuVfJTw51bpkZ9xeAIMLITVHUBksQQun?=
 =?iso-8859-1?Q?15Uxj1WY9QXnM0thIHaQfxxcOplk74vuhuWsHhlSw/0vqbm+GdruuWcl9R?=
 =?iso-8859-1?Q?aHDWM/hVn2jFEAnmgUlPDy3JdaynBVnl+YFlQW8raHr8ZHCLEnQUTASpDq?=
 =?iso-8859-1?Q?f6SsLm5KuasRseWYbAuMOU3gx3oN1+FjPR7yiEHzna6N2/+hSqxywX/U/Q?=
 =?iso-8859-1?Q?AT4vnyTrh4TjBJBLlHq5qpfi38MUCTLpKbxx2Zblrk2XO6k3gR28Dhg6rW?=
 =?iso-8859-1?Q?No6vY5smncGPTNIZvtcH2/GxPMwmfI8Gi6FokoQNXbLcJHNoYUZyZbdzUi?=
 =?iso-8859-1?Q?xSGQ+WOiL7oNCMVzhNaQDpvqZHhMJhDLd71Cwf1XhnM4NrfN3+mB/wbvEo?=
 =?iso-8859-1?Q?ArBWazHJWqeUaablh9v8sJDDJrWVmZvu39hvj1RKjFW+29Fqf4KubFrtwh?=
 =?iso-8859-1?Q?XskRMQ6ANh10Ie9zMkrSuWzd9OXnEw9Nbu71LC0o5geXHiuvK18p2KhuqQ?=
 =?iso-8859-1?Q?/965aoQOLXi1jHgbo9pKbbD09cb6B3Q5jfvmcLwPWViOu0WwkqsLlaF2YS?=
 =?iso-8859-1?Q?oJZroi9XUO9TD4zw20ub5nfSBSJOFNj82wBmGHSrjsEI9Ww=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?oH03eucLjC31RQQME6DJVpm9X07WHzDqdQnOJCjDrUqHwDeNyeYaY3Slew?=
 =?iso-8859-1?Q?3CGKU3ELqsuC+f6iwS6J2AYb3dQHDsj9tsU4HTnI7+ts1nwyiIf1M9I+4I?=
 =?iso-8859-1?Q?KtapyFPustEz7vq7NackSS9WxJOAF3SNBMRAedRzDZaavm5NeYWIabC4wn?=
 =?iso-8859-1?Q?kVOVo0HE70TawpxiD1g2VFncxxe6DQP9xXYu0KBQ4WIBmxRKn1lBBZ5cX5?=
 =?iso-8859-1?Q?QrizbdYy4FQM/SLeZ/PP67dpDnoTvYtTBwpN8esd4Rf/fostzreXij7Mha?=
 =?iso-8859-1?Q?Ih/IlhHa69yGjpquykSaV+y2BSPUD3ZKH//iILTrBnO7cIP9V6vngMf+bJ?=
 =?iso-8859-1?Q?w1Y8XbZsXZDf1rVpmXQ8KJgJql92v4BErsfDezs8oYIkHpKxDqYiip4TDL?=
 =?iso-8859-1?Q?bpp2hvvLl5yed7AH3vL1vMQoQXhY72Hipcf0fqdbp8h9URrl920ac9tc0c?=
 =?iso-8859-1?Q?uEHeXdAQrdq8Dg3lmgvf9don+3f1WxEQt1GmFoFDh95CDpi2Uqq4URLuSS?=
 =?iso-8859-1?Q?zsCenfAWmOwxssyjzHgZZHAHbhOXd5MNPH0BMTYAxDSnEUk4XmXwzhArUh?=
 =?iso-8859-1?Q?5UjMtEWNYvoGny9LSxjba3r0BJSYLNUZ5Gt8VhwAWkAAzeR+oQEgNvbLpm?=
 =?iso-8859-1?Q?+TUB8v83FMX69ubVFMp2ClY4bx0zxjqRqXigAyiilL5a5rpI3RAqz6Rv3h?=
 =?iso-8859-1?Q?fNUT8Lq9Bj7T05ByQlj3qtHnuzJA8x6r2ng0XqQAAYX55MiCu2JZesYPDC?=
 =?iso-8859-1?Q?J5EyskGE2IqTo2wx8bGv5d7/iI3KQUq9Q40kiTLjwBDIJH7ujwGUjyg2bC?=
 =?iso-8859-1?Q?lO8Ctub1giT0qadUyYmnCOs4F5tXwa7U68VsH+GndzPEq648wZtAVnZg7H?=
 =?iso-8859-1?Q?fauvhot0sIhEq5nDzd4e9clr6JTXSRTz9G3TAh7J9mOH+98uh4CRMzxFjn?=
 =?iso-8859-1?Q?V6EieucLzax0/GjQbMxNXH8zMErNrib0eYJQQ0Xj2k6wY7WTqcoGrCY43L?=
 =?iso-8859-1?Q?AP/+24kCPEjiDXExQL9WL1bdLeOFhH/a+g136siKp2lvAOT3bW8Zn3f1Lr?=
 =?iso-8859-1?Q?JfngAF2+ou9wVL4uIQfa4DpnDfPPGqFpaH85c4Odg6J6BlUL32rkxqJhtn?=
 =?iso-8859-1?Q?kEK0pOtbJt3/7ZdQabVA/tj0G+XBphP9OJgst5a2fNbWCe1yT/xYHwvLrw?=
 =?iso-8859-1?Q?1g3+pOBhl3Zu4cnJQNjQJZkbKP7hzuXcg8dSMvd6i5JUuLcm6DsESt4M8E?=
 =?iso-8859-1?Q?HWiC+FPbnS1WsYoqFT7Gc86RjwcX98cPw8WG/AFdJ8kRB+hSg9lcvix3ui?=
 =?iso-8859-1?Q?pRdfREHpbTq0ta/uDKIRHuPrZHU/u+zhkEnrvqSMMNCeM2JIfgvxH7DS3N?=
 =?iso-8859-1?Q?9dYjHiJL6JOxQkjl/v6VTHo0CuoKjPi6QQg5Jhv2AzkdtB6CC0nWcQoC03?=
 =?iso-8859-1?Q?wGrxu2AN0ydg4Ef6rtFGsh6HKU1UyqYT3HevsY0+9810NHUMv0hs9WTnf3?=
 =?iso-8859-1?Q?5aUvV7DvVJ1Dpj2Tc9wt5nQM+dTtORw6EYUva/LXic0wc3AQFH1QC7VDPr?=
 =?iso-8859-1?Q?cOMZN+sPUFCk91GXTORKPY2OTHRNATO44t8QhWxQgH0eY0b9/JftxzKeZ/?=
 =?iso-8859-1?Q?zGBDUPn9VJTGBriQshFpt7TFTDbONt9lDrOO8vBGhYl6j8uGbUB5L3kA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	io5JtWULb/8jwWs3kj+pJH1Z5cLewK3Zcs/boAP08eFPAL4VxIikByhftzmWPObWzSidhk8/yydG8IzaIMyFkqFpftzBcLHhSunNEmjgNfA5mcZRFAz532VoIk1FxXK6I4Ubk0K5V6PLWhZUXOtXkzEcLrLOwO+lsG4PzWdeT0h6db7caooSmz7D+LmDgyg4lE5uL44A1/Sh85AKLz4QPJTdxcGyMRPYYkjxvIFQdd0eOaA9OhTuJkumgSB4A1yfyy2m9CluCo2A6ClxUlvmcg6LRc58nApEGftuIcLZD+/jJjN9tMX8uJ7SbUz8Z9IjelWLbxL38iuofJE7lDP6hGyHtvkwXjy8Sq2Gjwkm4/1rZO9zdyQX/Pq4GO4NlofCKgcFyYPoYx+i+iPtYrIKe5x/dsM0j4fSQCQefzy7UGlQFCyOhTGVQVEIUvu06S5mqDrXvMX2YSE3s9Kzf2nvJUeS38hMms6l7RctYfaTKe1B8P6DUx0AFhKdltgYOZvZtn5DjChB7BNNaD4nqShBYbu/lh04Ko/4aAbf0L7mtSDrSu+4MkA8fSeSf1CQApIhkZu/I+9tHwcwRgH1waJ10prcXug6MKUbftkbgU8rHBc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33767105-c7a2-4c0e-df5e-08dcc89b1e0d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 02:26:13.0610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcputU4m/6CCaLZDXYhk9gD0279onLN5BamP7MaUI53sgS3BXV5wPSMFaEd7Rgrn9WatUaDNqG0aLpXLXbMSjeu5feBmnxb1BH2GsLcVo+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8059
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408300016
X-Proofpoint-GUID: 9PjcQadAZNiRz32bdCi6T2aj5GL6z-kH
X-Proofpoint-ORIG-GUID: 9PjcQadAZNiRz32bdCi6T2aj5GL6z-kH

On Thu, Aug 29, 2024 at 08:54:46PM -0400, Eugene Loh via DTrace-devel wrote:
> On 8/28/24 17:16, Kris Van Hees wrote:
> 
> > On Wed, Aug 28, 2024 at 04:57:43PM -0400, Eugene Loh wrote:
> > > On 8/26/24 12:20, Kris Van Hees wrote:
> > > > On Mon, Aug 26, 2024 at 11:42:25AM -0400, Eugene Loh wrote:
> > > > > On 8/26/24 10:30, Kris Van Hees wrote:
> > > > > > This patch goes against the intent of the code, as far as I can see.  The
> > > > > > point of performing the size check prior to increasing the buffer size was
> > > > > > to enforce the limit on the size that was explicit set by the user.  Then,
> > > > > > if that size was sufficient, then DTrace is at liberty to increase that
> > > > > > size to a whole multiple of the page size.
> > > > > > 
> > > > > > But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
> > > > > > not enough to store a single trace record, DTrace should report an error
> > > > > > rather than increasing my bufsize setting on its own.
> > > > > The point is that DTrace *does* increase my bufsize setting on its own.  Why
> > > > > should DTrace complain about my setting when it's going to ignore my setting
> > > > > anyhow?  What value does the pre-existing behavior offer to DTrace users?
> > > > > Are you saying that DTrace should not resize?  That it should honor the
> > > > > user's bufsize?  No more resizing (to page size or whatever it wants)?
> > > > The main point of this code was to retain the bevhaviour that DTrace provided,
> > > As far as adhering to legacy behavior... quite simply, we do not. We do not
> > > set the "principal buffer size" to bufsize.  Further, any legacy resizing
> > > behavior is, if I understand correctly, to go smaller than the user
> > > requested;  we do the opposite.  Looking to the legacy behavior for
> > > precedent is pointless.  The situation is that we are unlike legacy behavior
> > > in fundamental respects, opposite in another respect (automatic resizing),
> > > but consistent in some impractical and useless respect.  That consistency
> > > strikes me as small consolation.
> > You can look at this from different angles, yes.
> > 
> > > There is no documentation to change;  the documentation is already wrong.
> > > This patch was intended as a step to making the behavior something that was
> > > describable.  Clearly, trying to hold on to a legacy buffering model has
> > > produced a byzantine situation in the current port, which treats buffering
> > > very differently.
> > Yes, but if you want to go that route we ought to go all the way, and not some
> > interim solution (see below).
> > 
> > > Perhaps we simply disagree on those points, and this patch is DOA. But the
> > > patch points out other problems as well.  E.g., the min computation wasn't
> > > even right and error checking was wrong.
> > Let's do this as two patches:
> >   - one that ensures that the computation is updated to the current
> >     implementation changes and is correct
> >   - one that provides for increasing the bufsize to be the smallest multiple of
> >     pagesize to fit the largest trace record needed for the tracing session
> > 
> > I don't think that checking the rounded up bufsize against the minimum size
> > makes any sense if you are going to increase the specified bufsize anyway.
> > Might as well increase it to fit the minimum size altogether.
> 
> I'd like to understand this proposal.  Are you saying:
> 
> *)  Determine the min size (correctly).

Correct.

> *)  Round that up per perf_event requirements (2^n + 1 pages).

No, round up to nearest 2^n.  The extra page is allocated automatically by
dt_peb_open().

> *)  Ignore the user's bufsize setting.

Well, no.  The bufsize setting is not ignored.  We just change the semantics
a little (in view of the new implementation) to be a mechanism to allow the
user to tune the buffer size, but within certain limitations.

> I'm fine with that (given that we do buffering so unlike the legacy
> implementation and will not be honoring the user's bufsize value anyhow),
> but I just wanted to be explicit about ignoring the user's bufsize.

We do not ignore the bufsize as such.  But the extent to which the bugsize
can be tuned is limited by the implementation.  The bufsizw setting cannot be
less than the minimum requirement (and you prefer to not complain about that
and instead just increase the buffer size).  And its value must be a 2^n
multiple of the page size, so it will be rounded up to the nearest acceptable
value.  But that is therefore still controlled by the user's bufsize setting.

> > > > which is that if a user explicitly requests a bufsize that is less than the
> > > > minimum required for the given trace programs, an error is reported.  That is
> > > > a mater of being consistent (even if it has no practical application that I
> > > > can see).  Tests from the existing version failed because this was not being
> > > > done right.
> > > > 
> > > > As far as functionality, as long as the bufsize is large enough to hold the
> > > > largest trace record, DTrace can (and needs to) ensure that the buffer size
> > > > is a whole multiple of the page size because that is required by the perf
> > > > ring buffer imlementation.
> > > > 
> > > > So, DTrace only increases the buffer size to the required multiple of page size
> > > > if the user supplied bufsize is at least large enough to hold the largest trace
> > > > record (or if no bufsize was explicitly specified).
> > > > 
> > > > We could opt to change the behaviour of the bufsize opton to always round up to
> > > > a whole multiple of page size, but that is a deviation from the original
> > > > implementation and thus is something that would need to be documented, etc...
> > > > 
> > > > Aside from the computation of the minimum required size needing updating when
> > > > patches (e.g. the USDT changes) modify the layout and size of the trace records,
> > > > I do not think that the existing code is wrong.
> > > > 
> > > > I am certainly open to a feature change to make bufsize always be rounded up as
> > > > needed, but that is not a bug fix and I think that ought to be its own patch
> > > > (along with documentation changes etc).  And it might need some more discussion
> > > > because it brings up the question why we wouldn't just simply always increase
> > > > bufsize to be the smallest multiple of the page size to accomodate the largest
> > > > trace record.
> > > > 
> > > > > > On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
> > > > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > > > 
> > > > > > > The function had a few issues, mainly with its comments,
> > > > > > > ranging from typos to incorrect descriptions of behavior.
> > > > > > > 
> > > > > > > The function has only one caller.  The enforcement of a
> > > > > > > size minimum was problematic in a number of respects:
> > > > > > > - it was missing 4 bytes
> > > > > > > - it was enforcing the minimum before the size was
> > > > > > >        increased by the caller
> > > > > > > - it was checking dt_pebs_init()==-1,
> > > > > > >        missing errors with other negative return values
> > > > > > > 
> > > > > > > So change the function to accept a minimum and change its
> > > > > > > return values.
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
