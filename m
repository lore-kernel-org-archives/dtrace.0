Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738D2166F1A
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 16:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731600252; cv=fail; b=nbheIL1mJ1K/blq88XI342Ov2DYJbppU91NhWDcnh68ZTcqXatwgTspadMo4uLyKyiz2kiSNLwmhMrsoplR6WsTN3hprVVuhPMuPZ+q/KE9ijpT43tWRtOqeNUIQHvJpU4kFD/FGHtNUmPxHP7LFDCoNCdkQ07QkXNFPuS91uBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731600252; c=relaxed/simple;
	bh=CvAcGhJILWMNg2ms1lG3pIsu4H0snSd0StZXlKaz1QE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=llLQzwWFuPdB3ebKF7DHfQBfW8pkvYrgfy1LnwGFv354IV93YCAC8poShtQ6/JAwRUQT9iw03sfDSiuRsAUFMElEYLj2kCEbgm9w9AxP0+j1cAHUvaDo94EBCWYWIaCcM698nkMTsW+Ojmm0TDYeJMMX5aAc97XlTyBQkmJ4F2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=byi2COg2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bABGonws; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="byi2COg2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bABGonws"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AECpnEB015752
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 16:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=TeO9TGNXGMY1UYeq
	J4bgMn6LmY7dCskIDwMiKsvOvrU=; b=byi2COg2YP+6nXct0SA+D7THyQEsMFKv
	q+h9hOp5h5vr5lY4th0LkOoCErfU/LuB+kSTI71lBAcOa0Ha6nG850DQeGXjLUFC
	eaR7Sb4uKEw2JxwAXcNZgZmNtM9gzh4hExYTO6PIyuUpImro960x3Nx3CBYpnqr8
	gt88usOFULmdIUzGjFtYL//ueVWiL97KhxjSES+10niCoN5XrJm+ZnCmvdDHui7N
	JNXyfa+kHlsj3N6Hcw7pMLo4el8IM2cvpGdVA/7bNhp/vTUA4ECSAdeaB+aP7lRA
	06utvjv7nHoK1EB/ygpdgtocYmk/FftGiZ64cS5IVrZwX/Ug8FaRuA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0k29j3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 16:04:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEFSE8q036149
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 16:04:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6b0x0x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 16:04:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhVIT3xQ4xXjWpx75WdM48r6Oz+6l8QbbhBvC7oDESCVYi2SH8exjpnUN0ilakVlgB4LiW2a/Lk7r8afrnpJDh085W8GT6nPc/Vv+M9uTNG3tYidGFARMKtMqQ0dPQVQU4Eg3GRqB0Klp+7bl6+jzaDBWXFsKWBhTKyEORxB2zfK58JIZjobeDAQH9mjhF5rHVsyEG8q/huFEhr/A7IRa8eyCVPMLNBMZG0k13wvLVbiVKNIbiua1WP7EV3FBqIo1XdgQKEDcCIuGuap/hHNy8/0WBWegJoxTFMPYdzkt/Z3amnd0CEwpU8ez5Qz6H48v9EilJ0xOD6+6wmcicjDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeO9TGNXGMY1UYeqJ4bgMn6LmY7dCskIDwMiKsvOvrU=;
 b=vUvq8MKh11+TNQ4ssJhcFbbAE8MaygKmpYOxo98Yr/+L/wJslgdDaBGc9pTP25QHTQ5kQU8AzM0CnFBgMr25/c6sH4XNM4m2KyrDqPTqotVuRlTr6135muHS6HzmO3Uw+xIFM04Uq0EfDcjVfVSYfiBDkG1egCzvLvREwGkizgq4wdijlJLSNwicsgmyAo45lLcQbzTBt/v5i/VTYWbRWK51OV6AT/fuRJJ5XSN44NbIYjZDHm8p/QxqURXsglq9QkOXwGSurbX22IGSulKVCmRF5mPO/asB4MyoiQmfmUncPOSqcbqjuMMxhjrtE+ZxhmATYAEQTGdaZ/wKsDQ4wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeO9TGNXGMY1UYeqJ4bgMn6LmY7dCskIDwMiKsvOvrU=;
 b=bABGonwsaiqREhC6zHhhHO82sQO+ETmHe/BP8WAqPVeKjAoT8ibgogUpk61ilA5kXZtdOzyVLgg2MqA1JIgBNwsusViAI4QXBf0PBM/dBnqWaDXUqV/z7NWyTCFtHOY5WYaUyB2gs31ggjocjbutCmGcI0Z+S9VtqXO+M3v/cCM=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CYXPR10MB7974.namprd10.prod.outlook.com (2603:10b6:930:da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 16:04:02 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 16:04:02 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH] dtprobed: handle multiple providers in a single piece of DOF
