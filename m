Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D782C08D4
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 02:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761532064; cv=fail; b=kDtL5fGZDCdqaPVE8vvxWtklGV1GN+c3BHzZLsrHCyc3hrIx/GkPNy8kqJ/y9KTtAKmKuKlL+KecJTang6QjRwj/TQQZKIyQp3cXxb/De1VeaL/iqQJEt7lNalVvEpHHaLEFd79pEmMr6B4Ca7+6OT1qXpjTVyWrntGo/eOnaC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761532064; c=relaxed/simple;
	bh=rTYYjbE10TkoVfHBWv7bjPXqKDxX0+MhoXAybeZhMZs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=anQ0oa8EVzOUIcIFSH2ua+CY1Mu7Eh968bj586lKS+7g8TvGBAwD79z/LUAE0skT6OnfUllst8cnOy+bsdYScQCL7mA0jAvtNCD3QSVIW4CsIt4oTiuEOwmWCUSqavG2OUdbMVjVq76HeHiat0LQwbFTepJ0oBzm/5IziA2V8Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=banGEiNc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Jp59dYij; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="banGEiNc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Jp59dYij"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59QCrT5G004757
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 02:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=jQvMwQNc5be/XO4S5skLwL/WKOndKUnuBA34kVWFr1Y=; b=
	banGEiNc7zxsL0EIGXxynEUzp2pcOqYpDaVwzE/0DscRLgLYs7JkTKlvqvGLsOQi
	ty/L1rlGHAn+Wm+wMV1M/R1rMcai6wsR/nnOwQaHhlsfscVnhr1pZDP8smCtBgkk
	5R99rLN4wNyge+zRTdGcGPzC9mJ8uE703eQUeKWZAgjKFhDdFNsLSQGE74ajekQZ
	iU7UoVgLsOgLaviXnlTplhv+R2kM4SWnqd5q5+sTuDkscgWmvYJZEm+URHPAozMm
	5cI445zK2X46Rwt6dwio/usUFJzvP8dkJsXE+js4jc0BNLhJU3vnWv8BYwRBCTHl
	fZYsfNpA/woze+kQTZpRYQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a0q3s27u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 02:27:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59R1ETng016883
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 02:27:41 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011009.outbound.protection.outlook.com [40.107.208.9])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n067pt1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 02:27:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnS06KkLVoF/sOx06IjSgY5TVVUz+m5GfOi0/w0H2lIZ5ibiTJw59X88NYbTtC6MITblFEULLWesnyxAPbOu+UNWnG3CIWn+Gkk/ZU9hvc0ldC/own5F/0UarPmFEXswMm8P+5JSy7TvI9GYcEgGBQj/QKZyTVt0nLeEsKb9lSywjTx5v+uJZJeVCc8h1EqFXfCjkPIBiqwsqn3wFcsFPhuHlxownsHMilMgv1wqVOP20tR8CNUFM3bCBff8ETWsxM1+o1b4mqZsj/TBN07o+DU2hQP/O1L+XaqMcPef/c/2qe3zaEHqweT8PJybdi60xMvqVfUv8ebVVdSfbm8kXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQvMwQNc5be/XO4S5skLwL/WKOndKUnuBA34kVWFr1Y=;
 b=rMpRBFdQI4eZpFdKS0aPJuZ5ZZjDVDoV/X1w+RM4LbS19LfxODog9LiO1CbP3Y8qxDwbxCcguY5VE8hduUH9VXL5m7ykAYeDFOUByU4ziRmO6gH4f5EXzgsXbk1aZszZlJWGmLIjZKnnXy0KW/y7jiC0RDxMw5Bfgqmv76H19sooswMu3SfLaf2nfFfNjtvIN/FmwbEH0Bg7qSbRs9ZE0z7oDD6UjExP2AY15ce9O3sygot8Rxnqd0YCJqdab2BBozZyqQhMGEM3vxAj6CSNyPFm5BIodRDP+k9dJs5VZi+JXUzcAxJZiafkpHIzYgZUWI8+XOHcHUupiMNKMU44uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQvMwQNc5be/XO4S5skLwL/WKOndKUnuBA34kVWFr1Y=;
 b=Jp59dYij1btev/rudi+N51sRfibJwdBptJ0RaTuW5gALimW22kxn7Is43V3TZb4hTTe5knfuvyLlDI1syVI9HuF0h2BTIMWFlTwkMhbwW1/b8u66Fh8qq1zAy8ubfbkXEH3eZT1wFdH1jAeKCWt/8hRVVoVYhw2i8aUiuDvgsY4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7007.namprd10.prod.outlook.com (2603:10b6:510:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Mon, 27 Oct
 2025 02:27:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 02:27:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Bump up the version to 2.0.4
Date: Sun, 26 Oct 2025 22:27:37 -0400
Message-Id: <20251027022737.23921-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 88dfc57f-aa94-4789-cfff-08de1500661e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kgJpcak4nEo9SvnK6V4jyYtFQQat9DC0vzLT7nHGkn4xIgRmx3ex57eJBWpd?=
 =?us-ascii?Q?jt3n9BwMJP5Lh34YikShFcNmN3BaqCqwCtolNdOkKL9Nq4icf8XlfJH1agOj?=
 =?us-ascii?Q?D1RiIy2TfLagBXJ7UwzMOIHPDJx3CgUkkcghrTD8M/j11P6oaTYLl7H3U4BV?=
 =?us-ascii?Q?1la7hTMCjFq6TiOxqHTKa+yj83C53qmv21L1rKDMzRHCbnIqmNIOM25mCP4Q?=
 =?us-ascii?Q?nZ0I1p6bDg6lx21XqVBH3WwctfMsu34mWiAvVAQaCXyu4BK3k/VutAobcHNm?=
 =?us-ascii?Q?HpBC6PeqwomMHywrtpK19KZq7pK1P7scsBB91l4KGnsTlrVIbGbIoE6PSh/a?=
 =?us-ascii?Q?YI206bf8QbgnKlpF9aaBn5ZkTyVoamxCPtCZbY7zqdcFZ7NxOwfEyvE/p7mq?=
 =?us-ascii?Q?rLNmwyDgTGkFtLOIoIZCL07gsnBlDr6754C+EfIH02vDoUMOxvw1gLckN5Ra?=
 =?us-ascii?Q?FMgoUO1aaxlXVIuPeWSCBDrCPE3PREmydBmo1h2s8yKESvpttpdW/0jFWg09?=
 =?us-ascii?Q?eLkvOPoSQAayxlJbUVKFEEaa9+x486FX+Ddm9/+Y7Fiw7HMIARctS2vXmqhJ?=
 =?us-ascii?Q?WmDkCPbA9L/a4JZe6eimpJGECOEcxcw67K/c7O5klK03NzoGLL6ejoy28tOt?=
 =?us-ascii?Q?D2V7EpVpiS11G1AHxmU5nA+C70iJF1SOr1nURYXaw01sc21GA5cu8O6GVKD1?=
 =?us-ascii?Q?dwwEFDTZzQQ1IakP2p3bFQSv2dWDbe55E5XrZpraJEqOEPEwubG+6xGAWB0f?=
 =?us-ascii?Q?Qykld62t1cfG1e878NNQOHtv+Q87uhZIdunWWtZ7Nooey0HX2AaySuaznN1D?=
 =?us-ascii?Q?4hAQuxCbOO3pOOn0blRisIaDr+k28S3Ko6ZHZLjWN7pih2UbsaZw4mAgOzKU?=
 =?us-ascii?Q?eybgbFbHkiV6OWPjJK/b3lb9TfJshhoHUKu+wzWsiMyS+gsLS0O6p9K81F+P?=
 =?us-ascii?Q?IcOA0+ksp82kZ7I4zRTsjkha/MW35LOZqHaKVWvLH1RU/nuBs2dnNQKd+0At?=
 =?us-ascii?Q?1Uh/9OrJ3DumcqEGrA/V8bV1SH8XWXPI89CFzokozfuIQb8EBVBF4TT0E52y?=
 =?us-ascii?Q?SL+HoamRL786AZtZZG8LXVbBdgOgWNiIutogADZ+vnD8bGmckcVLpvW1E66X?=
 =?us-ascii?Q?ksUbqjmarB8TZ2jbNvSarBTJWAzAkJF0Zbop8yswYOlXKf/uclrIWyASMwPX?=
 =?us-ascii?Q?mz6Mpqgl43g5OMzT8MWEeQzVnesV4DxrzNmtCqoZSOiwni74VTPBEqEd1K4t?=
 =?us-ascii?Q?uX6bmMI4XvbV9efRbe7KzPAgDlUH/SSJZi5F0Iy0SoaG+pBZp3giohxixNie?=
 =?us-ascii?Q?WY1N6RSw053d4UbbnU+FyXfa6Kp7pvCd3WSMmCa+ll8dJz7T2z384ZDe1WPL?=
 =?us-ascii?Q?asz1+3cPhLwVLcJ8yYNfQqqGjpBJpAOegT66IHOJ33iUUz2hwJ7OhGkqxdjS?=
 =?us-ascii?Q?e8DfLhS3OAH6cxjwvWxhgejn1a7nRM7F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y8RPlYZl4tDrTtoAgdFk64Zb/Uuc6LnfPrO6JpS9e1kyiGOXg286klo3El9j?=
 =?us-ascii?Q?fy805NypJLWIRay1+4DeNaMlKABNzbHFSEDShLV+iyJ9Jv8vjATshzO0hh4S?=
 =?us-ascii?Q?C0xCFsSx9oXaaJsFyuueVL5TQYWIrxuYB3VHqRQo9lLPEiESfFFANI3x79/J?=
 =?us-ascii?Q?IPiFamnRMQmqHOOxTiFxDqEtZs//f7Cbs8djA+qMc0zhfuVhgGI946rtWnOT?=
 =?us-ascii?Q?si0eBkeBI0lPRT+pMnOlviFMst6nRzX67fwWfHgle4Xw/ExyzZGbQcsrkHx0?=
 =?us-ascii?Q?ITZjPknilNRuS7uvGxSagRNvH3jeID7CV/Ynh58x+HAPwZgHwvyDRAJOSnQM?=
 =?us-ascii?Q?i3bxqLP0yHpd2NKE4fC/J9QfRN0ImjUYb5FZfbjMPKojwvU0jq89muTaHXVY?=
 =?us-ascii?Q?CYEDPhxlznUhA9RZIHImr1IG3pWp+H0sRwlii7r5Ntj1o7NdZjB+pQHxILrB?=
 =?us-ascii?Q?1JAKYIiUn2G6ID5Y7BVJcsBwekN8wA/k4tO/bkDhzR5bIdXhOTrDk90bzN/Z?=
 =?us-ascii?Q?ZUU6Hh7pJwVcpH9xdCH7jk6jk9d3cQ8qdDrj89Ok2eOyxXpfXPb1d+/I3ypj?=
 =?us-ascii?Q?4e8dcEdGpOsf6bBrlcqqJLvrl/ZYJTk7tRVgOCGR1HaUacC/QRVMPG4Ozjmz?=
 =?us-ascii?Q?gNMj5yNiQouXk2NBEmZq3gkSl69A67z3g5xUAdyA9ADW5N64EMcEZQyZSJRG?=
 =?us-ascii?Q?S01f5cRWLhdoxaxtMlNcGxBm40EPhOEXTiiUoWqCol3WzHeqApD9T8Wivl/y?=
 =?us-ascii?Q?yd+0wsIFGUb5FckNGql6TX9BqWqcJYYv9WyBKS0Vw6vEJ5jKEO9Tcq1mmlQh?=
 =?us-ascii?Q?CMgMdoDBrHc6X6z85UasMqggM0cnXXu9lJ4BEkK8i+GYTrHc7gwq8f/SmCiZ?=
 =?us-ascii?Q?Pa5oh17G2lj9efpoSgfpwv8RooJswX2JSTFbwVNiJhKphm55HymPoONk4dHk?=
 =?us-ascii?Q?vtvQC4UTZuXmY6+EGBnYWPcj2hichDrfKvQ8+BmxlIaLeZucE6tskUvoRIob?=
 =?us-ascii?Q?B/WBgIIgzsk+bQ7Rjnysfj+kvEzBRKLZQwUC0u8f0iws8OWgY5ZGsfk1islN?=
 =?us-ascii?Q?ZfDSvRbpkQjAmCSP55AB32Z/YgYNsRamgbH5etk+GrvHF1bgJCRSXNsJfHKw?=
 =?us-ascii?Q?w/Ay4MFqFf5eYmlWSUky9Vobrj4eRfr4QRuMPEzHTCNwJpCWlcLGlttuLTQj?=
 =?us-ascii?Q?QwIFPjkfAYktU7qO2zVsQphQw59effGixW6O5wbu5IGOPwjMExwkYYmLsneq?=
 =?us-ascii?Q?DhRrnNkxbClKQooWDLctxsKFwLtbt/3Sa4x5o8fbd/COn+O+CYJ8uHdy1pQl?=
 =?us-ascii?Q?Q8B3lJVKim6h2z1p/KIxoejD5b8bUJbOdqrf128k2KF+AUu3mrzpFQAhTvsm?=
 =?us-ascii?Q?Ct/8hgzckiVoIr3HSc52ylRX4nnwwHhnj46x4lJrCxQVZA7b0yClmBjhncMZ?=
 =?us-ascii?Q?PJmU8ca2IvAle/6snfxLrbiI8xpdfjDeL5Mv4IVIzavLVVUUuz/P5GXAfMPn?=
 =?us-ascii?Q?O9prS/4Y5A3DtSGJ7H1s5zOoltT1lJXJXuTfVXXZLiPFdm17tDN3oj5KqhWO?=
 =?us-ascii?Q?UZV3n9Jw3Fpb/9nT7fqspQr9Zkn5fa25xLVCfWRA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o6OD+x/LZMNSnIgo5KsOSKRRYz1R9YuGXeKp/hcWryeOwYim8aSCxh2oG9YNvdOVwolutkJY1WgWFuMM6hIlKY1I34xyup8h73z+uy1x+hzVY6B8W+cFPuIfJuf92iQW0zYr2ly90fELTEMg2proLuUe7bbzz58Az+NKGirTujd9iYsbG37Nr+Qv8lxyhXq+2YDj+2GZ2T/8uXiPAHcTDaZwq/sKCpL2qi4jOIBa2cd6GGXG/P2sjuGQC46wIlgqzDLV1cxa58vgW/GxzPZG76ML3jXnHLMEPB1Qg0ogM/YZocvaJKCiLVDLMovMP0Qt+mXSeJP4p6omK/0MwxnUr9GnXfg7wxn5r5cnn419M4smlPU4oN38lgSk5JP5lmMp1rH+GFKBSr0GUlQANz23tHnER4CqPtcqcILbuUY0V1qnyZyfSIe3jhxXVYQKOkdCGJoyl/xM02pFueB6Tj2AfD4UUSsq/TGBHboT9XHti2hzJ2v+NR1bFbCbqmjgk0owkRadwlTKs3GvnWKWotlA1TwY7VsBjiaUq99RnQoOaVD89KH0Em4qyBz9ErwHx/2E8ADtBEB/UnPJc+WFpXWT6/gXKcgR1Hmvi+WX8QVZ5X0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88dfc57f-aa94-4789-cfff-08de1500661e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 02:27:39.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDlkY2IxOISJp4QSoz8pZMgXelHsQsTKL213GhenJgu97wrdGSsyDklIrIZp2vdPljFMjniV83uiv5d04eefzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7007
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510270021
X-Proofpoint-ORIG-GUID: Dr8Gn_kRzBJsR6cMB3L2sxlks5LpFT8R
X-Proofpoint-GUID: Dr8Gn_kRzBJsR6cMB3L2sxlks5LpFT8R
X-Authority-Analysis: v=2.4 cv=Q57fIo2a c=1 sm=1 tr=0 ts=68fed89d cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=5jOlqaeHYq1RB7g_uIEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAzMSBTYWx0ZWRfX0b35jimXwEJh
 RmeKLrvyXEwSEXqhBKzKDAcyY2VAEmqyKgp/Ca6ay8t7noMMQLBWNL1V9IEbgolHqqKruTzdzXa
 qjEef7ESOhoPO/WZTpvAd8Z5HE7SaEJjOd4/WZcXMq1YXH5kkDgSlDaRGmqmiCz+jGOGwVELKyG
 oy5RQS2EEMuTAYsQ2C6Q9Txt6A3O8wMd+0mKYHjfPAIIgAEIKYtiepRnlX5jP3Q1KJSqCKIqUET
 XQxRZi4BL3TWQ9SfSa3Wk583GSYKV87LhsTpnBbQl5fkdRmbU3dAoH/QD8AjR/sLq86JUdHDrTn
 vIsSjxi8F1nVPRBH+qh805hAomqW+P2853+tIYiAq3xtDJ6xfNPMjPCXUqhdRq5qd6NT/X2S3UJ
 mwrf4+2n9oAvMqYAdf0QVJGLD3Dg1A==

From: Eugene Loh <eugene.loh@oracle.com>

Note that test/unittest/preprocessor/tst.predefined.sh checks that the
__SUNW_D_VERSION preprocessor symbol is consistent with the "dtrace -vV"
message, and both of them simply use the last entry of versions.list and
therefore will be consistent for in-tree builds.

When RPM packages are built from the .spec file, however, _DT_VERSION,
used for the "dtrace -vV" "This is" message, comes from the .spec file.

Append a 2.0.4 entry to versions.list.

Remove the VERSION=%{version} from dtrace.spec build's make line, so
that the version of the implementation is defined by the source code
itself.  The version in the spec file should be only the version of the
packaging.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtrace.spec             | 3 +--
 libdtrace/versions.list | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index a4f3ed774..e94025472 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -131,8 +131,7 @@ it always tests the installed DTrace.
 %setup -q
 
 %build
-make -j $(getconf _NPROCESSORS_ONLN) VERSION=%{version} \
-	%{bpfc} %{maybe_use_fuse2}
+make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2}
 
 # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
 # and the testsuite requires debuginfo for proper operation.
diff --git a/libdtrace/versions.list b/libdtrace/versions.list
index 8986d2007..8d858f0bd 100644
--- a/libdtrace/versions.list
+++ b/libdtrace/versions.list
@@ -65,3 +65,4 @@
 2.0.1	D API 2.0.1 Linux (BPF)
 2.0.2	D API 2.0.2 Linux (BPF)
 2.0.3	D API 2.0.3 Linux (BPF)
+2.0.4	D API 2.0.4 Linux (BPF)
-- 
2.47.3

