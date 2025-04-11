Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570F1AD24
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744404531; cv=fail; b=nwY0U7BT9XabcRENNrsc53B/iQh1OMhd5srCu+UCllYz6qaLLEBmjN4q4qI0uhjfblZykWGFd0r3eajRyHgTpR0x6yxMYAEV6LVi8uQF19sDsuYCK4k8sSSndz6Gm9hytKbh+Dnjbli9PSYnM42ZceSJXTlKfWYRZ9IRaKVy22o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744404531; c=relaxed/simple;
	bh=EjxIvNNvnJ1gdVEdvmyYnwbR1yH2bDi6JIkdSIL9xfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GoT0qiM4I782dFmKmCJF1+CDHYUJpJh2dBH4BeY/1G/5BybU2n2AeJLuJucFRrEbJjFlrcJepdENiVuN57btmJIQdDJAYr9Q5yGKiyHrOFzWXltWKMv9OXe6Af3mgTE5z8rAQZ773E8chcfX+H635J8rUe1P7jlOViDu8G58src=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QNRn+59N; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IA1YiqD3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QNRn+59N";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IA1YiqD3"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BJGZ8h006062
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mSdHvGULz4S7h/3XiL
	ZK0se501aXH6+qpiSoSjx0aNY=; b=QNRn+59NGIaAVbnecJlgEHZt7uOpurlCCO
	rcXrOK2nwysSFDUbKtwd6fxEooU0+2bsQ3qZmhIWnfIWm3ZlS0DXuXCsXg51Zowt
	NXDmov0zKVr+ZX4/ZpJG/MEmJFhyQA9QRmBmAIHo94JCpyJKzfhpeik7PQJZiO8W
	dMCz7aGqMvmH3Svdfo/56YT8RLv8qHX/w9BniKBtWMZvfmr0pUq1HZjDKFhuZvJp
	EgIhWdS98DQQ+vcVtSxow+0eu5xo3y6NxvnjoblAaoTCpOYdTyAwz458/EblP1T4
	ufnLqtwixrzHY/PuPSZOH75ky8v4wu0EHn9NLyNdnjnGwSZkFJ5Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45y93m8514-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:48:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53BKWJui013750
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:48:46 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012033.outbound.protection.outlook.com [40.93.1.33])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttymhuqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Apr 2025 20:48:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsH01eZ0IQ7Vvh64wg9+CEWNFt9+ddSPnk+CqYV63N/waf0+Xo5QBwxKT7bfxlydJKysTYFDmyXb2AZ/zC2sOCwFsK6yrRyjSV/SgvejQsJheiJeHiPPOyBEp6pHr4sASQR/zwGD435/ucN6RbzRywkEYWRuzjc2Y5h799YxTh/zkGliGusPndfbw2WaaPQ+3tHGgJTOgpdmLuPbPYhKKlFKQSSUOooOu4hDPCXzd1U6JVahDGrgNswL9cgw+b5c0ZbZOQdyc5iqantePjUa+uJl1ZNaOH6Dtst672x6E5hNEtzEsRPDYsNgVCE1Zfsne5PzgxLrlYB7eiAtks8bhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSdHvGULz4S7h/3XiLZK0se501aXH6+qpiSoSjx0aNY=;
 b=b5KmZ1zGexZThuyeVFiT4YNkl9hu4498YWqPuG0OouHkwMunqz5ODJlB53yiDY9ieL9I35rRoocrZTnm5OLjuGdWcxz9KUDXkNpQ4WGbZ3UgoIIyt4P2kr+mPmUWyy6cD5Fk5Dl1q0snQOKBrRROKwYmqYus5gpLFKNmMkXI4cUPrXNHF5gGr/3ToHb7rdB4EBRdtPXiIxd/zs+ym4Oqi3EyMe490/oGKOb4IEv7IscS0lpcQY09xVzRjsM2GsTrqprBP7vPqbwxEpyrs8R/QDchwLLsdRqt+MOGeG6ZY1BG2Lh8ZUyMkTobaVOkzD5ideluT/XWECkcfZWQ3mOhYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSdHvGULz4S7h/3XiLZK0se501aXH6+qpiSoSjx0aNY=;
 b=IA1YiqD3a9wSJ0C7TgybuT4DcgCM3PwNRJ2JtrYhLIZY3cvfpxHJ7PN6BJsm3HXOCzs8xXO/CZKZrG6rpAO6oan3ajHV2FuEjrOZaaBjM+1oyCb5+trvPaXZWG7NExCBtTZ3c33B6KzAVIf0myfi2qxVwQ1FzIsovY5jXQYi5c4=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DM4PR10MB5991.namprd10.prod.outlook.com (2603:10b6:8:b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 11 Apr
 2025 20:48:14 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%6]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 20:48:14 +0000
