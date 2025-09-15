Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363A01891AB
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757957822; cv=fail; b=PuEwi8YiHdbanLlX4UM00WfNWhBSzd1yV39y0Mtd4NyAwY1+W99DAbPHsDORP4yCwWKB4b3c8zF2R7LDfSmiJHeEkTkOnGWtzmqrwSvhW8efnEv0k/yu//TAvprRJkXkNiXgnjh1I76TTAtkDxgOV4RDnrWg8+d//C793mS6DIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757957822; c=relaxed/simple;
	bh=DTrIhTy4jsFVhtPKi8bPRJsDY56CYGhQQpBJWm1Li0Q=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=cyn9fPnaCTkPeNuEEH0aZaApXmiroUIM1bYVe7PXx8+qd2gR4edbGBAiNuJKZMD7/aBWjCD/vlGhCDD/v2Q2dfdopdFQqf4ueeREevQOSFW3jlh/ZfDDSNgmCqZo7NmHamChlDPoiWNlMyfB6whmcJKfnjt4IkKwRAB5ufVU0eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g1ZIT9Ys; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e/KbYXlV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g1ZIT9Ys";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e/KbYXlV"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FFSn3p027483
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 17:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=el20zF1Q5WTKrWMXoTaxh4D2ML2ZPWGCl2R8zLhWK/I=; b=
	g1ZIT9YsNuzYXtV2zoJJ3EhYZw+cStxzbyd248yoYhEKTvGxdW3ZnJLOaijjzu0B
	fkLUeFO268dN2+DXUM9f+iqVxcQvJRxoNbluuClvWcEP97PnmcUdzVKZRwWJXe8q
	HH3UHjWZXgFLxbH20ov4MRw0QjfmMeM9AcX6rzAK0Njuj9sODAeS1Nk1uzjR8D7z
	mM2W5fBRCYZfI29y9s8eWJy31GnAr+tMlI/PvD29j7dSh4fHCG+n/QZSy7JWxSQr
	sqpdEVbqmqs44ffNb6Ur1XgXxYQRFUOLL6y4BDVs0giouj5jNVP48hMW153Kq9Q7
	TEEkXq1v4bWQd1HXLpKoHw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494y1fjx2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 17:36:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58FG1INr015444
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 17:36:58 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2bbku8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 17:36:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rx5tHtionoYfR2wAzBKaW8g79YzoN+pennRpZ2Dtjb6Vgj0+O0Yjpw7BBeBMK+/lAU0O4IaGm4CcteSx7RBYPm2ylitgS+tn2E+oizJZTnOkmElTK3OoQNAarneJxdOyWzfnAtPcgAkmfRt8OageN9XiyL/xUx+TD3DGuU9NBO0ElAycR31FcAv80GXX6xteSW1sFv0iSPpk4CdLXZUhARW6ncUUkBUbOxeGm5Z7O0RTaNiTWsAy2kHP2vJ4nVK7GXSzu+L9pe/bLZ0wZ8SpPdvCogER1k1+lkU6C+mBS+YBB0lSK4Gz1ZGfKBg5jObwRrs3OLIPDpTHSIofGvpVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=el20zF1Q5WTKrWMXoTaxh4D2ML2ZPWGCl2R8zLhWK/I=;
 b=x4v3ZMSEg/9vldveZLgPfRhk6x/i3RdMLionFX/CnglzqC2hQsktJFP0WbDPA1iRMpNSUBkulIeg/07Qc+GwZX+uxsDh10xXI+MWcKkEvyVWJmpOsYCdM1J2D0G+jfQtaIZVasNcJ4+WUdaNHuWJbX2k8Em33sBfUY6WqJNQOgjQiFLYIzF2cc7pX3+zfIzMOplgKP29qYMWi3QjkJwNcOk2QTHe0M79EsygesBLdrEjCxK1D4cOJe24wTIu0WUN/IwingtHJk3+hDQU1inBgXm0vta+areSp5JJ0erLctQESzpyQJX5C1BzG4SDB0816fo/p9q/xJ4tOfp1e9gc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=el20zF1Q5WTKrWMXoTaxh4D2ML2ZPWGCl2R8zLhWK/I=;
 b=e/KbYXlVFmqvUSVpOsk8HBG9v9p/pfx9sIZ0mdzQ4eD9lKr+iuqtR2Y14aZj2ASNz4d7m2WQJCaqVobq81/Rgiw3Cr/NSaAM8x4E/KEnxmgGbACjRyiBGPeXyOc/iIa6cHINzmUZUxCZrQzTb6SRvnIvLNHKnKsd9E/c16Rbu3c=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MN6PR10MB7466.namprd10.prod.outlook.com (2603:10b6:208:477::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 15 Sep
 2025 17:36:53 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 17:36:53 +0000
Date: Mon, 15 Sep 2025 13:36:51 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3] trace: print alloca pointers as actual pointer values
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672162D698C139186ACCDACC215A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MN6PR10MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f34c130-b8d0-4c53-b698-08ddf47e75a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R6xE8UMDd9AyW6Uqm1iUsPK80SdV/8UtGmBB6+IFBzJVeBLeFsDQGVuXcwo5?=
 =?us-ascii?Q?1wwh1+4LhANJbPzZz0Tl9ZLvHVO/2Z1GxOo06j6tKtL+V9DrDuyL6btqUpiJ?=
 =?us-ascii?Q?IzE1Wd7kVj++BLdxGMAV9c1a806mai8tOKi1Hm/v+WltgGVpbYkQZNh1//Vn?=
 =?us-ascii?Q?KvyY89nHrn/teMg5CoXBC9rLrn6LFfZBdV/g3/WOAKHq2+86ncCICST469oP?=
 =?us-ascii?Q?aXtitVG4W6JtqPJZcxVX6PGz25Z0qMuEj0ul3HrMXmjAgb8Nhq5HByodomcp?=
 =?us-ascii?Q?XoHhDRhxEupU1XsDKCUP78nJAtFf6PUwl0jmz8cZJEeGItEgjZ+W/quBu35q?=
 =?us-ascii?Q?DsRbs1QpB1fbhzkrBd6U83CRYY/2hPFwUCic9KI4Y9qNL9C0j9YSmBbuq1nn?=
 =?us-ascii?Q?iScR41PJ3i+H8++ZZtM/443HSIDBBoDeD2kGW2wZ/qB4kDt2xi9lQqMoV112?=
 =?us-ascii?Q?dT5Ku/PcIw2AM76cr6YJn69m1b71spgh8lTr/2TEvwOZn1kFK9BvbKgTQ9Kp?=
 =?us-ascii?Q?3IK5F/x2mFAd9n3kw10/DRMqqsPdyQkYYmvyNIvLpOXwF0pRYTZuif67cb6Z?=
 =?us-ascii?Q?KZaNRy+0cFCx9RY9cm6we4BUEw84NIkKuRluqtEs7dkXuBIMT/cK/IIxhDDY?=
 =?us-ascii?Q?F70YqbIlAk47+BpkHPg6KNdZZ2uXMSwFWlQFkVpPclUrUmuz1UEcKQz96g9L?=
 =?us-ascii?Q?uVQ7F4U4T7FH5xh5Cl1FEUxgQ8swoBva0M7Yi3iyoUUiKOV+NpML3YolXVcm?=
 =?us-ascii?Q?9V7oTXuyhVvc+sKM10pvoIF3il4MStDA7aBv/dfQaf0P2pSyT47LTgsW1yeD?=
 =?us-ascii?Q?SltY3k5s54VgenBDMMB2zcPZF0RixQRHDeIQ8BBQW/BZsbvQlh1bP6zQGta6?=
 =?us-ascii?Q?KQyc3G02TvqeDoGCzeulDyaPmsK95cbTa+giRj0bijp9c02n8+HaGtSpMYFq?=
 =?us-ascii?Q?1+uOLMjgtAPMXqye2CQ7IAVjH0qHfF3etQn8obMIIB1h/0yJTwH/02QUKPF7?=
 =?us-ascii?Q?LgEOA9JJ+rlpCSewHscvTt1Dy+T6AZAnaDNDTkjYlWD1RRHeHRgcNF24gf74?=
 =?us-ascii?Q?eNVGiJ9aLQZwFhIlmyIPphl+prJj1rJE8u8Zr3aYS4LX3BOUnjT7Qtxyao/0?=
 =?us-ascii?Q?DzPC8sN3cIxw5lbjufiDGsADPqNQ9Om0O7v2Djb9tMROqfreeFXx0DURxGuC?=
 =?us-ascii?Q?FCPMqG5TXpyvjcyK4k9y+PmkG+NEXoLc3b1gZSPW1WcDg+4U08goYJpUh54h?=
 =?us-ascii?Q?sm3D/gvu7HfmtPhN24uipGgRyOSo9Nbq9jXUs0qhIhUzsq1pRBz1iQgNB8EQ?=
 =?us-ascii?Q?k6fcPTsduzLs91k/f9jgujNNZAwplolms5pgJSrL/AROGAoR/ebYGssXA7gu?=
 =?us-ascii?Q?m4F0aJcfUwRc2H/fU6fT7mez7MGO9F8CisLn7ozowdsDbkIP6QhLcs0BnOPM?=
 =?us-ascii?Q?vApxbL+VUGo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PoDsJKdUagP1JWYBgRHm/l5mFdyJ/XH2VFgn63z5YCiga4iaVirQn5/ztOwj?=
 =?us-ascii?Q?QWzEhleUhJr46Ce2MhHK+nwzlV8oRmRP9hiq6tnwb3p1TVBu/w5JAxjaqVes?=
 =?us-ascii?Q?opS6KHYZCf/OBorlU1d9gZxoX6oU05xUS/WjKdUzmW39IcPF8l0VN7qalIL+?=
 =?us-ascii?Q?+zjcKPtJxnlnF4EvcvCXjmHS1rNDIW0jPruDkyBYwwrQtdBoUEcU/8KxtmQv?=
 =?us-ascii?Q?Nhwck0pTNs+6jiF6htHEle+nktnVqHmxU0sJI6dgGsluQ2KeLzK+3pdAP1Zg?=
 =?us-ascii?Q?gej/UHY+u0W6oTpZ+cFO2O5OInNy1zPjYYo38eaZWwlZ1hzuSA5dk26ZTQXv?=
 =?us-ascii?Q?ZnRToMvWj4umDW1gy+EJPVbdFhrR5oF6AwLhtBhH42a2hLlmoYCbIeyPGWEc?=
 =?us-ascii?Q?v6HuzEVb40/zjJaxvwXdgKj13YQlo9M5KBb81xELB//+sb7NrPJOGFDkQTWD?=
 =?us-ascii?Q?gHBL7CWXj/Scv+hOJLbY+fAtSLTGFFi1J7SxdFbgbwPd7SduPFeRDjgUnTsL?=
 =?us-ascii?Q?JpKfR9UvX3sWy7XyNLgc3jOQgcYYoTvwmRCrTcfN6WBCBjjubycSLbEt2hiY?=
 =?us-ascii?Q?6wIxZWR8bdvYcQ2myyK4dfaKZKDaFCC2V6pBUOEIg76xZbfydPNEyfLoisWZ?=
 =?us-ascii?Q?UpQRWEPBIF2o6npnsS0qA2pMEpHPk9sexMs6rCRDmEQQrUdWPR/AT5B+dkc+?=
 =?us-ascii?Q?2PWw7NoW1vRl1LONogBE0QUYYzupQ76Vl+3YRXiEMFiJU/UcELAXiOIlFdzM?=
 =?us-ascii?Q?x2iOyzdlc4luxYPRl85g/oVZMzkadUrbvXdBOF12UKWG8/5DI+QZGmWCc86K?=
 =?us-ascii?Q?wOKI2/q4MVZ7953jVuF86q6wmbteYh8UsEcKPn+mA254HKhuDB+3h7Vegg/9?=
 =?us-ascii?Q?lTyrOgJDsfnSiusJmiYJPjPcHOdqcLlwlt6I1GePDdX+GSHVDfC/sKmOOQi+?=
 =?us-ascii?Q?fNuWUOwUgjJXNKEhWKvPwM5WThNJgk/IEbbEIZoxOchY3dE+JNQKs3yIqkOJ?=
 =?us-ascii?Q?LAlKXbg/VmCfepJUAJnRQeBlnbHZWBqWm8uNaNxxunwpvUau/emJRWLjYBhv?=
 =?us-ascii?Q?vhFovFwwOBD47GrNBqdqxrquO0/XeEKuDkVdIY+4GF59aaA1jzz/elOy9TZn?=
 =?us-ascii?Q?Mw6juN4v46HNRrmfUjOEpNzLVuSgoeK9mJR10miScLO+jhsHRaIeKq9vvMC4?=
 =?us-ascii?Q?FJwJRtwzHVv6l68FfsuvMAYFcLIl0biyjmcgaUx4m42Bbaa/nTj0kkSo/F2K?=
 =?us-ascii?Q?Bq7mnsgwf6+uI14A7IYm9qbX2gsPpVOBsXQWxV8yO02749PhPvHqmcoy080J?=
 =?us-ascii?Q?xVayuLc48y+WCVWvYeqEzS/NapnyF1AAUbqOKoieEyGv8RMkiSFyfUYrS4Yi?=
 =?us-ascii?Q?Ph8GDiQL5GIG8OUBibww6nW5nLOgwnrScLo0PvE60Qy3VQ5gktv5ksHp5t+s?=
 =?us-ascii?Q?M9/SA1UeAAF7OzZIQlv3uMDfXRezqtHbtvuluawOBWjVslwMMFqCSoT2ZCN9?=
 =?us-ascii?Q?/j2WITKRLpO1GdSx95212xunMUwXH+gJ8bT72uzHW2vxntU7Y89dW4Wa6XEa?=
 =?us-ascii?Q?UDbpiS1GM4sadITrOaZLqoWvf76TwVSWMUxRG5matjUsZ8uZGeUt4VHdlrkz?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ukD0c23iHUCQ5DSf0ig6/7hiacQftuEU0RqKDhiNis9YmMW4OnwZSUfjfbNzGwgWZXKyEtQvGM7XhhZjcrQWldHanis7h+PcF9wg57n2ldyGEY17CkVOYEE7V3VCypiR5uEyAjxb58scdzoCTE7hc28xEtD0uxkne4rlY9kHitRDSlw2wGZ522xsBazfrz+JfMCVzYlKtvcx4SpoIsi/gXiM2VYa1SW9oois4NhYzT5ISee73dT1qeW9RczCOAxWQq2a5krJOM98vzJGygKn8Q9N2xSR3sB7G7bu2RFmV9Pbw/Dhn7teR0ryDDBwiOsNaKqYKsqEa185RyaMXnl+VzhFz6z2OJHzSJdQ6iZICnMMCG9kvibt8tvsy6hm2qyCh2KQ44/3cynoKDxeVR8YTa6SRfVEAIhMOtyXKAyWnl1fjNefIOp5rnHKdhoSyTpMdQHBEfyX228kAHG9WSEiglnzIwsQR85m1hKuBYaVn4yfukDKSLTS7mDpdHPqOeaMzBqi6VoVMl5ub0jI4vQkRmE2oNjM2WoNlYvqscaxpPQikq/okPT3qbmcMjBBC9Pf6gou7S4TVMZtCGnVB6RNfCyurC5gSAe/Pkz10jaNRg4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f34c130-b8d0-4c53-b698-08ddf47e75a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 17:36:53.5363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqJaqZM3JDL8Jqk7wAkkkBmI3ynCLhtTwBFwxt10a60X1/7MKtqa9pxtYoezFLdiS4Y41l4yb0/MrYesuIG9TT/Z8NL4XLNmG05Q0QtRRFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7466
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509150165
X-Proofpoint-ORIG-GUID: TpHdh7Do9sZewt4bMFGKlXKcPNd0Ltgu
X-Authority-Analysis: v=2.4 cv=KNpaDEFo c=1 sm=1 tr=0 ts=68c84eba b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=rMDKDOzzwQ21BvzFM60A:9 cc=ntf
 awl=host:12084
