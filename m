Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E92D1319
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765479622; cv=fail; b=W6+bFRGZSK2dxLxo4h3DwGsFJ2RFgRnQHSYMc60J4/QRvdjcGaCqf3SiZ21FalUsfeE1KMekBitsO9xQadB76jmRXMoxnLsl19XHiFLLxHOgrnzLh3nQC8ST2ooQh5omxPdAjiYtYO0lqoPLucn8aCHtlBBrBBjZZtbBEHySAO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765479622; c=relaxed/simple;
	bh=q+BcFbGedOVZ2Q0jMaqVuebEf6Z6nbj+m209e82nqoU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NCx2vl0fA1daFujZxLfesdjBlwEnRnXUOSQKyA3PfpTf5BzD7Vo782oI9F/6ZoWyklmF5pvae3VTENcgqsnW/E3z2zZMPts1nR3rx5Yp8iHTvW5o+MMYppk6fu9lMAGysLyus+cUSFaZRdU0RcL2h+CpYjgqIhspg3BPon7KeuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZS+XQZWN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MJmyxTPj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZS+XQZWN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MJmyxTPj"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBG5RMh1894773
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=EuJ+/o8WfVAZorVFwzH4anV3aQQOzfP89sEUv9vquVA=; b=
	ZS+XQZWNsUjsu0DZtgvPt9jidG+e2NcCeI6jlaxuKgG2alt1a6vh+vMbr2JhdPjY
	ldFk2KZf5wNEo/jL84lMmTmyJScln5fVhrZEPOgaXMyaXW63TASNvOx0oU9NOdGA
	z3rtvikXZA5dWu7upIbxTFuPFrdMdP156LMfAwp7rcOqrIK7CKLz5XfTkPhh9zsh
	0ZiSKK+wWwLffvfYIRlmda5nz7AZCWm0+vuDkyLlaC3en+kIXBk/2q1af9z5lse9
	MHAg/K4UaaRsFPU86jo6aulol02+ftRkTCTSIEp4jFdqkhseUf0UzzfMI5idxgi/
	4Y7sdbyHqScpg4LWeUTC5g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ay9y32em4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BBIGBxR018194
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:14 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxbxgtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAFXb9tMg6eNHhu/Wh/Cd1w4ql4/v5i3nEs0Kece2wNvqbA68XpO+emULcfBS6vcVZOIYEUEdZ5CFzsENPxk877CQK+HXpw3wUYhbpoAgSCtSJmM7YbIZn8aJIDgYcYIMQr4FcAMeYYuPUjraQAAJHhXp5avxNQz7ClyYDzNMBueZccs3JYBzOnmFL/8AcCdydASIbO2OEwhSKhXMPCUOr+HMsMsHhdW60C3QUr5uZJXaHY6d29QQrLT2IbbhcqinWf0M+sG5RXDcnUMqDpwrmmeg7zzSCU4Li5i+ewdm7xrrq1rs1aN96Ofl2vqSIw3J8EC1EA8Au/2iZJVKtrQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuJ+/o8WfVAZorVFwzH4anV3aQQOzfP89sEUv9vquVA=;
 b=hISFL3GE9FBkJNxMhwF3ZzCv8CmW0eJoXU71RlMa5aKHynGcY0h4VtU2OR065qbzLB3PvuEoWLw9TtoFh+W+vOJ8eRDJ+/3lIRBbc6bdrpNgqH97veQPA6Mk1iI1RvFkWMQZexrfDVQNt/7+RAJJPujJ1Z2nV6mylCWpscGqvMreLABuq6bBuQytK07KotopM+DiQfUJ95J79pNXb052iGazxl178ILuBEKv8nQvxToTKgQ3Kvaq1W7+whtudTLj6s9/MUq2K340RkzHx+v0WoDZSelFS4id2xFl5sg49pKSkzZG15WLTbaiGC1iLqOg9CsmpDkTQiMgZvKmAUhtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuJ+/o8WfVAZorVFwzH4anV3aQQOzfP89sEUv9vquVA=;
 b=MJmyxTPjipIFaj7S+B+9cyTTN0MQnMc0lDk132lzGAir9q5HX/AP3T+N2iPLJSeQ/X7mKyOja67boCtjo2urbtJxZWGt0L8bXZjoBSiEN39nJyefLtzEGfYWfhzcvn5ZOI3lpPBGfBQtyR4m0hLVj7qPb1IPgwrfoUsaga/TYFk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB5073.namprd10.prod.outlook.com (2603:10b6:208:307::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 19:00:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 19:00:06 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] doc: Move `` inward
