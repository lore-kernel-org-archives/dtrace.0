Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936621DEFEB
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742237462; cv=fail; b=h54LVJ2zba4MSxzddNIf2Zvq5HsINdelgKYcj6OYVz3ehfkvPxcSpzV5ZUr/BNr9R+/TzHwsT+bXVgblwBEFuV5lQATL3OwbDLrvui/xg5MuA3A2i0qBNf/ZTSPO6+sh0NTYD5d5qif2WZSSwhmnUjha/KhaBLK8BE+isunV1Vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742237462; c=relaxed/simple;
	bh=3B8F4W5qlEOQHKP53Xu4bAPKLIAXAc8b+bw9Iaq50qc=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=i+nSTVCPuVhOjXeBL39sQRIInWEvK4EpGY3HTnXQTIy/gaenNrGNOUoNvv+lXxUA+/ubWtqFLH2AEOBH7+adzK1/6CFK9VTrbFYHbjIdSJfzXBesu56dknWUJfDpinSNOGF/yamA/w7NBybgTeT/pmvfn+NHo/ACjc1on7ymEGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dCML00w2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JB/BaPTN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dCML00w2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JB/BaPTN"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HIMpxm005282
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 18:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=Uac5HjgaJ0XObuAdMU3p3thBR8IzvNrFp72myL8bb5o=; b=
	dCML00w2gkwEO6NG6BMPKyqZctF70cgGmwY4cKlgHiBo108Zab0mLkzpfSI/xO78
	eRL6nV6KzzhKfEFkcxJyJ9dOV7GWDXyUWEa7NkQimr77UU/aoEtKsbKfE9vp0efj
	pT1WGzByCHGHJeOgZg0rKY1+kmAsu5Nm60sXjKUCA7L8I7uCPs2KlIHjxdoNMYRp
	EtS51CEDmF0sDGhZsTPh234/nxlE6zkzqs3cu9rUjXrhrOzUV38QEocmd5Pv2sw8
	KYFe966osyayYrPAgmRlZCZCOZivoHYH+N14VByY+MTtZDBQ/EVrsDDuVcIaUnYw
	RfEs2KQSmzBb9U8dJnfApQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1hfupp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 18:50:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52HHIZIq027987
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 18:50:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxdcbnjv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 17 Mar 2025 18:50:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zB+eYP68I9lZwiTZCzsqYKRwS7S6PL8xvK3bGye67B684hKX/mHs0rWsprUMBUoA++I8Ri7MK21GXA81YQ6UosNtqxL3acIkVtElMfNf35oRVc14LOXcDZGmG2/fKiMHOf126auXk0DW01zE1r2HwtJppKbfMJm7IkcZGEi9Y37gl3aj2ywShxWLHPRKvSLANrOQha8Rb5oYX8emhhQLL+4//5yxDvZBLtifYTr/yXnke7ITA2euhomSySFiwt2+XkH8+bD6KOlD+Cfuk/yz2B+Rao8Q1hxS5/4bL32n7s0sbnh1iWwjufOjcQUplGmcW4gvj0JYWkc6THzOuIiSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uac5HjgaJ0XObuAdMU3p3thBR8IzvNrFp72myL8bb5o=;
 b=PdG1oKzsPiFEPdHtdh9nABLKN67/IfjAdJA6OID4SmnbZ5+A2MUFhe8u3glWkmOxdaYVH+6INKFY8H5IOn/v5jQefcmNu4SYftzovrlCH5Z70ZYWw8n/v8SpB8pV+WbPirjqCu60fi40FFLI6+xw3dWNhtthNFcUQ6RetZD/9+6UvV+MAh5hmrsY6QYb1p2V8zbMS12yl6eR6wT0t7SdJUnlyxOB/ffFWM58rcCUAq9fU9H/k9hzjs0is4bfJPONiGJmJngtxWBmIs7gXLNXJXMzpX6osoj/wihZvF9gOf9s/IVznQfLgmMln1URfRHcs97ljs0sazuqZVuy6oEz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uac5HjgaJ0XObuAdMU3p3thBR8IzvNrFp72myL8bb5o=;
 b=JB/BaPTNGwx/IIXVTyyHhFW/lX0Hdg5S8r0+uqxg+chzSpSmdWACSiHR6wXzn43qSNJmss7oNtUe+Ztdr1MwXAi+O8O/FeQ7iUGc0K+hXzSChUrFsTw7+tjH+u9HluWw/OgYxos9ovVDLb6UR/OQxE77DImvfZzhiV/FNjQF0ws=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by PH0PR10MB5706.namprd10.prod.outlook.com (2603:10b6:510:148::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 18:50:56 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 18:50:56 +0000
Message-ID: <e05e25319eb103bba488fab000c3c21b.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Mon, 24 Feb 2025 13:43:52 -0500
Subject: [PATCH 1/2] error: report probe name on failed enabling error
Content-Type: text/plain
X-ClientProxiedBy: BLAP220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::21) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|PH0PR10MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 7788cc6f-b3ad-4f32-3af3-08dd6584a6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D00ADeVl4aTzRkci0Qi+EoZygjrwyJGExgyVLVBDTr8hRU6IE3uLA6AbdRoX?=
 =?us-ascii?Q?tU8SuuC9W88M4cWj6+szvjhm1q6xoPwWTAhEPj2PdAzs7D2vdEQ+vkF3axHG?=
 =?us-ascii?Q?9gp1dD/hLdqWDY8N9VaD4+FhrRI7ZD5Cqi1RBEm9DmlYQpjOkKeWq+vokoMO?=
 =?us-ascii?Q?MXPVZMzq9oBZ18cOU8BEPZgY0fBSuOr3HtMibh04Qv2dgzUnTL+hU94QvgRH?=
 =?us-ascii?Q?JGttgwKdSy9cjghIRGLMvTw9dX3d7/6G0lrZ8e+P1qYYcU7LG71250WBpcvD?=
 =?us-ascii?Q?CicueaqO6lHuHFhgFsyAmgHc36aJ0tez9URZ6oedj1t8H01+TMEqYbhD/mlL?=
 =?us-ascii?Q?WNvqRMrlQTpR/s432y/N+ReqXdiposjyUUlwjZiCPVqcLHBm00Ga6nNtDtnG?=
 =?us-ascii?Q?w3KSZb6PwQXJCUh3Zrt3MyrmuoxG3YIFxcqWw7Y2bfEzwJkP/Gq86ESXUH+k?=
 =?us-ascii?Q?uL5zCqOvNrZnYBDOJimIJwIpD2JQAyg5PdygM20joerViD580ayIyIlW9Hos?=
 =?us-ascii?Q?hZcKLTIcREMAdds73O/BrlZZUO1Ceq8AqT2K/tBXoQhK0BJK4RdeBRF6o7Ys?=
 =?us-ascii?Q?hJHpYFuD9YRRgbPwatFqUBcckWkE/FFqCMJ7cw62agqGpr8VWp5SLxGcWz56?=
 =?us-ascii?Q?QACtp3wK3GsI4T31b69kYJ4XvYql3tpK5/B9ZOU6eALmJ2vJbv+cm6qZGC0i?=
 =?us-ascii?Q?mKAfnQkwkqMzvxINaujZORQoW3OV1lQ5D/4XL7QlzjyGeVmRSH/VDKe1tHaP?=
 =?us-ascii?Q?Phy37zB7mDy6lhN1NyNO6g6el/IRwNMj1MqLETCmRypk/Csq1PfTRr/IMVaQ?=
 =?us-ascii?Q?uwBI9P/j+t+mUjrMNWFXwcRdIdTOTlYTC0g0SF/wddEhfGzaeO2LTCOGimYl?=
 =?us-ascii?Q?loRDpSfpmtJaV2LoFtsDgkDoJGaMBLJgzE1svwWw4NccSqbUWetW6sx44m9j?=
 =?us-ascii?Q?4g6PBoY/XLSVvDF4f4OafHHIixOYva2RrukuFdntzF5djpX7vB709jeiG+OH?=
 =?us-ascii?Q?n7tBvDbFBUM9DhIXgocdVuepFRml2Ui/cw9DadUvBUJYGUrrLvzkqltom3fu?=
 =?us-ascii?Q?Se1zgSEptCCuaCCiIKUAREt89JcdhVEl4DF+TVRq07iNOfv52D/GlWOfYvTi?=
 =?us-ascii?Q?G6FMJSYrFCvl73uR7/5cajyvlE6OeloO67P5afF1zjNMYolxJiRcC+ECek3U?=
 =?us-ascii?Q?tDH6hqgz1EyWSyzAeu6CUGjTFQJIfeCe061pLlCFoZRFniTGpEcSxsU2F6e7?=
 =?us-ascii?Q?qBampZpYHovQ2BuekgyKW4/KqIudiXziMN5VfEB3eCqV6538AAYnEljAL3q9?=
 =?us-ascii?Q?/HsKBaD4QQ8SaqbURON+wvse8GE7Bp7/drI43FcLRdS81c/wVRF2bEoDZnRP?=
 =?us-ascii?Q?/hQZ1yJG/FZYuyfKXd6ocDn2Ceqz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wHP3IA9ENUlJuWX04T+x+ozx9wQl2k2a4a1klj+n3lMbB9Oy6W0+pfcX2x68?=
 =?us-ascii?Q?NwygNTMJnR49ARCcmlFo5hFCyReA8I97aaxiU0OidDZee3bsPyUehYp7lsCP?=
 =?us-ascii?Q?l+a5O3SqFtBvl8ysAtJg3fagVQc/R8JN47kdZE/VGEElq0WekDABb8FcS7AB?=
 =?us-ascii?Q?Ylbq0n3ZXmUZ1krzUjHaOJv8krTdhKcEbRIOzE0v9z05r/vGix6KqYWZAICP?=
 =?us-ascii?Q?C4yvrHwb37N8xgCGwpG7g02p6TfUVqlP8L6FJa1teDrC53OH+KKf1BXGH6p2?=
 =?us-ascii?Q?ZYrq2LQJWqciTikveL8yEK7a8ffrVU9KPNEabAZXjANMIA7n1nI/TNFGtZ4G?=
 =?us-ascii?Q?EVa6c9MIaP/xl/xRoFUNrgy1XrbYdYf/kUajQAfiwA4rThSw9kJOpjiekGge?=
 =?us-ascii?Q?oVDJaOEfw0ap//q4yBt65hvJytjNeVMctWLvF/HCxBpJRv4brbbvMIwOv2LH?=
 =?us-ascii?Q?yPZ9xXUVqv3q/EJXlBEgTMD3WmBaWCHfDaq5nyvMdoVbwdMuTpjZElvJmUcT?=
 =?us-ascii?Q?gUiE1IcJae6d9waKLnyewmuwPPT3+zWwDAKlysNbiKfVvXHsC/irgELM9FLF?=
 =?us-ascii?Q?HUKsKwT2v9+Lle/sIr53u3A9dPGu5/wsrPwv1L2q+P3SynY3cPOg5/P4EasB?=
 =?us-ascii?Q?LvKOlg2Bcs2NMZr28RYbDDCwrs1F7biYBx9hy34Dy/RAYYPVqFkDcJ2PKjl6?=
 =?us-ascii?Q?NvJqbCZOATwY2kEKGkKKkMSQm0QKiEKKQAyffoQHuAWqQcD8mSwdN8cgcDus?=
 =?us-ascii?Q?0rZgsyJVJu2sjqKcpuFuh+Q2Oul5tGHvOE1kV+9wdOmlTUGxTpf8we5sXsRE?=
 =?us-ascii?Q?0Rr/jcWf4OMl6b8CvnPMYCwkMVGXweOfJZlcXjj7NMFooI5Ah7usawFLSk1P?=
 =?us-ascii?Q?GTKZBmDc8uTKdYFuLsGtfUEOzpLGqZzK/AtcP9LES6hTShLBAiT3tZE8sNlv?=
 =?us-ascii?Q?FVuGjtMXAj6/d7Fi2EOSxP/6OxT1YgzXXlwfTehppGv1DcUHQrAhtrL/eq3W?=
 =?us-ascii?Q?/4DSYYI9gm3XFQ9Z94q3/lx6Mw4mKIiK/Ij8+GxFNiqABYhelL903dOeoO09?=
 =?us-ascii?Q?Dfe3hC1UXIWWsjFj+3pOZ/kCUV9iuz0WliRCUQygPGN2Ng8X9LISfoTr/d8v?=
 =?us-ascii?Q?7a6tUvRqPPWs7tmBRrtJ2XVGgYtEbNhbInF+LrWgjawQUYisObZK0JokKEhJ?=
 =?us-ascii?Q?tdLYLJd9Q/c4zmYJtmDLkcjmX1ahIiagU1zn+0oTg2MdiTRvdAC5BYoK/EP9?=
 =?us-ascii?Q?Ecq2voXJZHRd8FZjT5IPittHUJr4R1w7aTInqXKPBSCQeUV5P+X9zbA6n/vb?=
 =?us-ascii?Q?mrvmyS472D0nE/wSAHVWdthRi/YVRHEDN3PVw+GTdbkBScOiZh0KigV1oZZV?=
 =?us-ascii?Q?0WV2O7Puy7YXdaKjLiy/gy2XI6+X8DGdFy0Ym0wDDrjlEfzpAGnL5R+6DFBO?=
 =?us-ascii?Q?gUfsNnYCdDLZ3w2aKHs0fg70RKoFlfQJrR40BzMPsmq/Xw8L/KJWTSP1ljzT?=
 =?us-ascii?Q?tkqP9jFwhnIZsSVVkOuXAKak6NjoPSf+N6GBUNJ6YlmM/CeVjKEb1KfPuAK1?=
 =?us-ascii?Q?lJPHrbe1CYE9VpUMypGzNQt1eIAkQv6mN+PICEeWjCovRMCetQu1y5Vnjpcv?=
 =?us-ascii?Q?upF0v/ZrrjXa1njsFxpht0g=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J4Cfe0n1wQQ8OPPZXmsff1IzqyICy1iz4yu3VQlp5fG3JoLO8MR4+dae/OxuMUmoXmivndKLLeDzs+7FUNO28EKVpcwm/iqMdz2jROYu1DYOekBwW3lLZbb9LUV0a4jt9p+nzBPpbLaQZplRy85vdrOkVNn998cAt9rlBncMXE8GyKPr21Z3cj3Y9NT6lCx86wLPTvmayXwHBMwgaFlbQxMB4su7IDrncpi3uJhvNauxmH3t0zgCTyj/R3nba9dowlojmJWPar1Ovi8Q9kKQAsCT3legsofib3iF0bpgyKJ1dgLgzNa3o3jR6aih8LTc7ikpUIyNmCVYzxA+AgkjQdcJgLieOKBid9pJr8fvSiFiljVTMSgEwd14aL9MxZ2GoFuhFxfl//52pTbGbjqjV7FjO7U8gegRTMyCjh2431giJimmmHIlq1RWnyG+XuLZ6EdSWyKlB6Qh9HoFCA97uud4ihj2+ghR+vGIrVL6OTl7u5OpR2qEMT40jHsk0q1Z3Jrk7TgUGhVreUvA/uAybY9UlSGYjEebf7oFuKzMHNdlcPC36FIpyiZWeqdx5kXuP1k8Qo8ch1Lir8W3bLW5NZ2YOi09VAN8+Ks7PAZvzqs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7788cc6f-b3ad-4f32-3af3-08dd6584a6ad
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 18:50:56.4116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1p3BWqmyoZVdMaBKloOmbN51pL5xmgzWZP3fysVDIrKcMi2kzOeX7AzaDWSxjgQzUb0GffGDaCdUI5dGyImxwQ9vAirCkYbwRcYDPZFbLo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5706
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503170136
X-Proofpoint-GUID: pZAMI-qQ2SmH8IWLtppqQwIwjD1TWd4w
X-Proofpoint-ORIG-GUID: pZAMI-qQ2SmH8IWLtppqQwIwjD1TWd4w

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c         | 35 +++++++++++++++++++++++------------
 libdtrace/dt_bpf.h         |  2 ++
 libdtrace/dt_error.c       |  2 ++
 libdtrace/dt_prov_uprobe.c | 15 +++------------
 4 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 662fd81a..e50bb536 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -64,6 +64,25 @@ dt_bpf_error(dtrace_hdl_t *dtp, const char *fmt, ...)
 	return dt_set_errno(dtp, EDT_BPF);
 }
 
