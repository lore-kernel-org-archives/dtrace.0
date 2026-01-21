Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F9A3E8C5F
	for <dtrace@lists.linux.dev>; Wed, 21 Jan 2026 22:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769036250; cv=fail; b=Hfk0e9C79n7kHZ/dMupzWMLZUVxUTNj2gHuGRbIFeR5oXTdQsJ++o0rvdhLp0Z3b+GdhsjGWHvN2dsNYNHIfH1MOqPQgrtEbnbs/pI5xzDrUnMm1JXQJgJwWHGrfUSq3MNudmRRdnvMaSf6o7Zc3PfpazyKLiizLuIXh3KNeG4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769036250; c=relaxed/simple;
	bh=T46nv4pDwcU4suJfT1F2/dOVVahOYCnaLpUienUoulA=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=XTH+bpKYnTKP5VLc2gmkrCVVXDZqBxXkTroXGxStQsArDUyO7vWW7KSnEtz3cNvkFydnjrEKA07a6TNo7onrERGb1sYr8wofMr3SzQ3E9DGBRtHLe5eIlPnMjrGswC8pAKEb86NiUtMP1t3EBwm3T6QOxl5Z/9MLw65crswwf44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fo0zglkk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ROKvNexU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fo0zglkk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ROKvNexU"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LLsXoe3867763
	for <dtrace@lists.linux.dev>; Wed, 21 Jan 2026 22:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=OmJt6Do1TlXugltwSMgRZvCKDkHNDhmorNOXUSrWdm8=; b=
	Fo0zglkkminqN5+CpDncx8QSK4CL2VWa5cU14UKLsO1wK7Y0rhU02I3F3JHYtD/O
	PAsbTYKlDzaDE6VI/ydnAlDZRVhNA4WXxR6wXov0etK7npfbWGlJVZ2iUV7FuqSX
	Oy7gG6xWdLKnzjaPPI1yIShj76YogWthp80wxK5mN1tGUTGhBBnv7/PVXNK77abW
	7d2WKXxlw6NBkcEW1sOEugeQuxr1GAFrIRa+aaMeqqN6wN+KtO+WdoPZufqykjnf
	vMOMhr7AWyhuv4zLMDnPNhPfpsx649Xm/pj0ZIs7qBdLVuCpNSSvCHpfOmC0Mule
	nFcR0YuKJT7TI2jJGF/wkA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4btagd3csx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Jan 2026 22:57:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60LLW7kK038266
	for <dtrace@lists.linux.dev>; Wed, 21 Jan 2026 22:57:19 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vbxm1m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Jan 2026 22:57:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMxORFJzldSPxq4eeBK7oxbhiNmF7o2Io+e54wxZT9J//8/6e71UNgxhlfnscUt1csZfF4rG/Zdbs6rDp/s2+b8t0XcicyKAjb9UU+njaA03aHluy2rCu6jm9zOxOhojHi260QTaW3G4oSC4gHWfigtCcwhzDtIeoy/ICr0u5BFXWmveRPX1j8hGoZLv/+L2oevXuw4RU+ht6MhK4Byfea7W3qFqN4GQg6RuAK6OwaVB4g/fWwU8J6VAlA3fskFSMSXL0CJoEs4OGNmil+YCKKyqSjM/XGCxqUZz1O7GPRB8nDA7jvYTvB8J1t3z2IUl8ViOBbZgUGY9At+KgCEkzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmJt6Do1TlXugltwSMgRZvCKDkHNDhmorNOXUSrWdm8=;
 b=t1rlCmJZqQM5QEbD1P89uTMsCozuonr5Pwi6f11NvPHpIRM92+T6hMbwi7yPf8EvWgyeK4FtkgcHhdBco4uN4FxcXoMq3+XzvaJSTzqwG9/lmNJzkEFCvZxPBGnzo4HwFmz+CwSGbJ7ha3zZHFgNUqZoEsrh+VPIKO3+HZEn8E9nKDLpO0U4Xwm8uVggb1QVVkEGLF9VDBIKdjygS6I1afLoo2mBDbWtofjiE6p7Z+AXnPyiZ5w7T6zaTiv7OTIamlKgA3Xd0jKoPFpetJrVkabeqS9MIB2BuLclTv4nwife+YIZ+67OtsjQkim61H+TP/rOOOOu5muvjCnVZTvCJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmJt6Do1TlXugltwSMgRZvCKDkHNDhmorNOXUSrWdm8=;
 b=ROKvNexUu8edO7FJvnB/al23BvKLTwgWKmjoeUj/roXWpL1nUiR+LmpNrIRgtPiApPClnechebxlcEVow7PsiRcbQdektvIeOfw6ahO/lrjGYSrXAorLhTRz4O90wu/itv/rnvPg5R7mQvVdC0gNFNZmCuJysGaU4y5M7eykQRo=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by IA0PR10MB6914.namprd10.prod.outlook.com (2603:10b6:208:432::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 22:57:15 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 22:57:15 +0000
Date: Wed, 21 Jan 2026 17:57:14 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] pid, usdt, stapsdt: refactor dependency on pcb and dpr
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522C4233CBE9A5A90CBBDF5C296A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|IA0PR10MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e21ea46-e756-4f23-560b-08de59406b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0eh5WbbYdTnEJpoSRHRH4BvOpVRy4g5OQIqQGGS9tFWh0uwVRZCXvLJChBHq?=
 =?us-ascii?Q?CFkcxwmW+r501lb2JBq0f2fAvYNawYK7NYus9obXxz1Ek5UqNQBsKXJOZopw?=
 =?us-ascii?Q?TodxUW6dx4EUBSfEvuCjHU4w36xaD5r4ROzRMUQvGF92au+41gK55L3+PsGQ?=
 =?us-ascii?Q?m8HNGShKN05/W+cv1+sAznDxEls25DIkhodsHaxgpiHDMFSNbG0BDzVlzb8i?=
 =?us-ascii?Q?DhhsBAH0aqJHzAHx5OxIPsuJxh0Zcl2lb6HIw4MCYaQY9hHXGTV0gI6u8OK1?=
 =?us-ascii?Q?Q73nkQSZG+lvsxmuot6hz1ST9oeWQZxyvMnFf/UcJ3zQQUKcwiGN0rIsc52s?=
 =?us-ascii?Q?bHmfrCXW4zha/XJFDmUupiEZV+mZebwSFoAGG+q1mB7/hxaM/rl7mO+yh8tq?=
 =?us-ascii?Q?Ld2O6eUzqP6WIfw7Ox7/ZSv3G0SqIaCObMCkxgzJsymlxIVYb3gFVMYW/QGj?=
 =?us-ascii?Q?9RbAXC1x7ORK16nX/CN+DO+61lv+TiXwP/iLf/Hg6QdWDmE1BtEREygXW1aI?=
 =?us-ascii?Q?2i/0oZ6iL+TkSZSd1VWeYRmdRTO1/GL7hBCZ4Z6INtY7mB8tqI4pMsxpR5z/?=
 =?us-ascii?Q?67XlEacc9fN1+uS53cy8gNL8aQXhTVBgCf8zgKXFtmDdnPLMwdkna55Mun0x?=
 =?us-ascii?Q?iB1QdZTKJnTfSH67hdSNVRfjPWIJJTmZ9Gcka4+ViQQzaG0TjP96/AdveR1A?=
 =?us-ascii?Q?OI4H+mprzKfu2n60p629N8f1VTcYmj75wuJHjGDDBQL6+VoYs+0+VI/exWR2?=
 =?us-ascii?Q?dLe1v1PRkw3TiLexj2Hb7eJIXE1PbisAwa1/0fWW/BiZR66CXjrfKpFqzJL6?=
 =?us-ascii?Q?wJIFPaRoVrA6kfKFv4z9Grr0pL/hBnhB41cz8DmgqdSJclJh0JVdSnv8v4zn?=
 =?us-ascii?Q?v4N/hxLMQtATcDOM+Qo+0OJvSbeFusEV+E1KOvyXil4Nx8J8sdvz9MDV4Ric?=
 =?us-ascii?Q?wPjKM8Ag+uoQXKxr62UTeQISbrGjbIB3Jo7bAcSUNsSJgjn43olCC+CmpB3U?=
 =?us-ascii?Q?jWc3v9zOW2cBmMKcAvkVtbWgwjvZ1u7k5GcArqkDzKejD7UovAsLB1fY+HM5?=
 =?us-ascii?Q?xuqb8FA2P0feaK+bqTlvqqdXM2hq+0e481dUr3Vyihi5Qlr2SRkdRCwM8v1H?=
 =?us-ascii?Q?rOSaytL5mAxyW7LnEsiXOHe0V3qrYvkbmHgye5uTL4AesYaLI3lAvv06mdNZ?=
 =?us-ascii?Q?fS22MbaGq6hJ2zr2LboEQxSD4g7/nBU0JaR+uOg4trqjbexr/+EW6G7nnWDF?=
 =?us-ascii?Q?vKXvk+projrRUas+jkVBXGRm2PNcDe250LKbsj9IiI3aTA32k3AxBzoHuZqY?=
 =?us-ascii?Q?1Srml88bwTVDRpp9+0d9+Q8vUYVbCu1+C0mXWeA10JI25jykj+dflrfI3I4G?=
 =?us-ascii?Q?ZBamcIqesarCLGWVBe/PnTUFY59b9kUlns0KqCbGwu6QjxW81E9n8sjojtdB?=
 =?us-ascii?Q?+Ilu4y/3ZMAiqySMK3MjTLFqFr2pAbZBjmuAQ97/jUYTdzDF21x3kmmG5WhM?=
 =?us-ascii?Q?so9vXWyE5E+yAlUwSbWx+KDTRNxBD8k68Wl2JooFlEontziyhGvtGuDeI8cu?=
 =?us-ascii?Q?ZvMPgm0QPBcepKCeyjY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wzkukg7ik6tASpA0NGWi2mveeaMH2vfjiOcSicHuPqetp1TiGfnTQWYk/GBL?=
 =?us-ascii?Q?QrsDW4ieQTfBHE4m8KfTRZxDdi4XwF6sSTx/R10aUYKzEQ3GLk5QLgsri99t?=
 =?us-ascii?Q?G9J2PC1q43Fu5fssh7BEZWnnhmoTL6rYs2gbN9OO+QPAVEfdsEBLEvMMw27h?=
 =?us-ascii?Q?KZKJNAJY3oJJD9uPY88/dM25PM9Sv83METwYsEj9tN70OPzYICHRgOID1Cin?=
 =?us-ascii?Q?ny7S4ZVfcuDisrQ0V95l1KpZdMUwm/vWQllormb1Bz0IdEPaMrJwJuhwRAI4?=
 =?us-ascii?Q?QPSSNL1GwjKsegVLLIch9SyplW7futO15ZqhkhTgBu7Pb+nRmxwo+0aT7Frx?=
 =?us-ascii?Q?4htW1o/H5ZEd1V/O7wjKqbayzFFqNhYQQuCUPDDFASCswR+RlQfTK5dpKq5S?=
 =?us-ascii?Q?O1IiWcnbJ8u/wW3SauFZLHOWmB1MCw7JYYty+W6/VSDw0WRiN9iWLWKr5U5N?=
 =?us-ascii?Q?gDYZQMIihY+tRTNMXOieFDiSmwOqbw5ToeY8EbAek+eQUkBmno5y70hj6Mu2?=
 =?us-ascii?Q?2+cJzhiAr5x48zsALiqvCv87pnJWe/VjmprtFzdwz+J8Hv5atkoR2WuPrV9g?=
 =?us-ascii?Q?xEzs54sKuD20BfC8B4k9tgZw2sHW44e6PV19lQJruMdF1kCurKpIQKURcqyb?=
 =?us-ascii?Q?vQ+xnHEZh25zvkbyXMjXjP96PVwRrpr5Hkm+dXL4hlTagWXszm+V84Mo8Mub?=
 =?us-ascii?Q?tS9W2H6NPbJ6RfVd630kPByilv4qojjjbBktJudUcAig2HrLcqDVloxt/4x+?=
 =?us-ascii?Q?5vKIsaTPJswjX2gd9eVNbwsHFEFgk5fUNeXFkDsU3/JGgYF3ceciLdWAmqt9?=
 =?us-ascii?Q?P2Vhb+E9U0Q8DXsunP2LfKpla2YbQBSwaoG/cBP9zOI/uvW2p99uqXFEs7mf?=
 =?us-ascii?Q?Bb86Io7lPmhTxAE/x7J8elpgnKiSeApHIaJvaatw8LWt0tpwj9pZtgS4C1lZ?=
 =?us-ascii?Q?1SFw9gS4zxtFlFZxqVUZSpA/U4m25OFuaVsf9sRNvmxCKXegB5G42R5/mTzu?=
 =?us-ascii?Q?bPDkCWtuk/+R7waFgLqK0cIh0NbPxm6j/TqVgbiMkj5Chdar4hnz+LfIB9mw?=
 =?us-ascii?Q?r6R3bNWYf/zQ3SgpWW80WKMgdJsDGo4QzDyTIo7UQFP2deIVXKTAaoQ6PSZu?=
 =?us-ascii?Q?o1LXpTvgaYeixT+2VrV7nWcznhsjPmRdBevYqOQW48fr3g/muAoplhtifwQS?=
 =?us-ascii?Q?FiT7J5/POGiDcWCxmgSG96lh2NLKKCRkKCiAmcQb6j0TyF71K2xTeNk/zKrz?=
 =?us-ascii?Q?WtPOyQCbQLgX19FTpPPbS70Ei/UL8nde0h3NfiuvQatbIlbHItsMSlIBCgmf?=
 =?us-ascii?Q?kiS6M3wjG7saaoh+rHu+CDrO98b4wGOID/qKn3QeSZ5REkvDXgogZ1xKzwJ0?=
 =?us-ascii?Q?tB/avNvpqltvY6GLmBnVez+pRft+LKYIfOVNRzXT935hy0Lk/HKop98vVRi3?=
 =?us-ascii?Q?/V/mb48+2ydmY7ViBEMKPz9uVfEpihr4TNG1mbATn6UUMAiGuk08XiF8QHR7?=
 =?us-ascii?Q?RiXEn3UNC6j6cfIP9b4Vb6Weopjzz3UFFSTpHwAgOUu+Bdj4occ0Kp1HBXvT?=
 =?us-ascii?Q?4sijBYFBlZh5LBRWown0JictUKVQn7oly3ONo/dSxMKknC17ToIcFKOTXmty?=
 =?us-ascii?Q?KczEWEIMPTy4N2//eRL81t2oOcqSLz7BhGG79dSrB9plqZsZ4AOh+GoGaFNc?=
 =?us-ascii?Q?TVyGeYfsV48babMHClNmgOTJfqRqFQtgq4OFR+hkqJdVTVYWQ665q9+QNLhM?=
 =?us-ascii?Q?Xp4tOpj/0g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lBwceYWCuTqItFsM5Lob0G52vSfCW+dyjMDghUaySdCShK3xTSvTo7kdkS6xwbXcRleLrZTusWTBhYQ/4JVs+ac31eLhbjYv/pRNJbNJAeEvhyEINrgfUCx7Tgi+Q/5QzKkgIo9fPKAjst/bU4QTy5601zybYgXAlPZOrKNdRPacRlqLTch8lz7DNMqwBb3B9MEoUi6mlV+yNbZq9Fj6EWf1WuuS9LiZeLRdQkG7Uo0Wwc9pV+Edz71jRPMyN/dDLipJhNQUtqGu0ZNJyjbirikIB9RfMcDzVZy5IvczxF84HCxXCxa2/2iwfiGZfMP0HzouXOrc+UNgFHgTaFMFQc5nak2t5jzYOA2BUjNqmm/SnfQQrIrLZ2k1IDGfl8SWZEOWmXvx4ThukXj1Ldaydrg7EsZTikKOwroGtgulgMvmcPxhAfRCbPPzc1aGMp4pJC3tZl2SAdMM6Vim3XI5ZEXdgREzxsxV1O3LtoUGkYwOD8ijYhHs00zMBOY63nho4lblYg+6eJ4y1y/hRYIR6qvrYzOQnRTTg3B4kWM1lfbo2TfznbzI41KKar2f9otlFs/J+7PL8gpO/jxARrPITdW3QGb0y6wCFfAUIhX59rM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e21ea46-e756-4f23-560b-08de59406b9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 22:57:15.3048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPpAKIPpqXpA2puQRtNZ4Z6zoHJBu7O2SHij+bnXbdk1SzISLHiuVg4KM5NE+l9KNEGTmEAARkCPnxwYcablr5sBqM72xUfFebyUwah8HVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6914
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601210192
X-Authority-Analysis: v=2.4 cv=PqqergM3 c=1 sm=1 tr=0 ts=697159d0 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=oxFjxnNp3B33LoCMf_QA:9
X-Proofpoint-ORIG-GUID: 5zqVeGo7FrVZZtvvHmAuoZjTtCQYpgzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5MyBTYWx0ZWRfX2oQSqwltqqC/
 IBfl0OrBPnmUJ2pPlZ8rSVnWsuCtwqBc/sVJ1uca87UmNmHQABK8LrDC7bAADQjl3UOCKE/ofv3
 DP1dLFMGhChtx6eChosUO4aoSLS6N3uvuzf53hw5qRXluW/Sf4A3GBoMvrtUbfSpRqnc/F1wsCq
 iHtah4GXkJmMgiIGGm196QNmypEiU6FYoo8N+fcaUXYcraZM9/i6FVE5U8GIs0+OtlI9ORPDAK1
 bX/ky1SjxrnreE2uBJFyybDLPw/euZrgQmonmbxFApzB1ZgF8VdWtUlQnag2DSt2AoAnpr6KoJN
 5HJsqupS3CwAIfDkpf/V4vKI7+750pVuCx5ffx3SZMPiaq5dYRr0FS7kXJry1AKseMsQfHzVWbR
 X6aTv5+bjRXpmwqJB/1Qo5zxX6dKMzDod1qct1DknAAzeHYMbApCB9dswT0KLSKTfsqoS1G3Ln8
 WJyumruxcLraHwFAEFA==