Date: Thu, 11 Dec 2025 14:00:01 -0500
Message-Id: <20251211190003.10486-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:510:325::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 291b496c-3e9c-4d33-813a-08de38e77f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fn4JrG1mhL+FDe/p5cmNattwSv8qHOrnQF7hEyBSYgPjsQjP06ajku/XW+pD?=
 =?us-ascii?Q?7ZerE7yL2VmbnB5RNWVoceAteene74x8ZTrihyoVUvykGRb4sGpPGHowYdsF?=
 =?us-ascii?Q?r34bTwXnR9mM4YdCLa+lts5CuzTsDAKHgpuRz7acJjKAUjBRI+qkiAMoTPkU?=
 =?us-ascii?Q?YaN68oj61Xsq6+97C1Xl5MsQQi0zixEEwoDuMkKVTRRvP+ORLDgtaw5R0Ij6?=
 =?us-ascii?Q?rv1mSRt0a3YoDFAaN1/nOmSVwi69QsZcPuC6BRXmht+FRdMhSo21c1A5k4XM?=
 =?us-ascii?Q?Ol9+gELlgTNwbCShX3M8y7o7KLhpYeDwGiU6WjR5R6Oox7OXZP/sbRbHofJ+?=
 =?us-ascii?Q?R+BDehp5Pzh2G0oDAsw0XLSXWH+zsjgjipDi6iS72vffLUNj77PzTyUG72Er?=
 =?us-ascii?Q?+w4tUV7M/1I2tIpthvteJ2hJRJIiEAZS4HJp8eu0AU7YDKuKW4FxtNKzshyY?=
 =?us-ascii?Q?Dmk8375lAc62S8/jzVcrxVf4GevVTIw2Wdp6qZC6I4bAYwjAyefvE0j0AIPR?=
 =?us-ascii?Q?5iqyPy+2YcpqcBpKoxloT1wJLdJIytuP8bM6qH5fWo4gH++pvkSVQFqTcNnS?=
 =?us-ascii?Q?5jkOI4RTi8XONEHDAJWNRxXAD0ujJaMqvCdiS5xkfSE/KklMWQ540r6EK1v9?=
 =?us-ascii?Q?XqL3FekqVc3512hMT1IU6jma1b3ZQleevBMM+StEGXVItjKLA/BQpIrjjWdo?=
 =?us-ascii?Q?yfyrXP6TJNj2VSv6iKcE9kC2wbz/K/VlJQujs5zK10SNiq65a2vKntkp6Bgt?=
 =?us-ascii?Q?zXLr4iGXXLt5gSbxLNv947G8G9zCSaPjOb3JjO7QpOGOYdMeldAPDsA7djbk?=
 =?us-ascii?Q?QakcLsFbi6axWnJtciAcQWQpiBuod2lKMpVbaR2Dm6mur87ks3GaD+UNOYfi?=
 =?us-ascii?Q?5ZEG0mtWyMymHou30LdvObo3mXBPFBNwNpdoxggh8E/Pd0xLyrmXm2B0hSO+?=
 =?us-ascii?Q?dJHAYJ8Ki1wnrGX3EkieI6FSurDJ4R/t70Ur0AvA9aD9U4JP6QaEzraFqdQC?=
 =?us-ascii?Q?rIH7hVvIq2p+eQDx6btnRaPizG+bKRPKeUFA640id45uSXrGAkDCtyC4lmze?=
 =?us-ascii?Q?GmNih5y0hfsxuqEDuMK7ZdZOy6zPv/zsOJ87UjtKngrn4r4mjwCuAZfERVXD?=
 =?us-ascii?Q?yoeoPsGc2RQXmRcXqfGBo0ewgUpZK7l6ZVmBUXHfRKb9LsaOSWMz1B5+o9Hl?=
 =?us-ascii?Q?cJhKtkaeRh1OyG0VNkPjGzkFW7Kg+h7ngvt8vczXxsUfCx7z6L/Q9a1PwOo/?=
 =?us-ascii?Q?6N8Tkxi3uoX6bwfeDjuaL69zuZY+ZZF3FcvRPRuINNMuJeBQKi4uF0KrQ4F0?=
 =?us-ascii?Q?zT44Y3Y8H22UvvFNaAdvqbiACycqI0spxUAnCjc8KKX8nVBbgUgU+03Itr5r?=
 =?us-ascii?Q?kxISNtdPh+3dbb0OmCYY7tgPj/qtDn5r02bivOrfzrWpSul3wC3S9lCoqw4C?=
 =?us-ascii?Q?KA1h9hi70/dp0FLk2pIcZPUQ2tcVu7do?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bZpK42DH5GTglGSujYUxo7S7ZVCH9+uCgqzUQ4+diu0i3S8zaRExqFI2onGI?=
 =?us-ascii?Q?Qp1CpHUXylW+XGp4ZqFGxt47be0FEj9Vinj/VNmr0EKiN9Kr1+gzZhmzpYo8?=
 =?us-ascii?Q?TFIsqcRj3zvKQszcKCs1CBoR9NuZFbk9ssQKAU4iNfbB83nsESu295RX6n6o?=
 =?us-ascii?Q?Lb0lZ0FaOFNIy2uKF1woi3zj1Xlqww4DgSFGBS1/qim1+CZFf78pBuu6PgsN?=
 =?us-ascii?Q?yAe+h5adu4dgorGFsXcICxCW1xgu1UnoS3m46WdJ777yffJIKQCTqLgcY0OL?=
 =?us-ascii?Q?n0MZ7qpcWS1KWXiTO6ZOW7CVHCIX89ryZAtdqqKO/HkWYCMyb1ns2M9ySTCm?=
 =?us-ascii?Q?7Wa7MJdAu27+uOd48HOHXZSs2utmGrelUTlLBMfPlPV2h+DI3wbr+ZBtUtuL?=
 =?us-ascii?Q?/LqWRD6DLdJ9ApI50Xwg9uba7vphC78l88U2pKr2AjRtVFCodQ+TTAPnHpC8?=
 =?us-ascii?Q?nzvFYTgyhGryjlsYVoG15D95x/Nu3+XoS/yfHjBFCmVmQG0j8VB3aabceo9m?=
 =?us-ascii?Q?VY7K6zy9oeyTmb1kCTckmegJNzmURa9NbPoecAr4+YFsUtytq7fHywORaYkM?=
 =?us-ascii?Q?8rwlq+J1vN7RN1uSKIPMceSyWEyJN6hFZ5tYI547K8YcEq6fcm5YKdEF4baL?=
 =?us-ascii?Q?Uh2X9MSbuEdIvQ1NfoXV5YgyKuU6homKcaoH93FOkZSDbl03ODfSYSEdQGCt?=
 =?us-ascii?Q?sOKYKjO7LOsoDOxozZNiKInGjzZnQ7lM9X9FgAOnL76OpWWWdRkFWP5vPGQB?=
 =?us-ascii?Q?W8epS61M9+WLP9V2H41/Bzg/cT3wW8k6oDvNgVQcRYDfsD8DOjtVsl6Gdff7?=
 =?us-ascii?Q?9T3iq8CRL7ACy9uL+xxH75XhB20WfOHOOMtIZrOUXzUCnkTAdDwsAzYtVd3f?=
 =?us-ascii?Q?3PAWmV6sEKodwh8PTJCetcVeUn54azALF5cjk5qz6vlxQhRATghQ5sYddMUk?=
 =?us-ascii?Q?lxOktA5CXI2u6+jCakipyd6zojSDwhrTKsz7DAQ1BnagLHuIUD/Wq384tg7V?=
 =?us-ascii?Q?tM2q4giHD/uRve6V9fbB+5JDrBQO4RJ6q4gqaEeSVyisZQG44fRpiJ84qJ/H?=
 =?us-ascii?Q?IZxyzoCqn3ooMMh96ebKyJYq+1gJ0r99hO1l/MKJsighCowGVw1PcxUu8LTl?=
 =?us-ascii?Q?Kpa0EOjrSgjXYjFPsk36vNQzPF/hxf2tboCsoaGrgFK/ZqJoPXHifsoGi/hU?=
 =?us-ascii?Q?iPpgylk63XqpGtu65I5cYoGI4OKX2cbJ5PdTePUIdidAQ/5fMXzLjcfdeQL7?=
 =?us-ascii?Q?q59zo4JEBkGnvRYd13Hny0oWJGQze9sVb8Edet8KiylrAOxqRgfc2Bs5+9f+?=
 =?us-ascii?Q?pG/tggLf6lJHHI5dTodzWRavAkkw/O46ec5d9bTw2wj7rZVeBYoqA2qB0AYv?=
 =?us-ascii?Q?FW5OcytXW3pvDoiUXVrOPP8KVtQvYOSRhBvturz4Yj1l59SaT0GKzCdHnPYS?=
 =?us-ascii?Q?3rn8kOyvDcJ+HtraZIzr5J58lGqcHr7OvUKur240cRBB9vjh2PoUEZQ2u9iS?=
 =?us-ascii?Q?vbUn96ZUuHW/UJ8c2qiuX82Kw7+k9EiNYEKLxyQoHQuu5eJn6F2wTfiptCYl?=
 =?us-ascii?Q?GccjOZuht3fMvnwIcmUzvb1TZPAlQYezs8ODVKHp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Be5PYmvHK4fX2sLx4+Qovl5ufPaFEgc7bW3AxjTdQTkZ2NTzKn9xjNFfS180ecCdUyE2TYW6naG6AvRAu8GuLiHLNiLSIAr/FnlUSftpkLDTOBfY11hmGfXTOY7uNtYpxdKNYptGsGQi7bAN9tRRS7VSDJ8gg9ZHtxmyUReI/jMwKtqQRETpOv+ASfw5slzJ0vDzC67WmmEJXOKrnzH/Pms6lprW5+ywAYyLIz+NK+yv5qv4FoZFMTFS8+OyPf+6Q0PSD0aOH42AAWeJ/sUzJbxkzNJujJYEkAFPVRZtY5BudLxXtP3fUl3s0Ux5xmZ5YxnMmiN5XN7ZM4vkeSVZq+7kUrJKaS9syrjfTw7zUsdl8nMvkIh5usdQfUKWf6bIdY4t6CLvAqh3FrUt50USHF7QOe1IvwRkXCX2nFQy9iZvwaTuV7d/slKnoGzfFBQx59SEDJu3GrBFZZQVRVU+z5JCo9xj/5U829ZBViI0SnkqpkvrL09m9rUVCVAdfWox8h9i++8yhn9DPDuXZboyZgLYhMiRvFoLKdGU90BiBns6zgPZiNytVOiBPXqStMG6+77n98LiXbsK8PTOvtjWQqLBubR/5CzWokAwOfPxKxw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291b496c-3e9c-4d33-813a-08de38e77f5b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 19:00:06.1668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNqwDhWh48myDLAD43we6AlFClSTq00ng0GDw91fPfdOaG1BPWRjaq9sEhcsA6HvxaKZW+xf3Tl9DMCYWtPqAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512110151
