Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A423B61E
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 03:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753931351; cv=fail; b=dnZIRPzX4xtphl86lDhTOamaPp4T42rIrUh3dOotihwtV8ecKi8HqreYUCOqHOd2sXEMqP1ZYRq7y0hgNjOxX6Jg9ak7HbD5sFokWAMmZjawK4GY5wwCC4wF26fPhf7e7GsydVbnipCIPmB75+Be7EX+jbwxe7rEdGAJ7uA+TiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753931351; c=relaxed/simple;
	bh=hR3ZyXCdduQPe1rad/HnOceXYRWcFomx/GIIoKbtj4s=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=HKWTqRlkK8cmEFF4BAUxNHdKjgU2us1+dFX4Au4T/iunxQTDdXw9wfiZQpqABqwJE9fJpzGsJRULeaMRDUBM2TUUQsB7nkXhEKdypt9H9SBzrxoJKFkW/4iM8l2JStbRboEnXYtmUExVWTxULI59hX2hdwkCso8P1GNqT5xaBug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=peyoa0Lr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IRNDIesI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="peyoa0Lr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IRNDIesI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V2g2HO026901
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 03:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=MiiMXqZFVkQmS0gRQBEF71XZ0TsjjD5TNn6HzjY9ppI=; b=
	peyoa0LrxFJf/BZTp8K2PhW+iRjh5Fce+fOcbDEBuoBMYLqVQLvAdjG80KvjjMsB
	sHshqx72eWtL3BFzERqjdFr9bIIjWNmkwqnlF2Rz3cSO5zT0StVkzc3PcW8vDpA7
	ruHuyGWCNUNsdn8ls6cEYtabtGpZhOwmVpKRECx62L+WaxnYRQAGLr3vYVora450
	swzNEUVroBMqdKRXidxWXHRLHUmQU0DOiVQCd2ACKqb1r2xEs0pGKzKvZ9t4Vdij
	ydhpFDKJqXAO5xBR5RONcHrhuxZzoFnQEocJ/IKO0KZr5jviQx5IRPDdeB6jm16E
	TnXDTDEcpV1KFYjhKxcLhA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q5x3119-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 03:09:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56V00cHN010380
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 03:09:07 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012068.outbound.protection.outlook.com [40.93.195.68])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfbshd3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Jul 2025 03:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNG619fygrhUz1K4go47dmdmeNK9/Vo92ALb0g5EnXNBE+biFpDRLKpJh/W+dSVeJXkqIsCopoWurlbpjz/pL0NuLC1NksVz5lpMvenGOmNScielv9NPKjO6CbWnxcenJ/ZT8ezp0uwKgHELx/xOkwI/jiTwfWI9ddraPE0U1o9UsHYgvpf+Ew3xGu8L9jGCqHCSgFOvER9OkIf/16QylyRj8W2rHg3cTD1U/P05LeH4o1h52DhPihMIPMvaITzfrPCHNCi3rlCmYxs4QK7L5DgM0PoyvYrWhUpCUa7NVR25Bj/ROEMbPZhR2H9wJMYSiTevvlSY3IivZoXUvlTP+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiiMXqZFVkQmS0gRQBEF71XZ0TsjjD5TNn6HzjY9ppI=;
 b=Tr/D+vluSrOMO4kNNmhXYTG7tXSKu9TC7ymbElumwAzc/t1vx0An1/lvSnE3HJMAvMTaey7p9wVkPjHMjiH/h64Yk0eKZbtVmqZwBeNl/+vMd8jnpp5ckbk6s5vj91ReUh7+dmlvCJi/Og/vpUirDSAT7xh3/zJqn1Ydy4e6pj1nitQ5EWXgZH8NXdXM8JuGCJzWOxYg6blg4M02hlZ4zI1ngngFETmjNtaUevYgbEhNhk/SCp+w5UhEC3n/U25Zy99alGBJoAiN9maSzD2/awN3Y8LD223BlzdJHyjo1ezxaKW7c/bBf9d++6eXsnpEB0DWcLVcFgFRQgFlweiByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiiMXqZFVkQmS0gRQBEF71XZ0TsjjD5TNn6HzjY9ppI=;
 b=IRNDIesIl0FNRLbweizfAWD+ZnGkw/49GfU39kHCe2xxtuHTvl/SXjIM7q6rm4/nik/gqnyrgW7oCmSYziyi4yzTzG4834IaVMWN1XBPymbDr+/W/oNbQ9EGL7oogTPRGQ3/EZQfVKmn/ov5jkxvdKJo+KQl8NTfjQ80Si8+ris=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SN7PR10MB6361.namprd10.prod.outlook.com (2603:10b6:806:26f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 03:09:05 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8964.023; Thu, 31 Jul 2025
 03:09:04 +0000
Date: Wed, 30 Jul 2025 23:09:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] bpf: compile BPF library functions with -ffreestanding
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567217E9DF1F38898F33711BC227A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SN7PR10MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ca5ef8-814e-484a-42b1-08ddcfdf9b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ggp+65jAq4jJqTbsL9Ty7Du1gjVA+XcFGPsLzpygQUO/AfLVAewe/jIxkPDj?=
 =?us-ascii?Q?sVYN8JZlYvEsacS6C/zaJx7MSi650UPUTycTpFXHJD/hWWiczb+wlWYX5kxP?=
 =?us-ascii?Q?MBpgm69JnuwdUg5fpj/7DvfmCg7tKuE4b0BP/4eG8cewZXWN8Bvfq0Vzx5o+?=
 =?us-ascii?Q?SABUJY5QFvMqe8YQWvQ8G44nixGHAOgRgtKPw8t0Gaby716632Xh7tUcuj9z?=
 =?us-ascii?Q?nlhrS+pFk2qMdJ+ArqYmaknZGnbdtlw1k5ui4XIJYmFSSMqufRqv3JxeVwb5?=
 =?us-ascii?Q?JNMhz2BfzQEQWooEVELyLwxJ8pjk1Dln41QG0HR0C5ArhGIV8oMSO83FvTOP?=
 =?us-ascii?Q?EB/3ivBx7F+rIsn/wGlJDsHEWbmnz4Rp7yHTxbOGAbrSEq8iXBijz9gYCH/p?=
 =?us-ascii?Q?+P09Pj779A1Muu5ZQx2DEShe88SZy5z8ar3j2HylZ1tlV5JTvyrMT3vD8vqD?=
 =?us-ascii?Q?i9ygLij8hRI+2WVHdjD2QfJjN6Ou8d9+xnnNvJrHt6LphJIX/dvS9iEndQZb?=
 =?us-ascii?Q?G1OX0Ux1JUxKRqb8bb1dNy+s8lWx6iwnutOCsbE+kISgcrFBANu7xZCFHS6U?=
 =?us-ascii?Q?keJFoQU8Fvg94qxMsVHLKc+6mYEM4DstP/GxLOpAkQciJ9RxEcKtTmwqAYTS?=
 =?us-ascii?Q?BkXq/9D2XjEXqdyB4no+nZnCCxcUO2VyZ2lOXirXnwbm6iGz5RLhW/Wm1s0R?=
 =?us-ascii?Q?W9nSjKcFODgPcL5mBuECjcuptzocakcgZqwlSk2Y15LFSeBPjjHbVU3TiJd2?=
 =?us-ascii?Q?BZx5tnov2jkl822vgc+sQHUspYVciiRhGfhuH4oxM61lII6HofkOE5VRGa9P?=
 =?us-ascii?Q?M/gTG9jtCTKsKsObxA4fIZuinMfEr8oHRBpsCMtbGwSHl9Lc9sqLBEclEI+p?=
 =?us-ascii?Q?qb2RcQq+l/dVVR5lFNOZmbttvXP8vAo/kxME4vVfmPe6S7O3udPrIab4mhR4?=
 =?us-ascii?Q?2OYt2oxtv7JV1ufKqVCxGXJXMdJb/1hlGBWMeB8Vd8xA6HCTbGTdzdl48zUa?=
 =?us-ascii?Q?qh5iUK9AmdILhUWEjfHbGlleBKjPcD+xhv0/5SPzNtX633SUW0mP+0+Aa42n?=
 =?us-ascii?Q?JXbV5hPtG9FBwJPQF+iV1BNFagQh+QU9mSlNtRE3UkrdpXzOYfweM2edfexe?=
 =?us-ascii?Q?y6vLUGLrSiJOkGwrbieW//BGGfSa5GW6XL+w/XQMKWjnunwEOI8DRtRBHSGS?=
 =?us-ascii?Q?E966SWIORX8hDT7IFXSAqZk6+JTOsH7rK9vDqSUtSBIbIEHc78uSBjx5esdd?=
 =?us-ascii?Q?ROI7yQLLrYM52P9otQwqqY9NjkpC3WNKZ20FhmUKqlJ8ctVKMHCc05PToDkK?=
 =?us-ascii?Q?tShHES/s1NEJz8hPx33SuDHp0ODLXyb6w8SqdQzfBhywUs2p0fCJziuE09PJ?=
 =?us-ascii?Q?hu4O2nKEPbDcBWHyvXd1nLRUpirvX3nRt2DAcejN9Mw8/UJ20LruwaP1qCCU?=
 =?us-ascii?Q?AbQDEyV1A2g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0AYG5wLWaSZv0sVZnq/whAyd4oEPrs+U48HHhadVoCq2W4FW1cGtjOzql1OZ?=
 =?us-ascii?Q?1iZWad6ALSmeDBY/cLJ2x18cnY7UTdHlH6lR5rpQNRwC9+ySTSkaAWZJpwvd?=
 =?us-ascii?Q?u6IdDyIUd0k2qqEwijDaLiRyN96gUWopJUCPoZ821C9RhedrA/AwqinRehvF?=
 =?us-ascii?Q?Tz9zLx/Xc7itza2hdWq2ovQubMAyEiKdi5T9GSNOlaTrEelKSKuL6XHazxiq?=
 =?us-ascii?Q?F+2nin6TK9UyfeL0YctOxV70GAcNDiZhrh7Ijp1C9Jcj5HEWHZNvVZ7Zy72z?=
 =?us-ascii?Q?92hrbU4WwQExo9NHIeALKQcwDDZQv8FxmXtejqY+AZVvCyRFbrBWJr3hKkiM?=
 =?us-ascii?Q?Nk93bPllxQXtHbcWFFrVysou9VkpzJmMTKWmnO8H42EJVWN2yy4xIwX2tvAi?=
 =?us-ascii?Q?gDK13wwM1fAJw5efn2bLEiAXDyj66JhpeAjJ0TCOO/Ct9la3rl+15hfzd6i2?=
 =?us-ascii?Q?lLxzM2xST77Z+jg8aLbGO8GcSB+etT3eGgaCHKiD24f1fdwSDshwg9qEY83u?=
 =?us-ascii?Q?YbxMmEFbhjdDFb7AJqJXkYtlD77NwgnUhT7Rz4L4zzIhdtdiwlodZSmS+iJ1?=
 =?us-ascii?Q?W/R4J88uhGs9MOmp3FihFEaq5Bsw9e25VGCD0+ngIl9R+Ez+u7rFxYDkKwsR?=
 =?us-ascii?Q?bnxH575hhb/hucoBWoOWxdbmTDY778PSVi8+y/PLLb6X/Wj+KVhr2T19snPx?=
 =?us-ascii?Q?VFfbNBZ4ixsw7nadBPc6CX9vCdHKX2EXjhGOu+MsprirUtxLRdjpOF9xwj9W?=
 =?us-ascii?Q?wij0w7O4fBets2rW+jaTevd+rcXIsfR8aaz6zuSuTA8W7/rHr8KW+4c+u7Uk?=
 =?us-ascii?Q?xBQqks1SpXgxKwoqkJpXGXjU8XzN4kgcvNOSaIycXY2nKzyAe4GJTAyG3qNM?=
 =?us-ascii?Q?n84+imDNPDG7WNiSrZnY2Y/r7mt2QIk69Wx1kz3QfkCsGTTikel9EYMmSEuT?=
 =?us-ascii?Q?7XiHDsWvg+aitEOPsTBluoPkKkqLnRdXKqsyIc+szqqFq0nf46Hbxl0txv84?=
 =?us-ascii?Q?YfBJVvOWj6/Or9wfl7v5MBtA+zmJrrJzB1gWMyqlyQXVsS3msJr368dJ+P+Z?=
 =?us-ascii?Q?/p3czRJmodUtJ325hRtHo9iLIOfqnV7Zi85UV4o+V5uPFxBnpr8qxLR2MMN8?=
 =?us-ascii?Q?fNlY7J9NxB1tp8xxGhomAQReqECD4dwRcD1EwoEaDmZNtPFVTUcRltMSsYFT?=
 =?us-ascii?Q?NO2lXCF0CoNuRYOJ3qP9yEKUINe5DOikTnFZaocblXFzE98UOSqliGL3+5CN?=
 =?us-ascii?Q?qcNz/0aN3ao5tFZSXSCgzRo9TylxKyAk41TaNa12rJYv0XkeJ0yINTURE4N5?=
 =?us-ascii?Q?B/SVWYZf8BJGCBektNXhTwTq7i7PEhrJUGZ93cFBKKo26MH25VYbztLm4hhl?=
 =?us-ascii?Q?XArErmgfL617jWIOHmIfp9Bx4HsqxepFSaLzbZU2cvDhnWU0/p9Su3hz8rkG?=
 =?us-ascii?Q?Nb5WjkxQ8m36EvEwYuv+fLQsSj96+hI+OGRTavXJ2Ky9Fnz8XshjmgcdISJI?=
 =?us-ascii?Q?0x8govkn0Vtq6ABxVkynludIan/4UraAdOdc1URvFoMmfNdyUONv2CPYeJ0w?=
 =?us-ascii?Q?Nt+0ievI7ug7zF28CFdWQk/9NBpH5QptotSJdT6LIy5bGhLNpFEfJhVOznuC?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZVr85UrGu7CReCWxltMS1b4nBmwIasNn2e2q1NaK7n24O43Ut7kXl0h+HJf7yNfnov4Qe/xMPJ/hXOFmCZ5wdvba7S8//KkWjv+dxdsnXJCWUjf3KnIJT94ienZVCpZVXk6wSPH7zaGuhuOErqsYqY4coWC/iUxaiQArq5OXjL4unRfuGs8tEE8iMM/tjINTqmw1n75Zy3X8PJaWKX1aJxth6j4nlknTzuPnwbJoK0UQ5D1rJJmTK6utONK7Mh4M5NnM154L4NJzLBjJAAni3Z6m5SODX1lFlYDLtjNr/jGKjhU8D406G2CWrqr4v+blDJTArJHi4NaAjGmmYntMbnSivii/Euidc8yo1iCZUUg6Y7LZuGtMbOIEsiLiRF6d9g2YIEz+IRbtFYdJvwaAKbtI+DjAdTXdsWs4LR4ofSXYhLErLrjcVOSKJzCcrhpPORFSiBKAuV7Fb8ULT+fLHngQHFP4IgD/a0lUBhd7eiSwWPurY9owbK5+IIIIWfJWVqYjaaTgwKc6ZPKtXylgg+J5GRwf+bm2e/N08QVWG0KEoEcl+CpLB/WfvhzMtuaQAu8JayKF1+n8lGExd/PQVpObhR003Um2T5ryWhD8/Vk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ca5ef8-814e-484a-42b1-08ddcfdf9b62
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 03:09:04.8920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NT4GJP63sWvetdCnp243OXxWuBYQvcGbluqLA1/4aSWqlkkOAVPeaqqBbPKcrCAWF/Hpm4ffxvl4FzowSB186QiVTqWgAbLJg1DflbGQjUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6361
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507310021
X-Authority-Analysis: v=2.4 cv=X+lSKHTe c=1 sm=1 tr=0 ts=688ade55 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ihGsPZl8eHNppu6U2UsA:9 cc=ntf
 awl=host:13604
