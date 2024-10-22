Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B811465A5
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 20:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729630056; cv=fail; b=eXaNS2rfDtQTfdh+1Gkth15b5gPLpdqtlxhaZ6J+iLUNwKjMWUdkgcn4MVKdPvswJ7Xz2jOhOup2REu+m3JP5k9h6m4elnKSuvgleJwXlwAr0qVzyd3KLlA+l15HxdbUSpCKw6tdSPZNGAOagTcmd6qiejka7HwOfXRCjncs/V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729630056; c=relaxed/simple;
	bh=rjMLhyKtdftRVtLhhCnMGv3+mxbs06EJHRwL+UvHCIU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DG2rhEM8nF8CBZuZEIOpMAeEUn7KSRtYJasM8bDNRzWR6r2M6PeVFZeXzhYhtl2d2W1MWXdLIlkujXd0hbz/k4H20IrGMnUJ+6jotDAHZuBHSXTtiFU/Bsmp8KJfEfPzKCAGvEEdmwOxfqqZtAARHnTS+sVnxv4roSX5+ujUceY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OIXNACnm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RoM/5W36; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OIXNACnm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RoM/5W36"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MK3Xcq017462
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 20:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=NmNiv8fjt6Lg+2upXaUjeANkeff/UJQmmvNLixt2sBM=; b=
	OIXNACnms5zegeoCK6NIyxyne8xGEmKsql+WCC7EqB6DW4NyWnOdOkZPj9rR4GCd
	yyNq+bMNtNgVZRSGUg93J8x1dm7MmYlW0BgAROd39z0oetkJguEppTvnaD59/NDP
	720JdF1I0Dx+EeFqHkpvxNzP0HGvivOx43rY7c01aIMyuBTG2cQr/CttaRnb/Odp
	o+BSCgA6n3Tt1KiOmlDLDzyGS39rFTbOVfvwSiQ9lyNsjlVNF/1GlP99MqLNTvSO
	be2E5j66f7RBWLwI6jj5611zS0RlHncUQw5CVKgLluE6T/rmRoE85nd11xyz1Ii5
	lZHajbUDSF7djUOVKsR/8Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ckkqwyjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 20:47:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49MJtSVG019633
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 20:47:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42c37efay0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Oct 2024 20:47:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/KZF5F8CmL/eVzMIAufN89fXpoAKpdu6C30ggAeWFlADgLJ7alujaiBnSgEVjYf7eJKhm+/MxgfqVE4ta5S6FyaUPkVfDjqeEUy4jj6x843wwVP+hASe2VEW2AmyK0pk9EIBo2JjiNPYV6RteRyl+je1IhvLpYVhXzvIrgy+OsTBgD4+NREdItmPd2DF1pd2U02HWNd8XrPFsGb817yNLvxzb/dRTjpmGuGTAGVtKnMT6+aQibkhrlFW8lrMVBuPEDpIJQNoVfPJohUhRXuloJfTsoS7yByoBXJ7jp9XjGkBatPb7pnfhOHocBE5Njtjxa1r6esUVtQAgm5+1IMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmNiv8fjt6Lg+2upXaUjeANkeff/UJQmmvNLixt2sBM=;
 b=Us8IsII1cZjAPm+NN2dK/LyvTYdmGunG/Zt1Hh5g1Ofp/wKXXuDrsY+9wBIPoYmA8+TN6j1XOlt89RbMRPYb9dtBCSku2z0osyvuXyA20WcLG7YQQH31HbStU0q7xLp5PEoz9CC2/04ijwKPl9jtbJau/5e4XyufET6WX00QB23D8s4qsr5Vsf8wNyr2eJROUbEP2F/SBCl+vrFHvVq8/Gb1Y7/I+GQzaqHeumVxkSJgjuMrYqQiNCfcwFX6AOiW6vexZ+7/0s2hFf5aA1mlsL9lAnLXg8eKcj0q3jPU+K4mL8qLbb1itN1fhmrs6HWUJbkd7+CAHTgUt+G3iarK2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmNiv8fjt6Lg+2upXaUjeANkeff/UJQmmvNLixt2sBM=;
 b=RoM/5W36+DLI8WRR5g4nsGNcl+Z3KQMz192g6CuHll9+ugnQY3m1cfb8rHOtxVBW0hJkETTFZZN/6sTiKCEX1Mfs8zfrPGTQ6EFbnPIGXP0+BsVGaqZRRB45+U7gIELit24fH7tyrx7Ig+OtEy4t0fpC271tbBjhUWXA0MxQrIU=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by DM4PR10MB6062.namprd10.prod.outlook.com (2603:10b6:8:b7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.17; Tue, 22 Oct 2024 20:47:30 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8069.016; Tue, 22 Oct 2024
 20:47:30 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Cast should not change writable
Date: Tue, 22 Oct 2024 16:47:27 -0400
Message-Id: <20241022204727.27718-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN1PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:408:e0::26) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|DM4PR10MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: fec9a20a-f8b2-4b07-563f-08dcf2dabf0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L7LqHhAsUkDaWEp3EbGwd1k+H9cdoF1vW+E7O8vQbxzhYdHcUoU6hNT7Q805?=
 =?us-ascii?Q?uM7vFZlNXcy/ladDigljOWH/QcyKDcOUVsp+0+7zeR9BrZ4RZqXKpB1vx1Fd?=
 =?us-ascii?Q?NCv4GQiHnzujGPJ6Hi+wevvp2DXdkXAoG9sbpE/yURuem3YnQZfpesXMkcwa?=
 =?us-ascii?Q?8nS3+YRRfpl/tbq+CwiJES1zyCYkmdSvHmg2o4a2DsBor3F5ZvXkVvsILmb+?=
 =?us-ascii?Q?sGml8xLygWCG1RHrJc7vW3fGlTG6+HCuOQPyq+0xS6Im4FBHcXWsB+JsWqga?=
 =?us-ascii?Q?l5gDfg0qrptu3sdqDe00/T++vA0++iBFwaNff+ZIDQ/KMHiAkhArv0F80JR9?=
 =?us-ascii?Q?LTvuNFpd/brI8s0eF2mZxujganvSq3C2IoGMZ7rnZaHs4UUjD7RHRFslNqny?=
 =?us-ascii?Q?Q9q/dnXiq0Y8H5rbFsEVDpja95KmLFJ8dwGWXisWiaqBRjH7j5BcmIwEKeMC?=
 =?us-ascii?Q?TK8bEUA3Mw6OA3Me3483eXVB9EyylOEeVDQagh3JG4G2sjHDGC6YNCOznfW7?=
 =?us-ascii?Q?nWxxGf+bdAyKKdSn5Ejd3KiID7przxvVF2HwQLcv1SBalU4Z3iDQeZ0r/RY8?=
 =?us-ascii?Q?k+a0CULXhcJfq46Viwi+hSRTqgDsI5lka2YhcLHRONsvXn+DgQDZ3+hlYmWd?=
 =?us-ascii?Q?R9RcUgTXzymZwXdp18rNmPO5Q4e75o1Oe//tv5RBRgx3LvG+KU1BAy0i2t7e?=
 =?us-ascii?Q?6r/saH96ZteDmpGvhxvYn69PL57oYxA1WEBulajlJzfaNVjV5S+eaIjIh59S?=
 =?us-ascii?Q?eRgo1rf0n3oTyOCIFLp7PC10DB2e4OfefYqk1F1VYK+aLOtUw6fbdDmFAfSf?=
 =?us-ascii?Q?VVAeip9sdMtuh1Kqx+1wm3adciYvxIw/e/jXv6iKK8Mo+ZM18+vR/1h9mPBy?=
 =?us-ascii?Q?iespM0/7dL/48OTFLyC4kjLA3pmfVTsBB44jH9PkmJezabwFeUNDeLg8NlDc?=
 =?us-ascii?Q?xnm/nEj2oVxgxZG7cUzX4tS4cY1guhoVL5Zkc7qqZPmbuay3dmljEzRtllF0?=
 =?us-ascii?Q?N4Vxg04Ks+lnMIKIvPA+p4yE0SgzHc6xkb2dbmkdgFdiW7GZygcd8nGim1kc?=
 =?us-ascii?Q?Qi8UbVTxM8ozcNAoynItcszKa/DVcUBo/u+VdiP+qdxv0N1Flq5fhsUYsvbX?=
 =?us-ascii?Q?93hkipYYL/iETOPFQOozB+r9a57HMVamczcdDn8+9IvkXnz7FDjz/PlHcqcx?=
 =?us-ascii?Q?IJi+fCYSNTht4jwPDwNUQ5kGabha4UVGg0bdOycEuNIsWPW3RWzMhfa+KXjQ?=
 =?us-ascii?Q?Eoq6S21ibPInKTvarPb5n5XhrlNPQSzSl2Hx8aafoerjsCBypBJxLyJfy/Cd?=
 =?us-ascii?Q?s9f2+znbedcv7nvSiTkqq3VU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AsVlnGWq2XWh2aMd8D77ZWBVWsPQhx6eHvKcsxOlGKq38DYZDO5/j9VEbcAk?=
 =?us-ascii?Q?EGLiNT/TRGDilZmyGK9o1H7Z3vRGWa2ogN77UPV1bEqaKkrZWsbbrSQdBlOm?=
 =?us-ascii?Q?7xZHgbdp89sMtYMRCzvoBqkZhYty7Vwdidr5VhpMg26Nk3AE8Qbe2poU2t+6?=
 =?us-ascii?Q?hSx63s3d2Eyv0/P1Yir+GaPCeyvybNL/j1ye6UrDXH1VEdm/2afrDVXvzsNg?=
 =?us-ascii?Q?HrUwAcr42sjbeidFq220V5fDrnwTI/Occqrh7aOFXDlJu6G9Hcnfhw3mYK3S?=
 =?us-ascii?Q?tnI5BErcSi60V2DjwkeDnk9nvP1OyN6GSrU/vxNZQTGMDXV7gtf4YK0aiEDZ?=
 =?us-ascii?Q?sPAu17qGkO3HPSXkw/tJNMBkP+82iOpoYf16bztaOOKU1auoDGowmf6dytCG?=
 =?us-ascii?Q?wsBKIIj9FwCjioOULqTrJ/uYE/SBSSesZ62goigGYwg5SH9YstflU7+xnxm8?=
 =?us-ascii?Q?kJrNnt/iCJvd+yGDWESeBrfePlMWg9NkUaox7sh23mh3R3HnaZsnZkI1T4NK?=
 =?us-ascii?Q?c63pzxBSVv/teUyd/9ihE/BX4XpxLroVP7NOBoVG2HM2yUWOxgW7Fl92qzKv?=
 =?us-ascii?Q?UN8S42a43eJvRZYOIuqTR2EBSKB3/fexF6GoUp+I9oDyuAMfIV0LLjZWCVTF?=
 =?us-ascii?Q?txAtIbBiK9we5nOZHuE6NsXt7xO6Li2TFmZATzdzp8x54eWGYlC5VhTgoExT?=
 =?us-ascii?Q?XR0CpDW4Us+OtyUhGapM4LVpgZyi5ekVEKOaicwPp1jUoFyCPE699ymOF9x4?=
 =?us-ascii?Q?oi+RSXu50krvypfIzkxpnIWcfTgAySUOnu3rSgbNqIAvpYWX+uVtvw6wbmFv?=
 =?us-ascii?Q?JwBooNlvSlMhz4nZeR4gZRhDUN1AsA+LeVi7HlkcKXx711DuH70Gbfda6kps?=
 =?us-ascii?Q?IHeFXId3J2CKu/pAwRuA2i5e2xJQnEqFORlOA+gv5Kbedb0+6OLIkVYEF9C9?=
 =?us-ascii?Q?7RIdRy2ghWxpm8VwScmEuP0ptXhq0hiqSVB4UCUQt4vMxmrUOTk0qBOuRcTi?=
 =?us-ascii?Q?0sgXz9/eZIlVgbIiRUNvMsCJXiRaabergoaMeI5FKMQEFngJPv/APISGV593?=
 =?us-ascii?Q?w6ex1F2+ayTdOH4jhFzeVQd9KQFhuouXYQh9PGrVTT7mFPs2eWNiBHz7ye3K?=
 =?us-ascii?Q?arRsUk7SUWgr4YFuoRCfREt89lgDXgBVOkZjy0O5pnLvkj91roBTsWW7j3CY?=
 =?us-ascii?Q?ucuIAKDmxmhbTKx2tRKptUvLYYchGAcphc/BgDXRyIdqQRU2H3cgRTJ3+hcT?=
 =?us-ascii?Q?A64tfRse+xoxHDEUXVVXUyjz9VLkvDOKcE440tX6lvj7LMFVWwKF4gS/0PWt?=
 =?us-ascii?Q?NekrXoKS720y6kbrXD4+tqEgXqfL08kr77wkyvOReQEf3U6Obu0NyJSNBNoF?=
 =?us-ascii?Q?UlxT0w0FFs1rUp928BB0OKxVk//DMSWsl3+qHPwuiWs6zIR1UjLxY4+lgMrp?=
 =?us-ascii?Q?LXseLlDveocLmKVrDh7Hde9q0z81PKTeL4JPoBiZLWMn18K8zwu8n8UitwZX?=
 =?us-ascii?Q?ygVJ/ifhBxynHFRzxqfEvSQDGmK+oFu2akB/jJ+/Cvw337eCw7Ou4rqCyukB?=
 =?us-ascii?Q?cSCHG4GxMaF9EJcaXm2Qqqk5OHT9CSNwqJuZZN0g?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O3YLRAA9Bk3oX+WzJrj4V9W3y1JRV3V12rZzzbo3752GKyG07LLwk/L5nWpdgOFLi9wVbJgBku0uw3pnCpFn9kEjRnG7ET85u3T45SG8w28fHgKZLX+TeZuDNW2K+HRjGOiOoyR+2qLxlTF7hcLVYHRRWNFDRoip/+e5/D59YlqarNgXYyw3VtLWY2zVm+ok7d1r658PhiINJmLZoJ5cYLPcCkjpt+KoxycdySBvl6gluTE/NBxT3Uu+UDoeWfU03/jD5BD5VQe6G+86o+e6cIVjZ98uaiHjhR2EYfjNyWc2Od/9vlIgOfzAMpV8sP3MK0H7sb5KyUP8MVaTpphuWKIczjGtKBwEIm1ZkNNKx1rtDTjw5JO5GdHMTMYF9MNKzDA/6VJROzeLLr//PQ3pK/rwF5lN5Jwh/Mqup0UQdR5RMUItvlNFNZOcmMlVusQ9OW9aA4K3NxclIEX/EZsjL0/0RCvzqDbHHzyqlIy5OkgDa2VYFI44p7InSyqGDT+1uovzgOs+7QSUq2T1GursnlWcWZw1V/e/HkrTGg1vakxGfB8B7r2LLufrpKOK8aoAw6lhpJwjkWZ1clbTzzlLCbxNKO570ofZgKEWVZn9Ks4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec9a20a-f8b2-4b07-563f-08dcf2dabf0e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 20:47:30.3867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9Uxuqc/W21t0nGkItfdQ4lqVPP05RMpiDc9kMp6X+v+P3WykKnh9zg6Pe1Pf916IhjcQKFiL0CqfQ3F4sq+Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6062
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-22_21,2024-10-22_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410220135
X-Proofpoint-GUID: 9gcnFQMIVvWzwXFi1tEKpV9Kb2E5YYoX
X-Proofpoint-ORIG-GUID: 9gcnFQMIVvWzwXFi1tEKpV9Kb2E5YYoX

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_parser.c                  |  4 ++++
 test/unittest/types/tst.castwritable.d | 22 ++++++++++++++++++++++
 test/unittest/types/tst.castwritable.r |  1 +
 3 files changed, 27 insertions(+)
 create mode 100644 test/unittest/types/tst.castwritable.d
 create mode 100644 test/unittest/types/tst.castwritable.r

diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index 59293ebce..325ba881e 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -4209,6 +4209,10 @@ asgn_common:
 			dt_cook_taint_alloca(lp, NULL, rp);
 
 		dt_node_type_propagate(lp, dnp); /* see K&R[A7.5] */
+
+		if (rp->dn_flags & DT_NF_WRITABLE)
+			dnp->dn_flags |= DT_NF_WRITABLE;
+
 		dt_node_attr_assign(dnp, dt_attr_min(lp->dn_attr, rp->dn_attr));
 		break;
 	}
diff --git a/test/unittest/types/tst.castwritable.d b/test/unittest/types/tst.castwritable.d
new file mode 100644
index 000000000..1b419228c
--- /dev/null
+++ b/test/unittest/types/tst.castwritable.d
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION:  casting keeps a variable writable.
+ *
+ * SECTION: Types, Operators, and Expressions/Constants
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	x = (char *) alloca(8);
+	*((long long*)x) = 0x0067666564636261;
+	trace(stringof(x));
+	exit(0);
+}
diff --git a/test/unittest/types/tst.castwritable.r b/test/unittest/types/tst.castwritable.r
new file mode 100644
index 000000000..b5b9ef6c6
--- /dev/null
+++ b/test/unittest/types/tst.castwritable.r
@@ -0,0 +1 @@
+abcdefg
-- 
2.43.5

