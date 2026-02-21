Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6099B3595D
	for <dtrace@lists.linux.dev>; Sat, 21 Feb 2026 01:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771636244; cv=fail; b=WvZK+lpTH8XV38cxNKkYmZPlDo/Lxgu5zeqgc0FgWEpwO3VZJmf6DGF7gRQpO5rbh84v9WjtCLdm5QNPMk1Bkz0imRMrxJsV4v6zPLG85+ENRAyInD9oVzwhvTsIRhSV63vt30ucm/VaCVMrA3kEMvGiT1esFg+BJ65FlmApIq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771636244; c=relaxed/simple;
	bh=SVO86sfmdaUmotdl11Yek/Fsy0/17UinZ12HeO4dnvo=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=a2TTpAfKQIMAQ8fUTLiPsO/E//7Bmf4GQSb7w+HQB79atL/hWmqxKKABFwoS89/ydAE6n1QdsVbplhjPlBiuDwYV67OaEiZXu77zaERqnerMgjdJNIMoS1GmX8RZ7jtXCmyvY7KPmAfWoiOk2vU9CGFz/04QvKtS5W/3Vs0REAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MK99Wgwz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JjlsHY9t; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MK99Wgwz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JjlsHY9t"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61L0k96A3734870
	for <dtrace@lists.linux.dev>; Sat, 21 Feb 2026 01:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=5+8T+Zw5TPjPAaaoA1ypdvEqobNjET1i2x60W4nMKD4=; b=
	MK99WgwzqfCZyfBHSs8U3OCqCRj82VdjjnzGsmHH4a4robCpqDLHvMC9vzuYtseS
	uePREHGc8tYVXTdBs7xG0KiHO/64NZUVzPhtJW/FDfFtYtP3a6yToQNUexANR1Fk
	CViGw0Ep81FXjnksDGOBFGF2Xm9yuXHf+aLuAXVJ9mm9GHwuBJvF2FNvEON6rodn
	6K9cYomnlV1jCm6Iu9JEU0WIzaqrGn+hnTg9tNjB0Oyd6KrWlgoL7TyL2j3Rf4b1
	QDp3AIHAYSoECDF0FCvsfjfhpSjNLaoOuaOaG5GarwIWb2meT12nq8xKrWxNUOMl
	zhrcMRRvJPdJ9Ynu1PmMHw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj5ra9ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 21 Feb 2026 01:10:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61KLq35D016976
	for <dtrace@lists.linux.dev>; Sat, 21 Feb 2026 01:10:41 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ce4ayx5qc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 21 Feb 2026 01:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXwqFbGl/o0XBnVaJN1DjGK6NEMe3DUlBW087MhmgbNI4Sf48TPHFEG9uoSZu/fY7sZdzZjw6WKfZK1xfh0qRzOP92FI4FvZdKqGjAgPg65Sc4a3Fhdtbg7Wy1rL1O3KOMcj26iqzMXyzdXeepNrC1LgaLA0C7v8iZXoWwEnc2IPREdk8hSH90Z3WqRRbwDPPzfMbfBNfj11+2AQ3NWXQ5PMNbfPxVuMUj4m7oWeH5SfTuLfzCkH+lYS3jXCvjlVkAvAUwnhEcDbMgN55LZDHhXyBWS+m6ZjVpJgs9N87XNMWb4C7t0W1lzOYc3HDuxRn8HC9FF2R0Uywv38JgXjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+8T+Zw5TPjPAaaoA1ypdvEqobNjET1i2x60W4nMKD4=;
 b=c2K/YUM3xHQ5Vwlh5LiXGn7Yj8GWlLDNmNgWuevFFN53/XqqPhU1lAYL2CiWIDJimdiccFnvV3rc/ImZtRa5yxGnSva2CEGQbA/5C2b7MfdqgZLhuK8KIiJGmiSfNTDpFwR6mFm822Azs0dpQ7k8XuShlL6kXT6etsCIcOqPC9bIhtTdKY4c8ij+NU9uHRYFyACanoDLwnVsCMnUmG6S+O+V84HN1z5tm2qR120m2QWL05fRzy8iIFQssVlc6diAXG/ycKLDvop57pGqYQi/5gxFN2NQptxCPfJyzp6b5Hl9Y+t2X9aZchtJGrgrSwV7+gKyy5s/S969Y94nT87YVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+8T+Zw5TPjPAaaoA1ypdvEqobNjET1i2x60W4nMKD4=;
 b=JjlsHY9tXfpWK3LCPbYPFe2QeVmV5ycuq8CPdLrAQuzfPMJMmHovQzFk/FVM+ZUBD2Lk8UMyGrqBahvIM5HrGN652TRx9XkRAB8WFQzQ7v6wnf+m1VCwUim7N7EuL69r3QrNcVa4h5EvSwufPN4X0pvkHZ79lFeAap9zwWzj25s=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS7PR10MB7130.namprd10.prod.outlook.com (2603:10b6:8:e2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.16; Sat, 21 Feb 2026 01:10:37 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 01:10:36 +0000
Date: Fri, 20 Feb 2026 20:10:34 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Important repo change
Message-ID: <aZkGCote/wYt9I+r@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS7PR10MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 43337f45-600d-470f-990c-08de70e6053a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3aIUlcbpk4G9k9gg2YAGLV3NmGHQDI6c1zWzf1AL8/vPbwuMmQGV32pw4S12?=
 =?us-ascii?Q?Ntm5k74Jt4TMUmiljaGynxaUTSxeO+nx2MPveDHpH9ZY5edjoapVrNPbanLf?=
 =?us-ascii?Q?NnJu18Xz7IQuDthQeRYqLM60PUFMU1kgKftoz4Ao7u4+9ifjjNps5CU9l+Nz?=
 =?us-ascii?Q?8JeCsB6Fbv5PYn1bmBKoDEkqwCEEMy5w7PYndgPSK8uIkNVevS9JXectx3Xv?=
 =?us-ascii?Q?YoC6WQFfUdfprPKhdyUfFjo4XqZ9ZW37JBRNb4sQkxOneMpgHKjKXlRsJDpI?=
 =?us-ascii?Q?D/Mjm6epExskh8pFFJPwfZyzuXKTMeh4MEVOEk6Dj+TI6xIcfTpNKTiJLzyd?=
 =?us-ascii?Q?JTLnZYAX7YR3SyRaEBc7TH7fcZhiR1farNetJOcInbLobisPgxZC+11CFZ7W?=
 =?us-ascii?Q?1cCLKeutvbXyPYo2giVLueWDPCkXMUOBDbyq75kpJEum+zE27rGrRxni4od+?=
 =?us-ascii?Q?DcThm1uVy9fiLX317O7qyO3GehhXbiz+krgmooCMtTqEYbZmnrrZGOeAZv+G?=
 =?us-ascii?Q?KLkvhtpmuccG6MrrK330osuoDhhXIWY4hnBAhyQMppCJEyDpXZrDfNAn4rne?=
 =?us-ascii?Q?P6juld75Ms0svnULP544hg/HKcr1W90BCb+5np4o3aU0aTiFhCoYJJ+ijiKJ?=
 =?us-ascii?Q?lAVXig/XgX8RyHwYJPQAGgeyn7cKVoOPkTCZtiIK8F16gU0u0b/S/wJs3/56?=
 =?us-ascii?Q?9uv1PWSw/V8fVb9W7ClPUzk5DVPiaFVBLi1oSRspW0whX/Fb/3zbIvfeYZS8?=
 =?us-ascii?Q?hJ4VkU2uAafFSZE2d3l3WzIlpFIm+8ar0weZ2cuO3C0v+dAP89ZctsRNIpXS?=
 =?us-ascii?Q?3VPeavQhRL3T64QWDEcS6DtNjBhMYxfhyWhQkMylhbBdemgT8XC5A6O23aPL?=
 =?us-ascii?Q?+74Kl/XmxR8MFh1C7hjx+aIatZqTj1ScloKCBlpU2oXhKGiPpNPRB2havkyY?=
 =?us-ascii?Q?j16cE04CEhYi5KUcD9mMa0E61sbWitZYpUwGcs0GzrWW9NtdOYm+TYndGA/5?=
 =?us-ascii?Q?I2az11skdP3Z6gTxwuwEB4TPd0eiYhFbZ3l0jdr5p1UsvOpSE8pzVCTbHHzn?=
 =?us-ascii?Q?3zemsvXaRvrDCW71qlRs4m7VLz92HEGTPGyXz/ST0PiAckeJmgnXi9NMyfhJ?=
 =?us-ascii?Q?ZG/R3O8NGtEvovvzvnXBXZhaVt5y4s31hOM0DSBFya+QfbPp3mPtcGMKSQQa?=
 =?us-ascii?Q?nwQSFl3+qpYe2/GgdcPMfghCMdDMZAGvX+EMJdHI4xQHGcjWKdYi9L9XhAPh?=
 =?us-ascii?Q?LqtIw6u6kR/Up8mOKt9NQzPOjwmHx96eezVrcUJpOXDIHDujqf3XP4ciYh4H?=
 =?us-ascii?Q?OZTJVoqHzeT2M0ig1pOhETuFbbiqmkr/+I4Ndg1jnrMhV+jyPvMsHEomk8Ic?=
 =?us-ascii?Q?SDeqE8PwC1sRhvR6em0ueEmDjLxmDFS9tZtHkaWBWa822vAKVgaNve9hBSnL?=
 =?us-ascii?Q?yS5mv+YrbZMkM4FKFsvrQaP6sdxfTP93UTXpoB8JfN2k0CWrw7xVr+Dhlgkl?=
 =?us-ascii?Q?BSyixy/rt/i9HkfpGc2Vtfh4Tn03qwIb6ORPCytRPHolsNcr07aKvqSIbWtv?=
 =?us-ascii?Q?fXyrWf/juz/tXcrV9Ag=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iBQdl4PTFW9LGVR9+UGwIfKvFdq+cTS1YmHI7ArP2W5ZaqotFUiDTzdhgvqh?=
 =?us-ascii?Q?0F/E6vNNAzFWCoxUunU5Txk3z9tPKgN0CWqxUfedDLRrbBPGPG979pNguUcL?=
 =?us-ascii?Q?9qyldgQIOJGJ4LAqBRmYOBbojIyWASca2tsmieaTK9SC/xr16U/T0/qyL/2n?=
 =?us-ascii?Q?JlpCpwY3HF476OhRmL3b+NjpEmuoH7MnJY4xYZs4e7plgJh/pYbUHTlKdjBO?=
 =?us-ascii?Q?kGOrVztmx4TwvB2fkEOy36JDerq9jPTdgVRTllWwirDkneZkE+xB0oJla6PY?=
 =?us-ascii?Q?vZXKolZpynvwAwxCZkvFOK/dVwbNkQmFslpw0QVLQxj5fwi7krNhsnqdqHtf?=
 =?us-ascii?Q?4f0oCHZjrOfDkwL5ppUX4vArjlauRJp00Ye48SVuwKCgsy5Yn4Gu5KyK3BTK?=
 =?us-ascii?Q?zsNUaQc/Ov0tegZraTIllAHFsTmT3NwyTCKWKqwnTO3atsqEWo2TrHmfsuLm?=
 =?us-ascii?Q?KeQJWc20Fmu2SX8Qe9F1/WZtxuUpkPmbVOmAihBfEY0CnwEW69f25W4GvEFt?=
 =?us-ascii?Q?7J/T9bBWuE14KAkpnVX98lZF5u8Qi3SGa/rosYlRvJcgE3+mCnVjkT6TX2GE?=
 =?us-ascii?Q?judvi4feJQO6rpx56leDzC74SOPiRoqxr7HF18L3udzS4MQdDPzYaN91sVgj?=
 =?us-ascii?Q?864TZbCV2VhV6PaehhQCqHTu3W1a1IgetOmuHfZzy/aD7PysJWSdh6gd6ca5?=
 =?us-ascii?Q?y5BGrRBSkq7cPaNuPkcY0PuNMZ1q+G8l5obj+gVS4TsSrqiBEy9bkITc8PB/?=
 =?us-ascii?Q?W8cB9DOR2Kh1yfYXz/PdAr4ocO8ZCIx3eGF6I8ZC2KkFibWUlMHMh4Kj0cIA?=
 =?us-ascii?Q?OKF1hB2ZeXgvpMx0KRQ6fwwJCzTmo7lyn1Ue5PkZ+xOvchFE42GldSKoh/9k?=
 =?us-ascii?Q?jv5FZJfMCvJ9rGjus+4JjBZunF0vkSkVCz/vp4j2BXuGcNViz3oM8+AKR2Is?=
 =?us-ascii?Q?y2PNbqdgMt6GBpkVI+BpCMgoG3U7rRwF2l/a4/M9Ds/245mQDvGwXEWTHI4K?=
 =?us-ascii?Q?+Apxg+h4D6KPvOymA2qLM58gkqcWNINIJrMFrjPgptC+0oBrPEUUArwmQtwo?=
 =?us-ascii?Q?8J0TpGvsQ5uODs343g3GrpgAORiybB0OmnqEEv4dZ+F34whu/YvGHXpQlGVc?=
 =?us-ascii?Q?6+Red01qso4OIxtAXkIeKarwXDMpu6nNSSsogywPrw1cjmJqrWPxbVHQBusg?=
 =?us-ascii?Q?yh2PyqB0LapuJ/AWVIy/F20ewmheUnRs5/21X5T23nGg/xfKetcg/CANfm/z?=
 =?us-ascii?Q?lIitsz8/QVO6sa5MsbuTw5dKvLff0E0E9JMTXxBVeWE29kawIC7VpNzIv4D8?=
 =?us-ascii?Q?KEQ19Te47NeacipZZ5bmy1y/r8upcTdnufK83OAyh0wsPtcsbcnB3NCGLtwo?=
 =?us-ascii?Q?U/5ox9pB8UXv9EqVOlN10iat4lxlkZhvDYrOkmdhJPQrwCVcqhqlbNx9Z3Qp?=
 =?us-ascii?Q?FlrxtwhjsXglvwcf/D1KAjbaW/rp7DBCmCQ68uxwFzsXItRs6yHZn/CK9qtt?=
 =?us-ascii?Q?0B3B6PkzMbR9mWwL82ZBFos+GOe/A841pJZEYG/PP/a2+CLCvhzw2i0+2P69?=
 =?us-ascii?Q?AzMMwV7jhibTV7bLqPIAXDJT1mbUVFmmNy+2uaaFDkuifL2/eB7xGzYNuieW?=
 =?us-ascii?Q?lxVh93pIa7m5YC6MOZcW+Jyzg2T5IRCReP/rdn+YZbkqLxql4V9+PkRAztAN?=
 =?us-ascii?Q?uEBcMHiUvQlzcjT2Lvyp/cymLKZOafOjuJtQpiA+HeMsm9RsUQGranj8qzKq?=
 =?us-ascii?Q?3VRON2BFeA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hXUHGrpb3PSX7WavDxG2rs9IJP8mZst2qEjJjmuEyUa1rsQHUQBrliQyh4ljk8AqbT1XmtVKNckmMzjjAwQcAGGgiIu+YcDEfbZIn44moEsEu91ikHgDxh5DFJu1R9lEsD8K8Vw47bNaa+YA+GstVgertnh5YjVM1ND7IUwcnKBbHPvdjiNGl2O0kMlK8iy+oDxW8N+a06UpwgrEyzcDORhOcHsmKkl6ATt3+ZecQOQarZv9/7P9ZZE2ZhZW3L2MCwAO6kFCF9E+ZWhXZFio+Xpua/v49nJFPE2dxycbTW8QlYPKs3cAKT/Ijp59PF6IRjC1Ds5M+YKgew9gJdXmVveo9821FZ9QmrRoPW4OxJeJwqeVkj+t5QzV3O3C38JptoBt2SE7aZbSj2r7k8al6CgfaM6Aaiq4FKQgaG9AxUuSN6LkKCeUPK5a03ZGhOCBFyFvLUs9nVN3OLEcWagE7PMCI+tof2pJ0IfhUHiejohjoAm+8BSkOCOdC3qrdFunqlWIO9jnzY//Z4dRDmF6lrMITlHQbd0C4M0lsLcaZ8vdN9cglxs6ZUnzSZss9Lz5grSWIeKpb7d6YwfmtWYVevmoPBkT0aMUQAt707DwldA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43337f45-600d-470f-990c-08de70e6053a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 01:10:36.6777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gz/TwQeShDIWNyMGN5/oYcy0NYatT6vsBODONxBCNsW7PiyQfgCjnS6eNBnBRkhYsDyi1aDX1HsxXWANCdLvoMrQnSA/KScMVAiDLzs+zMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_04,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=819 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602210009
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIxMDAwOSBTYWx0ZWRfX+XcO36+AU6li
 NA1I37e+Ospl6lFRSqebwJ7UnJC6rRQb16RVNF2MG5rpsgCTKd28JYAZMxCzRJGoXR9nDKBzeFF
 n3ALXB/4ZqcgwJ5bQvFo2HHjMmLU/vCeWMaNIjKSRjqYslZ/V/KgjH3B/9e2No+OlNB2q2uOrsy
 p0K9Fkefctq5btAJH0Y69osIcVYo06jzmcW9F03F5yQljx7wT+/e3cjZcpHl43YtLEX/Kj0Qjn8
 S8hlUKeuMGz+kgypam9UGgK/pClLwxR6IKEjYYQi/HLZ+28mIrwSLiDoMoTPOnDzuOmp24U5398
 wMqoipWMzSL7vB/XwYbFIJBb5rGE0mQ/Pj0cYMCFQhmhGdyLzkhX+tPyDgaHJHA484+w0GsKe01
 tWfZipt1Ze2/EmS+waTlEjUrTPKJ9I9y/ASZno8ekQbnTi8lfmQxKnMkHQh/KLfIBYp45EJT9nZ
 gYo1yDSzjzA/iRp+VCA==
X-Authority-Analysis: v=2.4 cv=Saz6t/Ru c=1 sm=1 tr=0 ts=69990612 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=4JmqA1W4QcCAGClpA7MA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: mvmyr1OzK9P-kMqtjzcjV8G4d81oL_QB
X-Proofpoint-ORIG-GUID: mvmyr1OzK9P-kMqtjzcjV8G4d81oL_QB

We will be changing the git hub repo name for DTrace from 'dtrace-utils' to
'dtrace' in the next couple of days.  This change is long overdue and is made
to better reflect the actual name of the project.

A redirect will be put in place to ensure a smooth transition so the old URLs
will continue to work for the foreseeable future.

So, after this change, the official repo for DTrace will be:

	https://github.com/oracle/dtrace

Documentation etc will be updated after the actual repo rename.

	Kris
