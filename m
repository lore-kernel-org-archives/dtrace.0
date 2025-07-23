Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B94EAE7
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 00:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753231995; cv=fail; b=Muoy0gzK1PDYfp4cEwGyQWIP2LnloTmlelYDQmYjKail8+bm9NJrTV57GeVtCl9+Tb76KR1jei55ON7MQ7TWeHkLLxh/XWiPU+q+++YekYASJjt406x4UnMdhnWmSzGjBMOboaeP0oKXgJ8S0q05+n26FcblqTjGEhHSpt+dgGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753231995; c=relaxed/simple;
	bh=cnMAaOcaqOZecnn9V2088OYrqHilwkPwhCGm9sPZ/zc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=W5mIp1sFhHuHRQvuN0jvGw7QZnMj5+1WsgBos21SNN64/VF0NQbyKY9DpJnaoL9HsA3IanexFmMuay0cSgnoJvul46CjVBCRF+boUJZb9Yjr+gAjU75BPH7yEYueJsuPPHGi0S2HZiMGwzWmdGFA607UGpq96koL2BSTblpGJaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iO3YKTO+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s3yXD32N; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iO3YKTO+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s3yXD32N"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMR7F2031083
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 00:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Tzzw0TM67IQxxR9qMF/i7XkGOJC17LkPHnsaf6w83eY=; b=
	iO3YKTO+vOvl984r3M0Bs7qhohmuUTwo+EkQy54Uc0obzqNu7UHrU2Mj24mfZeJW
	9dwLAgtOgSC5CxYfH9mMWKcu6LrjzStpESHB9+4ewFJo6GEbph3fDOb6esANsz3v
	wd7IYyBKzvnUrsCFKRPYqb6kZTNiJd3UX9dnAc6B1437QqTIurlAVpbizCpsjVht
	iYRLRRm3Q2XJiqCVDlUuoLyuGax/sp6eCIMkC7e/aOBS2/ZZSNhvn/q8Bvd3LwYa
	VS9S2suz81Z2pBey1RSAUthUPScCkLIW/VOBzrr8MkcntEDtnmkcVIbfv82UlcHY
	ledZ3KU1g7zgEL/AbFrO/g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e2efjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 00:53:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56N0VY8d010340
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 00:53:09 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801ta0916-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Jul 2025 00:53:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qt88oor5hmV0xlVszziLAEQl8Dtczn4xDe8RK7v/xDbl3ERyo2p0c4M5jLlGupllRRcefalaBtyGWx8qRJXet4fAJUzSPgGw0qFavKs1FD7bWoALwgRjJM7Gaw3CxRj0w7Fqd1U3ZgLVVU3ciQxejNKfJ15i8Rnp+Pr0q/I9F9+BFCTEJ7f54aSIstR6Cyt7ZDlDSh3xLNKV9oBjuJAITJRuuDBNHbyFskw3RTUTKUqkp31/ksTSTzf6uNJcu1b90P99FAFK1STYT2BAN2BMoRBUi3zCwZkwAnN252S1erRdZZKcuF1ksbFsKRUJsS/CAO674ocYx/Ftrzu/y35w7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tzzw0TM67IQxxR9qMF/i7XkGOJC17LkPHnsaf6w83eY=;
 b=ntxMqXl4GFKUPDp58Oi5EGa0xXYhs9bVaJH8GktFzlcDtG+7qf82mNWjHa1U7eH1cVUSysSY1nOhWDSrA4umiJLdzcW48bAQZv5jCGJYDcOV9d4434BD3uBVOHxD+Ld9tycqef4x7/ZK/mfPWOSp1LN8YWAGodA4KIMBt6Czkjpwhv+I4rJyZgTNNO4fehmfwrmjgbZfqQuqcDO18wg6hIK447kgyGsU8d88/PMCkB7PtfzuaOYSfRcBKFZSBYMgYPtynwJcn7WLBpzsgpIuh06Ij+l1BK3lgwzkBKyiX4Apy5/kMhECCLa5TnGYpA8tPohjd355G0QFJiswLD/AtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tzzw0TM67IQxxR9qMF/i7XkGOJC17LkPHnsaf6w83eY=;
 b=s3yXD32Nm7FXCD6ptU/78XT75BTlU3AHfx4IgHPRz/rpj6rlGrJLHK5zFEYAbVnj+pUxxSF9TO03DCuB7jwhMvQfLQvIxoI0eKKoHswR7L4bCRPQ4HB+bb1MwXit/lBYIJF9GX5GpX6H0wXTgh7adgCB9hOb7TA9skuduGK62e8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB7712.namprd10.prod.outlook.com (2603:10b6:806:3a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 00:53:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 00:53:06 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 2/2] Extend the USDT bit mask to multiple words
