Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102FC1A0BD6
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769921; cv=fail; b=Ix8TGr/RkmivU+T0v8imPkuHjQGcmE8Vi8ukJZHbn1NluVm8C9jSsIlvpy7U2fHdCjAGQtOrJdC1YBwReXn6KYScoJT+FAgC2gqgjoyLZOkOyytyhwlcXi8w0yfKo0KdY2LPUD55EYvjowWeq7PDY8kEor77iUhn0P46+r2bjqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769921; c=relaxed/simple;
	bh=ZEVK7gSOG4xE8TgsjDdHiKlD14dmVlfxFVuMceWAXBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p3zrQjbeos2lLnhpvvXyjMdE85/4TKc11qfQjwWRTRVAfTbIG8Kr64Q3PoSrogy/UjVowmYj0g7khvM3LoBPqu5x+XItCxC2FVEB3C3Hu5THEm/IGzG0n18l05Bv2X9dsivOcgzsqXwXTxEjcpRcvtyW1ELz1I+2UpU5E0SDTKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YLlyAPKO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W0rMlp7q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YLlyAPKO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W0rMlp7q"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2fq1c008684;
	Thu, 24 Oct 2024 11:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=RrdOSaLzsNebMs5QtAf5O/c4SFnf9EnECyqHVT8QANg=; b=
	YLlyAPKOwA/CflyvJmrEcqD/BBFTXunwr7TtqfChR/QjNgtGha/NxRAP/bC5IiFM
	fB2p15ih+u9uEbhxes+yGrZPCfhY9NHB3Hn9058MQ7BD/J+Jlk7taffr4PsOn70I
	H0GEDrGbPw54Lx4P0AruBDYJ4IibBTJ/3Zz0pAQjPu+qx5/jT/AKinncQtTRqCwW
	2bHNQpgEqYaP8onfhxNHPPsEyvrExGtPUgPvxSYEvLRUTv7sFDqiBmZsu1DOVS1v
	ce+pOUYic6tH17mBsDQIcNniTm9JW8dFUw69HBtfrKjmKd6BiinVnBPSDipP3/SN
	SH5AEayaCiL6TNHj9lGDFg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v2bpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAUPNn027356;
	Thu, 24 Oct 2024 11:38:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh45ych-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kk/p+Rgt5WR7cJdQjt+oh515RL4wPQ4MX/jaRTDPoLR8JVD5b8CD3eL+0gkiPazeo/O0MdJxHrjaV2C6tpPYbY29P/RR5HB90o/Eds208UIVXVIWd/uncaappRpyU+zg6OQJpBYFOd8BDZIRNZOyZZ18BRhIwCvZ/cFmjFutjC8OWWhIIizCtZQvH0a3KVVr9RgsFqi6c7IofdhHsMMkxERiDGlDU/PiskAKXePZA6kerKO5Wh4xyxUsIC0qjYfIevS84X81EAOYOLWkOhYAL5GpIVsvMTM5beR5Q3OtJao8K5cZlmhdnp9HT8lswU51skeNWLRe4aQypRoAI5LJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrdOSaLzsNebMs5QtAf5O/c4SFnf9EnECyqHVT8QANg=;
 b=HqRh+J9I6EGCMYbhcIZ+jsi2hxeDTuaHNlkDPBLHZ1Cxv5CVb/p8PiFYp+6+cE+8enfqpjVQBXljllLbigzSLed022R41MQPd5pEEVYELDTHz1AW7li2RngItWEsQvYhyASZ5PonkRgD3OJSRec1PUTI9ahSvX00VEU2TyWOBTGmwgId6Xk1eJ9q/vGSUBQJuyyojlteCrGNHAYM3FTQ/xdTSp3FNl4YSzs7Apo5kQcN8XEoydMvE7MILGgqwuwT4xFvZYlwdagHGZCKdtg5t7Kfg2+ElPXXjzyjNI+aYQbopeUgnr9gUANFcbDF80QrsveTiXYsludDdNkePC2jtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrdOSaLzsNebMs5QtAf5O/c4SFnf9EnECyqHVT8QANg=;
 b=W0rMlp7qPz7+0R6gjoghYmhgW6hD+y/RaF8Ta9QJj+ZRXBuA1AoWftgRKIFI7jwlqqc7j0HU53MYk+RxEVy6sy2FoyYD8jpVROzQ8cP1SWT/hPL6P2FRTirD4Bxnks0kAgQs60r3XSf+uINAW6rdW5Mbdumkt17B6fj3akxkMwM=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:38:14 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:14 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 06/14] configure: fix dreadful behaviour of MANDIR / --mandir
