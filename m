Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBD778C9D
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721337920; cv=fail; b=tlbvIOGXhi6OjKv6bXNhck4wqTgXlblNBJhTksxbgna0+hwE50EwJ+OVoOrISrIHX+NMxJ4vDO6arYdoRTgyLQ+ZbtphNhADAYZ8mSzhkiVtUGK8YUfJii4DgYWJ+gNA2r+BQxEwzEcTdKvp38nO5INEYHPl0STo6Hpd6jv1CZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721337920; c=relaxed/simple;
	bh=sffOS/qwNAAYyGxO7O07ljk2eSh36IykhYYGngSFzlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n8SNK+uAK8PhQH6Iali+M/UIBIwWpbSm7EdGSXUMNiZhwn7cP4NyOzxAljJjxH1qbXrsh6LRn4cGhU3ha0dtj0zAyTidSjlsbrnH+HiCl9L2mCqdHNMPj7kwRjUUE/jk35wM7QkiM0l7yMQnYjGs55wX49GkRfVVyUrllI2YS08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ai0LlCQ/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fAlq5ra7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ai0LlCQ/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fAlq5ra7"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IL4JML027658
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=FMtxtK5Gm7/Ttyd
	rck4wXQ+tLJUH2Wvvl06KhnLDwfE=; b=Ai0LlCQ/jhWR+NMf9JA3BI3V5Ywy8x4
	lY2X7YNAVITUiiCuEt3y+kzYWuywlZK/Co6s2gVh1udwSQGjWfkcjOnoFXvuqCTx
	xYTp2TU9ksOZjdfqNNFep9U7MIxy2SEdTnfyznkfBaj1xU7AulGgvezBeIHEy16/
	yXzDMzxGHmCXM/9tI5OzigyJMzuFuOMyHZdRywVRF8HPEIPLwtWzdQpJYV7iWXF6
	HC3Tshg2XQFuL0uQoE/9pJQL30JJmXpaCeVmjX25zbjGS5+xXVOR9GxVnibKw83n
	2QJOQWsoWrdx6sxbdbQH4+ko1mQMd/yTIR5dRYffYvhgEzm/a9UPy9g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40faa682yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:25:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IKSKj6003756
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:25:15 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0yrmm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 21:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxK1zaT1/UegecqDBWpL8I+dJr+0IIL0byKdbzVVkgFZE5Z8O/90EuPLGjE3bfIV+OOoUKGhQC54+4q1gfo1udVgRvcEPM3ebROnidWxv8Ym/wUgGXASWoexhKRmQ0pQ/rhVUOcZgJY9HmoPR61QGd/LUWl/KA59AldHPSGSNbdiwUaHooto1X4aKjW5wHYzbH3fiQ/EIJBmpHyE8I958fwxKN0dm8TTfcc7qc7SuIlIfNhwDpdk3ml7VJLm1QDipfiYY+QD9W20X4TvqbbAi6B+ToAQwEgFhmwbXwp54c36QDJOT0Vu+7tDtUuai2jyifD7kE0rhThB+LUqAn/AnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMtxtK5Gm7/Ttydrck4wXQ+tLJUH2Wvvl06KhnLDwfE=;
 b=upHsaPBXR8NOErGjaZpBViC6a7EtPiHLY/IkAWbQgQQAh91jrBpDCOPiOno0IcmKTAEp3h5GkVM3nNrOfWK7+DgVD4RElybL8JGH6N4RD4k1v0DxEs11vqjOEuDtbyE5unslaZOUU4S78lJO/uC9UF2nrnsgWviZrqeTbUCqoxqwpy3WYtQIzitm8w0CQ63Q2aQ7deaS04TTWATHmg0IG/9RlDEZrLhFfrdFjZRRy4bOd3NsUg8ASoFlGnfugiPzlg2YVoWbmDV94dWXbinBy5JtiyuqcmkiHTjIkn4PlcSeXeU83p/NNCAe8yuseiIjzsMEujd0+pqcTEscSFexpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMtxtK5Gm7/Ttydrck4wXQ+tLJUH2Wvvl06KhnLDwfE=;
 b=fAlq5ra7jKUqNrzOrqXl0WyaOqQKikycM7msF8NIMvqWj6M4mH4aJJpNfeg9bE43ahehbjsQ5b37ALfkC2/bkXOv0TzdCMWoUysonAE5m44waRfKgAUOYjLS9UmuldSVpvRh5mVQOseZc1wvdHOtPhnORz/IQXS3WFmDSVLs++s=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB4645.namprd10.prod.outlook.com (2603:10b6:510:31::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.35; Thu, 18 Jul
 2024 21:25:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 21:25:13 +0000
Date: Thu, 18 Jul 2024 17:25:10 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 19/38] Retain probe descriptions
Message-ID: <ZpmINm9hojBpvWhP@oracle.com>
References: <20240627053810.21928-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053810.21928-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0264.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: 26db5a2b-d3e0-41d3-9a51-08dca7701c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/YHmC3a7ysMlg72okhehUedOzTmm/TP1cb+BlufJk9w4OeNbiADljz/TzyLx?=
 =?us-ascii?Q?pqOwLfwaQA/K2HZ/kaiDblDasIp2a8gsWsQUdvAWx7qhz4/k314zOOVJ/Wac?=
 =?us-ascii?Q?JCO13+ITAj++S14LVAdCXaTxx7iuVs7yZ5D8MxepIPBLW13xgpVfwPW9BY3U?=
 =?us-ascii?Q?i8tygn+C88lJ/rffPRIIC2LCzgLY2nNQg00S9Pb3Vv3mYCX2J6LDxY0gOGd7?=
 =?us-ascii?Q?7jIuS6U0GpdyNKg/WOfXO2mNwtC6TBck9XLS+AWhKDfsM/DJfLYwFVj62d3t?=
 =?us-ascii?Q?4zrCeuSHbbpyjn35Vtk4RrAg4d6yho/3+aJq9PU1Je8CWMfE28VMZNBtE/DJ?=
 =?us-ascii?Q?z6ogZlqXJ2vG8GADroKPjrDaP1eM6PgBk/LkfyGyrEW9vrO7OmFZP+zAUUaA?=
 =?us-ascii?Q?DenFr0RIHnoqYTsy17QFVnoJfq/H4k3GGgrnhoo9PJCJys1BS14nW8D28R8p?=
 =?us-ascii?Q?vl+E5BAHKACA2aDjwDHuPvXJqM9vUhwdYAB/n/yEw9hAMOdSnB2gf8pC0raU?=
 =?us-ascii?Q?/fvgS3MECEecaXtS34zUK+mf5/4SAvhftwQNYUx/vky6A8QGx3s8S+P5murG?=
 =?us-ascii?Q?ofiqLpyZJSCtAW+C6wYuzug55pTrR0/7bPolXLytv+sHGxFOcTSRFaaJlA8c?=
 =?us-ascii?Q?mZKDjDDYZc7S4MeN9eAs1eLxLj/A24XMilRNroWZeMfqKg651VUnT1kteqXq?=
 =?us-ascii?Q?Buik5fv4+M28E0JWOeEAaRI/Ww2+Fy9O1yuCnUq3GZluZsyNfjkspyp7xr5H?=
 =?us-ascii?Q?MEwAE67UdKJx1ooz8URYF419g243499dhk+GsBLjpCUE/sLuuUuYntHMmfRX?=
 =?us-ascii?Q?qYCGE5YPPCHlWzRNbRHH8VrcabQf9PTiL7MoNuK+SvPTkB07HydRsPHbLpkJ?=
 =?us-ascii?Q?R30M6Kgh+E7H7yiBfbbe8f7oJDBxd5HZg2TgFJ0v+rqvatb6CypjGA+9lfYX?=
 =?us-ascii?Q?Yh4z/ZImqwAUV4uyRQSgG0hcgdFB/LPiNX7lICmo4COEZNIQegu9JSTSaLgd?=
 =?us-ascii?Q?uwcmXNbDpoGfRJbJBmoNH01/HcG1OJUcKNCyLHznnrz3KdXufI7X5Q9RriUi?=
 =?us-ascii?Q?bVKcU/KPPCBdcMIaMuafFbT95d89s9bvqlEdf2a1y4akUWRnkbwVRbke6eph?=
 =?us-ascii?Q?hfg6iQ8isL8j5EqG7M55/bkMtGsKthVrwdkagQ6/STkcWRql6PzyKXXQ30/L?=
 =?us-ascii?Q?ndMBwinnd5lQwe31ntWlVIKdYJK28/VkEYdMrlJQKzEGDKEaS2RbxUhf4nEa?=
 =?us-ascii?Q?Cbg88K6pXL8ZHaTwoX2M2K8tnfVprIiulMjFZUl4juE3WsvXW6haO/Uz580S?=
 =?us-ascii?Q?olWT+vmEZnPINo484BR1lsQ5BeqXz3kP7nuEZKZWsRhWDw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LgwVB/R0znIiJYlzFJAZhq1YwZGC47wlr6009E1R9E8qCic2J4YeDdkspgu7?=
 =?us-ascii?Q?siPD1sCSi4KbtfIywL2MzmLjJVYTyw9InJBi7skjOm7xT4971YFlBH08NJsz?=
 =?us-ascii?Q?c9kWbu+ujI0WB9eRH++oFVvyA76HKK8Z8nb431eMnwrksl9/GejfXNDdM6Fg?=
 =?us-ascii?Q?F8IjFR2FJ1NdVbkJWgBS/3PVb7I9ykey3ItdgvDWjGBuYGv7mwpiNm31qDzX?=
 =?us-ascii?Q?bvvb7hPfLnPdAnRda+ribDLUehfTiJ6km83rUpfBDptEe6gUJKYk2x2VfjeC?=
 =?us-ascii?Q?T7YnoIhx8OigQgXvmK4Ah8z4K8qdsqksp50nNgqvX+OMw5m3BGlLA0UOwEHa?=
 =?us-ascii?Q?r8xfHC5fcnx6Am9mCll/RiSldh75H0Htn6n7CCM2l3jFOAeaPNlXDXCnfxKD?=
 =?us-ascii?Q?8DEH6ikr9YBjR+XYBqzEX6OukuABkVwy/BzaitnqkutOhbrDAchqY8jjGis1?=
 =?us-ascii?Q?8YN348EJ65dA76RHGhUp8ZrF28zkNvGMTJteFeTfwH9kCU48mb/lsXpfu+6i?=
 =?us-ascii?Q?O/XrMy/W0HuErHX8gjp2LgXpUkYLAViZRfACfmbBo7vCaulaEMzMq66ydRsA?=
 =?us-ascii?Q?oGYYEljimd8cTWamdhNfYbPTt1DkW/2rwvQhbMYFeGcwHuF2SgXf5JilYE/a?=
 =?us-ascii?Q?G/zQsvGw9a9TQIEAC5c94Mj5RZElUy+u5MDFiVpTxgWAjVSYMTgtlDa5cHaF?=
 =?us-ascii?Q?YVDj/2o41CsNuCmvxdER9HO/jqRYKpFPE6BjayjoEXjT3dzUY0G5Vg3YGCMg?=
 =?us-ascii?Q?cgN03DH0x0xZIcCV6K8uZ968kaeL6kxcfeuubQVxwhNx+bUc09zEc32BUcbb?=
 =?us-ascii?Q?kKv69WqA16XQo+bduu9WM0P7hWn4/x1QNgzj7qBizyCR5W2wt8p7LZ3KzY3Y?=
 =?us-ascii?Q?v7/qzBZsCW0cUfsaZty+wWASW2tABYPsij8YVjFA90NXCiPYg7XsjZxBfQQ5?=
 =?us-ascii?Q?exskFcM3HaC5auzLaQ+9By8IWEr/PDM/ClfniKz4izJ1+9mGmZECI7FBHQcd?=
 =?us-ascii?Q?g7Xa/5Z6op9Eauk8Igs0F8bvVaj8HaWrejj4R0jWUjC4PDeekLuQpvUR/3Bm?=
 =?us-ascii?Q?BCnoGba9nZ8TvyuwBgWv8C4aDK1y0z7Y8+vPrtXQMqU4FU3ZOaFypDrkeg0m?=
 =?us-ascii?Q?fxf3r10vq1pp6iiVITnwT09294a7InKmZB37kUGDo4GXFGgw6Czuo6EdpNYs?=
 =?us-ascii?Q?T9bIIoQmETxmNFmpO77zqiZI8T+QGSrXcU1n1YilqseKgpagfQz1nzrrq9iP?=
 =?us-ascii?Q?CuNcYIJun7Kqu+cEkYjgKd8yGGbzloHubBxQTXxkRQFTGhKZarAd3SPDpvBZ?=
 =?us-ascii?Q?1iAT01RGYMBmh6pI04EDkGrCy/GGeRLCW3mB95HHt1DIfiqe4Xd4Wktc3QAr?=
 =?us-ascii?Q?KQn2j/jfi9iNZuNqzTFYBM24uQ2esAwX0VmW27sQAGfvbv8GPEBzizKjF4e9?=
 =?us-ascii?Q?D1zhlHy24uaNyG5MkikvCQ7/3cIrfWXdWw2WMcvcKG/k2E1POaBafwI31ZYZ?=
 =?us-ascii?Q?Mo0vUcoPAUWUl6Huh55gbfiHIIX7Hk23xUx6XaTpas6ItIhSWmNHj6w1FGgS?=
 =?us-ascii?Q?iVHb7yawWC11TWxzLp6uM/rZWtEPdeDd+IYRytPiXZeMOoZKrBjN7daRz7Km?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	WiMOB7uzzkz8HeVurgNdH82zDY33qUarg3aYcY8xJ3mNlQO+BwbxbHwfZMD7yM5uxX02s95/FhOxXuq6NAPHavQWE8vzl/t5bRIc9qI02C6jt6inPjltG0TeAhwrrw0cXH6VGfQ1O+wrf9opgZ6/bR3QhN8Fl+QKp/rLf7nE6fgg8z5/swiEzuZrJoB4BQSTJHS7VajK3d6CIcpLM0Xp6oesGnozyC+E+1H+3mgEcOvYrW2g8gjnMEw6dJ/UnKn1WOP9biLnyz4WIyXKmecH7n01lo4WaEpwhhFHhS3y1HTQncVRc4bQ7y/u727BQmejeRZkQLVe7VyabH/Dbues+ApvyeGSRoR+16HTs+yzE02z6DD+eJtmIFrw9wcApXTJe8adOSPXmIR/f9df0c6I2RACFhi6xM+Rf6pbsKJwpVh6V6mJucFdbZgSPxdQwYq8lXqj3XWncwZGnGz6N9ZIyN2ch3AraELV9zvLdUI9F8TX31gYq2ea0KQDCaKapxc5C+6jE5pwpD8hl2LRJX/pwosTOPK3ifGmTgq7/5ECUiOQUV3ssOJFlF+AGCqFCKSM71fTy1mcSaAO/co4K5TnWpfLiJkkX+u7cp+5aCCYlz0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26db5a2b-d3e0-41d3-9a51-08dca7701c15
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 21:25:13.0260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F65Ka1aOdaINFypf2tOkBAx9fFKfmZuvvphc5BX1J6BfZ2hwYrZZqWbfwwvJDJ8DL9CKfBFYexPZbYHgsx/PJpSpsZOuPpaDf1dfCdr3Hso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4645
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180143
X-Proofpoint-GUID: AERRdokDByBdD4ZsaDhK4fmw8hmKNnIc
X-Proofpoint-ORIG-GUID: AERRdokDByBdD4ZsaDhK4fmw8hmKNnIc

