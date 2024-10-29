Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E6205ACD
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 19:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730231449; cv=fail; b=EWCxObhAxDC474lR/ONGJNP/uHda6QjJYrRDhK3wZqclaEqvQV9ia+F2uHk7G1r0bYYG2ylbP+zlf1/ToZ2Zw81kNmdIM65DPqyOLZnOdjX+OO3YoE9dqWDuu8CAVubeGeT6gTExexM+N4jG8ffPvWv1pYJl3z3FybnjmqNXpl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730231449; c=relaxed/simple;
	bh=IHxjhc8nnfrFxWxq/U78FuBDm6Tx5W9JtbXdJGuanjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DsXHNABzPMt0A79njnFX2VAYmNUjiYrxjN1U5noVEKqUoNVhMLP+BRa87fjsYXHY8FeIt0ZUeo/sGQdOnXJlLZEPhbxIh+cbfEr1NlGTSZm8nkoP4/wGnSn6H8ZTg5+oLpAQodaRMLxqvijpPr7Y/6qdwHs38UOOuNpSdHeYD8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k6EFR6/0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=T34GQKfI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k6EFR6/0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="T34GQKfI"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TGfVh0030902
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 19:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KjW61Rr2jjdCEH3s1t
	e3ekcimAmYze1CogcCN6isT2I=; b=k6EFR6/0rXu/GvZxy8szn65hpb6aTlUfb+
	mg4jFpM2zXnU0pPmcWe3kkv2jNnBtLvdMBqA3mzTOYEP2nw98efI2eTG57HBxDWK
	zroPnrKgF1slj3F6n8RhfXpap5QBtckiWQbXLzJY5XR+a2b6mxR5Nx0/syg7n+zi
	CP0gUZ7MCA+/02nxphTFDX2y8oXH17ApqpUzqfzFFJujH5whUUqq6Vbj7NUb1Nvm
	Lq9u9H/O9umZ+ezuL51WelZ/2rCavc5x7/WfJMYJMK9esGk4Bej7adj9UlJRCyMd
	Ia+Hbf93V4EDlLPk1D1y0FN/A2J0TNjr90riToIRkytDrZh+UCuQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp6f39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 19:50:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TIIgKb008380
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 19:50:44 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnea5nsh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Oct 2024 19:50:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8OQ8J76oOrzcY8DYzgYOIlS+PvY2uY2iSOIKpZdTHcWgjX5KENDS6g25ydajve1QzEQOJVz5ajkEBhyb0wvjxDvZ7LUIqo0Lwuyfb3EiaaKSBneeAov+c7oe421RL6svj9dPnDZgjJVG+mFOPbhpzjjI0ZHuiNexvEEcTimDK8u1BlKUZCAqKVoZHZVhxrFZ7GuUX4xwOnDwHfldgfAgGerw3ntNpF4BxOrj4d9jq5PcuTl6OB8xyYX1QkTIvTQQSAagBX4tlfF0Wn0kAP7pqB3yti+0+b2WUWMV67DepstiP2CPYWLvle97nFhVhmSfO+uLspMCv17pdROHAhAOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjW61Rr2jjdCEH3s1te3ekcimAmYze1CogcCN6isT2I=;
 b=tMpbn9qjCMpX8qQSzSGR3frALMX2upVk41M4paOTVlcePDqPZlyTSWogA+4I4ws6eFZkX64NpIdET7s21fbB0g8L3dKkA6gzJsgLXYCb78PHhv91gm0Kg665E0XkCiOpeiyOdf7NY7vzGETt8aAIzrBUSDdVmUccwtM9h+N256F1JYL+8eeGde88SC3gGJXytCIFlHZp4lI+oN45c1QPZ8kNVJdeDSMqTMFIlvMD9Tpe7q1S5Ep+lq6ayhdW4MxIgIxBlmabSDIgUY1zT7SqUaTHP3EdU1wjVWLTl1Q15KiRb9gvzO7YxtMgzMVYxsVmYUJ4N48kGFXVSI6Z2C+mKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjW61Rr2jjdCEH3s1te3ekcimAmYze1CogcCN6isT2I=;
 b=T34GQKfIIMcksXugcd4MlUUpNPYualGeB31Oek3QqbT8DtxiYNWou2nm6BI0r6P/mGu/cUQeABHpaPZXCVqfHV17fL/IjQ6uLYbu8Vet0OLn9N2yDPuX/uj1IjnJJn6L8EEYo14iargqM/1ebTFUowFDOPk1ZqUDH4+qgSkGNy4=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BL3PR10MB6018.namprd10.prod.outlook.com (2603:10b6:208:3b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 19:50:41 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 19:50:41 +0000
Date: Tue, 29 Oct 2024 15:50:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 05/14] probe: improve dt_probe_lookup2()
Message-ID: <ZyE8jj3mle7c9NKl@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
 <20241028211803.458685-6-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028211803.458685-6-nick.alcock@oracle.com>
