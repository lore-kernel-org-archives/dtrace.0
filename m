Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E9B24B26
	for <dtrace@lists.linux.dev>; Tue, 18 Jun 2024 22:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718749712; cv=fail; b=pDBdCbCugCmtLPzrqNzlaHIMrxGqDX8+TeFFQ3kZiLyJw3kN3nHScZBVfFlal0LsRaPkUJKDxrJJRtDCNlMLHou/XrxZDXyYEqOWnkY9YU4vYXlGuZv+w2OqJFA8xkw+80xmReoH17ePrSUvi08zcZVzMRxpVeV1/RWshOSJaVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718749712; c=relaxed/simple;
	bh=zoowsWXVrzbmsvaoW8YaVPXfjdnqhyDISNQk09eCYT8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=RUgbY3DgbbvyOKhvEH08z8ZiOqlcVQvRitxmsinFsD399KGyOOEKvyp6tj56jUtNNic0KcPUUDiRre6hofYrq0nNoG+i3Ogs1+dCf0NBnWonW2zfDhJSomnNk4UmW6ow+l1etZbxMxCXhuyEdprfpMJOwJ9YHT7c5QrVepS8GKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PJ3tErNG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KgXBZlXU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PJ3tErNG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KgXBZlXU"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILa0AY016461
	for <dtrace@lists.linux.dev>; Tue, 18 Jun 2024 22:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=/33prbhZFVTyt1OZyXjsdt5xdG7w0oJcYrHeHeUvU+k=; b=
	PJ3tErNGAR59pBDE6Y/MG8SM21hJ1YoAxpk3fDalg0JsGarTpY2RczqA19tkDVhX
	qUBv91MiXGI5gyhf4SE8TfYwKfglA+Y6T0MTz7wJrR259W8aAhQ0SQB6OZc/rV0+
	zSmVADvaIw7pcR5f+aR5osPRRmWpjIS0j/PDUOTda3v4OJwFtskGvUB100trej8g
	X+W5a3rFRicVo699iJzkwc6CWiY3V2zU5PYMm0h6bFaqwJq1rRKhs1zs4DPXmP5/
	/OJoieK2cCq16hqrnMEEIX2A1N/8RO1R9XrFeRvrJxicwDxtxg+1sfg2NWLtFOVD
	NpFTtOj/gf2Ms6IP87TWNw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yuj9gg1ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Jun 2024 22:28:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45ILasYi034633
	for <dtrace@lists.linux.dev>; Tue, 18 Jun 2024 22:28:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ys1df2465-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Jun 2024 22:28:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2q3f0LEN1HeJ/u+PrmGwknDPKdpDZHrgLwLbjDEmX7XFDQuHIwb+6S72bCfISFncbDuwTf4wDLIQujOcTU3Yai2V9VgU4fBOc0MlgLb8H0JZj6dA1ZUUSkGTOUG6nsMkBSQEGFLSMfznxAoz9/BoRLP1sbs9gqZTnoJZa+nfbHiFUwOuKoNYUEfcY6hRXBX/ZLB/hkHft/AE5n/n00tCM5gXAPdcKkcWEq1EiDvHDqjFoFhrf9LDMNv2xzM/bnV8cs6RfHpq0Cp+EV/GKGPoiwHIKfNEgzkTpG+0eC0l8ueNuxYvbsrgB7xRdBjZrcoysXMWS+m45+TbDZWCgUTNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/33prbhZFVTyt1OZyXjsdt5xdG7w0oJcYrHeHeUvU+k=;
 b=hBAoNCU3E/ufrG1KUxA4F5S3AWMbjiCBkfwcpOEVEz9/you373emI04FNGpWyJqxI2aUjJ3DV9pLwnzP9F2ocQD7yjIPk3yqNLpyAdwr7+nquAXzin/hmq32dsNXmcSKQug+nLpqbF91myw41JpXjywny1GRVoYlmes54DfwGwFVWcja46fXYYuK+l9GTLouJ5JWTS0Aqsgp41qB0i1cAh+ZfyEzMPfzl98icDVV78AgtlvShkgwenH4Nd8Q4Zy1EfzVBnEOPVO2jCHIsHzAFdfU9wohlxVgHIexBz4C1FPzriIpmvDTdN8htpmfjPfQCyx0zYHT31EDhlaz/VZzPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/33prbhZFVTyt1OZyXjsdt5xdG7w0oJcYrHeHeUvU+k=;
 b=KgXBZlXUQ2/xIXOxtkiPOzqjeotpLjx6hMQnmf5Wwy/HQJeCQ3XvqE6P1lz1d/4y1+KbMiEsmYD2o8DR075uHljaThvXtVFlMdq7mpvBYJq5x3RuvMZn3EWz6o3nE51gx5zlhIhueCRpteFJSBQEyE0VDZkAsF+yRuzokm50c7g=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM6PR10MB4348.namprd10.prod.outlook.com (2603:10b6:5:21e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Tue, 18 Jun
 2024 22:28:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 22:28:04 +0000
Date: Tue, 18 Jun 2024 18:19:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] build, dlib: ensure dlib directories are created
Content-Type: text/plain
X-ClientProxiedBy: MN2PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:208:d4::38) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB628761A5110A04BC2EFB0BADC2CE2@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM6PR10MB4348:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b13657-6b7f-4104-a4cf-08dc8fe5ebde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UOh4vOIt2y7KKRceWPq6CnRTgwFJO2BHzQqnoUDVlDadsapS7SgiT9MvMNRf?=
 =?us-ascii?Q?LaZeddi59E5cpnLeD+3J9SBZl5NcNnwmnYs/P2/ymvtB1ltjyXD4Rl4i9heh?=
 =?us-ascii?Q?78Qhs0jpYZpz+Tksm0JpUBHpbUsxR3zaBr4VyLdO0Xt3UA50VDAgHmqXDUJE?=
 =?us-ascii?Q?DBppzhDUqkS9Wfe9lFIeh2SEGrxUOIS+nRSTkP7ekFY+apxDHV5bJXT2OZlN?=
 =?us-ascii?Q?I9RTlkCTJnLoQ6QHDRnLU0j1Hr2CeE9oASl+wAtb8we3JnseSAJStoUlZOO4?=
 =?us-ascii?Q?9thHsB4aMly9VkmyuwCk6kkPPTKRnndZoi0yqFcBUFEQjgRTBCJpWBpiwKWX?=
 =?us-ascii?Q?Pds3qMNGop6hmzu4CnXUQTZtXyFbBzj8LIsa8piSnPg9MqAYCnW5gOpzGIEZ?=
 =?us-ascii?Q?MoV74xkPF3QJlZymGZt6ELJRLHbXd8T9EO7zkJ+jD3I7R+fEpj5S0/92le84?=
 =?us-ascii?Q?Xj5DlDQ5bWgqz0nuwEZO+wpsjo6gMxPyyeDA8CENE8UZQGF7yr1RGkTUHcA/?=
 =?us-ascii?Q?JWDQkyf/UCWqCd9C0z2BNF5lqFGDf5InwwoUAH5NePVGTwmPyKguZMFg9hPf?=
 =?us-ascii?Q?ca6csYRtt0Awprj6p+ZbI+bUgLEUoxk6w+MM1XZMbahfVFW5m09WIqpgB5e0?=
 =?us-ascii?Q?VoFFkdQ2Raw47kuvup59pNPQRRkHByB2xjuxDLfHUoW4lg0TD2oEZejYAski?=
 =?us-ascii?Q?ULgDag2E9+Y8kI3BF5lU/wwa7aCCHywllAb4Hu2WTGtAlFGdmBH0fOUDvf3J?=
 =?us-ascii?Q?W6lzlNTU+K+fQQVIik4ydE01vZfhHMMFYxOvlcQ7p52qo0GTJX6YoEtSaFQu?=
 =?us-ascii?Q?FLhLDciDr9Rp/7W7uv0Pi69U7tTriSPSkIbMnkPXBmkWts3iI+RxA+aAG/yt?=
 =?us-ascii?Q?j708wffnGtX9jJCZ3E76Y6DNe9zRRbI3j9tScu21/e0u/sV7LRUNfzSdJZFd?=
 =?us-ascii?Q?qtmSVp7UFrb1vb3Im63QZKiZ4YyrYABSeeQFyqaSbpkRQJSljDcopVCYRWSw?=
 =?us-ascii?Q?Yh+kS2CylCL8AT2os6iBckGIleK1lcMdz+5yMcBsE3Bn/QARGC+kaFsoWhoF?=
 =?us-ascii?Q?X5ZpZH+bV/GAfnppEmtdZayOQoS9oCromfKt6EtOmRaW/Gd57ASh0OoHLcYQ?=
 =?us-ascii?Q?0nQq6WDN+UFQxcT0z4b9XfmOdq11KRbGSNByIrKpYjCohtWtHjJYdO16Udr6?=
 =?us-ascii?Q?STbBfZ+oe5dRw0hJ+1tjkpjCu7S4eX9RqBk+rhwUEUiDUi11/yiEF8fan4Ky?=
 =?us-ascii?Q?/HSxDvLmhlkhLWzmWowqO8UpMpHkhXPoxPUxeRs4vPeIfQAaIB73saSlMuJ7?=
 =?us-ascii?Q?280rzJ7aONB/wbFnmcUThOK4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+R+5yQUJhZeKj9vngkDOm35EoG00yXxcqwpQZH1Eqzjip8JZocE+bz88bh+q?=
 =?us-ascii?Q?RmL3nvBU8aPnfh+S5Y/AVogUYVKYPDstfT3QpKiSOUqOLgV4abaytgbSMY4R?=
 =?us-ascii?Q?Fd1nvfm/tseIh/sQlLwU4zLHL3z4z9bJjRZ2wK1Xxnn7m0Ypi5hd86wx4koh?=
 =?us-ascii?Q?gCYuRIw3bjz+ImiV/hnj1FSu+x93PSxy6mJU1W8IwWlIUCza3rMznXm1IPPp?=
 =?us-ascii?Q?sMrMZ1pV9HsWzm6uLgRMnAhLO/2ByeoMvSGOx0oKKztqfDc5KQzqftFrOCc/?=
 =?us-ascii?Q?U6WEkt6Afe7oMHbFM49cHAAOVnhWoh3y3Z/xhry0Xg/WJ40pT2crFgYVZC0h?=
 =?us-ascii?Q?buFiVp0SpbPe5F7Jj2MoFoB803LBKnXJZDXuAxh+sRZkAVbt3bl6WPr4X6fT?=
 =?us-ascii?Q?QdKKmFIXHKwyOtLk/4HwxTNgA+kRjp/Nk7JjOEm4azCRmM5AFOEJS0pvdwXt?=
 =?us-ascii?Q?rkJ1QGIA8KFF87XX1znS+E6ZHWlRudxXyQyUR0TKx2X45xX8EWTv5RK8wUOr?=
 =?us-ascii?Q?OweAOTsfKFnvefOQh4SvyLV4DKnD1i2rk6opiPS/IE5M1VAiGGx/wAVUA6jY?=
 =?us-ascii?Q?yDDyh3BYsn6ET3E12/pgLGRT/lTdow2CVeDU+AKbkwwrgv75yjf8IJPO3ACa?=
 =?us-ascii?Q?9zhewM+Bn1OZCi1iViFdjpKRfSDJtYTVXeN/uJdHKq3YowTIWE4k2oQ4V9Gh?=
 =?us-ascii?Q?U1GA3PRFU2MEzNoHj+JNGgKEwy6+pdwVJYV355zyfzoGmwMNhL49bU3WrYKR?=
 =?us-ascii?Q?Kp8fptju3NloX/s7eOa5B27UAO9f8ifP/XCmGdcpcSwsN8DAnUU5LYd2ns0/?=
 =?us-ascii?Q?DFUWvM3DR9PWDFLqT70eO6WL0mQTTvtUWTmrDIHsdrB4DWfbp/iFDjmq03iX?=
 =?us-ascii?Q?qIc+O6oIeri+VVb1z9q+RbhEZT/vSwPJGjR+ITsd/2Hfs6HMUqESsvoKxtxr?=
 =?us-ascii?Q?CKmLxRSi7ieOXA7YnIdWyi/L1o4VpNqTiQXU0SSRawadJX1rak9VK26hE4Dn?=
 =?us-ascii?Q?n/mwLF7xXoSmA7zb6AXSAc5spC6upCfberRdSq8AR2RBnN5tiwNri1TpncyY?=
 =?us-ascii?Q?H5WCYeV6XdzYvpaGbUhHVH4ptCvI7M+xFw4ga08w7RuuwkpzYgWN6y7WcFZe?=
 =?us-ascii?Q?jqY88PRax8WeyF6H5S7YPwT3VCWEQAOJ5j0OELVH44L8YWrG2g2KvpZwn2yz?=
 =?us-ascii?Q?pv+xFFrq/UpqqySr4Ft/G+EAqwwmsnDBBUVIrxBjRhkEoC69qlfzMz+lIxuh?=
 =?us-ascii?Q?/Mrt/3XsjG4NH7sBRYpfw4wW6cMyWqqYdVMI0wwPfsGLNiWNjWyR3cjwBUiM?=
 =?us-ascii?Q?jSF1scXw/wYurlU0GbGfMo27livuS4UIxpKU71/Fd6C1/z33BD2Dd9ChnRS4?=
 =?us-ascii?Q?rzLjeh8svz3riVnirNz8pB8vX8qtfCU9R9iNms1q2bKtCnjw9l1HuS7yjVWr?=
 =?us-ascii?Q?oUc+6OnkYVqsAMpDcXHTRXOCidMOqzMvbWgra6JVZW4qIl8bZ5NOlJSggKQa?=
 =?us-ascii?Q?g3DX910fSJn+/h8Zq0YoZLK947SJDxPHbmSyYv3297ajS2oxQEIChHwaDFRm?=
 =?us-ascii?Q?49dHuEKdH3p04d4n+3WUpZ2hBo9UF9l4mvTEye+xeWgO7tBPZfGqWfPokC0l?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	D91EwNe4mK+b+8XpbY2y6QAl2WRDZag0fRiK/UQLfjRtPcKSugiP9tzrNchP9dH7Ka1zpGeskNCmM+KKb/VvNS22jKvt5madkt65jFQVQDVN3nFM77YxHYtMwLr6YzAIjwFbcUjYBgKAxBh8D6N+StSPEQZX7L/cFX6YLkDfhPOfEG7344gLv/j6ivm+NhxeWvxOBx5ZG43loddo4ea1ztaJ4uhtqMz7YeCNPCF46ybMYApQksSGlSAQR3bQZ9iVIRB08rJKJ2/X1w2dRigKDamn9Pfdhqeekj/8qG6QyWgWB74Amyd1oQd8c3eY8SO9DbmGdwtNKo7ClDpDoRG6y9kcbMZsrW18IXXSEkNyB9P53SXHNO6q3uvKpl+/MagR4ZevDjlZnn7ma+bCLje1zUXHqUbxg6P0ZSRONMfcjQPxT6VNC7sbhfyGW8JICalFWHKnruW+ltA+ziZOpEMcw2+Bxt8QrUNb8zvvRarrgbtxLw/WgYq9dlvUx2arDGS2D/sCoWHrEPoEbbirPfyUGs8u+hgpmbmMKuY9jzRrVTmjn6u+Dhlpsqn9hN9t1bSacm1a3lassrbJI0ozt4HYHi0belQRepjOLQ9EIJFn92k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b13657-6b7f-4104-a4cf-08dc8fe5ebde
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 22:28:04.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3i8SQJsZulXumQft8ttQTVPSHcV+ihzlxhWs5aEpU5qz4cQXTdhq4KIDzlSboYodGt3CJRCeIvEnBHt9kXQPPXZqmUpHAVb9gMNey1c0yo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4348
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_05,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406180165
X-Proofpoint-GUID: kpHRNVDqgoBFcZ-R22W_vx0bLgPbBGjN
X-Proofpoint-ORIG-GUID: kpHRNVDqgoBFcZ-R22W_vx0bLgPbBGjN

