Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F8C1C6BE
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 18:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749322177; cv=fail; b=fgPSwRWNsX7N0ev6feKBPpCxE34w74RWveZclWqSqOOQxs7h0utq1S/PS03wbZA9ePpdbuTn/6ojbAWDkn1SCQrvE16WbWOeFr3i4SLRVAufyUbO9IS/GntLh3NQ/GIH/N9O/r6xPpZDbvHsJYgiZe7JOznpRXxFO1yPx8yraDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749322177; c=relaxed/simple;
	bh=pDGXcjjvPBfVE3qFIZADIhbs7WLgwx1WZId0/fhgDpg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=aGv+3QZ0Mv8sKVGcX3mIpsKgVg9b1kam0nPXuXY+sts79LckzXQgzhVGIVQd5lR9LSW8HK69JOl2fsDnKBdhEra2zN5SbWG/zKdQ6EJ/10RWe/ALSD4Q2mR7k+T2X6WR9r0vfPzuM+mcQ5Wgdve1wblCXRev/DYb8YPTjnLAaKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FKFiS/rp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LY2rImeC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FKFiS/rp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LY2rImeC"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557InYPk021646;
	Sat, 7 Jun 2025 18:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=T1AhmeThtoBB4+8E4V
	ljS3g+TfLnvGeMVM0sgXcZoH8=; b=FKFiS/rpsq7IrC4wEoLZbtqnoEzfKOj1Qy
	uzlqytT0b7ojpxB0c/hLvy6Qfw49GjadWhRFrJP5rrrFtFltXyj77FtcZJ+imc0u
	EeZus7u5ih5ByOpPmFL36MaEUVuIHpgTaOpHG6+rD9EU3sNFjMX4qVqVyBp2qkw1
	Be5bXVJdktUzequEqrtGvx3YkJ44owiq0ddrcydrGOuQkzUNBI5IKmFb/DK/sTF8
	MtPlMTNlGOjV1qxf4auAr9aSFwou09dHJYvysNAZCycKetyROct/gDYMnfywYeXs
	aQA8AijAZXANToTgxds/whXlUozr4Jt8fYowH6zo2terCKQWf02w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dfe8df4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 18:49:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557HqBQf003330
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 18:49:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv65k06-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 18:49:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHhK7dAkj0+27+VDrrkobcABH/uHAadHXBbHxFhKdkBjM14CgbN9PsNa+q8zY6lXG5zbs7OmvstHV2IYwQO1d/DbY+RrXdMY/I1QilJ5xXITR/CtUw72zBOoJgd2PI0IXTrfQh4d1UFie39kHsVXA8qcyIt96Y1UUAugqpEK7hdbkUPFQefm8Gn+eMqLJ7jlIPEPzcsrIRxW8GC23/YxyXYDuoJ+hJn8ntFxCyMUGSltl3KHXZdJdt6KS9S9srLoNWgPUQeIqwXkowf7fGrCbBznVIUYXdgfROH8uI2MpW12IArWgsFrYs/uCY7aiCc2nzedQZLeenC2TiunRWJKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1AhmeThtoBB4+8E4VljS3g+TfLnvGeMVM0sgXcZoH8=;
 b=fDy5IQAwj6b7SZ5uaReKTBEwoffaUa7T30CTKH8yYRrIAzSmmzLn6MfMPcBkboYmRiTqKv4DO0XPlrSIqpQLICASTaEREpsyrnds4/9hXP8OzfFfLCpWova0LuCFhj+qaowNC7DWg5MruILq72V1hARTmyKTGd3WJLqtzktimXwatOi1pivQDpYfFhNh188jN/XsFY9LeDHaSpEZpSiZNkOfjvtdkXZhMyfPSstps36QXXviYIDyaiSGi/Y+VmFkduzl0lFkMHwm0IOYRy5cBzBKxqI7LjnT4FPQVvu9ioTZiIXwFfgOPSrxCutWkBva0JFozXjc6GGQ/fXx+5Ux5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1AhmeThtoBB4+8E4VljS3g+TfLnvGeMVM0sgXcZoH8=;
 b=LY2rImeCQcy1nr+h+MQoeecEHAYDuT39tlhfLMcX2mBcLrikjE/2i8T6XOs407wVHgZAwqly1k9y3bhqMlWQvFDZ+D9WJNQ+PEYpSAgkwdS/5qY17P3DjGmGQmgEFqV9AapSyPKL1m/u67253ycET47Ku8OnwsUruvqarIykvKY=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DM4PR10MB6205.namprd10.prod.outlook.com (2603:10b6:8:88::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Sat, 7 Jun 2025 18:49:31 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8746.041; Sat, 7 Jun 2025
 18:49:31 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 13/17] dtprobed, usdt parser: add support for ELF
 notes-based USDT
