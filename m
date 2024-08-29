Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC7E3AC28
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908948; cv=fail; b=JU9XADWoq1LG4fDKc6/4Qg9aZc/ttndVtnsvJMtUmFGvSj4JobfJCXcqaovI+osg1RmLmusqeyDe4b4IAMoovT9lPaTFaxDhcAan/4CaPIHK+wP745qS98z1GxyhDEAU6q3o4gkqnU0ht4vdWxws7iRCZsP7hpG7MtXTEWcZuFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908948; c=relaxed/simple;
	bh=mv3nDinMkN6U/8+esG2CMydu8Hpm/VuoqYlBQyJx/CA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jla8VxSArQWBQ+pN5/cQilt7bgsl9a3QEtsuOx7UaBooeB5jvqR0IFgdSc1ZUrbtu4w2oB/hF80bcHUX6HK69egTRSp3PS//asxVkYuLixpswNC2zdrV1ZVbQpaFRay7I8zTj9RRCnD5p06DS529dA2mmHgYCtIK4XJFcM/CuI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SwSTE9Sf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=upU0zhvD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SwSTE9Sf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="upU0zhvD"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fwU9005853
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=bCZyqlPX9RSapx
	Mrlz5iSkYwOymxKadVmkb6jpGmllg=; b=SwSTE9SfeshWMY1BGKkVKy2JblUOev
	R8n4eJEbFP8y1yrUfnusvJxncpSalCpCvi12b4/cDrZ9Z+9sva6QISs/JMvO3k4i
	YpWA51lzh8UN+xYyL4sUyYl0Dq544ts6F5YJJk/nVSxxLdjuOTSOrpNQLDTNtYjE
	YIx4mZt4v34KsznvMSxmRKDvtHm5gsk0wlhdlfozp6GZWHwQHL6C9QkvQwO7Jv4O
	TiSct8QHOlleaPkRHTZ3HiO4pK9WqcKfUUD3PLrgd/VIBi0Dv6/o9epcHB2FeZdj
	ixSILipY4Ek7JTqADnNzxogeiBv8IHLVGtrV1VwsQKLYUf9Un1jIv8fw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu98f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T53pGR034817
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:24 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfhhv-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFcVutG3+2hqTDSy8QjO6Q/LBtCHlpxQe4X+zdWglSxYcKkM5BTZONwEYtfplwqce5utGYWdPnsMA9rIqsFwZg6zYueT1tqxrbClnq/7sdlpx2Xaq+eh1TKoXIqmpaU3gpuex6eK8VwJceXzqsL6rQfRZF77HHmPwSrLw+ELiycX27rleAY6o4iSLhCuCmYMD7rc+jn+i1CgCQ8HTBRxGQE48kbrZfwfFXtPgPB2SqRFQXw6HSMBSIjOkT09wEkX/S52hoOz9zl9QCLXkL0e/Kh1kl6IcEZjptrHmGp2JkBsZYnqJT3hl8ZFKWGLKycxBd2yK74SByJeHLIlJjhqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCZyqlPX9RSapxMrlz5iSkYwOymxKadVmkb6jpGmllg=;
 b=O8VLsyboN6uuQX5bhsrY1HCmByu9/2vyLtvInVTHWi8ov9UENBx3NZdDJHe8wzHU0k8TL/LTwYlA513Vzm+1SCNbUGS9aPhsEz++l4MsqU1KnRrHhtqy+lgiPaFl1CyfVfonY6qpco7iHaquC59OM2CxslUoRVsMF7PdassfeMTiAF/P67zZ+8ZzSoHdo+Nk19+QgG33F56gerIIXnI1AC6ML3xLcu9hgJHYa82AFDZw9Mnzsmt4QMx1z8Ao7mQKCcZnStZ0ghmTKYSP2PAGphuWaXDD7KDqoAR4ffBMfnkgr/MgtbSUlLAVeKAJXvfVRou5D2blp5jcGvf3WgDyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCZyqlPX9RSapxMrlz5iSkYwOymxKadVmkb6jpGmllg=;
 b=upU0zhvDIwyfJvZXA4Sn+2uES3WODLCTaWyvXG7WJAVSXVlPLQRNRZJvcs3S+9Tmz3lJoUdv8YFY/RwTna94WajTTb2fGtp1ClCgtVheRoFIiAM/MxokPgGpVzApqW6MN4jnzQ0PJgpvVHbwRvXqUryfDXneew9ucQ6VXzhUVdM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 02/22] test: Clean up tests still expecting obsolete "at DIF offset NN"
