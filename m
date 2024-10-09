Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ECA15445B
	for <dtrace@lists.linux.dev>; Wed,  9 Oct 2024 17:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728495276; cv=fail; b=oMVC+DTxbuVWDmpm3TIp0r1qHtv7QGwIDIbQ1eJyqp9a5zLC1RKys3NZGChmI/g0iCMY38UHg/xa+Ec0DMaO4jmYR+x7JGwOH5iIjn4ZBGTZSjWNAQD4qEPniCu8boYOr31pEoR0X5zKKW57DDf4ooXm3ITZHppGLsiswQlLf7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728495276; c=relaxed/simple;
	bh=htNVBnSIuUe7ibRtT/K/Z8H+vtZb0y1KKLBvlwMr8cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LPs7+fVJN0/e1o/udHdzurHdKqAvz9burvu7v4SNaRXAB0H7NBhjPz3Nr0NWo0jXy5AK1uRY2jxtH/a7WbFQZE5cmGCTpkNs/r4xE+bP1svlX+g75o97GHwHNdcbUvl5cItp2VBZ1P4YvCB5EbVLW6uIlBuCVZJ8Yn6VC9+MV1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jf85iisQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Xa+tf0ky; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jf85iisQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Xa+tf0ky"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499GBbam017438
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 17:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=SSbzhh2E6+9O3iDBe9
	MiP/ozlb9Fe/zQwxob7miKD2w=; b=jf85iisQQhDA3rQZOYAILGhxL0piz5YXcq
	X0DCMq7OUsOmFo73oCLLq/aBpCZQHuJbt5+Jphc4IB5LrqqauW66IT6yvAqQgcLv
	F7CmscRV05JWZ27OD0guhAImwRpEmBqF/Gk9sCQHojAtT0Ra89phRoBtm5IEUfvM
	w+s66ZttKPIB6XVP01o946cXCFvsOY6fUttV+HiPm+5scf8xPSHE/0BoHgb6Czmx
	zJTnIOAHOLg+R3UUrRfxFt2JqJhGd37RlPgraCj6Oe0tcS3mPvFJuc3HIPH+ebOh
	/YLxrpyYTEnpdq9qWNwuwvYBjRE6xUiJTVDzmMFkoB4jRyk3pRYA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42303ygvrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 17:34:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 499HIqGO031063
	for <dtrace@lists.linux.dev>; Wed, 9 Oct 2024 17:34:33 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uw8yb8q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Oct 2024 17:34:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfa4mu47cX6QVGtNhWMf8hoHnEuOGn1NXo0w0jJL6BqBG58kUW/hxDcgStQG84NqmAS+HZQnhKblNZ2o9yXmcnGf0LVg3Vkl76VnudQHpqg2TswShQpR9MLd/Svu8wBG2EtFyVjLUa0RB6ZptVXaoq1YSqqfjdVeg/nfVdaTAJUb+TZiYEuJMOiN+Do/5+kQ6V3NkC/7eu7r4U0t7CDqfMWW8bwekHmkutiAYnn+s5SOe/uSGz+zCF5jLDhJma3C3yBHrXbnGIAdS75iLDQCPrgU1Xo0QntwLuXr6RKGFPDUzIr9JgJxhJXhFcNoXo0rOLlaoIydZfwQ7c5YR4B4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSbzhh2E6+9O3iDBe9MiP/ozlb9Fe/zQwxob7miKD2w=;
 b=TuIZnMYESTS+6dU0lsKDfdkDSkjIrpHRYCRZZcfIduqwCrVSVkEjaOs8HWGc/GG/71rSaPwJfAxIVT0DdTaKnbErhtMxSINQpFvYkIa8L6AMABbMIHzKXMTaI2C+y1qkKotsgMNqB9vKW+dBGsfzyN8uayHCT6XBPnn/0yCRA1rxNiQqJz9Uz3dYhEgd1y2iJBDNPSkd083c1aUlRWiXrC6C0kppfdbCG+nums1jHjsR6x9nEra4bjastfyaXRbTQuiBDqpjB6QfcWEUfY+p1IGlHCQWodfgku9QIeyrzVfFDAsjmCKFmVtqnBCnYg+9wz/jTnuIMU9Py+70RG/hlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSbzhh2E6+9O3iDBe9MiP/ozlb9Fe/zQwxob7miKD2w=;
 b=Xa+tf0kycvLR1I/7yxe3mD0vl+feN5fctXc31XKbvwXrIadAw0ixABOLszYeRO6RpHag0Y55hVYmFa7SQebZiOyUwQqmNAH7eoVgCE/zoiXrO2DxH4xDE01UeDDKCNN2f3QLitR9VrSsOrt74phxTNV6Pw1GaYcWhT1M1Sqvwsw=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH3PR10MB6763.namprd10.prod.outlook.com (2603:10b6:610:147::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 17:34:23 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 17:34:23 +0000
Date: Wed, 9 Oct 2024 13:34:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH dtrace 0/3] fprobe fallback kprobe support, sched fix
Message-ID: <Zwa+m69lJ00WQ7ju@oracle.com>
References: <20241009140236.883884-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009140236.883884-1-alan.maguire@oracle.com>
X-ClientProxiedBy: MN2PR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:208:239::18) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH3PR10MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: 48605249-60e5-4674-da04-08dce8889d49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Aj9p46wMhHOeCSV9VpHNC4XajcBOKLfzzcSoUt9OJXzA70GiySkZlaJRc7F8?=
 =?us-ascii?Q?nDdTnJNChiyGsKeL2WPCAY+jEv7prrNKKuq9xEKcT8u5BCPFx2es7BeaRowt?=
 =?us-ascii?Q?DEaWJYnrBIneGeY73Mqz6npN4K73qdUr3zu50pLp2I20MGk3PGtLc+B7Ukei?=
 =?us-ascii?Q?KJ5L1ZM/TZ0YfS8YaPdZQ2EuKgZL6SxgxDmUBwE2cSGnOULON1wwabO8mXzI?=
 =?us-ascii?Q?l+6nklfapRNLoKl0w4fxtFp4XlQgSZFGX3ctD9jrsCIDIj88PGyPoaF1FliM?=
 =?us-ascii?Q?zSODCnIlhjArmGg9f3ng5mMCH9dYxVTVD7T+UaVgFzebkGcAr5U4sKzlKWl7?=
 =?us-ascii?Q?VLH0w6ksVK4WE5CHOn0NZctQ6pECAxZB8MSgkPjzG7Vwu/cjd7scIzq6uxpR?=
 =?us-ascii?Q?2YwHAR0+YO5V5iVqjn6xi+OIhWbF/zBGy792AV/RqJ6r1SmfSnSpN8EMJZAy?=
 =?us-ascii?Q?+yf1w09rns7ausWeempWhZ64bNDQR2Zz5ABdBfSmCbHdF4hJboSoPHgzuKlv?=
 =?us-ascii?Q?O9KV1dkivvYmO8puqRTQV6o0X+f1MnHsQQ2/mgu7NXi0thbl8u8B2mUWFHzi?=
 =?us-ascii?Q?cy4gOvXTQ71wXLP588YyZ4K2JEfFI6LEMsahaf/X9g2f7f8mOaZ0slUnOfp2?=
 =?us-ascii?Q?kOh6X6KWfrgVZrlL86bK+W2BkFzimkawxc8Njc6KZy593Avc74leofrz3dNL?=
 =?us-ascii?Q?IdpTvqloQSr4qBQXf76p4yC7EWNUXsDfp4V0uyIOYNnTcmwdZ+a5DradU/ee?=
 =?us-ascii?Q?/VOy13DlqhCkGyDTYdyYwDLqP/Ksvvr0td0c+GcrUK7MPSjDBxK+s5axmgrb?=
 =?us-ascii?Q?U2Pl9pnSbK1tV88eTfy1GK1yjRCsIapVfrJAHNsLUPyYaaA2E1T6BPHiX/U1?=
 =?us-ascii?Q?olSH/p4lO42G1ZVHVi+MknZeWj4gixT1aF7QxjJy6E92ZijRwysjQTfnpbI7?=
 =?us-ascii?Q?swIY1x3Qm2AsMpRWL9cbE+45yTt84sGxq+48uTtyaPN69cfn0g5s0jC1p8NG?=
 =?us-ascii?Q?8rbTnvNRQQsW1fgMKr8LrMzPTDepyvMBiSy8UyIUM2xQBd1GDnZHIE51YgE8?=
 =?us-ascii?Q?Wti6xtK2Xcn8u5eYv6w4nITbBVHqUfwbgJc8ES/rZuaLisqKmj4NJMVMew0R?=
 =?us-ascii?Q?tJb4xbea3RsNeN35TxxPzyAb+tfHtvGdyL8tPzd+lEWnLeWQZVPotXQupBKV?=
 =?us-ascii?Q?OobWbiMNcU2ko0nhHAlGIrbALie+C82SPYpkqKAtXulIKKbbSgIU041mzEco?=
 =?us-ascii?Q?d4AkLbKfm6Ntmllt5AKnvE2pBpFns61pv9rm/VcnGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oSsnn7fmoV3A+BanmaQGMf63qx/xIiZFKowlAgm66hPUyJJTiIkHxgyp2iTz?=
 =?us-ascii?Q?d0O8LmvkwP4nkNKrwn4LIPwAawIofrTmPx5Td0jF3GjLVrIMQ8cyZ/9S7zeZ?=
 =?us-ascii?Q?n1TdjVyxgTU0aQKqvdIxSRArxAacB0q8rGR67AjENSAeQlw/P+a/zzgMj5TH?=
 =?us-ascii?Q?fI49ana/fJ1J39HurcdK9ifAdTuEIUUcMfJBgMy/QaUMPjVchWm2bQ7da+E2?=
 =?us-ascii?Q?YgCzq2L2fXKyk8Lf0Ym+2QPXl90XXNKzTLbTOzKB2DY6voFgMPCqir5uUUZ5?=
 =?us-ascii?Q?S5kDWXmVp2gyvlqUcKOjgwigv+9+qApoSuuoB+OIF3g9AYGA0k2fJHsd+orH?=
 =?us-ascii?Q?wjPbpe+uxm81z8rIaTjSuh4xvjUtXUNiEHiOoKF0oF31KrmogUBnXXBGeM9f?=
 =?us-ascii?Q?Q6DjVGtLIZxtwZPRfKHBtE2hQAJVOuOkHvnuPSyj98aKxQy5FblSzwfdsFI/?=
 =?us-ascii?Q?YBp0HjxqwIbtUT3hSY0Kwm2gfwF9HR/+j2ZLr6STihDfBpXYPflbzXW1AKP0?=
 =?us-ascii?Q?4sJVs38Qcs9mvCKcqYPPe7Zxp2DvjTpptN161TiZ8dgLkHfXHZVOg3khlO8d?=
 =?us-ascii?Q?WyA1VWRwq62zUOFnH0pF/MSFWID2CS8spbJsRcJR9O1fG0p9BuIK3Cx8qd+L?=
 =?us-ascii?Q?z1RwnTW2nziD6caYOG5z1WsGznlBRnQg+UjR9qOUK4KDZCRNfPx9DBvw/Nne?=
 =?us-ascii?Q?4JQ8GMNKAl7DYM3jtmVOrFV7p9xi5C/0PtdiYR49tYv9rAHY1bRnd0+U5ULW?=
 =?us-ascii?Q?DFk2LBUDH/nIcDwtG0R5x3mswGhzTYdcLJOGgg3YB4ElDrdb7g/RBWl5QRaU?=
 =?us-ascii?Q?Tdwj1NhDVaulleEBStKuyxOL0UU4xrdmA8OyMJXx44pLHKLkjm6LtBaW/+7u?=
 =?us-ascii?Q?bK1haGgrpUyD5WMScc6Ageqp9GHoHUypvnsJ/m513Ji2VWbLXUSX/yLgzKqx?=
 =?us-ascii?Q?ZzqV35l8wGltM8TNiGVEc6Ja1m2aqBatBuYgrdECDD3Pyg4c3ELQEwi5yB5V?=
 =?us-ascii?Q?cRZdAPJHJzGSOziVO4JADmR0T6xQmgeKmMNFVC4Q9799HUTExBkCekfEVlvH?=
 =?us-ascii?Q?O7bj/uE3fZZ/771wn9BvUmrf4p/OPqEbY1/YmdgYIJrnURf9JGXcX5FCXg8a?=
 =?us-ascii?Q?JG3tkKZFepLjhEdMCa+gaT8L6bChOhLjC4LkBjNOv2gPfsA2WGPZpDH0Tusf?=
 =?us-ascii?Q?9uhNAsQMm4cMfgIE0CEeHlDviG11WmZrtz+bIXp2L0/mA+TM1D2A7faU0GvL?=
 =?us-ascii?Q?8JF6t/kINTEFqAVEaPwsFH12i8jWDA5TgvRAiOMI/qilGhiEhWJGuJQlHGUz?=
 =?us-ascii?Q?3lwFRMCAQAeoX/FToeRiAMsn82q5/xKdAkng09y9iJRxO0hJhJF/9i2NWJ79?=
 =?us-ascii?Q?LjgX8zE8u+fiCDovAznVcM6cmEs4qldyzrOqphyaR8aIIo1FjB6hTAY1xSkc?=
 =?us-ascii?Q?MgRTX9B7TiHQXQkdbhoUmRAQX+ywe6jjKPzsuusRwUrtrKedZ5PDmmZ/Rrnt?=
 =?us-ascii?Q?MG/Ck87AvrENtZW3nYi3Hl+Dk0MYX9zMGle26IrkPSFEbQpMbwyXvqfm2rbe?=
 =?us-ascii?Q?uiYjvYG7bHhBnp8pGQSTc6R0spLrVHDH5tSiXc3W1AsUPenGfOgNcmsGHQmE?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GmHbmXQBoRI+gWi9eI/4zpvc3+HRy5c1BgJLOfd0HLVc3v9H+wmIENSH5Kon2QZ2LQXl614idR8Bv7WuO/xtxGl5U/OzJJaeqHScK8k7KwRD1cFj9TVfaAohGhPE1q1b8Xa7AUT3ytCyiHmj+YwnwTH32VzoakxcUNW72huQezWPIrt5uIGDKn/qx7Ow+Buxjn81AlUQVLR8qoPxyqyM9dNJV6v+cPk2TH7TaVQcbnAk8s83rm1jiOYhR3OaARVEiujmxVraE/K3aUkXg13b4Z2K9SbP9MU1/EY1SU/g8SGYET+d5tH7skAx2MZQzvIFIS0LGclWMwef3vMJINrNsqBmCfYUHrlZZsjIcjzqU8oqqN0kGUaAcDRdbqbiTYh/q/QVA7wQGKDVvel1GUKD0jtbxTUlSsxVK6PHJ0KAEg0AYfjakj8PHgiJa5uQcQ63Oc5fJLWNuj8uR3fOpsYZu0CjeBB4hJ1NjTbP8mI17aWXHPMAfXlbbtcJIM45JyMSA5tIpOVNaT8l0xizN53gK2NYArcRu9oi6Sqe8Czt9afGxWIONTamBxblgyZNWDthezvoAo1PYk3UvlfcXIo1siMvcnzDZr6ZFDgYlvWYTcc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48605249-60e5-4674-da04-08dce8889d49
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 17:34:23.3567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 72aGiQMS08sTQNK32kVlNPb6S0+YAbNLCr4baevrY4pVzvn/rktGMMeQl33MboGSwhLThCXMzcRWxCuMZsag37qL7ktyVS7UcnV8BaB2vCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_16,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090111
X-Proofpoint-ORIG-GUID: T-Ibj_H-1URNxbdzNw_ODfZVHnhK7sVR
X-Proofpoint-GUID: T-Ibj_H-1URNxbdzNw_ODfZVHnhK7sVR

