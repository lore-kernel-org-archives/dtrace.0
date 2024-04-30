Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504B812B73
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714506407; cv=fail; b=ZPAmWEwfgUoucP7w1Ne/ym1FcP3zoaU+2bN9kSmnTEvDKzHPyg6fxbL7oLpFy5EoeF0EG1e08/vjbMjvjkg9nOnSQKc4oS0Bdo+xmTsk+wYm8GM58u1plOC03E/bhkuCUZ7UKgZg3I7B/2w7uLf1Mlx4N2BXtaNloTl9SavMJZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714506407; c=relaxed/simple;
	bh=t3nFutsr4RxLYMdNiQ36I8BZaCqwYts14esBEmi3w6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PlaRnRq1ciEDL2DEjPBdkKHaHzeMAlUFZXoQOOXOXsCBusk5LHcsCZGRZXXAkWvaOFNne0fMLT6XBZjVVEJZFw7x+6oQWQGsRTcTawsugNjnHjGa6qPZ0/S3GDLDJpDSdOPC4tumMEAcBJcaEATTkxYUhhXnSbRgQgpLLBGq0XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Srp20NJ3; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iMpwQxwY reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Srp20NJ3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iMpwQxwY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43UHIMx6026796
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 19:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2023-11-20;
 bh=c0nIoP5Wd5fohTUC0OvLZnqRzwCpY8PWkF3DUDgUwaA=;
 b=Srp20NJ3R6souo7IQSh4Q+7AVJzXkygsA6oN1OR1V/LbBoxRRfHcybqZF34faN4+l8Gy
 rAh10UkUXtOSYv+xqFxNDxKhXf/LYR7eAZRM7HHS4wcCdHHXdCEj0naKb+IUHRq6iS25
 FP29H987Jm8x9AufUcRIbWw2whefMd8GftXIA5kEYS0OJj0c+6SCk5iap8JX/iFZGy1J
 u7ak7LxLoP06rJ+MqGkdeJx4Cykzw7uic6yv09PzKEGRtRjUpHSP5Z2w1Q2z0GkaEHDA
 R/y5NE3mFHPf2Vg0pIaUXfurwJ6YTMifVf+e0ykWziA9fyBWwVQ5KsJhGAl53azow3io uw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrr54e07v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 19:46:42 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43UIDObD034650
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 19:46:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xu4byqnfh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 19:46:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmiHptiJsmC5dkBZQ81JSWg4m/hXdgW7xoC0iq69W0OZGQHo3mqTfvhqGB8Y3co9KBsu8IIIZyoA/LqM+5QkkMZfHGS9xfK+t54T0/V1bfuuhdyFQoVNm4aadEz84mR0PPQlQbxj8e6nCkLEBKi7n5ZzcX66DhEChTbBag9JXx+/H7Yayrqd+rQoxyMyhBN0x5UQ5QrtgU1FXfF790aaUCFBPZ53K9/P5gnz2uTLdGiMogWz+J4PY2/p2Z7vAQZ7CAe/Jyo6BOJYwj3IrJDEd9Sxelt9xQLYQ++JeXYkHZp2V3+rBL/Yp9hH7nag762i5UvtOCGYrmdeCPaKOgKACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAq+lNuuQQiEkuEOD3H9Ken20lELcEUInnbUJVo84VM=;
 b=OW3t3ullA0dUCHdP4DT5jiizvFPm2q7A+8FKsW/2hX93CIu61TWx5ZF1Z0NUmdT0aMsRoB7tv8J2Y71BRwV4mMqM/I3QbKhGs2OSITOmSF7sS9NiSbXMJv+7qKJnvaDchxAw9JeGLUXZ+w2GNAPn0SYAxGeJDKYJt5abygBsHSd8UwFvstpvg6EHmHFU9o5TdIlSOIkNbRDhVKALCoLLkxtB3uyPKCtjhuUF6G1uUbsd1w8FGY0CNZBeh+QpVaQ1PIXce0oztyatQZtHZLq7SMe6lAsDfstvMtBa1mKBLyn2b+oYbOegcE+YZR/MLRRBZt3CfU6KJe84yFxaFi4eLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAq+lNuuQQiEkuEOD3H9Ken20lELcEUInnbUJVo84VM=;
 b=iMpwQxwYEF1jPIWp1wGui7fQZEuReV+MGgMdDWWDQfRfpHTe8OvTJ7Ig8vzfYCO5R3BYRotNX80bAhAbZciKript3FuWA2vbqN/pLom4/r1vssVe6E3nfluTtmmXeW540jR9TThJzBZILrnteJLektC7y3zgHNgDs/FztVk6+4Q=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB5732.namprd10.prod.outlook.com (2603:10b6:510:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Tue, 30 Apr
 2024 19:46:39 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 19:46:39 +0000
Date: Tue, 30 Apr 2024 15:46:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] bpf: work around BPF verifier issues with AND and 2-reg
 branch conditions
