Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A899F190043
	for <dtrace@lists.linux.dev>; Wed,  3 Jul 2024 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720038829; cv=fail; b=GBkJJM3N386f12Ap3J4bv5lifzv63hfDDod+ObBVDrEiZolfPqdD9NbxsfoXGN7b+ZNyEq01U2K9JxqjKJX2SHN1Lnp47zNGMvNisicbFYfcgxmCD9xZH1TLFcPXCeoSrCA85Feab1t7LTiV5O45dQNnmctW2mvozaL4qSxpZJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720038829; c=relaxed/simple;
	bh=77Nz+2WJtUAXJF8JVgilm0lvGrwf4CEcczGULeGycAw=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=T+JgirzRfLNF61Og5cnBn0okQ44/0IYwQsCx+0E7ORYpSBWqqpA7mRlOUAF/2XmT1t/I26axPi6f9cb4FXohmaQM/gnnHbnqor4wYt+4voYsTqQODBVyM4pqujk683UwaTix29FfcjBFvhhocBnlrqHpvBe6BWNA4wEWAMp/658=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IL29O+nO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oyzVmEL2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IL29O+nO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oyzVmEL2"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463JfRHA011878
	for <dtrace@lists.linux.dev>; Wed, 3 Jul 2024 20:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=lA2y/i8K/r+NGmaJvrQkC2aSMHrRFGBaiM/GwhUzQKs=; b=
	IL29O+nOK/xQya2l4x7AewYung/Ja83rzSF5cncX5y/kzNdhcbhkVT2gLwT5wfnY
	Ep0ESI0H3wi0wAJeUhu0npgzCNKbwtXRwqFBTIZJZWSZLbNvPmqgEO8l8PIIziig
	gTSqJiKW0xNaYzVf5n8f/U6IoeBRHB/M1CC/ubEj6Xu9ct9t/KGNAfmWsZqCW29d
	4FoIBbpIWOImS8FVR2eKZCf4lJCKn+zBEBxnTJGej4PCVWRuL6TxDP6DYofeuP9n
	sfO4nonYiGh1dzoot6b4cBEoBVPbOhKSazQD9gUMIvbnTbhEjjJ3jxP48rR0pO08
	QqPmYrKo1olu3fmToG4TDA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40292310nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Jul 2024 20:33:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 463KVZPM023558
	for <dtrace@lists.linux.dev>; Wed, 3 Jul 2024 20:33:45 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 404n10kvpj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Jul 2024 20:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feUCWFlSQZ0SwoWIkYa+kFRaserqrYg2RfSEkt+f5BqGSiHWOiGs7mBLQMK/I6UPvLIDC/mnV2dMhzRdGuuAPFe1Fksh6I581UWqxFLXAamgrddWZz7Rwl8K/0CUiK5CfOJ2hKfRDMpS+8ncgFBORBg6gkfavDRvgMxwHD6bU/7oo6U4Hv59PpCGH8JRporbTcP7dXimICMpjBSKuvLgEekcdyMxKyagSnXEOxpRcKWHFVaMyq7+7iyA9556e6B38SNibWgEaLMJNboebjXK4Fb4rvO87zLe4CWQaFniznLL8PFqq2ROlzA4qyzpb4VYDWqYwTj6E2IaBAQKall2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA2y/i8K/r+NGmaJvrQkC2aSMHrRFGBaiM/GwhUzQKs=;
 b=NTc/UJw0IHYb8nNkaIINr0Hybiln/IozPwfLGAmvGAR6veI3/DjBz5viFtEV8Nyc80BH+Wd1z70cmmYFuaKxwj+OtcWuGxrt5eLhyR/o8KZlPJn8BTcwSp6WUnPq6P7l/ja7R31jdDZWMo36VGl/Y6kUjQZQGC+HvqImc23Klm4UEX/sqviQQf2gc21uzhmIZXgfP4pmQEqF3MHEY8xltbzBkli2rRZMJU3AWDuU1G3sVgBrpeGn+KswsrsMyLnocZd5aFmUB4zWO1uGJeRZHjKAFJq9ClYAWRjTtKhCcE16nTS0fQ8meJycX9mHhKPr22T2BJKVziK+lNeeGjd41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA2y/i8K/r+NGmaJvrQkC2aSMHrRFGBaiM/GwhUzQKs=;
 b=oyzVmEL28QMtvKVE7ZysYZ2rruhB6UbN/M0jRJjZn89GTuCuYO6XnJzFy41T4H/HdYzLOcYa6oeFh0iKxiNVIaHjfkyO3qulnVZaVvIv93WD2MUDuJlItSlrpWZjUUlUgd47fK2MbQ/0/+HyllQGr+QqDgsnGOi4/71blOvqGTM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4458.namprd10.prod.outlook.com (2603:10b6:806:f8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 20:33:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 20:33:43 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 31.5/38] test: Update tst.DTRACEFLT_BADADDR2.d
