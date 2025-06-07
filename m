Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14692594B4
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276910; cv=fail; b=mvTRzA82HFuWebWuqO9jeTjK9t5xFBNkIfd5ifMK+tFnUScwsoWgzquKz9DchB3a3zC5UUBHurVCf8AK18n2fnMyUgsGb4wzfRNIR6RL3mgQyCdMc6dsYFPUOgD3KjqPy9X+XCgztssBlV8GEXjw3mGvzv0Q6R2QA93+reXcXwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276910; c=relaxed/simple;
	bh=URHTXqfcCyS2nf2XxjhO0BeuiKcDlPTOGtPKMooof7s=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=OjooNt8A2x5mxwU62mrH8d3g9c2bidRFpCk/bte9rO70xbPzB+BvUpJek8iuPRlek7hDyv18sTKWeZdiywY5Ua+Wb8268UvaMnchd0jVGgi+x4iG8ciH2EFD6v8P8ZxUbRUYKuLXf+zx3TTDCiLONY7vxDvO0KXmGEAEJvtPZIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cRJo5Oiw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HCYti7TJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cRJo5Oiw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HCYti7TJ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575avT9018048
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=jBMxURMaAuN8zTXYhYG5hB8CDEH4wn1AUZqkO4+doPo=; b=
	cRJo5Oiwo02HcOHVw61MJTVsESp2XF+nv/20myoNc/1jKJ1SSLHS4wkFFTs9lHnE
	uyYjGyrYBXemb5CYU/mPc6JhN9WXFHn/5/0gpWWMWvo8lGW2qXT8upJZA0JlCh2K
	wmJJMI+2hPMr8hLlEJabJ24Xfb2P1leRG15x8xTHMzEfLxszEBWCriAEaW/MWIbW
	SUZ41Hh1gpkN2h/PeEolpXdAoEE9x6+lAgZgAZ+gR8PfRsi3upb3WBdZaRJiRtCp
	lOgOyfxZBDjZlyoQ4RfmzSChPhpXHq0NE7ZMWPdgyrwdn02sjUzF+qcGJs/6Pc/C
	cUxtq4jYWND+rx3UmTG53w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad025d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571XOpa003302
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:02 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv5uypn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HV7SrWPEiGpJPJZ1Ldha+IW48hDnJvceVUPDyI9kgcHdFJNsIspIdRYk3bJSAA1J4UVibxTX7833OWwC6/9s0MgPJIbS1w4tRICoCsssGhuyyDc5xaqo3kqxmmo50VfoFGEsFRJZZKGzKlqjGP4iz1byw8cKFsk7ZvqrDR/SeytFisjywzqE7bBreMLS3pOpF+ocnIfXcE5P2bSSI+phadI9QtZjeIGygL2WggxnJH7MGnRIHE06N5zNE4RWLmdrEvgWRpCOzZ7K4YyvnHqyWRRQU5Lv1cxwYH88mZPai5LV670ts37SPRqRSfgFCl54ItxazCn8PGj0rZNviy/KxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBMxURMaAuN8zTXYhYG5hB8CDEH4wn1AUZqkO4+doPo=;
 b=CRXr3QLDN9fwPxZcd27znptf3EoThZcHRvofVhcUcXQRlRy6rAuTxJ6GyoGK1lnQY4fDpv8RZw4tzJm6M+ypv6pRDaId4B7i4BsxuAy5JYNG9diQRR+6aD1h3CNaWRjxdX2mWkt112sFRRY8NStMCVm/4lE169BTfB+bIEJtBeiVhpPbBsLE2mpWat3DbjKWTmloEyG/0Skzh8y/fBWo0Z2x6LeSp5FYQkVFSKH2WpON6n464FQJ40aXeC81VMmuXFO9VeQKWBKYksh9ILCGr9X/x/DSP5kZRuaQ7d0iGQbuC0oJQjuuLvvEiC3JXJEnVqelsIwubx09FlDQarL9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBMxURMaAuN8zTXYhYG5hB8CDEH4wn1AUZqkO4+doPo=;
 b=HCYti7TJS754RmYOBlDZYN3mO5oMtgdKntuCdQc/dxCdjW6X5kBHdDWLzr5Nij04c6sKJdibPgYSUDzJh8XoqQi4DONgTbbWrRanvLhuVSj2DFBuaLL/kLGBFO0rwBXDoi3kQ/I2BB++jHMNwNe/+s5+sJ1XnqzbP1NSaa2N0NI=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:14:58 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:14:58 +0000