Date: Tue, 22 Jul 2025 20:53:04 -0400
Message-Id: <20250723005304.8407-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 736badf4-f186-440f-92a1-08ddc9834959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tGZhFCf5PonUTKvcW66Bq7LS8qXDZL79mR9/eK5MBhypGoBBKK3KWTb/xAQL?=
 =?us-ascii?Q?eRBRIeaGWy4JbR6u3daVVK8Lae745hSmzke6AnXi/AltT2xr0N3z7Ldv/Hw1?=
 =?us-ascii?Q?IpkgBJCCVFlxzVB77/k4AJGdIlJCbp/g3QmMApfsHp2X0L0OomihSOPQW2OX?=
 =?us-ascii?Q?MGVjRLO1KeXF0iZr7rd9ph/RMD7TqrezOsrTMEbNA3Uj0QcmaPcQ/as2xBrw?=
 =?us-ascii?Q?GwR0Npem9R4PByeCrhGyF5RiExWGUU30kCR2DiN1J05jTFnkgfk05Z9p4Gvg?=
 =?us-ascii?Q?R0oO0c8vtFm84r5enHy5hdUMFSTDpHEIiH9bmb6MQEfErBo02xSYQ6+ECM0s?=
 =?us-ascii?Q?KVAtsL9FZ9b2d2uLFUhAwdZLZriFm1s8e3bjitFKlg0b0U1cbTxzvna+Wz2w?=
 =?us-ascii?Q?FmdejUympdu61fiByLX5PgxJz/An56T0Eb83zKHzPIuRgIhWPC51XNTY1W8e?=
 =?us-ascii?Q?nnMgK7k9CjK2lX/lsakq+BVcHc0LoM+ylKkbPFwxBtunJvSAlBv8PYuJ41t/?=
 =?us-ascii?Q?Ok7BumoHPKGeyEYZydBLFN/vkUAZ8kAJzMtCE0KuJE3UXJEKoBFsJY2Gnj+N?=
 =?us-ascii?Q?J5uKaRt6cadqToJ5WkxX4vuM5uysVr8wtb/kRV5MxdEp2XSKan8qFu32d9Cq?=
 =?us-ascii?Q?iHBOgTWevSFqk9u2TvH8JlyJF8qoqfzX/dCKjydxgqSYQg3bFnK/RH98Qx65?=
 =?us-ascii?Q?NpIwMlqPbtQRv2rnd/zxQmcMIO4oy/6stKQeJRFcw9xunJpp8gazf3qhJtB4?=
 =?us-ascii?Q?rye7NlwhiwaKT8L0TwyTApZQdbbfIDBpP3smHp8EgZkD1Kbqtk+KxhXZIS6S?=
 =?us-ascii?Q?hOu1ZTtQbR8x0fTc1bj28RjL34qBfuNdj05Lo2dpmkPX9DkNaMKKotR62C7f?=
 =?us-ascii?Q?IdT4S14suA74zP9S3KQ4Cq7udNeEPECinr0/LE5qH4CcW4MNdXUhw/JhJKJF?=
 =?us-ascii?Q?4iXT99LSI80XaVslsk5HWnyhEw63bBiU25qTRPwaGnaCcU1dZnZ/uehcSX5+?=
 =?us-ascii?Q?g+8VMcWeeP/TguzQIchT4xGxzMejQtSQ0NeB/L20UBJ+cn848aMi/a410xsG?=
 =?us-ascii?Q?M/dVJYCFt3VXuNAv243nX4NENFOWzqiZ+AnmGNH0pUc2/s+uuuV3cumujO2s?=
 =?us-ascii?Q?XWqaiHYyqRFsaoIagVMLVUhu4D52CvtRtlePkG8E1Oo+K4GmS/aPRonoqjtK?=
 =?us-ascii?Q?LHlgYoI/KJ2JszFMw8HkkJ258YQ5rSW+MSIaoNhUFE1WDDXTPNNEHd8V87z+?=
 =?us-ascii?Q?KuXxoG16sXGRIFEerTS26BvlPOSSJyeclXHID7Uoj58wo35TxyihCGGpN1LQ?=
 =?us-ascii?Q?7Viaay1GiY3wzqwQLHDK3woJV/TuDW0EO4gw/5+jNL7xR67SbTwTWl+Jp943?=
 =?us-ascii?Q?1uQNtBwKcQ/Iaz0ChWnFdVS0CI/GZkScRgpJdFAwxXu+ZZ1xPE51mzRIc08V?=
 =?us-ascii?Q?I0LDAMst6gU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bcAsIEShbW70NPXaYDAYHdyAkVe6uVEYldFgf+haPOriHMDZtm+QYlz+wJtn?=
 =?us-ascii?Q?r4xcBw3PYMDEeb15mNtlgSmUsvIroGkmZoDh5mRmbhVbj/4WpRyAs5cFWRob?=
 =?us-ascii?Q?gBd5m/YyjuTJZfC0WA+eSLs9vKwd+Zjvrx4J7CL9NfmyXsOeBjmyOX+k1Hfd?=
 =?us-ascii?Q?OX6gvBx4xrR93JgJ4496z3OZGlm5BmCA8STz4EBeN0/OaSYKb3mjdrwz3CKc?=
 =?us-ascii?Q?tbmr0/9d2aqmcN+qO7jaoD6xqHMCN6WCo0/i96tTrMLijOdNR4ywqBdDo+47?=
 =?us-ascii?Q?03g/1gSEh2lbZah1s4wwPmrBXzAKp2TByFIrqiktrPVPrVVJGG1nr5ObQTQH?=
 =?us-ascii?Q?PDsp1YypkETrQEDTqgpXXsH0jf/1M8bZ0LkT1fV5Ui6UkAixcDmTnsjtZ/vK?=
 =?us-ascii?Q?H9igwHIYORZEHwWj9pvuAI9guh3Pq3lUQtJDYUz9cUtsItDsaHgycRF1R4d6?=
 =?us-ascii?Q?VPv2udUNOGc/tN6e5IsSJdDqBjrMTwFXe8g5kGrGKDIDnrtiIqeiv1UZB+Bp?=
 =?us-ascii?Q?VVbq4ULxbD1HXLtFY6aR8267/t8xgxM58d+ZD5Of+mpKwy+sdWbQcg7Go8Zp?=
 =?us-ascii?Q?dbMyO/MjE8TOZUgAVhMhT89AlXn9WCYgpenLHk7w5kSprqJ/haJlTmmYp87k?=
 =?us-ascii?Q?xN8JOcRp2x2RINwzbdgLzfGssnaVif1azMhUBP6ufycpi9iSTRSw0+uJ3sm1?=
 =?us-ascii?Q?/r6eXvepRcNiFjbm6gr8uSR+xS0KIZetmhi/UrXgTCtSyq7HJWMdzKc8PbNS?=
 =?us-ascii?Q?9AMvhhjXBDQGKiZVpDtEbh5WVi42qVAREqgm8siKblcuDoZRPXARcdrjiNIS?=
 =?us-ascii?Q?OzRw+EABmR/yrBTitrtHPmT3vxCgjXZh/v1qU7UIQeqBQtION0pr8EE6JCwH?=
 =?us-ascii?Q?5XgbG8wrlzetCBEJVTKATwLb0Nw8ZiO3GFalRQuacj6nPBjXW6Rs4bJWEEl3?=
 =?us-ascii?Q?87omadmLjJKPM4veVca31mZLSk5Vzq33lyOm7KDukg3G65SecjgR9G8JIgG/?=
 =?us-ascii?Q?VviRps0WGvSzEd6ouTFnH2PHicNmyXekYRhB4E6fdhUcoULx+NpG86AHhkfH?=
 =?us-ascii?Q?zz7AX3mlGzPQUrG4D8omXHeq3EhUophWWcuAzDv9c+R5oN2hzAzPuVDRA9KH?=
 =?us-ascii?Q?MuA9DikBGHpPOmbEzVVI1BSPT+/odjwB4gPhurrqnesqxOvGppgR3m+ZeqN+?=
 =?us-ascii?Q?JsnQxUC4q7YnwsZO9e75in6Ol+iPm/+opQiwFP9OILXnDp3rfUl8GdBxLXF3?=
 =?us-ascii?Q?icsKoOK/uc7mcc4G+tQQfUen17FGJRyCaap/CUC4sPDViAw+TmoTkL1+mrKJ?=
 =?us-ascii?Q?XPDwqPio5sGBoIHJ/4ozUvrmjao15Z6q82OcaTsnwpqrRqyFf1Dw//WFs2Jx?=
 =?us-ascii?Q?H2sYMRaHLPa2d9gATDahCAv5EVdK0lvCtXEx03oSA84NGegqSQ6/gn6s1/cC?=
 =?us-ascii?Q?dZdan12+tOuGzdKFwqP6aGn7PViJZ9iPfWqF73UIAsMrKGXmMB64jDnaV1w0?=
 =?us-ascii?Q?gfGMBH7u2I2HyFRdHA1aheYXQ335ZyaaYDjyB83YkAp7ljTEABvB0FpYGO6b?=
 =?us-ascii?Q?4LDxwQ+PV+KCqGpLRMHVofsBNxxGF7MyLWhdmtX0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BuPnqJPoMFJ1SFHWPcTxVYvnJYe/5/FQ1ZRjxz/5cGJ3XqqP8Hpv9O4VCfvL2gwr0SDNtN3za43q2mhXIaR3su68t47YeV/XEMTMe4ORehpSyKKvQlP1QNfF1lkoKju6GCQ2BbOTSH+E8yPgm2OR5teckaBzXorDGm8QH4e7jffhwbSqMsjHMDdqY6Ccfki4i3XKawDrEoH7GrNQredHuKwCDuuRxi56fdcOx6eC6Ol1mAtDYJox+ZgZ1IsahPookpR2e3KoJEbOVi10fLoSlHNz8g5yKuiQ0rNQp1Wis1RDHBNdC1X4NUlXVmiChQY9c8kuJrI90DHXmWXZH9gnIMT1jHhR59TBhke+1B3P18258o1YmRB/C9zOVFJroWSFdZnXgBhnASVVfOUqDxRek9FQU1hO5pqrikxoxV5SAMIMSSJ5oRSsjvn8clsYbX4jg/fvcBFVlOq0B0/RrR8pRlZoonXb2+t+4wTr3zIZ1ujX8hcnSMdbzn5yXO4FumjGb6GRlB6N7MbRZbl6YeTonGjySoytxwRo7b64C1AwuVGkByZ73POCGy7scv9i0kas7fDzZhByJkrUKwfAhEg+YPyystV/BXAp/7AciOKfOIE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 736badf4-f186-440f-92a1-08ddc9834959
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 00:53:06.6585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnSZk47pP7eJH6yUgwuoA4XIQmn11ZQEEwrRRdR/vjawfoLR58PU1PNYKwJ95plRppTVuwHdZue3hTc6cu5AhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7712
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507230005
X-Authority-Analysis: v=2.4 cv=WaYMa1hX c=1 sm=1 tr=0 ts=68803276 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=a9VPwrN9JF28NtXkITgA:9
X-Proofpoint-GUID: Mqo8_1TeZiSWMsjl2Cqd_tNN5Ux1TxVW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAwNSBTYWx0ZWRfX3h4bIGAr7OfC
 XisXePp7i8PoQp6bW3fbzk024qgSBsMwQKnze3U21MqJCtr59MCUe/VjRIQ6ms+TUQhBAnMnsUK
 ajwwKKQqKC6uu5cAQmnr+qtHflInBi/b4/vC37Hf7AmaQNGhMldUw1Hdyuj6o/pl2JYtiqmTCKQ
 l1n1STW8YmvtOgTBhapRE6iuKHNX1g2hVQ3TNo2NBzZWevVId2bwGXExWoVVOMzpObNyObdS75r
 1yA69s78GULiVye5FjPbw8nOCnzInjLDG5hINVyBRm75XfolPBZP/+IqzSJ25QdOyL8ImrVTLNq
 A2N4ZfNj3sdrnwpj0X/xhAI2cDHPpmAvEMQNYLlXtnJOGLCy9AqHHMVp7OVZpydkb3sbK6kyTbV
 2ms5TTRGzsv+866KWxYFMSBIvp/hc5FLSdR21e6mF+/ov2kCaYy1mSkl5JXh60BE+O4+EFF5
