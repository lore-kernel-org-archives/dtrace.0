Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FB8311C14
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754929483; cv=fail; b=uwjGnNny8IbDwnaenhUh2Ks9XNojmrPi8sqe2W6vMuzVbFdPV3sUPiy78gXKWTvrlHnUve5sonhnEu07JdD8bJJsOQaFU2+rAdlb1pQwsXefZOeO585DBJtwvZquDSCQgv5/nsDWmG8a0QPjf67UsnpwPIN71vMiPD2sEhqEi6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754929483; c=relaxed/simple;
	bh=VeqoKfDR+VjuNi8MTZyxa7vZbVAICMf/SQoPamKeduI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=TO7bt8217GoMzOyJsjXndtd24orJCK7yYwMJwYy0mJlyiXAJqgjE6lKC+7p4HCvQ2JM1aEbiudysdcp50TNQRFCP8IlNP/d1vYCluiot+1swGyjYYCao9Td34vU2xujGLoCHOG4+W+RZ24FIJx0epnH6T01gojMQSoQ4i4z2Dp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yaq96Y/d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aVAcdRVA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yaq96Y/d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aVAcdRVA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFN7w5012149
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=udYoiVotcR9p/W+v8/AGYsydPgyUmlmkhr0Whtyh6sM=; b=
	Yaq96Y/dw/73NF+Qu8BQA5YtxsgJp5Gb+oY7XNsGYK8yHJrvGIyx4d9kT0Iodb0S
	xNJniLoVQI5mprn9Jsmo23/4D46NGhEq8iLRW7E48rxms6XXhfSKPYcBqQ65SIMm
	RhvPPYkoeLYFxpJu9mkwwD4SX2JGCATmFV3EmbKCoDkruDtoxpD/FsOQIFRHxRmz
	4KKpb0Xy9QE3nJ2LlbkDBtSsArIo4llL1xtb7RGdDVpXPc67PFLg+g4mxPke8Vck
	rKXOEeaMZyBE17dfSI3cmQ396oqX3+TDYhOywN6Qhuxws55syXg3EOIhJY3Yvkxz
	ZZ634o8AN8BdbAUJSwgiFg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dx7djwwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:24:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFpN64009858
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:24:39 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsf4nnd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:24:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlAoLBUnulBIO9sVEWS4T6pyrNKVmD7yMTcNjAFb2eHZf0wPas/ZLqGt44l0KnpvwtM+s5321MiKTH64adSjr+5Wu+GO0jjB1/OYvqWeqQZXwqxsSdz+MBYbsAwV4PLl2a3XnZui49UoCCnha3gVHXw/PXOO0/NftXWjqvKWi2yvYRV7r1dozcygQj/Tm1w9t9xAA/WsmnJ5Dob2HyP6vzvZPkzEie6bcpgJCsXfETPPm98bQNyorQsHhdVYuccnG1xE4JWLYsR6Wpr7EkwFhL8Eu6UAnpQYxcPdVhYw+JHzQTo3QDumFWRFrSTD1yUvlvde0GeE65+hpFgkaH2EXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udYoiVotcR9p/W+v8/AGYsydPgyUmlmkhr0Whtyh6sM=;
 b=fif4+f2rzls56q0PVKylb/uhRM1KJqeq/mR+LeuzcwFSUKd+20ez+hNuoboWgq4+YtAThWJNxxOCWmlVs1VwMieO5PU37q4cRXmRM85mYgtRqO7x4mWRl4BlJKyBeRUHa6C224etXkdY3i1Oxg8KxbsOPtJQHAHwHOuATk5Dny6tx0jimKKwiE+rYPqWAwCWbnHXHmW8bsKy6/Uy4XwW4K66BRXrFKxVqmuYqrpIcgyoiBHb80y7PS6KEqJCXH5ZyLIFs5lr1b4ykqGc7NR6cxUhMb71Lr55jG3lrI0w0lC3niAolFXQ/TnexETw3DfrT9sv3mtdnxxKLITCUyp10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udYoiVotcR9p/W+v8/AGYsydPgyUmlmkhr0Whtyh6sM=;
 b=aVAcdRVAx6gsZbS+iZNJiaQNji2GlWzwKzE5+2HPopmst8MEsSUMSGtnVaBGhMDKUSsGXOuqfSOComou9V0WAB1UyNayuzZvIrAUPOOvVnvGYwvAYj6oD0qh/ymnUW+ELgUmoi+WTCwyjLbQ0U4+bosCqAuHrFEVRmAfJDyrZvs=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB7386.namprd10.prod.outlook.com (2603:10b6:208:42e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 16:24:35 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 16:24:35 +0000
Date: Mon, 11 Aug 2025 12:24:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] dvar: ensure dynamic variables cannot overwrite eachother
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56723A6CF8353F944176679DC228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c7974b-d91e-46b5-bbf8-08ddd8f38f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K9GdYiUF6GJZsjNPmH9wBOh+P2Am6Dsp/b1dg2YV3XBFm/5nOKcYjh+ikmPY?=
 =?us-ascii?Q?eKTNMn0SDQ0UoO2/Q7xSEbyyBpAVKTjeQTf+n4mbc8haNJ7hkikbFee1KGig?=
 =?us-ascii?Q?xxTZVqLceQeV6qcbMOfknNEcRkvblMs1OcmOBPRktl3uZMgJLFWAfQ1wGJPa?=
 =?us-ascii?Q?nhWBWYAnXDfwBPpDwjGHbp068ClGDYIhE2L1Hakn3ns5MHn9PqP78rZEzWo1?=
 =?us-ascii?Q?IpuL4ayhmLDWkwFucZOzYVLesz48CUdAp7NzBew8VdFH6PFfc/5CGeM/afWd?=
 =?us-ascii?Q?WrXh6QNk22T9pyXMscBBiYpmjWY4nMb9LW6r4mlDYTlsCqNHc+sH8YiGM8WM?=
 =?us-ascii?Q?nE73LxgL7lM0C8T1n3JVpKwmCgSNOm4Oq5heH47sVWCme1xn6YvC8jUE3Azs?=
 =?us-ascii?Q?e3Haf5hzn/t+1rw/JyZxBfz9KKAjwMAsQtMnmgzCnfh7ySBIK4JDSmJM5KkA?=
 =?us-ascii?Q?VUib4WsLo6wwKYW6/ePHMzlMfXnJ+apPXthNwJY3WD0+mw70SHdB2YrdSbr6?=
 =?us-ascii?Q?p9HCewPYpOLJAyx8QXNJlQjX3eRlmoRjUY3hB2g1GImyhukJmiTbjUpatFmK?=
 =?us-ascii?Q?BL2GsPgsjBx2yfe2jSbeZdRi+5+H8mGC051wGJYB/itPftQW3paIKwChdIuL?=
 =?us-ascii?Q?Zt6mrK1bPj1ZAA0NU7D/2K87JR/tZhihLl+jXc004fp3ZT5usTwNOqGp70yD?=
 =?us-ascii?Q?jzOLByEGF8UsMXx7wY56+kChVIyiZcRQ3e9VEGIluJEcXTac+Zsd7gy5IDC3?=
 =?us-ascii?Q?zujvdfkvTMjD+kSYUmydXp5lO76hr4v+gaUpEHffia+Y21y9dQucwzggESVs?=
 =?us-ascii?Q?9j3UANq08OJrbFR/H+1SkGRZfQrKv40gjMUy/jhddAyi+i5HPXuqe48g1t+F?=
 =?us-ascii?Q?gYqEsnF0+6TCHp7CLx4PPCQdMEl6sk2HAVWiAasODVRkwiqZHSbJVyMyVfun?=
 =?us-ascii?Q?Cr1o1Lh0GAikv1cPCwqEtCePx2Z8zpJEzTKfncy+zdsUsUHWfglB4g38sNTS?=
 =?us-ascii?Q?2xsZ9JujRHXLoJ/VS7vKZoKVXHTXsV8jHW7+oXMmNlvelPcE0vHNBC/s/FGn?=
 =?us-ascii?Q?ghlEe8hlsraMomngLeZFXoqkBC6A8bd44IbB3Ue6asOQTey9N/sQYyghxETL?=
 =?us-ascii?Q?SszgBPqFeRAdo23NZdKk89x7qj4lb0adHzeiFrj8LQMMBOfc2KosPU63Qt9p?=
 =?us-ascii?Q?50VGNF8nAxNfrowdy7n+V08wYB9dDNpxvjGzgUhp6m1U4jZdZQs84E2dPJkj?=
 =?us-ascii?Q?dMjG5o6KbcOkEyjjFtDnfGjeKMfNZOMbvEFI43OhcHjSiwQaTf+8PiT6pluu?=
 =?us-ascii?Q?LU5cJ5h8w8O5hhOskUtcrtfvVubJz7vAd7qWtLeqcNzD5Urp30C2FNbK0PQi?=
 =?us-ascii?Q?Sdv6aRJSwY5HWWwqhkBocsUlc7I/63WU0uNtQ4xE6syPek3OXIPlddR5ViJj?=
 =?us-ascii?Q?zB8usCBJt7I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KTorv7hTIY9O0+VXKwFSa2sxxs7jlONrTPg2sJGafeu5RAfkg16g7VJTvRt2?=
 =?us-ascii?Q?6cfpD2TrSA5AO2shv1CZc2y/LjBBhBLKXUMwbGt8AvsUvRKUIA1/F1Zggvj5?=
 =?us-ascii?Q?FOW5b3+KTH4Zf8aHBNvvHbgk3RG+su573CbbBSjpzxmSa0nQ7zCck+lpfQLF?=
 =?us-ascii?Q?4nD5tI9V7mB1YQCX5GQaDeEpC6bfkHSPyi5oNXH40i5eW+610YHOXPkCZwLx?=
 =?us-ascii?Q?vk4OOtlOu7ZC/cwdFPf8NvagGjJi4kSCllWKic2iRTs8lDq0bPqGYsBDKxxc?=
 =?us-ascii?Q?ip48gG5cmMNyq0xBoi2aE7CfA2xQy1gIH6zdGhqr1diL6vcB0b7mwe6XGwuf?=
 =?us-ascii?Q?Azy2dLcIrWRERVk9A5dtK5GI9o5FfB2AzXZ9FDxAC8d61m8GAElVY9qm/Eci?=
 =?us-ascii?Q?H+dUGwlriil0DTmmMiQzpIpI+V+AW29wuEoVT5ugRpJgwLfwwVXWUb+JlsG2?=
 =?us-ascii?Q?Zva729QL+uNe64fJwC4NjfgFF63EJXOlEbdFQ6wwMHj7/VfD352A7prDcxLQ?=
 =?us-ascii?Q?1fFVGd8LmMlsqiSa4KUyAiBwbaxLJoYeQCLy+j3veZfEwzuDj7EjjCTkNFki?=
 =?us-ascii?Q?WztGtkzHM1Dbg/J76yp+ju7RZEX2SwZfJuzuB0Gd2W8UOkfHemuxZGg4JtXY?=
 =?us-ascii?Q?kdTYGCwuGY8Fd5HkFsrb6YD2mBgDrR0nPBTAg2xehtDQLUetI47dt82THhN6?=
 =?us-ascii?Q?UpgsTr6izUrfQB2FdLyjP5VPYXL50+Sa7ZXb8Rkw/q3Z+IFUB/0Kb1sSGdNA?=
 =?us-ascii?Q?6f2vhKyVEC/vwN6gpiull/qtUo0t8MM0v9p4QtfurNU99huiLThxveGBSQUL?=
 =?us-ascii?Q?QKOc5Gr0N8gbG5SfWlFnI3bdksGHFN6J+TMUlSJ12Zps6DZDppTTlo/CLLCW?=
 =?us-ascii?Q?lxq+N/ZN3qINpDR5bA8S76o3ArbEttsUiig+f4rmQ91OuQRlcriEsm1j8k0N?=
 =?us-ascii?Q?wG0l+dYEU+D/d7frSBGorBCTZGnPTEYr83hT4iAtlU12f47yMsMLOOB0UEl2?=
 =?us-ascii?Q?S+OGPZcqaHkwqKsOXZhUDxAYQnSILKRgcemOeF3yVEVrV5GppLT18yKXfPQj?=
 =?us-ascii?Q?7esfwpvrrA8Letan8whrHP8LXGOP6pa6NRLeXUhUuscIW4SlrdzPKyol8GbG?=
 =?us-ascii?Q?iptl0I7x/d4Lx715HY+cWkWT2aLG+N/EWTrYWQ8LLgmVNCo0rkQnP8/7xecn?=
 =?us-ascii?Q?vP57nU/Gnvjntc12J/Ci1Nxl7WcxaZaJgbMPRVdO1DZV8ApWtmfDqtEj7Dmv?=
 =?us-ascii?Q?mHXR8QxRo1tQODayyA27JDJHzJzjZiwYZO6IRLOuC2Mln1E6Hx69c4ZRR0zb?=
 =?us-ascii?Q?4UDh/2yLlBdgHDT2lv8ayKqxYVHilIMc//zuL7POEVOQDuhIZz9cuLmNsI72?=
 =?us-ascii?Q?OIGcKsFJpfYvpU4aKQCLfeGoCHBdD+nkxbt6sE+/pF69odRTpKprqHQEwrC4?=
 =?us-ascii?Q?meuMPx5GDJQ8T97fEvtEkO7JbIxYaai0D9dKWiH9X7ueqto+cmWw68PkKfBu?=
 =?us-ascii?Q?ZkXonKLGFgDp+vOQMVHEnvASi8WfsHclWdxmB4hbqb7pE6Z0J5uOFICEGmTx?=
 =?us-ascii?Q?RpMaVe/PLbWx/hYkJcfqay7QuxUZ8+S8aZK/+WPnxML4casLRP+sYshcw+5J?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FILytGOszYMQfVFHme5eo/LRI0m0PFPu9IdoZ5sTNgESExfPnfH+FG0XbDAbvZutzMlCTRb6QIvGKKdFQ69CeGxaUKvLhl+AzE4x9SJuV7erNa/hKoqWIZhCOgTyW5cQAwiUM/Ws23V1o6gjADaLkk2Uu8L53l/1or/jtiY9/GUj9+t8PNdrMxGmmjomUJxTcyQd/YZx13VLMh8tsn2K9RCbKJ85kBOPLHnBPcFwf9MxZfHa+nHRaRBlJ6vsUoNSEzZ84qekMAC0u2JqnvNefxFOcRyXKjQWrykUAm+KXxp69ukEzXN4Hj8B9dI3thOk4aPXqOdBX5Uhr58ixRwO7cHQysAzECNmtDTvLaVQe6OS8q+A4vzW79HlTxXZjr7ze6vY+19E3tuNZA6DURHFQhmBUNEdmEx54WYlVjC9g0jzCZR+f5cGFD85vtKjl5cEoIxs2hbu/yyuHlBm0R1EPMtyIBPR0CW+iQqQMRVIysKv8XVKuUJm4+zlCXVPTD7nW05k69yy+zXUMF6upkC5eK1rGG7F3O3eru/giDCMd8cd4VD9aFfX85Xg94Ki2KLyjqX3KJKaoCDWO0DdlgVIUdTHDN/pARCUquBwRP+IEf4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c7974b-d91e-46b5-bbf8-08ddd8f38f79
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 16:24:35.3400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxqfzlSZcu6tKXuoTa2BljD2d60IuoMIyNqZ5NXRSeFoM3MtxGzcKt7UNRQBvzJuyRr0jyz/h76XbLJhn6JVDXgZoxcYD34bIgaqtqlCFHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7386
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508110106
X-Proofpoint-ORIG-GUID: PrUYscB1LHJ0t-pfIcvrRF0Yu-JCkDG9
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=689a1948 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OvBZXy8-2zA3o2Obo5wA:9 cc=ntf
 awl=host:12069
