Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054C119D894
	for <dtrace@lists.linux.dev>; Tue,  1 Oct 2024 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727812503; cv=fail; b=I6V6KuwtgYeY63GcdzTd+jCpSJtTipU8BPuqmZjpoDfyzZX/vhSA5esgFK9lJY8qwCBj7fdqOM8sSP4BKRiQ2bRE+1TcBvjBVWSKRMaPqTtN9gbfZqzPczCQSN/86pd9zwxsB4rbf+VDkPXp6i7r87VJDmxLXxTBoeOzNpZ1OiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727812503; c=relaxed/simple;
	bh=sPFTpkauYil3/nSgAJfc5dBUyzMshJYOb14GQY4xF0w=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DPtK6O85prgVu4mPSE2M133yjiaORSL+kl3d0dBtPX11+Ta5/HlMh3gz4UnWwPJmQtq4gPfz7M/wxpQ96xdCojHkvdHg10G5Z4Rixd8nyquRkJOQg3dk3lbXaiBVhaZqjm2MRCHcmf1MbEmBZCBhb8F9liXnNDYu/x5v3wG02l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mJCfoBR9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Xn3o5gDz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mJCfoBR9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Xn3o5gDz"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491Ig0Be021514
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 19:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=38GIOdfkA47ple
	u32Ur3jWBnF0gKATuLRdD+FeHlZok=; b=mJCfoBR9a5um/e/hJr+tWL0Jv56J8/
	HJV+cCv9hFFEkzgrxdjGbFcTPX/8lEVpS0FQEQrHTvEdPgmydV+NzCMrrUDrnMBb
	SUjsXSDQ0l2zhCeHYrSSi3T8pbCD5XUR0akwRKtXVVJw4DYrQWzW0+V3W2VuToj7
	Y9EWSnLiTp/m5FwODhsrsLXvFzokEh6YIhfqHm/pr4Fp9NUfA/Pptv74w/uKgz+D
	q1k3227xsEnGFrVROodgepXblUQnWCAf4hXfc+E1fumS6c7s2OPbYrpfR03VaivU
	AJpK00WjWF/Nkb2JAsMsB/rvovcM8eUDl+2P1Xz/Low+q2u/LcDQHzAA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x8d1f84g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 19:55:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 491Im4Zq040595
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 19:55:00 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x8880pq1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 19:55:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CI+ExJmG8/jmTBTBqymsfJGkQIGsEfyHAxshfwlcbJR5BfqLGjOi9E0LOTUfiJPaYzcb4GNFJj3jiX048ifZ6pTWGYpMgHG+Bw5JiRoxFVrygm5enWkx0lbACE9Wm14vbPaF5Wdn2pxBUFdYFGktMDDX8q1COgrisS0C7XFtZ0o5TFCSFhzVm3bDfRE4lUc9xlrYGPxRLjRkoTfB2xl36klVrI5Bppl42IZwAJaX1rJ7EdqFvgE9PG+qqn4dZzPRzHOAcQ6ODIJvpDchEcqK2oIo9pwXP1NPUwDNofyby7l3z/pXIG3CDjT3siF5Wr/tsJ4HcR/tHgZpIk3vqi49bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38GIOdfkA47pleu32Ur3jWBnF0gKATuLRdD+FeHlZok=;
 b=Uc/5JWeQnO+sG914HQwpEPsJYUeaCEadBZRpck/29zeykwnt4frqZ3IX71tLEGIexmtMlILGYDF8O22b3rPSyo84+dutUXxgLzpIDlpVx4hkOZWk8slyofvmJiUv78fJErqp2iTmiJjX1HAAZu1CWtIAkDO569Rphf5Y+q7olG108tn41dZi1UAOunTB8n1Fjd+c2M1miAYb37P6BD/TDoa75/T4OiqXn4Fmj8ESl0t+dqwt4OPpGbT3hJcvfdlA5nimTTqQHp8d6SOaOHsM7tUjbBsQtvh2joKpgKG9P8HKQYdiGgPe5/5tZaRWQlvYa+8vtZGm9XyCTarvZs5pXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38GIOdfkA47pleu32Ur3jWBnF0gKATuLRdD+FeHlZok=;
 b=Xn3o5gDzIcvdtlgePHksol2o3zYG4CbSgUZwmLSx6FzMCghtNw4tExw6CHkU4o4LPlVehWWR/WI/taZmrblzWz6HLPRQ/fDb9vWmvsW6VQKc3mCjmXIq4w8YGtGPMaC+6bM1np/X8cP7Tl3DbkhOcXn65zPJw851MbvagwqMstM=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by SA1PR10MB6495.namprd10.prod.outlook.com (2603:10b6:806:2b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 19:54:57 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.8026.013; Tue, 1 Oct 2024
 19:54:57 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 0/2 v6.12-rc1] CTF rework to work with modules.builtin.ranges
