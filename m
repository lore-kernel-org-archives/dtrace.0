Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACAD1B1D41
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 20:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724963931; cv=fail; b=mVhI0Dxmh/+z0u+CW9bgZSuj/8dOP6oHSvHEr2DhGPHVykz++ww+npja5Y8aIir8Z61CquSRReoCD9mLmyqSHJpVl7R7p3e+CsxabJUVY9zDcUsY8uVj74MAxG+NzgzKxgao7AG36KT4WkTaPXuasXJVfbo0NjSciQ2tJds6VAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724963931; c=relaxed/simple;
	bh=1UVced1/dht+CVS0bmP3PitR9Te8tJtNiqqMFeunAm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JD8FNKmB6PuBlNSEoaiQXO5P73Jamu2JYBHQc9R6ZZBNqqeeh14jNjVI/FgPyrzcV9Ym4xyP5dH9XuS1QzRm/42fvNfL/yyQy4amo+HxWyfsqomQt5TEHMVEXYGnyPmqmtySyAjJ/+3S6RUK4jbSZ/b8MuH/Aq+1c2zhF9Pla10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NZD7APiy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=f6oWTpYr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NZD7APiy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="f6oWTpYr"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TKO4BJ002121;
	Thu, 29 Aug 2024 20:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=rAY4BGIzeQRrBKy
	MofUn9+WkL1VeONAhn1E4Coiyei8=; b=NZD7APiycdcahSc93CidODzSXPu41fg
	j2hNNSFdwQKRdRdN92rzEX1mHzHn5lhYRbeibdk5quTpxDNVs1/PbZovOz982oSg
	7g35jOWe4t2YzxEo7/evE/FPzqXBTLqBv7zHRX4mla8J19Ylo8hsKfrXiSsVcdpx
	Am/uNooamNVc/Uj7OmNwgOKqVTBZSQSzpsxKPLLSz1iaCk1l1iyZKz4ec5Z0ejIz
	y4PY7rJpUePkD1hjqwN+4pH7QjitJD+CzsIqd71ykg8/c6Ru5und0GxMa1G93VjH
	URYiRmrOY/U5xfWGb5O1i1RAw6/TH4gJLuN8IS0ciTP89TmhRA/Vgog==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41aw8srf49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2024 20:38:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47TJKucX016694;
	Thu, 29 Aug 2024 20:38:45 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5vn99m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Aug 2024 20:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3vSwvrDTOMOXN8Ng8BGD7DPz189iU5Mv2PVAdAFAIc77oHuFsDdhgQo79TQQTxS6L7qN6w7MaOxWhxP+fD7QR2gc6ZLGwxrY41RXVP2C3DUsIjQjbTaGlMxLJTMZvw4ysg+IwadHGbSuBleAU92sFo+2PBifsZxlUQzCWXC8dZ90QM0ci9PWAmeYj4PnejLDKksqqQAEqvIMb2KgjtdNgATonj9Du5w6uxFCROcaHcsDB164rHcVpudTE796qGw6dwhOygMw5NpXSunTUyrFa59aWHA/jgGmCf2J+DjeR6cuOddb5xTblcuN2+zQArZem601BuwhgVXKHGMTO8uig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAY4BGIzeQRrBKyMofUn9+WkL1VeONAhn1E4Coiyei8=;
 b=iQ+9QcKQjypC+ghw1f9sDcFd78UEPRS5Qg6VhNe27WXuN9szF31YR2WGDoVcCm7jeZS8hI4D8cCxCF4AMn3F/8UiG3AqR/Kc/cAAv1WRhs116Nc9uiz2l90ohzLNLMrWrc72gOhMbyUlCLF4LRK/Yn5QBKPFlb62Bwv9QDK8lihmd9s/dcosTD6H5/ocC7QuBcIj0HmTowEIoldcAwGJK0FYmWJjbRElkAXHKZZGp/bRyjZIkjvQYId4wkMzvmFpARbUYdtBzlxAvPnzff0uI3qx+9Mqukgcz5PAv9GUv3NB3wtJWEAFxewa8T3QgZgbmJ3LvnxBLXjTXVMCsnWxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAY4BGIzeQRrBKyMofUn9+WkL1VeONAhn1E4Coiyei8=;
 b=f6oWTpYrFIBS9iPMBV8nMVOLfMRLRdrwOXJ8AWJZO0DYfis+jW6ODKkpYovvSaV7zTe1ARSwet4RgcokFtpiEVI8QldtVvPGMcCmdIwKmmOrp+cdeDgK7yvpzhB7fiSbncu85VtlbHwshlgtGb2V5roX3N0MdDNsEWMQZkIexKo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN6PR10MB8142.namprd10.prod.outlook.com (2603:10b6:208:4fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 20:38:38 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Thu, 29 Aug 2024
 20:38:38 +0000
Date: Thu, 29 Aug 2024 16:38:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>,
        dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 03/19] Widen the EPID to include the PRID