Message-ID: <ZjFKmTlHM8RHnYCh@oracle.com>
References: <SN7PR10MB6287EBF86002CF6FAD756D1AC21A2@SN7PR10MB6287.namprd10.prod.outlook.com>
 <42d1f8c0-16d5-491d-d0de-e2475f89cb11@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42d1f8c0-16d5-491d-d0de-e2475f89cb11@oracle.com>
X-ClientProxiedBy: LO6P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab5a0b7-5275-4815-77a8-08dc694e4042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?YNkpf8GYu3o5hQi8ZBmvVivMT/xpLB/2CKa1+p2N12kbRxp2ttxSxpDdJ7?=
 =?iso-8859-1?Q?tj09HeG8tADPf08C9PPawlc1jIO09T+0WmLNr/qpHr10p8UAl9X4YDsSUP?=
 =?iso-8859-1?Q?u42wcqspRNWGjkaQxxJxAqssPWnC4i+Qs/aUeD60P829/frE5MT2lijGCv?=
 =?iso-8859-1?Q?5P2bAgtTXXlLm+WAoF1LAyRXARHMbyQM2Ps9PsG5FkGiaExZ/HW5vQSRXf?=
 =?iso-8859-1?Q?3a2xkmZJUeqFsRGAblK/4qZR4klS7e3JXagHJvuPfL/YKYS8ZqKH9mM4cE?=
 =?iso-8859-1?Q?6IhZOWtyrgpoT3Xgcf3iGCDgUQRzAWQ805ZNGnkuaxvsioqf+lp7b6Lr4F?=
 =?iso-8859-1?Q?YaST2lLx6+p0sbvLX4L+wQ+ObhluLdFPSmJ6w5Sg6B0M9n4Gu9J1w/nEP7?=
 =?iso-8859-1?Q?KbbQCWK1q+O4287sad4+ljWzWlmNZpIHpIwRV5tDhzJ+lNgPxJLFNHl3py?=
 =?iso-8859-1?Q?oPwtJDpdTKam5OriRdE0/+T8DWtBnehK1aVm3D3mxfPcgvZe3ST6S9gHSA?=
 =?iso-8859-1?Q?A8dpMbF4VAx4FKxdHeW2kUyRJ5YVOJmLQT7hm43MFqqzlrbIlYHZsL0xF8?=
 =?iso-8859-1?Q?PNV5x0YXIQWASD5YAA+fgB1LcDh6gthTLroF1tN7AM8uxa3oUV7mcyjcDH?=
 =?iso-8859-1?Q?PKLm15rk7QlQmF/fblWi1ZJ9safhfZjE6dx/9eqrYPxvsqYk3A3l0K8NZT?=
 =?iso-8859-1?Q?vqIDLRZiha5twscSBCCdQyWgNi2P5ywy7LgtdM8O3vrhc5fpXjPXuWqHXd?=
 =?iso-8859-1?Q?i/wTNVZ1TfNxuMXqshzVVa3Nmf6699+c8qNAsaG/tCiGdlp4gavVSbMbk+?=
 =?iso-8859-1?Q?7ZyDEi89KKrBz1GAUVbSeiyrhhW88oZiV8DDc8OFcPhcmJtPLxsMdhqqZL?=
 =?iso-8859-1?Q?jO5nKRdh4wWGI8mMaXCcUUhZrc/G+J/VYL8Qw/lWhowXWXDF+0tj04E4pU?=
 =?iso-8859-1?Q?Y3aVPOGBin7CqFrRCDxB3xXsx1/QmIF2NdwW9MRAVrfrTBE5qWF5X9EvJB?=
 =?iso-8859-1?Q?r62uOkLYpxo7bpKX9Yfgo1vaXVtnvis9LfanAVa0UgkeneSHGe6kgrpp/s?=
 =?iso-8859-1?Q?nJzS/1eKKV50WRuWwjqP2/Bu110X/NkV/OaJl823xfXPNJpBHuN1ykLhe0?=
 =?iso-8859-1?Q?j1ZZbaztENeLMp7djCEH2fqv9ilYrphp4tYmRs6N+nTKqjQ3OesqBhDLeB?=
 =?iso-8859-1?Q?7C6zleUqKVEtKnrH57SeY6qAx13sqleuFjJG/NhL1ptVlT37HlAljmBSsL?=
 =?iso-8859-1?Q?Tzmonsxnd8fMAMeFT4PNDYtI+dqzmjchhhE2RTe9ugM8Zv/lFT8sActrmM?=
 =?iso-8859-1?Q?4mbKblyYchVUSbihpKHcFnukIA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?xX7ndomZKc4J1R3bc4luUklntX0RV7SzPPqG0mtPLzpVjpF349WzDMaDyp?=
 =?iso-8859-1?Q?vPGBUp7xKu8ERCAxngiWGGBTwDi8HhVGxP/4NSs1ePOmOD60UR3Z//RGK7?=
 =?iso-8859-1?Q?4fdCqpkDh2aP7+okOJmHP0nzocRI45qfIDPR3m+fyst7NyaSiwhUhGMWlC?=
 =?iso-8859-1?Q?K87qp1a/lHhenB9vZGMQh/riVF20LcCIGzapdSNskP3uLELXHabvvF3WCh?=
 =?iso-8859-1?Q?sLLEakWvbzoPaM0MpNis72Z813K8QKImJ2wXlFtQ0FUnSoPPY7U6zv+a7f?=
 =?iso-8859-1?Q?MAcEEoaFwTu4JkUSdWwD6thwB3sANHMf95Y+Oq7zJjT9QAxlEMpq8vndWk?=
 =?iso-8859-1?Q?aqpvxgpA3I3qPvW3Wrw9TtOTmYrrVAtX1GtFvrE6uUllPXol6WYSMl6j1c?=
 =?iso-8859-1?Q?pLfbHj3YaoriCchPiyeRrpCKgNG7qPV+6JzfUm0vIjySrt1bTONPYCyc72?=
 =?iso-8859-1?Q?M/fWSDRFiPhIi0wpLISlVp4wq2guYGAfdr5TZDFRrEhGgol3BRtmCcyiv3?=
 =?iso-8859-1?Q?BxXKFfRqkES8sveSRLtwqmiSdOJD15gXKpeE9OyHaSGtMi/jB2XM5WjE3g?=
 =?iso-8859-1?Q?n0RTnXWf2yeRm0xwMbgaUDp9HelPAtkeC9S/1KkoqlclzJKNVUC9H6q6Hc?=
 =?iso-8859-1?Q?6y3qhaJLk+JejwZgr7m3cjuHG4OrbmJsEYuDQRtZdbXfQBce2fC40iyocf?=
 =?iso-8859-1?Q?u7lCYeFBSmRJO1cyGGD731rG5bHeZqI6S9gBeW8Y5spyy5vj1ViZY3G2EN?=
 =?iso-8859-1?Q?G9HsPXbFhHSztlQlpn8kZAmPlNXTJQbvDMMU1K+EnrW7AP2nHzB4oSSe9F?=
 =?iso-8859-1?Q?3TU27TDDfMBIDCq3iIB+YHPtyjokn18UNO/IyHQxBXevuganvhvdYIL4Uu?=
 =?iso-8859-1?Q?fw/2bDzg0xh9P+U95jCkSzSf5zgZBvYI9xdLLeq2WQCg+X9qhSLmkUHmpe?=
 =?iso-8859-1?Q?dRLjv0sS9aD4jmT+7FP3/BBXdO8tJAHhNqpYerP1exfAOL9DwJrYpNEsJG?=
 =?iso-8859-1?Q?4aKjdxDjtb4pQAX+C3mMHrzxYASCMK1wMVslRf991R7YotvPyPeyWiyPOV?=
 =?iso-8859-1?Q?13PIYcHx0m11R2LlmdCTGWmmspBHyi6BcKhO06MbE7NNYE0MfTmy+f+cXh?=
 =?iso-8859-1?Q?F6gjMcE1G38aH5foTSJUhnIdamOjgte0xEdRbqvu/Xh6kyLZ2OogecdApL?=
 =?iso-8859-1?Q?YzLL08nDlsRATv59ES9fRwDMrBwA//TriwfrKp8zTh9oE/VFyHtRHO9aQG?=
 =?iso-8859-1?Q?ENlX4FvzzgndRRXiTJf8AFT2pPB6hjgiJNF6CUikORicGTPTIO9X0mVnf3?=
 =?iso-8859-1?Q?Yh56PltI8P7ILHVjpFE3OCUpLR+bumthpXBz8Mp6UFsPnZ94eH8kURDVa1?=
 =?iso-8859-1?Q?lsX2RDperp92ctN0zQMx+9d3VQy2RdN7+odTGmyT1j/JJZoPUOWxLsOmbF?=
 =?iso-8859-1?Q?iAogRZXb/50g5n4TWI2Dfkkeqpk5//MftE3eq9NxBcbMTd7CyKe6W+1oLr?=
 =?iso-8859-1?Q?9xJfZNHQEan30Dnkh7sDPCRFdWBKyNAIpzHbha6QEoZPJKqmQGBsf204S9?=
 =?iso-8859-1?Q?IRzO49lqq+jnozmxQABqNNxttXDVzdx/iB9WN1s8u8378S6jL0ONnMtzPc?=
 =?iso-8859-1?Q?FPvn2ydcYt+pJ6Cp54ngLx+pdYcFS5KBDDfiWomTjZd4F5mRKJcbrbWg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	iWfwe0/QqFNXP53yB+URCWw1ZmIy/YGJhl4M7HDoszbNyjOcCC1mQRcse1Tq35SAunuQ7JRzhuPqyZ+jZE1cgrHB1EKk4sy8js8xla41gnj3Wx4X1nF5mD3v68qhVkBsybU+kfX0dsPk5Og4a1PrpZyC82W9Z6dQpCKhzq0Vxg+nhLt1LndP6isdNMcytTktbYcRcEvjm3ON4J3LQwducapAZOxAAo7GiCq7C6h6TfE8QczHK2HQilCYF3CDJLFrvoBj9MXGEAeIpLkurLwcQaPlEvdbK35jHCxYQYz1w65UZRdPk66S04G5EZV21QBnUh7FdeSzX+5qRn1TpvXd09D79kYwV9gU+lfg6+dbPX/iGfN6/ppKyj49BDYTQjmcytFCIyc9YmYIT1umWqaEYVsZ0En3nBZ7CuSHsSkV0W2rLsaZh8SmdLbaCstQmbN1gcTgbzKwfHKPZRhotttA0v7X40xl8U79goi/LjjIJAnSjlomM2mIIfRy7FwSJ3a7uDqIrnNQ0HoaxLLb+RCw8eCdI3taPuGMgp2j05VquHQzqW1qDyeidkFgmOVhCJWzCc3hgVYgyploQneu469ybdM3Wni0m8QSKwHDM9L1SNA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab5a0b7-5275-4815-77a8-08dc694e4042
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 19:46:39.1111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53d8ecJIC5a1hHPGeTumhnhQxuA8Vbum+SM5LJ5WFsRrJp+198Yc+mJOvQYprsMJiK8+ywrsJ9m7xuG7t+oFwW7vGpBa6Ut0yioE4IBz0fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_12,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404300141
X-Proofpoint-ORIG-GUID: GWtDLowvbxpiHMloVBoaPyiXu-_YT-4F
X-Proofpoint-GUID: GWtDLowvbxpiHMloVBoaPyiXu-_YT-4F

