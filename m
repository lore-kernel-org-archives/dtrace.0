Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C041DF96B
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730140433; cv=fail; b=n6LhvoegmIHC6zQr1momID5JeICSoT7gnfi7/mg5+VIYvj183KGNdcgzjrBCZc5RYyEUxdXKfAkcHsjZvVntGHEq/gzu1UPqFad5y8RoiYBueuQnpYQjXap28QoWj0UNHOA4gmhrp5VRXVgXaPdyzyXSZMeTRvWqJ3p9skWX1bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730140433; c=relaxed/simple;
	bh=NNuJwp+/PEwpf7PyVDhQ7N0HjyE1Ohx1NZzXscw/rkg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=II8FN6UFqmPb3CNvLo/RSONCurbc/jNoKNgOASpuFmxtQNLWfr/rVAzVUZP40Lr91K1m2loGmRrqIoL6lciLyAfzNCZq0vkSSHSesFhuaD5XVQgYGV7zvMJWoFTBEPJ8OV9nu6FdGpjbJOQUafqlmnixdkmGOweuN4OQy/3mHhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V94WnDjA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dT6PzNXv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V94WnDjA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dT6PzNXv"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtdfs020881
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=h9Gel9lnwlOnSDVzax
	VDcBUzkdT2qUC81WmyO78xaX8=; b=V94WnDjAkY5JCYtbpnLRSIG6UP/jmPLSZw
	m/h5rakgfcyRXYJgPu/M+Tbp2jKmMaW7wKLWV+YvylXN2PLy+FnMCyPOjcyk7aIg
	NS1N6KD8whZAEtzBrVExlBy2pXv42y+DRLyZ+RcGqTVJQievS5M8Byl9eTF+vftF
	7iByQDRdZje2yy8ZjVTmVr7C3QFKxe3ETEv3vaUrIXieix4Th07fuA/IMhcmLVm+
	OmNG5QLdz0YYubsG8yOZt7rHrLSJVAfwVHQr9DqWkh10I/fDl4rCQE28c5BQbZ3V
	cixtfRxxTss7ad6nVEd1DXB3kfH9NQJ7EmXilo2DYGWPRVbxmxnw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys3n07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:33:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SHuAO9040411
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:33:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnamudbj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 18:33:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkgRBhtGi4rEQ4alE4Rx/kIJ/T1WkMF8FQkX98AwZYn2ptI2oHzI6JOp1FXe488OSxsAW1jFu8R84KYiwoNaGVFjmYBzIP2+kDitXR9zqoIXOo5IRD+SiU2IwVYoTAEsoCVQqIV1Jv0ntubJQ/HYWMwGKhPjVkRQw5HAcYkGlNDQjvU2Z37oa04WNYm7uXT9/3Wh3cQw3oEs2niiMgmGxr8Alg0WXkLfrB1dtDKwhdAkunfC/VMaXl0E3s6ExL7OPR+ocPaaWrY1SEuWcPIK+1USRSsfFPj6Aepnct6R44dLmJ+nv9wdSEztFXzmbWeT2TTtICi74d2fUp5hNUNrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9Gel9lnwlOnSDVzaxVDcBUzkdT2qUC81WmyO78xaX8=;
 b=xl3nKzRRV0sPpHELbqCjmXgtKYiYWLcMAP2FQCgZntAYyiWUsTHxi47dSmOeR98a9fk1W60RGQ6jE3RAUwK78s0Z1/tsYaprKqGvLMJMe17Ggwt82reTzPq6c8atWHq9Uus1aKPuAH5f3kvPc+Zo52akn9Nh81ExkuwEmd8TmrvUiG6WRlX1ba6Fw4BzsJeR7/QU3nnP4ncTsvB+RvR9m5149xypdUyXk95bqHRUbaulvAQH4viIKvYtdtTuenmE0oPej8MTWxpwznBGL/vtDoy0eId5BqFEM5qTbac/Y9GL7vrUVKv1Ojue7CFBuSlgwPSyVloYDDAWz2gyw2MdWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9Gel9lnwlOnSDVzaxVDcBUzkdT2qUC81WmyO78xaX8=;
 b=dT6PzNXvjtFyuRdqFzio7hqVB5xukLXJmrf5XbR40ta8PXAlSxzzthsj4xTe8vidz5AAFUunhPB/w8FsDO+oghNqj6j5zFrNtPv2EsAsJu+Q75JbYxI4IWAAWPOL2rEn3mDI3/Te8ITleBBWYubJvCnudM0jI8cr09DdiBARc1s=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6621.namprd10.prod.outlook.com (2603:10b6:510:223::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 18:33:46 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 18:33:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] test: Remove misformatted and incorrect @@xfail
