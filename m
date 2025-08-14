Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F32236E8
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755200336; cv=fail; b=qk1lcIA8zZ9t5BoMaWGwfQeWNiEafTWY7ks69yrDjEDVJEYYjF37o6w6fbCeL8v3xRp0jxHAEeF7ie2i6TdzhQ95wmqOwm7maQN5PQ9FFBIdHgymA3xe+moeGmzu3m6DBzB4SSgE9SrwKUaBE1L6J2Dj3lPgPykED+1xj11zyEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755200336; c=relaxed/simple;
	bh=FIdocn/JgQVmBfYnySwjSMQHLrt7YAtvCpwf0YwFovs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MG3AO+/vSGdCtVQOqpMnenJvwKs3ZqJOi2uwcO4Gg4rQtoMeN0BGbuRwPPNBUQCY+V4GD9SHTjTLwTnNGpCyoV3u9wiLABYIE3ln4WvWR1A6nDe5Y3bMchX79TovodBMK6k/izto4gcQuISc3pX7Jrq/BU+2wioLFYpUcV7/8KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oZ4TF3Ol; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GPwpBTI/ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oZ4TF3Ol";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GPwpBTI/"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHfrZ9001222
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=dkHVhCA1Ny+fx9rNZJINR0m+e9ruz2dzLGML49TkViE=; b=
	oZ4TF3OlQaH1klG+SDVnu8CmhP9K4jPx8E8qeMQ7l5SCUYQupiWcD6VK99TdBOhC
	wedIGaYTxGdaLxmjp7YnRKhpNvo8739dt+uzrHFrVn5JL2md4lrn5Isqv1hjtjEW
	yE/wDlGYPEhtZgQmnqprtJI86rZ1qeq2FDoYm5IhQ9fK14/C/aHRiVunOMYqyDmS
	/uCVG1nIudtaMcfMOGrxppl06VEnC/t1JK6ekkc3citTetrKMQ9XGL5Ghy8zq3h2
	VCk9IQESJ+2Uv2lL9ckNO2rUmEJJcU2gzHl4WVo3fveT9pGyqanaX7dwHwwhyXeF
	dAv1jft1D3q0oO63Zn82gw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8ejr7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:38:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EI19IV029953
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:38:53 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd5smy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 19:38:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYvQZyVgkl2ejYzgjw/ul3YMDQIIYyAhRv1xKLNP16xYhUzsW+WrJvKIjHLaomACVz49jI1DWzh0qB0PgUJHho5PwFcqSrVouZx7mi4eD3PKIuxEIi89Qnqapbr8uDZuA1E4twNlooEOs4SnOahG/xa8XE9YHo4wlpad/T5VfGS/1dmh7+7cNDn/b1+rd2qaA+CR9aTwU5/Rz5tQXDwt6fBy6MgXjEX9X8XH1RI3lVyaMpChdLRikaQtpK3YnVUHyc2VZZsUqzVevePbBXdUwM1G6sAeoU9cHazSx/J5oInz43FtcqsjRAwAUjck5kV0r3wzn+KSf/e5hd1ZWsfO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1n+861auwzf0+nIkDkfE6/7k8Xd4kwIKI0lmTfoRJ4=;
 b=WSy0bel0tzuGvYpFvg9HvTEtXTwmLXxnYUqBNh96L4yqjsvPIIr7amhqFAVRyqeuQGiIQwV0sP6Ed/EylYatFzaLIFxPKRACS8QKweizTyDROqRmtcCkn8GZlI+8atGej0ETPuRSqkn3cOb7vpRddP1KPvhU33VD7+x7kqCfhqknrcXRz7smmLxP6qJ/Ka/P7IcsL1lfx/BLznrlyaltNZdNUD/hSQpRBo/DLqwfMFxw+Q8+122elweO8lDqActvm0LKJOzodxWQovYezhI5n9tSHvnv1qsd6YUp7MbhkNOsdfCzr/ra3sT2TFh8cRm6+NtSg5ZeXVVqNApjnph8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1n+861auwzf0+nIkDkfE6/7k8Xd4kwIKI0lmTfoRJ4=;
 b=GPwpBTI/9o+DyoEu7fUc5RonyK6lwSr1PGu12qa8uQNh5jxFbb47z6xP3HHsMYLPgcYT7iQ2jaovdJaUHWHK05aHAMM24uHI8+fYSZw/FC7ouqPFJsC3uB5xqCpqGj7ZIRuSHqLBOB7tpB345gI2K3sFyVid2iJfG0YztiM1rWc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB4709.namprd10.prod.outlook.com (2603:10b6:510:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Thu, 14 Aug
 2025 19:38:50 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 19:38:50 +0000
Date: Thu, 14 Aug 2025 15:38:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 4/5] trace: handle the empty string in a
 sensible way
