Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AA413A865
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730401005; cv=fail; b=QfmwCjdI42cCsgKXCN/ypWxs98C0lUBkEN/jdIZ+HaMYJXFtRbYX4aIl739K2A4ZE4LXqWDQSDEGa6wUjwDincTmee1wv+bi87/HoP6YuhNGlm9am7B6lKysjyFVitNla3Jy2lJPTlguO/FrW/U1sQ9T/8zPPNV8YRfhFR8Vwrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730401005; c=relaxed/simple;
	bh=+D7nxT0T5scnOYRo0Uyfys8lgK2FZQUMnyqFFLvDHSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ltkcSAVyTEExZmHyGOM/x4AgakX8Tzvnw/Z2R1KePNzpQM6+zoLEu8ljnffJhv4dBpln4NP95kdMkngudj/r0aJ0r9lzGBYkoRkPwsEhH4fzxA3AzWtJLWsBNqW/ujNnFvbggZbsElDPf6y3OPwPw7dsbjgfPhoHM2/23JOTt6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a1GYnw2H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vo0k08cO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a1GYnw2H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vo0k08cO"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VHtdkm019729
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 18:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mUwhOA6f+9xKuXac2J
	VP4jM/wKj3sjCg9aVA1e9Fooo=; b=a1GYnw2HB8QmeZWGJW3ijwwseImeoVF1YV
	gpYsBlyctEXoM/CUpI3WfhjKaVWczGRYg1jeC8KKlQJZ7BXfK8b7PEOv4edMlf0P
	QbTBQitKHVDBTo05cRmpMdh7Ba2fTuVfBdWI/A0PmMlh0WvTmirXPIf9ECgbroRb
	gK8sfdJk12uORuOrChnhjpaZnZMhVNfoMe7pruVVJ+7Wl5la7Hf5uzSSGU8j+5Uw
	tNN8EW29mm0xVqZr82iJJ/syH101Z5cyCgGA0xkO+OJ2KbWl97Emr+83P0ANdysb
	h/muqiMS9U3glzB2IZwK0MCD1MscAQ1TDt2cVGTtqtyczqrU5AtQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqjwg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 18:56:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49VHsod8008740
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 18:56:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnecqgv1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 18:56:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMZ8NB9n8jryLPtLB9YcQwoXYNhw+SzllQUaVTuLVynC9rUqvkMC9KdCnO4px2C7hoxWQf0A2He9GL7BBbYaWbXEnRbUMNTkO8K1IIeba9HL3YG7i1JsZ5s3kN90M3R4jOsGkCp68X9HQQY9XlEGRrc6orqGQEgApOHu4TCXuzMUpwSjVe0pysvZJ/ylPQemG7khQSLh1cz9dlam5nen7xGLdQA07NDUsZ0d3yevs0OOkW7gcFkKOvGcrk5leovTlPoaIWmURWpdeWrZQ/uBSFwQG9+PERyu9jhktQzRYXmqxz2E9qnlGXxg03C15691t8hf0dltjgb6ByxYxHmCFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUwhOA6f+9xKuXac2JVP4jM/wKj3sjCg9aVA1e9Fooo=;
 b=DUbIECk2OeC+qg0mJ0jJfmHQNTyaCfvF5gZdjPbMK4SjzoRgqe/MR0mVhZO/SKONkNsr/EEb5b1gGTV5lELUHoIjLEj4qQ2JznYy+fhKnWLQZLD+cKBUvbB6wfKgN0OycaInu/zlaNqPeLDjEGPibd7LGX4bFCYkuPC+HRKNRPxp5T9D6/7fmiYrosDYcKC5usb1QiGeRN8OmvDTIu3Q/tgF09RSGPnt4TIMdqlXb9BRL6fovboOOiJKJIuV9vqeP4a4i2Gd/0yRtKnCQQ4dTFIi78cBVOqO65WWd4M2hCFXjjnHSsef9lqcefzN4tqQHmpGHxGeIrWay0FHT41XGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUwhOA6f+9xKuXac2JVP4jM/wKj3sjCg9aVA1e9Fooo=;
 b=vo0k08cOQcRmfweqxNc+f6qhhoRWj2M7obIvdDbDSR9oD2lU33RQo6F/aW6DI7gZTt6035McvBk7rg6NkF6o5MvON3pdaM6PpuEDDgnCvYSEkRZzLgwQy4FsrZOKpkXad8xuoXtxzJrzTehNMRPJP8wHBOaRzcxwKmT1Us7BCQo=
