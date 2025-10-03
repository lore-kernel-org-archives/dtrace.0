Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB11DE2A7
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 00:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759449637; cv=fail; b=k/UZRGwA8guCA10mjwZyr88kDif4r4JLf3XAbQivQLOcq43R29nfvmGOChUCUWmbwdKtElYx66+oYNQd0a2++4jhr7nVhe0gbjw0EmLWay0Gc8aXGoxMVCVRittdSupWQUqbLiKRjXKiSIJR4nK29k5CTPWt9j4vtkQFoDKe3t0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759449637; c=relaxed/simple;
	bh=feaaMzvpJ6FwWuU/MiqX+Rvy8+LxM6S405LK34kZCXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AGJGZu/QBpPVrmlmdqR7YuTT8xmk1FgTSKat66qwCDufbF5COA64T+GTjy4JxApxI498t/0UF80YppnDAHdgci62HWMq3k8ESMx64htr5k4KtCSdXnxpJ3e9SNCO3wdHMJ1JjrPHZyEDgE5kQ9dwEeSO/GvoFr08PEKyHhIbWrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k2/TtZrg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uELCst3e; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k2/TtZrg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uELCst3e"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J1mEg015473
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 00:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=V4Pl285OCGaO0vuSYB
	Dk0JTzU3OdLv9ePVP9MgifwzQ=; b=k2/TtZrgDkt2s4ywSR+087s+6vb/4wF2em
	55uWN52uyWieEuyXCJGd5Kf+YwaXWvhiynLBRC/DtAThCwCNkSG9hTubUFfgZDbM
	PxhWxIBeNPFBjGgMwtwA6kp0r+4FChYWRycf/+akJXXuVIs+9zLEuof00AcXdwlw
	Dmk+j90VEVgHbmNjtRBa7G0sFJgNQeEjKmEVrl5JcyJ51rLcr5J9M57QTKS1c5EB
	8fmgOUpE7xHTtn3vzIcEwEcWOX3TlNzj4hjXdcFxtnNn/gsXzBMiu+nsl0j09uKy
	AkqGjHQWIKCIsVlBZfjXQusCvNeRe54PiDfGfcbuLbSK8IHeh66Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmabmcap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 00:00:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592NgCC6017347
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 00:00:33 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013034.outbound.protection.outlook.com [40.93.196.34])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49hw23da2m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 00:00:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M85QbvA52h0BjyfAQmSEHUZCPCF5rSzYsfvt8aN9cV+L/YzC1uHievN3AAIMXkZDKoqPd3eIY980jC4J69ceGl0Z4je9V77UfZKqOOOtZ9WQKRAIJru8I7YJ0F7sBD6xcjHo3F5cs/4LTNYN0DXlybwv8U/vOmQplG1pCOqt8TPKOFPjnMqOs8w6lcP1QLYz6Swy7ZbQxw2pdteteyYpHra+lfnWp0sgVVOqcH+RCHeqEd76w/6SLcmYUb5Z5UbD9OKztdq+S4cogiAEapUiLHyalck+Lbg1sGT6w6yS8x8alzRRBL0W/BkaFNAI+HH22/AxuRytnJclNrllGd8rTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4Pl285OCGaO0vuSYBDk0JTzU3OdLv9ePVP9MgifwzQ=;
 b=lag0JYG1uDCV54AY45oVUDNg2KEza8ZNQuBRiU0HLuLY5rAnx0DGLLD7NMGSPCZa0WYBzxJGhLoRzzjBMXpiOY9OxoZhFobqFtEROBJWil8LX4iFozGyzuoxIxgL9MxzQsqCQ0z6b0429c0nqYZlaFL4fMcn/aSI/RoLO8m3PQ3Ie9eT1zGWjWo9LSgy2QefWsazlcKj/fGBzUOlQIaub2mtXOhSJB/42fvjvjqZYoKqq2mchxaZbdgGTC6GisdTTj6YH86aqTwRUmNaW1ilsGqz+YGS+Wz8zNOM9H8vcSWes2UvBAYTDUCWAgxCnZmS+uZsxvI2LC0VDGecvzgHvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4Pl285OCGaO0vuSYBDk0JTzU3OdLv9ePVP9MgifwzQ=;
 b=uELCst3e6wgx6NXAt12X3wpvzhDFD3/NpYmJxYveMLDyzaNLac6p5rco81SoWaH/+Yxcl4+z62+hExoCPa+5B6QxNSs2b4VIC8Ia/ncD6L7ATqmEDGs3b3Yr8uOvuWzkf6WK+5hrf2YAN5ePn+xTxrTQt9YqQvcbIrBbl26hUJo=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CY8PR10MB6754.namprd10.prod.outlook.com (2603:10b6:930:95::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 00:00:28 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 00:00:27 +0000
Date: Thu, 2 Oct 2025 20:00:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/4] parser: fix parser debugging yet again
Message-ID: <aN8SGC3RC8BOM8gV@oracle.com>
References: <20250918180338.197827-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918180338.197827-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CY8PR10MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b00d4db-76c3-46da-687c-08de020fdc42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HdJ/VMmA49p7w5I7r+x2lnTjXs+LOd/WKKjX9RVJxdI994M3z2aqLLWR3fNo?=
 =?us-ascii?Q?7LOa1TR/bxqKYtBMF+pVSQkhPtfEkC/MAWIDapN0xpkC6HDzGvF2TJq+WZUT?=
 =?us-ascii?Q?9+CNCKs//AMPxwtmTJBQSYBLA+7vVe2hcMbOCqQb8b9oVPyZBhUCvjFrVxqJ?=
 =?us-ascii?Q?KHODNACXV8LiEWxmd8ceqSxd9MwmUwjcW4IlE9W7EifL5jjvxJRoLObZrFmj?=
 =?us-ascii?Q?rhsxUTylRIILh24McZ/Bfw5NHHUZ9HwRuGlNQHwb/J4CfKZ03H2Td+Akp1U6?=
 =?us-ascii?Q?AW2krdfyz388dFPMAzlomAfCriIt7yHu1BmeUuoEyrBmhzExtSualdc/Sgt1?=
 =?us-ascii?Q?loyUCIAatxO8DDN95oP4kfW9YZyK/dSKX2bvFAZPKYtctJjO4pHV6hWbtQR7?=
 =?us-ascii?Q?nYZxqi+HML4OfQAoh9BO1I4InjHnk/WDl3sbpmnh+vD78bhjIb5KZgH//rfn?=
 =?us-ascii?Q?2m8vd5P2bqGkDBpFAca8auwQstxmTXPlPLFU58zqJJQmGl1uSs1FopImn4Qp?=
 =?us-ascii?Q?yrawugXy6MKxg5oz58PdCZWC255s7n3u1XiCBK+4LFMWIfdQP5a5vuVvsRCX?=
 =?us-ascii?Q?OO8amL9FPRluri3Hp3uytae8mnPkU4c4Vku9UqGacEIQ0eKXr5Nr8vHUB21d?=
 =?us-ascii?Q?SARxYKAGgDBmfnIspg0MOZpfe1JedkBi/fUfUZ2J+VrTl+uEk5n4Fl7/aG2K?=
 =?us-ascii?Q?THC44Kgy1GpUTH6yTA3Z1nmyndfcCasC9WnHiA4mhjRCWNBL1NMGvD42Ozmy?=
 =?us-ascii?Q?TKQvMmxIzw+IHA8qkXM8IqvB5xJNTsHU+l1sh8Iex15koxMPir3V1/Cfdk7o?=
 =?us-ascii?Q?njjqPl5rG49xUF3UuwY+B2vODCEhTJsYHGB3rn6o3B0i4YwUoJSAyafxwtez?=
 =?us-ascii?Q?MAbPQ8TDATX8eERLvhsQs9a3b5p4VJmdEgxKQxYexwXiBywLCv+jQn2rOIH8?=
 =?us-ascii?Q?9bEUz0hPPhuBLCJWHHhh5WSEzv0hpZIb8P+VKly1GqnZWitJ+P2g5/9jLl23?=
 =?us-ascii?Q?RB9CrgT/p8WcMsym1AwtVvVYATWNJIZwjmqG1D9XnbtRdWTkLVEfreE5t0aw?=
 =?us-ascii?Q?sx2//F5o/yKF2otaT1bezVBgo5TWNsRyP49ws1xVRZgPfwAZpOOVQgVKiXIz?=
 =?us-ascii?Q?MQuY6Ytx+Af6RIjgm5eqiKQjcimG747c0rLmKrBt5dXTc4McQwZ/mItQlHGn?=
 =?us-ascii?Q?tX6pWh6fKFYWTi6UUxRPIzWGG3Tr2sz9JJDyRHUQVclG5+TBW3ZzUoAGzIW1?=
 =?us-ascii?Q?fW+Nw197fZwBoDrHDaRJArPp/xn0yJN99fLdu6W0BX+obMw0NiI3xTLWcURO?=
 =?us-ascii?Q?v9gzMroYjSjXus8DeeM8/bICkPGtu435mJT8u5oBF+3xvaVNDkJtTcVwPsY3?=
 =?us-ascii?Q?/KlH8P/RafGYv9H3oImeBgrGFOba5ICC/E3huCvbbBL7eFIHtZ4l+WPQzb/g?=
 =?us-ascii?Q?3PVUVOTQzFZ6AT5GjZqdaMgJxPx9VVee?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QoCSscigZxCde5pEtc1OommBqeIt36QORgBHIqRelxdp/8EwLKyaDzz06q+Z?=
 =?us-ascii?Q?WZrAx8X99KAsfETfWXiSQUUmyZFYho54atdDHz0FOCRHmZjFiltijUem4Tgn?=
 =?us-ascii?Q?qkgBkK0gyomgxISB+Ay3naf4y3pH+XFngrWOc6DyKTuARgAliEFFDm5cVD+D?=
 =?us-ascii?Q?44/JnqY5kQx03qxfikqqVbcbu9Q65BBZV/sI93ad1+z87dPwKgGfiVh99jMH?=
 =?us-ascii?Q?JcpXA0Rt3FsauRmhowmlQXJkGvMlxPcWqS49Ic7cvrlkHz2myKdRP9cP7q8C?=
 =?us-ascii?Q?HmK+MKcbCN4B0MF6YyOGMPzFR4USJkrRj4ESlASZ6AolTx2ktrSalWsgPH6f?=
 =?us-ascii?Q?F3gzDFdRKGZIkLxVc1cJ5RR4HG5rUSTwZ1/coJ34C/SjfanlFMdHtf2lbjsY?=
 =?us-ascii?Q?1VO686TbpsyJ0kZntCzu4PDYloRzokKEiM9cRW0aCxYsHZve0D/Hjy+Om8Py?=
 =?us-ascii?Q?9nrmyo+whYblbRwgGAouBedViltGSTQSGG/KUllJGH1tjYN5L0T0PJdX4DaK?=
 =?us-ascii?Q?3peUizQs+t1bhIjR+2qRAFLtCoebViAEKFjrD54AeJPm7wlNA+vxLMu5knH5?=
 =?us-ascii?Q?yP9H1Y42auDICyMX3fwBVSDFBBzmiChQU6Mr0rYKv/hwSNGMW5uG9qkafeKW?=
 =?us-ascii?Q?/qpz1B4RV80F0LgTqTQHytWJt9e2q7dweV7EFM0uk3p0otULJx9WeROaq8Fi?=
 =?us-ascii?Q?iJ11iOa2hQZNknsq1CoR3Ij6qFieencImgU9fkCU3UqvAa68B2ezDRwmuidd?=
 =?us-ascii?Q?BegIXYXk8dICG7nXLSKoqCiEWANaUhGUnGo0F7uTTd5z8ZfbUorDkguHFKdi?=
 =?us-ascii?Q?uI/OrS/qVvc47iCfFqTTSdHQ0cZ9rOkkqUd6ucNpU2dOTvV9sok9Zx9ZqP5V?=
 =?us-ascii?Q?VmFHL2KTbzk4ZEVj9qhV+pMI+ltouDpWBgR5DS7qw3LXzdiG5Lpm+EeDA1Em?=
 =?us-ascii?Q?vyA12z8UXQBP5PNREOBmlIV/W2sf27qRtJ/dscdIXdgnw84EhDN1tuV/rN3o?=
 =?us-ascii?Q?vWGv5c52dEOU1GJJK8oYWsrFt3fIeCsCc/JXPwMze1tNXWzUefjOldIPYiQK?=
 =?us-ascii?Q?EWL8Ln8IA6XuEYk7EgfJfigoqHcHOPM0xWO2ZX3N3JZAWBMul4WO9Lxgq5Cz?=
 =?us-ascii?Q?DcurtEUp5gXonVB2ac0aQUzt8c7G8QNdPuRNqee2MwN7PQQ/2Y0rjj/Xb7aJ?=
 =?us-ascii?Q?9CfI9VCf5PGiOcrwIlbM5oUU3nE33vD0Lm/zSKCVeVrYHgWjMheHlnP290UL?=
 =?us-ascii?Q?15dwCTrovCpVAG77yOxXySwMygXU+rNZYjaP5SwHe1AFe+uGTdP0bPwJtN7G?=
 =?us-ascii?Q?hzRSzRB9qiJ09jLmivaCUXIGyEbMQyCO1tp18jiaIx6H6Z/R8JsocGShQDWO?=
 =?us-ascii?Q?UmtYYu3zUxD1c60az3pZTJhcSuwcZRb1SgXArWHQfRGZPom8n/yC4jIGx3GG?=
 =?us-ascii?Q?BWEp5L6zMd2zXFSe8Ep3log/xxvN2jZK9u04b/Ram3qUXm/wNX6Wo+eYcDTF?=
 =?us-ascii?Q?tKwTm4GViY6c2yIuMRAM41hen+R0pOaYuvY0TFVI6NscBTTxuP0a2kDWr/HU?=
 =?us-ascii?Q?lHanxjQmuqcpO0zLL/4G+wRmiVeXhoPpcUOO59fmOTmdBoGy0J6/e3E7wHYZ?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	18jR8RgCH0/wbTWh9sZtEcBnE4Eoj0fqBgfNcfPowTBMsGLeO9KtWiPvgA5VaVCp4aUcUimHvSKWAziLk9u7e2gQYXSHtXyA1UYqou893CyZnxDBrMwW3DSxbZr9/pAYdYoBFg8Rr+UFR5kP2NSJV6i9F3EUQCQUBCt3yWi+qpIbHqdCHSyiJKFM8ZofZK7asjb56Xu9d8yn5CgawXXkmLxGicUJC8co70tyZvSEwgjZcBZ+G++QZO6wmddxrYxslQ+03csD06U+D106096pO/kLi6piCQ89xFmChNJPqqfndqAd4TavHbxO6bX2LFxTPhGI/LOtwNpw4vPJoQfnPr/pS7CUhjlO4K5b6F6jYGUopwMGh3xIIAozudK+Na47xlRyw+qltbUU3t/p2ENjVrOxwQwTt9vQalugQvyybO4k0VcHuuRWSN4p0Od+13f74C0xuzjehyJqEeRtXmympSphuJAqi2bJkboQRvfhDwmLuP0bHk6qcqSnPeaX81hrNsWnRlNieMcHvhfb6kGNlqFpoD0wyfd0yFmFWcPZhUrlbPxWcx2r3/ewVJGIcEpJNhPoS7LR1FgZ4Sc2HTg3oHL45do5L9QDSBWcinbMPBM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b00d4db-76c3-46da-687c-08de020fdc42
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 00:00:27.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqCLa15NGCrqUjSiFT4jrfATqFCMZLxz75TUI4uXibqId8F2QD86ILqgNIezFyVxkK6+HT7DFReioO0rAJLvU8O4y10Uobov7CGLQ1M7HFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6754
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510020210
X-Authority-Analysis: v=2.4 cv=SI1PlevH c=1 sm=1 tr=0 ts=68df1222 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JaKC7xRppBdlW4Lo_lwA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12090
X-Proofpoint-ORIG-GUID: zXtG6gZOGKYAC06os_cjpixoOSuCPfKq
X-Proofpoint-GUID: zXtG6gZOGKYAC06os_cjpixoOSuCPfKq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NSBTYWx0ZWRfX3b8tLEVYTG7G
 cwu4HAmNrNE3qt61kJ7RAkxE8H0KqudYbvlmnghbui3fmQeI19d9YoJOF+NJUboPOMEmJIn4hst
 vXw2iDYf1kEOhcNDdVSXoYD1KG7K/hiCg7ocH0c9Dkq3KowhbFWVy0SSLz5v1M+FKbmQ/TKkoxI
 K+PrmEIfRg2gI7dlYYoA2V7BN5ACIoiuC54wpt4K5QN34g83RabhUo8FfIbbkvafN5zoGiQG2Hp
 6gLlvUiMj4XKZ2pw/rOtx7FPUwZf4Q3Sa3G1zfC1AV4zUQwCjUqp2hNwRmgluIdKRKnJ28juia2
 nRc7U5eewr8TNtJpHM8R0s13Ls/VxFQuz1NrnLC6qTvap9Akq5BSEP2NWehZh+Tflw/UyjUEYsD
 bX3h2AOODVjmHth6JpiYGUR2h4Z1Kh+ZZPbybu/+RKTvbXbZmjI=