References: <IA4PR10MB8374A6881B0188B5168B375AC269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Emacs: it's all fun and games, until somebody tries to edit a file.
Date: Sat, 07 Jun 2025 19:49:29 +0100
In-Reply-To: <IA4PR10MB8374A6881B0188B5168B375AC269A@IA4PR10MB8374.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Sat, 07 Jun 2025 02:15:04 -0400")
Message-ID: <87ecvvjsjq.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0597.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::14) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DM4PR10MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: d8cf8307-63da-4a9f-0944-08dda5f409d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4/pSZpf8d9iD02dVvwovQTSz/f8p7MdIE9M3+nAcIxzngI3sU173uezzZm7O?=
 =?us-ascii?Q?n7XbPWWmTWhNqjXPFMT0lIDqrG3ZLrREGS+fjCDvDhZO63AI4yn7I+iMKRcd?=
 =?us-ascii?Q?HjILtgWZvs5zWY94vMAO+vc452xJ/EKyR8k/t5bXozN4vTMbLKWTfg36bHfJ?=
 =?us-ascii?Q?lo8/jQ8fFSq6W5KblPgmO3so2g0JDjmVaRNnedzN8uy6NhLaPWLY/friUrbq?=
 =?us-ascii?Q?UkjVeA49eikxhVPuFlOCQ3EAaUDM2NMu1YkPzCNbCNmlhhkHVTjueGthkXbd?=
 =?us-ascii?Q?yF9g0uewUSejbqO2OOLYuEJO9slYXi5rVzgZ5s73znOOZmAwSyQWDIavjQId?=
 =?us-ascii?Q?gbvaltCB3z7X14YlQnWHnMnk6ggm/USJmyyXnWy/lDSZytZVnAaxY0wj28sU?=
 =?us-ascii?Q?UHB1isCycEIU2cBnqS9/8eFcBNe/DEz70SnEpKxyoV1imR9sGeBq8EHoTFrr?=
 =?us-ascii?Q?MzM+hOPaBd/+3Wikj96C3w7RhAUYBjPKilQhE9EIXVbHB4zVexpjGYwOTETY?=
 =?us-ascii?Q?JVeGi9bszrCIi0ZFiSCO/ZTl7prY1R5aCzs7c1G3PpV3BCIDNoFcpoCo+NwB?=
 =?us-ascii?Q?p/rHAn6tGKFcZ0Bi89uiqzCb9jmbyXmlbPf8FV45UO/Pitjk/JRTRcUtFEmx?=
 =?us-ascii?Q?J0cS9DPvfv8BKHc1HfTLoK3q/K4pjzz6E1GatZe0HejnlijfZ2pYynI/J1Qk?=
 =?us-ascii?Q?P+FEjOPwyGomA+PXqRjwsa328t1zhZEtRocCBCcCLsKaOdcpK7dNWln9vwJp?=
 =?us-ascii?Q?AF2tDJFoiAHMfUpNptgAl9n2aKl2LZJVo96zzqY47IzZz47Ot3vRIdJMPPd6?=
 =?us-ascii?Q?A5QR+G+7j4/dkXiPU9miPUJZP3AMx8S6CV9QeiBkHzPO/6BW8WL5mPVi7wBz?=
 =?us-ascii?Q?7PRO7WH6kQ/hVkSdzQZaCOI1dJlIdjqA3drOXKUMidFspDRQSj8JzYzs4aU4?=
 =?us-ascii?Q?XWk56NJSNguh0xExa7ua2cPWKIF48F9vFXFE2I9mkDrikfpPb9Qtiypn5JDa?=
 =?us-ascii?Q?vMQgy4t/iXDUQKfQjNK28JAz19IkOL90BoJptkGLYC+iP7evaxQeLx8JxLty?=
 =?us-ascii?Q?oboF79XsT+YucjTgGMSrsXMLh8WBWayTNdSwdjORv3eYDW9qxZkqSzcT1w0O?=
 =?us-ascii?Q?q5CNVoxOUpyQaCDc+bkH56mX4JA21EuaxvuPCk8iXg3tt7d4hqrv/0y/o1pX?=
 =?us-ascii?Q?/qjJANIFb1SspJ1d5jXfLWwgJLC/EOZQWna1pz0cvnSW0/XOwNQ1Z1/mAJmp?=
 =?us-ascii?Q?coQSkDcf8mkEzUh4HWn66HPi9ySIbhJdVeib19AvcWHWpflYVOm7fRf0xu9z?=
 =?us-ascii?Q?UTzRCvkXjX5cCUxB+VoIwqdn5M7rzq1+QyDphnDOINedTcQK4mAG88d10un3?=
 =?us-ascii?Q?FMlIG8EPuuCQn8epUnW4YPuFOwlIg+es4g/P7vn6gt9vsT/uJb4MwldgX78K?=
 =?us-ascii?Q?3LjIv2kWABM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U5blg58FPz6KPxt5nTXjOX8CIfu0iq4q4tGOhviKfvsjarqAw1EpAIjnolEB?=
 =?us-ascii?Q?J8ZyIYXHCk+RbeDU0l8Kq15ivBqgsQkMTh+2B1mvnAgg4A8hiDJ03i8INyQL?=
 =?us-ascii?Q?Nn29nJCSnFwVZM9/Q/qwUBwQCnQ1nazczJJ6sFhGfkZz2Bo48RDXBym6T+xB?=
 =?us-ascii?Q?xn5HJwpmK8zc+8wEDfhOpG15xjC8VhzXgsrx2xw5x7LQU6L5YlTXdRfuyULR?=
 =?us-ascii?Q?du7f9ulfg/T8Ws6oNS2Y1lMSIPzh0NxViAi69rnS3BYU+cfYee7j5ZzP8MWQ?=
 =?us-ascii?Q?b7X0lCsWYCBR7YC6Fm9B8GOSVwrpZI0oxaQIV+8a9aWppFItZJ1RpDAPmchu?=
 =?us-ascii?Q?vc1pHgYVcz1QpOl9K5PdfeNcUJwxYwOzcYu7uSVcSHAp8jkS08z7cawuH1av?=
 =?us-ascii?Q?XZCDLqD3OpZre8JkuA461Hpq+5T7K3TsIgtZrGH3H7x/5bTiRkyZUHT8HVYf?=
 =?us-ascii?Q?n+zIGbwL1azcS5bnXDCOptWNLsYESiOsdmRAgfZRzMNC8QB7xThSdQpavp/B?=
 =?us-ascii?Q?os40EN2h/IwKjm/m1AhzBtRNuRKpmM23ecIwEx7W7SHGPJ21G4b4+v3Evpc7?=
 =?us-ascii?Q?SQeTXJ2kMJc6mYGqKBH0YNRpQFFI4H++3hnf4b5FSioKmcvCdTD8Wp0Prydo?=
 =?us-ascii?Q?NZ0WyR8xuXEpghxmIwOsVh1nTDtjF+q+Ch1DRqeSFv6J004EdMaYoy25Yg2g?=
 =?us-ascii?Q?pCMYurrVkx3uzDFwce/QY0infx/YONdTBrpsiJD9bdQ2IhEsHhMjQFD3r/Ei?=
 =?us-ascii?Q?hbORSZNETB6j5dXryt5NYSozef3zV+XEZ+nyPBWCSiHX7EWXvIm6DZcluDE/?=
 =?us-ascii?Q?180tt+x0pXrCNlf1Fl6jHoJa6yE+znVBQuJCSI6a+jMpzF7FgdGJE7diMDn/?=
 =?us-ascii?Q?0B1mxGJrmyeHMF6+JxwZpIedfsAsKzZbRAnMXMp01D8f/UFa5GtYNOd5tM3S?=
 =?us-ascii?Q?2ue7S22A5Xh9+eGW5Dbah9O0JOeJ13AxhpYQjE7AP/HJq68GSmYCE+n49zMn?=
 =?us-ascii?Q?f8tg0OZRyjWoKMXz2jc00CIXEbH4pHrya0JsJXcdIVlojr6nx80+k69uzv2j?=
 =?us-ascii?Q?rahTE3pQyNVoL507+Fnm2T3gDk8arK6Q7ly8pRJ5mSwwLMnKtaRPj3sed4GW?=
 =?us-ascii?Q?hS+GQG0h1FGqlU3VM8VWGX27bbjObsPLhYLCwyV9EyNkyW5lsHh2+4Wkg/fO?=
 =?us-ascii?Q?9EBzAGqOVDqnwosvBy3CT7FRnp5VZD5K35jgEb0e0LvhhzfyK9rqGp5iTJt7?=
 =?us-ascii?Q?bv8paubE+sg+YVnNki+c2Z/+Co06tw9rA63zpqjfgjH7klXvh96aLAiNQv4M?=
 =?us-ascii?Q?hd2cMGAjCABqwfd3Wq2aqZGNM0h6OHONHMCqwebVonlsG+NvwCPm81rH+jl3?=
 =?us-ascii?Q?HtYrDxchiZ2JSenaQebyPIRFlrv+gwuU8/fi8KVyp50N03XcggCM0dL1NlrP?=
 =?us-ascii?Q?OM6ajOmq7t+io82FTbnugB/fEXBsy3ax+z9Cyyf9uF7S5JRaz4RRLZ/NPO5j?=
 =?us-ascii?Q?2RURLvQQQ6vU8Wt7PO+BXlFrC66fNFwoS15UdA3EN2cxDgr7hZx1QWwOdL39?=
 =?us-ascii?Q?Rk58vWUApnChnWMsbLYdbpNGPtoxbfVYVwss3UTyDlOwRaodvgJPj86e4z50?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UOBjEReFRa7pUvDEOmmrdk4j2QdfT4ErffUvOVgU1o03IUQPrKqspRYhAZnnEVkiIRYmkQjBzyfANScYNPGQ25JtN34rf1/FlS2cr4jzxzRDxLz/k0jNDJOvC8KN7QN8DFpl13bqB+InwifMNQG+VwJ0i73kSriANS7gfZ+HWRpk7BzBBhwsVqTa4VFvUJgjdzBzVv8hWsvwk5gCqlxVUiho1E84y3vv95VKnnJzt590z1zD55pBZKl/gO4FZQNBA9NHejAwgCstMP4GKA10NqAJwOfLw1lsbF232eNkLs63L+XDyfpr0+Ln+Mt+NAbNMgZpo5imTUVOOyEaz44POF6u98Xx2CSvnw5oYhEnDq/K8zxON8sw1TrqubN1yoFkTsFuhWKRVc+OLbHZFpNpRmplo1kBcze6hS8ja4lKRFt5UKJssoLiGVzxllUa2irjnqbO1d7aNyxYt9HXDhMdeBTJ4h9Psl8UQdBFlofFatWLxqwjCln04lbSKxnVEiVBGzQH8sODlphQ70k1G+tpC3wwrD8tne+WMj5TiQ21g76uOj2EfzJkVQJWIwBih/ARYr02FsTvmiQZlju5s8SQM0awVwlufjkyPuTdgmBfAjw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cf8307-63da-4a9f-0944-08dda5f409d8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 18:49:31.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sly0lw77xJCdwDtgrMBompvgU0HEKAuYcOjnT69Ef99r7aSAEX6iU/5Ztrl8VHTHKb36rEbIaiE1w3/hqhAJAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6205
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070136
X-Proofpoint-ORIG-GUID: xjIY0IxpXqAWivcDFM1-Mk8wTFR_-4C6
X-Proofpoint-GUID: xjIY0IxpXqAWivcDFM1-Mk8wTFR_-4C6
X-Authority-Analysis: v=2.4 cv=MMhgmNZl c=1 sm=1 tr=0 ts=684489be b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=LK305ZlBqlyrz8fr9M8A:9 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEzNyBTYWx0ZWRfX9qNPTWQK1R2+ WB0DxBPZM5PHYcVyYkSrSaSaMLaYsnuUt/5/xjfKy8htnI6fJyxrXwWygNcKfKB4x53gNQZ/47Z KwFiJEZffiik3gph2pPKJM3Xx/M7WJX4rJ/QA9L8yJuj0eMBgiIuJmwZk8GZTn55qg842mRxIFF
 ylPGN6hHU6ko5AsTGGWIhpJV99+DK1pHm0RURHrUMUAGmwgHDp8iXgAA0xKgyd1NpMITTSwEye2 5wsdDSYh0R7DWshc9r4DTZmQ0PHfP5jrbHsOR8M4Een6dNVqLHHQi2ojl/vt3H9WiAoDGuWmKNP TRaz8h2a7veVxGLGePn+y5nwpHmtnksgUNGxCqVNoGjVjjuZwtyf+xWws0B8fjiRaoYLIRUr6yw
 qQ3v9Lk8oWg7QjdNYoUhan0XgCBN6x+Qsczngw8EsJhGKBVaYqFQRvuH+bIxt4ySLSQyKLAn

