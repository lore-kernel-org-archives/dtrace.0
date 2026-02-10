Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0A613B58A
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770754607; cv=fail; b=ULzycJ1cqwebbIamTrxM/s3tgFmWvCgJ4CdoAsCvmGrenljI6V2YsOvuHTvAvT2CB17yR3N0PqWdslr0MGjDVXRIdjJgVQ+9s4b6t4EABQ0opC6k5gEXFJwCUrVAn1XRR0kopXk6C90kyVVyrJE2plmIaazad69gADz26EO0w1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770754607; c=relaxed/simple;
	bh=AxvsJ8nelOjiaBatXh8hNLgMlXjwq/dwlo7GFGWUUGE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iyTe6Wm4+fU6V6FFEA7Vst44MyRceBL6rA+fNdwjZbRS3xFL2lvzXvWaJD2oJTcLH38emhkc/8209H8KdscAfOsEGXP7alIL6sDDXlXlsul8RolUkwBex+X3CvHEybmghiussC9HGF6wn1cTxyRcWl9Nnt52GAB0UzXcc6V6sKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GTqnOrEZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rBcPs13w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GTqnOrEZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rBcPs13w"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AIgfGA3998387
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=P9Z8ySrEXdVw0SyRJKAOH1ELSJojt5MZtsoL5vtUiQY=; b=
	GTqnOrEZasIVbszaAiftWL2DpNYxAReiO1am876MHTXx85gFibr35lUzVW6azCnd
	20V+SXZv+vL7fttlmEEPiF7609BqjzS6rUz3wqwe42l+AfqpJw6WmOVt9JS0XKqG
	9G4t7BfafwgJOWE3LcYEcWMLG9TCZJJT7MhgTai4QmKSBRsbZ4cNspu1feJqOkqu
	VMOVVcZ+FQd262pvfNDEfPz3K97Jn+w/57kbElNETrllsq4Vssh6BPSz85F/mI11
	0lyU87rH3rB1F4Kxcv2KUlfaQ+6J7pQDBUrVoFIQoaWgxHc3pF5IOvE/B2u2kfKO
	s8QqscchIY57XaPg1YAywQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xfp4ue1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AJqTGR022555
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:43 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c828ahr45-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:16:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYu5dVl/PxLi/+zAg+P6UPTkS8T7anHo7Fp1hLX+ZhoTVKxg7fRJJwLDAktii3K8m6Z77tmypOkQ+Ey88IFvK+j2283DFwqWiolIv5Mcv4Iq9mTwkA6QfM/lNB2REMZeotquNLs/Rj87+yN/fUrJgGrvtSNipM4pIbBhVS19MRF13whBCzUE2p307r5keqY4M2r6cpZ3/uku8e1OwnxL8mIwigzw86sfYxfPYsh1KhXVzbwQ0X3flNK8iVBWPCzUzCx+PCyZhgpwnvoBxVIeKpPu6rwN+elsJqH76KydEJDVgGuTzCt5dsUAu2i+gTL8BqvinDbf01snuTzxjxcbXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9Z8ySrEXdVw0SyRJKAOH1ELSJojt5MZtsoL5vtUiQY=;
 b=hw6P5W3jvzHOb6vG9GPuZHQu60lMRvfbNZhyo12nG5mskQfx+z/0H6G4wrWZaYJFRAjLgxKvr5gUYrrABKgKnVfS5EyGAJL48EmOqlGYI50JiKcRcxI7ckPySFckzpQIQd8MaC3IN69sVCq/u2eQ0XpWkwtWQeWYH/5fFDocFMgwukNJNynwILg2uXYTWVW0ZSU0Pa+XHn/XsM0+pISStT5qQH8wg3b1cMsRDvSWRiH4Cw/ohjKwb9qc5GVRtDpC7FmwZB1gOxSk5xtJ9rMDD8S5tKMKM1CymdAomDkT2AbIdam5iipQJNCRVVNBkRSV0GfSewb3UBxPaVM+NkjNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9Z8ySrEXdVw0SyRJKAOH1ELSJojt5MZtsoL5vtUiQY=;
 b=rBcPs13wEFlugnwwRjoDrqLITId2A3pOBsNrSjGydawa6vEZnmVIUEBvK3fJf7XA5Qj6G7eSNJI9WY4fJ0BXIbvTKXs+sXund5uDPuPJrmsfj2Hr/Sttjez55G/I3S45mdbgckuQP8aZEU6XRVIGIiOns7HDBJ+eVieMhSyU8rk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4607.namprd10.prod.outlook.com (2603:10b6:a03:2dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 20:16:40 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 20:16:40 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] Fix init_disassemble_info typo