X-Proofpoint-GUID: TpHdh7Do9sZewt4bMFGKlXKcPNd0Ltgu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMiBTYWx0ZWRfX+gqF9mxJ+4Sn
 miYL441v9PyB+EKRa0PxrOX+jSGDsgTWeJ4i3eaXuJJE7RH5EdA3SRCIw2qWjD8FH1CU+k0xwc+
 MGuEcGPkg2gTofYsXiw3U5z5uIfZjKkbys+Er5MyZ07fcakn+iRuzutQ/2eJv22mHbYOO58jo/+
 i1XxjL/WhBPIqHHaower2iucKBPTek899EFeK2RiJX8qqhJC9Nfincjw+6znoGVZAewXXVve3cb
 MEpINA7vmTfOqwOkZN14g6ZX2d7S1LvGrzKoQIO6Exs979bU8Ekj9qXnlvVMlETqXLlfzn2B5Ne
 p6M5xHW+QVpE5vqP9TmBWLPCDMEVNCqFCg7se+hbr31nkUT1pJNWLyR/bjaxEOfKEdrLz4zGuH3
 v68Gp7VjVwHvH/qbGhSlVxwv0rbGOw==

Because alloca pointers are stored internally as ofssets into the
scratchmem area, they were printed as small integers.  They are
now printed as actual pointer values into kernel space.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c                          | 45 ++++++++++++++++------
 test/unittest/actions/trace/tst.alloca.d   | 24 ++++++++++++
 test/unittest/actions/trace/tst.alloca.r   |  1 +
 test/unittest/actions/trace/tst.alloca.r.p | 11 ++++++
 4 files changed, 70 insertions(+), 11 deletions(-)
 create mode 100644 test/unittest/actions/trace/tst.alloca.d
 create mode 100644 test/unittest/actions/trace/tst.alloca.r
 create mode 100755 test/unittest/actions/trace/tst.alloca.r.p

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 78f29a2a..c976782b 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1687,18 +1687,41 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		align = vtype.dtdt_align;
 
 		/*
-		 * A DEREF of a REF node does not get resolved in dt_cg_node()
-		 * because the ref node already holds the pointer.  But for
-		 * alloca pointers, that will be the offset into scratchmem so
-		 * we still need to turn it into a real pointer here.
+		 * Alloca pointers are stored as an offset into scratchmem, so
+		 * they need to be converted into real pointers before we go on.
+		 * An alloca pointer value either has the ALLOCA flag set, or
+		 * the value node is a DEREF of an alloca pointer child.
+		 * If the alloca pointer is a REF or ref-by-value is requested,
+		 * we need to do bounds checking before turning the alloca
+		 * pointer into a real pointer.
+		 * If not, we should scalarize it so that the BPF verifier does
+		 * not complain.
 		 */
