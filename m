Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF49816F8EF
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 05:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728452748; cv=fail; b=HGG/s7RbwRAQguaDzz01P0gU4BCAtbarVqnrESd5eZ4oIETHXJMqPTHIDdGojIDGRXTYcDK80MUP+4oKa15vjTj/0IwnfDVI7nZ1jGJiDc6q0bmxZm0UCp+JbNuwE9vEbUJyC1p9rkEy8b+3gdahfxCmcp+XIhEHyAHN1L0W5+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728452748; c=relaxed/simple;
	bh=1ec8l9Rlp+5cig2uC1JkQpeFAlVGhrMeBiN70jSWrjY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nvOQF1bhKaF3WOg10jQTTuJK9gu+fWBx1JeXXTW4a5/eOM0N6WgKhexV54YEcEvjqQLZlIl5MqLduMXVen2DtbhfXbidobmSIxdu0I6d1UnYB55WHZQ0CsIzxWzQVNKYE+A4P7eNyjc5A+7Vb0s+VQus5al946nc3vXLK50c0A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UB9IM6TW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Tv4G6brL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UB9IM6TW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Tv4G6brL"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4991thHg009961
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 05:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=r1cN7KF6rw3EKx02L7k8oiHyA4Oh6UoUwfTQ0chlG90=; b=
	UB9IM6TWeYAbFIwmc48dYbJs4NAtJ8bP/j/OW/jJlsg6/9qliAnFkijHPU/l8eeX
	5UoD+zyZ5mE+Vh5hpW2SZqh/UopAhLH0aOxpHP4et6O9lDOjDfwmoeN4l21WGR3S
	2NsZ1W5qj0dDmqe1MVNsGQZ0pT/jNI/FNt4U0ivYfzR85RhaCOiCnX3s14eFfjgL
	stZAOIRnxFYWNgIf0LswJoCW51CEap6o03wA+gJyDgPa2ibvQIGGQtD/BaS4w7qm
	o5/gWdqeaL0x67liaUAU6ArVUJ/Pbq6N1oYNp381qrOtkkmjJ+EYRESXMF0MPCpF
	v9IGTr71dz+wV6hsCXTcLg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42302pf86h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 05:45:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49935vsA031060
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 05:45:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw84m0y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 05:45:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5a9AOzcDkxFHahPG4YZB5U8iDgo1AyAvE56TQdRMnjsuXyfbtMCXMsDFDLl+r85gzLx/5f5sMoSDTZ8QAMxXDHqMcOSYZWuBQhfJQguhs9oSAnkaNQbJyDqjtcRDrBykoxVIewQiIuQoGeJabFqyYCg69xqnsK8UwuCQfGVOHFxJtDg6acM0WEVLyiRQ+oQ8oEC3DKkvdb7bDwkFOslGzVE2v2oOINEG+NAobkMvPa4yfC1aD9FLPaShJISKf2/sIJxmphUPQ6eYtJRKBz24nQi3Qn2e3OrMuB1YThqr/R/G8yAOsmiG23Zec5bxtgSPWBiXxOdoBQh4YZVluHIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1cN7KF6rw3EKx02L7k8oiHyA4Oh6UoUwfTQ0chlG90=;
 b=WJSKa+evmU6mXyOLwnNx0KuIg/HRQbU88h/+uLFe0nGIvqCpDZEB84HuEkmAygbCok8GAOvUxAfnCF79QhqjVZ1cUSP5220BYw8mFjmPvysoNoEMUOXxcdrSUycvzEq2ssX6tixKCvsYxcbCcBOP/cw0HarNfZcZNo+2Q5BO+JtymoXo9cyFrOaDz3uMjpIGms2tJXXRVAO5R55iOu4bnSbK79fVDVDO2CcSYNl7z2Q5fKG740n6bnJvKunhIzHVzHKOojw4MOveLasgUpf0Ouih0D3j1DFEaXPjefu8l/Hbh3x6mP+o/k3S3s9bpiOMl7mgd83gkVspKhDUJ0bLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1cN7KF6rw3EKx02L7k8oiHyA4Oh6UoUwfTQ0chlG90=;
 b=Tv4G6brLkaI5sAnUZHNmD2Zi+g8EFp6cTybwBSFqeNXa7aeEl/FOQPH9Mqnlka18uaIyuEYzP4MY0SyHDbj49ShjJbIMAkGFo6miaCxSwZOnnXN7jksv26HoeocE6oCH1AeoR3gIHLABEQsyQe3SbDfi9KpCZcI5u4yABKdQ2EE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA0PR10MB7136.namprd10.prod.outlook.com (2603:10b6:208:409::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 05:45:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 05:45:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v5 07/19] Create the BPF usdt_names and usdt_prids maps
