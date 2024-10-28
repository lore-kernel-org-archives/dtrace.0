Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F691D6199
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730135611; cv=fail; b=G0gj5sW5yhXnzxTGQZNttx/FmEuwzmR4astHwUVHhaJY7LTK7m3CqAo8XdD9Ny0bzPnqZA2xaxAcs2sSPG9Iz94zWD9vZdPq74SLALyufYEPYynD2AYwnL2wtzIewfysIRjqi/OqpHzR9cWFD7JLFFdLN1rUxjfnkE0RpSUT1zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730135611; c=relaxed/simple;
	bh=JtXtvEBA6xB4En85gEvaimJGfd48A7Wz9/H59HEbpos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iTZaQlPV19NLSy78Kxa8NoinKF0+y9Uu+RAwrbU9KbFrt7VB2W6U09YAgiJknHoutVoUVxAG2xg0yRj0/FMY7q8TskphPpO5hSAvpw1p/IRW5CJqab1PrVRS14i6QGLR4EmqNSeNhf3v5p9wXGWyZ65XO61PZTLqzQW+2Eo4NZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i4f55W/O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iyL+TI9x; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i4f55W/O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iyL+TI9x"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEuPcP023227
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=1YcKb30w5InETIe2QR
	tpuuZfPIU8scsugN8iDH6F560=; b=i4f55W/OocH8ymHOxfks+zDedhiWw74kQP
	BNzC4CNBcxe8ap3TO9HEr1N3ZpTwLwjCGyQubdgmsiCLNBXLVrKk5ICxYi9JCM2J
	phg2bF/FRIIvdf66NTb/dPI+cAFmeu0fCQSdqhf4hqfJDP7AjdyMZ4CG7EpdqYDf
	Ht8QcNeFN8DRtfnRPfDr3qdfQlGqg8S+tv2wEcOExJMX+dTlkd9+oowpbXLmfG50
	Jb7MRmnV2uek+aTVqdT7+Dumw8jfWVuHEZ+FJTIh4CIMuxuFpOS0MUKQneinxUd+
	dI1p1LOT3uwpZtGeVTYtYXzVWu+nFMEFT0QWjf6KLMUL6B96EclQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp3e4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:13:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SGai82008411
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:13:24 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hne87quq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 17:13:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmpl/ciGDKfwlccM2+9p3xuZtOS640SMmYv0+h6sxPjCO1VIJOnYTFQysT2Ac5Wh8Lxng0yQ7Scla2NdrgR3GIyA7Rr9VfwmcknaATbSBvruVMxRrcvTSjGr/LqHWv5nXe7FpzBe/IU6gPW5/6v8vIetP3+VnzCbN1NAlbL4msJ2FMUEgswBPITZBrfeiPvvOy+UzII3Mh6iwnX7kMTpzzKUhlUbn72hxJmaFrbkhDcfQVgsWmd7qgNSNVfe/GnQ4nTjlAGTac6H3AmvL45JEAEgokCHXrDHbVQCPf7F5xl5MYvj1KmGRYwraW7DDx6DwjAMvlLgdcESw+AIVUuo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YcKb30w5InETIe2QRtpuuZfPIU8scsugN8iDH6F560=;
 b=DO8ogjrHo5Ou+tYeIGz2BDdhfPLoAJyDqHZjQGsY3q6IKfAfnFBe6PEqqDZlfTEoo1zFic0OZqGcIm/MmJ91DDLUXT9L/A62Q6OH1x/0jIvlEEaYjD/4YFgN1an8TOEJoF43w2zqYijbavMw8WiKlof0mHj3bt+uYD7Tz8Q9gTY8AacPRe755QFKuajFTYb/QwE6xpfP5ibcXjSBlg6UWOHJ+u1e7MVQvwpb1b3GkLsDgfKdLxyxlqD3TZ4FSzt8JyqbFHqKG++TM0iY3tArAtF//RCielaMQBnt2Fn0+C0gjDIfI0aOw2pgQQJy8wjUSgdwX9LJBiMutRVm62M+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YcKb30w5InETIe2QRtpuuZfPIU8scsugN8iDH6F560=;
 b=iyL+TI9xJbF7JYeXNvi0/tD4fJsEFiIwp7QhgitcG73Pcpg2AujmWQuHuvOsxEUqhQNCMXACSpnlRrgniv1oLtG3G/L0PBMsIGlC8mn/LtalhD3jQSSa3fAimCauE/18UpLmKPpA3yxGODAcP9yab7bRLeYIn2FRrA/9h/vQvcs=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA1PR10MB7700.namprd10.prod.outlook.com (2603:10b6:806:38f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 17:13:19 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 17:13:19 +0000
Date: Mon, 28 Oct 2024 13:13:16 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 02/19] Add a dt_provider_discover() function
Message-ID: <Zx/GLF4YqrMWNAiY@oracle.com>
References: <20241028170533.21335-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028170533.21335-1-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:208:160::35) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA1PR10MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 321c1a4f-5e65-4d0e-6a4c-08dcf773d1d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JyXORH9xdvlN39rfvh9SF6+K9HxfAhh8u9W+MEMfNIrrjlrh7lTspxEDhzaQ?=
 =?us-ascii?Q?L6Z16/iO/mV9wb2sA73QpZrbfLTL0H74IKZOfxaVmn2ykxZWQq4kaXWUEKgi?=
 =?us-ascii?Q?VzlH+y5hASF+LGxvrtokLKsSU8QQTiwazz/h0qdf7W/ZINJV8rmfHUMqq9/f?=
 =?us-ascii?Q?prHwMZR+tXz4ugT+ZbKK8lbCZ8wE8U+xWUBsf8Bel+qt4XusHKfCorM2DNGo?=
 =?us-ascii?Q?ZOdx+NpKSI6hab4pLgRNqdlk+Oxl7e5MsCuvyVbYIiWT2Aif5gzX4ARq34BX?=
 =?us-ascii?Q?2OTL/0GapfSvlh+vfCasl8qXs/F0FQsVzSrOO3Nwx8GeHUBcciB9YQUHpPxZ?=
 =?us-ascii?Q?uFrp55qibvGmCr41R0TNd1vV6NRR1a34/AcL6cTtzRhwzLeIgVrTGfTWopHx?=
 =?us-ascii?Q?SotQp0vTr9xYxRwtmkY3nN8PgPENroRtYS6JNNdz2iBng7m38R3lPGUVrTJz?=
 =?us-ascii?Q?RHEDruepsx9g8eLT10ShTIil3OJP9XEbuss7XRgSU/xkV+31SUhegv5712ox?=
 =?us-ascii?Q?B7ygkkIlncGUEVh/WFQsdvk6CqcGeMnltSNso3GhenQAjL6i+0MH/1lGkpu9?=
 =?us-ascii?Q?3Y1MSibMq6okOm2RVEQGmdtU5wT7gZLc8JKD5k2RIgWlVxTAnqhYBo81MgFU?=
 =?us-ascii?Q?WFmw3jRTNxpfJn554/PeXK1KoR7jqfO7xqprBdMMSYutB7RC00ZEVmiFTPzV?=
 =?us-ascii?Q?M0c2JQUveYYiYAM5b0uh7TbobqHzeANUn9/wvRqZ68/tIwFhC0v7D6nueRR7?=
 =?us-ascii?Q?+YYLIWE/t3+76mfq8E2cX/NvDYOImGI+riez1PUxuST9fACCJD45lj8434op?=
 =?us-ascii?Q?PcpmLijtqXI3NcwzN6Ne+3CVUGoTKoJJxG+8B4TiCqHv/vL9WOSQVbTFJzEi?=
 =?us-ascii?Q?NweuQ8EbfwH4XsSoVnDxVVBB77asGQ0peuAnab1guBaZ1GUVboM6mXjMT7wV?=
 =?us-ascii?Q?cTZmuiBUvOfeNw8CwwOk3AZRiPmVKidTEGFvWiV6lPfU5WTbrCDJ63itSh68?=
 =?us-ascii?Q?naRMsata0Q8VaSTdPTVE/ziDi6O9oWvBwbox6s1Mmigh60yNptOB2A02Nmky?=
 =?us-ascii?Q?wEvwbx/uAIlYD3tGBDnwqEw59x7wsNTYP2lr9dlEvAg+VHub/+bFLKHGbNFb?=
 =?us-ascii?Q?f7YjejxBRlnRPmDOpVF+zEYVR+7HM2Eshj8K2cILj1pQXDKs87nquXaHCxEK?=
 =?us-ascii?Q?uEi2v/KNOmyIeoSgwcq+gH8OSQ2P+cFYVMNpOKepbKMYTiG+YlICY5/nPpFz?=
 =?us-ascii?Q?Jha9OZFqu/vST0OUR32PbaENxPZWpPkk+Fl6X1vVINGXQMdfaa9fuJyFBMev?=
 =?us-ascii?Q?9fhDH+ngP35G61HWAwWLbQAb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XMl7yHDWoLZ+OqhRJHuJFvNwi/i1DYwheuOJ+yyWLeHIkhBZo/ScyyJYncNq?=
 =?us-ascii?Q?ICw8o/A/5gag0sDgDJAU+D08ptjYkJpIADSCo3uVVI1rI9US3fdJT4jug2Oa?=
 =?us-ascii?Q?mpS2Ed5tQhBEiCvtOnl2SaFaMWlTOyMW3+7Bq51x53OQbZ9CwMjugO9UPBfU?=
 =?us-ascii?Q?MI/cj8HxtKoS+GAIBPx4pL54TVewC6/XLJ/RYWxi3mon8WK3IA7POGm1sccQ?=
 =?us-ascii?Q?daZLyHXp+wv2IFboQtAwSVMeGztoxMAge2FhfoMsQpKl56H9CZZdPXkIx4PV?=
 =?us-ascii?Q?jpSC6hpSRDEFSKFJWlVXt8ExvZy7BjtferVWVcTdOsnXRzI8rQIPFYoIk7rg?=
 =?us-ascii?Q?Kh1tskJ5XQKxmON3OipREyl8wUFpW6eQNJGwUx3KXR2i6K86nXCUytMATScu?=
 =?us-ascii?Q?d3AttUsjAPrpEl6Z3RJW3C5JhEedpFfdHZiT0XQBieHjwCfZ9UUB9n25funt?=
 =?us-ascii?Q?4ymG9aeKIDFPR8j5WMzewsL3oHWXktzx/LwA8KDFGMXQil5UbudFpWwIII5m?=
 =?us-ascii?Q?+gL7MwenHuAeoLW67KCs4nJcOzCDhd2Pq+2rg/VaZzrZ2vXBwmQCX7TOajSM?=
 =?us-ascii?Q?6ah1k55NOXtIsHwj+HWObdoBwnmm0llv0b3UyWl+7dSxDVpuOXffdEAe7lUt?=
 =?us-ascii?Q?G89M/5qIcE+itMwMj+2RNVltMXJntysJeFYnUkuUJS4BWKVdkAnPRlCdX1y3?=
 =?us-ascii?Q?KLiNS0+KbpzMDtcEDmgsXeyMj39Hj9Kj4B8Ii4WpxfZeM3zvl+dblehXmWV0?=
 =?us-ascii?Q?qIOqJHQ7zeNwnYrzX8SMFGTIWZQuh6Xo713IsMoyC4ztIvkg2J/lix3nSZuI?=
 =?us-ascii?Q?lOP0jP2QPBD3Y9/dbvG16hcmeCzRk/E9hr8gYbo1SxOVN/euEJSiCpuYkuCL?=
 =?us-ascii?Q?noNrG0wleJjMxokUmjb3jzDFfo9TZsK34fGc1B83UK2gdhIrxk1ZD6Y6OxxG?=
 =?us-ascii?Q?bRNblqSVfOHQxa8x3N64RQe1OIyFMOk6Mk8L9tCcyYQhUn6LXgOnlrk03CDP?=
 =?us-ascii?Q?IiGzSFaRIYtE0PBUFJLPqYNbzTlazIy8+r7W2vN7uQKs1H5qazXVVlczDQw/?=
 =?us-ascii?Q?X2/iKbUVvHHkrmwtkO/MnuzttnuZNsRCqX7xesRGGm2o9MtEaZuLlKqIb6Ma?=
 =?us-ascii?Q?TtPvSv3DgiKZ6qWMXMNjsO2A3YiKMOWZuRdamCbxydhi8/uiISqyL3SdJPmm?=
 =?us-ascii?Q?iVjAALnD1WndCLvlxNbFGPco2W/06E5hBZY1jlafjJRR7pyG3VwILs/doq+D?=
 =?us-ascii?Q?+d9UWWs1QfdGGaQR14NVSfPNSDAkz13PrNwLidERSKBUbguNIOilud4nASmg?=
 =?us-ascii?Q?faXSdMTvBBTxDP+YYq9M+l2ReqnWR+vjm7n8/EdIzXs4z4PWEIjqs5W+qHPN?=
 =?us-ascii?Q?Lb/BvOcPfp9LWVSIwWFlXvlXMmgqC6N+g591LqmyDJhcQ703SqJcvP72EDTw?=
 =?us-ascii?Q?uTJwKYoh9iJZUV0o0eh6XNyDikT+IV7M7Z+pnRxVyQa0PQtWLuo15EtrZacD?=
 =?us-ascii?Q?q/PQ3Up5NHDu9XnAimqNiTNClkcJ4DkaML1GwSUCFA6vS2jVPRopyabBYFvf?=
 =?us-ascii?Q?WI0ivE/49YD+7zMR4yA/GUE7d4ow1a7WeDnlFXF9i147p2gUW94gOAOt37QN?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O/D0XK3DR6A6MFzuMNHg2auXUUpccPo8HYyyBup3EF89h1ZO+QrG5Y/cX/DugHg6+hB1VWwN33JRbAcxPriFm3yJESRaJwImQ0vm5y7do6W6l4ZscjzDYtjzw7+luEc+73AdZHbQ0VOGZKDXsqfTNs0LQK8KxTjveDOqM4KarQDDGYtwhw1p970gqEPf6Uwp5Po0FdITLebbAHHVK3AtFSxk/MdLBjHxrompqzyytQXTjq9pAojlaz4B1PQuj+P0KIQAPy3AatiUFdJqR4EqO34Rg/RWlpLBYThKcUEIgEgD5beqMY/+BzvzMOY0e+QdxAZyl3H4Dh4NcVlHAsUK0oStnZNcDxpcCck0RTBVMTe8B2JoIEm8qSonQT/HoRUth+B8y3V0tFBNGclXspuRNNFhZ+5k/35zurabBcQbPgR2zPSnSOAITsGBbaj1BR2YFkaMnrjcHmebffxES0AYhmfhZmBqDr6dE8a/qTLdsQKjPVAZ4pjEpgQX6iEXobnqmuPW/q1oIrXf6mSiQ9QDxpX69RFiYtwoX+ndcK0uHYGY0qG1RpgpS15VOFTvsloZxmXO6HbhNUovXPpffs9MUs/hTzAHoo5d2vMPzez1g7c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321c1a4f-5e65-4d0e-6a4c-08dcf773d1d4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 17:13:19.5272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anjno/Db5Sf9QaMg4j657hBUKCYF5IAMN6PLHcQhYah4nPtPjS9W7oUkvNrc4SW6cOlxFDz3pZ1ouTvvSLfggYD1/gNHI6xR2vnPhJAP3lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7700
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_06,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280137
X-Proofpoint-ORIG-GUID: zYHkO9WgHZxj02apzKuhPJUpw6bNP6FR
X-Proofpoint-GUID: zYHkO9WgHZxj02apzKuhPJUpw6bNP6FR