X-Proofpoint-GUID: Tnp7ahAPSETmMTHgAalxpsySdJILKRz7
X-Proofpoint-ORIG-GUID: Tnp7ahAPSETmMTHgAalxpsySdJILKRz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE1MSBTYWx0ZWRfX4zV9y2Q0gaOw
 Fn8KpQNzX7HXPWmxNYKV+5EVknmjuDQF9wMUYCzPvIJSnpKS6d9I3EFoKvFXrxTDfsSyjQN7MGk
 6De+wh/FtMcMsYuTpoyyyZyUOU3BVn0d4GaPAGPvShXFX5j4+v6X8Tqy+IcCQMsIEO8X4N1hIiG
 qUGgcJsU77dBfkzsNs+G1e1w4QzkXGYfH+u/N5F8LC6MRySwyXJSYLhlVc4wkENgeqetZqv6k1O
 JVNJT4qMygDF7qLst01O9Cl4n5jvuSwTfyOo52oaah7fsiwZNQEymCubX85e2VKqqArhgYcKRUj
 XHVCFuWA1T6+h67AzspouEp+1M6nh4IL7jTQN1DVkVN2TNQKVWjGx8XCNQhpkn/RPUPC84o/EPv
 5aqPfvpgaFdS1autvCtf3MkSiLPwUA==
X-Authority-Analysis: v=2.4 cv=YJeSCBGx c=1 sm=1 tr=0 ts=693b14bf cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=FhTDuTHSmtIY4HC-nLkA:9 a=btWYfFMhfV_a-Ppm:21

From: Eugene Loh <eugene.loh@oracle.com>

No Markdown formatting is performed inside ``.  So something like
`[text](link)` is rendered literally as such.  But the `` is intended
only for the text anyhow.  So, change to [`text`](link).

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/aggregation.md        |  33 ++--
 .../dtrace-ref-PointersandScalarArrays.md     |   4 +-
 .../reference/dtrace-ref-speculation.md       |   8 +-
 doc/userguide/reference/dtrace_functions.md   | 157 +++++++++---------
 .../reference/dtrace_providers_dtrace.md      |   6 +-
 .../reference/dtrace_runtime_options.md       |   4 +-
 doc/userguide/reference/function_copyinstr.md |   9 +-
 doc/userguide/reference/function_func.md      |   4 +-
 .../reference/function_speculation.md         |   2 +-
 doc/userguide/reference/function_sym.md       |   3 +-
 doc/userguide/reference/function_ufunc.md     |   3 +-
 doc/userguide/reference/function_usym.md      |   3 +-
 doc/userguide/reference/runtime_options.md    |   4 +-
 13 files changed, 134 insertions(+), 106 deletions(-)

diff --git a/doc/userguide/reference/aggregation.md b/doc/userguide/reference/aggregation.md
index 5fada5410..4f39f568d 100644
--- a/doc/userguide/reference/aggregation.md
+++ b/doc/userguide/reference/aggregation.md
@@ -17,28 +17,32 @@ The *aggfunc* is one of the DTrace aggregating functions, and *args* is a comma-
 
 The following functions are aggregating functions that can be used in a program to collect data and present it in a meaningful way.
 
--   `[avg](aggregation_avg.md)`: Stores the arithmetic average of the specified expressions in an aggregation.
+-   [`avg`](aggregation_avg.md): Stores the arithmetic average of the specified expressions in an aggregation.
 
--   `[count](aggregation_count.md)`: Stores an incremented count value in an aggregation.
+-   [`count`](aggregation_count.md): Stores an incremented count value in an aggregation.
 
--   `[max](aggregation_max.md)`: Stores the largest value among the specified expressions in an aggregation.
+-   [`max`](aggregation_max.md): Stores the largest value among the specified expressions in an aggregation.
 
--   `[min](aggregation_min.md)`: Stores the smallest value among the specified expressions in an aggregation.
+-   [`min`](aggregation_min.md): Stores the smallest value among the specified expressions in an aggregation.
 
--   `[sum](aggregation_sum.md)`: Stores the total value of the specified expression in an aggregation.
+-   [`sum`](aggregation_sum.md): Stores the total value of the specified expression in an aggregation.
 
--   `[stddev](aggregation_stddev.md)`: Stores the standard deviation of the specified expressions in an aggregation.
+-   [`stddev`](aggregation_stddev.md): Stores the standard deviation of the specified expressions in an aggregation.
 
--   `[quantize](aggregation_quantize.md)`: Stores a power-of-two frequency distribution of the values of the specified expressions in an aggregation. An optional increment can be specified.
+-   [`quantize`](aggregation_quantize.md): Stores a power-of-two frequency distribution of the values of the specified expressions in an aggregation.
+    An optional increment can be specified.
 
--   `[lquantize](aggregation_lquantize.md)`: Stores the linear frequency distribution of the values of the specified expressions, sized by the specified range, in an aggregation.
+-   [`lquantize`](aggregation_lquantize.md): Stores the linear frequency distribution of the values of the specified expressions,
+    sized by the specified range, in an aggregation.
 
--   `[llquantize](aggregation_llquantize.md)`: Stores the log-linear frequency distribution in an aggregation.
+-   [`llquantize`](aggregation_llquantize.md): Stores the log-linear frequency distribution in an aggregation.
 
 
 ## Printing Aggregations <a id="dt_ref_aggr_print">
 
