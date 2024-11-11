Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CEC1A256B
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 17:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731345532; cv=fail; b=io8xR95gGmWZ4IBbDpM69xado08loWw9l4mfdVorUM42kJpMpi81r/QLzF7kDarEAef4JLPBaUIAXxWlre6ogZNz+ecNqNdUw4Va8fItRiB+liOCk7ss3kmvpFAVLrOOPeK+4gb/z/SXyw3DayTI3hu8/0njEwFPYfLNNRLVWrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731345532; c=relaxed/simple;
	bh=/tRJia5uzauwq7CcUGjr2yAUVSiMtxocrpE2hZplRPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L7SHCOj9IIxzNrlMPPCrMN6BtxKLLxbf3tL3xiRR1XYKRVXPzkGDL+zzNHYWGCaUR0FTF088UGhc+GkhaGbRabLBRoZqmeFJgyB9z5zQO5DC5rDnavmSRusB76zIlS1lXyWy9x6OZ3euZR0DLk1TH/EpxcWzBxSDextVMqnRNoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VZM0ROuB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0IqcfalI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VZM0ROuB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0IqcfalI"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABGQY0C016875
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 17:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=F2fEhE98mEUvV9z2Dz
	0V91jdAA1NyT1dX2RAh58oHAo=; b=VZM0ROuBUm6QbtVc5HYItsqX2wp6xHvKg/
	hUgkFZeQ/UTYfheV9EdU2dB4XDyGijht0flFAMMjiSwrs8EsDngQbraqkdAHycfs
	QFBPiCLo6zfVPO/kcc7lIEpQq76GNmwYmbXru1bP1puCUZVaRCfL5Am0lDGl3X9y
	VMleK7XDJ0kv98fb+SSGeyU6p0pAaPvFdVreiu5XLHl1tB/5QdtlD9OT2XcRi/Nq
	79R54KmJGm17eHT7kOHc5+GG9UyKJmlPp29lbC9ZQLiUS0FKpCRsdLNsQtlEJRto
	TwtrWL7fUP2YA1FZyuTHonrnCsV7pzMAh+m/z9zn2PPKMS16pbbw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0hnay7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 17:18:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABGu5gx034477
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 17:18:47 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6791pt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 17:18:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Snusj9QL3U8343l7Sgq9QdNXm5Zs66JaPXLHmxrqbsH3wNrSl7fnUk4qtHrVipCtKU7QP+P+ksWJMpsYzXZ24DRA15pcPnS0jebcDjZ53N7N88A2v/1hEItSNxFfxWsc89bH4FOcaLGYzHYw1+qfEiBNyGxKrLiCUot58PO/ejgyWxjYhJU/cv4JXWY7xiXnXJLkHsbU/yuJxeZTTdGARiTfpUK6M267XwPhMi60Q4dyxGoovFdAoIWUaB/5QePL5heGwkPVWZaYE6zMNqNaAd+nhnN+jVZteKxxgYUBf8XHnGxgHvjnIJX4kErHX0R1GlWzDhzK930lTDgav7d9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2fEhE98mEUvV9z2Dz0V91jdAA1NyT1dX2RAh58oHAo=;
 b=Rx3NnjAPLv/r+65NWfs9AYDTn/V1QSgQBNpfMZTVqhf3eQJRDVi0Egb0F0ra9LhFhJauZbRvtq05WvefFy+qQzB2g9hth3Sfy6I7xNbtYApw2D70VxJn8zEmQPfUo721bCrfmjRkqAJZivnbZuMS/kf3yZkfGlvDWXoytkpffHsPN80QLMsECoYRe1fvn3AO3rcxk1HgAIW+7FweupuF28ngCRdZH1pGQizrGdhH+F0apBUbOvycSKxmCUVYkvJIk6cFY3N6AsW19Epryn08dSvJlmOTSu7rIGaE16zgIeBfMOWHF65tBEKGZcyPyMAL+F9wBFFm2qTxdGcTPXSsKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2fEhE98mEUvV9z2Dz0V91jdAA1NyT1dX2RAh58oHAo=;
 b=0IqcfalIAAEBmH0D9mSV7NeXe2td3U0qTQ7lBVMVhQe9MRRu2PLxlsSq2YCMCVVsFVz4YqMXXvlq+36ayVkPwpegRd0uhp4iWOIsDn1ZDTNPOa5HmaWr1+ldlJ/rFZIx3di9Hx8n5PiF3D8h45ST/GqE8o5ooWS3ecTO1gMJ5zc=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SJ0PR10MB5661.namprd10.prod.outlook.com (2603:10b6:a03:3da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Mon, 11 Nov
 2024 17:18:25 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 17:18:24 +0000
Date: Mon, 11 Nov 2024 12:18:21 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/3] spec: add dtrace.pc to filelist
Message-ID: <ZzI8XV+quXXPzwBR@oracle.com>
References: <CO1PR10MB47692B203911603E18C72BDAC2582@CO1PR10MB4769.namprd10.prod.outlook.com>
 <87ttcd4vbr.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttcd4vbr.fsf@esperi.org.uk>