Date: Thu, 24 Oct 2024 12:37:50 +0100
Message-ID: <20241024113758.182050-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::23) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 991d6ca0-c461-4992-2470-08dcf4205870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zyrnu/hFImaqzxe6V6Qza96y+rZQW2XUwnyEldVlnUddI9zzW9Ihb7bimDOf?=
 =?us-ascii?Q?5NGUEcjEXcxFb75KkXyMFpX66crTNIk93D3zfJNxXiLPj3TQg21mumuyplvt?=
 =?us-ascii?Q?/lRM+CLBjUgmOSBzW5SCcFfGxzNrFS4Uex6aQwjlOFdxTB2Ckmnvzj80hwQa?=
 =?us-ascii?Q?5+SCkBpDhM9MZwMppK7N8XG+v5FrWGv+AlEdHPQftbqCSGqMXopXoQEw2Oa7?=
 =?us-ascii?Q?/sdlg21+GiWwcK5TunqyEYcvP2NvtznIY5CSbsl7iPEa+4ePe+3a4BIvk9I2?=
 =?us-ascii?Q?rR4XqEWEQZ3ipCjHWIUwADLOCKrVwaQ33Qb51VKW5leFeMSH50N4qRJyHGq0?=
 =?us-ascii?Q?ROt5PGSMhu6jNChSK2zegNqTmBLuDb5nN6RqX04ZEMXT+NcUg3+krG564xUH?=
 =?us-ascii?Q?0l/wZ8E2a9XBXZuGRIxBN4mrDXKAeEUEKJNvkBFyCozM9GYKEt/ybP15VJ1f?=
 =?us-ascii?Q?BDdpzT7YDPt8K2OAERvL1Lwxk0Z7i4SthnGv1CyOwNWYUmByge8cwkWqJ/Ft?=
 =?us-ascii?Q?My7Z6dNZOIAw3q2vH5AUzxJcxHNEYb4k8uSU3FpEeEY0L5jxTo/+h05ibHpa?=
 =?us-ascii?Q?Z0dNNq2uelBNsgr56eJHAUC/zazBlJHWMoR1NVoFY7M3JU8vmjXvjgcQZfd6?=
 =?us-ascii?Q?8gBB6PbM76qVCNcdL1DNtvDbF885kV9njk77xr+M6sNK1drHlJvotbYSDgUV?=
 =?us-ascii?Q?q6WTK9WpnvwwjAM5f4XYLcOCMJGzi6QSsw2Ls7nriWoIKpjpj4Lzqopb4vvl?=
 =?us-ascii?Q?VxnOgP7R8+SHVVrIUZ0alWbKq7No5C+lF8I51WGsGnfxJEoqF3ZMFsNRv432?=
 =?us-ascii?Q?y0lofX9Ye7X6EJp+F28KadQ+ng5QSsFyG3EuDy3MaGUz8pm0EnOspE+dJ7q6?=
 =?us-ascii?Q?g4saJygXV00mOY8P4cwluPIYpbwSu9iyJ20SlBHVMt/2iDl6ursJrBWMz+JY?=
 =?us-ascii?Q?8/bpIfy0Xnfg4Q9/xP8cBw6KpSO7ky43u7T7iR5VTdyS/J7t3oY3a4QEgnOf?=
 =?us-ascii?Q?+pGsXAjRA4vuxN4CahR7U1tkpGzvhNta9X0euhW4MQtOY1bBoCmSW3iq0qnw?=
 =?us-ascii?Q?FvobQ7ojQkIx1qwcjBMg5SiiHoLg7h3TJv++LAhy6mZyPdOpeVM76g+EVQUB?=
 =?us-ascii?Q?7i7QkfUc+62qGgiunYbW9bg6XZ1r/mvEEPJNTedc8KkP36N9TR7JO1a2XqQ4?=
 =?us-ascii?Q?9BPFdZdlBQlATN7x6NrqmnPnqTD9OdcXaYJm7dMuI2hKVYqnICLYhuCXwVwN?=
 =?us-ascii?Q?44wwYXl9ybmc+X6bh6Q/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CaOujy0lx0aJ1DDxIr5kAxDwK575U7ECuVdKOluRs+KxOW4haK80f6iMxjoN?=
 =?us-ascii?Q?W8aFs+v3ddlYqFAgrQD7z8ACkoJlzbVaYygky418fJvYBhSnPmMU5osl8KXx?=
 =?us-ascii?Q?X6LS2LejzCw/gnED573nypCrVox51waTYTFj0F+2fQ0ZIIeg/kmDc7w0HDpk?=
 =?us-ascii?Q?o54hS4EEtoR+F7PkottgCqt+QHiyvlmgmLXM/c17+CIjkzcsT2+OlxSvOzXp?=
 =?us-ascii?Q?j0Fp+d4ZAFhH+gFhjxe3w7SE99CLfxQ4ixAxTbcPpD2JJ9skO/g8YEIrGGsW?=
 =?us-ascii?Q?mrM5tG9iP5hxhnjLZlugIdKCLdaZxPYflFqaqtOYfmeStOpGdQtvdi3H37z3?=
 =?us-ascii?Q?TwJrZ9opHozrRCctPRo7sNqhVDt3LKfBaIb7wMahdb6ayljOuuP7tUQ3uHZC?=
 =?us-ascii?Q?aEpkv5QsQm62gCKemPoMONRcHjsIrNFezkghDf1CgZgC3SAOO0CYpaELAYzE?=
 =?us-ascii?Q?XRhB/7L7XwM4nCbxAsLXQFWIKkorS3VEMg6r5r9titJI2jZtUTux4SiZOE+n?=
 =?us-ascii?Q?c6NpkDSg40+lEc1QUqMtiruqqnGu11mp+t+NBMKNCBI1mHGUVhbKfTj4vsPs?=
 =?us-ascii?Q?WSAkfcnU9zC/W8SeWzpDtheosjrKnTeWTYnkBcEDCyzby2ZDgjT/qT8o2kf3?=
 =?us-ascii?Q?PAMBVxvcrb/Bxxd61Ejl2tY7+2WjBrqMCdCRxaIeLFw7vT3k3j42J7Ynwt+P?=
 =?us-ascii?Q?1ghvKPohnuhqlzbX+fl+txPasOuiIxpdJHSYSAwjGCy4S/craCDyH2VwEHeZ?=
 =?us-ascii?Q?m5boMA8cLYIxHruz7C/S4zj3rHheMpRlQudSQ2BTwOdtzzaWeif+OTs4Br65?=
 =?us-ascii?Q?bgPMfVybVkWcnuqLD7MxiVeGcEivc808He9TnqmG8r+oKZ49bh4bdHgld/8D?=
 =?us-ascii?Q?cV+Km7Y84JubsLYktln9GmiWqk87QmXX0iFZLGwCSXt4tNwV8B45Km1tnSaX?=
 =?us-ascii?Q?KsuuISU8S3a1Vus6288O4MXUEnQ3Q55/0K6Y1oZlt2iSy4KrYX6EJvKJqZTV?=
 =?us-ascii?Q?uQBcY97LVf9+euZibazARBFxJpNSbTvJT5ChZNp8/6PN0JU/7L55XEloOwEr?=
 =?us-ascii?Q?2ZUWot8Hd3q5nMs27cVbf8kIj8p8aYJjo0QykW7V17FSMxKNSmhMQ1ar1k0/?=
 =?us-ascii?Q?j49MmmikU15PfDlyZprK4XKC7judW2zGtIXrg2vhumRGq5A/k55Je9wVrVNH?=
 =?us-ascii?Q?PDsTwqdNIXL1udi8RojAfZRho4jEeBSivMNbwEEdgiY7yMFt32LlZL1iY0MC?=
 =?us-ascii?Q?GaZ6ILz7WYhjfOZMr/itoEjrto1kqwoaKk/gZ/Ti70kjPri78V7Gs3glHP8k?=
 =?us-ascii?Q?YwYdu5kAEgcmUmOipyDbJ2xfdVilhkCjJ7P/2l76cOB0/daFpGZxUHN0HVSG?=
 =?us-ascii?Q?jFQ7+ZVm4uYRtuCLL61rn0NYi3taUCcXby4cKCOOT9nhxqnhTchqvCXkSv3F?=
 =?us-ascii?Q?q9IBwONVC+UkzcJRDTlXVF8pO2zjL1nGZERAzuoD3VjSJRPpPm2cmNBDnXM/?=
 =?us-ascii?Q?UnHdC/+UCxTZMCoRdt7lOIcs8pnrI2j4cqs0Mq3owGsVGawTy3lEzEjYNIQJ?=
 =?us-ascii?Q?08wyKY0BF5BKhu8x14sGJC4DUEd9w5NH1HOyCNVGvU6HUeoOZolyeYs99p5h?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FZIvVN800yI+QwRCUwGuRqe4s06zu4cwZMgsvTGHHayy2DmlZ4KOrTdGDqGmV3O+HbxNHcGqcTpWfea4sE7MDu1Jk8uMU2Xe3xc3Qmjcloh3EASkRulV0e4Qvzf4vmJytUPlH8FYDlEogl3Ui1rKxuMYbbfX+5zJ3Kf5dzjeIyGAFxlT7UsP4r5VCGX2erKMJmHn5U7StzPpHML9zL/NXeMXZGxq++nLRqNwjUoBSkyk5LXP6hc7jac648kSJNKeqoC3KSIn4lJmcj7JJxRco6Xm1FbDOY/pmPG8+tfwNY1LkB7ASnhlNBQnnDVCCS0hrifofB+4SSDUTZKGHOkT5TfWyvciuG9a/bCBysqgL507qTmxy7p7c4TmQe/1N9FSRBfFX/0r1ZTM/zKaQnH+CtOvKFaK2U93nNCSU2wKHmZAyVikuhf6JalCLqVo7Wgoa9txBpXbYxg8n16LFxogrekljRPOBnaJgeEP/abI5WlICcwdZXl1FDXECNzeD9IzAyMM1gFisX+z2egvPjAVpePcEi7MkiSA6n92fMseXoAP3LSncg5PDjnPVxEdooAMO5Hz6dPLD5bj1ePy+sRw7zZ6FxlGoQIP+zAimHLBVuw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991d6ca0-c461-4992-2470-08dcf4205870
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:14.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZDBukL/VeJQMeSUcdoSsR8ERTJTX8za1JpBNOKYiBBTvrErX98nJA+TeatMW+AjPF5yhrQz71LruC2HMy1blA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: -xj_lIcq4vZ8FOHGAPo64WnBBk7G_ZcS
X-Proofpoint-ORIG-GUID: -xj_lIcq4vZ8FOHGAPo64WnBBk7G_ZcS

