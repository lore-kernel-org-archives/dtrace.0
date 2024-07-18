Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1F21EA8F
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721336114; cv=fail; b=YakPST4QeCAYGPG2O0UXgaeboHz54HQbzOTIh/PUleFxezMsocw3erU7UV2Hy19fURKKSzoRDQL8XAlVRQHkK6AFUvIa4Yi+oCcUGjwDQ39mYkaG04a9S0sWHXE9hUj+b/9iWEDttf+Ma5tkA1TkOiroiwNYNRTV8gn++tEzryo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721336114; c=relaxed/simple;
	bh=yrmXvQ+5S4F5Zv7zaqygL15i/pKVg+8xEfw0URiQLAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TlKalhoQHgfJP/bHrsXk5cQ+lt/yJyTYHui3XECbEP9S6YUOQ9jYuUvZDT5+ZlJSQD6vWVnobW4bIdSAWbjgTTOFcmcdSH9jtqjs/lSEjnp93D8ibT+0Uc6XMTPZYRUShG3v0XKWZIzqq0hRmCUCndO2ntINHXsX89ZK9Mr/zo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KhKktmUc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I3xWpKYE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KhKktmUc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I3xWpKYE"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IKfC62027180
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=5rEMmbuG8/Hso5g
	a/WoizU66EScuMeVBEkHjTcS8zkI=; b=KhKktmUc/4m9JT/k0q07vguqdJ6pFyl
	PHjxJPqxbSmmRpsr8zM8mn943HOAal4H3SFwPKvf+s/mgTFqfFmExEYA9UZoR3ey
	/8wKYlQbF+1JsW7Ifa0yQKxoQq+zbI/Othtpos2zJjKJPdmwvEDuUk9ZqCHf3s+S
	lhqUzmJdo4BVeR/A4cdNwoizdXfo5LLwgpb+8CB5hS2SKkf4R8SzfdPDx9UmFKf6
	vEnoUF9nkEuItT06+WoNMvZHl3rvsKS5znYrWPkTmbi2fJYha25KBckERZ3uuAKw
	/0VWv6+hNyNL90l8TPDDDPJc+6dvSnWCjhA1X3G6WfxgcD2UJ+Fc7Mg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40faa68121-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:55:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IKOocf039495
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:50:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwewvhm6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:50:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvM9ALfD6syXEl7VwZxWa5rrbSFsaHFdps/YeBgaiLewmEZO/jbemftvYU6iEzBVTOA0idkH7fo8f9+wApEC7s4I3tiC+X3zt/hIOY6QpHsPMro6pmtU5aVkCewEcHGlzHAT2QtZm0cT2sQqafuRJGpnLPTXfNLyPagDZBYj1n1li3fc291+nOoEhGce/ckqbpb7wehji2LgXuF23UWWRkoIKYP9q3Av/Y0RlOiUpEN4pWfkzQPck5JK3295YiL43r5YmtBcqfdMb7DtkLCal6kR7+TqHZ/0hOGPXlsPnmK2aPBQySDnR9DPJDMEDn3vNXFwa77eVOIxPze6vXKQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rEMmbuG8/Hso5ga/WoizU66EScuMeVBEkHjTcS8zkI=;
 b=sBuKIN+drz9ShRErtcfjjVTycJCUG5vX2xDlWZZe3v1d4RbTlLmvJPQTXGcu1+UtghbeQcUGBYEBiklCHVv3haackU4wVflxKYpPGnEAxWkg2yNgqxcp3Kp3OM2/yqKOmsB/oisOEEuy164aj34fKHmppAQ51Cze9PUM94b4lj4RanALp1iu5HlzKSpRbnClNHvEtqe54ow/z6C9m+BBUU7XUJXmJZnyW6Lf5IzhjrJtlEeD30ecB/CFYCQXMUKSOGdIDNosukwTVJ6CflG9+PpJFzWn019H5ifivklobxKQR1BYKXs09o0ftIXjLYZxXXxNgTIUSF5Ud3p0E2Sxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rEMmbuG8/Hso5ga/WoizU66EScuMeVBEkHjTcS8zkI=;
 b=I3xWpKYE4dci6JEZNY/QmDSjEwKsLibj5ThACnAi47TnEzcW20sjdDVlZNXwcPkLnvTLfR2kRYkVzQzTKYxIaHMlGTXnRYva24qZeZwLjv9O0ALzWrf019F5gvhbQ5Utp87oqMV1/FcggBMbK8qczCc6uZ+xHPJdAF4IXcySvtA=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB6153.namprd10.prod.outlook.com (2603:10b6:510:1f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 20:50:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 20:50:04 +0000
Date: Thu, 18 Jul 2024 16:50:01 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 18/38] Add a provider-specific probe_add_clause for
 underlying probes