X-Proofpoint-GUID: 25TE_OLnIIJYJCVHRrkzzKKxg8hFbql9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDAyMSBTYWx0ZWRfX8d5+L3pEOy3U
 esE5ZRilz6vTBmtOT8OOe5CqCOlA1aKcAIVS5DS42boURN50yAfKTDBuD97XMMgWCvR3M5c0LBo
 KaStAV5BaAXIeAX+ijAQhsq8PoV3QUYW3JNDW9JUBmaH/NI+yfLiOU60J03BLTGmJhfshExsQd/
 kUki1KTla11yWgHrWOWtUXY2dcC/z++Yb41Y85KsjBrf0fcc+D/XckU76gCp+NIEKJT0BuPWILH
 WLh/9ZyZKRdNrxcILCO0GoC7TY4JgSS40Ymefg1lxtBXqrNaPgZgVlVLng9OxuPy/Fvss1ZB3gL
 CRucOJvlE0Ih4bkoZNI7S4MgnNsNdkDfxmNNPpSkayHRtnSQowDkV5cusJ+BsDxFBgh2+q0fh80
 mKDHKs8oGaM3oqMyXuc/9SACVR55YYAP4U7cJibJTVz2JmKvKOxdsqZLwam60jnpu9PFeX43
X-Proofpoint-ORIG-GUID: 25TE_OLnIIJYJCVHRrkzzKKxg8hFbql9

Per Jose, we should be compiling our BPF code with -ffreestanding to
ensure that BPF-specific standard header files are used instead of
host-specific ones.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/GNUmakefile b/GNUmakefile
index b8e09f574..7ad857f88 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -127,7 +127,7 @@ PREPROCESS = $(CC) -E
 export BPFC ?= bpf-unknown-none-gcc
 
 BPFCPPFLAGS += -D$(subst sparc64,__sparc,$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH))))
-BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal)
+BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal) -ffreestanding
 export BPFLD ?= bpf-unknown-none-ld
 
 all::
-- 
2.45.2