Date: Wed,  9 Oct 2024 01:45:34 -0400
Message-Id: <20241009054535.28199-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0648.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA0PR10MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a95410a-1023-4b51-7f5d-08dce8259b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BbyVMhNsieEb+lCQ5Luo8VN3LPE+2VAAAAGbZj17ugvK6iVtRnXCetVE1i3c?=
 =?us-ascii?Q?cLl6l9kbcBLvjdfIvR1H1rKPw9F5rqYH8dTEJWMDlm40PIyMbYsUPEwjWL98?=
 =?us-ascii?Q?1alcjM0SOfJo3ZNs3FZU9UY95kRwHDSzb3P0RumG8sI+ynNgrrg5m3GBV5Ki?=
 =?us-ascii?Q?E0JRBGLoHQTyVQmp8Ud2fCR1fFAjiLquxLtSoDco/cu2FY4UxF4pKovdrNnt?=
 =?us-ascii?Q?tHpY5Gu4soDiDWs/sisGjjaL3Rl6GaFidkYZjzLV/HfNlzmnAHDk68gUZdy8?=
 =?us-ascii?Q?pi5UpSr5DDAX3ggLVZf+aWKIxe9UAzKMthOESst9qwgg2Gw0ygDEO+9FGtny?=
 =?us-ascii?Q?+wQMUsGCbGCp0FFBxiNB4H1tqbfWY3jUhaVVaDQgvBbvROUl62hSb/BdCWw4?=
 =?us-ascii?Q?NCH5BETLEKbJR6oaxFZSEG5WGw5uZKu3BWEL6C7Vf+s+AQD7cTZ3xdgK0Lqc?=
 =?us-ascii?Q?VCdTou5KQlX4rmnn9jAI7iOkhVPfrA3V6SCTxbP3uPgyUQEBDfoJ9NZzpkn+?=
 =?us-ascii?Q?RSG8+J8OZWN4M9pBmCqTixq2mofM6AOWsRK1OJ0MojwLe3wlY/Ct4FDJ4+yL?=
 =?us-ascii?Q?E2O2f8kPnzDcy7TJn62lmkqzzAbeCuZ6KPtzMVVTZQBW0raP6PcynC0KWfd/?=
 =?us-ascii?Q?1QPPkg1/YlVCjvIiwvLf5BHpkd7YL1necy79L4hnWnJyHHVUIbo/0qUL5WBD?=
 =?us-ascii?Q?vTHTVM1bjcnM/NRqvpCFW2LV0c0HxBoFzE3wWsq/Mc8XKkwNXnjpYWi3BQpp?=
 =?us-ascii?Q?vYdC4E8Xz2BMS2nlRThQTz86OBgZC+2NGuiRV1VflflS/kgVC5Z+ocT1mdlS?=
 =?us-ascii?Q?1RQFthy2lwZuIyQdj6z2x+ZgPBir+azrzTNJ4lztpG2VAgUXaxRSN2PQnEO0?=
 =?us-ascii?Q?6ZC/f9wNuw8rg/QD9cToBqhCUeo8AE1XrJYuDeFtIl1AXEmsL0UBG9ogxIZZ?=
 =?us-ascii?Q?b+mLtqARSiC/7BILjuVQ5DF+l6wsiHg+LMkWmZL719XZYC6D66Dgg7h7BbhS?=
 =?us-ascii?Q?122YA8JG/oiRnrfNMt+NQX0GlVS2fu7uCfzbE6kCK5Lln3jhCIYEga6RcHY1?=
 =?us-ascii?Q?ad+PoM0FCMQGmD169XoBOepacsE9xD/N5C+ls1AHPhcLZ/EX2jjIx/PzFTxU?=
 =?us-ascii?Q?EoKoq2I+rELViVf4oDu+w2Jn9uOj8+NwutPYq62fcGBTj1r/aOgScQrjFfQm?=
 =?us-ascii?Q?HCBTiCLwbRoKVTt1RWW5GCUbrWeCUkeyVTxRxbVGa5dNN9m49JuP9oSKfGs/?=
 =?us-ascii?Q?H/NT+GU8tuRkplu3V7XIofPDy2qQlcXNNeBn6fjk6g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SOgC5t5dqMvv+yW7bVBv9nLtTWknWU+r39jFVQWPZqPQLafWbrKqkJ8t2WtO?=
 =?us-ascii?Q?nqR8/kCIUraflV5ie/S3WjYHTiXVm8MMKBXRrrwgheb5nQQYDGAH+/n4BAie?=
 =?us-ascii?Q?oQKDBXAY2e0ki9Ag/W2e/VlfNXSSkixAZ/x7UzF0H8jQlIOidjsbOeNcx5kx?=
 =?us-ascii?Q?A6gUQjobQXx/iqSoZkOAEhCBFYoMfiH5W+X87Mld8RE6JHAT7h9T9Wf573Hm?=
 =?us-ascii?Q?C7PX2Uflv57GJHCE5o/QVo1rlzrbEcn967GKnu2uMNJtxfKnX860GCJGgRpP?=
 =?us-ascii?Q?g0Guy4UZBYanHK5Ok7dxj/zmZxZzBwRu7S2MXpNF8WI6F7z2ceyX9lpey23Q?=
 =?us-ascii?Q?LHCanfzP6iXdW0Gn3oN6wstWk9dVypFTU8OpIyIQ5bS9qrFnlYaLQR7N7KYz?=
 =?us-ascii?Q?CXnU7WLWSspvtouspmh1d22GXBWvQpdsWEvaGm+nSuvoCYO7b3a+ogXphmWf?=
 =?us-ascii?Q?aCQPowgCjZx3WnXMOnbQ1zERqdDrxNXBfQgDykg74cJ7ej4rvDjBBExMI6qL?=
 =?us-ascii?Q?123BWMKuDHzN/DGGzB00u/AcyX6IcTu7RqV80KsDadALDuVGIb7Lyj/dNlav?=
 =?us-ascii?Q?Aq0tI6OcASbQNkts+fSPTZUOz7sCL0MryICD275midt0vigHZeB3OWcVIDtc?=
 =?us-ascii?Q?j3AOQAG/mVxzl5t0dDVO2R2SZLS0FQE2e+IBEWDMHZLO+ghrVKFB8B9Nu9NJ?=
 =?us-ascii?Q?pD59nEdUnWmN+AoP5MStFGLfMr2ppyr4eDoWQWpbVOcdxLUQONWm7NiwECI/?=
 =?us-ascii?Q?ryXGH56Vncbz6BjJv+VepPFApgXZSrvaWi4mhqrbeLXUCC/iHKC3Tgo5WU+y?=
 =?us-ascii?Q?QrKmmyQoEgj+fkHT7P+uRLONRFWdbBJd0hLYQsJqd3fdim+XdAX/2w1HQ+BD?=
 =?us-ascii?Q?EKi5yaL1KfUbi4kQgrCeDLB3Prjc76mzB7MlpWHJ8lMRAXCh3Pjr4rlQHR4O?=
 =?us-ascii?Q?xTrjU4YDdfso8Fskw4lGF5tuOyUSvyjABqHAvYNDnGZEhNKU/kMFO7eC2+O3?=
 =?us-ascii?Q?ct1v2sWJfWslNl3uQHB0+X0QDOG39TaC10RMHbp3CnHuGGXiuBNLIJf3PGnJ?=
 =?us-ascii?Q?1JNCqmuewTEy9gVRUA+YNySSkgVnLj6M4686pCAbe13pQp5eMcErjd5qLKoy?=
 =?us-ascii?Q?ijKEmlubO8vqzXh1WK28J1mNwrTA/OdEps18jlZDgi3DM/l6gp5N7qbChgWe?=
 =?us-ascii?Q?KU30ENOQcGYEvIq6gA8dMQlBBdUSESnkKpXGUkwtW8RUPSxRPYtsaJ7VgbTJ?=
 =?us-ascii?Q?zHi4JhG/n3gsDIgGX311+57vhMRzcHqrgFDeOv4ctWz50osKjmsJtS884RoQ?=
 =?us-ascii?Q?kOvezrVcL4y7UF1j8PeHFnRUf9BY4Ff5av7KqjhfNKGQegT0Hwc5xhW4aB5D?=
 =?us-ascii?Q?R7PCtgFpw5crZhHj07sQVFKMqxGLjoMBb58zMhyaFXw3Rt5Y2GMkBiSVZ9YT?=
 =?us-ascii?Q?/Ok/dJqVJkZKaTNjwtSOpDfE38ge8WV+exavOp2AqeuVbbyqKe3R+vBsSF/I?=
 =?us-ascii?Q?X4DWtubEmd4fSzs+or1ekunBNX4sXuF0WFTu0q6NwQPVjednMK3lOWHfAXLt?=
 =?us-ascii?Q?MfBtYURo3Ck1AFKZDe39jKiiDlHpdQU6aUAUSpN+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NYU4yGhSFTA83dOrQFSe1k8MCyWN0GbATADLbbDYlUMHZNwgwnMZu3L5ZVOcaOviT0YQadIIruSBQxzVuXRS3ojqeGNxPQtTIqAXJecKHeqicCAxYXRVdbscds1eYZP9K6zyNr4icHLlL6Xk46hzGdGPXs/qwUVRntEsw4BbueAkrtbXjdaywyVWRdHa5erhjOJWfNrTYRBiPUW8bBGrtLkyavEiGs3EFWC/hjUJVevuHlCLIdqiF7G1xnwBsZdk6gNtxDnrQtYw4HjnCEwL/D8he2t35cy5OOkCft9J+kfNjpdCCwnnBs/KONdEhGOBjAXV0AIM2aQMC/zxeV6J6YFK8XWki+qd7E6x4DdGNul2eZB38SQ6CUPMlSsu8Qar99OLInRCJP0+XQmi2VAqzvHWWQU3VsKWO9kuIAkSYdt01iBE+dANhikmXwbUpX1WgMZqcQyFEPaEnu6LBHENryHEtoFqb6JW+yNLCvrPWJ1jG7ooniiWHocgHa4AV/epPMwFohaS6cizuciIBNQruEd/aO/igco+W/MG33TYPwGalOVNikhKT5XZo21ph+TPceeioNQQRniUI6HcPljPbEDoK2PYPYXWAOr9E1YkIHo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a95410a-1023-4b51-7f5d-08dce8259b1a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 05:45:39.6067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixE7JFkRpzBMGH0jND9lmVvQdi6qim0yagAiPKpEAEkDSUGROzCK7A9ShoGVmXIPmLptS0nrL6dIKBIgRVTAEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7136
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_04,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090036
X-Proofpoint-ORIG-GUID: MeN-9xmjjPPXTaZMT2oAsF02ziprh5nz
X-Proofpoint-GUID: MeN-9xmjjPPXTaZMT2oAsF02ziprh5nz