I think this needs an actual description of what you are trying to do, because
retaining pdescs in and of itself does not seem meaningful.  They do not
contain a reference to the clause they were associated with when the code was
parsed and compiled) and it seems to me that you are doing a sort-of reverse
association, and are actually (indirectly) retaining clauses by keeping a
link of pdescs, one per clause.  And you identify the clause by its numeric
id as obtained from its identifier name (which is dynamically assigned during
compilation).  That seems fragile and rather non-intuitive.

If memory serves me right, the intent was to retain enablings.  Of course, in
the current implementation of DTrace, enablings are nothing more than probes
because the probes have BPF programs associated with them (unless they are
overlying probes, in which case the actual code that gets loaded is part of the
BPF program of the underlying probe (which will be in the enablings list).

When we are retaining enablings, it seems to me that it would make more sense
to keep a list of objects { pdesc, clause } where clause would be the
identifier name of the compiled clause (similar to a function name).  Using a
pointer to the actual clause instead is (I think) not going to work becauase
AFAIK the clause does not store a pointer to its own identiifier.

In the end, this will largely do the same thing as your code (here and when it
gets used later), but it removes the implied dependency on how identifier names
for clauses are generated.  That could change in the future, and doing so would
completely break this imlementation.

On Thu, Jun 27, 2024 at 01:38:10AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> To support matching probes after dtrace has started, we retain
> probe descriptions.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_impl.h    |  2 ++
>  libdtrace/dt_program.c | 37 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 2132eda2..445cd602 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -300,6 +300,8 @@ struct dtrace_hdl {
>  	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
>  	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
>  	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
> +	dtrace_probedesc_t **dt_retained; /* array of retained pdescs */
> +	int dt_maxretained;	/* number of retained pdescs allocated */
>  	struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id */
>  	id_t dt_xlatorid;	/* next dt_xlator_t id to assign */
>  	dt_ident_t *dt_externs;	/* linked list of external symbol identifiers */
> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> index a4b052fc..7106c249 100644
> --- a/libdtrace/dt_program.c
> +++ b/libdtrace/dt_program.c
> @@ -163,7 +163,42 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
>  {
>  	pi_state_t		st;
>  	dtrace_probedesc_t	*pdp = &sdp->dtsd_ecbdesc->dted_probe;
> -	int			rc;
> +	char			*sclause = sdp->dtsd_clause->di_name;
> +	int			rc, nclause;
> +
> +	/* Get the clause number from the clause name "dt_clause_"$n. */
> +	assert(strncmp(sclause, "dt_clause_", strlen("dt_clause_")) == 0);    // FIXME can probably drop this check (make sure the name starts "dt_clause_")
> +	nclause = atoi(sclause + strlen("dt_clause_"));
> +	assert(nclause < 65536);	// FIXME are we okay here with some arbitrary limit?
> +
> +	/* Grow the list of retained pdescs, if necessary. */
> +	if (nclause >= dtp->dt_maxretained) {
> +		int			newm;
> +		dtrace_probedesc_t	**newr;
> +
> +		/* Figure how big to make the array. */
> +		if (dtp->dt_maxretained > 0)
> +			newm = 2 * dtp->dt_maxretained;
> +		else
> +			newm = 8;
> +		while (newm <= nclause)
> +			newm *= 2;
> +
> +		/* Allocate the bigger array. */
> +		newr = dt_zalloc(dtp, newm * sizeof(dtrace_probedesc_t *));
> +		if (newr == NULL)
> +			return 0;
> +
> +		/* Copy data and reset the parameters. */
> +		memcpy(newr, dtp->dt_retained, dtp->dt_maxretained * sizeof(dtrace_probedesc_t *));
> +		dt_free(dtp, dtp->dt_retained);
> +		dtp->dt_retained = newr;
> +		dtp->dt_maxretained = newm;
> +	}
> +
> +	/* Add probe description to retained pdescs. */
> +	assert(dtp->dt_retained[nclause] == NULL);  // FIXME can probably drop this
> +	dtp->dt_retained[nclause] = pdp;        // FIXME I think just pointing to pdp is okay.  No need to cache my own copy.
>  
>  	st.cnt = cnt;
>  	st.idp = sdp->dtsd_clause;
> -- 
> 2.18.4
> 