X-ClientProxiedBy: MN0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:208:52f::35) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BL3PR10MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 62328150-0c1d-404e-7a8b-08dcf852f7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xrhtIB607H09dDA9GS42jS/GOWcQm3P3AAtwX/DGi63PJSEAZO7DYnK6ruov?=
 =?us-ascii?Q?d0Ohmfx9esa9YMkWNuJAKiR0HZoW1JXirBiKCc/woJDwgoHKV2tQn8Vc0YVw?=
 =?us-ascii?Q?kLM/2T57LS04tjUVBVGeeG0IIOmegGZdoRxJKR122p9f7PYfnkFWO+go+TJh?=
 =?us-ascii?Q?p8rZITJ3XFiX8KSU+DXtyd1lpYRMyqhngSLQJ1vokOXM1fx1NoNNv1zAL3My?=
 =?us-ascii?Q?TO8i7vh/fUvyHqnHT695VIXzGYqsepoKliGJk+8uHVqvdm4Ula05hQIeWYcm?=
 =?us-ascii?Q?slna69sCAovZBPcePdzR+8mkd/KkR4ZEwI1A9I2AeI0KADvLh+zkxjR5/yR9?=
 =?us-ascii?Q?RaCLTGXmINzreQhH6ncN4Bd8Ryw2fF8XGMnE8EDDIa5leRQVtZuGq5jU1NOH?=
 =?us-ascii?Q?2PsHpF1pATYTrZdLaKNdImTO+6Zxbt+0Ryq5E1HViR01jRgJmKMf7bbAQkqf?=
 =?us-ascii?Q?rtmYD1qFJ4TCrsAod3YMAVeX6gaoA0bMoW09z+sbb2TLZg1zHGFPDTP6khoR?=
 =?us-ascii?Q?VLzoYubtlQfu/wP4Ru8VjrhKJH7ln4K0MuHO0YTMmL7VkhP/a2hUiAeY/mIv?=
 =?us-ascii?Q?gKIzMTJqjusoNoAcjw/rBjmRATSY8xnluSQ/iIx1jEWhj0+oeVvqRlehR45z?=
 =?us-ascii?Q?t2LCOMF1dZQIgUczyR4Cp/NM2P2QyJq6qJWqi/zjpr8CjvaAkbJwoAG/pv3z?=
 =?us-ascii?Q?vZdF1G2DViNd59pdI5gRpu/GrdDL+r7TzUI1Btqc0xGuX9o0EU1yC7b/6Iuz?=
 =?us-ascii?Q?GJhlhtIbqTKiSXaYQIu9fENv1dMcKsoLPC0Ejc0vdCXYhDSKd1n4Bx4K7Zew?=
 =?us-ascii?Q?wYwPrqE3RfRLFaPNvOdeOfx82buXZCPUdrzz4NLAcN9iSEA6xL9P3ZWFxzXa?=
 =?us-ascii?Q?wHAl490sfaLdfZ4aLgRjUxL8RUID0yJ27g2xfia+Ti4FJFIsZ8jIYrb3mwDw?=
 =?us-ascii?Q?dXYk3uYXHHVocOHI3lZFD86EGGPn9aUvt8OuZWPMe5/hBaGCSUA6cl3d7ZG0?=
 =?us-ascii?Q?TobM+0+oQ+0EsYWUSNiY+8vaPdxOIPkJvCzKYv4xmeqBpX1pgefxqcsCC44C?=
 =?us-ascii?Q?vjVZlHdmsP0KeIxkzVim/da83JxMdza+FqOp4BSnxMnnV7AGxjnWm/soKAtB?=
 =?us-ascii?Q?nzOQxAyZRubZLfTKPAL+4yRm6H+ZOt3p/ZZOaHmLv0tFPImMEi2/1iqqtVGU?=
 =?us-ascii?Q?647Ot66WABn+Jz34KArldWsMXe0WjDn0t/+txDbJ+ABlShnQPXuyKhVTOCQX?=
 =?us-ascii?Q?6EAgPPXIEwPsiZWTjesKE4JCttgqXmDhBB/fYCaFHg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/YfWeEkOSUeb1KpvQRuAsG9rWuBz8Z5WxGDPdXsAJtMQ2bqKEejvZ/g25Nbb?=
 =?us-ascii?Q?kutJ8D7EoAYU/bCmEbEY07w4ecWW7myRDiqt834ztK6uo9wB6KYlj4BjaBX/?=
 =?us-ascii?Q?HYb1d+/Xu0kp9p447So8wQ2a6MmK+suMqLS7gi6xDHVxggolGHzMcP+VYRT5?=
 =?us-ascii?Q?deevb8fEup9aJojUWmfmRxoiCP8ecD5Y6/o3IWy0pzSRclIx0JBS/bWCwhPN?=
 =?us-ascii?Q?wmr+qWgVHTX7s9x1NNLgcIJYwp3aM/kRGka8Laea3D2hg66T2pc7/CAl6KMp?=
 =?us-ascii?Q?AN1A/NvPXx7MQWiFJlQ91kNQEciXsZ73P85mWThssz0y/Agi9IA3miRyCuPA?=
 =?us-ascii?Q?0ShH3b2sHEdp8LVsIX842KXhPnXhBB+vBhTeFWkps8ao9tRsrb8zAVT34qns?=
 =?us-ascii?Q?7XeQ1jiMufqWCN1TRqW2ULWj4g0RwWW3MYn54NdlSLlji9XX0XJhS9Wmu+8c?=
 =?us-ascii?Q?4Fat+7Bjdcnu+gUQzbW1G9SneTunwtL5bbsKVj9h5Uty7+9S93V6c5W1BpAD?=
 =?us-ascii?Q?ocJNlDRSNJPqIvgPWf3x+eT8EQOzM/OlsQ1jSVrheCcRwj+jcGV0cGniuJZq?=
 =?us-ascii?Q?foV9ZHQXq/CNWhjH63eFEnkD53LPdJuvawwP4KZu/edob+dWtbYQqXoIPHbR?=
 =?us-ascii?Q?0Pt4XyyAFfcy3iPMeCrgVsVjto/3Y0kW+3IstSqe0vcxDmK/me5ctH+VEbSF?=
 =?us-ascii?Q?PYGTR8RSP/pJXU4Dlcu72pRcuk/D2CoYGTUaopH5pLWXMUKPxf9CBCifEQxZ?=
 =?us-ascii?Q?Glh8ruKkv/OWjDN6HFFlsIQSTU0qMGY8YHZAuZzvnpar0Tcj9Xs2kdFZfKXr?=
 =?us-ascii?Q?7O3AvbZGaEBwUPRh2r0Bh6GBzdFAAHMUpmknj1UMtaaSyAn1MCI1pV5hrge/?=
 =?us-ascii?Q?Fp+x5KEjBGZs19AuOSQCrlZGfp7sArbPaKrvJs99wZMJmVyuB4SploqnkqSl?=
 =?us-ascii?Q?fbh9pLyIbVF++7NqsCoXzEi5Kcf7t6tfmAkaafcrK6s1iND2YmJupteYP9Ym?=
 =?us-ascii?Q?4eqBl0j5DLYVr9XTSVWvqd5nl4ip1JrtKcLvE1MVy+k3pusITQbulTpw5Sbd?=
 =?us-ascii?Q?bBgc7Q53aQ/iGBeeQ5aMozQpuPwOonC3r/+oU4B3/UZqM2AOYfTPKGcvkSVC?=
 =?us-ascii?Q?LC/AgnDs7G4UyM2zPI2EDkYU9vrXDro50gYhg1Aj0KBaNYMAmapOm4OTgX+J?=
 =?us-ascii?Q?fbhphZYMnGT2S2OteXepaBWfAikTGfl8gnsXbHSE7uO+Has7CCAV+D+3dovy?=
 =?us-ascii?Q?BDsvVaY6OIxbYJh15jwjuvPayxDFfcNuyvLPucfu4p0zeYnmh8kFUx1kq63M?=
 =?us-ascii?Q?hR5MtSZAjeLd3deNu0tltv3uTpo9nnnwPQTWMgT/LMaLNRja5xFzm7rjL1A0?=
 =?us-ascii?Q?qoJRfwsxjpJsXC71Mn5g3vLHjbK94nopehQHanf6XxgQfCoVqfzg4dkUDa+l?=
 =?us-ascii?Q?Vs0VRoO9O60EGjdSkFjQ62Zu9BrTLTgPjoRBZZmxqE6h6DXbhUR1OCVKJsfP?=
 =?us-ascii?Q?bxixVOEqVVYwEb1piBsQunxbkMVGzkYPbWeU7LM5Kn2FFgUGF7/nNXHLD7e8?=
 =?us-ascii?Q?say6R4xgK0ZNHrHoiZGDjzqfXIMXeH+st87ahE0bnO1xUBfjPBIMQc4jMybQ?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NrN3pzlpEwZC5a3kkMlvYBeo0bKFv6CObsAfLyj8CO0CAoMrlSZ4NjH8a17yH8b0vc91X9aNZ6+d1OBdLHIFDllBz6mgImRONidwsb63mZPnYFZrGtb1UcO+ei23aWQjQeGOuCQnTAQz7J6iJYUu+ZXPJL6IkoptCEJsQAlNv4qj7ORJXFb+325fWk+0B/9ZXKaAhGKxHz2vHPhedIWxMvXOeAAF/khbpvtJtvCE1d0A44pJTmj/ZOy/3gArkIcIQUfYFkHSz7cwBwep3M4eKl+J+10evDiRf6XxhsegGdVr8dh1VjZxAiUWl9Eu2K5qTL26BzjIyd7ivMA3yQQGBU66dTdDRRA4btG6KGpyR/MArx7DrLiK1oLQXyqplLNdIlz7XOMpbyQOEm6QZ2a1qFOagMjuVqk8hVoc+q0X2Zz0sZS6PrSdq2dhMz0BLUwB8HW8g3kgSiKKIk9sHH0KBYv8q44erP12af+TM9avKA9Kbv/Fk9SWSsDxivOh6vLNGu24K9Cxt9A8pg39Ao+IohpAXPcM00qotAZWh/BIv4r6iHRMrNKNHtOYOMElBZedakBYm1w9WcmiCzqXZ7W9bjeoBSo4YCN6sWQhuBCIcNE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62328150-0c1d-404e-7a8b-08dcf852f7d6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 19:50:41.0864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTd+yHH26EYqhpnEt5AeYLcnbHOkmjkDfbSDILcLGze3xfTct6iA4LN/naKLVE3lj5CPoAT7NY5WRz0qhBg/fFKwHO4XmomWbMcx9LiUCEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6018
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_14,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290149
X-Proofpoint-ORIG-GUID: WnBLBifv3eflPPD9O5gSjIoXxIBcaHug
X-Proofpoint-GUID: WnBLBifv3eflPPD9O5gSjIoXxIBcaHug

