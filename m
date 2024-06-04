Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA7884A33
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524738; cv=fail; b=NFubnbhJnwX16EdJEXQYYu3ZBhTDw5ZWJjGj8pkf1wKV8vGtPL6tQTA9s6BybdZCXVO2Lo5+CQ+Bna2JbgNAFMXDWKKzfRnY6caPWc3JseVVeD1qVUQ9H1qpbR0MWksEEMliheVRkSB4BrmTdn+K4Bx+6eI3hGIhBfKTnPbEMpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524738; c=relaxed/simple;
	bh=TkS1lu6C5pezOOCnRdw3cCaLjCyX57fZpNltlUKOGUw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cvrinVyqva3vu9GGBBBHwiJGVyDeQ4KpcYgdZl/3WaI5m3c1EcSUwn47of3613JNW94HjGYNdZjlMa8PSPaVzabmnD4xlP9YX3WAPenuJ+EChQOj4PCr3c1BsgSW8AvyVa/sw+bpcr+vOChxx5Ddq1S75XpMZNurutNbBu9IJ10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BmoSF013712
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:12 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DnvScgCXmmYPak8/?=
 =?UTF-8?Q?rpg9S6qXT4Ja4G/96EJQtWS1ANxA=3D;_b=3DX5kcktesIPU568DqIedbJFHR8K?=
 =?UTF-8?Q?/duq/pFu6fJxmBg7KCU+ahO1ebn9Z1+IabK43l9aLt_xVPZYn6yXVjsZyHYUxc5?=
 =?UTF-8?Q?I17yCy9ovmN2T00HocSlFUKd+soa7nzmEHm9M33NoPfwdect_t4hTvrMoLe+/wx?=
 =?UTF-8?Q?hInuPHpmq48I4cnXHSz1ZMJxv6fS8EKdWtVxf9TTKtYhYoqwr+3Dfe_qnyGU469?=
 =?UTF-8?Q?y8uNGOYZAlexBqAyszH7puBxYscovaYKVH+zAxI6usVRtvS69l7MoYfK3IXy_RO?=
 =?UTF-8?Q?/wocnccK8IUlcNCodUxUPYzA3Vaerhb1xjG49DFqiufvm5du3D+EQuqcVk7pfEJ?=
 =?UTF-8?Q?VzO_HA=3D=3D_?=
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfuwm5mfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:12:12 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454I2SaH015588
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:11 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrjcpp40-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:12:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3P5NO6PRcD+cxest6vHsyNthfZeUeEzKZajEHld9Uq1gh7ckzxEd47cTphLrpfI7xq38Zfb6sf9ZmniTmNzX4oCI6zHBjWMOptymAYjWcgGdjgnk5Mf+g8hjz5dAdlZ3p9rLqOJYBoa3Qub1Niwn71ZMOwNiBDkhopBD/4muiDLvIM56vu9BheSSZvuIX/+0iwVyDySucRB7KW2R9NoHPGo/CtTdoG7bEt3qcjpdD1AOqydGrgyJEzL3C9GDxgNwm3DB3PC0dbzhqA9BVvXZE5qCK6/ZepNV2+yyik0GUOoq8sO9hAHqrZCkp7mLupniOdy0SHW+cMbtea4rA8SZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvScgCXmmYPak8/rpg9S6qXT4Ja4G/96EJQtWS1ANxA=;
 b=ClbbNPRJhRqaH00U2LN+fJ9XgIgXIXvelUEpAnvt5u/2pMMTPLwq3yTw+GjRJyWbaIVgBhhVceRjIhhKwYhXXuSHAvOVmT1Rl3Aq332IL1Gv6Y2dSXrwir611gb8GcbugSWFv3iNAhXBGW+3UMLS9oOzWQ+MHyIyVOHySsC3daK5Nj37PUYWMd/W2bp02wAeR0o0c/jPyXaQgxYIV0sO8JBF4vECSaa0892ATavxTL0MlXxT5FJzZ+tJlkchv8hH6h8UPiWbnY8t81Gsa4iD+Sp3jwTTFqRGei+8eCQAfN1t9qTBZj60oLJSjy7PcvIY0ym1sVEHFnJtCvXVoKBs0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvScgCXmmYPak8/rpg9S6qXT4Ja4G/96EJQtWS1ANxA=;
 b=xX7dEXT58z+yEtJFdHnTyOahoBg8M8kR6UhUC0Wj2eQz0YcVl9wcLVBTe8Yts9hCh9pCqWuUZtjLzeLQpxBlrqDFNYICxBSr4No2m0vmoR4rgSkIb2m+McxJzPXaX7n8mA9pNr8kbScSdxBRf0moQOjBf0iyPuF47vipxazrZ9E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB5842.namprd10.prod.outlook.com (2603:10b6:806:23e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:12:04 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:12:04 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 14/14] Have the consumer get the PRID from the output buffer