X-Proofpoint-GUID: 5zqVeGo7FrVZZtvvHmAuoZjTtCQYpgzj

The pid/usdt/stapsdt handling code in dt_pid.c was passing along both
dtp and pcb, while dtp->dt_pcb is known to provide the value of pcb
already.  This was done to handle a case where a fake pcb was being
passed (from dt_prov_uprobe.c) to ensure that dt_pid_error() would not
trigger a SEGV.

After careful code analysis, dt_pid_error() is restructured to handle
the case of pcb and/or dpr being NULL, so that the fake pcb is no
longer needed, and we can use dtp to get to the (possibly NULL) pcb.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cc.c          |   4 +-
 libdtrace/dt_pid.c         | 194 ++++++++++++++++++-------------------
 libdtrace/dt_pid.h         |   8 +-
 libdtrace/dt_prov_uprobe.c |  14 +--
 4 files changed, 101 insertions(+), 119 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 1dc119ea..0b205c38 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -275,13 +275,13 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
 	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
 	     pvp->pv_flags & DT_PROVIDER_PID) &&
-	    dt_pid_create_pid_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0)
+	    dt_pid_create_pid_probes((dtrace_probedesc_t *)pdp, dtp) != 0)
 		longjmp(yypcb->pcb_jmpbuf, EDT_COMPILER);
 
 	/*
 	 * USDT probes.
 	 */
