Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CE41E49F
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 14:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749308134; cv=fail; b=Hj4YSzZDkkjQI/YRE0+Bfz84FYHwS40UDo+AfkBoFhmDKzo2/geQmeylze48VzTVnTho04eDI6EiB9xiGrVgIzBAaLyS1V6awimXg19DaTEmaFnWtJaz5ahT+KYZ175TM0kUSVHXp4nHQb1IPfGQn8k0MS4Eydyq4egEnVXiDM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749308134; c=relaxed/simple;
	bh=cKbA/TwUkRWpY/w3La3A3dxrKtdhb9Z9brMmLpIfP4s=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=gHx4VFLnt7uUcMDNj3UiYlmIuJIGhEFCZzj62UtcbawQuFNwcJyzMzXYWK+gi1Ehl8e6s2z6MhCit4NGO2TAZeiKyyeKyL8tV3WpLLFiu429jFHAAztJT6t8t4cmsEKPH7DcwGaFFm/T5+nwfWhgjDPV6B8bgsJCX0BWGBpRcWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L7dAcIyH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v+yokxqQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L7dAcIyH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v+yokxqQ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557EkKFJ022945
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 14:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=6n/ZpSsVM5pMc5HRzPpt8bPCdKGTAqfDEzRiEtXq6P0=; b=
	L7dAcIyHmLgxPU/siy6wMvEqvW73lmo2tMUMxSWfDpPAAreQ1f086QQKAmi2Wcz0
	WE9E/Nlm3JWrX7MXUrlkYC/eKJyFmHBH2r7+EgkgdQGlQ2S+6RztpJIop2S4NjYo
	hkzFC3inJ+PGWXAv6dPD1d9RfykRlGG6HYJZoyBvKIMcPDvTlqsRobLVSCSFsC0l
	YMrma/MDacjqf+DZQKRBP6CcaNa3EaVEVKgam/yx7kRt0D6FNsV4ZzIMcrBMemhT
	lVDNeCX1e20be3qTqkhkXZYONUmpkEuy5bIkKwf4BHy6xkC6pqGGHHkgkoQlkKuN
	bCceFa53WCWcAKL328f6yQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c74rass-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 14:55:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557CUMbV032159
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 14:55:29 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazon11013026.outbound.protection.outlook.com [52.101.44.26])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv62svg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 14:55:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ch3zUjCr/4voqeupCIJDc1dzXi2I9C8gRu6g553vYBjaLapwAk7xB2SO5M8wfDuJalvFw8H3fQkvKtZsefqXWZEA3iL/IinjPsTJcihVILMf1Vf6fltp9rgdIeZyFzNLaLi5Yq2afQbr7IIwrUjALJA7Fh5dWxVRtonMcCuMQ8MEDGRVZkO/6QTGBuaDI73/X4ShTmqmVY+01PzCadufRkonoHstpjqRByp1hRrAaAOpA9It9u0V0uauDPBNj9R25FTekLUOwjJga3AhOKSimX4wmZZp088zSU7AAzOK0x98gZlRzd62z8r6/9dP/cIiFh3B103yR/50kpI63vINBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6n/ZpSsVM5pMc5HRzPpt8bPCdKGTAqfDEzRiEtXq6P0=;
 b=CL5IltGsGzeH+BBoF4Dtg/LljEbAPhSV18ibYG4YxVsxpIs9gBqVGcpHWv4FlTv48OJMTl313hms8BIrXVjhPYsjIhpPFxTb41/LtI3vmHggIVym3KV87BcrJHyvKsUsBtvenAXAcgggjsrq/zr+bog3jvLjnAFl0E0IbCyQH6wQUK/RLZy8QO4N2uTYdrXcWkrLqFUBUZeKhiJgOboz2ZFw93IsAoEcf284x8TQINj8BJ3GlZ8WxllfMc+9fkm+O7Cv0Ees0A26nh1zCoIjQjzk9CktoTEZsp/TelHgm7WqnRldR5fd0d44nGQ71R5kjgcj/CnLlmVCoUGR1pqtUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n/ZpSsVM5pMc5HRzPpt8bPCdKGTAqfDEzRiEtXq6P0=;
 b=v+yokxqQklQ7kIQKD3s+bSwGEdpe/VDJjNIyUVdu69vzi5SqVn8bqa5n6mq2zIRIVVFEfjEm/brZwaZ+KbaKfqObGt8z6pJKvn8tsJ3B5clBYu5yj1/F37bsFmiz597nLreC+gpS0zwievdg5PG39lz6QGGZJE7zK92Sr5XXzS4=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by CH3PR10MB7704.namprd10.prod.outlook.com
 (2603:10b6:610:1a9::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Sat, 7 Jun
 2025 14:55:21 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8813.024; Sat, 7 Jun 2025
 14:55:21 +0000
Date: Sat, 07 Jun 2025 10:55:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 14/17] usdt: implement tracing USDT probes specified in ELF
 notes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Message-ID:
 <SJ5PPF7F7BBD9946241291236BAE2283627C269A@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|CH3PR10MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 312ec924-fa9c-4f4d-c92c-08dda5d35388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N4YPxrWjGSYlQUkrQ0i0Z8YwLCPhwBqPWj0vuu63El8WXWcinM8diLlqVIKK?=
 =?us-ascii?Q?YJpLW8roJyWSTr1JPrAIOXwhCYgq2J75yP86fUmYLhI8lLnUOE/U5168ztsD?=
 =?us-ascii?Q?4f1f8aw35GbpRSjwryp5kk5/MW0MnN3u/V2o+GEzkKeYlpTWNT1/hnx7zmqH?=
 =?us-ascii?Q?g/OzY8DAeM/rv0IHTYfy7hADMyjt6A1L+yAeuHUGKVA09o/7TDTgxuz0Brs5?=
 =?us-ascii?Q?ixeS9xYW3lHQoSvpA2mSwsH6J3soivyu1o8gWey6hwTfnXCFIi7bQ8A9AGTV?=
 =?us-ascii?Q?EP5SnEFf2I6fUWj/J7rJNLqPRO4jXCucXWHCQ7/xOzVvQbbnRbCBISSPjN79?=
 =?us-ascii?Q?pB0iLzdx7sjFyThggQM7eYQyqC9REFsqATPLzINZ4V+LtDhXcc4rMZyCQtXC?=
 =?us-ascii?Q?KVwHmCO7FwbKSwH6s3pnlwIyXXRe9w+G+dnkGvrnNE8ZdR8ojhEkgAWpiF5h?=
 =?us-ascii?Q?BDPn6gkCstVWoW1yANLU8YRFDw08c9I8W4LLCJKvqEeGcLqfPnr53L8CtQvB?=
 =?us-ascii?Q?T8gV+WrauB3wT11wdx3XgHN2V7FElBSwSHLrdOzn49nB1ZTZWPKv0rCXk6KA?=
 =?us-ascii?Q?IEGl3RQrjOF2KkuHEBqfLonJilArfEyuRC92yF7dns0FDskcBUmYpG++PuGT?=
 =?us-ascii?Q?gePrarJrsRSojwCuCK19DRHCreX8+MdpHGqk+vgXFnDIFBBy0bjLSReis5qE?=
 =?us-ascii?Q?w/5DdPO5BpAe/OedM7MbjO5mEuz6uvbceHo/rrb6NRl5zZTXtl4zoIfOJZxx?=
 =?us-ascii?Q?raEfk5RxWzGnCYuWE/WJK2hO7oICq4y8bJBPOSkn6acnmDBSN4evyY/HFERy?=
 =?us-ascii?Q?Q4wv3HpoCzu3B5aig1Nxqpje1M42BIdJX80Otv/c335l+iDMIryc0KLYDEOx?=
 =?us-ascii?Q?L4ssSfy+BDhOLWG/GCow3exo4hRi6YLr/+mKp2yXNy/j1cg+/cK+UXYp0+SW?=
 =?us-ascii?Q?L1SNNqNT4kHw43YcrqpJZg/stDlMLQhoD+Y1sWE7qUa3MYXYMt2xDqaLtYFr?=
 =?us-ascii?Q?0FyXH0iwH+aN4COJWPasr+hNeTVZ0fgfHi66liDDlUrAea6sgaS8UvJ64PBs?=
 =?us-ascii?Q?99Hc/tV0zjhojxmOIAQ3anQ1JCEazLAvPTqm9FELAHrH6g+9B2qFxcVDsYAc?=
 =?us-ascii?Q?lhAmFABFb1y68eoaQrCdKkjhK99sdxfL/TGisKa9rkJ6lJFwYFQE6HMA2eBp?=
 =?us-ascii?Q?hZhgJCGCeNUB475AiDLXMysoORXGAT+xAhkwB8Z/yjIah5ZnhINP0HQ5x9Mb?=
 =?us-ascii?Q?cV3rulnEQ62h8+VunP7sHXi/OxCX8Xntb2p6JfpFEvVuUT5aKQ7ghYS63wlJ?=
 =?us-ascii?Q?tsxLsMTjmNKu7EbLunF9KGFmqxCCR4UGsGjxCZSs8aMzoK+aWHZw/l6HpaYP?=
 =?us-ascii?Q?a2ZLPz5UJAR7GBWMLnYnWiXS7B7c5yerwmgvflySxdJRYHw/abWuKekCTKnZ?=
 =?us-ascii?Q?rTfSXjINh+Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rNXxUb6SwzBB52ha+ICGz6ShKHYNoWN/cZQ60kJ0IseYl26DI5c3OHEtG9tQ?=
 =?us-ascii?Q?HILkjKyK/ioRo9Ibnh0iKl/EcTxLgaZIeKUsq4zc7t/nDrnAB6zqYZX7Zfud?=
 =?us-ascii?Q?xVyMeUg6R1Yo1NuUlEQxb6EC8Se6LdxLDBY9dYj6e/aLq//ihCD0jNhAcgKB?=
 =?us-ascii?Q?MTx5MYs6BMDxLyAQuMimHswUsXy4zR7mDtIaiI3LIjgRc2UV/s/cemLCml+U?=
 =?us-ascii?Q?zm3vuPBK2Gmor+TeO+3FfxLa4q1IIBE/UUudAnq/esEM06DZO+WUJSKiYvTx?=
 =?us-ascii?Q?82mBhW3VpBxmKSzLtCLsW5yFPN/ZSFCZSsy3VSnwIIf2DoSeAxNuJtFuqOmU?=
 =?us-ascii?Q?mLca5+JbQZloD9X0hGyZgirErsRDRJpHYE1/NCsKZowbEgXaK7J0ml3EvnBe?=
 =?us-ascii?Q?nbIrYp3rFSGz797s7olPa9WwArv5RUk29+VpvyKdEsniqfZ0Iax0C5fE2QQc?=
 =?us-ascii?Q?B6jdT+dyg87cPam7pAVQuKM5Blescu4zSdlon5GVpyiSZjmxLZRiPFDviFJB?=
 =?us-ascii?Q?8TkeqYXlod9Daju4FEFS4ge/yT8h5DVBbUQDCJYMkrE2PAL7iCX+wZVF6tW0?=
 =?us-ascii?Q?uhVZBMQm0RcVsRPFpK2wg0t5zBKGa1nn6zXlsJOK7aFjrgRDfFlvX8fdpkDp?=
 =?us-ascii?Q?03oPqKATffjlAFeiTClJVPxmb4CGv5M9mmz2PJ5f9N+tZsar4uDEnDdBN69W?=
 =?us-ascii?Q?27vjzizVZ0BZ23xu0FhjSd1/AKtGzA6IPaQBsgYZWSVWCddouMZjuSrRBizb?=
 =?us-ascii?Q?sDSnROy0tko2+og2QJo25fehpC8IVV9TbLt7Vdp/XOpWsuDmkWiBRD5rWOkz?=
 =?us-ascii?Q?qpgJPXSWWX8TPoUc2ihUCSUIsUsZzLgRhifSNMVGYLABXG4d6IVnXJILnvY+?=
 =?us-ascii?Q?DMg8uyYa1kYbZ61c3UxWF3aRlDN1DvakDTsNCQhg1TUSs2ixyPIJmpgoexvq?=
 =?us-ascii?Q?+iDa+ayXua8/Tn4WVISXTSegwvp8G4mTh86nfo/VHZVhlazq6cL0SQyfjr2K?=
 =?us-ascii?Q?PwPWZMXfc6zSMhB+aVQlHyQtnZMJv3YbqAK+3kpvNw/anv7L4CnAVTUhJqNl?=
 =?us-ascii?Q?zNVkGx1DLSGwHLyPvSoVJwlPsCQ945J9mvOrVW0U0YNqJw1XQ40IFhuQ/DFw?=
 =?us-ascii?Q?pOdmY/zj1GxzP5gVstZA4BnCAcHWgmX4iesO5jLOx4u9wWErEMESrz3xdG04?=
 =?us-ascii?Q?2LDGkPGq9nk388W6sHOeIg0GLB74Zo0nJCzVvC8iPTeiTuCD4a+9/a1q1Htm?=
 =?us-ascii?Q?GtIcgCva5EMrBdX3sUAV3U0l4npPM6bwQ62YvdhovScCb/P6bvWzueNNjTS1?=
 =?us-ascii?Q?oFxokbrqkrdu4VwjLTkn788pp9GbBsaAGOAvVjQjvDfzlp8mz3rrKGBOO+ZX?=
 =?us-ascii?Q?5mCilJS2J9QshyUN2AP3QK8lbfRUzzdx88K1CnYH+oFhWUZL6rFSxcjCOOZj?=
 =?us-ascii?Q?fyvgmoP8swvdaNUIRJvsPf3+vE7BdTK5iXcTOm1y83IRlQ4gjQzo3svUKST7?=
 =?us-ascii?Q?osZLz6Kc52//VZ4JKof80DC7D83TpDB+ra5OJepE3LBKqE1DkVwhFc2o2own?=
 =?us-ascii?Q?h/qC8amceAvLB5+EsMgsQ/6S+mu+9oiS22ncNI8VkbgojfOFwFk8E35JhM36?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q4r5MiwQGbnjyjg96ikczlsfMHLNLDkCySIKP7a0gLCPr5oC6iYbpS4MSY+Z1hW/HM1NlQYNkFKIs2ddeweoq/4CqwdteYm7WiQFe0+CMXlUbx8jjiHQoeU8kDLa91TwwAWgYTmaeTPQzC6ryLkKZx0Te/PPD8/TBY9LPY93EUw3TZbVHgM+bHkZpy9850IjQemrFOJdK+KxU662frU5BIJGUZ2S0sP0UAzJM/1HkOUBA/TGpcmvbg5PTzQZBi6UtGO0HReahUFQ22kEUyzXRtQH5FlozfFhdqb8fjHRcHDWBt+Ey61bXSheAclhG4ann7adpj3GQzeL+UGtup1QDrMFaUpAN4gcjtGZ/a0l8+uUCyMCLQNnVk9QzShJ7e0DX5hAn/ASp5sE9acGcNDTovIw7A6fY57vk12BU9HPOOp3yZ32Oqe2Zuf0Gr6aJrgNd2puE/p68c4Ttp2HZj5gbvJrhjkAkAZQmrFVKZaxCl0XSLni+ylOZ3XZ6TA7yTh9tFuMBa09atgYnfaePxbW+cNUtrMoRT5tXr+7jJ4gDzs/7IVCrLQNrmFS4VgJBJ+ZOKgJkHgu0Uvc+z2cax9Jc99GP9SW40kE5HkKAqSOKjY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 312ec924-fa9c-4f4d-c92c-08dda5d35388
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 14:55:21.7167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kozhgiQoWHcgGP1w6LmzqkaOfZl1y8GOUB4sj+PtRGfSxz8PtOuAuIR3jM2C48r162dP/q0nn8FNcdUhTOOfy0+GF6djWOzUivbJ1ap4th0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7704
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070107
X-Authority-Analysis: v=2.4 cv=LIpmQIW9 c=1 sm=1 tr=0 ts=684452e2 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=XU_hyVlRVydXu6IksfUA:9
X-Proofpoint-ORIG-GUID: AhFJ5DetRbVq-Ayheqh4wDP0o6H_UfUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNyBTYWx0ZWRfXyjcMwYS0ca3t rPx+SgX/8+GzlokiWfaM6mVWZQ4hC/DHUdBYSN8iOa6XxkZWkGLM/F1K8oCNJyK/f+sb0Ip4uJ1 N7SlcHAxfebP/N/duF2u3vgT2SAU7Fgu/8NIen6YBp97qcqV14PQqo9z96fjaRusBoa6Qu2C09Q
 +a5R1TWKfsbkXaJ1x3ntzMvKFvnCNE8nVZpLhACNGsvR5Z0LRSzxISOYPgvPirD2GOAShf+ci0o tJN9t3k2uxBsQ8APiqBsRlRIr3h6d6dnnmShxB1k1Vc+OPt5wmCpGKB3H6UaHnNOPtd3yxmcTNj 5VIjSy+rh2BX2wt1NPz0ixFjwyXgZKif4poXOF/zuC6rzKfT04mZr/t90pY2nGA+m6aPyKa4/lh
 rkycwn7hbWB4f6immrIXZjV+IzQgLZOC1rpsQZ47tJMgRhXYQaFWdwbp8yJcWTqWypjVahAc
