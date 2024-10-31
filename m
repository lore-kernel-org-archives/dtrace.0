Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A041BD515
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 17:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730396416; cv=fail; b=g7FH4jay/J1e9GT6rdzAws6617xJzdum5rMG0/uUkFcHO9hGcetH6sAhUUKxUvYVukiqOtzAYOaN9QGJWhg64QJOdk4bZXFvFE5v/wxZYLKhfdFH9JQs3V2kvwwA7cpE+aGVbsQygNSi1g+TbzbKKBzSTaTj1dUHl9ib7QobnCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730396416; c=relaxed/simple;
	bh=cGEjC5/6uD82jEsBXxV8mdYfTqlN/upgu+9BByrtvhU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=II7s9NicPTDQRID5Xy3DWIyf0pJth0xoD/tnIAlcamxqGvR2w5dHNlAA4e34RBX9EOU+ZweyBdCPobfFpfneQmIVhtqPZk/aPkMsXjcZQK4Fmo53OvtUgg9eTELDlE90UidrWD2o3Hkqt9qMLlbqe5rm/qeiUS679Hd8B1xsJzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VZrI9zpM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZsoiR3KY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VZrI9zpM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZsoiR3KY"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VGtrgD014200;
	Thu, 31 Oct 2024 17:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=MhP4PFCcy1lqhrWB
	cNB+kakVqV5/Gg7zvWfxrFhbf0k=; b=VZrI9zpMoibkydDdg1aw4P5Koo2QdZ7K
	H4WIy3wkvg3HPl57HrkfzboYk5F/BsaY2v6lwbwZ5WNH8hpyUaEV/e/XSuacMUyH
	+jXT54gBQaODT6IO6yUHOnHlVk3qOohHL1QPGfolhcCY4uESwR6dVZ+9ZmEJkSvD
	x4XYWUg2N1JwWI6lOxcdG65u02REKM7LqS11TrypBZNXHdtbj/G60XpkWm7wZmW2
	Q9PTVVRwNK+AdnAt7k3BxfZQqt3ujsDGs+m7lAZHSl59SkuJvBa5yvFYbEmZ04B+
	tiFXF9ACkgM6prRqvb27yTah3va+Vw/y7YAlI5NRKmypUgAN8RfcUQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc92usn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Oct 2024 17:40:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49VHa8e1004233;
	Thu, 31 Oct 2024 17:40:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2x7nrx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Oct 2024 17:40:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlsCg8r0Ly/JVYjJErDmZhO/OrB1MpxzHxuUN7LA7V0o3jQxMv26dIeWKSzGQyH/gqOOQWfps1aJcOZzg+rOwj1F1LHUzTtTkdP+4nc7+JTJOR1YleQWiorJ6MlAw7iz++Eo2ufKb5cySClorVViKtDOWGvxwQ9mUZWvpMPefLltRSycwY5UhYpNPEWipZPGh1wmvDkBzo4wc+SZBPDeBSGdIi24qlxFObsG+8BHl7+R0r4abf88zYi9CuYv/gAp4UVEMtvS9+qWLUNe0O994cvRM96H5sRrMBgt4peQt0YWwmMbSYuvewL7tuSG4nijIbLxdE/ypYFAN58OcBkYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhP4PFCcy1lqhrWBcNB+kakVqV5/Gg7zvWfxrFhbf0k=;
 b=wEfVQ4ao11PRlX9MhgXiisoDOF9zkH/zMNSPDRtcTQVl3II7CQsnVoIQYCFQdXfZn8yPhSrX01uNa88bZmO2nOktfPjoPeYdnuKpPXekXeJBpzfTNgvHT8BnFDyso7pi+SEYQo3fLYZ7sfHmiWtJNaSdjMfPVQuLAYnC2LPg8IuZyqiACNJJhgz+4ooGUzUq6Ulr4qmATr/4ZShwrMhmv/6lqWiy3F0QZ3th/0KLXdGaHZHjWPGYF2V7uO3YwsRqK36elCPnXy/puw3X1+W5P8u6JIzVSHLF+OlQE/FJDDC4YU5IfbLdJCoK79r10QxLu6HWP+DIIduGLnKy5rgyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhP4PFCcy1lqhrWBcNB+kakVqV5/Gg7zvWfxrFhbf0k=;
 b=ZsoiR3KYR7hjDYJo3prxQELpUIYcQnJFU5Vr0qdiiGGLoNBWvZaJO6lPCu3lH0xIIcFOGwtXkaBj7LGs8CokXgfqHvM1E+XXjZ/tPiu/Xi+ocG/uA5lX4AL5TzWdE+PFclPPK5sQ1TfuqirM1HpWIS+KbvTpAa6s6M8xz4LVmxI=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH2PR10MB4230.namprd10.prod.outlook.com (2603:10b6:610:a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 17:40:07 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 17:40:07 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH] build: mkdir man directories before installing to them