On Mon, Oct 28, 2024 at 01:05:33PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> It is possible for new providers and probes to appear after dtrace_go().
> Add a function that can be called for such discovery, on a per-provider
> basis.  Each provider that supports such discovery needs to provide:
> 
> *)  a function discover() that performs discovery on behalf of the provider
> 
> *)  a function add_probe() that adds a particular (discovered) probe
> 
> To support looping over providers, move dt_providers[] from
> dt_open.c to dt_provider.c and extern it in dt_provider.h.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_bpf.c      |  4 ++++
>  libdtrace/dt_open.c     | 22 +-----------------
>  libdtrace/dt_provider.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_provider.h |  6 +++++
>  libdtrace/dt_work.c     |  3 +++
>  5 files changed, 65 insertions(+), 21 deletions(-)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index ad11d178e..856110306 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1275,6 +1275,10 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>  		int		fd;
>  		int		rc = -1;
>  
> +		/* Handle probes discovered after compilation. */
> +		if (prp->prov->impl->add_probe)
> +			prp->prov->impl->add_probe(dtp, prp);
> +
>  		dp = prp->difo;
>  		if (dp == NULL)
>  			continue;
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 848141ddc..1f586fc4f 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -61,26 +61,6 @@ const dt_version_t _dtrace_versions[] = {
>  	0
>  };
>  
> -/*
> - * List of provider modules that register providers and probes.  A single
> - * provider module may create multiple providers.
> - */
> -static const dt_provimpl_t *dt_providers[] = {
> -	&dt_dtrace,		/* list dt_dtrace first */
> -	&dt_cpc,
> -	&dt_fbt_fprobe,
> -	&dt_io,
> -	&dt_ip,
> -	&dt_lockstat,
> -	&dt_proc,
> -	&dt_profile,
> -	&dt_rawtp,
> -	&dt_sched,
> -	&dt_sdt,
> -	&dt_syscall,
> -	&dt_uprobe,
> -};
> -
>  /*
>   * Table of global identifiers.  This is used to populate the global identifier
>   * hash when a new dtrace client open occurs.  For more info see dt_ident.h.
> @@ -1210,7 +1190,7 @@ dtrace_init(dtrace_hdl_t *dtp)
>  	 * known providers.
>  	 */
>  	dt_probe_init(dtp);
> -	for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
> +	for (i = 0; dt_providers[i]; i++) {
>  		int	n;
>  
>  		n = dt_providers[i]->populate(dtp);
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 8cfef0ba2..354dfa1ee 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -18,10 +18,32 @@
>  #include <port.h>
>  
>  #include <dt_provider.h>
> +#include <dt_probe.h>
>  #include <dt_module.h>
>  #include <dt_string.h>
>  #include <dt_list.h>
>  
> +/*
> + * List of provider modules that register providers and probes.  A single
> + * provider module may create multiple providers.
> + */
> +const dt_provimpl_t *dt_providers[] = {
> +	&dt_dtrace,		/* list dt_dtrace first */
> +	&dt_cpc,
> +	&dt_fbt_fprobe,
> +	&dt_io,
> +	&dt_ip,
> +	&dt_lockstat,
> +	&dt_proc,
> +	&dt_profile,
> +	&dt_rawtp,
> +	&dt_sched,
> +	&dt_sdt,
> +	&dt_syscall,
> +	&dt_uprobe,
> +	NULL
> +};
> +
>  static uint32_t
>  dt_provider_hval(const dt_provider_t *pvp)
>  {
> @@ -149,3 +171,32 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
>  	BT_SET(pvp->pv_xrefs, id);
>  	return 0;
>  }
> +
> +int
> +dt_provider_discover(dtrace_hdl_t *dtp)
> +{
> +	int i, prid = dtp->dt_probe_id;
> +
> +	/* Discover new probes. */
> +	for (i = 0; dt_providers[i]; i++) {
> +		if (dt_providers[i]->discover && dt_providers[i]->discover(dtp) < 0)
> +			return -1;        /* errno is already set */
> +	}
> +
> +	/* Add them. */
> +	for ( ; prid < dtp->dt_probe_id; prid++) {
> +		dt_probe_t	*prp = dtp->dt_probes[prid];
> +		int		rc;
> +
> +		dt_probe_enable(dtp, prp);
> +
> +		if (prp->prov->impl->add_probe == NULL)
> +			continue;
> +
> +		rc = prp->prov->impl->add_probe(dtp, prp);
> +		if (rc < 0)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 17b1844cb..384d4fd33 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -62,6 +62,9 @@ typedef struct dt_provimpl {
>  	int (*probe_info)(dtrace_hdl_t *dtp,	/* get probe info */
>  			  const struct dt_probe *prp,
>  			  int *argcp, dt_argdesc_t **argvp);
> +	int (*discover)(dtrace_hdl_t *dtp);	/* discover new probes */
> +	int (*add_probe)(dtrace_hdl_t *dtp,	/* add a new probe */
> +			 struct dt_probe *prp);
>  	void (*detach)(dtrace_hdl_t *dtp,	/* probe cleanup */
>  		       const struct dt_probe *prb);
>  	void (*probe_destroy)(dtrace_hdl_t *dtp, /* free probe data */
> @@ -86,6 +89,8 @@ extern dt_provimpl_t dt_sdt;
>  extern dt_provimpl_t dt_syscall;
>  extern dt_provimpl_t dt_uprobe;
>  
> +extern const dt_provimpl_t *dt_providers[];
> +
>  typedef struct dt_provider {
>  	dt_list_t pv_list;		/* list forward/back pointers */
>  	struct dt_hentry he;		/* htab links */
> @@ -110,6 +115,7 @@ extern dt_provider_t *dt_provider_create(dtrace_hdl_t *, const char *,
>  					 const dt_provimpl_t *,
>  					 const dtrace_pattr_t *, void *);
>  extern int dt_provider_xref(dtrace_hdl_t *, dt_provider_t *, id_t);
> +extern int dt_provider_discover(dtrace_hdl_t *dtp);
>  
>  #ifdef	__cplusplus
>  }
> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> index 11335345a..5318cdb7e 100644
> --- a/libdtrace/dt_work.c
> +++ b/libdtrace/dt_work.c
> @@ -362,6 +362,9 @@ dtrace_work(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pfunc,
>  	dtrace_workstatus_t	rval;
>  	int			gen;
>  
> +	if (dt_provider_discover(dtp) < 0)
> +		return DTRACE_WORKSTATUS_ERROR;
> +
>  	switch (dtrace_status(dtp)) {
>  	case DTRACE_STATUS_EXITED:
>  	case DTRACE_STATUS_STOPPED:
> -- 
> 2.43.5
> 
