Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BD6247287
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755206791; cv=fail; b=lODwh7eYYCIfQ65KqE6HVxBMYEdEP0xmmgSqJZQ8JzYIJ7c9sV2lQSW7nuY9SFAorGucbXCjAOFbJje8njayvnoqq2xiRsuRO0wx7veBSM3lmo8tSk1pjUCo4YGsHWqm3jGPrRSieRSHjvw/0yGUOLxuUmT4reBArmVJP0uNmwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755206791; c=relaxed/simple;
	bh=ykvBJtqI3h8IBEM6eMTNKloO1yeQvtCRWBvYt8rm4NY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=id/Qt6lOp2zVe+sAd4jVVz4/LeXtt+DOHJWN5svUiMq05/bzm4aN7WzN4RGWDxxbYek7N44+MgorL/x2jU0GtrNBBROvEU8MSfG4JLFBQAL8mcKMHrjr2MSwywaM6oFFyp2V3ir2XKBCcraxU+prOYOEbrFWrLGkZI1UWvv0QGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PHUYYzjh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ok77zJED; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PHUYYzjh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ok77zJED"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHg7Y2021875
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ncS6hBFBfW6zKJFSFDbNIKbvUYC/u8++Vr7gBaWJxgY=; b=
	PHUYYzjhEsg2uEnuDjTTFkJ7lEv/uHhp4tj+UNgfIwZwZuuzllHtt0Jo49YuA1M8
	n+MATsLkRDe9K9nPCPcER6IHHi5VsdYOo6fzE9BSvy8LmhmYXXxJycqRiyuuWGwb
	KltXcRVadVyZG7Iq5fD2GNyZKYbhBH/vyN3KpvptKREjU+RRMTEe3xZT1wSXVNjG
	vwFHyxQusvYGOI7IoS2tKXJp/7V+bVBIADVC/N9ha+UzOAUDT/4KXnXU5UayEsGj
	zmZrG9+y33ENuEneB4ZvRpSLdO00F3XvJ/8+sfXxAwKhL6rMjRjSbPl8srTu7LC8
	Yd/c+Bo2CgyfWpcq3WkD0w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcfb43s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:26:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EKKGwn030149
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:26:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd92yu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:26:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wONENKytq+LCgGwwdVGz4xIuK1lIZtzwWghUuqX0lqhIwQeUGHoxqA8bvrKVmbeO6+C02d3R0enTDpaDeSPRBTN9e57kxT5yE+fWBOT9QhfGv2TDR8tBrZiP82IN03fRlbEgragX5Y9hRDF+kFV3c6fRfZ7WTjQEG8DUucco9MQAK6s7W4ojE62opHDjpUNE+OFG0Y2sEZjx9l97ZNEJp0sHNc60HQomsh5iE0bAjY85mRRIA8k3i7bPR8Vi04wGCP2sz0TpyZbzkL12ko54SQeHj4P60qkR7ltTI4dpG/3mzjBtsxqduIR5XPIwHepn0O1RBiWwJcVgec7MiuXd5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncS6hBFBfW6zKJFSFDbNIKbvUYC/u8++Vr7gBaWJxgY=;
 b=QbbVItlp+jQSGNR2jTkIchVs7YmX45IOzoy4VhnJKXyH8TsOk3uydZzZ1Az56+malfg1BrLdLbm8udLHRADd5cLztb5ay7eQTqtupLIFNpkc7Vpn6XPGh12hhY4c68qcpMZxlwgEXc9vAKkdBr+YdqdnDoRK3+V+CcscwegvxGr3T/bs4zQKc0avLWBapJ7tdmfMw4MDcl+/eXETpAuJkJu9qILiN3XosJo1sps/+OKWnH7BvA2vo2vokoLZAN+FZW0NvWFNvouZZwqzFZ1KPZEEL8obPQkq2R5xbv8snVepmgbO4lZ8ya5gkJuZIEHy4FIrfUA6yAkdH8cTgfeKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncS6hBFBfW6zKJFSFDbNIKbvUYC/u8++Vr7gBaWJxgY=;
 b=Ok77zJEDGFja9lXAi+8tnujB570TuGROVZh4aKwNiAKlS6j6hB0V4uWd2PbCBKU3RCTzpfVkx/UhYqoPGTKy5jv0bGUpH5cys+Kas2He1UUtHfhy8/EhZ/fFWQuowbpm8ZEJxNBkpZmRhoxFZuzltErU3frVDXFozAC1tO2yzxk=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ0PR10MB6301.namprd10.prod.outlook.com (2603:10b6:a03:44d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 21:26:22 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 21:26:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Use a more ubiquitous probe for return()-action tests
Date: Thu, 14 Aug 2025 17:26:20 -0400
Message-Id: <20250814212620.12497-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::29) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ0PR10MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a3847da-9722-42f1-6d71-08dddb793758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L7oph106Ck05Ox9FBqRy7QCgZiBRjBqXj301Cwnpcwv3O/05YYd6kyTavu0k?=
 =?us-ascii?Q?gQTdwS6uPYie0Joz3Z9saUnCTHPD/o8HNVnmO5iC1e2KdfViDDSIWv1YngrR?=
 =?us-ascii?Q?tRqSKP+HBgSo0AuuFpXp8Xp+iQRKnIM8sTt0KIurkDnQ5nTZu0RVVWpQ5Yq3?=
 =?us-ascii?Q?Dw7gk2tVlWWDyEfnhqmoA/NJsTVVJTqITwa/hih0SBxZ5m3iEWXllri4aE0L?=
 =?us-ascii?Q?9Jp4uc6Cz+IThvG9P7qG+wdNkKbZFYbbuo3fgy9zuhmp4a6wQ6kS6Za1XDyZ?=
 =?us-ascii?Q?klGjLUi5O8KFYKuW+ovT2QeXa0zNGrqNDNOCUE8NQmRS9TWqXui+ZJoIYj6N?=
 =?us-ascii?Q?KMtyI+q9Zo7qLBKAHV38nddqp6FkMgHsJieexjNUTIhYQ9TLZNvwjvTUV9bN?=
 =?us-ascii?Q?c4FS9d/rY/bNT/mw5A5a9y/2NYvmloJaQJvADuVxvlez2WoYaGw6fMQ8B6dh?=
 =?us-ascii?Q?pt7zOCMUG3I6EQsFVnQTf6Xre6wmixBDCd7nVvvFaMmP/fg4+m9Gg3UpqxFP?=
 =?us-ascii?Q?CK5AqfHcYrNcvOZG1ay9epLDWHp/y7/kkjNxXqLDCp0HCuR7eC2dT9pyvvfy?=
 =?us-ascii?Q?ucjU35E40v59dhR7X4M316HXPKAjfbGxziR87bCnYC9c/q/uS84UM5cJEmCY?=
 =?us-ascii?Q?QbE4nEiw2qmdMWBTas4htzcSbwz/FSvOqSEITrrqgIjQr7zkmAVdHQU62Tv8?=
 =?us-ascii?Q?5tZhyn8wPJbS2Xf/Opxp6WfI8A+Lc6rEetpcN8YS6UiSogCudHQM0sh/9ROb?=
 =?us-ascii?Q?s0s/l3KT3/ZcZJ1Xh7V2OE0UjZs4JnYGWdVnypluY2xi5nsrJjFVFmmrb1ja?=
 =?us-ascii?Q?7tLewFGOyLge5GbsTjVxX526bty5tieHJIGfE/pIla/ZhjKG+tKdovTL4QOR?=
 =?us-ascii?Q?c0OQxkeu57/JSDk5dhSJLV4gbjm8TGSCJThgx4jH/qte+cPgdNShT5GSlDSg?=
 =?us-ascii?Q?8/5ynO9q5iUUMhXB4OoBwvHTiM/2mndepyA9M1dCSD0TaDUqZebGsrwAvN0A?=
 =?us-ascii?Q?lLwMd3kWzerkVuVdiJ3Aj+06ALf9Y2BhgOBCJ7zu0WFNfIHqgGvADlmqpkAx?=
 =?us-ascii?Q?O9PkhIxscRDSKAFxMvQn+ZPSxZkxf2dqqE/9oNJaykn5G6eimfvpduI+xtA6?=
 =?us-ascii?Q?+R4PH3KQ5pi5a85aMPP5U5H17hfFq4EQvWQA0Hm9EdNiK6j0FVIJ6b+W/Yp7?=
 =?us-ascii?Q?rbczNgDO9Fl69fKeDEECycfisPXi9dn0ij9qDM38UdvE96V3xIAVpT06oLJ+?=
 =?us-ascii?Q?DGyHavAFRU7X+wcx4jtgLq4H8ajod+EY4uskHCkyxf2qmg1Va+l4k40DO9FT?=
 =?us-ascii?Q?H6d8FKKnnyRKHMY34kHbwW0UpZg1EtnEkRSkTk7wXXpm1Q9/hpREvflFV/hj?=
 =?us-ascii?Q?8xzNbNqYqeyW4kWIGVM1ACiAmctlTDewmQWitkirt7Bzj7fq9tW4Xf3FUbAS?=
 =?us-ascii?Q?0xDxifdNlV4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dKwOTFtrEF4oB+socxXArAZXp7KK276ti1uiBqm8S8y4ec7d0ZUQXRGoVDN3?=
 =?us-ascii?Q?l7PdkpVuX2ar7FQloI724laWOt2CmIyVjdt99ZXwink1B/Cmfn969Imq3fH2?=
 =?us-ascii?Q?F5vCMM1a6UOqnkcoTdg+rMa+bNybTnnasOWGgvwUC0+BUWEqgF7fntNlyGwD?=
 =?us-ascii?Q?wnwy9nlXl0GjTd4G1M93HrbBU8Z8/VQdpFSF5uqdp2ZQsF/+2MiUeNzoxOC7?=
 =?us-ascii?Q?s+IGSEpkDO7fNU7udiLRyDMfxYVSAt/URja348UOBfi3yxyPNoD8OcTjO2Uu?=
 =?us-ascii?Q?lp49rSLZcQl1gGEbJZwek2bF/MTv6MZn8kn8ld0l4lrh+zxNfoNWS+FfFI4G?=
 =?us-ascii?Q?YjoaCOqA+HrAvIZMVKKXqBBTe/AR/kK9jdua8k+RJRsTV7DsEU3A8H7T0RLG?=
 =?us-ascii?Q?t0fmI+2tmjwlmir3K8QBIPmZbrLwl1+0Du6pAdaD43P9WKnbKQweYRcc91va?=
 =?us-ascii?Q?iSKQd0UMie/FeGVNxjdh3cyOxUjyMpAAo/qf4O7z67z/m4Sp/yvyVE7hfvuy?=
 =?us-ascii?Q?TQ/XE5cjqLQREkL8UNO3lx6NzzCBB00y5bWlZRj9dWq1rdDBbCkhYqL1xFID?=
 =?us-ascii?Q?XLSV1iEp9rfRp4SApMDGbKddRJHfmiA3g7H7EqFn4edbkDVimawjYB+hYbv1?=
 =?us-ascii?Q?+iqON5pAYCldDiiLo3lxFptXfyCczGfzt5Ji2bNjPzNGU6GlPt7L4+l+M+0R?=
 =?us-ascii?Q?H58TDC8v0He56rktuUMTrmzXYX3LXv3RafULx5yjXwM/pAWUp/wHNqox62/t?=
 =?us-ascii?Q?31xigMBOemVF/d+6JKhJMytL5YeDBSmTVJ8NW3PsZ3AjCvjbQpxTKqQ8H/uF?=
 =?us-ascii?Q?8sisqSg/atfC6yZn1nIDXP3gKSZ8vycxEB9fwoSUhZQFT+QSXz7qbgFFRDDS?=
 =?us-ascii?Q?tvsvnq8YxE2lIFzUemjfH6y9ujtrED0hsgHmaVJAQ7NoIkeEYU/jXL48j624?=
 =?us-ascii?Q?EfySWRAcN0A+Bsx8NZTpLlnHsw7GnmeRm6vHh2/e4cJb1Hts79p+Zt8ucZFv?=
 =?us-ascii?Q?5hg03ypL/OZCL5D+SyA+g57Lz5yOWLioxBkI+8xatgGx0GbmhYD7eDVal7PT?=
 =?us-ascii?Q?FzLHcaws6+D7YSp0V/x/PHg2kSm+o1kqa7liM/3QHiQYdLeIscUqvNoiTPWv?=
 =?us-ascii?Q?ukuzm7nL2/a0iOhAn3Ff+zroBLM9/CaxeFBp1fzUPD0AKGI/lxrY8rgKDPFi?=
 =?us-ascii?Q?VH2TIFRh4LAeBxlKRFHBfbEGaRtE6gJ2rVD6xyYzPiDshGe1B9nYy3ekPVtT?=
 =?us-ascii?Q?l1JNOiZ+D/Ofe4BHK1MvVU25iL9N6+nr8wrf6koOUKvxRJU8EfKVPJik8zPV?=
 =?us-ascii?Q?egWho5RCFziXbA4dSBx5uEVjQKZWBl/zhXlvpHpn9a1UHOi6oIeU7LLJyYLF?=
 =?us-ascii?Q?rDPDacG21OqEd/1bcDff0D6QNv/edeXWXKcmI+U6H2pLfUTdVdv23ZxzBhx5?=
 =?us-ascii?Q?S8fSOpmxJ/SwF2vXVHh82EL1nxL4tIJG1T7S16bqId7e8RHHp82d6sfvmn25?=
 =?us-ascii?Q?qUaiogOSK9aAvf5FP+vL8PqylCvUNj5qvw/zGewNcfXBQA0+ZjUBukdFbmI6?=
 =?us-ascii?Q?Fld1nXdwriTSx9T/pQpXLk8SKvx+U8yk7IGWwFoY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vwfXi1I2AqUyMMTk2M1kopbZOHsFuFgq+/Pz97bMGDiXmyAu/DNp7jz7dmvJtffwtIhXFdabLtQeuJ+Tlku4hfvuab2/NP3kUbg3IpCBIS9Y0MqhmxJkyVeG7ooN8fsONXi/ZWrtQdKJ2fkz0GIgr6rouArsFDVZcYxRuVkFhbsByp0mowYdZS9prYEW/Pc9QdTwmuMVyQV3zkzf8uqIPUc9Dw4Ebiv3YFPdJ4zP9hSeVzcQQp2kmwp+lVGBZVSJsquNjtKSkuqxK2ZTz27IKQ0672dq5D5KW+XAjoGi+juEU14aaeG38so6hHYpZXlInyeLhwxwXcwhBhI3BS+QoekyJW5r1cnOPWS38cndBV9O6LcXdxdiqz6xUO/3oX3Libhb3wc9qO09U/OaXzPXpNcsTb+/m6SiojGZdTAzPsXuVCdMAvU/SUCfnog9X5wFU7RaCLFC7K/sbLMuM0ej/yYgdw2uNCQ36X4sHY1qOodKmkahBX4Cv0A7a3ScBFLrLOEJSk5D7i+2x3SECtrsgbzzvQvF+tXQ65C8Pj4tJW1viRexdlhne5NSRApqXIZKHvhgB+Z7a813CcgUTAu0TLgcAmPZIe5FUbjFHjVNL+4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a3847da-9722-42f1-6d71-08dddb793758
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 21:26:22.3927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPfrN2Kjf/yNlKx60F14YbMjhVJh1O8w/TL5rq3/QclblVBRl/T7iEM0ZAOVKGnacqDaCgOyivORLQFh0HH6wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6301
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140183
X-Proofpoint-GUID: aDnxbBvjcyIEZDTL-qSMimTt56aS0PfK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE4NCBTYWx0ZWRfX4nVqpzIoLt2R
 F8o89+oZ3vKG3sDPiV9eBArTo+5ZL4TVivZ1XxajEWB4QEX2JkN3XSxcgnpfQqwS/mD157z+R6G
 VhcDz3aXanvPwnmXw3JRYroo5Mf3h2zJLuRHKemaTpvLssa18A2migSNdRfiKjPwoeKS7o2+y+U
 ghKjaaqYjnmGTcRkHeRZrX94jedWbEHOZbq1/6ZF3sMZfKPUcKcjEEj37CfgQaEZzURUQ7Dpr2u
 OTIOCl+jIX0M+iUpgk2sGJb8JyLWx/bGZzuHYTUh1uKnLYGRs2bRPua062a23QAvO13qRaMSg/+
 Q2fVq61jNWRzklaN4ZHn321GRtegkdTlqsE1N3sr0qwUtZIVimkq4p+Hlk3jyiq2OboHsc+lyGv
 RZKz6g6wLr0Q6er5dFhR4yLG40mlR9S4ufyeS4A4Z5IlI9O0FWped5DXM5Uz486Qx2EwM8ld
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689e5484 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=GND9N6i7tsATeOgBL_sA:9
X-Proofpoint-ORIG-GUID: aDnxbBvjcyIEZDTL-qSMimTt56aS0PfK

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/actions/return/err.destructive.d | 2 +-
 test/unittest/actions/return/tst.destructive.d | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/actions/return/err.destructive.d b/test/unittest/actions/return/err.destructive.d
index 4c6f788ec..9beefbf66 100644
--- a/test/unittest/actions/return/err.destructive.d
+++ b/test/unittest/actions/return/err.destructive.d
@@ -19,7 +19,7 @@ BEGIN
 	exit(0);
 }
 
-rawfbt:btrfs:open_ctree:entry
+rawfbt:vmlinux:__*_sys_getpid:entry
 /ok/
 {
 	return(0);
diff --git a/test/unittest/actions/return/tst.destructive.d b/test/unittest/actions/return/tst.destructive.d
index f1d9e4d32..25813b2cb 100644
--- a/test/unittest/actions/return/tst.destructive.d
+++ b/test/unittest/actions/return/tst.destructive.d
@@ -20,7 +20,7 @@ BEGIN
 	exit(0);
 }
 
-rawfbt:btrfs:open_ctree:entry
+rawfbt:vmlinux:__*_sys_getpid:entry
 /ok/
 {
 	return(0);
-- 
2.47.3