Message-ID: <Zpl/+Q+ekVRqosFZ@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-19-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-19-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:208:335::8) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 627dfdbf-7a13-4b33-63c8-08dca76b334a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bnRdUzHraCp+G+A6rOx6TLPZy4iNHp35UXyBhGWkUTwYSqX4gnvbDIIbKcPo?=
 =?us-ascii?Q?6WUvNV23eG76lwCwpyfEd4ZAwpIj0ZKY5THMjnPYSLkvO6rqovVsWVlHYetz?=
 =?us-ascii?Q?+/ocBc0XqHB62KT33S0FAb1e0pYJCAhiPQ/vp9LpC3VSZ+xC8Fh+PO9VNFkD?=
 =?us-ascii?Q?mmvAzgTm5DV+0Sw0x898P7lqw2pnnsHSwEs2Yt6LEZypwoLjGa0oy98OufVS?=
 =?us-ascii?Q?JTESfrpvheZ9SyiYmp30GnrGJlyexAaXD0wpBt2Lia+wTeGPCyy8b5kJeiFT?=
 =?us-ascii?Q?VvSA/WH5mE8l0WbelKHrebg8Knx3Pjm7ZX6y8WvSgAYSpK2d8RNbZqu2KFuT?=
 =?us-ascii?Q?Bu0cMMhLfqUd9/qchrbjzkfSYzNd/6LNk0Y8SUiUbwmV1bTLs7ZoMLfu2JSG?=
 =?us-ascii?Q?ukJnUf8o/sofIKCtsbuhWywL/opfb70oQHVnwj2+DB+3Dt75tG1ys7zXcT5y?=
 =?us-ascii?Q?nlBXk5hmcFU67Mcp9dN3szhIjBCBceWNwnc2Nh88OTwdpD61pAV5HCPXnPRP?=
 =?us-ascii?Q?KylKFa7xoG6PkvJlZleMvNbv4qqH6J13DLejWQoEr8KKWNVDBNSmiecGokZO?=
 =?us-ascii?Q?woWIZjRmZMyvm7I3SXR+wFwKmLHytPk9j6YxSiveLxxMC14vbk0bKIGoPtTP?=
 =?us-ascii?Q?Xek2Rh+JCSOjZA+KUTFwEqGTHkMmg2LJ4rpZvVpLHZDhEW9Eo8yxFyj+Rx4P?=
 =?us-ascii?Q?WVkSbZ+vT93t1ApqA8YlhA235ZGP1uv9GoPiAYg0SdxZZbGHaByFoDMlXEUj?=
 =?us-ascii?Q?QI/qwnReX+WcLhnqpf6LYJkf4EO+R+V+QR2JRX1ae1pNzsFWMsN+mYq4FwxJ?=
 =?us-ascii?Q?9pZwhshhiWXxzg/i7Zb83faSVXu+w4oxih3DiIVh1qkLAokknfxNGaT65XDZ?=
 =?us-ascii?Q?We0hN6srLyWeXwGZAk98owdynuptxc2gZqXby/KS/maOSfhFKpXX7C1ZU/2I?=
 =?us-ascii?Q?4e4XBJ+zTah14sWRnqyiWBmxwwfcpjsPGYpGdewNMXFhI98zY9TU3gRnehPT?=
 =?us-ascii?Q?t9f/WQeY8ALQq1h705TddOW8sFcEVyj1cYwjtYlek4v8V5xRbQL4yGPGkCg6?=
 =?us-ascii?Q?546HvMrIp+2WMEq+COS+1eMY5RdmZ9Qm6k7dmkCQuzK140IIAxgFpwW69834?=
 =?us-ascii?Q?cI0uv518AXzpNRk4UYelMghl/wqvfn69zfj26LOqls6Pr8lRvcRduFxl0RhX?=
 =?us-ascii?Q?/nZdT4uIl2D24GV1KewhEMsUWuw4qCoesKZB/2mmfX2N+0kD/mmf5W5VFr7s?=
 =?us-ascii?Q?lM4XxmhPIWPfVEfTijLBDT8WODltc5DD4oslvzaxGmwxMIyToRNVqP+8nXkv?=
 =?us-ascii?Q?/vsSihNXY19kMIlSYsKyH51qy2GgpwnNXLY3M2fd5awkKQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hBOig50nu/h2yh0B6Ff1FrKRMOXzri0tVbrE0QGJjnod9F2TG5y4FvJG18Ad?=
 =?us-ascii?Q?0xM9fksgToFFU/85if1Xnst8BzAe0fnn1sFU/7ngWJVsVGwex6DzeODs0OgL?=
 =?us-ascii?Q?7sMrMulnxfmvP1wsdXtpLCXjAQWZBXiyAir1nT4z/fNO3NMV9ZrzmHBi3Q0V?=
 =?us-ascii?Q?C1EQV45mOjYQ9jOO2kmm4IhRA0PlN/zPB68dxG6VnNpWX2640zi98xX2x4FK?=
 =?us-ascii?Q?vxC5y8WrXcO1Ohxr7yqAbYzm932yNnqgrEvJxlCJLCdp5QUo+3GZfNMYO878?=
 =?us-ascii?Q?tor85md9YMfclu0yhQIUgzVpc28RPDcYEdZAWjob4H9EXZe4787iExGGHy8Y?=
 =?us-ascii?Q?/eVhd3Rh/CfcrSL1h7WtzKIL+NTwBcKsmHzGvoQZttkuK7GrvxJZVcSFRIwx?=
 =?us-ascii?Q?po4MrGvj6RqoEMmOD1WqrGJXZK7bvDOjLrCR5yDclJ5nbixmZVAQBMjazyP0?=
 =?us-ascii?Q?gcv2Fuf33asWAgU2lR7Ihuc0BkVQx7JfOixgmggfiMkNNr7j7BEbBzAkBcm6?=
 =?us-ascii?Q?hBxcCq/WTlenk0vYxOdnFTzmwWAHWU+Rfe0mfweF+tzMPWTnHwR/0LHaZ8Iw?=
 =?us-ascii?Q?qExJcd72ng5eAnumKfNMatVec4Rgo8xZTnGduHXlfhx0OFL1I4sCgIRFFpLF?=
 =?us-ascii?Q?m/UEVQPlH1MDeLDa5ybzStOKce4WLd6s5HnkDsRPVFwSheGGsYgzh6eOcWD7?=
 =?us-ascii?Q?YteFL7649gg6mhVNoP8e1mssdYHFWH5t/krhaYCc+w/we+3r1t22R3390KO4?=
 =?us-ascii?Q?KzKBHYx+/clzUHJePG3cwCOKmbXlcYP3HUbV9EYQDkRCPozr+HVkmpYBjN2V?=
 =?us-ascii?Q?An11WNbGV9m+DCx9hWuL5JVDGcGBz3rYaD/33ks/lULnNg+b3EKDVIzlpC5X?=
 =?us-ascii?Q?o+xCqrkXTbj4zcawbTpPrPvBIC8JP2c0lyvrPdnUow4hyhDuNIEhvmZehNl9?=
 =?us-ascii?Q?SqwNOrozLZLDCBIO5bXalOgJGmTw3La4UyZSayn8UCGtBVwM4jIiO5/quGY8?=
 =?us-ascii?Q?tEKo7evh4dsfuzU4AenK7I8PZ55LQ06oOaZY4VHRfyRIC2YXstQIWpV9SUzJ?=
 =?us-ascii?Q?BmIuImUVcUo5nggEAJGHHS42U/8UXaBkDV0/j0hQvnsPlOlCt/y10XYvurrx?=
 =?us-ascii?Q?pxsOAvsnmr0Z0NCwYTuhU5EVisad78z9cdjaWwZoq03Y68DnsTKNQMjdZSLJ?=
 =?us-ascii?Q?NXDYuQ5lohIaf/x4QV8nx0yxHHkombSc/Lq35HXsT3NhTaPEfmexWfpacji5?=
 =?us-ascii?Q?BHscgIFPzd/AQnWMIOTNCnV+ewVNuUdJV8piO4KPF/25WOkMA10myYQnq0Ru?=
 =?us-ascii?Q?A9fHe6AwKnf/O3StDKxTLLA81Z1vNpKqiw7/fenO+uSwCkrX3vQ7kSSc2PoF?=
 =?us-ascii?Q?qd36bMxJiVOh/WwZ4eVygImx7llDuxvY5uenoAVqZkoxH7blucMngCwRL+BQ?=
 =?us-ascii?Q?cD07BhGxW3/AjxVphyQ+kMXBnpgO83IpNG09iKlhRSoLXZKyHUoGh5D6GlG8?=
 =?us-ascii?Q?D0rdDM+Qql1Z9UNWpwgo+gtGI4pwk/AnbkAlPQNOjk4vW4Wxnd+eROxXx7C9?=
 =?us-ascii?Q?5ugcCTIY4bzdQruCk9T2XlxzcrV72rlSF1kR9mgwC0xB15KJ+nt6x3NKLGdx?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	V5m/WHkubuvEulQz+Y6Jb9M/kteuvbx9Rs/QGaPN+Ryp9j4vccdw1ILTQ6O/Lo0B0RKBrz+F8kRR/yv+rVN+TgfxIwUC8s4UKm3RKHtH3uoORunietXSNfZsdWMKXzIWFlNDaclrSjhXtTBPemr09xtWtxhdpV7wB9SW9RjITiNVl9G5FVAejo2RXzqLxn4BNXmTH11RoBnFTA+DTWuzCyEjM+O/YmovsVnondh4kym5IEv0JuTiYtmngdnvn0ADZZ3QTVKq3s+uC7s8Zt50n7a9Ex0X8CXp8zTUYINa1gm/ZlhqY9vnIQDElpX6xi/HiZsMBV294Q/JITtxmTICJ6FbZn7v+1a8U9NkaGtpDHpu9+j5Lt54rNlfy12LFZeeH8+PiGK+JHJn6ZeqbvQfnPnm+vXkvMcuzcB2vSqjOkc7tNoz/+AAlyvJr48zPPp32Ze8x4FA4iCoGzmHMiBnxXNxR1EsLgzNDsfBYtAG2n+x1qppO693IvC4veJPg9r+kd+eHOqoZeCSxeI9mleDFVLDax4yHGfN19IWW37D3S/PNJvoAvjxeWWxZgPPwJ/4qKPyOo/DFWmxCn8MFFVb7uxpvZ89XKVebsks2GpVSuU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627dfdbf-7a13-4b33-63c8-08dca76b334a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 20:50:04.4906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Flx4fAqRt/DuJpqHsxQJrZUc8cCWrAop+xwFXo4P0PhoeNQ5yiairCPwShoBxoI1Mz+ew8sAP84OsENk+U6izreMM4SuHxq21A6k8oWZxUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407180138