Date: Fri, 11 Apr 2025 16:48:11 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 2/2] Clean up sched provider trampoline FIXMEs
Message-ID: <Z/mAC5DG2gl0W8Sn@oracle.com>
References: <20250403050252.15239-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403050252.15239-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DM4PR10MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7004da-553c-4535-3f89-08dd793a2db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CvDo1SPHTblw7KMeyLN+e4HIvLEMEJUWCuK69DPxCnrYxfrd3cI5LgfiG8RY?=
 =?us-ascii?Q?rq7KsWqtG/EEFpmDbiQqjFB1MnRuuziitDR5CqGlUG12yeYxFRLobSTHvhQp?=
 =?us-ascii?Q?DtmxAy8/TENelqQeEAYr7p5hG3eKwN6CdKzs+U3txr29GLIKJQvjqKYhDXi9?=
 =?us-ascii?Q?HC/7DMAO1aGKPyBcR1rpflivLI6X7WeLSnhuNkGu4WySQFrgK1rcQ6iOcjfY?=
 =?us-ascii?Q?rUbFhl64kQNkQ7hvIPK/TxoInwMi78XspfFWdJWnIsSSn3Xw3rhzM3XD+/F6?=
 =?us-ascii?Q?u8u71OuSat1EWRgSbLky6lWRXcpyw7rnKulVWRcQa+LYBV68V/bbm+3TYkQo?=
 =?us-ascii?Q?rTaxQ5nrzq9MNIcDZfxpe42uALXM96qZomgUGVHrLJOhvqXfEfMbaLUMtRcD?=
 =?us-ascii?Q?RiX+TOJVN1oM72QbfdDwsHXk2E0tcv/2LbY+UOn7XgegPa8Ld6ypr14N8/g7?=
 =?us-ascii?Q?LxBUvB7y6v+hfRrBYaMK/QVw5Tke6pDyQl+TGssT6Oqx74TK7pnjKR8B0H+C?=
 =?us-ascii?Q?nklo5us6kAQPU3nYBld0VCGGDTxGhgYfCdPWkfPxV9aXwd+/IxEQgw2Ej4Mt?=
 =?us-ascii?Q?oaePwcVbFPGH4M1ACKV3SREpZSpM58uumRPTRCawEtBE5m5zY+9v8WUTEqdF?=
 =?us-ascii?Q?a56X3hnCpguB4o6jpqbwYeiirc4lbgD3JvshaHwh4upE7x4IU//mlFNwqz0t?=
 =?us-ascii?Q?F+cgehf0/5ruRPgIVeHQVHtZifezHgnSK7W0cyoq2CHuverXAh+vHKVLEOec?=
 =?us-ascii?Q?5bGs7PKHild5s/Zch3/MIb7fxjSWcct6+gbqXnnmbYpVxm+dGJuebH7ctwtd?=
 =?us-ascii?Q?jYqq8QZF6v5YwJnmFGjqQdxnBB4Hdx0bELdhRoyMOVOYwcT9xsygg8XlhD1M?=
 =?us-ascii?Q?h9VjcmYXMAJ4qHZg4vgyA5NxrnCFYQqQ832knxwmwL5GltUA3ndOg2zYGuZh?=
 =?us-ascii?Q?5zuy5x9ffvyyeQF648UFUu8QTMpzWmVNcXeEcUNNZOVpm8vB5k1eQClwheyL?=
 =?us-ascii?Q?484i24w3PID2ANEr20MWCb1xnKiz0hq9iuSvMuJvBNhFlp4qKpCV2tH1zVBl?=
 =?us-ascii?Q?CgJi/Sg71AlcvDB806xoHkEB2LHqwHtLcCpRrNz8lPBB6kIUcFK7Pgm4CNj0?=
 =?us-ascii?Q?zj8kcDtBWeM4hj1nEeL/DCDyqvNXzXT9omnXqdfVDVmm/uu6FFD+BSTe2yAx?=
 =?us-ascii?Q?t5b6FU9l0m+6n2cMJb1xh5mW3Vm0kDzh1AmNPs6u2/ZHbtMRxHhu7edVc+Sq?=
 =?us-ascii?Q?DW3pvLPSjIjEC9Bc8yq2mocuHQOz49K8JmBycVGYFZG3WXdoxWFSh/Miqm/G?=
 =?us-ascii?Q?hnwxkjFbzeNKpwK32Io2OdwYNLua2709bmOtbONY24/h/kgD0ByB2Css0XCS?=
 =?us-ascii?Q?NuwvfegTZmCDmMGGfMzSWfe7qdaV7Dgl3503N2tf3AWrvl8PKx1/0SB1ZZfs?=
 =?us-ascii?Q?TuO29u4YeSY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vMxy1/qjSLwN1Qtrwt5eRE75VCtapGyMtCx+Q3wasnBsygbbCznwUfpfviyW?=
 =?us-ascii?Q?+cPni3e9niZe6gDKp/sKjXH0yGiMeVTo/wrlduE4v+JtVQ0aPPiOfs2HawEz?=
 =?us-ascii?Q?50IUfn6A1jnpKCE6sUXnLiOg7u26b/Q2/N4f+szMmy8mGZKfjcV41gBUbLVQ?=
 =?us-ascii?Q?68ieiZe3XjFWqH+NEGAKeg0kQKezbseehseKaWLkg2vP51fF9fGxwe9u4MzZ?=
 =?us-ascii?Q?HhBZkb5vtFDcaiCUxAS5DmeNdRN/JuLAkhSynutTd7Lka17DY/C1loSYWWb6?=
 =?us-ascii?Q?qkAgH1P0ijyHrgrAHGnyb+ZQXr+GahDytfG+YZu7pdQk9donje2OvYZOc8go?=
 =?us-ascii?Q?YbGOAVT1J+WbNItywwYUHzHZt5v9iEDsz8t2iLsiezLUURPZrdhnr+uksZw8?=
 =?us-ascii?Q?bRE8iNZcSGR1QMBPSVRIAt66Tx+zBCYaXG4GVf9pch2BmJ9fMXJhDXN/PSQr?=
 =?us-ascii?Q?Fy+6b+HoWhCwFBH9Kvo0Dk/9P5kK42AUiLDDJYBCab09vuShTJuwgVbPcXml?=
 =?us-ascii?Q?QP+Pwpa9C65kB7Tjh9gwyfKm5tbsb4IIkgg461mSRcjlmCApugYq3O1zIeKm?=
 =?us-ascii?Q?g4Koal9P0NR3T7YK6rDKU7lXUNe8GiY3LAN5vPws1uJJIyUnEHzFvotYoJa2?=
 =?us-ascii?Q?d92YcGqGa2m2MOVobUsNQmvcAfcaHue3fvdNJQ00i3sG21Fz2N3iO1LSGMS+?=
 =?us-ascii?Q?F853a15a9itunNCtgtGK/Mev0MrZXGei7vImgoUlHaE9fyhfmOxLYMdnntYc?=
 =?us-ascii?Q?Ufp1hYKuteyrtN4wOHUtH0ySYPjBYWHspRi16gYJf4Wp/31NR4460OBKKMZs?=
 =?us-ascii?Q?AXQVNcSXnzD8EBDYQ5c235zks7sovSkIyICpCCeX8Zxt3Q4240zx5dmKszs7?=
 =?us-ascii?Q?9bYjY5yh4wTwjHyvtL4DJgcFrlOT6ZdYEk2OSU11mq+KI1uXBRTCUd5OdkDB?=
 =?us-ascii?Q?BrbtfxMIa7gjAuD6afZhsdvszOZvKjbd25LDp3MVdmSGkV1j4QuOLJ1U5Kr6?=
 =?us-ascii?Q?LAVa6rH7CsNfZB7PupRjfWTY/wnBawH0ppD3WiX3JoPp1iW1qsZap+2ZeWuH?=
 =?us-ascii?Q?g9Fwv7juZqUNtfsDUrGyoYBa5EjcmCZWj7HxVvfqFzguJI13wBZ2uww7+j9Z?=
 =?us-ascii?Q?yglOsreCm+qxVnDGjLmhwJdHzP27DHr4yV/am2RqIR8/WTtJI07omY337PCX?=
 =?us-ascii?Q?QmQWVoPEfSeUDZni90GTEJEeJW+Z5NBf/ddm6kG/TpfAluy1jyDWwxevWzp5?=
 =?us-ascii?Q?9RVgyIna2CFoqHmFSaGRF7ZWbPR8Q3XIkErCBxuNgsbMdFuTBI+mFOEgphoX?=
 =?us-ascii?Q?ZJuXvq/+dXlseoqw//J3NlchDcYrXnFUh4a94lzkEMPXnJwZtc2ie7wQYM7C?=
 =?us-ascii?Q?PaBWHTAelRdXKEKxYi8ti2xbSkcpVNJGe8RtHFjsdoskgv/3l2o2ofq6J16R?=
 =?us-ascii?Q?sEAhwTgynb/OB+Gfl0/bWK71wFgD4hlMd1HezBrvTLKjzbZcOiQ/ujYuZsYy?=
 =?us-ascii?Q?NUzuXylIsSY5Ry63EYM9GfkQjWIHiiSaqCl2LiTYB0VhOr+yS7Meu4CUBY4n?=
 =?us-ascii?Q?miyrXSDb2aMBjEhlH5emfqB+EnVT4yh1ISuW7CZR1JVkYS+VjRoTQ7EcAF6w?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MWtVlf5bKdszwxs5DHyfaUbiYsdEjfT5LUwnegjYS845TW4jNaX15SW5sDKBO1/3IZEcFTEQh64deR9mLRtS+nE/7KBnkNgxeGvsT/Qb/lRYaDxTxW0Xa3jGCuTx4cS4hzYJgL8hgDMOWAsDys5gY3WHwJiaUbSZnVZczpG2gvL/E1Vk+uzLAUXWGC/Zotn1nfa3Ql8cK+F87B27RWuKv9HVlcaxaXodvj3mOnHNyt6YJNoISoe8EH7YvhnOwXSagL21YZib9X4TooSw96KkDsUHFzYl4v6qrWTGwUNPRwHsn0PBievK35MrEtbdLidwMa7FPKTX0M9TjfUbp7HPp6TCl/QoWlYNyR3F/8rMjz30hN7ICQ3/Es4nm2pRD/pi5angFBH93z5qBQ6sEIr6c9cNFYQB/VCn8qtpCLGmRd6OhcQNWE+XmBhuxewBvmrkhA8P/t04dnTREflITv3NmTKqRSDWFzdylHYdoHTx2XjD1H2SRlMotYncuxSidA70fGKgGQIuu67JHQa93Er+KU5/1Er1LoT+kiptWex53Za2WC+zsidxuex5oc8OFWZEz/skoDAcb1Wa/hUF84dB91/J0dySsxa7NPFse06DwzM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7004da-553c-4535-3f89-08dd793a2db1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 20:48:13.9533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJIx1K/NxKRrWuePKXhyjJHBUbDiy/2qBZJeoQ4S15Acq1pEx57okIZxZDVNCwrLm7F2AUPq9sBw++CSQcpbFQ1+RdIU5B97WWmLhSz9LhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5991
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504110133
X-Proofpoint-GUID: 9oSqVyuWVTlyjzFHIiFWfWmVXtYsoH6Y
X-Proofpoint-ORIG-GUID: 9oSqVyuWVTlyjzFHIiFWfWmVXtYsoH6Y