Date: Thu, 14 Nov 2024 16:03:52 +0000
Message-ID: <20241114160352.47939-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::20) To CH0PR10MB5034.namprd10.prod.outlook.com
 (2603:10b6:610:c9::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CYXPR10MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: af6aedfc-80bc-43a8-6f07-08dd04c5f478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0P3/0/5vwKUCxzEi80f8AcyGgd+3wTKBe48zmScQrIw1w0Hd1Bbdy6Dhvvbk?=
 =?us-ascii?Q?orxhfAgbNUQRPmcIg7yQhQOZ30A3UaC4HaMDOMhdcZnpok7cJhUtzsspnRgz?=
 =?us-ascii?Q?3hfiBwdcCsLLODoqVXPiek1wjarDNj5SaM1+OVCsAqublgTp0V7giviAj3wr?=
 =?us-ascii?Q?eLytNPVuBOkxaH8PEGYB43RV98wD4aGC0HnY+2XxsXjkvgC1zDp1zlSPbr6v?=
 =?us-ascii?Q?1Ut5inZwJuqONII49DS3ma+az0psWC+kGHcIN6p7I2FsRB5GVEvmNQZCCER0?=
 =?us-ascii?Q?ZPD+5qoFxsa5qlpJK7G5SlgGhEeXGJjAHvsbA8npe43XG3gabbl+uoh/N82r?=
 =?us-ascii?Q?Oxqe3vcmJEDhmH84htoqMY2tM8V7ThEJFPLd4nXSlNuYSKg216Y5s5pPVvrp?=
 =?us-ascii?Q?pbYTngS+eIrQPsUg/9vOguQXOwkhNMHr6arIPAVXVUgxBSNZIv9sxR4Yj8nc?=
 =?us-ascii?Q?NrhXk2owKU0m089Qu4DQzimlGo5Car5/y3XOZ5CV+4hEyTBOQHCxkSRRZ7xw?=
 =?us-ascii?Q?MsLJetfivBwXeUac0LSxDdTIo/JAlwGTg5rkffdapD5oJd3age26PAbwcKgc?=
 =?us-ascii?Q?yb6tVx9zGitn3DNE5he7uWmToKeZ3VoHSHRvC/6Znd4G+HHtEdGLbMkrpXa+?=
 =?us-ascii?Q?Vvo6zNR9NVjoBV/aWSog3AARc+1rlomqumEbowPTyHgnxcD9zeMpngZXe9LH?=
 =?us-ascii?Q?wRO7V5TqfMtfMP28iq7GjHu/Yhy/6DZ5KNzOrq2Z42m4WJpJhFTNDmxgNu6F?=
 =?us-ascii?Q?LsvbZNbeM5SNw6lvB1cB7noSaBtUauSkwXCTgiF5Giuyv9KqwSg84EEYjBnJ?=
 =?us-ascii?Q?aNbM1Q0/SOkx/MezkrNiDLITo8JmnTO8/pv91Xx/t/n/T2NvHEMaTsuXwtGm?=
 =?us-ascii?Q?3wslXTULvWX/Fk4HAhR7QFjntlj9//RAFlypcsXUKCn8vbmkWVN4kEY6FNvF?=
 =?us-ascii?Q?yxpVSn50qJtCy4/LPTlxCrPvY+R4NxkTVgsjTs8sfJjGd8He0xIWZ3sUPhbP?=
 =?us-ascii?Q?l58vqYTOc+bIc5/LsKWszia06YqzbsjR/DyXVqWOsSwNS/lD2ejnhDAlQn2u?=
 =?us-ascii?Q?W3WTtzBN9YYb6ZuaPu0j0brr4Kk5xnnFM3d3+ufDu6WeYjGDfTj0Km/iYx3z?=
 =?us-ascii?Q?rRYl3j9NJANATvf2dkMz6UXKSy8GTh6kpA7RAy1dMMfwQjsBFK+hkStMnVer?=
 =?us-ascii?Q?TGdRGW+heUNmufKa7ct6Tvh+qAmVtj57CucK4j+MV3FYtU1bnQ9d12K6RNhc?=
 =?us-ascii?Q?K1s7VRFtSc+FGT5lffOR6NdvdjvKWzDgWszESK3ebAAP44GUIAP92uxmLhqs?=
 =?us-ascii?Q?54dIw/HgdOReRfbg45jl1Dn/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qkzPXaL74nto5kxmMZEWZUHGgcIP4Q8A9Clj/xnuxijw92QAzQKDbjuM1B7W?=
 =?us-ascii?Q?eB2S3iol6Wppx1QV2y/UI3BvBQDPS1uA9AmAzsKJ56KsuiRuZeN36bx5amtW?=
 =?us-ascii?Q?68LqGL+Dm4L1OgEVIZ/LqRGzGqVoojfz9NCDXs7RJNa1jhebRxJzh9ViIseK?=
 =?us-ascii?Q?Aj6lw0fYZfYthdAVWvom0xATfrXBF8T8ILZjjF+qmBolI6UTbD/tAykEGCmS?=
 =?us-ascii?Q?wWX7JZgROqWNJln0HJOzEDWxYysAEXXFlnzC+EIYj9sQZ7emQ6i+v3HL52Bk?=
 =?us-ascii?Q?rpsd7MfhWS2vTL0zNRZQ0qVuNBBNWrxlrVfEcl1K9E83Sjg6YeCRF5nOltjc?=
 =?us-ascii?Q?bJHj8BpDG3mPCu5X8A4qlJBBnDaM3+qKfHrSKfZhDwx9LCTBktaoCIoqVBur?=
 =?us-ascii?Q?pk9nC7CtHpUZRZrnYkIFCVkh0sPMp5SWKvCv3/impV9Md90GvDZ+YDrXWZI2?=
 =?us-ascii?Q?eTU13Hc37eMtipRl1kz12krU9nHgfudwbghjmp+sPcuKu5dGJz4rKvGLxq9w?=
 =?us-ascii?Q?ZZ3WuA14eXM50CLpEKDdpdO8/tldKOajJxbKShYw3sQnUTXpZaxrc47afwYf?=
 =?us-ascii?Q?f0+bUMApTRQDu0xQH44Ah/B0VECcwJy6P7yrOqAtzm1gQftuLulAUG+DDek7?=
 =?us-ascii?Q?qNQ3r/PwiTCR1jLaMA8CBMPr9SYOX+n7zSE49suT989LJoRNDRJ6YpbLY9rV?=
 =?us-ascii?Q?K26sVkB8FvQ85A613Y6wWYM5xUz+52tRxpZdMecR+AKpxT56/Myvl/JQzYaK?=
 =?us-ascii?Q?yZ4V2DYtpN+gUIbGfZG8hsvcHEi4q7KLIQApZNJ+atMJcIJoMli9Zbo5rOfA?=
 =?us-ascii?Q?eLgJU/PPTqNMAjbOEkKL5epHqGzVhDWJFQgtXWWL2QVdEgFnzHWfAeuFAkKD?=
 =?us-ascii?Q?AqqrdCwDEJbPA3nBLMR7xS+qI5GZJmVHihwSKcMinet8U3lL1IZHRSJlwRPd?=
 =?us-ascii?Q?2/rjDFQ6LnCxkltnQWM0GvbWxSMS5SwvXSa2ttOPTc7v6f6TnZVH9BHk4ppR?=
 =?us-ascii?Q?ll55kah13O5fmlAKsk6v/lKMPraPYCuADkCUguQqe1fQiFYb3vtfkc6MJzmm?=
 =?us-ascii?Q?l5FfzP7vEQD0kT1/P1bdk6NwFYJEXwPwc8wpqu6shHO/llHMJbhNPkPuIwJH?=
 =?us-ascii?Q?Y3ylzSd4qGX9vhYaWa11zYgzYwVGRgWl6ha9Y5ONZyTcs3lE95PnddThz1ny?=
 =?us-ascii?Q?l6qMh5PumnJRal/kongSkUEyzJY0LyAGGOXK0bWbCiOFUQzmIcoN5zCjEVxl?=
 =?us-ascii?Q?XTvb+dhlQAr+Enlz7XGB0tik9RTjSSv5F4mHPDkpKcO0vnGM8oA032atrk0I?=
 =?us-ascii?Q?kgJQQOW6w/8qDyj2tnIvpJYNDJ4WHAKtEySx1A1U0eMfIYi1kypV1rtiA2Vn?=
 =?us-ascii?Q?btQ1qICwypqjKLIbrRWeu5WvbY8Yw2phdEfP7ZUz4JuezwqqQhJcRS/huxXK?=
 =?us-ascii?Q?PLeyGJmL6xjsnLGJZArDFU/8UA09P5IJzWpsxbmchiFIvXzNKSvq7oOljGt8?=
 =?us-ascii?Q?oBjaOO2/hqGFZb7src1BcxSSVebc5EnolfBt1+3+3oGCVRCUyUvztpykDxeC?=
 =?us-ascii?Q?i0d+zlxBZZT0HTvFrZYI1e/+cFQ7zxObye+GqO1ELlOnEGCKZ/IkvwX5Er4a?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VfIZaDpD/vbiJjC3F+a3DEzqDk/Rhx52qKvkMHU6HNawTxASTu+6AgJyHIYIzBf8pclDYwDzLdmYsbwnYVeoIS8OAsbLhSxjpEkidhWZ/J/GY4PQfaZYB0kuiZJELKkhuQSV/5mcMN2Lq2g+ypkcXQv0NWaO49ziT+RIv1i109R1nLKCEIBXTvnQNMR30IPbJYambPmEHneNxP97a/yQbzO7zaytl+a4/vrD5L7p+vn+kafT5o5btNrxn0yvEq3irtt2eKtHymwvQ+5cDVKFQSbrpsw+IFfY3kl0eX4qCk9HG6WdIC69MXupb9123X2FnZPFpLPsM1cxbjLTzWcNGAIQ75qgify++bsMV6qka3BYzzUuy/E6ZewvLkBioT+vfkSZu6SvFbpc/pEFdgU9PSRb6KPtjqwk3WAdwJIAzCGEiQbkqAaJx3K4lfCfco+eYJCv47J5j1t55+Ie3L8FxmO02XASPqqahnvgWn494IGhCB4Bgsxz55426TIFTCldo7d9yunC142hqrlnPWe4dDDdyJSPUSuqB5o1vkd4gMHkBnUa5BY9hzWVUuvfgrgPOcRiCyQnneOjijk2ybvsyIfkeTGvNCsPD9V8KUyxAcs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af6aedfc-80bc-43a8-6f07-08dd04c5f478
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5034.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 16:04:02.2219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHdCW3LNQIafJpXVTjJqFk+44CT5/2Shrx/oysPAIIGDuShGOtvtt9Vq2R7runHPo/QiZnroTyrsTI8Rf4rgFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140125
X-Proofpoint-ORIG-GUID: T7BTigsLtrxTX2gnzPcx1lPSbifrdKQK
X-Proofpoint-GUID: T7BTigsLtrxTX2gnzPcx1lPSbifrdKQK

A given ELF object can of course contain as many providers as you like.  The
DOF stash format, DOF stash management code and DTrace itself are all set up
fine to handle DOF with multiple providers in: but, alas, the code that
reads the DOF from the parser child in response to an ioctl() assumes that
one provider is all it will ever see.

This is not ideal, but rejigging it introduces an interesting problem: when
do you *stop* reading providers from the parser stream?  Right now,
dof_parser.c loops over all of its providers and emits them until all are
done, then just stops: there is no indication of how many providers there
are or that this is the last provider or anything (though if there are none,
it does try to send an empty provider to avoid the caller blocking waiting
for a reply that will never come).

It's a bit annoying to try to figure out how many providers there are in
advance, so instead of that, take a route that's easier both to emit and
parse, drop the empty provider stuff, and simply add a DIT_EOF record which
indicates "no more providers expected", which is always sent last.  (We
stuff this in before DIT_ARGS_* in the enum because it makes more conceptual
sense right after DIT_ERR, and DIT_ARGS_* hasn't released anywhere yet.)

With that in place it's a simple matter to loop adding parsed DOF to the
stash's accumulator until we hit an EOF record.  Memory management is
complicated a little, because a single parsed buffer (reply from dof_parser)
is now owned by multiple accumulator records in the stash: but every one of
those is terminated by a DIT_EOF, which appears nowhere else, so we can just
not free a parsed buffer unless it's of type DIT_EOF.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dof_stash.c                        | 12 +++-
 dtprobed/dtprobed.c                         | 63 ++++++++++++++-------
 libcommon/dof_parser.c                      | 23 +++-----
 libcommon/dof_parser.h                      |  8 ++-
 test/triggers/Build                         |  6 +-
 test/triggers/usdt-tst-multiprovider-prov.d | 12 ++++
 test/triggers/usdt-tst-multiprovider.c      | 22 +++++++
 test/unittest/usdt/tst.multiprovider.r      |  3 +
 test/unittest/usdt/tst.multiprovider.r.p    |  2 +
 test/unittest/usdt/tst.multiprovider.sh     | 15 +++++
 10 files changed, 124 insertions(+), 42 deletions(-)
 create mode 100644 test/triggers/usdt-tst-multiprovider-prov.d
 create mode 100644 test/triggers/usdt-tst-multiprovider.c
 create mode 100644 test/unittest/usdt/tst.multiprovider.r
 create mode 100755 test/unittest/usdt/tst.multiprovider.r.p
 create mode 100755 test/unittest/usdt/tst.multiprovider.sh

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 82fdd3174759d..296987ad41e93 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -360,7 +360,13 @@ dof_stash_free(dt_list_t *accum)
 	for (accump = dt_list_next(accum); accump != NULL;
 	     accump = dt_list_next(accump)) {
 		dt_list_delete(accum, accump);
-		free(accump->parsed);
+
+		/*
+		 * All parsed memory regions are terminated by an EOF, so once
+		 * we encounter the EOF, this region can safely be freed.
+		 */
+		if (accump->parsed->type == DIT_EOF)
+			free(accump->parsed);
 		free(last_accump);
 		last_accump = accump;
 	}
@@ -656,6 +662,10 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			fuse_log(FUSE_LOG_ERR, "dtprobed: parser error: %s\n",
 				 accump->parsed->err.err);
 			goto err_provider_close;
+		/* EOF: nothing to do.  No need to record this parser-stream
+		 * implementation detail into the parsed representation.  */
+		case DIT_EOF:
+			break;
 
 		default:
 			/*
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 2ca39b26f88a9..86865eb467b67 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -772,41 +772,60 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 			dof_parser_tidy(1);
 			continue;
 		}
-		if (provider->type != DIT_PROVIDER)
+		if (provider->type != DIT_PROVIDER && provider->type != DIT_EOF)
 			goto err;
 		break;
 	} while (!provider);
 
-	if (dof_stash_push_parsed(&accum, provider) < 0)
-		goto oom;
-
-	for (i = 0; i < provider->provider.nprobes; i++) {
-		dof_parsed_t *probe = dof_read(pid, in);
-		size_t j;
-
-		errmsg = "no probes in this provider, or parse state corrupt";
-		if (!probe || probe->type != DIT_PROBE)
-			goto err;
-
-		if (dof_stash_push_parsed(&accum, probe) < 0)
+	while (provider->type != DIT_EOF) {
+		if (dof_stash_push_parsed(&accum, provider) < 0)
 			goto oom;
 
-		j = 0;
-		do {
-			dof_parsed_t *tp = dof_read(pid, in);
+		fuse_log(FUSE_LOG_DEBUG, "Parser read: provider %s, %i probes\n",
+			 provider->provider.name, provider->provider.nprobes);
 
-			errmsg = "no tracepoints in a probe, or parse state corrupt";
-			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
+		for (i = 0; i < provider->provider.nprobes; i++) {
+			dof_parsed_t *probe = dof_read(pid, in);
+			size_t j;
+
+			errmsg = "no probes in this provider, or parse state corrupt";
+			if (!probe || probe->type != DIT_PROBE)
 				goto err;
 
-			if (dof_stash_push_parsed(&accum, tp) < 0)
+			if (dof_stash_push_parsed(&accum, probe) < 0)
 				goto oom;
 
-			if (tp->type == DIT_TRACEPOINT)
-				j++;
-		} while (j < probe->probe.ntp);
+			j = 0;
+			do {
+				dof_parsed_t *tp = dof_read(pid, in);
+
+				errmsg = "no tracepoints in a probe, or parse state corrupt";
+				if (!tp || tp->type == DIT_PROVIDER ||
+				    tp->type == DIT_PROBE || tp->type == DIT_EOF)
+					goto err;
+
+				fuse_log(FUSE_LOG_DEBUG, "Parser read: adding %s:%s to stash\n",
+					 provider->provider.name, probe->probe.name);
+
+				if (dof_stash_push_parsed(&accum, tp) < 0)
+					goto oom;
+
+				if (tp->type == DIT_TRACEPOINT)
+					j++;
+			} while (j < probe->probe.ntp);
+		}
+
+		errmsg = "subsequent provider read failed, or stream not properly terminated";
+		provider = dof_read(pid, in);
+		if (!provider)
+			goto err;
 	}
 
+	/* Push the EOF on.  */
+
+	if (dof_stash_push_parsed(&accum, provider) < 0)
+		goto oom;
+
 	if (!reparsing)
 		if ((gen = dof_stash_add(pid, dev, inum, exec_dev, exec_inum, dh,
 					 in_buf, in_bufsz)) < 0)
diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index 1792a8bfcc849..ae5abe5220929 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -1145,7 +1145,7 @@ dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
 {
 	int			i, rv;
 	uintptr_t		daddr = (uintptr_t)dof;
-	int			count = 0;
+	dof_parsed_t		eof;
 
 	dt_dbg_dof("DOF 0x%p from helper {'%s', %p, %p}...\n",
 		   dof, dhp ? dhp->dofhp_mod : "<none>", dhp, dof);
@@ -1157,8 +1157,7 @@ dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
 	}
 
 	/*
-	 * Look for helper providers, validate their descriptions, and
-	 * parse them.
+	 * Look for providers, validate their descriptions, and parse them.
 	 */
 	if (dhp != NULL) {
 		dt_dbg_dof("  DOF 0x%p Validating and parsing providers...\n", dof);
@@ -1177,25 +1176,19 @@ dof_parse(int out, dof_helper_t *dhp, dof_hdr_t *dof)
 				dof_destroy(dhp, dof);
 				return;
 			}
-			count++;
 			emit_provider(out, dhp, dof, sec);
 		}
 	}
 
 	/*
-	 * If nothing was written, emit an empty result to wake up
-	 * the caller.
+	 * Always emit an EOF, to wake up the caller if nothing else, but also
+	 * to notify the caller that there are no more providers to read.
 	 */