-		if (dnp->dn_kind == DT_NODE_OP1 &&
-		    dnp->dn_op == DT_TOK_DEREF && (dnp->dn_flags & DT_NF_REF) &&
-		    (dnp->dn_child->dn_flags & DT_NF_ALLOCA)) {
-			dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
-						  DT_ISIMM, size);
-			dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
-			not_null = 1;
+		if ((dnp->dn_flags & DT_NF_ALLOCA) ||
+		    (dnp->dn_kind == DT_NODE_OP1 &&
+		     dnp->dn_op == DT_TOK_DEREF &&
+		     dnp->dn_child->dn_flags & DT_NF_ALLOCA)) {
+			if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF)) {
+				dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
+							  DT_ISIMM, size);
+
+				dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
+				not_null = 1;
+			} else {
+				int	reg;
+
+				dt_regset_xalloc(drp, BPF_REG_0);
+				emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_STK_DCTX));
+				if ((reg = dt_regset_alloc(drp)) == -1)
+					longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+				emit(dlp, BPF_LOAD(BPF_DW, reg, BPF_REG_0, DCTX_SCRATCHMEM));
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_0, DMST_SCALARIZER, reg));
+				emit(dlp, BPF_LOAD(BPF_DW, reg, BPF_REG_0, DMST_SCALARIZER));
+				dt_regset_free(drp, BPF_REG_0);
+				emit(dlp,  BPF_ALU64_REG(BPF_ADD, dnp->dn_reg, reg));
+				dt_regset_free(drp, reg);
+			}
 		}
 	}
 
