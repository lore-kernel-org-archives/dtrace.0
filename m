Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9951E9079
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290387; cv=fail; b=Te+VMsaylDOSSZMo9jmPKuJCPNKNnsHU80buy5H/7owiouuIsnEdwnT4gtOX49xxbohO4UfdnNhEh+jUI+BILPBlOhV9NmsVJbXSHVCEYusruRgpJvV0z1mSq1hl5A3XjGe5I9KvvvBZZflVbf7OXQeXUnZEsBUl8V4oAH6NedE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290387; c=relaxed/simple;
	bh=cuk2y2tc+mFYuQD+EXvEoAcaHzFp0Lh5Ss1KZItfXoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lrHtP5UsipjGKpXmm9VFon2Gx09IStoaB1708qkVcF52iclUzuuFvMXMLi1ZYu5AR+95mo6RY9nV3WpmA8CBINigNjbNH4RGD8atKe3Pu8CPCeTG0TdZjWRynMkoj1+ka/DGoBq3u9QwOxmzTOZLOWVQb9Xg7QDRciY1YB4cmY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oaLAPtqs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T3QAq3IR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oaLAPtqs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T3QAq3IR"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1gXkn010279
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=7z6RRBWlMdwHDGREDRHTQllaVQBbj1Hhh+8LCcklnlI=; b=
	oaLAPtqsfE+N0XpTyddITh1GEypyVOr4AiGqO3234Y7veT1FliyISw64rgTN/C7+
	pSrsV4Ow76KmW3B/OzXYXiXpRFwMiq3ezXZ7eIs9mk6sOUic//4YjPtGHBNGzR2X
	zk/K3GPX6ptRjFIAbb89zmsNEu5NMuGRpkMUPv1QM0eVYgtZThOmAvcpP1D20rB4
	0NUDU2EAq+JtT+7WAPbNv5O03QckeRH7ROyBSJ3yKwmdp4rpEmJH8VYIf0/qPUfz
	KAm4awZ2pIt4DqqmcwS0iSQNemcvlmWex6gxDFjtGVkyh2FIFmyYN3KUO0+kyjyP
	RAurESwcja2kr6NRBjnwZg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp7ud5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UBnCNt008385
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hneb0msk-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEEpzewl4P3s4f34EAXkc6St/xlRddjNb3u7eBhBZEsu6ewe1dv1+0krzydjotEMjIXzSFqHKMj+awZbjWB8UJoc44Abk4KHbrulkuL1GxVH1AE/+WN/Opb/omSTznRMDyoJo4TXOIM0K1U/vOaUCjen25UOQIOEAdWNQato0pG7HI4wCQXZNLnIwZr+vSA+5ygGKzPH0vW72hAs9N30QxzzFbItzMHFOdLO7dZOWS9NdBWTCqGO4zW8dKRbXPw57XgIHxtr+6TuqpSv96SgNiAJ0H3jB4OvS8y7LBqFotbvEWz3nUw5XqKsxA4fRPmEPWJjxhfyPSqqUCks0orgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7z6RRBWlMdwHDGREDRHTQllaVQBbj1Hhh+8LCcklnlI=;
 b=SZ6YvxuPxJo8vQVBEEi36grMnBk3J+1un6Sta3RUvPM29aqJp0KPXu5kuUXhJzzW9OYEfu/I1q+cpd72zc4u0WncyQMdYGolqa6hcAcVXdX6c/kFAjeRDW6dkEwKbz1IOKDFDArqnewTrsY76ljZ0BfWPqJf3iiIfq+Sw42Nssc5ToVr+lR21D/nBbch0AO0P/QYCKqHldn62GFi7yYixzWtrURC3yfTQX0WymSfdcTqXw39Bq76X1fpsnJiLPO8G+l7HTp0oCxqJBuiagPfIahcR+7PRWETRlLcRHaG+pT+fq6T67fB+411Qu1OBB2fDkUwlg9QFFsUWgREH6FGIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7z6RRBWlMdwHDGREDRHTQllaVQBbj1Hhh+8LCcklnlI=;
 b=T3QAq3IRFtzMxqUg6gEEDTKAkH9ZszXvuWtvQnMPGexX78JE+nrUhaPikyB2BGWQv7GReU+zELc5aTb0jS2rwGoi09cLoZPRV7oyJe4y9HvvbvJ1PrtE86UIyXAf9Q7SGU4VoNx685QhkI6O8L8hHb4cOOAAbFDC1woveOHYCIg=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:13:00 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:13:00 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 09/14] man: drop blank lines