X-Proofpoint-GUID: PrUYscB1LHJ0t-pfIcvrRF0Yu-JCkDG9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNiBTYWx0ZWRfX9RGqpqxZ1Vrc
 qKpoDVqM8L+/lcvdIrkKiQ864WdIXjcD9EesAsExEVCRHjhKg2B6ClwftdQBEsmxHLObZgWDJOJ
 hZGQZzg+f8nsINGX33V4cVLH/sh6dGI5EFZ7WE8TjraBLfRAB0DFZiqlb7VeYVY7qGjRaa1Sag+
 +60q3gCW4GarBHp0YKID0UyvTJdHk+e7E3KTWL3eNRu6MQNCkeQbZwmANHpEQ9gdnQcDaJ6E1Wg
 Fj5EXZVWko3B15rDbSpmqz8CUb9gfHI5vAEl51leU4DkCBUJTyaZUkKyuVR7k1dvk4CTN58+gb5
 IhQRml1w1aM7mu5a/R0OtlOFKBBS4fpoqtOvBk7/EVY9bvDXbpu4C+7V7KpgTYkZFk4sLcmg1lf
 N6y8HSfLjnbb+kqAT1/ujpfgMfzYm9p6WYKB3D5edcGbWRtG76s4lEmKUIm8UGYd2xi3BJDb