diff --git a/test/unittest/actions/trace/tst.alloca.d b/test/unittest/actions/trace/tst.alloca.d
new file mode 100644
index 00000000..d2ff5152
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.d
@@ -0,0 +1,24 @@
+#pragma D option quiet
+
+BEGIN
+{
+	arr = (int *)alloca(5 * sizeof(int));
+	idx = 4;
+	arr[0] = 1;
+	arr[1] = 22;
+	arr[2] = 333;
+	arr[3] = 4444;
+	arr[4] = 55555;
+	trace(arr);
+	trace(" ");
+	trace(*arr);
+	trace(" ");
+	trace(arr + 2);
+	trace(" ");
+	trace(*(arr + 2));
+	trace(" ");
+	trace(arr + idx);
+	trace(" ");
+	trace(*(arr + idx));
+	exit(0);
+}
diff --git a/test/unittest/actions/trace/tst.alloca.r b/test/unittest/actions/trace/tst.alloca.r
new file mode 100644
index 00000000..e9bbf2f5
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.r
@@ -0,0 +1 @@
+OK 1 OK 333 OK 55555
diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
new file mode 100755
index 00000000..8515861a
--- /dev/null
+++ b/test/unittest/actions/trace/tst.alloca.r.p
@@ -0,0 +1,11 @@
+#!/usr/bin/gawk -f
+
+{
+	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
+	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
+	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
+}
+
+{
+	print;
+}
-- 
2.43.5