X-ClientProxiedBy: BL1PR13CA0434.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::19) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SJ0PR10MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: f76a8829-ceff-48f6-2f51-08dd0274d9ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xD8UJWeD1s3eEOgFmmnSSSEN1iv4q2Gt0y3fhs782K3lRTnpN0BLDRh4tb//?=
 =?us-ascii?Q?wEEbBznl3rqai5rJAl3jm0gWEipC+6jzseFju9wPmuEkGfH9CRq2vnMTVRG7?=
 =?us-ascii?Q?XfhATueHstOegSsuNB2WmLYS/PFr2xGacPpJcpEJVS6cCMii1/Ricc6av7k9?=
 =?us-ascii?Q?9FGmoj4SSZ2ZapLzOyzyoSKc4WaybWCrs08xnAR7/tfM5ePS6WsKqgj8h+ib?=
 =?us-ascii?Q?kaANj39wF4WXOI1FxRZpFDVFkDVt/U4ZpBF+GFMzxk+9jbkRuaUn6OuACeoY?=
 =?us-ascii?Q?MgpS2kFq+I9Nx9VNWca2CwgD9/FXdiRnkH4/iM5EH3v4ITzNlEJ2ZAJunKbT?=
 =?us-ascii?Q?3KNIuTupSKfIaolcg4LY6pk96rwhLVQDAvjrh/rh+4tGwdMMXDMN1EEXe3Cq?=
 =?us-ascii?Q?yXsuzKpgfI9M49XtKXeiRiCUAqz2wMWZJjsxfvrZsEREHoSxpIKa8TBcZFQu?=
 =?us-ascii?Q?SM1iifC3hBR1Q0EuEqYrhtK/dlIwwiYIR225yIv/UOAIVEE8FFjEBfovEGyE?=
 =?us-ascii?Q?T5Cs8TGgoWbYqaDwFBsDYtRQFa/LO3qxGqblImhfpsxSHt+ihh6CZdoTq6Nm?=
 =?us-ascii?Q?S8rVwwwUSWyny6C9QJkuXaWdRdYqvtZqmy/6y6OQ6zy65c4RxEiGWvXtSN1O?=
 =?us-ascii?Q?n7Zoh6lc9t1hLvTO0MXGQoVToIVQJRkhPFXwcXT/cmr1zL9RfXorGA7JfI9S?=
 =?us-ascii?Q?Xg7buRlfswIgGOQZO2jOXOMYpvvL12Baf+TUloLrpbxAzM0nG7JvSNEhjZsT?=
 =?us-ascii?Q?3MgBZb9JkFs0ma8tQeXgjwAnJ4kTdtndiYDIRb/RDFbkyBrLyhLGz4Y3HFDu?=
 =?us-ascii?Q?fs3aCip/8UJUm64HLi3nwaknW/CuYUyUn0gLUC7yNr+rjsXab9X4ykz+YQE4?=
 =?us-ascii?Q?MUqn4SayzcWa28yOHK/Gj2v8llq83OJfLkVL18XoPj2c2YF7heP14Y6Fq/Qz?=
 =?us-ascii?Q?diHfG5RoSGUx4sx78mG+yhTRp7iX5/bL1W/nTYgoWCGdmwSAsNZ6pRpao2ZL?=
 =?us-ascii?Q?DpCw18z4uCmEkEMt/eOpMxfNh9R8//3WoMpMkQMnV6VaH6IFrJdfTWykfb1b?=
 =?us-ascii?Q?XmAUl79dBxPkU++SVVnG4xTBgdRkFnawMHkFWJRe2sFUj8GUbeqqxbyBFWRb?=
 =?us-ascii?Q?dwSXajzWXXmzN8lQcyxrE/HJqLT3znanl9tKrmQDBT6C0T3KlTTn6pbSRVjN?=
 =?us-ascii?Q?XxZLD3Iy1iDgzK2Qc3lFgz+SrvXh9c/SBVZx9sZvvtmDRYBeGSN29NqjVw6/?=
 =?us-ascii?Q?vuJaP5NTh7tXyMSH/uQb1AG8Dkc0V4gzUfJ3WyCTm+tMfwF/ae1E9TiXwUbH?=
 =?us-ascii?Q?9IlCGf2su+SWfZTyMHW8V0To?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7fR/lo+3E1pLDws/fF928wykuKDUnh6KTGTQLuZRpF+gLan3gmzPFiQcIxun?=
 =?us-ascii?Q?yK33/xUZoU2GRcsTCXdLUdy7NcX4odIIy+LBWd3eM9k3zU0rJp7VOczSkzBx?=
 =?us-ascii?Q?nNIUpViTru8fuWx9iQcJQlQn5DqY5yhTm0VilSfAlS7MFKU3dTouZvMcbVCl?=
 =?us-ascii?Q?1m8ZrzXKpvFTUBibUy2qz4vgR7Z+vMO+xHfDy47r9Krukf8WVkavpMZf95m5?=
 =?us-ascii?Q?HDWMXt8eIHzFJdtjFKxXOEck+uAEgjBcsRMPN1UEteHXauIDAHtg+vyo79AU?=
 =?us-ascii?Q?bU84aCCFDK/SSM6OhI3KFoT7UksGtgs9iYdQ43/l3qC8SgEkoDxP6+Y80ZRu?=
 =?us-ascii?Q?oKJiVp3XxcI2wPpz3oKlBnMcjk6ClEa7pYr0W6lqGHUuKArXDdYvML6Nlruj?=
 =?us-ascii?Q?IZ2SgR58tZTeoamjoN9QDJDGuMVhWqMjQg1kTwGRG+AR7RsschT6R5MJjDcO?=
 =?us-ascii?Q?QcsRjkBk809i0GZz7Kk1LN6QBDEV4sj9P4wmrW8spP1z1splmf/OyaIblU2I?=
 =?us-ascii?Q?BT4i2L0oW5zb8dTukDgjZMImP8VcXYIqeutuazR+hhoF8LJlnFFgvmB6BBC+?=
 =?us-ascii?Q?Kbwn8ed/mcAnC56tvi6ChNHZg541LHdMzINzSV8h1vr7FXBkF1Vqtu41RovY?=
 =?us-ascii?Q?lC3CSZb+6hS+3AFDfM2l5KFuPNUZgwDaONWfD8gO8NrF7Iq/9bbL8t5XWrGj?=
 =?us-ascii?Q?TJxLuR0AuyaJN5b3fVYhyeojfMXTITwkxKEBbVDe9ta/F81xWs96Quuw9EpI?=
 =?us-ascii?Q?w31m8IFRWols71WtzQLZ8br6cQ3g2pPss7ovxIrSZZrjNph9O7CEXiart1cc?=
 =?us-ascii?Q?6s17tFAPvUyj3mMnJEdkSW5eefEdZER+CC+Uj4CYYbVHUo9buF9/aAXRJj1u?=
 =?us-ascii?Q?LkWfwuZh4nT5suRpJjM383aTUxU619r/ZQ2QlTpoi0C808u6pRAfdJtrU7W4?=
 =?us-ascii?Q?0BlMSbLWYiul400vpc733eo+RrTQ3pT3WCNrHQl0A7nakCEaB6nU53db96mf?=
 =?us-ascii?Q?k0DRthc18haYVZu8zi9JAx69WVrHd2etgsS7F2gj2nt6h8pLxykj7u+8WJ3s?=
 =?us-ascii?Q?DZKzEAmpbEhRhyDa6tG+KL2ujOTqXIO3AAL3ikgJkGhmagspL6QhrUF/dqwF?=
 =?us-ascii?Q?8HfuzXNs0ueWotqvcFPtJsmMLF5XBPhhpQs0gt0Ovf2aRMo9wvZ/+2VABA7A?=
 =?us-ascii?Q?wPG9WfI2pAA+FdB5DA+GUWf0zu9NkUae2Vv7gYzyxVuvv/D3XtZUnJTJAFVr?=
 =?us-ascii?Q?JpNnSh6m+HzVr6NiTrtKp/YYfR0/hLThTbFm2fdHzOoNA2T7HYwLGnIAm793?=
 =?us-ascii?Q?TiclhGbCBgxKB4LAr/PYNlmk90Hxat1IuIFoTtloOwEoHOuDoeaCgezM9tYG?=
 =?us-ascii?Q?EyADEEzijXhJkexcciNUgPqz3ucCQIQQgAfrFM5SP1AFFSKhge3HtQAv84gD?=
 =?us-ascii?Q?08Q4hJRCVElHq8wyr7JOUZ+AzFvdJi8bIT5cEpS45c65Yn55DclAyFOgWGI2?=
 =?us-ascii?Q?qeGJleb6GWjwRv4Kp24XPxZrY3p+myIBqaMNUFxwwy1AFY8zZXYCu+0ubJul?=
 =?us-ascii?Q?iVd7Ucde0CTJzaJb6PmHVJnJBsfFy/jIXz8zi4f77Li1Qq/AIoeUMEUQCtGP?=
 =?us-ascii?Q?NQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PkPUnGB9Pg2/9Vgo7XYy+en5YMF+qJLcXJ3lQW2TY/RR87X1M93/YjdxsFmYQLew6rZW2fyCuNiZcWYiYVp6w7KOTvUB9RPfZuhBEMzcrlUMRwSiaSsFv5bF1OWS/Md3cQt7KLLkcsAlwY62nGIJwtuA6VAIZCMXtxA4UxV0fuJtTnDzojepBpx9b+bfSEJlRDTiX5i0Di3mXMa4Vrhwsy2r6kF1brbL5QctMgePL0N68jP9HC4ekk7Zp85UBNQ0XXdqrPuwm5HMejVUeHk0Wj/q3f7gT5ou/PCTClKMRSKzNAeLPYoLkG1ud/oODQW9ceealot35ltuIGcheO7vTGMq8jxpOiPc2nMLzC3wYswgU18VNjsE/xp511lhhXPGMAQ426U5nfDQiLVAyNhM58KfH0hKciNT0m5bsZF5p8d1v26BFE+0WN88Do8f0hzYA/CROH5VhXrjQubcMAboKduDcVjIY/8KOw5amTCVFMwU+Upfe9ieqckncpcEKLV7HCD5qjy1d+jh3NgDzrmGjKd+biILrtZ56UbIuofX6wpHqADw1WWGahEszz3lEoSJqw8R/AajaePhnA6OQKcbTZH5v5q0IOjkmWw+iW2CTkI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76a8829-ceff-48f6-2f51-08dd0274d9ab
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 17:18:24.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FG52E+NO6nlY3Zmuuso6CmSOuS2Wd6KRJnbmbjiV9AcZDE9W0FWk3kom/soluvKywDBKFPRE6E3es02NtQIaUyxjGVJSC7ZJVTA1UNo+I+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411110141
X-Proofpoint-GUID: 0mrwijpIyKorw6V5cQLaZkFx5diyLyiU
X-Proofpoint-ORIG-GUID: 0mrwijpIyKorw6V5cQLaZkFx5diyLyiU

On Mon, Nov 11, 2024 at 03:57:28PM +0000, Nick Alcock wrote:
> On 11 Nov 2024, Kris Van Hees uttered the following:
> 
> > Commit 52a18d35 "build: add a pkg-config file for dtrace consumers: use it"
> > added a dtrace.pc file but failed to add it to the dtrace.spec as well.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Wrong package: it's a consumer .pc so it should be in -devel.
> 
> (See the patch I just sent when I woke up before, uh, reading any mail.)

But dtrace.pc is the pkgconfig file that specifies where dtrace itself is
located.  I honestly would expect that to be part of the main package since
other tools that need dtrace for something would then be able to use pkgconfig
to find dtrace, etc.  Why else would we put the location of the dtrace
executble itself in there?  Without installing -devel you don't get to find
out where dtrace resides, but with -devel installed suddenly that becomes
something relevant?