Partial comments below (still looking at the provider changes)...

On Thu, Apr 03, 2025 at 01:02:52AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The sched provider trampoline for enqueue and dequeue probes had
> pending FIXMEs for providing a cpuinfo_t* for the cpu associated
> with the run queue.  Implement the missing code.
> 
> Since the cpu associated with the run queue might be different from
> the cpu where we are running, it becomes necessary to access the
> cpuinfo for some random cpu.  With Linux 5.18, there is a BPF
> helper function map_lookup_percpu_elem() that allows such lookups
> on per-cpu arrays.  To support older kernels, however, we change
> the cpuinfo BPF map from per-cpu to global.  Also, it is a hash
> table rather than an array in case cpus are not numbered consecutively.

I agree with all the above.  Good solution.

> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  bpf/get_agg.c                     |  2 +-
>  bpf/get_bvar.c                    |  2 +-
>  libdtrace/dt_bpf.c                | 34 ++++++--------
>  libdtrace/dt_cg.c                 |  5 ++-
>  libdtrace/dt_prov_lockstat.c      |  4 +-
>  libdtrace/dt_prov_sched.c         | 74 +++++++++++++++++++++++++------
>  libdtrace/dt_work.c               | 20 +++------
>  test/unittest/sched/tst.enqueue.d |  1 -
>  8 files changed, 89 insertions(+), 53 deletions(-)
> 
> diff --git a/bpf/get_agg.c b/bpf/get_agg.c
> index c0eb825f0..e70caa6ef 100644
> --- a/bpf/get_agg.c
> +++ b/bpf/get_agg.c
> @@ -21,7 +21,7 @@ extern struct bpf_map_def cpuinfo;
>   */
>  noinline uint64_t *dt_no_agg(void)
>  {
> -	uint32_t		key = 0;
> +	uint32_t		key = bpf_get_smp_processor_id();
>  	dt_bpf_cpuinfo_t	*ci;
>  
>  	ci = bpf_map_lookup_elem(&cpuinfo, &key);
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index d372b3445..d81c3605f 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -67,7 +67,7 @@ noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
>  
>  noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
>  {
> -	uint32_t	key = 0;
> +	uint32_t	key = bpf_get_smp_processor_id();
>  	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
>  
>  	if (val == NULL) {
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 6d42a96c7..d6722cbd1 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -761,37 +761,29 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
>  static int
>  gmap_create_cpuinfo(dtrace_hdl_t *dtp)
>  {
> -	int			i, rc;
> +	int			i;
>  	uint32_t		key = 0;
>  	dtrace_conf_t		*conf = &dtp->dt_conf;
>  	size_t			ncpus = conf->num_online_cpus;
> -	dt_bpf_cpuinfo_t	*data;
> +	dt_bpf_cpuinfo_t	data;

Not sure about this, because (see below)...

>  	cpuinfo_t		*ci;
>  
> -	/*
> -	 * num_possible_cpus <= num_online_cpus: see dt_conf_init.
> -	 */
> -	data = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
> -			 sizeof(dt_bpf_cpuinfo_t));
> -	if (data == NULL)
> -		return dt_set_errno(dtp, EDT_NOMEM);
> -
> -	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++)
> -		memcpy(&data[ci->cpu_id].ci, ci, sizeof(cpuinfo_t));
> -
>  	dtp->dt_cpumap_fd = create_gmap(dtp, "cpuinfo",
> -					BPF_MAP_TYPE_PERCPU_ARRAY,
> +					BPF_MAP_TYPE_HASH,
>  					sizeof(uint32_t),
> -					sizeof(dt_bpf_cpuinfo_t), 1);
> +					sizeof(dt_bpf_cpuinfo_t), ncpus);
>  	if (dtp->dt_cpumap_fd == -1)
>  		return -1;
>  
> -	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
> -	dt_free(dtp, data);
> -	if (rc == -1)
> -		return dt_bpf_error(dtp,
> -				    "cannot update BPF map 'cpuinfo': %s\n",
> -				    strerror(errno));
> +	memset(&data, 0, sizeof(data));

Do we need this, because (see below)....

> +	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++) {
> +		memcpy(&data.ci, ci, sizeof(cpuinfo_t));

Do we need this, because (see below)....

> +		key = ci->cpu_id;
> +		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, &data) == -1)

