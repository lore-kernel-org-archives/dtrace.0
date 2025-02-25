Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E21A213235
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740520335; cv=fail; b=cNlocs+/pX1EJLQ46/pJAZjZqdpxCq0uhyKHwsLiTijJ89MM+4TojDn+fO4/5tlhjlGLzdjrOAYW21HIADtWnq3K9AluMTWgrsKAy24ZqsmMOn1vLeMUwtIOmym578iUMwSBGWz3S9aN8oJO/BcE0BK0Lvpaq5y7otoiti8H0NY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740520335; c=relaxed/simple;
	bh=jwowoS5Sk4xNrKLqArh8tCtBKD7U05CZDVemEmRIOIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z6xA6gMc0fklgIKk+WQuT+0JpUll3VEl3OV5DtXl/EuhmTT2qNTvlyKFLug4BnlaeLasheCHQbWECY6LZxl6+ASulbjADPSjNCAKITBpYOJNT8A5bZ14Nhp/T+TIxUHGIyI3Myh/LVyLNPv/2WmZEyyUOv0B84jM9fLIqrfMZ+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R/0u30SI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v7EJjiBs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R/0u30SI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v7EJjiBs"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PLfYDX019218
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Ku/xUM//uiCqePJ7pw
	BdIOfCHbUs5t8FTRPu9bintdE=; b=R/0u30SIQw5eqkfvu0HnMkojVh5mIrcOnr
	aJK+V7LmWJiHGkbdsbNVLuZdUj4D6Dx28CNC77u/TAwkYSl8S/TSrnshofy/w1sM
	2JNFPaAY/et7bxSGZI+051j4MeFJX8EJZsw3iTI6RYXQ9U6FkrUoDYGySsBK9frn
	+ooB0bk3PVEhwr3PdErqqvcCxGwMyg+OO5uARl5hvJede0aJ4xOsLEzMfGCMvgdJ
	nvkjs+Sh4n/PQjuiBAuFO1lGes9uOJFDXRgl3xPaMPvYzHjQZYIr1In0yQ+PBFpM
	IJcSBJOO8xVRJ8MDAs2NS4lTY5Ezf+dnBohB/DGSo56V8roKKBGw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y50bpcnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:52:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PK350d002696
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:52:11 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y51a3gj1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:52:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJeEuTkIdu9ABtVKB47Fbpd5XTvhz1WOvcGlf5dKcPmfINTy4cxZcJvVBC/2aKpzuy14OigRc8sS910k94TvhLHuuqbPCjHC+OCzXq735j0ZzFMFIZZRoLBn2DnstKOGjIAlYb3NQXelP4unVNZUbB16jNLhSZ5LD/bA2vjrtuz1PSBhCP4e2jQpnU6WNUjBRQz8PsTYYzFO2cg3nmrhS+DRRe267JKKD9T7hQachBrRsz+UjY8GG8/YogrnHz+TT/pzEDzxH13gU333/FwjIJILRtoTvAV3sLajLAUo/L5rQWiBzMGOLd+GY2dSKo3qmMhNktZvUtFUZvBm+pCF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ku/xUM//uiCqePJ7pwBdIOfCHbUs5t8FTRPu9bintdE=;
 b=ywBW5XzBPkmGK6aPtjfbsg8eGu/CaZObtzKCkU7d9r8RsR9A2m/qpZ7/pxFMFocrKccMKoNWm69ZcaszrXznUDv8Tf4SgMMAVYPS/ozp3pLSj9argh5UYoFzTxjBUTwPblUjxQ2uY5aU794Nq8xVFUf8Wyw7O56UcVjVsuLncDS7qDgDmWIdBdhTg+HwEEZ1U9jcaNWHlbNIGZ+eIyiU34e/xzQ1orUA7u7n3kqK6ysy4lAXtMoM76EDVLv/Zxpe6cMAh+YVrvnnXoIqRbBK6jYSGekRz018q6DCzKhDzH6rnmKe7ojR0fqylNK8/LSUs5UZB79UXXUzJmdYf6sZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku/xUM//uiCqePJ7pwBdIOfCHbUs5t8FTRPu9bintdE=;
 b=v7EJjiBsyCsYCkfihggoBuxkCLd4S2Ke7SWASRgNTZ5RoMNJpw0loWHgsGSkKEjM75fzPvuU0L+UhIIq4rIXPxWgD5eHi4meZ3LbI8vRVmJnY3fUww/Pdq4x7T4i1BorVJ92Mot4OHqsVthd6448P+w/iqduat+6BYXoxg8HdIM=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA3PR10MB6951.namprd10.prod.outlook.com (2603:10b6:806:304::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 21:52:07 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:52:07 +0000
Date: Tue, 25 Feb 2025 16:52:04 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 5/6] test: Move disassembly and extracting PCs earlier
Message-ID: <Z747hBIvrPczBNcI@oracle.com>
References: <20241220232547.19043-1-eugene.loh@oracle.com>
 <20241220232547.19043-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220232547.19043-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA3PR10MB6951:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f108f61-b820-4539-bcea-08dd55e6a5e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o7kpESj9C4q2cUdRsa3Fm2xBzK3tDv2o8w8wdwtGmenn6QFwL/CAhajbAF0P?=
 =?us-ascii?Q?5EDJJra/JZHvzjrvhC8TYGhjSSAKnious5ynGh3KKCXPpa7xrbGgJRpGWvzQ?=
 =?us-ascii?Q?8SGRnfkG/43owsDw76PaCuMbdkNZhB3K6gFxcIKzaz9A0rGlA9OP92LEVHMt?=
 =?us-ascii?Q?iB2d+6Igx0UVHu2CC7HqR6tfDHazgKWBQPs4D/Am+hJW02GDyX92Zga5ob0H?=
 =?us-ascii?Q?glyXSAnSGm1od8OpDU8M4aYPb8EEpa2uORyFGo3tGMm5eftoOg5QR2jOI6f1?=
 =?us-ascii?Q?x7lcQSGZzBLiUDKqtHqHyldiPMOd83OQ6snKW92P7AyhbCQGJ/+TTcZpUIVx?=
 =?us-ascii?Q?lDfZKss736KWHHf2PyLBk+IZfCWTFmFKOyDZBzEz0xhOOa/gfKH9V9vf9KhK?=
 =?us-ascii?Q?nfDy2u6mPNii8YGJdbXSzllvT6d25vAOe6AVR6zUEuuspsQ9FIf2uuWXzPph?=
 =?us-ascii?Q?Rjp/Aw1TEUKC/6eSxNsZfXhBYwK3jnHSJ8tiq66uxOIyuRhsUsyivc3vwtyF?=
 =?us-ascii?Q?4Yg4afznlQIJjzUR10UK14wALlbU7Hy93a3+OpxItGDilzAcK1zpYRkC18XU?=
 =?us-ascii?Q?oPpEoHsfmDtBPbMtRKXA1001Gm88HnX1u2pme8yTfzJeV9SRfRBprHL5zSTk?=
 =?us-ascii?Q?lyuEP55aQk4tbnedNkaz2z5Pq/6+dmeQgUFMxnua5EJRlS6EK5B5eZ6tdbaE?=
 =?us-ascii?Q?ulnzrJPCiynatbPwcFzsHYzEIzjUc7zwaD3eANiIT3/7+/P0QyDjUqfgXWLX?=
 =?us-ascii?Q?LwZsVu+70WKCltPSz8ztbOBVCL6sngaMAcixSPw2Hxk7AAPeMSRTePgan+2n?=
 =?us-ascii?Q?BNj6VTvSvtD7NcAnylPqUhG87wOQfdV5Q/NFy1GI53s5iV05WRccOTsN4ObA?=
 =?us-ascii?Q?dkwzLyu7aziuYbF8Q2HHH5pNgAjnruQpc+A6G7EaJTrTci6iIUp7GzhF3N9C?=
 =?us-ascii?Q?uE7FVCsxLfBNyVHh7aYY4eNr6EVtNXsjC38JPsq8qXcJ1RDqfBs+wxX8Q5t9?=
 =?us-ascii?Q?EHrjfHVr1M20YJk7VvoJgYe4QZbViJAX0I/5bHokf7EnK70t4VIchc8U9r+x?=
 =?us-ascii?Q?QQXd/DKspquOril1iUP8rhy1i9o2TiK0PQKXGdjMcimfdtXu1SX8E8nGXHfu?=
 =?us-ascii?Q?K8Rlo++WmecFOre23cSls+YXa45sXiGXooY4AovE7FYFEyfsJvMkeeKcLSrO?=
 =?us-ascii?Q?hL0AoRA5XguBz+3+1Sct1P620WvFLsX0TNe4gBA1gUz0rC8Tbqk1CaWGkoqb?=
 =?us-ascii?Q?FW5zBNmd2lLdRqBXObiZLfz2SJy+lXuSLnrQ7OPMAoHqUHK8gapNeQrQ4uKp?=
 =?us-ascii?Q?5/h6o4kYYiXILNCBdVu20a644qw9sR4BNAjSi/Aeet2c88bBT5SSxyML86FT?=
 =?us-ascii?Q?lyTs4++aFT1qX9rpwaoFtkJZ5t1l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0AJiy/ALB32W8XNlMkRt7SmmzySTUGDAZj8pPfSJAXOfvo2WvtrQniibSMKh?=
 =?us-ascii?Q?lfKRQ6ClbZu+Q6kUk/qxO91fPetQjRE9D48vOgQH8vqzgR7cB8PC2EGMvcuT?=
 =?us-ascii?Q?CI9W5AlX9nOuevRtNQ0a53bFdT3SODsXt7QcjK8kA0uV69ptMZrJ8FcKmcu5?=
 =?us-ascii?Q?4hO3unvwpYxH3R17q2/yDN1DycjhhSw3XAeBimJHfs5N1QgMZn8EbP5mT3FO?=
 =?us-ascii?Q?7yRaPfwiQDgEhNer9S1kc+++EgEkH+gVKDU5gfn908+XsogiqxilYL63gFsH?=
 =?us-ascii?Q?KfVvEbuLSBC54te2G8U+f7WgW6YSeAxdnQs1eAsmcyY8QLTRGvtNkT2l0Tnd?=
 =?us-ascii?Q?zy22iop9o+ZlZmpjGWp4MrhCedDtZelCmnswAdZsFktvVuphLTU0ExhzouWj?=
 =?us-ascii?Q?mlx1FYGbuzfSqnK9OWW5FgT4u/1Af4Iq2fwAZUyyGsDrUfLzvhvv5pRtlYKo?=
 =?us-ascii?Q?6Fp/sixVr1nYNejVI7kuSVGDTuie4RjYkjP5Bwo6erphrnsdOxurLqz1pLrn?=
 =?us-ascii?Q?3ZiuLxtfjWbiZhN66FZEI7HcFQoZ+vz/dsVoMzhAap3Mok1M8QMALxBbk58J?=
 =?us-ascii?Q?UlNyf8RbhxCcWg5Xs/eZ2RljVVdSEitLXY1FAvyJ0Qp9Ge2sfjC9VtMmvBha?=
 =?us-ascii?Q?U1Ol9zBSBYuXLKHdPrjHYcndOMFaIdI+xGEysUZL1WElDRdbJClfQIXEbW+H?=
 =?us-ascii?Q?FlTGgTHcRTSKbGaTrqkzBwDC2HXTcOAyXEpanYKW3puNusEIq992+7VcrS57?=
 =?us-ascii?Q?9oQkzturL3krtc1nejrqM/cOeNDKRFNGCL/77qbmzwQ6vCE6OBhpYOQZFkCy?=
 =?us-ascii?Q?zAbhKA146o9QLNoYq4DTJrDffFyOpKxLwsyxGHMTCThsLMNun0NN5gPPc3LS?=
 =?us-ascii?Q?2IkoDe04CDlI1yxPI8vzAfD8OzJyoEU+ZIRgCrIggJwYtrdH1Yq45DtVCIVM?=
 =?us-ascii?Q?h+Yi1uj+XpXoIx6PyJzFxFb01nL1wQjJpyveUPiOgP4c+w2gdo3GSknUDKXD?=
 =?us-ascii?Q?rcAfMQI25GhAGmuRtdvvnyp5zxZlIEZct2swYDQKSptCRCXsUoG6g8lk3Ytz?=
 =?us-ascii?Q?DB0B5zNrq3q1YvbiirBQl5x3t9gl2EwcCkjUbcD5qXv4t0zGbTNsOlH7VdAr?=
 =?us-ascii?Q?uCEYTiQmm84ZADbzPVHJ897E2p+f0t4b2EfwgEyOmxy4DaGRka1FCXCsVn8t?=
 =?us-ascii?Q?Sww1zBoA4kuW9Ntor4qGUWu3UG9YbJd3aD4IKgd1FaJ9DDqLSb8Z/dbcQPRC?=
 =?us-ascii?Q?3roExgXtmnfsUExiS45ANwxrBF+d38NNzpDEKMHwZWZ7Rl6zB6sm/tSKtLw2?=
 =?us-ascii?Q?wqPScN9rfjEhIOlkrFcHX5Brr9ympo7W5QvmYtzHtulbG+k/boLvAtmppUyt?=
 =?us-ascii?Q?7YF+mobStSeffiiLyatbaX0WrJq9lQZZr8gguWIFNlVUsAKjUkrDiFQuPkOb?=
 =?us-ascii?Q?v3LqkNJnRyLRWwtdFwYyPnWK4sZ/rNFv6lufIlwGPrrTefTLxgk6lAg2Tldg?=
 =?us-ascii?Q?v5wdaPScMY3RfxCr7A0NDLUyFVXBVZtivAGmVm4+12QyQq3imrgK1mI4hBX1?=
 =?us-ascii?Q?hou01JF9olg0jD0uKUTNIp9EcQGburwqQBbj7r7uhO/xfi4MxWwCXf4FV0Dm?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kBxhbbjYVdb021oWEWWRTqqFnrhP1C5rO4mIwKGaT1Kda1s5YhHwaiKNOCYs1CTy12Ot0WR8AZjHhGyrSeQCN0QlZTAEFEwVHws3FcI/zeFZzgdr7mR6VhjZ6AXnQVTIiyVNn4KLNy1bAo5EDeRRW8M616iQTBZCZF94U6sq0ktBHv9o9sDKA+McooOHhHnWSM2nS3tjW5jf+5m6HeWAjqqNRz9OOObUd2oh/i1/PWc0iYXcjNdBEIqaJRn8EzqdlidL+YSjvSfZiNtfrtTsMFWw6Y9tfoBvFmHJVHD5Mu5zUXsMuS2wR8tml+b4kU8gfEWI3JbEguz2F4H6wgc72iOOqaPq18n8RvtduBbvqs7TSmBhk2parSFVSGGJD3z5taGaTkh/+ua+wwkkfa7DnCAwLVeNPgFSxZmmyHRKH9wv1sQeEM/YtrC0gj8+T97RyIRfMWKvWheIIAu+1sVHR3vuY02k9UqgysVqVqFKzyISRtZSrk576kyrGFrCvEdi9hYklQzLqCe74LL9grO0yOwjcC9GSm82Wo8fLV4RtSRRZ9I+XQny4+7u8BfMgtfcJti2/1eJbnqt5dgivLNZFWmZbxgIH0K7uK5pIquOV64=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f108f61-b820-4539-bcea-08dd55e6a5e3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:52:07.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaNYw4dLLQRErz04HDt+q/A8XJu8MbY4phnZeoWusK7foXjU4Xt5wPTL2lDuRo2FVqeRhWezD6D8rPhQUKn+fEbEctDm1btxPJPHVOBs94g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6951
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_07,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=930 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502250130
X-Proofpoint-ORIG-GUID: vF_2-Ut-LxOqF3WYEkg4xqujL2AixY1d
X-Proofpoint-GUID: vF_2-Ut-LxOqF3WYEkg4xqujL2AixY1d