-By default, several aggregations are displayed in the order in which they're introduced in the D program. You can override this behavior by using the `[printa](function_printa.md)` function to print the aggregations. The `printa` function also lets you precisely format the aggregation data by using a format string.
+By default, several aggregations are displayed in the order in which they're introduced in the D program.
+You can override this behavior by using the [`printa`](function_printa.md) function to print the aggregations.
+The `printa` function also lets you precisely format the aggregation data by using a format string.
 
 If an aggregation isn't formatted with a `printa` statement in a D program, the `dtrace` command snapshots the aggregation data and prints the results after tracing has completed, using the default aggregation format. If an aggregation is formatted with a `printa` statement, the default behavior is disabled. You can achieve the same results by adding the `printa(@*aggregation-name*)` statement to an `END` probe clause in a program.
 
@@ -46,7 +50,12 @@ The default output format for the `avg`, `count`, `min`, `max`, `stddev`, and `s
 
 ## Data Normalization <a id="dt_ref_aggr_dnorm">
 
-When aggregating data over some period, you might want to normalize the data based on some constant factor. This technique lets you compare disjointed data more easily. For example, when aggregating system calls, you might want to output system calls as a per-second rate instead of as an absolute value over the course of the run. The DTrace `[normalize](function_normalize.md)` function lets you normalize data in this way. The parameters to `normalize` are an aggregation and a normalization factor. The output of the aggregation shows each value divided by the normalization factor.
+When aggregating data over some period, you might want to normalize the data based on some constant factor.
+This technique lets you compare disjointed data more easily.
+For example, when aggregating system calls,
+you might want to output system calls as a per-second rate instead of as an absolute value over the course of the run.
+The DTrace [`normalize`](function_normalize.md) function lets you normalize data in this way.
+The parameters to `normalize` are an aggregation and a normalization factor.
+The output of the aggregation shows each value divided by the normalization factor.
 
 **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
-
diff --git a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
index 8746ae2fd..78ebfa176 100644
--- a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
+++ b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
@@ -31,7 +31,7 @@ In this example, the first fragment creates a D global variable pointer `q`. Bec
 
 ## Pointer Safety <a id="dt_ptrsafety_dlang">
 
-DTrace is a robust, safe environment for running D programs. You might write a buggy D program, but invalid D pointer accesses don't cause DTrace or the OS kernel to fail or crash in any way. Instead, the DTrace software detects any invalid pointer accesses, and returns a `BADADDR` fault; the current clause execution quits, an ERROR probe fires, and tracing continues unless the program called `[exit](function_exit.md)` for the ERROR probe.
+DTrace is a robust, safe environment for running D programs. You might write a buggy D program, but invalid D pointer accesses don't cause DTrace or the OS kernel to fail or crash in any way. Instead, the DTrace software detects any invalid pointer accesses, and returns a `BADADDR` fault; the current clause execution quits, an ERROR probe fires, and tracing continues unless the program called [`exit`](function_exit.md) for the ERROR probe.
 
 Pointers are required in D because they're an intrinsic part of the OS's implementation in C, but DTrace implements the same kind of safety mechanisms that are found in the Java programming language to prevent buggy programs from affecting themselves or each other. DTrace's error reporting is similar to the runtime environment for the Java programming language that detects a programming error and reports an exception.
 
@@ -122,5 +122,5 @@ A pointer is an address that provides a translation within some *virtual address
 
 For example, if you use the `syscall` provider to instrument entry to a system call that takes a pointer to an integer or array of integers as an argument, such as, `pipe()`, it would not be valid to dereference that pointer or array using the `*` or `[]` operators because the address in question is an address in the address space of the user process that performed the system call. Applying the `*` or `[]` operators to this address in D would result in kernel address space access, which would result in an invalid address error or in returning unexpected data to the D program, depending on whether the address happened to match a valid kernel address.
 
-To access user-process memory from a DTrace probe, you must apply one of the `[copyin](function_copyin.md)`, `[copyinstr](function_copyinstr.md)`, or `[copyinto](function_copyinto.md)` functions. To avoid confusion, take care when writing D programs to name and comment variables storing user addresses appropriately. You can also store user addresses as `uintptr_t` so that you don't accidentally compile D code that dereferences them..
+To access user-process memory from a DTrace probe, you must apply one of the [`copyin`](function_copyin.md), [`copyinstr`](function_copyinstr.md), or [`copyinto`](function_copyinto.md) functions. To avoid confusion, take care when writing D programs to name and comment variables storing user addresses appropriately. You can also store user addresses as `uintptr_t` so that you don't accidentally compile D code that dereferences them..
 
diff --git a/doc/userguide/reference/dtrace-ref-speculation.md b/doc/userguide/reference/dtrace-ref-speculation.md
index f93053275..31d02c2eb 100644
--- a/doc/userguide/reference/dtrace-ref-speculation.md
+++ b/doc/userguide/reference/dtrace-ref-speculation.md
@@ -27,7 +27,7 @@ Description
 
 </th></tr></thead><tbody><tr><td>
 
-`[speculation](../reference/function_speculation.md)`
+[`speculation`](../reference/function_speculation.md)
 
 </td><td>
 
@@ -39,7 +39,7 @@ Returns an identifier for a new speculative buffer.
 
 </td></tr><tr><td>
 
-`[speculate](../reference/function_speculate.md)`
+[`speculate`](../reference/function_speculate.md)
 
 </td><td>
 
@@ -51,7 +51,7 @@ Denotes that the remainder of the clause must be traced to the speculative buffe
 
 </td></tr><tr><td>
 
-`[commit](../reference/function_commit.md)`
+[`commit`](../reference/function_commit.md)
 
 </td><td>
 
@@ -63,7 +63,7 @@ Commits the speculative buffer that's associated with ID.
 
 </td></tr><tr><td>
 
-`[discard](../reference/function_discard.md)`
+[`discard`](../reference/function_discard.md)
 
 </td><td>
 
diff --git a/doc/userguide/reference/dtrace_functions.md b/doc/userguide/reference/dtrace_functions.md
index 31e37091e..9a4f01363 100644
--- a/doc/userguide/reference/dtrace_functions.md
+++ b/doc/userguide/reference/dtrace_functions.md
@@ -13,13 +13,13 @@ Functions can be grouped according to their general use case and might appear in
 
     -   [Default Action](dtrace-ref-DefaultAction.md): The default action applies when DTrace encounters an empty clause for a probe. The default action is to trace the enabled probe identifier \(EPID\).
 
-    -   `[printa](function_printa.md)`: Displays and controls the formatting of an aggregation
+    -   [`printa`](function_printa.md): Displays and controls the formatting of an aggregation
 
-    -   `[printf](function_printf.md)`: Displays and controls the formatting of a string.
+    -   [`printf`](function_printf.md): Displays and controls the formatting of a string.
 
-    -   `[trace](function_trace.md)`: Traces the result of an expression to the directed buffer.
+    -   [`trace`](function_trace.md): Traces the result of an expression to the directed buffer.
 
-    -   `[tracemem](function_tracemem.md)`: Copies the specified number of bytes of data from an address in memory to the current buffer.
+    -   [`tracemem`](function_tracemem.md): Copies the specified number of bytes of data from an address in memory to the current buffer.
 
 -   **Aggregation Functions**
 
@@ -27,33 +27,35 @@ Functions can be grouped according to their general use case and might appear in
 
     The following functions are aggregation functions:
 
-    -   `[avg](aggregation_avg.md)`: Stores the arithmetic average of the specified expressions in an aggregation.
+    -   [`avg`](aggregation_avg.md): Stores the arithmetic average of the specified expressions in an aggregation.
 
-    -   `[count](aggregation_count.md)`: Stores an incremented count value in an aggregation.
+    -   [`count`](aggregation_count.md): Stores an incremented count value in an aggregation.
 
-    -   `[max](aggregation_max.md)`: Stores the largest value among the specified expressions in an aggregation.
+    -   [`max`](aggregation_max.md): Stores the largest value among the specified expressions in an aggregation.
 
-    -   `[min](aggregation_min.md)`: Stores the smallest value among the specified expressions in an aggregation.
+    -   [`min`](aggregation_min.md): Stores the smallest value among the specified expressions in an aggregation.
 
-    -   `[sum](aggregation_sum.md)`: Stores the total value of the specified expression in an aggregation.
+    -   [`sum`](aggregation_sum.md): Stores the total value of the specified expression in an aggregation.
 
-    -   `[stddev](aggregation_stddev.md)`: Stores the standard deviation of the specified expressions in an aggregation.
+    -   [`stddev`](aggregation_stddev.md): Stores the standard deviation of the specified expressions in an aggregation.
 
-    -   `[quantize](aggregation_quantize.md)`: Stores a power-of-two frequency distribution of the values of the specified expressions in an aggregation. An optional increment can be specified.
+    -   [`quantize`](aggregation_quantize.md): Stores a power-of-two frequency distribution of the values of the specified expressions in an aggregation.
+         An optional increment can be specified.
 
-    -   `[lquantize](aggregation_lquantize.md)`: Stores the linear frequency distribution of the values of the specified expressions, sized by the specified range, in an aggregation.
+    -   [`lquantize`](aggregation_lquantize.md): Stores the linear frequency distribution of the values of the specified expressions,
+         sized by the specified range, in an aggregation.
 
-    -   `[llquantize](aggregation_llquantize.md)`: Stores the log-linear frequency distribution in an aggregation.
+    -   [`llquantize`](aggregation_llquantize.md): Stores the log-linear frequency distribution in an aggregation.
 
     The following functions aren't aggregating functions but work on aggregations:
 
-    -   `[clear](function_clear.md)`: Clears the values from an aggregation while retaining aggregation keys.
+    -   [`clear`](function_clear.md): Clears the values from an aggregation while retaining aggregation keys.
 
-    -   `[denormalize](function_denormalize.md)`: Removes the normalization that's applied to a specified aggregation.
+    -   [`denormalize`](function_denormalize.md): Removes the normalization that's applied to a specified aggregation.
 
-    -   `[normalize](function_normalize.md)`: Divides an aggregation value by a specified normalization factor.
+    -   [`normalize`](function_normalize.md): Divides an aggregation value by a specified normalization factor.
 
-    -   `[printa](function_printa.md)`: Displays and controls the formatting of an aggregation
+    -   [`printa`](function_printa.md): Displays and controls the formatting of an aggregation
 
 -   **Speculation Functions**
 
@@ -61,13 +63,14 @@ Functions can be grouped according to their general use case and might appear in
 
     The following functions are speculation functions:
 
-    -   `[speculation](function_speculation.md)`: Creates a speculative trace buffer and returns its ID.
+    -   [`speculation`](function_speculation.md): Creates a speculative trace buffer and returns its ID.
 
-    -   `[speculate](function_speculate.md)`: A special function that causes DTrace to switch to using a speculation buffer identified by the specified ID for the remainder of a clause.
+    -   [`speculate`](function_speculate.md): A special function that causes DTrace to switch to using
+        a speculation buffer identified by the specified ID for the remainder of a clause.
 
-    -   `[commit](function_commit.md)`: Commits the speculative buffer, specified by ID, to the principal buffer.
+    -   [`commit`](function_commit.md): Commits the speculative buffer, specified by ID, to the principal buffer.
 
-    -   `[discard](function_discard.md)`: Discards a speculative buffer specified by the provided speculation ID.
+    -   [`discard`](function_discard.md): Discards a speculative buffer specified by the provided speculation ID.
 
 -   **String Manipulation Functions**
 
@@ -81,33 +84,33 @@ Functions can be grouped according to their general use case and might appear in
 
     The following string manipulation functions are available:
 
-    -   `[index](function_index.md)`: Finds the first occurrence of a substring within a string.
+    -   [`index`](function_index.md): Finds the first occurrence of a substring within a string.
 
-    -   `[rindex](function_rindex.md)`: Finds the last occurrence of a specific substring within a string.
+    -   [`rindex`](function_rindex.md): Finds the last occurrence of a specific substring within a string.
 
-    -   `[lltostr](function_lltostr.md)`: Converts an unsigned 64-bit integer to a string.
+    -   [`lltostr`](function_lltostr.md): Converts an unsigned 64-bit integer to a string.
 
-    -   `[strchr](function_strchr.md)`: Returns a substring that begins at the first matching occurrence of a specified character in a string.
+    -   [`strchr`](function_strchr.md): Returns a substring that begins at the first matching occurrence of a specified character in a string.
 
-    -   `[strjoin](function_strjoin.md)`: Concatenates two specified strings and returns the resulting string.
+    -   [`strjoin`](function_strjoin.md): Concatenates two specified strings and returns the resulting string.
 
-    -   `[strlen](function_strlen.md)`: Returns the length of a string in bytes.
+    -   [`strlen`](function_strlen.md): Returns the length of a string in bytes.
 
-    -   `[strrchr](function_strrchr.md)`: Returns a substring that begins at the last matching occurrence of a specified character in a string.
+    -   [`strrchr`](function_strrchr.md): Returns a substring that begins at the last matching occurrence of a specified character in a string.
 
-    -   `[strstr](function_strstr.md)`: Returns a substring starting at first occurrence of a specified substring within a string.
+    -   [`strstr`](function_strstr.md): Returns a substring starting at first occurrence of a specified substring within a string.
 
-    -   `[strtok](function_strtok.md)`: Parse a string into a sequence of tokens using a specified delimiter.
+    -   [`strtok`](function_strtok.md): Parse a string into a sequence of tokens using a specified delimiter.
 
-    -   `[substr](function_substr.md)`: Returns the substring from a string at a specified index position.
+    -   [`substr`](function_substr.md): Returns the substring from a string at a specified index position.
 
 -   **File Path Manipulation Functions**
 
     Similar to string manipulation functions, file path manipulation functions act on file paths or can provide the path name for a specified pointer. Some of these functions have analogs in the system library calls described in section 3 of the Linux manual pages.
 
-    -   `[basename](function_basename.md)`: Returns a string excluding any prefix ending in `/`.
+    -   [`basename`](function_basename.md): Returns a string excluding any prefix ending in `/`.
 
-    -   `[dirname](function_dirname.md)`: Returns the path up to the last level of a specified string.
+    -   [`dirname`](function_dirname.md): Returns the path up to the last level of a specified string.
 
 -   **Integer Conversion Functions**
 
@@ -115,35 +118,38 @@ Functions can be grouped according to their general use case and might appear in
 
     The following integer conversion functions are available:
 
-    -   `[htonl](function_htonl.md)`: Converts an unsigned 32-bit long integer from host byte order to network byte order.
+    -   [`htonl`](function_htonl.md): Converts an unsigned 32-bit long integer from host byte order to network byte order.
 
-    -   `[htonll](function_htonll.md)`: Converts an unsigned 64-bit long integer from host byte order to network byte order.
+    -   [`htonll`](function_htonll.md): Converts an unsigned 64-bit long integer from host byte order to network byte order.
 
-    -   `[htons](function_htons.md)`: Converts a short 16-bit unsigned integer from host byte order to network byte order.
+    -   [`htons`](function_htons.md): Converts a short 16-bit unsigned integer from host byte order to network byte order.
 
-    -   `[ntohl](function_ntohl.md)`: Converts a 32-bit long integer from network byte order to host byte order.
+    -   [`ntohl`](function_ntohl.md): Converts a 32-bit long integer from network byte order to host byte order.
 
-    -   `[ntohll](function_ntohll.md)`: Converts a 64-bit long integer from network byte order to host byte order.
+    -   [`ntohll`](function_ntohll.md): Converts a 64-bit long integer from network byte order to host byte order.
 
-    -   `[ntohs](function_ntohs.md)`: Converts a short 16-bit integer from network byte order to host byte order.
+    -   [`ntohs`](function_ntohs.md): Converts a short 16-bit integer from network byte order to host byte order.
 
 -   **Copying Functions**
 
     Copying functions are functions that relate to copying information between memory addresses and DTrace buffers. Some of these functions are also considered process destructive functions because they change data in memory for a running process. Destructive functions must be explicitly enabled in DTrace.
 
-    -   `[alloca](function_alloca.md)`: Allocates memory and returns a pointer.
+    -   [`alloca`](function_alloca.md): Allocates memory and returns a pointer.
 
-    -   `[bcopy](function_bcopy.md)`: Copies a specified size in bytes from a specified source address outside of scratch memory to a destination address inside scratch memory.
+    -   [`bcopy`](function_bcopy.md): Copies a specified size in bytes from a specified source
+        address outside of scratch memory to a destination address inside scratch memory.
 
-    -   `[copyin](function_copyin.md)`: Copies the specified size from the user address to a DTrace buffer and returns the address of the buffer.
+    -   [`copyin`](function_copyin.md): Copies the specified size from the user address to a DTrace buffer and returns the address of the buffer.
 
-    -   `[copyinstr](function_copyinstr.md)`: Copies a null-terminated C string from the specified user address to a DTrace buffer and returns the address of the buffer.
+    -   [`copyinstr`](function_copyinstr.md): Copies a null-terminated C string from the specified
+        user address to a DTrace buffer and returns the address of the buffer.
 
-    -   `[copyinto](function_copyinto.md)`: Copies the specified size in bytes from the specified user address into the DTrace scratch buffer and returns the buffer address.
+    -   [`copyinto`](function_copyinto.md): Copies the specified size in bytes from the specified
+        user address into the DTrace scratch buffer and returns the buffer address.
 
-    -   `[copyout](function_copyout.md)`: Copies the specified size from the specified DTrace buffer to the specified user space address.
+    -   [`copyout`](function_copyout.md): Copies the specified size from the specified DTrace buffer to the specified user space address.
 
-    -   `[copyoutstr](function_copyoutstr.md)`: Copies a specified string to a specified user space address.
+    -   [`copyoutstr`](function_copyoutstr.md): Copies a specified string to a specified user space address.
 
 -   **Lock Analysis Functions**
 
@@ -151,19 +157,19 @@ Functions can be grouped according to their general use case and might appear in
 
     The following lock analysis functions are available:
 
-    -   `[mutex\_owned](function_mutex_owned.md)`: Checks whether a thread holds the specified kernel mutex.
+    -   [`mutex_owned`](function_mutex_owned.md): Checks whether a thread holds the specified kernel mutex.
 
-    -   `[mutex\_owner](function_mutex_owner.md)`: Returns the thread pointer to the current owner of the specified kernel mutex.
+    -   [`mutex_owner`](function_mutex_owner.md): Returns the thread pointer to the current owner of the specified kernel mutex.
 
-    -   `[mutex\_type\_adaptive](function_mutex_type_adaptive.md)`: Returns a non zero value if a specified kernel mutex is adaptive.
+    -   [`mutex_type_adaptive`](function_mutex_type_adaptive.md): Returns a non zero value if a specified kernel mutex is adaptive.
 
-    -   `[mutex\_type\_spin](function_mutex_type_spin.md)`: Returns a non zero value if a specified kernel mutex is a spin mutex.
+    -   [`mutex_type_spin`](function_mutex_type_spin.md): Returns a non zero value if a specified kernel mutex is a spin mutex.
 
-    -   `[rw\_iswriter](function_rw_iswriter.md)`: Checks whether a writer is holding or waiting for the specified reader-writer lock.
+    -   [`rw_iswriter`](function_rw_iswriter.md): Checks whether a writer is holding or waiting for the specified reader-writer lock.
 
-    -   `[rw\_read\_held](function_rw_read_held.md)`: Checks whether the specified reader-writer lock is held by a reader.
+    -   [`rw_read_held`](function_rw_read_held.md): Checks whether the specified reader-writer lock is held by a reader.
 
-    -   `[rw\_write\_held](function_rw_write_held.md)`: Checks whether the specified reader-writer lock is held by a writer.
+    -   [`rw_write_held`](function_rw_write_held.md): Checks whether the specified reader-writer lock is held by a writer.
 
 -   **Symbolic Names and Stack Analysis Functions**
 
@@ -171,37 +177,37 @@ Functions can be grouped according to their general use case and might appear in
 
     The following functions return information about stack and addresses:
 
-    -   `[stack](function_stack.md)`: Records a stack trace to the buffer.
+    -   [`stack`](function_stack.md): Records a stack trace to the buffer.
 
-    -   `[func](function_func.md)`: Prints the symbol for a specified kernel space address. An alias for `sym`.
+    -   [`func`](function_func.md): Prints the symbol for a specified kernel space address. An alias for `sym`.
 
-    -   `[mod](function_mod.md)`: Prints the module name that corresponds to a specified kernel space address.
+    -   [`mod`](function_mod.md): Prints the module name that corresponds to a specified kernel space address.
 
-    -   `[sym](function_sym.md)`: Prints the symbol for a specified kernel space address. An alias for `func`.
+    -   [`sym`](function_sym.md): Prints the symbol for a specified kernel space address. An alias for `func`.
 
-    -   `[ustack](function_ustack.md)`: Records a user stack trace to the directed buffer.
+    -   [`ustack`](function_ustack.md): Records a user stack trace to the directed buffer.
 
-    -   `[uaddr](function_uaddr.md)`: Prints the symbol for a specified address.
+    -   [`uaddr`](function_uaddr.md): Prints the symbol for a specified address.
 
-    -   `[ufunc](function_ufunc.md)`: Prints the symbol for a specified user space address. An alias for `usym`.
+    -   [`ufunc`](function_ufunc.md): Prints the symbol for a specified user space address. An alias for `usym`.
 
-    -   `[umod](function_umod.md)`: Prints the module name that corresponds to a specified user space address.
+    -   [`umod`](function_umod.md): Prints the module name that corresponds to a specified user space address.
 
-    -   `[usym](function_usym.md)`: Prints the symbol for a specified address. An alias for `ufunc`.
+    -   [`usym`](function_usym.md): Prints the symbol for a specified address. An alias for `ufunc`.
 
 -   **General System Functions**
 
     DTrace includes several functions to obtain information from the system or which are generalized for different use cases. Functions in this category include:
 
-    -   `[getmajor](function_getmajor.md)`: Returns the major device number for a specified device.
+    -   [`getmajor`](function_getmajor.md): Returns the major device number for a specified device.
 
-    -   `[getminor](function_getminor.md)`: Returns the minor device number for a specified device
+    -   [`getminor`](function_getminor.md): Returns the minor device number for a specified device
 
-    -   `[inet\_ntoa](function_inet_ntoa.md)`: Returns a dotted, quad decimal string for a pointer to an IPv4 address.
+    -   [`inet_ntoa`](function_inet_ntoa.md): Returns a dotted, quad decimal string for a pointer to an IPv4 address.
 
-    -   `[progenyof](function_progenyof.md)`: Checks whether a calling process is in the progeny of a specified process ID.
+    -   [`progenyof`](function_progenyof.md): Checks whether a calling process is in the progeny of a specified process ID.
 
-    -   `[rand](function_rand.md)`: Returns a pseudo random integer.
+    -   [`rand`](function_rand.md): Returns a pseudo random integer.
 
 -   **Destructive Functions**
 
@@ -217,25 +223,25 @@ Functions can be grouped according to their general use case and might appear in
 
     These functions must be used with caution, as such functions can affect every process on the system and any other system, implicitly or explicitly, depending upon the affected system's network services.
 
-    -   `[copyout](function_copyout.md)`: Copies the specified size from the specified DTrace buffer to the specified user space address.
+    -   [`copyout`](function_copyout.md): Copies the specified size from the specified DTrace buffer to the specified user space address.
 
-    -   `[copyoutstr](function_copyoutstr.md)`: Copies a specified string to a specified user space address.
+    -   [`copyoutstr`](function_copyoutstr.md): Copies a specified string to a specified user space address.
 
-    -   `[freopen](function_freopen.md)`: Changes the file associated with `stdout` to a specified file.
+    -   [`freopen`](function_freopen.md): Changes the file associated with `stdout` to a specified file.
 
-    -   `[ftruncate](function_ftruncate.md)`: Truncates the output stream on `stdout`.
+    -   [`ftruncate`](function_ftruncate.md): Truncates the output stream on `stdout`.
 
-    -   `[raise](function_raise.md)`: Sends a specified signal to the running process.
+    -   [`raise`](function_raise.md): Sends a specified signal to the running process.
 
-    -   `[system](function_system.md)`: Causes a specified program to be run on the system as if within a shell.
+    -   [`system`](function_system.md): Causes a specified program to be run on the system as if within a shell.
 
 -   **Special Functions**
 
     DTrace also includes functions that change DTrace behavior such as exiting tracing altogether or changing DTrace runtime options.
 
-    -   `[exit](function_exit.md)`: Stops all tracing and exits to return an exit value.
+    -   [`exit`](function_exit.md): Stops all tracing and exits to return an exit value.
 
-    -   `[setopt](function_setopt.md)`: Dynamically sets DTrace compiler or runtime options.
+    -   [`setopt`](function_setopt.md): Dynamically sets DTrace compiler or runtime options.
 
 
 -   **[Default Action](../reference/dtrace-ref-DefaultAction.md)**  
@@ -396,4 +402,3 @@ Returns a string translation of a hardware address.
  Records a user stack trace to the directed buffer.
 -   **[usym](../reference/function_usym.md)**  
  Prints the symbol for a specified address. An alias for `ufunc`.
-
diff --git a/doc/userguide/reference/dtrace_providers_dtrace.md b/doc/userguide/reference/dtrace_providers_dtrace.md
index cfe485848..8b48e93ec 100644
--- a/doc/userguide/reference/dtrace_providers_dtrace.md
+++ b/doc/userguide/reference/dtrace_providers_dtrace.md
@@ -62,7 +62,11 @@ As with the `BEGIN` probe, no arguments are defined for the `END` probe. The con
 
 **Note:**
 
-The `[exit](function_exit.md)` function causes tracing to stop and the `END` probe to fire. However, a delay exists between the invocation of the `exit` function and when the `END` probe fires. During this delay, no further probes can fire. After a probe invokes the `exit` function, the `END` probe isn't fired until DTrace determines that `exit` has been called and stops tracing. The rate at which the exit status is checked can be set by using `statusrate` option.
+The [`exit`](function_exit.md) function causes tracing to stop and the `END` probe to fire.
+However, a delay exists between the invocation of the `exit` function and when the `END` probe fires.
+During this delay, no further probes can fire.
+After a probe invokes the `exit` function, the `END` probe isn't fired until DTrace determines that `exit` has been called and stops tracing.
+The rate at which the exit status is checked can be set by using `statusrate` option.
 
 ## ERROR Probe <a id="dt_ref_error_prov">
 
diff --git a/doc/userguide/reference/dtrace_runtime_options.md b/doc/userguide/reference/dtrace_runtime_options.md
index f59223916..04e86ad62 100644
--- a/doc/userguide/reference/dtrace_runtime_options.md
+++ b/doc/userguide/reference/dtrace_runtime_options.md
@@ -9,7 +9,8 @@ Options that can be specified when running the `dtrace` utility can be categoriz
 
 -   [Runtime Options](runtime_options.md): affect the runtime behavior of DTrace but which are often set at compile time.
 
--   [Dynamic Runtime Options](dynamic_runtime_options.md): affect the runtime behavior of DTrace but which can be changed while tracing, by using the `[setopt](function_setopt.md)` function.
+-   [Dynamic Runtime Options](dynamic_runtime_options.md): affect the runtime behavior of DTrace but which can be changed while tracing,
+    by using the [`setopt`](function_setopt.md) function.
 
 
 -   **[Setting DTrace Compile-time and Runtime Options](../reference/setting_dtrace_compiler_and_runtime_options.md)**  
@@ -20,4 +21,3 @@ Compile-time options can control how DTrace programs are compiled into eBPF code
 Runtime options can control how the DTrace utility behaves.
 -   **[Dynamic Runtime Options](../reference/dynamic_runtime_options.md)**  
 Dynamic runtime options are specific to D programs themselves and are likely to change depending on program functionality and requirements.
-
diff --git a/doc/userguide/reference/function_copyinstr.md b/doc/userguide/reference/function_copyinstr.md
index cfd8bb4d5..d531d25f6 100644
--- a/doc/userguide/reference/function_copyinstr.md
+++ b/doc/userguide/reference/function_copyinstr.md
@@ -7,7 +7,13 @@ Copies a null-terminated C string from the specified user address to a DTrace bu
 string copyinstr(uintptr_t *addr* [, size_t *size*])
 ```
 
