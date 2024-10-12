Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE7D4315F
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 03:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728703759; cv=fail; b=A9Md6R6nmuVbN05mdfHOpd2YCcZifRQymw88yycFYngu5MFegcY2XmFk2pwL8VC3+dXm+aGK2bTcNJUNWhYQxLavH4hiQS9dNfxzrrs1BqLqJekg5/rXlprQaYbK15lkuhYC3Lmh2Cwo+1wn3ZTwQNsd3DUmd4PyQh0wWmy+y9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728703759; c=relaxed/simple;
	bh=/Tx5st3JiC5yCgMdovzMA8aZeCtYBq4IWyqL7QwyTTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vGJdOR00TQLzeA8qbH9L+1ZxNKlzjMKx6OUedABQwLKKrn7M+n/VLnuSYqjGFyW2k+Bb9SJtz/SwDANhuWedTdqlBFGc8gZrvk94nJ7aALDbz2TvwEb/uV715IqWOQ2vwt/+ZbqJ1r3DvD2AvLNxUfi6l6vvrix5vnuBMTIERcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OW4vxASJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XR+yf5lC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OW4vxASJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XR+yf5lC"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C2xVuB011635;
	Sat, 12 Oct 2024 03:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=iuBYCYAnH84xs8N3cv
	Rz/sdqRWl8n/713qbJ8zV3Gbo=; b=OW4vxASJixw2VYMAgkOSqJlsNamZxRxWXh
	zBtCSwJcYZqT3/IibZToduyILv4Vt4gPig/RzxGy5uWo1V4IIloyUiQzu4TdALJg
	38Cl9xDKDmEDvWECTxEHdQboPkvtGCqaaohkCano+R9kS5581jiKfA0WPUYAIe+r
	nSfmWjlNtza33KQh4ecmnHQDqSQORcmf1toP7vn+cGE2BLTRq8Dmjm12RZgSlIjZ
	h37oRA3FahC6oKL7O8I9QvMxh8/aWjrTfanKrryjGqeZwv4zVGDQ5NPQGw8w7Q5b
	2HW5vcQoOh1YoGyyH/9EUd9Mu5HoGmOfjfuZwQRgWG0y8hhoZ7yA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42303yp2ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:29:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1Y2qY027261;
	Sat, 12 Oct 2024 03:29:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjasm9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:29:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/o9lLoK1rKGh+aD304Yj3dtPD3R3mMdnV4Fe/u+IJqrlcc1IlFy1Xq+qVseYqn5IVeNhy3rqO4EbGPfhFR3ycClw/msqdEcqBSHTDc4HMiRadVMbjqeAMPbUK1rtWAFXeJD4MWS7booFq3CJqMFdAyNaw9BKnla/RKyVdPKKy+rnp1Q7g9DvVUt71clGATHFvsnkSkj8dal4TazAjMr0oZtItGWDDiQP4Ga9teoe6UNrgba140K46T5WMNomOdjGBMRF7gCSTyuk8aKI4cPpxJ3L3ZStIwQPWLH5v95ATzRWBUVuM3EF0uYM0VV0bTQGxQR1kGocB0wdSUYL16Vdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuBYCYAnH84xs8N3cvRz/sdqRWl8n/713qbJ8zV3Gbo=;
 b=tfT+VLyizW52XFdjuVJv0YMeamKkdYkAoslRHn77yu+1CqvZsB+2ni+lg2HpcX8p1PbB9fW0i+YWpHtMQW4XJli8zglsNlBkvZClDHLe9d+tF2JY92soNHetgcW43WkPj87I073KI/vvpbRSXA75RB4AkiFjIX6RvddBSnqBBpJ39e3tbfxWPYoSz0Tzkh06/vsjHX4qXvKmKT14aT26GPSC01zV/HhmGIR05OZz9vDhOO8plnlLEwgzMsOx/TBUITYGx/+o8O3YmKwN3xbSk4rIz/fthbA9F98b8fHHu+Tvf2u0Pk3BmGMr1GBxbSObkV+QVV8QrzAOrYYvrF7sdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuBYCYAnH84xs8N3cvRz/sdqRWl8n/713qbJ8zV3Gbo=;
 b=XR+yf5lCitJ+BNjHwIlPbIEpiD5oLNbUpmeCH6eE75zRT/EUBIO5vcdOhDFJbe8+5gqxjXEFDIjtIWugPI5Rkm7M/9VGPjiFVnQVY6QHEzvVggYGUTL6Rup36gEssnWeybbKQ82t//qg1jeK15Hk0Y/LtMMzwNghuF2HWMsyc6w=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 03:29:06 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 03:29:05 +0000
