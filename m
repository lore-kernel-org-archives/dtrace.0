Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9AE1922EF
	for <dtrace@lists.linux.dev>; Fri,  7 Mar 2025 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741358593; cv=fail; b=nEN9SNroa9mHQCN/Pphl2PdihG/UTqohQAEddPRS+2AJM4YapxU5MqmdjX54ffw1DhoyN4uf2vKzIjzW04KwaMP/669M6UmTbkN13voxl+1Cc25Felv8jqAeD4LKViWPKKRcswpGaZ9Lx0GwhiNOUrJShPpXYKqcwEk2EoOFjgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741358593; c=relaxed/simple;
	bh=wy/oQ0L/PuOoDYPtQdUx3IfFXBdipHERENHvv/LBN8w=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lRLKtcfJJvm7fpMm2vvwWYh4iGCO4odv+P0tlWiBaOWFcTAaXPGtGl4U5u519F/Esb2jH9tPWAFo3dzWmfc6xkKwXYhmq5br0S2URX+l1X+jMAtm5uk27cdU2kg4WUcC1rlqgpJG2rmS46ZymVDqgLsP6mXQ/OAiB7BhPKrvOBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gNAMwSfh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kbjUSDZx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gNAMwSfh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kbjUSDZx"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527EOG69027818
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 14:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=/azwf+voOZIrvETr
	Yh6chVrrNnrGTKK0L7OSP2wV/w4=; b=gNAMwSfhi2WT/+nG1xFkeeD8y3K0JGEn
	K0YkL19JpRB7CFbhgORBgUrHfwDo2f2Bosl5KvCNcqmnFW43ubySTR6tbE1cFo+W
	0tjR0VOIfNI98WZl01ZzL/Mlt+VveQPaHJ+bnJIFDQN6bf/fIABiyVws3cNX7TiQ
	UiGH40w/5Ly0s2C2mTW8aWZwtuORzcpl2Rs3Is8yM39VDYWvuzdKfZ+uyiCPfsSJ
	Vswm4tJNOGytwK1Ffxvc3KQPz7g5vjAGfQSgeD8KX8JAzleSpWvqkzWoXEXZp6sB
	HcaoUEBjfZ5mi4k5eDlwJoA6JPdWqIx5lkHNy11VsFL42KNULHvqEg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u824ffq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 14:43:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527DffRV003144
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 14:43:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 453rpdm0y1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 14:43:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVgK2CiLO2MMBVJjlzQzDi0wdEKSRuB+0wNhnf1PJom6By4ChiAY+4AUNS5YdIHK2qFQeCPrVkOPJfzu/a73AJdv4Ni44n4Mh0DdPQyShgn9uLCUvoG25df53n+6O1eznnuQeVv1l7MzRCDM8BhpCdE3d2Gf6cwvoU3kuBeAvzvfwiQim9Jh5oVMMRhS5fwbkiak+M86rUqGCwNEByngG8mEh9T4slC4ZXMQAcxIGRei/EzvTPMZWkUTTV7BavoWKKWUea7j63bhJbGLGatL1Wzd9pXSW9UnbtJj8Y9JDaUfSa58M688bYieYnE4x0PTuSg6Sg72w56FkS2IdbgFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/azwf+voOZIrvETrYh6chVrrNnrGTKK0L7OSP2wV/w4=;
 b=wDQZ1vRRtPgBAtOcU3fKpqNyRAcu16RUAssrHIADsh44eOegLbxF71WiKdm59yszgCc1jQTRtvJPAtHNRuK7GGQ3LAHfLN+Cg6/iX6QFRUgpq2EJOWYXfke0PYYpWJjdzJjpoKsBHWJHDe+y1/XTz5LGuXsrTz6i266EqYB9sJoJNoCxmZogylyDa1Sa7Npf0C4SVpik4/7I9Ya0GrLW+n9ulihqvBJezvc89g6Dvp4y178ZgfSVHUJdjXHN3ZceEu/byyadCAVZlGMRUZbdNNjs+vHJso7lZ9NsZtY+GlPZ02uIfkHHlKmRcKNon3RRPCJHD4tIJ0/tMKdUson1ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/azwf+voOZIrvETrYh6chVrrNnrGTKK0L7OSP2wV/w4=;
 b=kbjUSDZxGW15IughRbA0mB9YrMnihPzWoxoptZpNa17M49G5tJTkzNxs2SSZ1quKQ61OPHObBLn9bkMEVp5HgkDNsAnyZEloRaYvei/0jBAE2sIK3i3rfykZYPUpXiF913MvwpS5HzloUTCg0jcnveT+GgEoWLlc+//KpYPcd3k=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by PH7PR10MB6356.namprd10.prod.outlook.com (2603:10b6:510:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Fri, 7 Mar
 2025 14:43:05 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 14:43:05 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] dt_pid: pid grabs should be shortlived