-	if (count == 0) {
-		dof_parsed_t empty;
+	memset(&eof, 0, sizeof(dof_parsed_t));
 
-		memset(&empty, 0, sizeof(dof_parsed_t));
-
-		empty.size = offsetof(dof_parsed_t, provider.name);
-		empty.type = DIT_PROVIDER;
-		empty.provider.nprobes = 0;
-		dof_parser_write_one(out, &empty, empty.size);
-	}
+	eof.size = offsetof(dof_parsed_t, provider.nprobes);
+	eof.type = DIT_EOF;
+	dof_parser_write_one(out, &eof, eof.size);
 
 	dof_destroy(dhp, dof);
 }
diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
index 8f42d00551e3f..75aa3082161b7 100644
--- a/libcommon/dof_parser.h
+++ b/libcommon/dof_parser.h
@@ -24,6 +24,7 @@
  *     DIT_ARGS_XLAT (1, optional)
  *     DIT_ARGS_MAP (1, optional)
  *     DIT_TRACEPOINT (any number >= 1)
+ * DIT_EOF (no more providers, last record)
  *
  * The dof_parsed.provider.flags word indicates the presence of the
  * various optional args records in the following stream (you can rely on
@@ -37,9 +38,10 @@ typedef enum dof_parsed_info {
 	DIT_PROBE = 1,
 	DIT_TRACEPOINT = 2,
 	DIT_ERR = 3,
-	DIT_ARGS_NATIVE = 4,
-	DIT_ARGS_XLAT = 5,
-	DIT_ARGS_MAP = 6,
+	DIT_EOF = 4,
+	DIT_ARGS_NATIVE = 5,
+	DIT_ARGS_XLAT = 6,
+	DIT_ARGS_MAP = 7,
 } dof_parsed_info_t;
 
 /*
diff --git a/test/triggers/Build b/test/triggers/Build
index 107b3b4d1f2e8..c50c265ccec7d 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -13,7 +13,8 @@ EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie
     ustack-tst-spin ustack-tst-mtspin \
     visible-constructor visible-constructor-static visible-constructor-static-unstripped
 
-EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer usdt-tst-special
+EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer \
+    usdt-tst-multiprovider usdt-tst-special
 EXTERNAL_64BIT_TRIGGERS += $(EXTERNAL_64BIT_SDT_TRIGGERS)
 
 EXTERNAL_32BIT_TRIGGERS := visible-constructor-32
@@ -206,6 +207,9 @@ usdt-tst-forker_PROV := usdt-tst-forker-prov.d
 # usdt-tst-defer calls USDT probes based on dtrace -h
 usdt-tst-defer_PROV := usdt-tst-defer-prov.d
 
+# usdt-tst-multiprovider calls USDT probes based on dtrace -h
+usdt-tst-multiprovider_PROV := usdt-tst-multiprovider-prov.d
+
 # usdt-tst-special calls USDT probes based on dtrace -h
 usdt-tst-special_CFLAGS := -fno-inline -O2
 usdt-tst-special_PROV := usdt-tst-special-prov.d
diff --git a/test/triggers/usdt-tst-multiprovider-prov.d b/test/triggers/usdt-tst-multiprovider-prov.d
new file mode 100644
index 0000000000000..cfa8fab23233e
--- /dev/null
+++ b/test/triggers/usdt-tst-multiprovider-prov.d
@@ -0,0 +1,12 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@skip: provider declaration - not a test */
+
+provider prova { probe entrya(); };
+provider provb { probe entryb(); };
+provider provc { probe entryc(); };
diff --git a/test/triggers/usdt-tst-multiprovider.c b/test/triggers/usdt-tst-multiprovider.c
new file mode 100644
index 0000000000000..430c0cdd2cf4d
--- /dev/null
+++ b/test/triggers/usdt-tst-multiprovider.c
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * A trigger with multiple providers in it.
+ */
+#include <stdio.h>
+#include <unistd.h>
+#include "usdt-tst-multiprovider-prov.h"
+
+int main(int argc, char **argv)
+{
+	PROVA_ENTRYA();
+	PROVB_ENTRYB();
+	PROVC_ENTRYC();
+	usleep(5 * 1000 * 1000);
+	return 0;
+}
diff --git a/test/unittest/usdt/tst.multiprovider.r b/test/unittest/usdt/tst.multiprovider.r
new file mode 100644
index 0000000000000..b83f559a7e7ff
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider.r
@@ -0,0 +1,3 @@
+ID provaPID usdt-tst-multiprovider main entrya
+ID provbPID usdt-tst-multiprovider main entryb
+ID provcPID usdt-tst-multiprovider main entryc
diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
new file mode 100755
index 0000000000000..ae8493e3d5be4
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider.r.p
@@ -0,0 +1,2 @@
+#!/bin/sh
+grep -v '^ *ID' | sed 's,^[0-9]*,ID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprovider.sh b/test/unittest/usdt/tst.multiprovider.sh
new file mode 100755
index 0000000000000..d5b72c2be77ec
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider.sh
@@ -0,0 +1,15 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+
+exec $dtrace $dt_flags -l -P 'prov*' -c `pwd`/test/triggers/usdt-tst-multiprovider

base-commit: 68d14f30b5ffaaea405354a2edf44279127d209a
-- 
2.46.0.278.g36e3a12567