Received: from SA2PR10MB4780.namprd10.prod.outlook.com (2603:10b6:806:118::5)
 by SA2PR10MB4730.namprd10.prod.outlook.com (2603:10b6:806:117::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 18:56:36 +0000
Received: from SA2PR10MB4780.namprd10.prod.outlook.com
 ([fe80::b66:5132:4bd6:3acb]) by SA2PR10MB4780.namprd10.prod.outlook.com
 ([fe80::b66:5132:4bd6:3acb%7]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 18:56:36 +0000
Date: Thu, 31 Oct 2024 14:56:31 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 0/6] usdt typed args, translators and arg remapping
Message-ID: <ZyPS35JNqCM9msZ6@oracle.com>
References: <20241030120850.256884-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030120850.256884-1-nick.alcock@oracle.com>
X-ClientProxiedBy: LO4P123CA0537.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::17) To SA2PR10MB4780.namprd10.prod.outlook.com
 (2603:10b6:806:118::5)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4780:EE_|SA2PR10MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: f71c9870-c159-4c79-da7e-08dcf9ddbe89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GPdob0mBJMOfU0B7WHHINUowQaPJMTznaPbZM/6DR/hlH/ro2xovh4OHK+wS?=
 =?us-ascii?Q?W9gEHdgY2CpWlT9mguFEcLivyVRm86pVr880/gfefr42pSMCZmVGexzl0NWV?=
 =?us-ascii?Q?NUgcAqsXHsmpH7XOmVOeadWH6tHFJqOoGCIuLQEJOcsgLchgBNqYXvge208N?=
 =?us-ascii?Q?bADWCx7v1a7mVlPbzPOCOfQigqy3p+ERvfEvdZpcbw/5VgVtc8Lejsr4s8nb?=
 =?us-ascii?Q?7DoA3NOrxNPjd6VAE59Sb8S1s92LJCwEjQ2hjvvNBEpK1kf2uWRFJngZS4Dz?=
 =?us-ascii?Q?9pJdOo90sx4k3aKMCz9sr0UW8VDs3uxWdLp7zT+uLZXp6ynND/XMDCGpf5TY?=
 =?us-ascii?Q?KswtmuJKJaApPUKlXzyU6bh0kJblb0knxZslYh6deVX0sLPGFZipAtalFaFJ?=
 =?us-ascii?Q?lp39H601Hb+FRURTvtFXgqYPKPALPRTzHeKOkMznAfY8tk/mlo7LLEo9mgBa?=
 =?us-ascii?Q?g+GyBIaIeXkpljscmmTfsCZFiXVa2fC0fApwkfkobopZVvnYLb3aS0AWk0mQ?=
 =?us-ascii?Q?MBSpP205TxelNoxj/0QBhzosdOYNAUXM8XZO7OAe+ia/8benOwyGXNWCOAnd?=
 =?us-ascii?Q?hTwEdMPRa/rt3jogD8sZO5Xktp66+4XDiM1SflwKWlaqEizgdtuwiCeG0KBX?=
 =?us-ascii?Q?IyqeeNwuASv/5z/Hn1ldQl1WmtbFJlcfMCsWULfIbGNFH8JUKk1B1PLPL2R+?=
 =?us-ascii?Q?8dVW5k6XhuTYneF/vFKTGw9WCFbpux0R8uWCAsrG7X5Hj9rt9F8JMcX6xy7j?=
 =?us-ascii?Q?up1pmKp2OcXok/60728EugEKaFfbdbpqNA3lsSd00X3cyTAgXkfvDAf2XXBc?=
 =?us-ascii?Q?7ZA1ydv9ON0MsE7MBM+8JYCz0olJLuAXWhQa6UeiG/DhTEJtpW5HxbpPIyCZ?=
 =?us-ascii?Q?dQe1bQq7xU8gPl/W+XqzEzHdgXQwJFUfhIdqP4tF8Bgicrh+We+d8ARXqhp3?=
 =?us-ascii?Q?EMTUDh6zBuRSolnfNrWnaIguQiezLkZZOU8sLfOq9JeJUPMKOiC/u7eLIWP/?=
 =?us-ascii?Q?DKniCPxW1xRiSqDk3avOSl//ZA8awO8Tn/+PusOopPJfHa+3TtXTfng3xTwb?=
 =?us-ascii?Q?jlYK4yglwfiWL/6cykbsV6+tX/U6XtHQt+nwmi+laE4PrCbciLvm1j94S8RC?=
 =?us-ascii?Q?yvXGMVRWHIfDzwK7LvwVivaant16PJIXBB+l08pMMgLd0j14yPO+CuJG+Kl1?=
 =?us-ascii?Q?I13SZjGKXV/yzB6NWpbaCUDw+PkCf2mHm0yja1byOWR6Bd0CLVfC+BTiVnPb?=
 =?us-ascii?Q?enmj5bTyIqWtCO9T8q53w1FyjmXxa6nI+P/tpGSshrWo4b9rzKrvmE5CTmC0?=
 =?us-ascii?Q?0DX1Qdocb2jRQtco1NjDBkv0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4780.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JjjTQ/2kM8QV3XRMdeNEzBPWG4DGDSWyJfDWO3C8kNVn1VLi9oSOLqxvr1oG?=
 =?us-ascii?Q?yfOOdQG+ECmbcqMsu/MLNr+pG61Z3IX6hW9U3777/BzWvdJucesLGLQ+r1VB?=
 =?us-ascii?Q?EtX1xkqmxEY4y6v72O3qx9OKJIwfY8qSCslquJfvTtzrbifm6I5k5hD5IuxF?=
 =?us-ascii?Q?NB/lPhw/T82V5/Z+LcdGnsDnvmG3SUh3IEP9+h3LSBu3vbHjRGT9OSVWxRR9?=
 =?us-ascii?Q?5VZORE819VDsqBSQ+MTqAesNet6riGyt2zq5+68w2RKabRXc0JtIvwyYz9o5?=
 =?us-ascii?Q?nBbFBCn9n4pf9gkxno5gZtHYDNm95SeXZzM/CeTxYqHE8QBEuPlxAsCQlPi2?=
 =?us-ascii?Q?AX3GHXJNoCTTVWP3O5xBqOHbvp0+z5gVi/qAe+70huLCDco2PifI1V/E8LQ+?=
 =?us-ascii?Q?sT6lDAVW1TU46rdKBueypsLCq0OlFd+BZnSotNKJv9ZZws0fqR5N6s6upiSa?=
 =?us-ascii?Q?Q3/SRnxaxs/f9BrR3nduU7OVHPdWAcadkme1+g3r8RPTzL12nDxePz7qKwfk?=
 =?us-ascii?Q?PPU0xri1HU8C5FoVaxqHkKvepLrAqYUPigc4uF9Lyu8jCHjHLgc5SI2NoSMh?=
 =?us-ascii?Q?ZuiIDRgaxW+/spuO2qsDD1n/dfMWVzjlXrtDBar7W1sV+loOHa33gALmaZrg?=
 =?us-ascii?Q?AYKjqX9BqXZvMAapKQY/ZwpA3UEoMBhglnqOFyBX8q+wiSt5K/l4CKG5Onhi?=
 =?us-ascii?Q?ppnpKzLwAlSq2gdFlEx+MlvyB/MGq1Qn7WAEb+x4TLJhJ9FWWVYYJAlARcIp?=
 =?us-ascii?Q?xbq7VPRSsB2WtUosgXiFScHCRL8sLllEcZX2MNXBqRcuLaUSuNSodu8cVhqg?=
 =?us-ascii?Q?3kdawSjHuzMy4YvCosFbAr3YbDHtM2b2q356Clle29t+Zsl3rRvENp8whl0M?=
 =?us-ascii?Q?sCbLeGlmL257kIUnexTc9M0R6olAC2HiJK8TgkFjtwZx8d0+skk/FuaapFJq?=
 =?us-ascii?Q?X57XLeaRoh6i7aQsXKaNau0207F61jXZ2YkMhBAUzQCHw2h6glaUo2VGzYwe?=
 =?us-ascii?Q?6aOfS2ieOCDRm6DQAvxyL/wxCp9c3qbs2l6t2mSx0SOW1HPg98r1eMY1yuWL?=
 =?us-ascii?Q?098HVuQ4em1QbqmLW6Mdo+dEEd9m7SlIyB752kAFA1EMoFeP52b+NztDY2lq?=
 =?us-ascii?Q?8s1KQXoBgiR+cyfRlnflFdZiwdcctF0T3sTajEA4RvMf5UhsGIBouwgpWf1l?=
 =?us-ascii?Q?7/pYzYElttkkFYGco8AGZESBnP0EuOeQhaY8ScBWKSjxU0BfWbqtWAxv95S0?=
 =?us-ascii?Q?j/YdMLrYH3ANsCh61+Tb5iK4ssWeK4QpBLG9ZoU4YNYHZ16DVaJ0Upnmd6p8?=
 =?us-ascii?Q?LrsumXTTpLgjeRvK2tHF31KZoaZgfRqm3eADLEoRkeUR68SKBuFVyuNEbaLc?=
 =?us-ascii?Q?lZPSufsmQ0yIGm/cNSxRv7vlgqizbfi4iQEKnIIkUBd4ontEgpz4w8ShGNPE?=
 =?us-ascii?Q?c5d0wXU8ATG/JG0KBhB9fo3CcExIi327b8DUsEAK2yhXZrwHZSy2ix9ZFc+q?=
 =?us-ascii?Q?jxH72C71amVRrg+4wOFgmUHoPrjJRHkxakYPJvzLnDqMCSL6uFicbweMhNJF?=
 =?us-ascii?Q?3qz6OV7r/weLPE0YtHiQvbjygEs7fd26nGdr4RqCYeG4yAgzOAkLrLiCr07C?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iLQUXKGowdIFgjT8EvQWHNguQGw36NJQxTuXNC7fKRIfqh++elIpYWarFnRjxk1CmR4X/tEAL38cWRuoog18vXtlczPhYzpfHvGFbTlHoMun6B1ROTg2lIrdCV+cJt4oJUWvUbyK6MZnVw1TQFKs7ByMdsvOTdaBFAEP3IE3O1Bcu3RgaR2cg8SlMV4ZIdzfSouqe32ONBThZjLEn9zxIAK24k4wQ4bHLYZ+nPTXD8LNqYNn8ZNPhU/CkDoldKkcYfmxHiKF9oWGbsTwmGGj1i0tF/T66RUsxbisFsn+RekDJ9F+TmfGLwRQk+J5QLbVQtmBfIrqkrRHsZptygx64eYJjPWjJvnHe1ehOBH2GQEi5EV/sqecrcYCcsSKGYAfydPag1tuPfkjiXbuG8zQradIimZsg6Bxc/npI2Ut22jrRI5qAxDfEb3sME/3n85YmOeRPulTF5dv27vIGG/FXTwVngS+BuOFgwY9HltnC8Nkj0tWzMSJoXPLtRs6f42/U6LaabD0vNfhI+8vnmqCUI4M6H1gfLXfTMOUC7RrrRLB2N6xCgGPn7ZfwBiaCa6089eHhEPe6QFFK/Gz4hiEM64tUi1EtlEud0jOEQ+720M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71c9870-c159-4c79-da7e-08dcf9ddbe89
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4780.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 18:56:36.1958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1TBTupvNGx1R9xGDaTAKlcvy3vTIBYG9fOZCBhwaCjzDOhspzwTWggo29IpT10X6kefBk5ISk2KI1gWIzyDu9ac4gJ4DCQ+/kw48LIEx90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4730
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-31_10,2024-10-31_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410310143
X-Proofpoint-GUID: FKGgSbW1fnzE9Gn0atl69QfmLZ50PjcX
X-Proofpoint-ORIG-GUID: FKGgSbW1fnzE9Gn0atl69QfmLZ50PjcX