Date: Tue,  1 Oct 2024 20:54:50 +0100
Message-ID: <20241001195452.223321-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0561.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::10) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|SA1PR10MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: 47588a39-5dcd-4cab-739f-08dce252ed36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hxaQlwi6768PIiPOz4ofAsECUdHZKluMN6jpX0AT928/9apW/yj+W/iPiXuo?=
 =?us-ascii?Q?I1ZeWhLOxlCWYdbKHmx0ssEfTMFMxZhOpGqsn0u25qSBN/r84rb6MlVbekcw?=
 =?us-ascii?Q?4IQGRSGsK8aQdI1JL2ABnGwlwsZig2yw7o2LAeLribuMgQ7wnx2gwzgF3cXC?=
 =?us-ascii?Q?LeUrODqWsn/5wKQU5qv1WJe665GFviY7WEwizFkSbx/OdUU1lPTpo5fCAHcz?=
 =?us-ascii?Q?ZoHRZfLTFK7etZuoDwy7TJIKjFf4BJB3RBF38RRl9WFtuUmHKzzuQsHO1Lmd?=
 =?us-ascii?Q?nOqFASN28Fs01aZXI2mqrUzI2K8tp5VUBpRKMqZvojvaSvyzjrGSvC2wFUvP?=
 =?us-ascii?Q?/CsldBeB221avw9Nj1WyGez9OSIZBoD3MdlqKlH6N+e9M6QAzgVIWnej8NxE?=
 =?us-ascii?Q?mJR64Co21eEKjdQ+cVMmc7EC6fnSsYBCX+aiT6uq5JcyjBsXFOLPfzWpIW6M?=
 =?us-ascii?Q?h2278bLk4zx7oyGaFiuUyN6sgSZ1BXlAH0wFiPuWpm1xgECUPXBwH6btW34I?=
 =?us-ascii?Q?cZvpNVcvwnPgLKKx+gpGGbvbszI4MOYqkEvo56KiG5uPUf/WA6b1uqEiJAAW?=
 =?us-ascii?Q?8taPVKnVssEhjOEacEr7bfdeD+hlKwEzjEyU1WFF2ACGjNzqr+gxBtpYkQYR?=
 =?us-ascii?Q?D3HFK6IZSJ0v3l/R1y+X5EEi8PdcT/xjpAlErrEYH+9plVsGlmZxMnd2X3wA?=
 =?us-ascii?Q?z+LGBY+UoUSTD64mUE4H9EP+xbuecw1Y4GarPjIuk1cZYTXR0Sb9hQPl0CZl?=
 =?us-ascii?Q?z/cSyW7A95IyScujUvzxWJPHrrJ3ih8FtzcuWte+Kne/P4cVaiwI+L6+ZZkM?=
 =?us-ascii?Q?Q5iCf2vs7/gHT3tImwv/LHsC3oD39Z9arHZ+RDfAGJ2vHZ8wXoEzWz52xlsd?=
 =?us-ascii?Q?XBc9erRBY/UeajDO2CPzGlb1qfU3cBuMXASFt5oLYjPsN3m2yOdZrxQa78RV?=
 =?us-ascii?Q?jWgk9DCtxs+1fnCPkhwLlA7gJbN8njBk7IdxAgiTKynI/D4rtWYI1V0o+98/?=
 =?us-ascii?Q?v+CdVWEdU4+6QmSEnVWS8kA0DP1FBh6rmQ1Vtd+OuGpsOsCvRG5pjkDKp0iv?=
 =?us-ascii?Q?oWhKkPTLqqM7yFzDXztwmeGFnZ+Hq02jrMLbN1eUIBbfTVzx+6wrAyZg31XO?=
 =?us-ascii?Q?V9qBWmTJ6X0hkUspoMrRLSxD2Kfm++wxxOMileyU5pVT45TEzB4ZvwTKsibS?=
 =?us-ascii?Q?GpWvZL+VanNIEE1QXFfARVboAMQh4wOdD8DEoGh7MPdJvL2o6wwgLZop7iYt?=
 =?us-ascii?Q?KCX/rYhXNT6BGEfw6HVWJCx394e6NcixWZByQRaqPA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O32xCreesetb4+u2QOV9laR4BEaVxgqXyw9+i1WYxuWghx3hb7278QS1Dujc?=
 =?us-ascii?Q?HXSthCC9J+/DHMhUHOQJVJIi93fooSvkNuEJZtpTiAMUpGPJ0dDb+DQONUN5?=
 =?us-ascii?Q?N/Rs6zFuGnycy1X/KnTnT9cNse1jfmn5IcKLhlElchBKZwKzq+Fu40G5ceI6?=
 =?us-ascii?Q?ZEE/LjIMT2thozQ0jksbWPCBHtZO/d5GrO5pqKmAM82Q9tNtx6RFwDfo0HhZ?=
 =?us-ascii?Q?5bRWWhZtkudz/f+4SNVQE6Pl39SL1AW0QLRLivKZxjFjWOI5J1qKIueMy3cr?=
 =?us-ascii?Q?E8xY7SQux9WpLdvtnaR8/TOuwGND+QmlaGPHzrmycx6G/DIUruxCA4RalFke?=
 =?us-ascii?Q?rFY1zqeWs73JTaF24tx08RA3IuGCbEA+YvdgXryPYxxEkH2m9OLmqp5LnejX?=
 =?us-ascii?Q?2G2c5v/30l16EIAquzWDG5XfddIyjWz1J5/S94LeBlSre7PwIFll/TkwumxR?=
 =?us-ascii?Q?R+DyPC9C7FBYh2C5XxGCSXoSUVRF9HbazZrLWQmoiTvZiGnkcEYHlavm94/b?=
 =?us-ascii?Q?UrTmcIOsYllM56bka5FDw1GZhcM4nB7Z9uuhKGSdj0rMmeFlxR1SlqeR1o7F?=
 =?us-ascii?Q?BdmrhhsCp1r6OTd2UxYcet4YRo5b4wC+11tSm5OnlcqvbVAiw4h/YKJyuKog?=
 =?us-ascii?Q?ryGNwb6k2x+KwCdgPvjQsNT6QWv3j4aTgHgDvD9xMw3hRI2Ynqop02nuobZ4?=
 =?us-ascii?Q?E2M8jp6Ply5yQUig6OXOZ0jGZVET7fG4HAOFWDkkSrneaxJV8/EhBtNOnrHH?=
 =?us-ascii?Q?HIiSztiUt5TcEPJ7jCM2uh3SoBDnPybTL/7zSwNn2KrOcSwDeGfpXbqwkT3B?=
 =?us-ascii?Q?uhJ5T/Z697elIgYplKWI7ex74+wt0fSX6POlI7EHIQFFzWGgClUlbP6zXb8p?=
 =?us-ascii?Q?M1TXS5VoG1T9bl6tfx0iRlR7eGdQfTDu9yOk1o+GYNEE0E0FTkDS7TuYt2bn?=
 =?us-ascii?Q?6Y4yroWxuHTu7A5+JeINcms5FnkuS8KdfqFb8em0ZxcBF3mNn5xO3SVhdfci?=
 =?us-ascii?Q?jss26+VCfe5f9aPJMQm+hdVVDtHPzqWTYdJFkR0nYT+yfWTjiSr7kmNpk3TM?=
 =?us-ascii?Q?bx8C5Iue8E8tHtm5FDXvGzznM1LDVrSpzOpEau5MA6zg16GtjzTeuepM0Nvl?=
 =?us-ascii?Q?KgsN817lMdenS2vuAy+ba0tixXmOgnZ1L8EReaWKyhrNA7T+DoaSjo1BMA0u?=
 =?us-ascii?Q?J8kec8OsPs70Ih8UoSV9G+DcxwaCb473fNOziWbDbV09LzcFfLDCUt2jWVhM?=
 =?us-ascii?Q?8EHwV+Y17csQRCQkS5XJHUKzlvOG+2EGysGIP9NyJibdLin9qdkhx6humFn1?=
 =?us-ascii?Q?dNIlP+Eh/7eeMyt2FbzfnIZKNNHqZ08eSjT79CM21iyN/kUeP5v6oG6LMaEK?=
 =?us-ascii?Q?SLNS+BSxSruC4sJvcv/4vqmqhwzA9sqPHqcxCZ9zxxCx8fM1CE3M+w/QsYwH?=
 =?us-ascii?Q?K0FkBqpQ2PGN5kvMt5Fl/vo1ktE7G1Oiq2kIfpbWcFXm3iXRNCfMck995gFs?=
 =?us-ascii?Q?hj7bl6po/AIWzSUksEvrE3fovAys+XWxQUFqNfJlIdSTE2LYy17paA0WIHTa?=
 =?us-ascii?Q?a8hIV1D6XMlizVRZkmoR78SQKVhozQ2cyPoIDKSohJPLEJTwTmYl9n+Qeznu?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3Fgrtt7PafNWPI2D6KAg8INKCl0+g3exHqFuPK7VGsxZbrGEjmtY/K4K7iJP/2aDPtUlHr3PwxmDsSu9E78OEfwzBAEauNB+Rn9t2751Qzq597zHi9PZlxKlJ40WWR4XcjXOd5qm2BaE3Dr50ga0V9a3FGOk14tWfgDvHjbd0/Ga6cicYeugDL/nRMb/1hfGd1FmSur6XtlZbqiYo5WScLgsVc4kzyS5TU68TnNGYKHDZfioUTXgyDcIDsmNVTYk5vv5zB4cOkPXpHI9h+Qv8KH2cYzVT/vTs/l0/TqMGYYTtkd01oLv6qoajfwcAqpUdjhc3quTyh5r2rMm5PbO7PwkIbHNzxg29luRDlJWp8sKlHWZwtC8v8aUIFmJU3xrFdPsiT1hPgK/vcsyo+Zw+2AbsDXACP/N+5YvuXNgOHNWn+CEOxj3BfPd4pov4qqv93tFyDDu/gKVhVuM6dpFJJ6Mhw8PNyKJeb8H3s/yv/kMpkBH/dZKQelTg8fjhawONXWK1KmSw7DgRlTUWJD6m+ulSmgMaRedHZ2gm1Z/KgaqiRa5tgWXQH6DjqmUEFZycyH46wu5+nP85vTuEE/Wu1E9qTd6fBJkMUBhe6z+e8E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47588a39-5dcd-4cab-739f-08dce252ed36
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 19:54:57.7012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6u2MF2x6FN5l11HygZR1Xa0dv5J/0d1I6TmHw5XCniKKVXa8dtS7D62yjPshzGibjQi4QSxIcy0YyXqGJhEaSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6495
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_15,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=932
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2410010130
X-Proofpoint-ORIG-GUID: KrovD4GZuQ8GSwaA327DzP8ExDikr6gN
X-Proofpoint-GUID: KrovD4GZuQ8GSwaA327DzP8ExDikr6gN

