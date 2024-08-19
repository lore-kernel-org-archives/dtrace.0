Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82A15AAB8
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724109214; cv=fail; b=MVYzisghiT0v/RLGhezXYefLLtOLUsahGLhkzOcwhOclkK80rjZjt84UMZ/E9nrNvPSayTASgGU2mhqiEveTVUSkhusoSK9XB0Ty+JT6rQbvMB1bZVrb6FgOh86l/+J9IRoq9fQ4wAE9JTTjbYIzrnfAWcMyCfuWx8C9OwEUmoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724109214; c=relaxed/simple;
	bh=+M5LiiaUDoUAeegPbB0hf61YpW/ylU6fLpJjAgMNq1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EAcBSJmA68k1VZv3KC+1/Lo0zC0wMNXLiNYOyEY0A4jzaXIqqjJ61ZD3k9omAQfV2e7/OcxkObNh6Fs59e8CKGvLpH+DvVIyC3HVPTFTjYItQ6E3S8X4fxKQuKK9kUqSx9vcaSi7gaaxeQDGlKtnMH0CijpASFObI+bc0tWW9Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BYrY42eo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h9Sbuzqb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BYrY42eo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h9Sbuzqb"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLKIA7016488
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=CDqUUWTmgKU2S01
	GNvJdKzhXTv37yiZzTEjyF2wkq8U=; b=BYrY42eoAuM7TIOvn7moRtSMMx9YFQc
	yDn9ZP8v13PFDDHcK7KM+osO2VEtNusJ+CJ9hTAkB1UKZjeukTbv8e1ISa6lcKpy
	12DT3FmxHF+YRV0V58iI/e5CcEup8BK1GVF6LKFUwzUFi7H1bi7HtdoHuTiITsub
	ny6QHrVdwfV/7vQdmtciFCmw44PMK6eSXrkeM9Ox/WXvOvAh519YD5vqzrLGbc2m
	j+E22U91UWWKjKT8hvcj2Pimi/S2m49sWhfalIOkx+Bk5WV2o1T7Lcq4eJOpfrCX
	9XO3d8/2+2BW/PT+4TWrV2/Pi/MlylgJLu4g3Xm2/FdkmWijukvyEpA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412mdsus8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:13:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JMu0Ns019282
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:13:27 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 414d71ckry-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:13:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrELckJvD2QBhBZnydOBoyo7wwmeVdLWdE70fqj9ilAcstelXjoEIG9KFMTPsWANhV+NcRmM7x4r/2L4q94toJuiPv3ILTy7tcQUOpEOsPgey5tvZh6t/JuQ5DAiN5CBY9yFOZAPjll3LM9JBfqdKbaEK8AwU/n8jTCmluz+tkzR9Dho9XCxtBSRHjeqt/ZcyjU5usCt2m3I+EPmg9yuJCRKNWooKVYcwW5GmOwmoh1xKNkzupXlO1PIiSZ3VJdP/sfs2m1jbSxnFoQrp62VigjF4R2NBUdktxc3OVenQrGEHE24tqk/XETcuUZz4tJHSWnJ7ZOnPGXftys+KvPErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDqUUWTmgKU2S01GNvJdKzhXTv37yiZzTEjyF2wkq8U=;
 b=ysyVBD0fwpaB+8CmaX8f6rUm6czQGDLsSKj0+n4nrlWHLKoefalNhAKXyfPTV7PQqMPTJ2hlX4mNSuGm9JFsdXM7Uyg9EpDIEGwl/bqBjFixWY9mQle+iZYZQqGGOxkD+zHVwKttX4sTvr64ombf/jFMFgzRHeyI2LwFG028Ombm1kmXjhD6E381u5g7tv8JHUmvXi53e5kmXv1zBxn/JcvgdgfT6bxw+omR8KCCyT6mo1lkABkgHFwBxifrux/sU+xVJ3VTC//FgRz09TE5eSVA8BBSHWmfga0Qhs2QgFE9H/dr5d3XBvRNIfu4dXLThA/AhFsmXvbrNFbpu0yZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDqUUWTmgKU2S01GNvJdKzhXTv37yiZzTEjyF2wkq8U=;
 b=h9SbuzqbUWaLvhRRTYFXJi4chyxlccWKK1ex9D1TX19ki2Js8XOPu6TgpJUgWOgxIPJo9/F1SHTYCMSoPtBL/rQiUbdLO8H4GlEgBWaZgrAHeuIpGMj6Rpgjl1v5jWHx/dD/i9YjMnp6c7UfpEdYjylK+ZOGIQhdiidz/ysC8Ec=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Mon, 19 Aug
 2024 23:13:23 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Mon, 19 Aug 2024
 23:13:23 +0000
