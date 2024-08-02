Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6172650284
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 20:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722631637; cv=fail; b=Z9OfeyfFHwTr1Vb7CIXOH0UUTYFJNowPmpIs/4JRlo4wZ4u7/5EQVOLX/+AQAT0BFA0bSnGDvB5Q4na7XxByMubr6wDkrHKsnNQp9LC86+5PEYeDHoFqE/OLcu+/XifufP15o5/OUjNOlMxMfbCs6gPavWDDDr+nnZ6G/vgaHPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722631637; c=relaxed/simple;
	bh=fsNCKqcSAMa3R8Be6rIHrVnXfmZ0tiDEUObkJquph60=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Ihybr1pvt5ctMGXoh3wPyY3dsT3qlf+ucfBCEs4F+Fuc6KEtGowYMDyEPA3nUgv86j8xv/7UlsC0rmOUjcTyxhNeyepuwx37RFypo+sNI+jG4DlIRzxwkJfifBA0h/DrzP4ptqfBObufdRFcqVSBhKernmmGkKkuFN1JvC1i3uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PcYG+BCQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JFnIX46w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PcYG+BCQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JFnIX46w"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472GtUbb002972
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 20:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=gWKp23a8wUzw+vNnJqtJDeRE3sjQnI/8Lc5KnfttpeE=; b=
	PcYG+BCQ2XqzQSjQefkO7M0bBQE69xa4BGxU0+7kKKCqnVfU31RgVHbRZVOlAS87
	HGXZMOk8acyftzCEa47rRnWYduug6Z/dd0TpTn6DfhihdILHIfeSXDLWcB75LpZP
	obqm+lPwYDMi/FRF1HJT1grYGm9Z9hmSd2Qu1xydZjCCl/bH2GeT1DELpX0TI0X+
	a7w4rE0bhnEFspZ94IKFsZYKNpSKDDTr9Ny+692TcE2Bmx+a7WO85qUTMXTGVDtR
	hIEU/4JZfT+PkGl6DtnvMiRIsWimLg0fbgE1iAQL9dAo45mBmR/+nkeImuNgWaoi
	bLq0t1xZ51LzddDNSduobg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje8j6pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 20:47:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472J54Ak037712
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 20:47:13 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmpuvh1s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 20:47:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKvjIo4KCFFxmepGoxlPyD65meZw2WHrNgTqf/+J7hO9kWviFse/lRFn3ZergdiJvtvAb9k2ZzUU/hFkLL8VGX5CZvycXcj/+Nh8/od/aGzOke87lKnQPIMzd4HovVy5kAcKgvhp7fCfhw9S1KWJq9lzLJykUQ5aqXluPlxbHunqAfqZBJ/KduDjTcKQaZg0islqpji/XkmYyX+uj4FZcoUUA/cc9Pnt81FoRHBMEY4Zm7brtLdxsIGOmEnWGMuJ+CjzQEwd1tfq/UOOyQtmaIc8DC7hjeFwC9lucdJzOIiOYXAQMxLv4Pd1Cb/+DxDTfXmTz848RDNip6iGkl1iGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWKp23a8wUzw+vNnJqtJDeRE3sjQnI/8Lc5KnfttpeE=;
 b=kAFct6TGTEdaWqj6+nSAm6PZCMmXbXdTrR17b/mrnzIhz+JFCk9sH54FP2kzSm8axHK1YfHiveeCDfMtMbG1dOt1kZiErAy1pR1IEzcdH67PWfCp+NjzZklavHZKBcYmnOkMOf3lV72iYqJpfxzYVpgi357pG/2uoP9M5k0KeuXo6OT42s/VP6iVtuOTX/py1HS5jTtxsH6Qu/0CibL9IoDR2XT01CU8Qyfa2DThneKRNao9uCtIxG8aAwnN/f5sLzLl1ErHiC6T9f428UDIEZrTVrJqflnHF/jR8Ctr4wL2SWWJWiLY3aLxGA2u1hY/nsyt71iSSPBh/ielyw/Y2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWKp23a8wUzw+vNnJqtJDeRE3sjQnI/8Lc5KnfttpeE=;
 b=JFnIX46wuhFfMCnU3n37YpEXor/T/l5hyCKkIGqjJW585Vl6WIsVHnMqzOZBytVE1yVfRB3T9kZGqqSJpXHAwr0QTgPoYLVodl0vitfwgdmAoY+IM8Zw/f39fN7rqQuO5pRDa8nXRvCUkzGZIN9CZJF6aKO3d2IWRG+P/50KfqA=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by CY8PR10MB7194.namprd10.prod.outlook.com (2603:10b6:930:77::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 20:47:10 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 20:47:10 +0000
Date: Fri, 02 Aug 2024 16:38:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] test: fix another use of a kernel variable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::16) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Message-ID:
 <PH8PR10MB6292435D6EEF211506E49899C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|CY8PR10MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bcd8c2a-b121-4b1e-08a0-08dcb33447e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/ckx0NjTDbgJPDseeV3tcyqllDgczKp0mBs2RT2rPPF86H0MRo4bItuB+xST?=
 =?us-ascii?Q?QAfw73/540ZpkdKHlmXfTFPbMYdZ3kjXWLcdoOexMFHAFqTp5xU75lcseSd/?=
 =?us-ascii?Q?uJ1vmpR6pz/C6XJQUlCdFRB9umM+i2jmKNbN45wkCcVg2IVlQo6slgkiAa2h?=
 =?us-ascii?Q?/rn/yNfefkgdxggRhaYz05D5CtVfFC0i2owMouGgmVjmGqy70mW60vSwEO0N?=
 =?us-ascii?Q?uMut1ndSsxwMn2kPObZOO9gWMZDzKRR2uRPb4gyPES5Rl4O8E/FEuah4KAqH?=
 =?us-ascii?Q?JHH/csK5nK3Ovc9HGCKQr8inGykmahRaQzwS8cV+cugXAR0fyJ8LIVBMQDe1?=
 =?us-ascii?Q?2fcPwYpbjlbNZJpHBbo+DImrJFWSJmaIya9FgudsIjIMXvmyO0mUQJ8XRMID?=
 =?us-ascii?Q?K0wCjoFRQ+whCB7bMXhOrEmKxsB4LoSZBQLCkggI/e4jsVXuusAc/Jq+9j2H?=
 =?us-ascii?Q?hE166mpwvyqPYALAgZ/KpvOA48zGCTLfMT0IOHbkPWBBnXlXpTSMbu3OfFCR?=
 =?us-ascii?Q?CEK6r4MwbKutPW7QLvMyRMM63xA68lLneg2Bfuxc/TcpBgc7vHYrdNm94Ryd?=
 =?us-ascii?Q?7ySBVVq/0BqU1whOfu9vwffxBqyr9b5Wfy51VceO6ggceXGhbpMA0n0hzRZp?=
 =?us-ascii?Q?99nEqa5G22WbQlIyba1V1SqG9tue40RZEu69r7tnxSc4eee6voFshzhBA5P/?=
 =?us-ascii?Q?bK1CYmX59fqLktb9r2GvLT1h4Jv1//5c2THMDlHpTwqP16400+4e/mGgdDmi?=
 =?us-ascii?Q?5a/SUWQWdpWZjAlj/MK1XeE+V9HH/IVUdA3NoiLUxhB7lgQK2Jh6c4Z23HkD?=
 =?us-ascii?Q?lG+MD8RySNKdquZoNyLKAK8EM0k6h1qsXK0jiZUWSp8v50m9iP3kjvUrlv3e?=
 =?us-ascii?Q?GyGfYJai09F7D6T/+A1Tx9F3d8q018pswRAlikCSCee+wuvE0UJxTDKXeFmV?=
 =?us-ascii?Q?ZYWLSA5qGaxBe/Or2RbE3uTYQXhNpxwJ74+yNAdtMxwf6yWbSA9jDj3O67PF?=
 =?us-ascii?Q?A6mPlah3+p7mfUUVXYDzaM6erYJZhnRGRI0M4HXOipi+frF25Qtjo8aGSWog?=
 =?us-ascii?Q?4TPzTCQ+mgp202YPNl8VyCJVHGV06oZmfl5oVBbteKnvG93iyxIwtIN7w73+?=
 =?us-ascii?Q?yWhVgPxy/6WMPckRfwNorDR82DvHX/Pt3SQQNnXZOg+QPt+G7UN9DUqBFghn?=
 =?us-ascii?Q?mA21WHH/VxYTRmNAv/Nf7srDP+7vwndYWF59OtfTGsWMtI7dIvZrCzI+jvYK?=
 =?us-ascii?Q?w81/f6UfTwM3m1S7uylQNo83Yw7S/MQHfAlq9ULVg4zU2O1VMsmlguoUF7Ez?=
 =?us-ascii?Q?p1tQmDFMy403XSx3N1GHVtiuJQNcM4L0d7J2RWeN1WLk7vz7SPqZFwTgb9zW?=
 =?us-ascii?Q?JGptK30=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yyyQ1aip8DOsh5wkaTvVwI0cIX9G7hHoFC9fJYqX8bfwamxhI4cercqHvjkn?=
 =?us-ascii?Q?9N0MXLIu4U3LgEMU2eK4/s0ooAN1q29W1UPzrVMag6nDhPMvXfZCSLb7UnSB?=
 =?us-ascii?Q?VZ+rPHlzX86bjIJZH8N4WSn7uQ+FAabYPh2vgQOKp0HGxVa5td47J0T/g+c4?=
 =?us-ascii?Q?X0Rl6G0ZszmA6AtTfpVxSlfwKpjgtwyOyQPI3SiuSbn2+nX2MQlwGcl44bsb?=
 =?us-ascii?Q?n43caYPD8P9+F/VzYoJngTxO2OFWgXMuC6kC1cmhWc/2b4SD4iYNAP200yVH?=
 =?us-ascii?Q?O7eQ2xySq47mt2Kr4Zdx2Tj0jttj12FC87Tv5la6dYbfLD1r7meFLN7e7f/z?=
 =?us-ascii?Q?lHyPsaNMXnEG4b8I7zMluafJYL2cBPeTUdE6NTq8gMCBzK31kSW6jNiJj71+?=
 =?us-ascii?Q?/OFBdDkJ2dLPASyb6p+tBULlhr+ER8+W+rx/YLrIU1DaGxn7xKGXG5fW/a6u?=
 =?us-ascii?Q?gtXtLRNAc+8kqBXpC9ZijrT8acS+Q4AQ9Lj9KcP1J1z2q+uKPpvzxDWUzm0d?=
 =?us-ascii?Q?X8rqWxr75kJ64VkgJnBD1nod4P/IetPRnjlYWaYM/lyLEizYqJSlHMfzTfck?=
 =?us-ascii?Q?v57p/oYDefzstifJ0SWI4lDGJk0xYg2dCtSApSmTO7aUsgVbiuo78VPAcUdZ?=
 =?us-ascii?Q?LYrtyMW1lNs4jS0vM1M9v3LJRnV6qdtcPL0jzO1aZ8I4NWGQza0te1j+qAaL?=
 =?us-ascii?Q?pUFEmcq6C4X6WCyLkohTReIYbUtxV3t7VHmz49ZMeZKWWj117aZtO84kWtVa?=
 =?us-ascii?Q?WLZOy3JaWfNnKtJ9WdwlOxb8MLsGElwta3Pa0V+IXaSZpa6iRvEXUUC45rDw?=
 =?us-ascii?Q?S+7+mbLr1Lrmj+20grdgKOgrycq/T1W/H/WFAL4p5q4ZqUwyzLkX6vZr3xpe?=
 =?us-ascii?Q?JS39qOqpMa4duG2yeSfCNjFmudN1UlFKWAwqE9Hm+icm1mioIPYPNuTLU/q+?=
 =?us-ascii?Q?XocTwkV/xr+xi6sDUI7vlY++KPqdUfy/IQ7OidTPQWPVs71rlFu65uLmhaWG?=
 =?us-ascii?Q?eDcSnhNLcZv01zoAbua0zD/e7wG7RtmB9Ht80eQ0XXyIy9tOXTdepSmcM3GQ?=
 =?us-ascii?Q?FRKlQX8j06ff0jvr40m+L44LMQpk6qywlWCOpoV1VO9b0HTllJu9meYLEFpj?=
 =?us-ascii?Q?pZVaFBFXH/ZxlfKAyNHuoHcyLRT2NwMU1vZDi3VAmtD8Ap6F2e0vu4o1j5ys?=
 =?us-ascii?Q?tkQRY5QAhPlsUKlBboNrCxWk8hPAcLmH8gy51urmql/PnVJsKMHFZeyYxmJQ?=
 =?us-ascii?Q?WGuEnNwPKbHAoFyT694wCpPyo/BvUQdqaw9DFYI2mi/AiM4KRZyZf/l/a6Kn?=
 =?us-ascii?Q?6nBMg+2Adi5HpmA6G+vfyafNlzV3uAo0UK2sE5gzSNptovA0d7Lt9/jcd3UN?=
 =?us-ascii?Q?pE0hOGMhJc5kA52936MbmhskCSJ76uaiJHm49KHVSpDtvX9iWwhXRycDO8Mv?=
 =?us-ascii?Q?zsuIpjriaI206fokKNqb7PSYgkNS1Bd7v8kfkXQ45yKUnKVxTTwYmMi5BtZi?=
 =?us-ascii?Q?S9Kfbkj9QFavpeE20sw4Ya4msaOvhf5hG2n+3mh694yq4CWxV2vcdnhaxnhs?=
 =?us-ascii?Q?GK6YtyzgsotxrynHS3DQ4Go0HnaS9N16Y5G2dc+y7qCT1/+O0jd2MiUc1BKy?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uFNueIU4S2aMP6sXwjnGfRmTlQjGsA5yyF9oiEnBRvkEBiV2SxwctbM63Ad1QwZV1jl5+Hfy0Dnm/ZOzuj53IIfYdMyyNC2HbCNjH2SSjOoI4BGSEqFQ3EECS6ig8xrmZhXSRck1dLdewENwt8emqvm9VTDXlRFjdoPlipbYxWKoMIsaUe+U4ZBa9N2X8MD9l+qYJvvKZrBf0NHf5qlSSz3ooR5XXKMEkfESUHVnYVp1ofsVkwSh+bVNsXGAsq4NzoX3H43VV5vn7gMIGlpBqUx6nE7RjmREl9PnRkmTG9B0Q+WUOw+k8Ix9j/c8Bp0QQSUuRtwsioZrjkg7gkDGhOEeJKTUcYIVFyTvegKFXJgALGDQyvnLhs45hNsUvGlwdbUfjy5jSAQN724SVUvBu9ZI+H2ZFJDJpAQLBXqkYpOJrUunJC5a/+zNOhmxlrm4PbtTKffjQ30nXI6bKIt0A/vI21eRU+yP3fWQ9/luPqgbta6nBugvLQCX8hLyoBcvWkwO62CA05nbyIGqycWyR4H0vWvWVv2i2DaCo+x9MsHj1Re3b9EKG5ovdtXuIePKcw1xPYQoYah7GcftydkEqELWM/H0wtq5itDekwRGsCg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcd8c2a-b121-4b1e-08a0-08dcb33447e9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 20:47:10.8225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j365FHy86VSdlgaKBCaN3LJi0HiAM/jrtr/+kaSui7MAtmTxwIKhNJFvIIqzg4jYKyeNYPeiBuMwdtfAVIEAhCmOo2EQMwX8tguTZN5TwWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7194
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_16,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020144
X-Proofpoint-ORIG-GUID: 6vSwb7TvMMnMJepWrXMbLdAcPrx5e-XK
X-Proofpoint-GUID: 6vSwb7TvMMnMJepWrXMbLdAcPrx5e-XK

