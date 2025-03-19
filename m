Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5B717D355
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411248; cv=fail; b=QR9udJVNP4rpFLNxXaQ5KCGvdoXi+m7vK9/AqKlfu8w0HrDDeZ9Pslak6EO0MuKFVoMKZT+oeFtwWCH+7sco+R/SSq5toxkRNhUBDK30/2GjDzcOlZkV5IVNkTPvcsI+L7taCYSZPPX5EwJE5SdON58AB3QTw1toj9sXIdWmEE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411248; c=relaxed/simple;
	bh=+fj0alEpop1UKkjB5wQpr0eJzkVExqa4U8i5wHr7EEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hZJILGtxBQjFoJORgJUTNClV+7/aMi8I2d8N+kkbyZfi3FAbameLdnb2hhHPbBXRB8YiqJxrAINSo3xurgLtiNJrBruz9fJyzGv9sg1ukZLIXCLXibWFRQZgUA4f0ZnFRepeRN8I6hADDqQPQagXG1VcCxEualBaqleF5XyuRyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S8Cij3Z0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uxX4ArNl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S8Cij3Z0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uxX4ArNl"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JItj0F003023
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=43ZthrMHaEhAK6xNUj
	Asl64g2uFPBP6izmIbqRsd+ZE=; b=S8Cij3Z0jg98xycHq18iBIF7LRq1PmTCSB
	wUXphsoh/w2ZcUfuhMU7pyBqcj1RuTbOBjosLxpfmszJ7Q5Wqioa+8Fq9ARAFHxa
	mnqBi/pDUIrMxoEgalFdBIxkJYjnkvDM4vH8HxrgrlirMEYGy4ZFBejfJgmGuSqj
	t41hSuj1EKWNI6eaDgfsLlsYJgMZaXsnS/JOtpZ39S5fBLinD4ZBm+n+IDt9CXH/
	RLnif9mc8g2OvBXqPMvNx4JzwIRZ6U3bOGf8PLzoTEagoHeME1P5kvq7xgS1KZBg
	d6nm6eLbiTSzrvQx+As3bp4xJILhcv5xRVxVHdG7fuOxWLi7SL2w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m3usav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:07:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JHcPg0022430
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:07:23 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxeha76e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:07:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NN/5YndZbC1C8BX9fmB7c9NY2nNluRkrre0ofCqyYymrS0sbJfR6U/+5JqC5b/gtiEcZovNP49vTQb/K6YoS7ow+SytkDUCNTcB6JX4i5wcZ88Ed8pHXdlJ0eRnP8RIyl6FfHtOKtxzrk6oGqpgeBJbpaKxFtvIgtBwfISLFoz9wfUxranLQ1XREIEQbSStwwJ74ckRqbqVgL+ZNWz5lR3lAh8Pt/P/+GGvX4FJkgki+ccDvCD8cP+4pwGt93WL9/3qihBWJu6trWdSPrnjlQLUIzTT9mqQAzjGmSWJJ8M8Nn9yFf91sXLtE/jl/52PDmw91jBtJSGp5UjXQxDmkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43ZthrMHaEhAK6xNUjAsl64g2uFPBP6izmIbqRsd+ZE=;
 b=adF0IDPUjV9sQj63XLfrEAOCoRuPXStgmd86UT8FH1R+OcrwZ7bXfOJX90qwjAqjvHCcq0vc63nl1xzBJztE3uTqdy/XBM5r8HwtboMX9Ofdtd+FBDdJFoUedvElBmRQ5JLYp1FCE5wKzttuXBkbgCPScGW3X9REAmqUuhffIRpVvDBvjEgRSP6UxtEJdFgtQnlaVcV8gT4A/vyn/W1b9+/ClKlvEN7TKuqPBt0QmC/l83hDEzs475JwlCO0oQJVa2ImvE9cyfl5CCGOF/xam8U4fnPVrXsNkqCl/5FXEZVthnHuxqFnHliF1HzUbff80iOc+MbjYPmdJNBss8X9Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43ZthrMHaEhAK6xNUjAsl64g2uFPBP6izmIbqRsd+ZE=;
 b=uxX4ArNl6AjlUHDVm8+AoEXzAuGoIDFdbaNR+1R1+rZ+R42LhL9MioFA0xVv6HPR5wPlOnH1DlqBoNLFL7btvUX9Ha7bjJluPJ+xw9cYhNuqnuVYOdEtSgAw65pheegH3+nAieYIc28IV21iJHtaLBmY+6IWe8rJeQYtdPZXpVc=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SJ0PR10MB4717.namprd10.prod.outlook.com (2603:10b6:a03:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 19:07:20 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 19:07:20 +0000
Date: Wed, 19 Mar 2025 15:07:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] Get execargs from user space
Message-ID: <Z9sV5egl8ameuk+u@oracle.com>
References: <20250319063230.28171-1-eugene.loh@oracle.com>
 <20250319063230.28171-5-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319063230.28171-5-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SJ0PR10MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 005c951f-c6f2-41ee-f322-08dd671945e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jb3TDDX11Y91ka0O46Jok+yQR/cwKy0VofgspA3JydXL6UpaNSxuV3mhgKgt?=
 =?us-ascii?Q?9zEaNdPjKKGNuWF6gRb82t1/OS9dqVRgUXavb1jNJKf07BWsJ9LRqDnCEJBO?=
 =?us-ascii?Q?oJEnlVBG1GRyF5hTrxsV1aSDVpvZN8Tgm1Q/hU5QvOchAarzzidIk9hps2j9?=
 =?us-ascii?Q?xEnpbT7XS1+paVPaMd0hj1SClvD7sHZNulCJ3NA/J0780tJBQJPFf8PkMhzp?=
 =?us-ascii?Q?OFYYTlSqIkJ5slDkTdgv6u+dAx7YWa5mSWrbXGLATFrOummix/dA5q0h2N16?=
 =?us-ascii?Q?O99nn/6BD1bxVHFciIGHBw/JWPo40LN5LS3GwjGKodpi4tTXADoy6TiiMOI5?=
 =?us-ascii?Q?MuA0pLUBVKK1BCKfgUJvtu1cbMARvfxkJlX5CUcJ3nYW8bRkew+ZS2Jsmu/d?=
 =?us-ascii?Q?fejCaQRiniuvJ+0gEu5hogAMkYi9/WiSh/jH7XZL95yiyRUOcPA6Fuh+xIjt?=
 =?us-ascii?Q?zcWconK2m9w1y9jnXZGEDJS0adfnJ0Io8a+m0txiuWqJlBI6PZIl3hqNElg0?=
 =?us-ascii?Q?42O8UO1Z/EhwArOFPWNSJAwByqD/Pepxj5/EigdRyCOqnCoF9lizVurYv1PH?=
 =?us-ascii?Q?EnQAlCMZ2bGn/yej0f5KR3I/FLy85r1Yj/wprI4VBefy0AZs0UozJBrfoCJx?=
 =?us-ascii?Q?Ej9fEyAMbd2zi8IYlYN1L8+WJgBtEqTlaCIk9p4DMM0xoHw8Pfx0CkFTJyHx?=
 =?us-ascii?Q?gDcaT0cXJh+wLNMVC05XqY9hcWB/8NNLbAYKp9upYhpkXiJ1+esDkemLc89B?=
 =?us-ascii?Q?UDmB9YguB2sisDWEmPDpCQeeD/6ulqPWyNE3ltPyA2htAqdHD8ALwHdCD6Zl?=
 =?us-ascii?Q?HlzI4A6CI5c0oF7Ck3HRPgSFXs/e9/8hbFvQZgxKOHz9+rokhs/OitpvDgtE?=
 =?us-ascii?Q?Je+lI6xufdVSCVcOP37Vr8kzqQ4VFEOPTMStwfxgLh3pO5mo+i/ECkGEoltn?=
 =?us-ascii?Q?1S7HpuunmJt33bzPHDKMAMu6PmKAGfx6TKBgXhQnrtCd3ai8rEb92HQd46U7?=
 =?us-ascii?Q?pcj9k0yrIQOP5+M6YkJd+CUTkNp3OFmJ6MZrsjktYbLR1px5sNM4lkcq40Pc?=
 =?us-ascii?Q?jh0mQet+3Y8Evy6OTn8OCSJt6RJYa0ZR0ghyqqLoAQWoXGy/ER//oWP34tKP?=
 =?us-ascii?Q?aNWY6PcXOwsQKSJy8COsgvucjchkZcGgCfYOoxJdLMEwxeUszU5R7ciw6Y4H?=
 =?us-ascii?Q?9EJIFCXrCrUpwl4Xam6CltU0hgnzFg0mfByFMN5rXiskFNHUKkPOUZb3+HD8?=
 =?us-ascii?Q?Xt4mw3CV+fXKKonEcTdqG5nxqbCGAlpcJjpBEH3BPloR3rKHuFK17n6d2KpF?=
 =?us-ascii?Q?Ns+pbm8dAwfx+zWf+P/qAU5+52jWwRNMlk1jFw70DnSR4R3yz0GKDtC0PjA3?=
 =?us-ascii?Q?S6sn6EE3uTvvmidLG27Zgn9n66Nl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JbArpsGKvJLILl2LqH6cm02FWzI6ZWoPaVkDGl+ktoQg6k5ivnfVteUxewID?=
 =?us-ascii?Q?yGlvFEkFJFI/Ke6imDaMVbneJLCqL2BISuXPMI/V0yaJh5r5yGksn3siipwP?=
 =?us-ascii?Q?SAfHFIYug21nsSrjfAXB0gW/URx+VJS/cZzvvxIRZ3Iqb6NG2AUpukjJkA7F?=
 =?us-ascii?Q?Y2dgu4VDujdQoH0c2GREOtGsaM0IMlQdKoDatZvLfYe5mUtgeh+iPlXGAWsO?=
 =?us-ascii?Q?IXUPsA6zTgD/975rAkNCA1O41WSGhKDz2CtsFQ21iICtbSv5pAAMrXkGScX/?=
 =?us-ascii?Q?Cg34YrEASVNthS2gM4LyGuotUF1A2U262nW9vZE7NyISNVQ4aRGgZZP5aP7i?=
 =?us-ascii?Q?EA6nk5doMkYCrJimAWLxwA92LBjyQekTGGrUtfkf6MwxYRllKKRwv0UcLxTy?=
 =?us-ascii?Q?em3YHDa9P81EwvmCnICR0DpriL2XTq6b49jo7jilMoTLbMq9akxO6G5tP8s3?=
 =?us-ascii?Q?1L3Zsar+I1Nbctw4aaHF0+0JAdsg5iJ9J6ZJTG/h6BSWO//nEqg7iMmFGxdd?=
 =?us-ascii?Q?RT/NJAR9weA2J4rc8dxAhaZcBNzxOB+D/oKPNZuBYxgP65NbrtO4GP6/HyTF?=
 =?us-ascii?Q?H/+eFd6wa2HaxkLIBKUPBJhkyJUayZX6B8YwszqQ08WIaiLyaMzntFAKAACO?=
 =?us-ascii?Q?Yu+FU2DgQv+T/PqQ8pjTlzzkAxO3Rkb50PWn+z9mWJ98pgXBnxHTt6JTBOaR?=
 =?us-ascii?Q?7CfLSz/Bv/eja+Wxoj72Jj2j8MVLhb+JmQJ0xMBn3lhBedx8iusrDQfY23o2?=
 =?us-ascii?Q?e7+sI0hAQBNwKdhsxO7OSjkjHVTbM2aLNjWXHVDtHMQn1MgZPije106XFYs9?=
 =?us-ascii?Q?xTXfP/lZo2/MBX4ddVA87fkrvCtEM302m5uTTLt87y85c7Cnx9s+e9eF/t9f?=
 =?us-ascii?Q?4fbDibluFsu69J/FK9FmbNs0jXsVgHtkEMhgHDCaKgURH110Ftuy5X7PZxN6?=
 =?us-ascii?Q?PQtUVx6rwmeL9YCLrkAb1rFvzFiHiJ1a+f7WRaz+0QSHPqHZhfifwV78vR9n?=
 =?us-ascii?Q?mVu+yV2e79sVgYYjjOql9OoVMInRAgqwjMJNab1/OtyrFeIcQb5Tx9Fv2R3j?=
 =?us-ascii?Q?GDb4TgUDAkREt4IAhGzr0HwcuTyjbngjqY7UqRef5N8xy28mKc2cN83Eu3ve?=
 =?us-ascii?Q?FUcj5FmUwJU+xljRLTI3lR16REHbtmD3KpnKgAtbPgt6ww4XOrzvrBfx6EM+?=
 =?us-ascii?Q?spEs52o2nt0oNrexkEmitR6C5taUS4lR9XpwOcj6rH/Nqyq8RrV4nzhFqUXq?=
 =?us-ascii?Q?jkICrJWxM1Pg7yc7C8MT4oQ03GR6JUZFCo/dESr499SqoNQ0sxEQmlpEImyZ?=
 =?us-ascii?Q?6VV5na55upmpxB7oOsIsfjSMvf1urePTjTrdUix13JMKW329jbPhePotu60P?=
 =?us-ascii?Q?1AuBsnUeVEQKRmyMrBPQxGwOcA8wxFKlagNSxGo5k1YJirvAdQTVKHUIqIOU?=
 =?us-ascii?Q?tA0/1k8+JbdpaRSt8B7G/TVe/WODXAvre38ijxBBc6NwNkVDYt7z0FdyyiU2?=
 =?us-ascii?Q?OZGlnv3fuKNAeE3g/rq+9gGegb8ENCNAJdZmgoqJod+uSQObyYhgZvlUTiep?=
 =?us-ascii?Q?2zDt1UVqWGT88KuTkD+9EZJN8CwVm5nkY1znMLenoCM6bLWhI0D2d2qNCX3H?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ipN8pPjXAxFncWcMENfhr5mu/P+9k+bKMSNFnu+jZsiD2NzGIJMR439mut2JJCDtx7K7A3+6P859wCbMJDKID9xisebST28zPz1NSF3Gu3Q528vPf0nSVniAie6Nj0yG/LUEESeecrZEi2u5kw8yf6VQlEwLfRLVtSugSpk8haBJZvQPpk8GTc9LxNALbN5w2/ofDUT+01LoPOpT6PueIlSraMfNEWinae6ouscaoWwbXrqE5gtriKsfij/r5rtWgXPROShlC8RgtI7B9U5juoCuG/8gLGgTwcz2dHNtjdNfOZ6AxmcBsv8qDPnkr5VpZ0832NSylFnsjBi1VeGGsqLgBY6tNUy1OlB+xxLQ12xarbJN/6uWzhNS0NvpMqh9WjMCv305D9RZl4qtQ+u8o7XcMN96YoXdzm4+9/MKXL3PIC3zb5lL12XIcYYgb6tD3I4KhxaubgiNdn/DHX/Ds83c3hWMM1xp/vngaZJbxUy/aMjxvIkaPVhDcc6W6aUd4BEk7AAJp4WUTna9vCGomWtHMXpTUJS7cwXg3ATolmHZK0Iof/OB09rwn/N3gRoPV3uKkrBalSdITMnGjoZzQWDv0fPbu0/N0+QDhL1ufls=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005c951f-c6f2-41ee-f322-08dd671945e7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 19:07:20.3028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEN3Rki+ufyCgWwg2HjSyAxYpiv6kFSpRsVshSvz37HPnV/bOjjsFpskO1ttvJciPjy9P//7W0NtLzSweerEZH/shDhDfM1ZFWyfUamyK3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4717
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190127
X-Proofpoint-ORIG-GUID: 1bXWyY_K3J-U5UgZTOiW3wlRSAP3V6PN
X-Proofpoint-GUID: 1bXWyY_K3J-U5UgZTOiW3wlRSAP3V6PN

On Wed, Mar 19, 2025 at 02:32:30AM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

I expect this is a failure on arm64 only?  That would make sense since it is
the only arch we currently work with for DTrace that has kernels where the
specific probe_read_kernel/user separation is enforced. 

I'll fix the comment as indicated below while merging.

> ---
>  bpf/bvar_execargs.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bpf/bvar_execargs.S b/bpf/bvar_execargs.S
> index 1c47cafb2..08844f15f 100644
> --- a/bpf/bvar_execargs.S
> +++ b/bpf/bvar_execargs.S
> @@ -65,7 +65,7 @@ dt_bvar_execargs:
>  	mov	%r1, %r9
>  	mov	%r2, %r8
>  	mov	%r3, %r7
> -	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
> +	call	BPF_FUNC_probe_read_user	/* bpf_probe_read(&args, len + 1, arg_start) */

comment should also mention bpf_probe_read_user

>  	jne	%r0, 0, .Lerror
>  
>  	/* loop over args and replace '\0' with ' ' */
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