Hi Alan,

I see what you are doing here and I think that it certainly has merit, but I
would say that the implementation is breaking some assumptions that are part
of the provider design in the code base.  The way that a probe is related to
a provider implementation is rather fundamental and you end up breaking that
by having a fprobe-backed probe actually use the kprobe implementation.  I am
thinking how we can establish the same without breaking that association.

There is also the fact to consider that if we end up attaching a given probe
both as an fprobe-backed FBT probe and a kprobe-based FBT probe, things can
get really interesting because the defined order of execution of clauses will
no longer be satisfied.

Now, what perhaps could work is if we were to first try to determine whether
we can use a fprobe-backed for an FBT probe, and if that is not possible, do
a fall-back to a kprobe-backed probe by removing the probe and re-inserting it
as a kprobe-backed FBT probe.  Since a probe is associated with a provider by
a pointer to the provider implementation, that should work.

It should also still work for probe lookup (though that should no longer be
taking place at that point in processing) because the lookup code is based
on the provider name selecting the correct bucket, which can contain probes
that have that same provider name even if the implementation for them is
different.

This way we can never have a probe that is associated with the fprobe
implementation but really ends up using the kprobe implementation.  The
association between probe and provider implementation would still be kept
as-is.

Do you think that would work?

ONe complication I can think of is cases where both func and func.<suffix>
should be traced when you use an fbt::func:entry (or return) probe.  They
would both need to be done as kprobes, because (again) we cannot have a mix.

