Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148AD16DEB3
	for <dtrace@lists.linux.dev>; Tue,  8 Jul 2025 12:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751976918; cv=fail; b=aBl2Q4ObewUEqxb/dK+K9UOEjht51NdKqDQM3A7jEGMUHmDbIAvZC7etUNMn6AsiMjzgcy5s1QpIf53w3IYyl0xMhWPwwGeqQU1WGqUigEjy/9Etu4Gx68/NAoYba1celC83EEhydNryO6TdXH3ItEOlngZmaAnVnEAV8yFoOcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751976918; c=relaxed/simple;
	bh=6OpSF07wK68CbgkgCKeChDNPZrvXZFz8yLrGVinZthU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=QrMu6HbkIYZUaPQ1AJjfw8G+uihnCup7Nj8jOsGlA1s+mRavrgRVQxJBLS7aXCas1b8RiCCk1cG6TBsz6c9tcBB0WoXsOoaqH8zEgJpf6nrKuwVyt6OKEHk7EwxL7X9TXrPVCi2YL3ETiS3Iicon6qzQOKaeXsmYbj/u33FWWA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FOQTvsxZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZxOAg0fK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FOQTvsxZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZxOAg0fK"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AvYlN025396
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 12:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ym6be06T9C9OboYbzm
	TrerdEDD9GmeoN2VhTKx1PYpg=; b=FOQTvsxZoGqaDC8mRtReXnhaKGP7SmFlRd
	aEmfpMG8C0ADSNaVMNI3fA8dyRYdvFUp25F8METrf1Oun1A+OTWg7wAbdjMm5qGL
	p8BqFEjA4LMv+NxxZ7WITceqnxGVZgY2nsUJIiVP7BH3N72niMNFQvJVabhERBJU
	tGwY9kK//RykZA72jYRVu5cEhJYIeeA0aphq8DpLa/48cvCMuhnw7tYG0rEjN8e6
	ZNpxSvoD+ZC0vNmgDXkgjyuzr4Oh6ijG3qH9rY7JR3JaRaYL4O9R5PlZG1smiErQ
	UsMiLLJtvp2Af/IY8yUTG2Ujjx/jPN4cat4nfUexp/BlmUoXsWMQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47s218r3uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 12:15:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 568AeBca014191
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 12:15:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg9hq96-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 12:15:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y60EpwSQHIF4gU/IKa8ZO4UqgutHfU7ruNmhCWZThjLdp65fCsJF6CiNpbzL26E67DEn1kS2X5W1EwcOKBRvgA4qLT2NjOzZYm9c8eUIkEUtdiKR4SYxP6OF4PiPvOty+Tly5vGQCjgSelIiqMbnQp9nXA/lxs4Tt6YLwqrIAi3ISimxl67hp4AyhfotsDSgGLKQX43CvqmN6X5y2Bt3ToX6On6kpE34oJbBIPQL8UEctPJfsRLalRLuMgUM9NB9MCueR+UYnzrvN0Lmx4c/Cpr0vjK+W5mE9B0SjeKTznMb+110doWX0nZgNmRHQhoismIwTbHCon00F6BI1WybFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ym6be06T9C9OboYbzmTrerdEDD9GmeoN2VhTKx1PYpg=;
 b=VFD7yYyif9Ud8WkmXa3o52hbrlC2gLts45HOGklyaMBJDUzvvt8Xd9H0DCaWAcGanpo9b85vYC/A6ep+u1NWL6L8BBPlAaCtHGinjmL3HClDAQedALnYFehEu8HY3Jjf5pnUtzS2GhwtFQYuMsSZxE0rrK1JfakJzSK9ngddxU4iKDQGPEAcykB5y7MO9UuPl4DcBUw6WajrT1LDQJ3J011DJLzEQeaYW2C2C/l+QIdoCqpRsc4zEQ08hR64b9R9a/u0gY24ow5POe3bIheo+wirfEHPp7J6D1jBWW0BzNJw3vvkGEjsWaRWEtLLZgFWHzpiVLp6Vufw5OTEM2ZdSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ym6be06T9C9OboYbzmTrerdEDD9GmeoN2VhTKx1PYpg=;
 b=ZxOAg0fKW/9P0ReV07kAw6xq2foYW+WVWy++CX6i7LLExbpFXs9mGD1e9aoxfKjXYKsRFlWXRbvIagO5GCUEtz+q6zynynVx/IIJdK46hgEzpbbe67CzChafYONyaFTDUJiwBMaGjFe3XBT0wNTuQIby5g1weAJDSrV3gQ6+czU=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by BL3PR10MB6116.namprd10.prod.outlook.com (2603:10b6:208:3bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 12:15:10 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 12:15:10 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Skip err.Z_no-w for now
References: <20250708045257.13808-1-eugene.loh@oracle.com>
Emacs: because one operating system isn't enough.
Date: Tue, 08 Jul 2025 13:15:08 +0100
In-Reply-To: <20250708045257.13808-1-eugene.loh@oracle.com> (eugene loh's
	message of "Tue, 8 Jul 2025 00:52:57 -0400")
Message-ID: <87ldoyev5f.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0228.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::24) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|BL3PR10MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: fe139618-773a-4061-8226-08ddbe1915c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nC/JyO32jTx0ruJQX8rYvCEAtnlgOvr8txSmJHtEgrDupAgqgsCAEemPn4nO?=
 =?us-ascii?Q?ODoYglKZ3JtnfcPWRJOrSjGF04ntCNCQhzUOfLVL9H6/oJhxL16v9Hc1eV0d?=
 =?us-ascii?Q?VuUTg1OPK6ebdwDVXhWrGBG8ccdh22HmmVUnDKzCQgawkBt+saZF2mZbiKua?=
 =?us-ascii?Q?krLefbyb/LGKBsmPPyVFDZtC2ZhZQehWOfWMf/NIRBPVANcD5klpSV4Xqurr?=
 =?us-ascii?Q?SWG+XmrdoCli92DSPcSrmXYjgwcSFS8cCj5ax+4ip7LEt3Tl/H01Oz236gqH?=
 =?us-ascii?Q?F2lSTsuDs/FnoZcc55xaMLJE7EpoLaKRQtrNNlvKrIcm4wTgV2mqMeEfqnb9?=
 =?us-ascii?Q?0Ra3IXOFCRfmpo+IJ0Qae7e+we2FcUPWoMBU6mC7Lzn2PMKLcGtrlRsZkJm9?=
 =?us-ascii?Q?eAbewDvLX5A5hd6N2nr30ReIvSdqr3WdVrImENdD+SYTywucZLFxYfsMc22x?=
 =?us-ascii?Q?R2KT/Q5KY8tqxBHe39sMaEfw/234f/UV9T70g8BK7s2iHDWh1FvFysDx3D+1?=
 =?us-ascii?Q?KzyKnUlaOFV8WsdH6Q4+SVhdhdGNPaQeXMeWpLcS9Ajb81cKd/sOZfLS1pb5?=
 =?us-ascii?Q?lDvzLQb7MXYTreIP84+Orea4IoKLfQmEFlRGdg/54NTrpeC17+liSCD9BbgQ?=
 =?us-ascii?Q?SbNuxogV/ekr13w1M34MueNiUVl8qBaHr5W3X/DEroL46pUyiPoAN+bAv+Y5?=
 =?us-ascii?Q?JQQ7rYJN/0747zGBHTx5rw7Ezbqrf2AjRtqcxrVbxQwlqjS19pX9Usr+nDJg?=
 =?us-ascii?Q?A0YJh65IKbGK4D6TZGlaoC07XZCjz5Zdh/xuAqfF4nshuHq+cp5BfIhVbHUO?=
 =?us-ascii?Q?OT1Aox4UL5aRZlROc+u9RtGUTrrUmIt30mT/7A3b0t2yPRtLrpTJ/mx0/PVy?=
 =?us-ascii?Q?tANVnLZ9uQfxf8AzzQpyTnZSksYFle5aqd7y84gEEJQ2xsWD3UwtZ9STHq9l?=
 =?us-ascii?Q?zEbSh9T+u+YNQ9rRm0hi6b3BZnEAIK1ucpvxjgsMugqMLyXlfwRIgBH7ezTy?=
 =?us-ascii?Q?OtrxUdIWdyKrzP77Ygt3fcKry/FbXPLWoHjHPIhFcYFHAM29QU0ZeKdeP528?=
 =?us-ascii?Q?5HnTrvgNTV3L79RP1RFB9gQ4ApiQ4M04tkU17P0j5JY7hvi/a2nJXRmTZWQy?=
 =?us-ascii?Q?29SiwfJtEI4oYpYXCyGx+1FIGLO3YHZhHPIwGdr+u0sOVQovQSg/A5Dg4sp2?=
 =?us-ascii?Q?dVRtlvPUOzxFLmOMXLUuGUsna9qrQ+JMBQcmSX3Jx0rVNmyjF0e8JWyPzgMu?=
 =?us-ascii?Q?z9/PtHaBQKI1Qh8Vfce533HGfPxsOlNMrLJYKYcnIh5091azJo8SoLd8ygg/?=
 =?us-ascii?Q?7xW31PYUFC85QMyPaTM0it4NkWCGVqYKr7D6qG9YrPX/Vmae4hqJ6ULK1VbW?=
 =?us-ascii?Q?RecPcC18MmIWFlXrV5il42l5ken9R0737EZVREaL/UWX+rUT/gYpW7Lkn+zJ?=
 =?us-ascii?Q?CSATXIZLi3U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mp5tpMmG5UEkZQd/RpyEr/hqib5PyiRUUdILICDPLCpBlF6FINFX4gXafT8T?=
 =?us-ascii?Q?lrLbgjr86hfZkmQ1jWqqyG/wFgABf6GzdysroDdcBrHN2GwoDoIOI6DMq4Cx?=
 =?us-ascii?Q?NjywHmbm4GQq8vcHxTefb1f9hHFQ47udoODYFp7gyQQjO801pEAvMUL0G8xh?=
 =?us-ascii?Q?desB3V+T2kFVFFJ9oHv1SwwJK8CKfnniierWGbHru5L9c+Mg8gbtpp1XKOQm?=
 =?us-ascii?Q?ejxxp/Bfr7tbUABrpjgBVW3eC9KDyhruLKTBjfLwRQxLFrDok2dcldA5C6n+?=
 =?us-ascii?Q?n5F3tcfj6SQkis/kc4iEpmJK2uF45aq2F+MZGaoRDVrRHRHpoJb+AkoxZmus?=
 =?us-ascii?Q?lbLIg1wPYfocxJubgLLNDwjlxZpEsNF0LkwfnNXX0YVIb2vm2PdbboQ5+yqx?=
 =?us-ascii?Q?qjwVPmfw7UebUwjpGB/z0Pi8cMjUOVGEhyElXfWot9Nzp9hZJR6q7VVBRgpc?=
 =?us-ascii?Q?FLAEg8BhFo1z224Ew35caYv8d+4mAMYuNe0yy09xELoT5Y9Fb1ChkagRZVKO?=
 =?us-ascii?Q?I88S4jnCOeZ2UawAquYNyeIXYdNhqnbLAggIl1K6hAp3rBh7N5WohKWSggee?=
 =?us-ascii?Q?/o5fR4zVif7qYtuuL9FCHukDWh1emVxWYPw5CNj4fs25lsMU3xGgiVsmcDwu?=
 =?us-ascii?Q?fABz2IRf8sLD4kwn9hAwkcjrngGHx3C5qjws4DUzkCkCM3Y3Lc4vJ5MCR93I?=
 =?us-ascii?Q?teA6fQg6xnetVrs1GDm4bjV4u5tYyCMV6L1vKK9fy4fTCxDFtNU9rDWsS5K5?=
 =?us-ascii?Q?879qdsVotI0SallXjmaGHf3xLHaaKaBUyXm0780CqXxy1I5Y2z5je2VqEOHc?=
 =?us-ascii?Q?kxVPM0QRf20WGbdP4mhiqnnCbI8ktI0l4f2pCYWy/wW84aLr5JWkCIyWEwHh?=
 =?us-ascii?Q?eQdBuUAN4MlNDzjURg2u1NdGxN2ouUJjrD2uSnDmESgFHAjRIC1x3tPOZPqd?=
 =?us-ascii?Q?wHRmdWUjqTo4pgGfA2kTIL1dJ8UvCrIN+ntH78CK6I4ldA4jIqX81BDl9hw6?=
 =?us-ascii?Q?c62p3N5XRMdoySMp1uniLQqnYVHFEDErdCejhDicHLornK62a4NwMKwj0K0Q?=
 =?us-ascii?Q?dcsZYdPsJ2aj9qMRHztcxI9wj18o+FnNz/iuWdq3kkRbb1dQ0x6aaaWaGG5l?=
 =?us-ascii?Q?bXrU4mNNVt78XN67ZmovzWfnGqlpozlCoNnPjhUf1gkPEmw8Tz/8aor3RGff?=
 =?us-ascii?Q?9yRLnGr6vxKpvsJfw7esCdVI3qdtSE2DRHs78BjH9LiL/IkBFfx9xxZBQExM?=
 =?us-ascii?Q?/AmjABguzB0i761bv4U7dW7ZsiGLed5AYES0ziBVuczL6/3f1fB0Z3c6u3TI?=
 =?us-ascii?Q?d4veQos+mEz8PbJDoDbAECeoi31+slAL5MFJEOlfCnnYIn23zO3DdkF0JryC?=
 =?us-ascii?Q?YdFphXOGLLKrCEsUV+qGTu4K7VphiwHlzc4TP5Q9z50mWX3rA8hGmtPO7p+y?=
 =?us-ascii?Q?vJenh67QCEiU4J7/GCRJyQhaKq/8PdYbIP/K6beZi/lKhC5v8fsuzWUtTHCp?=
 =?us-ascii?Q?84RTmP9biVMxxx0x0yuBfmAP5u/yuCRN1PvezxXprohxSvHVdYexpcBzgiuV?=
 =?us-ascii?Q?RgKW5Sud8iKxVQx1RvrPWNH7AvZ5MZfiy4ND17HszXtdfSpOGKIu4CY4KfVX?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G2xAGG4r2xPYHYof7Vafugq7osmA9bB+J+U0ODQEgzum5sGvxSYUZCGi9uEBfDd+cs27B5taV5HOr8K0fyK1zqG46UFtDi++rBLAVL40HDELWP9xc/PpwEVLb8BvvVwCjdjC2tOkCd96uqT/KOwFO6/mAQfggZafDrlHkemrcVlCnbkFCItX9M28Ljn9cHI6HPUfglwzLQgqPIXbLgLvsAjxS6l1QcDg2NknCK3Wdm3UcerQ7H5sptXMb16W6fE+Kpfi9p5HJr1EVSjC2HjmUtaYo+lALrJoatqoqKdURiovL5umycIgvqyN+ZYTm8MhDNc4V/sUbuKlL/rtGS2OZcS3NVIi9O32vcxp7iYhDqRCX2txNXpyxnDZWmoYEIZVM4uqTHBJ6Z5ys/pnnE9fWrDOtbNw23nhWX4ELgKVECxcMC14tr6CgnYGF0w7oboKY9TeNXDZURzgnzbkMDG2i6GNBY71GwnNkRarOTp2ylJd+aubJVUPlZkEO68Qzu47LDnfCc5/yLQuTV4/6tE+kxsPtQOTZf05stuE3U9JGn1JaNO4OXRD2atnF3TQcFozrUbTG+G9WKqc9k7+FLnRy0h6RAL2DL2c/9H8DB619xo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe139618-773a-4061-8226-08ddbe1915c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 12:15:10.8366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seQm9p4+EbcEIyWkUgkEKI8YyNx/K20O6yP4GvDoZmuoXQnio54NvKGXSMgm2T11f+zLlqGr8EtAzGDOyEeElQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6116
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507080101
X-Proofpoint-GUID: AdzECWkqqr3RA3KDqgkD6jiDYvJCpa78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDEwMSBTYWx0ZWRfX7Ulnh5DCXdVN FLSL6B6GyQwDCVdTBo1uS1xHNGfutmauMG0dtStrCjnPHtvxyD/hC+NhUk4tmyO5tC6T8orzNP6 Q2b9Cuhuvwn3PX+Ym1euUtmZWNW+pL6HeWA6MSF5ixpJ5DDPKB8AidhHXcL+aXOtFj+A+f7osil
 mxcTE1QmE2j4EKZ6zYijulANjDFfK0dsiuw6xm3p721pDnX+G9oCHu7pwa5m8sseUNUUNySPneA q8TF6RybtYwdLceAl963Y0Z2LKcjRRttruO/tKieXjt0CcQ26gDPz7vRMWGMUDSQtdfNCgsLc9H C63Muo9ln5EAfOPpwahtKkI+bI66CGTI52r2l4ZvpOmCaxrBTTdFLayrpkx1dHAgHIa4/+V8K+h
 khmpD0yxdwTV0BI9OpFcEHyPOs2XPBqXpX68qiTSe28f7pfvmwISPjMdbk/fB3cb5LUfRRUp