Date: Tue,  4 Jun 2024 14:11:13 -0400
Message-Id: <20240604181113.11505-15-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:a03:338::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: f527e0ac-3b7e-4ffd-8c41-08dc84c1d66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O8mifFw+BrHefdOo212t4K0b8TWN1l95xvI8hGH54G+gkSiDRGlgwWnipOGM?=
 =?us-ascii?Q?uO1RVy0x/btxveDa3i7m70cCb7OzprChFW6RXCJp8EGBjaFbyIU/V83c0rMC?=
 =?us-ascii?Q?u3rcgqi39f1/dEuhUjnH5YthFtRCp4gRnqrEeLDfAAxug/MIpufFNC7ndcGV?=
 =?us-ascii?Q?NnA6IoadXg1af3Cdeu/zxaUDiwwOaLUx8A7LpllcFls6siptWJYR2cUo/UAh?=
 =?us-ascii?Q?MzehntgBvpIQXE0oUdUGqWCM3evwDEsear/T+2/NwiiH8bb32AL85xYmN/Eo?=
 =?us-ascii?Q?ARTalohWdyYbWNHTI0D0kQqaw5B2+tijFXzlUvfk4LFYEmP6mjIEXtb6g937?=
 =?us-ascii?Q?E5/9VFYvAF3XNb3irHcjNAZoVD5qhRoj+oRJhYwQaL2NNH2IgCCeRT7Svh8B?=
 =?us-ascii?Q?kIt27dXewD0F0EPeiNdMuZm2PkLjvJI1ejWRgqAks0FMH5Om6mbb1bR8dPWQ?=
 =?us-ascii?Q?oox0ETz8K634w1vdiewlMINpC48sClMOyZAI1UDLpbTP6eCQuBsx1OhpbVTh?=
 =?us-ascii?Q?wcEVGzYJbk/KD6P7/vYJVUN8kBfiGsfCNmH/9ydB7YKLs0A1LISXQ8AeydzD?=
 =?us-ascii?Q?nEpTxO/wx6dQ4rI5SvJ5d6PXl7Kc/PUSCS+RBTTAmlCGcGJEiSJChuPqgy9B?=
 =?us-ascii?Q?4cpoSc47kK034zOdMWROyhLXW00QywUkkJguvhzIlLkMk/LPHkXZLUFVOxi3?=
 =?us-ascii?Q?TO5yNpm/kQ5OiS4cUd8oP1AiCkpgAos2XwxjpUFuxTUW1yZ4MQ21wGadN5+2?=
 =?us-ascii?Q?qPfRSKLZ+cMoZgm72vRSV3hxcQyUcfhehjM3unYVdWP1awb1VyDlehFMpsuS?=
 =?us-ascii?Q?VidXgK9X0SCHJPSUFJbRL1C7epaA7Iq0bJu64vZBqgpghChEBWOu9Ny6mE4d?=
 =?us-ascii?Q?mhuOYPaaqpZ4m3gHagxlf2eNnL0IFVNGGLmEU+8MNi1BzXng3VnhrgCxQYrZ?=
 =?us-ascii?Q?1ak09TSq+rtEwvs167ayuAim7VB/W+uvl1LTS99en34gxnEirbTPmeFQCKRR?=
 =?us-ascii?Q?+0UmrthCrF0jmzlF1KkXIxz0emvPmXx7vqON1knlF2HTSlCqNqMH4iiG01iN?=
 =?us-ascii?Q?jYZ+SoE/aHjGhadX8sAl0k3lsrbXnufjXf2AHn3TScBLLwU20BeYAiMTfFbs?=
 =?us-ascii?Q?LqdF0wzUX/HJ5pDRGYFTp7esa6S6OjRmzwN8dxuU7g1zGqJAYBTiT9J0wdhM?=
 =?us-ascii?Q?ex6dCAGhb30bI64IvORo8UeNdOmG26JRzx6wz6uVXMmq0R6NemlJHgz0kDAc?=
 =?us-ascii?Q?YINbLoOWqZnkAzrJRzOlVs6LvYBf7N0iFqmuAebqWXfiux65fF8yMLZ2YZmv?=
 =?us-ascii?Q?3ndj8NPcFzg8gl/KCvIJWJO4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LiGiJlADYBCJNuP83LPB3Eb2VUWoYW32DVoi6rJQ210ALmFxSmRP6vJdpaze?=
 =?us-ascii?Q?CMlwSVDEYaEvFihDR81liizXLrgBP6eDHc621iyZC0sHQ/cxHVEZKc/7zc0A?=
 =?us-ascii?Q?fFLciqJOOVlyJGEQJIzZBo7tneG72iHfWj18tZOjWp6K/8CNu1BbN6uUyNNq?=
 =?us-ascii?Q?bL/jonIftAvEXGCkOPQJRCqHOfdeBXQ2OBdN1j8N6vaR/evhg5kyKofNLDnJ?=
 =?us-ascii?Q?tXDFT3S4XoJC7FnLEZLzCelga/dbDdJ8RWAqJrRIKCrfFXoYUy8j3sU7ty7s?=
 =?us-ascii?Q?KdBjKRsdw4ewp9GOnSs//LaQurks/BXiSnug2ZqRekHAxA/kOTeJSBuOeNvf?=
 =?us-ascii?Q?FTTcxK5JWfzav0OAXqqLhCq1iJsoY+Fycg1FR3CEfU/Qo74jJCE13OGjKm5N?=
 =?us-ascii?Q?ntetkZtdRy28soDKrhTwIjaGBHckp5UcudZxuazYi7ksIImu2jDK5wGs40rj?=
 =?us-ascii?Q?dAWtTttLNlWuZpgbIe1XNkfQgyx65M2AM/5nCn6tXO0ml4zUhDIvB1Mmn19k?=
 =?us-ascii?Q?ILpDYiz6V9yaBYDRCRTPBDUEo2BaEnslxZUnP3LjScAhAOOu6CJza7AVa4FP?=
 =?us-ascii?Q?EG7lf0yP2JMafu38OZO4xHOo5OFI0kG232CTkQESpSGMBcOat4t4S+9RA2Xp?=
 =?us-ascii?Q?k8xmoJLyVU0+4OulpeVRqCUEbssfvLyBb3q9Zyc2ulb9V1buBf28hGRsSpCq?=
 =?us-ascii?Q?BlHBWIu3hbPzhnDo1zCpEVlW8WhJru/90ATXYORoLSc3gwtSN7NyxFUq2ejA?=
 =?us-ascii?Q?bt+ia3eI4Ra+vbdA3oA3mDPtxTxAGZVyhn/7Gmr/aNwMQ4r9jzNHvjyaFAO1?=
 =?us-ascii?Q?wdpNTvdJOO9q6UuOFyPVvlxqgAGmnr/GlMKa4YrldM3Ri5nUMCItA0KMNsmz?=
 =?us-ascii?Q?dMANQaVNQKHljciXcbtzAmdI9mjwCdolN2rP2YwvqKNcAX31ldMDteUAs/Zj?=
 =?us-ascii?Q?UlYDBZFgwjQ9IcoJtE3ru3gBbW7D2fyuSXvfBt0csRYYKRP8y52fGbHSawzZ?=
 =?us-ascii?Q?rX5WHa/tuYW+Xew6qD5Uq4uwzdmfleTA0xm4xkRe0uhe/n88vsbfqdfF0pQE?=
 =?us-ascii?Q?MzwEhSQsBvC1Oeknq+wK4GNVeg4g39SgFw6NbLzgMHnPMYyaHlrlGZIgYDol?=
 =?us-ascii?Q?0qtK0HgPent01ygnOP/025GoSIJ2sf4wKowtqrM+Dnf/9JnLJAMeZ1Z8zxze?=
 =?us-ascii?Q?HvWGfSAeCDpNg73St2YVrgVzs9hUUGsSRCnAtZLN0OZwfkOyRzIIKrN4h24o?=
 =?us-ascii?Q?eelm94AuYiCodYPFygg8o/AAmGehJR2eKyqc6OaWO3/oc8qeUlb8elDa6z+4?=
 =?us-ascii?Q?lFUsWgXzY5pbfljF7KlHjJu0YNvnoOK3ThkfTphykVQjGLbxR8WG1D2Fs67e?=
 =?us-ascii?Q?EfeRU8m8ihrO+ZwZkEM9UbR/sSaYc94GYKAGovUk6U1sfAU5xekYpq3UBtn+?=
 =?us-ascii?Q?tFa+oyJBWHZlnmvJaVKyv26VJPiplbNXA5AnLZJUjzPTqJpiFbtvQpz2VBtk?=
 =?us-ascii?Q?UxNuAC4iTbEb0Vd9GiP4qVeWEx6h/ZInRRjbWkiy6a5GmpSdvPs4RHlSbH1G?=
 =?us-ascii?Q?I/TsrPSMJiXG5kN1r3NCw8RavUjMYk5j3nhgu1+G?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ZbKuRkudTePa3xoQ9bYd7AMzExuostujIlizM/y7ON/nzgOd0d//wz7GA7dwtaj8HFJKU9A6naLOZ7eWba26WN78rYjDm3Ktko/mOgi9Aum/FYwLAECfhzUPBAytGkqJ8fhuEJJQHAypgANBHzEJsTtRXc6WP6v57poKvqjylBEHKJjVj2Y0VTgrF06a3LaEuoE7jVbkoDhfVK9DQiggdTRGy2+UKND4iQvW0s8FVKRLXTPmUU9pERc+y6/KbAWAU6Jm3gMD1bh4Ohqp13jeF9N+8uRciYvAQnWaAe7jYw8fNYFIc7HYGTPH6kiIjJMBSdK5ej1fE//6CMYW0Bpio0yPi+HhnguR/dlZf88zuyJaocA2QUxe8amRhIZ/nhNGaqGl41zqwtubTvtD9EDfJwCZSUndh+tcApKIeV309FP3t6HDkSRxIKeE1PAnJspuSa5FIANGAlEYFGnYu62AfJ/rvkjv8o/DsS/eHPfZgMWioDWXwSVj3V2Ep6kFwAYZggqsiiA5+cVBFMVfiiALreA3pM8yT+uqg4xIaAkZJKFLtPHYL8avfcMzfsGgN4z4/ZS16O7Z2d8Lexs20L9l0ELiZaqZ9jbrw7p0w8IL02s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f527e0ac-3b7e-4ffd-8c41-08dc84c1d66a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:12:04.1789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUSZKZSRPv8lG6swTMJSOu+gd0x02f0tEco1BCnJVM8Xj/5TKgDbgCA0m0M46W2DxfHpkO899WhTNygzWD+CyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5842
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406040146
X-Proofpoint-GUID: p1qJCbpY6QNH088m2r66Jdf0l4KB5BFz
X-Proofpoint-ORIG-GUID: p1qJCbpY6QNH088m2r66Jdf0l4KB5BFz