-The `copyinstr` function copies a null-terminated C string from the specified user address into a DTrace scratch buffer and returns the address of this buffer. The user address is interpreted as an address in the space of the process that's associated with the current thread. An optional maximum length parameter sets a limit on the number of bytes that are examined beyond the address. The resulting string is always null-terminated and the string's length is limited to the value set by the compiler and runtime `strsize` option. As with the `[copyin](function_copyin.md)` function, the specified address must correspond to a faulted-in page in the current process. If the address doesn't correspond to a faulted-in page, or if insufficient scratch memory is available, NULL is returned, and an error is generated.
+The `copyinstr` function copies a null-terminated C string from the specified user address
+into a DTrace scratch buffer and returns the address of this buffer.
+The user address is interpreted as an address in the space of the process that's associated with the current thread.
+An optional maximum length parameter sets a limit on the number of bytes that are examined beyond the address.
+The resulting string is always null-terminated and the string's length is limited to the value set by the compiler and runtime `strsize` option.
+As with the [`copyin`](function_copyin.md) function, the specified address must correspond to a faulted-in page in the current process.
+If the address doesn't correspond to a faulted-in page, or if insufficient scratch memory is available, NULL is returned, and an error is generated.
 
 ## How to use copyinstr to copy a string from an address space for a process to the DTrace buffer
 
