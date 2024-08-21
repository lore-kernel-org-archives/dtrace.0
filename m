Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582662B9AF
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 22:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724277781; cv=fail; b=a7g6ktyhanqu3JaiKvW24vznTsDtoQrj8U9kWa4mFJT0xN4FL+U9N7XV/V8Lz3GM4vo10OSkCOchc+fTNUlduIsP2abYMWEhhWv55Ga3ItUUh630iADOumgzMoVrE0arRdQdgxTrHVsd09U0RBsVeLfS+1umYK2ARD8wRrrM6tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724277781; c=relaxed/simple;
	bh=hUyGQzMRv9C8IjOlzHe4TZF9D5ABunzPW04pmsjO7lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g2IuE0i8V0FqZ8Ov5ZMfF7S2N4h+cqp30r98hRjmqX6wO8yFdL7FEmvHJb8gbJ7O/xkGTpaQGpWHGQiDIObFbHpUzGmG0QA8qbtlsU7Ck+kqnorU2aduX7TmL8aEsZORdUZCvP7JOilQS/Wvi2azO94C4Z+WXwpS/R5jDazFNwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GxBmL6D+; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yMajtKDy reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GxBmL6D+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yMajtKDy"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LKtXeo022880
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 22:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=2AOaKod+n1OVZfkD9Xa4jEmliZeGDmoohadm11ge1mw=; b=
	GxBmL6D+gOLxJfKAKhKjLY00oPY7Gax85quzNJ1Sp/dYawFtIFq5+lEmeMKRBbkM
	DCHCKK9CULkraUO2VGOXpRw3oiAftZJv18ls3izUdpO6wpOZIHWbaqPyJZKpZGqS
	BXutt5xsJKxYu7hL6acEXYRVQUC4RxrkyKhVc2RFL0eo1yQcsGp/MmHVbbGwucx1
	ia9A7dX59jMWP6EH+zrN9Sik+xPFVsqFMehfG5boCu5QRFml2HUmIuzlPXbfk40e
	bVS1VPOKlpwxN1n1jbWnDwDlWE3PlIdtwU7LemS18jvaWyQuLqkRP2E3+aXQlt9R
	cRLL3dJWnP2L2ZBZnggHbw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m45gq4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 22:02:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47LLnBP4027922
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 22:02:56 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 415rg48fe5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 22:02:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5wOidwKiMUIpySRDhbTl4XFNmbNFRfkmrJkby2dfpN7Ev6D69vxmeT3bSyislL5bxAZh5HyDKc8LCUFCsnIQfkrvjlk7Ox3HXj3p7uWiTI+j6IuUDTu7MKxVuVjvxM7Ba7m0aCBnDJ7aL7qqkh70gt+VTTuBEUFqpupJ3nCJ2+hHko30wP/43QiGoLRvq8nGiaae7wL+y+hNngn2gpjTh54yMyUEeGaJ7RZRaXyDtYIt+PLUrynVdKTdvt3w0MjJkfOyTK1xOXAV04HiIXoQgZmPHNnz6PPN9voIE1PvoM9DPCZKtdwk1/MdZE+H2yyq9eL6uUHVfNeNUB56P0ySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUuv9zYS91aB7kRowIKhpdOVxlh/mDeBZFIn2juDcZw=;
 b=hSVk2/6emtnY42lO+NXb+EITl6R4gf3qWXx5sHuvygKs17B2Fmi8zT4DWhkU5H47AMfPnl910glZrM1OYO4TMsB2DRGlTfuob5fLAcQc0tBIXyNqLL8xFRjWJxZM5ez7rZ9C2t/+lCLeoyRtEu3EvcZGIqkeoR3OlgbmmdqLnR9q/MLTjkZsVGCMBKixz0zsUyInNTs1aGpkeXy5Kf5Uxc3GM7V0GQH2gXJCasAdJSzvLvkRTd+4faGCJzcZQrIlyssXSsxdrIznbYZSM4+Dl8/7uj9tCWnV1jpHKul7nVMyh+FEyWFuVY/Dsjus6NwSKA0zmdvtZ2Nkd+7zNkMC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUuv9zYS91aB7kRowIKhpdOVxlh/mDeBZFIn2juDcZw=;
 b=yMajtKDyKsjqZ0iG+Xrf6h9VDMIf7tOjKimcpNy7m/DDzwkW5xOhJN4zuDbxHS8eeF9aZez6txPDRMHAFyzPHE5gKpx2p1W7IarpCbO6RJPIJXTeb8JYzc2iBDc0txHDCd6elW02+SnbgcMGq/X8dbLuEKmKr0FajlFevtpmmAk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH8PR10MB6669.namprd10.prod.outlook.com (2603:10b6:510:221::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Wed, 21 Aug
 2024 22:02:33 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Wed, 21 Aug 2024
 22:02:33 +0000
Date: Wed, 21 Aug 2024 18:02:31 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] ioctl: remove obsolete ioctl definitions and ddead code
 that used them