From: Eugene Loh <eugene.loh@oracle.com>

As USDT processes come and go, the overlying probes for an underlying
probe will change.  Hence, we will move to a scheme in which an
underlying probe will walk all possible clauses it could call,
deciding at run time (using a bit mask for the overlying USDT probe)
which of the clauses to call.

In this patch, we create and update the BPF "usdt_prids" map.  This
is a hash map, where:

  *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
        - the PID of the firing process
        - the PRID of the underlying probe

  *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
        - the PRID over the overlying USDT probe
        - a bit mask indicating which clauses should be called

As USDT processes start up, we also add new overlying USDT probes,
whose name elements must be retrieved by prid for the built-in
variables probeprov, probemod, probefunc, and probename.  While
this is currently done with the BPF "probes" and "strtab" maps,
the monolithic strtab map cannot safely be updated by the consumer
while the kernel might be reading the map.  Therefore, we introduce
a new variable, dtp->dt_ninitprobes, that records the number of
initial probes, those created when a dtrace starts up.  For a
prid < dtp->ninitprobes, the existing scheme is used to retrieve
probe name elements.  For newer prids, necessarily USDT probes,
we use new a new BPF "usdt_names" map.

The underlying-probes "update" function is called sporadically.
The focus of this patch is the function.  When it is called can
be tuned in future patches.

