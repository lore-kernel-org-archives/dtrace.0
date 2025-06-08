Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E417E
	for <dtrace@lists.linux.dev>; Sun,  8 Jun 2025 05:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749360990; cv=fail; b=Abh4H6cBOtqOVz6OJfP35UY5vhw5QhBFBlZan3fcT/vxnuFqrG29p8AszQK1AUpx+YYrf1M8V5BMfpHTTOqFq+bEksLpcG49cXZ8ni3IJ8bWsdbrHzNQ/SX7HhCVt5JaHFIe1GLNgn+LV7aVd8x6Wgbhq7iRiWwqkp0/mwshlPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749360990; c=relaxed/simple;
	bh=wfD6WlPtTjXBKv9NXshx3mX7c0JrkZbMmi5P0tZO244=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=llHUVkdpdbEVgrbxT88jpOZmGvSYoNhKIyUhbV7jvti1ujjhSOobBKAI3jjyBg22nZEWKNxxznZqwA6hbPq6qOgJm27z1gPYUMjqEfIYp7WCnyIfKuvCqCVl5LVSRnNBVx2z0OTD+GkIWWIPGm8WhBmYiGg22FtRzp5JVkauIPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m6f6HYZu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s7id3SuO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m6f6HYZu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s7id3SuO"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55851Yrv026053
	for <dtrace@lists.linux.dev>; Sun, 8 Jun 2025 05:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Z6yWqzFTWpGARJu1r7M+jLF+17n8wNFObgX2hx9n+yw=; b=
	m6f6HYZuSX1E2RlElEyu7oZXvNMb31p8utXUFhwOOYNZt0+3XR9l+YqmUIKZhQ4o
	m0a7qzZGSLH9zmDPPWkYCu9cMDrfeiLYngVZbmJI/E9a/xE8gOzJ2VtkzlZxr39Y
	8MO+NVnUSb8Dm9A24WDZw+0ayld+6Ry65PjU5sTbCoM0XlUD7UM2NL670PEB0PNH
	H/tnhQZM8XFUA6EbJVWP8GLBXagEJknh0yDMfUzgef7M5YoLPMvaqYx8h/oPb0GQ
	pr4e3JCf4S0ezP0vvQ4Ta6qG8ibjHSxFoslfNX8vbUKLA6CUjo3uKrlZse4tt8uT
	3fIdzS6zI7wHZDhx4OL3TA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474buf0r8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Jun 2025 05:36:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5580XmhH012013
	for <dtrace@lists.linux.dev>; Sun, 8 Jun 2025 05:36:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7dkp3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Jun 2025 05:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJSBzeBlQaGWr+u4ALl5tvEiMuP/0uXlDuKbEA992dKrSwxgvcDqWihiUbAZrQdTadvc1w1Y54A8cwQNOkq76PK5s5WVOJDRRmI2faq2OSM2sHpUT5ZYc8HIJf0FDUWeeJR2fKnQUxEpkYqng89EMmniX0txFcamkQsS85sEJSIlQ8re2UV8GMHJDsx5C1vqUk/Uw6RWDvgqXsG3tJ/LR7ggmNJYEgWRH+4bHljIQ4Ejs1sdo7Wcw7BkAZJtXP4UPd9hll4n+/XcdUZYnwZ7phE5zWoSdM109M6rt2PMjcfTJ6eHtxWrODYtBmFuBMTfR49scgRjbyfEolNwoR74sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6yWqzFTWpGARJu1r7M+jLF+17n8wNFObgX2hx9n+yw=;
 b=vYGb4iDpK3J5yEB0XIlggg4016tTUB1fYIuUixcUwwyt7RPQecLF9dY4LbK0QuzQH3oDK93WJe5mgRbkGoUWzbwedpdxtGrQApRAqxb8xPTjFfec4Q4hm73DGUapgGOFAlxOEEJU5HDSr75rG2LZutZEuCxeD7dwlzSIzIIk2/P5mJFtAOn38iVed0h6u4+nsZXIUaZhYMOpqf9oCXwUK6jBoTWn7J2B6NnopnfcR8yeswdvSB6kx3Ji74zhS+hKfsZ4LvKhlNpyepcPw5qDvtO6ifAAvbQrYNgJcu53RfYqLf4wU/4iKUxonQZ43+E9wTWMuQJqh7aZAnhr8GZuiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6yWqzFTWpGARJu1r7M+jLF+17n8wNFObgX2hx9n+yw=;
 b=s7id3SuOrdctrJwto6rjb2W4+3Tv0RawrMvaN5HFsdfwyQWTDvqj/BrS0xhMTmusyQSaubKJeOUWqyRpD92MUpKGhnqrk38Tp3ISJUvrTceE6ssdCAJJqFa8GuUBGsf4zIvtIweNIm6iydg2eySS0nsOWzchTwtPFhVw5beiLYI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4258.namprd10.prod.outlook.com (2603:10b6:a03:208::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sun, 8 Jun
 2025 05:36:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Sun, 8 Jun 2025
 05:36:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Wait for output to flush out in enable_pid
Date: Sun,  8 Jun 2025 01:36:20 -0400
Message-Id: <20250608053620.15468-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcf40e0-92af-4571-af67-08dda64e6782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M/+h9fL3MdqzFujaeToRNQJLAqioIqP926orU8UosiEchwN8SubC4XvH0yee?=
 =?us-ascii?Q?79UHn6F9eF85e1F+YLawyDeLpbCkx2GjDAESTvkczKY7Juyqjax0TRebVdh+?=
 =?us-ascii?Q?8c26FbNrI+Ylh1nTTRpGC665OasvIuf4CONhcRDB+ogMHs+IMoPzOTDEg641?=
 =?us-ascii?Q?owWjowQv50DdhwLw+6ZXsEJzY6iuBkqVgdj2SZhX8TW9N/GR+ni3adTSX28C?=
 =?us-ascii?Q?3iLAjLEG7QgrOFXm9ixwKYXyZ6lvQCF3Y1/8X2A7fY1BWzEnWT5sBpzHFHZn?=
 =?us-ascii?Q?PzzJzRBLOe6dD9fO6xDJqnymZMdonV98LsP1udgcOBGtQTl+umC/YuKtlVRc?=
 =?us-ascii?Q?/v9vifS2ypP6ichlgPukVIr8emHXRirxe39jTY7oIw9UWhB1r4rScKrZ0xfq?=
 =?us-ascii?Q?4ehWOAVQQ6JTyQuaG3HWJrGA+dYgyXWrctZvGhb+rweTV0v2E+ktz8tMmfRw?=
 =?us-ascii?Q?eqWFzfUv5T2tPjJGCmQRHGqET4TJ4WQKI1WAfL7Z4l7fivdaPG2kk2t6rEwF?=
 =?us-ascii?Q?8jQaNPDAQaBEJFUrnTcOhxFYpIStZQmgZqEWThOtiVnSq0jOg+eP8AjtwJVc?=
 =?us-ascii?Q?v9aIKw0V+WQ7TYMEMoOWPqLLYEUtF5OuNw3AJZExSehhBRu9zJaV4o9DgvPH?=
 =?us-ascii?Q?K0IYLoIUoa3g1u2lnW4jdS1+o85B+Qv8hJETA7wGy1CYE0jLLQtYSSPbGk7M?=
 =?us-ascii?Q?oclOnO5IUkK6+84mQFjp+PQMThe67WOCpomPy4JI37rr2B0AK47hVSwrXr/a?=
 =?us-ascii?Q?Qe9jsXqj6xsaLfPXMIxmRqpDgld2s01f4KH7j6quuwETxQ15oTU8raPgpZI8?=
 =?us-ascii?Q?3BxQP2ILAkfY09wuOkQMZ7dDgE9NZobC4tX2iuY0czNprphMSBHcCMRYHHjO?=
 =?us-ascii?Q?wxi1snFFdtHnPFhUqpp7nllKQ+lmAtB6yRngPG8laVh4f2OMExyY17kVIrue?=
 =?us-ascii?Q?/boDrBbcVroxKt13Is0ThsQDzMJ/laPAGoQc6WEHlVN6luV1fqPkA0j2PuS+?=
 =?us-ascii?Q?MQLP8TX2DvTj7ZxhC2cpMrzLv6H9gV+4T1ERdjVwTe1fDqkYoD7Sxw9Kg10v?=
 =?us-ascii?Q?4PPNRxJeCol5HDCOz21BrTdYZ3XiXgWlLuCcJ2IQTcoiW9npGFtAzl2lwKYT?=
 =?us-ascii?Q?1DN9xTmlDngoChEXGnMYMcsb6lgCraZtZMrICWXbBHIK2LpMvZ9vfpbPilf+?=
 =?us-ascii?Q?yO6TGRIhfS6+qFshdQcCDRbeCwaIxsk7ANVMgeWxMaJBy2+sUDmKc+mcjAOy?=
 =?us-ascii?Q?8KOVeRR1xRQcxkNIBvejiAErERIdpI8j0nf74J3lL0+sOgpR117Pj2vVOwFM?=
 =?us-ascii?Q?XnHOqt3ewE3JP361cJBfVAMLnp/dhqkrR4yaX+Q7D+9awHJoFdIYZjs31ojb?=
 =?us-ascii?Q?kVyuVVFcvn90FIWoQUzzBIT6EWHaus4nSd/9L/YbvMuNZKHXkqr8haMIZWdo?=
 =?us-ascii?Q?IA8qQI6s3S8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5LpJW0LcVSqfrNVvCn/29+zo9s/7q8A+GOnOjB7lRxSKBH1/QxQHq+6A8+mk?=
 =?us-ascii?Q?c/RlWr7z0nzQwgWdYDf2cErdhrh2Ufit0Ld3lOpa8tPcsxVoTB8/J9M3yVcY?=
 =?us-ascii?Q?MOxD+rvVB6CGANuYetYLzfCRVKzuWIBLCovDTcQvtXmSVAEsOx2+cbtUJ+iW?=
 =?us-ascii?Q?U6yplmIm5+CwG0Ni9SjesdXdDuugiEzsTQ8OUmT9smvWU2N2K4qPcDrZX3Ye?=
 =?us-ascii?Q?HmaZj0uF/MgTAbIt6relHA+eWBqj8A2c0Zezewjp43sMqd5XewoHwdbdmcVd?=
 =?us-ascii?Q?+xB2I+VjVOZu/BrRSbVKC0UWVR55P6R9LZEHdVVP9Sr9saFmJScUcpcr3L4V?=
 =?us-ascii?Q?xuKBrAa1QC5uUbb+UzqRjHSr8bAkhfnLfD8PF0rUasKDM/5Sa6Pl1XDhOSK/?=
 =?us-ascii?Q?S43S5P686VgT/R5c91OIo8+UE8QMbR+/qQSrLBB16WkbbrkRHHP2MhXcg6vh?=
 =?us-ascii?Q?ZeEWKwU37w2HUyRF7V228Rj2r/N81xSVUpF5OkQ0WRnEA4l6jPFsvuaA643X?=
 =?us-ascii?Q?espkXJzZ22R4apptz2algc3gjecuZ5tX87chaGGDxg4+vpr9bb5M8SUprOIC?=
 =?us-ascii?Q?ucL/SNvIut6gFAxk8trZlLfx1earJSBivrLVcsdPLfMSmmFC7h79qUwFz3T4?=
 =?us-ascii?Q?PMBQIOgFFFB8p9plukQ8BBRR1/kCVT4lhOrXFdip4gqTIFlSsevXv8y+5FgC?=
 =?us-ascii?Q?RsxejUthijovfQkFk+kMcMcP0osylGh1MkMbChrMShD0KzSUH3TB5Oh0IUyK?=
 =?us-ascii?Q?3IDfh5sRYxVjdabJXLksZD8DcPqP1qOvS0Hl4B3RJ44RRA0ml2EYo+wlwytK?=
 =?us-ascii?Q?yCjEZc+r4iRvQzmKwx/A4onC63TiJPVjmhJgSuBkQDEfHJ9PQmEyRbvl2jV3?=
 =?us-ascii?Q?dyDZYGxuJaTrE7+hsspfsBk5QwFjGVKz10I8L5ljlG1KpJEK4S6Kd5TSdOKR?=
 =?us-ascii?Q?TYkwi9N8tNlikD9hgDHW8lvovvutf5nEiLAqz3wcOwpJvm/VhPMu45RCoU49?=
 =?us-ascii?Q?plr7SQqURfmwRQvRB8icHbNyO2UGD5HtIIHvl0ZHttO3pp7Y2FJuZEkXBNjy?=
 =?us-ascii?Q?6DOuW4fP3W2uM6hfNhb/mrzd5QNuIjyDRtwQ6PsG9LHv+0+Qp/0XXKmrD4P5?=
 =?us-ascii?Q?Q3RcQZO4peVJ1k5bLsqpOjTCBmKQLamP+4q280dUTRocTWTa5LD74t8+xQms?=
 =?us-ascii?Q?BxdMVYWOmTf+EFyY5XNFzT+/CpxguUjUkcyQ8HtkFRt7kZst3wdYXdv/bG1I?=
 =?us-ascii?Q?cGIhkYIq21efUmnXh9XbHpMFn551LnHhPxqRtG5XIrMZSy9RW1M2+n9Rf+O2?=
 =?us-ascii?Q?PBaCZgWGVOOjuhEHR0gSFcMCQJA6kzEYS7opAyGHDM5uAudG8jqPUua44Yac?=
 =?us-ascii?Q?OQJiHYp52UTndS366vS0GMU2vni+FSvqKr9pusB+H6rN4MQCfHTxcpEw7wlM?=
 =?us-ascii?Q?6x6RRh0+sbE4h2snEF1P6tt61TRq4o1ZKxnBGUkClYfVk4fmjXGd12F1Y19R?=
 =?us-ascii?Q?nfo6Znfmk2iZWGnQRI5we1RRMtHNU5l7ty8eFtHz0F9a+4Doaoyk4zIi/LVa?=
 =?us-ascii?Q?iwF6SJiCnEzPBbBAvS0toyghj6gRW+ssy5aTZ/4S?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dquYnzR+shNPXM81mTNUfysGd8gqesuCutNv+lpatalE7yQ1RJo/G8ExPPcIB+buyLBmXsT3yldJRXr8e8O0JXNVjk2w6bxqldXD91296WU5nXa6Hi09AcoR+nSKxh5ElmPOjfrIKYNdSLg1/brSie4NXwhB0BDVUWcfQZ3jLccssJxoVhgKRM45QEVYpgI91UNZLJaRvE7iJUTgTyFGwLFOYauAfJtaGmqcd57XzGbI1bMKd+nwMAKf0ORTMhVHz4/u2BdKaplHmARFYOzBxddggIkmnXjsif4TjHVdjTqHBQCJez0lnNQAlMy3MxV1MPFz8m0NtjnSDWWgV0DH9Wczqe3zK/WkaUWvPwp8AkZSbi90HB2t3KxEYEJACEjdu856UDgAdKuWUagxbnILmxVwj6X/iIA2/UwmGBJvHZ9Cv6jxTlHETvsgfsy7uwSXk8zfvIFrnyAKL50miGnn+lfsLfuFmS2jSdiW9BDocjDspCKBJLKNap6Iuehw0olvGTBDDJxwFxLCXqVbpTl5itpftOp88P6oSSIkwDAKPPBfSbN4MjuIffHYWe6YoqVC+CBFPu/lSCk9Urqcio03AeYTUhzPWPiEnV/Jcyj5W60=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcf40e0-92af-4571-af67-08dda64e6782
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 05:36:23.3438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfaVUlGFYrkPZeI2fvwBURNnLbxoNDtxpoSWYosHtOKOquMZqrCqxmrrvs5HTqvObWVMQsEYNsj0q38jeWMSig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4258
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506080038
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=6845215b b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=F0ySWrHhL_BLJAwJO1MA:9
X-Proofpoint-GUID: R_-2sf12g0PBa44Dsw9Uew-LgAtEsEWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDAzOCBTYWx0ZWRfX3DIUiEwnkYpb MY+4Tyz05vUKk9xG0alup4Zva/+0J4d51pM0X2FRIGHUc8ktOw15dNRfdy2GiU8WNC4maOHMyPq UK5yDVVLkoEaBVnpBj5RI2rLAoxNlM7hXJK+3oJqu/NsjY6F7V4a/It4n83e4UwyjzkGPWaSHLk
 9jeduW7MqLG9A0I9B68lF9r4aS5kZzNCdv4Lm0GnLu/GI0ly7N34lCo4f2YROJ1XWqBZbQts5k6 ytlxVtqvCx4l74qi7aqM2QBwZj5sQ3i4kMsy0pJ5HMmlnyGLT1lCfw+BkpJwm8nDjMJGbVgPVym zXVLFSrVT8NUxO5Aa97rzgDJt3Lb6EGvFOdY4xpBOTnWygARBCNjnv+IkaIiWIe9k3J9ETtmJ9p
 4xzz1m2FtN1Jre3Wn9ROMpvh8mVp+S+PH3Npz3oXSuqJMVO3CI+ZEX4oxgmA83eavoZynlWg
X-Proofpoint-ORIG-GUID: R_-2sf12g0PBa44Dsw9Uew-LgAtEsEWm

From: Eugene Loh <eugene.loh@oracle.com>

Our luck with this test has been quite good, but it sometimes fails
to show its last lines of output.  That is, we send a USR1 to the
trigger processes to set off the final output and we immediately
cat the output files.  If there is any delay, the last output will
be missing.

Add a short delay so that the last output will be seen.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.enable_pid.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
index 7f4f68698..5a151c767 100755
--- a/test/unittest/usdt/tst.enable_pid.sh
+++ b/test/unittest/usdt/tst.enable_pid.sh
@@ -172,6 +172,9 @@ for pid in 1 $pid1 $pid2 '*'; do
 	kill -USR1 $pid2
 done
 
+# wait for last of the output to flush out
+sleep 2
+
 echo done
 echo "========== out 1"; cat out.1
 echo "========== out 2"; cat out.2
-- 
2.43.5