-	if (dt_pid_create_usdt_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0)
+	if (dt_pid_create_usdt_probes((dtrace_probedesc_t *)pdp, dtp) != 0)
 		longjmp(yypcb->pcb_jmpbuf, EDT_COMPILER);
 
 	/*
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 36a5883b..91c2c13a 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -46,7 +46,6 @@
  */
 typedef struct dt_pid_probe {
 	dtrace_hdl_t *dpp_dtp;
-	dt_pcb_t *dpp_pcb;
 	dt_proc_t *dpp_dpr;
 	struct ps_prochandle *dpp_pr;
 	const char *dpp_mod;
@@ -82,24 +81,26 @@ dt_pid_objname(Lmid_t lmid, const char *obj)
 }
 
 static int
-dt_pid_error(dtrace_hdl_t *dtp, dt_pcb_t *pcb, dt_proc_t *dpr,
-    dt_errtag_t tag, const char *fmt, ...)
+dt_pid_error(dtrace_hdl_t *dtp, dt_proc_t *dpr, dt_errtag_t tag,
+	     const char *fmt, ...)
 {
-	va_list ap;
-	int len;
+	va_list		ap;
+	dt_pcb_t	*pcb = dtp->dt_pcb;
 
 	va_start(ap, fmt);
-	if (pcb == NULL) {
-		assert(dpr != NULL);
+	if (pcb != NULL) {
+		dt_set_errmsg(dtp, dt_errtag(tag), pcb->pcb_region,
+		    pcb->pcb_filetag, pcb->pcb_fileptr ? yylineno : 0, fmt, ap);
+	} else if (dpr != NULL) {
+		int	len;
+
 		len = vsnprintf(dpr->dpr_errmsg, sizeof(dpr->dpr_errmsg),
-		    fmt, ap);
+				fmt, ap);
 		assert(len >= 2);
 		if (dpr->dpr_errmsg[len - 2] == '\n')
 			dpr->dpr_errmsg[len - 2] = '\0';
-	} else {
-		dt_set_errmsg(dtp, dt_errtag(tag), pcb->pcb_region,
-		    pcb->pcb_filetag, pcb->pcb_fileptr ? yylineno : 0, fmt, ap);
-	}
+	} else
+		dt_set_errmsg(dtp, dt_errtag(tag), NULL, NULL, 0, fmt, ap);
 	va_end(ap);
 
 	return 1;