On 7 Jun 2025, Kris Van Hees verbalised:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

modulo this piece of utter pedantry:

> +	 *   rc = 1: All blocks written successfully.
> +	 *   rc = 0: Some blocks not written.
> +	 *   rc = -1: An erorr happened (some blocks not written).

Erorr is an erorr!

> +		if (prp->fun != NULL) {
> +			ptp->next = prp->next;
> +			ptp->nargc = prp->nargc;
> +			ptp->nargs = prp->nargs;
> +			ptp->nargsz = prp->nargsz;
> +			ptp->xargc = prp->xargc;
> +			ptp->xargs = prp->xargs;
> +			ptp->xargsz = prp->xargsz;
> +			ptp->xmap = prp->xmap;
> +			prp->next = ptp;
> +			prp->ntp++;
> +		} else {
> +			dt_htab_delete(prbmap, ptp);
> +			dt_htab_insert(pvp->pmap, ptp);
> +			ptp->ntp = 1;
> +			ptp->nargc = prp->nargc;
> +			ptp->nargs = prp->nargs;
> +			ptp->nargsz = prp->nargsz;
> +			ptp->xargc = prp->xargc;
> +			ptp->xargs = prp->xargs;
> +			ptp->xargsz = prp->xargsz;
> +			ptp->xmap = prp->xmap;
> +			pvp->probec++;
> +		}
> +	}
> +
> +prvit = NULL;
> +while ((pvp = dt_htab_next(prvmap, &prvit)) != NULL) {
> +  dt_htab_next_t	*prbit = NULL;
> +  dt_probe_t		*prp;
> +
> +  dt_dbg_usdt("    Provider '%s' with %d probe%s:\n", pvp->name, pvp->probec, pvp->probec == 1 ? "" : "s");
> +  while ((prp = dt_htab_next(pvp->pmap, &prbit)) != NULL) {
> +    dt_dbg_usdt("      Probe %s:%s:%s:%s (off %x)\n", prp->prv, prp->mod, prp->fun ? prp->fun : "", prp->prb, prp->fun ? prp->off : -1);
> +    while ((prp = prp->next) != NULL)
> +      dt_dbg_usdt("        Probe %s:%s:%s:%s (off %x)\n", prp->prv, prp->mod, prp->fun ? prp->fun : "", prp->prb, prp->fun ? prp->off : -1);
> +  }
> +}
> +
> +	/* Emit any provider that has tracepoints. */
> +	prvit = NULL;
> +	while ((pvp = dt_htab_next(prvmap, &prvit)) != NULL) {
> +		if (pvp->probec > 0 && emit_provider(out, dhp, pvp) == -1)
> +			goto err;
> +	}
> +
> +	goto out;

Going by the indentation, the outdented bit looks like debugging code
you either forgot to remove, or forgot to reindent :)

-- 
NULL && (void)