On Mon, Oct 28, 2024 at 09:17:54PM +0000, Nick Alcock via DTrace-devel wrote:
> This function had numerous problems:
> 
>  - it broke _FORTIFY_SOURCE due to using a function that snprintf()ed
>    with a size of INT_MAX, into a much smaller alloca()ed buffer
>  - it claimed to call down to the dtrace kernel module for a probe
>    description (long obsolete)
>  - it invariably leaked the probe description it constructed by calling
>    dtrace_xstr2desc()
>  - it did meaningless errno testing to determine whether to return
>    EDT_NOPROBE on error, which more or less led to EDT_NOPROBE never
>    being returned even though it should always be in this case (there
>    is no other cause for the ID hash lookup failing).
> 
> Fix the lot: while we're at it, implement a dt_desc_destroy() to
> undo the strdup()s done by dtrace_xstr2desc(), and use it additionally
> in dt_probe_destroy() instead of an identical sequence of dt_free()s.
> 
> Bug: https://github.com/oracle/dtrace-utils/issues/78
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  libdtrace/dt_impl.h  |  2 ++
>  libdtrace/dt_probe.c | 44 +++++++++++++-------------------------------
>  libdtrace/dt_subr.c  | 10 ++++++++++
>  3 files changed, 25 insertions(+), 31 deletions(-)
> 
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 340dc1960c5e..d11ad2839f8e 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -759,6 +759,8 @@ extern dtrace_difo_t *dt_difo_copy(dtrace_hdl_t *dtp, const dtrace_difo_t *odp);
>  extern int dt_consume_init(dtrace_hdl_t *);
>  extern void dt_consume_fini(dtrace_hdl_t *);
>  
> +extern void dt_desc_destroy(dtrace_hdl_t *dtp, dtrace_probedesc_t *);