X-Proofpoint-GUID: AhFJ5DetRbVq-Ayheqh4wDP0o6H_UfUe

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/pid.h       |   1 +
 libdtrace/dt_cg.c          |   4 +-
 libdtrace/dt_cg.h          |   3 +-
 libdtrace/dt_pid.c         |   3 +
 libdtrace/dt_prov_uprobe.c | 590 +++++++++++++++++++++++++++++++++++--
 5 files changed, 573 insertions(+), 28 deletions(-)

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 12934500..8d4b6432 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -44,6 +44,7 @@ typedef struct pid_probespec {
 	char *pps_xargv;			/* array of xlated args */
 	size_t pps_xargvlen;			/* (high estimate of) length of array */
 	int8_t *pps_argmap;			/* mapped arg indexes */
+	char *pps_sargv;			/* list of arg sources */
 
 	/*
 	 * Fields below this point do not apply to underlying probes.
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index c68a5d45..bd0763d6 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1597,7 +1597,7 @@ dt_cg_check_ptr_arg(dt_irlist_t *dlp, dt_regset_t *drp, dt_node_t *dnp,
 		dt_cg_check_notnull(dlp, drp, dnp->dn_reg);
 }
 
-static void dt_cg_setx(dt_irlist_t *dlp, int reg, uint64_t x);
+void dt_cg_setx(dt_irlist_t *dlp, int reg, uint64_t x);
 
 static int
 dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
@@ -3006,7 +3006,7 @@ dt_cg_xsetx(dt_irlist_t *dlp, dt_ident_t *idp, uint_t lbl, int reg, uint64_t x)
 	emit(dlp,   instr[1]);
 }
 
-static void
+void
 dt_cg_setx(dt_irlist_t *dlp, int reg, uint64_t x)
 {
 	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, reg, x);
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index fb26c125..81b79399 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2020, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -18,6 +18,7 @@ extern "C" {
 #endif
 
 extern void dt_cg(dt_pcb_t *, dt_node_t *);
+extern void dt_cg_setx(dt_irlist_t *, int, uint64_t);
 extern void dt_cg_xsetx(dt_irlist_t *, dt_ident_t *, uint_t, int, uint64_t);
 extern dt_irnode_t *dt_cg_node_alloc(uint_t, struct bpf_insn);
 extern void dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act);
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 9b1a2278..d12b7919 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1077,6 +1077,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			if (argmap)
 				psp.pps_argmap = argmap;
 
+			if (tp->tracepoint.args[0] != 0)
+				psp.pps_sargv = tp->tracepoint.args;
+
 			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
 				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
 			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 28762eb3..cf5cfd43 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -46,6 +46,231 @@
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
 
+typedef struct asm_reg {
+	const char	*name;			/* register name */
+	const char	*mname;			/* *pt_regs member name */
+	size_t		moff;			/* offset in member */
+	uint64_t	mask;			/* value mask (after shift) */
+	uint8_t		shift;			/* value shift */
+	int		off;			/* *pt_regs value offset */
+	dt_hentry_t	he;
+} asm_reg_t;
+
+static uint32_t
+reg_hval(const asm_reg_t *reg)
+{
+	return str2hval(reg->name, 0);
+}
+
+static int
+reg_cmp(const asm_reg_t *p, const asm_reg_t *q)
+{
+	return strcmp(p->name, q->name);
+}
+
+DEFINE_HE_STD_LINK_FUNCS(reg, asm_reg_t, he)
+DEFINE_HTAB_STD_OPS(reg)
+
+static asm_reg_t	asm_regs[] = {
+#if defined(__amd64)
+# define REG_R(n, m)	{ (n), (m), 0, (-1LL), 0, 0, }
+# define REG_E(n, m)	{ (n), (m), 0, ((1ULL << 32) - 1), 0, 0, }
+# define REG_X(n, m)	{ (n), (m), 0, ((1ULL << 16) - 1), 0, 0, }
+# define REG_L(n, m)	{ (n), (m), 0, ((1ULL << 8) - 1), 0, 0, }
+# define REG_H(n, m)	{ (n), (m), 0, ((1ULL << 8) - 1), 8, 0, }
+
+	REG_R("rax",  "ax"),
+	REG_E("eax",  "ax"),
+	REG_X("ax",   "ax"),
+	REG_L("al",   "ax"),
+	REG_H("ah",   "ax"),
+	REG_R("rbx",  "bx"),
+	REG_E("ebx",  "bx"),
+	REG_X("bx",   "bx"),
+	REG_L("bl",   "bx"),
+	REG_H("bh",   "bx"),
+	REG_R("rcx",  "cx"),
+	REG_E("ecx",  "cx"),
+	REG_X("cx",   "cx"),
+	REG_L("cl",   "cx"),
+	REG_H("ch",   "cx"),
+	REG_R("rdx",  "dx"),
+	REG_E("edx",  "dx"),
+	REG_X("dx",   "dx"),
+	REG_L("dl",   "dx"),
+	REG_H("dh",   "dx"),
+
+	REG_R("rsi",  "si"),
+	REG_E("esi",  "si"),
+	REG_X("si",   "si"),
+	REG_L("sil",  "si"),
+	REG_R("rdi",  "di"),
+	REG_E("edi",  "di"),
+	REG_X("di",   "di"),
+	REG_L("dil",  "di"),
+	REG_R("rsp",  "sp"),
+	REG_E("esp",  "sp"),
+	REG_X("sp",   "sp"),
+	REG_L("spl",  "sp"),
+	REG_R("rbp",  "bp"),
+	REG_E("ebp",  "bp"),
+	REG_X("bp",   "bp"),
+	REG_L("bpl",  "bp"),
+
+	REG_R("r8",   "r8"),
+	REG_E("r8d",  "r8"),
+	REG_X("r8w",  "r8"),
+	REG_L("r8b",  "r8"),
+	REG_R("r9",   "r9"),
+	REG_E("r9d",  "r9"),
+	REG_X("r9w",  "r9"),
+	REG_L("r9b",  "r9"),
+	REG_R("r10",  "r10"),
+	REG_E("r10d", "r10"),
+	REG_X("r10w", "r10"),
+	REG_L("r10b", "r10"),
+	REG_R("r11",  "r11"),
+	REG_E("r11d", "r11"),
+	REG_X("r11w", "r11"),
+	REG_L("r11b", "r11"),
+	REG_R("r12",  "r12"),
+	REG_E("r12d", "r12"),
+	REG_X("r12w", "r12"),
+	REG_L("r12b", "r12"),
+	REG_R("r13",  "r13"),
+	REG_E("r13d", "r13"),
+	REG_X("r13w", "r13"),
+	REG_L("r13b", "r13"),
+	REG_R("r14",  "r14"),
+	REG_E("r14d", "r14"),
+	REG_X("r14w", "r14"),
+	REG_L("r14b", "r14"),
+	REG_R("r15",  "r15"),
+	REG_E("r15d", "r15"),
+	REG_X("r15w", "r15"),
+	REG_L("r15b", "r15"),
+
+	REG_R("rip",  "ip"),
+	REG_E("eip",  "ip"),
+	REG_X("ip",   "ip"),
+#elif defined(__aarch64__)
+# define REG_X(n, m, i)	{ (n), (m), (i) * sizeof(uint64_t), (-1LL), 0, 0, }
+# define REG_W(n, m, i)	{ (n), (m), (i) * sizeof(uint64_t), ((1ULL << 32) - 1), 0, 0, }
+
+	REG_X("x0",  "regs", 0),
+	REG_X("x1",  "regs", 1),
+	REG_X("x2",  "regs", 2),
+	REG_X("x3",  "regs", 3),
+	REG_X("x4",  "regs", 4),
+	REG_X("x5",  "regs", 5),
+	REG_X("x6",  "regs", 6),
+	REG_X("x7",  "regs", 7),
+	REG_X("x8",  "regs", 8),
+	REG_X("x9",  "regs", 9),
+	REG_X("x10", "regs", 10),
+	REG_X("x11", "regs", 11),
+	REG_X("x12", "regs", 12),
+	REG_X("x13", "regs", 13),
+	REG_X("x14", "regs", 14),
+	REG_X("x15", "regs", 15),
+	REG_X("x16", "regs", 16),
+	REG_X("x17", "regs", 17),
+	REG_X("x18", "regs", 18),
+	REG_X("x19", "regs", 19),
+	REG_X("x20", "regs", 20),
+	REG_X("x21", "regs", 21),
+	REG_X("x22", "regs", 22),
+	REG_X("x23", "regs", 23),
+	REG_X("x24", "regs", 24),
+	REG_X("x25", "regs", 25),
+	REG_X("x26", "regs", 26),
+	REG_X("x27", "regs", 27),
+	REG_X("x28", "regs", 28),
+	REG_X("x29", "regs", 29),
+	REG_X("x30", "regs", 30),
+
+	REG_W("w0",  "regs", 0),
+	REG_W("w1",  "regs", 1),
+	REG_W("w2",  "regs", 2),
+	REG_W("w3",  "regs", 3),
+	REG_W("w4",  "regs", 4),
+	REG_W("w5",  "regs", 5),
+	REG_W("w6",  "regs", 6),
+	REG_W("w7",  "regs", 7),
+	REG_W("w8",  "regs", 8),
+	REG_W("w9",  "regs", 9),
+	REG_W("w10", "regs", 10),
+	REG_W("w11", "regs", 11),
+	REG_W("w12", "regs", 12),
+	REG_W("w13", "regs", 13),
+	REG_W("w14", "regs", 14),
+	REG_W("w15", "regs", 15),
+	REG_W("w16", "regs", 16),
+	REG_W("w17", "regs", 17),
+	REG_W("w18", "regs", 18),
+	REG_W("w19", "regs", 19),
+	REG_W("w20", "regs", 20),
+	REG_W("w21", "regs", 21),
+	REG_W("w22", "regs", 22),
+	REG_W("w23", "regs", 23),
+	REG_W("w24", "regs", 24),
+	REG_W("w25", "regs", 25),
+	REG_W("w26", "regs", 26),
+	REG_W("w27", "regs", 27),
+	REG_W("w28", "regs", 28),
+	REG_W("w29", "regs", 29),
+	REG_W("w30", "regs", 30),
+
+	REG_X("sp",  "sp",   0),
+	REG_X("pc",  "sp",   0),
+
+	REG_X("lr", "regs", 30),
+#else
+# error ISA not supported
+#endif
+};
+
+static asm_reg_t *
+get_asm_reg(dt_provider_t *pvp, const char *name)
+{
+	dt_htab_t	*rtab = pvp->prv_data;
+	asm_reg_t	regt;
+
+	if (rtab == NULL) {
+		int		i;
+		asm_reg_t	*rp, *reg = NULL;
+
+		rtab = dt_htab_create(&reg_htab_ops);
+		if (rtab == NULL)
+			return NULL;
+
+		pvp->prv_data = rtab;
+
+		for (i = 0, rp = asm_regs; i < ARRAY_SIZE(asm_regs);
+		     i++, rp++) {
+#if defined(__amd64)
+			rp->off = dt_cg_ctf_offsetof("struct pt_regs",
+						      rp->mname, NULL, 0) +
+				  rp->moff;
+#elif defined(__aarch64__)
+			rp->off = dt_cg_ctf_offsetof("struct user_pt_regs",
+						      rp->mname, NULL, 0) +
+				  rp->moff;
+#endif
+
+			if (dt_htab_insert(rtab, rp) < 0)
+				return NULL;
+			if (strcmp(rp->name, name) == 0)
+				reg = rp;
+		}
+
+		return reg;
+	}
+
+	regt.name = name;
+	return dt_htab_lookup(rtab, &regt);
+}
+
 #define PP_IS_RETURN	0x1
 #define PP_IS_FUNCALL	0x2
 #define PP_IS_ENABLED	0x4