X-Proofpoint-ORIG-GUID: Mqo8_1TeZiSWMsjl2Cqd_tNN5Ux1TxVW

From: Eugene Loh <eugene.loh@oracle.com>

Currently, USDT is limited to 64 probe descriptions since the
underlying probe uses a 64-bit mask to decide which probes to execute.

Change to a multi-word bit mask that can be extended to however many
probe descriptions there are.

Also, change the mask words to be 32-bit rather than 64-bit.  The reason
is that, commonly, there will be fewer than 32 probe descriptions.  In
this case, we shorten the value of the "USDT prids" BPF map from 16 bytes
        uint32_t        prid;
        long long       mask[1];
down to 8 bytes
        uint32_t        prid;
        uint32_t        mask[1];
(The second member is smaller and no longer costs extra padding.)

We also add an
        int dt_usdt_mask_bytes;
to denote how many bytes will be needed for the mask.  This value is
computed by usdt_mask_bytes_init().  Currently, this function is
awkwardly called in gmap_create_usdt(), just before the value is needed.
Such a call to a provider-specific function is clumsy, but there are no
other calls to the provider between compilation (where the number of
statements is determined) and this map creation.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c                            |   6 +-
 libdtrace/dt_bpf_maps.h                       |   4 +-
 libdtrace/dt_impl.h                           |   1 +
 libdtrace/dt_prov_uprobe.c                    |  87 +++++++++---
 .../unittest/usdt/tst.manyprobedescriptions.r |   1 +
 .../usdt/tst.manyprobedescriptions.sh         |  64 +++++++++
 .../usdt/tst.manyprobedescriptions2.r         |   1 +
 .../usdt/tst.manyprobedescriptions2.sh        | 127 ++++++++++++++++++
 8 files changed, 267 insertions(+), 24 deletions(-)
 create mode 100644 test/unittest/usdt/tst.manyprobedescriptions.r
 create mode 100755 test/unittest/usdt/tst.manyprobedescriptions.sh
 create mode 100644 test/unittest/usdt/tst.manyprobedescriptions2.r
 create mode 100755 test/unittest/usdt/tst.manyprobedescriptions2.sh

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index ddd849d0b..fcb53f044 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -967,6 +967,7 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+void usdt_mask_bytes_init(dtrace_hdl_t *dtp);
 /*
  * Create the 'usdt_names' and 'usdt_prids' BPF maps.
  *
@@ -992,8 +993,11 @@ gmap_create_usdt(dtrace_hdl_t *dtp)
 	if (dtp->dt_usdt_namesmap_fd == -1)
 		return -1;
 
+	usdt_mask_bytes_init(dtp);
+
 	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
-	    sizeof(usdt_prids_map_key_t), sizeof(usdt_prids_map_val_t), nusdtprobes);
+	    sizeof(usdt_prids_map_key_t),
+	    sizeof(usdt_prids_map_val_t) + dtp->dt_usdt_mask_bytes, nusdtprobes);
 	if (dtp->dt_usdt_pridsmap_fd == -1)
 		return -1;
 
diff --git a/libdtrace/dt_bpf_maps.h b/libdtrace/dt_bpf_maps.h
index 884dc3983..ec5d4d7b1 100644
--- a/libdtrace/dt_bpf_maps.h
+++ b/libdtrace/dt_bpf_maps.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2019, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2019, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -48,7 +48,7 @@ typedef struct usdt_prids_map_key {
 } usdt_prids_map_key_t;
 typedef struct usdt_prids_map_val {
 	uint32_t	prid;		/* should be dtrace_id_t, sys/dtrace_types.h */