Date: Wed, 30 Oct 2024 12:12:31 +0000
Message-ID: <20241030121236.257803-10-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0030.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::16) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: c8397ba2-7cd0-4254-c00b-08dcf8dc32ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5p44vwLW8O7Xc8uMliPWJE+iV5S/2x6Jyy6mnQAvdk12m+o8gAWU2uvUwjGc?=
 =?us-ascii?Q?nTMCzuBJbVkPtHyUXgF7UThRusIxBj/a1ABpZwdKC3Yxt9hywJJEeC+qA39y?=
 =?us-ascii?Q?EFFfE/zDg9UwRf2VzPSCc0MABg8vPZe/t0EiifiH0tcHkL5xcfKC9oew9keD?=
 =?us-ascii?Q?3CGEcIV9wBVdQY8UwQAFDiMpXmY75bIvAgWCHeMGLPgn5ncJVfvMUxgiEycF?=
 =?us-ascii?Q?aRCfiMyR4+av4rwcCEBMgG3XC7+v5soFQLMo120UQ+FBI0QugSDKTNdZdm3Q?=
 =?us-ascii?Q?k0vCgpSAutUFaH4fY0Yvtlyu8M41k/nlIQk1YoNz6BmTeGONVUEarOcklemg?=
 =?us-ascii?Q?eIwxSJ3q6/JvJt9bfl8gMKiuxzLB9gWpI+7s3xRR3C1udhSCyOM1ksE9PoE4?=
 =?us-ascii?Q?YHC9nqyF3BbwOUO0k8VmWHb6/G/5Ujo/b5Sm6gdnrj1yzkRjZd6Ch8bIGO5S?=
 =?us-ascii?Q?ch8oYVPC1EiBe16L1v1D9UT7UP5aB4f3AzuBpjTLCP9wnxAnNTBWXGpr/N0D?=
 =?us-ascii?Q?kQBnQXoLFbh6DPQ6H72ki40HwYR7VDEckjM/s2qXOYoCmfiA/WLwmdIo2Zyk?=
 =?us-ascii?Q?t7pUROX8rPbYcfx7B51FdhDh4O9ke7pyI2aUVYQNulDZhbELZCId0Ht+z8Am?=
 =?us-ascii?Q?JUSyN/xTar4CZq2Y03CaTle87Kr7oN2ASSlS0YInJouwg2cgejaJ70JX3hNH?=
 =?us-ascii?Q?VDHssEFDIUbe/fBa+lJ+gsKXnkghF+XsIxaiSdH4W2linr8eXMmV69AKkPIw?=
 =?us-ascii?Q?nMAhHSiYPe7njf40i8JeXwbdwfdaX348Mkk8nhG6H2C0RATzFDzwXn7K8VL5?=
 =?us-ascii?Q?FiRe7x93wB4rbrZ6TDm7aB8y333MO7hHO5fLCoi9i1prGEfFEl2e1rlKuIca?=
 =?us-ascii?Q?KFzxMp3vHU1W6aCwptXUaOvsfo7v9lOWqPUKMiN56wu8NxlxI/ha8xBW+YMp?=
 =?us-ascii?Q?rAC4jHdy/aS02mGJu5WkJ6x2YAJMzSOvzLCnakHE3GLZ/hq91VZLrARiKCRQ?=
 =?us-ascii?Q?xPbBaVevwT1z79lpCA86EItCzrYjJJlmYcG8QTk0d4yjnTcVaWTbKsJ7scLa?=
 =?us-ascii?Q?D9EVCqy5isAKrXxmN7fwSAbX68fCr0icnh9o9d6tcI1iVFzdLyginTv/ZAab?=
 =?us-ascii?Q?HZICXgRJg7RVAk0rEvKPR15euUtktZJUWFia2ZHARiaHcgbboBUmHrGAvRKG?=
 =?us-ascii?Q?s28ddbsyCedW0v0GRn9T6TvcrIWjtOhwpTU294uPaVR2wca+44dz0A0TfMqv?=
 =?us-ascii?Q?ZMzGqKBkJ8Qhlkrub/xg8GV+SyMLrHwFGfYxjCgcDAc4KnN7jJ2fQ/Og2ZWt?=
 =?us-ascii?Q?9z9WbuVxlpFew1gZmYW5BCn3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WmZFMDxigOK0MhRPeIzM7NniPCQVKNhz1NTt+bgWEkEkN0pBrj5lJnMC9qIG?=
 =?us-ascii?Q?JBwf/xVP/gpQBuXMElbGPXsjolaFbWvbvDTFhex/lVAwb+mKwRGRw1+MnPhF?=
 =?us-ascii?Q?gvtNnm6hFhEWsB7Y3l/8WDmXquCvYhgZI6mVTIrFrrsmW0xApgQXfD0SN/XN?=
 =?us-ascii?Q?QXiDL+kw2WhypBiwkbzpNyVF519EZguqh2QaZKvj5g2utgRzwxjGEl9ha8GB?=
 =?us-ascii?Q?hFirGMhHS+LfL0Noh6EpYQIWBBXksJsAhLG0zSjM2usX8Y7SVCGnlAGwdNeb?=
 =?us-ascii?Q?d5mQaxZjTwtK50qY0hyM5n0o9o/OYzjW7d/W+ZV4Y5F4s9Xb2dB1N5gLQaop?=
 =?us-ascii?Q?Qw0l6Ax2Pm8VnBK3ng0RHI8biSSl8vqxp7N7OaR/0N1mwhAzizV35Wgju5yF?=
 =?us-ascii?Q?rTdePLg/g9gwmDdfm2qhFRpcygraMMpHkJz3snzZIOjs69YiP1MgPCigy1St?=
 =?us-ascii?Q?2yBDp/Y2SsDmkIqtXnyAH0/98GbgzBjqZfxZlEYEWUQ6iL31inrNuqk6dkhn?=
 =?us-ascii?Q?FhbZ7YNiSIQjNQR7M63vrBSlZ2gF3zsEgS7+BAPMZhtlybWyItYn43aiFC5Q?=
 =?us-ascii?Q?stJMhGb1wX7JMjU4Rthqsn1zTg+z8tZyoV2YnZ0sJgjVmRTouFRgphxODdfn?=
 =?us-ascii?Q?PCe01y/CCC2PvVQifkcVm73yeI+SnAT5OoxXr2ct9RSYmtfxKBZCvHyNIQbH?=
 =?us-ascii?Q?SI6IAUMlzz4dkEE3/F1IpFiMsaLFidIWQ4NYukBLYpSRZ5JlPAKNRRD3eH30?=
 =?us-ascii?Q?+wWua2KdYZPrNnnDh7r6FFVPbDF3x/8TNzrDMI4zkD1DwvjC+dajzzEY6QNx?=
 =?us-ascii?Q?Akb1Fmn1krO+5l6h8hR+1IH4I7UnAuXYasXdXo5uAFgi0VBJ85yi46ikpHYj?=
 =?us-ascii?Q?cwXrZdHqOSXjNXLhz7c774vPbEeYGz86Ks+rxaualTaOJoyNr8k5lmD7nre7?=
 =?us-ascii?Q?VXseqnMU3QxSr7KcoEw+7bNireu+zwUOVSIdIo9xquY+Z+UoSUVDZzmz19gs?=
 =?us-ascii?Q?qxtH18FXfem2desWbEryQms8i7x08/aw8xlTu2XHeU+WooHEpSBw0gorpWBr?=
 =?us-ascii?Q?QScfDyh/TiFmyATMRMbGFgHj3MoFKjU97TWjT+H+0dPAQxi/i+h9ve0gOzp+?=
 =?us-ascii?Q?hcUnDZx6odgjzlszQb5eMZW6RJJkedUSh9vkBeg6CA3M8kcm+z6gZM/kbVia?=
 =?us-ascii?Q?1Bp09d/Jvq2Fa7XUdeRjSkfTSLsLk232cWn5RumuwTHwbuu09VtzwfmPv009?=
 =?us-ascii?Q?zlSIffZNReR7zAJX2eWZYhOu9ck2E3ghbQtkU9MW/DRj7/knwgQA9WOpvMaO?=
 =?us-ascii?Q?Kg/JwtPuGdeLctJsteEC8qeVdKraG6ZSLchkdX9/w1bsdRBm7zchKQsBSQ1t?=
 =?us-ascii?Q?imJ+K4FOzS+wljmTxHpuVFdfB+QrmePuDPd9iBbklRbrSUG9qa5gBmk1PynB?=
 =?us-ascii?Q?p743Q1BbP9UKOIIq3yuRCgGI9V2GLssPPsvdR4VntmCeoiM2kygyapQ9LArV?=
 =?us-ascii?Q?LhYIfN+aVQODNwPNjyJ5Eji6MYQLnpirys+aCU3MaXYTNSfy3UEeDqgfAPfW?=
 =?us-ascii?Q?E69lKKIH33P5UoEJeUgKl/1KffESZRAA9TTKnEbiUDDaW+R2k9UntSNZKOU8?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MO3hkujF3YYCp1kT3nsn4d4ls4JREN+9HrPZAD3bgN7KSNpcDpTcZelS4ZBtcCdWp+8v4OQdjPKouiXgy0DH5pqqCbFF3aQWHqloC6yaqeZa2aMI46Dzj7sS4M/Tgq2B8+nJ1Cfppszj7x1mFDcDnKyLNfbwBxhezM2WGS27F0mvRzGrLTAcMwgBS9TKc4nkJJqswTVt3Kx0FC/k5kPKX2K/TvWsn/c7hjcfIWj453ER/OfEXvJ/9UrSyy711eJ9NK8L9VhOKoT41G0v3BFGfWoQf0cXbMgbZyT1RNtIlKiP6malaAXoeD8Vad+JCFyyz1arR+f6Rr558g0UEMg2bbW5z3atnaIv1nmHXLmbzGfMSm8U4gCGZ/UyHB0dhZRNorvSLpTyK3H4zb6bs6BDdPFpxg6P0rmZvb90SOqxmhuJJBpiQ4NcyO38NZYJ5T7oCFPWBvHShteyWC04JGflEEVmar73s+USwtbkizkStbCu4pyF9UtflB9LVRGammhB9kJfa4Ix7kUk11X6TdSGy2gL5hr5cHZwxlmxx9Nhh/HmgYiaXBG9Mv7TLnr+ah+0oMYlw3W0I0bGLFFLKEAWR2AhDVZr124G/NmOXKENvRA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8397ba2-7cd0-4254-c00b-08dcf8dc32ab
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:13:00.7230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2Ejv5LUVHjW8vn3gPgK5ZOwmtxanakXalFgGft07h93TN6tt6jpZjIsfLrQSC6bVBTXtWLY0mnLtTXjvLsvpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: Cdk-_Adx0pNapL1cWXY3ZwGI06X0aiCf
X-Proofpoint-GUID: Cdk-_Adx0pNapL1cWXY3ZwGI06X0aiCf

They don't do what you might expect in troff: a leading . is preferable.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index a53632949e72..0639db2136a7 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -179,15 +179,15 @@ Print libdtrace debugging output on standard error.
 Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
-
+.
 Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
-
+.
 .SH SEE ALSO
 .BR cpp (1),
 .BR ssh (1)
 .LP
 .I Oracle Linux DTrace Guide
-
+.
 .SH USAGE
 .LP
 When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
-- 
2.46.0.278.g36e3a12567

