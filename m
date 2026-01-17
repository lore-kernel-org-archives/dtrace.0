Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF361198E91
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768665412; cv=fail; b=ZGm2hS4TS1/PGm3TeOHQ1DgClql79+09NSsj3FQV5uv8uLzstK1yZO2Ff3IEmMZ5ZL36UsLI9m+xEiBPztM15FV7ydfKE1xHbCdaATrV5ByZvpxxXBLxzD+Qmw9sli3rx8pNgQut1U78ln7u2433ajEugSCsMiTEOIT3m9bvpGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768665412; c=relaxed/simple;
	bh=EzfaKUmgRdkTQnYm8wMcwMypFPRgy6lKryxrD/9xPAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dEW+cJYa6kAOvEeX1yqMYy6izmwLKLhvHjwtmMD+tr3d7fdH2MQQrnqINtjo4dH1EekNuD0iSBc1Mzr2Z/DfhhOuc87EmIflHEDNnrmVrD8FJihVLbHBb3pJvJv+9WMGEcvDzig2b1Eu+zBLF76hKQPu77TUATzn0CADr3TYw7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oxrJfo6u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Tm2UGqds; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oxrJfo6u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Tm2UGqds"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60HDW3Ta1169751
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 15:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5TJEumctLtq+1QmG1Q
	aBRU4cAyn+NZDBpWSPb+5bv5c=; b=oxrJfo6uZnNmD+yo7v7guKY1KMwtGNZtKP
	3UPHGBRUMYDHQdvpUlsu7dCeoC4tEL2qo3bg8ix44rStC57N2Q/Nn6XBuFX37Tap
	GtRbstlS5JJRafg680KCUH1mZurpuZfSVvkGA+Fkg/M7p9pdTiNvsSy9+rCeFl1G
	OnVCpotbl/4CFuMPvMv9Md6oz3jTOPsIcUqFfLkTUk3cMypGDJZFIocVkgTE1nos
	mGPZYN9S7tsqhv0EVxTr+qtZ5X4+B56Ftxhm4DN8JmX39/mfwvFCSMdztJ3ZYm4l
	CO1KI6meo23lQ30MqddrlUY2m0BTVZ0V4oHE+njB7gmy/bcQcPbA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br1b88cx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 15:56:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60HFRP8S037634
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 15:56:49 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010050.outbound.protection.outlook.com [40.93.198.50])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4br0v6pyua-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 15:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBTnuPmdWFAsoSvfUt1ZzCtrC26kbe9tuAvyjRbui7JAyIUFgpjzMCIdLNe7xwVmGVb2fwIzWIWn82rihYOcUZGQLHFSLlYar5nnstX8sLZ0cnSrvw4GhhXbJqTewiiIBOuh2qS7SeC5XAkm1WFY/PPX+kvv+gAe3pZzrwEWAPZNlSlcykomaDfGt5KMevVp4MxTPKe4c+PomV7EFNj3Gf8mBPmUq0ayc91q8mfV72jnQtzXMjKiGp+zEeQLvFvC6yGpwBeMofFf9Z2+qLm2aEtkKZ/666hg8LtVK9IpYcUmSoC2ZnjSf1l3G5q6JBy+wKIvlqT54Qq/b36O12QywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TJEumctLtq+1QmG1QaBRU4cAyn+NZDBpWSPb+5bv5c=;
 b=FEK14opCOfok+U0BxDO/D/rewRhPfWIhmnN99Y9wQhu5YnX6UxSQd/rmHa3cHtLrlDw/LrtIEOGAcp1o1lGI3OXY2FlNiyf8uw+ftqZSNEZiUViHHEFKHyoU8W4UTOO1NIXUjydo8Fo7rmIE63BZZ1V9RiEPdXIksGH04GQkidt5cnTDBTIIXBNHRMmG1YBo8/dfDeTk2EDRqtkiyIfHTrVKrBGJ3WJmOWX05IgAhTII7pzfHZpCEukCRJTzIfcfm2mXaMOw708HT5a8I+rcbsfqIooDj6/OJEdpr5XQeKgsqTX3DyqDKjGhK0L9OVy4JqMol1C01FPxo6PadbZ85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TJEumctLtq+1QmG1QaBRU4cAyn+NZDBpWSPb+5bv5c=;
 b=Tm2UGqdsv89zhUL4omtqAW2neRX30h3GQ8whWUCFV9aJVf61k2J5dWDrcq2n7rl9mDkUjy0v50SlkASaTua4N1iiFWydnYEMUiAw2HLQCgY/GycFE6d4/N8z2KKfhYxjaphvbG5EVpJ0yClcw1Nm9icveX+OWiB2gBqFnAZGN5I=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SN4PR10MB5592.namprd10.prod.outlook.com (2603:10b6:806:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sat, 17 Jan
 2026 15:56:46 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.009; Sat, 17 Jan 2026
 15:56:46 +0000
Date: Sat, 17 Jan 2026 10:56:43 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Add ERROR clause to prevent hang from runtime error
Message-ID: <aWuxOwRO8L3oajDJ@kvh-deb-bpf.us.oracle.com>
References: <20260117025759.26210-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117025759.26210-1-eugene.loh@oracle.com>
X-ClientProxiedBy: PH5P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::7) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SN4PR10MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: 08659a2f-d8e4-4508-92b3-08de55e10416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j3SPh4Z/4FEeHO2BlFvtDllBzUTounrxbiKKyQCrGboHt3kgaf4WnW0TZZNy?=
 =?us-ascii?Q?L5tr8qNzIhpUT3WU/exyLDrFz0gh1ntxnzmejcGt7mnbTNuipPxKadaDpGfx?=
 =?us-ascii?Q?BdeK2EacNa/PpoPuu5p/JlJzLGuytCJT8RPQwiBHReb/woGzIIVK7mRBaaPB?=
 =?us-ascii?Q?aRnPHkUnaZOFZSjpvQegiO2NNXbaPxnl6XEF89fvsLF92sC2/6W/XpdOMrQd?=
 =?us-ascii?Q?jjJr7DyfyAxWppUQPF/j3os3HwkWCaXiIwMkvAaPh/ApvugQEoRLkB05ckRF?=
 =?us-ascii?Q?1EUM6mz0Y7vfmNmVSkGpl69f3S+hSWpHcsBM3RDkvZpbERZqGrRWziDbYrqG?=
 =?us-ascii?Q?yx4RHNnOCV2e7QbDt0Cad0pkjv70gI1kqpjfmw6RQlv9/UcS8t607CA7kL4E?=
 =?us-ascii?Q?sauW18CiUHeXjnAaxkJCnZuopYrHE1J29WKSykU7wxXqhJJo2zjFAD4DcaBm?=
 =?us-ascii?Q?RtlYxUUF+J52Ekr9yeBw0NY0buLVQqGMEUUURUltJ5CEIqerL6U4d9O4t/XT?=
 =?us-ascii?Q?+xqbVtrtal1ODLHm07u9xcqcxNe2tgw9sq6is0bsCAKzd8wS8+aAhYCsUPDs?=
 =?us-ascii?Q?dib6MNfBWHLr4hCDxcvjSHa+5XtH4l2YuZcVv1ro6oK5BdlxvV2dkpRcmrLs?=
 =?us-ascii?Q?GwN8zGd/o/W8RtRrXapdEXawjYBRMiX0n6cMMH3vRgRo0fwQCieX+ZheloEZ?=
 =?us-ascii?Q?ofla4qun60vsM/4KQvt02eiibhW57zAZsVF/pnfaP2+v5YpJ8QhoPruNHLPc?=
 =?us-ascii?Q?tsWwMW4jRRfUzpcXQFcab6kB4Qxg5pkeYUK64UlZYJmvT3Q+ue/uqCAaMgFT?=
 =?us-ascii?Q?n9RPe55airuMbwVmAnpmH0WkYmgCbaFBlFQZ7B6Nlt7R+Iirw+0Sx6/Eg+gW?=
 =?us-ascii?Q?8coC+RpKLvO7oh8dELzwn3u4t+l/5bwMtrjqdPvkMQCgVZGMOCKvXgqBUdoy?=
 =?us-ascii?Q?jON8o0fT1+gLx5jcg3WGAkDYVG+JaogutP7lG+KYLHUyXcUqXPEF6ZmaV8yM?=
 =?us-ascii?Q?CWdZKYx6/hQdbiWY5f2hR7t3V04xcy+Xwef9IFgmvUDWblV708K+Jp+hbp2v?=
 =?us-ascii?Q?tcdJIiZOarTZojcOrSP9A4EZlOosCvrLZnmJ/MRBHLXG7I71SymlZjyt7Hpc?=
 =?us-ascii?Q?ZqGPzsyoEKcLAnOQnZVdkrAI2Kh5nnnynwmFranMF1Wm06o2CwvwJq8v/RTv?=
 =?us-ascii?Q?zTKsGf8WeXzKWtrTOvF6RxpQ4ThqbzqrMd2F9XRPDZJICk8vDtueG4LTMv++?=
 =?us-ascii?Q?52fUhE/O82gg5po+oqqsy8zYNK91yOLQIXGxRSy4BjP/uvtzrtl/x/VpQmvP?=
 =?us-ascii?Q?EmTpQWZ2QRp7ua7WtGBxRtwbwHxT1QaFEWHGimyEMJARDkwr9eQ3/Bil5qGx?=
 =?us-ascii?Q?tkx8Y5oXI6FXuotf64QGOtvFdzc+fGBlKBvyM9FvlrOdxj690E/AvOXq08B4?=
 =?us-ascii?Q?4Tc8SaXeOVZ/zQ6QTxOw7Nv+to8tJFw9q8eCFNepYMPMI83IiGhhD8TE3zK5?=
 =?us-ascii?Q?RYfysMZjLH/t9gGEw0CHslynj474rkjNlk9gjRG55XPLtpUGDfZ6GmM1ekdC?=
 =?us-ascii?Q?1MgJlnGzjLRHXmHAZgI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Abs90yedWJmQB/4580z+FPlG9tS/7+2k6nPGquBYMqduuOI+Bo+utXWRl1eA?=
 =?us-ascii?Q?sQSgbhTz834QdKTYLoDVNUTIjClBEgHoiMdTO1/nInPcH8IPWnT/VUGDBBz7?=
 =?us-ascii?Q?m4rG8BISxv9gtxi444+lwmUxrppC/xTgp10fEIICKSp3L7L0MZIbm3WBFXRk?=
 =?us-ascii?Q?Bmh5i7nRVANQrPaHN6Iy4fn41OxCGh72m1REw1MUrtzgQ2WxYN/U2OgQ3jnM?=
 =?us-ascii?Q?Lg776YzqX41UL2VtEkrUxJwkr59CoBDDAxFZM+9uv5ldGzhoAaXcR9vt9j64?=
 =?us-ascii?Q?3fUkIQhzpWlQSOECyTWyw/fBrhwnUA8rbDIZMEwHKATYEiW9UL0TEdNqycDj?=
 =?us-ascii?Q?PVWbsoV61EKBWqE9j7yX9CiksVUYlo8pbSM3fh/JxrLI3JH5PEdzYkiVfpls?=
 =?us-ascii?Q?yRS+GoTWLW9JZyEj+OMOyxvIczTWWuBcXiRpyRq6K4pVxW2HvRpb3B8n+Gje?=
 =?us-ascii?Q?e6xdbAxQHVCngqtw7wTELm/egkwxQvawVlyDLrHpxsHLsC6WGOKjeGYC647X?=
 =?us-ascii?Q?IWeq6arfYrgx+Tyi+tbQG+cU+HWV20Kl/wFpyreNze3e+VePaIXOh3E+ZDIF?=
 =?us-ascii?Q?sNRv96V71mMU2K1SPIiCCnpN9OilXIZqSHHbYo40m0WPTJnKPB+2e/7mBEwc?=
 =?us-ascii?Q?kFPmA82Y2mGIWUmuq3X4yG1zHvyrMfTylL5Z1wwkA3+ltFdzAEPnMMD/MChE?=
 =?us-ascii?Q?+e1Aaz+dUha6NIOLvdANEuXxLCX+n0kJtF9EFJcI593VA93VqUpf67bNpHCQ?=
 =?us-ascii?Q?x4V1SUrpAjlgpe2sibHCEJ82fWLKPPtUZ/z3D4rxr7lydCU1UCQQTj6aw8H4?=
 =?us-ascii?Q?FRfL/BUoAL8ggfVggJNzEgCdx1ST/IhUAmoHXHIQvUmoFrzJnaETqGIPDUwW?=
 =?us-ascii?Q?TsEPQUniDOPUAaNctxBfQBRH0HejQUPS348E0WyrfiIjZthxBsOyMf1Eaj+k?=
 =?us-ascii?Q?iSInlhi9LbcIbVw20x8Ch5MbTz2+RWgDzfRsDvuXOj+rnaFBfAHrdpW+QPzR?=
 =?us-ascii?Q?G7srfXkeiv6ekWfox6uz89BJ6zBWEn667PMHoP7Z/xyaVFY71q5zYGpEdbw+?=
 =?us-ascii?Q?MSMKKj71L+6IjuBtYIUMG64RobNdfMAJfq0g8MxeX2ZrWMCASW5Fc7p8iSC8?=
 =?us-ascii?Q?7Erp+d5KATUXd86BoLCSF/km2dSuCf4HVNB3y1dHQqlUDuRkUn9BpKqAMwpk?=
 =?us-ascii?Q?lXWNpLkU6V1ND+ROnKWbNf5U/bvtBL6cYg9n/9Ivadw7xvWHn9cpdZ6Pmyde?=
 =?us-ascii?Q?G51p2aZ5VZ7CMOBtkSyYCrx3KOQC5dcknH/WutQFb/T5y+vONgUtOXOCcyPA?=
 =?us-ascii?Q?OtInFW/cPwl7x0vZBjJGGaNPhQCJ/RkO3Y2CoKfBL8fVgVMEPKDxSd4mOU0o?=
 =?us-ascii?Q?L3XoPZuWgRnNWF8KTIbv6cEFbkgSezpGwyMY72N2IYzyD6Tds4uBfjnEXPeq?=
 =?us-ascii?Q?jyVmLpfDmfNIO8ekwXjjCVDfuuGIdyA7td/lkBzfs7ArFJ307yWv+i8qf49T?=
 =?us-ascii?Q?wqaVU9dA8LmVOFVXj5FMLOLmJRdJDphZYAMtTBcsYOYL/HJ9Z/cj6iC09Bpb?=
 =?us-ascii?Q?uQ2CM5nfw52pOmtT2HRkPHYCl8GcHvoxb/+mEij0ejgevNJsN73YH5/kN8bh?=
 =?us-ascii?Q?Jjfs5ZSw/9YkzOMqKwwSx+LOkxosFEEHdUpyovyhe0ysbNs6jlc7gpLlY5Q8?=
 =?us-ascii?Q?fnJ1VR4QRNnxva62PDAY1jEDbi+PboJAA5aVAPW0pFYepv66lSRADvkxtPp9?=
 =?us-ascii?Q?YCcZUp5r/K+q18IGBzY21KgEcup6z8s=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tciWGrTcZjCRaLJ69DIOQekm9mLI2wTpm/TBKOpydBqVm5V878FPerE5RcDE8qLCYXNm6C2RIhUjuZniqks0P2ZNtP2wgsm3u6Ozwsa/uUEukvSzfz0MCaLFcTkYUUTo7pK38sdDiesoaojt1Ku5N/TcRmb3dwZvb+9LoTZDQDGpiemJ8tryDYudXUoUziKM7oK7j3zaEwadFSWluggvGMc5pC+A3ZvIkWvZ1Gnj1X5JdaZSU6hbd2Xo6yNnO3UtmTI5o8JIvS7a6jrXo7TR0ByB3JS1zWTd2bfggSAK2XRN41eQCsUaHGYBKMrxDAFmUrQ9WTMGOHgrAYuD0UArf26nRe4U2urGcSwwXNGPx5YolOxNAdB0sqdnSqKJK6ymdio3lu6tuPlIe+ASoh4LuadxbEgxMcDDKN1zfFVKGCPbyDezIoPrXLCdQ2+pWKPcILlw5ErCDm2KsXdP2CY+bdAT38LgJLzfIS0uk4bzgv4N60GRiNAHHdJEABDeDDjv4K/c41yAncKh/gSWFvsWolfA0/tGBUWZAn7zSc2CXlTe+Gg+gHFJPqlxslyegbWSnC7ARJuunysJQz7gl+77Cu8vbiYgn58cxFyZXsvvf5E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08659a2f-d8e4-4508-92b3-08de55e10416
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 15:56:45.9463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jB0mDp9EDPOEpSiIjC9e5Cn7JClKjZGQIkX9rlXpGP6Mmxglvtr9v+vD8Bt4BYRLWntFaOvDRIj7FqVReVi/I2vdMf7O3y+qnwafUssDfxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5592
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601170132
X-Authority-Analysis: v=2.4 cv=WbcBqkhX c=1 sm=1 tr=0 ts=696bb141 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=X1sNy9fNYcfBV1ktc6oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDEzMyBTYWx0ZWRfXx9cwM5WJ+vKw
 TE8ms0j9sBpHVK6l008pYxvplNSaGs9W9ngGyygoV4Kzs0MD9BxbTuXCGAi7bgc9aMcdDdiLgn9
 x2Cczp7t7Tnxz2krI/cv4sCMuz3O6jOy8GtVHJqB/ZyLlSSBl8lH640C6EPFAptjUsAZnt3Lnm9
 KywM82rQlcmdDeM4YxcpHz5++LP6RM2BltaAnCjn/BJ80sw5nhjqfDveptKqB8vih9f9xs2gGxB
 02kV/Uj1jyh5NJ8siMz5cw6niNDfOFLWmNrUDfhQhmXk2JPeHgn+4IcyPvuBEtXcP4RKjxXnVNn
 5/cjj8Ma+QO452IcsZSaMG340FT7743Eg8T9yfJkyPIdSh/c/o5xU0jJeEGi3jhsB/I7J+ZJJOv
 /MBTxCto8gpoXlIkY3JnTUHBKgIJ1oPgUi5tTm8hcicDnSaYqo3YXcjOgSCt7sH0kXbL03Xvvjh
 ZFDe6XTLQXL7+PN/mpw==