I think it would be better to let dt_desc_destroy() take a third arg, to
indicate whether the desc itself should be free'd as well or whether it
should be left alone.

That avoids calling it and then following it up with a dt_free() on the desc.

> +
>  extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
>  extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
>  extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index 686e2a661253..f84581687caf 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -172,24 +172,9 @@ dt_probe_alloc_args(dt_probe_t *prp, int nargc, int xargc)
>  	}
>  }
>  
> -static size_t
> -dt_probe_keylen(const dtrace_probedesc_t *pdp)
> -{
> -	return strlen(pdp->mod) + 1 + strlen(pdp->fun) + 1 +
> -		strlen(pdp->prb) + 1;
> -}
> -
> -static char *
> -dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
> -{
> -	snprintf(s, INT_MAX, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb);
> -	return s;
> -}
> -
>  /*
>   * Lookup a probe declaration based on a known provider and full or partially
> - * specified module, function, and name.  If the probe is not known to us yet,
> - * ask dtrace(7D) to match the description and then cache any useful results.
> + * specified module, function, and name.
>   */
>  dt_probe_t *
>  dt_probe_lookup2(dt_provider_t *pvp, const char *s)
> @@ -197,28 +182,28 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
>  	dtrace_hdl_t *dtp = pvp->pv_hdl;
>  	dtrace_probedesc_t pd;
>  	dt_ident_t *idp;
> -	size_t keylen;
>  	char *key;
>  
>  	if (dtrace_str2desc(dtp, DTRACE_PROBESPEC_NAME, s, &pd) != 0)
>  		return NULL; /* dt_errno is set for us */
>  
> -	keylen = dt_probe_keylen(&pd);
> -	key = dt_probe_key(&pd, alloca(keylen));
> +	if (asprintf(&key, "%s:%s:%s", pd.mod, pd.fun, pd.prb) == -1) {
> +		dt_set_errno(dtp, errno);
> +		goto out;
> +	}
>  
>  	/*
>  	 * If the probe is already declared, then return the dt_probe_t from
> -	 * the existing identifier.  This could come from a static declaration
> -	 * or it could have been cached from an earlier call to this function.
> +	 * the existing identifier.
>  	 */
> -	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL)
> +	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL) {
> +		dt_desc_destroy(dtp, &pd);
>  		return idp->di_data;
> +	}
>  
> -	if (errno == ESRCH || errno == EBADF)
> -		dt_set_errno(dtp, EDT_NOPROBE);
> -	else
> -		dt_set_errno(dtp, errno);
> -
> +	dt_set_errno(dtp, EDT_NOPROBE);
> + out:
> +	dt_desc_destroy(dtp, &pd);
>  	return NULL;
>  }
>  
> @@ -387,10 +372,7 @@ dt_probe_destroy(dt_probe_t *prp)
>  	dt_free(dtp, prp->mapping);
>  	dt_free(dtp, prp->argv);
>  	if (prp->desc) {
> -		dt_free(dtp, (void *)prp->desc->prv);
> -		dt_free(dtp, (void *)prp->desc->mod);
> -		dt_free(dtp, (void *)prp->desc->fun);
> -		dt_free(dtp, (void *)prp->desc->prb);
> +		dt_desc_destroy(dtp, (dtrace_probedesc_t *)prp->desc);
>  		dt_free(dtp, (void *)prp->desc);
>  	}
>  	dt_free(dtp, prp);
> diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
> index d6aad7637fb9..72631b33a0ad 100644
> --- a/libdtrace/dt_subr.c
> +++ b/libdtrace/dt_subr.c
> @@ -175,6 +175,16 @@ dtrace_desc2str(const dtrace_probedesc_t *pdp, char *buf, size_t len)
>  	return buf;
>  }
>  
> +/* Only use on probedescs derived from dtrace_xstr2desc above. */

Why can't it used on other dtrace_probedesc_t that contain references to
memory that needs to be free'd?  I don't think that dtrace_xstr2desc() does
anything to make the desc it populates be special.

> +void
> +dt_desc_destroy(dtrace_hdl_t *dtp, dtrace_probedesc_t *pdp)
> +{
> +	dt_free(dtp, (void *) pdp->prv);
> +	dt_free(dtp, (void *) pdp->mod);
> +	dt_free(dtp, (void *) pdp->fun);
> +	dt_free(dtp, (void *) pdp->prb);
> +}
> +
>  char *
>  dtrace_attr2str(dtrace_attribute_t attr, char *buf, size_t len)
>  {
> -- 
> 2.46.0.278.g36e3a12567
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