Date: Sat, 07 Jun 2025 02:14:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 04/17] Only include dt_git_version.h where needed
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB8374B3E98E32AD45E05BE553C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9e3747-a06e-4cd6-823f-08dda58aa146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zL28JJcJ3JiqVn9GamPtVIirnf6M1ByWb2bkdJ8mYOB0FZrXVOnTn6f5yvsn?=
 =?us-ascii?Q?m2aYs+mDVMOh028E+0TcMrKGkRj347/mrzNj3rod2k5YMAz2t+R86C9gnomn?=
 =?us-ascii?Q?wR6mU55Q7GZqLmNECJIvnEYHsXxfV3MSJxcfIf92YY28qO9jJAkuhEHNM0cC?=
 =?us-ascii?Q?E39vreyZ/YRIVvUm27bu+GyV1OFTPaeUsEKTtXuHLxC1RJ9oJJArI797rnXi?=
 =?us-ascii?Q?gv7w//A/hU9RB4XNTqThYOsuDmHPzJG8JNh1NOLtuT2myCliTyl2t9DFwU5/?=
 =?us-ascii?Q?lcYtZSHyHaQXqsJfOXFyQP2XRLtRLmi+IHOGrXSyWDauSVl62Ij03x0Hgy7S?=
 =?us-ascii?Q?8sAFtq3FMECO9EIYqQdBJDwal26RGpAniRQnKAulQTpAiR+SHM3wYUnMeYp7?=
 =?us-ascii?Q?FEVnS1Nw15FmjHHBQqw2eZtI2j40MTvyYKRjACo7vZRWcOTpAitWk7klwkPi?=
 =?us-ascii?Q?38GMcarGcLLJespGX2qJ5Sq84aVjYc+a1ZlQbPQOtT2hc/QbvGSgsSWmx0Jf?=
 =?us-ascii?Q?b1my4OLRLDe4lefi36b1j/JXw4KU8BuV1LnnsnxM9YLSdnBBMeebTW99Mm+Q?=
 =?us-ascii?Q?p40A0xvcls/UZXqLQJYMCnCDBGcQ/rQILliYiRYYDup+nQrnd7f0LWHiUKyH?=
 =?us-ascii?Q?fkR5dWSxUX/hRxJf9v9iFtZfgWs1gKnQJML7HvctSdaXLmLadZIC2SyV9WsS?=
 =?us-ascii?Q?ytWpmyL1ojJAk63iZ2ULoZR5IgAkSS91IOjCneP16GeTiQxgP5nPUMfCbhcA?=
 =?us-ascii?Q?IubVPIe204UA5rZ9kBf78kcoScMhe7QAN6YQcwMhgKAcAb99XyOqQc5Ijn/n?=
 =?us-ascii?Q?W0tLsKx5tG/2TR79O9AbjVVdCn/BscKPrsXck8ZI1GcyJzKknZKwC0sIeIcs?=
 =?us-ascii?Q?6I6btQWji6+HtGKWxH8+3BfJSYl3EPA32UCXVF3akqY3R+wT5MS15lCiMC2T?=
 =?us-ascii?Q?spFylmH2MnJG4ZdzrsRn6y8NEb02mSKJzDmYeZEC92sKpP+uSiYLu8mv4jv8?=
 =?us-ascii?Q?TechWI2T9ypL7aEPCnIeuvYy1uW3AchLYKnC4PmNyvgG/JvvxEEQ2IyfhDRI?=
 =?us-ascii?Q?UV2VFN1heJOIWGeNk4ZqU+BwV55IMt/DkT4wYG2r+Y5mXoMFkoUJpYHSsfWO?=
 =?us-ascii?Q?8clVIKGzxKc5VCla9ZxEjzQ4ub4A5Q492gyrW++F0I0GwHJcdOxxP19SzkB8?=
 =?us-ascii?Q?rHviTFuCqDFXcLHqLWtY/dzr5i+zldkySHpUnQstO6fTJ1V7oE4b0d07PQJV?=
 =?us-ascii?Q?CL1rSsOFGg6qEWMyPp2A7BWOFxPFunUbHwAJMUP9Zs2+v8fI6lSV/RgLPonq?=
 =?us-ascii?Q?ShfRb1GU1/J+j8htB/4mFSD3Pe1cICZLifqtpgZK5wawWnCAPcf/gJiJoF2M?=
 =?us-ascii?Q?14SxyvNRPtBiYhOqOaiRGWUFYl72W9uez8t+peQShsir8xZ2jg2x6nrV1Z65?=
 =?us-ascii?Q?pn4NsVHlpak=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8fprrvIAE4xU07XC5M6x8oHoVRPl4Ke6FZkhYsjhGkPuw6W3Rx07MJ6ayL0k?=
 =?us-ascii?Q?Rpo50uAZ94qXFK3GIyY5AbDjyXzfdnszMJS2O25K60UsEoPTV1HA4zMt3pfj?=
 =?us-ascii?Q?9r4lqP+bjGiQT5ufHYKLXXTfJAKnfLffO8ZI0nGjZEU4KcT/Yyr1bNrZv49G?=
 =?us-ascii?Q?eQAyeCJz0XYQ0LMrsSIE8REXG8RDblcElPTfLRZkFX3oC2lpJRbXi69IuhLY?=
 =?us-ascii?Q?jW+Trj11Sr6il2YA1gggMjI6RFaV2gJXhlHdlr6csNm+4p3qQDeUMHC/CM41?=
 =?us-ascii?Q?s4jGz5L+TtcXsRs2DFqMkoZZTf3l00ulVvII1jn/PB/25n3J2ScHhbog+ooE?=
 =?us-ascii?Q?Z5RUr+e7EUB4bNWnUf7azmE27pMqXU8/w4C9qDdzjX80L+1MLVbDzNH+ETDS?=
 =?us-ascii?Q?1UkYdVSfrwRTZDE00tX/woe7yRPiDogpaP/zfysdoqnhCWUbHTCHgs1UFmFN?=
 =?us-ascii?Q?W/GiHNC4v3rgkXffXGFWT8/poxfcWT8hA6Ba0tw5Wk4YqANi5ZLyx2kB6vpE?=
 =?us-ascii?Q?GAeL7D5mslrciC8B5nM4bALCREdmJEqTl0MPbOmFSYzTJGBXayLqR5SKKoKL?=
 =?us-ascii?Q?ItYxvbWUPUX5cb/M6n78WbH2PtFoXe/v4CTrB0NZINk+2LcEkxUT+Hdk53xT?=
 =?us-ascii?Q?+y3d5x03kHCBgUOxwhDba9baeM/0eU18RMBdeJN4BKNvaNE1oL/hcYkoCgrU?=
 =?us-ascii?Q?jtqgZf4p5RCukBiG28ul8qbCmDjpYNeR02V44CJfo29IziBGyVpet7C972kC?=
 =?us-ascii?Q?UnC2Ben5SihJWOk3yhukCPGqVE5imkR8e4q7iphkIZpBXZk7GJYWB1XQcn2V?=
 =?us-ascii?Q?yhozlR2OZHfwAgC5gra1ErpZ//mj2V7dqfNZS4buaZIyOhnOItT8GkNywa6D?=
 =?us-ascii?Q?SsRHcNnjkR4yBNQisXWtzzARZZ7u/IPz6gK8cK8L48Ft9zzYN9gQEU7KtTfl?=
 =?us-ascii?Q?a3TFSEUEtP8A3RDTdepDjcKhEgjzLRK+6+Xdzsf9/HgC0wA/7pAwEZo7Lgvw?=
 =?us-ascii?Q?nCTP2oNF3rTUUJ/sTLbxqaSfud62Ik3yffRS7M3sR6IqjExsNEk7IHNXhYOj?=
 =?us-ascii?Q?0yWxN2qMFDuQE5H5r2zolWr0YSkM79nBjJe70Nhb/H4TgDbTk87/vXrXuaty?=
 =?us-ascii?Q?FKDNk7zl/2k2kgr8ulzIzfyiRimq8gBauDMjxLq4EDkaKu0ZXGDpLW9N9PQp?=
 =?us-ascii?Q?++cp0iVuo1cLWbnRL9Ui8s0nN8Pw1ZAGF+GV/XPJJOsd+9znLE3lBKYuv1yN?=
 =?us-ascii?Q?8AWZqFScbguKNd1V2BiFxWtpmljPMrNCnsJ4HFkhB8wnHb+iTOClbmEFe0Za?=
 =?us-ascii?Q?/ENkqtSyvB44SRO5g91YNMgR3klPLBVft3/njKxD+uoCCehHhooHSAS0+4rV?=
 =?us-ascii?Q?ziL1j6ZBGroONXfhIjzl7B4aPANkNvXnJXx50Js4CS4X8w0YUit9E9DAcIkv?=
 =?us-ascii?Q?M3IqhOqh+Gwkyw1QD1fxzzhRuoiGrjv6WbrHOoSu4ridJwWRGdibYu310oBm?=
 =?us-ascii?Q?nAK7QLYC2Hwyk8VJEgMX7xkaRy5kUruKMNFthIokuiGbzZnlzVhrYjKkt7RL?=
 =?us-ascii?Q?NxUCk86PTuHo0j8IT3efAU78G0Pjo0YMxj9lFOKRHhZFqIsrFAR05tS6LF7e?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A0LpfM7LBgeosqgad9aAVXVTwEPJn4XJXtVvWSNJ7yS5fZV8mo3kGAH2pOARhdF7OKSuqUj/52QCd10mvu4b+pZ9feOQNxGZUcmJv8IE/scIDRUJ3R70rJf4CAubf34TWKDsJb+V7jeFohkyEUlm3FLaSzVfeHlVO3ktCwN+qy9I+l3QcKGrEWRAmgQIHyn7xtndMI4kisFFAf1BQZwN57ZsKyYgTWHH8mVkB/EQnkgbmXB6am35GwtByyhxBrRBPRq2f6JFxorWROHx0gh3gxcisFnd9TjBiARV1lg/4jtfj4VDypRpCfhsYjNeePDjGjVcYPhrv0jrQowKvmB8WJ7hAfP032F4D5KkeBKVknApJBBUD58C+IQhO4rQiQNSqFeC05Yw6tMZRG24rrhFB3U35N/C6cvayxKdIrII3SNdS0xjiBXrmu4VxFi/XN4gy3MDG9+syLMap6c0F/jtmiRa9ws2Y5kmp5qUaDS0g602GGEDVTNGxOS8QbZaun2sRqlpOhBiR0Xz2cLKbEbTGdC9E1bTaTTvkBNk99dl6kjSm/oLxLzM0ZtYNUxt0bxO9H5xpMJyP12vAeVnotr+hpf/U2xjvz/Kk/LLTnv2DP4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9e3747-a06e-4cd6-823f-08dda58aa146
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:14:58.7251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMfp4EgR5NZPdNvD3xUiOEpCfuvV7cFIp1YV30a71JkEoNfrmfv8oa4Hbo0o8o8XXTxBiW/sYzkbn7aAapEibos3eTzqsF05rLwp8TAqZJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-ORIG-GUID: ho3VDhWncCwEsphO20I0751L8NBU9XaR
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=6843d8e7 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=_0qvgPiFTk_RQUkrPbQA:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfXzeZpDkNT8zx2 U5P96n8KhCeEUPS9iZUGnQd4uLQTX6TIqMRDk+xW7N2kmQXpwviWsqPsw2mG/NNMOMcnKNiKdRM xG4U205ah7Gp8xvDW7vYZ0PwFPIrDQNQq8afo/5GX0shRsd/K455q6zR3ccZdWIMcN9tqqtqSGe
 h6rCRwrhJZ64h38pvxdVcSm6kU8c1UJjXvPdnkuZX709FsopGzpAaA41lOPtV+plWmHhuQW2SoH kobDmXsWom2IT7yoycgm9x3x5JssMUWf0nLZIGi3GK4N23ifpPA/j837zDT5LCCG1ilRG930OFZ 70gNbTn61ssC6uQ9EK8qaxnOPupvamnWmfIcHSsU+kM94327J7xTsbDA4Eh3xvcSvk7pBiYW4z6
 jFlIWU6qIg1ruRhTiWVZlZjNWPB+XXHMnyhTKsriMIIFF3rUYh9g3OhFLKCXnnDCYvD8RU0M
X-Proofpoint-GUID: ho3VDhWncCwEsphO20I0751L8NBU9XaR

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_open.c    | 2 ++
 libdtrace/dt_version.h | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 51c056b2..0bda3504 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -42,6 +42,8 @@
 #include <dt_peb.h>
 #include <dt_pid.h>
 
+#include <dt_git_version.h>
+
 const dt_version_t _dtrace_versions[] = {
 	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */
 	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */
diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
index 3fd1b3d1..29094587 100644
--- a/libdtrace/dt_version.h
+++ b/libdtrace/dt_version.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2019, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -13,7 +13,6 @@ extern "C" {
 #endif
 
 #include <dt_ident.h>
-#include <dt_git_version.h>
 
 /*
  * Stability definitions
-- 
2.45.2

