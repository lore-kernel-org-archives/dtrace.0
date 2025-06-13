Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383C2E406
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826676; cv=fail; b=hCIIj4j2mPk1U7VaM+ZbX0I07HkHnMqBPC7+ICfN5JwAuiL0JhAKpJlmHtxErPNilrBbSM1gfcycMQhUkimU9eQuR69c7cu+IrFigEs4aEtkOtLOSVRpwOzo2yzuxPiW84JDex2p96Trv9/9bgtYOPSdyUxHpEfsUgUkYp33oRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826676; c=relaxed/simple;
	bh=jdCVSeVwLDbznezFa1EAhYLQGTsI25Lyvn3w6ryraVk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=sxWzcN+eXu5rkhnyMDv/0CaEmpt8rzfC7Ur8csct/icLhb6SdHOcKHj6CFQxcNPxZtwRoYzvmEBFwRt+i0AgBRUzn9hLAbU/UGsJtopix3Ao4dCqNQn+ZEqjUTm4EyvQkPK3znyj55LncALeCkAALjafNTkawyyrGHt0bzseh90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YfnIaSAo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HyeqFZwI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YfnIaSAo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HyeqFZwI"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtdO6007824
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=voxKD84IXD4xNG132b
	oM9HX6481rfULp1gdorq55vNw=; b=YfnIaSAooAPiQJCx/rUty99kBlVVOFJjtf
	JM2t2l4cufTe5i2n5SkAH8Jkm/lyiSa+tGN0ciswLmIu43aSS4l6IsrFwuTk/NPF
	V3Te31JfIj5WA/HR8mGm0giYqHthysn6HkdJphmLWk6Wj/xAfpwASTllRo5T5i5g
	QmkJQRfLIy+6b8XfsIPvTIzq1+1+3YNv2syidAx63jytA9UlQkvNnRQnnwEhXsMy
	pRI4l52RTqPzwI1SBrtwV3ImHkIx7QTeXerY9xr4G+3xYTL+adQ8CQOO5bZjh2zC
	SEF+lCfiRFLgZp7iKDigcUJHqFihNi56xroP/NxM8H3yPJIIea4g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dyx3txm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:57:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEpJ24032081
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:57:53 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvd0knh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:57:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9nyf4SBes9RUaY+4qWBPBKLQmglxCD3VqCl6qQP6sbDxMqDtl63v09wGqHGGzohMBjVAgQ5c80a8iCt9CWfA7/CLPeyo8i7pEb6NFSjrP0C4x8UxzpnVrVPuKZ1GxonWemMYcXD+yD0/lN4mGztoY14tKQh+LmOa9blHhh04qVLkFmChbru5WCIh38xvJho0FjTKTIFEkEbjBGUzaOt14i+CeSsn90JSyPCwyUFSCLaiGu4D7LQlRIlwp5hvqPmOTL9mX3tBJVIaOA+E4tQwl6hbpAFKFfYP9J99aIPRnnNdEkh4+v1JqxkZ6SFYiZdp7GBqkbIuYL/CzwmW47NlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voxKD84IXD4xNG132boM9HX6481rfULp1gdorq55vNw=;
 b=C1dycR4Y7UKcxOpitzMhQt/NNXwlKIQ7A3N6po6Rwoh1663bsGcJ+LC53uk/0DjgtoV3gbSbq63QR77H9ogwQqayEIKvn3MuWtDAg9XwFNySkN+dFvVrcxvZypPXAhle9jgj+y5urNeY6loKLxV181dRc2CUFas/Bst9o6XrOD4Vhllt5zHvFlTxTzZN1pyOMCtsljhDbWBk6ijadZcraQ5st0AL3Krb/nyCvFtRM2blkT5vV5pp3uEvc7v/EzYN5zW56hG2IA6ZTLrWU8Ya6KwzedfVPokiP8rZdpICgt1s9GOoJWFKhhIZOZfnMLPHs8NzYmGuBBhD2Cb/5vgGUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voxKD84IXD4xNG132boM9HX6481rfULp1gdorq55vNw=;
 b=HyeqFZwIEvnlBNNBUVPhT7J/KBPivZovVPArBIx9CqZvZB3JVO+fULWWUtEIZRycnTw7c/kvyJC4yMD4PGsMv6DyD5nxVVdZIOGQtNvgmjMOHKUGE1J0Xgog0Oo74RI0shJQMZIeW5ZnRtRkvk4dZmGpvR1kAubHr17Mjq0H31U=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA0PR10MB6700.namprd10.prod.outlook.com (2603:10b6:208:440::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 14:57:50 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:57:50 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 14/14] Test: caller and stackdepth tests for lockstat
 provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-14-eugene.loh@oracle.com>