Date: Tue, 10 Feb 2026 15:16:35 -0500
Message-Id: <20260210201637.8863-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:208:236::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4607:EE_
X-MS-Office365-Filtering-Correlation-Id: c554bb1b-5b75-4789-7c21-08de68e14d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?50Q4vqseQ7yzUe0NebK+3Wmwjds1xcTkDO8C2cZ7TUEUDyoKaNqDjfCFiB7n?=
 =?us-ascii?Q?u3Dvxcd+kFPqV0hY4xQKNy1H86mwooCBcPyEcAvuVqVeKHdzZDvRzZzz0v5i?=
 =?us-ascii?Q?cied5FMB4T044lgVBtbTB5YPGVSHU2iUzfStIp2uYVrjlLi/N/RNd2N44q4N?=
 =?us-ascii?Q?GrnVSObLh25K25jidi/ZEKgPSCGeQfGCJH1BKnGIKoO4NTSNVGqU4P6b3dks?=
 =?us-ascii?Q?WYAy5rTJPVYo9SRx18RmhIApsnb6R8LSwQHbWrNl3zdCv+79ZC9yNTS/owFy?=
 =?us-ascii?Q?nINwryKTp+h8/rO/pGRi87Aa5bhYERpvP+PlxXr7HQbG92wqJZBNUJUSP9E9?=
 =?us-ascii?Q?Czvma9Q4ck8uH8NDGftjGuI+cNlTAvmkrnij9TBMXpRbrETO7AYtDC5+HiXS?=
 =?us-ascii?Q?Bx70TtHoEoDHAoS8xKwNfCFQXewWv4j1XWnPsoURc9yZOg+jVtMX/zUvXCvD?=
 =?us-ascii?Q?m+DNjise19I/3cppvvhwxb01wGkt8e2VPonpdjJmCQyP7vH26MzOn0uDRFLT?=
 =?us-ascii?Q?OdbDlusnUfhMXr4KzAX0HpIM9DePurb8uP5p/UbZ3OnxqI0sd2B/r/X6WdH5?=
 =?us-ascii?Q?uypIxzXPX4MeOoiQFe4ZYEu5MY9Y2sADXWp4PEy3lgJTwsUqYsXfSDa5b6OA?=
 =?us-ascii?Q?vlTt8aQhp+DMO9SvLJmv33gOjIPOa+y7IYh5T3MSXlmFWBCUY7AHe0MaA6pN?=
 =?us-ascii?Q?qwhZn+nC31jAPk1PX8AxzBW2PR+tGVpoqxuFXjEdlHAhrVqTesUYZ71xcl5Z?=
 =?us-ascii?Q?fOOXVtZpxQpp+mf4ZPBR7/A5RxewSN82SJR/13yE/M9nrtB/NdaLXgKW8epA?=
 =?us-ascii?Q?A3XGnf64n1BFYTf0k0GIETAdTVDWAPGwl3NHqYvgsJbujEOoaYDE5WgvBcYi?=
 =?us-ascii?Q?Kh8SoiRF6UqmnioWK8HR7g/LreqL3I8YU4M6RAYXJDXqTM08Oji7+gf7wf1L?=
 =?us-ascii?Q?Vl5KbC6Q51pnTy/I7BdVgXzBFhHJo01lOrm8FTr537oXUNdBCFxlI2HBkG1a?=
 =?us-ascii?Q?w6iwMda6gVAXZeZEcq/x76bYxXATnQRcE3OR4ShcD2F2q6rTnHtXSFYpoAOc?=
 =?us-ascii?Q?oAwnZYY6dkfdL7E+4OzNdUPmRDIXgGjjzJa5cjaCrlfSNbNgd9JcENeJcMRU?=
 =?us-ascii?Q?mckHHUWOnf2PUJ7oAL50egzvxocKgL6mCzkBcvN/dAVYbcgh2Jcfu1s8LdJv?=
 =?us-ascii?Q?u7qCgOOPrSBwhkKyM8j4lDCb2LuMPYzx/z45glCbI+xKwGY0Hx4XlMDtbPRL?=
 =?us-ascii?Q?XI2Ovz+uTfLC9cfQJmWzEkSMkYdwrqgRJjdeSJZ+EVP5UBp9fSctiqAVm2nI?=
 =?us-ascii?Q?XEhlLYAAvDrcU1dEH4LcGSeW3WKWjqnXLFavD0TjE88J+U9S7714osPt9Fbt?=
 =?us-ascii?Q?Ag5EcxHd+2TPAO/JRdVKmS8VUb9UD8dxwp6Th9bMdkrlklz8B1zzvoIirD2V?=
 =?us-ascii?Q?OkCxKm3BemWEA4wmSwCnZPawT0t8+10+BVf7rJHcTp2jwgRG7n3wBs7jHo8y?=
 =?us-ascii?Q?s0GPWoZETtud4mbrBsnn8/Yj8w7rgzHKuWhWRsLgmE4w5h8uj64J8F3nvlTY?=
 =?us-ascii?Q?+CZqUPeyG3qUmIYQ2zE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1lvhBAeef0kyAntNXfbNIZzybp/rWtkyqFR8nNo50/rVQe2OEEahAs5r2CkN?=
 =?us-ascii?Q?S4QsnfDyZ3U6CoC3oGjWeWOC+zP0yJI2cGSWkfxJOVgn9aGyeq1KMQU2J664?=
 =?us-ascii?Q?YnUmaR9lILKdLr21WhIJN4ssjvW6SARnBnqLf2o2uruAJr8THrPQL5yOIMUR?=
 =?us-ascii?Q?uRNnELPnqBkBDZm3JMxtYTAsE+3/5FSn3aIEgdq1vp86QBV1AONKKk1Ct39V?=
 =?us-ascii?Q?0RHBiHbufhQn+7kA2Gyrxx7MZdrgLaW7s9ZtoBvPapcHt+SBduWtzfHOzIyk?=
 =?us-ascii?Q?MiZiwPRO4oXrj8gXSM54sGzceyp3I39ZwxgnMFthkKhTqgs5gWbEuYoC37N3?=
 =?us-ascii?Q?l/YcpQfEI1B1EIrKqn7Kr/iBQluWT52e/Kqmvpy1rP6FikpW5DARNVaj3VYG?=
 =?us-ascii?Q?C3EY0RuKcuSUpNmTLXyCmcVvHNMJ8hfkEdvIt/MA2idrbheSg4MPv9EYrN7F?=
 =?us-ascii?Q?w24O5g0CirlPexLdjLMqwhCZVTouiWxKkZ/7Zz3TTsRmpdL6/xi33ImwBRDw?=
 =?us-ascii?Q?ANGbo39TWqQJbX0eDNvrkjNjHbr0p3P4fuo4l1w/jAqVFX9shn63+REqmg5S?=
 =?us-ascii?Q?k73+DOo6nJmDaQG98LY8BQsdCnCqu6aa0j7FvEvOeVvhWZEueJhQQvTZXEUn?=
 =?us-ascii?Q?68F0ozHDDMNRoBtyfO6ZWZziHsLlqGIAk9AtT0zqCegFn+FycXu8TjFnDPI0?=
 =?us-ascii?Q?eAhFD4eJDq5hHoZILjfNKcOCKXTo7yU2ZENrvW/6qYsioaWJjGfjCbmQK5o1?=
 =?us-ascii?Q?6R27iFcBewIJ/6Jrs0kxm82gT9CgiIcjzDd8NHDjjCoz7v+T+PT9e5wSDP3x?=
 =?us-ascii?Q?u0ucj6z1SUrggSGvtKBWbd7oxXPHAugm7f6DYA+6tCO1c45nMZF6vckNxyJj?=
 =?us-ascii?Q?s4kO/J4WUL2fjNc+s251ymntETo4zIJO0/CqHVknIPlxCS6Iqq7Gxgiwk2F+?=
 =?us-ascii?Q?v+Fdt4GNbWId+s+oUawVKqMvrDzEw9gvkE7EY/umpUo9JoZ6tY28+bUhRYrc?=
 =?us-ascii?Q?UY7sWI4Huw6GmAC7VAQk8Z8OIndLBrh0huZJwh/A2jx6dwWi22n8PEwpdUeY?=
 =?us-ascii?Q?EZWCSz//0OO6QxKynuUpEajMYFPNvWLC+XhuLnO9cyXM96YVmdpGho2YAeoT?=
 =?us-ascii?Q?73V0lZBgrjFAjj31U6whq52KWCCYTgfgDUW/orSA7UB5oIrT2HnqWQsa4ymF?=
 =?us-ascii?Q?O6SG8oQ8nNSZF/UtEvJauwB9U+R07DqMTnTmQCGaVw0uPrkm62mk0M58xiY/?=
 =?us-ascii?Q?Q9zXBqQxeg6HdX54yBu4mWiAdTEyYLRImoYJpdCyC4IxyvkaSoRHOBwkXQ8q?=
 =?us-ascii?Q?/X9Dv2unWyVake15ayJd2bNQ5Y/sjQKSG3nhcRbepaHkxMX9ckEwdxr4ItTz?=
 =?us-ascii?Q?8V5c1Ra/mPcfEI+m6b0gB9X6PL3dnadur+bLv6BG1kg8aueWsF/8TD6Xq4r9?=
 =?us-ascii?Q?4Zo/hetpMYlWWjRC/E09UzrQLLAlvpXTy/WKPBo6adfI/0rRTypZvMQiDF3F?=
 =?us-ascii?Q?5qxqw48y8iKJsm+UbQwMM2UaqLFlk8cJq10sU4JHJTDpWdUkd4zewqDHCbBa?=
 =?us-ascii?Q?FWpNMZRD5lxx7yvHL476V3hrguPTNrKBLpFwf1Oaqd3qkemPeLTIzr/7w5JH?=
 =?us-ascii?Q?Ga9IpjrkaBowCMcT2MHk+EXZY3NaUMZWNWF9hTeop+SxTEYf8En7owRHi9cf?=
 =?us-ascii?Q?MPYZg/S18UF+TxChn2ZMryIc5rgkIIuHMZe1tvUzLId6QKJQGZHMFYKGRrKO?=
 =?us-ascii?Q?WKiwPzttKw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lqPu90opfd0mLnYxxZuY5J0Ocdq4M4kxoSybTNjlpDB/G39vRRi1BktjVze6hYXY2QpNH79kYEVTzCQ8gA+MmEZ0reLodV5R40AVVQsIT+sXk7tVylc1zaFaSsW5K1TdY2Ygr4sXQcYSYYg0TCl5OO/LPD/gqFnzBX8+BOgTTu9TnnRbe3BqtbsqJwUNOV9DErY7R/nEt53msI0/OJ9ig6XwVpj/Jh01D+pEcwGkLcZVxrDxxyjnQJCbnSUsConR/3KYAs4UO+w+K9AGTz54gGRV29yt4yUMDm4EoPyyC6GsrMKbnGQedo1ZPNA+DZB7SENOysIcPbvmzMOeYrGzV+wf8OPwlL8ZOGc3lrgA0qL8+ZLB2XVLgNwXmf8DxMiOFnw54g8t/eykk5StlFf5NXFdrDxtPllpyh4eWFqlEZUR58hD3p1nWhp4cGOJF0ijbKzXxW840TOpnKYdd/BT4FbfR9+YsVd0tiBIFAjoz8+HvuR/7pMwGW+Wxqata2BaAaUVBwoNp9QPsuyDTLeEI13amm1QwZsocAiTHKDuEjp9xkxRPwZ/fNBnUT2pDU1T1QSwrUBYaJobBvMIjTCwyX1ml7MuX7bOTFVNyG3gGpA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c554bb1b-5b75-4789-7c21-08de68e14d2b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:16:40.6257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCA9sr8hlE/issLnQnbv1i284YZzZVMtM0wMSMZXZPBCKNLGL6lLQGCBc6rmPqSM0KHT8UEqH+t9TJZr3XmWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4607
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602100167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE2NyBTYWx0ZWRfX3PRBJAPSwbBL
 TgI3IOA75UvrCWsHUWN5h/za1fhwwz4N2QX4OFHcXXhRY+sPer7NqA3rWHIt4uV/7zzbGYCfqqk
 J+1SvsKfgX7rf1vZ/cBn4kt0lbOJjgHArco+2fH5mNaOS2rNoTwR+jUxK5PB/l6ttR0p+AZJ3zJ
 3B1rYRAiWDeP8TOIgwwHPGm2iX2Q8ZKrPsVqL4YHasJAtxnYKokhmwDpYzKX7pRK4Tq+pSWm9Vq
 D2w+xlbyO+i1bncIzUTDsFd8OmDaQnP4WPYlsK4Y5aXiwx56uFuORl/qc2/EQB8pbqqrah+ixN7
 5wZ3Qe63gbB3PPDSoYLOVm6NnC2hyU54+TOLQcMJriBfpi7IrzJxSFPr68ubfTgiM4xbwvD7lNq
 9CLwp6qpZnDjlRSBDkn9/IqOkcnsLeoz0Hszp9iQm8RKOwEVLNUi3Bh2XJXng6cd0+RXZbuFpfi
 L1+AeV6pIFPQYpUqAFwFe9JFZS+g9v/vLX4mQlic=
X-Proofpoint-GUID: nhpW_yMtPp_CffOYOs6eHINW9rmjpQHy
X-Authority-Analysis: v=2.4 cv=V8xwEOni c=1 sm=1 tr=0 ts=698b922c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=26Sn6DwbkJ2VNwVrCaUA:9 cc=ntf
 awl=host:12149
X-Proofpoint-ORIG-GUID: nhpW_yMtPp_CffOYOs6eHINW9rmjpQHy

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 20458a511..690d1a2a3 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -133,7 +133,7 @@ dt_pid_create_one_probe(struct ps_prochandle *P, dtrace_hdl_t *dtp,
 
 #if defined(__amd64)
 #if defined(HAVE_INITDISINFO3) == defined(HAVE_INITDISINFO4)
-#error expect init_disassembler_info() to have 3 or else 4 arguments
+#error expect init_disassemble_info() to have 3 or else 4 arguments
 #endif
 #ifdef HAVE_INITDISINFO4
 static int
-- 
2.47.3