Yet another case where lack datatype information for kernel variable
(i.e. lack of CTF, and BTF does not provide it) requires an explicit
use of the &-operator.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/options/err.D_ASRELO.kdefs.d | 2 +-
 test/unittest/options/tst.knodefs.sh       | 2 +-
 test/unittest/options/tst.linkmode.r       | 2 +-
 test/unittest/options/tst.linkmode.sh      | 4 ++--
 test/unittest/tracemem/tst.tracemem.d      | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/test/unittest/options/err.D_ASRELO.kdefs.d b/test/unittest/options/err.D_ASRELO.kdefs.d
index 0a42fc6e..06bfe24e 100644
--- a/test/unittest/options/err.D_ASRELO.kdefs.d
+++ b/test/unittest/options/err.D_ASRELO.kdefs.d
@@ -14,6 +14,6 @@
 /* @@runtest-opts: -xerrtags -xlinkmode=dynamic -xknodefs -xkdefs */
 
 BEGIN {
-	trace((string)`linux_banner);
+	trace((string)&`linux_banner);
 	exit(0);
 }
diff --git a/test/unittest/options/tst.knodefs.sh b/test/unittest/options/tst.knodefs.sh
index 532d7eca..da65c49f 100755
--- a/test/unittest/options/tst.knodefs.sh
+++ b/test/unittest/options/tst.knodefs.sh
@@ -9,7 +9,7 @@
 dtrace=$1
 
 $dtrace $dt_flags -xlinkmode=dynamic -xknodefs \