Emacs: it's all fun and games, until somebody tries to edit a file.
Date: Fri, 13 Jun 2025 15:57:48 +0100
In-Reply-To: <20250522180118.27343-14-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:18 -0400")
Message-ID: <875xgzbser.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0387.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::15) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA0PR10MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: 72758314-e307-4b29-77f6-08ddaa8aaae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ORHhOwFL4YINfA5GJr4vRouVg1g4RPw0h0FEFLzpZGjqabZYL7/kBg+3DQl9?=
 =?us-ascii?Q?TdnpKXDJaz7q/6pc5IAvgg5N4jJDzSMwz2WLo0EGA1aw6cp9u8sIUtGHb4sX?=
 =?us-ascii?Q?1pxiOSDbAWro3aLBXxNtgKTsRE428zRUiNz7a00v0pa7cjM9C4JOdCZQi9kK?=
 =?us-ascii?Q?d1CebqjsiswbS1PoKQ9FAx9ah6R/GC0DODBZboXFmeBQdg5GXEhZjYmTThQL?=
 =?us-ascii?Q?8FypEVntFkgdvnE6cn9OtSzgd5Yg1WVpxsn0fd6EonouWB4aQzz+eLo6jFqo?=
 =?us-ascii?Q?CyK2MHsrTVgjyDxkIrxeWG8pmAkojVNSBNeh4yBe6jk3AtmHjJIK6hhAUW0l?=
 =?us-ascii?Q?OJDZIoDjFi0aMoHpEsBXYJDQ0hR246RELq2ttW8ktw/3RIMzyaJfqaXX06Dw?=
 =?us-ascii?Q?tqJ5FFYDQcUbIxF0gzFY02/BCJc9HYVAjlUJX0KJ90Zw5azx8e30ld/ldDb8?=
 =?us-ascii?Q?rHDxFTaDq7SVDP23itzAUM6mLBrVPmhdRJxKxBdSXV5YAyqqNa+9N63PAjBI?=
 =?us-ascii?Q?ON0SwTe6C8ACIramhLkJQPJ3gR0UK5t7PGYa1Wz9/AizQZn5klH4OQnd37wu?=
 =?us-ascii?Q?0aXmo/+h1YUrexIsjyX4bhXh7D1L27bgWl37f6qOv1Tv5xk5h5T9zhK/Y9rU?=
 =?us-ascii?Q?rCMB+LqaDC0fT/V3nZeR7HCdI7j+iZKE3E55V+O+gBV4JaEcRDIomaXEAyc3?=
 =?us-ascii?Q?2uxY9HuKMinfqx9V+Tf9KxptDLkvSt61JM9/URXhrhBhVIAWvuXeqvghRLOP?=
 =?us-ascii?Q?aVMM9l54I3L77st/IU+AS4dfzAefFO3NYo1GBIHnflOkxddrqUgH24u/s8NK?=
 =?us-ascii?Q?GO/X5zQn+dQ7wTymj6YpuZaP8/BffcgBUpQWvGfbIs68GTxHJ6UMCH3EK2Xw?=
 =?us-ascii?Q?BDymNa5KyN9sXsfezr7G/t21dJUOGdcEKlBtd3Id0h+hgd5WznG8QvRvn7ai?=
 =?us-ascii?Q?Cs5qXFY1TnV1r3Fv9kMb1R/RDf6RGm/qf9q1B3wkXR9KqklWUnGLJ1z6R13W?=
 =?us-ascii?Q?3E6BG/ep6eTcCJLvnTpKSU1yH7c4pIfP1KfOzrI8qsSOmsWf/c37bYRPlVdH?=
 =?us-ascii?Q?XP0hyEQm10zqqkgaOlwdnx7sfMsB7XuJPkzPoUlL2eMhThuEnx2OrV8pm9x0?=
 =?us-ascii?Q?qjQptfqRodeqLDuNta+7fAyHBCl0lTvBeylwSqkgXIIPoafwTthK929OPkBp?=
 =?us-ascii?Q?OiK52z//EemG61WGmvZrmq5A4E7CNnBRXOWm8DLuMiZ4+e3Qd4N87FtjauNH?=
 =?us-ascii?Q?tPQEol+9bfkRX35ZpOkoa1+O15Tdc7m+PHwBK+o6YR1738LOxAARi6iH0MdB?=
 =?us-ascii?Q?5ugz0bMVxGy2coSBVzEYTiJpMdivTzGUWG8me8tDEQ+66779pGilynECXd79?=
 =?us-ascii?Q?YkHPfs0Ek3plAkbdmsGalU43lipioLHIw1VlZQgpO8+e4xkOFA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sw5AKe8Lk6jOi+e9BD56lXzBni7RkycVItua/LplwFW2Rp/oqY3Mjr5Jje2Y?=
 =?us-ascii?Q?BhBVFTpzwQxGzUPchmr7N6g0bAeNZUvpkjBN7sPA9860NWKyu+o0ciaa0ezQ?=
 =?us-ascii?Q?OF8irjt9oyDaAfMxqb13c1vG0IrKOf4I+CEnH4rJoiCpe0I3SMYfX4LV5Cth?=
 =?us-ascii?Q?jF8FC3YPSoWOu1uudrdK6ftwJI3bAjTJ9pP1FdR0isbfWFLJolA7mBXAuX0r?=
 =?us-ascii?Q?Q5t23DlDnZlzIsxBWaWmqy7X+EAEt70MCXqvIpI9PbYMaHH4v1Un3MUuPYGv?=
 =?us-ascii?Q?4La55R/5iN2YGeH+QRtndD+dFwE5eLaP7A+ZCfgYpFiTAuI5wYAVIdItaqmT?=
 =?us-ascii?Q?LCdJACvugdGlwgmyPunyMsFNdTU9eQIbZ/m/9T+MzwM+trhmEwsqLAgwoh5k?=
 =?us-ascii?Q?q5wDQM0P8icEK9tKc8cSskWj8tl29o6vVPasI7DowT1QC//ywhPmJUv8eM9v?=
 =?us-ascii?Q?2g35z0AnPSSvAJIeFEFLwTFDwmlUF+TVxE6Vw3oJSnlO2nlCOOIaGActZHxh?=
 =?us-ascii?Q?223mcVlqD9zsAXhLwkv6oRbvMiJ47RcEYe8gqNnj45eBilqfyJvRRvaEJdZp?=
 =?us-ascii?Q?WH0N4PWGTdb4yTZkNjiEeSJIE3ZR1c0qJFqoZ6cjkBw4Ala3yzWU2lhr7FJ4?=
 =?us-ascii?Q?SDXhNek3rO1zcXscNcnTWlmZ6cj52KsT3DSVyVhcfPGQ5r2kI3s3EpYspadP?=
 =?us-ascii?Q?HPrKrP+8/uGowTMG3Qqct+4vASxyQtHXW1iYqNf7DvWNR+UTfJHQ6lTSdoxP?=
 =?us-ascii?Q?xtd00c0lBjqVcGipZxrR2ToG8oLQyX54HYvj2HfhlA7w5enKZco0X6oKCKUX?=
 =?us-ascii?Q?GrYHIi56hpJJEMeuLLYlFAUH08+qlSSXv/9x8cGTfdj1/V7lv1emlrHv4oj3?=
 =?us-ascii?Q?u77Gs0CwjVs99WRHpm8lInxFEBFU6p5ootAbxTCQEr1ww92jHQFmnNgEWg0B?=
 =?us-ascii?Q?dl6/z0B0MvYoMd0/USQ+4ET0+BPp1gEY9rh26lGo2I36hyzz6UnNGJ2uUepr?=
 =?us-ascii?Q?n7K5k1g4PHK5nqm5Xo3g5e2bLmU0njlqOO/UZMrvV0WblacmNm/mIfG6u13y?=
 =?us-ascii?Q?bWCaz/BXm9SvRBlvfPLjGAG6cxwrYWabPDbybGTWsrkbAxdiaS+lV2cMhUCx?=
 =?us-ascii?Q?Xpc55ZgOfyxos309XFQwvZ250d8P3mPVmcIceviCB/J34+oRczMkfRlN9XUJ?=
 =?us-ascii?Q?GCABBHYT0XVaCgzJ8QG8/zpLzVt4vs2M58vpsAx7/R4JR/taGwoCXIppvofK?=
 =?us-ascii?Q?MbLyk42E/2NZNYeQHEFMOzytLyhwGxy/kcM3iRBXDcbPBAQNnoB3JlGg7vQD?=
 =?us-ascii?Q?ZD6XBe6Ge3AKGIL2DOFSjvebhBFsBhIDaxyxm64BBidnxEmDO8O7UXvt9eLL?=
 =?us-ascii?Q?y/OMOC9k4deD5pDOwMhpYloyRPgY2NkEPRehfx5yBPbN/k6I2Uwsew6MMNdq?=
 =?us-ascii?Q?yXVOeZq6XsQDQ73fijZegNVQdj2ydXmPwkkikcG47rVU2HwBc3C96t3TrLSx?=
 =?us-ascii?Q?QIM1y+DEXXLWa3/UmA0vpwZiVrGFj24J3axqiF2R7N+gbww8IzVXOEdLChNq?=
 =?us-ascii?Q?tbUPVapNL2jenVAJ0GEnbrX5Ajis+yUmuZlThgYhMS7O2Q26V8sM83Qw2U+t?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kd5idOIoTfKiJFC5Xy0fQ8c+Q2DIbDX+BVUa9Is+Wa1OpgqKims/L3/WBUGCqHyPvW3ln284uc/cEE6Zz1q87i8m62qNmuJfjwj/2O1J7B5oK1WNtjAWxqvgKWXilsU15hnt9/KY8jHM49HIdFdm7cZmUaUyGgk1lHYlREYOBgSRdRC6inVPURpHziHQHpA1FuLvvtYG+BWvfIwvpMoHEpP+VHWnNtQKs7AVbH2GfwE2cWJyjJNUmLhn8tiDqr7bZwlavlkxLm+PJ44kCTeKdfdVmkpT5z/DkC18Cr38Y+mxiQKNOaFPRzU0a2XOhxOe7b9Nb1s18UfOJhpOsiOVGAnD6Tzhz+7C/f2kfGeZ8Ko23SRe1RpYXQz/2oyphuZIMebDmakCcZn7NDXn4YqgdamPk/pNH2I60d36YBy2skZPXNGAl7XrDIEPaEt4mnQ3GNwooo+XTHgbq+rBzNUvLTn/YCGGiQi23FBNJnDScZsA7s1TYudjyqQQQqoVxHYiTckt7fZ/kMJYZ69ESKKk0dYknyXY/Vg2r2yScfoRKGW/lidRo1WwzkiRocN9qAmTADVihzWGUtvECuvMLIhVwbp9b3dKmsr8u2Rm/U8GhC0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72758314-e307-4b29-77f6-08ddaa8aaae8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:57:50.7656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6y8sVlniN2PtodMIyKSUDM+OzTcAVSFuVTfud++qxhe2V/UKS3xQgK/UFKL19zONH90j0/IhC2Ghjy7eWu5tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6700
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130108
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=684c3c72 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Jbm45AMVymJXaYn58I8A:9
X-Proofpoint-ORIG-GUID: wtBYpuIrHoxFxScqWNbrvZkl3jZDfkJr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwOCBTYWx0ZWRfX3CO9NZfLEYxd 8La8/YfbG0rvHTQINDCBUO+Yi/P1vUwy/7S2pgubF/LYb2P8ogTp60j7ATd2esQJd7m0bH2+jre cF3bwYnz8yww254TXNf6cCEMS2LXM9HCL4uFUjiMuN8AeCp2euRQfGptW4RK8S7NfUG9yQZZWav
 SWyH+pcqoSilTjwfz8nzzeXILz7yL4RX+q2furYbj7BH9QyzpiupVN0vq4vddMcsqGfuzCgS10I pNltJOuM3nKjR2eMgDVHpEzvi60VytGViEdoLoZnV0rCMr3/1wk5pVRDhyo6x0J73kBnaCieg/R IU5omzEQajW5+b36iKtdPqfbQfeiMCSS7Y1NqD8zgra27s5SgQ1iOsJumy2s3jbfbdZucORoWBC
 PhKVn1kL3GUKG0+cJA6UfEM8kme2eHruiAbME1pwoscxAjWMH2ZQsxCrozoYA9dBaZfgpzhz
X-Proofpoint-GUID: wtBYpuIrHoxFxScqWNbrvZkl3jZDfkJr

On 22 May 2025, eugene loh spake thusly:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(I guess we can assume that as long as it has any trigger at all, it's
going to be firing lockstats like mad.)

-- 
NULL && (void)