The number of new USDT probes that can be accommodated is set by
the new "nusdtprobes" option.

The size of the bit mask -- that is, the greatest number of clauses
an underlying probe might call.  This is relatively easy to extend;
nevertheless, that work is left for a future patch.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_bvar.c                   |  72 ++++++----
 include/dtrace/options_defines.h |   4 +-
 libdtrace/dt_bpf.c               |  39 ++++++
 libdtrace/dt_bpf.h               |   1 +
 libdtrace/dt_cc.c                |   3 +
 libdtrace/dt_dlibs.c             |   3 +
 libdtrace/dt_impl.h              |   7 +-
 libdtrace/dt_open.c              |   9 ++
 libdtrace/dt_options.c           |   1 +
 libdtrace/dt_prov_uprobe.c       | 222 +++++++++++++++++++++++++++++++
 libdtrace/dt_work.c              |   3 +
 11 files changed, 337 insertions(+), 27 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index 37f29a591..bc184c50f 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -21,6 +21,7 @@
 
 extern struct bpf_map_def cpuinfo;
 extern struct bpf_map_def probes;
+extern struct bpf_map_def usdt_names;
 extern struct bpf_map_def state;
 
 extern uint64_t PC;
@@ -29,6 +30,7 @@ extern uint64_t STKSIZ;
 extern uint64_t BOOTTM;
 extern uint64_t STACK_OFF;
 extern uint64_t STACK_SKIP;
