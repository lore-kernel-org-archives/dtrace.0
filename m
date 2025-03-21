Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D911DE3D6
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742568648; cv=fail; b=cdi/bZwQ2PQen6gBW2t7JHG+cPO7cpVkheULeBE+y9lOrnPIg+xPaFP3cS1WrlbZWki96bWzXIiCudauNENuC9T6BW1lIYk4jeAlkNZQ8yEoTNvzgxKT+MNuDrBlKzbmCBN7MQWQ4GyTdYv2XjgpqlHQYs96tQ9x9VdIT63kEIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742568648; c=relaxed/simple;
	bh=ejSTIoa/dWBliCtK4LQdfeOskf8JQxjyAkWAKe/i9UI=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=qOK6Bnq3wmzQ4+yB23xO5s7klSO2XaWkcjw71ewR9kn2j0eZDuAUxeS9nadg2RiA78pnX0DfeENMUpJ/zKl7lepif/v0npeCNQHqhqDC3febqbY+HS01mX1UsOeIvOjTGLw+uBy4aQQZwtdjrIg6B/Ujd3Dx+7zKDaQzhX2wnMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ibCpOVR4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZtAgSeMq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ibCpOVR4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZtAgSeMq"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LEBrXG002562
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 14:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=1O+X96ZyEB9Ym0Q22zolRhTYvT9+kEBchYcfYKAAWcQ=; b=
	ibCpOVR4INP1bSIubtnSV1k/V/mEIGJ4PcMQR6dYC799OC0HN9OUXihG42fPyWjr
	EVuhunaWXafXp1NJ2pZp4hZ90fK40HsQd5E0MDxTBNnI9IqU/ZsnUdWVHE0xKTps
	9mSxBgDxDuZFEkMC/nPYTuDiC2NJQUNFkmUy+vJ2VF3VWhfLZsT3/a028URslXls
	XEveRasZsnAmndenvhKgGp5AQMs1tCKFhpjmrJ9IUKXV6TfT2bzR8WWxuthCQecF
	CjLYlVqKT5yvUSR582AF7CfpSYDrBqx7LP131liIpWkJIA9wiR6pC5Y9e47lU3Hg
	QtM2UonIsfkcml9TlJGYRQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m409ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 14:50:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52LEVICs018702
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 14:50:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxdqjaky-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 14:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niFHjacCPZY3/MyBa7R6NfXeIdTiYuMZ0NoLHX5/ORqVRJuEHRBg5v7ZJAPO5x6dATa6TgVVEslcShp1vUjT/7mBVCnkplqNTAMZ4goUEzU7MOj3L31dpo1uThmgH+bgc+y5ChULOgSXpbOXj342fzgEC0U8E70HmFvkcF4jr4Cli2Bt6QAXUV1pekqQLl0/htEWq5jbMjPiE4x5OOHqz2O2UhZU84eiO5LefvYd5maWsY4/cQd5ABoZ9i7lKtqY5s9B+lJojcE+xxo1dmUgNMmrweffhHBAzTj3AQxqTy5De46FjgQ4FvwGJ5FOvxvqEUvZBBeCeNliOH/a/oCsdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1O+X96ZyEB9Ym0Q22zolRhTYvT9+kEBchYcfYKAAWcQ=;
 b=Kv/JIN+bxhoMD6xK0d2epFYsY/+/AgBwQcEPA3VqC0HW/llsM0gwskLsrkSFL4BrvrNyoBOH8beOtpODUily05ao8+F9PmVu20pJt+9os4VcnKPYPyCJf+ER6t9Dj8rhapsbjLOR6v/gCJUWZTGAJzAXk1tHWZufIo3Yt4U2UrfQGUm4MM49Vpe3AbU8401YQc9cnO7WlX4ih4f9ovXaTZ6oXN/o2u0aazHqNw+iV8ZGoyacAi85EgbKjZ1Pr6tvYMtekrwqPHjz1ackYcRs07ajha5uhcfeQiWQkml7Gb/BSzpSOLpWPaMLGOmmveJB9wwwdMU0RTyvGgSfLYwRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1O+X96ZyEB9Ym0Q22zolRhTYvT9+kEBchYcfYKAAWcQ=;
 b=ZtAgSeMqpm3vvtex/ORzvf5JDvlA/6WusED9oNv1ZiimHB6h9vgsuufNUuM+fdTf5eY/XQjaVnQU9xutzU/7vmPJxT0JF50c+wrGHRIMS0mz4s5m3RDlOT5mBXNDJCCES707yKnxszIVlO4rvWOeBKrFC4s3Aw51mc0iZZfTo4I=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA2PR10MB4732.namprd10.prod.outlook.com (2603:10b6:806:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Fri, 21 Mar
 2025 14:50:39 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 14:50:39 +0000
Message-ID: <834ff39378a30c154da54c67f4093dde.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Date: Fri, 21 Mar 2025 10:42:21 -0400
Subject: [PATCH 1/2] dlib: remove obsolete dt_dlib_add_probe_var()
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0089.namprd04.prod.outlook.com
 (2603:10b6:408:ea::34) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA2PR10MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 299ad378-a437-42b9-8305-08dd6887bf40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yYFc04Mzvjajvj5LLSUxi83fq1GjYimppzaNbmS1qT5mybhEZNsCXBzfv9+d?=
 =?us-ascii?Q?I00QyXSqBE0MJaN2ANKh9XYAwfK9wy4D10vSg6S8GbOo6t3BNjJ26wkzNGY4?=
 =?us-ascii?Q?E0uI/6fZYdhLHozuBNRSKxbhmz+5IEsB3K+vqVDZiIc6MJSOO24jsyZ0FjDE?=
 =?us-ascii?Q?c7DjrXHYzLnuDsge9+TkkOC89lf4lTILXDalA1fRDgQi79Qq917T2zy4X3Fl?=
 =?us-ascii?Q?4Jb67zvsQdqTAR7PtHtXtDFZkFog8DEo+iojmjDi1vZ2EMPIZ3kgTHmJJRld?=
 =?us-ascii?Q?zTi7Kes/e37Df0AR28bk4N7JeA2vgdRijyHL0Sz3s0UeVPFUCDz7rPrVC3wO?=
 =?us-ascii?Q?6YDhdolx280y//1lYX6UcWRUS3QKsddHdeEkpArZHmuMWKPuhSi0bCdhw8/Q?=
 =?us-ascii?Q?d72B8+qbHj7F9prEpcWTTKXVLTP6VccHs2vhwB/wauGa79Tpy+0lS9s71CpT?=
 =?us-ascii?Q?D41LzSxTREkTDoSDT0USRuxiqUqR+NHdot29WqOXPYcXeDVcAI0cp33zZrId?=
 =?us-ascii?Q?pAvc/NTXKwnRf84s3mIKhSwMI+TSCgMdTsyX/T/H0FXp+5qwWhdVWArFv2Q0?=
 =?us-ascii?Q?rWhPFGr73OeY1csP990y8iNHHFcild3FwTWZfl34lnNZnBCWIEyRDAVA8mUC?=
 =?us-ascii?Q?UyNItymH23rBnVzDXq6ojqEtSXEWEgCnMwRIxo97UnjuAd7deDDwedLF0Mnr?=
 =?us-ascii?Q?rMtC3jlHvecynb6zvFVWo/y7z/bdoClaJYVu0X8UPfiqj8jiL9ZP4qeeA6l1?=
 =?us-ascii?Q?ETNSYBU9mPFcZ/tp8X89BaETIMoUyuNBoA9o9Iei1Jf70uO9mrBrP4nEqMDO?=
 =?us-ascii?Q?Y5GRiLsmZd0LjXdowGWKQqBU6+iH2VzEX1ZLfy0J99v5z2AT5D17iCqnMLi3?=
 =?us-ascii?Q?8sPWKPjsNOPSRlNsHY3LQS8dJuTDYWMl5+CDHjCPzRQh0cNF9wzGyZMWg7oT?=
 =?us-ascii?Q?HST+AAxKf+Obc+ozuF4ymo7QgWbbjoYwOae23jbVGDsBvnDJCaLFFvRy6Fxd?=
 =?us-ascii?Q?C5i+A7LvcwdHIFBGEUgH6YvNTLX09c8xd3vAKOfKSk0u0ToWV8fGdaEU3HgA?=
 =?us-ascii?Q?CY8oRaKlJRhHRBbg8zBZwOEg+WLpXDScNbA9ljCk6I1qluX2BcqPuwTdWpPr?=
 =?us-ascii?Q?rrt1KbSPgYD/vWR8pF3Yr82pCXksZGGoT1MySlVFBH7y2jyJ9lR3ekZL+Xg/?=
 =?us-ascii?Q?XOojXNUE2azGVeeHqZMyh739sOT+tHEVSwEnjsj9bSONHvXCzK8hPwqRK42F?=
 =?us-ascii?Q?EtURF0rrDx2vIbx3MiFsr+Bj+VRPOeu/XsCnRIQYTaY0tojpuztuOix5SREu?=
 =?us-ascii?Q?VhPt81h1bVV4lhnNa4T/HZHELVtsjRL1gfgZ7Hqx8LO2YeRZLk2EDCjdrDCN?=
 =?us-ascii?Q?gSJpecNWEIrOmC8KJEsxjRy/7hkk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E7/hxXlXkNpJfMqwOMFOpBMclf5lZKD6wGCLSVSC/Jni0YEZIM9pxm52kdDB?=
 =?us-ascii?Q?C5uBO17w6pq+t60yBkyZQF2UZ0iVid1LDPVAe3c1WolKiafQ766L77qk85U6?=
 =?us-ascii?Q?YtX9fSzx5utmaQQvVt7y+4hOxpOmQB5oS4q1/KkOUvKGV+FL86MqCw9YnL/d?=
 =?us-ascii?Q?tELdMIRzytPs3Grt0c7C/w8NaHCF9aXOUaRHOyCMAHbiY2ZATTTAqCB+Xj3o?=
 =?us-ascii?Q?AjIrypOQlaJ8dEaB9AeOqn2pnIvmMo0kS97o3JQMri1hCemLGciwGb4KXPi0?=
 =?us-ascii?Q?pHVFTjMRR+H2MZpcfXfmnEEqkTG1ze9zPEuQHEeDFM4wjrGpS/ctLBnVeYpp?=
 =?us-ascii?Q?0NeK2qQUD/dBrbzSot0DFnRVGVy7H8Zd0gwQ1wUdRFdbAHix/jNtCla+ER3P?=
 =?us-ascii?Q?fk/S1dOp6gXlAzjK5LYnmM8ZkaxhmHeuYcCBsRJh/TWIBBnTyz7+4Oo8FCqI?=
 =?us-ascii?Q?RHBzUdxUisxY+Gm1WWXzu2vkSbOtJIy8fqyHAR3wKzFgDKOzPrs66Tprzg0I?=
 =?us-ascii?Q?YaMn1KeRbZGnNDM8jvCo1m/NYTZVJxmH9xkww+fn0ZWxIe8yCDLPsxnCHB/p?=
 =?us-ascii?Q?ct3btc1d0624aLsFmg10Bz7hktqVjjr7ICPeAZXZ1mC+MUVgRR46TSZtqz/Y?=
 =?us-ascii?Q?1c+U4bIMkE6KsrrR4EPKsDc3tbz0oVn25ubEbWkyyYBL9RZ8lrLaRUpMsTiI?=
 =?us-ascii?Q?mr0/J+qTOD+eD/aI7UOUNGopVtK8SiRxdHvoJitUUD19SiaymDZSie2wxwNK?=
 =?us-ascii?Q?vtSkjTdLDhVO0PBj1vBvZHYEKP7YhJDBpxZRGJm/7U0sswRnBU7W3WIQ0cY7?=
 =?us-ascii?Q?29y6M8Bpn4K4TuvYk+6veXLa/rnDCjjcaHZfhyLUkHfeKfi4LFgodAO6Hl/u?=
 =?us-ascii?Q?/ulltL4XAC4c0ow/wgvS7QDgoM8e0eQlTJM/kyAiKXcRXyofcO++aYyUUI3D?=
 =?us-ascii?Q?m21KbxgRGfq32N1zrBJ0GtrJJ3vUQiXJuOczpMxOO6xjELFV5uzPymci/m+M?=
 =?us-ascii?Q?a6B9H/A9R90Z+kgPWG7qXfpNMr4eAiA33F0IouPmttXKIO/yayOQqKt3DX7Z?=
 =?us-ascii?Q?fwyHQgmPf4lCFGyFCBU+E34EohKSbwrAH9l+NUhOwmKmj/ilnSnk7MSNlaP0?=
 =?us-ascii?Q?of3FLJmQVpdmwHFu0IWb2D7Eg0mzPs2vx1X87+MeL7XWjrBk9+QXh5fEPjGi?=
 =?us-ascii?Q?3J2HCTjH3/osguz0wQUYnrlrNtNmoF+zL+wX0Z97EE87/WOU57hUpPyjXu60?=
 =?us-ascii?Q?rNkY3ppsD1JL0X/3+RWxd8S8jjdNmeEKS1ZUNltnZHTMDIb2iUYOKYH/IgCU?=
 =?us-ascii?Q?EeyAYMahqmD4QjiOLoMSOrIUculD8GDpfZpG+ZGGtc2aVBbDf+9dwbEHqbN6?=
 =?us-ascii?Q?PtNAaAdrkTbjur5qln/CZQwnj67ASVKP/ov73Ateo1v8rjGd+ofHxNlyIHYZ?=
 =?us-ascii?Q?L7qxWAzQqC3Cu6DPrRGbHsJi4S949okLyNmnWQZ5Fzc3coOqTkT3W6UiyBDG?=
 =?us-ascii?Q?qdAnW0QY+yQRRrlZvUHIbkqvdNTAIsRW/EjyRksweltTFR5kEc7E32lNNIMW?=
 =?us-ascii?Q?FF3Tbub6Qwr8BSwY0HDEf9WzcZeYSo8scSKxyOi3cBAQZDZiaQFqbRv2Ig4m?=
 =?us-ascii?Q?iIZwmcRukVcukOGgJKN0Efo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3XPvGr0bNGpM+76iTorziXY52yNHjo4iUZGmbayP2ZK3yykjVVbENf8YJCCVD0tNxDJrYfZDNR70RsGrAqnQByoQXLBpM6GgwnCGylz/mzr0JZDzrcs0udmYb/MZjl2+CE50gIPeVFtku4ezfjFN0CGhUllfvFFK2cB1PSzTnia1ywzzJ5g1vIhUuEz+dMhYL3+9oyjxNj3PDp/qb9lUWoPXI3Xzq1AjmJz9yVCsMlVasTJrTViDoiZaYqxM9uXVoDXMn4evN/69YhqVMgxVuUgV2DjXfPCZ2Whkp6h0BNcZVHkqwMEgGHg2iFUwAudcezUGUJ0fd9E35E+YXNpf4ZezHz/r8TPTb0OPVrTklD1UWJsXsVpI4kbaK+bUEuV5MkKRZ761DxMJnz6dJdelbq/sIU/fNSozLlCKwFBxQTbayNhDUaDk4Et+RWVyduzro09h8bbqcSKDoOtDyqBxn3KuXk+NPdOGalpC7f72aZmT2+ywskvyLZcMgyZEBTs/C502X9d0d5SFGuUt7c6pROa5yX1aHqYkbSwYkBYXTQHGv4nHB5IXfCARB/j6L8TRzTRGIuJOh6fdnUWlCCTbNacH9vpgDyRNGzvVKgGfUd0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299ad378-a437-42b9-8305-08dd6887bf40
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 14:50:39.6436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAqIO8ibKqd7Pr5fM+df8TofSSOWwOGpJK7WRFbzxLwyfK5sQfXjKQ2XziAEuGwjzhIVS/ZbnFESK0ZfhW9m7WQa2FDRpxpZHW5u/Dc3iqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503210108
X-Proofpoint-ORIG-GUID: TZm5nOvKKOTCYvyClMAxN6nZwvuOziwC
X-Proofpoint-GUID: TZm5nOvKKOTCYvyClMAxN6nZwvuOziwC

The dt_dlib_add_probe_var() function was added to allow for relcoation
processing filling in probe ids for dependent probes, but since the
probe ids are known at code generation time, there is no need for this.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c          |  3 +--
 libdtrace/dt_dlibs.c       | 16 ----------------
 libdtrace/dt_prov_uprobe.c |  6 +-----
 3 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 8cc99246..e954173b 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -905,14 +905,13 @@ dt_cg_add_dependent(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg)
 {
 	dt_pcb_t	*pcb = dtp->dt_pcb;
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
-	dt_ident_t	*idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
 	uint_t		exitlbl = dt_irlist_label(dlp);
 	int		skip = 0;
 
 	dt_cg_tramp_save_args(pcb);
 	pcb->pcb_parent_probe = pcb->pcb_probe;
 	pcb->pcb_probe = prp;
-	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
+	emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id));
 	if (prp->prov->impl->trampoline != NULL)
 		skip = prp->prov->impl->trampoline(pcb, exitlbl);
 
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index 9ad4f5e7..9a2970c7 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -250,22 +250,6 @@ dt_dlib_add_var(dtrace_hdl_t *dtp, const char *name, uint_t id)
 	return dt_dlib_add_sym_id(dtp, name, DT_IDENT_SCALAR, id);
 }
 