@@ -22,4 +28,3 @@ syscall::write:entry
 ```
 
 **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
-
diff --git a/doc/userguide/reference/function_func.md b/doc/userguide/reference/function_func.md
index 2782268ad..593825739 100644
--- a/doc/userguide/reference/function_func.md
+++ b/doc/userguide/reference/function_func.md
@@ -7,7 +7,9 @@ Prints the symbol for a specified kernel space address. An alias for `sym`.
 _symaddr func(uintptr_t *addr*)
 ```
 
-The `func` function is a data recording function that prints the symbol that corresponds to a specified kernel space address, *addr*. The `func` function is an alias for `[sym](function_sym.md)`.
+The `func` function is a data recording function that prints the symbol
+that corresponds to a specified kernel space address, *addr*.
+The `func` function is an alias for [`sym`](function_sym.md).
 
 ## How the func function can return the symbol for a kernel space address
 
diff --git a/doc/userguide/reference/function_speculation.md b/doc/userguide/reference/function_speculation.md
index 3a24c0ab1..91ed103ff 100644
--- a/doc/userguide/reference/function_speculation.md
+++ b/doc/userguide/reference/function_speculation.md
@@ -7,7 +7,7 @@ Creates a speculative trace buffer and returns its ID.
 int speculation(void)
 ```
 
-The `speculation` function reserves a speculative trace buffer for use with `[speculate](function_speculate.md)` and returns an identifier for this buffer.
+The `speculation` function reserves a speculative trace buffer for use with [`speculate`](function_speculate.md) and returns an identifier for this buffer.
 
 ## How to use speculation
 
diff --git a/doc/userguide/reference/function_sym.md b/doc/userguide/reference/function_sym.md
index 8e26b5140..843488771 100644
--- a/doc/userguide/reference/function_sym.md
+++ b/doc/userguide/reference/function_sym.md
@@ -7,7 +7,8 @@ Prints the symbol for a specified kernel space address. An alias for `func`.
 _symaddr sym(uintptr_t *addr*)
 ```
 