+extern uint64_t NINITPROBES;
 
 #define error(dctx, fault, illval) \
 	({ \
@@ -122,32 +124,52 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
 	case DIF_VAR_PROBEMOD:
 	case DIF_VAR_PROBEFUNC:
 	case DIF_VAR_PROBENAME: {
-		uint32_t	key;
-		dt_bpf_probe_t	*pinfo;
-		uint64_t	off;
-
-		key = mst->prid;
-		pinfo = bpf_map_lookup_elem(&probes, &key);
-		if (pinfo == NULL)
-			return (uint64_t)dctx->strtab;
-
-		switch (id) {
-		case DIF_VAR_PROBEPROV:
-			off = pinfo->prv;
-			break;
-		case DIF_VAR_PROBEMOD:
-			off = pinfo->mod;
-			break;
-		case DIF_VAR_PROBEFUNC:
-			off = pinfo->fun;
-			break;
-		case DIF_VAR_PROBENAME:
-			off = pinfo->prb;
+		uint32_t	key = mst->prid;
+
+		if (key < ((uint64_t)&NINITPROBES)) {
+			dt_bpf_probe_t	*pinfo;
+			uint64_t	off;
+
+			pinfo = bpf_map_lookup_elem(&probes, &key);
+			if (pinfo == NULL)
+				return (uint64_t)dctx->strtab;
+
+			switch (id) {
+			case DIF_VAR_PROBEPROV:
+				off = pinfo->prv;
+				break;
+			case DIF_VAR_PROBEMOD:
+				off = pinfo->mod;
+				break;
+			case DIF_VAR_PROBEFUNC:
+				off = pinfo->fun;
+				break;
+			case DIF_VAR_PROBENAME:
+				off = pinfo->prb;
+			}
+			if (off > (uint64_t)&STBSZ)
+				return (uint64_t)dctx->strtab;
+
+			return (uint64_t)(dctx->strtab + off);
+		} else {
+			char *off;
+
+			off = bpf_map_lookup_elem(&usdt_names, &key);
+			if (off == NULL)
+				return (uint64_t)dctx->strtab;
+
+			switch (id) {
+			case DIF_VAR_PROBENAME:
+				off += DTRACE_FUNCNAMELEN;
+			case DIF_VAR_PROBEFUNC:
+				off += DTRACE_MODNAMELEN;
+			case DIF_VAR_PROBEMOD:
+				off += DTRACE_PROVNAMELEN;
+			case DIF_VAR_PROBEPROV:
+			}
+
+			return (uint64_t)off;
 		}
-		if (off > (uint64_t)&STBSZ)
-			return (uint64_t)dctx->strtab;
-
-		return (uint64_t)(dctx->strtab + off);
 	}
 	case DIF_VAR_PID: {
 		uint64_t	val = bpf_get_current_pid_tgid();
diff --git a/include/dtrace/options_defines.h b/include/dtrace/options_defines.h
index 80246be8c..7a49b89f2 100644
--- a/include/dtrace/options_defines.h
+++ b/include/dtrace/options_defines.h
@@ -63,7 +63,9 @@
 #define	DTRACEOPT_SCRATCHSIZE	33	/* max scratch size permitted */
 #define	DTRACEOPT_LOCKMEM	34	/* max locked memory */
 #define	DTRACEOPT_PRINTSIZE	35	/* max # bytes printed by print() action */
-#define	DTRACEOPT_MAX		36	/* number of options */
+#define	DTRACEOPT_NUSDTPROBES	36	/* max number of (added) USDT probes */
+
+#define	DTRACEOPT_MAX		37	/* number of options */
 
 #define	DTRACEOPT_UNSET		(dtrace_optval_t)-2	/* unset option */
 
diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ad11d178e..7e4a4461a 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -940,6 +940,44 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/*
+ * Create the 'usdt_names' and 'usdt_prids' BPF maps.
+ *
+ * 'usdt_names':  for get_bvar() to look up probe name elements for any
+ *                prid that was created after the initial probes.
+ *
+ * 'usdt_prids':  a global hash map indexed by (pid, underlying probe ID).
+ *                The value is a probe ID for the overlying USDT probe and
+ *                a bit mask indicating which clauses to execute for this pid.
+ *
+ *                For a given (pid, PRID) key, there can be at most one
+ *                overlying USDT probe.
+ */
+static int
+gmap_create_usdt(dtrace_hdl_t *dtp)
+{
+	dtp->dt_usdt_namesmap_fd = create_gmap(dtp, "usdt_names", BPF_MAP_TYPE_HASH,
+	    sizeof(dtrace_id_t),
+	    DTRACE_PROVNAMELEN + DTRACE_MODNAMELEN + DTRACE_FUNCNAMELEN + DTRACE_NAMELEN,
+	    dtp->dt_options[DTRACEOPT_NUSDTPROBES]);
+	if (dtp->dt_usdt_namesmap_fd == -1)
+		return -1;
+
+	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
+	    dtp->dt_usdt_pridsmap_ksz, dtp->dt_usdt_pridsmap_vsz,
+	    dtp->dt_options[DTRACEOPT_NUSDTPROBES]);
+	if (dtp->dt_usdt_pridsmap_fd == -1)
+		return -1;
+
+	dtp->dt_ninitprobes = dtp->dt_probe_id;
+
+	/* Populate the newly created map.  FIXME:  this is probably not the right place for this. */
+	if (dt_uprobe.update(dtp, NULL) < 0)
+		return -1;
+
+	return 0;
+}
+
 /*
  * Create the 'gvars' BPF map.
  *
@@ -1045,6 +1083,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
 	CREATE_MAP(scratchmem)
 	CREATE_MAP(strtab)
 	CREATE_MAP(probes)
+	CREATE_MAP(usdt)
 	CREATE_MAP(gvars)
 	CREATE_MAP(lvars)
 	CREATE_MAP(dvars)
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 5716d2320..64f6c00a2 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -54,6 +54,7 @@ extern "C" {
 #define DT_CONST_ZERO_OFF		20
 #define DT_CONST_STACK_OFF		21
 #define DT_CONST_STACK_SKIP		22
+#define DT_CONST_NINITPROBES		23
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 4202771a9..421084381 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1064,6 +1064,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				nrp->dofr_data = sizeof(uint64_t)
 				    * dtp->dt_options[DTRACEOPT_MAXFRAMES];
 				continue;
+			case DT_CONST_NINITPROBES:
+				nrp->dofr_data = dtp->dt_ninitprobes;
+				continue;
 			case DT_CONST_BOOTTM:
 				if (boottime == 0 && get_boottime())
 					return -1;
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index ba4d4abef..f7b31f7be 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -71,6 +71,8 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(strtab, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(tuples, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(usdt_names, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
 
 	/* BPF internal identifiers */
 	DT_BPF_SYMBOL_ID(PRID, DT_IDENT_SCALAR, DT_CONST_PRID),
@@ -95,6 +97,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL_ID(ZERO_OFF, DT_IDENT_SCALAR, DT_CONST_ZERO_OFF),
 	DT_BPF_SYMBOL_ID(STACK_OFF, DT_IDENT_SCALAR, DT_CONST_STACK_OFF),
 	DT_BPF_SYMBOL_ID(STACK_SKIP, DT_IDENT_SCALAR, DT_CONST_STACK_SKIP),
+	DT_BPF_SYMBOL_ID(NINITPROBES, DT_IDENT_SCALAR, DT_CONST_NINITPROBES),
 
 	/* End-of-list marker */
 	{ NULL, }
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 340dc1960..198405db2 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -319,7 +319,8 @@ struct dtrace_hdl {
 	 */
 	struct dt_probe **dt_probes; /* array of probes */
 	size_t dt_probes_sz;	/* size of array of probes */
-	uint32_t dt_probe_id;	/* next available probe id */
+	dtrace_id_t dt_probe_id; /* next available probe id */
+	dtrace_id_t dt_ninitprobes; /* number of initial probes */
 
 	struct dt_probe *dt_error; /* ERROR probe */
 
@@ -389,6 +390,10 @@ struct dtrace_hdl {
 	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
+	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
+	int dt_usdt_pridsmap_ksz; /* 'usdt_prids' BPF map key size */
+	int dt_usdt_pridsmap_vsz; /* 'usdt_prids' BPF map value size */
+	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
 	void *dt_errarg;	/* error handler argument */
 	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 848141ddc..113ffff2b 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -817,6 +817,15 @@ dt_vopen(int version, int flags, int *errp,
 	dtp->dt_options[DTRACEOPT_SWITCHRATE] = 0;
 	dtp->dt_options[DTRACEOPT_AGGRATE] = 0;
 
+	/*
+	 * Set the default maximum number of (added) USDT probes.
+	 */
+	dtp->dt_options[DTRACEOPT_NUSDTPROBES] = 256;
+
+	/*
+	 * Pre-processor.
+	 */
+
 	dtp->dt_cpp_argv[0] = (char *)strbasename(dtp->dt_cpp_path);
 
 	snprintf(isadef, sizeof(isadef), "-D__SUNW_D_%u",
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index ec53358b3..377b396b0 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -1137,6 +1137,7 @@ static const dt_option_t _dtrace_rtoptions[] = {
 	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
 	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
 	{ "maxframes", dt_opt_runtime, DTRACEOPT_MAXFRAMES },
+	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
 	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
 	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
 	{ "scratchsize", dt_opt_scratchsize, DTRACEOPT_SCRATCHSIZE },
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index bb172ace2..b02b84263 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -37,8 +37,10 @@
 #include "dt_list.h"
 #include "dt_provider_tp.h"
 #include "dt_probe.h"
+#include "dt_program.h"
 #include "dt_pid.h"
 #include "dt_string.h"
+#include "port.h"
 
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
@@ -63,6 +65,15 @@ typedef struct list_probe {
 	dt_probe_t	*probe;
 } list_probe_t;
 
+typedef struct usdt_prids_map_key {
+	pid_t		pid;
+	dtrace_id_t	uprid;
+} usdt_prids_map_key_t;
+typedef struct usdt_prids_map_val {
+	dtrace_id_t	prid;
+	long long	mask;
+} usdt_prids_map_val_t;
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -77,6 +88,9 @@ dt_provimpl_t	dt_usdt;
 
 static int populate(dtrace_hdl_t *dtp)
 {
+	dtp->dt_usdt_pridsmap_ksz = sizeof(usdt_prids_map_key_t);
+	dtp->dt_usdt_pridsmap_vsz = sizeof(usdt_prids_map_val_t);
+
 	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
 			       NULL) == NULL ||
 	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
@@ -123,6 +137,213 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+/*
+ * Clean up the BPF "usdt_prids" map.
+ */
+static int
+purge_BPFmap(dtrace_hdl_t *dtp)
+{
+	int			fdprids = dtp->dt_usdt_pridsmap_fd;
+	int			fdnames = dtp->dt_usdt_namesmap_fd;
+	usdt_prids_map_key_t	key, nxt;
+	usdt_prids_map_val_t	val;
+
+	/* Initialize key to a pid/uprid that cannot be found. */
+	key.pid = 0;
+	key.uprid = 0;
+
+	/* Loop over all entries. */
+	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
+		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
+
+		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
+			return dt_set_errno(dtp, EDT_BPF);
+
+		/* Check if the process is still running. */
+		if (!Pexists(key.pid)) {
+			dt_bpf_map_delete(fdprids, &key);          // FIXME:  bpf_map_next_key() iteration restarts each time we delete an elem!!!
+			dt_bpf_map_delete(fdnames, &val.prid);
+			continue;
+		}
+
+		/*
+		 * FIXME.  There might be another case, where the process
+		 * is still running, but some of its USDT probes are gone?
+		 * So maybe we have to check for the existence of one of
+		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
+		 *     char *prv = ...pdp->prv minus the numerial part;
+		 *
+		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 */
+	}
+
+	return 0;
+}
+
+/*
+ * Update the uprobe provider.
+ */
+static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
+{
+	dt_probe_t	*prp;
+	dt_probe_t	*prp_next;
+	int		i, prid = dtp->dt_probe_id;
+	dt_pcb_t	pcb;
+	int		fd = dtp->dt_usdt_namesmap_fd;
+	char		probnam[DTRACE_PROVNAMELEN + DTRACE_MODNAMELEN + DTRACE_FUNCNAMELEN + DTRACE_NAMELEN];
+
+	/* Clear stale pids. */
+	purge_BPFmap(dtp);
+
+	/* Update dt_probes[] and dt_enablings. */
+	/*
+	 * pcb is only used inside of dt_pid_error() to get:
+	 *     pcb->pcb_region
+	 *     pcb->pcb_filetag
+	 *     pcb->pcb_fileptr
+	 * While pcb cannot be NULL, these other things apparently can be.
+	 */
+	memset(&pcb, 0, sizeof(dt_pcb_t));
+	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
+		dtrace_stmtdesc_t *stp;
+
+		stp = dtp->dt_stmts[i];
+		assert(stp != NULL);
+		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
+	}
+
+	/*
+	 * Add probe name elements for any new USDT probes.
+	 */
+	while (prid < dtp->dt_probe_id) {
+		const dtrace_probedesc_t *pdp = dtp->dt_probes[prid]->desc;
+
+		dt_probe_enable(dtp, dtp->dt_probes[prid]);
+
+		if (dtp->dt_probes[prid]->prov->impl == &dt_usdt) {
+			snprintf(probnam, DTRACE_PROVNAMELEN, "%s", pdp->prv);
+			snprintf(&probnam[DTRACE_PROVNAMELEN],
+					  DTRACE_MODNAMELEN, "%s", pdp->mod);
+			snprintf(&probnam[DTRACE_PROVNAMELEN +
+					  DTRACE_MODNAMELEN],
+					  DTRACE_FUNCNAMELEN, "%s", pdp->fun);
+			snprintf(&probnam[DTRACE_PROVNAMELEN +
+					  DTRACE_MODNAMELEN +
+					  DTRACE_FUNCNAMELEN],
+					  DTRACE_NAMELEN, "%s", pdp->prb);
+			if (dt_bpf_map_update(fd, &prid, probnam) == -1)
+				assert(0);   // FIXME do something here
+		}
+
+		prid++;
+	}
+
+	/* Review enablings. */
+	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
+		pid_t		pid;
+		list_probe_t	*pup;
+
+		prp_next = dt_list_next(prp);
+
+		/* Make sure it is an overlying USDT probe. */
+		if (prp->prov->impl != &dt_usdt)
+			continue;
+
+		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
+		/*
+		 * Nick writes:
+		 * This is a general problem with running compiler-adjacent things outside
+		 * compile time. I think we should adjust dt_pid_error() so that it works
+		 * with NULL pcb and dpr at once, probably by using the code path for
+		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
+		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
+		 * already handle this case.)
+		 */
+		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
+
+		if (!Pexists(pid)) {
+			/* Remove from enablings. */
+			dt_list_delete(&dtp->dt_enablings, prp);
+
+			/* Make it evident from the probe that it is not in enablings. */
+			((dt_list_t *)prp)->dl_prev = NULL;
+			((dt_list_t *)prp)->dl_next = NULL;
+
+			/* Free up its list of underlying probes. */
+			while ((pup = dt_list_next(prp->prv_data)) != NULL) {
+				dt_list_delete(prp->prv_data, pup);
+				dt_free(dtp, pup);
+			}
+			dt_free(dtp, prp->prv_data);
+			prp->prv_data = NULL;
+
+			continue;
+		}
+
+		for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+			dt_probe_t		*uprp = pup->probe;
+			long long		mask = 0, bit = 1;
+			usdt_prids_map_key_t	key;
+			usdt_prids_map_val_t	val, oval;
+			dt_uprobe_t		*upp = uprp->prv_data;
+
+			/*
+			 * For is-enabled probes, the bit mask does not matter.
+			 * It is possible that we have this underlying probe due to
+			 * an overlying pid-offset probe and that we will not know
+			 * until later, when some new pid is created, that we also
+			 * have an overlying USDT is-enabled probe, but missing this
+			 * optimization opportunity is okay.
+			 */
+			if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
+				int n;
+
+				for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+					dtrace_stmtdesc_t *stp;
+
+					stp = dtp->dt_stmts[n];
+					assert(stp != NULL);
+
+					if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
+					    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
+					    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
+					    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
+						mask |= bit;
+
+					bit <<= 1;
+				}
+			}
+
+			key.pid = pid;
+			key.uprid = uprp->desc->id;
+
+			val.prid = prp->desc->id;
+			val.mask = mask;
+
+			/* linux/bpf.h says error is -1, but it could be -2 */
+			if (dt_bpf_map_lookup(dtp->dt_usdt_pridsmap_fd, &key, &oval) < 0) {
+				/*
+				 * Set the map entry.
+				 */
+				// FIXME Check return value, but how should errors be handled?
+				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
+			} else if (val.prid != oval.prid || val.mask != oval.mask) {
+				/*
+				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
+				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
+				 */
+			} else {
+				/*
+				 * Nothing to do, it already is in the map.
+				 */
+			}
+		}
+	}
+
+	return 0;
+}
 
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
@@ -782,6 +1003,7 @@ dt_provimpl_t	dt_uprobe = {
 	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
+	.update		= &update_uprobe,
 };
 
 /*
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 11335345a..2e7884cb9 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -362,6 +362,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
 	dtrace_workstatus_t	rval;
 	int			gen;
 
+	if (dt_uprobe.update(dtp, NULL) < 0)
+		return DTRACE_WORKSTATUS_ERROR;
+
 	switch (dtrace_status(dtp)) {
 	case DTRACE_STATUS_EXITED:
 	case DTRACE_STATUS_STOPPED:
-- 
2.43.5