Date: Wed,  3 Jul 2024 16:33:38 -0400
Message-Id: <20240703203340.20808-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013E0B.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: 522c8d0f-a008-41cc-0157-08dc9b9f6e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WYnQ9qOWN3baNrNqW0scylk7Mzo6CGDiN3DCBcgOpC/UoCyU4EqoEgS+wvZR?=
 =?us-ascii?Q?j1AUes6NWU5V7k/d4a8RDG99VKkWxv79rri4UUOtARmBZkrkBofSzDox/zpo?=
 =?us-ascii?Q?GYJ3N7UIxHTngebnYyT2P9MztLb0cI9965AybU2BFy7ItrOnYlN5YFe1ak8T?=
 =?us-ascii?Q?hCWDXu2WCLlyWPKuo4l2zaX8lWcCDuVmS5uDuf6mKkFRy+HGylWjQ86T7E3a?=
 =?us-ascii?Q?HwX4hBSZEhVBYHCOSJl/G7ufMsZrpBsWqfHcvlH2jc1/xjn9BARv7gb/ap0u?=
 =?us-ascii?Q?X1MsAKVGhYC+SwrGBYtAsXEYg8ZzqFJ0wJK00Yn6sBRv1xtgCu1zRgx7bBt5?=
 =?us-ascii?Q?TJV6qxqZSZ9RtBmJof2qmbVwO4UKGTH0qCcYPLCL0tXG3RnRQ0gELebkqVNv?=
 =?us-ascii?Q?4V3HB1QPu0mcM2X35RN+yQBnxfGzr2w5tNXvikR4PeOUzQSK2qK8d5nixKyA?=
 =?us-ascii?Q?yqcZ6q0uCpKMwv4LsnI7On3206p8f558NC7RM3K3xl6l7ucl6PYZ9FRrVHDa?=
 =?us-ascii?Q?95rmfRKVJ7euF9S/94318k4KUP1qKfAjuTGHBoTJ6/B6a4Tqq809rS/jI7xt?=
 =?us-ascii?Q?Xzb+r08BUQIbB6BbJ2/LVe6okTVYWLNvBs6/cPoyVwHHY2rmO8kEeNDLz41R?=
 =?us-ascii?Q?3WNUCg718Z9hhDNDY9jaZBKUmDf/EhMyoRODNnXFGuw2P9PwLP1SxJC+Pt2M?=
 =?us-ascii?Q?ntoup/GNiBuutYReOcMtoXWqX0xQUqo1KgSv9Xld+4K5FH+uVsQB14E0rCYt?=
 =?us-ascii?Q?dDAcOSBxRxadJG1FQS/jpxf73hm5RwqtmQT70anVyX+ESvF+siVsibxvd+yA?=
 =?us-ascii?Q?KWDnVpSM5GNtqBXJJRPr2ji9wHgFtEJYhNBAD5XVSgZ4dZLplgAogeERYeHW?=
 =?us-ascii?Q?lxKPEmfoLCxNkqhylZr9A1Saf6oQeFdYv+AJ9/yfFFAKGjua0r2z9UbV+GR2?=
 =?us-ascii?Q?WIpNLz5XXTe5Gi67QB/ua9Rq8EneykrIluZJZbCpNrByi28FDQwchOFYYSeb?=
 =?us-ascii?Q?F1UfunaSdI2bYH2DwDBusPM8nPEjTkkJVKodrk2EiM1a5xi+D+SMBd8+jRKG?=
 =?us-ascii?Q?6hpo+82ClFJd9gO5G7rZ3r3RKvU6T2UnF+wmN3xXwjT9Kbi4xYG+1aagZK2a?=
 =?us-ascii?Q?nTDgK+MGpeqIu32cG1IYHjAAcYijHx5fe70GrGtCeJMape2CXPfHGUkDYkUL?=
 =?us-ascii?Q?Uogf2b8uKpdHY+5R7fl3MVGzvOb190MKmo+zKuut4hLDemuzmPHU1Pg+Kmm/?=
 =?us-ascii?Q?pTQcxQwFqzHym4VsDwO7SdQqgpxMgBp0aPmVmQXS5btWREsVadJt+hXciiB2?=
 =?us-ascii?Q?p51ZT+yd4En+DBE8EUpx+RYRb99KgQD/VmAV4J9tlPaAQ+EWpcQSHVXp/q69?=
 =?us-ascii?Q?y8jh1/I=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6d/p1QP2eiN0ktO8UysOLzBorTpxXKZMZTVG/hyw8YaWpBCSF2NhyMZk/m4N?=
 =?us-ascii?Q?i8YC0T4LU2jpRE0mvjbw1TBEMyDMLS9wZQV9+w0KXQXLiVP8mq7/Vgpo+7WW?=
 =?us-ascii?Q?r2iqIHeaeuBcaYW9IOomnLllrgEjwvyRAhoANXiMKYsDQ+K3igfknv46oY1w?=
 =?us-ascii?Q?i+uJySmwQsSGQvnRWQzpn7gMdImcdqEhV5tYOotJuZoySnhYO0Xj+y4mrt14?=
 =?us-ascii?Q?6AL5Kriov02/l6np75ajHw/YFOdHYSyCEqENexdrURomYVy5RA7i2uN+K2AB?=
 =?us-ascii?Q?/QkNQiv5yy0A152IR09l4hYcWya4x1X8EoD4ZovOu7L9wXLy8Cw5QGR/VH0/?=
 =?us-ascii?Q?53p3bDB1jU+0mL+cgBoOWwMlrxVhBmOar8/KXFY6hd27mOE2S42bqLxQgggI?=
 =?us-ascii?Q?LCA9b50jWWfQMnhQ2Of3ivIzEJeG2px4gt+WkK2qUYwaPRG8qCo169w0B9+o?=
 =?us-ascii?Q?1R9pUtu4a/maS/1xaRuOUP/usVL/5ZbuwR15UwS9KrJZRe4gh3vbS6u803Ia?=
 =?us-ascii?Q?5dZcBMyplRvrhV0haPdGwt6kdA4nl1Dhz4DkGwzpK6yVQPJ55MwxHUaRkS6I?=
 =?us-ascii?Q?ZbTUkDFp7ki18/vZZZU0tljOmx4QhaGpi1uiIOPfXQegneG2NzQ9TtatdNAm?=
 =?us-ascii?Q?KqNRRJrQT64Mm2byhyUqEShjT4qnRb5SoSTBMO3btHLSzUG2Ohup3RNc68fj?=
 =?us-ascii?Q?e4AxLvadIt6ZfBjEPljmNOzJjQ96BiFTcQSWlXvXSV81cdEAmXmSfxtI9QIJ?=
 =?us-ascii?Q?6mCsUz58w+Y8e3K8slIyyCqZ9CnO0EEvFtB3s9dbSLb8vie0BjXLMw5ZlXNP?=
 =?us-ascii?Q?1iprTirHEUjM3xnUKLfmSx5vl6buOxUiNN0DNT9xXYBTy+HTkMCN2pgTNLcL?=
 =?us-ascii?Q?/QAmNcdujAaRcZ74B7DHCyTZeiSt84ZSbeP/gxpVPneoP/QMkjpwy+zJEFiT?=
 =?us-ascii?Q?12whYyBW9JXiw0aSvAAHTQICO0XgxCj53AtBsUfgHNGS//TJcaBiszPbXPws?=
 =?us-ascii?Q?0Ddcts+adpAcCLcPo5/oiEhph240dv44nzt2ASUTsHOXhqEa/h8yyvptvk9a?=
 =?us-ascii?Q?tvFQ89jdtjxpLuVoA5eBx22yEJUB3iAWsOS4DplXW8xPnMWPXKQat/YZQt1k?=
 =?us-ascii?Q?3Xu7C5PQn+jGHODTvdphm7vYg4zFPCRwS1SAhQ5HBRlt68Mq3kGdtwZgNqV1?=
 =?us-ascii?Q?ANmkekKAWGTwFT4B0MM2y0Ue9NQL5LJP1tZfV8RJJm0/DcoVh9rDmGTrvQag?=
 =?us-ascii?Q?5LuxBhLxKbPXUQ9hj1NNNXlOG0bB3nS/KThqbCdhfcH6vntgSFCnX4DrbuPe?=
 =?us-ascii?Q?REqkYEkQYl9S1wdj02uakqM25BcfbuYdfwgQOPgBq0m7hbsWoynDlQufc3o3?=
 =?us-ascii?Q?i0iop442UWM8d+VPdTFASx/rnw2y+1r5I8tuKAEiwHJv42tNDPiT+YOCEgpv?=
 =?us-ascii?Q?GmVq4TCndBM2ae8VVx383Rm4beEHrUF+ROHx5KO+wxVx2CNOvzTk50BW2AHM?=
 =?us-ascii?Q?JvExL8awxSJaYurmsaAIA+txPmkv4ZgHOz+o6fUlGRpmSgSaNvjhpy+4DbN8?=
 =?us-ascii?Q?2jdYVC4IiKLF3nU/zNwVU9GNimSXxhdy4yUG14R7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rSvtSa3B7HRMdp4Po8GoS/hOzSLWyN2vecPRFW4BYruNYC7YnmjW74gc+d5YdGTtYkCJW3A8bo1tT8nS0Dr5Bsji+MbNZkakrkReZHnRaW5T5xoWgM+SVMbfGnbh9dwn/Tfi3f+GrU9UncPaT378AU+W3vMA6WMr8IpdgdrgrQqd1N5aHYGDOoQoBFwtYF3H2hG4LIToAv9sbydczn90/UeAGITqEjN/DEtA80E+MdStxoVqpH+oemkMZdZN3jt7zKNIjPTbVW2jz1GMi5nnzIbYd71SYFbKgxqfMDml6yb6oWtNpV5x24WxvhbTaJzROf6Bbm2eWkY8T7GRJDgsIi1vYkqOWs2VIOP/qzmd3DpGBqbkr1Rl/tnN8WuYG+EobHESR4mX8zGDGDN3DhWBCDVOrXaNqNJghtnBdClkGbfbsDUIDLo0UucLTXEj5t1S0nEMKlj0vw8yGO+gFPu6G2cWLJf/15RAavAVAwRz+JhlwuUyA7aFDq5i+cLp63y0+CDANcdSha9sc45gY/tjQo2lLmZI+Wk/O6Jq5u48Jol3oAedEcOonYLvcpHC3M8OKht6apGHUJiVzP+YKqhZcB44omuBQlHqLDKUEsbmh2w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 522c8d0f-a008-41cc-0157-08dc9b9f6e27
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 20:33:43.1222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rfyyhdieHg9ZncHD16B2NZdgT7oLxfi6fb6zLh8LI+pQSL8xvhIv/M5G2yQE/4HqhdzoYZAuwp1R8F41kK/OMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4458
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_15,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2407030152
X-Proofpoint-GUID: _Mjc-BunofLTig6XHQiE7AQFAyQU7nfv
X-Proofpoint-ORIG-GUID: _Mjc-BunofLTig6XHQiE7AQFAyQU7nfv