+int
+dt_attach_error(dtrace_hdl_t *dtp, int rc, ...)
+{
+	va_list	ap, apc;
+	char	*fmt;
+
+	if (asprintf(&fmt, "Failed to enable %%s:%%s:%%s:%%s: %s",
+		     dtrace_errmsg(dtp, -rc)) > 0) {
+		va_start(ap, rc);
+		va_copy(apc, ap);
+		dt_set_errmsg(dtp, NULL, NULL, NULL, 0, fmt, ap);
+		va_end(ap);
+		dt_debug_printf("bpf", "Failed to enable %s:%s:%s:%s", apc);
+		va_end(apc);
+	}
+
+	return dt_set_errno(dtp, EDT_ENABLING_ERR);
+}
+
 int
 dt_bpf_lockmem_error(dtrace_hdl_t *dtp, const char *msg)
 {
@@ -1335,19 +1354,11 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 		if (prp->prov->impl->attach)
 			rc = prp->prov->impl->attach(dtp, prp, fd);
 
-		if (rc == -ENOTSUPP) {
-			char	*s;
-
-			close(fd);
-			if (asprintf(&s, "Failed to enable %s:%s:%s:%s",
-				     prp->desc->prv, prp->desc->mod,
-				     prp->desc->fun, prp->desc->prb) == -1)
-				return dt_set_errno(dtp, EDT_ENABLING_ERR);
-			dt_handle_rawerr(dtp, s);
-			free(s);
-		} else if (rc < 0) {
+		if (rc < 0) {
 			close(fd);
-			return dt_set_errno(dtp, EDT_ENABLING_ERR);
+			return dt_attach_error(dtp, rc,
+					       prp->desc->prv, prp->desc->mod,
+					       prp->desc->fun, prp->desc->prb);
 		}
 	}
 
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 85934d2d..464f0189 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -67,6 +67,8 @@ extern int dt_perf_event_open(struct perf_event_attr *attr, pid_t pid, int cpu,
 			      int group_fd, unsigned long flags);
 extern int dt_bpf(enum bpf_cmd cmd, union bpf_attr *attr);
 
+extern int dt_attach_error(struct dtrace_hdl *, int, ...);
+
 extern int dt_bpf_gmap_create(struct dtrace_hdl *);
 extern int dt_bpf_lockmem_error(struct dtrace_hdl *dtp, const char *msg);
 
diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
index 213f0d9e..6721e8e4 100644
--- a/libdtrace/dt_error.c
+++ b/libdtrace/dt_error.c
@@ -111,6 +111,8 @@ dtrace_errmsg(dtrace_hdl_t *dtp, int error)
 
 	if (error == EDT_COMPILER && dtp != NULL && dtp->dt_errmsg[0] != '\0')
 		str = dtp->dt_errmsg;
+	if (error == EDT_ENABLING_ERR && dtp != NULL && dtp->dt_errmsg[0] != '\0')
+		str = dtp->dt_errmsg;
 	else if (error == EDT_BPF && dtp != NULL && dtp->dt_errmsg[0] != '\0')
 		str = dtp->dt_errmsg;
 	else if (error == EDT_CTF && dtp != NULL && dtp->dt_ctferr != 0)
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 17f2f7ee..96a59aef 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -385,19 +385,10 @@ static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	if (prp->prov->impl->attach)
 		rc = prp->prov->impl->attach(dtp, prp, fd);
 
-	if (rc == -ENOTSUPP) {
-		char    *s;
-
-		close(fd);
-		if (asprintf(&s, "Failed to enable %s:%s:%s:%s",
-			      prp->desc->prv, prp->desc->mod,
-			      prp->desc->fun, prp->desc->prb) == -1)
-			return dt_set_errno(dtp, EDT_ENABLING_ERR);
-		dt_handle_rawerr(dtp, s);
-		free(s);
-	} else if (rc < 0) {
+	if (rc < 0) {
 		close(fd);
-		return dt_set_errno(dtp, EDT_ENABLING_ERR);
+		return dt_attach_error(dtp, rc, prp->desc->prv, prp->desc->mod,
+						prp->desc->fun, prp->desc->prb);
 	}
 
 	return 0;
-- 
2.43.5

