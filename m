Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045A0318ECA
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926074; cv=fail; b=JcCRsf6BgZ3KzeGPaBwZcRMI74T5FeKJarK6AHJkiNV1n8s6Lt9vUdSsqkJiUbjH+bJ5OpJQ5iDZKx0q+hk+MWbVRLkH22ZyDiQk//B+6xSVJsbvyebZjfhL1kifvdoZB1wGnN04JMlO2fbdpD9NtOKz4MV+ajv0TNB03u9NrII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926074; c=relaxed/simple;
	bh=w0kCk77oD8U7N3BhaY6FCAo0o7qmD5QqGfDAfHOt3wM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AZqvrKyU2E3IBjylMXVRQgwb6rcClpo1S/PqVqZDw+boCNjxjEATc2Gy/9bIwczofbtUqNwuZZUsLIOREGbM+K8N3i8g2JF/amcg4vGfpT5ARD0YvwacMcgP1vb9rdIe8XvGrQzqyDZJX0Xo2fF2KAfyXjw1enSPH/VDfwtJb1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nnxJ/INu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=L9w0cZPl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nnxJ/INu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="L9w0cZPl"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K7v1ql3265014
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8peFjfytHMX9Q3g0Z1OujhpSYWykc2VO4rfiu0/aMsI=; b=
	nnxJ/INuGKSJ8kitzr61eFwDOaKCB3LCfKB5NvpgpYNC1jTxi4E0Iii9YppPoQeI
	e28HVqXojR701jOl0SjFnuVr6Pmr1mW37Yvm96y1bW/ezD1S1IGqjez9xudtrvWl
	0tNc3HuZ9V5mHNa0J0hk5VpFhnpcpP9uzlLKlKFuoQL6kx5V09/Zq+mLsGhVxetm
	nXK27NJ8PBiPnllB4MwTZIUZZoD5KuEQr0bSrjaNO7FzrHRi0D9S4Fvqk/9OF/dS
	XMaUO8L63LVlb6JZl77vclWAncHb6jBxYULeSnTgYPDSkLmb/eBlIalBTZO1U6Kk
	Mc+CG53n+HANH//KAPFtBA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br1b8bxjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:21:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60KF6pHq037786
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:21:05 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012032.outbound.protection.outlook.com [40.107.200.32])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4br0v9vctb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PltDpW/gqhFG9VIsh2u0wTDKJjtmJeuK15Q88bempc5L6mkYCyVTa5GaqgZQfjKRvGygKXgxWkH8EIEDDD7sF+xBZLcy1Ku5T3MQnDX6PDvcXTcqiTXA366moTR0j6EGI+f24P7XMhmDKJiQAJkjMV6106ormcpMrMoENZ6PIV8fEbBGXNXHvb0KyIDzHEjt01I3gC1sVqAgbMWJ83HCnm+88naNeG15dAKygb5RHg0WUH2mlRTODq7ySaautr5MeArarfY6m9Lx9w/qwkTd11hU+SxadHAZWZ0d72cMdOYYBi0xltUy0MI1O2u2rDxiwURz8GPboWneLbGcO/5YFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8peFjfytHMX9Q3g0Z1OujhpSYWykc2VO4rfiu0/aMsI=;
 b=kOzEqn1iRVMjqO69hSM8igmXteOCNiPZegcO2lpJ92HwQvoVHmAhzkADDOSApJ4TLtTtge4u5usI1QYXzcekyaRGQ0C8KVafnjYqiH1sLb/2g1UIPIhC+vXYcWY/VIpDr3V3i9Q4zWtQ4AoOKSFu/5xTC/SVCLbm1x2o8x95jLNDPp4jnihfzX0PhJv/ZDOdD95rgq4sLYdVjFHKPwS8TkE7iV0+kAdsv4YNklGcMPjs9MWlAtUvW5YbMH+qdyh7S3eUkGcAbm/aKFJ7RCC7DYGWOJTaNaiktQe0NBLxKukvvVUP4DdY1ib/6XEDtH8Q6Q/6oQUQGvtcEdjiSi4mvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8peFjfytHMX9Q3g0Z1OujhpSYWykc2VO4rfiu0/aMsI=;
 b=L9w0cZPlcUQ/oErWcjpwDkoU4uWJLQpuL4blJpCtcdUBibT8ng3zomCGGOWF3vD7V5yN57WiOoeD+s84KG4KERrieFuVHlzDAlIcZwA9aG01fMUoEo/uIzO24PvlDgXza2fwTLnvyE00IpLfjhWfjluItRGi/W1igwmX8RE1MRw=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by CH3PR10MB7630.namprd10.prod.outlook.com
 (2603:10b6:610:178::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:20:58 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:20:58 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: [PATCH v2] dtprobed: use /proc/$pid/map_files, not the filename of the mapping
Date: Tue, 20 Jan 2026 16:20:09 +0000
Message-ID: <20260120162051.183028-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.52.0.285.g44a719c714.dirty
In-Reply-To: <20251202230453.124306-1-nick.alcock@oracle.com>
References: <20251202230453.124306-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0270.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::23) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|CH3PR10MB7630:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c48ecc-2996-489e-a63d-08de583fe51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q0gZOTREz2Ty7NZErKeHkehsPvjmZZhELw1hsNVyQVGBBIpgzTGNjCUXQ+W4?=
 =?us-ascii?Q?bLALriiQBtoLTjqdKaTMlQHqYpzszBvV4nX5KqnVKWbl8O3+HrYCwQ0EqilI?=
 =?us-ascii?Q?XGRMHVeWt8XRSkokMeVACq/RmTU1VjdD86AQu9eahcvyk/6vFOQPtJDP2x7q?=
 =?us-ascii?Q?QEeqN0U6Pka4qVtmW8mob3hgV+n3Czjk/rYO6BpUOa3oPPM8x+IP/h4ZLO+m?=
 =?us-ascii?Q?NKQDygi17VUX7SLl5I6zT5DARTPiMKF6w/CSEhZGMT4C4yBW1jercgIUjcmk?=
 =?us-ascii?Q?rRQJLs547I27PBNownll3yvLZVQKNGNonKF4Bf9s7/UVJ97qiMXPTRxP7+kI?=
 =?us-ascii?Q?HJdMsfU8QP0jPN/nHBqdvizV6yXZw7ThgYQwgCpD7g6fKo9rAXnpBc3+31xE?=
 =?us-ascii?Q?zAQ3eleQJ6+mgICpvvUz4sZiUJ/lokpBJ1/MXrCMY/Y9rH0FeF4rx4jj22B2?=
 =?us-ascii?Q?wQ4aYEKzCUlyykQfqKNR2/yA2DIG1Xh7bbqFkemQswYpJ62vVP7DBgZnuuxM?=
 =?us-ascii?Q?QCHGGTyNycKFJqCOSv9ETQduB5s0o4PWMiwmW+J0/gEauzm6wAnO8G/bFy0k?=
 =?us-ascii?Q?1CFIoJBDqZYpuNcteXivxibkqK/dFv/LmnOhwg38awrlK3WQpH3eC1vSHbl4?=
 =?us-ascii?Q?pe07VhRwZhYcDrlT8MtyJEjPd4eZP/xLsuzQ4W3a5eE6saotmGMSyNvbI9W6?=
 =?us-ascii?Q?4UCOQ1WbLACiQR5zj/nmEy/ZMZTaGKD8S93BRkz3VbSn6+pdlv/iXOyRY0mk?=
 =?us-ascii?Q?7YEj5LfDd0bwl1ATiJS3GJ7dg93/DU60EgXP+4A1B4nl7QGuifuo92k76h8W?=
 =?us-ascii?Q?oJs8UyCCrE/pTDnUBoYgZ7yRW/mCrcnVO07YFVE84RPNLbWFOyIb2VMZXrhn?=
 =?us-ascii?Q?TBO5H47NzRqVcF00liNRZskm2BbcgoUukPRRhKoH11FyrJgc55dKF7IS6hVv?=
 =?us-ascii?Q?vFGPjlTwdtKlmPN8cQEdcjeECbHjJrwLm9tqG+XJ4Hn0VRYy2AAb9Ygn4Y10?=
 =?us-ascii?Q?BV25dyVtljy/uBrZubAbchCHx8QY2ZGKTMFy9NnzhGrVGyyHuQ96mqBqEeUr?=
 =?us-ascii?Q?W3dKbz/ZuUH5MRF1fy4fCUWD38FrGY6zTSERrVXYRi/FvOoO9Cr1PIBeDyQX?=
 =?us-ascii?Q?e8l/y00M/Dk74DOAktzfcySTtU48ZJcm/xxnmnQgjtQCWtFumGZkNj1SpxdA?=
 =?us-ascii?Q?V/VCQYzd4ESfPmhoTgJA5Ff2H3tLRnFciY5/GdYZgmwm8OKqJomEmpK/lCVz?=
 =?us-ascii?Q?pG1Abs9IkgDUKirMJcWwxqKHX+TgY6dVstqruzAe+jRTELPZ4ld5zJnqQVGb?=
 =?us-ascii?Q?/hRupg1UEwvxYuImyuI02lWMjd+Z/NqkZbjnGJo266mTlXpF8HCAEWx9xX+Q?=
 =?us-ascii?Q?HofLHa8oySqMK6ydZxmHzs6gSwMgVTqYRXDvn1/mLxh7LTzB1bvkWPD67LW9?=
 =?us-ascii?Q?1/d8NdqMXQ2X49dXxE3ll6SUUvHxWPkUrr65o6OaFSDeSGaLIc72G5W7cowV?=
 =?us-ascii?Q?swURlVOlF1MUCJm3VLtwb6Ae7WUPOU4obaokQrmWq2yFCE76cuS4VX2RLiPv?=
 =?us-ascii?Q?Cy0nW2iYFPjX6ktp084=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xj20GMnzTjD0C3zjRfOUD351pucozUTUJT7362zqtGI5TOckgEK2blwhS2WI?=
 =?us-ascii?Q?aZwc3tVhvbs2gYz7lFWIV0GI6u+MwZ3XQZ6Cv7Qkz+VY8rogl/cyG1eiYHfx?=
 =?us-ascii?Q?O8gL7Q0i8RFVakVVrT9vRpAiPDS+6G9f1FMvaOWD0jfVVk+67TxbGd8KXk14?=
 =?us-ascii?Q?9I/Mr39zRmIWS5BDTAWwVwuOGr9jSbdflgF9t3ygu3QfK+z+ko4p2fWnzwy0?=
 =?us-ascii?Q?WjUgyVsEFljac3dHKbrODqvsjCNz99s0hlc+0KNyU4OlMKsX/8UGpSFIeRTP?=
 =?us-ascii?Q?cwW0PYnBBR0qiqNkFYdqmHD4b/VoubhimiklAJsgk/FBf4NjNlyLO6P8JMgR?=
 =?us-ascii?Q?3gSTwjw6wxdxskJcwUu0m9NgRF+fMJiwb85WWOaQg/IkQ48UMm6lhBGfv5dy?=
 =?us-ascii?Q?eVhea1Rr6vwez2lNUV+mJmpvfdzadaaNdvn9IQbnErdTnVZ3zT/0rtCzEX/1?=
 =?us-ascii?Q?qnJDY7osdrRDPmFCxrWU3qQx5VzjdZZca5mZ4en3yMgyfFKGuNgWcycJt3cF?=
 =?us-ascii?Q?lbR4oypMldQrnmqXvc8QIBGOJfkhyclDjBFzTyCcIm3YvL2ceP5H89qF5VyJ?=
 =?us-ascii?Q?HWjEOuOYKxt/FAkxj2uQAoUQJ/rp+wCqJdY8jabFmvcM/ZcL6iV9+8wvtq/l?=
 =?us-ascii?Q?uPhFdFGej7tyYfZLqmwfPWMzg+O4v+uXCBTYNDx43pBlpjkq7VsFaFc99jS2?=
 =?us-ascii?Q?xqE53rwFGRM96oTai2tXVfJyGVQJWTX5o+Tx7SP7zqZ+1UP7fpzgWLbw7ID6?=
 =?us-ascii?Q?597wx/7JCuaw35DasfvtAPIfvq+vFmICsnzefAdgyFgNjA/gJCMp1cux8JlC?=
 =?us-ascii?Q?C9cOu8GD6XY4M1ITiFdFBu55KnsYHumfuPW4mZZgZdl47BiQ5PPpnx74yVwp?=
 =?us-ascii?Q?Ydu3Eu+cF2onOSqxg26y3XrSNlbe4p4tb9LKK6VrxJ9276gu/awIu9zMGLPt?=
 =?us-ascii?Q?iMVe3w7YYUhVVWitYQukSmkKj3Xzx7SxyvIDHSwbbvBLQq/4zhjKUaFZFFLq?=
 =?us-ascii?Q?AFhv5muv9IdZUSQ+6kaLICN6A0vGKte7Mb+als3K488tIZuuLKAUdYWHqAgb?=
 =?us-ascii?Q?0sxoaSgNLKdaRcIk2QaD/9QgRo56LNlO6vYnu1Fx8sWnDFUrXTjn6v1YJdKi?=
 =?us-ascii?Q?wzO+bZWSMRjMh4Wj0Xw0rX+K0b7ouR6nnnhEBFylHv9aUREkYqFg5IE5XSZK?=
 =?us-ascii?Q?yccd9xen8UGYfBoGHDKeoY8UKbkk8FIfTb1RIsjNEVzKA+Dk7RblPkmdztdG?=
 =?us-ascii?Q?RHzK712+VcCiow4Y4Subv8FXj58odXClaxSl4l9QsHZ3YFMgWha7GaHirdtA?=
 =?us-ascii?Q?sic2a/siv9S4oxuCbafdiLSD5PuUCa3yf34LaPDup4lTcwVGN9YJmwvgHkjO?=
 =?us-ascii?Q?u7CRg2nTCgdu5IYKpRKkJse9Dv6wBp0A4Pb81YFdTS0RN5YzADNYKI8IS6h/?=
 =?us-ascii?Q?yD7KCm8NjX/VoapJco0Kajje5hlqiVmKlcbEyH9dz4WU/z+HAqvsvEzUr3Mx?=
 =?us-ascii?Q?BPi08Ddxgk8Ph5byTVMS8wmIgZ9b2+n8KlfbDiCbFiNdW0ujpJVEd4BFGAU5?=
 =?us-ascii?Q?Mk8Av21fuevR79GU88lQkbaI1osQ/W/cqh1UYaUVc83lQK3gBQ075NS0edVa?=
 =?us-ascii?Q?79Ah2xa+4YC+NtllRSwyL2HiNqEeJXX9K/EbgrSD4wEPuF0siogeVAcKUzMc?=
 =?us-ascii?Q?YG2cn5alvbR/F9gZADgtZOxK9O/qtRCIsXb7Ksn/Cdy02fJj32ULSBZDh+IA?=
 =?us-ascii?Q?GiuV9Xz7fQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ed3BmmrJPbkyUtOsSA98BiudxlCMfm5Cp/jjapurvJXX9Dlvev0+OJy9fqGnKCDthzxmXEKe6WMnAlldFuyywNMxII1E+Qa9edP6AE6cnuP/dzAde0D1eM89fLFXW3tow+qZ4MXY2Ang1s2CdBFJzxrnSMF4jXBPPyGAW3w5KykeViJvjVUDFzX0j8UPLe0BchndZmNoly4mDlOdHO5foHDTNQRXHRcl8RMC5IN3kkOY4XvN/Gg/MGSpn+NQMXj8585wU3N1vVSJx28XsvCuVqoYXjtBL/ZMnpEVtYfnHkzos+lswthBUipQ5KAhJM/a2ZqHHSJC0zRJ0TNWf1Z/pEES28sazbPVWLjzNjTG6/8nLSgDPp2hDreRbKlpz5GF/7mOrBJliVUiCVbjd8Wo3w/fMvGXLOPl+dqHeXQ42Q06C2duhbEk4j1hWbbomzQDQZ2eQa8T6wSzLFk2jlhOXWa7b4JwjPjOWe/hIvZVIXYvuQG0IUQtAz0bU+oIp+q4XOcCQkr/SwdgR4AQhK0SzKoA/iUuAOwPdPHT7Mq0IqAk8Qt9T6e7wCZI8qdNvdW29vcREuLZl7qJsPVgRsa0FXa6JYe6Q3K2mBqoyTcEt4g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c48ecc-2996-489e-a63d-08de583fe51b
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:20:58.5546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6omlAzvH9P+4B13+5swTcDdab6WOSiZMDHG3cimYbHdX2oNJA+ytzWzxZQ2YIiHNY5cHIof2bh/42Li0x8rfZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7630
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601200135
X-Authority-Analysis: v=2.4 cv=WbcBqkhX c=1 sm=1 tr=0 ts=696fab72 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=6R2e28SR3KXUxys5xU8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEzNiBTYWx0ZWRfX5exDE4xw/qkR
 knX1PvViDWLLsQdUlv1TqYq5y+9YpiSHcW3SKCQPyA51URe8UaT1FbH8suH9JmeKEYWhNF6QqIi
 C9fBLl9b+8RnVH3shpI4wSnjdLgF9l/AztndzXVDEflCKVlzgNPq/m3esV7wL5fIkFDJ7nZF8Nw
 muDNYLwa89oZCpbq35jM6OG7VH1Ekax9M77kUYDyak+l6nANjsi34F0fQVaNWaNdvu4+gxmR8HM
 ozAGBFEMqwUFlkBG47LDjsf33A2LdWm4YbAoC9os9VDifzzS4gu+9QFvpHpUc0nQCORDzrkOf39
 19A3sbjb7aI1NFwXulk82Ta4hiUf7h2RBadL7b8XX7PEihyDCD0uJoM00vPrrupmnp/EUdB3zzu
 VDfPm/x+3sQbVCkjMh0yh+QLLKxCr5Nv2jhfwsurjGq/UqstNyzj4uOdxcex1w2aAXnWIBy3guE
 vl/y1DN/ua5q8AtYlGA==
X-Proofpoint-ORIG-GUID: rb7WbW0DnaT5aeBA2wNw54BoeQXY-GjX
X-Proofpoint-GUID: rb7WbW0DnaT5aeBA2wNw54BoeQXY-GjX

Instead of using prf->prf_mapname (which resolves to the mapped file's
target), use Pmap_mapfile_name() to get the actual
/proc/$pid/map_files/* path.  These magic symlinks can be opened even
when their corresponding files are deleted or in an inaccessible
filesystem namespace, ensuring we can read the mapping contents
reliably.  DTrace already does this to read mappings during USDT probe
lookup.

Fixes issues with probes in paths like /home when dtprobed
is sandboxed by systemd.

Tested on both systemd and non-systemd (non-jailed) systems, with USDT
programs running out of /tmp, /usr/local and /home.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dtprobed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index a808586559d96..9a6928055cd13 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -487,7 +487,7 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
 		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
 			 pid);
 		goto out;
-	} else if ((fn = prf->prf_mapname) == NULL) {
+	} else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
 		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
 			 pid);
 		goto out;

base-commit: 6e94c7d0a253806f85c39ff5f4e32a800d4cb6b6
-- 
2.52.0.285.g44a719c714.dirty