From: Eugene Loh <eugene.loh@oracle.com>

CHECK test after this patch and after the next one:
"Widen the EPID to include the PRID"

Remove the specific PC dependency in the test.
Update the results file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/error/tst.DTRACEFLT_BADADDR2.d | 12 +++---------
 test/unittest/error/tst.DTRACEFLT_BADADDR2.r |  4 ++--
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR2.d b/test/unittest/error/tst.DTRACEFLT_BADADDR2.d
index 23663f3c..a822e63a 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR2.d
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR2.d
@@ -1,26 +1,23 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION:
  *	To test DTRACEFLT_BADADDR error with non-NULL address
  *
  * SECTION: dtrace Provider
- *
  */
 
-
 #pragma D option quiet
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u %u %u\n",
+		arg1, arg2, arg4, arg5);
 	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
 	printf("The value of arg5 should be %u\n", 0x4000);
 	exit(0);
@@ -28,9 +25,6 @@ ERROR
 
 BEGIN
 {
-/*
-	x = (int *)64;
- */
 	x = (int *)0x4000;
 	y = *x;
 	trace(y);
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
index ada685d6..6c5fa119 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
@@ -1,6 +1,6 @@
-The arguments are 2 2 4 1 16384
+The arguments are 3 1 1 16384
 The value of arg4 should be 1
 The value of arg5 should be 16384
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
-- 
2.43.5

