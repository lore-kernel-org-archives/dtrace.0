Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E4314534B
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721330929; cv=fail; b=Hqel+9B3TfTLOwmJU5iDuO207O97f9QWbLgksDTcgCVu2cIqtZtgQTQyC1eZWRHApkBwnF6MFNLVYN8ivf9RDqukehm6fz6hSC2MRXg/7RwmTwpwJxDap+vBR+jQMEjdOWaMfy/5aFs+FcmG+dtQW0zH6n4NdlPcDpaw2YfZ/6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721330929; c=relaxed/simple;
	bh=X7F1rY+fJ3Gn2nCPOvj4XJqdlWvgrkmHPfSKk58ejQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rt4gB7mYO0bwVKhU2TaIjPr3PB/U+/34uwfD1Psql0a4BFkOP2vRHfYmRvlom0F9aNRu4IoFAB3EcD96qS3WaedqO0IaI9QbcD2CFPdUvZxrE4fhsQ3lRccvqIXKGXZMvnODf4EvouRi9BegxapkF1pqaVYJtOWCkePVAslQgVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lTWqYOy8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XyUEXRNv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lTWqYOy8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XyUEXRNv"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IJMVWP018396
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=oWjwxo27oPAvWng
	NHcMQnS4wlBOFVd/yESro0de74zU=; b=lTWqYOy8NDH5cYCzO+tfGbCAeXC84me
	fbRue6oQaFKlfvaqIOPdGXpeA3rLI3D1d7JRAA/5Ss9hU6RWcYrfLiE2aVjrMqm1
	jkmH6ZRy3ZT+3zbC41SoRlKA30Fgdgcm0XXnifGUzoebk3G/eV9EV89Bn2iz7qdF
	Kg2RZLK6cgjWJJHfa5v02RyFyz7I/iNvPi4U5uSwAXmoHeOEKBgLC43m300ottvg
	c58cN0RfGbqmjbeZRVeyA1tSNjA74FjSpKTJjKxgF+C5/NTMdEp1Y0cZgPPyZm8e
	sg0mMQyXDhI8xn4/U2vRIenV6d9Jm2NjVxNDBBIiw945d2p7vdHv3pQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f8yhr10x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:28:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IJM34s019562
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:28:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0ug1b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 19:28:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgVBqzF9bWDNi4SXGl02S8NLHOaKuGxCZwogQDZlXNvxRIENUdZD83m2pcxYjwKK2uv1efkKNn83Qhe0ZvyTiJscD4R0ju0lSBxHM7hS/5W2OuUA0oL3Tw1cG9hVSC2zgi1WhJKYI4WHOaRscFabZFzvuqW01ypmjEkse4nVWOqnfCJhqDRYmw4/9KwZbTeSRmh32oKawwexqpSzsOpc04zloezOUyjUPqOdFHmFlOUQZQ0c9Wclwn7Ef+FCOFIRH6t4sSv9IMNtXAcsN2jftfyU3IwnCS6dXHcux4noD81x6QWZcPt79m+dw0JiqAEE8IjKfFZHC03JtUQj7gku6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWjwxo27oPAvWngNHcMQnS4wlBOFVd/yESro0de74zU=;
 b=JQyNrk0NgU53EuEXeIkD/FMbyUC0lPKMkRnKX1/EV5kGTnVkQJPvH+dHpfsLrCAMGgND7XWITcj4MBeUnnS5lJCv//ufb5ntOHV06iASlURpFFGU1rcT004YL4XlAsmVhok7TvV2SZMlvsij9GCuH0WMxhsE2TIqJ7I4sEXXUo5yKWoTSOw9wufNPAtqyosgBNgUyDD8+LxnGxL7lkCwwWZ17eNChNXUEUcfvNGQIkw1u/GDCW16xXUJJEZgF2PIBfeS3LbbXyM6OOSJzaoM7DrBj+C7q5iesk8rFcxIxVmm2980JmLXffGzl9Ja1cIDraP6G2Yyv2Z7esT1bgmcSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWjwxo27oPAvWngNHcMQnS4wlBOFVd/yESro0de74zU=;
 b=XyUEXRNvkC43aZ4ultNUWR5Yo/fuQt4X3wiq1QwkpoGJ5Ox+J1tr6uWLvInqwGdW3tfxrP2beS4hBBZ/XO9OiPnIgtvL2ptj23JSahE6I4MsTuq3afExnXTWefEsYJtZtvXGV2j6a9Kfcd7UXHNAGUYF+gOjeKagOyrJz8rgt5c=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA1PR10MB5822.namprd10.prod.outlook.com (2603:10b6:806:231::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 18 Jul
 2024 19:28:43 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 19:28:43 +0000
Date: Thu, 18 Jul 2024 15:28:39 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 10/38] Fix comments in dt_cg.c
Message-ID: <Zpls53GLbxJCnBTe@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-11-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-11-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:408:f4::12) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA1PR10MB5822:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2776b5-3e97-400f-19c8-08dca75fd5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fvYUqxWdquAPGisK0Cio7LNsL6xY+i50uMmw3Nqs+WCaK1bcbmHR+RZptcf+?=
 =?us-ascii?Q?ESXf8URGt0l9c3zhovKr02UqVHELqlvD+dMuE+CPFX1obHN80huXl6ektcti?=
 =?us-ascii?Q?E4uHmoFXva17DIxWH45HD+9YCT93TjBTBvFQSflgdquSzmDq7NMFCto3FeHY?=
 =?us-ascii?Q?QTU6kLYCHdqNmcQGFp5eNJSu0cCuXP2gF+ZXLmogaUDvKhbnTNS2sGYB9hOi?=
 =?us-ascii?Q?hJMFICjKWSRtNz40Yx10EI+ILBAxac8rciDWrrmHO51PExiymDxjSGfwpc2I?=
 =?us-ascii?Q?BvWvb0Q6dXqpTQevMxzabbw2StusMKX4M9MOxSkUlNYgz8VqKwTCSIXeGd8G?=
 =?us-ascii?Q?0ksR5PonHHpxqY0JLZpWpBtEtlC02/6ogpftDl6TVx5EsqF5r2nxpUaha2Gk?=
 =?us-ascii?Q?K21OOocCN76cWLMja5SUPIgnBaJQWS7xp2GAO4UHp/+rGymT23mJlNxidefJ?=
 =?us-ascii?Q?OHdn69DW2wtUXAJuox+4vklfI3sOI8sqvK87G+e1xJi/n+RygzYTZBmF6QIa?=
 =?us-ascii?Q?YrbolJakLCRrb49HcLfZFd631mDXjF2AkD5F4KRya9JO4DtnKVfpdZXKiO9X?=
 =?us-ascii?Q?Z3pnfRJ28+8NR0RiNKE8FfP02kC+yyNcYI/lpiikUC8lI1hbJxXhTvxwnZSS?=
 =?us-ascii?Q?ha7tQ/UTLOXDy7SGyHwZg1M1FMXS0sI2J3PgCnhpRlbtv1A7rvLYjwSfeTfO?=
 =?us-ascii?Q?46SrNwYpmGu6N0Y7E3evd29ORqe0vQBVSwhngkvET7Nh7ZTJ8p5CTZAn4zpJ?=
 =?us-ascii?Q?Qp5kmNufFTKe7bV6VVp576+cxduUkfx5JxhlpJ0WlHscgDagQVH9Uq6K4h3b?=
 =?us-ascii?Q?rQfOd7usOOWWQKAUj3xeSwpTNVV4YuQnWcEQ8pUt5gb+enxwgNtWWrXQ5Pcb?=
 =?us-ascii?Q?0L2se58V+Nu6LHfvpEBl9i3ZSyZA4KCblOX2vU0gPQ6Jx+DUt63a9ZxvSRHW?=
 =?us-ascii?Q?3c8zfYRm/ercO7dgG99lqNOSzTsSFVGUZPIdmhQrS+RwBcRtBsumUCI2yHbZ?=
 =?us-ascii?Q?Uo33EiEyVGMltkr/rRM5U+LfOR8+EQbz4VlhbZcuG31nM6GX/BhxtxIj776Q?=
 =?us-ascii?Q?BslTdlHuzmfiAV9orIve7aBRuqItmIGNE27PmNFsxAFCNc0Fr4akCY5BzD7V?=
 =?us-ascii?Q?zAu1cujhAwP1d8e5cbYyQhpRR87saQeHaIBv84K7KItDABUA6qGwuavCn28s?=
 =?us-ascii?Q?9MK430UYSaw+3CnZlKMnEJluVi/TGU0vFtNAiXr4DgV26KLp9yCqUFRVRHbR?=
 =?us-ascii?Q?P8kTSfL2Y3x0bqlEKIdLDldK6r0osRZFngy+EN65iukyY+99cPTCAznUbpLa?=
 =?us-ascii?Q?6df+Nx4UWp5WNKkixHiiE2XBS/emlkwJlJqJJ9ZWNvEk/w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fRBKwcUMR/085B61I+outnC3D+jskXKsePSHEKbU8afYt1/AN3hNMWLRZ4ge?=
 =?us-ascii?Q?GjH1FDFhCRBEb30/Jx/nPHNxeBRirHVezpoIA1kjcX8Sy/8lK71ATTQvGZ0M?=
 =?us-ascii?Q?T8wYy/P56lMKvdKJ/bGovEfSySzhgABR2FgNMmFuci/9KpBFt0zWJSuJF/W+?=
 =?us-ascii?Q?h/UhfjL3qUWLeQcXn7uVML2DPINhuDoIFXfkDws2+rz+eQKc7YDqJsi8ZXNG?=
 =?us-ascii?Q?O8MqhtIJNO3zzqJ5kFRkoXsz46mupUUpIBP+50ezQx/9kayKL32b6Gep7otj?=
 =?us-ascii?Q?mB7prKFAVVJlA8SZW/5p0wSDoz+nN8I796I3G5ImeBuuR8ATH0dfsX1rQ4n5?=
 =?us-ascii?Q?tkhos1v/qSXM5PhCy20aOdhLQR9zbbtQZza8x02WXLlFKZYIUfawainYy0ME?=
 =?us-ascii?Q?fl0UmCeJ/xXhk9okHlnCgxNgfRhXSGS08LCrUaTuMznZtPfBQyXvVpNcNvWZ?=
 =?us-ascii?Q?CBQG69YYIOHl152xuq+5E46TEn4Qkwv7RPgSGmG91tC1xGhwdl8D0XaTfkL0?=
 =?us-ascii?Q?+S/yY3IOiM07JzY/axXRjmIr2DaTxkgk9YXUS1p7hJpDakFMRUxrsxJTzOGV?=
 =?us-ascii?Q?26PVTFcTJHoPxawMjY3BH+J0bKwlNnzz0n9CTn31jmOQvn4iRkZs8Zpagh/U?=
 =?us-ascii?Q?veHjKFrafzfQKPceJJuJDvJRmOJMLA/wiuhXc97l3MqmAIAfT83+xGe6piai?=
 =?us-ascii?Q?r41/viFAgmRjPwDZz+HfRXKGFqu9sPsOWFKuWtZ0YYx5jnaQHOE2NkRyPHdQ?=
 =?us-ascii?Q?hw/B6U9kY+M3LcJtPR1mDLYc2Ly6gGnbEvV7v95tgiP9ZkeexA2gghTgfETz?=
 =?us-ascii?Q?lfOAQC6KuSDeeZW/FKRyres9vdzANqJWlgWFv9pF5Mx2VdT+Vmmab3USMjh9?=
 =?us-ascii?Q?acMkvxUv9pOISF9MvDPhpHVw9k1SiOgQ7HQxY5wFcMkezI55hCY7IwyLlogU?=
 =?us-ascii?Q?RD6o3Nq0nh3NQI+XOFHycbE7qbC4RNLxSsDLN39uGYwMiALfv/oQUOBjEzLc?=
 =?us-ascii?Q?9/9xtk0CZUj1DUiNne7VjrzuRpvS1fgsAc2b5FtFJG8mIB1yrNNIeSDJnafn?=
 =?us-ascii?Q?xQfbKzMZK5Zj6l8ZB3xM+4WHfGOSyR9LvWvdKQn3cUp03GTDHDDCrsqOYi3h?=
 =?us-ascii?Q?FT4mvHTJN+QQT7gOwJzD8hnUC2ScKC4ssrnneplAe5sL49Sr9iTNc/1fRbQJ?=
 =?us-ascii?Q?yhBA9YJL56IrwhC8dvXtjxijfHJdiGTUvUM1xGOusKv+KdwV1ZyBDuGUHABU?=
 =?us-ascii?Q?SpFmo0m2e+DICIvVfJeVII2rRgUTp8CR+hpBpD54W+/M66XhqDXcqIkXWPtf?=
 =?us-ascii?Q?4pTs6an/s16ee5SH8cZ30UePBflLIc9pvAUW++9yF5kOsZNOriG7u7bTbp3U?=
 =?us-ascii?Q?X7JMNc/VfgyPPsGDHXxuhrQkSc2yDGhWUmDnxzay96v8hOYYlwVu82e2B/8w?=
 =?us-ascii?Q?ws9wQYFh4DIKGH4yrPpfdHHsljb4mxktUEh8dOHRYet2tgPhDUq9ESzosAHX?=
 =?us-ascii?Q?2Whu2OCu+ddXOVDPYoOoCjD6+wA0ftPSLIPtEhNAtU1xb/mBtXhV5zNaLWXJ?=
 =?us-ascii?Q?YtY4gg35WrLIOWx+eTE+GIRWpRD0XjAAso1oVtOKrijPcWNrIcXZc+6YIIQz?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	H0YakshJ5Z4y3ie3//C4nlDiatz/GDEoJwIFe+rWzHYE/P80KF25VhVLEMeS8RzXHwvxyxMG5DOOP+soDRKWemsJvuCmGvCUxQZG4nTSf9FG48t61wSZy7E9IUtLBZJZPFeLjj88/t9MdM1YLDTRayHs2BKRZlazGNHW6o/GZMQxktOhqaQNwX5WYo7Q42qX4DKFqCNXqlhGVEVulCv6ek85mZDPQDximpGaZo/QvDF8UPVIqY/QZfXcKlSEgnt9L+cZvfiuLF4sjNXlyIncgV+Ribrwtg2KMDi7M+GhdHAyFZaU63hDNaavPRYlaRQ6jSOdgHbSxl4uwxnmKxtUEO9zrYm86li6pe5tv63/LSfz83A7yCcE/+x7SVmbQ5QzsLg3vQI/I8U7c48E0SLX8smM64FcvQyFZ1tn+XV0k3Vj/99L4oGHiCE0nosGSlXmuGsqfx/ATjhNTLYXjAfnUiFhWlGWXpMj9kPDRQMewGnf5PWHQrwxfn28x+KJFzuM38okb3CVLhc8YyA9edmnRu7645txtE26ErERlLt/hh4k4zvwU9nJlIg+QKeZVBDk3sUdzVDFoPAReLPSFvN62GGzXXFr0UCZBQWT1LG/V10=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2776b5-3e97-400f-19c8-08dca75fd5d9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 19:28:43.2586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gp/Ci/8RjONBM9gbaiHjbl3AYa236QGaKtHlq65YciQEeV6Ep6hwrgwpSXY+PWN3Sbqpboj13XfVQfM4yhFnOL6mKwaSyl2d+n4e3ti+vNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5822
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_13,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180129
X-Proofpoint-GUID: abwIAuf3v7f_Go3ttCUGj4lkusinpTCN
X-Proofpoint-ORIG-GUID: abwIAuf3v7f_Go3ttCUGj4lkusinpTCN

On Thu, Jun 27, 2024 at 01:34:27AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_cg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 0977406a..4fd2d359 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1150,9 +1150,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
>  
>  /*
>   * Generate the function epilogue:
> - *	4. Submit the buffer to the perf event output buffer for the current
> + *	1. Submit the buffer to the perf event output buffer for the current
>   *	   cpu, if this is a data recording action..
> - *	5. Return 0
> + *	2. Return 0

This numbering was meant to continue the numbering that is in the comment block
for dt_cg_prologue(), which now would make this be 6 and 7.  The thought behind
that numbering (which was correctly sequential until we added speculation stuff
to the prologue) is that 1 through 7 cover all the steps of code that is
generated for a function.

But if you think that is too comfusing, I am ok with going with 1 and 2 here.
It just changes what this was meant to convey.

>   * }
>   */
>  static void
> -- 
> 2.18.4
> 