X-Proofpoint-ORIG-GUID: -2r3JEU3eShOPD9pJOBED9BtZiRA24cP
X-Proofpoint-GUID: -2r3JEU3eShOPD9pJOBED9BtZiRA24cP

On Fri, Jan 16, 2026 at 09:57:59PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> These tests XFAIL.  Since they incur runtime failures, the scripts hang,
> waiting for the test suite to time them out.
> 
> Add an ERROR clause to each test, so that XFAILs do not hang needlessly.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/funcs/strtok/tst.strtok.d | 8 +++++++-
>  test/unittest/funcs/substr/tst.substr.d | 8 +++++++-
>  test/unittest/types/tst.struct.d        | 8 +++++++-
>  test/unittest/types/tst.typedef.d       | 8 +++++++-
>  4 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/test/unittest/funcs/strtok/tst.strtok.d b/test/unittest/funcs/strtok/tst.strtok.d
> index 8ffe1066..b39e44bc 100644
> --- a/test/unittest/funcs/strtok/tst.strtok.d
> +++ b/test/unittest/funcs/strtok/tst.strtok.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -124,3 +124,9 @@ tick-1ms
>  {
>  	exit(0);
>  }
> +
> +ERROR
> +{
> +	printf("ERROR\n");
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/substr/tst.substr.d b/test/unittest/funcs/substr/tst.substr.d
> index 4dcef73b..580dfa0f 100644
> --- a/test/unittest/funcs/substr/tst.substr.d
> +++ b/test/unittest/funcs/substr/tst.substr.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2008, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2008, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -209,3 +209,9 @@ tick-1ms
>  	printf("\texit($failed);\n}\n");
>  	exit(0);
>  }
> +
> +ERROR
> +{
> +	printf("ERROR\n");
> +	exit(1);
> +}
> diff --git a/test/unittest/types/tst.struct.d b/test/unittest/types/tst.struct.d
> index 627a8585..77499789 100644
> --- a/test/unittest/types/tst.struct.d
> +++ b/test/unittest/types/tst.struct.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -49,3 +49,9 @@ BEGIN
>  
>  	exit(0);
>  }
> +
> +ERROR
> +{
> +	printf("ERROR\n");
> +	exit(1);
> +}
> diff --git a/test/unittest/types/tst.typedef.d b/test/unittest/types/tst.typedef.d
> index 744c93c2..7ec3bcd3 100644
> --- a/test/unittest/types/tst.typedef.d
> +++ b/test/unittest/types/tst.typedef.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -49,3 +49,9 @@ BEGIN
>  
>  	exit(0);
>  }
> +
> +ERROR
> +{
> +	printf("ERROR\n");
> +	exit(1);
> +}
> -- 
> 2.47.3
> 