Date: Thu, 29 Aug 2024 01:21:59 -0400
Message-Id: <20240829052219.3234-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0371.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: b85e5aaa-0b62-479b-aa83-08dcc7ea8f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+c0L6+14lA14y8GM+6rKb6Z4DfPAazJD8kSbfrE+d1igAwMTqGZ6Lbi75WP3?=
 =?us-ascii?Q?FJlDD21wjyY1uBhnMo8QMtPcHSqZOB+5p7CFtUjaLMCs2iaNaW0XyyyoT8m5?=
 =?us-ascii?Q?LPQytSKvaFnd9VyedBmB2SUFxzaw/ubq2u0FGIAWwszJvsCpNnmHgegGEwYD?=
 =?us-ascii?Q?WLtKymEZDjh8CJwx4bg3IF9bCEgqa+ZpXTAKszA0zp0ydCzCzZT6Dl8O8ig6?=
 =?us-ascii?Q?/NfjzmKoUqAZPGbJpKHU7ogNAn6KT0rCEBn0P+UBPlDiRbLpf5h7J9EBje0E?=
 =?us-ascii?Q?eg68+SGZkHT7aTr9DJa9SdrpRIgIKGBwEIAlBv+AQFTI1jD2pKkS7DpYSZkp?=
 =?us-ascii?Q?113xovzbyltQ+PWl0PJidNNX6or5n1BiHnfj0jodczjc/8o2dAeM20Zjr5GV?=
 =?us-ascii?Q?mr1sQ0ZAuEFevQr3aYAqFY5M88tDd3Y1W8TdmEGitjI8ck4LSB9DpUjLPR9d?=
 =?us-ascii?Q?U4OGbXD7+ft+tJpAqk/v9sr/IevmmoAOA4C5crfr0eYChn7bAaG1UMqG0Azc?=
 =?us-ascii?Q?ljFLIykzzRMahlI/LP8yPBsNNa/2hS0+8+sxItdhfVP6D7PVaLo08+KLT/Bi?=
 =?us-ascii?Q?DeMJjeD6E0m+PoZmoYIAqw/nHPlpOUhAy/QAgDluwB8T24VzgDCr02qwcwNm?=
 =?us-ascii?Q?qcueTm4TfHCzbDNTh6LD0zGSTpHq79u8xdFP5To2NegSAknRuoejomK8AvYo?=
 =?us-ascii?Q?U+8/+qovN8wKraOA140poFMZf4QMACqyhakykI8SFVn6u2GXkP7r6byC7hm7?=
 =?us-ascii?Q?Z8vWu53MBPiM2PBBHETDSWXUfjWMtrGoA6/VgCq+FlGy2JaJk4DmnqNydA0q?=
 =?us-ascii?Q?aq+n651FBBTOdAkLzxVRmz4nzEFRS+GEnoYiqIfV+Gr6dQaHRaTzGGPuiuKa?=
 =?us-ascii?Q?jzjieQF6vGWxbknGrI5zrhjRKeP3z49jlWEtp0ojKShTYPAKZwCDIBfJbDJU?=
 =?us-ascii?Q?RAUB8fbekDWEnBRyBsXUxv52+4MNkz2oT9ejo2GHm4YESQgz/ApMFj2OQBZ6?=
 =?us-ascii?Q?Ns3gbmtUl7jkNt//ceqm6xOkUjkdmi0eT112ppBaaZd2wNmVpFSJUSNiintc?=
 =?us-ascii?Q?PUhBmqKWW6+7fP0Y+ngfEXEMePQukGS/Qp4EkYom2ex087DlCV5eKMSDkwZA?=
 =?us-ascii?Q?nx2Qs9zD7P4eP08EyNWZnRTLehYIcjYOLDrItdbPSvB+AmF5ZruMQW1Kn+Qf?=
 =?us-ascii?Q?QiN4TsKAJS8htNkfxVIspNtWykPv9xy1ral4lXsRGEp/ph75f4JXlB0u+5T5?=
 =?us-ascii?Q?CynQnF2Vl0CWhDIdXrc9VH9o2tYSdsanw2NFXGANZwwA2/VmQjnJyln6jPpb?=
 =?us-ascii?Q?wOY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z6kibOR8NUHIDlCLKUPlQKoJGdUHIVho87pM2K5UbzajClwgZxK/m8KTNg+Y?=
 =?us-ascii?Q?MK3WnLbPtLygxT3xelq6NxuT4nh8xwsWtqQof1NzqKEiXlwU/w5jiS9ibrPm?=
 =?us-ascii?Q?nGjhdDTcP5wGmvkeGwePNnTAHvYz+2WtfA+LLViiN2F8Imc5+SkVVMKGIO/9?=
 =?us-ascii?Q?nPcu54m1FqaSJfUF8VJayunpPF5gctuP6qZqR/X3Y0d4nmjTSa0qqTvyydf6?=
 =?us-ascii?Q?tfNPzRTZAscAq+bJLaITWLyQ2f2UtGj6jmzVUSZ/txPn2d4lf3nZrjg1BdYZ?=
 =?us-ascii?Q?MoQSwj0DoEc24EGE5RyGO7d/aEW2tpLeSl8M8bDAIIyREqdguFBzmGSQEYIy?=
 =?us-ascii?Q?9V1YBrwd25tU5eGKLW2dMtefRj9aTq8fzH1+v2TBBDIIppOb909gDFD3JGoO?=
 =?us-ascii?Q?A78RcD0vumTHAh+RmpBQKG4u9Yqbd+ItEtDu6MQrZxk6Shfch2eMF4VIGVEJ?=
 =?us-ascii?Q?PXs4D6jzYMO8p8gNM3CE/pAUaIJOA5RZFQuI4+RsG/5r4SK6iwF8so4rfYee?=
 =?us-ascii?Q?vDzYkT8rGaeSRkBfc3Fw5o1NsY/jZVxs6Ie49mFNXCR/aMm+bJ64jUIiFKEw?=
 =?us-ascii?Q?61wn62DgfeL3u/e5y7mPCNoC3EzOrXBal9UvZn0Mn4ImCndlz68rqD6DW2hO?=
 =?us-ascii?Q?/erorD53mjbEcvlUNMcGHDS7LJnEsTCKiAXyv8xyKeeC1ahIjudrTz7XWnXT?=
 =?us-ascii?Q?1YCstlr4LMIk53LiniUdMnFWxb+gvcsLi0Y/9b+68N3kNxT+TATlCDb61ceA?=
 =?us-ascii?Q?J9SYFh/YvuVHvz+rvhb8P7s/nZnwyvR1nawtuddO4ucUNwP6dKoISA9Rgnqg?=
 =?us-ascii?Q?rRUJY/N7fLSAtY4eFV4J9pA+uct2n9/zUyaxTzlXX/ztb5dG/ukM8mAZcRTp?=
 =?us-ascii?Q?jn8xhwf/MgPZ7mo1xCLb3O8le2sUwFxvlRbqQz7/PYej+nX2PZllQE+n26tL?=
 =?us-ascii?Q?nFFP3YGkPO1ColGGEXlWIIMjA1RFiWGCLX+C2RDDeLQ9CqiV3OHIG0bYD6eh?=
 =?us-ascii?Q?WzuW5QorBcsyaG59P9nGlk43SxpmOZ5sHOTabaR3othSB6OUZ8OQteE6hzo+?=
 =?us-ascii?Q?jS24a6i3LROluNW0PQm1UnheN9rawNZBxKyUxNqboEb0fnpjuKcKToDlysjc?=
 =?us-ascii?Q?9C4MRwYHi2tTqRWMzsGLG0KG+lslVYn9Esntkf8sMH8ifxDyoQm69Cx927Ej?=
 =?us-ascii?Q?USQNl/Ker1UfM/he5J5fJcFFyggYmHQbisDuVwS4oOARFxWsidrXbz4dFwfo?=
 =?us-ascii?Q?J4bjOpNWqF40miu5k5ZcJIdGpXg2MVauJj9oMIbGKuMbxqZSIi5IXFr/9VqK?=
 =?us-ascii?Q?eELePU5eI9QfiD8aaXC79FCH3kSv7JOIJvfuHCl1xXNF1Ph9JDyQl3D+XP+W?=
 =?us-ascii?Q?SlxsGKoV4jzOgdQyKPJXf1vTGGPK96KNSY26xXSOauSt/05mvPwoRKLAbjyB?=
 =?us-ascii?Q?lITarRRklGB7YjvybWQXRVocunKzqJDTzpGKs2w/n3y63XQwtWMyQFzW+MOa?=
 =?us-ascii?Q?owb/3qq3VVhZP2Sfi6wwRtUBihEHuYwDFwYQxPELr9daVLv5TuGI5IlOIlAI?=
 =?us-ascii?Q?rQfVpt3qGHr8nI1F0P9vUgQXRw72wKWO89JxWtfp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qQcMWhNMlCvM6gSHzu4Xo9z4M9MunpqsrydU4ClyADfiG4DooeZ5+vldMQs7C0juhqTxPSpCk+inANbPzUB83TX0Ra01stcMgiLeFG5ybkuvPwEuCcBaSeRAFg+4WEaTrlS42IP3Qtlv/bSa1xB9IHB6L46GSlmV++p8sBeSD66UXmSTuXNmlgXgEToLOTN6/+RN8LHJof7n4iVTgE/Vb+z5QUYziKOnMVp7vS6P8b/6erYyFtLeUBm1KuiZfe9Z/82BoLZDvZT0uM01s+Q4meCcq9bzQ32DLNpr/nRIyxSn36k5sK3/vnG5WtMYZKqqtMauwrrkFRtyeLRt9rQ5DaSRpXwg4y6qJr9CSnzAVylkx76UZBwQdWpD5UPvDMFRGU2EPNzDIwyEcycPtdxgEiwh02K2f5oNPaJidmDUPglQ1s3ZU0Z8QpcNuSSbk0sPyHtiHZWLZ+7rSifwR9145XBKD7C8BXCW9D1TtcmTdRuS9LCyaVmXv34f79wlUYQ4Ft/50y1/PmOF2J+IC5o1ShvCodWelVs6NGhmvEm897GBmUNcGU/PDJ5lnpywD9nDIs2T4PvrpvOdEXe+pZYNotm4qCruX00/i71eVt4/P4A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b85e5aaa-0b62-479b-aa83-08dcc7ea8f2d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:22.0257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsK1rPF8T7Ds0N1YDAafCkciVTw85N0CauR0RGWEck3zPMrG3Zjb0By7X90kRO3PHQDFFgYEwwE3MGxMoGFY4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: VD0FO0YO0ZTPlbCwxuRs0nGq89NApgbf