Why can'you we simply do:

		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, ci) == -1)

> +			return dt_bpf_error(dtp,
> +					    "cannot update BPF map 'cpuinfo': %s\n",
> +					    strerror(errno));
> +	}
>  
>  	return 0;
>  }
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 6dcf4cd3d..d83b1c2ce 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1243,9 +1243,12 @@ dt_cg_epilogue(dt_pcb_t *pcb)
>  		} else {
>  			idp = dt_dlib_get_map(dtp, "cpuinfo");
>  			assert(idp != NULL);
> +
> +			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
> +
>  			dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
>  			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_2, BPF_REG_FP, DT_STK_SP));
> -			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
>  			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>  			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
>  			emit(dlp, BPF_MOV_IMM(BPF_REG_1, 1));
> diff --git a/libdtrace/dt_prov_lockstat.c b/libdtrace/dt_prov_lockstat.c
> index c73edf9be..8b2cf4da2 100644
> --- a/libdtrace/dt_prov_lockstat.c
> +++ b/libdtrace/dt_prov_lockstat.c
> @@ -121,11 +121,13 @@ static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
>  {
>  	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
>  
> +	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
> +
>  	assert(idp != NULL);
>  	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
>  	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
>  	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_BASE));
> -	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
>  	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>  	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
>  	emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
> diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
> index 3a218f3cb..a548e679f 100644
> --- a/libdtrace/dt_prov_sched.c
> +++ b/libdtrace/dt_prov_sched.c
> @@ -84,6 +84,40 @@ static int populate(dtrace_hdl_t *dtp)
>  			       probe_args, probes);
>  }
>  
> +/*
> + * Get a pointer to the cpuinfo_t structure for the CPU associated
> + * with the runqueue that is in arg0.
> + *
> + * Clobbers %r1 through %r5
> + * Stores pointer to cpuinfo_t struct in %r0
> + */
> +static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
> +{
> +	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
> +
> +	assert(idp != NULL);
> +
> +	/* Put the runqueue pointer from mst->arg0 into %r3. */
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
> +
> +	/* Turn it into a pointer to its cpu member. */
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, 1)));
> +
> +	/* Call bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT[0], sizeof(int), %r3) */
> +	emit(dlp, BPF_MOV_IMM(BPF_REG_2, (int) sizeof(int)));
> +	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
> +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
> +	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, 0, exitlbl));
> +
> +	/* Now look up the corresponding cpuinfo_t. */
> +	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
> +	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> +	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
> +}
> +
>  /*
>   * Generate a BPF trampoline for a SDT probe.
>   *
> @@ -98,18 +132,39 @@ static int populate(dtrace_hdl_t *dtp)
>   */
>  static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  {
> +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>  	dt_irlist_t	*dlp = &pcb->pcb_ir;
>  	dt_probe_t	*prp = pcb->pcb_probe;
>  
>  	if (strcmp(prp->desc->prb, "dequeue") == 0) {
> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>  		/*
> -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
> -		 *	  associated with the runqueue.
> +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
> +		 */
> +		get_cpuinfo(dtp, dlp, exitlbl);
> +
> +		/*
> +		 * Copy arg1 into arg0.
>  		 */
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
> +
> +		/* Store the cpuinfo_t* in %r0 into arg1. */
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>  	} else if (strcmp(prp->desc->prb, "enqueue") == 0) {
> +		/*
> +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
> +		 */
> +		get_cpuinfo(dtp, dlp, exitlbl);
> +
> +		/*
> +		 * Copy arg1 into arg0.
> +		 */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
> +
> +		/* Store the cpuinfo_t* in %r0 into arg1. */
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> +
>  /*
>   * This is ugly but necessary...  enqueue_task() takes a flags argument and the
>   * ENQUEUE_HEAD flag is used to indicate that the task is to be placed at the
> @@ -120,15 +175,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   * outside the kernel source tree.
>   */
>  #define ENQUEUE_HEAD	0x10
> -
> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> -		/*
> -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
> -		 *	  associated with the runqueue.
> -		 */
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
> -
>  		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
>  		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
>  		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 498d5332a..2167ed299 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -37,35 +37,29 @@ END_probe(void)
>  int
>  dt_check_cpudrops(dtrace_hdl_t *dtp, processorid_t cpu, dtrace_dropkind_t what)
>  {
> -	dt_bpf_cpuinfo_t	*ci;
> -	uint32_t		cikey = 0;
> +	dt_bpf_cpuinfo_t	ci;
> +	uint32_t		cikey = cpu;
>  	uint64_t		cnt;
>  	int			rval = 0;
>  
>  	assert(what == DTRACEDROP_PRINCIPAL || what == DTRACEDROP_AGGREGATION);
>  
> -	ci = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
> -		       sizeof(dt_bpf_cpuinfo_t));
> -	if (ci == NULL)
> -		return dt_set_errno(dtp, EDT_NOMEM);
> -
> -	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, ci) == -1) {
> +	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, &ci) == -1) {
>  		rval = dt_set_errno(dtp, EDT_BPF);
>  		goto fail;
>  	}
>  
>  	if (what == DTRACEDROP_PRINCIPAL) {
> -		cnt = ci[cpu].buf_drops - dtp->dt_drops[cpu].buf;
> -		dtp->dt_drops[cpu].buf = ci[cpu].buf_drops;
> +		cnt = ci.buf_drops - dtp->dt_drops[cpu].buf;
> +		dtp->dt_drops[cpu].buf = ci.buf_drops;
>  	} else {
> -		cnt = ci[cpu].agg_drops - dtp->dt_drops[cpu].agg;
> -		dtp->dt_drops[cpu].agg = ci[cpu].agg_drops;
> +		cnt = ci.agg_drops - dtp->dt_drops[cpu].agg;
> +		dtp->dt_drops[cpu].agg = ci.agg_drops;
>  	}
>  
>  	rval = dt_handle_cpudrop(dtp, cpu, what, cnt);
>  
>  fail:
> -	dt_free(dtp, ci);
>  	return rval;
>  }
>  
> diff --git a/test/unittest/sched/tst.enqueue.d b/test/unittest/sched/tst.enqueue.d
> index f445ac843..28dcace8c 100644
> --- a/test/unittest/sched/tst.enqueue.d
> +++ b/test/unittest/sched/tst.enqueue.d
> @@ -4,7 +4,6 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
>  
>  #pragma D option switchrate=100hz
>  #pragma D option destructive
> -- 
> 2.43.5
> 