-	long long	mask;
+	uint32_t	mask[];
 } usdt_prids_map_val_t;
 
 #ifdef  __cplusplus
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 2adc1252b..8bbc4dc1f 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -397,6 +397,7 @@ struct dtrace_hdl {
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
 	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
 	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
+	int dt_usdt_mask_bytes;	/* size of USDT mask in bytes */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
 	void *dt_errarg;	/* error handler argument */
 	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e8f9f8c98..8b55fe319 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -403,7 +403,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 	int			fdprids = dtp->dt_usdt_pridsmap_fd;
 	int			fdnames = dtp->dt_usdt_namesmap_fd;
 	usdt_prids_map_key_t	key, nxt;
-	usdt_prids_map_val_t	val;
+	usdt_prids_map_val_t	*val = alloca(sizeof(usdt_prids_map_val_t) + dtp->dt_usdt_mask_bytes);
 	list_key_t		keys_to_delete, *elem, *elem_next;
 	dt_probe_t		*prp, *prp_next;
 
@@ -418,7 +418,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
 		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
 
-		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
+		if (dt_bpf_map_lookup(fdprids, &key, val) == -1)
 			return dt_set_errno(dtp, EDT_BPF);
 
 		/* Check if the process is still running. */
@@ -431,7 +431,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 			 * we might delete the same usdt_names entry
 			 * multiple times.  That's okay.
 			 */
-			dt_bpf_map_delete(fdnames, &val.prid);
+			dt_bpf_map_delete(fdnames, &val->prid);
 
 			/*
 			 * Delete the usdt_prids entry.
@@ -452,7 +452,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 		 * FIXME.  There might be another case, where the process
 		 * is still running, but some of its USDT probes are gone?
 		 * So maybe we have to check for the existence of one of
-		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
+		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val->prid]->desc;
 		 *     char *prv = ...pdp->prv minus the numerial part;
 		 *
 		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
@@ -590,6 +590,31 @@ static void usdt_error(dt_pcb_t *pcb, const char *fmt, ...)
 	longjmp(pcb->pcb_jmpbuf, EDT_COMPILER);
 }
 
+void usdt_mask_bytes_init(dtrace_hdl_t *dtp)
+{
+	int i, n = 0, w = sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
+
+	/* Count how many statements cannot be ignored, regardless of uprp. */
+	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
+		dtrace_stmtdesc_t *stp;
+
+		stp = dtp->dt_stmts[i];
+		if (stp == NULL || ignore_clause(dtp, i, NULL))
+			continue;
+
+		n++;
+	}
+
+	/* Determine how many bytes are needed for this many bits. */
+	n = (n + CHAR_BIT - 1) / CHAR_BIT;
+
+	/* Determine how many words are needed for this many bytes. */
+	n = (n + w - 1) / w;
+
+	/* Determine how many bytes are needed. */
+	dtp->dt_usdt_mask_bytes = (n ? n : 1) * w;
+}
+
 static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 {
 	dtrace_difo_t   *dp;
@@ -651,6 +676,7 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	int				fd = dtp->dt_usdt_namesmap_fd;
 	pid_t				pid;
 	list_probe_t			*pup;
+	usdt_prids_map_val_t		*val;
 
 	/* Add probe name elements to usdt_names map. */
 	p = probnam;
@@ -686,11 +712,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	}
 
 	/* Add prid and bit mask to usdt_prids map. */
