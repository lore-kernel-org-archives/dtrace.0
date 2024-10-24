Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D151F8EE3
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788771; cv=fail; b=IP3ngBenbcPS+SGxnp2Rb/e34u8TZMu0P0N0sFNer//E3n9eDTnKXnUlnvWdExLBjGcj70+nsKz8Vi5+BgQQ6UuSSAHmwgGh3Ah3F/MBPhTFtY2hN3MSzjjmjllumAdd2t9wFi1hMMQCPe2WNOb+dGYvo/HTBKaWjSmQa058Q5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788771; c=relaxed/simple;
	bh=rZ5lgd8eeEjNIwVg/9fSUFWsm+QiXomKQIRPIYXml/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nLGcCQfml9QcX6vTGhKnG5ZilIk9CuE0Ad9UHNKxGPE/1/kVDzQ67zq753wCRSV3ReGw1zX9TCY7iUqgHp/VDtiQE6GLMKJvC9Q2EBoHPx8vefDG8REl2fX3X4+8IkH1jKp3VvZC9hMvgHlq/6wY9+EDzxGcLkF6h4ZQYhJPIWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VFU6FQaX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dWMcyGFS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VFU6FQaX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dWMcyGFS"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OGoYsR013786
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=y7eeaHFvJdPqtj+u7H
	3jwAeWyKvDW+U5bINbkmWTE6M=; b=VFU6FQaXJxd2IPPIisfGuuhU9zn3CqVIAn
	V6yANoYiHE/mq25iJCeIsgAzNEK5p3fQzVNm5EhpFt76C/OgaiSplsimFQJQ0O9+
	GkWiXFKYWaJ71fTFTjgdCNHCQhmWFs6INoEAKBEoL3LmNI98XNVGPh4Mx90x0EwU
	y/AC5205ngKqwp2PyDrU6KSQT/YFuAecAAPXjwmWVwGqi8DMuQpKRcsZNWcpFoEn
	JYnUu69U81ohOsRhfcyNWXNUKP8nz9lylhIo3rA3xl1dMNw90eahfdly3Yh/S1z6
	qTu+kw9zfE6bOQl50UX4HX5oUf11vR8Th6VnW4gJl+NqRzlsCaJw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c545b99k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:52:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OFUp5b030915
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:52:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh37r74-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:52:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfNpPJ4L+AA2/va3+tIOY1QhO3eXgvOsD0j9Vjcl/+MjAQk3+STwrpLA6RthtgHKFgRekfd/1uuk9gf8SM70Dfb732zWicfV7w9WMPJGNdTnQ6vZiTOFg2NrmXR5mRtGethdVvtXMdRF575wXCHd1tpY5Vb8mEx6VvpKViinFq7l3FMGKjcnORjx6muIatnn3x2ZfaJWQY5eL8dCdTKK+mIyK3k971Ph169FuOlq2sAY0sJNCJZz0qTopZH5NcY/spgAxPWZYGLKvZVn/Th/sd/59yIgA3quxIo5xSJ6V9BJE2EYYR1DsmqlCRhO+F4D0DCFcc0I4YAGtRvAidYvYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7eeaHFvJdPqtj+u7H3jwAeWyKvDW+U5bINbkmWTE6M=;
 b=S/YCWMivNYoX8Kr/t6zwhTlJO2tujUXrcq9eZtnPFrRCrq9CkZWdPhfc9eOQPOeDJB1MZasLv5xFcQJPnYAlOmIitVY3NklWsBntLBCVCunU0wpP2K2CS8Q5eTxcJVZQGeFNjUclOoqr35amY7FtfbKmPPK4yKKfuAP2x0lbTjUM5a3Ei0KuCyS0VPgHAmnkF5QCSdjnSdiq5pHGCkPRqiAHhUkiVkKOWAOcC4TtJ0AYpRwt59oTV0ogkOE6c+L8DcNhiDP+5YMFTA/PpDHHq4EudeAI1p2rWrIjf+9JxlejxeeUmkuHMhs6zajqEgdbKJO6fpYAXkbCDAv5l9nrpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7eeaHFvJdPqtj+u7H3jwAeWyKvDW+U5bINbkmWTE6M=;
 b=dWMcyGFS0EErmwsCxrS4VMkUwRr98dPEovp2xbv70jxADvPhh/IIE6bbywGP6EapGq9ZMgF3oXqM/hzjVksSGEAv0Gtfcnd7UAmnhN+P/6e1wWNWg5KCYt5V6e6szHfOTQUQuK9GdF+LpKcQdgAK51htB3qPiJtQ7aoTXb0lzZ8=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB4990.namprd10.prod.outlook.com (2603:10b6:5:3a5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 16:52:42 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 16:52:42 +0000
Date: Thu, 24 Oct 2024 12:52:40 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 16/19] Ignore clauses: use underlying probe's function
 information
