Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DAB149DE2
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524722; cv=fail; b=X2ErLXc84oMspzGiitaZcOAGAjEqD/iNd0VXgfOG/FrlyrmkaVbAKSTij7HnK/nGYBQAk+5rfqf566PyXLkKqxOBDQ9Mifso5bk6SaDLiSUAOVI5MpANiLJ2C0jerEKP0uqeqf2h0M0d7ZG+JqtNbAG7/G9hi12Ho/gWJ2I2YzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524722; c=relaxed/simple;
	bh=okRnJbLlBHpyks+fWRNcQ7tTHwXoOYiTofLne/AnQT0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=reFJ8a417+SEkqaEzyFzlH22woF8KerSQCqU/BTT5iNzasO4/XC1MkIUTw2yr4rkt8N624lVn+LAihwU5OAq5ZbNJGgfAZoZOVTNQoKymd/7hznKiEoqH+wzkqWCdbI3yyDn0GdBE9HnKrCjpQIrwtJz18hOS8err/o4EHfWYAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454Bn2DY013802
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:00 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3D32rCe+aP4dJLELi?=
 =?UTF-8?Q?oZsiISBQmQupMo0hgXJDGojbQjZk=3D;_b=3DQ71HJb78DciN6RpURPopeB33T+?=
 =?UTF-8?Q?QGqjxcFTWai9+boJRsKhj27laaPllEaYz8wVtpUi2J_EepYr7KXcobl4wLUu21i?=
 =?UTF-8?Q?NKUleJhD4gcReRIjjOy7VMQ/q+toWPkFFRKLvS95gYKFFEOW_p4C2hVQ5KxyBOr?=
 =?UTF-8?Q?gKwuPOPnD0zff9lX90VIdvewxJ16xmLjhGyGmcVZBIuh0FZ1h61cKx_Obca85dP?=
 =?UTF-8?Q?YBQ4EwjwTLE9bbq5zGynTDRruu/ElGLO2buhICqxo481U3WzxpM1M0gK6wMs_fd?=
 =?UTF-8?Q?m/xCoALf9Mm4B1itEJg+kTZanXZE+1YR6Ce+i4PrRl3gKuJRWxQir81pKyomW1B?=
 =?UTF-8?Q?M/2_UQ=3D=3D_?=
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfuwm5mfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:59 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HtMhl020558
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:58 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrj2cpnp-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQh0ZUtdamKh+juasDxOVE6wEILfL4fkjJCfuEmAuLGlawrYFPQXDj6SKnb1lDSMw9d2v4J0xvsOZ04udVdYh2cYIno7kdOrZiA0UzIeFzTiRwYmMRMPB79CxEvl9zsFNUJtgJFzMOQJdC47mLhfIxaVFRqQwxPZzGF/C0AeSUVTbWzzOoXw6tlKDdmNdGnXSD//5Ltakbl++CdMLzvlQLHo5aLGU/aPDi/HGb1kUaX98bCysL3iGzF/ewbc4Wt/PnDOKWmowCni3Q5ENuz3pHSO1iPtxUn2p4S2i+HmVa8yYcwc86UOSBDeowY8UbaQS1kAkJH2bfyoF888LgMXpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32rCe+aP4dJLELioZsiISBQmQupMo0hgXJDGojbQjZk=;
 b=kIWXRU+TOsHMknVAQjtTF/CtbBGKszUVT+l0gmTn1S8T0W2xJrktHpFaDuOdhZpNw/QpVM4fDmq49wOvVmdMDJ03HKmXzhPgkVUpTzmLBETrVqlHNEByVLi+np5f2cLx4PCXx4tNAPWxZk4bXCHii+M+78/gXZw8ZOZvZLIaYASbB1IsNRaAVxdLfffyWxllTHd6CkgU0LSW9EDO4xoMZdCvUr3GRYSetcCLOYDwLouG0BbV4cMuTjec37Sanc47pCu29xP3G646HR3lD0fMEgh6JrXSZhkmMibLSF6qG2zewWh9ARugUkveqaQKM2PWcS8MMo17ahSQ4Sp/FYACXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32rCe+aP4dJLELioZsiISBQmQupMo0hgXJDGojbQjZk=;
 b=kwgg8ydmu/XmjrtFGqY3no+uzz6y57rsV6UTD5dmJSqoKPJfro7d+jqLfZ0ix6GEM7Yv0pFv7vEHvQSbo0++RC/erDIVvDHl03hC8cDMw7JsvfYPtgdcLBYYxwsZBCloca5QUcV4SPOukJjN7z0E71w3gvs4tI4Z8CPIZe90P4Y=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:51 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 08/14] Use uprobes map to call clauses conditionally