On Tue, Apr 30, 2024 at 12:54:12PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> two nits...
> 
> On 4/30/24 10:27, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   bpf/strchr.S | 22 ++++++++++++----------
> >   1 file changed, 12 insertions(+), 10 deletions(-)
> > 
> > diff --git a/bpf/strchr.S b/bpf/strchr.S
> > index 8365d9ce..42c6430f 100644
> > --- a/bpf/strchr.S
> > +++ b/bpf/strchr.S
> > @@ -26,8 +26,10 @@
> >    *
> >    *     // xor the char with every byte;  a match results in NULL byte
> >    *     r4 = roundup(r6, 8);
> > - *     for (r3 = 0; r3 < r4; r3 += 8)
> > - *         ((uint64_t *)dst)[r3] ^= c;
> > + *     do {
> > + *         r4 -= 8;
> > + *         ((uint64_t *)dst)[r4] ^= c;
> > + *     } while (r4 > 8);
> 
> I think that is wrong, but in any case out of step with the actual code. 
> How about either s/8/7/ or (imho better but then needs change in
> corresponding code) s/>/>=/.

Sure, we can use >= 8.  I'll apply the patch with that change.

> >    *
> >    *     // put a safeguard in place, then look for that NULL byte
> >    *     dst[r6] = '\0';
> > @@ -72,24 +74,24 @@ dt_strchr :
> >   	call	BPF_FUNC_probe_read_str	/* r6 = bpf_probe_read_str(dst, STRSZ, src) */
> >   	mov	%r6, %r0
> > -	jsle	%r6, 0, .Lerror
> > +	jsle	%r6, 1, .Lerror
> >   	sub	%r6, 1			/* r6-- */
> >   	mov	%r4, %r6		/* r4 = roundup(r6, 8) */
> >   	add	%r4, 7
> > -	and	%r4, -8
> > +	rsh	%r4, 3
> > +	lsh	%r4, 3
> 
> How about a comment on the << >> 3 thing so that some future maintainer more
> easily understands why this looks so funny.

I think that the >>= followed by <<= is a common enough idiom to mask out the
lower 3 bits that it does not warrant an explicit commit, especially as part
of a roundup() implementation.

> >   	ldxdw	%r1, [%fp+-16]
> > -	mov	%r3, 0
> > -.Lloop:					/* for (r3 = 0; r3 < r4; r3 += 8) */
> > +.Lloop:					/* do { */
> > +	sub	%r4, 8			/*	r4 -= 8; */
> >   	ldxdw	%r5, [%fp+-24]
> > -	add	%r5, %r3
> > +	add	%r5, %r4
> >   	ldxdw	%r0, [%r5+0]
> > -	xor	%r0, %r1		/* 	((uint64_t *)dst)[r3] ^= c; */
> > +	xor	%r0, %r1		/* 	((uint64_t *)dst)[r4] ^= c; */
> >   	stxdw	[%r5+0], %r0
> > -	add	%r3, 8
> > -	jlt	%r3, %r4, .Lloop
> > +	jgt	%r4, 7, .Lloop		/* } while (r4 > 7); */
> >   	ldxdw	%r2, [%fp+-24]
> >   	add	%r2, %r6
