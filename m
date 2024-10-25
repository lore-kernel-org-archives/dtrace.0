Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4AF69D2B
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824876; cv=fail; b=ckijpEg83A2o32l99BBSDOo080JL9I0nltDrLwPTg0ABGJtAzGyI866FhQAM7zLL24MuiocKvxRCaJsAeBpjHuQ9c5NHntqB264HgGW3/XF4CXEBSPe77ms9QcUrdqE6GdKVu+wW9zfnb5lrThyPbJsIS4pe+LqJGScALllYVtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824876; c=relaxed/simple;
	bh=DWhtMlDyuYMHvkgVFhEmEzzqdccXlBtdSrsk4pJK48Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u7fxrpXFtErCj59gf2D0UXrNXh823bjUQ7/gQx2+iCi8NRRz2nYgioGtRicUVfn/fDNKfpDBJ6+We5f4LQ3+xyKLtUezqrbtdApj+mJQzDk1t7khrLAil2bcRGl2IGxbi0dNAK2SoNwHK+l/tRXvtizS4sa/EzrLfhaad/egokU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YZbUbcHE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FWra8v01; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YZbUbcHE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FWra8v01"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fd6O026670;
	Fri, 25 Oct 2024 02:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=YKYnZM385+ttdU4n1W
	lcb4wmIxuVe4QfT6ni3uBZoPk=; b=YZbUbcHEgGTWZ9N2xBp+ffPcyURRMGAcZ+
	/sSQkaRiyHMlONoOc7KeBG/PdI0ZlFVw3a9WCDTvkHP7DVBtbYcv0JWjhgH3u4eo
	nYLljlnqAfeVEUg7wWbXtX18rXwlr0FnG6HI+B3/81LhYT4gGphW50n8S4lYZmo7
	lUB9ZPMcHs3Se5ldX+vDsGCC79fJWlpxG39bfOIvmUpiFbVGk65VydVoL+gnndN6
	UeKNpPOLPp3cJY8Pqkx5Z5iS86QTXWH0ACpSijf/dg/ii+3wAc1o9nI3FM5uPiQM
	Oy+dzFTFcdsQ3WxpJcm3w/G+DPZ86YLuwE8cSLemsaLSZqc5gH3Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42cqv3k4se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:54:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P28o2v030938;
	Fri, 25 Oct 2024 02:54:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh3s3df-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:54:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhzTKEzr98vA3wq8UdbmFtxu4o3i34khbAlwdjNygSaL3QcoV0j9h91cgXisruB2CwUMQbgGR8YG/cPOvx+zwi4996Bj8ik1CHtZAcOrzYRJgeyRwTJCMq2Bzp8s1vn6aYcMmb05xkcfAlXpu64zuH2MpbLWi7WInhDffVZd2nbisnQE9GMSWzpFsYE00Ycrz/ePoysEOm54gHZfWvmspLJdndhNfqNFa3iNZm7CPBA3BOFGEWJgQfQu6UrTjclkirfOsMiJoGjZOqSSadPUOn2kAgVwAOu5pEdKrJi0pA+bpP4QKEJELcfg0wPHOTmm5EOrX5rTmFq3e3tsu5mARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKYnZM385+ttdU4n1Wlcb4wmIxuVe4QfT6ni3uBZoPk=;
 b=uJOJNdaHwKsObEcAKAvx74wRE1FCBgBXPuFavty1gckd/bCcXine+qgPvkfeZ/51rUDUjZnSMcAW+nxyji+BoPgwaGlW57FXEeXAz/uxg8X9RnlQmins5fmy5hl6GIaKqYvzJSJIzFjkQmkjBj1QGeC41mp3xtWy0pro0Qilw8qYPul+Fdqu77qnZjk/YhzYfP/Spu2ojXrHN9iNn+z+ocaZk7EsXhLJIshgWl7BiDumo4sqMpI8cmgqTxPHFn5SAQDomWWJmhwLqGGtRMFc/xdjo4nkOJMrwNkIb+pOcgVJabz+7Ypvbx/78knXmHizuAmCwNrHGTz2j/JxJOXjDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKYnZM385+ttdU4n1Wlcb4wmIxuVe4QfT6ni3uBZoPk=;
 b=FWra8v01FiClmPxG4fFK5fPie2SQtr0jK/W7yQPw11qq51slJydwoDKEVYuowoOYrZA72aojfyDQUwwNsJ0ExHuhI3Egy18ZM5Z/ii4kasOsgjJ9FGJW8vp6IK4gZkAOYkIY3Ven6wlvBoY9zX86/04U1s9EjzT1Ytu1I1VVPxA=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA0PR10MB7135.namprd10.prod.outlook.com (2603:10b6:208:401::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 02:54:28 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:54:28 +0000
Date: Thu, 24 Oct 2024 22:54:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 11/14] dtprobed: fix parser child timeout
Message-ID: <ZxsIYEPJQQIT47nx@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-12-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-12-nick.alcock@oracle.com>
X-ClientProxiedBy: BN0PR04CA0174.namprd04.prod.outlook.com
 (2603:10b6:408:eb::29) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA0PR10MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 382a6f79-e998-4df8-ee72-08dcf4a0577e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GeznxH2+H2O/hUP80U+uMTD0AEQNjDjITSlYgfkOLdYULbMFVnAzjtWE88Qu?=
 =?us-ascii?Q?EumtZcQ66Ghq1X/8v22ze2dYaoUn00nRhPylMoIETHzXZeV1oXGLvaRGGaD6?=
 =?us-ascii?Q?dwCk0pGo+M030sRNppuuNxX+QS6o+QTa1CL5gzv6l+qVUBavhWmDdWQ/mTzR?=
 =?us-ascii?Q?W7fHB5rH+giiwJePS1EXAL9ti1eXvxdpR4un6BoYkQLojQtvqWSJ7qY8jDL1?=
 =?us-ascii?Q?SvZk9lxW8d5lFk8M4F9D505MQOkJ5VQQMfeMQ4ziqvbXfrR5twqM9fqbXKDD?=
 =?us-ascii?Q?xXh6Pi3JExHAEhv48+jrJttykO1KMHMsrJjAxcy6WAvDhGm3A/mo9Q6iQF2t?=
 =?us-ascii?Q?Mvd3dDXCHb64oUlAYK8mx+gCrmAJPGVANPz+WYqP19QZobSivCxaLbyfVdMF?=
 =?us-ascii?Q?jYmG4a5d8WGgbtmJuzul9Q72IXwVhRGz7DmLH5SQNTOIg1hYNPepycQSXpZW?=
 =?us-ascii?Q?wFYvkwNRcxjZCfkpAX22Y0m/UVeMzNVNyZHbSCSgY7hdnt7V2cqbmjiN4DNS?=
 =?us-ascii?Q?eyg2hQBPRJjUmhIsQlu/auiwKk7TUKu3tnrkM3eJbjAZLRpqVinWHMINiunW?=
 =?us-ascii?Q?NANcIAkxnSxbYu5avXX+XWBW3MIfdSJRQIsp/8ab67Dwe4wRyumK8pEMJ8Jn?=
 =?us-ascii?Q?4PuVIJdJCSChKWkNuhDNRE/HUEdl7P0SUCB57IAlPHODP/Xc2ydxmj8f4G7J?=
 =?us-ascii?Q?0SJXVzJfh+dDtLWGzff45iPJfNz3lEaBD5VzTHgApoPGCAa5vnhFKSl9OQej?=
 =?us-ascii?Q?6LfDNEexQMcyrKi8/pkjTze6Y52dj9QJErqoMqcJIBalYvMGN6pGiYPnK9bI?=
 =?us-ascii?Q?XVMX2aBRPpVt1ElCbPSTOVgMkQnXzjcjm9OYNC3A8K4eld4QIVj3BIw1EqVY?=
 =?us-ascii?Q?sIkBWlP8fVIM/68/foGvXT86LwdYgRiKB6qU2uIHYwiPuVJr15ncGN6cFEk9?=
 =?us-ascii?Q?jxOc+lEFTgFtoIgCJ5DmIaNEBWTbP4v2EQi6bH/ZFWGnhN+HRolV1DOaVe6Z?=
 =?us-ascii?Q?EeyuBSldkt0+pLgfYaVsXbyPdoRDmXgYCxyrjTIT+LeYh8UurqoWcH8S9+Fs?=
 =?us-ascii?Q?Niu4TR308Tq47GD9GLHRtrOttISr0EiFeHExMwhnEOktADRsnO+cE3KKpZO4?=
 =?us-ascii?Q?xvBm7lwdmGTp/nHU3xK3l26yXTfaiBSxdLQVvo+9EOH+943ikWPJCbzp6nTc?=
 =?us-ascii?Q?KxWMpIXA1JqtNywpUURsP6bayF/xU4G0B2g9tC52R5kaPE3yWWrbzT/Vp6bu?=
 =?us-ascii?Q?8k1Aka0+ouYfbyXSuZy2kA5fSEY1lS9JVX7JRsbJqhE/dS3rCn8ulJ8zWnVq?=
 =?us-ascii?Q?+Eg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N8+9/KS0BhR+qhbW02JqtM4oZYPS6WNEBHpi9t1Nv9/J+QKSnbCNy+xIzfQr?=
 =?us-ascii?Q?YzrlmsdhjHljsov/tCxaEHL2GXRXmInLjiBAItgtSXPbf/l5KCKAN1L5/5bk?=
 =?us-ascii?Q?VA6CIFPO+SaM29571BLB5Rv3iaj7sOXwP6otDg1vQLCCEKtYN/IPKLOsjHVX?=
 =?us-ascii?Q?h5guhgjIEy/RGEZe0hkHFoP2QPTfxVmUsJA6OL5vMJuqcGwSJUHvtEUpwslG?=
 =?us-ascii?Q?g8UkDMQY1t3R6uHpXpFpL/7YeQVn8K+Z8e4KgULb5f8tzIt5AZ1cAXnvu1az?=
 =?us-ascii?Q?c7oZhuZCbAyCloH1UWekFh/RkFbg8VT1PKvlbU9oV7U6+Oq4A22VWkks6fDr?=
 =?us-ascii?Q?qyiZJST+TgKOfDzV7Ue55POjvq+/VFiuPZ+CedL1u/CX/uVu7AP2D3GoILkv?=
 =?us-ascii?Q?Hdve7zcqfoE32mgc38mjNHBW4+oeNVqLb0QFzTXBNhDcOMSX7HjoPX8iVHoL?=
 =?us-ascii?Q?yLg5MYDDvH4A9i9bknc6sxqInnho4LqXsB4HwY/Q/k8v7y9nY1/kHtJggniN?=
 =?us-ascii?Q?OZ3J7kA73s1RTP6jUlCN2Mp6ul13wok9hBnUIGY6Ig/MR/QM9fWBJNdkl3Pn?=
 =?us-ascii?Q?OuNGWFr0aS3sVpMEbHTx6Jf0EFdGx9ok0uv9TH0p8Coh2XQ2+O7Of6W1ALQJ?=
 =?us-ascii?Q?JcN25wbw5ruvET9PULG+k0OGV03YVGgQ7c1LJUiVbiELQHw2AZRqOU2FgmL2?=
 =?us-ascii?Q?PLAObtGi/XNh0+vr7XtZ8JnD2atL5L2atSYIK0I+2SFctMgniABZOoQUk1gk?=
 =?us-ascii?Q?I4cPlco95Kxy+gnYiLEYwBtZtOeGJDYHo3ZuipqJghB5ClCJu2K7wjD/bmIa?=
 =?us-ascii?Q?Er6sK2F8g3B0/PaEODAMjnwJlCcwB8Rwv28cTMl/7+cB+OcKFj4S2ZmsAer+?=
 =?us-ascii?Q?t4JVAHOk0Xh1wqsRj4FX9+eD0B/K3z+gLtGT+jM3eeZYVDai/kbH3D5Mvbdy?=
 =?us-ascii?Q?7yIk9t8/a36AicsJ4v8MthEa5+ZWf+NbC0R33xrR6p1Ao6xl1P8vSIkloSwn?=
 =?us-ascii?Q?J98P/m4f8PwoUoxOI0zeOE99z/SBnSuZ6HTV23dxtIsdLa9HL5GmiGwnk5m4?=
 =?us-ascii?Q?4LuiYAtCxbxwq3DfwAJiTV2El84AShlA9KewUHWKcojF8ACz/HMmU8gaaimE?=
 =?us-ascii?Q?B2cHFWhLVsE1jbOjgOaVzAJH+47IKksCq7vHgmhlORSfCuD2+3RiHghnX0P2?=
 =?us-ascii?Q?CzsMk+T/YMmuGXO92TcL6+kNUnyf0pkCVAoJH9FU0+z6g7m5iEEODutEWfwc?=
 =?us-ascii?Q?xFlTolNNZPcIIaTMHmTGoK1EitCxzbHfqtagO6fTj664Apks/oV4mZwjgHme?=
 =?us-ascii?Q?u1a/uYzvAC0+pw74PENP5xK5yEEQNaUHn/kEFWrIP2ZYMa2geYHDcJbrm36K?=
 =?us-ascii?Q?1I+fBu3H4IQmvRJHXTj+ppBEHP3wS89HmNrBog1esQvxCudR/o9v0OBgFp8B?=
 =?us-ascii?Q?l4XpUmnBtldk4DzC2fCovh5sjd3t44TNsXxZcNQXCtfTDdhdM0BJPT1jcK8c?=
 =?us-ascii?Q?aQ07yQwYkNOhwQD/FWiUUnya02w6XqAwe4f1LSadsaXjs5ouuEyBzcGcvZA3?=
 =?us-ascii?Q?+qpTVkZYdyWB8aeq+biRfoItyz+zBEpejVpxD28Dgfc58Xv9phlVpCOlQ6rS?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IKCAY0SjZqTJbNy91j/kCf1KhaSQmop/NgjXgdtrI1ITp7b2h2yQkRRxMOqsk+tjwnL7Men4iHZVo9s/HrLc0ebs7R8WSQaEtBfko3+Pm+py8bMdosvldyxElboTFKQ8lrv6bqfchgW2+SqDcDzqfPvvGx2xtPHKsDqovpdO1pc1nnEJvDBOnZm1QLepcIcA8jBAR2jIMOyLb8jkamdiJaDP+dKl/yz01WbYLs+MYZLyS6YT1bt38RxfFpbSONGoLLr8Kv1Mb8ff6CbeP0CveeG6/LfSdSh5l9+jBEYkLGrnTeZlRxu/1BvglnZbPh8lLhtHtPpa3pdJVAa97EEe6ig/Bl3UnxT53Uvz2onKAElRrK/MEAafUoM+xM4FmWZMYcFu52ZPuQBgkTeRW1HPZaVD0ugkHq0gVo9Jtm8Rr82uGn8lQ4jnbcOstqSB8Sa0eI+nH+9JTphN3Fri1+deABmk7IZDW6UtraVkeOJ/8+ccBgKizDEtiV0Oz1+PudD+TcQMFOv1PQi98KmaDi30O6c/EQH1oH23/M1wilOIlsLf6uiSn9itU+wBLpM5/umFkkL3EieL8hVC1BedB2HMfy0FMMIxqg2BdBXWttHqa4Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382a6f79-e998-4df8-ee72-08dcf4a0577e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:54:28.0444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaVciZvet0PLm4s+MlnjYozOzM8OqxbEevYg92OsuAEtmnGJIFJ1riozWGKOCQWpqpnOsm/hWury1rWuiAP+wWT2ADDynqXC9rhwaGxxhrc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7135
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250020
X-Proofpoint-ORIG-GUID: MTGV7xcUP-kdP4FEpFTvx248PYk2Y322
X-Proofpoint-GUID: MTGV7xcUP-kdP4FEpFTvx248PYk2Y322

On Thu, Oct 24, 2024 at 12:37:55PM +0100, Nick Alcock wrote:
> This was always meant to be five seconds, but when the option was
> rejigged to take seconds rather than milliseconds, the default was
> not changed, leading to a ridiculously huge multi-hour default
> timeout.  We definitely don't want the parser child hanging for
> nearly two hours: go back to seconds again.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtprobed/dtprobed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index c83f0adb56c4..f4c6be1e045d 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -82,7 +82,7 @@ static pid_t parser_pid;
>  static int parser_in_pipe;
>  static int parser_out_pipe;
>  static int sync_fd = -1;
> -static int timeout = 5000; 			/* In seconds.  */
> +static int timeout = 5; 			/* In seconds.  */
>  static int rq_count = 0;
>  static int cleanup_interval = 128;		/* In requests.  */
>  
> -- 
> 2.46.0.278.g36e3a12567
> 