From: Eugene Loh <eugene.loh@oracle.com>

WIP

Each output record has a EPID associated with it, allowing the consumer
to get both a data description and a PRID (so it can report PRID and
probe function and name).  We want to support uprobes that trigger for
multiple PRIDs, however, basically breaking this scheme.

So have the producer write the PRID into the output buffer;  it does so
easily by having the clause prologue copy mst->prid to the output buffer.
There was an unused pad in the output buffer anyhow.

Then, the consumer reads the PRID from the output buffer.

If this approach is adopted, further work is required for this patch:

- shift references to the output buffer
    so that we are not reading from negative offsets

- get rid of the EPID->PRID mapping (relocation, etc.)
    dt_link_construct management of PRID, calling dt_epid_add(), etc.

- clean up the hardwired PRID=3 for the ERROR probe

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/probe_error.c      |  4 ++++
 libdtrace/dt_cg.c      | 12 +++++++++---
 libdtrace/dt_consume.c | 21 ++++++++++++++-------
 libdtrace/dt_dctx.h    |  3 +++
 4 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/bpf/probe_error.c b/bpf/probe_error.c
index c8ddcdfa..df546665 100644
--- a/bpf/probe_error.c
+++ b/bpf/probe_error.c
@@ -26,6 +26,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 			     uint64_t illval)
 {
 	dt_mstate_t	*mst = dctx->mst;
+int oldprid;
 
 	mst->argv[0] = 0;
 	mst->argv[1] = mst->epid;
@@ -34,7 +35,10 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 	mst->argv[4] = fault;
 	mst->argv[5] = illval;
 
+oldprid = mst->prid;
+mst->prid = 3;           // FIXME all we are doing is forcing the PRID to be 3, which is usually what ERROR is; the clause prologues will then use this
 	dt_error(dctx);
+mst->prid = oldprid;
 
 	mst->fault = fault;
 }
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 4fd2d359..8ec917be 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1057,9 +1057,10 @@ dt_cg_tramp_error(dt_pcb_t *pcb)
  *
  *	1. Store the base pointer to the output data buffer in %r9.
  *	2. Initialize the machine state (dctx->mst).
