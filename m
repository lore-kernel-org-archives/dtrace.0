Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9651D68F
	for <dtrace@lists.linux.dev>; Wed,  1 May 2024 05:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714540541; cv=fail; b=o/OWAsLEytyOLrNMO1vbugSQ4BQj1YFkNHmpO4xjslf3K28mU8w4n6QwV3TEXyBVXOY5l205KJLPQX1pWBD510FVt01g52lwen/PGXPvkvkFHGIT1rTng/K0HaVDedxHE8B/Qd240BEJxqRvRzV5vlpBG1Bt/mOv9c0F+b0zCVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714540541; c=relaxed/simple;
	bh=N/BO/QTc6GHMm1Io/Jk1WhdQs5zloFqtSd49TvTsPJc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=skb9XRqq4qF0+fcwCoAYchhJhQZ6f14CnIVWdAsKetnDAUKRuM+RBYa2GIvgJWird4oEkVgHBqoKauk0Df7Lr+2lsHZy+XdpeegvX1xmuCGgs62Pn5/QPXm6YvC+B7QjNLYN5sxoWF7GFyYiQ5VT2s8ChcklzwrDdsDsXbprklI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dO/DBCz6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dA9EPRct; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dO/DBCz6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dA9EPRct"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4412hwsx002940
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 05:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : content-type : message-id : mime-version; s=corp-2023-11-20;
 bh=7CT2hecqGU2KPe0X0QzpRd0fnGd5mNmCH/CkfjMFdvc=;
 b=dO/DBCz6dWZiFnzbwcz2jN2tapJ+IMEMo5SnIN6ioD9f+RRNbCAPbTiUhBse0/RrPEfb
 K3PaCs3B1xX8KfjcistfrnLzheWBjdt8+t+U7TNrpjw9hClnV5KRaXAIgWNgeWRTVOqF
 sHJnqfUj0z/gARO+w9+1E3rvoDz+7yJW84D9tTmmxpMnpSH6bNVWyYz8hBTMxM/qLnaB
 7Xwd6mWrvmaouT6RpjzjBo25Kq+cDdSpN+2fsn9YFg8pQtIB9V2jkimArEGfXnYnDLSw
 dzzHiTaHAOea2u6IzY5Y+uU6C/ZCBYOC3fjvio9nkdgrZbYrYM3uvmakvx8Lt8sz/Ciq fg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrryv6j79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 05:15:38 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44147HlB034635
	for <dtrace@lists.linux.dev>; Wed, 1 May 2024 05:15:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xu4c076cr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 May 2024 05:15:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRupt3eoSQJJTQGniz4RqptyczSsEsuywaWa7u1JRWXXtJkPOeQZz8MsQY2bese678AC0lFaTw/LxMhayJ1KK42SUOPnOaYR+IHetSq7c8pLdZjFvBND92+duDucsDLzyHZ87GwXN3qhKLyGneKCwGf72wMHJfxGCMtpjvSzmVmzlK+N2m6ADYI41Dk4/G6vCAozBIaJjv6A8e0g2z/lQc9nv/QGkr/3RNGRzRhOtfbnoOlMk28TF7kYWMyUdrnRXBPGOSfgWXv6XORYzrbQrjVK1Int1w1hq6qhULEvcC1BT0TBYpJ+Oz/tKtPuDK9VlSbHlIrXZBUWeJvcjduV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CT2hecqGU2KPe0X0QzpRd0fnGd5mNmCH/CkfjMFdvc=;
 b=Gu5pgasUfDbYXJM8xlGeDMoDdtOyJgM4ZMvnVCjPgoFtRMv/WTqM1VWjVTIhCizSiLUb4WFQBHirHbjHDUy/bQZAdweLtUgSjF202ImVX1P0KNZ/Tk7OOLGKXyjG6WrhTgN7YTL1TUzjNxmCkko4llWr5owg5ZEtx2T0FJ4V+lzns0wOjPs24r4ZfpC2DEspnrx1M7opfc03py3zk8XMzNxjtZydhr+QD+ZJJuW5wwx3wJM4eSigOYkPdttIs/8s6Gn9Dl5/W18NAhTRVMIFA/uTj84+Ul+gyekCVaebZWy24lyJv6erVKtXfEPPQX5JnTJl+GI7lT5zYyXJZD8KUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CT2hecqGU2KPe0X0QzpRd0fnGd5mNmCH/CkfjMFdvc=;
 b=dA9EPRctjerpwEKgWoEBOFd4Ire1Bdr+zV0sJ6Qkx3sGT3iMB0oFwA1gwWwTq6aMGSnuF9pcYY/mK84n2DRjuSXlQ2otMZIxNNn3/ZMpqmupOjT7aEkidnL+txim+DT4nAjRz8aGfhvcqt4OJDkN631uxr9KiR0MIz6o3hlU+V4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SN4PR10MB5656.namprd10.prod.outlook.com (2603:10b6:806:20f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 05:15:35 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7519.031; Wed, 1 May 2024
 05:15:34 +0000
Date: Wed, 01 May 2024 01:06:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: use better condidate probe
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0324.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::23) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB628768B5383620FC60775A35C2192@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SN4PR10MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: f6bb238a-70d1-4697-4521-08dc699dbaf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cm7RfH99oND4jBuDpPYJC6vLBgcCb5HotaZtrguNCTZqpeB3l6/rZ5AuCocm?=
 =?us-ascii?Q?JfezqiksviKvlALlFQDkn1kkmE391p86OpE1Ld1fYZG2K5+5D4olfBZ+RWsb?=
 =?us-ascii?Q?b1gCConYyIO4/tgZvQ/nDZPjrrZswnd7DIUgYFdMouf70sgRF9rQw00Tm9eD?=
 =?us-ascii?Q?RSaX1nBYSxB5QPt4p4McVofpvLwD4nq+QJxQ5fddztWr0gJBgXinT+NIuvS9?=
 =?us-ascii?Q?qIBhm93IpZF+Et3cqUFLhHinoFQZEDQjkuKGAHv+xMQfuqsE5jTrXCABXs9Z?=
 =?us-ascii?Q?bpsv68Mim+HrbXICzjnQnAyd0NjBDypXR4WgwyY1Rjg1EgLHznM01FsG5TmF?=
 =?us-ascii?Q?LwVfubd0USb2iI42ei1Wi3wz94YEML/LH37n47TsD29vV9h4JwIvlEnNg1/2?=
 =?us-ascii?Q?AwrAyzP3pcJ/najY2+eOVZKzlbWBu4jGBSfj+LHXuX6Rq71eeSZYxtvcx3fb?=
 =?us-ascii?Q?rWN31WRRERbRln9rlZ+yX3yFYwkWLE56pWhQGV6lNANJfnKcKiVI3DcLCr4G?=
 =?us-ascii?Q?cDR73GDhqmIiXoelmaAxZMIkBWDi1/FIF0NhHCTFN/8LNeJ7pwclGUb+kG4O?=
 =?us-ascii?Q?ef8p6tBhUIh4n8i/Eged5zu27TnEbOtuQLJCHAKGAFolYHihrDoxIVGHEExj?=
 =?us-ascii?Q?7Tvmxg/TVGfz8hWf21FSmNixyXo3gaqPICTWZ7CQ1b30SpvcunJSRNxvM5uX?=
 =?us-ascii?Q?FN7ARW1SnXG9ZRjzcP5i0d8mnzxJLwuelboEHlJW+fohspHtXTPzFiZMwNEj?=
 =?us-ascii?Q?+gg1ZP0RmfiZEUITFNn6n0fZTKxS6EIa+xK129nn+gexfElfsgxr+Ari1J9+?=
 =?us-ascii?Q?Ypp/SVr1D0AlnEuyoZEoYxqAH0pGKvJJPL5pMvIcsmAq5JCJhEZtSRL3ma5S?=
 =?us-ascii?Q?m72V3atJuqcZ4pasCtTrpRF7fhmAl/q2FUgK5pn57uZzfUMBZwq9mOrWcDn9?=
 =?us-ascii?Q?ICOlH8msDi1uxb+jECboanx/wpKr+79OaVSUq0OoG0Tgtdcj+taIk2oyxWpf?=
 =?us-ascii?Q?WTWHz+eSWvF6qm7472EM53VqbNJfxp+ZKQqyk9LX1cYPjH/J9dicV7ARaxAq?=
 =?us-ascii?Q?cPfK60+cpxr5FAR1wboMiv52YIRpmBRa9w5TNMLP2p9WzHxwpauKOnRng7ox?=
 =?us-ascii?Q?DXos7oCsEJ1JOp2cuYvEvLA5dKEZVNggyJ4EoNxXw4KmJQgRK4qSSMF7Qi6K?=
 =?us-ascii?Q?mPnycFSpAms4S24mVgbauMSRTRHOC2G4d7QSj55imIloAOUG2PPJEb9LisLW?=
 =?us-ascii?Q?8LckSX2oQjYHmgdTeKgkszOqIAagzKONdVh33B0dzg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XJn5+UVaJDQOT2A/aXsaHZ4dDOLK/WMCCiK4Hkd5yFLii7ek0mpVpcLX0A3t?=
 =?us-ascii?Q?LAslgzZiRtXq6ceex23Jh8XhaZ/QeTVs8JntNffJtrjwNJnZMuzqGCAGeqV5?=
 =?us-ascii?Q?uzWnVGYnU7eB7nA1BzNgemN1n8le3UrVJczKEnJvaJnlRMVnE6IOwbRy7pZ2?=
 =?us-ascii?Q?TT5E+gd5tDNnCsG1PB/whpR7fSHrrLWy4HSjrsQxC+xZYEjd+6KYd/ApEr7+?=
 =?us-ascii?Q?UA56Sqvm5bp2RgzZOYWMQHcuEs9KEcszx5ZI+dazaObdPuSNYv3Y2lOm4CWl?=
 =?us-ascii?Q?TFM2k2SjEGForY1WHKdtj7YaU3R7gKrQTY99WxVV95sPP7QDkyiv9CKTWffx?=
 =?us-ascii?Q?QXFN58l1AwXs1kg9iUSp48MCnK+X1V2W2eRhY4fv+tRKh9N8PdtA/acc6MPF?=
 =?us-ascii?Q?W0UU9Nt/W/2HsyC82Ua/KI3K3OHYzmAKX6sPgBV8Prm25TRxhsDZxJ65NHmc?=
 =?us-ascii?Q?GyJD2nqGo+GvJP/4JrBocqgCd4iIPIptfUravOdEkwAnoKlqg9AOIZKReyvD?=
 =?us-ascii?Q?dSyZUPRRyWkwsseg3tGFFg0QYSOjP9VFtE/EiI/RYKzi90okb4yI+fjNzhlC?=
 =?us-ascii?Q?JKmSLfNTTCYP5fJKW7lu+FL1kIHRqPB8ZGmw2Uteaxr5F1cql2I7QH3Frsxn?=
 =?us-ascii?Q?yH7Emtx4aMvAxkdJ7GBlCE0+oxVCq35tmVQaa/2e0rTGJ5+/6jVmq517OtKR?=
 =?us-ascii?Q?mQ3tugJ83tsLWMksV0Et0jn2aA4NzbOeuUC2kR8zz+1jF6VJ3WsTozOvWGrM?=
 =?us-ascii?Q?cuecPxTnN/ahE34SyAO2jiyUIo/3ijezpFPXDFED4uDkeoWUuEeuqJ88w0aS?=
 =?us-ascii?Q?XG28doqmhfxSO08Zcd3SbNda6YQnsX3rs6Lzt1lgjClxPLFiUWdiyEEclYhe?=
 =?us-ascii?Q?dn+ob/PcCaI3da8N7Rkd/VklElC7bV7/0+lZNnJBaVK0D0QcK5xRmlr4UPPW?=
 =?us-ascii?Q?rXD3KS63RCEERAtXePUzhSkjgZHwl3GIRuwLAzHX74wLQCU/CYzs/9EbCrb3?=
 =?us-ascii?Q?Lkh/5X4Jb04OuzBDTYavi88d2RsmXe3cJd1tlkg/GkrrRWz18aR2aOyMyUlF?=
 =?us-ascii?Q?b0mocyOA5alMSUBPEmy9qa4d9N8uaeGchAc3F7vCLzLbBe/mUDjs75rRQOtp?=
 =?us-ascii?Q?HRzC5szaKAHLPZz0b5SlGPw35NECNdnb+qe/uQFEvnNrqNBQqDD+h/h63suK?=
 =?us-ascii?Q?1BC99i3c463aoEP5F7Mcln2Of8tZMUyJ9JY1GMn/NkKOCSk50p3y+nefk8O6?=
 =?us-ascii?Q?OatF77/4/pQvXTEXcKXbVgKPS/iza/Ri2xfgYVxZ7jDhtghtjvqFqYA+oLVR?=
 =?us-ascii?Q?sERGd9teAV5ZN6HAVz7cHvWl66DnrMAWZOq0Ha+0VZTMZenn4uesEbgST4LJ?=
 =?us-ascii?Q?KPf87eNzkI3r2iIEK+jg6YdkjrUmEykpEEvLZr1YIkcS4+GFWUK5Yl3bl8PO?=
 =?us-ascii?Q?C9KBVYVF+4OF+qT21rUPqUBjllVExkiih0oUzrarjhL6zFk1RN59JevHvGQr?=
 =?us-ascii?Q?XY78v1yP05aWqk+eOLchEFn9zRsbQKRx8rGJx9b5iaoYRMcTQlop1RvAiRwk?=
 =?us-ascii?Q?vpk3F0wOP4Bh+JaptqL+A3I1yr07nN4+Ot4G3hrfh9F8ojRgCCWnxFP4eWIg?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iR0EZPnvjBFWJOGZab2C3ytHNcXXNvpOaUaUiVZ2hEbj2/ag0Eur0mK8MoffLLjCyRWR+wt+lLZfYAwdBd6kj8KPWfXKtFCtWE3+uBFev6DE12sf4WMdRho1M3RkyQjkzfmpQ9ad/kLKJsnkIKDQD6Oz48X5fY32UVJiaGaFEmIqgKlVw3cayZFeKUT0mXOtdSu40kCkW8r/rzNHXos+Vs8l416+5gkAgGZx3b7mtrO4GHzVzcoJRieqv+giskaOMd9Ks9gQVZZgaXq20gOVg6uP3pBHFslBsAdPbf9kO2VEQrfNwklypznJeNQMwbUy5zLHyBNLg+KmhJy5iccYw3DChKvHAJqBFY5sMEzHgugrfFrJiwPMCshrZ8iKx0p+PXqSsp0yT1Y/uY2Mpcz05NvhGlSGnrqI8HAfpfOdY/tImqG9U1f/I3U3OGSuiQsNt4h+ls+oVoOhoI2HK2LS3Yv9Eb6+v3iGrsFTKRud4ohiHRjOlnnGoFBoHQEOKk7Zo0WRmJaZJOI88rGLiXErDg6l71HycUBSOXPepvjiUemX65ICUHraqPCv3MZkbHJ3/ljEvB7+c5vkoTrGTv4dRhbK12yXjoLvqvpzoCIFuDw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bb238a-70d1-4697-4521-08dc699dbaf9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 05:15:34.9241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/A8z+PRP0a05dWXxngYMv4bFoVWuju88qcncRiVxZHpnyLg9g34IrdUl1oxX8dAWJeELky49KnR5OqRt9ZAYuCNw6E2snHz2JKe/Zvgj3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_04,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405010035