X-Authority-Analysis: v=2.4 cv=HaMUTjE8 c=1 sm=1 tr=0 ts=686d0bd4 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=qe3RYQNZ0Qw2qKUpU_UA:9 cc=ntf awl=host:12058
X-Proofpoint-ORIG-GUID: AdzECWkqqr3RA3KDqgkD6jiDYvJCpa78

From: Eugene Loh <eugene.loh@oracle.com>
>
> It is unclear what behavior is desired.  For example, consider:
>
>      dtrace -Z -n 'BEGIN { exit(0) } foo:bar:baz:bop { raise(SIGUSR1) }'

... isn't the lack of semicolons here a syntax error? (Or have I been
inserting them pointlessly all these years just because awk needs them?)

>
> The first probe exists.  The second one will be ignored.  Solaris will
> reject the script with:
>
>      dtrace: description 'BEGIN ' matched 1 probe
>      dtrace: could not enable tracing: Destructive actions not allowed
>
> On Linux, we have:
>
>      dtrace: description 'BEGIN ' matched 1 probe
>      CPU     ID                    FUNCTION:NAME
>        0      1                           :BEGIN
>
> Perhaps both behaviors have merit.  For now, just skip the test to
> avoid test failures we are not ready to arbitrate.

Does execution fail if the probe exists but there's a BEGIN that exits?
I guess so. So the interesting question is: if you start with -Z and
specify a destructive action in a nonexistent probe, and then a
USDT-containing program starts up that provides that probe, what do we
do? If we don't terminate, that would be surprising. If we terminate in
the middle of execution, would that be more surprising than checking all
bodies at startup and failing early?

-- 
NULL && (void)