Date: Tue,  4 Jun 2024 14:11:07 -0400
Message-Id: <20240604181113.11505-9-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cedb43e-aee8-408b-9565-08dc84c1cefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Z8PLf3Wd/2IkNf9/oTJBjS6N0d5jlUMPOH2wGKoYIwzqG4a2HHVbYAIP3j0k?=
 =?us-ascii?Q?H+kM8CN4ppEY4CWuh1Pa7EnZS93OXjWwOpRMmMqXr5pJDxkvcbrOjriwz1LW?=
 =?us-ascii?Q?ztL9p5eBLrQjN4ynrOcgts9wgbymUJaxiGcpmh+6NPBsq5ZzgX4PlXGsmYoV?=
 =?us-ascii?Q?vyeVkXv0VnCEeMg1XQqsbj0jf5GoJXIgp4XZuO5J6o7zgfueB+0oOrfisUz9?=
 =?us-ascii?Q?GQdv3mniHTQfpmHANSnujHf2s21CEKnHxyD9kNZ6r8BL5h27+YYoqf0CXJDD?=
 =?us-ascii?Q?0K3Ti3zCmde4O6NSHS7n3oPSAxqI0vBbLPRFr4RSGslPH/AuMMzwX1plhcsm?=
 =?us-ascii?Q?uA9CVEBGqoZznX2cC5hjfZCaRE8k5L4H6I8ku1eF9YkCkGweNxFT7Yd7BwKE?=
 =?us-ascii?Q?lmQu4KErC79Mw17PMBvPhaNaWrDTbOedkWTbZayEsnNwivz4mSqom06R29aQ?=
 =?us-ascii?Q?oqcmTbikql99RP7J4xds0Xm57So+Z5KW1kTJ+MfEwWo5kLIobYFuLeCs2mJ3?=
 =?us-ascii?Q?gMSm3+w9MX8NP/VgFknIcwXFF37zOpmOHFRgnlYTApmzHBys2Yd6T2wOlQYN?=
 =?us-ascii?Q?xGzVvk0aYKv6AH+kwgCEks83TYvabzh8/wAUcxOkcl9xewY4Up/7mEkDKBCf?=
 =?us-ascii?Q?TvzFUYz9iqh6Cv04o0+fE0aWVX2XrWQ1q/cybkfFARxPDR2A178DrDCs0nVY?=
 =?us-ascii?Q?F7CI/Oe0SOxpE1WPPaVJ46WrczOcNBLmNJQTZiL8+MI/oT31livR9XvYhi/x?=
 =?us-ascii?Q?pKUIQztBnyaSZSt15oG4bBD0Jb5J67MENT4wyNmRETGvfnnBKw+wB7lMRrLy?=
 =?us-ascii?Q?QiWVcuEeZS65Y2FYhUW6GfrJ08r09VZJAsZdujzxdjfvyxfjkS9xOA3CEga/?=
 =?us-ascii?Q?yemrQAP47/D0yr8cM03jEF4AXhILEjPwI+RPCCfEsKL7tRptUmPJVc4BuuFg?=
 =?us-ascii?Q?MUcgpjreMwx4xM4nLy6nJXhM3CJDb5XcoWncE8hBYYs+k6VIO5p54havIki4?=
 =?us-ascii?Q?7UtNZqQ+7vHovuqu8sn95nqRki0ckgmOXMcVMp/AduNV0Ya+PDQWeXIVM84y?=
 =?us-ascii?Q?YGnPn2j4tV4U7jpGsnH3wYCR6YppaiEixyTQE3iBzuL6HU/CYlIuFm+irM8p?=
 =?us-ascii?Q?Z/LsQj0FYcnn/vKr0cPMMIxGEYH7UcEmzLcs38LEgEmxu0Sql05LDikkQtMH?=
 =?us-ascii?Q?eB/lVdKrpQW2HrlIBnpBVvNFKz1jDY/yp+4UZawSZd0lzuB9smdGIADxISrN?=
 =?us-ascii?Q?EN15fxK7GB7c3oaOThFzNsqPjZNQqlZMs+9tP1uNuw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?25AtM34s+ke+wfDUMsuqVz5jZ+3QT4+72WhQXnM9YY1vdhtfMWgtP/mD2Ez7?=
 =?us-ascii?Q?gOfURjphK8UQLbwKTtIAm/x8t+WThEkJG9IM8PRKU8ITrrp3iYe2AtaPZ5HZ?=
 =?us-ascii?Q?NP6a0gc0TgwH9xjgGM5VeXByHMrsJeY0qBHCqw+1P1QHK8F7hOSjRpMeidBd?=
 =?us-ascii?Q?zzWgar6crgFmBA3Ykx+ijpvnX9TmEEI4puRG06WO8QAvViPqDmlfizd9+sBR?=
 =?us-ascii?Q?WOXYDhkSVtSHCs9RHZPqgdrPgPbSctV5Wl09SctuA0Y2dkvwoQiSVxXF9p8Q?=
 =?us-ascii?Q?R37UPFjYmjavgcDDkpgxerdVTOxh2c4kCyq+m0TdRvVRwQZgT3jzMsmg0VmA?=
 =?us-ascii?Q?CVZ5zxedFKescnl/96TEfkYwNXufRF9rUn+7oN4UOIdFjnPR/FM7oIyN3ln6?=
 =?us-ascii?Q?uYXxLxaX7x6Lce3EnfC7a72t4QffWokGbUzZNPbsTr0WkVf5dz09V/W7NitE?=
 =?us-ascii?Q?C0wTMGvFxUxKKPUjAe2tlX54WTMYbc72KwuDj5Z/sHhxW/N82p3yZ8j+NqKz?=
 =?us-ascii?Q?KxUtCfRFuJrBr4tiXTY+SAVdZdpIkCnObQbGi+RTTrZYWNZF3UL4nrR5fNrw?=
 =?us-ascii?Q?7iZgeykhkO1J8NaIL7paWJOx30T8+9FxFDlG9+evAqTfI98G9xisDj6DGprB?=
 =?us-ascii?Q?a4qIiDd88EYI5J9avu6ESQymJ0KW8oFPrPljHOlw6P3qoyopJoSVgg3vvI+L?=
 =?us-ascii?Q?fORmfCLInoferepM95qq8Jrv9nhcYc0VawsmbFAjFssAwkhEDFDeNJ7gC0hw?=
 =?us-ascii?Q?XRTYjIik51nfYKfQB/VeBVPXw978m+HyFYm0XkptuEVc/IWWw7Czr8OaTnHS?=
 =?us-ascii?Q?6i9Osi8WruvkSDx5hqiHBK6tAZ76bUYodISKaBECV9u388J0xYFLVXbCSvds?=
 =?us-ascii?Q?W/On6bcNITkVJb8MQB9ZP74YBYeN6Th0OJCy3islM9I0p2t194PYvXaKw3em?=
 =?us-ascii?Q?Awd2HYW1izKq8nitLNU7bwc2i5vr8YxWZsUZNyEU0ClhVQSM524Lo/wMOLOH?=
 =?us-ascii?Q?IZMi7VfNHE5jPzjSztiD5bQ2YC6uD3y1L1zGuQk11Q7vcw5krpG9iS0GMpd4?=
 =?us-ascii?Q?sdznY0ZIIYZK6fBGuGDK3CdDzr+dE/RyQlLquNCycymyqXldc9EQm+PJPHCV?=
 =?us-ascii?Q?VGFU39/29kvxGdIWnh2bqBz+LJMz2e+/afRGxo5+1c9zqVOQiGYVTmx15wat?=
 =?us-ascii?Q?i+v2EFX/rsXfwDR4YhB0uF4DehYeZDq6E6k14ooHi7cBPgLuEclVCnM80HOy?=
 =?us-ascii?Q?yPb9CrlzIPmaYWzVOP42m3faDHPMf8rVi9F3b13+O57MKq1dRJYKZcFyE8TK?=
 =?us-ascii?Q?AmX6Z4XJkq34Fl91W2VMe9yYY7o3WfAWlGRK2Nj3be5JJ+UQ31aD3uezwBBk?=
 =?us-ascii?Q?+JGPgpuMLXE2XMJMRHuxXN5RP10VJQ0ri+TTjeHH4HnCqXqYROD84nmXANMT?=
 =?us-ascii?Q?PK25cxIw2O98b867cCDqMuEDMJxcz/6HHTM+S494XJZ5NEf8l1ILj3mHiG+c?=
 =?us-ascii?Q?wPxH8YEiM7ZW/nSOk07vA/LqKbcUCmkm06b36dSFIa2qQo9S3A+lsHmRl4OT?=
 =?us-ascii?Q?lbNnLgDSEAE9yn62h/UaOTvys2ICuFSfbKiXtgcY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bLhrSWobFYLFuncJRgwhnG5WHd6VQnhmyMQ93LfPiRp4lhq8rxDA3pu5eqki5DRQMXkGZ2MkbzzgMr/NZ3cP6p03szsyTOvteRU7omsGyBMmltNM1hab1Neeg1LFe+kX/SX7mm/ko3paprAG6CJnIPsqXNi1n8DvERbCDT8ZdfxN2T4hiN0gM20717PeI7JTmCHKm20jedBOWR3Vbkwdq/481T9Bo/kyRpFYGn3jV0aDH9N6R/72Ew4FeALwdMaqR46i47Qw/f422UuQOkCORurov7XVfRYnO/1GtGSsqBdOWa0mUQuSej2P4osfbUoxiz3xFcHrL/6e5RWcDneMuUBPCB8EWsbriZwtBWHXrz2VgIpHsrEEN1CrKucmA6GyVJAAGxonLN8fzXFW/wVLpRrQadocoGM9ybKrRSd/R52IyEQW+NP4KuXaiNQUekuTkzegnXlZMjleVELD20qMQ3l1ANXRWYtCyuHy9lK0s2Nq0Ytw4e4zrHhhkAwrMJdjHk4U5qGj932+l+RH/8OATI9Mi37KYUZAOSFdFxJfcSIWVhu+AKhzczyJHMOYd33EodTZYNG3hcrmNdPjNYurAKXByXSU2MVppt62puHfo1w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cedb43e-aee8-408b-9565-08dc84c1cefe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:51.7156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB2vpl0/CyqgOOc8+QmvwR00bEr8we8V0dzxtn+/D2x3jtiLCj9xHHar7tNAHatW0if1kmJSS2jlwT1WJF+/mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-GUID: vxIlIItFodLIVMqBipVvk6I-l4WakFnu