@@ -55,15 +280,17 @@ static const char	prvname[] = "uprobe";
 typedef struct dt_uprobe {
 	dev_t		dev;
 	ino_t		inum;
-	char		*fn;		   /* object full file name */
-	char		*func;		   /* function */
+	char		*fn;		/* object full file name */
+	char		*func;		/* function */
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
-	int		argc;		   /* number of args */
-	dt_argdesc_t	*args;		   /* args array (points into argvbuf) */
-	char		*argvbuf;	   /* arg strtab */
-	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
+	int		argc;		/* number of args */
+	dt_argdesc_t	*args;		/* args array (points into argvbuf) */
+	char		*argvbuf;	/* arg strtab */
+	int		sargc;		/* number of arg source specs */
+	char		*sargv;		/* arg source specs */
+	dt_list_t	probes;		/* pid/USDT probes triggered by it */
 } dt_uprobe_t;
 
 typedef struct list_probe {
@@ -132,6 +359,7 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_free(dtp, upp->func);
 	dt_free(dtp, upp->args);
 	dt_free(dtp, upp->argvbuf);
+	dt_free(dtp, upp->sargv);
 	dt_free(dtp, upp);
 }
 
@@ -290,15 +518,19 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	 * status in the clause flags for dt_stmts[n].
 	 */
 	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_INCLUDE | DT_CLSFLAG_USDT_EXCLUDE) == 0) {
-		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
+		size_t	len = strlen(pdp->prv);
 
 		/*
 		 * If the last char in the provider description is
 		 * neither '*' nor a digit, it cannot be a USDT probe.
 		 */
-		if (lastchar != '*' && !isdigit(lastchar)) {
-			dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
-			return 1;
+		if (len > 1) {
+			char	lastchar = pdp->prv[len - 1];
+
+			if (lastchar != '*' && !isdigit(lastchar)) {
+				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
+				return 1;
+			}
 		}
 
 		/*
@@ -340,6 +572,17 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	return 0;
 }
 
+static void usdt_error(dt_pcb_t *pcb, const char *fmt, ...)
+{
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
+	va_list		ap;
+
+	va_start(ap, fmt);
+	dt_set_errmsg(dtp, NULL, NULL, NULL, 0, fmt, ap);
+	va_end(ap);
+	longjmp(pcb->pcb_jmpbuf, EDT_COMPILER);
+}
+
 static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 {
 	dtrace_difo_t   *dp;
@@ -539,6 +782,18 @@ static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 
 	upp->argc = psp->pps_xargc;
 
+	/* Copy argument value source string data (if any). */
+	if (psp->pps_sargv) {
+		/*
+		 * Is-enabled probes have one (internal use only) argument.
+		 * They retain the narg/xarg data from the probe they are
+		 * associated with, for consistency, but that data will not be
+		 * used.
+		 */
+		upp->sargc = (upp->flags & PP_IS_ENABLED) ? 1 : psp->pps_nargc;
+		upp->sargv = strdup(psp->pps_sargv);
+	}
+
 	/*
 	 * If we have a nonzero number of args, we always have at least one narg
 	 * and at least one xarg.  Double-check to be sure.  (These are not
@@ -700,9 +955,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 			assert(strcmp(upp->func, psp->pps_fun) == 0);
 	}
 
-	if (populate_args(dtp, psp, upp) < 0)
-		goto fail;
-
 	switch (psp->pps_type) {
 	case DTPPT_RETURN:
 		upp->flags |= PP_IS_RETURN;
@@ -719,6 +971,9 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		 */
 	}
 
+	if (populate_args(dtp, psp, upp) < 0)
+		goto fail;
+
 	return uprp;
 
 fail:
@@ -889,6 +1144,289 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	enable(dtp, prp, 1);
 }
 