Can you please rebase on github's devel?  Eugene's USDT work is on there and
that impacts patches 5/6 and 6/6.

Also, 1/6 is already on devel.

Please also searc hfor any occurences of /remap/ and fix those to use the
more consistent "map" and "mapping" language.

On Wed, Oct 30, 2024 at 12:08:44PM +0000, Nick Alcock wrote:
> This series adds back support for the probe foo (...) : (...) syntax
> in USDT provider definitions.  The dtprobed side is routine, pulling
> in the DOF and adding it to a new set of dof_parser.h records fed
> through to the DOF stash and ultimately to dt_pid.c and eventually
> dt_prov_uprobe.c: the end result is that the DOF for a given probe's
> remappings ends up in the dt_uprobe_t in more or less the same form
> as it was in the DOF.
> 
> After that things get tricky, because we want to remap not only arg[N] but
> also argN references (the single existing test for USDT arg remapping
> verifies that this works), but the SDT machinery depends on argN being
> unremapped!  So we do the remapping in dt_prov_uprobe.c while reshuffling
> things into dt_argdesc_t's, and tell the higher layers that no arg remapping
> is ever being performed, then do the remapping in the trampoline by
> physically reshuffling the arguments.  This seems to work without breaking
> SDT on all supported architectures, and is surprisingly simple (at least, it
> surprised me: multiple places where I thought I'd need hundreds of lines of
> complex code turned out to need only three or four lines).
> 
> New tests are added to verify that USDT translators work when types change,
> when arg counts change, and when there are no args at all, and that dtrace
> -vln produces the right output (all previous tests for USDT -vln, translated
> or not, are currently disabled because they all use wildcards: this new one
> doesn't).
> 
> We also fix a couple of tiny error-related bugs encountered in the
> course of development, one in usdt, one related to the print action.
> 
> Changes since v2:
>   Populate dt_argdesc_t's in USDT probe discovery rather than in
>   probe_info.
> 
> Changes since v1:
>   Adapted to review comments (all comments but the stuff around
>   trampolines and arg mapping, which I don't understand well
>   enough to implement); in particular track xlated args and
>   mappings together, and move from a flags word in the
>   dof_parser struct's DIT_PROBE record to an arg count
> 
> Nick Alcock (6):
>   error: add missing EDT_PRINT entry
>   usdt: get arg types and xlations into DTrace from the DOF
>   dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
>   cg: add argument mapping in the trampoline
>   usdt: typed args and arg mapping
>   usdt: fix create_underlying error path
> 
>  dtprobed/dof_stash.c                          |  21 +--
>  dtprobed/dtprobed.c                           |  10 +-
>  include/dtrace/pid.h                          |   7 +
>  libcommon/dof_parser.c                        | 150 ++++++++++++----
>  libcommon/dof_parser.h                        |  64 ++++++-
>  libdtrace/dt_cg.c                             |  36 +++-
>  libdtrace/dt_cg.h                             |   1 +
>  libdtrace/dt_error.c                          |   3 +-
>  libdtrace/dt_pid.c                            |  60 +++++++
>  libdtrace/dt_prov_uprobe.c                    | 168 +++++++++++++++++-
>  test/triggers/usdt-tst-argmap-prov.d          |   5 +-
>  test/triggers/usdt-tst-argmap.c               |   5 +-
>  .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
>  .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
>  .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
>  test/unittest/usdt/err.argmap-null.d          |  40 +++++
>  test/unittest/usdt/err.argmap-null.r          |   2 +
>  test/unittest/usdt/err.argmap-null.r.p        |   2 +
>  test/unittest/usdt/tst.argmap-null.d          |  32 ++++
>  test/unittest/usdt/tst.argmap-typed-partial.d |  49 +++++
>  test/unittest/usdt/tst.argmap-typed.d         |  48 +++++
>  test/unittest/usdt/tst.argmap.d               |   3 +-
>  test/utils/showUSDT.c                         |   5 +-
>  23 files changed, 759 insertions(+), 71 deletions(-)
>  create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
>  create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
>  create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
>  create mode 100644 test/unittest/usdt/err.argmap-null.d
>  create mode 100644 test/unittest/usdt/err.argmap-null.r
>  create mode 100755 test/unittest/usdt/err.argmap-null.r.p
>  create mode 100644 test/unittest/usdt/tst.argmap-null.d
>  create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
>  create mode 100644 test/unittest/usdt/tst.argmap-typed.d
> 
> 
> base-commit: 8a1264bf0e818c8624be250eb5174714b62ed93c
> -- 
> 2.46.0.278.g36e3a12567
> 
