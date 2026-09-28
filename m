Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F34C547046
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618611; cv=fail; b=s/j6a1+Yg1n1ifZ0kuGZ3vOXzD3559w7+hLouf3xF7GWliR6hccVCDW0d9ZAMMKssD/Ve9L86mZ8Sb6EuPk2qlgduTmd5TK7MouRXuHe3/jkUvrjL7ELASItBxKYHD/Ieq48lrIUAIaZRhaJxX79SYqAjWF9ESdUvHJMYRVNvVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618611; c=relaxed/simple;
	bh=237gl5BBDQturB2k9+OLI85u8eFLgtiieaZqs8EFmJs=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=jojX9TbDSLS2CquuobeLlK/h9e6N4KFv5VZJZlEd0nzWYl+J36W9qfdOFC4cPwKb0SnFJ0X1GBGpomTzwXUdHCs1j8zEZTMJgZMRCvcbY4peUrToiRxTOJRLOFitzPlM349wICw7ASwiDGhXlkc3A7auQ833+ay21DbDbIy+0D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mDyFpeb9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iZmSlIPi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mDyFpeb9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iZmSlIPi"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SDftav3404703
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=pT2/cNsQ+Zc6Ewcbto7ZI5BivirTOWQWgB17RkcSUiE=; b=
	mDyFpeb9SuzZfR4RGwAQ8Eek3TPDfizaIZmHmlRXj/O+sS5Uq0V7Oaikkj1glita
	dc2HhBMDpcEc8uUvw1ptsfyRoRs5jB77W2yZoqKd5nGiu25P5ikW5e0cd5ZYlpkv
	ghzG3/+3WDnEDmrOZWsI5Oq+2i6TJwiSIXH8Ljhr1w+rEmGoIeDy+l48cwG55uY2
	ztGnKgNaQknAKw4+JTjC1p54e6fmoh9Swzz9m3eegwov6PVpy0DDnA+HPPBikCZp
	w79KBzb2IOulejzkR+yZhVHrInj1vqHy2qrp9SBTNUw9Sju8o1fM0tZNvRKZG8Wm
	0YwNAjMnMUwNXeMLte437w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gx63buc0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68SHZPHI020805
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:28 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gx4gnpjv1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru4EcthWe83f2W6ugRRnr/Ah/UG5oHr0eZjUWKASaUNiUxv7KMwUoiqaOPUCj51psvL0HUcSaSelovXXjD86mnNMtx+LfK2ncScmseE+qoXkHs135uVS5VNXpnZRSCPv2Y8vSLkC2QRk5WW7bt39RnDgSfkJBOLQaX1XAf48sXj5nkgs2WII/qFK1ho48x83Ij+nHLPTkD55cuTMzrTN9ORzPp9GMUs1ZLg1+KI3fshZ2qzM5m8gz4b3+Ur59e4JEsXN4M0mrz6w8sPDFSKisyaf6sbKLwHfcZ39UiW98Yv7VqiZ9EOBC5R0wi94z2K6oQYc6FH+Uc3sf2x6GoGULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pT2/cNsQ+Zc6Ewcbto7ZI5BivirTOWQWgB17RkcSUiE=;
 b=nlxnM5MnLh9I9Lt5xhFA5tWuhjos8aClnt9o+p4KZ/soI2WWdmOz9WN062RlgO0UV/43xszFP8tWZd/80YATC6hqiXNNYzS3+Q+PYesIVu5sXl7mdmtY7+NqrZIvR01nkAUpk3jTxpm5pY+wEPY6ucB82Qo9L5IugDAfjuQgXTel61myx2+jX/wmG57AqJ29RDMVWaSkySdAznA8Tqg6GgSC1v5fbaOdbF7qAatAlNk1BC/FmuUpKnF/E1z3uTZYNDXiYCo66xiYr1ixVgSX53fTaV+mVdUIasl9rZVC8L0BIla1SXgcBqDXUD0LMHLFtuV9UEfHxRvOaNNl3skAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pT2/cNsQ+Zc6Ewcbto7ZI5BivirTOWQWgB17RkcSUiE=;
 b=iZmSlIPigQunIH2CgkwHn9gHiJtdvD1/jvoJIEEBA4lObZ0PIncAtq1aRicJdiWIu0VyOoeH4NrbcbL7onLcoCP13gUlk8++H8zYLdvkm30FSpSVOMEkY3mFtYnV9+6T279C46AqSyP/1Rv9fekijKap+RY2nt7TWFqiaQqvDPY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DM6PR10MB4202.namprd10.prod.outlook.com (2603:10b6:5:222::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 18:03:25 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0472.005; Mon, 28 Sep 2026
 18:03:25 +0000
Date: Mon, 28 Sep 2026 18:02:07 +0000
Message-ID: <8b9d322753c7742be97236428c026bcb@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 7/8] test: improve kernel read and subroutine coverage
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DM6PR10MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: 810d139e-d889-40b1-0a58-08df1d8ac854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	34E3aM+PEnSiKipek0L0ru24ZYXH4QQV/febj7mDUhbasBEcpowzLw9427Yj5oVoAeXPf8QKiTmEa6BNNJsztiMWYHnCt63FqQYmYYs1j32bH9ObUVYUVWh1lquEdftIzAjmV/Sa2+rUNCYA5cVTv6sBJVlQh2g5cjl8gQe/boC+9AoLiATrd3e05sxFXxVW2N3upgUGdtX05qpjjNICyh73+fEH/b2ijvzuntkPA9aKxOHXcv8LtIu4OxI7FkB0ucRele7j0KX4sHaqzWnW8a3VoUGGI0VkXO4PbUdMelgB604TaT58cSzKjNR/8ll0Z84gfyDgMtVc+IaD2elz1WzXqi09WCETjduma6f3SfsZ5eIrn8Sn4tBzXdBGDIvbZe/23tJDRNMjLhJP1hc97YuoLesO2JRKWtoGrA3OuEnpEmV6/UhqGti/UbTfUxrYiX5ltHO3Jf951A19EbH3td5D+Og/Xd2zZJAF5kxT/9hfRpqTML1Ues+K2w/pD5ngUtSELEU87cZZh5EZ3kVu40J773QGWI+ZSuthglam++9ZqmUQl0sqG5KBDI2+p1KJ9e/OKEZSCv7LjLNe7ZRUmjacIbP0dFW9FI9kYe8uEgvrWIXq0DI5XgiAq68PJQL0K0dPKb72bJd18Iq4F5UjgUcuj2s5YSU/kvQg3BWW64E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?67etBunZGE9zwtBjv3xniOqRs71/C58yz3Wqykxmmp3siTiHINqJ6o5pN4JN?=
 =?us-ascii?Q?DUJvchJ6TbbhsPm5hDN3af9ePX/458gq0a8Z0CYqaEmQYpoWZVlPqDT5Ldfp?=
 =?us-ascii?Q?zdjleJOA3TQLIwJrTwB/8szPYXkMEhWMQGbcY1VtX/9VuVDSmy/vQ/TPGZpj?=
 =?us-ascii?Q?BlOGPOVq46Dh/caeJMb03Gl/0bCFviSKy78jGxepgMd5qniTxzCSRNUHCpNs?=
 =?us-ascii?Q?9u9EgiJTCuwKigLfX7nWdUVoJ1IQHMi2c/63WXLMJBUBn1f7NjLMPesJ5KUO?=
 =?us-ascii?Q?03CYv/l5QSPlp0WlHCWzHHPIyCWr3yElGz9qJTbx4FVtMOV2zjSfdroXrCsP?=
 =?us-ascii?Q?L0LuWOis1OIiOlD5/EtdMvwMHd2PkNn3lg1J4POmw5dMCFQdMJXRZ1B6tm/V?=
 =?us-ascii?Q?GdQP8vDEcQtR8mM/PNvrywk0DEavIW1/ji2A4aM+JAo9zmuXzR85H/fcx57f?=
 =?us-ascii?Q?KG/PUqJi7QVqlrhxQOP43Zi7C5iX0kzSOspsOo2VmsdByCTg+u1Ep74o1WIG?=
 =?us-ascii?Q?rHk4ygF5JamxsYuaGvGLxcqpUcOCu2yxkwhNgkOn6tqfS7yPK6OqwVTbDe97?=
 =?us-ascii?Q?ZvXZx27GWtjQui209JJYfy9+j0jOqNkGIl8n3EEWX9vF4M3OzL4QOUR8sgEy?=
 =?us-ascii?Q?h2Frv9z/lljKRKGWv22JZDQbn3rVBtd2a67IW9X2d9IHHH6i/y5scEJ7kTk2?=
 =?us-ascii?Q?wPJy9+domXgVVUgKrZeixo/eYi8iHmmno+MVvugEAPv9EBgKUqPJxLDg+eHp?=
 =?us-ascii?Q?tgeVqhsX0WQcwYzTDglisD4mn8W7rtR+mqnJTvF5WZZncB595ZtDYHF+20s1?=
 =?us-ascii?Q?IE9ArZV9apKeuIFDID2SD6MP6qEFpP2W7G8maDfmdlfeUeqrWv8Vnyiu2J5A?=
 =?us-ascii?Q?dGbuAq9HCDLJzl1Pf7RvEps51UB74G5672/Nx1W+ZBsFQa56lNiBrcBIqBk2?=
 =?us-ascii?Q?nCrJgVN8UFPMSqmSLAbfIUGUu1ypyjHCq44Ypg8SYr9jnPNv4RmyRSzu06Fx?=
 =?us-ascii?Q?xSi3H0gjO6c0MhbN2rwa++/eWPqw/lPRUWLWpIZ9cGd/qDuuIiVZUh7ieTPf?=
 =?us-ascii?Q?IoNsEiTdysMk3qYrIL8RKLcGXPfVnM5XvgtnBmMyW+p5ITkPVBvIMKH+xdYn?=
 =?us-ascii?Q?iB0tuHYgFBLRqy7SUSjy/y61Uj/6yitF/fasTi5dklWzwMBY3MbPc22wLpXI?=
 =?us-ascii?Q?bdSVB/lOjYtBLVkfJ9C772wKQWW7RV7AoO+gklccaonyK2Ge1/OdQmYg0au7?=
 =?us-ascii?Q?ght2FxEfgrNiXwUaaBJl8IJKcvDJRAGTWgelujhZsn4+lYlaUyFTHUnRzxoF?=
 =?us-ascii?Q?2wWcnPaQOCTdN0Sloo+Nc3WkaRisqHKUm18FyPbw48PiiJzJO3+GMLA1V38b?=
 =?us-ascii?Q?oOiUxZtYniojA8K2wauiqYk8e387Gig+AQ/4yX579m0c/t40Rr0IJRPfwlR5?=
 =?us-ascii?Q?A9S+BVpZL656C1tiX5F5H52ZU3vVjnPG9dyBX0kAHCEmwdq40VSaaXuNpGj7?=
 =?us-ascii?Q?8mGb4ZJhd/C+tdWXJkTvCube9DXX9zQp3V9gScy5I2opLdx5+1ygYM6X630C?=
 =?us-ascii?Q?uBilCxd3uENcuas5EQ72DAomlFFO5qv9MtUUcx6aVPrsTuBhBsh71/6bgRu7?=
 =?us-ascii?Q?s9sPb6OEafzWdj7lRvDcWmHcmvoz7BgB3ZBvDXuDxz9xkFFXCkYeVRwr/U0T?=
 =?us-ascii?Q?X6GSFjAvGQJYSEnA3hGpDRqCihhTNLM1PnR103Aeac3nwz4f7afvpdYuX3cC?=
 =?us-ascii?Q?09Gy2OXvqT2AMmvbtm7wbaJ3z75e2Iw=3D?=