+/*
+ * Generate code that populates the probe arguments.
+ */
+static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
+{
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	dt_provider_t	*pvp = dt_provider_lookup(dtp, dt_usdt.name);
+	asm_reg_t	*areg;
+	int		i;
+	char		*p = upp->sargv;
+
+	assert(pvp != NULL);
+
+	for (i = 0; i < upp->sargc; i++) {
+		int	ssize, disp, len;
+		char	*reg = NULL;
+		int64_t	val = 0;
+
+		/*
+		 * Get sign/size.  Missing sign/size is an error.
+		 * Also, float is not supported.
+		 */
+		ssize = 0;
+		len = -1;
+		if (sscanf(p, " %d @ %n", &ssize, &len) <= 0 || len == -1)
+			usdt_error(pcb, "Missing sign/size in arg%d spec", i);
+
+		p += len;
+
+		/* Look for dereference (with optional displacement). */
+		disp = 0;
+		len = -1;
+#ifdef __aarch64__
+		if (sscanf(p, "[ %m[^],] %n", &reg, &len) > 0 && len > 0) {
+			char	*ireg = NULL;
+
+			p += len;
+
+			if (*p != ']') {
+				/* Expect a displacement or index register. */
+				if (sscanf(p, ", %n", &len) < 0)
+					usdt_error(pcb, "Expected , in arg%d spec", i);
+
+				p += len;
+
+				if (sscanf(p, "%d ] %n", &disp, &len) != 1 &&
+				    sscanf(p, "%m[^],] , %d ] %n", &ireg, &disp,
+					   &len) != 2 &&
+				    sscanf(p, "%m[^]] ] %n", &ireg, &len) != 1)
+					usdt_error(pcb, "Missing displacement and/or index register in arg%d spec", i);
+			} else
+				sscanf(p, "] %n", &len);
+
+			p += len;
+
+			/*
+			 * If there is an index register, put its value in %r1
+			 * (after applying the scale if specified).
+			 */
+			if (ireg != NULL) {
+				areg = get_asm_reg(pvp, ireg);
+				if (areg == NULL)
+					usdt_error(pcb, "Unknown index register %s in arg%d spec", ireg, i);
+
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, areg->off));
+			}
+
+			/* If there is a base register, get its value. */
+			if (reg != NULL) {
+				int	neg = 0;
+				int	shift;
+
+				if (ssize < 0) {
+					neg = 1;
+					ssize = -ssize;
+				}
+
+				shift = 64 - ssize * 8;
+
+				areg = get_asm_reg(pvp, reg);
+				if (areg == NULL)
+					usdt_error(pcb, "Unknown base register %s in arg%d spec", reg, i);
+
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, areg->off));
+
+				if (ireg != NULL)
+					emit(dlp, BPF_ALU64_REG(BPF_ADD, BPF_REG_0, BPF_REG_1));
+
+				if (disp != 0)
+					emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, disp));
+
+				/* Load value from the pointer. */
+				emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_7));
+				emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DMST_ARG(i)));
+				emit(dlp, BPF_MOV_IMM(BPF_REG_2, ssize));
+				emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
+				emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_user]));
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(i)));
+				if (shift) {
+					emit(dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_0, shift));
+					emit(dlp, BPF_ALU64_IMM(neg ? BPF_ARSH : BPF_RSH, BPF_REG_0, shift));
+				}
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+			} else {
+				if (disp != 0)
+					emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, disp));
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_1));
+			}
+
+			free(reg);
+			free(ireg);
+		} else if (sscanf(p, "%ld %n", &val, &len) > 0) {
+			/* Handle constant value. */
+			p += len;
+
+			if (val > (1ULL << 32) - 1ULL) {
+				dt_cg_setx(dlp, BPF_REG_0, val);
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+			} else
+				emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), val));
+		} else if (sscanf(p, "%m[a-z0-9] %n", &reg, &len) > 0) {
+			/* Handle simple register. */
+			int	neg = 0;
+			int	shift;
+			uint_t	sz;
+
+			if (ssize < 0) {
+				neg = 1;
+				ssize = -ssize;
+			}
+
+			shift = 64 - ssize * 8;
+			sz = bpf_ldst_size(ssize, 1);
+
+			areg = get_asm_reg(pvp, reg);
+			if (areg == NULL)
+				usdt_error(pcb, "Unknown register %s in arg%d spec", reg, i);
+
+			emit(dlp, BPF_LOAD(sz, BPF_REG_0, BPF_REG_8, areg->off));
+			if (shift) {
+				emit(dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_0, shift));
+				emit(dlp, BPF_ALU64_IMM(neg ? BPF_ARSH : BPF_RSH, BPF_REG_0, shift));
+			}
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+
+			free(reg);
+			p += len;
+		} else
+			usdt_error(pcb, "Unknown format in arg%d spec", i);
+#else
+		if ((sscanf(p, "%d ( %n", &disp, &len) == 1 ||
+		     sscanf(p, "( %n", &len) == 0) && len >= 0) {
+			char	*ireg = NULL;
+			int	scale = -1;
+
+			p += len;
+
+			if (*p != ',') {
+				/* Expect a base register. */
+				if (sscanf(p, "%%%m[^,)] %n", &reg, &len) <= 0)
+					usdt_error(pcb, "Missing base register in arg%d spec", i);
+
+				p += len;
+			}
+
+			if (*p != ')') {
+				/* Expect an index register. */
+				if (sscanf(p, ", %%%m[^,)] %n", &ireg, &len) <= 0)
+					usdt_error(pcb, "Missing index register in arg%d spec", i);
+
+				p += len;
+
+				/* Expect scale or closing parenthesis. */
+				len = 0;
+				if (sscanf(p, ", %d ) %n", &scale, &len) <= 0 &&
+				    sscanf(p, ") %n", &len) < 0)
+					usdt_error(pcb, "Missing scale or ) in arg%d spec", i);
+			} else
+				sscanf(p, ") %n", &len);
+
+			p += len;
+
+			/*
+			 * If there is an index register, put its value in %r1
+			 * (after applying the scale if specified).
+			 */
+			if (ireg != NULL) {
+				areg = get_asm_reg(pvp, ireg);
+				if (areg == NULL)
+					usdt_error(pcb, "Unknown index register %s in arg%d spec", ireg, i);
+
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, areg->off));
+				if (scale > 0)
+					emit(dlp, BPF_ALU64_IMM(BPF_MUL, BPF_REG_1, scale));
+			}
+
+			/* If there is a base register, get its value. */
+			if (reg != NULL) {
+				int	neg = 0;
+				int	shift;
+
+				if (ssize < 0) {
+					neg = 1;
+					ssize = -ssize;
+				}
+
+				shift = 64 - ssize * 8;
+
+				areg = get_asm_reg(pvp, reg);
+				if (areg == NULL)
+					usdt_error(pcb, "Unknown base register %s in arg%d spec", reg, i);
+
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, areg->off));
+
+				if (ireg != NULL)
+					emit(dlp, BPF_ALU64_REG(BPF_ADD, BPF_REG_0, BPF_REG_1));
+
+				if (disp != 0)
+					emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, disp));
+
+				/* Load value from the pointer. */
+				emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_7));
+				emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DMST_ARG(i)));
+				emit(dlp, BPF_MOV_IMM(BPF_REG_2, ssize));
+				emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
+				emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_user]));
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(i)));
+				if (shift) {
+					emit(dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_0, shift));
+					emit(dlp, BPF_ALU64_IMM(neg ? BPF_ARSH : BPF_RSH, BPF_REG_0, shift));
+				}
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+			} else {
+				if (disp != 0)
+					emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, disp));
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_1));
+			}
+
+			free(reg);
+			free(ireg);
+		} else if (sscanf(p, "%%%ms %n", &reg, &len) > 0) {
+			/* Handle simple register. */
+			int	neg = 0;
+			int	shift;
+			uint_t	sz;
+
+			if (ssize < 0) {
+				neg = 1;
+				ssize = -ssize;
+			}
+
+			shift = 64 - ssize * 8;
+			sz = bpf_ldst_size(ssize, 1);
+
+			areg = get_asm_reg(pvp, reg);
+			if (areg == NULL)
+				usdt_error(pcb, "Unknown register %s in arg%d spec", reg, i);
+
+			emit(dlp, BPF_LOAD(sz, BPF_REG_0, BPF_REG_8, areg->off));
+			if (shift) {
+				emit(dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_0, shift));
+				emit(dlp, BPF_ALU64_IMM(neg ? BPF_ARSH : BPF_RSH, BPF_REG_0, shift));
+			}
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+
+			free(reg);
+			p += len;
+		} else if (sscanf(p, "$%ld %n", &val, &len) > 0) {
+			/* Handle constant value. */
+			p += len;
+
+			if (val > (1ULL << 32) - 1ULL) {
+				dt_cg_setx(dlp, BPF_REG_0, val);
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+			} else
+				emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), val));
+		} else
+			usdt_error(pcb, "Unknown format in arg%d spec", i);
+#endif
+	}
+}
+
 /*
  * Generate a BPF trampoline for a pid or USDT probe.
  *
@@ -981,17 +1519,10 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	if (upp->flags & PP_IS_RETURN)
 		goto out;
 
-	dt_cg_tramp_copy_args_from_regs(pcb, 0);
-
-	/*
-	 * Apply arg mappings, if needed.
-	 */
-	if (upp->flags & PP_IS_MAPPED) {
-
-		/* dt_cg_tramp_map_args() works from the saved args. */
-		dt_cg_tramp_save_args(pcb);
-		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
-	}
+	if (upp->sargc)
+		copy_args(pcb, upp);
+	else
+		dt_cg_tramp_copy_args_from_regs(pcb, 0);
 
 	/*
 	 * Retrieve the PID of the process that caused the probe to fire.
@@ -1022,7 +1553,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 * The trampoline writes 1 into the location pointed to by the passed-in arg.
 		 */
 		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, PT_REGS_ARG0));
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(0)));
 		emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
@@ -1042,6 +1573,15 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
 	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
 
+	/*
+	 * Apply arg mappings, if needed.
+	 */
+	if (upp->flags & PP_IS_MAPPED) {
+		/* dt_cg_tramp_map_args() works from the saved args. */
+		dt_cg_tramp_save_args(pcb);
+		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
+	}
+
 	/*
 	 * Hold the bit mask in %r6 between clause calls.
 	 */
-- 
2.45.2