Date: Mon, 19 Aug 2024 19:13:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 5/8] Fix stddev() carryover computation
Message-ID: <ZsPRkUt8v/c8HF7B@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-5-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604180008.11331-5-eugene.loh@oracle.com>
X-ClientProxiedBy: BL0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:91::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d945f0c-a905-4f02-81cf-08dcc0a485da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vMPvGH90Ru+cAdMBOybwVASM+PIYrFdTKWwirqUrAbfY4wFLNsCMjgsT6vsg?=
 =?us-ascii?Q?IUxDBtV7QGisucRp9tf5yWofuojDuoXHKG4JV0vC3B77B3HeaywEZY+Solrh?=
 =?us-ascii?Q?NSvKMJp9BA4wqDbiz6OOu+Dehw9vxwq2WDVqUPxcqbo8Tm1sipAssuHA44jM?=
 =?us-ascii?Q?vJN+R4IFTFXkX2ESOVBj7KDXM9j0q5tuvntZykjXJ8EDNyM3KAKdFqo+Ovvh?=
 =?us-ascii?Q?hIgYH/Y4M+0tx/i6uCLEovHFBwPrUCFjsdY2NIzCP+Woyee68n0BgsWIcFu3?=
 =?us-ascii?Q?uctvjZJa7KEbgqpbTGrn/tH9Csz7K073+elc8n6BoeqUFYPxU76kuGAg+gSS?=
 =?us-ascii?Q?A11V/Bu3LzLX//YR0bDY/Z4Exb7RcB/hUOUfluNS66PLVUH+b85n3PCWT/L+?=
 =?us-ascii?Q?sKAQ9pM/HTLNGOYnYpdpSDK33/6fBHMJTQ7wOwAeYOlV5jWVkj21hxn98pNa?=
 =?us-ascii?Q?RjBIrGiy1X0m6CelbOSlbWmCgNRsi2nxdUpWooSM8FexlI2r/Pig+xsXfoVN?=
 =?us-ascii?Q?LjBOErQ5cbpyf/KdMpRbi5xUF/viLKOa7cx+aMp4ahqrGtJbKwDSPqA//9H9?=
 =?us-ascii?Q?Vhbc0xwmR7XwWfg72Cn1yAnRw945XpEHsCsJvjT3IMQ5UOOx0T88+yfIUQX0?=
 =?us-ascii?Q?0dc0/kG1M9KQvwdHHzM3zpkm8oBg+5arVto/BY1+hupKRkjqn7JvjQMCwvlH?=
 =?us-ascii?Q?x1zKxfqXFrFMSYGrU+nlwuWry1F3Zto70c0jP0OSGjwao45lh7r9GiU2pwc3?=
 =?us-ascii?Q?TUYADA+p50By9JNko9g5VvqfXVNIf3+zZxmYIgbjgJm7XZBLR4urSq84XWIY?=
 =?us-ascii?Q?1eW4inCJ12KWwOSIIpxIrVI5AC58/KOO3pDsVRdvRv2QekzJxZ+hvQirDZih?=
 =?us-ascii?Q?IOSNTY52WOAYw8nOqU7cIa/ZkfX/BxN5Ho0dhbnr4pVHYqozQVwjaFg3GxTH?=
 =?us-ascii?Q?nEbTr/e8C2hHKwzbqFXrA/khqMwUN9PrTi2wq7vtthrqT1KAeHtwhcIfcK3+?=
 =?us-ascii?Q?pcyaSj7uNl4acz+MaNctPcMMs43cEks111YaA3iv2TdAOkb/aDwa54LaPnce?=
 =?us-ascii?Q?h9jhnS7vdRoheYFTBNV6j+Mg46ByusteMB3175RhXWfsZkoejYA94HI6zE23?=
 =?us-ascii?Q?F0NttgeFjQzDfPYHiGp10MJtRVs55gYVDiPBN0d8zN07gc07COhoKGavXZMh?=
 =?us-ascii?Q?vwEurypvZ9yretltpfy1jpIDMTCn4QxrJeTyzienDonBIvN9vlku3Qtv2NNX?=
 =?us-ascii?Q?RVeUmnICPMxEPThBIX+BGXvvsYyQRadwJsG18by4Q6O+/9Z9nUXlVnvuVPXm?=
 =?us-ascii?Q?/KvoT3vQ5FvC8NnZZpnN7wSD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yH08wIXu9lo/BjZU3rrZ8RrEPWSwMqk0levNsOda17qvqUiz7FlaAodve6D3?=
 =?us-ascii?Q?7W9VZYLqgDWQW5CiI9rg/jnYus0Va4k+5B7CCncUIc37+5rZyHNl8MqFq1Cu?=
 =?us-ascii?Q?7EhmwTXlITtedDhcLUDQQQ19xMQoui4k/ComAexm9KeBbGrilgqdMzirT9hp?=
 =?us-ascii?Q?/nNd6yWq+n7CXRi7lPwg1AahgTI5q5fN7Ql2C1MNYm43bd0y9MsMoLqDsQfA?=
 =?us-ascii?Q?Taq1/TXPVnLnOjxYRHKLIVVQFfkPv8O2Ijtf5RuSUjCN9cRiWUG+PnBVpN/s?=
 =?us-ascii?Q?Upc9Cz6HViOkpqH8FTwTXPzSAim37Z+mYqETbdxQ20QbAIvFBHegI8kL30xi?=
 =?us-ascii?Q?njhV87thi9kTEDid2WSynNEVL70MH95YNASBXC0ZLQkDPY+mKwwadfi7mvx6?=
 =?us-ascii?Q?/6AcMgnGxHoDpILCbulbAXQHNvfjJaikQgnnlBOjp8TV4sxXDiiMyBED+BKU?=
 =?us-ascii?Q?eyhH9O/ic3qh//yyatL2PrR/UUYbP3u+wgw4D7Vc8Yl6PwRoTMfYU+y/JjoF?=
 =?us-ascii?Q?hLGxvAxNstm0/EYZkJFMlHhclkxKWKptpLPzFr0DACRMqEpwNeNtnkZj0fLX?=
 =?us-ascii?Q?1zvAL3vwTc1oqzVPGelkWN6D8a8Etf2NYjoa/hJOKa7vP+E4gqUL0OAIvPmJ?=
 =?us-ascii?Q?+VcxY4wgfVsdi3B00/NjxHbkoFEhboAvODzY6kyKxgD+HyYpkZEKBumqmDVf?=
 =?us-ascii?Q?/GZbKHyfHqWx/OpN1/Y+w6XhBvN1aH6E1AdlByOr+mbF3UtaVYvfY38a1WPS?=
 =?us-ascii?Q?fwmhpPq9bWz/M9TbAwp8NGPsUwVD6DFrQqcMqvTUXjxOHL+AKdhwSE3or5R7?=
 =?us-ascii?Q?+125gOpm2anleVhkrkzHZUJ4nGEXl1m+dSQRS2ZpThPie13WOl50yQii7R8K?=
 =?us-ascii?Q?Lp/irJnGYDWV/h+7oGNZlzCn5s3hlD9R1M2VPZfJD4S6Woc40jFSsh3DCS7u?=
 =?us-ascii?Q?tUETpIK4K/ggQyhYjXESXq8FyC4MoCT8VkRn6njmvv6AM3ZmGzLTH8F0Yi13?=
 =?us-ascii?Q?zXrNLV6CcE9ONkRCrTC/9nSbPcWLREGcopNJUAVq+ZfMm4U6X2ny8RfnoVHj?=
 =?us-ascii?Q?EYTOholpZ217fnZv8LmiD+Z3vxdXl2WnPRrF6ToDEZWXE098SiKcV3OjVgCq?=
 =?us-ascii?Q?uXlC+MB2CVUGVv7YXtLBkx5u0XrlmpM6F5GSzQVoTbilgdBGYYTrsBGfZu5W?=
 =?us-ascii?Q?NQsyOJ0dy0zCMHo71wTYr76fJifeQX4T3s1NhMTmLIMfVPPX2ckpKwi3ktzB?=
 =?us-ascii?Q?Yyg3oLwinNkdQ64kWzfgozxkfKNvTg9dhESzAY+79WdpQ74bWSh6bmwivfIW?=
 =?us-ascii?Q?VqlpNZ9vTu0XvyBil7vLszQWZijHI36nir7k58XFdLrBbgKGsFtBVanUStr0?=
 =?us-ascii?Q?jLI6twbp5Z7skgDNqjXBX8z0ggo8zyj7DsZJWO2usdxSpeydWuSLUHI7Fnb3?=
 =?us-ascii?Q?s9ACiuXUk4d7p0TaVglVeESp9Sb3dIFig2/d2vnQznkKdNaIRznZefMXTJHl?=
 =?us-ascii?Q?d0hL8FEmcjwy96ioTng4oI/vjFzGa5pDpz6nRqa7g8Pl6/1OG32p6PJAcszt?=
 =?us-ascii?Q?dKkEg5u5NJ+C8MRm46/jz62oXXxVGRVQiS4zwc1EIme/SCKsnTxg/hN3eOHl?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QCsFgkgzY5d1KUpFiWxRaN4/m88X0N/lUDiEx2LkOES2oc0xSIdLyflaZJ2mIYDPnHuHogWUHjzoUrdkiqL6wLT/3ujKIWECk+Fk/TPRV/sGIM9tL4NiKI+2Hz2ONjwOxDJnvHz2Ew3FQPXdrZUOwstypdTRgvgJRs1svd1z44wI8kAZbMK0ISM8Il9xdoF22eoKCSzoKTiiw6UrMGP9e0jYWgyue7PE3/EI4XsvinUokm+N0JCq4/tMgsCzKkMsp6kga/eSEGKLepz/db38zldy9nKyKaC580q7p9M35/cTcfnb/Zu9UDAomGH3DEL51PJv5J48COoDS+VndsDgAW5+dbEPrT/g3SgRH3ANQ8PwAM9TZ5CEYoKr4JE31FZ66MiwGOgEQI8yJa9A8tllieospw4curbiLOedfaHprKIDNTCuBK41gJfLs+Pk+R7Lx6hhacDNynZCH+NKFA6n4jmkzb/JAqXGhpb0e6xMGePVSDRPjC6pc6UXz/67lWHxqSHtoY7Xgf2PTzbe95Pinj4pqbuVuDhy+5T8nLtKfPTTRz3mByreHoyWNJSEy7rCVrwkzkZCM57KlvPmlpG4sWFsys/2sIl1o8Xwqn3JaJA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d945f0c-a905-4f02-81cf-08dcc0a485da
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 23:13:23.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCCvbKvpDRg67IyAbRKGz49Tu7zhaXKSgSnZ+nfCBJhzicAF0ix7HwqHBIx2FCHBIPQVOoXCzOrA/LvGLV31HKH0T67BvwGXtBX3QjtZr4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190155
X-Proofpoint-ORIG-GUID: rSmn1uA3aXTjXPgD1-g0I_16HTAqec8a
X-Proofpoint-GUID: rSmn1uA3aXTjXPgD1-g0I_16HTAqec8a