As Eugene discovered, it was possible for dynamic variables (elements
of associative arrays and TLS variables) to overwrite eachother.  The
problem turns out to be due ot the implementation of the BPF helper
bpf_map_update_elem().  In order for the update to be seen as an atomic
operation, it does not update the balue of the map element in-place but
instead allocates a new element and places it in front of the old one
before it removes the old one.  The result is that the address of the
map element changes as a result of the bpf_map_update_elem() call.

Fortunately, we can just assign the address of the map element in the
value that we obtained using bpf_map_lookup_elem() because that gives
us a pointer to the map value, and we can assign directly into it.

In other words, we do not need the 2nd bpg_map_update_elem() anyway,
and since that was the culprit, removing it resolves the issue.

Test included.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_dvar.c                       |  5 +----
 test/triggers/Build                  |  5 +++--
 test/triggers/pid-tst-timer.c        | 26 ++++++++++++++++++++++
 test/unittest/assocs/tst.collision.d | 33 ++++++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 6 deletions(-)
 create mode 100644 test/triggers/pid-tst-timer.c
 create mode 100644 test/unittest/assocs/tst.collision.d

diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
index 1bb5eb002..073cca57c 100644
--- a/bpf/get_dvar.c
+++ b/bpf/get_dvar.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2019, 2024, Oracle and/or its affiliates.
+ * Copyright (c) 2019, 2025, Oracle and/or its affiliates.
  */
 #include <linux/bpf.h>
 #include <stdint.h>