+	val = alloca(sizeof(usdt_prids_map_val_t) + dtp->dt_usdt_mask_bytes);
 	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
 		dt_probe_t		*uprp = pup->probe;
-		long long		mask = 0, bit = 1;
+		uint32_t		iword = 0, mask = 0, bit = 1;
 		usdt_prids_map_key_t	key;
-		usdt_prids_map_val_t	val;
 		dt_uprobe_t		*upp = uprp->prv_data;
 
 		/*
@@ -704,15 +730,24 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 		if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
 			int n;
 
+			/*
+			 * The loop over n to dtp->dt_stmt_nextid, skipping
+			 * ignore_clause(), should be the same here as in
+			 * the trampoline.
+			 */
 			for (n = 0; n < dtp->dt_stmt_nextid; n++) {
 				dtrace_stmtdesc_t *stp;
 
 				stp = dtp->dt_stmts[n];
-				if (stp == NULL)
+				if (stp == NULL || ignore_clause(dtp, n, uprp))
 					continue;
 
-				if (ignore_clause(dtp, n, uprp))
-					continue;
+				if (bit == 0) {
+					val->mask[iword] = mask;
+					mask = 0;
+					iword++;
+					bit = 1;
+				}
 
 				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
 				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
@@ -727,11 +762,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 		key.pid = pid;
 		key.uprid = uprp->desc->id;
 
-		val.prid = prp->desc->id;
-		val.mask = mask;
+		val->prid = prp->desc->id;
+		val->mask[iword] = mask;
 
 		// FIXME Check return value, but how should errors be handled?
-		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
+		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, val);
 	}
 
 	return 0;