Date: Fri,  7 Mar 2025 14:43:00 +0000
Message-ID: <20250307144300.230034-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.48.1.283.g18c60a128c
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0422.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::26) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|PH7PR10MB6356:EE_
X-MS-Office365-Filtering-Correlation-Id: 83279d3b-6364-4985-3124-08dd5d865ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nlkf7qvwxAa5D6ExR0mcA9xwoEL2Scd/mzc+tXzBDqfMh3szV5nNno12JDJ7?=
 =?us-ascii?Q?GuVSOvywXLzzcXRtLXAZL1mCHf1k3WY8hoJ1kROxSSvxRoRo1c4jHSxg3xDW?=
 =?us-ascii?Q?OjonNHaUc0/CG9octvB8aFkNmMaouxbvuIogPLSTh8ae45fOL1J+N8u/BfFQ?=
 =?us-ascii?Q?BG7aqjxUPlwrQ5/yPyVRTxg9Pt+3XRDHUQRqKZ7u3bHb+WV02LoOuRySNIl+?=
 =?us-ascii?Q?0eCj50xS47LGlLo9kAvs8b5Y951DeF8LdlOeBv5V68F1cWlRPV1zla3j7ci6?=
 =?us-ascii?Q?CFa1WoRCeEiBbGAG0a5KFA0qmCC6TbKhrSJSLp9ZEMyecRSfnCg3hAfRLIdq?=
 =?us-ascii?Q?rvSi7ucg1ab8M5v6cIfT8WLSAxK+PIDI8doL3wtXb0TxuQdtUabK2dfnb+67?=
 =?us-ascii?Q?xIB3sihoTpqMuz45KQIeIq/FUEYtgZQkCM0Bs2WZF5u+Ti+qohTqpE8ho4fg?=
 =?us-ascii?Q?QL5WnSoJq/0rcaV1v57Lyo6T6uipzsKamajz2HScq8KURL5oG+6LJkU52nGV?=
 =?us-ascii?Q?En0dXJ4I3U+8BFsmcgFu4OFjCNh2LwwlRkg2D5N93nD/NoJHN6hGM4oRsC8t?=
 =?us-ascii?Q?AZ9G3b5z2sqEoTD/ho2iGsqdb1zH75lSDz8ijmu70IbonIa+igBAKkdchtGh?=
 =?us-ascii?Q?CP67ObavknsHD/XNTiXywDUsLC+E/7VmluAFtOT4yy+07BXIaknn9NaMPAwq?=
 =?us-ascii?Q?mNE6ZrBOGaiJqxnXc/gv8gHeqbIuq8SJbgh7N1ZYZg0Oifqd0hjm+KZcSrB4?=
 =?us-ascii?Q?PUx9N9ilMawnj2Wr3u/Jp2tXnEBUMZSXwtRChw4evOCHzQW3fJvOlbQpIOKu?=
 =?us-ascii?Q?O6vh1i955Tbn2lC56QCu32EbbzxLVuImVwiiiFoSw+4YKsZkqZRVeNLALdPA?=
 =?us-ascii?Q?mXuK/LDQrWkckSR9e7JUv0e9tSLj/93vwMwBDqTx7tZ3dGvmZOYEVw9LV3WK?=
 =?us-ascii?Q?cDwxsEHdBIbX5el9Fd2q0jErAL9kq5A69EiSTj7Pmi70Mb2ySOU93AuMuls6?=
 =?us-ascii?Q?NrfZ53zcLqoRf6Su6vWYaskvTnKennK3IPCbY/eq0eF0tu1RfiZ1QaxKXe3S?=
 =?us-ascii?Q?hCR83aEJUnxg7iqmUT7uu117DLHVLwv8igqWpIEK0vY883RNI5DNYYNhM1ZC?=
 =?us-ascii?Q?9TRdfeERE9NIjZm7ywEEz5G/HsECEoNyCFZdvfDxH7AUspPcXmSStZBZLSpI?=
 =?us-ascii?Q?6+vDI/S0g7Y8sUP+UUBoSrYBIdgIzNBs3+8Pv7gZUQ2BW4kVRqGaKfXJAmRc?=
 =?us-ascii?Q?V0RvX9Kh4URp+bTvpBVink1wSfMjctaZ6Yf4GTUy50jlIFU5/IvDdJ8N0Znf?=
 =?us-ascii?Q?SqJ02aWgjpi4fLuYS9lOpq+3Y8hDmEXzNa8kOQdDXM2XacE6lW4xzk3ZcM7L?=
 =?us-ascii?Q?kU6EoVWMZUgD6KiCyyQySMp5zpOV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kgoLo0cauF4GPk5Cfq3JELnxNfE5supTpHDyh59OZ9HME9kMfYjRpn4km9kn?=
 =?us-ascii?Q?XnQ1+l/8dxi0tBcAwiQCax/UXpkt/+E5gnVoaXaD0/jsIPXRAhlUZtoR+oPJ?=
 =?us-ascii?Q?c3ntIJkWHm0fhuILSV1dDt0FKHaIxSlrbBwdSA9tiEAe5U7fRyu7YGYGU4yM?=
 =?us-ascii?Q?IL894Z80rltqjuGisnfR7M6ikHirV5CAX8qtPcsqzafzuu7BNaKQwrAZIRQZ?=
 =?us-ascii?Q?ftsuzyopdfrVDPgrvIUCHOlmQw2FxE3Ml/oep7UCMmLGkgo2HIGqN0x9j7Hn?=
 =?us-ascii?Q?w+VhrMDSu/4qkDM3XgLbVDrP1LnIXTrMOw0bSvMYVdys1dhKEIpDyXSkVhBw?=
 =?us-ascii?Q?mD09uZ32pTeLvZa1rdt3jTuve6lUyRRxEydMSYZX2JHz/6VdyF2EsVQBioxG?=
 =?us-ascii?Q?KkCJe2arG5U9S6kYiC7TurRx6jvjytbef9R32Sl/vTLncCxBLAS8cOahWBFh?=
 =?us-ascii?Q?AoNNd/AI+pvwfUXQovYyP5yhnkAyYI2I5owlm9VnwTnDNSmRlmmXeXBjQonv?=
 =?us-ascii?Q?mOHqQy0yLHBXcGxRDlVcENVCfcrAQ7MgUdNDji6eOL+qAEYm1ep7RfDw4Coa?=
 =?us-ascii?Q?NCc3yQ0xgsqES5ccetwI/iA4ITWln0BE4XQ8NiLZpfCRL64KEX+snSf2UDbe?=
 =?us-ascii?Q?KDVSHL4+McAjZgguEbL2qM2mrGGRKmEdBOegrHMgvr+3ct8lHinGgiOQA0jw?=
 =?us-ascii?Q?LAUgX+CGTwye6c3y0/qz4J9OtQ3Qg8c8RVyliJObwiExGIi8rEvtBqm5NRuK?=
 =?us-ascii?Q?kG6ILnwApcUYjpGOlztVb9gBf2SRiTztQLuVkt9KJzvb6vYEn/NzjFIt9qYB?=
 =?us-ascii?Q?yDoNI4LsDsdgJHuG+QuCg8eNPjilgtjD3fdZUDcUpoVnO68vFpWYJTFeA0C7?=
 =?us-ascii?Q?IOTa5KR0McepYtfH0F+YXJo51lkqoQAn9i+4I149wh7YA1jKi1WpVgWEowPh?=
 =?us-ascii?Q?Z1uK4VGzsFda6GiwbQZIAFCNsAH1HKr5w1wgQ6wWGMUhA8honwL6mntyKrJR?=
 =?us-ascii?Q?kKKqntrisnlvAvq7gKI5G01jQbicpzdTS4QpvJzHRG2BHBxnGO9DCOvVU6Y4?=
 =?us-ascii?Q?wwZdbmGRc2ARPWjfJgAxk+WlniYtv4jRFcnJLggL9wWSHCjwEZ51Rubtx9qX?=
 =?us-ascii?Q?TnT+NuU2JkoZxL28no4jWDI8JRKV6oBcIO6xMyHkp0SwXho7ppehoC+JF2hU?=
 =?us-ascii?Q?TjYuV0YiTgaWYp6dqfSzOVvpeUpYnzvfXsHvZBF6IFAooj7NZSQliaL9eWb/?=
 =?us-ascii?Q?uTShj3P8gAJWH072D2qsSdwYKFj0/SoR+8TvHo1XfhBrjmhBu5cCw+rWIok8?=
 =?us-ascii?Q?RhlVMjwVOjco7UReLsiMcK1TPyFjBwgqAIFTVcKoIivoWLmXpTIsatF+ZXeR?=
 =?us-ascii?Q?S4+mun5yRPXubs1aXE2hE/8xfzzazHNuA+sFw7qF2AbcdvbK0f7EixUrYEr3?=
 =?us-ascii?Q?FTtUckGgxPg0WQ0BqIoXSW3xdtaZn+9mla8+M4jGtxiB1y//IPlMVDwAWP3i?=
 =?us-ascii?Q?Vls+/8o7KFng3O7oioKGKI75R4jwj4EQNCzzcnZWrL5rk5/p8aRDk/LYvJ2Z?=
 =?us-ascii?Q?ntVOjC/OMhO3b0fWt3FEcx7FaveVAswOdYkwM9VphN8Ki3GiaKOGypfo0iZH?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eGmpIKklcEognWQv5c2OR2Wl6tFZUReAfrVFxL8WeR42+XqPdb8NuEWOpvam1876+fED/otoF9HgsStPztbIZqxR1gllV2WRUkqS37FBqLGBMs5/YVgtevBuhhx8LAKJo1LuRLDQiJ3VI81qDZf9hi6An1aYdKVILqKlXkIEaFQCXdlAWiI+NdHFpWZ3zLjC4J8pT8ged0WzNJQxCOQLC6ndvLjbADKBm1IIz6LzmBIlyfWpRlcK0aoxRJq4WBOmioh3o8AM/QoWHivL8PMlMfvF8oizktLCl9MSfjSSgb2n9hTsZAvCpYipVqVdZY5gd8RRsYACjHg9X+H4r7EPxcALHc7EJ0ddqW3Y4T1ybYZyKvMUJ9bEd1eO6PxoS452XACEQkYgmuKZm8jqGXgZSDQnMYsdR2yNuDHvBLxleKNIYmVZFncGTuCitK+5WZIFt+6jilKROhm5rp2U+LLaeRTQfIJXnF1O76g7oMO6ZzFi1sCeoc5WP17iF2ZelIIX4N3P+jl0FpWLXM/6e0Ovdp0aaSZ0jENgimtmw2RnUjv2Chr59EO4qOprSOZgNkAFm34rqohKMQDyT0D5CmB0D5y6TYSvTA9x8nOTRF/ruq0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83279d3b-6364-4985-3124-08dd5d865ea9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 14:43:05.2566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3P8e82Yz5EERsUpRaEU9UUo8g3HX9XJKk+3I6B8WNVMKo3HrRitMF+arxuTbKPAG4ysq7UP93/I+8+xe39wcxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6356
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070108
X-Proofpoint-GUID: FIOsqGlKNRdl6NMXMn7znU-DlCqgga9W
X-Proofpoint-ORIG-GUID: FIOsqGlKNRdl6NMXMn7znU-DlCqgga9W

If we use long-lived grabs for this, we are requiring that the process is
ptraceable, and thus preventing pid tracing of system daemons, init,
processes already being debugged or traced by others, etc.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_pid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 76608f6904fee..4135c3ea656ec 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1243,7 +1243,8 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
 		return 0;
 
 	/* Grab the process. */
-	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
+	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING
+		    | DTRACE_PROC_SHORTLIVED) < 0) {
 		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 		    "failed to grab process %d", (int)pid);
 		return -1;

base-commit: 39a5e0a8866b38679619fa357bb3082bc245aada
-- 
2.48.1.283.g18c60a128c