Date: Thu, 31 Oct 2024 17:40:02 +0000
Message-ID: <20241031174002.260385-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::11) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH2PR10MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: eaae08a4-4223-44f6-199a-08dcf9d30f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hB/W3r4Pl5aoSD4RLtIHqmmyun0ICJOBMjxeyn/Y10Kbb2AnFsaU00gi/1aM?=
 =?us-ascii?Q?YQU5geztO+kJL2dptKKOaE61IjtTXs/UFyUqCRODRsm+x3HKjBzPZVLleaX5?=
 =?us-ascii?Q?ZQlEj6Nc2CcmhtHr5D3aCwfRr6gvg+4Gus/0cQyXP++JkYU9aeWvhZzJyu4v?=
 =?us-ascii?Q?9L3Je2OyRcttWzRIHCFaZPirYFhlXK54SUeIcPh0ycBmfdGm0jgwZZHXxgOY?=
 =?us-ascii?Q?owjL0xWAU2/aiJXrC21gAvOL646igNgTLhRlJYH07nsODYKlQv+f0rWzNrkO?=
 =?us-ascii?Q?LpteN8H1nYSSyP9TV/GHJ6gXkOdo+fyqQ4v0+BPqreZrXym9Je/pDJTz+wsm?=
 =?us-ascii?Q?cvyceMXerb38BKGt3i4jai7hs1CJves9wB7l+zKK7iGdKUtQTeJaA5TCG56o?=
 =?us-ascii?Q?UeG1/JqCZT13N8CcDLVIlJdZVuSGts6T//DElojZ/ZXQkcgOJSp91AkTi20K?=
 =?us-ascii?Q?9Lf4X9VqnRBbWWRsUFZrHkbDP1dpg7tkYpvbdAl2af9Oj7Cq9hQnH/O1Vk2a?=
 =?us-ascii?Q?OLMndYLQC3MVtxaLdGBZHqcjVHxX0gFK2N3fslok9ns3gNUsUa3Dixlc9Xef?=
 =?us-ascii?Q?Esg+hO7j1cfvoqcqW8XEjYeXihEm8uTLqVAkeW6Eue5n1HCu918eYymLdmbG?=
 =?us-ascii?Q?c983GuOW3S0Z5T+JHoe4HREFUI8k3WMz8qnH2bBy12dw4J7STJ9qS1nGdI2f?=
 =?us-ascii?Q?yIB9GpyamoMPQnmlwNNiQkyuGMdQQ2oZXiuBdq79/80Wtj17wEWHzmXoNVLp?=
 =?us-ascii?Q?HYauzv6zV1U/+NnjdzBmHnIdBo8bJwqVWuWlXTZRXAgnf1MYbiTUT6Si3gzW?=
 =?us-ascii?Q?WRdBZyn5vG6Q0UXagCbhjT+uDMWBeSl66IQQWkK0xqcEmCjlVxk0rLieQpG0?=
 =?us-ascii?Q?gR97fbgzkHupzd5vuhLHDd23sCIydsbq8pHbc67TtKHKualDOrvp2AAFGGxx?=
 =?us-ascii?Q?gcZr/+h+nYLuofINsjX6N75bXmc4F5mWnUnmfAWsPKwdqbFSz+a6GA97ak+I?=
 =?us-ascii?Q?tKZiBfN5DVhX163mJlenCD7aXGZSX+cWm86B6uJu/k+4WSENhBT/UCUzkEgX?=
 =?us-ascii?Q?6usyQOzR4Oex1L1LdqCndXOntxhOH944pMfPNV/t7jPR+adUu4eYBg1gqXdK?=
 =?us-ascii?Q?WS5zStSn4UFRiCCjGnzx+huCDPFpMjURIMDRzg0R+RP1h8rl1he2o1AC0Wbt?=
 =?us-ascii?Q?/kzY+Z6bh0oclrflo9in7UvfFy/z2Mzx9Kp4N3Z+VgpHJ2pB01CVgXEz7uIh?=
 =?us-ascii?Q?1Hdn/haP/CB71V2L2yTw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dXEg/n9T7ocUwDO6CctveLKKHx1rKIJVcBI3Hp6mNbk8o020IUFqpd+kuJA9?=
 =?us-ascii?Q?pSBzZWQRScIg9iCcsC9E1qttkh8HZMav56lm0E6j0tdd7CZ0Xva9D9lx5zC0?=
 =?us-ascii?Q?QofGFKp9n3f93qXG81UFyTeQZA2GOlIkDWaUe8vB41Hg149bzQNHaaarTh0H?=
 =?us-ascii?Q?YEq6Dyua8svYheWEYNJkyhMMP+fleHVBX4ERpyUCc5WbbQFGqTYKCm1pohXZ?=
 =?us-ascii?Q?dkkS0MtflDA8GqBWoF8y4SmEMYyk/nAsbLHDtb2P1aphSXEqCZOJxz5ALWIi?=
 =?us-ascii?Q?hnZwr3quQ5st2XH6zb1jrn5eZFoK9N5gc8T8fkQLrpmI0yLcoJuCQjMYk+h+?=
 =?us-ascii?Q?ZHmlKo5mpmpu+NZn8sVdbVqIiGgnl/lQmbgCqYdenN5k3rXzw7k2dycHnIBL?=
 =?us-ascii?Q?NwDRKFmjr+oDuIy2mW3HhzoneeU5BaWhH5/IvqvyxK+4IfV8VP2LJppZArfV?=
 =?us-ascii?Q?MTbrWxeHp68/sGbk2R51y1gfUyaAsoKoGRNPgESkbDi4ofFhPXblr5QGjSsU?=
 =?us-ascii?Q?Oq3zhN6ZNyd0QqoGI8uOLXD277liGWMhs7P43ZntzUYBe5qDppXrumwGoA5O?=
 =?us-ascii?Q?X4i1kRrFEq2v/heXv2l+WsBbcZYgJYPCMsSkWQdQKcWNJNizgv6fTOGQD1Ig?=
 =?us-ascii?Q?iJ/ZFPj9madi3kOBkOH4p9bdCPzp2y7TljvpJEKN8rLXvrWHcxNJWMcBtW49?=
 =?us-ascii?Q?sg14e6nfM2JzWwIiBPxwQ133wh1PNAU3n4PUow0F5r2TaOHQLkWU6JEwSkrs?=
 =?us-ascii?Q?ZPd8wO7dbEV35R3J2SkDpNp9HWx5I0b+TEdP6g499mRWMb5BIgxabhUm4y5e?=
 =?us-ascii?Q?b4oTzScQMcSbvyjKVvrQ6eRlMHxfGkIQXcdAzkAUaPphDM7Kqf6hg48cGxoi?=
 =?us-ascii?Q?DBGSnv6nuUHFniliFJapveA5qGEMTqrP7VN/4qB8TaTXNY3EvAFAkcdTrORl?=
 =?us-ascii?Q?w5DLC6eEFwS8L6dohTea+AjhhcO/d6KA8E2zw+xo29ylD3Y8KFkVgbh/k9Gp?=
 =?us-ascii?Q?b1I/MBZoXE1R3N+1yNHTUWn98CJFSD5m0xj/wOiQ8ewgZmFRcbWzYaHNZt09?=
 =?us-ascii?Q?e8xWbVwNKDX+itvEn4njbqAyhUIjb7WvpiRHOdBrjK6s2IxqYICrSwoPT+L8?=
 =?us-ascii?Q?cL+iKLxH+CnKBWQWmwDj4e34VoRNVKlILp5qbONBZ55slmL2xCkMJGyQWn1M?=
 =?us-ascii?Q?mw2eZuENxSbKJ6v+IlrEJ8+hW5tlIEPSlRc3Y9WAgQliu36l3x5Z9Vtk1ybk?=
 =?us-ascii?Q?hxIk2qSBHNizr6BcfD4bP1A4YAU7o33oqp9a0PU9pEjZUH3+2L3JWZqqR8i7?=
 =?us-ascii?Q?JYmTfCKQmk7q2f16+47mH/wW2IHqYK36V3Om92XELSZ2U/iUYA1S2H5B5yy5?=
 =?us-ascii?Q?lXLVNrtRXxXH60Rqfuma+IH03RY6mo8E5BSa6cBMiHEmWHCNNVNA8XagR70k?=
 =?us-ascii?Q?LJq20Vtd06vh8vOACCu/2pBxcE4Cz9fW0FfUxH09Lv93uOtO2mIY2gVbfWuw?=
 =?us-ascii?Q?DshAFYplDipOaqtU7gN5+MEAqTYmwGF83IRe1GoRTdHmenuCcdJg9Y8nI5ch?=
 =?us-ascii?Q?rtB7O7uCzckI2NFX7FESvdh9IpBJCPAvxOWMeXcYeDedm+eFLozWBGI0LFk9?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bfjPuF3x1KrD6ZR7B+NCIIFqiyWOnR22DABOnLiAtapOIeWc+d3y++xJnNaIzaY5x6BaUcufIIg6qL5hF0Eap0X8k8aW42YJAvOMI6kqzBSswvBSM6jD30qA3PLpG/T9PhgCJ0eKaCYLav4MZco5+LDWHW4XJ8eldkQ3gs2yTaW6p/no34/GpopekLusizjc4wNhvE4qLjjR0YCy/0VDoOVKT9jC5c/4xlysVE7rSJccvlJZCyOKQYDvEuyaHBHdiuotRiz9tf63IWhuhwcFXq4wcgeC34bQrgUPsK+JBvW2BMSBmfHb2tYXTihK+L7SsSA757M+/k16aoLATWHM8M2L3tAAQldvyxKZpwCC8ar6wJXKXKosHT6M0K6gzddL85KHjr1lP+kOnq4Xkebv9kUUlMWE8Yi6qpVKLHQ5onwGyBXcqyWiDosvzG1NRea9GwNwxnbO+fks97iTdRTW8RPPCCO95Kbtcd7SeLtFPCWwU/r3Hmq/Ab1XupsmcyfLCVIaGFCoDJjwHQ+UmNUZvEftzjDjzHasKqtu20BlPRhyJ+/rMxjSdvNP4sOwhwV5HNiUrDAY+0b/aTZvLERBzWqzeEx5+FzfQTlLpfo9GHI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaae08a4-4223-44f6-199a-08dcf9d30f4b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 17:40:07.1014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgN57AgWdZqLTk16aB7A9Uem/nSR+ymPCkYoCd+p3/xySfgCdpBP8pZtHam7HYtBVuEGpqOwdvOcf0Q7y8BBhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4230
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-31_08,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410310134
X-Proofpoint-GUID: tgGbGv9fKhSWyTUUwcp-8uPGWj3yaKnf
X-Proofpoint-ORIG-GUID: tgGbGv9fKhSWyTUUwcp-8uPGWj3yaKnf