Date: Mon, 28 Oct 2024 14:33:34 -0400
Message-Id: <20241028183334.22140-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241028183334.22140-1-eugene.loh@oracle.com>
References: <20241028183334.22140-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 19426902-eb25-4355-2e6a-08dcf77f0f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vI0RHWuuWUSI47du5udVH1x0S2YV2s7qFH/jnDRn/786vgG6VZ7ox8yvDe8k?=
 =?us-ascii?Q?EHuhVbMvl/ihINNQygYaxYz3WLq7jsAu5z8yORHqrsmc1pXg7q0I2S5Yv7zD?=
 =?us-ascii?Q?ktIxrr5MttpoqYRFaJf9kCmTDIayBFC8xia/G4JacXYM8SQqApcAMeKKAgU7?=
 =?us-ascii?Q?XCCqLx6Zv8VR7/RgDjFpIvKIM4dNoSShnC3LkAzC081MwMb0rm6omOiE3D0w?=
 =?us-ascii?Q?jPf+TWrQVlLEpdX8GOr8mugWzlU1XpPT0XTt8ByEfK++dTt7HzXS4oK/5jZY?=
 =?us-ascii?Q?RxTSqVClLVWrXVqBiWdFZfgexDkGJo6abZl/+EFxcomstFr8mt4RKoeoXiob?=
 =?us-ascii?Q?SbvWcSo9/O9Lskbge5rwRa6kt7LAYv97OswLTOcficskyLNnAjtYKCvjizoo?=
 =?us-ascii?Q?hVamYjKrUfgda5qrNUT2MBCLvGvaSGZ2LfFC48p8cEvNz3rYfiFznq2Ad13Z?=
 =?us-ascii?Q?Rwicrel55djxtArwDVW3K04BKq1c6JCZ0wPS68zI7PZSQA3FhzP7L4er1N8y?=
 =?us-ascii?Q?nfYJYarwudxjoeqwDwyWd2lfIXGWUiNwtBwgCAqpFFLATjGI/LGW8/Lur0Fu?=
 =?us-ascii?Q?TbS+z2DumALXlkkpfaeJdwdexH1TpUfYZycaLzAEU9NoiIFudliGy6km7MEP?=
 =?us-ascii?Q?q6/TzCF3f8f2a5OowNrwznKUVpxjTfSy2VHC41yFKxeC43Y4wt7ZjqVdpECd?=
 =?us-ascii?Q?GiqFjPAvvhGddLtKpv6HVUEQ0NCLcfTGvW1l+SMYUR3p5iOmhUGpngKAo/MC?=
 =?us-ascii?Q?2ih6KyYjaw/5grv4P8A9bwiAcgS6FrkVuZ61mH65oylndvfCr9bYs+ybFhJY?=
 =?us-ascii?Q?j8ro7IFGGTTq2fLG7Ugo2zvlJ4uSWtrDyrnvsryPnngucp7I9H94v/stvY5N?=
 =?us-ascii?Q?QVt0WY5ErdUEpjnbucbQNFiWNPxaNIKjKz/4L9LSpHg/gxxMqmU5XLI32+ds?=
 =?us-ascii?Q?DaEzkkJwHVhLZaXZ6oSQYKNGKEwUBwViH7K5uMcmio8X08ihUrTbfqUERc9T?=
 =?us-ascii?Q?cB6Uw1sogegd3RwzcfG/fNqAQJbdTTGjafiLtaHE1TBGgLFD8XtKuJPTKIv2?=
 =?us-ascii?Q?MuPYDiiMGJ9Do3wbl3MyKJKLqyfrjC6mSWmLp0tef8GxHZuJmDL8BO42YHRp?=
 =?us-ascii?Q?gNqpg+6yERgCedJUT8sNwU6iqlDrkda3NCFY+M1muaNya6DRnldDJrEON+j8?=
 =?us-ascii?Q?AaC8knZT4awOdBFrPPvLMHOaoZWa6xfokI3w9g3b6JcHVHQ384rg5GEkEnGL?=
 =?us-ascii?Q?wH3/XZesBhsSK0hoQyuYo90FJDWK4a7dq1NhKu0WMq33THBdMyqwrmGw5gCl?=
 =?us-ascii?Q?iwFbJheIS3/1Cs5J67v8HV2b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c1SzQw+ozjdejj4ZVe+02bYGaMNUthXdCUw9c3dFp1ep7QlK5Zff1tkkQucO?=
 =?us-ascii?Q?D2EkYuvQhJ8y9Lly33pUtOKuEx5JwhchHlpYcDjn9mvtsUulaHgXdbEfUX7z?=
 =?us-ascii?Q?9G/XNkPd1rRPBpaj/OwDzzHcoWDBrgKPGhz/JNFW0dtaiBX0bLm6+rDogTmW?=
 =?us-ascii?Q?cxNJTNtUc/BhfuQYZoQe/GqIm2uHabMIK1gubf24aOr0WxG+8iVhwLZrSWZU?=
 =?us-ascii?Q?ELxiR2kVhauLMg6EJIm9I8xvv1mF/vqkogve6fq8LeW7Frs1dkeO9nS8oWsS?=
 =?us-ascii?Q?d/OsT7GjUtpbGXyBXXyJjebWGZdZwWfOhrw21h5lnyGZ8r4IYjTnVwb16RzY?=
 =?us-ascii?Q?wMOXj4qNl3xmHxijL/VAa7acCGu/teEUeqgba7Oc6z92oGImMped251KyngC?=
 =?us-ascii?Q?vo2b1cxuWWCWgpWWFBHnCZ0QCMPt4+i6vOq4CDiBPCcfYQe50DWozyIxzJYN?=
 =?us-ascii?Q?oSBSYlPLQeef716sp3A/TnY/+T4Ea6X9AYyJCrZWAjOhU1KP8wbjWej0sfEG?=
 =?us-ascii?Q?/pMFOlPYiY++fXaU2R283QzhzjJlRIKaLF+MWr5LMCOsGM8ROKwXEh6lfxrN?=
 =?us-ascii?Q?uvqlzjGbgWolLFgORv72R1KtUfZYtxklHoeKEU8YKVJ0QRpe1Jmoatjkkx0r?=
 =?us-ascii?Q?oAgDeU+povLntmTaeVUz7eViJL4IgIwXdeM+Y9n1slrCokvMgfJB+1h5jfOO?=
 =?us-ascii?Q?Klz5ECeehQNAaN1hcIAD9dVZhNhwz2KzhCyqBUWroZ+g6lhhO0xNM4lwbrPh?=
 =?us-ascii?Q?UVn7zmfHhBFd8OCF4pYBQr6ch7dLCTSAW5R1+KrP/E5CkLltNWazY4P+tSfg?=
 =?us-ascii?Q?VBVECYYTE7XNxGg9RnhcpguO/vG7+0NAPAa+XmWW1ssU1XLVPmBeZhTeVrAV?=
 =?us-ascii?Q?knqJATJbtNI+yATpNMHAip/H0eqAWvPZh8bLALuepDRBGHC8pbacl1nGador?=
 =?us-ascii?Q?Tv08ACd47N5slbPulvisrV2mfTCrFxa7BK0YGqMYrzYv+e54xnTZW3RzbR5f?=
 =?us-ascii?Q?tpdo/k+lWVXI95Y+QIzv7qc6YfzPMj/GZPSGARh9c17MJ02i/wix0R22KVPG?=
 =?us-ascii?Q?DS2fEQiW1CHy+JeWmhU0PGnRcjYiFpXK0c5WHWVdosMNXFU6AYA0tWLKaPO1?=
 =?us-ascii?Q?Aivc8PsExDiCGxA9unQeENuAvEkbqLdFhjcmJz9fKsDLFUjPLWke/koRUKYy?=
 =?us-ascii?Q?ViqSVUdMUKLPkKbPR1nUN4ovQGYoOH3EdWakN11M636qgt8OBDI9VgWBddPc?=
 =?us-ascii?Q?ZUm1zZ4guuvYQpAOugWVHlSavz7VZ7J+g8VTG6uGObH3iI1FMwfYSX6oL2Vl?=
 =?us-ascii?Q?PGjmtSC7nEvY9zUaW6wucPlEJmY+E/ON9j/EcAeUSnaTGURQiCfSH46uWau4?=
 =?us-ascii?Q?EhwPJaZ7WwqpJqqmY94QgsHCPYX1nR2wnFuqx/CaLxAXdAq2Th7WEBSWFRUC?=
 =?us-ascii?Q?B3zjypN7Lkz9tWls86zjNpiRh72J64QF80mchD1yev+LB3VK2hVvLMDxJA0P?=
 =?us-ascii?Q?aX4J+wdwlD98JxOHb7e35i/1KXWaAeT3VN984lVQxwFQnwTIFxisDv3PSnnN?=
 =?us-ascii?Q?QEttN5qNMfD5OdKvpDgqCOrEp5boehL3puTktAKZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ugfWYx91AwQbRO7jF4XW42LmWrRhNh6p3uIjLxQwzwWDaed5S1Ly8LdLBCm3B1dvqsJLlbqgZ8ycfBfHI/TfNuhb62DnPRSBoyxIzXVnyPpjxgXk/p3kMr6PWLhOIDbn08AkTdcWLh/dXDAyd1kR6aOz+php/g3esBKRyjIJHekUhBzAa6hImNeV96mp1HvXfVvZh1jve0A64ca7mnedqBJ1VNw8l3ksK2lkmQb/kBScIJSBVk0R/w5+MYQXmuggf5ngVTitZQl79eENACTzIZYq88koEUgiYqD4UN1nrQJAFCFhl94i9JS7m+IqaRiihw4gq0GLeC0HxzKm97e7qSWvMpjtcoPvE3kGiXx8geVW8M+AR3IePeWHQln9VSZstAbhAIiY5GfoVuZjsAhmCFBchGQVAmU9ez2kbf+IVs8Ul6zZ+93tItK9xlkFwoLBv2kTAC+L83jUcV4PSZDtqKvX7fQGyOz1wXMEdr4TddbaZ8+0BLZXTcUFBlmvKUpyYbq2w01DbrILewXHG1gjH2oKp8FHaDy0ABm6F7WIri5S7x2VOcOVBOot4boy07OY1t/gbu6JeuhAR1qh3+jWWAbg9hUBAixuEkAZIUfTYtQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19426902-eb25-4355-2e6a-08dcf77f0f12
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 18:33:46.8701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzKOyyh1/caubNAHozpGpAX6cR/5yJiL3izyi8qskzNaJGLDAMxQtEWrfUpb50CEcnu88xjp7vPPo5+S6kl3Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6621
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_08,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280145
X-Proofpoint-ORIG-GUID: 5ro430-BtvrSdeNUmGiDMkvlHptWzaPg
X-Proofpoint-GUID: 5ro430-BtvrSdeNUmGiDMkvlHptWzaPg

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/begin/tst.begin-starvation.sh | 2 --
 1 file changed, 2 deletions(-)

diff --git a/test/unittest/begin/tst.begin-starvation.sh b/test/unittest/begin/tst.begin-starvation.sh
index f8e473bcd..b3aa59477 100755
--- a/test/unittest/begin/tst.begin-starvation.sh
+++ b/test/unittest/begin/tst.begin-starvation.sh
@@ -5,8 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@ xfail: BEGIN not yet forced to be processed first
-#
 
 #
 # This script tests that BEGIN in conjunction with a high-volume probe
-- 
2.43.5