On Thu, Sep 18, 2025 at 07:03:35PM +0100, Nick Alcock wrote:
> The interaction between YYDEBUG and the yydebug extern variable has
> changed repeatedly in the various iterations of flex and bison.  The one
> thing that is consistent is that yydebug is not used if YYDEBUG is unset
> or set to 0; if it's set to 1, the parser skeleton defines it for you.
> 
> So (now that -fno-common is on by default) dl_lex.l should not be
> defining yydebug itself, and dt_impl.h should only be declaring it
> extern if YYDEBUG is 1.
> 
> With this in place, we link and run with the parser debugger set to the
> expected state when compiling with YYDEBUG 1, YYDEBUG 0, and YYDEBUG
> unset.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_impl.h | 2 ++
>  libdtrace/dt_lex.l  | 4 +---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 7d8e4432a24ad..9c4651a46baa6 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -808,7 +808,9 @@ extern char yyintsuffix[4];	/* int token suffix ([uUlL]*) */
>  extern int yyintdecimal;	/* int token is decimal (1) or octal/hex (0) */
>  extern char *yytext;		/* lex input buffer */
>  extern int yylineno;		/* lex line number */
> +#if defined(YYDEBUG) && YYDEBUG == 1
>  extern int yydebug;		/* lex debugging */
> +#endif
>  extern dt_node_t *yypragma;	/* lex token list for control lines */
>  
>  extern const dtrace_attribute_t _dtrace_maxattr; /* maximum attributes */
> diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> index e8f3bc8c25bb0..9f12f5c7ca289 100644
> --- a/libdtrace/dt_lex.l
> +++ b/libdtrace/dt_lex.l
> @@ -21,8 +21,6 @@
>  static int id_or_type(const char *);
>  static size_t dt_input(char *buf, size_t max_size);
>  
> -int yydebug;
> -
>  #define YY_INPUT(buf,result,max_size)                                   \
>          result = dt_input(buf,max_size);
>  
> @@ -663,7 +661,7 @@ if (yypcb->pcb_token != 0) {
>  void
>  yybegin(yystate_t state)
>  {
> -#ifdef	YYDEBUG
> +#if defined(YYDEBUG) && YYDEBUG == 1
>  	yydebug = _dtrace_debug;
>  #endif
>  	if (yypcb->pcb_yystate == state)
> -- 
> 2.48.1.283.g18c60a128c
> 