On Wed, Oct 09, 2024 at 03:02:33PM +0100, Alan Maguire wrote:
> This series is focused on solving a few issues with fprobe-based
> attachment which prevent us being able to attach to functions
> like finish_task_switch.isra.0.  Such functions are present in
> available_filter_functions, but because they either lack BTF
> representations or those representations are named without the
> .isra suffix, attachment via fentry/fexit is currently impossible.
> Falling back to kprobe attach is the best solution here.
> 
> However providers have been written with the implicit assumption
> that certain aspects of the probes are shared across the provider;
> program type, stack skips etc.  Patch 1 addresses this by providing
> optional provider implementation callbacks to return these values
> for a specific probe.  Patch 2 then updates the fbt provider to
> use these mechanisms to support fallback to kprobe and to support
> "."-suffixed functions.  Finally patch 3 can then specify
> fbt::finish_task_switch*:return as the underlying probe for
> sched:::on-cpu.
> 
> Tested on upstream, UEK7 (5.15-based kernel) and UEK6 (5.4-based).
> 
> Alan Maguire (3):
>   dtrace: add support for probe-specific prog types, stack skips
>   fbt: support ".isra.0" suffixed functions
>   sched: fix on-cpu firing for kernels < 5.16
> 
>  libdtrace/dt_bpf.c         |  4 +-
>  libdtrace/dt_cc.c          |  2 +-
>  libdtrace/dt_probe.c       | 16 ++++++++
>  libdtrace/dt_probe.h       |  2 +
>  libdtrace/dt_prov_fbt.c    | 84 +++++++++++++++++++++++++++++++-------
>  libdtrace/dt_prov_rawtp.c  |  2 +-
>  libdtrace/dt_prov_sched.c  | 23 +----------
>  libdtrace/dt_prov_sdt.c    |  2 +-
>  libdtrace/dt_provider.h    |  4 ++
>  libdtrace/dt_provider_tp.c | 12 +++++-
>  libdtrace/dt_provider_tp.h |  9 +++-
>  11 files changed, 117 insertions(+), 43 deletions(-)
> 
> -- 
> 2.43.5
> 