- *	3. Store the epid at [%r9 + DBUF_EPID].
- *	4. Store 0 to indicate no active speculation at [%r9 + DBUF_SPECID].
- *	5. Evaluate the predicate expression and return if false.
+ *	3. Copy dctx->mst->prid to [%r9 + DBUF_PRID].
+ *	4. Store the epid at [%r9 + DBUF_EPID].
+ *	5. Store 0 to indicate no active speculation at [%r9 + DBUF_SPECID].
+ *	6. Evaluate the predicate expression and return if false.
  *
  * The dt_program() function will always return 0.
  */
@@ -1105,6 +1106,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	 *	dctx->mst->specsize = 0;// stdw [%r0 + DMST_SPECSIZE], 0
 	 *	dctx->mst->epid = EPID;	// stw [%r0 + DMST_EPID], EPID
 	 *	dctx->mst->clid = CLID;	// stw [%r0 + DMST_CLID], CLID
+	 *	*((uint32_t *)&buf[DBUF_PRID]) = dctx->mst->prid;
+	 *				// ld %r1, [%r0 + DMST_PRID]
+	 *				// stw [%r9 + DBUF_PRID], %r1
 	 *	*((uint32_t *)&buf[DBUF_EPID]) = EPID;
 	 *				// stw [%r9 + DBUF_EPID], EPID
 	 */