Date: Fri, 11 Oct 2024 23:29:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 1/3] test: fix exit code in tst.ipv4remotetcp.sh
Message-ID: <Zwns/1IbsMPNKJsK@oracle.com>
References: <cover.1724112622.git.sam@gentoo.org>
 <4c6a974d2b5fa9a0ff8935428b5c3026109e5127.1724112622.git.sam@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c6a974d2b5fa9a0ff8935428b5c3026109e5127.1724112622.git.sam@gentoo.org>
X-ClientProxiedBy: BYAPR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::40) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aef1b19-8527-40a1-dcb5-08dcea6e0691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uAq0YqNzVlrDY3V7CnVJamZKrYMtAVsmXTaUo3hECRVgk464DaR4iVB1x9WC?=
 =?us-ascii?Q?h41YFDYufcFcM5EiqIvWiHfuT60/c5DuPeBXinlMQukbJ+f9ULI3hFeiP2Qr?=
 =?us-ascii?Q?T1di5enOGxq9U+tN6/6a/+KQGsRvH/cFCKe2qx+/aQ8At2ljdi38DNs7Hgl0?=
 =?us-ascii?Q?Tb7seHGcpLkG7YBf7W0mIYzvilAVtq7he2Rh9iCnig0m8ofQPmcjYFtcvJEj?=
 =?us-ascii?Q?gRO/wyUvaldRPzZ7hpgPjGHnmdJZMN/tUi6Uv7gsfceafRwFAy5tR0s7oVQ3?=
 =?us-ascii?Q?arYw7CggyKbi2re+q9OTw+/MRzZiVeHDbZV40c14KaZ8BRf9ACeypAeAt4D6?=
 =?us-ascii?Q?N6QU+usCWaVcaEVmoaMhNfY3eJlLAPuZw3tKCyHIYzU1tCGci1OtWkPodU+x?=
 =?us-ascii?Q?WS6oFkimvKbwanmLSB37vK2F8B9wTirN695D8H+sZCtwtgDbNPicpTgwEAPC?=
 =?us-ascii?Q?2nC2eVR6p6j4s02sbNTwFSl80cKLuKwMEQwGhRx8UkVeOhuCO55VF2qQ1ycE?=
 =?us-ascii?Q?vypJzM7qOyvYxvZt+W+DLlCKcat+1yScRTmPm5SDRrgJPOhlCMwh7s8aXaMi?=
 =?us-ascii?Q?+Y+MH8g1AuItjoThDTaFnQrYl5P4BeI8b3GvHoln2Ty/Ce/pFOZMHEeVkRe7?=
 =?us-ascii?Q?e382ARlOA4x2cCDFROu1FKC+gSaZta1cTJIsqRhRRTU+z22pAPIXRf0vApD0?=
 =?us-ascii?Q?2Unjob5ovijWfOgMndpKNc2teybSNDYnKURYEFibH54YurFX2VfaNu3ZbEWJ?=
 =?us-ascii?Q?Ho/9XUC2JgRqAPUgSEXPA2Gvyla9zZiHZTW3VNRH7LZkSkQ/j6ErJREb6kQS?=
 =?us-ascii?Q?A+Z6U22tIzAnszNkO3/jK4Szd2JNZ1W9zR526THlrRjK38SVRSxO76/uBnJN?=
 =?us-ascii?Q?YuGXa+VBKVnTu7ehB0z3VgxsM9giIEgh5oxAiB2w8PrTZD/gWcK0S/HbU5d2?=
 =?us-ascii?Q?EQ9wDj6aeR11ODfGWaRfvVw1bA952LziT7sAQZroIS6tuQXGyQPYrkDv16w/?=
 =?us-ascii?Q?eckWshYPXxFo7VPN2WwIpBBWW6SeACRYFqI1fprAMSg2flwJLFVsjju/ttqY?=
 =?us-ascii?Q?Hg8JGJkzrNLeGn9dX6UJFyu2YTW/qt4fsDU7IQwbufTc4AIqR9jZY0kkqP+f?=
 =?us-ascii?Q?VBtWUYAga43G7B/jR/vFTIrFvc2OsxUeSIRwK6Gw7NCjGkghrBxwZwjHGeoG?=
 =?us-ascii?Q?PIroZmVS9JXObEOiZTQL3ZFBCSSk2WA05iVoZ+grjy1iH3Vc2OB8uRa9ivk6?=
 =?us-ascii?Q?dZqkIcOSQngaCLO9qwmw8V8zvk99Ugs4rQBt4loZ5w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0gl6U/f3KI4t1DPL6UEHfKFXUtMQDhi8S8CZZvvozXCF89RXdgl1/jqoSsDO?=
 =?us-ascii?Q?rBODp7WWoisZmy0CylWGVxJvVZlXFJ9uUncjj8UCDpevRlsFb5e0yjwMTu1I?=
 =?us-ascii?Q?6RvhSEKMJm4ipVxwU26lTh0mdWUoQy+a5grEidVm13mB79eB/RrNKX5oisuS?=
 =?us-ascii?Q?8hcq993VEMuhAe74nzqhwOE+XrzqiwhZ7Gu+jAEN5e6i9nBtubB7M2sACg5+?=
 =?us-ascii?Q?URfNsUQTeFs0Q/2DUi3zkT2w5A9HfQ2sv/dYd0In81PfyGU0QqZvsCyofkSU?=
 =?us-ascii?Q?juk1y0zRqipbbmECKnEga5HGYUIV8o8ybzavQNj1uv8dRt0yiQLy7iUq7pQI?=
 =?us-ascii?Q?PlrYxeWha5eXeb0atfr54FtCouaEhFJKt7P4ftkyCN8KW7LGgfbgMZsHLPyB?=
 =?us-ascii?Q?TjLebxH9UN2xjR6SyVGLdx8+YFC+nbE0S3uje1RJCmoNkFj0HbLczDFGRlwg?=
 =?us-ascii?Q?dG9Gk1AFQuFQZ3rFUn0hoe9WzXRHhOQcC5+bkqpVQRReIIJH0eULSpEEBhKU?=
 =?us-ascii?Q?moYPdf78IfV0z7N95+wMdQKUgdJedPptM3HPgtm8mNvGZcaiBraFtCGgukyc?=
 =?us-ascii?Q?eTZtim4cdGn/8byAFEGYamg0Zihf6FL5J0xBg7BrifauUCjVP5TXLli4DOzz?=
 =?us-ascii?Q?R14Y0YhUJ5uVQwMimEMOjZCnNxgMT4NvVIJAWnHXzg7xlKsahxeVfJR2LOUv?=
 =?us-ascii?Q?Ae3+hbHkDjFDo3KA8IuZXqjpgDHRbaSsfYDf8A1MQj4GAV1n6C4ZzIx5/B5+?=
 =?us-ascii?Q?9osUrllCalH9maN/62RQJRvd3xybftx5J3Zdu4xqVwZrde8aXwS1KauVupwr?=
 =?us-ascii?Q?6pUQwdkBRWn8vhvLIDXmJyPz5wo1UKXLNutjdagHq44rRSsjCpOiCQbtY8JA?=
 =?us-ascii?Q?daSKhtlPDkaTMoI8JuAqEDRiiqyac3XgbxZmDEdF6IsEYkjZmRCfA81PcaMM?=
 =?us-ascii?Q?aP1eIRq551Nqrod1s7FQDrXsLAhIWYfJ36BgQiGK1w3h1cPZs0jALmwqMxCE?=
 =?us-ascii?Q?VNjUNSc4rmM/1UoOl0YfaUa7tMPvexcaZSJgh5yUJauC+3CCIvgQtLb++cr9?=
 =?us-ascii?Q?ZESJlGF2DJ3r9fpqolXdTSbuUEgTfQ7nRmhKjXlf4VC3mp2ttx14qJ6c8tns?=
 =?us-ascii?Q?9el/Uhf15/YoyGzVZlA+Yh4NRESWEBBS6CdKeAgj9VOUjaGc8s7UXWpnUvOB?=
 =?us-ascii?Q?NboMLX103CnC/jPmifraRGLS4CmTM5A+ixQu5+9bLFObnGlCCfojxeCmFipE?=
 =?us-ascii?Q?momQNcPEcsBFKvdsHE9DOZWCvQXcwhAfEZxWzmbbP+1EPkmF2sIgTKROdn2S?=
 =?us-ascii?Q?dYmL4icP/xX0HMACmkgFsEqaJMrsRt0g0VBx399xtx7MP6qX+6sJcrflCew9?=
 =?us-ascii?Q?dyAPUlAu0mtCCXLiLhkORRdc5BpnwAjJCWBHHMrnDUVPoIabYrmO+2FT86ZU?=
 =?us-ascii?Q?wM/wHNVudXn6JjxRAPfxGCixzoKwm+ZVe979JuVgm8lf/YjJjBhm72LN6cBg?=
 =?us-ascii?Q?jqZIaZOUFgg+tP25sHcF4bO+IeKJqI4gBBImTUZ2oveYVC/DYAKx3uKdcTU7?=
 =?us-ascii?Q?SjJtp4Y7k8xvwxoQM9GeRZaIsUl1nfkDMXQsiARBy91ZvHWgutq8vzh6wG1B?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ATYF7Sx3M1zqxpArfqdZ+zCyUFwtSKwKswW9Rli2vUO+XdTCbIKswqrdx6BOEVp+D+NXsTF3MRoo1twMxjCfPhKNLOGlYSzjvDg7883cOQL6x2IuZQhO8T90WKXyHZYyB98HzbOMjdEQxQLLzSJwW03Igy2yZSYic+ygo5AEp/SnA4PAY9ws0Zgyzlsj3PqPRguxJEHC+zq8Zlge0+ti+0zUyMSbvImNhX0jNvaLy1AQ/U/GHv58B/H9Dp3V3aaNW6BuNS0GYXK69F+9Olig4jUHEduCkt8gTVhHYCBLSIzxdsKja5iFHC/Ujs208friZ7CJIZIYQpXKzropL6GkQl6e8k9XqtTy8NYWYWjXNuG9ypxuZ7NK2kp048SAX8iTHwsOSllTlHNvggmKZ0suSzgFTPR00uKtVKfePKxIpYja7myGR/JKugKmG52cULJby31CwUvP8vp7dsMh/fkZWIcNy7hnSRFOYHJcIdxd/czMcrvaV3xWR16NutWKeSnQevzbCc5S3cS7KlInLWAzkkRY2rYUsH1GvJffjEoeVLjM0P6S4dNE2efQsYwJv/S1Xq1SeUREniMni8fQipmFV1ETqefgb+I7gMc/S6aqO9Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aef1b19-8527-40a1-dcb5-08dcea6e0691
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 03:29:05.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4k53CLyhlckUPBwbYPAyiD18qyjuqMHIeVsMabDL1FH1XhK0FJk7XxvUIuyTZdpK565ck9tsiwAIO8E/aJEkBRN+rxAVHo5x6jWluJ3jLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410120023
X-Proofpoint-ORIG-GUID: b9jJjwVnN4XwQ6PoYoIw16_Lj2DoWBWJ
X-Proofpoint-GUID: b9jJjwVnN4XwQ6PoYoIw16_Lj2DoWBWJ

On Tue, Aug 20, 2024 at 01:10:20AM +0100, Sam James wrote:
> $? was clobbered by the status=$? assignment above, see:
> ```
> $ bash -c 'false ; x=$? ; echo $? ; echo ${x}'
> 0
> 1
> ```
> 
> We could just drop the status assignment but I just chose to do this
> instead.

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... and committed with Signed-off-by added.

> ---
>  test/unittest/ip/tst.ipv4remotetcp.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/ip/tst.ipv4remotetcp.sh b/test/unittest/ip/tst.ipv4remotetcp.sh
> index 32c3435a..99ba1161 100755
> --- a/test/unittest/ip/tst.ipv4remotetcp.sh
> +++ b/test/unittest/ip/tst.ipv4remotetcp.sh
> @@ -98,4 +98,4 @@ EODTRACE
>  
>  status=$?
>  
> -exit $?
> +exit ${status}
> -- 
> 2.46.0
> 