Message-ID: <ZsZj927XeRL8Kil7@oracle.com>
References: <SN7PR10MB6287296B328D2B3163F27C48C28E2@SN7PR10MB6287.namprd10.prod.outlook.com>
 <3bc0ea4f-0f56-a19d-8805-ddeceb70c59d@oracle.com>
 <ZsZgt/IDv078Skrc@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZsZgt/IDv078Skrc@oracle.com>
X-ClientProxiedBy: BL1P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::22) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH8PR10MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 56551d76-6aeb-4cf9-77e1-08dcc22cf5af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?BqZ3SnSV7AbgMmQsgxP2a3j4zIztlRui5D1SyEucdV/jtWpln7BY9BiMo6?=
 =?iso-8859-1?Q?N4GbCEvY5QkSPEg7etq0et/dFqciI826R0ClyP9UDBR+QMr86pw8X6bfEy?=
 =?iso-8859-1?Q?+vXuAHXsI4852ZmwjeOfAL4kY2e2ob7Q2GSsJ8ugV9Dh2sRlGWfq8zzeZ8?=
 =?iso-8859-1?Q?INzI3gm74298m73zHrVTxHVzuJhfIfUNlGr7uryuiacPeQZDoz3Bk0TX9C?=
 =?iso-8859-1?Q?FS3SP7uF5oV1u8AqUlzZt8w8wETvEQu1lZicM/B5jzwgk9eokKHUaPzzb7?=
 =?iso-8859-1?Q?P/3YCfQ7at0JBPYjmCz0mhEtfOnTNv4J+BJQUdkLh4gaXMW50mzFMDxHLX?=
 =?iso-8859-1?Q?9jWjfxmHlftMZsQrUEh1tyBnJEMknNUS90DUUJQiVPOa6lNJZm5geN6vJ6?=
 =?iso-8859-1?Q?x0OHbny1qSNXy6ZUMKxK3bAou6ReKrnoEqTwSeJqpvaev1LJltqwXLe6Rk?=
 =?iso-8859-1?Q?ws0Txfk9x+Vhq/sBRh4jnXuqwsB8L3WkW4HbE7sIGdSd/1Os2vRX7kHE3O?=
 =?iso-8859-1?Q?yBjvEh5YvZvQJt47LkffMeIo15YouwgUI7Kz3bjvCResT12OG/f2mif5iX?=
 =?iso-8859-1?Q?P/KpUdPtbDroS1CaEIcMF64c9QPZEmVLoIVGPzh2FZO6DX7aqT6krccZof?=
 =?iso-8859-1?Q?zspkRoBXIIj747/gCXFWzPo63Hu3x9kv3RtTgJ8l32mDg33bgiH3PAs0fN?=
 =?iso-8859-1?Q?ueLwX9tfjCigruwsdbZRZkBqQE/0n+Jmbk3vHOdXJ+603eTCv0fo/LlTFJ?=
 =?iso-8859-1?Q?Tw/sw7qjLykbZsmz1zG+2h4iy+AB+BAh4gigFbuF2dk/UFXNJCyrzHLe1o?=
 =?iso-8859-1?Q?S6wYIirRNqo0RQDuk1XqcsDI7Llw/0Wn7DjQy9Wqvcqk6mOcCujoQbu5NI?=
 =?iso-8859-1?Q?duNvlALvluEcDuHhEs1g9t4y+E2whiokyv9l+3s0u9hqnzAE+HzmyHrtas?=
 =?iso-8859-1?Q?dlRqxEnqzMwij/8XfOVk9F21zA0GtT87NF0GCIZKG3+JJdezcWsTiaZDQh?=
 =?iso-8859-1?Q?bDKgIQm4kv+Q+Ywqj+I18d/4eA4q9d6KGHKC/9JmVI6pY/CvJ1tSRmSUlA?=
 =?iso-8859-1?Q?qJmSkKtOL+rCrBmv4c0XlP7rbaeIg95mg/iPna94Ft9x4I6bFdDjyOK2A9?=
 =?iso-8859-1?Q?ztL7QDfiwvvIJuq2LuCpS8Kr2X8H6LMeVKDqTgdJ/pghtJqJ0TU/bNPw0k?=
 =?iso-8859-1?Q?GQkRgmsBLvJZyilQnuClDLH+0UcJuEkcfQIbkPktWQIEWBIXQ9Vgf6Wrqb?=
 =?iso-8859-1?Q?5JV+/LqsSNZPfVDXMx7wISwVcZuJ6EC3OiZk6xV0cFvhJUheXCWI3+LwXl?=
 =?iso-8859-1?Q?W8HDdh1QZfrFgvwfCqoeLkmxfTnzw+BnBjN4cIF3D+MunDjm9+rxVzK3pz?=
 =?iso-8859-1?Q?hLNF7Zsn03NFaMWU8lYw1pObLD7JQ7OA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JsfK4lqEZTPtIQc4fq5rttWLyoTFIoLbG5//HWf0l7rKzJ6AX/fc/LA1E4?=
 =?iso-8859-1?Q?AGeTXpL5yH3NJ7dGe7P5uWbG8Mc3WO6Y4pPSjr4tQzhSWHsLOBlajI2k62?=
 =?iso-8859-1?Q?Efgt2xN1jvHLekwWjTefgiaVAy3C+gyVNmPn+vX3Frwj7Zmf8a4w2QZki6?=
 =?iso-8859-1?Q?ZC30D6qOklayTRfQIAIzoYh67ZuG2jQVPOQytx8PitatHcdtAe07XpgbsE?=
 =?iso-8859-1?Q?Z8IZ6oxlg/v45A+EDo6E23kJyzV5RA13rHW+ins6JZ48p/u+4gdhIBlclX?=
 =?iso-8859-1?Q?fXXAGJl16X5l9rGT7lXULWRIF7e71cMRuALMEBcEwZrV9NCq0oauwqfxKW?=
 =?iso-8859-1?Q?+bIRHbgOh5dR4Z1lnA6xTNBeijB3FK2jXsROJkog+jzO0dZQ7FEPtp+S7f?=
 =?iso-8859-1?Q?1FkUUGKKp76Pe1r8mHxXDxqW8GC9KS8xqYuVLE1t9EfHay95J2k4IsjeBW?=
 =?iso-8859-1?Q?+KyOpu3il9xM46XpgpX4/MRI6uogfF8lgpWhsROaxiJ2VeBg2YQWe0oZOD?=
 =?iso-8859-1?Q?nmG+rdpPl69GrwbGu0RC+6Ovo12K/N30OkkV9fZRBtwFj/owbgZhxXhuzG?=
 =?iso-8859-1?Q?fUfBEVaZz6bbA2SzAfPKEqwePnf13Cr3Qbd02rnazBXO5buZv5iFQHwoRm?=
 =?iso-8859-1?Q?l8UTOel2lF/ot8FurEWEvFGcZuX9W4/au9TWCigesnF8d3pfSxp/PuHU05?=
 =?iso-8859-1?Q?YBl2uakhZ03wVr2qvThPBe7uR6vPfHde8dpX4YNQOYoqjMxOsdc1vYDPNk?=
 =?iso-8859-1?Q?L+ONf4h0YITauYYYs5gwxdBw0fsZdO0ie64zHJEMookCkDEhWkj9KO5Xw0?=
 =?iso-8859-1?Q?5oKTig9H0UmeP6is96tW1jJ3Z2e2Gbk84eFQs4u62UagPlQ0Zkic7rEHfK?=
 =?iso-8859-1?Q?2Siamjrz6FUdsiknQwddQb6HVnQx1sd+6062jtFGlMF0e4U/PTouBdGqTG?=
 =?iso-8859-1?Q?9Du8Lln2e8DUuw11jV7j4jbdJRHEn2CkCIcSwuNNXOqWoEuXcoDdb7riYv?=
 =?iso-8859-1?Q?aXCRZFsa2EYEa1dqgOxPzsIYZh9pakSQkGcoGbz7MYULrdgZ/Bihh+G8+D?=
 =?iso-8859-1?Q?d5XIL+y8qMB8rEhQNyyYhFZJpAV0CJay6kpmNw5sUXkOCYfJCyB5Bqimje?=
 =?iso-8859-1?Q?Yg+ecg6Rx3N7vYWnd7va4774QIQxR4DSqWcgrDmHcKeb3gkGLul1vhkWLT?=
 =?iso-8859-1?Q?8qy5VTeLJo/1NCg089VAjkuJnAMCzPxppGPZTqHkhH8eM1vS1P3PcHoEGD?=
 =?iso-8859-1?Q?NTzI6QarspjnjfP98jF/l10bDO4S87IJM7cbNNVy2Htj8z+D8BDCbYlrK+?=
 =?iso-8859-1?Q?juvY//28218Dn5UOYVgJcOpFwcToXw07RXYxsdAQl77b2e82PeIlwlLsAQ?=
 =?iso-8859-1?Q?UAW7/uQN0x4OpgN1b5F5M6iwwaRsv2jzCeXrtuN+BEmU9LXv2acSP2grTk?=
 =?iso-8859-1?Q?qZSSTyDPEFpKAADB+sM50J3jBKmRCrAKm8O1+P3JhwqdLjDatSSKET8OwZ?=
 =?iso-8859-1?Q?X2eyspwedQdk/uqW/xPpwHhjLHkJpSuaoArXaAUmZJfBmg34Bo0TKcyy6e?=
 =?iso-8859-1?Q?GL/oKE4wD9Dd//iQiSbq9oFa31RYHt04L/78yLIiecmFIGxuUjWFEjB0lW?=
 =?iso-8859-1?Q?UBi1HB17Uc74DzwnuHMUcjMw7vJUIWzGSz9P3E2NjidHK7WGX2IVDZPg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nQ6u034KEnp3R3Elq0xwoQZQ7E55jhQZrjsdWkpBdQYRZnusVXJbPxfHsWcClkMBox4LL4j/WeD3OhpZfnDwZE85g58p6MqfJGcP7FHoXXMK0boZbj8d6X7Bth2ytqICiwOUFrpWX9C3C/QYGrC1W5S3JxWT21cdW4bcNkLuz2Z/rPN5pkdCMI5Cs0w0jhW4ymLJ8YQF6HqGL310aLfNXSLBI7ehcajtghinU4Ie20/4/E0rGD8S8gRERkpown/2HCmeN2DUobCz7V/W/B79PREKfUT9mKTKloR/v51y4drlVJ4Pphr87O0rLjBeUoFdfGspv+OiIeQfwBAFxPl4MKOCY4eYzqAZZ3I6UPBYcdlctYIv70oF/dEcpmxSRjoRTWRqrJHF/C11XQ9Q6p3GbQTOy4v3wZUlUA7wcAwyrdpQ05rFtmmCMEL/IPGuvQeNFe17NXcxh9tX+t0diUMSUYMjvqYhleErwIYTLztcvreyVqteDtlpX8m5zwBCgFwByLMMJabJEuoUb1EyO8hA28RpKFlCebHfo87YNZArE/5xVvcZrdWMkPvDdlvXqqP9tq6RdhyDUPmMTeNHkgHcz/AvwazxN+Z+q2WBLLhx014=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56551d76-6aeb-4cf9-77e1-08dcc22cf5af
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 22:02:33.6818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AVOcxDUKNaHBHoAfxz6udEMMCZHWk0TAVs/vOgmSZfPXgxpT1H4rRrO2qhwKgNSkv5ZHdpVFEKJLtvyct+t+9h325wSI4OzpQjde90ciZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6669
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_15,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408210162
X-Proofpoint-ORIG-GUID: 2Lhc5j7eiwOEI7dtTB2XE8lJ4r3nErzG
X-Proofpoint-GUID: 2Lhc5j7eiwOEI7dtTB2XE8lJ4r3nErzG

