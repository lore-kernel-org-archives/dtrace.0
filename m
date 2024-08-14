Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD93F149C64
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 22:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723674490; cv=fail; b=WmMLUyDabG+VD88DCu2mWgw8M/JduP/tZUTwv4C2ZpnJLZ1ADw6Its2sL6p5NM2MgQ4vc4WtDt58nYmG/vp0jXKqfDnFPuAvA98PezpER43INNrh9UNvqyJXodbpfK4guEmAoUB/THf2z5d+vBDUc96JyWj0pI1dohjJOJOVVjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723674490; c=relaxed/simple;
	bh=rSU9BjlLnxGaVeJIT6wuHTdiNKw3uT+70Ss3ThkdIe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BQcPyKxz5ihc06DzsoIC5MfPxClQLwgrUM81Pr/eAR4UhEnp0gF/sK2hf+bMvzGQWV3SJmohWeIBXGR5Z47U1CogCd4qV4kWyDBtBnHOjWzGau0hKVtRub7j0vU3MU17BfdW33ptFDcHVJnV9Kkubplwi4Vzzm3enifmIi44UFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AK866cNx; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Jg6u0AVX reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AK866cNx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Jg6u0AVX"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EIGRP0007052
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 22:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=/Smq4eSUQk/aoHh2IidGmRuRZdRRAduXKeonsAfj1Hs=; b=
	AK866cNxodFb7K9n9m0LNaEwZEzTvfsDEDHTk8LVpyPxtHNivikjIKm9IEercjSN
	3Wy+dhmAMxT+7DxugA9HwoCL3VjS1nFtGep6UZGm4FgBHLJyzEjozQPZ/BXhpuhV
	WNzUvsJuj1Hhg/xEqS1gJ1axPw4fW4vfxwq6hg3FbuioHKHZQU0ELIKeVstXbfeR
	1OQwpZmTykFhcJvZ5ZGQVvCx2eTDe51rFNR1ghUw0PLBwAECUI4hR+L59B8GLm2G
	ocAwF/+OVXyEfBG3M5sP+/Uq9J8r+DYMIZT+A1Z/DG/p1o4UKmXeJ8UXthJjUWie
	4sc/iKDO5/0A94b971RmwA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x0399aa3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 22:28:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47ELnjnQ010771
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 22:28:06 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnah7y4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 22:28:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTSAXQpWV5osobQenU6sGWdGQaGKA7e09ZY6dXPQSdKK9tJRC/khr4QFGkr2J9KH997sqBBv0LSSSTgKvxO2rwub+v+i2R+7BUvokGD7FLiOYSSCTeJMHtIta8CpDwWVC8RT7qhHgwo8FstrmJtPFB6694iGe9ihZFuMRhWnliT52TI72pWs1pD2P1+2avtPkLS3WBytTeLEnrivRy6db8W+NYTRQMmQTjI9GaCT6GlZwtdKUvJdxg635KuB153MjNrlK2CBpT/VQMiLU8t3wxryl+gnDQ8mHK5yc+Y5y7wlmSw+p+jbk/01V9fJfZRvBxi/6tWb6nOvHRfDfixbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH/8PyX7U/TUlFhFRHhEfrCOryX+/L298iAIyssiBnQ=;
 b=WxB5BPLfNkNeFlIALJGLp8caQ8SZVkzF5rCRHlJHam0sM1HcwFR7qai630rbr93Lsi2Z4Il2quVq5yN1jmcLq6MOz9WooI9N9mPN4hFs1uwD9XAtWU/FL/lixgzALrMMWspMeC5aBlZiAvoM6K7CMqLJMMwHQ/jgeN6V2DXHe5ZlHPYxZEkOE0e7hqPPjIK8v2VpDlNK2Q5zvZd4/l4MnBAnlWHN39T/AKeVgcR9BFMDL2XS9F4/ZjD+x9i1wz7kMvMFko/OixZNAJiXG5V4que8pRglzfheMDlX5tU9LeyGV9XYPTNlM/NKs+jm4AJPGQQfe67Hc/K/+Fe2Di8flA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RH/8PyX7U/TUlFhFRHhEfrCOryX+/L298iAIyssiBnQ=;
 b=Jg6u0AVXJvZ1lP3Tu9WJs9JrmsH1cQ7mJ4CBlUtOGwq5VDwerQUPWAOgSs6aAX7MbpHC7OLFmTZo8OFeA2pqBREmRjMalP6W+uTv+XtbDs80sN8F9qA7JqaDGABEbAG3MSFPFmf40pc4SO7BSrsV53z2gqujsTazUbCLmJUouUE=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SN7PR10MB6978.namprd10.prod.outlook.com (2603:10b6:806:34d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Wed, 14 Aug
 2024 22:28:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7875.008; Wed, 14 Aug 2024
 22:28:04 +0000
Date: Wed, 14 Aug 2024 18:28:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Action clear() should clear only one aggregation
Message-ID: <Zr0vcu6DN8ucMO95@oracle.com>
References: <20240814025925.25408-1-eugene.loh@oracle.com>
 <ZrzT9mvBboADVnsE@oracle.com>
 <f4c37d36-5a0f-17a7-19d3-37afb41a331e@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4c37d36-5a0f-17a7-19d3-37afb41a331e@oracle.com>
X-ClientProxiedBy: BL1PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:208:2be::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SN7PR10MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6eb6ba-1a45-4cd2-82f2-08dcbcb05d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?fmUzuaReEt5FncV+gwY8pfWtjzNYA+eTF7zgJjrYXqGetm9CM4oyajkGt8?=
 =?iso-8859-1?Q?jdMoXCpQzrEcZHvew5EvePSA4r8QasOq7BEl3bsfuFP9+Xy8kWhlsWjsVF?=
 =?iso-8859-1?Q?nNJh1KE9kwulsdrF0GQCVSMXzS7Ve77bV45ctK3i74l4LhZ6xKC5QFAbvL?=
 =?iso-8859-1?Q?Q+NemkPdFU8WTfMHxgZcahadHjSQ7FExZynSDCevS+6Cal1HdUMLy7Q6d9?=
 =?iso-8859-1?Q?1Dwxyo/fpgjaJ3MykvibLm6UqBjFnBnl4YNUB/rjfD2cKFthZTNrJ9o7Vr?=
 =?iso-8859-1?Q?FaqAMAcS8wZuu+81h85HqMrxSirOAGk4CUZ6nRGY9KS1z/n4nS79FjxkVu?=
 =?iso-8859-1?Q?NAAg2+b57gkoFZ2non2dUIoGG3+zobkxhBO/KiIRnul7wAev8IBu+N07aa?=
 =?iso-8859-1?Q?itPLs4PqxAi2y+s6XEmzq8XGsWgHl/T6AIGB50JtpQc04lGoSY7IJkwLUu?=
 =?iso-8859-1?Q?EZhSm85REfXfP5NWdvzdbH2RKcYdZkx1Ql2RaGpEIl9mlEZZtsCcaJ6Ddh?=
 =?iso-8859-1?Q?ySb4lMKcSiqhXJOnC+Zq5B17pGS0cArXGgvTVO1TFH1yLqUIuxPfo+U3PH?=
 =?iso-8859-1?Q?+wJmXOOMkAAyB/6lGUmthT3n+eHwvx2+YScgzsTlr7+pFnM8qfu0SCYvmo?=
 =?iso-8859-1?Q?UQ/Jv9eUsDeZ4+Rd70lGjDweFsfIcdllXKk5oqKaeg1jbdD+WIf5zZQ5e5?=
 =?iso-8859-1?Q?JME8l7CHYIRYnDSN7E5VCIOr8WWU0YTVfIhpjFgxI9bvK4wJeX9Fl3zS9O?=
 =?iso-8859-1?Q?3vmmDaaeetN5aoMaTgkyfMh5fIk6bOVPO972yF8RogY9RnekJfmVIhHb59?=
 =?iso-8859-1?Q?Pg6jPp5sNwn9T3+UdbFh3FDnItvdC52Gi6YGMC++s9I9OlUxAvyLUWkgB8?=
 =?iso-8859-1?Q?M5jbdSUmqCvg2FIK8/jBYjyc0rK5FSKmalRYRb9g3AFZGaZZ0R5kMC5Vp5?=
 =?iso-8859-1?Q?IZ4ZiMywGLLtO2wfsjp3Oz9Gs1gat5rWRgkIrs8DGanW1l7vN37RXoqo/n?=
 =?iso-8859-1?Q?drG6ypkRsGYcIH5PbCK3M6alx732ECmX7COE0TOAwG0WKPMFV3TxR0MIn9?=
 =?iso-8859-1?Q?sNZ6WdJpCCKRQUyuoRbrmxznYXt1a0FiBMVD+teFyId7yKfUyUd+5ADRNf?=
 =?iso-8859-1?Q?qocIJ12UT6eo2a8Ys9uU+TgAh5N+0UEmlVNVS9MEHwdxGVt3KUE5BIBCSS?=
 =?iso-8859-1?Q?/k/8BTFw3TlbKe3vN151hm6NI19FurFJNcCyvvVNIj8jg7bJT6C0J72nKl?=
 =?iso-8859-1?Q?85FoHV2WWKYV2YnLGxF7eGglZ+LjyWHJoXqdG36g6VKpfbsFnS0JDy4Yxw?=
 =?iso-8859-1?Q?JSqgoTiO6M7JKVzZQjZFQ+rB9pt4tIa0QWRL3GHECyscY9vshio9WQrAmb?=
 =?iso-8859-1?Q?K7jDTuqiW+cIB6r40ItRyTg4n0023JJw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?E4tFwRTY9xT9P6gN8jIWLs2ITrQ1avI8M/xqArLbBKPjsa+/XCfYlyLnQY?=
 =?iso-8859-1?Q?2nUSsn5TIWEpFOFEqx3ecPG1pNaszYOMCK36pJWgavPyXzIpB+ETCr7H2z?=
 =?iso-8859-1?Q?KkhEZuFEZGzK2v/8MBvaCurKVLvgrEFskIrqTXpyL5XTVgPFRSSfMdkrUA?=
 =?iso-8859-1?Q?6a8w7zY/jwysW83giRaQeq4CxDN9HtYI67t8j6f1zb5APuumZZrcb0RO8p?=
 =?iso-8859-1?Q?e8NHbZBgY6uWDwubrX3qerJOvNEhmv6rSM3HHw/xvwPcAa8hYQnS1IInTS?=
 =?iso-8859-1?Q?GqhX6YFj70Ih7N/olEaM34rT6T3+FC2JxuDKocHC1R5V+VvLHuriPFxf6h?=
 =?iso-8859-1?Q?IZdT0k9vx3QBtQFnrLg3NXh3SGX1HAObEFM12eY0MTh+diXGQX/dZGfRbB?=
 =?iso-8859-1?Q?n0NKyPT/LfD4Vj0bXf/AYWYPDpiv9sVzXEM1wbfYe0NgN5rqMSq1px4WIk?=
 =?iso-8859-1?Q?0mvaCnUhtIMRTx8fygUhcB2Yj1Af1pCFbbFGpEZHjEg6VTBebqiTiMb5TA?=
 =?iso-8859-1?Q?L2cLSy9pyahfL6dfuzEYDqJZdBqEFe4WOWk6tGJQmRglREolgTb6sinNu7?=
 =?iso-8859-1?Q?+UALtua77aDCfPiybfPGGGlkdpMPD+XRdb/bKxStAyW3LbYw8it+yoj73j?=
 =?iso-8859-1?Q?Tlzy0Z65pnp1UPBHZ+RSTMA5WpwhvEp2ero3SogNOwEZG8L8h/B9cKvvAC?=
 =?iso-8859-1?Q?EnhdhWcxbe9r4KSsMIvqZqflTbtCWKaU/CPQrvvtnd9bNffGNXA9rBew3e?=
 =?iso-8859-1?Q?HZY90AwKGfAkHOAy5w0d4Tnj5FHcOw43VbSm0b+Eq5DPxNZ0eg5PFsXk7r?=
 =?iso-8859-1?Q?2YZvtGtQ1pWzr2Bmhbq3OXtkE4oQw6ilJQFDCLII9zJItW6iMFS+wSlxFY?=
 =?iso-8859-1?Q?6HKjyxa4/5ugq/WiPo3nAF/mfpjXj39ULwtOcEmKA5vAPC6G6VRxtwfx6s?=
 =?iso-8859-1?Q?yXxhLSAakpVERUHPFryZ6UhxgIuhqslhNDtf5UN5aWjz+q1ulWuqfAXheL?=
 =?iso-8859-1?Q?HLxZMLNigCyiqrmaUwH7/K8RwB/txnsTF94EXi2QZEAT8cASTmY8mx5IYy?=
 =?iso-8859-1?Q?pqZjdI1onXY6sBdgKFDOun5rw66rk978TeZbWnBjRdxS5Hf/5POOpupTaB?=
 =?iso-8859-1?Q?pbuC0eOGeNiwlamZiosjCcEiU0jqutzxVKSNTbRYllueCfytuRqK2Km/9A?=
 =?iso-8859-1?Q?0iAmXc4gr6SRViqRKvyhBjz1FW2tXTX5H0yh7hg/kZKAfkqNVIYe4wQQ7D?=
 =?iso-8859-1?Q?dNShoK7igE0AKbJZMqYVquTrV3wW0KVWQ5uNAWOM7cUwyCH4TBQnPQm+g0?=
 =?iso-8859-1?Q?KvIolmVtq/bRYpO6i378YOG/cfeDpHa74LjQUoFBnxLnK3AsK55br+H/d5?=
 =?iso-8859-1?Q?Qgx8+rCffPbsxKnOzYsfcI3nrAqrhkSNiy6jIwnRKD+hPCeJ04Xfqx86vc?=
 =?iso-8859-1?Q?oUoLK1bxlHzNTQdhuHzzsl+SkCQm2JsAsK72kvi3WPxxRTf7XztQdzWnqU?=
 =?iso-8859-1?Q?C2bzj2b7/fR68qd1zJHFSoD39un6C/y1P3BaLZ8AbTFTL6lWlZiKmb1cFL?=
 =?iso-8859-1?Q?JcYoG4RZe1aJXIKb+kf3aGcRh2uDHVFu5F4kHYpT+imbzmTTB5YxG7HwZY?=
 =?iso-8859-1?Q?UHme1GLzEfDyNwfy4rSnFIUCJkM0vT0zn5AsolB70d/eFQKxo2sIopww?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W9FL3mtf807r7chNFYswRcIFbV1a1tXeB4ZrW0xiTYmOFed6LvLQc5TIiXO9UgaJdtdjb+brS4xw9/uUubTp9ipk+gARr5iC58MXQlTvhi5dayZ6i+7XhIWq7NNqmDho+hbnCn0F6VaT6z3oVoVqMcE6Zih7TNC3dcrDj36ijKL6LwMoLh+vil/P4mGs6k0CbtKhyTQDajdoBSSIg8cAl3uCtaLbdAT96hwn6kL88iblfbFljJ0eKgqdD+s6QC4OZaOUI/ddW1bD+9NWqE+HOOcqe5BDn35i0wv5Nfb/hA6TPQgHTm3Y646bY4L6uwxJZ6LUFBEvWYaRhFoZHcu/Dy55Ot7C5/L3qyu4CT3XwwItsBG5nFEvcT+OMgeF/ZnYvG810lkeOJ74+wwBKktdidFy84xSO8voZrJvOcFDvNxTfPc7Vrs23ua5H9+AapenDkE6Hhota80lxzQAx5QPQfTKX59YmBee9FcXpIB1GO6uZq+q1Hl7tTeOpEhH5oGBAr0Lxwr9YxNMM0o4gBGsblVXezXGCzJ/U6bMqIpuXJnVIUDY00MUkNEfPmXOjloXdMK8vMBc8JTEZRke57CxJ0ZVfj2720NXbEW9OUi1vBA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6eb6ba-1a45-4cd2-82f2-08dcbcb05d26
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 22:28:04.4022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TbPsu2QnncvF5+Ik5bSlGUG4jRtzIzwD7qPuZiByNLeI+bRq16lk6anuRq7njjUz6edYFgA6xRgKvvP90kLQlr44QhVNUgvNLs1tFOErBTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6978
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_18,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 mlxlogscore=947 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408140155
X-Proofpoint-ORIG-GUID: ypXfuNNgUzqVWj9KHVlNCn8RtxjvT64t
X-Proofpoint-GUID: ypXfuNNgUzqVWj9KHVlNCn8RtxjvT64t

On Wed, Aug 14, 2024 at 05:50:27PM -0400, Eugene Loh wrote:
> On 8/14/24 11:57, Kris Van Hees wrote:
> 
> > On Tue, Aug 13, 2024 at 10:59:25PM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > FIXME:  Is libdtrace/libdtrace.ver correctly updated?
> 
> Incidentally, what has to be done in this file?
> 
> > I think that keeping dtrace_aggregate_walk() as-is would be better, along with
> > adding a function dtrace_aggregate_clear_one(dtp, aid) that performs the
> > lookup from aid to dtrae_aggdata_t *agd, and then calls
> > dt__aggregate_clear_one(agd, dtp) to do the actual clearing.  There is no need
> > to go through a walker function when we already know we need to operate on
> > just one aggregation.
> 
> I'm not convinced.
> 
> "Just one aggregation"?  Yes, just one aggid, but possibly many keys.  To
> narrow down to which agd we want, we need to know the key -- and clear()
> doesn't give us the key, plus there will generally be more than one key
> anyhow.

Ah true.  I blanked on the fact that clear(@a) clears that aggregation, and
any indexed aggregations with the same name (and thus same aid).

Anyway, given that dtrace_aggregate_walk() is an API function that is exported
by libdtrace, we should not change it.

So, I'd propose that instead of introducing a new function, we can make use
of the existing dtrace_aggregate_walk() by passing both dtp and the aid as an
arg struct.  E.g.

typedef struct dt_clear_arg {
	dtrace_hdl_t	*dtp;
	dtrace_aggid_t	aid;
} dt_clear_arg_t;

void
dtrace_aggregate_clear(dtrace_hdl_t *dtp)
{
	dt_clear_arg_t	arg = { dtp, aid };

        dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
}

nd then dt_aggregate_clear_one() can check the aid and return if the aid
is not IDNOE and does not match the one for the aggregation it is called for.
That means you also need to change dt_aggregate_snap_one() but there you can
also define that arg and set aid as IDNONE in that because we know that if we
call dt_aggregate_clear_one() from here weknow it is for an aggregation that
needs to be cleared.

> Now, one can argue that in the current implementation and its current hash
> function, the aggid tells us at least which hash bucket to search.  So we
> could write a special, reduced loop.  Maybe so, but that would be wed to
> this particular choice of hash function, and I'd argue the current choice is
> a bad one.  E.g., consider:
> 
>         tick-10 { @pc[uregs[R_PC]] = count() }
>         syscall::write:entry { @writeentry = count() }
> 
> Lots of agd's will be sharing one bucket and another agd is sitting all by
> itself.  We ought to change the hash function, and then we'd have to undo
> the "search just one bucket" optimization.
> 
> PS  Here is an oddity:
> 
>     # /usr/sbin/dtrace -n 'BEGIN { @a[1] = count(); @a[2] = count();
> clear(@a[1]); exit(0); }'
>     dtrace: description 'BEGIN ' matched 1 probe
>      CPU     ID                    FUNCTION:NAME
>       34      1                           :BEGIN
> 
>             1                0
>             2                0
> 
> You *can* specify the key in the clear()!  But dtrace ignores the key. 
> Silently.  Same behavior in Solaris.