Message-ID: <Zxp7WOa-OOid_LX7@kvh-deb-bpf.us.oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-16-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052558.3525-16-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB4990:EE_
X-MS-Office365-Filtering-Correlation-Id: 3648268b-4d4a-46e1-3f9c-08dcf44c46f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CjahDuaIKKs3J8nYQIw3aBSi6md1xv+5GVvZIt9vadjoVh8D0GlO2HieQBGZ?=
 =?us-ascii?Q?EkuPiHarjFRXNcD0gAwVkRinn/Pz0954pToh/qFX5EU+pQuNlK28X2HrGG7t?=
 =?us-ascii?Q?A2L5k56KaTLYOM45fMf/8+idXADXGf0vsVHGaKCjApnX1TV0NNdy9drPbyXl?=
 =?us-ascii?Q?plCel9V/rKxeUcEjtFV63OLH817EM7HO/+JYscwUDa2q6Cd/Y6O5dl6hTDSm?=
 =?us-ascii?Q?El1++m6Lhcj49OHl7ZIb0CfvqtolCZYpkQPyt0hbFQ7dhNAQkZ9vAI2FN9O1?=
 =?us-ascii?Q?X0NyhWNmWNQSgV5T1K96769+qBhU4pUVEv3rzFG2ftSiCVREhzqAPYD0lbS3?=
 =?us-ascii?Q?2k4IJ3j49azyFAT0kkBliEPwduFhbAowhBu+It9VoUfw6PIpovrVa3ApyKRH?=
 =?us-ascii?Q?tcUSbrUuokTmcFRjjRCmHOs7Ag7PbHeLKsBfugfQrlnJrm0Z854mRdgsGqPL?=
 =?us-ascii?Q?qfLrdiibP5cCZrvE1+6ADoi9bj+HrmSPA0n4UHn25YVqsE9+Q5+rdJ7Lhs25?=
 =?us-ascii?Q?pelZ1tWcKGwnV8zhM46YzixOMVWtP7r7G19W3yE/HZ5tC9Nd9cKdYx4D5UW9?=
 =?us-ascii?Q?died7DaPqYFg08M6qEwoFXnbWYvo62E6iuzoYGA6OgChUpEYgQkP03+xd3xg?=
 =?us-ascii?Q?JEBL1jrdPDBX/G5+dz3vyf13PvuEqCy2gFH6p/NQOqFBb8vA8BPOTGD8OzZJ?=
 =?us-ascii?Q?wpPYrtapZdfKEXw/4owg82m+8qFn4qrwJsmzj5sSMBK0l9FpSZ//EwwXBCRy?=
 =?us-ascii?Q?UrQaDpiWN9v64GLk3/FO0ZvZzUdSJvRaeay5xgVTYN75FoFXeWHnkjnIDhyH?=
 =?us-ascii?Q?5uztqjErySDtSzKGQ8A1cwgID+fTw8dBpvKyhYg/PDGpUyJz18mD6bxEvxpN?=
 =?us-ascii?Q?JfRtpu0hpmFutH3oDw+9jcgbetDdmtXjGRsu9n4Jua8UXcoEj+SrcFml/r88?=
 =?us-ascii?Q?Aa+Au9rMJbsigZ9+WgdHL5OFo1s5nwzjIiT/BzsZd69XCKNkTY9XBFEwBcIw?=
 =?us-ascii?Q?G0arIYxrXQ1gacDE7CxQF3O6OKz+UO8+UsdGtPmUDlXFU/t70wQD+lkPqQxK?=
 =?us-ascii?Q?3cVldl29WdicMyzpJYGWBrgTeUy2/TmySCPV6WZpxM7e5mAe5ygRzt55nMhF?=
 =?us-ascii?Q?1RIDVnw2VHkcNMcPOjlQn9GdIXapsbwKdWqFkJKtsU6BY3+93VoBkQlVzslv?=
 =?us-ascii?Q?4u6g185mIBJyknUauek6oh/AZ0I9o2gCt8lSD+4BIARlwhQjCwO7uqZrClAK?=
 =?us-ascii?Q?uWvPF3/sfLFhCzuegJ/0LL5PObZpBHqLR1X65rNuLDC60kCEqIze8vp+qN7y?=
 =?us-ascii?Q?02jI3ZOwC82r1soaClYzWWFH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?txBm6rKWcKDzAkLpjDAv8HUiH4f8N66bVoKGhEfsRiEm4KGCEb4HowCMIxPB?=
 =?us-ascii?Q?FPoBwMZP3zZpgRfGEwOIgaIpnTXVqy9p2bKSVFVGtpovpGm9ZNSqRTC8UP15?=
 =?us-ascii?Q?93IgAiS/vFe0Ce+xopP60PpNqFW2vyXso69tsinEcj7aQNkbP7sCU7EZmHYc?=
 =?us-ascii?Q?qmouC9CHa9+46+/7uJsSSuW8ghRDX3bIE7XpL4Au/6OzE10+7zrvz3ppK28U?=
 =?us-ascii?Q?UqtEVFjg1eG9ZB8IvqMF9OxTArLsuZCinOsDK3SllGdCJS1tdktt1LYjllHU?=
 =?us-ascii?Q?27j+7Qx2MFh9bMS94b5aiT7+9JziINOsuICxLX3MLZCGjpXyyQMbhWdn6wL4?=
 =?us-ascii?Q?qenT7MlA2S2KKC+mrpPMVty59P4HUJBSJ20ZK/AXCgBzBqBZ2bYu+A4LuUd9?=
 =?us-ascii?Q?ByOJGgCJ8od5bPfjHxZyymHWsJIKEFHtV7+CGTRwUopQjgRTidfZrUEz5oxX?=
 =?us-ascii?Q?m9ojBvUDCpRgyV/p1j2DKUnfcUdizopjWw3maLUSZvjDiPFXUdvk/OYXD+rz?=
 =?us-ascii?Q?c/M0tuUIQ/YFlnMh9WAyDcpURkKsKlZVI2/VmrmEw2YMscLtjLBd1gh1D6Zz?=
 =?us-ascii?Q?25i9gnmvNAswYco33/PP/xjd5D8DJHNMOIuOd2Wz7KBx8p29gFYlEbnJNVvq?=
 =?us-ascii?Q?o2xh8mcitqNidQxkD/6dvEU1PapZN5oECNloi5OOlJ4Tuq4x0vG5hQ6p0MDZ?=
 =?us-ascii?Q?0HcMro2VOdgZO9+u0gXZII2VJmIXeEoYs4GueaYDIndKsa9+ByIY87nnuHI/?=
 =?us-ascii?Q?JTbX5GakuPzMH1ph3hgOLAljbdEcjRe9+JMbDJUDvfLmNqGRUsrNxupUqhef?=
 =?us-ascii?Q?u/NAOBGnHFF7H1r/uHda/5CHIu2t1+O1yHEkTmO1sEX77cXzCA/AN+IujHH+?=
 =?us-ascii?Q?J6zTkrZNGJby09zkdjexdPo/GJhB+05ruGASOjn/7upX2KCtKcb/6sdOmHb6?=
 =?us-ascii?Q?KUBiA9mwpBw3jxE+tipwxDb48H8k+5gHVmVEezuZHQMoUD59fCDT48GVeQxG?=
 =?us-ascii?Q?+IWGkvi2+Tcw63yalIxqs2Mp1jmtvEbndTkaYnGCW2Z/qMXCWso6JwJcshsH?=
 =?us-ascii?Q?15WXV2TIyc6ZH9dsCNIWpLEifZ4lPNumOX6dP/gRH8rg5fQyxoeErfYeL5tU?=
 =?us-ascii?Q?LMxf4TY5xegl1+ERRzCxnNNEeQFKwvFbxJswIAipZ32SQJ4ZTUYmrOUotJi3?=
 =?us-ascii?Q?LVEoFejP6xksrTQSYP6w05GkovxshRqI584Kzb2NP8Fv01PAlU04MGC9VPq6?=
 =?us-ascii?Q?PspQ50hy5iorT4Z3ie91wnn7NO+JfvluoVIsa+Oh5jKG0xOtYN457R1EZM5C?=
 =?us-ascii?Q?+eoYEjWkEc7I3/d+Ja+maogDK/KXzOJB+7d6cJI3YFAZBTpWiZZ+XppXP19y?=
 =?us-ascii?Q?NEifF4L7PARgJgMnBGpk3G43WfngjxBG2+ACUBmKHlDVxBuwelkRTHhF5oTI?=
 =?us-ascii?Q?t/0Q1L+lV/2tabydBFJXAxSRoL3f9Pmj2gWjIBm0FxIHwHEhr9eN5V1d/mqi?=
 =?us-ascii?Q?nGhb9tmgzQV8C4H/VV4Vut2jNjfJ5HH/drld5veHO3Ui9ZbYrw3a1o02Pf7k?=
 =?us-ascii?Q?vrZMKKx1QekXuArVJrBvgSb+Yb9BaCIKVFN4/gQe8jJ4Fo5xc61YL5OmBQHZ?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l6zcQ/GxLDDlcmvf0y4B63LgYDz8YpL9dit9WuDI0D1NDqalOGsDsMOQ/QLKkI2Ggx56mDff9DmACqDhZEmzaVe4xL0GwUFtgyNROzGI5iN5wRMo8Qqy6HFNSPLd5i3/nyw+92MM8cVmrTsAmliSZhGIv4o9pAc8BR9w1cSxCfaJg/64TIffoAyve2iOHzf8eo8+o90rr2XqqlqoIsECq8oyLdtdH+Ef4zWZotV74Vi3yPvs8psm5oI9umOT5rW92a6StMPd2FTk3oiqPLvJdR7y1DIYZCbvw2VM4G/ZhViumZ0STjJOxhmfbuoXVcFDpczuFxX+l21VHPk5BBeUzskhliIEfazmpor5z7BvSWhUL8TkHF3bmsWLNl49THvvOfnhDlqNayUbRiZ2XjjBD+kcJ2Cx3HPeOHCDBM6Q3pju5X9tZFtXdT7QbP8eo6lp7tmwN+QzVGRVaD5apGzg7HHlaSserXDHi1Oc1LIweThOGH12NA6tVvg1xKpKzNUXlRx/fe19UER44mdt+Pt1WhAxqZZy/g7H0G+cqn/Ti2eYZABXLGPbkhsbAd2J2l3kGYrOlzzLnrAJlEw0SlSSeL7N8DYS0YcXUfer4bSBX5U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3648268b-4d4a-46e1-3f9c-08dcf44c46f4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 16:52:42.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mr2nAC8pwGHvH+EigO5lbIjusTvdfb2EK3RJgI30/9idL5mOWfRXj/CQtu7ON4+icKTspb6SJu4w/bruikKY4OMeoVsgjuXnjo5jpb3GhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_15,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240138
X-Proofpoint-ORIG-GUID: ijxpdLhSvqdkfmtHk4ogMe3vdVX7GRBB
X-Proofpoint-GUID: ijxpdLhSvqdkfmtHk4ogMe3vdVX7GRBB

On Thu, Aug 29, 2024 at 01:25:55AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@orcle.com>

> ---
>  libdtrace/dt_prov_uprobe.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 454c53dc..9d163d70 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -291,6 +291,11 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
>  	 * If USDT_FLAG_POSSIBLE, try to use uprp.
>  	 */
>  
> +	/* We know what function we're in.  It must match the probe description (unless "-"). */
> +	if (strcmp(pdp->fun, "-") != 0 &&
> +	    !dt_gmatch(uprp->desc->fun, pdp->fun))
> +		return 1;
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.5
> 
