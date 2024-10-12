Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7131799F
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 03:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728703777; cv=fail; b=BeVQsPElR4NWMs385ccoa8Ft/VUj3FkWjiurHteU3LaSLhX0yXRbpqWQAFajTcHE35Q2cOJC8e8TBiMWtTiQj1JGrh6AEX2sLit6npyaSsZGLC3/6PZvChcX0j3qCO6bsnoZV1wra6bcBjug7y5+YnJjIXzp/RD92Pr+4C3UNZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728703777; c=relaxed/simple;
	bh=Y19sJc2v5tHCVWloyUHk5y/QvzJxV7s8PGXk9J6dIhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Il1r3v/FhYmUTNboI9rQC+za4zYDVaW1uEE0yTLQLx94Rg6xDttgDduGXjNNRC3UkESU5GPGjidop1fJH44586hMRug5xLcek8NXM7Wkoig7p5cGoisfJfy6QmpnUT8oqZdHp9itXM8FzWKex27dbziOn/Br06aJV9tbDFyMWII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eST2KfFh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yjWJfTyc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eST2KfFh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yjWJfTyc"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C3P2Wb029007;
	Sat, 12 Oct 2024 03:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=sDuKvKLWPSsxzAbd8R
	ARD0g5vqtHUQhvVEUe3sShdbA=; b=eST2KfFh2H2pi+ZGmY+n69P8sEH1HWb97B
	Y8rRal7RAB9EvXkmWSslKJ08myziFSoXfASN1pbttEwlYxAulJMFRBTHrU6zMcnY
	5Mob0AUHdryhUTmExRTOWUA7szJLbvmuocRdQsmiFwqdvXdsu9wg5mpZ4/jNHjmf
	JlXr6Z2bZjPi7KjvVbcS8wFgjoqOTBmQxYXfL9GJ7gGCW/myIarL3tiDXfTtrYA5
	EbiRhPx8hSwzB94TperclHRbObfPP4BKiqjBke1e31+ZjVgVP311ItvXo2BQYox2
	gQ5lcKB/Q0O1PecImmi6/+T3gOBEJPLlDCXtCj8OxjR2pLaDTSBQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h5c8046-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:29:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1Xjju036084;
	Sat, 12 Oct 2024 03:29:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjahm5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:29:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYu7tzauc1KXTcPF/dvAEa4VY92zoRYMkYzsHZWPeHR9d3WqD3RS0K+2pp+CoQVe6dQ2ixu8gI4quBGjp0osPIEy3RQPsaEaqIgrASf5LzAdxY+K7NPZQCsM496csFb6+ugDk4d74Wh03YHLKJJKW/v5nIkL5DtQCoDa11bnrAntYisL9oKYvKCx9Cb7HQanzXCsMvLIbOECJL5a8kAbNPSEjuJKCZJ88N8zjCRMmoWthCnnxUsmy9mpILPJw9YIFCIUgraQwtxrcbr17hWMdjJjGG8b4sL+Ehf/OBsxualMy1GVZ0uJdMWD26QM/zkKAlXjWRwVlRviHJaKis2zhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDuKvKLWPSsxzAbd8RARD0g5vqtHUQhvVEUe3sShdbA=;
 b=Ikx6bRxYi/Ci0/HzoCzwCxYb5VzEUPEA5Xfq+OJCq8g/D4n/TkX3PItDDOGpqiPPHEucNeQfqIBEqyjMhadL65F3Sd56Yl5SHj8wL5b2X/cVr9V4sn+ZdJxyaeTcfms12CdpawPbUowC44Yq695Nv4/8II0/+bg7zOUfMBgFDHCKnPCD5A/7hr1ipx9Z9pQuT/tx89PJpA77FTdtucZ0Lw0H3cepEOw0c351N85mrvA9Dg6SGQRgOn01sKYJwAjc7ZnEYM66iIPzBE0Yu1yozTbbEbNvBCw8Ye8bCCRvfJeH8G0ydEjFvIHP2Q0ywGJTqzVVCYb65jqhmjfNfulbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDuKvKLWPSsxzAbd8RARD0g5vqtHUQhvVEUe3sShdbA=;
 b=yjWJfTycGfpFUNFdxg/fiBub1KbQhcmnAp2ZqKyADvUoWHFl5kLU+1ixPbFEJdbyV7kegt1frJW3mxjy5ufcn/OOXyMTVrakTnMwH6EFBJuCeue8QjTL5cg/+/pyma1gLlwjIad8+RMci7fR4GI6T5V/dNWGK75BKJU4pC5M9LA=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 03:29:20 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 03:29:20 +0000