X-Proofpoint-GUID: zuhAK0y1w1Eo4K_OI65WSwrrycdSFOCm
X-Proofpoint-ORIG-GUID: zuhAK0y1w1Eo4K_OI65WSwrrycdSFOCm

See comments in 16/38

On Thu, Jun 27, 2024 at 01:34:35AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index c77063a8..5dbd75e3 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -129,6 +129,38 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
>  	free_probe_list(dtp, datap);
>  }
>  
> +/*
> + * Add clause to probe.
> + */
> +static int probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
> +{
> +	const list_probe_t	*pup;
> +
> +	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> +		dt_probe_t		*uprp = pup->probe;
> +		dt_probe_clause_t	*prev, *pcp;
> +
> +		/*
> +		 * Check if the clause is already there.  Since the clauses
> +		 * are added "in order," we only need to check the previous
> +		 * entry.
> +		 */
> +		prev = dt_list_prev(&uprp->clauses);
> +		if (prev && strcmp(prev->clause->di_name, idp->di_name) == 0)
> +			continue;
> +
> +		/*
> +		 * Add the clause.
> +		 */
> +		pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));
> +		if (pcp == NULL)
> +			return -1;
> +		pcp->clause = idp;
> +		dt_list_append(&uprp->clauses, pcp);
> +	}
> +
> +	return 0;
> +}
>  
>  /*
>   * Look up or create an underlying (real) probe, corresponding directly to a
> @@ -811,6 +843,7 @@ dt_provimpl_t	dt_pid = {
>  	.prog_type	= BPF_PROG_TYPE_UNSPEC,
>  	.provide_probe	= &provide_pid_probe,
>  	.enable		= &enable_pid,
> +	.probe_add_clause = &probe_add_clause,
>  	.probe_destroy	= &probe_destroy,
>  };
>  
> @@ -822,5 +855,6 @@ dt_provimpl_t	dt_usdt = {
>  	.prog_type	= BPF_PROG_TYPE_UNSPEC,
>  	.provide_probe	= &provide_usdt_probe,
>  	.enable		= &enable_usdt,
> +	.probe_add_clause = &probe_add_clause,
>  	.probe_destroy	= &probe_destroy,
>  };
> -- 
> 2.18.4
> 