Message-ID: <aJ47R+2qxte5kMYu@oracle.com>
References: <SJ0PR10MB5672B6FE7FAA35DFE6F946D4C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <90b9cbeb-1960-96f1-5f6d-34acbec013a8@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90b9cbeb-1960-96f1-5f6d-34acbec013a8@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: 8625916b-11db-4bfc-271f-08dddb6a3193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?YxUu/hUrJNrJ+wVIcm8C7a89Vf1jcuIpNakY7n0FHgMBdAVAk7QvzS9piS?=
 =?iso-8859-1?Q?hyt2BL7cKBlKqaCJkwoBMt6M2IXrKyb5R2Vp+J9iOGkMv19Gv8vC7u42XG?=
 =?iso-8859-1?Q?gzouPCe46u1lf3rl0iYhkR1yqehVq6/8ZJ5PRSL78+QRbYj2pMb10DqOpc?=
 =?iso-8859-1?Q?ZzKfVKssuJwxsOgN2iUZtqD+BdHt8UlM3Yce7YapAVpyp+DHWB1jUimrw3?=
 =?iso-8859-1?Q?GKI6ez29vZliT0R7purHw3ssUoC9OXyliyuVrXcLZeLV5kFniLm8MQP020?=
 =?iso-8859-1?Q?N9/caHC4gS8ZzYrH+gbSoRzbeZYJ/d4mD47UmzZ07XLnR4c5sE4mmOXUYw?=
 =?iso-8859-1?Q?0kzjK78yi7NvQuK+PwKpfMGD52rpsxayRaBtmVbQuF8X/BSDCnjjQS8HOx?=
 =?iso-8859-1?Q?4+X6e8yMATw4DNGRHURsD9u8PASmVTjOcvbJ2Tj8Q0Otsire91RooN8MIx?=
 =?iso-8859-1?Q?EpIePIpZcJsSPqbOiTQvsyN0casnR6pviDkiZUrPmWSs+urKtk0nXBAHFK?=
 =?iso-8859-1?Q?x4flbuGnb0opASLsOxvKtb9wW6Y6G2g8WWMA4fRax1GFzmei+aGTglwzlx?=
 =?iso-8859-1?Q?vyK7Sh975FNw29aEqE8pKxLApJD5CnQgMGQwgydZ1e9ShO6itZmGDtYdW7?=
 =?iso-8859-1?Q?drwCFSgUXvvLA4mUnOL7R3RktC8jUrOvXfmvWG3LU0JcbtWcyLESQSAp58?=
 =?iso-8859-1?Q?Y/cXbwBPJeM6bcKSi+nYerWunwfnU2J1/t9PsU6nyPjyN/2cBdYZPQWriR?=
 =?iso-8859-1?Q?iXNk7ceXN7cK13uW5IXyMuvNj6x33qwoUcoZRPqFSctm6EuzeFCY/RuKag?=
 =?iso-8859-1?Q?AB07EknwEjE9GFDi/t93mg7gXCAVMveT87u6PSWoEGyDlulB3mbbAXpOEs?=
 =?iso-8859-1?Q?XIdmnH4IXQskDUqPuoa2+B+ciYnvYCrY6mDBPHdTa/2MUItXtYMwGTeJMA?=
 =?iso-8859-1?Q?oifHApN//7Aj8WdmPQmohlZoS9YxjU0enHgFbUpSEHCTqXwU16WVMk7Rzx?=
 =?iso-8859-1?Q?x7NNsRly/UOve2zXll+Z+ReDaPJn8M7a36jekjqwq/O789tAgmn2U/ortw?=
 =?iso-8859-1?Q?2NHqwRSe3AtqpJ0CYfwBrTkZrTtUD5Rj52a1I/nzyESscQQYHguDYxPHZ8?=
 =?iso-8859-1?Q?p1cfvXxIT/BJGV8Ni0sbu7FJKLxU+IA/cBqOKv332IzIu2peg4klJwre0W?=
 =?iso-8859-1?Q?c62bWN6fiPTvsd9ZcZWRQ2oDkxuBBIlt6uR86wNtS+nWDjj12sNvnEjhZF?=
 =?iso-8859-1?Q?J9vxk934zTwFi53aNy2pj21Btm3TpD3y5pkYvXCKxY8AG+JFDCHRQugaFz?=
 =?iso-8859-1?Q?45ERmcBx7JVCtbuImZorkdnYGoGSdAMTyGr7xO1Fh7Wu0wrmSywaxo48LB?=
 =?iso-8859-1?Q?LHUnp+HvCRufuGH7usfQxh/45c216kWM+g3jP5dtySUtl/lNvjC/NWv72O?=
 =?iso-8859-1?Q?oO43K/UrnkZBiP4NeYhWU4upItlnqtwezbvGOEJYGxbM8MPfa8kKSWXGqa?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?eoiO+/vUki3hC5/F0FMa+8YnzSenVxN40Q2rFp51AvsclJ7x8BTjizqMs4?=
 =?iso-8859-1?Q?bCZn2rld1ZJ98ythQtwkRE0uEC3l8FRpfRZrqeMCl0RLegVK1jLpQhrjro?=
 =?iso-8859-1?Q?2aT1wZorEnVCOH8VbOEm3I34EDXtHHfkG4uwKnDk9adxf58A90BH9R4iHt?=
 =?iso-8859-1?Q?IsOCjrvWhjbK7LxkUHfXf/B+rkkKsRYImKzP4loDhapMQq0FaTtO9vdmAQ?=
 =?iso-8859-1?Q?M/8ylQTTWr3dj77/ISysckqf/Ici/KLvV5nBLq0jetnsInDBGcSftynF/j?=
 =?iso-8859-1?Q?+Bhf3e3TNYrGct1GQ+ksRdT7yeT+3j+aCxvQep5LRo/0/lABvLpNzwnG6D?=
 =?iso-8859-1?Q?ASFQzBT37CmBhIj64eouymJZou7McK/pxgbrPJ5Z/b3Zb6m7ljJxrJPLLK?=
 =?iso-8859-1?Q?fQjNUq7GOZHMkcEiU9T+1kCd3RsIrica8XGSeH0z2MUjHWGIazLI2yN4Xy?=
 =?iso-8859-1?Q?uoMMEvsa9tGtuXubuNdO9835TVAtowfZYcTTS/2DzCcuVOJaEC5yY1wxYF?=
 =?iso-8859-1?Q?BZyJ2c2oHn7LEheyJ0XMt7we6byaR0WiSlmXL7gMfceJrGH6P6Y3K6PgKs?=
 =?iso-8859-1?Q?rlRe66I1aq4qPZKwYtIrpBqhlXoDeIukaEWhskE/RNNnP0ddZcrwffAAFW?=
 =?iso-8859-1?Q?J1nfMUnKaDhxYs4GRU3dPHYGtz0Y8EyZuAThPrkYix+8p0Pf8xAczNotaT?=
 =?iso-8859-1?Q?PdhlFywigltORp+MOii12bcu+MaxPUvaAlssKoIB0pHT88XNOje4gFRpeu?=
 =?iso-8859-1?Q?f8nACYhzAuViWN0Sa92+pqpqpzjt2rHTgPLPDPaOLRq52zOZotdDB2plLM?=
 =?iso-8859-1?Q?ukg1BsA3Qm0Sx91cwWpOINbeMLKLLJnTxzQNxk1subzK/qGFRER9YXZ2A2?=
 =?iso-8859-1?Q?HIIWvFQPgfWAP6BmZAN2snO8MrReBbN2d9ivdLY6G12qQQSbuYUR3/s7mj?=
 =?iso-8859-1?Q?ZbBXbOYZwULm6gVPqq04ejDp/CWvwx7YhRSA6hyKzkITgShn0SrP8Pn2Ft?=
 =?iso-8859-1?Q?UWGrpuJ/blf9uepWpQvGkXB9m50vyffliPL1RPFLS07qn1M5yIYvzY9P/5?=
 =?iso-8859-1?Q?SQ1a8AkTlj43ZUSuP+bubb1oI9hJyY1x9w4Ipj8kdBYI0mfPebj+El82B0?=
 =?iso-8859-1?Q?o1gCOa/lkv8HK/RybE90hwS80WVR0u8K4gnYrCeeoWWa9Q9JKZl1NPPBPK?=
 =?iso-8859-1?Q?BYI5x5Tpn4ycVo7Z9jrb4z/jglYI7xGLLeM4FaQ8gFEsevmGBSrIHUXEf9?=
 =?iso-8859-1?Q?WI9IETS0yuvEP3b/ZMwze4QrLcTH+m6I3lyJyoNrMTdzAkw6vUvCyo/dgn?=
 =?iso-8859-1?Q?yg2bWh3AL31GsWhhLfCNFQHPmcEyhOpIkxQ3/JlR75VIhpNoO0iy/QuwD0?=
 =?iso-8859-1?Q?yWGXMmXnnBJ4lyIA8MNOz2WJ60UvH4yNIaczEwq0+CGKBxIws+x/n8aSmZ?=
 =?iso-8859-1?Q?jf5g9RmUghdxyzMAD2WKW3bnFJle8v5k0/n26rGWHIVR12qmkg1R8ZJeKa?=
 =?iso-8859-1?Q?Hr9xhV2LFl5jRk2Lf/Mdsb4K4zyx16ntV5rpdVwWmt01E+ehX27m+B7OXm?=
 =?iso-8859-1?Q?TivMLbiOBkuVPqzFYsZhLCXUciBk3taWDTTAdmNY4ea0pMEB/WaJbsZLGL?=
 =?iso-8859-1?Q?rw6yoKyjMYI8BdkCFRBKSYSD8xHRxmgKUDjKiw0NA9bHYqU0ND9wBZFw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u142sYqIFDDfXWoMUmo85sK820vy3iBejY+XJYWuKOgVY85OkyoHUsQbQi7JTWb29QejvCKUIYDUSyWDbxbNOGyY2tsM4nzgJS9C4LnS0Zs6Zo3lFkyPIm5KYh1SVG6vHf3oBG1RYR5Inl/kaQNG68/sV/DYcz8kH0zBYZf2C9/h57x0Iz3Wx+cRGNzhfL9UD/bPMhnfegAaNpYiOhq1PlgtSQF3sd0n3gXJx+bDjHHskGns6JPP7vXZy4ySgrVWIz4LfMWnbv0FCAN/CzVo+i6JyjqRs2qpyZWyvsy+XjutmIpob8jkppsLXkMVJGu3fiRoUvSvv/6/puQ1khvDkWVr2SIodTLkcG8K66lgsnjxTMQN+AZnFHyn6IRHKCa80gWQZqu/3VVGTTUr5HQZDKCAbfAm7waFj8pwfExWaUQoxn66c+P/Nun59GIknzanY3ZgirTpzAoDiuln26ZXn5KIOVsgZuS/R1Ir7yKB4BLZq3sag5hgWhlEoVWhdbbGFx4DOJDHjnGIKKNcuxglc0Jb1YRikaeICxqOVcF6AeLMRba4uOl2fl+D2EkH0Tq4Q4YdX07Rdw/lzWBTHRA2bCsWkgz81zpaF/VKS3BRDFI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8625916b-11db-4bfc-271f-08dddb6a3193
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 19:38:50.2408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obAnHn/KbYU93RD0Y/SOXruWMsCvvciZaSA/J3dPS+mxXWF2/0zlLTa40gIFP68/WP6H62hRux4u2TYxKfgQQT4Hmsln0SHzQNZOtT2bXWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4709
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140168
X-Proofpoint-GUID: a_-nDn5jROp7bRQ1C2xKLyQux-Uy2zlu
X-Proofpoint-ORIG-GUID: a_-nDn5jROp7bRQ1C2xKLyQux-Uy2zlu
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689e3b4e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=beyV2qfISwKQYKBC-KcA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE2OCBTYWx0ZWRfX9l1L1PuL9zPP
 UdEb7hnyCdGn/Bukk+48qjPUuw2Uhu3PMai3IM26OZsv2s8xLOGO4jQmCqz5apvqV4DKdVnlnku
 iUNPzZRpYcgM07LAhAx912UW/y4lcbk3jBm+l3AqpH/9cozw4b1iugtxxbUQPh4+pcoTNYuC9HB
 +VZqb5n8E0N+FUzF8+DZHYrHfo87GtfOIlGSalqcwdjRTaItRPluXFtaJ9ho6HLBgJAB/2jiI6o
 PAv97B+JwBgLA1XZwq/HTG4D4mJaNsO91I3eyLH8jvhUmV7Vcfyor+6sctC3EkPj1H3coQIWWv7
 4E7lm9lZZDZMKXFI0gpOV3Ker3USu8zMP9Lws8/UDlTHuhxjQoV7/87C5faSurNTwjGa/gp4GZ0
 agrGFi3Mr7sSqJLCfSmaDS3h0uM2N/sqMfgw2E6zziowOu7ACtOJER6Xn0mCS4II2sM+QxEN