@@ -1452,7 +1487,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
-	int			n;
+	int			n, ibit, w = CHAR_BIT * sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
 
 	assert(usdt_prids != NULL);
 
@@ -1539,7 +1574,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 */
 	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
 	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
-	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP,
+		   DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
 	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
 	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
 	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
@@ -1573,8 +1609,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
 	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
 
-	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
-	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
+	/* Store the value key for reuse. */
+	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
 
 	/*
 	 * Apply arg mappings, if needed.
@@ -1588,21 +1624,29 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	/*
 	 * Hold the bit mask in %r6 between clause calls.
 	 */
-	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+	/*
+	 * The loop over n to dtp->dt_stmt_nextid, skipping
+	 * ignore_clause(), should be the same here as in
+	 * add_probe_usdt().
+	 */
+	for (ibit = n = 0; n < dtp->dt_stmt_nextid; n++) {
 		dtrace_stmtdesc_t *stp;
 		dt_ident_t	*idp;
 		uint_t		lbl_next;
 
 		stp = dtp->dt_stmts[n];
-		if (stp == NULL)
-			continue;
-
-		if (ignore_clause(dtp, n, uprp))
+		if (stp == NULL || ignore_clause(dtp, n, uprp))
 			continue;
 
 		idp = stp->dtsd_clause;
 		lbl_next = dt_irlist_label(dlp);
 
+		/* Load the next word of the bit mask into %r6. */
+		if (ibit % w == 0) {
+			emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
+			emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask[ibit / w])));
+		}
+
 		/* If the lowest %r6 bit is 0, skip over this clause. */
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
 		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