@@ -151,7 +152,6 @@ static int
 dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 {
 	dtrace_hdl_t *dtp = pp->dpp_dtp;
-	dt_pcb_t *pcb = pp->dpp_pcb;
 	dt_proc_t *dpr = pp->dpp_dpr;
 	pid_probespec_t *psp;
 	uint64_t off;
@@ -195,7 +195,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 
 		off = strtoull(pp->dpp_name, &end, 16);
 		if (*end != '\0') {
-			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
+			rc = dt_pid_error(dtp, dpr, D_PROC_NAME,
 					  "'%s' is an invalid probe name",
 					  pp->dpp_name);
 			goto out;
@@ -204,8 +204,9 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		psp->pps_nameoff = off;
 
 		if (dt_Plookup_by_addr(dtp, pid, off, (const char **)&psp->pps_fun, &sym)) {
-			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
-			     "failed to lookup 0x%lx in module '%s'", off, pp->dpp_mod);
+			rc = dt_pid_error(dtp, dpr, D_PROC_NAME,
+				"failed to lookup 0x%lx in module '%s'",
+				off, pp->dpp_mod);
 			if (psp->pps_fun != func && psp->pps_fun != NULL)
 				free(psp->pps_fun);
 			goto out;
@@ -215,9 +216,10 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		psp->pps_off = off - pp->dpp_vaddr;
 
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ABSOFFSETS) < 0)
-			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_CREATEFAIL,
-			    "failed to create probes at '%s+0x%llx': %s",
-			    func, (unsigned long long)off, dtrace_errmsg(dtp, dtrace_errno(dtp)));
+			rc = dt_pid_error(dtp, dpr, D_PROC_CREATEFAIL,
+				"failed to create probes at '%s+0x%llx': %s",
+				func, (unsigned long long)off,
+				dtrace_errmsg(dtp, dtrace_errno(dtp)));
 		else
 			pp->dpp_nmatches++;
 		free(psp->pps_fun);