On Thu, Aug 14, 2025 at 12:18:42PM -0400, Eugene Loh wrote:
> I agree, but does this change any test results?  If not, should there be a
> test added?

Hm, it did at some point in my testing (which is why I added this patch), but
now I do not have that same effect, so I think that perhaps another change I
was making interfered.  So, I will add a test and post v2.

> On 8/13/25 11:57, Kris Van Hees via DTrace-devel wrote:
> > The trace("") action would dump a series of 0x00 bytes (strsize of
> > them) rather than printing an empty string.  While that is the legacy
> > behaviour, it does not really make any sense to do so.  The trace
> > action is described as printing data as a string if possible, and a
> > block of 0-bytes can certainly be printed as an empty string.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_consume.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> > index edfe5bbae..2dce69d6d 100644
> > --- a/libdtrace/dt_consume.c
> > +++ b/libdtrace/dt_consume.c
> > @@ -991,7 +991,7 @@ dt_print_bytes(dtrace_hdl_t *dtp, FILE *fp, caddr_t addr,
> >   		    c[i] == '\b' || c[i] == '\a')
> >   			continue;
> > -		if (c[i] == '\0' && i > 0) {
> > +		if (c[i] == '\0') {
> >   			/*
> >   			 * This looks like it might be a string.  Before we
> >   			 * assume that it is indeed a string, check the