@@ -1630,6 +1674,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 		/* Right-shift %r6. */
 		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
+		ibit++;
 	}
 
 out:
diff --git a/test/unittest/usdt/tst.manyprobedescriptions.r b/test/unittest/usdt/tst.manyprobedescriptions.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.manyprobedescriptions.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.manyprobedescriptions.sh b/test/unittest/usdt/tst.manyprobedescriptions.sh
new file mode 100755
index 000000000..92a61d5b7
--- /dev/null
+++ b/test/unittest/usdt/tst.manyprobedescriptions.sh
@@ -0,0 +1,64 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dtrace=$1
+TRIGGER=$PWD/test/triggers/usdt-tst-args
+
+DIRNAME="$tmpdir/usdt-many_probe_descriptions.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Construct the D scripts and output files.
+# We stick 80 probe descriptions in each of 3 scripts to test
+# USDT's ability to handle hundreds of probe descriptions.
+for d in 0 1 2; do
+for x in 00 01 02 03 04 05 06 07 08 09 \
+         10 11 12 13 14 15 16 17 18 19 \
+         20 21 22 23 24 25 26 27 28 29 \
+         30 31 32 33 34 35 36 37 38 39 \
+         40 41 42 43 44 45 46 47 48 49 \
+         50 51 52 53 54 55 56 57 58 59 \
+         60 61 62 63 64 65 66 67 68 69 \
+         70 71 72 73 74 75 76 77 78 79 \
+; do
+	echo 'test_prov$target:::place { printf("'$d$x'\n"); }' >> D$d.d
+	echo $d$x >> expect.txt
+done
+done
+echo 'test_prov$target:::place { exit(0); }' >> D$d.d
+echo >> expect.txt
+
+# Run DTrace.
+
+$dtrace $dt_flags -c $TRIGGER -q -s D0.d -s D1.d -s D2.d >& actual.txt
+if [ $? -eq 0 ]; then
+	if diff -q expect.txt actual.txt > /dev/null; then
+		echo success
+		exit 0
+	else
+		echo ERROR: did not get expected results
+		echo === expect.txt
+		cat      expect.txt
+		echo === actual.txt
+		cat      actual.txt
+		echo === diff
+		diff expect.txt actual.txt
+	fi
+else
+	echo ERROR: dtrace error
+	echo ==== output
+	cat actual.txt
+fi
+
+echo ==== script D0.d
+cat D0.d
+echo ==== script D1.d
+cat D1.d
+echo ==== script D2.d
+cat D2.d
+
+exit 1
diff --git a/test/unittest/usdt/tst.manyprobedescriptions2.r b/test/unittest/usdt/tst.manyprobedescriptions2.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/usdt/tst.manyprobedescriptions2.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.manyprobedescriptions2.sh b/test/unittest/usdt/tst.manyprobedescriptions2.sh
new file mode 100755
index 000000000..8001cec0b
--- /dev/null
+++ b/test/unittest/usdt/tst.manyprobedescriptions2.sh
@@ -0,0 +1,127 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# This test uses many probes and probe descriptions.  Therefore, the
+# number of BPF programs to load into the kernel -- dt_bpf_load_prog()
+# calling prp->prov->impl->load_prog(), which is dt_bpf_prog_load() --
+# and the duration of each load are both increasing.
+# @@timeout: 400
+
+dtrace=$1
+
+DIRNAME="$tmpdir/usdt-many_probe_descriptions2.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Set the lists.
+# - The probes will be foo$x$y.
+# - The probe descriptions will be foo$x* and foo*$y, for each $d.
+# So if there are nx items in xlist, ny in ylist, and nd in dlist,
+# - there will be roughly nx*ny probes
+# - there will be roughly (nx+ny)*nd probe descriptions
+
+xlist="a b c d e f g h i j k l m"
+ylist="n o p q r s t u v w x y z"
+dlist="0 1 2 3 4 5 6 7 8"
+
+# Make the trigger:  Preambles.
+
+echo "provider testprov {" > prov.d
+
+echo '#include "prov.h"' > main.c
+echo 'int main(int argc, char **argv) {' >> main.c
+
+# Make the trigger:  Loop over the probes.
+
+for x in $xlist; do
+for y in $ylist; do
+    echo "probe foo$x$y();" >> prov.d
+    echo "TESTPROV_FOO$x$y();" | awk '{ print(toupper($1)) }' >> main.c
+done
+done
+
+# Make the trigger:  Epilogues.
+
+echo "};" >> prov.d
+echo "return 0; }" >> main.c
+
+# Build the trigger.
+
+$dtrace $dt_flags -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >&2
+	cat prov.d
+	exit 1
+fi
+$CC $test_cppflags -c main.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test" >&2
+	cat main.c
+	exit 1
+fi
+$dtrace $dt_flags -G -64 -s prov.d main.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >&2
+	exit 1
+fi
+$CC $test_ldflags -o main main.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >&2
+	exit 1
+fi
+
+# Prepare the D script, generating the probe descriptions.
+
+rm -f D.d
+for d in $dlist; do
+	for x in $xlist; do
+		echo 'testprov$target:::foo'$x'* { printf("'$d' '$x'* %s\n", probename) }' >> D.d
+	done
+	for y in $ylist; do
+		echo 'testprov$target:::foo*'$y' { printf("'$d' *'$y' %s\n", probename) }' >> D.d
+	done
+done
+
+# Prepare the expected output.
+
+for x in $xlist; do
+for y in $ylist; do
+for d in $dlist; do
+	echo $d $x'*' foo$x$y >> expect.txt
+	echo $d '*'$y foo$x$y >> expect.txt
+done
+done
+done
+echo >> expect.txt
+
+# Run DTrace.
+
+$dtrace $dt_flags -c ./main -qs D.d >& actual.txt
+if [ $? -ne 0 ]; then
+	echo ERROR: dtrace error
+	echo "==== D script"
+	cat D.d
+	echo "==== output"
+	cat actual.txt
+	exit 1
+fi
+
+# Check results.
+
+if diff -q expect.txt actual.txt; then
+	echo success
+	exit 0
+else
+	echo ERROR: unexpected results
+	echo "==== expect"
+	cat expect.txt
+	echo "==== actual"
+	cat actual.txt
+	echo "==== diff"
+	diff expect.txt actual.txt
+	exit 1
+fi
-- 
2.43.5