X-Exchange-RoutingPolicyChecked:
	XjgKbKg7ekvwIAW23m8XvDKNkGlQcCVnIaoJtwt8KPx47MpyUMJ+iPO2laR4S0Vt2ABOfHoJ2OLeQaSR7xOP0Qq/4+lelrBPDjj2FoI3q0lT0SEo0mr8hLhySBJR9pMDVBlezHJKpf9Adw82gwkU5mT9fxwd1kqCCmzeFxVWBJ7PdLLkC1CRDDzsqi2XuWx5/g3CgeNwNCPXRmWXFdm5WCVCjCkkPO/moNHQpTr8s6BRipMQz9b74qI2v9Sz+E9zWjfLZRpC0vFDNgKduNG5VNl7kFB0MHrXwo0GL0pfv7jpZzvlvb6heM//BusUaERBNwhpimJ529nRbfRBrQwpBg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eqJyqwZsDnuS6dPBq79xAyS0TniA3JACu28UdC7qfKkislKyjxhY0se9cuaKhoF660GNHyWgFpEncs0Xs8FEULsEViL+V9tFXOwkNbXPs+avwDh76Mst5MVddeTyN1onCH+b9jI34xAd8Ju9SrPkRo3Iw9gkbQ2BRdLwqP5OddNhN2lJVlXRthj237H0HnofoP4P4Iqn8MGdJaVD0m0nZL/OJTNq+DUutxPqdLdbXvesir6Mm1wlxOxQuDdtrE7bABeAO2Z1W04Tue44Ua7HjjPTufA2CLdhArK8YcVW1WLI8FYJjwXOu0MIcPwono7ihZKYguVcq8ct+vNpKnWt1+TFWW6ZeJYqHTIhRKh1q8pJBOaEO1/iocKI8x9PPMDBaCAiA3x/oD5qxMmbFVfLE4qTShsul20pcLVSLvAGWwD7HI6pSXe3aOxbJ9+0A36giHe1gjnMJcaG2jEC18YXCxODImtO5m8NJFDLGyJvBwNO2SZo4A8KOFpFWC5YaBViiynovayqibVu/Cb9+c2GpYZIouL6hOB5PNnP4OvxhRlqGDpk81nlm8AwfgwwJaXoV4S9nEJyvs+vmGFmfqL08pXgtBCfVmzy3a5PFOC2ZNI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810d139e-d889-40b1-0a58-08df1d8ac854
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:03:21.4201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4nwbX6nrMu9uId/pS/JweSAYEqHMSjctjXdc85kIwwS7BxsC1Mf+dj53dMpfRlMkL32dVwGyWb6uLwiQQsfeScSxe6Dybgz6r2qyNDV8NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=716 phishscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609280070
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX7zdaZwcIwd/A
 tO6QWSswkl2qzdxZz8T+KYpjtAtKl05rHvv88cbkZGnaPMOxO/Vix+eRb2eoQmO34hirJpIPCEz
 Ts04YHrXWcWURWWjInr31rdxqcVfcA+E+FoWwdGx/uHxuM2sSpEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX8jtLbTVo5jfr
 rKJ12ih37Or0/BRiOA8oUYuHXB+NG6sCOTW7zrKZh/pOjw8CfdXQTEVpwSPtAAH0mJBpzJCjYNF
 FWDTnwVuwhR7jrLuzuf+3LGWXuDbuyuphEWCigwK55tqFdyYFDz5rLjcTy7mIx8omCY1TxgxwEd
 Esf3jfbqRL/faTywa5d5L0IfVA6EqcD4PF7K8SeUSdWaluAnac+Ws37dw3sTurLfL11nVDqKkXk
 yZ1zZLus8H0OBc9CE/aiITHahNG/OTE88AHL4NL6PP6MBDH5g054bn4IYgQXoVfSB7DYDk2dosP
 frLYxQkEHqpBxbcOYiHjriBwVPwDtKciQy1iquMPgCMt1HwIP31mI+yASHSjStUEcJyY0LysCN0
 aPfGAXygi6TPfJW0XLjc01gDtWdWUJPZoQjSISQj8AvvBAC8vWdDPcDQ0amXxpQQh+Tz+LV5uEd
 9jSKtihjkBxj1fQln6JcJJIco37RopLPfPggdRr0=