On Wed, Aug 21, 2024 at 05:48:39PM -0400, Kris Van Hees wrote:
> On Wed, Aug 21, 2024 at 04:58:44PM -0400, Eugene Loh wrote:
> > s/ddead/dead/ in subject line
> > 
> > The patch seems to leave these orphaned references:
> > 
> >     include/dtrace/dif.h: * use DTRACEIOC_CONF to dynamically obtain the
> > number of registers provided by
> 
> Will fix.
> 
> >     include/dtrace/dif_defines.h: * use DTRACEIOC_CONF to dynamically obtain
> > the number of registers provided by
> 
> Will fix.
> 
> >     libdtrace/dt_options.c: if (dt_ioctl(dtp, DTRACEIOC_DOFGET, &hdr) == -1)
> >     libdtrace/dt_options.c: if (dt_ioctl(dtp, DTRACEIOC_DOFGET, dof) == -1)
> 
> Ah yes, that function can be removed also.
> 
> > 
> > If you're getting rid of test/utils/baddof.c, then this should also go:
> > 
> >     test/utils/.gitignore:baddof
> > 
> > Also, then, what happens to "./runtest.sh --baddof"?  Shouldn't runtest.sh
> > also be cleaned up?  (Look for "baddof" and "BADDOF".)
> 
> Ah, true.  Fixing...  (I wonder where the test was that used it.)
> 
> > What happens to test/utils/badioctl.c?  Disappear?  If so, then also need to
> > clean up test/utils/Build and test/utils/.gitignore. And maybe also
> > ./runtest., although "./runtest.sh --baddof" cleanup might already take care
> > of that.
> 
> I believe that one is still in use (meant to test the DOF helper support so
> it would be testing dtprobed).

Nevermind - not used either.  Will include its removal in this patch also.