On Tue, Jun 04, 2024 at 02:00:05PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The stddev() aggregation function squares 64-bit data values.  A
> value is split into 32-bit high and low values.  Then, (high + low)
> is squared to produce high*high, 2*high*low, and low*low.  Each is
> managed in its own 64-bit register, with the final result residing
> in two 64-bit registers.
> 
> When the 2*high*low portion is combined with the low*low portion,
> care is exercised in case the combination has a carryover portion to
> the higher bits.  This check was broken in the case where low==0.
> That is, data values whose lowest 32 bits were 0 resulted in
> outrageously bad stddev() results.
> 
> Fix the check and add a test for such cases.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_cg.c                |  2 +-
>  test/unittest/aggs/tst.stddev2.d | 45 ++++++++++++++++++++++++++++++++
>  test/unittest/aggs/tst.stddev2.r | 13 +++++++++
>  3 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 test/unittest/aggs/tst.stddev2.d
>  create mode 100644 test/unittest/aggs/tst.stddev2.r
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index a1c24e37..fc2cebf0 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -8290,7 +8290,7 @@ dt_cg_agg_stddev(dt_pcb_t *pcb, dt_ident_t *aid, dt_node_t *dnp,
>  	/* Add low value part from mid to lowreg */
>  	emit(dlp,  BPF_ALU64_REG(BPF_ADD, lowreg, lmdreg));
>  	/* Handle the overflow/carry case */
> -	emit(dlp,  BPF_BRANCH_REG(BPF_JLT, lmdreg, lowreg, Lncy));
> +	emit(dlp,  BPF_BRANCH_REG(BPF_JLE, lmdreg, lowreg, Lncy));
>  	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, hi_reg, 1)) /* account for carry */;
>  
>  	/* Sum high value; no overflow expected nor accounted for */
> diff --git a/test/unittest/aggs/tst.stddev2.d b/test/unittest/aggs/tst.stddev2.d
> new file mode 100644
> index 00000000..994bc3e2
> --- /dev/null
> +++ b/test/unittest/aggs/tst.stddev2.d
> @@ -0,0 +1,45 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Positive stddev() test
> + *
> + * SECTION: Aggregations/Aggregations
> + *
> + * NOTES: This is a simple verifiable positive test of the stddev() function.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	@a = stddev(          0); @a = stddev(          0);
> +	@b = stddev(       0x10); @b = stddev(       0x20);
> +	@c = stddev(      0x100); @c = stddev(      0x200);
> +	@d = stddev(     0x1000); @d = stddev(     0x2000);
> +	@e = stddev(    0x10000); @e = stddev(    0x20000);
> +	@f = stddev(   0x100000); @f = stddev(   0x200000);
> +	@g = stddev(  0x1000000); @g = stddev(  0x2000000);
> +	@h = stddev( 0x10000000); @h = stddev( 0x20000000);
> +	@i = stddev( 0x20000000); @i = stddev( 0x40000000);
> +	@j = stddev( 0x40000000); @j = stddev( 0x80000000);
> +	@k = stddev( 0x80000000); @k = stddev(0x100000000);
> +	@l = stddev(0x100000000); @l = stddev(0x200000000);
> +	printa("%9@x\n", @a);
> +	printa("%9@x\n", @b);
> +	printa("%9@x\n", @c);
> +	printa("%9@x\n", @d);
> +	printa("%9@x\n", @e);
> +	printa("%9@x\n", @f);
> +	printa("%9@x\n", @g);
> +	printa("%9@x\n", @h);
> +	printa("%9@x\n", @i);
> +	printa("%9@x\n", @j);
> +	printa("%9@x\n", @k);
> +	printa("%9@x\n", @l);
> +	exit(0);
> +}
> diff --git a/test/unittest/aggs/tst.stddev2.r b/test/unittest/aggs/tst.stddev2.r
> new file mode 100644
> index 00000000..16e17736
> --- /dev/null
> +++ b/test/unittest/aggs/tst.stddev2.r
> @@ -0,0 +1,13 @@
> +
> +        0
> +        8
> +       80
> +      800
> +     8000
> +    80000
> +   800000
> +  8000000
> + 10000000
> + 20000000
> + 40000000
> + 80000000
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