-The `sym` function is a data recording function that prints the symbol that corresponds to a specified kernel space address, *addr*. The `sym` function is an alias for `[func](function_func.md)`.
+The `sym` function is a data recording function that prints the symbol that corresponds to a specified kernel space address, *addr*.
+The `sym` function is an alias for [`func`](function_func.md).
 
 ## How the sym function can return the symbol for a kernel space address
 
diff --git a/doc/userguide/reference/function_ufunc.md b/doc/userguide/reference/function_ufunc.md
index 7c78a1ae4..c8b59f2e6 100644
--- a/doc/userguide/reference/function_ufunc.md
+++ b/doc/userguide/reference/function_ufunc.md
@@ -7,7 +7,8 @@ Prints the symbol for a specified user space address. An alias for `usym`.
 _usymaddr ufunc(uintptr_t)
 ```
 
-The `ufunc` function is a data recording function that prints the symbol that corresponds to a specified user space address. The `func` function is an alias for `[usym](function_usym.md)`.
+The `ufunc` function is a data recording function that prints the symbol that corresponds to a specified user space address.
+The `func` function is an alias for [`usym`](function_usym.md).
 
 ## How to use usym to obtain the symbol for an address
 
diff --git a/doc/userguide/reference/function_usym.md b/doc/userguide/reference/function_usym.md
index 8c1061c5d..791f770b0 100644
--- a/doc/userguide/reference/function_usym.md
+++ b/doc/userguide/reference/function_usym.md
@@ -7,7 +7,8 @@ Prints the symbol for a specified address. An alias for `ufunc`.
 _usymaddr usym(uintptr_t)
 ```
 