-	-Sn 'BEGIN { trace((string)`linux_banner); exit(0); }' 2>&1 | \
+	-Sn 'BEGIN { trace((string)&`linux_banner); exit(0); }' 2>&1 | \
 	awk '/^KREL/ {
 		print;
 		while (getline == 1) {
diff --git a/test/unittest/options/tst.linkmode.r b/test/unittest/options/tst.linkmode.r
index 4b453f56..acbf8025 100644
--- a/test/unittest/options/tst.linkmode.r
+++ b/test/unittest/options/tst.linkmode.r
@@ -14,4 +14,4 @@ Linux version
 
 -- @@stderr --
 dtrace: failed to set -x linkmode: Invalid value for specified option
-dtrace: invalid probe specifier BEGIN { trace((string)`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
+dtrace: invalid probe specifier BEGIN { trace((string)&`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
diff --git a/test/unittest/options/tst.linkmode.sh b/test/unittest/options/tst.linkmode.sh
index 4e28f8bd..07045fd5 100755
--- a/test/unittest/options/tst.linkmode.sh
+++ b/test/unittest/options/tst.linkmode.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,7 @@ dtrace=$1
 
 function mytest() {
 	echo try $1
-	$dtrace $1 -qn 'BEGIN { trace((string)`linux_banner); exit(0); }' | cut -c-14
+	$dtrace $1 -qn 'BEGIN { trace((string)&`linux_banner); exit(0); }' | cut -c-14
 }
 
 # Test different link modes.
diff --git a/test/unittest/tracemem/tst.tracemem.d b/test/unittest/tracemem/tst.tracemem.d
index 716b119f..fa838454 100644
--- a/test/unittest/tracemem/tst.tracemem.d
+++ b/test/unittest/tracemem/tst.tracemem.d
@@ -14,7 +14,7 @@
 #pragma D option quiet
 
 BEGIN {
-	p = (char *)`linux_banner;	/* first 14 chars are "Linux version " */
+	p = (char *)&`linux_banner;	/* first 14 chars are "Linux version " */
 
 	/* try tracemem() with various sizes */
 
-- 
2.45.2