This is the same as the non-v2 patch, only squashed back into the previous
commits.  I also squashed away the iterator, since it's now basically part
of the CTF stuff and unlikely to be used elsewhere: so this is now the
*entire* CTF series (modulo specfile adjustments that don't belong in a
vanilla tree). I fixed a couple of tiny .gitignore bugs in the process (one
unnecessary line, one stupid typo).

... perhaps I should move scripts/module_objnames.* into scripts/ctf?
WDYT?

Nick Alcock (2):
  ctf: generate CTF information for the kernel
  ctf: work around binutils bug in ctf_link_add_cu_mapping()

 .gitignore                        |   2 +
 Documentation/process/changes.rst |   3 +
 Makefile                          |   8 +-
 arch/arm/vdso/Makefile            |   4 +
 arch/arm64/kernel/vdso/Makefile   |   4 +
 arch/loongarch/vdso/Makefile      |   3 +-
 arch/mips/vdso/Makefile           |   3 +-
 arch/sparc/vdso/Makefile          |   2 +-
 arch/x86/entry/vdso/Makefile      |   2 +
 arch/x86/um/vdso/Makefile         |   2 +-
 include/asm-generic/vmlinux.lds.h |   1 +
 init/Kconfig                      |   6 +
 lib/Kconfig                       |  11 +
 scripts/.gitignore                |   1 +
 scripts/Makefile                  |   1 +
 scripts/Makefile.ctfa             |  92 +++++++
 scripts/Makefile.ctfa-toplevel    |  51 ++++
 scripts/Makefile.modfinal         |   7 +-
 scripts/Makefile.vmlinux_o        |  20 +-
 scripts/ctf-module-objnames.sh    |  35 +++
 scripts/ctf/.gitignore            |   1 +
 scripts/ctf/Makefile              |   5 +
 scripts/ctf/ctfarchive.c          | 393 ++++++++++++++++++++++++++++++
 scripts/ctf/module_objnames.c     |   2 +
 scripts/ctf/module_objnames.h     |   2 +
 scripts/mod/modpost.c             |   1 +
 scripts/module_objnames.c         | 160 ++++++++++++
 scripts/module_objnames.h         |  48 ++++
 scripts/package/kernel.spec       |   6 +
 scripts/package/mkspec            |   5 +
 scripts/remove-ctf-lds.awk        |  12 +
 31 files changed, 883 insertions(+), 10 deletions(-)
 create mode 100644 scripts/Makefile.ctfa
 create mode 100644 scripts/Makefile.ctfa-toplevel
 create mode 100755 scripts/ctf-module-objnames.sh
 create mode 100644 scripts/ctf/.gitignore
 create mode 100644 scripts/ctf/Makefile
 create mode 100644 scripts/ctf/ctfarchive.c
 create mode 100644 scripts/ctf/module_objnames.c
 create mode 100644 scripts/ctf/module_objnames.h
 create mode 100644 scripts/module_objnames.c
 create mode 100644 scripts/module_objnames.h
 create mode 100644 scripts/remove-ctf-lds.awk

-- 
2.46.0.278.g36e3a12567