This should obviously refer to the top-level mandir, i.e. PREFIX/share/man,
not PREFIX/share/man/man8!  Literally no package ever does that, I don't
know what I was thinking...

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Bug: https://github.com/oracle/dtrace-utils/issues/106
---
 GNUmakefile | 2 +-
 cmd/Build   | 2 +-
 configure   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/GNUmakefile b/GNUmakefile
index 99960227bcba..e2c4108fec6f 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -96,7 +96,7 @@ INSTSYSTEMDPRESETDIR = $(DESTDIR)$(SYSTEMDPRESETDIR)
 INSTSYSTEMDUNITDIR = $(DESTDIR)$(SYSTEMDUNITDIR)
 DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
 INSTDOCDIR = $(DESTDIR)$(DOCDIR)
-MANDIR = $(prefix)/share/man/man8
+MANDIR = $(prefix)/share/man
 INSTMANDIR = $(DESTDIR)$(MANDIR)
 PKGCONFIGDIR = $(prefix)/share/pkgconfig
 INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
diff --git a/cmd/Build b/cmd/Build
index 68800fbeb5fc..38a538c1e3c9 100644
--- a/cmd/Build
+++ b/cmd/Build
@@ -55,4 +55,4 @@ install::
 	$(call describe-install-target,$(INSTSBINDIR),dtrace)
 	install -m 755 $(objdir)/dtrace $(INSTSBINDIR)
 	$(call describe-install-target,$(INSTMANDIR),dtrace.8)
-	install -m 644 $(dtrace_DIR)/dtrace.8 $(INSTMANDIR)
+	install -m 644 $(dtrace_DIR)/dtrace.8 $(INSTMANDIR)/man8
diff --git a/configure b/configure
index 0c9fb309c494..4ce64efe4ed3 100755
--- a/configure
+++ b/configure
@@ -58,7 +58,7 @@ Installation paths:
 --bindir=PREFIX/sbin				Binary directory
 --sbindir=PREFIX/sbin				Alias for --bindir
 --includedir=PREFIX/include			#include directory
---mandir=PREFIX/share/man/man8			Manpage directory
+--mandir=PREFIX/share/man			Manpage directory
 --pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
 --udevdir=PREFIX/lib/udev/rules.d		udev rules directory
 --systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
-- 
2.46.0.278.g36e3a12567

