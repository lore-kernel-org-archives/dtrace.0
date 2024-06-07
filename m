Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A61DFEB
	for <dtrace@lists.linux.dev>; Fri,  7 Jun 2024 18:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717785738; cv=fail; b=QFJim6GhfDaWfIk3kdZxwkXKzxynknXal1wkdplEvAkhPz6a3VGJHR6fd2wN1D16Een5qWVFvZIF+JWlOKeIY0/kh5Q2Edaqh6oz+qs3TQCk0Ni40bUiQk6czUEBf+30D+7szc4p74K63sCTrE27m7T8s84dlvAWZrefnJg5WMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717785738; c=relaxed/simple;
	bh=u4SDwdrTucMNMKNjCUYcL2FHmay3F2zLggRxgMV+6mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XBnnkVLx38sz64t7CcZRM9N9/fD8WK7Sb4AHUi36qobm7FRW3VyMMsAsXvI9gqDOhMlNyF2bme/926VtaPH0YXlykiTh7gK56Fs9QJJ/1GcYg2IjQkhS0HZuq1e4nBR7Q10xWOs8ZJXFTgD89deyFEr/vBUIB0c773ukztMostU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HEwgK2fs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J0eBbpBp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HEwgK2fs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J0eBbpBp"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 457Cuh7v029475
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 18:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=corp-2023-11-20;
 bh=fv15uASI3XlU6Z05YxDKWGTG4VnW+Aw8df/DF3R/jxY=;
 b=HEwgK2fsfZTU9VUIScTaLxu9tmOnIARtYGNoy6C3gcARXmaDqYKBQiibCI/tLnidCOrM
 J17Lkh6JeAyGP0npM4RGXwkYJRRM6F9DswDnNXJA6QNzkPFWivz7spJ7W1cYgR6IrGD4
 aHrJ1si7Li/dpbQUkEnBNMpid0G7ikwqRuFhTapIFJ+wCsKLhsJZYLUhb5ruHfh9uwNA
 quqzDRdFAFwCbr2NwWowqF4mnbhPrblNLsWReE4pG9TC1Uov1QZF8UFGqzgKMNkCHqNx
 dvTbiw9oXMGTLF26AVGCsnb4q7t3IKID0PhuDW4hOviSuTe/mu641Rll167fhOSld5d3 fQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbusx7te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 18:42:11 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 457GrRta025099
	for <dtrace@lists.linux.dev>; Fri, 7 Jun 2024 18:42:10 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrtdbkr1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Jun 2024 18:42:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReKgMpiA7D0lsjmtPjnP6VRGb4Rtsns/AU+GIkJQCkeCqESSNnA3/LP96kN7D2g3xBjD9k4PRB20MtV3Sd0ziysCjzrixHOrG1eehCHRow7RHhp11+6mKdk0fKwNpxGm7x0698oKoWuhbmLvPgWrF+BH1eSsNv7VEpCyzqd8b2zuFt4CRCC/e7StB4/dZbeKEirzi0lfDl5dT+ufrZhlhZPRrxbi/Q2KsM6BpV6df9Q4gJGGL+o4tPPutyPZRAum325gDgB/Mjr1sNNsWf1dcS2v8vc5+457Pi8T9tVetBAIdJ7XkPWqMVZ7KXQbXa9XpA9wvL/XIRa1lcqpEMTWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fv15uASI3XlU6Z05YxDKWGTG4VnW+Aw8df/DF3R/jxY=;
 b=a/3fIucctVdtLx4fqr2nSOhgigDxgtzHmCNO/Viwv0nTdaZshcvUAisksBUOLDPOcfTZBv5EyamStayO+JK7UpyBqdp84pHJOW/KPDJtD/ZslHJDhO5WodTPc5Y2dyWNThH9RIAgTmqckvoiamZcnnx1i0SxRe+i61ghFtKcQtj2TbzmYCqiEdVDcO6VJ6lPg2RMRB/BfRQVdFwqzTC8fJz6N1SPjjOYvEz7Qpx+y+f5ypWkWssSbPxmMtvQaN/zK+9EECzLRToH5jCggYn6DBDhfTmHwlEGswjqLfQgq54KX/NcVX8bTc+CCweZW1+fsrWzPRFTxUMSvmacqYeaAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fv15uASI3XlU6Z05YxDKWGTG4VnW+Aw8df/DF3R/jxY=;
 b=J0eBbpBp4XE+22x3TDYVPVY0iYEbRa9E3ZLd4bd33uES9FR9mKim4dpsxPMjysSG85h8q++LGnh9Pbxi+4m+m2fv5YERgSOqnjyV+oRQKEmKkkgKED2FkIYD9EGaQBvCkkqberZhiycHVToR6S8kMldiZpGSDkat5+tCnbugfkw=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by SJ0PR10MB6429.namprd10.prod.outlook.com (2603:10b6:a03:486::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 18:42:05 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 7 Jun 2024
 18:42:05 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 2/2] dlibs: pregenerated translators for 6.10
Date: Fri,  7 Jun 2024 19:41:55 +0100
Message-ID: <20240607184155.316904-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240607184155.316904-1-nick.alcock@oracle.com>
References: <20240607184155.316904-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::15) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|SJ0PR10MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: eff3a5d2-7edc-4148-6cbe-08dc872186f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sy62tyEAlRD/Kz/2NCvVeSqHAsWkN0ESSwgsXDhTTMZDE/lNHQ+SpN9DZ0Nh?=
 =?us-ascii?Q?4F3dGJPCGMXJccP0ZA6vSzoErCMchUjIXJyXEd6aRP2sGRUen3U9Se2GkH7o?=
 =?us-ascii?Q?OOsYWW6AeKHIVkG4qMCkNyJd3GKDxJfq6Ca3QBausUuob/eQ8FDkHnmp1yZg?=
 =?us-ascii?Q?TR+uxpO1tdJVfliZ+p4VMz9DfKNDKHbzswI+Osqae7GD8f3QKXMAGmueBjlv?=
 =?us-ascii?Q?/G/PjB/PV3x97njuXhTHPnEqxiBM+ihtDSDDt03i912P1OFPcOazJRqFEJX7?=
 =?us-ascii?Q?9cLjMtt5pvnA4qsbZDZx6ZgDVWjRLuqYIN9QN/5gFiSnGJ15QlJVttkZONmR?=
 =?us-ascii?Q?ExXL40oTPcNB13WqUB4LUF2QdQyamnCtkfrZVZijN4svwl8RD2EX8igAfM6/?=
 =?us-ascii?Q?KQTDrsWdZHviHjLNlhfM/CX66UofkDrKXPdDb6uhXJ1vcrSz0UaLs0e3cM/I?=
 =?us-ascii?Q?78QXqWg2ucHRjZJiDop9gCPgwRq7dKd8Jg/adq5zcSW/5B+0ua4SItJVEnln?=
 =?us-ascii?Q?zFIWIWDo23R+p/hOE4wAVctEiiJU/jhlRst1lrm8/m4ljmWvdpfdHJSi2s+X?=
 =?us-ascii?Q?Wy1d8TKI3Bu9Zbr4+KVmaf6Ivh23iUI2vQcaH8Nxwg61d+i4OqSvdIWYEj82?=
 =?us-ascii?Q?yxRJRGb5jMC1uNa2JWIrlaUnyb+sGoXcwU/1PLiA/QBo7gT2ktlM8evIFxEr?=
 =?us-ascii?Q?7EZvpHAIbkPdXW56X5QhWgGZ6nzcS/bXcH6rv4hGPFharxp/gjSqdNV11q6N?=
 =?us-ascii?Q?pRBlQFQO4Ool21opzgEjmSexKQc8Ct/xpO/B4q50BUyugTUmBQUuWN3rWzRE?=
 =?us-ascii?Q?hozLtYRjw2yAIbEA5gdNxG8acKzFznF7gHXDSXWBiwdc9pCcaWQDu/VMiuJ+?=
 =?us-ascii?Q?vZ01uyqYY/z2ERw2q6rJm4E03yBOmw5mWGIYkwq1yvytDM+CO7gWvkhcGYDf?=
 =?us-ascii?Q?ZPJsrYD0jPwLurYt6FWC/dHrmyiU1EEJAhNSNh9wwWxgHm/05utGxAaQhKGk?=
 =?us-ascii?Q?n6KDb1/O6YILihrQAAbtcPaHkS+nBnIZmnbd9KvlRmP9OEGxPhOTNW9TgS1j?=
 =?us-ascii?Q?odWk6TtK4Y0AqEyQ+S9S3+2wz9w8qeyXF38jD/L69TCOeZn4pHgTUeyItAzI?=
 =?us-ascii?Q?hJLfWTw6ol46GZkE3wIInJC/FrCdDotdcwaSZNCpJC9ier3aGoRJhAu3Rlet?=
 =?us-ascii?Q?JtZJs6T1KwZOrUVkDqszJP9dF7vjs5xPsZO3+7H80AThSxDq4WtIINxikhuf?=
 =?us-ascii?Q?Qcl5v65UuqCgwOkoAuHCLxx88wg7MNAEYPP0Q7H4gHq09+uKeLY5G4uV7ar9?=
 =?us-ascii?Q?JIM3Gd2HWy/XwU52Y1SHRTtY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VeR5+0wdP/p5ZoSw/lxSauPAeTmY4DyiHcq70lfBBDUUNNGXVfJcyPUDjGyo?=
 =?us-ascii?Q?GEspIFA9gc65m0cPcZqR7o/CSO6rpnS6sllciIZS3kVu5hdm87R+hzlxpWFX?=
 =?us-ascii?Q?R6aYB7KWfMPpDEfkYRj46UuFpTrfmIhEK911j14ICPDdIiZwYB07RuWxzwsP?=
 =?us-ascii?Q?7T6UNVkYtvCiyyZz2T6eai4ouYrOAOHdm/p6SwCdUqubZbpAnAdJnzX1Xoou?=
 =?us-ascii?Q?EBEb0on5yTBRNZjce78vSzUiayM9dIEIukgrfi+5ilKo4EoDT7resKoSeNgt?=
 =?us-ascii?Q?OJ8CUus4aVTOhHsMC2KSCGmE2BVfkSK14bjGlD6WKKkJTc5ULuET8JzB84uf?=
 =?us-ascii?Q?zXZhglp4osG+IK+4Nf1jJtVbGEivqWrEKoJrl9K4+1M/ZqU6LqvGfDlQ7KiI?=
 =?us-ascii?Q?AI4y9WZXVBSRNLPYkXdintF2cFjQtN59SLX9kfeP2+i0cuM33Q3pW/tyX4+D?=
 =?us-ascii?Q?KydnbKpB5ds517kF72xd4KqGvMJf3JTJyo9QqIqLxhxNK8eesIBlCj0o4lRA?=
 =?us-ascii?Q?J1ZilSSUyjG9GimFJn/7TAOVqCanxwTOv1Qq1dTg2pzKg/q/RlR0YML7jany?=
 =?us-ascii?Q?2PVHQslMdYOLMcPqShzcDwFF+E0u0W51dq7n/rxxIQcF7vUtgd7fBIAJ0047?=
 =?us-ascii?Q?sk4C6jSroASVM7fco37o5vNHmKhjyHwgbXyYfV0fbnlpbovUZ/NhzZEyIDmR?=
 =?us-ascii?Q?dJdTxdVQIyghfLsHKCWCzvWiwucmvPOKzKH9+xXoCkDoLk4ubqEWs0YPVmxx?=
 =?us-ascii?Q?ksiIFVyiKBaFyADR07KEnjBSkOhiCDMCbmKQdlchG+xd1bYfMssdpjp5hQxB?=
 =?us-ascii?Q?pfzhNsbAM6EH/RSC5t0OwZ9VWdOBb3SK+eHvotB96EJoSs1grqT/UmOqPhsC?=
 =?us-ascii?Q?dgov+l/kkU3H1Fr1QPEyx7KfxathCJpK+WSUdS5Fdd+ggdBqb6fZuJAWQHUJ?=
 =?us-ascii?Q?jHW6VC5B3kTUGt5XxyWYEfruuNkTK6nLbW+G2YaH7rbKS8KWU5NFWAPyWxow?=
 =?us-ascii?Q?AbNy0cgP/V24Cakk0yQfJO41q0hQRdRriZ+VM2XhTueK0ZkFM9yrt7qHFWbs?=
 =?us-ascii?Q?1KMRKxlvR8iDmEfb05+9PVS4l/dk9GjiFakSmN4lb+iPIlPI2vYcH+UyA8Kf?=
 =?us-ascii?Q?qqHIxqtEko2qZNjLXfa7LpB+3OKuye75/QPdSBvCUrsixGm6/J0GA4uoKVjn?=
 =?us-ascii?Q?Y654rh3ORp/ABo28jp2v/RGEBMa4imzzA2p0pq5/aOWYOytVmh58IbFCgIYO?=
 =?us-ascii?Q?Q6JTvOIs5pqANCDoZbibPkiwIcMZL1dTiGSutFOGp/pMG9NZVDj3lDDlhqCW?=
 =?us-ascii?Q?Q64rRvKCx2x5qGsWm2R/aunpOtSb1l9qyxQJgPlkCfNSJUxQUSdaKFeXqHyI?=
 =?us-ascii?Q?7g5earCLiVVqhevJ+Eo3NnG3IcIVheBJSXMrQei7ZMzPyyydlvqDwA+8onkD?=
 =?us-ascii?Q?VnYwiw4MjHFse/mSy9RBqRIeerATEJ15Cf3TVMKIGVKwiZjpFSXOL6dszg7u?=
 =?us-ascii?Q?8T8q9mLpluCjTL2z8lsB49z0dIb8Xu3Iltrw1MAF3gC/EDoVlQFDMFUxuv5+?=
 =?us-ascii?Q?UlCCDJKRUpX7BWLG34hbu2Eut6rtJkl7ZefGS9PwWrA8a6Sl6v6vF7IZVAQC?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	FWgtguqTBqpHRDzrd8h4Er+AX4q8CKlvs1cSi6MOxhDQCwvlxW7Pb6Ec0tHe+Zbz7nX3hkDpYwjV6AaeIoSyXdxGXMJNf/Ize7K+LVJIMymP79tI8ME7IafMbYF7uvYKaIXxXT4CxCjHwPSAkajSioGwDG5QV75W1CObdBDkfnm62Er0ULzbZVgqKv24l/PEre8zHmed99uLHw0MGZCEmxvqUPuGDRJ4ByEb0LB3KWQzswrHdvPOADG2TB/2K5Ny9sU/Fig2QEvL7RUrG+WzGYkH1Tv5RK5WvB+u5UxQLOYd4mccBNyHwUauZc5nGpx3hJPYiJtj0moIHeblu9DKxFcEW7ro95nT8nVaZSal8j0oYr1dn4FXHzfibDN2/83urvtGHUHtITmWzqzMti7FjA4CTOPiQVK5cOcsWzA9BRXmR+o8BWeahkg/BCqkh9ILiNj5F5sdGbaxaIai+BnTSaNQVqlR7/kr8RbxN+DnPhInbnwEmAwZ6QwTWYv0PyT2C/1Ad9FVNdSaTVaEhm3mBQAJNB7NgMXQhMkXyRAqnIRKRWTYZoKPh7jpC0QwA81Vx5Qy1fw5TZDHpJKFmTy4DXyTwJ4FzBFflLiXlSin3jA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff3a5d2-7edc-4148-6cbe-08dc872186f9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 18:42:05.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKNsD/aXgImwifdEJInux1qMT4D3QQeY3fCCoKO2PaF92ZlPsXo0yPITgppVn9i1MAKlY/McRAtAB2eGEOpjbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6429
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_11,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406070136
X-Proofpoint-ORIG-GUID: Y8nFV5YM0UD_yuNCszP3EKOFPAqZTFMB
X-Proofpoint-GUID: Y8nFV5YM0UD_yuNCszP3EKOFPAqZTFMB

All differences from the previous translators (6.1) are no-effect
ordering changes other than those one would expect from the changes to
the .d files.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dlibs/aarch64/6.10/errno.d     | 275 ++++++++++++++++++++++++++
 dlibs/aarch64/6.10/io.d        | 234 ++++++++++++++++++++++
 dlibs/aarch64/6.10/ip.d        | 341 +++++++++++++++++++++++++++++++++
 dlibs/aarch64/6.10/lockstat.d  |  14 ++
 dlibs/aarch64/6.10/net.d       |  33 ++++
 dlibs/aarch64/6.10/pcap.d      |  35 ++++
 dlibs/aarch64/6.10/procfs.d    | 306 +++++++++++++++++++++++++++++
 dlibs/aarch64/6.10/regs.d      |  78 ++++++++
 dlibs/aarch64/6.10/sched.d     |  38 ++++
 dlibs/aarch64/6.10/signal.d    | 108 +++++++++++
 dlibs/aarch64/6.10/tcp.d       | 231 ++++++++++++++++++++++
 dlibs/aarch64/6.10/udp.d       |  71 +++++++
 dlibs/aarch64/6.10/unistd.d    |  36 ++++
 dlibs/x86_64/6.10.0/errno.d    | 275 ++++++++++++++++++++++++++
 dlibs/x86_64/6.10.0/io.d       | 235 +++++++++++++++++++++++
 dlibs/x86_64/6.10.0/ip.d       | 341 +++++++++++++++++++++++++++++++++
 dlibs/x86_64/6.10.0/lockstat.d |  14 ++
 dlibs/x86_64/6.10.0/net.d      |  33 ++++
 dlibs/x86_64/6.10.0/pcap.d     |  35 ++++
 dlibs/x86_64/6.10.0/procfs.d   | 306 +++++++++++++++++++++++++++++
 dlibs/x86_64/6.10.0/regs.d     |  94 +++++++++
 dlibs/x86_64/6.10.0/sched.d    |  38 ++++
 dlibs/x86_64/6.10.0/signal.d   | 108 +++++++++++
 dlibs/x86_64/6.10.0/tcp.d      | 231 ++++++++++++++++++++++
 dlibs/x86_64/6.10.0/udp.d      |  71 +++++++
 dlibs/x86_64/6.10.0/unistd.d   |  36 ++++
 26 files changed, 3617 insertions(+)
 create mode 100644 dlibs/aarch64/6.10/errno.d
 create mode 100644 dlibs/aarch64/6.10/io.d
 create mode 100644 dlibs/aarch64/6.10/ip.d
 create mode 100644 dlibs/aarch64/6.10/lockstat.d
 create mode 100644 dlibs/aarch64/6.10/net.d
 create mode 100644 dlibs/aarch64/6.10/pcap.d
 create mode 100644 dlibs/aarch64/6.10/procfs.d
 create mode 100644 dlibs/aarch64/6.10/regs.d
 create mode 100644 dlibs/aarch64/6.10/sched.d
 create mode 100644 dlibs/aarch64/6.10/signal.d
 create mode 100644 dlibs/aarch64/6.10/tcp.d
 create mode 100644 dlibs/aarch64/6.10/udp.d
 create mode 100644 dlibs/aarch64/6.10/unistd.d
 create mode 100644 dlibs/x86_64/6.10.0/errno.d
 create mode 100644 dlibs/x86_64/6.10.0/io.d
 create mode 100644 dlibs/x86_64/6.10.0/ip.d
 create mode 100644 dlibs/x86_64/6.10.0/lockstat.d
 create mode 100644 dlibs/x86_64/6.10.0/net.d
 create mode 100644 dlibs/x86_64/6.10.0/pcap.d
 create mode 100644 dlibs/x86_64/6.10.0/procfs.d
 create mode 100644 dlibs/x86_64/6.10.0/regs.d
 create mode 100644 dlibs/x86_64/6.10.0/sched.d
 create mode 100644 dlibs/x86_64/6.10.0/signal.d
 create mode 100644 dlibs/x86_64/6.10.0/tcp.d
 create mode 100644 dlibs/x86_64/6.10.0/udp.d
 create mode 100644 dlibs/x86_64/6.10.0/unistd.d