You need this for DESTDIR installs.

Bug: https://github.com/oracle/dtrace-utils/issues/106
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 cmd/Build      | 2 +-
 dtprobed/Build | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/cmd/Build b/cmd/Build
index 38a538c1e3c9..98d0ebd7e5c9 100644
--- a/cmd/Build
+++ b/cmd/Build
@@ -50,7 +50,7 @@ fi\n"
 
 
 install::
-	mkdir -p $(INSTBINDIR) $(INSTSBINDIR) $(INSTMANDIR) \
+	mkdir -p $(INSTBINDIR) $(INSTSBINDIR) $(INSTMANDIR)/man8 \
 	      $(INSTLIBDIR)/dtrace
 	$(call describe-install-target,$(INSTSBINDIR),dtrace)
 	install -m 755 $(objdir)/dtrace $(INSTSBINDIR)
diff --git a/dtprobed/Build b/dtprobed/Build
index 7d98ddf836c3..c43b62778381 100644
--- a/dtprobed/Build
+++ b/dtprobed/Build
@@ -57,6 +57,7 @@ install::
 	mkdir -p $(INSTSBINDIR)
 	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
 	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
+	mkdir -p $(INSTMANDIR)/man8
 	$(call describe-install-target,$(INSTMANDIR),dtprobed.8)
 	install -m 644 $(dtprobed_DIR)/dtprobed.8 $(INSTMANDIR)/man8
 	mkdir -p $(INSTUDEVDIR)

base-commit: 33bf8650bcfef147d464e8eecb66d552313f84b8
-- 
2.46.0.278.g36e3a12567