@@ -1114,6 +1118,8 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_SPECSIZE, 0));
 	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_EPID, -1), epid);
 	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_CLID, -1), clid);
+	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, DMST_PRID));
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, DBUF_PRID, BPF_REG_1));
 	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_EPID, -1), epid);
 
 	/*
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index dec2314b..21ba7ce7 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -17,6 +17,7 @@
 #include <dt_module.h>
 #include <dt_pcap.h>
 #include <dt_peb.h>
+#include <dt_probe.h>
 #include <dt_state.h>
 #include <dt_string.h>
 #include <libproc.h>
@@ -463,7 +464,7 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
 	 */
 	if (flow == DTRACEFLOW_ENTRY) {
 		if (last != DTRACE_EPIDNONE && id != last &&
-		    pd->id == dtp->dt_pdesc[last]->id)
+		    pd->id == dtp->dt_pdesc[last]->id)                  // FIXME will this work if we do not get a pdesc from an epid?  or is it even a bad idea to access dtp->dt_pdesc[] directly anyhow?
 			flow = DTRACEFLOW_NONE;
 	}
 
@@ -2087,13 +2088,13 @@ dt_spec_buf_add_data(dtrace_hdl_t *dtp, dt_spec_buf_t *dtsb,
 		goto oom;
 
 	dsbd->dsbd_cpu = cpu;
-	dsbd->dsbd_size = size;
-	dsbd->dsbd_data = dt_alloc(dtp, size);
+	dsbd->dsbd_size = size;                      // FIXME should also change this, or wait?
+	dsbd->dsbd_data = dt_alloc(dtp, size + 8);   // FIXME OMG hack, need to account that the prid is in the previously ignored preceding 4-byte pad, also we want to preserve 8-byte alignment
 	if (!dsbd->dsbd_data)
 		goto oom;
 
 	dtsb->dtsb_size += size;
-	memcpy(dsbd->dsbd_data, data, size);
+	memcpy(dsbd->dsbd_data + 4, data - 4, size + 4);  // FIXME OMG, we want to copy starting at preceding 4-byte pad;  pad destination 4 bytes to preserve 8-byte alignment
 
 	dt_list_append(&dtsb->dtsb_dsbd_list, dsbd);
 	return dsbd;
@@ -2184,7 +2185,7 @@ dt_commit_one_spec(dtrace_hdl_t *dtp, FILE *fp, dt_spec_buf_t *dtsb,
 
 		memcpy(&specpdat, pdat, sizeof(dtrace_probedata_t));
 		specpdat.dtpda_cpu = dsbd->dsbd_cpu;
-		ret = dt_consume_one_probe(dtp, fp, dsbd->dsbd_data,
+		ret = dt_consume_one_probe(dtp, fp, dsbd->dsbd_data + 8,   // FIXME OMG; points to where data[0] used to be
 					   dsbd->dsbd_size, &specpdat,
 					   efunc, rfunc, flow, quiet,
 					   peekflags, last, 1, arg);
@@ -2227,7 +2228,12 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 					 &pdat->dtpda_pdesc);
 	if (rval != 0)
 		return dt_set_errno(dtp, EDT_BADEPID);
-
+{
+// overwrite the (prid and) probe description we get from the EPID, using instead the prid we read from the output buffer
+uint32_t prid;
+prid = ((uint32_t *)data)[-1];           // should check prid > 0???
+pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
+}
 	epd = pdat->dtpda_ddesc;
 	if (epd->dtdd_uarg != DT_ECB_DEFAULT) {
 		rval = dt_handle(dtp, pdat);
@@ -2661,7 +2667,7 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
 		 * struct {
 		 *	struct perf_event_header	header;
 		 *	uint32_t			size;
-		 *	uint32_t			pad;
+		 *	uint32_t			prid;
 		 *	uint32_t			epid;
 		 *	uint32_t			specid;
 		 *	uint64_t			data[n];
@@ -2678,6 +2684,7 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
 		if (ptr != buf + hdr->size)
 			return dt_set_errno(dtp, EDT_DSIZE);
 
+// FIXME get rid of this later
 		data += sizeof(uint32_t);		/* skip padding */
 		size -= sizeof(uint32_t);
 
diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
index 1422ad24..ebb83a98 100644
--- a/libdtrace/dt_dctx.h
+++ b/libdtrace/dt_dctx.h
@@ -82,6 +82,8 @@ typedef struct dt_dctx {
  * The dctx->buf pointer references a block of memory that contains:
  *
  *                       +----------------+
+ *                 -4 -> | PRID           |
+ *                       +----------------+
  *                  0 -> | EPID           |
  *                       +----------------+
  *		    4 -> | Speculation ID |
@@ -90,6 +92,7 @@ typedef struct dt_dctx {
  *                       |      ...       |
  *                       +----------------+
  */
+#define DBUF_PRID	-4
 #define DBUF_EPID	0
 #define DBUF_SPECID	4
 
-- 
2.18.4