Message-ID: <ZtDcSrMag/6RalaQ@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-3-eugene.loh@oracle.com>
 <87ttf3f50j.fsf@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttf3f50j.fsf@gentoo.org>
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN6PR10MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b535746-1623-4fe7-2d3c-08dcc86a8f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OCD0LuTqANpdztwH76+BDakMx0wkDKi4hyXZf7Uc9JaCprm4Bp5ptvHGZF7I?=
 =?us-ascii?Q?BEIqauH2DARBMF+iI0bD9xY+8PTtlpN9eU1ClP3uQCGw4Di5oP58KufuaX9B?=
 =?us-ascii?Q?KB0S6cuq0q5o1cdsIDrX3rXZZNtPAAhrmAEgzfnyR1Kdmi/JuKnJ+e8TRMGz?=
 =?us-ascii?Q?+AchuzrKYxVQ3fv+z/HVNDpXxGoym0poOr8UwNxbtseRVuRBuo8uVLVF+sCM?=
 =?us-ascii?Q?9JFK4XMP0yAFSgEkyTQkTq5SU9CBlPEzlcZOwFUhi0/tlfBz9+SoGZyVkSnV?=
 =?us-ascii?Q?EB7c/hUxJPty1j1c/QAVwn4LNGwUlAMebD47qDAQh9CIed/VVB1FFUyv1SVh?=
 =?us-ascii?Q?tdP9xmbZvOFWqFQ0cgWPIizhr9U/ouFPaC971zSrTq6+EWB00L3M6pQM9FvM?=
 =?us-ascii?Q?Wezcj+5cyjEaohFFMoRuF5VPeULHL2vlvfWG4xSwffP47YmlilEw6Y+YF6Tk?=
 =?us-ascii?Q?QbMpLShC5t2VXGJOGapplqKdqA4bJwz95KFvOLq0AV9qtsad11FPYpI6Adnf?=
 =?us-ascii?Q?sTHyvsRwQEBcc4BCH+uWncRXMs42XvuRxIGt6aKmzhfW5wyqow2BiTGVFfiw?=
 =?us-ascii?Q?mOAl0A6+7TkTm51eYAMeCHfUDf9KDENLhOCM0j8h8ajENUpLLEmBKsFyz5aS?=
 =?us-ascii?Q?nBHYcKD3UuMgI+ASqS2DEL31J252LQWQoc8+ILiD5Ypr2C+hgR69+n8Lzb+V?=
 =?us-ascii?Q?1mR2UEGOqESisnsdkqVYGuA5JMSPDhvKkZJqqf3jMkqL1on0o7OUQrXW5+8E?=
 =?us-ascii?Q?kQnkmBFmTC8LQi3m7LHYlJ56KTQVHWP7DN0GzZHZDRJtbPtokfcpskEk3jqI?=
 =?us-ascii?Q?kNfO3zpGWA+xXCqDF3vDWRjSYssDsU/oIPgeyEFmKjK6U1iCb270IJCHBb+1?=
 =?us-ascii?Q?ECQlho0/1K5zcniFduZxUTiYr/tpYlmf1fj2LW5OR1RUD577o1Og9F7b5Dxa?=
 =?us-ascii?Q?MPX6ue2zzugx3zFzSi08vkcaXQ9lf6QpEUcY68cT3mgyT8bD/gPUl/uTnve+?=
 =?us-ascii?Q?zgSbkc5NWOldga4aAWSqD8OqAC0bgij9866AN6Pixuq7YmxgPJWLdBoIBx55?=
 =?us-ascii?Q?5+msb3N8qyGL34HyZN2+cqTSU8NVU8GtAYNIQGKbwhaM0ny49ZLXyD/YmH7J?=
 =?us-ascii?Q?wvImVPtfB/l52QApZCnq1M6hUgGC8P0b6ZdiTRYZMAvqGDdsucAlms33bErl?=
 =?us-ascii?Q?uKy1BGn76S3JKyb8BvvVxue+9/ve5KhahdG9YateBKaRPOzdbeNjM8zOG9mx?=
 =?us-ascii?Q?ae6P2xu3vFNDalpdYwmS7ITg1/I1p7Dz3Tw9AlnwRHyF76BQlNMzeLKihPOs?=
 =?us-ascii?Q?oxZn3TnS+Wces6vN8I6c9WI11EtFeHDQzqyXCW5inufyuw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w7TGUkY0NzsJ/PcdQmsQtHj1Wk+Xxw8nVwVX80gMJoJfskT0Va22yzsS7RUy?=
 =?us-ascii?Q?uNL8cmiQn1SYC1tuRuq796gJj/MPwqlQahaxLxBvEGJtXkiNpJqWgZrVLPDd?=
 =?us-ascii?Q?fTXac2p7sBTTEXO9pzQURZt4rJ4kFpZiCblt0qtaGHNeJm4uwNLQZ29+D07S?=
 =?us-ascii?Q?zoR06FWAdKZRQ30s82d96HvQgokWqEq3rBDgZ73KjGX1O1zhYBD3XYYwobz/?=
 =?us-ascii?Q?ljoZBR+piTrFFP1pSxx3wuS1cpZ4rbXwLQYJF1clLVFowQri+YqWCRBlRq2l?=
 =?us-ascii?Q?UCUOu7fvJF/DgNGTXmy+iaR1SWbFByA/Q9KAhTwWKM1ppezX9jRYsg4zEyRk?=
 =?us-ascii?Q?9pFege29tdfajDgaeRbCHnjKOE9HdChmJQnplFQKPu68BL8N+MKCmbI5Emcm?=
 =?us-ascii?Q?JAS9gUR1Qc4fszCF0m1upA8jgRfoJd64JLDM9/cLVvetPueIfiYavNbqVqk0?=
 =?us-ascii?Q?J+SbjvRD8DDUCBnWQRYLjlO3IMGVByreh24nP3EYCxrhDLipnCvbfNv4qcrA?=
 =?us-ascii?Q?kNdr3cFMtztLZJrdc7ZFy2py8Ni4QYv+ALVOS0+rC7j1eZUKjuhn3oBuZRc6?=
 =?us-ascii?Q?02PeJwiI4juEAbVNkdC8IGXSSVYKXQT/7TUvaZ5UJ5L84i9FVdA8/BX5xEZv?=
 =?us-ascii?Q?RC24ird8z6xBWnEECRarunZMGlvtCgj9pL+Xp67r3E1jTBtI2EGlRxMN1YCB?=
 =?us-ascii?Q?I1qXRnmUT5FZ0Nf+4oH5/2XNo2x01Tco054tLQf+rkfIi1S6ue7GOIZ7BU8g?=
 =?us-ascii?Q?zuEoUV5DxpkrR0TBgunWThruQIFbI09CTPD8dmnDno5aMY3D9nVjrEsKv45a?=
 =?us-ascii?Q?yxKpdJZly3WXF4B4EivZse/FphOhl16L8ta5AX5aHxiev+kXGVo3sN3wZXGB?=
 =?us-ascii?Q?4mKp1xtXL7WvYtUq6mmtMbnM/IbM2Lwsipm2+2sVGTIjmSDFPejqaTDhQc9i?=
 =?us-ascii?Q?UTyAl3dm06RWYLOWgpYZIEvnNxhnA1oFDMBlKohCQRA9QFx91BgUgOSufx3h?=
 =?us-ascii?Q?LBDYJXLho6U3ULRQj2FwFNO+uQZUnIqxfKty9SPc8+3LWsuol4nn2Tm/fpza?=
 =?us-ascii?Q?K/WPvTmR0Km/Szdhh3GjzX6tgUZLsYF8PiNIRtnpiOhH6wz+kVv04ugCNXEi?=
 =?us-ascii?Q?LSQFts4Zn8UQEZ0ay70GOLa1vq7CJNyX4MsaE+fMVnmsIUA+gINR/ITl7fra?=
 =?us-ascii?Q?LtoOwzZd5p4iSxf7p1whFFp32h5krI7vdw27bIycAHu39E5bV5x8uK9OUNSr?=
 =?us-ascii?Q?v3EpoK4VUUptzwt5y4sr1D619mAOqPNXAGc3XjEVxgdbior1Rqkzq8bt8C7n?=
 =?us-ascii?Q?9gSt2N+Kw2IMZaiS60IQdM9Sdxx3xiTPgUmLx/x5Dxo1ud0iaOdtKmIHVZtb?=
 =?us-ascii?Q?+JBGUBUa04i8UFpD59dkiXE5S6LIjtvzhOH8IFg3zbfh8GCEJoI9yafVPpWR?=
 =?us-ascii?Q?6pvSCt+rSLYJjCxlvThpuFJSoN2khd4aH4xhk+cJzivXtdy9NoZUIlvKDypS?=
 =?us-ascii?Q?Ci0m3F6REv3GOMY12EhchfR00CcVWc5r7YuOV0Q+cpyeSZ+dfFT/J4G0O+Vo?=
 =?us-ascii?Q?lnZceKUdTESYa47xxp3Jw/ikcyZdp4ponOoPLaRQkwrkybN9IpJ4jriWH6yh?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZGUGhQkvFDq/L2kODHkk8D9ryeQtu0BLBLVG1L7s1KpnoMgBkpklw9OJdc/FqFCXs2SjyC9lbxBCwHpeQUP/JhCa6TuAbo51QT/eMx7qTzkoXkKMveOIbhhWR+EwroI/KsJS/JX0l5dOb5tidr9Kt8LzZoAIxuhdmJNCRp+qFnGSNS2ce88iDSTMWNaPLjhIaQwqQz+E4mEZiuGufvJ7c0Nx8II1k3Pwz98Q1v7EsKMWbI92plfYVqooVmrm8S7gtnAlZ+fJnG1f0/X3n5AZwB+OrQLDvtc24DWVqZYZRLxJKKwl4gkTjilGjUSeVxXC9AJyrLIgpwWLV+P1xHJNimw8GctZwqdRkfQO4llrIxq3zKN0kY7IozTgPTVPzU/xXZPi8tQiGxWQHZxb+P8rcAWcNwUS6uThNl5X6FUzncXWVevUh+CQS7krC25WqaUuB000ddQBUnCYIAPh3K2IGiFA46S73QqTQVhX9iYu16LJd87VWDyhdzsgUPEkRZ5XpvIwFznum0kRiSqRX60hqIl25tBFPPRAIPRnRWNlMKm3TBatjeuCh1nc8xdCyzy8N89NLagXXXtpFwd3XnrVBXDk9SqUFW1WAAtAZYgKz/k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b535746-1623-4fe7-2d3c-08dcc86a8f90
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 20:38:38.2396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IR+hgmRlMQgGF0eXeyEWDVNAuiNp5i9HmneCsVWxuTaIMR4EnZYug0y34Akvzk1QRV3n9+aTLyP6rpuABOTLC2X2J00qufgTJdL7t6PeV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8142
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290146
X-Proofpoint-ORIG-GUID: t-LjlVZmcc8a2-l8YcYn8GdNgTU0nV86
X-Proofpoint-GUID: t-LjlVZmcc8a2-l8YcYn8GdNgTU0nV86