X-Proofpoint-ORIG-GUID: vxIlIItFodLIVMqBipVvk6I-l4WakFnu

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 88 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 591f2fab..cb79e0a3 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -498,7 +498,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
 	const dt_uprobe_t	*upp = uprp->prv_data;
-	const list_probe_t	*pop;
+//	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 
 	dt_cg_tramp_prologue(pcb);
@@ -522,6 +522,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
+#if 0
 	/*
 	 * Generate a composite conditional clause:
 	 *
@@ -565,6 +566,91 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emitl(dlp, lbl_next,
 			   BPF_NOP());
 	}
+#else
+	dt_ident_t	*uprobes = dt_dlib_get_map(pcb->pcb_hdl, "uprobes");
+	list_clause_t	*cl;
+
+	assert(uprobes != NULL);
+
+	/*
+	 * Look up in the BPF uprobes map.  Space for the look-up key will be used
+	 * on the BPF stack at %r9-sizeof(uprobe_map_key_t).  The key comprises the
+	 * pid (in %r0) and the underlying-probe prid.
+	 */
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(uprobe_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)) /* or -sizeof(uprobe_map_key_t) + sizeof(pid_t) */, uprp->desc->id));
+	dt_cg_xsetx(dlp, uprobes, DT_LBL_NONE, BPF_REG_1, uprobes->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(uprobe_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
+
+	/* Read the PRID from the table lookup and store to mst->prid. */
+	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
+
+	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
+	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(uprobe_map_val_t, mask)));
+
+	/*
+	 * Now loop over clauses.
+	 *
+	 * How do we know which clauses are called by this underlying probe?
+	 * Each dt_probe_t has a "clauses" list, but that's built by
+	 *
+	 *     dt_program.c
+	 *         dtrace_program_exec()
+	 *             dtrace_stmt_iter(..., dt_prog_stmt, ...);
+	 *         dt_prog_stmt()
+	 *             dt_probe_iter(..., dt_stmt_probe, ...);
+	 *         dt_stmt_probe()
+	 *             dt_probe_add_clause(...);
+	 *
+	 * which is to say that the "clauses" list will be built for overlying
+	 * probes, while we are interested here in underlying probes.  Should
+	 * dt_probe_add_clause() also take some provider-specific action?
+	 *
+	 * For now, let's just look up the clause using what we know about
+	 * the clause numbering.
+	 */
+	/*
+	 * Hold the bit mask in %r6.
+	 */
+	for (cl = dt_list_next(&upp->clauses); cl != NULL; cl = dt_list_next(cl)) {
+		char		nm[32];       // FIXME hardwired size
+		dt_ident_t	*idp;
+		uint_t		lbl_next = dt_irlist_label(dlp);
+
+		sprintf(nm, "dt_clause_%d", cl->clause);
+		idp = dt_idhash_lookup(pcb->pcb_hdl->dt_bpfsyms, nm);       // FIXME what if idp is NULL?
+
+		/* Test the lowest bit. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
+		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_1, 0, lbl_next));
+
+		/*
+		 *      if (*dctx.act != act)   // ldw %r0, [%r9 + DCTX_ACT]
+		 *	      goto exit;      // ldw %r0, [%r0 + 0]
+		 *			      // jne %r0, act, lbl_exit
+		 */
+		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_9, DCTX_ACT));
+		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_0, 0));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, DT_ACTIVITY_ACTIVE, lbl_exit));
+
+		/* dctx.mst->scratch_top = 8 */
+		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_SCRATCH_TOP, 8));
+
+		/* Call clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
+		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
+
+		/* Finished this clause. */
+		emitl(dlp, lbl_next,
+			   BPF_NOP());
+		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
+	}
+#endif
 
 	dt_cg_tramp_return(pcb);
 
-- 
2.18.4