@@ -226,8 +228,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 
 	if (gmatch("return", pp->dpp_name)) {
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_RETURN) < 0) {
-			rc = dt_pid_error(
-				dtp, pcb, dpr, D_PROC_CREATEFAIL,
+			rc = dt_pid_error(dtp, dpr, D_PROC_CREATEFAIL,
 				"failed to create return probe for '%s': %s",
 				func, dtrace_errmsg(dtp, dtrace_errno(dtp)));
 			goto out;
@@ -238,8 +239,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 
 	if (gmatch("entry", pp->dpp_name)) {
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ENTRY) < 0) {
-			rc = dt_pid_error(
-				dtp, pcb, dpr, D_PROC_CREATEFAIL,
+			rc = dt_pid_error(dtp, dpr, D_PROC_CREATEFAIL,
 				"failed to create entry probe for '%s': %s",
 				func, dtrace_errmsg(dtp, dtrace_errno(dtp)));
 			goto out;
@@ -254,15 +254,14 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 
 		off = strtoull(pp->dpp_name, &end, 16);
 		if (*end != '\0') {
-			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
+			rc = dt_pid_error(dtp, dpr, D_PROC_NAME,
 					  "'%s' is an invalid probe name",
 					  pp->dpp_name);
 			goto out;
 		}
 
 		if (off >= symp->st_size) {
-			rc = dt_pid_error(
-				dtp, pcb, dpr, D_PROC_OFF,
+			rc = dt_pid_error(dtp, dpr, D_PROC_OFF,
 				"offset 0x%llx outside of function '%s'",
 				(unsigned long long)off, func);
 			goto out;
@@ -272,8 +271,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
 					psp, DTPPT_OFFSETS) < 0) {
-			rc = dt_pid_error(
-				dtp, pcb, dpr, D_PROC_CREATEFAIL,
+			rc = dt_pid_error(dtp, dpr, D_PROC_CREATEFAIL,
 				"failed to create probes at '%s+0x%llx': %s",
 				func, (unsigned long long)off,
 				dtrace_errmsg(dtp, dtrace_errno(dtp)));
@@ -460,7 +458,6 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 {
 	dt_pid_probe_t *pp = arg;
 	dtrace_hdl_t *dtp = pp->dpp_dtp;
-	dt_pcb_t *pcb = pp->dpp_pcb;
 	dt_proc_t *dpr = pp->dpp_dpr;
 	pid_t pid = Pgetpid(dpr->dpr_proc);
 	GElf_Sym sym;
@@ -504,8 +501,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 		if (dt_Pxlookup_by_name(dtp, pid, pp->dpp_lmid, obj,
 					pp->dpp_func, &sym, NULL) != 0) {
 			if (!strisglob(pp->dpp_mod)) {
-				return dt_pid_error(
-					dtp, pcb, dpr, D_PROC_FUNC,
+				return dt_pid_error(dtp, dpr, D_PROC_FUNC,
 					"failed to lookup '%s' in module '%s'",
 					pp->dpp_func, pp->dpp_mod);
 			} else
@@ -635,7 +631,7 @@ dt_pid_fix_mod(dt_pid_probe_t *pp, dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
  */
 static int
 dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
-			      dt_pcb_t *pcb, dt_proc_t *dpr)
+			      dt_proc_t *dpr)
 {
 	dt_pid_probe_t pp;
 	int ret = 0;
@@ -644,7 +640,6 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	pp.dpp_dtp = dtp;
 	pp.dpp_dpr = dpr;
 	pp.dpp_pr = dpr->dpr_proc;
-	pp.dpp_pcb = pcb;
 	pp.dpp_nmatches = 0;
 	pp.dpp_dev = makedev(0, 0);
 	pp.dpp_inum = 0;
@@ -654,7 +649,7 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	 * we get a nicer error message.)
 	 */
 	if (pid == getpid())
-		return dt_pid_error(dtp, pcb, dpr, D_PROC_DYN,
+		return dt_pid_error(dtp, dpr, D_PROC_DYN,
 				    "process %s is dtrace itself",
 				    &pdp->prv[3]);
 
@@ -663,7 +658,7 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	 * hidden some magic in ld.so.1 as well as libc.so.1).
 	 */
 	if (dt_Pname_to_map(dtp, pid, PR_OBJ_LDSO) == NULL) {
-		return dt_pid_error(dtp, pcb, dpr, D_PROC_DYN,
+		return dt_pid_error(dtp, dpr, D_PROC_DYN,
 			"process %s is not a dynamically-linked executable",
 			&pdp->prv[3]);
 	}
@@ -685,15 +680,15 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 		    (aout = dt_Pname_to_map(dtp, pid, "a.out")) == NULL ||
 		    (pmp = dt_Pname_to_map(dtp, pid, pp.dpp_mod)) == NULL ||
 		    aout->pr_vaddr != pmp->pr_vaddr) {
-			return dt_pid_error(dtp, pcb, dpr, D_PROC_LIB,
-			    "only the a.out module is valid with the "
-			    "'-' function");
+			return dt_pid_error(dtp, dpr, D_PROC_LIB,
+				"only the a.out module is valid with the "
+				"'-' function");
 		}
 
 		if (strisglob(pp.dpp_name)) {
-			return dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
-			    "only individual addresses may be specified "
-			    "with the '-' function");
+			return dt_pid_error(dtp, dpr, D_PROC_NAME,
+				"only individual addresses may be specified "
+				"with the '-' function");
 		}
 	}
 
@@ -818,7 +813,7 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
  */
 static int
 dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
-			       dtrace_probedesc_t *pdp, dt_pcb_t *pcb)
+			       dtrace_probedesc_t *pdp)
 {
 	const dt_provider_t *pvp;
 	int ret = 0;
@@ -897,8 +892,8 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 	if (dpr_caller == 0) {
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
 						DTRACE_PROC_SHORTLIVED) < 0) {
-			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
-			    "failed to grab process %d", (int)pid);
+			dt_pid_error(dtp, NULL, D_PROC_GRAB,
+				     "failed to grab process %d", (int)pid);
 			return -1;
 		}
 		dpr = dt_proc_lookup(dtp, pid);
@@ -1041,11 +1036,11 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 
 			psp.pps_fn = Pmap_mapfile_name(dpr->dpr_proc, pmp);
 			if (psp.pps_fn == NULL) {
-				dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
-					     "Cannot get name of mapping containing "
-					     "%sprobe %s for pid %d\n",
-					     tp->tracepoint.is_enabled ? "is-enabled ": "",
-					     prb, dpr->dpr_pid);
+				dt_pid_error(dtp, dpr, D_PROC_USDT,
+					"Cannot get name of mapping containing "
+					"%sprobe %s for pid %d\n",
+					tp->tracepoint.is_enabled ? "is-enabled ": "",
+					prb, dpr->dpr_pid);
 				goto oom;
 			}
 
@@ -1082,11 +1077,11 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 				   psp.pps_prv, psp.pps_mod, psp.pps_fun,
 				   psp.pps_prb, psp.pps_pid, psp.pps_off);
 			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