On Thu, Aug 29, 2024 at 09:28:12PM +0100, Sam James wrote:
> "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com> writes:
> 
> > From: Eugene Loh <eugene.loh@oracle.com>
> >
> > Each output record has an EPID associated with it.  When the consumer
> > reads a record, it uses the EPID to look up both a PRID (so it can
> > report PRID and probe function and name) and a data description.
> > During code generation, the PRID and data description are known,
> > and so the EPID is set during relocation.
> >
> > However, we want to support underlying probes that trigger for PRIDs
> > that will be discovered at run time.  So, expand the EPID to 64 bits:
> >
> > *)  the lower half, known at code generation, will index into an
> >     array dtp->dt_stmts[] of statements, which have information
> >     about probe descriptions, data descriptions, and clauses to call
> >
> > *)  the upper half will have the PRID, which will be discovered
> >     at run time
> >
> > Statement descriptions include a new member dtsd_index, which is
> > the index to dtp->dt_stmts[].
> >
> > The consumer gets information about the firing probe from the PRID,
> > an index to dtp->dt_probes[].
> >
> > The lower half "EPID" depends only on the statement and no longer
> > on the specific probe that is firing.  Its value is known at code
> > generation for a compiled clause.  It no longer needs to be set in
> > relocation;  that relocation will be removed in a future patch.
> >
> > The buffer memory pointed to by dctx->buf is rearranged so that EPID
> > will (still) fall on an 8-byte boundary but now take up 8 bytes.
> >
> > We do not need to expand:
> >
> > - the mstate (since it already had the PRID)
> >
> >   Rename mstate's epid to be a statement ID, stid.  When
> >   the producer needs the epid, it can construct it from
> >   mst->prid and mst->stid.
> >
> > - the output buffer (since it already had unused padding)
> >
> > The new, wider EPID is seen for the built-in variable epid as well
> > as the epid that the consumer reads.
> >
> > The probe descriptions dt_pdesc become superfluous and will be
> > eliminated in a future patch.
> >
> > Update test files:
> >
> > - Where the upper 32 bits of the EPID are known (since the PRID
> >   corresponds to a dtrace::: probe), update the expected EPID in
> >   the .r files.
> >
> > - Where the upper 32 bits of the EPID are not known, add .r.p
> >   processing to filter those bits out before comparing to known
> >   results in .r files.
> >
> > - Increase expected EPID width.
> >
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  bpf/get_bvar.c                                |  6 ++-
> >  bpf/probe_error.c                             |  2 +-
> >  include/dtrace/universal.h                    |  2 +-
> >  libdtrace/dt_bpf.c                            |  2 -
> >  libdtrace/dt_cc.c                             | 13 ++---
> >  libdtrace/dt_cg.c                             | 49 +++++++++++--------
> >  libdtrace/dt_consume.c                        | 28 +++++++----
> >  libdtrace/dt_dctx.h                           | 16 +++---
> >  libdtrace/dt_handle.c                         |  9 ++--
> >  libdtrace/dt_impl.h                           |  1 +
> >  libdtrace/dt_map.c                            | 11 +++--
> >  libdtrace/dt_open.c                           |  2 +-
> >  libdtrace/dt_program.c                        |  7 +++
> >  libdtrace/dtrace.h                            |  1 +
> >  test/demo/dtrace/error.r                      |  2 +-
> >  test/stress/buffering/tst.resize3-manual.r    |  2 +-
> >  test/stress/buffering/tst.resize3.r           |  2 +-
> >  test/unittest/actions/setopt/tst.badopt.r     | 14 +++---
> >  .../arrays/tst.declared-bounds.runtime_out.r  |  2 +-
> >  test/unittest/codegen/err.deref_0.r           |  2 +-
> >  test/unittest/codegen/err.deref_1.r           |  2 +-
> >  test/unittest/codegen/err.deref_i0.r          |  2 +-
> >  test/unittest/codegen/err.deref_i1.r          |  2 +-
> >  .../unittest/codegen/err.deref_string-assoc.r |  2 +-
> >  test/unittest/codegen/err.deref_string-gvar.r |  2 +-
> >  test/unittest/codegen/err.deref_string-lvar.r |  2 +-
> >  test/unittest/codegen/err.deref_string-tvar.r |  2 +-
> >  .../codegen/err.str_NULL_plus_offset-assoc.r  |  2 +-
> >  .../codegen/err.str_NULL_plus_offset-lvar.r   |  2 +-
> >  .../codegen/err.str_NULL_plus_offset-tvar.r   |  2 +-
> >  .../codegen/err.str_NULL_plus_offset.r        |  2 +-
> >  test/unittest/disasm/tst.vartab-bvar.r        |  2 +-
> >  test/unittest/drops/drp.DTRACEDROP_DBLERROR.r |  2 +-
> >  .../tst.DTRACEFLT_BADADDR.null_ptr_field.r    |  2 +-
> >  test/unittest/error/tst.DTRACEFLT_BADADDR.r   |  4 +-
> >  test/unittest/error/tst.DTRACEFLT_BADADDR2.r  |  4 +-
> >  .../error/tst.DTRACEFLT_DIVZERO.div.r         |  2 +-
> >  .../error/tst.DTRACEFLT_DIVZERO.mod.r         |  2 +-
> >  test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |  4 +-
> >  .../error/tst.clause_scope-begin-ended.r      |  2 +-
> >  test/unittest/error/tst.clause_scope-begin.r  |  2 +-
> >  .../unittest/error/tst.clause_scope-regular.r |  2 +-
> >  .../error/tst.clause_scope-regular.r.p        | 12 ++++-
> >  test/unittest/error/tst.error.r               |  2 +-
> >  test/unittest/error/tst.errorend.r            |  2 +-
> >  .../alloca/err.alloca-bcopy-before-beyond.r   |  2 +-
> >  .../alloca/err.alloca-bcopy-before-bottom.r   |  2 +-
> >  .../alloca/err.alloca-bcopy-beyond-top.r      |  2 +-
> >  .../alloca/err.alloca-bcopy-crossing-bottom.r |  2 +-
> >  .../alloca/err.alloca-bcopy-crossing-top.r    |  2 +-
> >  .../alloca/err.alloca-crossing-clauses.r      |  2 +-
> >  .../alloca/err.alloca-load-before-bottom.r    |  2 +-
> >  .../funcs/alloca/err.alloca-load-beyond-top.r |  2 +-
> >  .../alloca/err.alloca-load-crossing-bottom.r  |  2 +-
> >  .../alloca/err.alloca-null-deref-lvalue.r     |  2 +-
> >  .../funcs/alloca/err.alloca-null-deref.r      |  2 +-
> >  .../err.alloca-scratch-exceeding-bcopy.r      |  2 +-
> >  .../alloca/err.alloca-store-before-bottom.r   |  2 +-
> >  .../alloca/err.alloca-store-beyond-top.r      |  2 +-
> >  .../alloca/err.alloca-store-crossing-bottom.r |  2 +-
> >  test/unittest/funcs/bcopy/err.badbcopy1.r     |  2 +-
> >  test/unittest/funcs/bcopy/err.badbcopy4.r     |  2 +-
> >  test/unittest/funcs/bcopy/err.badbcopy5.r     |  2 +-
> >  test/unittest/funcs/bcopy/err.badbcopy6.r     |  2 +-
> >  test/unittest/funcs/bcopy/err.badbcopy7.r     |  2 +-
> >  test/unittest/funcs/bcopy/err.badbcopy8.r     |  2 +-
> >  test/unittest/funcs/copyin/err.badaddr.r      |  2 +-
> >  test/unittest/funcs/copyin/err.null_arg1.r    |  2 +-
> >  test/unittest/funcs/copyinstr/err.badaddr.r   |  2 +-
> >  test/unittest/funcs/copyinstr/err.null_arg1.r |  2 +-
> >  test/unittest/funcs/copyinto/err.badaddr.r    |  2 +-
> >  test/unittest/funcs/copyinto/err.badsize.r    |  2 +-
> >  test/unittest/funcs/copyinto/err.null_arg1.r  |  2 +-
> >  test/unittest/funcs/err.badalloca.r           |  2 +-
> >  test/unittest/funcs/err.badalloca.r.p         | 12 ++++-
> >  test/unittest/funcs/err.link_ntopbadaddr.r    |  2 +-
> >  test/unittest/funcs/err.link_ntopbadarg.r     |  2 +-
> >  .../inet_ntoa6/err.inet_ntoa6.arg1_null.r     |  2 +-
> >  .../err.inet_ntoa6.arg1_null_const.r          |  2 +-
> >  test/unittest/funcs/strlen/tst.null.r         |  2 +-
> >  test/unittest/funcs/strtok/tst.strtok_null.r  |  2 +-
> >  .../funcs/strtok/tst.strtok_nulldel.r         |  2 +-
> >  .../funcs/strtok/tst.strtok_nullstr.r         |  2 +-
> >  .../funcs/strtok/tst.strtok_nullstr2.r        |  2 +-
> >  .../funcs/substr/err.substr_null_arg1.r       |  2 +-
> >  test/unittest/pointers/err.AllocaOverrun.r    |  2 +-
> >  test/unittest/pointers/err.BadAlign.r         |  2 +-
> >  test/unittest/pointers/err.InvalidAddress2.r  |  2 +-
> >  test/unittest/pointers/err.InvalidAddress4.r  |  2 +-
> >  .../speculation/err.CommitWithInvalid.r       |  2 +-
> >  .../speculation/err.DiscardWithInvalid.r      |  2 +-
> >  test/unittest/speculation/tst.negcommit.r     |  2 +-
> >  92 files changed, 197 insertions(+), 146 deletions(-)
> >
> > diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> > index a0c04f3a..e9733bb1 100644
> > --- a/bpf/get_bvar.c
> > +++ b/bpf/get_bvar.c
> > @@ -48,8 +48,10 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
> >  			mst->tstamp = bpf_ktime_get_ns();
> >  
> >  		return mst->tstamp;
> > -	case DIF_VAR_EPID:
> > -		return mst->epid;
> > +	case DIF_VAR_EPID: {
> > +		uint64_t val = mst->prid;
> > +		return (val << 32) | mst->stid;
> > +	}
> >  	case DIF_VAR_ID:
> >  		return mst->prid;
> >  	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
> > diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> > index ee1a1793..fba779a8 100644
> > --- a/bpf/probe_error.c
> > +++ b/bpf/probe_error.c
> > @@ -29,7 +29,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
> >  	int		oldprid = mst->prid;
> >  
> >  	mst->argv[0] = 0;
> > -	mst->argv[1] = mst->epid;
> > +	mst->argv[1] = (((uint64_t)mst->prid) << 32) | mst->stid;
> >  	mst->argv[2] = mst->clid;
> >  	mst->argv[3] = pc;
> >  	mst->argv[4] = fault;
> > diff --git a/include/dtrace/universal.h b/include/dtrace/universal.h
> > index d6562489..655ea772 100644
> > --- a/include/dtrace/universal.h
> > +++ b/include/dtrace/universal.h
> > @@ -37,7 +37,7 @@ typedef uint16_t	dtrace_actkind_t;	/* action kind */
> >  
> >  typedef uint32_t	dtrace_aggid_t;		/* aggregation identifier */
> >  typedef uint32_t	dtrace_cacheid_t;	/* predicate cache identifier */
> > -typedef uint32_t	dtrace_epid_t;		/* enabled probe identifier */
> > +typedef uint64_t	dtrace_epid_t;		/* enabled probe identifier */
> >  typedef uint32_t	dtrace_optid_t;		/* option identifier */
> >  typedef uint32_t	dtrace_specid_t;	/* speculation identifier */
> >  
> > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > index 70597d65..3f9c42ea 100644
> > --- a/libdtrace/dt_bpf.c
> > +++ b/libdtrace/dt_bpf.c
> > @@ -774,7 +774,6 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
> >   * The size of the memory region is the sum of:
> >   *	- size of the DTrace machine state, rounded up to the nearest
> >   *	  multiple of 8
> > - *	- 8 bytes padding for trace buffer alignment purposes
> >   *	- maximum trace buffer record size, rounded up to the nearest
> >   *	  multiple of 8
> >   *	- size of dctx->mem (see dt_dctx.h)
> > @@ -783,7 +782,6 @@ static int
> >  gmap_create_mem(dtrace_hdl_t *dtp)
> >  {
> >  	size_t	sz = roundup(sizeof(dt_mstate_t), 8) +
> > -		     8 +
> >  		     roundup(dtp->dt_maxreclen, 8) +
> >  		     DMEM_SIZE(dtp);
> >  
> > diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> > index d1ee3843..cf3c5504 100644
> > --- a/libdtrace/dt_cc.c
> > +++ b/libdtrace/dt_cc.c
> > @@ -123,6 +123,7 @@ dt_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp,
> >  	if (sdp == NULL)
> >  		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
> >  
> > +	sdp->dtsd_index = dtp->dt_clause_nextid++;
> >  	assert(yypcb->pcb_stmt == NULL);
> >  	yypcb->pcb_stmt = sdp;
> >  	yypcb->pcb_maxrecs = 0;
> > @@ -133,8 +134,8 @@ dt_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp,
> >  	return sdp;
> >  }
> >  
> > -static dt_ident_t *
> > -dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
> > +static void
> > +dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp, dtrace_stmtdesc_t *sdp)
> >  {
> >  	char		*name;
> >  	int		len;
> > @@ -156,12 +157,12 @@ dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
> >  	/*
> >  	 * Generate a symbol name.
> >  	 */
> > -	len = snprintf(NULL, 0, "dt_clause_%d", dtp->dt_clause_nextid) + 1;
> > +	len = snprintf(NULL, 0, "dt_clause_%d", sdp->dtsd_index) + 1;
> >  	name = dt_alloc(dtp, len);
> >  	if (name == NULL)
> >  		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
> >  
> > -	snprintf(name, len, "dt_clause_%d", dtp->dt_clause_nextid++);
> > +	snprintf(name, len, "dt_clause_%d", sdp->dtsd_index);
> >  
> >  	/*
> >  	 * Add the symbol to the BPF identifier table and associate the DIFO
> > @@ -174,7 +175,7 @@ dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
> >  
> >  	dt_ident_set_data(idp, dp);
> >  
> > -	return idp;
> > +	sdp->dtsd_clause = idp;
> >  }
> >  
> >  static void
> > @@ -214,7 +215,7 @@ dt_compile_one_clause(dtrace_hdl_t *dtp, dt_node_t *cnp, dt_node_t *pnp)
> >  	 * Compile the clause (predicate and action).
> >  	 */
> >  	dt_cg(yypcb, cnp);
> > -	sdp->dtsd_clause = dt_clause_create(dtp, dt_as(yypcb));
> > +	dt_clause_create(dtp, dt_as(yypcb), sdp);
> >  
> >  	assert(yypcb->pcb_stmt == sdp);
> >  	if (dtrace_stmt_add(yypcb->pcb_hdl, yypcb->pcb_prog, sdp) != 0)
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index a7861829..2c559868 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -277,15 +277,9 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
> >  	 *	buf = rc + roundup(sizeof(dt_mstate_t), 8);
> >  	 *				// add %r0, roundup(
> >  	 *						sizeof(dt_mstate_t), 8)
> > -	 *	*((uint64_t *)&buf[0]) = 0;
> > -	 *				// stdw [%r0 + 0], 0
> > -	 *	buf += 8;		// add %r0, 8
> > -	 *				//     (%r0 = pointer to buffer space)
> >  	 *	dctx.buf = buf;		// stdw [%r9 + DCTX_BUF], %r0
> >  	 */
> >  	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, roundup(sizeof(dt_mstate_t), 8)));
> > -	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, 0, 0));
> > -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, 8));
> >  	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, DCTX_BUF, BPF_REG_0));
> >  
> >  	/*
> > @@ -1057,10 +1051,8 @@ static void
> >  dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
> >  {
> >  	dt_irlist_t	*dlp = &pcb->pcb_ir;
> > -	dt_ident_t	*epid = dt_dlib_get_var(pcb->pcb_hdl, "EPID");
> >  	dt_ident_t	*clid = dt_dlib_get_var(pcb->pcb_hdl, "CLID");
> >  
> > -	assert(epid != NULL);
> >  	assert(clid != NULL);
> >  
> >  	/*
> > @@ -1093,18 +1085,22 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
> >  	 *				// stdw [%r0 + DMST_FAULT], 0
> >  	 *	dctx->mst->tstamp = 0;	// stdw [%r0 + DMST_TSTAMP], 0
> >  	 *	dctx->mst->specsize = 0;// stdw [%r0 + DMST_SPECSIZE], 0
> > -	 *	dctx->mst->epid = EPID;	// stw [%r0 + DMST_EPID], EPID
> > +	 *	dctx->mst->stid = STID;	// stw [%r0 + DMST_STID], STID
> >  	 *	dctx->mst->clid = CLID;	// stw [%r0 + DMST_CLID], CLID
> > -	 *	*((uint32_t *)&buf[DBUF_EPID]) = EPID;
> > -	 *				// stw [%r9 + DBUF_EPID], EPID
> >  	 */
> >  	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
> >  	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_FAULT, 0));
> >  	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_TSTAMP, 0));
> >  	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_SPECSIZE, 0));
> > -	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_EPID, -1), epid);
> > +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_STID, pcb->pcb_stmt->dtsd_index));
> >  	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_CLID, -1), clid);
> > -	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_EPID, -1), epid);
> > +
> > +	/*
> > +	 *	Zero out the leading 4 bytes of the buffer.
> > +	 *	*((uint32_t *)&buf[DBUF_PAD]) = 0;
> > +	 *				// stw [%r9 + DBUF_PAD], 0
> > +	 */
> > +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_PAD, 0));
> >  
> >  	/*
> >  	 *	Set the speculation ID field to zero to indicate no active
> > @@ -1114,6 +1110,18 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
> >  	 */
> >  	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_SPECID, 0));
> >  
> > +	/*
> > +	 *	*((uint64_t *)&buf[DBUF_EPID]) = (dctx->mst->prid << 32) | stid;
> > +	 *				// ld %r1, [%r0 + DMST_PRID]
> > +	 *				// lsh %r1, 32
> > +	 *				// or %r1, stid
> > +	 *				// stdw [%r9 + DBUF_EPID], %r1
> > +	 */
> > +	emit (dlp, BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, DMST_PRID));
> > +	emit (dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_1, 32));
> > +	emit (dlp, BPF_ALU64_IMM(BPF_OR, BPF_REG_1, pcb->pcb_stmt->dtsd_index));
> > +	emit (dlp, BPF_STORE(BPF_DW, BPF_REG_9, DBUF_EPID, BPF_REG_1));
> > +
> >  	/*
> >  	 * If there is a predicate:
> >  	 *
> > @@ -1132,10 +1140,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
> >  	TRACE_REGSET("Prologue: End  ");
> >  
> >  	/*
> > -	 * Account for 32-bit EPID (at offset 0) and 32-bit speculation ID (at
> > -	 * offset 4).
> > +	 * Set the offset for the beginning of trace data.
> >  	 */
> > -	pcb->pcb_bufoff += 2 * sizeof(uint32_t);
> > +	pcb->pcb_bufoff = DBUF_DATA;
> >  }
> >  
> >  /*
> > @@ -1170,15 +1177,15 @@ dt_cg_epilogue(dt_pcb_t *pcb)
> >  		/*
> >  		 *	rc = bpf_perf_event_output(dctx->ctx, &buffers,
> >  		 *				   BPF_F_CURRENT_CPU,
> > -		 *				   buf - 4, bufoff + 4);
> > +		 *				   buf + 4, bufoff - 4);
> >  		 *				// lddw %r1, [%fp + DT_STK_DCTX]
> >  		 *				// lddw %r1, [%r1 + DCTX_CTX]
> >  		 *				// lddw %r2, &buffers
> >  		 *				// lddw %r3, BPF_F_CURRENT_CPU
> >  		 *				// mov %r4, %r9
> > -		 *				// add %r4, -4
> > +		 *				// add %r4, 4
> >  		 *				// mov %r5, pcb->pcb_bufoff
> > -		 *				// add %r5, 4
> > +		 *				// add %r5, -4
> >  		 *				// call bpf_perf_event_output
> >  		 */
> >  		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_FP, DT_STK_DCTX));
> > @@ -1186,9 +1193,9 @@ dt_cg_epilogue(dt_pcb_t *pcb)
> >  		dt_cg_xsetx(dlp, buffers, DT_LBL_NONE, BPF_REG_2, buffers->di_id);
> >  		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_3, BPF_F_CURRENT_CPU);
> >  		emit(dlp, BPF_MOV_REG(BPF_REG_4, BPF_REG_9));
> > -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, -4));
> > +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, 4));
> >  		emit(dlp, BPF_MOV_IMM(BPF_REG_5, pcb->pcb_bufoff));
> > -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, 4));
> > +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, -4));
> >  		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_perf_event_output));
> >  
> >  		/*
> > diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> > index 51eb6c80..e3ce2d3b 100644
> > --- a/libdtrace/dt_consume.c
> > +++ b/libdtrace/dt_consume.c
> > @@ -15,9 +15,11 @@
> >  #include <alloca.h>
> >  #include <dt_impl.h>
> >  #include <dt_aggregate.h>
> > +#include <dt_dctx.h>
> >  #include <dt_module.h>
> >  #include <dt_pcap.h>
> >  #include <dt_peb.h>
> > +#include <dt_probe.h>
> >  #include <dt_state.h>
> >  #include <dt_string.h>
> >  #include <libproc.h>
> > @@ -479,7 +481,7 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
> >  	 */
> >  	if (flow == DTRACEFLOW_ENTRY) {
> >  		if (last != DTRACE_EPIDNONE && id != last &&
> > -		    pd->id == dtp->dt_pdesc[last]->id)
> > +		    pd->id == dtp->dt_probes[last >> 32]->desc->id)
> >  			flow = DTRACEFLOW_NONE;
> >  	}
> >  
> > @@ -2184,19 +2186,23 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
> >  		     int peekflags, dtrace_epid_t *last, int committing,
> >  		     void *arg)
> >  {
> > +	int			specid;
> >  	dtrace_epid_t		epid;
> > +	uint32_t		prid;
> >  	dtrace_datadesc_t	*epd;
> >  	dt_spec_buf_t		tmpl;
> >  	dt_spec_buf_t		*dtsb;
> > -	int			specid;
> >  	int			i;
> >  	int			rval;
> >  	dtrace_workstatus_t	ret;
> >  	int			commit_discard_seen, only_commit_discards;
> >  	int			data_recording = 1;
> >  
> > -	epid = ((uint32_t *)data)[0];
> > -	specid = ((uint32_t *)data)[1];
> > +	specid = *((uint32_t *)(data + DBUF_SPECID));
> > +	epid = *((uint64_t *)(data + DBUF_EPID));
> > +	prid = epid >> 32;
> > +	if (prid > dtp->dt_probe_id)
> > +		return dt_set_errno(dtp, EDT_BADEPID);
> >  
> >  	/*
> >  	 * Fill in the epid and address of the epid in the buffer.  We need to
> > @@ -2209,6 +2215,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
> >  					 &pdat->dtpda_pdesc);
> >  	if (rval != 0)
> >  		return dt_set_errno(dtp, EDT_BADEPID);
> > +	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
> >  
> >  	epd = pdat->dtpda_ddesc;
> >  	if (epd->dtdd_uarg != DT_ECB_DEFAULT) {
> > @@ -2639,9 +2646,8 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
> >  		 * struct {
> >  		 *	struct perf_event_header	header;
> >  		 *	uint32_t			size;
> > -		 *	uint32_t			pad;
> > -		 *	uint32_t			epid;
> >  		 *	uint32_t			specid;
> > +		 *	dtrace_epid_t			epid;
> >  		 *	uint64_t			data[n];
> >  		 * }
> >  		 * and 'data' points to the 'size' member at this point.
> > @@ -2651,13 +2657,17 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
> >  			return dt_set_errno(dtp, EDT_DSIZE);
> >  
> >  		size = *(uint32_t *)data;
> > -		data += sizeof(size);
> >  		ptr += sizeof(size) + size;
> >  		if (ptr != buf + hdr->size)
> >  			return dt_set_errno(dtp, EDT_DSIZE);
> >  
> > -		data += sizeof(uint32_t);		/* skip padding */
> > -		size -= sizeof(uint32_t);
> > +		/*
> > +		 * The "size" measures from specid to the end.  But our buffer
> > +		 * offsets are relative to &size itself, to preserve 8-byte
> > +		 * alignment.  So, we leave data pointing at &size, and we
> > +		 * increase size by 4 bytes.
> > +		 */
> > +		size += 4;
> >  
> >  		return dt_consume_one_probe(dtp, fp, data, size, pdat, efunc,
> >  					    rfunc, flow, quiet, peekflags,
> > diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> > index 1422ad24..6592bef1 100644
> > --- a/libdtrace/dt_dctx.h
> > +++ b/libdtrace/dt_dctx.h
> > @@ -18,7 +18,7 @@
> >   * The DTrace machine state.
> >   */
> >  typedef struct dt_mstate {
> > -	uint32_t	epid;		/* Enabled probe ID */
> > +	uint32_t	stid;		/* Statement ID */
> >  	uint32_t	prid;		/* Probe ID */
> >  	uint32_t	clid;		/* Clause ID (unique per probe) */
> >  	uint32_t	tag;		/* Tag (for future use) */
> > @@ -33,7 +33,7 @@ typedef struct dt_mstate {
> >  	uint64_t	saved_argv[10];	/* Saved probe arguments */
> >  } dt_mstate_t;
> >  
> > -#define DMST_EPID		offsetof(dt_mstate_t, epid)
> > +#define DMST_STID		offsetof(dt_mstate_t, stid)
> >  #define DMST_PRID		offsetof(dt_mstate_t, prid)
> >  #define DMST_CLID		offsetof(dt_mstate_t, clid)
> >  #define DMST_TAG		offsetof(dt_mstate_t, tag)
> > @@ -82,16 +82,20 @@ typedef struct dt_dctx {
> >   * The dctx->buf pointer references a block of memory that contains:
> >   *
> >   *                       +----------------+
> > - *                  0 -> | EPID           |
> > + *                  0 -> | pad            |
> >   *                       +----------------+
> > - *		    4 -> | Speculation ID |
> > + *                  4 -> | Speculation ID |
> >   *                       +----------------+
> > - *                       | Trace Data     |
> > + *                  8 -> | EPID           |
> > + *                       +----------------+
> > + *                 16 -> | Trace Data     |
> >   *                       |      ...       |
> >   *                       +----------------+
> >   */
> > -#define DBUF_EPID	0
> > +#define DBUF_PAD	0
> >  #define DBUF_SPECID	4
> > +#define DBUF_EPID	8
> > +#define DBUF_DATA	16
> >  
> >  /*
> >   * The dctx->mem pointer references a block of memory that contains:
> > diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
> > index 4c9b9413..b1ba5f9f 100644
> > --- a/libdtrace/dt_handle.c
> > +++ b/libdtrace/dt_handle.c
> > @@ -14,6 +14,7 @@
> >  #include <alloca.h>
> >  
> >  #include <dt_impl.h>
> > +#include <dt_probe.h>
> >  #include <dt_program.h>
> >  
> >  static const char _dt_errprog[] =
> > @@ -147,11 +148,11 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
> >  	 * This is an error.  We have the following items here:  EPID,
> >  	 * faulting action, BPF pc, fault code and faulting address.
> >  	 */
> > -	epid = (uint32_t)DT_REC(uint64_t, 0);
> > +	epid = DT_REC(uint64_t, 0);
> >  
> >  	if (dt_epid_lookup(dtp, epid, &errdd, &errpd) != 0)
> >  		return dt_set_errno(dtp, EDT_BADERROR);
> > -
> > +	errpd = (dtrace_probedesc_t *)dtp->dt_probes[epid>>32]->desc;
> >  	err.dteda_ddesc = errdd;
> >  	err.dteda_pdesc = errpd;
> >  	err.dteda_cpu = data->dtpda_cpu;
> > @@ -195,7 +196,7 @@ no_addr:
> >  		details[0] = 0;
> >  	}
> >  
> > -	snprintf(str, len, "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): "
> > +	snprintf(str, len, "error on enabled probe ID %lu (ID %u: %s:%s:%s:%s): "
> >  			   "%s%s in %s%s",
> >  		 epid, errpd->id, errpd->prv, errpd->mod, errpd->fun,
> >  		 errpd->prb, dtrace_faultstr(dtp, err.dteda_fault), details,
> > @@ -256,7 +257,7 @@ dt_handle_liberr(dtrace_hdl_t *dtp, const dtrace_probedata_t *data,
> >  	str = alloca(len);
> >  
> >  	snprintf(str, len,
> > -		 "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): %s",
> > +		 "error on enabled probe ID %lu (ID %u: %s:%s:%s:%s): %s",
> >  		 data->dtpda_epid, errpd->id, errpd->prv, errpd->mod,
> >  		 errpd->fun, errpd->prb, faultstr);
> >  
> > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > index 98fddc23..a2ae84f6 100644
> > --- a/libdtrace/dt_impl.h
> > +++ b/libdtrace/dt_impl.h
> > @@ -275,6 +275,7 @@ struct dtrace_hdl {
> >  	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
> >  	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
> >  	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
> > +	dtrace_stmtdesc_t **dt_stmts; /* array of stmts */
> >  	struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id */
> >  	id_t dt_xlatorid;	/* next dt_xlator_t id to assign */
> >  	dt_ident_t *dt_externs;	/* linked list of external symbol identifiers */
> > diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
> > index 60a2eca2..87ce5707 100644
> > --- a/libdtrace/dt_map.c
> > +++ b/libdtrace/dt_map.c
> > @@ -138,14 +138,17 @@ int
> >  dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
> >  	       dtrace_probedesc_t **pdp)
> >  {
> > -	if (epid >= dtp->dt_maxprobe ||
> > -	    dtp->dt_ddesc[epid] == NULL || dtp->dt_pdesc[epid] == NULL)
> > +	/* Remove the PRID portion of the EPID. */
> > +	epid &= 0xffffffff;
> > +
> > +	if (epid >= dtp->dt_clause_nextid)
> >  		return -1;
> >  
> > -	*ddp = dtp->dt_ddesc[epid];
> > +	dtrace_difo_t *rdp = dt_dlib_get_func_difo(dtp, dtp->dt_stmts[epid]->dtsd_clause);
> > +	*ddp = dt_datadesc_hold(rdp->dtdo_ddesc);             // FIXME what releases the hold?
> >  	*pdp = dtp->dt_pdesc[epid];
> >  
> > -	return 0;
> > +	return (*ddp == NULL) ? -1 : 0;
> >  }
> >  
> >  void
> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index 77ffb6d2..8ae6cdfa 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -170,7 +170,7 @@ static const dt_ident_t _dtrace_globals[] = {
> >  { "discard", DT_IDENT_ACTFUNC, 0, DT_ACT_DISCARD, DT_ATTR_STABCMN, DT_VERS_1_0,
> >  	&dt_idops_func, "void(int)" },
> >  { "epid", DT_IDENT_SCALAR, 0, DIF_VAR_EPID, DT_ATTR_STABCMN, DT_VERS_1_0,
> > -	&dt_idops_type, "uint_t" },
> > +	&dt_idops_type, "uint64_t" },
> >  { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
> >  	&dt_idops_type, "int" },
> >  { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
> > diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> > index afbf7265..ee743589 100644
> > --- a/libdtrace/dt_program.c
> > +++ b/libdtrace/dt_program.c
> > @@ -165,6 +165,13 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
> >  	dtrace_probedesc_t	*pdp = &sdp->dtsd_ecbdesc->dted_probe;
> >  	int			rc;
> >  
> > +	if (dtp->dt_stmts == NULL) {
> > +		dtp->dt_stmts = dt_calloc(dtp, dtp->dt_clause_nextid, sizeof(dtrace_stmtdesc_t *));
> > +		if (dtp->dt_stmts == NULL)
> > +			return dt_set_errno(dtp, EDT_NOMEM);
> > +	}
> > +	dtp->dt_stmts[sdp->dtsd_index] = sdp;
> > +
> >  	st.cnt = cnt;
> >  	st.sdp = sdp;
> >  	rc = dt_probe_iter(dtp, pdp, (dt_probe_f *)dt_stmt_probe, NULL, &st);
> > diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> > index 09a87977..a23052e4 100644
> > --- a/libdtrace/dtrace.h
> > +++ b/libdtrace/dtrace.h
> > @@ -150,6 +150,7 @@ typedef struct dtrace_stmtdesc {
> >  	dtrace_attribute_t dtsd_descattr;	/* probedesc attributes */
> >  	dtrace_attribute_t dtsd_stmtattr;	/* statement attributes */
> >  	int dtsd_clauseflags;			/* clause flags */
> > +	int dtsd_index;				/* index in dtp->dt_stmts */
> >  } dtrace_stmtdesc_t;
> >  
> >  /* dtsd clause flags */
> > diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
> > index d3904f47..50b52370 100644
> > --- a/test/demo/dtrace/error.r
> > +++ b/test/demo/dtrace/error.r
> > @@ -3,4 +3,4 @@
> >  
> >  -- @@stderr --
> >  dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
> > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > +dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > diff --git a/test/stress/buffering/tst.resize3-manual.r b/test/stress/buffering/tst.resize3-manual.r
> > index 43b647c7..5493783e 100644
> > --- a/test/stress/buffering/tst.resize3-manual.r
> > +++ b/test/stress/buffering/tst.resize3-manual.r
> > @@ -1,5 +1,5 @@
> >                     FUNCTION:NAME
> > -                          :BEGIN           3
> > +                          :BEGIN            4294967297
> >                            :BEGIN 
> >  
> >  -- @@stderr --
> > diff --git a/test/stress/buffering/tst.resize3.r b/test/stress/buffering/tst.resize3.r
> > index 9c471158..807c4d1c 100644
> > --- a/test/stress/buffering/tst.resize3.r
> > +++ b/test/stress/buffering/tst.resize3.r
> > @@ -1,5 +1,5 @@
> >                     FUNCTION:NAME
> > -                          :BEGIN           3
> > +                          :BEGIN            4294967297
> >                            :BEGIN 
> >  
> >  -- @@stderr --
> > diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
> > index 29e39fd4..9373951c 100644
> > --- a/test/unittest/actions/setopt/tst.badopt.r
> > +++ b/test/unittest/actions/setopt/tst.badopt.r
> > @@ -1,16 +1,16 @@
> >  
> >  -- @@stderr --
> > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > +dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> >
> 
> I'm very much *not* familiar enough to say if this is intended but can I
> ask if it is?
> 
> That starts to look kind of inelegant (to print such a large ID for a
> basic bad option diagnostic), where the probe wasn't doing anything
> fancy? What am I missing?

I asked Eugene to look at this from a different angle, because we are (in
essence) deprecating the concept of EPID as it existed in DTrace, and that
needs to be reflected more in the code.

Reporting enabled probe ID is not really useful anymore anyway, and probably
should be renamed but that needs a bit more attention on how to rename it so
that it actuallt makes sense.  But there is no actual need here to make it
such a high value I think because it is meant to assist in identifying the
"function" or "clause" that triggered the failure and for that the raw EPID
(in its new meaning) is actually sufficient.

So, stay tuned for changes to this patch and others...