X-Proofpoint-GUID: CeCIwHsdoPV3IUVKTvma3P-8cf6OEMvP
X-Proofpoint-ORIG-GUID: CeCIwHsdoPV3IUVKTvma3P-8cf6OEMvP

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/aggs/tst.stack.d    | 17 ++++++++---------
 test/unittest/stack/tst.stack.d   |  2 +-
 test/unittest/stack/tst.stack.r.p | 12 ++++++------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/test/unittest/aggs/tst.stack.d b/test/unittest/aggs/tst.stack.d
index 6c3c530e..c270f5ac 100644
--- a/test/unittest/aggs/tst.stack.d
+++ b/test/unittest/aggs/tst.stack.d
@@ -1,19 +1,18 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@trigger: periodic_output */
 /* @@nosort */
 
 #pragma D option quiet
 
-fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ { func(caller); printf("\n"); }
-fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ {  mod(caller); printf("\n"); }
-fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ {  sym(caller); printf("\n"); }
-fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ { stack(5); }
-fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ { @['a', func(caller), mod(caller), sym(caller), stack(5), 4] = sum(  34); }
-fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ { @['a', func(caller), mod(caller), sym(caller), stack(5), 4] = sum(1200); }
-fbt:vmlinux:hrtimer_nanosleep:entry /pid == $target/ { exit(0); }
+fbt:vmlinux:schedule:entry { func(caller); printf("\n"); }
+fbt:vmlinux:schedule:entry {  mod(caller); printf("\n"); }
+fbt:vmlinux:schedule:entry {  sym(caller); printf("\n"); }
+fbt:vmlinux:schedule:entry { stack(5); }
+fbt:vmlinux:schedule:entry { @['a', func(caller), mod(caller), sym(caller), stack(5), 4] = sum(  34); }
+fbt:vmlinux:schedule:entry { @['a', func(caller), mod(caller), sym(caller), stack(5), 4] = sum(1200); }
+fbt:vmlinux:schedule:entry { exit(0); }
diff --git a/test/unittest/stack/tst.stack.d b/test/unittest/stack/tst.stack.d
index 05c2644b..10ee1270 100644
--- a/test/unittest/stack/tst.stack.d
+++ b/test/unittest/stack/tst.stack.d
@@ -18,7 +18,7 @@ BEGIN
 	system("echo write something > /dev/null");
 }
 
-fbt::ksys_write:entry
+fbt::schedule:entry
 {
 	stack(1);
 	stack(2);
diff --git a/test/unittest/stack/tst.stack.r.p b/test/unittest/stack/tst.stack.r.p
index 895f96f5..5ce889ac 100755
--- a/test/unittest/stack/tst.stack.r.p
+++ b/test/unittest/stack/tst.stack.r.p
@@ -1,17 +1,17 @@
 #!/usr/bin/gawk -f
 
-/ksys_write/ {
+/schedule/ {
     # check probe
-    if ( $1 != "ksys_write:entry" ) {
-        print "ERROR: expected fun:prb = ksys_write:entry";
+    if ( $1 != "schedule:entry" ) {
+        print "ERROR: expected fun:prb = schedule:entry";
         exit 1;
     }
 
     # check stack(1)
     getline;
-    if (index($1, "`ksys_write+0x") == 0 &&
-        match($1, "`ksys_write$") == 0) {
-        print "ERROR: expected leaf frame to be ksys_write";
+    if (index($1, "`schedule+0x") == 0 &&
+        match($1, "`schedule$") == 0) {
+        print "ERROR: expected leaf frame to be schedule";
         exit 1;
     }
     FRAME1 = $1;
-- 
2.39.3