-				dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
-					     "failed to instantiate %sprobe %s for pid %d: %s",
-					     tp->tracepoint.is_enabled ? "is-enabled ": "",
-					     psp.pps_prb, psp.pps_pid,
-					     dtrace_errmsg(dtp, dtrace_errno(dtp)));
+				dt_pid_error(dtp, dpr, D_PROC_USDT,
+					"failed to instantiate %sprobe %s for pid %d: %s",
+					tp->tracepoint.is_enabled ? "is-enabled ": "",
+					psp.pps_prb, psp.pps_pid,
+					dtrace_errmsg(dtp, dtrace_errno(dtp)));
 				ret = -1;
 			}
 			free(psp.pps_fn);
@@ -1183,7 +1178,7 @@ dt_pid_usdt_mapping(void *data, const prmap_t *pmp, const char *oname)
  * Extract the pid from a USDT provider name.
  */
 pid_t
-dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
+dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	       dt_proc_t *dpr)
 {
 	pid_t pid;
@@ -1196,7 +1191,7 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 	}
 
 	if (last == NULL || (*(++last) == '\0')) {
-		dt_pid_error(dtp, pcb, dpr, D_PROC_BADPROV,
+		dt_pid_error(dtp, dpr, D_PROC_BADPROV,
 			     "'%s' is not a valid provider", pdp->prv);
 		return -1;
 	}
@@ -1205,7 +1200,7 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 	pid = strtol(last, &end, 10);
 
 	if (errno != 0 || end == last || end[0] != '\0' || pid <= 0) {
-		dt_pid_error(dtp, pcb, dpr, D_PROC_BADPID,
+		dt_pid_error(dtp, dpr, D_PROC_BADPID,
 			     "'%s' does not contain a valid pid", pdp->prv);
 		return -1;
 	}
@@ -1218,24 +1213,22 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
  * created, since there might still be USDT probes) and -1 on error.
  */
 int
-dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
+dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
 {
 	pid_t pid;
 	char provname[DTRACE_PROVNAMELEN];
 	dt_proc_t *dpr;
 	int err;
 
-	assert(pcb != NULL);
-
 	/* Exclude pid0 from being specifically requested. */
 	if (strcmp(pdp->prv, "pid0") == 0) {
-		dt_pid_error(dtp, pcb, NULL, D_PROC_BADPID,
+		dt_pid_error(dtp, NULL, D_PROC_BADPID,
 			     "pid0 does not contain a valid pid");
 		return -1;
 	}
 
 	/* Extract the pid. */
-	pid = dt_pid_get_pid(pdp, dtp, pcb, NULL);
+	pid = dt_pid_get_pid(pdp, dtp, NULL);
 	if (pid <= 0)
 		return 0;
 
@@ -1247,15 +1240,15 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
 	/* Grab the process. */
 	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
 					DTRACE_PROC_SHORTLIVED) < 0) {
-		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
-		    "failed to grab process %d", (int)pid);
+		dt_pid_error(dtp, NULL, D_PROC_GRAB,
+			     "failed to grab process %d", (int)pid);
 		return -1;
 	}
 	dpr = dt_proc_lookup(dtp, pid);
 	assert(dpr != NULL);
 
 	/* Create the pid probes for this process. */