Date: Fri, 11 Oct 2024 23:29:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 2/3] test: fix exit code typo in tst.core.sh
Message-ID: <ZwntDcu8gYD1HtYb@oracle.com>
References: <cover.1724112622.git.sam@gentoo.org>
 <158b036865f5b67c25de44972fcf74b2ba8f2f6d.1724112622.git.sam@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158b036865f5b67c25de44972fcf74b2ba8f2f6d.1724112622.git.sam@gentoo.org>
X-ClientProxiedBy: SJ0PR13CA0186.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::11) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: bc39e2a8-ff07-4bfe-6f07-08dcea6e0f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9aWbX47PSeNcdCXo6TZh6KcLeKZyMVcbzHBU1ajW0Qfm/MGpCjv6RbUijk40?=
 =?us-ascii?Q?7aHJ5to8uOHHUGOkOVfJtXSza7qYZXmTzkN1VGnsjy2P10P4B8VBD16F+q7e?=
 =?us-ascii?Q?qe7uY6GP0K/NWsDo3w6g1K6NcNvi2IUCNMad2vcZsi4fEly1sE9p6PAV51IU?=
 =?us-ascii?Q?kpVsq5XPExe3yWFzMfG6bUzVKX5xyGUC3k1GJgFqNlpFdbOVrwQTTRE4mp5p?=
 =?us-ascii?Q?9n3aYjPMsG0qptCZE0BlJexRzIZ5dPQjDk/MvDEOJNk0DVSXM+XknDqITu7x?=
 =?us-ascii?Q?kIOfYgpf5/3MQ8yRZ5hwwAlNC9KJDbyU6NL9Tz4zabSoO0yZh2Ge9hJsm8qo?=
 =?us-ascii?Q?TaHAqC0CZQkf2ypZs1JcCCP3C4epVGXBUTLiJWWB0b4W4CCkctc2rOXyTWtB?=
 =?us-ascii?Q?55vpfbiUgCD5LmSDciYtMxWkGV9WOV/WtmP1/0MzfOaXXY4rMB6EwHvOBCN7?=
 =?us-ascii?Q?gGMSvFPNXh3c5K6T5VvOnZJLI3zVNrFDCp+Cojc5XniK1U14EESUMHJA3zXH?=
 =?us-ascii?Q?b0txqIzxtFES5vyP8SOqSmGu4zkuz1HzUo79dThfDXgAqZIsCHA4JWKGMm7Z?=
 =?us-ascii?Q?tvicAvjTmynCRTtQNegm1aS/b9ipUMzX8d4Q7ANpJcanKQweacsEz10T5laE?=
 =?us-ascii?Q?6huO5FjLsMzRghsHd3+F5HwJW18gsD2PL+eB2rHUoFYWrn4wMgVpdo66cVrv?=
 =?us-ascii?Q?l67mYdewQdsI1sBe5PhUYZ60W8JpLg6PcG1YnKDxWcgZK4JEYhFfEOCromCl?=
 =?us-ascii?Q?efdPIabYiAP9UkxVKpPqzRpzDsrlUOsyJgN2DsPzEqNplKkkLVwlu6pBJSwZ?=
 =?us-ascii?Q?c4aFeFUCzaTj4SyebIxAKxPbhwSuUr11sAZ7tWcgj2iVct0eKChHNeE+PSZk?=
 =?us-ascii?Q?RNBT51rVohYzjd9/A1WEtaOhihjTm30ErMOD8k4K5NA2aiv/C0/PpkVWFHNU?=
 =?us-ascii?Q?9iCDX90UgLSskjplqug8pUrlzgi7JGZ/ZWZxs7bc1f3bzxEDHebdDIKCSV7q?=
 =?us-ascii?Q?C1UEIHBb0q5ez3U11TWoxxdRRgZRnmgK87tDL9VcKH12JOAdLbghk3iqwrrb?=
 =?us-ascii?Q?7gcV+9PfupoaZs5zZtpW32Ih6w/9vM/P7LlqWdWm5gJ1c/FckiQRNTjpLLoD?=
 =?us-ascii?Q?o132Ckk/1GBB2rEpgZfvUq4CDFopJ2qDQ+NeoPXH32rsCInvO4Qb3emKP59v?=
 =?us-ascii?Q?qxIzjsKxaHCLgDGzQnzteVw6Ezbh63jNqwR/AeYesuuGmk7emi7AYZ8CY+Jp?=
 =?us-ascii?Q?q7sfu+zL5etLN1TYEY3Uz/7BXXNZft3PqJ5MXNg7bA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yy8halMGg2xyASJ8XpDLbfk2vbKQa18rQOzNCxQ3u7y8MC2i9oRqNrkZOlhd?=
 =?us-ascii?Q?JxAfPbyX0WEJzxsxrPFP10QyDrs0AscSVv5+NVy0W8M1vkbUQAlNjOQNB+UV?=
 =?us-ascii?Q?/CXfE855DDsJEwLHmEd1DioNyx2rWV+jsqT1h+mcypcmcjqeajWOl7Y1z63H?=
 =?us-ascii?Q?kEvzBsDiZ3LqGtUzRFJbHJg9O01uogP//Z23JCcIsFdSkghh4hf3iukx3YMU?=
 =?us-ascii?Q?75/7MjxYrqrCFXAu5IeEghKq/uBbS5/wlLr0E90YjNMNpQyT7kL6oRtCCKbl?=
 =?us-ascii?Q?Nl8yaPwF8cToDR+/7u/2oNaIhMmBv8hS1XM5qWYKJ89bJbKtqqS96iNE1BaG?=
 =?us-ascii?Q?d4qBhliI73qqZT+gyob0PilBElfq6Bx4guP513rltlUFm/nR/O+aOI0xIZ5Z?=
 =?us-ascii?Q?JTA95+r1NJuenEnYMvUI67MNRGq8+yZZQGvXaQ6ayMzmshbVRfNzQz3lYlgO?=
 =?us-ascii?Q?Flu2bG+5MlP/RQ3lxiDHynAAAGY/+DiV5brrRUqc9+BGtPgFZE1fu4c3fzlq?=
 =?us-ascii?Q?Q8DzErwgcmFr2E7K0Rd0ncJjlDwnisSwlhgd5e9RNacAgBFLAWLnG5n4omai?=
 =?us-ascii?Q?FTNJ3xugddEvqOtlvwriANKKEBrBxM2YShENB6zvOmk50L4+kfE3+3Kj3b4C?=
 =?us-ascii?Q?vJdPQ300PcGY//qWg6WM6co0PT9E779vMr9f0J9AR+H6cN0vcYwNMGAFHsiy?=
 =?us-ascii?Q?qVXZt19sztBBjmx9CYsVBDNeYAnMn8wbxXq+rXkQ0j8961OlFEvZkdMDcflC?=
 =?us-ascii?Q?lRHScWutqiPziadWwGBn0BMXWXgKiGuupE/UGckkKH05gy85vrE7XJuINlXk?=
 =?us-ascii?Q?C59YKUEGvxq3HuesjxcWgDhBd7tBhlOyHluwVGb412UlgOHcdyQXmTF9YrTg?=
 =?us-ascii?Q?7ZuzyvihNlW5xjELh51ZwzOtGdPxxOkCzBYH9Rwvb3HeniMXGx9x9wA+5SVL?=
 =?us-ascii?Q?jiIITtcU1hnWY9SnsmP8uwwBkUX55Bfop0JZn7E+NtYIjpmbJSIYJ1TgXoaP?=
 =?us-ascii?Q?WZw4hNQ5EFLFwohxaDxlTHPuFNLfL1NXzKalCllZvUMT9Jl+h1hUruukYhRi?=
 =?us-ascii?Q?k1ufJLtousH57dKTBX4eAWl+fJUlM6Wi0QGIAw42Ade/IX9BD2YlVEwlz1U3?=
 =?us-ascii?Q?KmLJEbpiJhc4G5fraQTCTtqdeMdOeypcZZXMxYPzyz84a2l2Nc/KnO9rXWNN?=
 =?us-ascii?Q?0ti4M6wK5IoEd70Rwqo/v9yDzuhUwU6nDmX5MDn5PbHWS02k98BkQmaCdS0/?=
 =?us-ascii?Q?y+d7oERAiY9Cx9GFHu5QTw75L4l/zFoMz5bG9q8oJSj+XYiH8gCwhp/8n/KC?=
 =?us-ascii?Q?MwC3F+uV+yZNOy93xh/IY5DfISdC8DPKUu03P5UkzDZI9r4PLhFyJFR4Yih+?=
 =?us-ascii?Q?/UyQiRdXanQC8P/4t1YZiSJIyAVvyaJKten+ybe41zsLqmqwA8RgfqniaKgz?=
 =?us-ascii?Q?ReRKIwnXjiE6WehTNf5sKBSoyIDTjm+OrgWB1GWpZMuumG6hM0VsMB1JELJ+?=
 =?us-ascii?Q?6V7jHG6CVuPhy1hxo/3AgWG+knbj7IlzCl94dMxOyzuGZp6a9shni5YarQ7v?=
 =?us-ascii?Q?sszZ6l6Cr/LSqn6ssGptS6JpoFtrut7F3RDeE3amhn/9hycNyN0cI6NECAJP?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cwp3i0w/ouA2XPDCMf8E6rpW5AqfyIKmOEEMbAUZ6GOdqEgnwHvzWVUmEEdmA7AKTmTY12Bf0ANDNfVtYlXr4Z1zzzf6Plt3ZBg2/UlQXcMCrRM/0+vCEPzilesNtEoaYFPstwCQ9ApUnfNH7CP/qp3D+tAnHCw2IjoIRrrWnuJfT3XEr1ynpj6katv5Zw1hvMELIgsNh28vc+dvWiiTe6v4asxwD0j06lXjdL9xjqejTcjHlrha2BRlJnXKKttLx5yn/XPwmt99YoP/hnvEOhMizffDuNd8vIbVmgqJJOOf77n/UEscvDFvjGva5LHPY9zQmRjITEKAelzZGFZh9kHjJOwgZr5CCSZbOmQjCq8IEo12C2t8b9aff8ys2ckkY+TJ46/c7qXahfzVqCRd2OFhi7rn3wf94G5omtgWn7Cnp0ahcccy3dJ10q9QvX+ENgIpf3+I8DpxwVFvTFbuJMj18YcTuGtCSJdbN251JzyhxywovFYxStBEDkJGTEUw7efuJBDQbJgw+satNTsDe0GdlustixVsurh2CUunjrN9CclF5f6oiDFT2JKjw/1GrGWhj4zuUFoMREGWtTf+OB7AUBG7+rBSPjEwXSaVRm0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc39e2a8-ff07-4bfe-6f07-08dcea6e0f55
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 03:29:20.5537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXysk3FC8uKikWUUgcZlOsKYQdMOA8UgZ/CqWhR8HKfmABcoh5EjcZmrOFye8rYmOG9rg7xAHpNbREMHwulCi9tJi/OEU2IwlgpjilcaqRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410120023
X-Proofpoint-ORIG-GUID: ctVKp5066vKkdO3P43AGYqBeJU5IC1JK
X-Proofpoint-GUID: ctVKp5066vKkdO3P43AGYqBeJU5IC1JK

On Tue, Aug 20, 2024 at 01:10:21AM +0100, Sam James wrote:
> $rcc is not set, but $rc is. Use that.

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... and committed with Signed-off-by added.

> ---
>  test/unittest/options/tst.core.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/options/tst.core.sh b/test/unittest/options/tst.core.sh
> index 48a58508..18727c6a 100755
> --- a/test/unittest/options/tst.core.sh
> +++ b/test/unittest/options/tst.core.sh
> @@ -16,4 +16,4 @@ file core | tee /dev/stderr | \
>  rc=$?
>  rm -f core
>  
> -exit $rcc
> +exit $rc
> -- 
> 2.46.0
> 