-/*
- * Add a BPF variable for a probe.
- * The fully qualified probe name is tha variable name, and the probe ID is the
- * value of the variable.
- */
-dt_ident_t *
-dt_dlib_add_probe_var(dtrace_hdl_t *dtp, const dt_probe_t *prp)
-{
-	char	pn[DTRACE_FULLNAMELEN + 1];
-
-	snprintf(pn, DTRACE_FULLNAMELEN, "%s:%s:%s:%s", prp->desc->prv,
-		 prp->desc->mod, prp->desc->fun, prp->desc->prb);
-
-	return dt_dlib_add_var(dtp, pn, prp->desc->id);
-}
-
 /*
  * Return the DIFO for an external symbol.
  */
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 8dbd2aed..28762eb3 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -947,7 +947,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		const dt_probe_t	*prp = pop->probe;
 		uint_t			lbl_next = dt_irlist_label(dlp);
 		pid_t			pid;
-		dt_ident_t		*idp;
 
 		if (prp->prov->impl != &dt_pid)
 			continue;
@@ -955,9 +954,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
 		assert(pid != -1);
 
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
-		assert(idp != NULL);
-
 		/*
 		 * Populate probe arguments.
 		 */
@@ -971,7 +967,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 * process, and emit a sequence of clauses for it when it does.
 		 */
 		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6, pid, lbl_next));
-		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
+		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id));
 		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
 		emitl(dlp, lbl_next,
 			   BPF_NOP());
-- 
2.45.2