-	err = dt_pid_create_pid_probes_proc(pdp, dtp, pcb, dpr);
+	err = dt_pid_create_pid_probes_proc(pdp, dtp, dpr);
 	dt_proc_release_unlock(dtp, pid);
 
 	return err;
@@ -1263,8 +1256,7 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
 
 static int
 dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
-		 dt_pcb_t *pcb, const dt_provider_t *pvp, char *path,
-		 unsigned long addr_start)
+		 const dt_provider_t *pvp, char *path, unsigned long addr_start)
 {
 	size_t shstrndx, noff, doff, off, n;
 	const prmap_t *pmp = NULL;
@@ -1282,8 +1274,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 
 	fd = open(path, O_RDONLY);
 	if (fd < 0) {
-		dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
-			     "Cannot open %s: %s\n",
+		dt_pid_error(dtp, dpr, D_PROC_USDT, "Cannot open %s: %s\n",
 			     path, strerror(errno));
 		return -1;
 	}
@@ -1400,9 +1391,9 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 			mapfile = Pmap_mapfile_name(dpr->dpr_proc, pmp);
 
 		if (!mapfile) {
-			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
-				     "Cannot get name of mapping containing probe %s for pid %d\n",
-				     psp.pps_prb, dpr->dpr_pid);
+			dt_pid_error(dtp, dpr, D_PROC_USDT,
+				"Cannot get name of mapping containing probe %s for pid %d\n",
+				psp.pps_prb, dpr->dpr_pid);
 			err = -1;
 			break;
 		}
@@ -1418,10 +1409,10 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		psp.pps_nameoff = 0;
 
 		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
-			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
-				     "failed to instantiate probe %s for pid %d: %s",
-				     psp.pps_prb, psp.pps_pid,
-			dtrace_errmsg(dtp, dtrace_errno(dtp)));
+			dt_pid_error(dtp, dpr, D_PROC_USDT,
+				"failed to instantiate probe %s for pid %d: %s",
+				psp.pps_prb, psp.pps_pid,
+				dtrace_errmsg(dtp, dtrace_errno(dtp)));
 			err = -1;
 		}
 		if (err == -1)
@@ -1440,8 +1431,8 @@ out:
 
 static void
 dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
-				  dt_pcb_t *pcb, const dt_provider_t *pvp,
-				  dt_proc_t *dpr, const char *proc_map)
+				  const dt_provider_t *pvp, dt_proc_t *dpr,
+				  const char *proc_map)
 {
 	char line[1024];
 	FILE *fp = NULL;
@@ -1493,12 +1484,12 @@ dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 					 pid, dirent->d_name);
 				if (stat(path, &s) != 0 || s.st_ino != inode)
 					continue;
-				if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp,
-						     path, addr_start - file_offset) != 0)
+				if (dt_stapsdt_parse(dtp, dpr, pdp, pvp, path,
+						     addr_start - file_offset) != 0)
 					break;
 			}
 		} else {
-			if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp, name,
+			if (dt_stapsdt_parse(dtp, dpr, pdp, pvp, name,
 					     addr_start - file_offset) != 0)
 				break;
 		}
@@ -1507,7 +1498,7 @@ dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 }
 
 static int
-dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
+dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
 {
 	const dt_provider_t *pvp;
 	dt_proc_t *dpr = NULL;
@@ -1518,8 +1509,6 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
 	if (len == 0)
 		return 0;
 
-	assert(pcb != NULL);
-
 	pidstr = &pdp->prv[len];
 
 	while (isdigit(*(pidstr - 1)))
@@ -1535,20 +1524,27 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
 		return 0;
 	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
 			      DTRACE_PROC_SHORTLIVED) < 0) {
-		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
-			     "failed to grab process %d",
-			     (int)pid);
+		dt_pid_error(dtp, NULL, D_PROC_GRAB,
+			     "failed to grab process %d", (int)pid);
 		return 1;
 	}
 	dpr = dt_proc_lookup(dtp, pid);
 	if (dpr) {
 		char *path = NULL;
 
-		if (asprintf(&path, "/proc/%s/maps", pidstr) == -1)
-			longjmp(pcb->pcb_jmpbuf, EDT_NOMEM);
-		dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
-						  pvp, dpr, path);
-		free(path);
+		if (asprintf(&path, "/proc/%s/maps", pidstr) == -1) {
+			if (dtp->dt_pcb != NULL)
+				longjmp(dtp->dt_pcb->pcb_jmpbuf, EDT_NOMEM);
+			else
+				path = NULL;
+		}
+
+		if (path != NULL) {
+			dt_pid_create_stapsdt_probes_proc(pdp, dtp, pvp, dpr,
+							  path);
+			free(path);
+		}
+
 		dt_proc_release_unlock(dtp, pid);
 	}
 
@@ -1556,14 +1552,12 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
 }
 
 int
-dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
+dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
 {
 	glob_t globbuf;
 	char *globpat = NULL;
 	int err = 0, i, nmatches = 0;
 
-	assert(pcb != NULL);
-
 	/* If it cannot end with a pid, we're done. */
 	if (pdp->prv[0] != '\0') {
 		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
@@ -1606,14 +1600,14 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
 		pdptmp.prb = pdp->prb[0] == '\0' ? "*" : pdp->prb;
 
 		/* Create USDT probes for this process. */
-		if (dt_pid_create_usdt_probes_proc(dtp, pid, NULL, &pdptmp, pcb))
+		if (dt_pid_create_usdt_probes_proc(dtp, pid, NULL, &pdptmp))
 			err = 1;
 	}
 	free(globpat);
 	globfree(&globbuf);
 
 	if (err == 0)
-		err = dt_pid_create_stapsdt_probes(pdp, dtp, pcb);
+		err = dt_pid_create_stapsdt_probes(pdp, dtp);
 
 	/* If no errors, report success. */
 	if (err == 0)
@@ -1667,7 +1661,7 @@ dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
 			dtrace_probedesc_t	pd;
 
 			pdp = &stp->ds_desc->dtsd_ecbdesc->dted_probe;
-			pid = dt_pid_get_pid(pdp, dtp, NULL, dpr);
+			pid = dt_pid_get_pid(pdp, dtp, dpr);
 			if (pid != dpr->dpr_pid)
 				continue;
 
@@ -1675,7 +1669,7 @@ dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
 			pd.fun = strdup(pd.fun);	/* we may change it */
 
 			if (gmatch(provname, pdp->prv) != 0 &&
-			    dt_pid_create_pid_probes_proc(&pd, dtp, NULL, dpr) != 0)
+			    dt_pid_create_pid_probes_proc(&pd, dtp, dpr) != 0)
 				ret = 1;
 
 			/*
@@ -1683,7 +1677,7 @@ dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
 			 * a USDT provider.
 			 */
 			if (strcmp(provname, pdp->prv) != 0) {
-				if (dt_pid_create_usdt_probes_proc(dtp, -1, dpr, pdp, NULL) < 0)
+				if (dt_pid_create_usdt_probes_proc(dtp, -1, dpr, pdp) < 0)
 					ret = 1;
 				else
 					dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
diff --git a/libdtrace/dt_pid.h b/libdtrace/dt_pid.h
index c35adc2c..f59bdfdd 100644
--- a/libdtrace/dt_pid.h
+++ b/libdtrace/dt_pid.h
@@ -16,12 +16,10 @@
 extern "C" {
 #endif
 
-extern int dt_pid_create_pid_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
-				    dt_pcb_t *);
-extern int dt_pid_create_usdt_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
-				     dt_pcb_t *);
+extern int dt_pid_create_pid_probes(dtrace_probedesc_t *, dtrace_hdl_t *);
+extern int dt_pid_create_usdt_probes(dtrace_probedesc_t *, dtrace_hdl_t *);
 extern int dt_pid_create_probes_module(dtrace_hdl_t *, dt_proc_t *);
-extern pid_t dt_pid_get_pid(const dtrace_probedesc_t *, dtrace_hdl_t *, dt_pcb_t *,
+extern pid_t dt_pid_get_pid(const dtrace_probedesc_t *, dtrace_hdl_t *,
 			    dt_proc_t *);
 
 #ifdef	__cplusplus
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e94827f2..101956e5 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -645,23 +645,13 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 static int discover(dtrace_hdl_t *dtp)
 {
 	int		i;
-	dt_pcb_t	pcb;
 
 	/* Clean up stale pids from among the USDT probes. */
 	clean_usdt_probes(dtp);
 
 	/* Discover new probes, placing them in dt_probes[]. */
-	/*
-	 * pcb is only used inside of dt_pid_error() to get:
-	 *     pcb->pcb_region
-	 *     pcb->pcb_filetag
-	 *     pcb->pcb_fileptr
-	 * While pcb cannot be NULL, these other things apparently can be.
-	 */
-	memset(&pcb, 0, sizeof(dt_pcb_t));
-	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
-		dt_pid_create_usdt_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb);
-	}
+	for (i = 0; i < dtp->dt_stmt_nextid; i++)
+		dt_pid_create_usdt_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp);
 
 	return 0;
 }
-- 
2.51.0