@@ -150,9 +150,6 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
 		if (valp == 0)
 			return dt_no_dvar();
 		*valp = (uint64_t)valp;
-		if (bpf_map_update_elem(&tuples, tuple, valp, BPF_ANY) < 0)
-			return dt_no_dvar();
-
 		val = *valp;
 	} else {
 		/*
diff --git a/test/triggers/Build b/test/triggers/Build
index d49b996a6..30991db16 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -5,8 +5,8 @@
 
 EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie futex \
     periodic_output \
-    pid-tst-args1 pid-tst-float pid-tst-fork pid-tst-gcc \
-    pid-tst-ret1 pid-tst-ret2 pid-tst-vfork pid-tst-weak1 pid-tst-weak2 \
+    pid-tst-args1 pid-tst-float pid-tst-fork pid-tst-gcc pid-tst-ret1 \
+    pid-tst-ret2 pid-tst-timer pid-tst-vfork pid-tst-weak1 pid-tst-weak2 \
     proc-tst-sigwait proc-tst-omp proc-tst-pthread-exec profile-tst-ufuncsort \
     raise-tst-raise1 raise-tst-raise2 raise-tst-raise3 syscall-tst-args \
     ustack-tst-basic ustack-tst-bigstack ustack-tst-bigstack-spin \
@@ -191,6 +191,7 @@ pid-tst-args1_CFLAGS := -O0
 pid-tst-fork_CFLAGS := -O0
 pid-tst-ret1_CFLAGS := -O0
 pid-tst-ret2_CFLAGS := -O0
+pid-tst-timer_CFLAGS := -O0
 pid-tst-weak1_CFLAGS := -O0
 pid-tst-weak2_CFLAGS := -O0
 profile-tst-ufuncsort_CFLAGS := -O0
diff --git a/test/triggers/pid-tst-timer.c b/test/triggers/pid-tst-timer.c
new file mode 100644
index 000000000..ae98ffbfb
--- /dev/null
+++ b/test/triggers/pid-tst-timer.c
@@ -0,0 +1,26 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <unistd.h>
+
+void
+foo(void)
+{
+#if 0
+	usleep(1 * 1000 * 1000);
+#else
+	usleep(1 * 1000);
+#endif
+}
+
+int
+main(void)
+{
+	while (1)
+		foo();
+	return 0;
+}
diff --git a/test/unittest/assocs/tst.collision.d b/test/unittest/assocs/tst.collision.d
new file mode 100644
index 000000000..1dc0ec7e3
--- /dev/null
+++ b/test/unittest/assocs/tst.collision.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@runtest-opts: $_pid */
+/* @@trigger: pid-tst-timer */
+/* @@trigger-timing: before */
+
+
+/*
+ * ASSERTION: Dynamic variables do not overwrite eachother.
+ */
+
+pid$1:a.out:foo:entry { n++ }
+pid$1:a.out:foo:entry / n == 1 / { fdepth[0x1234] = 1; }
+pid$1:a.out:foo:entry / n == 2 / { self->start[1] = 0x1111; }
+pid$1:a.out:foo:entry / n == 3 / { self->start[1] = 0; }
+pid$1:a.out:foo:entry / n == 4 / { self->start[2] = 0x2222; }
+
+pid$1:a.out:foo:entry
+/ n == 5 /
+{ printf("%x / %x\n", fdepth[0x1234], self->start[2]); }
+
+pid$1:a.out:foo:entry
+/ n == 5 && fdepth[0x1234] == 1 &&  self->start[2] == 0x2222/
+{ exit(0); }
+
+pid$1:a.out:foo:entry
+/ n == 5 /
+{ exit(1); }
-- 
2.45.2