X-Proofpoint-GUID: VD0FO0YO0ZTPlbCwxuRs0nGq89NApgbf

From: Eugene Loh <eugene.loh@oracle.com>

Also, the numbering of EPIDs has changed.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/demo/dtrace/error.d                                | 1 -
 test/demo/dtrace/error.r                                | 2 +-
 test/unittest/assocs/tst.invalidref.r                   | 4 ++--
 test/unittest/drops/drp.DTRACEDROP_DBLERROR.r           | 2 +-
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.d             | 1 -
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r             | 4 ++--
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r     | 5 -----
 test/unittest/pointers/err.BadAlign.d                   | 1 -
 test/unittest/pointers/err.BadAlign.r                   | 2 +-
 test/unittest/pointers/err.InvalidAddress2.d            | 1 -
 test/unittest/pointers/err.InvalidAddress2.r            | 2 +-
 test/unittest/pointers/err.InvalidAddress3.r            | 2 +-
 test/unittest/pointers/err.InvalidAddress4.d            | 1 -
 test/unittest/pointers/err.InvalidAddress4.r            | 2 +-
 test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r | 4 ++--
 15 files changed, 12 insertions(+), 22 deletions(-)
 delete mode 100644 test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r

diff --git a/test/demo/dtrace/error.d b/test/demo/dtrace/error.d
index 5700dd33..d55fb090 100644
--- a/test/demo/dtrace/error.d
+++ b/test/demo/dtrace/error.d
@@ -5,7 +5,6 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@trigger: none */
 
 BEGIN
diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
index d894776b..d3904f47 100644
--- a/test/demo/dtrace/error.r
+++ b/test/demo/dtrace/error.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 16 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/assocs/tst.invalidref.r b/test/unittest/assocs/tst.invalidref.r
index b050e436..20f131b4 100644
--- a/test/unittest/assocs/tst.invalidref.r
+++ b/test/unittest/assocs/tst.invalidref.r
@@ -1,4 +1,4 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at DIF offset 64 at BPF pc NNN
-dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at DIF offset 64 at BPF pc NNN
+dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at BPF pc NNN
diff --git a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
index 14654676..9fa54dd9 100644
--- a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
+++ b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
@@ -4,4 +4,4 @@
 -- @@stderr --
 dtrace: script 'test/unittest/drops/drp.DTRACEDROP_DBLERROR.d' matched 3 probes
 dtrace: [DTRACEDROP_DBLERROR] 1 error in ERROR probe enabling
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 16 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
index bfc77bf5..c74762ae 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION:
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index 3e7caac4..1e4fdd64 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,5 +1,5 @@
-The arguments are 2 2 PC 1 64
+The arguments are 3 1 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r
deleted file mode 100644
index 3944c138..00000000
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r
+++ /dev/null
@@ -1,5 +0,0 @@
-The arguments are 2 2 4 1 0
-The value of arg4 = 0
-
--- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4
diff --git a/test/unittest/pointers/err.BadAlign.d b/test/unittest/pointers/err.BadAlign.d
index cd4138ae..e859dd75 100644
--- a/test/unittest/pointers/err.BadAlign.d
+++ b/test/unittest/pointers/err.BadAlign.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION: This test reproduces the alignment error.
diff --git a/test/unittest/pointers/err.BadAlign.r b/test/unittest/pointers/err.BadAlign.r
index 4328aac4..187543b6 100644
--- a/test/unittest/pointers/err.BadAlign.r
+++ b/test/unittest/pointers/err.BadAlign.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress2.d b/test/unittest/pointers/err.InvalidAddress2.d
index 682ad650..b22f08fb 100644
--- a/test/unittest/pointers/err.InvalidAddress2.d
+++ b/test/unittest/pointers/err.InvalidAddress2.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION: D pointers do not allow invalid pointer accesses.
diff --git a/test/unittest/pointers/err.InvalidAddress2.r b/test/unittest/pointers/err.InvalidAddress2.r
index d866eae1..187543b6 100644
--- a/test/unittest/pointers/err.InvalidAddress2.r
+++ b/test/unittest/pointers/err.InvalidAddress2.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #4 at DIF offset 8
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress3.r b/test/unittest/pointers/err.InvalidAddress3.r
index 069ee1de..187543b6 100644
--- a/test/unittest/pointers/err.InvalidAddress3.r
+++ b/test/unittest/pointers/err.InvalidAddress3.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 8
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress4.d b/test/unittest/pointers/err.InvalidAddress4.d
index 1e2b4f62..586cddf9 100644
--- a/test/unittest/pointers/err.InvalidAddress4.d
+++ b/test/unittest/pointers/err.InvalidAddress4.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION: Demonstrating valid memory access.
diff --git a/test/unittest/pointers/err.InvalidAddress4.r b/test/unittest/pointers/err.InvalidAddress4.r
index d866eae1..187543b6 100644
--- a/test/unittest/pointers/err.InvalidAddress4.r
+++ b/test/unittest/pointers/err.InvalidAddress4.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #4 at DIF offset 8
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
index be1f6d5b..b5435eef 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
@@ -1,6 +1,6 @@
-The arguments are 2 1 PC 1 24
+The arguments are 3 1 PC 1 24
 The value of arg4 should be 1
 The value of arg5 should be 24
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 28 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
-- 
2.43.5