diff --git a/dlibs/aarch64/6.10/errno.d b/dlibs/aarch64/6.10/errno.d
new file mode 100644
index 0000000000000..f54fafe1861cc
--- /dev/null
+++ b/dlibs/aarch64/6.10/errno.d
@@ -0,0 +1,275 @@
+
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2012, Oracle and/or its affiliates. All rights reserved.
+ * Use is subject to license terms.
+ */
+
+inline int EPERM = 1;
+#pragma D binding "1.0" EPERM
+inline int ENOENT = 2;
+#pragma D binding "1.0" ENOENT
+inline int ESRCH = 3;
+#pragma D binding "1.0" ESRCH
+inline int EINTR = 4;
+#pragma D binding "1.0" EINTR
+inline int EIO = 5;
+#pragma D binding "1.0" EIO
+inline int ENXIO = 6;
+#pragma D binding "1.0" ENXIO
+inline int E2BIG = 7;
+#pragma D binding "1.0" E2BIG
+inline int ENOEXEC = 8;
+#pragma D binding "1.0" ENOEXEC
+inline int EBADF = 9;
+#pragma D binding "1.0" EBADF
+inline int ECHILD = 10;
+#pragma D binding "1.0" ECHILD
+inline int EAGAIN = 11;
+#pragma D binding "1.0" EAGAIN
+inline int ENOMEM = 12;
+#pragma D binding "1.0" ENOMEM
+inline int EACCES = 13;
+#pragma D binding "1.0" EACCES
+inline int EFAULT = 14;
+#pragma D binding "1.0" EFAULT
+inline int ENOTBLK = 15;
+#pragma D binding "1.0" ENOTBLK
+inline int EBUSY = 16;
+#pragma D binding "1.0" EBUSY
+inline int EEXIST = 17;
+#pragma D binding "1.0" EEXIST
+inline int EXDEV = 18;
+#pragma D binding "1.0" EXDEV
+inline int ENODEV = 19;
+#pragma D binding "1.0" ENODEV
+inline int ENOTDIR = 20;
+#pragma D binding "1.0" ENOTDIR
+inline int EISDIR = 21;
+#pragma D binding "1.0" EISDIR
+inline int EINVAL = 22;
+#pragma D binding "1.0" EINVAL
+inline int ENFILE = 23;
+#pragma D binding "1.0" ENFILE
+inline int EMFILE = 24;
+#pragma D binding "1.0" EMFILE
+inline int ENOTTY = 25;
+#pragma D binding "1.0" ENOTTY
+inline int ETXTBSY = 26;
+#pragma D binding "1.0" ETXTBSY
+inline int EFBIG = 27;
+#pragma D binding "1.0" EFBIG
+inline int ENOSPC = 28;
+#pragma D binding "1.0" ENOSPC
+inline int ESPIPE = 29;
+#pragma D binding "1.0" ESPIPE
+inline int EROFS = 30;
+#pragma D binding "1.0" EROFS
+inline int EMLINK = 31;
+#pragma D binding "1.0" EMLINK
+inline int EPIPE = 32;
+#pragma D binding "1.0" EPIPE
+inline int EDOM = 33;
+#pragma D binding "1.0" EDOM
+inline int ERANGE = 34;
+#pragma D binding "1.0" ERANGE
+inline int EDEADLK = 35;
+#pragma D binding "1.0" EDEADLK
+inline int ENAMETOOLONG = 36;
+#pragma D binding "1.0" ENAMETOOLONG
+inline int ENOLCK = 37;
+#pragma D binding "1.0" ENOLCK
+inline int ENOSYS = 38;
+#pragma D binding "1.0" ENOSYS
+inline int ENOTEMPTY = 39;
+#pragma D binding "1.0" ENOTEMPTY
+inline int ELOOP = 40;
+#pragma D binding "1.0" ELOOP
+inline int EWOULDBLOCK = 11;
+#pragma D binding "1.0" EWOULDBLOCK
+inline int ENOMSG = 42;
+#pragma D binding "1.0" ENOMSG
+inline int EIDRM = 43;
+#pragma D binding "1.0" EIDRM
+inline int ECHRNG = 44;
+#pragma D binding "1.0" ECHRNG
+inline int EL2NSYNC = 45;
+#pragma D binding "1.0" EL2NSYNC
+inline int EL3HLT = 46;
+#pragma D binding "1.0" EL3HLT
+inline int EL3RST = 47;
+#pragma D binding "1.0" EL3RST
+inline int ELNRNG = 48;
+#pragma D binding "1.0" ELNRNG
+inline int EUNATCH = 49;
+#pragma D binding "1.0" EUNATCH
+inline int ENOCSI = 50;
+#pragma D binding "1.0" ENOCSI
+inline int EL2HLT = 51;
+#pragma D binding "1.0" EL2HLT
+inline int EBADE = 52;
+#pragma D binding "1.0" EBADE
+inline int EBADR = 53;
+#pragma D binding "1.0" EBADR
+inline int EXFULL = 54;
+#pragma D binding "1.0" EXFULL
+inline int ENOANO = 55;
+#pragma D binding "1.0" ENOANO
+inline int EBADRQC = 56;
+#pragma D binding "1.0" EBADRQC
+inline int EBADSLT = 57;
+#pragma D binding "1.0" EBADSLT
+inline int EDEADLOCK = 35;
+#pragma D binding "1.0" EDEADLOCK
+inline int EBFONT = 59;
+#pragma D binding "1.0" EBFONT
+inline int ENOSTR = 60;
+#pragma D binding "1.0" ENOSTR
+inline int ENODATA = 61;
+#pragma D binding "1.0" ENODATA
+inline int ETIME = 62;
+#pragma D binding "1.0" ETIME
+inline int ENOSR = 63;
+#pragma D binding "1.0" ENOSR
+inline int ENONET = 64;
+#pragma D binding "1.0" ENONET
+inline int ENOPKG = 65;
+#pragma D binding "1.0" ENOPKG
+inline int EREMOTE = 66;
+#pragma D binding "1.0" EREMOTE
+inline int ENOLINK = 67;
+#pragma D binding "1.0" ENOLINK
+inline int EADV = 68;
+#pragma D binding "1.0" EADV
+inline int ESRMNT = 69;
+#pragma D binding "1.0" ESRMNT
+inline int ECOMM = 70;
+#pragma D binding "1.0" ECOMM
+inline int EPROTO = 71;
+#pragma D binding "1.0" EPROTO
+inline int EMULTIHOP = 72;
+#pragma D binding "1.0" EMULTIHOP
+inline int EDOTDOT = 73;
+#pragma D binding "1.0" EDOTDOT
+inline int EBADMSG = 74;
+#pragma D binding "1.0" EBADMSG
+inline int EOVERFLOW = 75;
+#pragma D binding "1.0" EOVERFLOW
+inline int ENOTUNIQ = 76;
+#pragma D binding "1.0" ENOTUNIQ
+inline int EBADFD = 77;
+#pragma D binding "1.0" EBADFD
+inline int EREMCHG = 78;
+#pragma D binding "1.0" EREMCHG
+inline int ELIBACC = 79;
+#pragma D binding "1.0" ELIBACC
+inline int ELIBBAD = 80;
+#pragma D binding "1.0" ELIBBAD
+inline int ELIBSCN = 81;
+#pragma D binding "1.0" ELIBSCN
+inline int ELIBMAX = 82;
+#pragma D binding "1.0" ELIBMAX
+inline int ELIBEXEC = 83;
+#pragma D binding "1.0" ELIBEXEC
+inline int EILSEQ = 84;
+#pragma D binding "1.0" EILSEQ
+inline int ERESTART = 85;
+#pragma D binding "1.0" ERESTART
+inline int ESTRPIPE = 86;
+#pragma D binding "1.0" ESTRPIPE
+inline int EUSERS = 87;
+#pragma D binding "1.0" EUSERS
+inline int ENOTSOCK = 88;
+#pragma D binding "1.0" ENOTSOCK
+inline int EDESTADDRREQ = 89;
+#pragma D binding "1.0" EDESTADDRREQ
+inline int EMSGSIZE = 90;
+#pragma D binding "1.0" EMSGSIZE
+inline int EPROTOTYPE = 91;
+#pragma D binding "1.0" EPROTOTYPE
+inline int ENOPROTOOPT = 92;
+#pragma D binding "1.0" ENOPROTOOPT
+inline int EPROTONOSUPPORT = 93;
+#pragma D binding "1.0" EPROTONOSUPPORT
+inline int ESOCKTNOSUPPORT = 94;
+#pragma D binding "1.0" ESOCKTNOSUPPORT
+inline int EOPNOTSUPP = 95;
+#pragma D binding "1.0" EOPNOTSUPP
+inline int EPFNOSUPPORT = 96;
+#pragma D binding "1.0" EPFNOSUPPORT
+inline int EAFNOSUPPORT = 97;
+#pragma D binding "1.0" EAFNOSUPPORT
+inline int EADDRINUSE = 98;
+#pragma D binding "1.0" EADDRINUSE
+inline int EADDRNOTAVAIL = 99;
+#pragma D binding "1.0" EADDRNOTAVAIL
+inline int ENETDOWN = 100;
+#pragma D binding "1.0" ENETDOWN
+inline int ENETUNREACH = 101;
+#pragma D binding "1.0" ENETUNREACH
+inline int ENETRESET = 102;
+#pragma D binding "1.0" ENETRESET
+inline int ECONNABORTED = 103;
+#pragma D binding "1.0" ECONNABORTED
+inline int ECONNRESET = 104;
+#pragma D binding "1.0" ECONNRESET
+inline int ENOBUFS = 105;
+#pragma D binding "1.0" ENOBUFS
+inline int EISCONN = 106;
+#pragma D binding "1.0" EISCONN
+inline int ENOTCONN = 107;
+#pragma D binding "1.0" ENOTCONN
+inline int ESHUTDOWN = 108;
+#pragma D binding "1.0" ESHUTDOWN
+inline int ETOOMANYREFS = 109;
+#pragma D binding "1.0" ETOOMANYREFS
+inline int ETIMEDOUT = 110;
+#pragma D binding "1.0" ETIMEDOUT
+inline int ECONNREFUSED = 111;
+#pragma D binding "1.0" ECONNREFUSED
+inline int EHOSTDOWN = 112;
+#pragma D binding "1.0" EHOSTDOWN
+inline int EHOSTUNREACH = 113;
+#pragma D binding "1.0" EHOSTUNREACH
+inline int EALREADY = 114;
+#pragma D binding "1.0" EALREADY
+inline int EINPROGRESS = 115;
+#pragma D binding "1.0" EINPROGRESS
+inline int ESTALE = 116;
+#pragma D binding "1.0" ESTALE
+inline int EUCLEAN = 117;
+#pragma D binding "1.0" EUCLEAN
+inline int ENOTNAM = 118;
+#pragma D binding "1.0" ENOTNAM
+inline int ENAVAIL = 119;
+#pragma D binding "1.0" ENAVAIL
+inline int EISNAM = 120;
+#pragma D binding "1.0" EISNAM
+inline int EREMOTEIO = 121;
+#pragma D binding "1.0" EREMOTEIO
+inline int EDQUOT = 122;
+#pragma D binding "1.0" EDQUOT
+inline int ENOMEDIUM = 123;
+#pragma D binding "1.0" ENOMEDIUM
+inline int EMEDIUMTYPE = 124;
+#pragma D binding "1.0" EMEDIUMTYPE
+inline int ECANCELED = 125;
+#pragma D binding "1.0" ECANCELED
+inline int ENOKEY = 126;
+#pragma D binding "1.0" ENOKEY
+inline int EKEYEXPIRED = 127;
+#pragma D binding "1.0" EKEYEXPIRED
+inline int EKEYREVOKED = 128;
+#pragma D binding "1.0" EKEYREVOKED
+inline int EKEYREJECTED = 129;
+#pragma D binding "1.0" EKEYREJECTED
+inline int EOWNERDEAD = 130;
+#pragma D binding "1.0" EOWNERDEAD
+inline int ENOTRECOVERABLE = 131;
+#pragma D binding "1.0" ENOTRECOVERABLE
+inline int ERFKILL = 132;
+#pragma D binding "1.0" ERFKILL
+inline int EHWPOISON = 133;
+#pragma D binding "1.0" EHWPOISON
+inline int ENOTSUP = 95;
+#pragma D binding "1.0" ENOTSUP
diff --git a/dlibs/aarch64/6.10/io.d b/dlibs/aarch64/6.10/io.d
new file mode 100644
index 0000000000000..ffccf5b3e3f18
--- /dev/null
+++ b/dlibs/aarch64/6.10/io.d
@@ -0,0 +1,234 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2012, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on provider sched
+
+typedef char	*caddr_t;
+
+typedef struct bufinfo {
+	int b_flags;			/* buffer status */
+	size_t b_bcount;		/* number of bytes */
+	caddr_t b_addr;			/* buffer address */
+	uint64_t b_lblkno;		/* block # on device */
+	uint64_t b_blkno;		/* expanded block # on device */
+	size_t b_resid;			/* # of bytes not transferred */
+	size_t b_bufsize;		/* size of allocated buffer */
+	caddr_t b_iodone;		/* I/O completion routine */
+	int b_error;			/* expanded error field */
+	dev_t b_edev;			/* extended device */
+} bufinfo_t;
+
+inline int B_BUSY = 0x000001;
+#pragma D binding "1.0" B_BUSY
+inline int B_DONE = 0x000002;
+#pragma D binding "1.0" B_DONE
+inline int B_ERROR = 0x000004;
+#pragma D binding "1.0" B_ERROR
+inline int B_PAGEIO = 0x000010;
+#pragma D binding "1.0" B_PAGEIO
+inline int B_PHYS = 0x000020;
+#pragma D binding "1.0" B_PHYS
+inline int B_READ = 0x000040;
+#pragma D binding "1.0" B_READ
+inline int B_WRITE = 0x000100;
+#pragma D binding "1.0" B_WRITE
+inline int B_ASYNC = 0x000400;
+#pragma D binding "1.0" B_ASYNC
+
+#pragma D binding "1.0" translator
+translator bufinfo_t < struct buffer_head *B > {
+	b_flags = (int)arg1 & 0x01 ? B_WRITE : B_READ;
+	b_addr = B->b_data;
+	b_bcount = B->b_size;
+	b_lblkno = B->b_blocknr;
+	b_blkno = B->b_blocknr;
+	b_resid = 0;
+	b_bufsize = B->b_size;
+	b_iodone = (caddr_t)B->b_end_io;
+	b_error = 0;			/* b_state ?? */
+	b_edev = B->b_bdev->bd_dev;
+};
+
+/*
+ * From linux/blk_types.h.
+ */
+
+/* bit # in bi_flags */
+inline int BIO_USER_MAPPED = 6;
+
+/* bit mask in bi_rw */
+inline int REQ_WRITE = 0x01;
+
+inline int REQ_SYNC = 0x800;
+
+
+
+
+
+
+
+#pragma D binding "1.6.3" translator
+translator bufinfo_t < struct bio *B > {
+	b_flags = ((int)B->bi_opf & REQ_WRITE ? B_WRITE : B_READ) |
+		((int)B->bi_opf & REQ_SYNC ? 0 : B_ASYNC) |
+		((int)B->bi_flags & (1 << BIO_USER_MAPPED) ? B_PAGEIO : B_PHYS);
+	b_addr = 0;
+	b_bcount = B->bi_iter.bi_size;
+	b_lblkno = B->bi_iter.bi_sector;
+	b_blkno = B->bi_iter.bi_sector;
+	b_resid = 0;
+	b_bufsize = B->bi_iter.bi_size;
+	b_iodone = (caddr_t)B->bi_end_io;
+	b_error = 0;
+	b_edev = B->bi_bdev == NULL ? 0 : B->bi_bdev->bd_dev;
+};
+
+typedef struct devinfo {
+	int dev_major;			/* major number */
+	int dev_minor;			/* minor number */
+	int dev_instance;		/* instance number */
+	string dev_name;		/* name of device */
+	string dev_statname;		/* name of device + instance/minor */
+	string dev_pathname;		/* pathname of device */
+} devinfo_t;
+
+
+
+#pragma D binding "1.0" translator
+translator devinfo_t < struct buffer_head *B > {
+	dev_major = getmajor(B->b_bdev->bd_dev);
+	dev_minor = getminor(B->b_bdev->bd_dev);
+	dev_instance = 0;		/* not used? */
+	dev_name = B->b_bdev->bd_disk->part0->bd_device.parent
+	    ? B->b_bdev->bd_disk->part0->bd_device.parent->driver->name
+		? stringof(B->b_bdev->bd_disk->part0->bd_device.parent->driver->name)
+		: "<none>"
+	    : B->b_bdev->bd_disk->part0->bd_device.driver->name
+		? stringof(B->b_bdev->bd_disk->part0->bd_device.driver->name)
+		: "<none>";
+	dev_statname = B->b_bdev->__bd_flags.counter & 255 == 0
+			? stringof(B->b_bdev->bd_disk->disk_name)
+			: strjoin(stringof(B->b_bdev->bd_disk->disk_name),
+				  lltostr(B->b_bdev->__bd_flags.counter & 255));
+	dev_pathname = strjoin(
+			"/dev/",
+			B->b_bdev->__bd_flags.counter & 255 == 0
+			    ? stringof(B->b_bdev->bd_disk->disk_name)
+			    : strjoin(stringof(B->b_bdev->bd_disk->disk_name),
+				      lltostr(B->b_bdev->__bd_flags.counter & 255))
+		       );
+};
+
+#pragma D binding "1.6.3" translator
+translator devinfo_t < struct bio *B > {
+	dev_major = B->bi_bdev == NULL ? 0 : getmajor(B->bi_bdev->bd_dev);
+	dev_minor = B->bi_bdev == NULL ? 0 : getminor(B->bi_bdev->bd_dev);
+	dev_instance = 0;
+	dev_name = B->bi_bdev == NULL
+			? "nfs"
+			: stringof(((struct blk_major_name **)`major_names)[
+					getmajor(B->bi_bdev->bd_dev) % 255
+				   ]->name);
+	dev_statname = B->bi_bdev == NULL ? "nfs" :
+	    B->bi_bdev->__bd_flags.counter & 255 == 0 ? stringof(B->bi_bdev->bd_disk->disk_name) :
+	    strjoin(stringof(B->bi_bdev->bd_disk->disk_name), lltostr(B->bi_bdev->__bd_flags.counter & 255));
+	dev_pathname = B->bi_bdev == NULL ? "<nfs>" : "<unknown>";
+};
+
+typedef struct fileinfo {
+	string fi_name;			/* name (basename of fi_pathname) */
+	string fi_dirname;		/* directory (dirname of fi_pathname) */
+	string fi_pathname;		/* full pathname */
+	loff_t fi_offset;		/* offset within file */
+	string fi_fs;			/* filesystem */
+	string fi_mount;		/* mount point of file system */
+	int fi_oflags;			/* open(2) flags for file descriptor */
+} fileinfo_t;
+
+#pragma D binding "1.0" translator
+translator fileinfo_t < struct buffer_head *B > {
+	fi_name = "<unknown>";
+	fi_dirname = "<unknown>";
+	fi_pathname = "<unknown>";
+	fi_offset = 0;
+	fi_fs = "<unknown>";
+	fi_mount = "<unknown>";
+	fi_oflags = 0;
+};
+
+inline int O_ACCMODE = 0003;
+#pragma D binding "1.1" O_ACCMODE
+inline int O_RDONLY = 00;
+#pragma D binding "1.1" O_RDONLY
+inline int O_WRONLY = 01;
+#pragma D binding "1.1" O_WRONLY
+inline int O_RDWR = 02;
+#pragma D binding "1.1" O_RDWR
+inline int O_CREAT = 00000100;
+#pragma D binding "1.1" O_CREAT
+inline int O_EXCL = 00000200;
+#pragma D binding "1.1" O_EXCL
+inline int O_NOCTTY = 00000400;
+#pragma D binding "1.1" O_NOCTTY
+inline int O_TRUNC = 00001000;
+#pragma D binding "1.1" O_TRUNC
+inline int O_APPEND = 00002000;
+#pragma D binding "1.1" O_APPEND
+inline int O_NONBLOCK = 00004000;
+#pragma D binding "1.1" O_NONBLOCK
+inline int O_NDELAY = 00004000;
+#pragma D binding "1.1" O_NDELAY
+inline int O_SYNC = (04000000|010000);
+#pragma D binding "1.1" O_SYNC
+
+inline int O_ASYNC = 020000;
+#pragma D binding "1.1" O_ASYNC
+inline int O_DIRECTORY = 040000;
+#pragma D binding "1.1" O_DIRECTORY
+inline int O_NOFOLLOW = 0100000;
+#pragma D binding "1.1" O_NOFOLLOW
+inline int O_CLOEXEC = 02000000;
+#pragma D binding "1.1" O_CLOEXEC
+inline int O_DSYNC = 010000;
+#pragma D binding "1.1" O_DSYNC
+inline int O_RSYNC = (04000000|010000);
+#pragma D binding "1.1" O_RSYNC
+
+#pragma D binding "1.1" translator
+translator fileinfo_t < struct file *F > {
+	fi_name = F == NULL
+			? "<none>"
+			: stringof(F->f_path.dentry->d_name.name);
+	fi_dirname = F == NULL
+			? "<none>"
+			: dirname(d_path(&(F->f_path)));
+	fi_pathname = F == NULL
+			? "<none>"
+			: d_path(&(F->f_path));
+	fi_offset = F == NULL
+			? 0
+			: F->f_pos;
+	fi_fs = F == NULL
+			? "<none>"
+			: stringof(F->f_path.mnt->mnt_sb->s_type->name);
+	fi_mount = F == NULL
+			? "<none>"
+			: "<unknown>";
+	fi_oflags = F == NULL
+			? 0
+			: F->f_flags;
+};
+
+inline fileinfo_t fds[int fd] = xlate <fileinfo_t> (
+				 fd >= 0 && fd < curthread->files->fdt->max_fds
+					? curthread->files->fdt->fd[fd]
+					: NULL
+				);
+
+#pragma D attributes Stable/Stable/Common fds
+#pragma D binding "1.1" fds
diff --git a/dlibs/aarch64/6.10/ip.d b/dlibs/aarch64/6.10/ip.d
new file mode 100644
index 0000000000000..f8b77f1224115
--- /dev/null
+++ b/dlibs/aarch64/6.10/ip.d
@@ -0,0 +1,341 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on library net.d
+#pragma D depends_on library procfs.d
+#pragma D depends_on provider ip
+
+inline int IPPROTO_IP		=	0;
+inline int IPPROTO_ICMP		=	1;
+inline int IPPROTO_IGMP		=	2;
+inline int IPPROTO_IPIP		=	4;
+inline int IPPROTO_TCP		=	6;
+inline int IPPROTO_EGP		=	8;
+inline int IPPROTO_PUP		=	12;
+inline int IPPROTO_UDP		=	17;
+inline int IPPROTO_IDP		=	22;
+inline int IPPROTO_TP		=	29;
+inline int IPPROTO_DCCP		=	33;
+inline int IPPROTO_IPV6		=	41;
+inline int IPPROTO_RSVP		=	46;
+inline int IPPROTO_GRE		=	47;
+inline int IPPROTO_ESP		=	50;
+inline int IPPROTO_AH		=	51;
+inline int IPPROTO_OSPF		=	89;
+inline int IPPROTO_MTP		=	92;
+inline int IPPROTO_BEETPH	=	94;
+inline int IPPROTO_ENCAP	=	98;
+inline int IPPROTO_PIM		=	103;
+inline int IPPROTO_COMP		=	108;
+inline int IPPROTO_SCTP		=	132;
+inline int IPPROTO_UDPLITE	=	136;
+inline int IPPROTO_RAW		=	255;
+inline int IPPROTO_MAX		=	256;
+inline int IPPROTO_HOPOPTS	=	0;
+inline int IPPROTO_ROUTING	=	43;
+inline int IPPROTO_FRAGMENT	=	44;
+inline int IPPROTO_ICMPV6	=	58;
+inline int IPPROTO_NONE		=	59;
+inline int IPPROTO_DSTOPTS	=	60;
+inline int IPPROTO_MH		=	135;
+
+inline int TCP_MIN_HEADER_LENGTH =	20;
+
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
+/*
+ * ipinfo contains common IP info for both IPv4 and IPv6.
+ */
+typedef struct ipinfo {
+	uint8_t ip_ver;			/* IP version (4, 6) */
+	uint32_t ip_plength;		/* payload length */
+	string ip_saddr;		/* source address */
+	string ip_daddr;		/* destination address */
+} ipinfo_t;
+
+/*
+ * ifinfo contains network interface info.
+ */
+typedef struct ifinfo {
+	string if_name;			/* interface name */
+	int8_t if_local;		/* is delivered locally */
+	netstackid_t if_ipstack;	/* netns pointer on Linux */
+	uintptr_t if_addr;		/* pointer to raw struct net_device */
+} ifinfo_t;
+
+/*
+ * ipv4info is a translated version of the IPv4 header (with raw pointer).
+ * These values are NULL if the packet is not IPv4.
+ */
+typedef struct ipv4info {
+	uint8_t ipv4_ver;		/* IP version (4) */
+	uint8_t ipv4_ihl;		/* header length, bytes */
+	uint8_t ipv4_tos;		/* type of service field */
+	uint16_t ipv4_length;		/* length (header + payload) */
+	uint16_t ipv4_ident;		/* identification */
+	uint8_t ipv4_flags;		/* IP flags */
+	uint16_t ipv4_offset;		/* fragment offset */
+	uint8_t ipv4_ttl;		/* time to live */
+	uint8_t ipv4_protocol;		/* next level protocol */
+	string ipv4_protostr;		/* next level protocol, as string */
+	uint16_t ipv4_checksum;		/* header checksum */
+	ipaddr_t ipv4_src;		/* source address */
+	ipaddr_t ipv4_dst;		/* destination address */
+	string ipv4_saddr;		/* source address, string */
+	string ipv4_daddr;		/* destination address, string */
+	struct iphdr *ipv4_hdr;		/* pointer to raw header */
+} ipv4info_t;
+
+/*
+ * ipv6info is a translated version of the IPv6 header (with raw pointer).
+ * These values are NULL if the packet is not IPv6.
+ */
+typedef struct ipv6info {
+	uint8_t ipv6_ver;		/* IP version (6) */
+	uint8_t ipv6_tclass;		/* traffic class */
+	uint32_t ipv6_flow;		/* flow label */
+	uint16_t ipv6_plen;		/* payload length */
+	uint8_t ipv6_nexthdr;		/* next header protocol */
+	string ipv6_nextstr;		/* next header protocol, as string */
+	uint8_t ipv6_hlim;		/* hop limit */
+	in6_addr_t *ipv6_src;		/* source address */
+	in6_addr_t *ipv6_dst;		/* destination address */
+	string ipv6_saddr;		/* source address, string */
+	string ipv6_daddr;		/* destination address, string */
+	struct ipv6hdr *ipv6_hdr;	/* pointer to raw header */
+} ipv6info_t;
+
+/*
+ * void_ip_t is a void pointer to either an IPv4 or IPv6 header.  It has
+ * its own type name so that a translator can be determined.
+ */
+typedef uintptr_t void_ip_t;
+
+/*
+ * __dtrace_tcp_void_ip_t is used by the translator to take either the
+ * non-NULL void_ip_t * passed in or, if it is NULL, uses arg3 (struct tcp *)
+ * from the tcp:::send probe to translate to an ipinfo_t.
+ * This allows us to present the consumer with header data based on the
+ * struct tcp * when IP information is not yet present (for TCP send).
+ */
+typedef void * __dtrace_tcp_void_ip_t;
+
+#pragma D binding "1.5" translator
+translator pktinfo_t < struct sk_buff *s > {
+	pkt_addr = (uintptr_t)s;
+};
+
+#pragma D binding "1.5" translator
+translator csinfo_t < struct sock *s > {
+	cs_addr = (uintptr_t)s;
+};
+
+#pragma D binding "1.5" translator
+translator ipinfo_t < struct iphdr *I > {
+	ip_ver = 4;
+        ip_plength = I != NULL ? (ntohs(I->tot_len) - I->ihl << 2) : 0;
+	ip_saddr = I != NULL ? inet_ntoa(&I->saddr) : "<unknown>";
+	ip_daddr = I != NULL ? inet_ntoa(&I->daddr) : "<unknown>";
+};
+
+#pragma D binding "1.5" translator
+translator ipinfo_t < struct ipv6hdr *I > {
+	ip_ver = 6;
+	ip_plength = I != NULL ? ntohs(I->payload_len) : 0;
+	ip_saddr = I != NULL ? inet_ntoa6(&I->saddr) : "<unknown>";
+	ip_daddr = I != NULL ? inet_ntoa6(&I->daddr) : "<unknown>";
+};
+
+#pragma D binding "1.5" translator
+translator ipinfo_t < void_ip_t *I > {
+	ip_ver = I != NULL ? *(uint8_t *)I >> 4 : 0;
+	ip_plength = I != NULL ? (*(uint8_t *)I >> 4 == 4 ?
+	    (ntohs(((struct iphdr *)I)->tot_len) - ((*(uint8_t *)I & 0xf) << 2)) :
+	    *(uint8_t *)I >> 4 == 6 ?
+	    ntohs(((struct ipv6hdr *)I)->payload_len) : 0) : 0;
+	ip_saddr = I != NULL ? (*(uint8_t *)I >> 4 == 4 ?
+	    inet_ntoa(&((struct iphdr *)I)->saddr) : *(uint8_t *)I >> 4 == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) : "<unknown>") :
+	    "<unknown>";
+	ip_daddr = I != NULL ? (*(uint8_t *)I >> 4 == 4 ?
+	    inet_ntoa(&((struct iphdr *)I)->daddr) : *(uint8_t *)I >> 4 == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) : "<unknown>") :
+	    "<unknown>";
+};
+
+/*
+ * In some cases where the ipinfo_t * is NULL we wish to construct IP info
+ * using the struct tcp_sock * (arg3).  In order to map local IP to source
+ * or destination IP address appropriately we need to check if the associated
+ * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg7.  If inbound, we map the local IP address to
+ * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
+ */
+#pragma D binding "1.5" translator
+translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
+	/*
+	 * General strategy used is to rely on the IP header I if it is
+	 * non-null; otherwise we try to reconstruct IP values from arg3
+	 * (a struct tcp_sock *).
+	 */
+	ip_ver = I != NULL ? *(uint8_t *)I >> 4 :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET ? 4 :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ? 6 : 0;
+	/*
+	 * For ip_plength we fall back to using TCP skb data from the tcp_skb_cb
+	 * to determine payload length.
+	 */
+	ip_plength = I != NULL && *(uint8_t *)I >> 4 == 4 ?
+	    ntohs(((struct iphdr *)I)->tot_len) - ((*(uint8_t *)I & 0xf) << 2) :
+	    I != NULL && *(uint8_t *)I >> 4 == 6 ?
+	    ntohs(((struct ipv6hdr *)I)->payload_len) :
+	    arg0 != NULL ?
+	    ((struct tcp_skb_cb *)&(((struct sk_buff *)arg0)->cb[0]))->end_seq -
+	    ((struct tcp_skb_cb *)&(((struct sk_buff *)arg0)->cb[0]))->seq :
+	    0;
+	/*
+	 * For source/destination addresses, we again try to use the IP header I
+	 * if available.  If I is NULL, we utilize arg3 (struct tcp_sock *)
+	 * but the problem here is that it stores local and remote IP addresses
+	 * _not_ source and destination.  So we need to know if traffic is
+	 * inbound or outbound. If inbound, IP source address is remote
+	 * socket address (skc_daddr) and destination IP address is local socket
+	 * address (skc_rcv_saddr).  If outbound, IP source address is local
+	 * socket address and IP destination address is remote socket address.
+	 */
+	ip_saddr = I != NULL && *(uint8_t *)I >> 4 == 4 ?
+	    inet_ntoa(&((struct iphdr *)I)->saddr) :
+	    I != NULL && *(uint8_t *)I >> 4 == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
+	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    &((struct sock *)arg3)->__sk_common.skc_daddr :
+	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
+	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
+	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
+	    "<unknown>";
+	ip_daddr = I != NULL && *(uint8_t *)I >> 4 == 4 ?
+	    inet_ntoa(&((struct iphdr *)I)->daddr) :
+	    I != NULL && *(uint8_t *)I >> 4 == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
+	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
+	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
+	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
+	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
+	    "<unknown>";
+};
+
+#pragma D binding "1.5" translator
+translator ifinfo_t < struct net_device *N > {
+	if_name = N != NULL ? stringof(N->name) : "<unknown>";
+	if_ipstack = (N != NULL && sizeof(N->nd_net) > 0) ?
+	    ((uint64_t)N->nd_net.net) : 0;
+	if_local = (N == NULL);	/* is delivered locally */
+	if_addr = (uintptr_t)N;	/* pointer to raw struct net_device ptr */
+};
+
+#pragma D binding "1.5" translator
+translator ipv4info_t < struct iphdr *I > {
+	ipv4_ver = I != NULL ? 4 : 0;
+	ipv4_ihl = I != NULL ? ((*(uint8_t *)I & 0xf) << 2) : 0;
+	ipv4_tos = I != NULL ? I->tos : 0;
+	ipv4_length = I != NULL ? ntohs(I->tot_len) : 0;
+	ipv4_ident = I != NULL ? ntohs(I->id) : 0;
+	ipv4_flags = I != NULL ? ntohs(I->frag_off) >> 12 : 0;
+	ipv4_offset = I != NULL ? ntohs(I->frag_off) & 0x0fff : 0;
+	ipv4_ttl = I != NULL ? I->ttl : 0;
+	ipv4_protocol = I != NULL ? I->protocol : 0;
+	ipv4_protostr = I == NULL ? "<null>" :
+	    I->protocol == IPPROTO_TCP     ? "TCP"    :
+	    I->protocol == IPPROTO_UDP     ? "UDP"    :
+	    I->protocol == IPPROTO_IP      ? "IP"     :
+	    I->protocol == IPPROTO_ICMP    ? "ICMP"   :
+	    I->protocol == IPPROTO_IGMP    ? "IGMP"   :
+	    I->protocol == IPPROTO_EGP     ? "EGP"    :
+	    I->protocol == IPPROTO_IPV6    ? "IPv6"   :
+	    I->protocol == IPPROTO_ROUTING ? "ROUTE"  :
+	    I->protocol == IPPROTO_ESP     ? "ESP"    :
+	    I->protocol == IPPROTO_AH      ? "AH"     :
+	    I->protocol == IPPROTO_ICMPV6  ? "ICMPv6" :
+	    I->protocol == IPPROTO_OSPF    ? "OSPF"   :
+	    I->protocol == IPPROTO_SCTP    ? "SCTP"   :
+	    I->protocol == IPPROTO_RAW     ? "RAW"    :
+	    lltostr((uint64_t)I->protocol);
+	ipv4_checksum = I != NULL ? ntohs(I->check) : 0;
+	ipv4_src = I != NULL ? I->saddr : 0;
+	ipv4_dst = I != NULL ? I->daddr : 0;
+	ipv4_saddr = I != NULL ? inet_ntoa(&I->saddr) : "<null>";
+	ipv4_daddr = I != NULL ? inet_ntoa(&I->daddr) : "<null>";
+	ipv4_hdr = I;
+};
+
+#pragma D binding "1.5" translator
+translator ipv6info_t < struct ipv6hdr *I > {
+	ipv6_ver = I != NULL ? ((*(uint8_t *)I) >> 4) : 0;
+	ipv6_tclass = I != NULL ? ((ntohl(*(uint32_t *)I) & 0x0fffffff) >> 20) : 0;
+	ipv6_flow = I != NULL ? (ntohl(*(uint32_t *)I) & 0x000fffff) : 0;
+	ipv6_plen = I != NULL ? ntohs(I->payload_len) : 0;
+	ipv6_nexthdr = I != NULL ? I->nexthdr : 0;
+	ipv6_nextstr = I == NULL ? "<null>" :
+	    I->nexthdr == IPPROTO_TCP	?	"TCP"		:
+	    I->nexthdr == IPPROTO_UDP	?	"UDP"		:
+	    I->nexthdr == IPPROTO_IP	?	"IP"		:
+	    I->nexthdr == IPPROTO_ICMP	?	"ICMP"		:
+	    I->nexthdr == IPPROTO_IGMP	?	"IGMP"		:
+	    I->nexthdr == IPPROTO_EGP	?	"EGP"		:
+	    I->nexthdr == IPPROTO_IPV6	?	"IPv6"		:
+	    I->nexthdr == IPPROTO_ROUTING ?	"ROUTE"		:
+	    I->nexthdr == IPPROTO_ESP	?	"ESP"		:
+	    I->nexthdr == IPPROTO_AH	?	"AH"		:
+	    I->nexthdr == IPPROTO_ICMPV6 ?	"ICMPv6"	:
+	    I->nexthdr == IPPROTO_OSPF ?	"OSPF"		:
+	    I->nexthdr == IPPROTO_SCTP	?	"SCTP"		:
+	    I->nexthdr == IPPROTO_RAW	?	"RAW"		:
+	    lltostr((uint64_t)I->nexthdr);
+	ipv6_hlim = I != NULL ? I->hop_limit : 0;
+	ipv6_src = I != NULL ? &I->saddr : NULL;
+	ipv6_dst = I != NULL ? &I->daddr : 0;
+	ipv6_saddr = I != NULL ? inet_ntoa6(&I->saddr) : "<null>";
+	ipv6_daddr = I != NULL ? inet_ntoa6(&I->daddr) : "<null>";
+	ipv6_hdr = I;
+};
diff --git a/dlibs/aarch64/6.10/lockstat.d b/dlibs/aarch64/6.10/lockstat.d
new file mode 100644
index 0000000000000..cb8b4bd96f1ac
--- /dev/null
+++ b/dlibs/aarch64/6.10/lockstat.d
@@ -0,0 +1,14 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on provider lockstat
+
+inline int RW_WRITER = 0x00;
+#pragma D binding "1.6.4" RW_WRITER
+inline int RW_READER = 0x01;
+#pragma D binding "1.6.4" RW_READER
diff --git a/dlibs/aarch64/6.10/net.d b/dlibs/aarch64/6.10/net.d
new file mode 100644
index 0000000000000..6ac3428747a77
--- /dev/null
+++ b/dlibs/aarch64/6.10/net.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* These are needed for inet_ntop() DTrace function. */
+inline int AF_INET              =       2;
+inline int AF_INET6             =       10;
+
+/* These are needed for link_ntop() DTrace function. */
+inline int ARPHRD_ETHER         =       1;
+inline int ARPHRD_INFINIBAND    =       32;
+
+/*
+ * The conninfo_t structure should be used by all application protocol
+ * providers as the first arguments to indicate some basic information
+ * about the connection. This structure may be augmented to accommodate
+ * the particularities of additional protocols in the future.
+ */
+typedef struct conninfo {
+	 string ci_local;	/* local host address */
+	 string ci_remote;	/* remote host address */
+	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
+} conninfo_t;
+
+/*
+ * We use these values to determine if a probe point is associated
+ * with sending (outbound) or receiving (inbound).
+ */
+inline int NET_PROBE_OUTBOUND =		0x00;
+inline int NET_PROBE_INBOUND =		0x01;
diff --git a/dlibs/aarch64/6.10/pcap.d b/dlibs/aarch64/6.10/pcap.d
new file mode 100644
index 0000000000000..21a8e74a4036d
--- /dev/null
+++ b/dlibs/aarch64/6.10/pcap.d
@@ -0,0 +1,35 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2016, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on provider ip
+
+/*
+ * In general, PCAP_<type> names are chosen to match DL_<type> DLPI
+ * datalink types.
+ */
+
+/*
+ * Network-related capture types.  Raw DLT_* values can be used for those
+ * not present here; see /usr/include/pcap/bpf.h for the full list.
+ */
+
+inline int PCAP_NULL = 0;
+#pragma D binding "1.12" PCAP_NULL
+inline int PCAP_ETHER = 1;
+#pragma D binding "1.12" PCAP_ETHER
+inline int PCAP_WIFI = 105;
+#pragma D binding "1.12" PCAP_WIFI
+inline int PCAP_PPP = 9;
+#pragma D binding "1.12" PCAP_PPP
+/* PCAP_IP can signify IPv4 or IPv6 header follows. */
+inline int PCAP_IP = 12;
+#pragma D binding "1.12" PCAP_IP
+
+/* InfiniBand-related capture types. */
+inline int PCAP_IPOIB = 242;
+#pragma D binding "1.12" PCAP_IPOIB
diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
new file mode 100644
index 0000000000000..5d7873b5e0091
--- /dev/null
+++ b/dlibs/aarch64/6.10/procfs.d
@@ -0,0 +1,306 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2012, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * This file defines the standard set of inlines and translators to be made
+ * available for all D programs to use to examine process model state.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on library sched.d
+
+typedef time64_t time_t;
+
+typedef struct timestruc {
+	time_t tv_sec;
+	long tv_nsec;
+} timestruc_t;
+
+typedef struct lwpsinfo {
+	int pr_flag;			/* lwp flags (DEPRECATED) */
+	int pr_lwpid;			/* lwp id */
+	uintptr_t pr_addr;		/* internal address of lwp */
+	uintptr_t pr_wchan;		/* wait addr for sleeping lwp */
+	char pr_stype;			/* sync event type */
+	char pr_state;			/* numeric lwp state */
+	char pr_sname;			/* printable char for pr_state */
+	char pr_nice;			/* nice for cpu usage */
+	short pr_syscall;		/* syscall number */
+	char pr_oldpri;			/* priority */
+	char pr_cpu;			/* CPU usage */
+	int pr_pri;			/* priority */
+	ushort_t pr_pctcpu;		/* % of recent cpu time */
+	ushort_t pr_pad;
+	timestruc_t pr_start;		/* lwp start time */
+	timestruc_t pr_time;		/* usr+sys cpu time */
+	char pr_clname[8];		/* scheduling class name */
+	char pr_name[16];		/* name */
+	processorid_t pr_onpro;		/* processor last ran on */
+	processorid_t pr_bindpro;	/* processor bound to */
+	psetid_t pr_bindpset;		/* processor set */
+	int pr_lgrp;			/* lwp home lgroup */
+	int pr_filler[4];
+} lwpsinfo_t;
+
+typedef id_t taskid_t;
+typedef id_t dprojid_t;
+typedef id_t poolid_t;
+typedef id_t zoneid_t;
+
+/*
+ * Translate from the kernel's task_struct structure to a Solaris proc(4)
+ * psinfo_t struct.
+ * We do not provide support for pr_size, pr_rssize, pr_pctcpu, and pr_pctmem.
+ * We also do not fill in pr_lwp (the lwpsinfo_t for the representative LWP)
+ * because we do not have the ability to select and stop any representative.
+ * Also, for the moment, pr_wstat, pr_time, and pr_ctime are not supported,
+ * but these could be supported by DTrace in the future using subroutines.
+ * Note that any member added to this translator should also be added to the
+ * kthread_t-to-psinfo_t translator, below.
+ */
+typedef struct psinfo {
+	int pr_flag;			/* process flags (DEPRECATED) */
+	int pr_nlwp;			/* number of active lwps (Linux: 1) */
+	pid_t pr_pid;			/* unique process id */
+	pid_t pr_ppid;			/* process id of parent */
+	pid_t pr_pgid;			/* pid of process group leader */
+	pid_t pr_sid;			/* session id */
+	uid_t pr_uid;			/* real user id */
+	uid_t pr_euid;			/* effective user id */
+	uid_t pr_gid;			/* real group id */
+	uid_t pr_egid;			/* effective group id */
+	uintptr_t pr_addr;		/* address of process */
+	size_t pr_size;			/* size of process image (in KB) */
+	size_t pr_rssize;		/* resident set sie (in KB) */
+	size_t pr_pad1;
+	struct tty_struct *pr_ttydev;	/* controlling tty (or -1) */
+	ushort_t pr_pctcpu;		/* % of recent cpu time used */
+	ushort_t pr_pctmem;		/* % of recent memory used */
+	timestruc_t pr_start;		/* process start time */
+	timestruc_t pr_time;		/* usr+sys cpu time for process */
+	timestruc_t pr_ctime;		/* usr+sys cpu time for children */
+	char pr_fname[16];		/* name of exec'd file */
+	char pr_psargs[80];		/* initial chars of arg list */
+	int pr_wstat;			/* if zombie, wait() status */
+	int pr_argc;			/* initial argument count */
+	uintptr_t pr_argv;		/* address of initial arg vector */
+	uintptr_t pr_envp;		/* address of initial env vector */
+	char pr_dmodel;			/* data model */
+	char pr_pad2[3];
+	taskid_t pr_taskid;		/* task id */
+	dprojid_t pr_projid;		/* project id */
+	int pr_nzomb;			/* number of zombie lwps (Linux: 0) */
+	poolid_t pr_poolid;		/* pool id */
+	zoneid_t pr_zoneid;		/* zone id */
+	id_t pr_contract;		/* process contract */
+	int pr_filler[1];
+	lwpsinfo_t pr_lwp;
+} psinfo_t;
+
+inline char PR_MODEL_ILP32 = 1;
+#pragma D binding "1.0" PR_MODEL_ILP32
+inline char PR_MODEL_LP64 = 2;
+#pragma D binding "1.0" PR_MODEL_LP64
+
+ 
+ 
+inline	int PIDTYPE_PID = 0;
+#pragma D binding "1.0" PIDTYPE_PID
+inline	int PIDTYPE_TGID = 1;
+#pragma D binding "1.0" PIDTYPE_TGID
+inline	int PIDTYPE_PGID = 2;
+#pragma D binding "1.0" PIDTYPE_PGID
+inline	int PIDTYPE_SID = 3;
+#pragma D binding "1.0" PIDTYPE_SID
+
+ 
+ 
+ 
+ 
+ 
+ 
+ 
+#pragma D binding "1.0" translator
+translator psinfo_t < struct task_struct *T > {
+	pr_nlwp = 1;
+	pr_pid = T->tgid;
+	pr_ppid = T->real_parent->tgid;
+	pr_pgid = T->signal->pids[PIDTYPE_PGID]->numbers[0].nr;
+	pr_sid = T->signal->pids[PIDTYPE_SID]->numbers[0].nr;
+	pr_uid = T->cred->uid.val;
+	pr_euid = T->cred->euid.val;
+	pr_gid = T->cred->gid.val;
+	pr_egid = T->cred->egid.val;
+	pr_addr = (uintptr_t)T;
+
+	pr_ttydev = T->signal->tty ? T->signal->tty
+				   : (struct tty_struct *)-1;
+
+	pr_fname = T->comm;
+/*
+	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
+ */
+	pr_wstat = 0;
+/*
+	pr_argc = get_psinfo(T)->__psinfo(argc);
+	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
+	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
+ */
+
+	pr_dmodel = PR_MODEL_LP64;
+
+	pr_taskid = 0;
+	pr_projid = 0;
+	pr_nzomb = 0;
+	pr_poolid = 0;
+	pr_zoneid = 0;
+	pr_contract = 0;
+};
+
+inline int PR_STOPPED = 0x00000001;
+#pragma D binding "1.0" PR_STOPPED
+inline int PR_ISTOP = 0x00000002;
+#pragma D binding "1.0" PR_ISTOP
+inline int PR_DSTOP = 0x00000004;
+#pragma D binding "1.0" PR_DSTOP
+inline int PR_IDLE = 0x10000000;
+#pragma D binding "1.0" PR_IDLE
+
+inline char SSLEEP = 1;
+#pragma D binding "1.0" SSLEEP
+inline char SRUN = 2;
+#pragma D binding "1.0" SRUN
+inline char SZOMB = 3;
+#pragma D binding "1.0" SZOMB
+inline char SSTOP = 4;
+#pragma D binding "1.0" SSTOP
+inline char SIDL = 5;
+#pragma D binding "1.0" SIDL
+inline char SONPROC = 6;
+#pragma D binding "1.0" SONPROC
+inline char SWAIT = 7;
+#pragma D binding "1.0" SWAIT
+
+/*
+ * Translate from the kernel's task_struct structure to a Solaris proc(4)
+ * lwpsinfo_t.
+ * We do not provide support for pr_nice, pr_oldpri, pr_cpu, or pr_pctcpu.
+ * Also, for the moment, pr_start and pr_time are not supported, but these
+ * could be supported by DTrace in the future using subroutines.
+ */
+#pragma D binding "1.0" translator
+translator lwpsinfo_t < struct task_struct *T > {
+	pr_flag = (T->__state & 0x00000004) ? PR_STOPPED : 0;
+/*
+	pr_flag = ((T->t_state == TS_STOPPED) ? (PR_STOPPED |
+	    ((!(T->t_schedflag & TS_PSTART)) ? PR_ISTOP : 0)) :
+	    ((T->t_proc_flag & TP_PRVSTOP) ? PR_STOPPED | PR_ISTOP : 0)) |
+	    ((T == T->t_procp->p_agenttp) ? PR_AGENT : 0) |
+	    ((!(T->t_proc_flag & TP_TWAIT)) ? PR_DETACH : 0) |
+	    ((T->t_proc_flag & TP_DAEMON) ? PR_DAEMON : 0) |
+	    ((T->t_procp->p_pidflag & CLDNOSIGCHLD) ? PR_NOSIGCHLD : 0) |
+	    ((T->t_procp->p_pidflag & CLDWAITPID) ? PR_WAITPID : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_FORK) ? PR_FORK : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_RUNLCL) ? PR_RLC : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_KILLCL) ? PR_KLC : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_ASYNC) ? PR_ASYNC : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_BPTADJ) ? PR_BPTADJ : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_PTRACE) ? PR_PTRACE : 0) |
+	    ((T->t_procp->p_flag & SMSACCT) ? PR_MSACCT : 0) |
+	    ((T->t_procp->p_flag & SMSFORK) ? PR_MSFORK : 0) |
+	    ((T->t_procp->p_flag & SVFWAIT) ? PR_VFORKP : 0) |
+	    (((T->t_procp->p_flag & SSYS) ||
+	    (T->t_procp->p_as == &`kas)) ? PR_ISSYS : 0) |
+	    ((T == T->t_cpu->cpu_idle_thread) ? PR_IDLE : 0);
+*/
+
+	pr_lwpid = T->pid;
+	pr_addr = (uintptr_t)T;
+	pr_wchan = NULL;
+	pr_stype = 0;
+
+	pr_state = (T->__state & 0x00000001) ? SSLEEP :
+		   (T->__state & 0x00000002) ? SSLEEP :
+		   (T->__state & 0x00000004) ? SSTOP :
+		   (T->__state & 0x00000008) ? SSTOP :
+		   (T->__state & 0x00000020) ? SZOMB :
+		   (T->__state & 0x00000010) ? SZOMB :
+		   (T->__state & 0x00000080) ? SZOMB :
+		   (T->__state & 0x00000100) ? SWAIT :
+		   (T->__state & 0x00000200) ? SWAIT : SRUN;
+	pr_sname = (T->__state & 0x00000001) ? 'S' :
+		   (T->__state & 0x00000002) ? 'S' :
+		   (T->__state & 0x00000004) ? 'T' :
+		   (T->__state & 0x00000008) ? 'T' :
+		   (T->__state & 0x00000020) ? 'Z' :
+		   (T->__state & 0x00000010) ? 'Z' :
+		   (T->__state & 0x00000080) ? 'Z' :
+		   (T->__state & 0x00000100) ? 'W' :
+		   (T->__state & 0x00000200) ? 'W' : 'R';
+
+	pr_pri = T->prio;
+	pr_name = T->comm;
+	pr_onpro = ((struct thread_info *)T->stack)->cpu;
+};
+
+inline psinfo_t *curpsinfo = xlate <psinfo_t *> (curthread);
+#pragma D attributes Stable/Stable/Common curpsinfo
+#pragma D binding "1.0" curpsinfo
+
+inline lwpsinfo_t *curlwpsinfo = xlate <lwpsinfo_t *> (curthread);
+#pragma D attributes Stable/Stable/Common curlwpsinfo
+#pragma D binding "1.0" curlwpsinfo
+
+inline string cwd = d_path(&(curthread->fs->pwd));
+#pragma D attributes Stable/Stable/Common cwd
+#pragma D binding "1.0" cwd
+
+inline string root = d_path(&(curthread->fs->root));
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "1.0" root
+
+inline int CLD_EXITED = 1;
+#pragma D binding "1.0" CLD_EXITED
+inline int CLD_KILLED = 2;
+#pragma D binding "1.0" CLD_KILLED
+inline int CLD_DUMPED = 3;
+#pragma D binding "1.0" CLD_DUMPED
+inline int CLD_TRAPPED = 4;
+#pragma D binding "1.0" CLD_TRAPPED
+inline int CLD_STOPPED = 5;
+#pragma D binding "1.0" CLD_STOPPED
+inline int CLD_CONTINUED = 6;
+#pragma D binding "1.0" CLD_CONTINUED
+
+/*
+ * Below we provide some inline definitions to simplify converting from
+ * a struct pid * to a pid_t.  structpid2pid is a DTrace-ized version of
+ * pid_vnr().
+ */
+ /*
+inline	struct pid_namespace *pid_namespace[struct pid *p] = p != NULL ?
+	p->numbers[p->level].ns : NULL;
+
+inline	int pid_namespace_level[struct pid *p] = p != NULL && pid_namespace[p] ?
+	pid_namespace[p]->level : 0;
+
+m4_dnl 4.19 and above use thread_pid for this.
+define_for_kernel([[__task_pid]], [[ m4_dnl
+	(m4_kver(4, 19, 0), [[task->thread_pid]])]], m4_dnl
+	[[task->pids[PIDTYPE_PID].pid]]) m4_dnl
+
+inline	struct pid *task_pid[struct task_struct *task] =
+	task != NULL ? __task_pid : NULL;
+
+inline	int current_namespace_level = pid_namespace_level[task_pid[curthread]];
+
+inline	pid_t structpid2pid[struct pid *p] =
+	p != NULL && current_namespace_level <= p->level &&
+	((struct upid *)&(p->numbers[current_namespace_level]))->ns ==
+	pid_namespace[task_pid[curthread]] ?
+	((struct upid *)&(p->numbers[current_namespace_level]))->nr : 0;
+*/
diff --git a/dlibs/aarch64/6.10/regs.d b/dlibs/aarch64/6.10/regs.d
new file mode 100644
index 0000000000000..e47f8cfc11825
--- /dev/null
+++ b/dlibs/aarch64/6.10/regs.d
@@ -0,0 +1,78 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+inline int R_X0 = 0 ;
+#pragma D binding "1.0" R_X0
+inline int R_X1 = 1 ;
+#pragma D binding "1.0" R_X1
+inline int R_X2 = 2 ;
+#pragma D binding "1.0" R_X2
+inline int R_X3 = 3 ;
+#pragma D binding "1.0" R_X3
+inline int R_X4 = 4 ;
+#pragma D binding "1.0" R_X4
+inline int R_X5 = 5 ;
+#pragma D binding "1.0" R_X5
+inline int R_X6 = 6 ;
+#pragma D binding "1.0" R_X6
+inline int R_X7 = 7 ;
+#pragma D binding "1.0" R_X7
+inline int R_X8 = 8 ;
+#pragma D binding "1.0" R_X8
+inline int R_X9 = 9 ;
+#pragma D binding "1.0" R_X9
+inline int R_X10 = 10 ;
+#pragma D binding "1.0" R_X10
+inline int R_X11 = 11 ;
+#pragma D binding "1.0" R_X11
+inline int R_X12 = 12 ;
+#pragma D binding "1.0" R_X12
+inline int R_X13 = 13 ;
+#pragma D binding "1.0" R_X13
+inline int R_X14 = 14 ;
+#pragma D binding "1.0" R_X14
+inline int R_X15 = 15 ;
+#pragma D binding "1.0" R_X15
+inline int R_X16 = 16 ;
+#pragma D binding "1.0" R_X16
+inline int R_X17 = 17 ;
+#pragma D binding "1.0" R_X17
+inline int R_X18 = 18 ;
+#pragma D binding "1.0" R_X18
+inline int R_X19 = 19 ;
+#pragma D binding "1.0" R_X19
+inline int R_X20 = 20 ;
+#pragma D binding "1.0" R_X20
+inline int R_X21 = 21 ;
+#pragma D binding "1.0" R_X21
+inline int R_X22 = 22 ;
+#pragma D binding "1.0" R_X22
+inline int R_X23 = 23 ;
+#pragma D binding "1.0" R_X23
+inline int R_X24 = 24 ;
+#pragma D binding "1.0" R_X24
+inline int R_X25 = 25 ;
+#pragma D binding "1.0" R_X25
+inline int R_X26 = 26 ;
+#pragma D binding "1.0" R_X26
+inline int R_X27 = 27 ;
+#pragma D binding "1.0" R_X27
+inline int R_X28 = 28 ;
+#pragma D binding "1.0" R_X28
+inline int R_X29 = 29 ;
+#pragma D binding "1.0" R_X29
+inline int R_X30 = 30 ;
+#pragma D binding "1.0" R_X30
+
+inline int R_SP = 31 ;
+#pragma D binding "1.0" R_SP
+inline int R_PC = 32 ;
+#pragma D binding "1.0" R_PC
+inline int R_PSTATE = 33 ;
+#pragma D binding "1.0" R_PSTATE
+
+inline int R_FP = R_X29;
+#pragma D binding "1.0" R_FP
diff --git a/dlibs/aarch64/6.10/sched.d b/dlibs/aarch64/6.10/sched.d
new file mode 100644
index 0000000000000..271d84e057cde
--- /dev/null
+++ b/dlibs/aarch64/6.10/sched.d
@@ -0,0 +1,38 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2012, 2019, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+
+typedef id_t		processorid_t;
+typedef id_t		psetid_t;
+typedef id_t		chipid_t;
+typedef id_t		lgrp_id_t;
+
+typedef struct cpuinfo {
+	processorid_t	cpu_id;
+	psetid_t	cpu_pset;
+	chipid_t	cpu_chip;
+	lgrp_id_t	cpu_lgrp;
+} cpuinfo_t;
+
+typedef cpuinfo_t	*cpuinfo_t_p;
+
+inline processorid_t cpu = curcpu->cpu_id;
+#pragma D attributes Stable/Stable/Common cpu
+#pragma D binding "1.0" cpu
+
+inline psetid_t pset = curcpu->cpu_pset;
+#pragma D attributes Stable/Stable/Common pset
+#pragma D binding "1.0" pset
+
+inline chipid_t chip = curcpu->cpu_chip;
+#pragma D attributes Stable/Stable/Common chip
+#pragma D binding "1.0" chip
+
+inline lgrp_id_t lgrp = curcpu->cpu_lgrp;
+#pragma D attributes Stable/Stable/Common lgrp
+#pragma D binding "1.0" lgrp
diff --git a/dlibs/aarch64/6.10/signal.d b/dlibs/aarch64/6.10/signal.d
new file mode 100644
index 0000000000000..88493b427050f
--- /dev/null
+++ b/dlibs/aarch64/6.10/signal.d
@@ -0,0 +1,108 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
+ * Use is subject to license terms.
+ *
+ */
+inline int SIGSYS = 31;
+#pragma D binding "1.0" SIGSYS
+
+inline int SIGTERM = 15;
+#pragma D binding "1.0" SIGTERM
+
+inline int SIGTSTP = 20;
+#pragma D binding "1.0" SIGTSTP
+
+inline int SIGVTALRM = 26;
+#pragma D binding "1.0" SIGVTALRM
+
+inline int SIGPIPE = 13;
+#pragma D binding "1.0" SIGPIPE
+
+inline int SIGBUS = 7;
+#pragma D binding "1.0" SIGBUS
+
+inline int SIGSTKFLT = 16;
+#pragma D binding "1.0" SIGSTKFLT
+
+inline int SIGTRAP = 5;
+#pragma D binding "1.0" SIGTRAP
+
+inline int SIGHUP = 1;
+#pragma D binding "1.0" SIGHUP
+
+inline int SIGFPE = 8;
+#pragma D binding "1.0" SIGFPE
+
+inline int SIGIO = 29;
+#pragma D binding "1.0" SIGIO
+
+inline int SIGURG = 23;
+#pragma D binding "1.0" SIGURG
+
+inline int SIGKILL = 9;
+#pragma D binding "1.0" SIGKILL
+
+inline int SIGWINCH = 28;
+#pragma D binding "1.0" SIGWINCH
+
+inline int SIGXFSZ = 25;
+#pragma D binding "1.0" SIGXFSZ
+
+inline int SIGINT = 2;
+#pragma D binding "1.0" SIGINT
+
+inline int SIGIOT = 6;
+#pragma D binding "1.0" SIGIOT
+
+inline int SIGTTOU = 22;
+#pragma D binding "1.0" SIGTTOU
+
+inline int SIGTTIN = 21;
+#pragma D binding "1.0" SIGTTIN
+
+inline int SIGCHLD = 17;
+#pragma D binding "1.0" SIGCHLD
+
+inline int SIGCONT = 18;
+#pragma D binding "1.0" SIGCONT
+
+inline int SIGQUIT = 3;
+#pragma D binding "1.0" SIGQUIT
+
+inline int SIGABRT = 6;
+#pragma D binding "1.0" SIGABRT
+
+inline int SIGPWR = 30;
+#pragma D binding "1.0" SIGPWR
+
+inline int SIGPROF = 27;
+#pragma D binding "1.0" SIGPROF
+
+inline int SIGXCPU = 24;
+#pragma D binding "1.0" SIGXCPU
+
+inline int SIGSTOP = 19;
+#pragma D binding "1.0" SIGSTOP
+
+inline int SIGILL = 4;
+#pragma D binding "1.0" SIGILL
+
+inline int SIGCLD = 17;
+#pragma D binding "1.0" SIGCLD
+
+inline int SIGUSR1 = 10;
+#pragma D binding "1.0" SIGUSR1
+
+inline int SIGPOLL = 29;
+#pragma D binding "1.0" SIGPOLL
+
+inline int SIGSEGV = 11;
+#pragma D binding "1.0" SIGSEGV
+
+inline int SIGUSR2 = 12;
+#pragma D binding "1.0" SIGUSR2
+
+inline int SIGALRM = 14;
+#pragma D binding "1.0" SIGALRM
+
diff --git a/dlibs/aarch64/6.10/tcp.d b/dlibs/aarch64/6.10/tcp.d
new file mode 100644
index 0000000000000..54e310cb4c6ed
--- /dev/null
+++ b/dlibs/aarch64/6.10/tcp.d
@@ -0,0 +1,231 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on library net.d
+#pragma D depends_on provider ip
+#pragma D depends_on provider tcp
+
+inline int TH_FIN =	0x01;
+inline int TH_SYN =	0x02;
+inline int TH_RST =	0x04;
+inline int TH_PSH =	0x08;
+inline int TH_ACK =	0x10;
+inline int TH_URG =	0x20;
+inline int TH_ECE =	0x40;
+inline int TH_CWR =	0x80;
+
+inline int TCP_STATE_IDLE = 		0x00;
+inline int TCP_STATE_ESTABLISHED =	0x01;
+inline int TCP_STATE_SYN_SENT =		0x02;
+inline int TCP_STATE_SYN_RECEIVED =	0x03;
+inline int TCP_STATE_FIN_WAIT_1 =	0x04;
+inline int TCP_STATE_FIN_WAIT_2 =	0x05;
+inline int TCP_STATE_TIME_WAIT =	0x06;
+inline int TCP_STATE_CLOSED =		0x07;
+inline int TCP_STATE_CLOSE_WAIT =	0x08;
+inline int TCP_STATE_LAST_ACK =		0x09;
+inline int TCP_STATE_LISTEN =		0x0a;
+inline int TCP_STATE_CLOSING =		0x0b;
+
+/*
+ * Convert a TCP state value to a string.
+ */
+inline string tcp_state_string[int state] =
+	state == TCP_STATE_CLOSED ? "state-closed" :
+	state == TCP_STATE_IDLE ? "state-idle" :
+	state == TCP_STATE_LISTEN ? "state-listen" :
+	state == TCP_STATE_SYN_SENT ? "state-syn-sent" :
+	state == TCP_STATE_SYN_RECEIVED ? "state-syn-received" :
+	state == TCP_STATE_ESTABLISHED ? "state-established" :
+	state == TCP_STATE_CLOSE_WAIT ? "state-close-wait" :
+	state == TCP_STATE_FIN_WAIT_1 ? "state-fin-wait-1" :
+	state == TCP_STATE_CLOSING ? "state-closing" :
+	state == TCP_STATE_LAST_ACK ? "state-last-ack" :
+	state == TCP_STATE_FIN_WAIT_2 ? "state-fin-wait-2" :
+	state == TCP_STATE_TIME_WAIT ? "state-time-wait" :
+	"<unknown>";
+#pragma D binding "1.6.3" tcp_state_string
+
+/*
+ * tcpinfo is the TCP header fields.
+ */
+typedef struct tcpinfo {
+	uint16_t tcp_sport;		/* source port */
+	uint16_t tcp_dport;		/* destination port */
+	uint32_t tcp_seq;		/* sequence number */
+	uint32_t tcp_ack;		/* acknowledgment number */
+	uint8_t tcp_offset;		/* data offset, in bytes */
+	uint8_t tcp_flags;		/* flags */
+	uint16_t tcp_window;		/* window size */
+	uint16_t tcp_checksum;		/* checksum */
+	uint16_t tcp_urgent;		/* urgent data pointer */
+	uintptr_t tcp_hdr;		/* raw TCP header */
+} tcpinfo_t;
+
+/*
+ * tcpsinfo contains stable TCP details from tcp_t.
+ */
+typedef struct tcpsinfo {
+	uintptr_t tcps_addr;
+	int tcps_local;			/* is delivered locally, boolean */
+	uint16_t tcps_lport;		/* local port */
+	uint16_t tcps_rport;		/* remote port */
+	string tcps_laddr;		/* local address, as a string */
+	string tcps_raddr;		/* remote address, as a string */
+	int tcps_state;			/* TCP state */
+	uint32_t tcps_iss;		/* Initial sequence # sent */
+	uint32_t tcps_suna;		/* sequence # sent but unacked */
+	uint32_t tcps_snxt;		/* next sequence # to send */
+	uint32_t tcps_rnxt;		/* next sequence # expected */
+	uint32_t tcps_swnd;		/* send window size */
+	int32_t tcps_snd_ws;		/* send window scaling */
+	uint32_t tcps_rwnd;		/* receive window size */
+	int32_t tcps_rcv_ws;		/* receive window scaling */
+	uint32_t tcps_cwnd;		/* congestion window */
+	uint32_t tcps_cwnd_ssthresh;	/* threshold for congestion avoidance */
+	uint32_t tcps_sack_snxt;	/* next SACK seq # for retransmission */
+	uint32_t tcps_rto;		/* round-trip timeout, msec */
+	uint32_t tcps_mss;		/* max segment size */
+	int tcps_retransmit;		/* retransmit send event, boolean */
+	uint32_t tcps_rtt;		/* smoothed avg round-trip time, msec */
+	uint32_t tcps_rtt_sd;		/* standard deviation of RTT */
+	uint32_t tcps_irs;		/* Initial recv sequence # */
+} tcpsinfo_t;
+
+/*
+ * tcplsinfo provides the old tcp state for state changes.
+ */
+typedef struct tcplsinfo {
+	int tcps_state;		/* previous TCP state */
+} tcplsinfo_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < struct tcphdr *T > {
+	tcp_sport = T ? ntohs(T->source) : 0;
+	tcp_dport = T ? ntohs(T->dest) : 0;
+	tcp_seq = T ? ntohl(T->seq) : 0;
+	tcp_ack = T ? ntohl(T->ack_seq) : 0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
+	tcp_window = T ? ntohs(T->window) : 0;
+	tcp_checksum = T ? ntohs(T->check) : 0;
+	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
+
+/*
+ * In the main we simply translate from the "struct [tcp_]sock *" to
+ * a tcpsinfo_t *.  However there are a few exceptions:
+ *
+ * - tcps_state is always derived from arg6.  The reason is that in some
+ * state transitions sock->sk_state does not reflect the actual TCP
+ * connection state.  For example the TIME_WAIT state is handled in
+ * Linux by creating a separate timewait socket and the state of the
+ * original socket is CLOSED.  In some other cases we also need to
+ * instrument state transition prior to the update of sk_state.  To do
+ * all of this we rely on arg6.
+ * - we sometimes need to retrieve local/remote port/address settings from
+ * TCP and IP headers directly, for example prior to the address/port
+ * being committed to the socket.  To do this effectively we need to know
+ * if the packet data is inbound (in which case the local IP/port are the
+ * destination) or outbound (in which case the local IP/port are the source).
+ * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
+ * to reconstruct the address/port info where necessary.  arg2 used for IP
+ * information while arg4 contains the TCP header, so it is used for port data.
+ * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
+ */
+#pragma D binding "1.6.3" translator
+translator tcpsinfo_t < struct tcp_sock *T > {
+	tcps_addr = (uintptr_t)T;
+	tcps_local =
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
+	    (((struct sock *)T)->__sk_common.skc_rcv_saddr ==
+	    ((struct sock *)T)->__sk_common.skc_daddr) :
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
+	    (((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[0]
+	    ==
+	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[0] &&
+	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[1]
+            ==
+            ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[1] &&
+	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[2]
+            ==
+            ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
+	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
+	    : 0;
+	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
+	    ntohs(((struct inet_sock *)T)->inet_sport) :
+	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
+	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
+	    arg4 != NULL ?
+	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
+	    0;
+	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
+	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
+	    arg4 != NULL ?
+	    ntohs(arg7 == NET_PROBE_INBOUND ?
+            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
+	    0;
+	tcps_laddr =
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
+	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
+	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
+	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
+	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
+	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
+	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    &((struct ipv6hdr *)arg2)->daddr :
+	    &((struct ipv6hdr *)arg2)->saddr) :
+	    "<unknown>";
+	tcps_raddr =
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
+	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
+	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
+	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
+	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
+	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
+	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    &((struct ipv6hdr *)arg2)->saddr :
+	    &((struct ipv6hdr *)arg2)->daddr) :
+	    "<unknown>";
+	tcps_state = arg6;
+	tcps_iss = T ?
+	    T->snd_una - (uint32_t)T->bytes_acked : 0;
+	tcps_suna = T ? T->snd_una : 0;
+	tcps_snxt = T ? T->snd_nxt : 0;
+	tcps_rnxt = T ? T->rcv_nxt : 0;
+	tcps_swnd = T ? T->snd_wnd : 0;
+	tcps_snd_ws = T ? T->rx_opt.snd_wscale : 0;
+	tcps_rwnd = T ? T->rcv_wnd : 0;
+	tcps_rcv_ws = T ? T->rx_opt.rcv_wscale : 0;
+	tcps_cwnd = T ? T->snd_cwnd : 0;
+	tcps_cwnd_ssthresh = T ? T->snd_ssthresh : 0;
+	tcps_sack_snxt = (T && T->sacked_out == 0) ? T->snd_una :
+	    (T && T->highest_sack == NULL) ? T->snd_nxt :
+	    (T && T->highest_sack != NULL) ?
+	    ((struct tcp_skb_cb *)&((T->highest_sack->cb[0])))->seq : 0;
+	tcps_rto = T ? T->inet_conn.icsk_rto : 0;
+	tcps_mss = T ? T->mss_cache : 0;
+	tcps_retransmit = T && arg0 ?
+	    (((struct tcp_skb_cb *)&(((struct sk_buff *)arg0)->cb[0]))->end_seq
+	    < T->snd_nxt - 1) : 0;
+	tcps_rtt = T ? (T->srtt_us >> 3)/1000 : 0;
+	tcps_rtt_sd = T ? (T->mdev_us >> 2)/1000 : 0;
+	tcps_irs = T && T->bytes_received > 0 ?
+	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
+};
+
+#pragma D binding "1.6.3" translator
+translator tcplsinfo_t < int I > {
+	tcps_state = I;
+};
diff --git a/dlibs/aarch64/6.10/udp.d b/dlibs/aarch64/6.10/udp.d
new file mode 100644
index 0000000000000..0e44ed6480415
--- /dev/null
+++ b/dlibs/aarch64/6.10/udp.d
@@ -0,0 +1,71 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on library net.d
+#pragma D depends_on provider udp
+
+/*
+ * udpinfo is the UDP header fields.
+ */
+typedef struct udpinfo {
+	uint16_t udp_sport;		/* source port */
+	uint16_t udp_dport;		/* destination port */
+	uint16_t udp_length;		/* total length */
+	uint16_t udp_checksum;          /* headers + data checksum */
+	struct udphdr *udp_hdr;		/* raw UDP header */
+} udpinfo_t;
+
+/*
+ * udpsinfo contains stable UDP details from udp_t.
+ */
+typedef struct udpsinfo {
+	uintptr_t udps_addr;
+	uint16_t udps_lport;		/* local port */
+	uint16_t udps_rport;		/* remote port */
+	string udps_laddr;		/* local address, as a string */
+	string udps_raddr;		/* remote address, as a string */
+} udpsinfo_t;
+
+#pragma D binding "1.6.3" translator
+translator udpinfo_t < struct udphdr *U > {
+	udp_sport = ntohs(U->source);
+	udp_dport = ntohs(U->dest);
+	udp_length = ntohs(U->len);
+	udp_checksum = ntohs(U->check);
+	udp_hdr = U;
+};
+
+#pragma D binding "1.6.3" translator
+translator udpsinfo_t < struct udp_sock *S > {
+	/*
+	 * We source udp info from other args but retain the sock arg here
+	 * as it may be used in the future.
+	 */
+	udps_addr = (uintptr_t)S;
+	udps_lport = arg4 ?
+	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
+	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
+	udps_rport = arg4 ?
+	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
+	    ntohs(((struct udphdr *)arg4)->source)) : 0;
+	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
+            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
+	    &((struct iphdr *)arg2)->daddr) :
+	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
+	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
+	    &((struct ipv6hdr *)arg2)->daddr) :
+	    "<unknown>";
+	udps_raddr =
+	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
+            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
+	    &((struct iphdr *)arg2)->saddr) :
+	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
+	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
+	    &((struct ipv6hdr *)arg2)->saddr) :
+	    "<unknown>";
+};
diff --git a/dlibs/aarch64/6.10/unistd.d b/dlibs/aarch64/6.10/unistd.d
new file mode 100644
index 0000000000000..c38bbed4bc85e
--- /dev/null
+++ b/dlibs/aarch64/6.10/unistd.d
@@ -0,0 +1,36 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+inline int DTRACEFLT_UNKNOWN = 0;	/* Unknown fault */
+#pragma D binding "1.0" DTRACEFLT_UNKNOWN
+
+inline int DTRACEFLT_BADADDR = 1;	/* Bad address */
+#pragma D binding "1.0" DTRACEFLT_BADADDR
+
+inline int DTRACEFLT_BADALIGN = 2;	/* Bad alignment */
+#pragma D binding "1.0" DTRACEFLT_BADALIGN
+
+inline int DTRACEFLT_ILLOP = 3;		/* Illegal operation */
+#pragma D binding "1.0" DTRACEFLT_ILLOP
+
+inline int DTRACEFLT_DIVZERO = 4;	/* Divide-by-zero */
+#pragma D binding "1.0" DTRACEFLT_DIVZERO
+
+inline int DTRACEFLT_NOSCRATCH = 5;	/* Out of scratch space */
+#pragma D binding "1.0" DTRACEFLT_NOSCRATCH
+
+inline int DTRACEFLT_KPRIV = 6;		/* Illegal kernel access */
+#pragma D binding "1.0" DTRACEFLT_KPRIV
+
+inline int DTRACEFLT_UPRIV = 7;		/* Illegal user access */
+#pragma D binding "1.0" DTRACEFLT_UPRIV
+
+inline int DTRACEFLT_TUPOFLOW = 8;	/* Tuple stack overflow */
+#pragma D binding "1.0" DTRACEFLT_TUPOFLOW
+
+inline int DTRACEFLT_BADSTACK = 9;	/* Bad stack */
+#pragma D binding "1.4.1" DTRACEFLT_BADSTACK
diff --git a/dlibs/x86_64/6.10.0/errno.d b/dlibs/x86_64/6.10.0/errno.d
new file mode 100644
index 0000000000000..f54fafe1861cc
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/errno.d
@@ -0,0 +1,275 @@
+
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2012, Oracle and/or its affiliates. All rights reserved.
+ * Use is subject to license terms.
+ */
+
+inline int EPERM = 1;
+#pragma D binding "1.0" EPERM
+inline int ENOENT = 2;
+#pragma D binding "1.0" ENOENT
+inline int ESRCH = 3;
+#pragma D binding "1.0" ESRCH
+inline int EINTR = 4;
+#pragma D binding "1.0" EINTR
+inline int EIO = 5;
+#pragma D binding "1.0" EIO
+inline int ENXIO = 6;
+#pragma D binding "1.0" ENXIO
+inline int E2BIG = 7;
+#pragma D binding "1.0" E2BIG
+inline int ENOEXEC = 8;
+#pragma D binding "1.0" ENOEXEC
+inline int EBADF = 9;
+#pragma D binding "1.0" EBADF
+inline int ECHILD = 10;
+#pragma D binding "1.0" ECHILD
+inline int EAGAIN = 11;
+#pragma D binding "1.0" EAGAIN
+inline int ENOMEM = 12;
+#pragma D binding "1.0" ENOMEM
+inline int EACCES = 13;
+#pragma D binding "1.0" EACCES
+inline int EFAULT = 14;
+#pragma D binding "1.0" EFAULT
+inline int ENOTBLK = 15;
+#pragma D binding "1.0" ENOTBLK
+inline int EBUSY = 16;
+#pragma D binding "1.0" EBUSY
+inline int EEXIST = 17;
+#pragma D binding "1.0" EEXIST
+inline int EXDEV = 18;
+#pragma D binding "1.0" EXDEV
+inline int ENODEV = 19;
+#pragma D binding "1.0" ENODEV
+inline int ENOTDIR = 20;
+#pragma D binding "1.0" ENOTDIR
+inline int EISDIR = 21;
+#pragma D binding "1.0" EISDIR
+inline int EINVAL = 22;
+#pragma D binding "1.0" EINVAL
+inline int ENFILE = 23;
+#pragma D binding "1.0" ENFILE
+inline int EMFILE = 24;
+#pragma D binding "1.0" EMFILE
+inline int ENOTTY = 25;
+#pragma D binding "1.0" ENOTTY
+inline int ETXTBSY = 26;
+#pragma D binding "1.0" ETXTBSY
+inline int EFBIG = 27;
+#pragma D binding "1.0" EFBIG
+inline int ENOSPC = 28;
+#pragma D binding "1.0" ENOSPC
+inline int ESPIPE = 29;
+#pragma D binding "1.0" ESPIPE
+inline int EROFS = 30;
+#pragma D binding "1.0" EROFS
+inline int EMLINK = 31;
+#pragma D binding "1.0" EMLINK
+inline int EPIPE = 32;
+#pragma D binding "1.0" EPIPE
+inline int EDOM = 33;
+#pragma D binding "1.0" EDOM
+inline int ERANGE = 34;
+#pragma D binding "1.0" ERANGE
+inline int EDEADLK = 35;
+#pragma D binding "1.0" EDEADLK
+inline int ENAMETOOLONG = 36;
+#pragma D binding "1.0" ENAMETOOLONG
+inline int ENOLCK = 37;
+#pragma D binding "1.0" ENOLCK
+inline int ENOSYS = 38;
+#pragma D binding "1.0" ENOSYS
+inline int ENOTEMPTY = 39;
+#pragma D binding "1.0" ENOTEMPTY
+inline int ELOOP = 40;
+#pragma D binding "1.0" ELOOP
+inline int EWOULDBLOCK = 11;
+#pragma D binding "1.0" EWOULDBLOCK
+inline int ENOMSG = 42;
+#pragma D binding "1.0" ENOMSG
+inline int EIDRM = 43;
+#pragma D binding "1.0" EIDRM
+inline int ECHRNG = 44;
+#pragma D binding "1.0" ECHRNG
+inline int EL2NSYNC = 45;
+#pragma D binding "1.0" EL2NSYNC
+inline int EL3HLT = 46;
+#pragma D binding "1.0" EL3HLT
+inline int EL3RST = 47;
+#pragma D binding "1.0" EL3RST
+inline int ELNRNG = 48;
+#pragma D binding "1.0" ELNRNG
+inline int EUNATCH = 49;
+#pragma D binding "1.0" EUNATCH
+inline int ENOCSI = 50;
+#pragma D binding "1.0" ENOCSI
+inline int EL2HLT = 51;
+#pragma D binding "1.0" EL2HLT
+inline int EBADE = 52;
+#pragma D binding "1.0" EBADE
+inline int EBADR = 53;
+#pragma D binding "1.0" EBADR
+inline int EXFULL = 54;
+#pragma D binding "1.0" EXFULL
+inline int ENOANO = 55;
+#pragma D binding "1.0" ENOANO
+inline int EBADRQC = 56;
+#pragma D binding "1.0" EBADRQC
+inline int EBADSLT = 57;
+#pragma D binding "1.0" EBADSLT
+inline int EDEADLOCK = 35;
+#pragma D binding "1.0" EDEADLOCK
+inline int EBFONT = 59;
+#pragma D binding "1.0" EBFONT
+inline int ENOSTR = 60;
+#pragma D binding "1.0" ENOSTR
+inline int ENODATA = 61;
+#pragma D binding "1.0" ENODATA
+inline int ETIME = 62;
+#pragma D binding "1.0" ETIME
+inline int ENOSR = 63;
+#pragma D binding "1.0" ENOSR
+inline int ENONET = 64;
+#pragma D binding "1.0" ENONET
+inline int ENOPKG = 65;
+#pragma D binding "1.0" ENOPKG
+inline int EREMOTE = 66;
+#pragma D binding "1.0" EREMOTE
+inline int ENOLINK = 67;
+#pragma D binding "1.0" ENOLINK
+inline int EADV = 68;
+#pragma D binding "1.0" EADV
+inline int ESRMNT = 69;
+#pragma D binding "1.0" ESRMNT
+inline int ECOMM = 70;
+#pragma D binding "1.0" ECOMM
+inline int EPROTO = 71;
+#pragma D binding "1.0" EPROTO
+inline int EMULTIHOP = 72;
+#pragma D binding "1.0" EMULTIHOP
+inline int EDOTDOT = 73;
+#pragma D binding "1.0" EDOTDOT
+inline int EBADMSG = 74;
+#pragma D binding "1.0" EBADMSG
+inline int EOVERFLOW = 75;
+#pragma D binding "1.0" EOVERFLOW
+inline int ENOTUNIQ = 76;
+#pragma D binding "1.0" ENOTUNIQ
+inline int EBADFD = 77;
+#pragma D binding "1.0" EBADFD
+inline int EREMCHG = 78;
+#pragma D binding "1.0" EREMCHG
+inline int ELIBACC = 79;
+#pragma D binding "1.0" ELIBACC
+inline int ELIBBAD = 80;
+#pragma D binding "1.0" ELIBBAD
+inline int ELIBSCN = 81;
+#pragma D binding "1.0" ELIBSCN
+inline int ELIBMAX = 82;
+#pragma D binding "1.0" ELIBMAX
+inline int ELIBEXEC = 83;
+#pragma D binding "1.0" ELIBEXEC
+inline int EILSEQ = 84;
+#pragma D binding "1.0" EILSEQ
+inline int ERESTART = 85;
+#pragma D binding "1.0" ERESTART
+inline int ESTRPIPE = 86;
+#pragma D binding "1.0" ESTRPIPE
+inline int EUSERS = 87;
+#pragma D binding "1.0" EUSERS
+inline int ENOTSOCK = 88;
+#pragma D binding "1.0" ENOTSOCK
+inline int EDESTADDRREQ = 89;
+#pragma D binding "1.0" EDESTADDRREQ
+inline int EMSGSIZE = 90;
+#pragma D binding "1.0" EMSGSIZE
+inline int EPROTOTYPE = 91;
+#pragma D binding "1.0" EPROTOTYPE
+inline int ENOPROTOOPT = 92;
+#pragma D binding "1.0" ENOPROTOOPT
+inline int EPROTONOSUPPORT = 93;
+#pragma D binding "1.0" EPROTONOSUPPORT
+inline int ESOCKTNOSUPPORT = 94;
+#pragma D binding "1.0" ESOCKTNOSUPPORT
+inline int EOPNOTSUPP = 95;
+#pragma D binding "1.0" EOPNOTSUPP
+inline int EPFNOSUPPORT = 96;
+#pragma D binding "1.0" EPFNOSUPPORT
+inline int EAFNOSUPPORT = 97;
+#pragma D binding "1.0" EAFNOSUPPORT
+inline int EADDRINUSE = 98;
+#pragma D binding "1.0" EADDRINUSE
+inline int EADDRNOTAVAIL = 99;
+#pragma D binding "1.0" EADDRNOTAVAIL
+inline int ENETDOWN = 100;
+#pragma D binding "1.0" ENETDOWN
+inline int ENETUNREACH = 101;
+#pragma D binding "1.0" ENETUNREACH
+inline int ENETRESET = 102;
+#pragma D binding "1.0" ENETRESET
+inline int ECONNABORTED = 103;
+#pragma D binding "1.0" ECONNABORTED
+inline int ECONNRESET = 104;
+#pragma D binding "1.0" ECONNRESET
+inline int ENOBUFS = 105;
+#pragma D binding "1.0" ENOBUFS
+inline int EISCONN = 106;
+#pragma D binding "1.0" EISCONN
+inline int ENOTCONN = 107;
+#pragma D binding "1.0" ENOTCONN
+inline int ESHUTDOWN = 108;
+#pragma D binding "1.0" ESHUTDOWN
+inline int ETOOMANYREFS = 109;
+#pragma D binding "1.0" ETOOMANYREFS
+inline int ETIMEDOUT = 110;
+#pragma D binding "1.0" ETIMEDOUT
+inline int ECONNREFUSED = 111;
+#pragma D binding "1.0" ECONNREFUSED
+inline int EHOSTDOWN = 112;
+#pragma D binding "1.0" EHOSTDOWN
+inline int EHOSTUNREACH = 113;
+#pragma D binding "1.0" EHOSTUNREACH
+inline int EALREADY = 114;
+#pragma D binding "1.0" EALREADY
+inline int EINPROGRESS = 115;
+#pragma D binding "1.0" EINPROGRESS
+inline int ESTALE = 116;
+#pragma D binding "1.0" ESTALE
+inline int EUCLEAN = 117;
+#pragma D binding "1.0" EUCLEAN
+inline int ENOTNAM = 118;
+#pragma D binding "1.0" ENOTNAM
+inline int ENAVAIL = 119;
+#pragma D binding "1.0" ENAVAIL
+inline int EISNAM = 120;
+#pragma D binding "1.0" EISNAM
+inline int EREMOTEIO = 121;
+#pragma D binding "1.0" EREMOTEIO
+inline int EDQUOT = 122;
+#pragma D binding "1.0" EDQUOT
+inline int ENOMEDIUM = 123;
+#pragma D binding "1.0" ENOMEDIUM
+inline int EMEDIUMTYPE = 124;
+#pragma D binding "1.0" EMEDIUMTYPE
+inline int ECANCELED = 125;
+#pragma D binding "1.0" ECANCELED
+inline int ENOKEY = 126;
+#pragma D binding "1.0" ENOKEY
+inline int EKEYEXPIRED = 127;
+#pragma D binding "1.0" EKEYEXPIRED
+inline int EKEYREVOKED = 128;
+#pragma D binding "1.0" EKEYREVOKED
+inline int EKEYREJECTED = 129;
+#pragma D binding "1.0" EKEYREJECTED
+inline int EOWNERDEAD = 130;
+#pragma D binding "1.0" EOWNERDEAD
+inline int ENOTRECOVERABLE = 131;
+#pragma D binding "1.0" ENOTRECOVERABLE
+inline int ERFKILL = 132;
+#pragma D binding "1.0" ERFKILL
+inline int EHWPOISON = 133;
+#pragma D binding "1.0" EHWPOISON
+inline int ENOTSUP = 95;
+#pragma D binding "1.0" ENOTSUP
diff --git a/dlibs/x86_64/6.10.0/io.d b/dlibs/x86_64/6.10.0/io.d
new file mode 100644
index 0000000000000..de693c187efcf
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/io.d
@@ -0,0 +1,235 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2012, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on provider sched
+
+typedef char	*caddr_t;
+
+typedef struct bufinfo {
+	int b_flags;			/* buffer status */
+	size_t b_bcount;		/* number of bytes */
+	caddr_t b_addr;			/* buffer address */
+	uint64_t b_lblkno;		/* block # on device */
+	uint64_t b_blkno;		/* expanded block # on device */
+	size_t b_resid;			/* # of bytes not transferred */
+	size_t b_bufsize;		/* size of allocated buffer */
+	caddr_t b_iodone;		/* I/O completion routine */
+	int b_error;			/* expanded error field */
+	dev_t b_edev;			/* extended device */
+} bufinfo_t;
+
+inline int B_BUSY = 0x000001;
+#pragma D binding "1.0" B_BUSY
+inline int B_DONE = 0x000002;
+#pragma D binding "1.0" B_DONE
+inline int B_ERROR = 0x000004;
+#pragma D binding "1.0" B_ERROR
+inline int B_PAGEIO = 0x000010;
+#pragma D binding "1.0" B_PAGEIO
+inline int B_PHYS = 0x000020;
+#pragma D binding "1.0" B_PHYS
+inline int B_READ = 0x000040;
+#pragma D binding "1.0" B_READ
+inline int B_WRITE = 0x000100;
+#pragma D binding "1.0" B_WRITE
+inline int B_ASYNC = 0x000400;
+#pragma D binding "1.0" B_ASYNC
+
+#pragma D binding "1.0" translator
+translator bufinfo_t < struct buffer_head *B > {
+	b_flags = (int)arg1 & 0x01 ? B_WRITE : B_READ;
+	b_addr = B->b_data;
+	b_bcount = B->b_size;
+	b_lblkno = B->b_blocknr;
+	b_blkno = B->b_blocknr;
+	b_resid = 0;
+	b_bufsize = B->b_size;
+	b_iodone = (caddr_t)B->b_end_io;
+	b_error = 0;			/* b_state ?? */
+	b_edev = B->b_bdev->bd_dev;
+};
+
+/*
+ * From linux/blk_types.h.
+ */
+
+/* bit # in bi_flags */
+inline int BIO_USER_MAPPED = 6;
+
+/* bit mask in bi_rw */
+inline int REQ_WRITE = 0x01;
+
+inline int REQ_SYNC = 0x800;
+
+
+
+
+
+
+
+#pragma D binding "1.6.3" translator
+translator bufinfo_t < struct bio *B > {
+	b_flags = ((int)B->bi_opf & REQ_WRITE ? B_WRITE : B_READ) |
+		((int)B->bi_opf & REQ_SYNC ? 0 : B_ASYNC) |
+		((int)B->bi_flags & (1 << BIO_USER_MAPPED) ? B_PAGEIO : B_PHYS);
+	b_addr = 0;
+	b_bcount = B->bi_iter.bi_size;
+	b_lblkno = B->bi_iter.bi_sector;
+	b_blkno = B->bi_iter.bi_sector;
+	b_resid = 0;
+	b_bufsize = B->bi_iter.bi_size;
+	b_iodone = (caddr_t)B->bi_end_io;
+	b_error = 0;
+	b_edev = B->bi_bdev == NULL ? 0 : B->bi_bdev->bd_dev;
+};
+
+typedef struct devinfo {
+	int dev_major;			/* major number */
+	int dev_minor;			/* minor number */
+	int dev_instance;		/* instance number */
+	string dev_name;		/* name of device */
+	string dev_statname;		/* name of device + instance/minor */
+	string dev_pathname;		/* pathname of device */
+} devinfo_t;
+
+
+
+#pragma D binding "1.0" translator
+translator devinfo_t < struct buffer_head *B > {
+	dev_major = getmajor(B->b_bdev->bd_dev);
+	dev_minor = getminor(B->b_bdev->bd_dev);
+	dev_instance = 0;		/* not used? */
+	dev_name = B->b_bdev->bd_disk->part0->bd_device.parent
+	    ? B->b_bdev->bd_disk->part0->bd_device.parent->driver->name
+		? stringof(B->b_bdev->bd_disk->part0->bd_device.parent->driver->name)
+		: "<none>"
+	    : B->b_bdev->bd_disk->part0->bd_device.driver->name
+		? stringof(B->b_bdev->bd_disk->part0->bd_device.driver->name)
+		: "<none>";
+	dev_statname = B->b_bdev->__bd_flags.counter & 255 == 0
+			? stringof(B->b_bdev->bd_disk->disk_name)
+			: strjoin(stringof(B->b_bdev->bd_disk->disk_name),
+				  lltostr(B->b_bdev->__bd_flags.counter & 255));
+	dev_pathname = strjoin(
+			"/dev/",
+			B->b_bdev->__bd_flags.counter & 255 == 0
+			    ? stringof(B->b_bdev->bd_disk->disk_name)
+			    : strjoin(stringof(B->b_bdev->bd_disk->disk_name),
+				      lltostr(B->b_bdev->__bd_flags.counter & 255))
+		       );
+};
+
+#pragma D binding "1.6.3" translator
+translator devinfo_t < struct bio *B > {
+	dev_major = B->bi_bdev == NULL ? 0 : getmajor(B->bi_bdev->bd_dev);
+	dev_minor = B->bi_bdev == NULL ? 0 : getminor(B->bi_bdev->bd_dev);
+	dev_instance = 0;
+	dev_name = B->bi_bdev == NULL
+			? "nfs"
+			: stringof(((struct blk_major_name **)`major_names)[
+					getmajor(B->bi_bdev->bd_dev) % 255
+				   ]->name);
+	dev_statname = B->bi_bdev == NULL ? "nfs" :
+	    B->bi_bdev->__bd_flags.counter & 255 == 0 ? stringof(B->bi_bdev->bd_disk->disk_name) :
+	    strjoin(stringof(B->bi_bdev->bd_disk->disk_name), lltostr(B->bi_bdev->__bd_flags.counter & 255));
+	dev_pathname = B->bi_bdev == NULL ? "<nfs>" : "<unknown>";
+};
+
+typedef struct fileinfo {
+	string fi_name;			/* name (basename of fi_pathname) */
+	string fi_dirname;		/* directory (dirname of fi_pathname) */
+	string fi_pathname;		/* full pathname */
+	loff_t fi_offset;		/* offset within file */
+	string fi_fs;			/* filesystem */
+	string fi_mount;		/* mount point of file system */
+	int fi_oflags;			/* open(2) flags for file descriptor */
+} fileinfo_t;
+
+#pragma D binding "1.0" translator
+translator fileinfo_t < struct buffer_head *B > {
+	fi_name = "<unknown>";
+	fi_dirname = "<unknown>";
+	fi_pathname = "<unknown>";
+	fi_offset = 0;
+	fi_fs = "<unknown>";
+	fi_mount = "<unknown>";
+	fi_oflags = 0;
+};
+
+inline int O_ACCMODE = 0003;
+#pragma D binding "1.1" O_ACCMODE
+inline int O_RDONLY = 00;
+#pragma D binding "1.1" O_RDONLY
+inline int O_WRONLY = 01;
+#pragma D binding "1.1" O_WRONLY
+inline int O_RDWR = 02;
+#pragma D binding "1.1" O_RDWR
+inline int O_CREAT = 00000100;
+#pragma D binding "1.1" O_CREAT
+inline int O_EXCL = 00000200;
+#pragma D binding "1.1" O_EXCL
+inline int O_NOCTTY = 00000400;
+#pragma D binding "1.1" O_NOCTTY
+inline int O_TRUNC = 00001000;
+#pragma D binding "1.1" O_TRUNC
+inline int O_APPEND = 00002000;
+#pragma D binding "1.1" O_APPEND
+inline int O_NONBLOCK = 00004000;
+#pragma D binding "1.1" O_NONBLOCK
+inline int O_NDELAY = 00004000;
+#pragma D binding "1.1" O_NDELAY
+inline int O_SYNC = (04000000|010000);
+#pragma D binding "1.1" O_SYNC
+inline int O_FSYNC = (04000000|010000);
+#pragma D binding "1.1" O_FSYNC
+inline int O_ASYNC = 020000;
+#pragma D binding "1.1" O_ASYNC
+inline int O_DIRECTORY = 0200000;
+#pragma D binding "1.1" O_DIRECTORY
+inline int O_NOFOLLOW = 0400000;
+#pragma D binding "1.1" O_NOFOLLOW
+inline int O_CLOEXEC = 02000000;
+#pragma D binding "1.1" O_CLOEXEC
+inline int O_DSYNC = 010000;
+#pragma D binding "1.1" O_DSYNC
+inline int O_RSYNC = (04000000|010000);
+#pragma D binding "1.1" O_RSYNC
+
+#pragma D binding "1.1" translator
+translator fileinfo_t < struct file *F > {
+	fi_name = F == NULL
+			? "<none>"
+			: stringof(F->f_path.dentry->d_name.name);
+	fi_dirname = F == NULL
+			? "<none>"
+			: dirname(d_path(&(F->f_path)));
+	fi_pathname = F == NULL
+			? "<none>"
+			: d_path(&(F->f_path));
+	fi_offset = F == NULL
+			? 0
+			: F->f_pos;
+	fi_fs = F == NULL
+			? "<none>"
+			: stringof(F->f_path.mnt->mnt_sb->s_type->name);
+	fi_mount = F == NULL
+			? "<none>"
+			: "<unknown>";
+	fi_oflags = F == NULL
+			? 0
+			: F->f_flags;
+};
+
+inline fileinfo_t fds[int fd] = xlate <fileinfo_t> (
+				 fd >= 0 && fd < curthread->files->fdt->max_fds
+					? curthread->files->fdt->fd[fd]
+					: NULL
+				);
+
+#pragma D attributes Stable/Stable/Common fds
+#pragma D binding "1.1" fds
diff --git a/dlibs/x86_64/6.10.0/ip.d b/dlibs/x86_64/6.10.0/ip.d
new file mode 100644
index 0000000000000..f8b77f1224115
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/ip.d
@@ -0,0 +1,341 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on library net.d
+#pragma D depends_on library procfs.d
+#pragma D depends_on provider ip
+
+inline int IPPROTO_IP		=	0;
+inline int IPPROTO_ICMP		=	1;
+inline int IPPROTO_IGMP		=	2;
+inline int IPPROTO_IPIP		=	4;
+inline int IPPROTO_TCP		=	6;
+inline int IPPROTO_EGP		=	8;
+inline int IPPROTO_PUP		=	12;
+inline int IPPROTO_UDP		=	17;
+inline int IPPROTO_IDP		=	22;
+inline int IPPROTO_TP		=	29;
+inline int IPPROTO_DCCP		=	33;
+inline int IPPROTO_IPV6		=	41;
+inline int IPPROTO_RSVP		=	46;
+inline int IPPROTO_GRE		=	47;
+inline int IPPROTO_ESP		=	50;
+inline int IPPROTO_AH		=	51;
+inline int IPPROTO_OSPF		=	89;
+inline int IPPROTO_MTP		=	92;
+inline int IPPROTO_BEETPH	=	94;
+inline int IPPROTO_ENCAP	=	98;
+inline int IPPROTO_PIM		=	103;
+inline int IPPROTO_COMP		=	108;
+inline int IPPROTO_SCTP		=	132;
+inline int IPPROTO_UDPLITE	=	136;
+inline int IPPROTO_RAW		=	255;
+inline int IPPROTO_MAX		=	256;
+inline int IPPROTO_HOPOPTS	=	0;
+inline int IPPROTO_ROUTING	=	43;
+inline int IPPROTO_FRAGMENT	=	44;
+inline int IPPROTO_ICMPV6	=	58;
+inline int IPPROTO_NONE		=	59;
+inline int IPPROTO_DSTOPTS	=	60;
+inline int IPPROTO_MH		=	135;
+
+inline int TCP_MIN_HEADER_LENGTH =	20;
+
+/*
+ * For compatibility with Solaris.  Here the netstackid will be the pointer
+ * to the net namespace (nd_net in struct net_device).
+ */
+typedef uint64_t	netstackid_t;
+typedef __be32		ipaddr_t;
+typedef struct in6_addr	in6_addr_t;
+
+/*
+ * pktinfo is where packet ID info can be made available for deeper
+ * analysis if packet IDs become supported by the kernel in the future.
+ * The pkt_addr member is currently always NULL.
+ */
+typedef struct pktinfo {
+	uintptr_t pkt_addr;
+} pktinfo_t;
+
+/*
+ * csinfo is where connection state info is made available.
+ */
+typedef struct csinfo {
+	uintptr_t cs_addr;
+	uint64_t cs_cid;
+} csinfo_t;
+
+/*
+ * ipinfo contains common IP info for both IPv4 and IPv6.
+ */
+typedef struct ipinfo {
+	uint8_t ip_ver;			/* IP version (4, 6) */
+	uint32_t ip_plength;		/* payload length */
+	string ip_saddr;		/* source address */
+	string ip_daddr;		/* destination address */
+} ipinfo_t;
+
+/*
+ * ifinfo contains network interface info.
+ */
+typedef struct ifinfo {
+	string if_name;			/* interface name */
+	int8_t if_local;		/* is delivered locally */
+	netstackid_t if_ipstack;	/* netns pointer on Linux */
+	uintptr_t if_addr;		/* pointer to raw struct net_device */
+} ifinfo_t;
+
+/*
+ * ipv4info is a translated version of the IPv4 header (with raw pointer).
+ * These values are NULL if the packet is not IPv4.
+ */
+typedef struct ipv4info {
+	uint8_t ipv4_ver;		/* IP version (4) */
+	uint8_t ipv4_ihl;		/* header length, bytes */
+	uint8_t ipv4_tos;		/* type of service field */
+	uint16_t ipv4_length;		/* length (header + payload) */
+	uint16_t ipv4_ident;		/* identification */
+	uint8_t ipv4_flags;		/* IP flags */
+	uint16_t ipv4_offset;		/* fragment offset */
+	uint8_t ipv4_ttl;		/* time to live */
+	uint8_t ipv4_protocol;		/* next level protocol */
+	string ipv4_protostr;		/* next level protocol, as string */
+	uint16_t ipv4_checksum;		/* header checksum */
+	ipaddr_t ipv4_src;		/* source address */
+	ipaddr_t ipv4_dst;		/* destination address */
+	string ipv4_saddr;		/* source address, string */
+	string ipv4_daddr;		/* destination address, string */
+	struct iphdr *ipv4_hdr;		/* pointer to raw header */
+} ipv4info_t;
+
+/*
+ * ipv6info is a translated version of the IPv6 header (with raw pointer).
+ * These values are NULL if the packet is not IPv6.
+ */
+typedef struct ipv6info {
+	uint8_t ipv6_ver;		/* IP version (6) */
+	uint8_t ipv6_tclass;		/* traffic class */
+	uint32_t ipv6_flow;		/* flow label */
+	uint16_t ipv6_plen;		/* payload length */
+	uint8_t ipv6_nexthdr;		/* next header protocol */
+	string ipv6_nextstr;		/* next header protocol, as string */
+	uint8_t ipv6_hlim;		/* hop limit */
+	in6_addr_t *ipv6_src;		/* source address */
+	in6_addr_t *ipv6_dst;		/* destination address */
+	string ipv6_saddr;		/* source address, string */
+	string ipv6_daddr;		/* destination address, string */
+	struct ipv6hdr *ipv6_hdr;	/* pointer to raw header */
+} ipv6info_t;
+
+/*
+ * void_ip_t is a void pointer to either an IPv4 or IPv6 header.  It has
+ * its own type name so that a translator can be determined.
+ */
+typedef uintptr_t void_ip_t;
+
+/*
+ * __dtrace_tcp_void_ip_t is used by the translator to take either the
+ * non-NULL void_ip_t * passed in or, if it is NULL, uses arg3 (struct tcp *)
+ * from the tcp:::send probe to translate to an ipinfo_t.
+ * This allows us to present the consumer with header data based on the
+ * struct tcp * when IP information is not yet present (for TCP send).
+ */
+typedef void * __dtrace_tcp_void_ip_t;
+
+#pragma D binding "1.5" translator
+translator pktinfo_t < struct sk_buff *s > {
+	pkt_addr = (uintptr_t)s;
+};
+
+#pragma D binding "1.5" translator
+translator csinfo_t < struct sock *s > {
+	cs_addr = (uintptr_t)s;
+};
+
+#pragma D binding "1.5" translator
+translator ipinfo_t < struct iphdr *I > {
+	ip_ver = 4;
+        ip_plength = I != NULL ? (ntohs(I->tot_len) - I->ihl << 2) : 0;
+	ip_saddr = I != NULL ? inet_ntoa(&I->saddr) : "<unknown>";
+	ip_daddr = I != NULL ? inet_ntoa(&I->daddr) : "<unknown>";
+};
+
+#pragma D binding "1.5" translator
+translator ipinfo_t < struct ipv6hdr *I > {
+	ip_ver = 6;
+	ip_plength = I != NULL ? ntohs(I->payload_len) : 0;
+	ip_saddr = I != NULL ? inet_ntoa6(&I->saddr) : "<unknown>";
+	ip_daddr = I != NULL ? inet_ntoa6(&I->daddr) : "<unknown>";
+};
+
+#pragma D binding "1.5" translator
+translator ipinfo_t < void_ip_t *I > {
+	ip_ver = I != NULL ? *(uint8_t *)I >> 4 : 0;
+	ip_plength = I != NULL ? (*(uint8_t *)I >> 4 == 4 ?
+	    (ntohs(((struct iphdr *)I)->tot_len) - ((*(uint8_t *)I & 0xf) << 2)) :
+	    *(uint8_t *)I >> 4 == 6 ?
+	    ntohs(((struct ipv6hdr *)I)->payload_len) : 0) : 0;
+	ip_saddr = I != NULL ? (*(uint8_t *)I >> 4 == 4 ?
+	    inet_ntoa(&((struct iphdr *)I)->saddr) : *(uint8_t *)I >> 4 == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) : "<unknown>") :
+	    "<unknown>";
+	ip_daddr = I != NULL ? (*(uint8_t *)I >> 4 == 4 ?
+	    inet_ntoa(&((struct iphdr *)I)->daddr) : *(uint8_t *)I >> 4 == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) : "<unknown>") :
+	    "<unknown>";
+};
+
+/*
+ * In some cases where the ipinfo_t * is NULL we wish to construct IP info
+ * using the struct tcp_sock * (arg3).  In order to map local IP to source
+ * or destination IP address appropriately we need to check if the associated
+ * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
+ * the value is stored in arg7.  If inbound, we map the local IP address to
+ * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
+ */
+#pragma D binding "1.5" translator
+translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
+	/*
+	 * General strategy used is to rely on the IP header I if it is
+	 * non-null; otherwise we try to reconstruct IP values from arg3
+	 * (a struct tcp_sock *).
+	 */
+	ip_ver = I != NULL ? *(uint8_t *)I >> 4 :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET ? 4 :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ? 6 : 0;
+	/*
+	 * For ip_plength we fall back to using TCP skb data from the tcp_skb_cb
+	 * to determine payload length.
+	 */
+	ip_plength = I != NULL && *(uint8_t *)I >> 4 == 4 ?
+	    ntohs(((struct iphdr *)I)->tot_len) - ((*(uint8_t *)I & 0xf) << 2) :
+	    I != NULL && *(uint8_t *)I >> 4 == 6 ?
+	    ntohs(((struct ipv6hdr *)I)->payload_len) :
+	    arg0 != NULL ?
+	    ((struct tcp_skb_cb *)&(((struct sk_buff *)arg0)->cb[0]))->end_seq -
+	    ((struct tcp_skb_cb *)&(((struct sk_buff *)arg0)->cb[0]))->seq :
+	    0;
+	/*
+	 * For source/destination addresses, we again try to use the IP header I
+	 * if available.  If I is NULL, we utilize arg3 (struct tcp_sock *)
+	 * but the problem here is that it stores local and remote IP addresses
+	 * _not_ source and destination.  So we need to know if traffic is
+	 * inbound or outbound. If inbound, IP source address is remote
+	 * socket address (skc_daddr) and destination IP address is local socket
+	 * address (skc_rcv_saddr).  If outbound, IP source address is local
+	 * socket address and IP destination address is remote socket address.
+	 */
+	ip_saddr = I != NULL && *(uint8_t *)I >> 4 == 4 ?
+	    inet_ntoa(&((struct iphdr *)I)->saddr) :
+	    I != NULL && *(uint8_t *)I >> 4 == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
+	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    &((struct sock *)arg3)->__sk_common.skc_daddr :
+	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
+	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
+	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
+	    "<unknown>";
+	ip_daddr = I != NULL && *(uint8_t *)I >> 4 == 4 ?
+	    inet_ntoa(&((struct iphdr *)I)->daddr) :
+	    I != NULL && *(uint8_t *)I >> 4 == 6 ?
+	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
+	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
+	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
+	    arg3 != NULL &&
+	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
+	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
+	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
+	    "<unknown>";
+};
+
+#pragma D binding "1.5" translator
+translator ifinfo_t < struct net_device *N > {
+	if_name = N != NULL ? stringof(N->name) : "<unknown>";
+	if_ipstack = (N != NULL && sizeof(N->nd_net) > 0) ?
+	    ((uint64_t)N->nd_net.net) : 0;
+	if_local = (N == NULL);	/* is delivered locally */
+	if_addr = (uintptr_t)N;	/* pointer to raw struct net_device ptr */
+};
+
+#pragma D binding "1.5" translator
+translator ipv4info_t < struct iphdr *I > {
+	ipv4_ver = I != NULL ? 4 : 0;
+	ipv4_ihl = I != NULL ? ((*(uint8_t *)I & 0xf) << 2) : 0;
+	ipv4_tos = I != NULL ? I->tos : 0;
+	ipv4_length = I != NULL ? ntohs(I->tot_len) : 0;
+	ipv4_ident = I != NULL ? ntohs(I->id) : 0;
+	ipv4_flags = I != NULL ? ntohs(I->frag_off) >> 12 : 0;
+	ipv4_offset = I != NULL ? ntohs(I->frag_off) & 0x0fff : 0;
+	ipv4_ttl = I != NULL ? I->ttl : 0;
+	ipv4_protocol = I != NULL ? I->protocol : 0;
+	ipv4_protostr = I == NULL ? "<null>" :
+	    I->protocol == IPPROTO_TCP     ? "TCP"    :
+	    I->protocol == IPPROTO_UDP     ? "UDP"    :
+	    I->protocol == IPPROTO_IP      ? "IP"     :
+	    I->protocol == IPPROTO_ICMP    ? "ICMP"   :
+	    I->protocol == IPPROTO_IGMP    ? "IGMP"   :
+	    I->protocol == IPPROTO_EGP     ? "EGP"    :
+	    I->protocol == IPPROTO_IPV6    ? "IPv6"   :
+	    I->protocol == IPPROTO_ROUTING ? "ROUTE"  :
+	    I->protocol == IPPROTO_ESP     ? "ESP"    :
+	    I->protocol == IPPROTO_AH      ? "AH"     :
+	    I->protocol == IPPROTO_ICMPV6  ? "ICMPv6" :
+	    I->protocol == IPPROTO_OSPF    ? "OSPF"   :
+	    I->protocol == IPPROTO_SCTP    ? "SCTP"   :
+	    I->protocol == IPPROTO_RAW     ? "RAW"    :
+	    lltostr((uint64_t)I->protocol);
+	ipv4_checksum = I != NULL ? ntohs(I->check) : 0;
+	ipv4_src = I != NULL ? I->saddr : 0;
+	ipv4_dst = I != NULL ? I->daddr : 0;
+	ipv4_saddr = I != NULL ? inet_ntoa(&I->saddr) : "<null>";
+	ipv4_daddr = I != NULL ? inet_ntoa(&I->daddr) : "<null>";
+	ipv4_hdr = I;
+};
+
+#pragma D binding "1.5" translator
+translator ipv6info_t < struct ipv6hdr *I > {
+	ipv6_ver = I != NULL ? ((*(uint8_t *)I) >> 4) : 0;
+	ipv6_tclass = I != NULL ? ((ntohl(*(uint32_t *)I) & 0x0fffffff) >> 20) : 0;
+	ipv6_flow = I != NULL ? (ntohl(*(uint32_t *)I) & 0x000fffff) : 0;
+	ipv6_plen = I != NULL ? ntohs(I->payload_len) : 0;
+	ipv6_nexthdr = I != NULL ? I->nexthdr : 0;
+	ipv6_nextstr = I == NULL ? "<null>" :
+	    I->nexthdr == IPPROTO_TCP	?	"TCP"		:
+	    I->nexthdr == IPPROTO_UDP	?	"UDP"		:
+	    I->nexthdr == IPPROTO_IP	?	"IP"		:
+	    I->nexthdr == IPPROTO_ICMP	?	"ICMP"		:
+	    I->nexthdr == IPPROTO_IGMP	?	"IGMP"		:
+	    I->nexthdr == IPPROTO_EGP	?	"EGP"		:
+	    I->nexthdr == IPPROTO_IPV6	?	"IPv6"		:
+	    I->nexthdr == IPPROTO_ROUTING ?	"ROUTE"		:
+	    I->nexthdr == IPPROTO_ESP	?	"ESP"		:
+	    I->nexthdr == IPPROTO_AH	?	"AH"		:
+	    I->nexthdr == IPPROTO_ICMPV6 ?	"ICMPv6"	:
+	    I->nexthdr == IPPROTO_OSPF ?	"OSPF"		:
+	    I->nexthdr == IPPROTO_SCTP	?	"SCTP"		:
+	    I->nexthdr == IPPROTO_RAW	?	"RAW"		:
+	    lltostr((uint64_t)I->nexthdr);
+	ipv6_hlim = I != NULL ? I->hop_limit : 0;
+	ipv6_src = I != NULL ? &I->saddr : NULL;
+	ipv6_dst = I != NULL ? &I->daddr : 0;
+	ipv6_saddr = I != NULL ? inet_ntoa6(&I->saddr) : "<null>";
+	ipv6_daddr = I != NULL ? inet_ntoa6(&I->daddr) : "<null>";
+	ipv6_hdr = I;
+};
diff --git a/dlibs/x86_64/6.10.0/lockstat.d b/dlibs/x86_64/6.10.0/lockstat.d
new file mode 100644
index 0000000000000..cb8b4bd96f1ac
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/lockstat.d
@@ -0,0 +1,14 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on provider lockstat
+
+inline int RW_WRITER = 0x00;
+#pragma D binding "1.6.4" RW_WRITER
+inline int RW_READER = 0x01;
+#pragma D binding "1.6.4" RW_READER
diff --git a/dlibs/x86_64/6.10.0/net.d b/dlibs/x86_64/6.10.0/net.d
new file mode 100644
index 0000000000000..6ac3428747a77
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/net.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* These are needed for inet_ntop() DTrace function. */
+inline int AF_INET              =       2;
+inline int AF_INET6             =       10;
+
+/* These are needed for link_ntop() DTrace function. */
+inline int ARPHRD_ETHER         =       1;
+inline int ARPHRD_INFINIBAND    =       32;
+
+/*
+ * The conninfo_t structure should be used by all application protocol
+ * providers as the first arguments to indicate some basic information
+ * about the connection. This structure may be augmented to accommodate
+ * the particularities of additional protocols in the future.
+ */
+typedef struct conninfo {
+	 string ci_local;	/* local host address */
+	 string ci_remote;	/* remote host address */
+	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
+} conninfo_t;
+
+/*
+ * We use these values to determine if a probe point is associated
+ * with sending (outbound) or receiving (inbound).
+ */
+inline int NET_PROBE_OUTBOUND =		0x00;
+inline int NET_PROBE_INBOUND =		0x01;
diff --git a/dlibs/x86_64/6.10.0/pcap.d b/dlibs/x86_64/6.10.0/pcap.d
new file mode 100644
index 0000000000000..21a8e74a4036d
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/pcap.d
@@ -0,0 +1,35 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2016, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on provider ip
+
+/*
+ * In general, PCAP_<type> names are chosen to match DL_<type> DLPI
+ * datalink types.
+ */
+
+/*
+ * Network-related capture types.  Raw DLT_* values can be used for those
+ * not present here; see /usr/include/pcap/bpf.h for the full list.
+ */
+
+inline int PCAP_NULL = 0;
+#pragma D binding "1.12" PCAP_NULL
+inline int PCAP_ETHER = 1;
+#pragma D binding "1.12" PCAP_ETHER
+inline int PCAP_WIFI = 105;
+#pragma D binding "1.12" PCAP_WIFI
+inline int PCAP_PPP = 9;
+#pragma D binding "1.12" PCAP_PPP
+/* PCAP_IP can signify IPv4 or IPv6 header follows. */
+inline int PCAP_IP = 12;
+#pragma D binding "1.12" PCAP_IP
+
+/* InfiniBand-related capture types. */
+inline int PCAP_IPOIB = 242;
+#pragma D binding "1.12" PCAP_IPOIB
diff --git a/dlibs/x86_64/6.10.0/procfs.d b/dlibs/x86_64/6.10.0/procfs.d
new file mode 100644
index 0000000000000..5d7873b5e0091
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/procfs.d
@@ -0,0 +1,306 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2012, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * This file defines the standard set of inlines and translators to be made
+ * available for all D programs to use to examine process model state.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on library sched.d
+
+typedef time64_t time_t;
+
+typedef struct timestruc {
+	time_t tv_sec;
+	long tv_nsec;
+} timestruc_t;
+
+typedef struct lwpsinfo {
+	int pr_flag;			/* lwp flags (DEPRECATED) */
+	int pr_lwpid;			/* lwp id */
+	uintptr_t pr_addr;		/* internal address of lwp */
+	uintptr_t pr_wchan;		/* wait addr for sleeping lwp */
+	char pr_stype;			/* sync event type */
+	char pr_state;			/* numeric lwp state */
+	char pr_sname;			/* printable char for pr_state */
+	char pr_nice;			/* nice for cpu usage */
+	short pr_syscall;		/* syscall number */
+	char pr_oldpri;			/* priority */
+	char pr_cpu;			/* CPU usage */
+	int pr_pri;			/* priority */
+	ushort_t pr_pctcpu;		/* % of recent cpu time */
+	ushort_t pr_pad;
+	timestruc_t pr_start;		/* lwp start time */
+	timestruc_t pr_time;		/* usr+sys cpu time */
+	char pr_clname[8];		/* scheduling class name */
+	char pr_name[16];		/* name */
+	processorid_t pr_onpro;		/* processor last ran on */
+	processorid_t pr_bindpro;	/* processor bound to */
+	psetid_t pr_bindpset;		/* processor set */
+	int pr_lgrp;			/* lwp home lgroup */
+	int pr_filler[4];
+} lwpsinfo_t;
+
+typedef id_t taskid_t;
+typedef id_t dprojid_t;
+typedef id_t poolid_t;
+typedef id_t zoneid_t;
+
+/*
+ * Translate from the kernel's task_struct structure to a Solaris proc(4)
+ * psinfo_t struct.
+ * We do not provide support for pr_size, pr_rssize, pr_pctcpu, and pr_pctmem.
+ * We also do not fill in pr_lwp (the lwpsinfo_t for the representative LWP)
+ * because we do not have the ability to select and stop any representative.
+ * Also, for the moment, pr_wstat, pr_time, and pr_ctime are not supported,
+ * but these could be supported by DTrace in the future using subroutines.
+ * Note that any member added to this translator should also be added to the
+ * kthread_t-to-psinfo_t translator, below.
+ */
+typedef struct psinfo {
+	int pr_flag;			/* process flags (DEPRECATED) */
+	int pr_nlwp;			/* number of active lwps (Linux: 1) */
+	pid_t pr_pid;			/* unique process id */
+	pid_t pr_ppid;			/* process id of parent */
+	pid_t pr_pgid;			/* pid of process group leader */
+	pid_t pr_sid;			/* session id */
+	uid_t pr_uid;			/* real user id */
+	uid_t pr_euid;			/* effective user id */
+	uid_t pr_gid;			/* real group id */
+	uid_t pr_egid;			/* effective group id */
+	uintptr_t pr_addr;		/* address of process */
+	size_t pr_size;			/* size of process image (in KB) */
+	size_t pr_rssize;		/* resident set sie (in KB) */
+	size_t pr_pad1;
+	struct tty_struct *pr_ttydev;	/* controlling tty (or -1) */
+	ushort_t pr_pctcpu;		/* % of recent cpu time used */
+	ushort_t pr_pctmem;		/* % of recent memory used */
+	timestruc_t pr_start;		/* process start time */
+	timestruc_t pr_time;		/* usr+sys cpu time for process */
+	timestruc_t pr_ctime;		/* usr+sys cpu time for children */
+	char pr_fname[16];		/* name of exec'd file */
+	char pr_psargs[80];		/* initial chars of arg list */
+	int pr_wstat;			/* if zombie, wait() status */
+	int pr_argc;			/* initial argument count */
+	uintptr_t pr_argv;		/* address of initial arg vector */
+	uintptr_t pr_envp;		/* address of initial env vector */
+	char pr_dmodel;			/* data model */
+	char pr_pad2[3];
+	taskid_t pr_taskid;		/* task id */
+	dprojid_t pr_projid;		/* project id */
+	int pr_nzomb;			/* number of zombie lwps (Linux: 0) */
+	poolid_t pr_poolid;		/* pool id */
+	zoneid_t pr_zoneid;		/* zone id */
+	id_t pr_contract;		/* process contract */
+	int pr_filler[1];
+	lwpsinfo_t pr_lwp;
+} psinfo_t;
+
+inline char PR_MODEL_ILP32 = 1;
+#pragma D binding "1.0" PR_MODEL_ILP32
+inline char PR_MODEL_LP64 = 2;
+#pragma D binding "1.0" PR_MODEL_LP64
+
+ 
+ 
+inline	int PIDTYPE_PID = 0;
+#pragma D binding "1.0" PIDTYPE_PID
+inline	int PIDTYPE_TGID = 1;
+#pragma D binding "1.0" PIDTYPE_TGID
+inline	int PIDTYPE_PGID = 2;
+#pragma D binding "1.0" PIDTYPE_PGID
+inline	int PIDTYPE_SID = 3;
+#pragma D binding "1.0" PIDTYPE_SID
+
+ 
+ 
+ 
+ 
+ 
+ 
+ 
+#pragma D binding "1.0" translator
+translator psinfo_t < struct task_struct *T > {
+	pr_nlwp = 1;
+	pr_pid = T->tgid;
+	pr_ppid = T->real_parent->tgid;
+	pr_pgid = T->signal->pids[PIDTYPE_PGID]->numbers[0].nr;
+	pr_sid = T->signal->pids[PIDTYPE_SID]->numbers[0].nr;
+	pr_uid = T->cred->uid.val;
+	pr_euid = T->cred->euid.val;
+	pr_gid = T->cred->gid.val;
+	pr_egid = T->cred->egid.val;
+	pr_addr = (uintptr_t)T;
+
+	pr_ttydev = T->signal->tty ? T->signal->tty
+				   : (struct tty_struct *)-1;
+
+	pr_fname = T->comm;
+/*
+	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
+ */
+	pr_wstat = 0;
+/*
+	pr_argc = get_psinfo(T)->__psinfo(argc);
+	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
+	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
+ */
+
+	pr_dmodel = PR_MODEL_LP64;
+
+	pr_taskid = 0;
+	pr_projid = 0;
+	pr_nzomb = 0;
+	pr_poolid = 0;
+	pr_zoneid = 0;
+	pr_contract = 0;
+};
+
+inline int PR_STOPPED = 0x00000001;
+#pragma D binding "1.0" PR_STOPPED
+inline int PR_ISTOP = 0x00000002;
+#pragma D binding "1.0" PR_ISTOP
+inline int PR_DSTOP = 0x00000004;
+#pragma D binding "1.0" PR_DSTOP
+inline int PR_IDLE = 0x10000000;
+#pragma D binding "1.0" PR_IDLE
+
+inline char SSLEEP = 1;
+#pragma D binding "1.0" SSLEEP
+inline char SRUN = 2;
+#pragma D binding "1.0" SRUN
+inline char SZOMB = 3;
+#pragma D binding "1.0" SZOMB
+inline char SSTOP = 4;
+#pragma D binding "1.0" SSTOP
+inline char SIDL = 5;
+#pragma D binding "1.0" SIDL
+inline char SONPROC = 6;
+#pragma D binding "1.0" SONPROC
+inline char SWAIT = 7;
+#pragma D binding "1.0" SWAIT
+
+/*
+ * Translate from the kernel's task_struct structure to a Solaris proc(4)
+ * lwpsinfo_t.
+ * We do not provide support for pr_nice, pr_oldpri, pr_cpu, or pr_pctcpu.
+ * Also, for the moment, pr_start and pr_time are not supported, but these
+ * could be supported by DTrace in the future using subroutines.
+ */
+#pragma D binding "1.0" translator
+translator lwpsinfo_t < struct task_struct *T > {
+	pr_flag = (T->__state & 0x00000004) ? PR_STOPPED : 0;
+/*
+	pr_flag = ((T->t_state == TS_STOPPED) ? (PR_STOPPED |
+	    ((!(T->t_schedflag & TS_PSTART)) ? PR_ISTOP : 0)) :
+	    ((T->t_proc_flag & TP_PRVSTOP) ? PR_STOPPED | PR_ISTOP : 0)) |
+	    ((T == T->t_procp->p_agenttp) ? PR_AGENT : 0) |
+	    ((!(T->t_proc_flag & TP_TWAIT)) ? PR_DETACH : 0) |
+	    ((T->t_proc_flag & TP_DAEMON) ? PR_DAEMON : 0) |
+	    ((T->t_procp->p_pidflag & CLDNOSIGCHLD) ? PR_NOSIGCHLD : 0) |
+	    ((T->t_procp->p_pidflag & CLDWAITPID) ? PR_WAITPID : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_FORK) ? PR_FORK : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_RUNLCL) ? PR_RLC : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_KILLCL) ? PR_KLC : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_ASYNC) ? PR_ASYNC : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_BPTADJ) ? PR_BPTADJ : 0) |
+	    ((T->t_procp->p_proc_flag & P_PR_PTRACE) ? PR_PTRACE : 0) |
+	    ((T->t_procp->p_flag & SMSACCT) ? PR_MSACCT : 0) |
+	    ((T->t_procp->p_flag & SMSFORK) ? PR_MSFORK : 0) |
+	    ((T->t_procp->p_flag & SVFWAIT) ? PR_VFORKP : 0) |
+	    (((T->t_procp->p_flag & SSYS) ||
+	    (T->t_procp->p_as == &`kas)) ? PR_ISSYS : 0) |
+	    ((T == T->t_cpu->cpu_idle_thread) ? PR_IDLE : 0);
+*/
+
+	pr_lwpid = T->pid;
+	pr_addr = (uintptr_t)T;
+	pr_wchan = NULL;
+	pr_stype = 0;
+
+	pr_state = (T->__state & 0x00000001) ? SSLEEP :
+		   (T->__state & 0x00000002) ? SSLEEP :
+		   (T->__state & 0x00000004) ? SSTOP :
+		   (T->__state & 0x00000008) ? SSTOP :
+		   (T->__state & 0x00000020) ? SZOMB :
+		   (T->__state & 0x00000010) ? SZOMB :
+		   (T->__state & 0x00000080) ? SZOMB :
+		   (T->__state & 0x00000100) ? SWAIT :
+		   (T->__state & 0x00000200) ? SWAIT : SRUN;
+	pr_sname = (T->__state & 0x00000001) ? 'S' :
+		   (T->__state & 0x00000002) ? 'S' :
+		   (T->__state & 0x00000004) ? 'T' :
+		   (T->__state & 0x00000008) ? 'T' :
+		   (T->__state & 0x00000020) ? 'Z' :
+		   (T->__state & 0x00000010) ? 'Z' :
+		   (T->__state & 0x00000080) ? 'Z' :
+		   (T->__state & 0x00000100) ? 'W' :
+		   (T->__state & 0x00000200) ? 'W' : 'R';
+
+	pr_pri = T->prio;
+	pr_name = T->comm;
+	pr_onpro = ((struct thread_info *)T->stack)->cpu;
+};
+
+inline psinfo_t *curpsinfo = xlate <psinfo_t *> (curthread);
+#pragma D attributes Stable/Stable/Common curpsinfo
+#pragma D binding "1.0" curpsinfo
+
+inline lwpsinfo_t *curlwpsinfo = xlate <lwpsinfo_t *> (curthread);
+#pragma D attributes Stable/Stable/Common curlwpsinfo
+#pragma D binding "1.0" curlwpsinfo
+
+inline string cwd = d_path(&(curthread->fs->pwd));
+#pragma D attributes Stable/Stable/Common cwd
+#pragma D binding "1.0" cwd
+
+inline string root = d_path(&(curthread->fs->root));
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "1.0" root
+
+inline int CLD_EXITED = 1;
+#pragma D binding "1.0" CLD_EXITED
+inline int CLD_KILLED = 2;
+#pragma D binding "1.0" CLD_KILLED
+inline int CLD_DUMPED = 3;
+#pragma D binding "1.0" CLD_DUMPED
+inline int CLD_TRAPPED = 4;
+#pragma D binding "1.0" CLD_TRAPPED
+inline int CLD_STOPPED = 5;
+#pragma D binding "1.0" CLD_STOPPED
+inline int CLD_CONTINUED = 6;
+#pragma D binding "1.0" CLD_CONTINUED
+
+/*
+ * Below we provide some inline definitions to simplify converting from
+ * a struct pid * to a pid_t.  structpid2pid is a DTrace-ized version of
+ * pid_vnr().
+ */
+ /*
+inline	struct pid_namespace *pid_namespace[struct pid *p] = p != NULL ?
+	p->numbers[p->level].ns : NULL;
+
+inline	int pid_namespace_level[struct pid *p] = p != NULL && pid_namespace[p] ?
+	pid_namespace[p]->level : 0;
+
+m4_dnl 4.19 and above use thread_pid for this.
+define_for_kernel([[__task_pid]], [[ m4_dnl
+	(m4_kver(4, 19, 0), [[task->thread_pid]])]], m4_dnl
+	[[task->pids[PIDTYPE_PID].pid]]) m4_dnl
+
+inline	struct pid *task_pid[struct task_struct *task] =
+	task != NULL ? __task_pid : NULL;
+
+inline	int current_namespace_level = pid_namespace_level[task_pid[curthread]];
+
+inline	pid_t structpid2pid[struct pid *p] =
+	p != NULL && current_namespace_level <= p->level &&
+	((struct upid *)&(p->numbers[current_namespace_level]))->ns ==
+	pid_namespace[task_pid[curthread]] ?
+	((struct upid *)&(p->numbers[current_namespace_level]))->nr : 0;
+*/
diff --git a/dlibs/x86_64/6.10.0/regs.d b/dlibs/x86_64/6.10.0/regs.d
new file mode 100644
index 0000000000000..12ce3ac9a1507
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/regs.d
@@ -0,0 +1,94 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2012, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+inline int R_TRAPNO = 25;
+#pragma D binding "1.0" R_TRAPNO
+inline int R_GS = 24;
+#pragma D binding "1.0" R_GS
+inline int R_FS = 23;
+#pragma D binding "1.0" R_FS
+inline int R_ES = 22;
+#pragma D binding "1.0" R_ES
+inline int R_DS = 21;
+#pragma D binding "1.0" R_DS
+
+inline int R_SS = 20;
+#pragma D binding "1.0" R_SS
+inline int R_RSP = 19;
+#pragma D binding "1.0" R_RSP
+inline int R_RFL = 18;
+#pragma D binding "1.0" R_RFL
+inline int R_CS = 17;
+#pragma D binding "1.0" R_CS
+inline int R_RIP = 16;
+#pragma D binding "1.0" R_RIP
+inline int R_ERR = 15;
+#pragma D binding "1.0" R_ERR
+inline int R_RDI = 14;
+#pragma D binding "1.0" R_RDI
+inline int R_RSI = 13;
+#pragma D binding "1.0" R_RSI
+inline int R_RDX = 12;
+#pragma D binding "1.0" R_RDX
+inline int R_RCX = 11;
+#pragma D binding "1.0" R_RCX
+inline int R_RAX = 10;
+#pragma D binding "1.0" R_RAX
+inline int R_R8 = 9;
+#pragma D binding "1.0" R_R8
+inline int R_R9 = 8;
+#pragma D binding "1.0" R_R9
+inline int R_R10 = 7;
+#pragma D binding "1.0" R_R10
+inline int R_R11 = 6;
+#pragma D binding "1.0" R_R11
+inline int R_RBX = 5;
+#pragma D binding "1.0" R_RBX
+inline int R_RBP = 4;
+#pragma D binding "1.0" R_RBP
+inline int R_R12 = 3;
+#pragma D binding "1.0" R_R12
+inline int R_R13 = 2;
+#pragma D binding "1.0" R_R13
+inline int R_R14 = 1;
+#pragma D binding "1.0" R_R14
+inline int R_R15 = 0;
+#pragma D binding "1.0" R_R15
+
+inline int R_EBX = R_RBX;
+#pragma D binding "1.0" R_EBX
+inline int R_ECX = R_RCX;
+#pragma D binding "1.0" R_ECX
+inline int R_EDX = R_RDX;
+#pragma D binding "1.0" R_EDX
+inline int R_ESI = R_RSI;
+#pragma D binding "1.0" R_ESI
+inline int R_EDI = R_RDI;
+#pragma D binding "1.0" R_EDI
+inline int R_EBP = R_RBP;
+#pragma D binding "1.0" R_EBP
+inline int R_EAX = R_RAX;
+#pragma D binding "1.0" R_EAX
+inline int R_EIP = R_RIP;
+#pragma D binding "1.0" R_EIP
+inline int R_EFL = R_RFL;
+#pragma D binding "1.0" R_EFL
+inline int R_ESP = R_RSP;
+#pragma D binding "1.0" R_ESP
+
+inline int R_PC = R_EIP;
+#pragma D binding "1.0" R_PC
+inline int R_FP = R_EBP;
+#pragma D binding "1.0" R_FP
+inline int R_SP = R_ESP;
+#pragma D binding "1.0" R_SP
+inline int R_PS = R_EFL;
+#pragma D binding "1.0" R_PS
+inline int R_R0 = R_EAX;
+#pragma D binding "1.0" R_R0
+inline int R_R1 = R_EBX;
+#pragma D binding "1.0" R_R1
diff --git a/dlibs/x86_64/6.10.0/sched.d b/dlibs/x86_64/6.10.0/sched.d
new file mode 100644
index 0000000000000..271d84e057cde
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/sched.d
@@ -0,0 +1,38 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2012, 2019, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+
+typedef id_t		processorid_t;
+typedef id_t		psetid_t;
+typedef id_t		chipid_t;
+typedef id_t		lgrp_id_t;
+
+typedef struct cpuinfo {
+	processorid_t	cpu_id;
+	psetid_t	cpu_pset;
+	chipid_t	cpu_chip;
+	lgrp_id_t	cpu_lgrp;
+} cpuinfo_t;
+
+typedef cpuinfo_t	*cpuinfo_t_p;
+
+inline processorid_t cpu = curcpu->cpu_id;
+#pragma D attributes Stable/Stable/Common cpu
+#pragma D binding "1.0" cpu
+
+inline psetid_t pset = curcpu->cpu_pset;
+#pragma D attributes Stable/Stable/Common pset
+#pragma D binding "1.0" pset
+
+inline chipid_t chip = curcpu->cpu_chip;
+#pragma D attributes Stable/Stable/Common chip
+#pragma D binding "1.0" chip
+
+inline lgrp_id_t lgrp = curcpu->cpu_lgrp;
+#pragma D attributes Stable/Stable/Common lgrp
+#pragma D binding "1.0" lgrp
diff --git a/dlibs/x86_64/6.10.0/signal.d b/dlibs/x86_64/6.10.0/signal.d
new file mode 100644
index 0000000000000..c72dfd4cbc13f
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/signal.d
@@ -0,0 +1,108 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
+ * Use is subject to license terms.
+ *
+ */
+inline int SIGSYS = 31;
+#pragma D binding "1.0" SIGSYS
+
+inline int SIGTERM = 15;
+#pragma D binding "1.0" SIGTERM
+
+inline int SIGTSTP = 20;
+#pragma D binding "1.0" SIGTSTP
+
+inline int SIGVTALRM = 26;
+#pragma D binding "1.0" SIGVTALRM
+
+inline int SIGBUS = 7;
+#pragma D binding "1.0" SIGBUS
+
+inline int SIGPIPE = 13;
+#pragma D binding "1.0" SIGPIPE
+
+inline int SIGSTKFLT = 16;
+#pragma D binding "1.0" SIGSTKFLT
+
+inline int SIGTRAP = 5;
+#pragma D binding "1.0" SIGTRAP
+
+inline int SIGHUP = 1;
+#pragma D binding "1.0" SIGHUP
+
+inline int SIGFPE = 8;
+#pragma D binding "1.0" SIGFPE
+
+inline int SIGURG = 23;
+#pragma D binding "1.0" SIGURG
+
+inline int SIGIO = 29;
+#pragma D binding "1.0" SIGIO
+
+inline int SIGKILL = 9;
+#pragma D binding "1.0" SIGKILL
+
+inline int SIGWINCH = 28;
+#pragma D binding "1.0" SIGWINCH
+
+inline int SIGXFSZ = 25;
+#pragma D binding "1.0" SIGXFSZ
+
+inline int SIGINT = 2;
+#pragma D binding "1.0" SIGINT
+
+inline int SIGTTOU = 22;
+#pragma D binding "1.0" SIGTTOU
+
+inline int SIGTTIN = 21;
+#pragma D binding "1.0" SIGTTIN
+
+inline int SIGCHLD = 17;
+#pragma D binding "1.0" SIGCHLD
+
+inline int SIGIOT = 6;
+#pragma D binding "1.0" SIGIOT
+
+inline int SIGCONT = 18;
+#pragma D binding "1.0" SIGCONT
+
+inline int SIGQUIT = 3;
+#pragma D binding "1.0" SIGQUIT
+
+inline int SIGABRT = 6;
+#pragma D binding "1.0" SIGABRT
+
+inline int SIGPROF = 27;
+#pragma D binding "1.0" SIGPROF
+
+inline int SIGXCPU = 24;
+#pragma D binding "1.0" SIGXCPU
+
+inline int SIGSTOP = 19;
+#pragma D binding "1.0" SIGSTOP
+
+inline int SIGPWR = 30;
+#pragma D binding "1.0" SIGPWR
+
+inline int SIGILL = 4;
+#pragma D binding "1.0" SIGILL
+
+inline int SIGUSR1 = 10;
+#pragma D binding "1.0" SIGUSR1
+
+inline int SIGPOLL = 29;
+#pragma D binding "1.0" SIGPOLL
+
+inline int SIGCLD = 17;
+#pragma D binding "1.0" SIGCLD
+
+inline int SIGSEGV = 11;
+#pragma D binding "1.0" SIGSEGV
+
+inline int SIGUSR2 = 12;
+#pragma D binding "1.0" SIGUSR2
+
+inline int SIGALRM = 14;
+#pragma D binding "1.0" SIGALRM
+
diff --git a/dlibs/x86_64/6.10.0/tcp.d b/dlibs/x86_64/6.10.0/tcp.d
new file mode 100644
index 0000000000000..54e310cb4c6ed
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/tcp.d
@@ -0,0 +1,231 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on library net.d
+#pragma D depends_on provider ip
+#pragma D depends_on provider tcp
+
+inline int TH_FIN =	0x01;
+inline int TH_SYN =	0x02;
+inline int TH_RST =	0x04;
+inline int TH_PSH =	0x08;
+inline int TH_ACK =	0x10;
+inline int TH_URG =	0x20;
+inline int TH_ECE =	0x40;
+inline int TH_CWR =	0x80;
+
+inline int TCP_STATE_IDLE = 		0x00;
+inline int TCP_STATE_ESTABLISHED =	0x01;
+inline int TCP_STATE_SYN_SENT =		0x02;
+inline int TCP_STATE_SYN_RECEIVED =	0x03;
+inline int TCP_STATE_FIN_WAIT_1 =	0x04;
+inline int TCP_STATE_FIN_WAIT_2 =	0x05;
+inline int TCP_STATE_TIME_WAIT =	0x06;
+inline int TCP_STATE_CLOSED =		0x07;
+inline int TCP_STATE_CLOSE_WAIT =	0x08;
+inline int TCP_STATE_LAST_ACK =		0x09;
+inline int TCP_STATE_LISTEN =		0x0a;
+inline int TCP_STATE_CLOSING =		0x0b;
+
+/*
+ * Convert a TCP state value to a string.
+ */
+inline string tcp_state_string[int state] =
+	state == TCP_STATE_CLOSED ? "state-closed" :
+	state == TCP_STATE_IDLE ? "state-idle" :
+	state == TCP_STATE_LISTEN ? "state-listen" :
+	state == TCP_STATE_SYN_SENT ? "state-syn-sent" :
+	state == TCP_STATE_SYN_RECEIVED ? "state-syn-received" :
+	state == TCP_STATE_ESTABLISHED ? "state-established" :
+	state == TCP_STATE_CLOSE_WAIT ? "state-close-wait" :
+	state == TCP_STATE_FIN_WAIT_1 ? "state-fin-wait-1" :
+	state == TCP_STATE_CLOSING ? "state-closing" :
+	state == TCP_STATE_LAST_ACK ? "state-last-ack" :
+	state == TCP_STATE_FIN_WAIT_2 ? "state-fin-wait-2" :
+	state == TCP_STATE_TIME_WAIT ? "state-time-wait" :
+	"<unknown>";
+#pragma D binding "1.6.3" tcp_state_string
+
+/*
+ * tcpinfo is the TCP header fields.
+ */
+typedef struct tcpinfo {
+	uint16_t tcp_sport;		/* source port */
+	uint16_t tcp_dport;		/* destination port */
+	uint32_t tcp_seq;		/* sequence number */
+	uint32_t tcp_ack;		/* acknowledgment number */
+	uint8_t tcp_offset;		/* data offset, in bytes */
+	uint8_t tcp_flags;		/* flags */
+	uint16_t tcp_window;		/* window size */
+	uint16_t tcp_checksum;		/* checksum */
+	uint16_t tcp_urgent;		/* urgent data pointer */
+	uintptr_t tcp_hdr;		/* raw TCP header */
+} tcpinfo_t;
+
+/*
+ * tcpsinfo contains stable TCP details from tcp_t.
+ */
+typedef struct tcpsinfo {
+	uintptr_t tcps_addr;
+	int tcps_local;			/* is delivered locally, boolean */
+	uint16_t tcps_lport;		/* local port */
+	uint16_t tcps_rport;		/* remote port */
+	string tcps_laddr;		/* local address, as a string */
+	string tcps_raddr;		/* remote address, as a string */
+	int tcps_state;			/* TCP state */
+	uint32_t tcps_iss;		/* Initial sequence # sent */
+	uint32_t tcps_suna;		/* sequence # sent but unacked */
+	uint32_t tcps_snxt;		/* next sequence # to send */
+	uint32_t tcps_rnxt;		/* next sequence # expected */
+	uint32_t tcps_swnd;		/* send window size */
+	int32_t tcps_snd_ws;		/* send window scaling */
+	uint32_t tcps_rwnd;		/* receive window size */
+	int32_t tcps_rcv_ws;		/* receive window scaling */
+	uint32_t tcps_cwnd;		/* congestion window */
+	uint32_t tcps_cwnd_ssthresh;	/* threshold for congestion avoidance */
+	uint32_t tcps_sack_snxt;	/* next SACK seq # for retransmission */
+	uint32_t tcps_rto;		/* round-trip timeout, msec */
+	uint32_t tcps_mss;		/* max segment size */
+	int tcps_retransmit;		/* retransmit send event, boolean */
+	uint32_t tcps_rtt;		/* smoothed avg round-trip time, msec */
+	uint32_t tcps_rtt_sd;		/* standard deviation of RTT */
+	uint32_t tcps_irs;		/* Initial recv sequence # */
+} tcpsinfo_t;
+
+/*
+ * tcplsinfo provides the old tcp state for state changes.
+ */
+typedef struct tcplsinfo {
+	int tcps_state;		/* previous TCP state */
+} tcplsinfo_t;
+
+#pragma D binding "1.6.3" translator
+translator tcpinfo_t < struct tcphdr *T > {
+	tcp_sport = T ? ntohs(T->source) : 0;
+	tcp_dport = T ? ntohs(T->dest) : 0;
+	tcp_seq = T ? ntohl(T->seq) : 0;
+	tcp_ack = T ? ntohl(T->ack_seq) : 0;
+	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
+	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
+	tcp_window = T ? ntohs(T->window) : 0;
+	tcp_checksum = T ? ntohs(T->check) : 0;
+	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
+	tcp_hdr = (uintptr_t)T;
+};
+
+/*
+ * In the main we simply translate from the "struct [tcp_]sock *" to
+ * a tcpsinfo_t *.  However there are a few exceptions:
+ *
+ * - tcps_state is always derived from arg6.  The reason is that in some
+ * state transitions sock->sk_state does not reflect the actual TCP
+ * connection state.  For example the TIME_WAIT state is handled in
+ * Linux by creating a separate timewait socket and the state of the
+ * original socket is CLOSED.  In some other cases we also need to
+ * instrument state transition prior to the update of sk_state.  To do
+ * all of this we rely on arg6.
+ * - we sometimes need to retrieve local/remote port/address settings from
+ * TCP and IP headers directly, for example prior to the address/port
+ * being committed to the socket.  To do this effectively we need to know
+ * if the packet data is inbound (in which case the local IP/port are the
+ * destination) or outbound (in which case the local IP/port are the source).
+ * arg7 is set to 0 for outbound traffic and 1 for inbound so we use these
+ * to reconstruct the address/port info where necessary.  arg2 used for IP
+ * information while arg4 contains the TCP header, so it is used for port data.
+ * NET_PROBE_INBOUND is defined as 1, NET_PROBE_OUTBOUND as 0 in net.d.
+ */
+#pragma D binding "1.6.3" translator
+translator tcpsinfo_t < struct tcp_sock *T > {
+	tcps_addr = (uintptr_t)T;
+	tcps_local =
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
+	    (((struct sock *)T)->__sk_common.skc_rcv_saddr ==
+	    ((struct sock *)T)->__sk_common.skc_daddr) :
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
+	    (((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[0]
+	    ==
+	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[0] &&
+	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[1]
+            ==
+            ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[1] &&
+	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[2]
+            ==
+            ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
+	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
+	    : 0;
+	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
+	    ntohs(((struct inet_sock *)T)->inet_sport) :
+	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
+	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
+	    arg4 != NULL ?
+	    ntohs(arg7 == NET_PROBE_INBOUND ?
+	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
+	    0;
+	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
+	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
+	    arg4 != NULL ?
+	    ntohs(arg7 == NET_PROBE_INBOUND ?
+            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
+	    0;
+	tcps_laddr =
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
+	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
+	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
+	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
+	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
+	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
+	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    &((struct ipv6hdr *)arg2)->daddr :
+	    &((struct ipv6hdr *)arg2)->saddr) :
+	    "<unknown>";
+	tcps_raddr =
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
+	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
+	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
+	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
+	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
+	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
+	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
+	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
+	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
+	    &((struct ipv6hdr *)arg2)->saddr :
+	    &((struct ipv6hdr *)arg2)->daddr) :
+	    "<unknown>";
+	tcps_state = arg6;
+	tcps_iss = T ?
+	    T->snd_una - (uint32_t)T->bytes_acked : 0;
+	tcps_suna = T ? T->snd_una : 0;
+	tcps_snxt = T ? T->snd_nxt : 0;
+	tcps_rnxt = T ? T->rcv_nxt : 0;
+	tcps_swnd = T ? T->snd_wnd : 0;
+	tcps_snd_ws = T ? T->rx_opt.snd_wscale : 0;
+	tcps_rwnd = T ? T->rcv_wnd : 0;
+	tcps_rcv_ws = T ? T->rx_opt.rcv_wscale : 0;
+	tcps_cwnd = T ? T->snd_cwnd : 0;
+	tcps_cwnd_ssthresh = T ? T->snd_ssthresh : 0;
+	tcps_sack_snxt = (T && T->sacked_out == 0) ? T->snd_una :
+	    (T && T->highest_sack == NULL) ? T->snd_nxt :
+	    (T && T->highest_sack != NULL) ?
+	    ((struct tcp_skb_cb *)&((T->highest_sack->cb[0])))->seq : 0;
+	tcps_rto = T ? T->inet_conn.icsk_rto : 0;
+	tcps_mss = T ? T->mss_cache : 0;
+	tcps_retransmit = T && arg0 ?
+	    (((struct tcp_skb_cb *)&(((struct sk_buff *)arg0)->cb[0]))->end_seq
+	    < T->snd_nxt - 1) : 0;
+	tcps_rtt = T ? (T->srtt_us >> 3)/1000 : 0;
+	tcps_rtt_sd = T ? (T->mdev_us >> 2)/1000 : 0;
+	tcps_irs = T && T->bytes_received > 0 ?
+	    T->rcv_nxt - (uint32_t)T->bytes_received : 0;
+};
+
+#pragma D binding "1.6.3" translator
+translator tcplsinfo_t < int I > {
+	tcps_state = I;
+};
diff --git a/dlibs/x86_64/6.10.0/udp.d b/dlibs/x86_64/6.10.0/udp.d
new file mode 100644
index 0000000000000..0e44ed6480415
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/udp.d
@@ -0,0 +1,71 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2010, 2017, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D depends_on module vmlinux
+#pragma D depends_on library net.d
+#pragma D depends_on provider udp
+
+/*
+ * udpinfo is the UDP header fields.
+ */
+typedef struct udpinfo {
+	uint16_t udp_sport;		/* source port */
+	uint16_t udp_dport;		/* destination port */
+	uint16_t udp_length;		/* total length */
+	uint16_t udp_checksum;          /* headers + data checksum */
+	struct udphdr *udp_hdr;		/* raw UDP header */
+} udpinfo_t;
+
+/*
+ * udpsinfo contains stable UDP details from udp_t.
+ */
+typedef struct udpsinfo {
+	uintptr_t udps_addr;
+	uint16_t udps_lport;		/* local port */
+	uint16_t udps_rport;		/* remote port */
+	string udps_laddr;		/* local address, as a string */
+	string udps_raddr;		/* remote address, as a string */
+} udpsinfo_t;
+
+#pragma D binding "1.6.3" translator
+translator udpinfo_t < struct udphdr *U > {
+	udp_sport = ntohs(U->source);
+	udp_dport = ntohs(U->dest);
+	udp_length = ntohs(U->len);
+	udp_checksum = ntohs(U->check);
+	udp_hdr = U;
+};
+
+#pragma D binding "1.6.3" translator
+translator udpsinfo_t < struct udp_sock *S > {
+	/*
+	 * We source udp info from other args but retain the sock arg here
+	 * as it may be used in the future.
+	 */
+	udps_addr = (uintptr_t)S;
+	udps_lport = arg4 ?
+	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->source) :
+	    ntohs(((struct udphdr *)arg4)->dest)) : 0;
+	udps_rport = arg4 ?
+	    (probename == "send" ? ntohs(((struct udphdr *)arg4)->dest) :
+	    ntohs(((struct udphdr *)arg4)->source)) : 0;
+	udps_laddr = arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
+            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->saddr :
+	    &((struct iphdr *)arg2)->daddr) :
+	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
+	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->saddr :
+	    &((struct ipv6hdr *)arg2)->daddr) :
+	    "<unknown>";
+	udps_raddr =
+	    arg2 && *(uint8_t *)arg2 >> 4 == 4 ?
+            inet_ntoa(probename == "send" ? &((struct iphdr *)arg2)->daddr :
+	    &((struct iphdr *)arg2)->saddr) :
+	    arg2 && *(uint8_t *)arg2 >> 4 == 6 ?
+	    inet_ntoa6(probename == "send" ? &((struct ipv6hdr *)arg2)->daddr :
+	    &((struct ipv6hdr *)arg2)->saddr) :
+	    "<unknown>";
+};
diff --git a/dlibs/x86_64/6.10.0/unistd.d b/dlibs/x86_64/6.10.0/unistd.d
new file mode 100644
index 0000000000000..c38bbed4bc85e
--- /dev/null
+++ b/dlibs/x86_64/6.10.0/unistd.d
@@ -0,0 +1,36 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+inline int DTRACEFLT_UNKNOWN = 0;	/* Unknown fault */
+#pragma D binding "1.0" DTRACEFLT_UNKNOWN
+
+inline int DTRACEFLT_BADADDR = 1;	/* Bad address */
+#pragma D binding "1.0" DTRACEFLT_BADADDR
+
+inline int DTRACEFLT_BADALIGN = 2;	/* Bad alignment */
+#pragma D binding "1.0" DTRACEFLT_BADALIGN
+
+inline int DTRACEFLT_ILLOP = 3;		/* Illegal operation */
+#pragma D binding "1.0" DTRACEFLT_ILLOP
+
+inline int DTRACEFLT_DIVZERO = 4;	/* Divide-by-zero */
+#pragma D binding "1.0" DTRACEFLT_DIVZERO
+
+inline int DTRACEFLT_NOSCRATCH = 5;	/* Out of scratch space */
+#pragma D binding "1.0" DTRACEFLT_NOSCRATCH
+
+inline int DTRACEFLT_KPRIV = 6;		/* Illegal kernel access */
+#pragma D binding "1.0" DTRACEFLT_KPRIV
+
+inline int DTRACEFLT_UPRIV = 7;		/* Illegal user access */
+#pragma D binding "1.0" DTRACEFLT_UPRIV
+
+inline int DTRACEFLT_TUPOFLOW = 8;	/* Tuple stack overflow */
+#pragma D binding "1.0" DTRACEFLT_TUPOFLOW
+
+inline int DTRACEFLT_BADSTACK = 9;	/* Bad stack */
+#pragma D binding "1.4.1" DTRACEFLT_BADSTACK
-- 
2.45.1.275.g567cb0950c