-The `usym` function prints the symbol for a specified address, which is analogous to how `[uaddr](function_uaddr.md)` works, but without the hexadecimal offsets. The `usym` function is an alias for `[ufunc](function_ufunc.md)`.
+The `usym` function prints the symbol for a specified address, which is analogous to how [`uaddr`](function_uaddr.md) works,
+but without the hexadecimal offsets. The `usym` function is an alias for [`ufunc`](function_ufunc.md).
 
 ## How to use usym to obtain the symbol for an address
 
diff --git a/doc/userguide/reference/runtime_options.md b/doc/userguide/reference/runtime_options.md
index 88973dd8c..31b200604 100644
--- a/doc/userguide/reference/runtime_options.md
+++ b/doc/userguide/reference/runtime_options.md
@@ -17,7 +17,7 @@ Runtime options can control how the DTrace utility behaves.
 
 -   **`bufsize=<size>`**
 
-    Runtime option that sets the principal buffer size. The default buffer size is set to 4 MB. This option is the same as running `dtrace` `-b`.
+    Runtime option that sets the principal buffer size. The default buffer size is set to 4 MB. This option is the same as running `dtrace -b`.
 
 -   **`cleanrate=<time>`**
 
@@ -29,7 +29,7 @@ Runtime options can control how the DTrace utility behaves.
 
 -   **`destructive`**
 
-    Runtime option that permits destructive functions to run. This option is the same as running `dtrace` `-w`.
+    Runtime option that permits destructive functions to run. This option is the same as running `dtrace -w`.
 
 -   **`dynvarsize=<size>`**
 
-- 
2.47.3