X-Proofpoint-ORIG-GUID: hpJRf_ieLqYMJOwFgBAdZkCEwAQru3oM
X-Proofpoint-GUID: hpJRf_ieLqYMJOwFgBAdZkCEwAQru3oM
X-Authority-Analysis: v=2.4 cv=PPGaavqC c=1 sm=1 tr=0 ts=6abaabf0 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=FABP5xv9red1mk6ekC0A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13532

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 .../codegen/tst.kernel_read_deref_struct.d    |  1 +
 .../codegen/tst.kernel_read_deref_struct.r.p  | 25 +++++++++++++++++++
 test/unittest/funcs/tst.subr.d                | 17 ++++++++++---
 test/unittest/funcs/tst.subr.r                | 13 ++++++++++
 4 files changed, 52 insertions(+), 4 deletions(-)
 create mode 100755 test/unittest/codegen/tst.kernel_read_deref_struct.r.p
 create mode 100644 test/unittest/funcs/tst.subr.r

diff --git a/test/unittest/codegen/tst.kernel_read_deref_struct.d b/test/unittest/codegen/tst.kernel_read_deref_struct.d
index c8ad5d3d..ca6b83cb 100644
--- a/test/unittest/codegen/tst.kernel_read_deref_struct.d
+++ b/test/unittest/codegen/tst.kernel_read_deref_struct.d
@@ -9,6 +9,7 @@
 
 BEGIN
 {
+	trace(sizeof(struct pid));
 	trace(*(struct pid *)`cad_pid);
 	exit(0);
 }
diff --git a/test/unittest/codegen/tst.kernel_read_deref_struct.r.p b/test/unittest/codegen/tst.kernel_read_deref_struct.r.p
new file mode 100755
index 00000000..d45aefe4
--- /dev/null
+++ b/test/unittest/codegen/tst.kernel_read_deref_struct.r.p
@@ -0,0 +1,25 @@
+#!/usr/bin/gawk -f
+
+NR == 1 {
+	expected = int($1);
+	print "Expect " expected " bytes";
+	next;
+}
+
+$1 ~ /^[0-9][0-9]*:$/ {
+	sub(/  .{16}$/, "");
+	got += NF - 1;
+
+	for (i = 2; i <= NF; i++)
+		not0 += ($i != "00");
+}
+
+END {
+	print "Got " got " bytes";
+	if (not0 == 0)
+		print "All zeros - read failure?";
+	else if (expected != got)
+		print "Data size mismatch";
+	else if (not0 < got / 4)
+		print "Too many zeros - check data?";
+}
diff --git a/test/unittest/funcs/tst.subr.d b/test/unittest/funcs/tst.subr.d
index d97a0780..1b9a6263 100644
--- a/test/unittest/funcs/tst.subr.d
+++ b/test/unittest/funcs/tst.subr.d
@@ -14,8 +14,17 @@
 	BEGIN				\
 	/*DSTYLED*/			\
 	{				\
+		this->ival = (long)(x);	\
 		subr++;			\
-		@[(long)x] = sum(1);	\
+	/*DSTYLED*/			\
+	}
+
+#define AINTFUNC(x)			\
+	BEGIN				\
+	/*DSTYLED*/			\
+	{				\
+		subr++;			\
+		this->aval = (long)(x);	\
 	/*DSTYLED*/			\
 	}
 
@@ -24,7 +33,7 @@
 	/*DSTYLED*/			\
 	{				\
 		subr++;			\
-		@str[x] = sum(1);	\
+		this->sval = (x);	\
 	/*DSTYLED*/			\
 	}
 
@@ -55,14 +64,14 @@ INTFUNC(mutex_type_spin((struct mutex *)&`bpf_verifier_lock))
 INTFUNC(rw_read_held((rwlock_t *)&`tasklist_lock))
 INTFUNC(rw_write_held((rwlock_t *)&`tasklist_lock))
 INTFUNC(rw_iswriter((rwlock_t *)&`tasklist_lock))
-INTFUNC(copyin(0, 1))
+AINTFUNC(copyin(0, 1))
 STRFUNC(copyinstr(0, 1))
 INTFUNC(speculation())
 INTFUNC(progenyof($pid))
 INTFUNC(strlen("fooey"))
 VOIDFUNC(copyout)
 VOIDFUNC(copyoutstr)
-INTFUNC(alloca(10))
+AINTFUNC(alloca(10))
 VOIDFUNC(bcopy)
 VOIDFUNC(copyinto)
 /* Not implemented.
diff --git a/test/unittest/funcs/tst.subr.r b/test/unittest/funcs/tst.subr.r
new file mode 100644
index 00000000..9dfa4b0e
--- /dev/null
+++ b/test/unittest/funcs/tst.subr.r
@@ -0,0 +1,13 @@
+                   FUNCTION:NAME
+                          :BEGIN 
+
+
+                1
+
+              libdtrace.so.2.0.0`BEGIN_probe
+              {ptr}
+                1
+-- @@stderr --
+dtrace: script 'test/unittest/funcs/tst.subr.d' matched 43 probes
+dtrace: error in dt_clause_8 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
+dtrace: error in dt_clause_9 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
-- 
2.52.0