Parallel builds were resulting in dlib files being generated before their
target directory was created due to missing dependencies.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/Build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libdtrace/Build b/libdtrace/Build
index abbadfa0..8d398221 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -196,7 +196,7 @@ $(foreach kernel,$(KERNELS),$(eval $(call dlib-kernel-ver-template,$(kernel))))
 # definition in turn.)
 $(m4-dlib-targets): $(objdir)/dlibs/%.d: $$(foreach name,$$(notdir %.d.in), \
 			$$(call src-name,libdtrace,$$(name))) \
-			$(objdir)/dlibs/.dir.stamp
+			$(dir-dlib-targets)
 	$(call describe-target,M4,$<)
 	$(PREPROCESS) -P -x c -Ilibdtrace/$(ARCHINC) \
 		      -I$(KERNELSRCDIR)/arch/$(KERNELARCH)/include \
@@ -229,7 +229,7 @@ $(m4-dlib-targets): $(objdir)/dlibs/%.d: $$(foreach name,$$(notdir %.d.in), \
 
 $(other-dlib-targets): $(objdir)/dlibs/%.d: $$(foreach name,$$(notdir %.d), \
 			$$(call src-name,libdtrace,$$(name))) \
-			$(objdir)/dlibs/.dir.stamp
+			$(dir-dlib-targets)
 	$(call describe-target,CP,$<)
 	cp -f $< $@
 
-- 
2.42.0