On Fri, Dec 20, 2024 at 06:25:47PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> This will allow a future patch to use the PCs earlier in the test.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  test/unittest/usdt/tst.pidprobes.sh | 33 +++++++++++++++++------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
> index 6fe6d752a..54444d49b 100755
> --- a/test/unittest/usdt/tst.pidprobes.sh
> +++ b/test/unittest/usdt/tst.pidprobes.sh
> @@ -102,6 +102,25 @@ if ! diff -q main.out main.out.expected > /dev/null; then
>  	exit 1
>  fi
>  
> +# Disassemble foo().  (simplify with --disassemble=foo)
> +
> +objdump -d main | awk '
> +BEGIN { use = 0 }             # start by not printing lines
> +use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
> +use == 1 { print }            # print lines
> +/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
> +' > disasm_foo.txt
> +if [ $? -ne 0 ]; then
> +	echo cannot objdump main
> +	objdump -d main
> +	exit 1
> +fi
> +
> +# From the disassembly, get the PCs for foo()'s instructions.
> +
> +pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
> +pc0=`echo $pcs | awk '{print $1}'`
> +
>  # Run dtrace.
>  
>  cat >> pidprobes.d <<'EOF'
> @@ -153,20 +172,6 @@ if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
>  fi
>  pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
>  
> -# Disassemble foo().
> -
> -objdump -d main | awk '
> -BEGIN { use = 0 }             # start by not printing lines
> -use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
> -use == 1 { print }            # print lines
> -/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
> -' > disasm_foo.txt
> -
> -# From the disassembly, get the PCs for foo()'s instructions.
> -
> -pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
> -pc0=`echo $pcs | awk '{print $1}'`
> -
>  # From the disassembly, get the PCs for USDT probes.
>  # Check libdtrace/dt_link.c's arch-dependent dt_modtext() to see
>  # what sequence of instructions signal a USDT probe.
> -- 
> 2.43.5
> 
