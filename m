Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C691238DC7
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 21:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721682603; cv=fail; b=rxB/Q3bh4CZfSyfrwOrTZv0wVrLbgn/z/orvCsv2E209mhpmQJ6SxU2NBazXvbC3AGIaKhty+9vRqdvhTHens/i+pZ2JXAtggoPMpbtp7+0ViRhhn5l9S9MO0Tu7wU+ARzFwEDWUlFZ5TWsrwia9RQI5UDARtxAjQ/XLqiKPC9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721682603; c=relaxed/simple;
	bh=PyKPajGzyWn3jO2gmPPgr6/W36o3gKehsEXhbRQI2ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TpsxJ/YMnuBvmHkVczmBDNjPkRe6IekvmS/7ZYN2fW45VuyLe3uRC5jbiadObIhE4GZ7VVQqJ6nTNFin69+TAXlHahfwLRQCylk932V0YYb7Z4GdYkIdqQy8c444IeF0CCbgWgRklBMxuqOtnsArRiYsRaRf7PIth+hB6QRvRNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lVTyx29d; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vKY8crnP reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lVTyx29d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vKY8crnP"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MKtVrw023808
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 21:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=tZhNGklSOPhkYxY0/UTYmv7t+ah+sQes1nddzUCodOY=; b=
	lVTyx29dMYJA28f4wEWXoWGDr5wiZtlyw+k7Iew/d9vEx77uF5Piza3KsXePf4nS
	xYSLqksPkTI3UdH+hIEi32ZM7zZpumkB0TEv9qp8rp8usM7p7mpXoe+qu9bHcN1p
	ESrapieQMkn1eOK9U7noc0zif0VSYD+A7speowxmQsfeUZIpMPOzaeB0OkF0tosW
	j0iWWEAULCTGYeDcJCzXOYscCaS8SDzyOTnXqcehYxYl526PO480y0lUR02AQ3C+
	Z409JBuv5zVZclvangQCv9m+gwu1x1d5d+huUJBJlWeJ5r6HoHLCSLJNrAxRBr94
	kcicwGbchQixL6vA/hPFXQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hfxpbq85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 21:09:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46MK1tZ4018877
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 21:09:46 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40h27xs1d0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 22 Jul 2024 21:09:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdHNe0leZIfbu4ax8B8nSruRTfBw+yRZiGSyx3Jx/9vaTupXfSXWMzmBGhIgjl6dZFMFZHXDYvUaptWv6oG2wMRhVtopPgkG6AWquJCaEzrnDnt7sJoprYPd0Fb6NGwKKrga/fmVprSxpQYNAwxaAvNhaLG421cYIwq+ANuMsHJmOhwa+mC33fAWx870xAuo5ld5RaioAmAyv3bUpjpaiMXjQwHUdxOQGBH093UsSuxkSfiWGoqMn9+ge5wjxkjl0PU2vknsJJ5yFGjc13F8Jf1cbVD21w0736S3LMVMrVwxAFskuRDcVzbIac8M2TF6+ydD24f0YKREDgXLAP2VTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4Ol1tgO64Gn6+NaYuj81wzLfcjlNEjBHclc0QBTPEE=;
 b=ng5Iiu4+Rw/96IyT4yuScTxbZNrI+G2QP9F8sZ31T0RdXilS/92y7hvdefXNMKQsHzefNfYHC5IoBTC9Wil9xVyoPSknEkqhZ9IF+H71bVYUy/suSSAfCuXxeZzS8HkjC8mipiqSkYLhs4RQzeGpTLif1IE+k7Q/Stvqa9oAk8PDsWkDTzde4Vklzspbd4LT9O7wTISv1GJmXHlx3z1uwhZUb+PDYcj2I5wNmzx1pF+BT0PC4Ut29YAPkucBPHAcibkUS2dQ7gbKb8csQbOidV0HO7suvJlTHpbWyBJaWYdZesfkkO4Vu08zeKRnKbxHyupakIcqFzUqz9VO01pY/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4Ol1tgO64Gn6+NaYuj81wzLfcjlNEjBHclc0QBTPEE=;
 b=vKY8crnPiHow6oh9WoOlL+aBZwlKUxl4cUkwm0NpwRqR/9biFXY7knh4wnRRnA50ol8KsFxZ66rOOCQHqtt4DupXEhZCjKk3cZy1P9+IkDPCkjTrBv6PeiujrAxFtWzvg3U3K7lTDE47l6AO8n4pkkRCcIIk2Rng/UvaP3yWLq8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB5115.namprd10.prod.outlook.com (2603:10b6:610:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Mon, 22 Jul
 2024 21:09:41 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Mon, 22 Jul 2024
 21:09:41 +0000
Date: Mon, 22 Jul 2024 17:09:37 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 32/38] Widen the EPID to include the
 PRID
Message-ID: <Zp7KkTnE824UdsQx@oracle.com>
References: <20240628020316.32544-1-eugene.loh@oracle.com>
 <20240628020316.32544-3-eugene.loh@oracle.com>
 <Zps165WN4pmcJ2cP@oracle.com>
 <939139b2-0ba8-98c2-9a0d-15452e76a03c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <939139b2-0ba8-98c2-9a0d-15452e76a03c@oracle.com>
X-ClientProxiedBy: BYAPR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:74::32) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e16af4d-6068-4231-a5a6-08dcaa929a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?SVQldT/RsKcUXZ76+9udsboTgN9KTdKJiz6X09T3+Bj1cblz5hdFsqpgsp?=
 =?iso-8859-1?Q?SnPxlj2dt6B7Yanlunuetuvmm7KMrI/LWaxp1qH2DpFcPWo4Luxlh4aCmC?=
 =?iso-8859-1?Q?vwpvitZcWzLEKew0SvqudSFE+ustdH4HK+uT61nW7yLk9ZtLckQ73xYLct?=
 =?iso-8859-1?Q?Xx5W2DLhhwVMDmcwxkM5vnyOkxHMqzi5p8UUz9r8HD/5835SMEdJjJ2t6/?=
 =?iso-8859-1?Q?t4j2dlGdF/XVsSEF1kWM/atrGLct+008Zu782fQOZCJt9g5vvBQ0ItlkDB?=
 =?iso-8859-1?Q?fR5T90QgB9818DlMFDjMfuhJ9cWqtzUSqUr7MXz2tNsTZ460qgwUd1Opcv?=
 =?iso-8859-1?Q?WYuFfxQCwn2H8uiSqAr/7rShOLWKSZRupQQyp8sPvcN4DAV5C4AxVseA64?=
 =?iso-8859-1?Q?Ur9VyzbVe+DqQnA+y+avfw3kng4e2W5TWHefz7yYYSST5kel3+jDw5sR+l?=
 =?iso-8859-1?Q?PAuxqtVhTPMox0k+S+BuOTbGwwWHOxh1yEOdkSwyLfGXu9ZiZHfLm3neec?=
 =?iso-8859-1?Q?IWCkv6o/V1+8YaHrreo1vCPE0K21No3yFj+CyXm3/KwOfrOJpI8JxTE4Tb?=
 =?iso-8859-1?Q?m6xyEVeBg96Sge5BLqm+CpTes1GNdB6Ln6b7orL9d+bn7ST0JqcKLfldFX?=
 =?iso-8859-1?Q?/uYuRGVlAvDFjOQs/krpQ7ZuPNK+zlfR6EYZkuv+AX87g3avPISrMKNXuj?=
 =?iso-8859-1?Q?vkWEpYhgw0Mbk/WukI8/cMaVSlrHBu27BHrA6Jf0quyThaX6g7g/WriwdJ?=
 =?iso-8859-1?Q?sMuNBkZ5pVc5SZV/L2+MhWl9KYncnE9l6lD4T2DZDIWqqfsSNCAlh3KlR6?=
 =?iso-8859-1?Q?53dOSuDjkLR6lobdAb7hpm5Ji52HA5XJFJdVYqX3XX26LGsF8V5/aQV5mD?=
 =?iso-8859-1?Q?POBDXiVF5PIMB25AnVT+xtA7S9+SWvT4iYW/nUURfatIiUir7b3ZSjCVk3?=
 =?iso-8859-1?Q?cYVRgMdLmx5jPnqq+7cLVmwm3jHF7pxg6WLxq736hlvSeiJTY7v+/xKPWh?=
 =?iso-8859-1?Q?MTkZgVOGejmye8fsHnJiwOo40MTwEjavUT7fbsFu9MA7ttx4ciC38rTgJO?=
 =?iso-8859-1?Q?bmIekV5IkxieAxAL0fqNYNFvaH6ipRaFwtt/qzv3gwbj9NzwLggy5M3hOt?=
 =?iso-8859-1?Q?9Et/Amcjx0CmXI1cDQdIov/15fwwB9SjlsesD6gZK6p/BCRiZk/+4ea2Ec?=
 =?iso-8859-1?Q?EhbQ6rFJSNLE6//RyhM0p4+21WdfUqqrbGRJOE/vJ3dFwptsKGCocnr0H5?=
 =?iso-8859-1?Q?GdXWC6CPJloUBKLFyBFguVOPElOMl7DOR4Zu7l3nYeVv0Qtj4rG3yDyNBU?=
 =?iso-8859-1?Q?vpmwOeWCvCo2W/WN2ZVNOiHfcwELoArk6PUYidy5NvnVCu0P6MZW4LxlwI?=
 =?iso-8859-1?Q?n8b/YTdEDVcUYTexnp3bOYmvskfKm/yjbc5zYn6qigzhdq6H1vCKc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?uDbXWzNufPURaRkJ7DWSP96lsgPIVtbYB1F3JYR17dqMM//LJRzXK+fEkY?=
 =?iso-8859-1?Q?3LRfmcGbRQN0zc4BX60R1oavBzsgpaCAhJmRinmt9YvXFZq0pFHj+nj04w?=
 =?iso-8859-1?Q?tJa+IIiZqxxWc4qmNb5xEI2yVk+FE5SAN3OrRWplZIPbltBtCI393XMB3A?=
 =?iso-8859-1?Q?mx7n3N6T6PMUxa9qjSQI8qgGOGVXhJE7Rg1a4Vkmh4mRfYnxcicra1gF51?=
 =?iso-8859-1?Q?PJjOshV6XhslBJfkbbjBtiy+YFCHgqxTjDa9pa+mLzAGWZ3xXGxIjcgWVf?=
 =?iso-8859-1?Q?WOb0TQ1dgpylGsYTXXeulgUuRKBNaejLj1tNXD7B7KyJEsJZ9umqGkI7+l?=
 =?iso-8859-1?Q?aHlaiNXC2uSm0WZQiGjbAgKyR1Sz3rXPScpIAZPF+TDS1ZYp8XtvRvPf+U?=
 =?iso-8859-1?Q?/dQgsP2QBgNRrhChdIhiBxe/Bcw21aO/FpW7ckxcjvfziL3T6gTZe/NpCS?=
 =?iso-8859-1?Q?sBZ3kCTGXDEbcYciXNNJOzugdkkuGiSQWQlOB97q8fUsk7UkFgXpoIg7dL?=
 =?iso-8859-1?Q?09Ou24zCWDLYC3LSzbbHGIBIhv9Nfc/zmjJ05pAVzb9bCnAdXnbE1Rw16a?=
 =?iso-8859-1?Q?sSVlJVGr1hWmbfLR2gj7xTO0ESfBZwdGad3HM6X1YKJjaFxbtRXUwmbOUP?=
 =?iso-8859-1?Q?7ybeqXzv5dVflHyubiUZNj5Sk4IIHpB58vtkBD0nTxxfYZsc2lqh4GNyl2?=
 =?iso-8859-1?Q?I/IZmE5Hm2HS6bFvFTSCUu/5j1TPlg8fSS33NXOr7rDJAn7B5W4SLFcn4s?=
 =?iso-8859-1?Q?NZeLF76cfD+GN/cy/CowDgmrO8dkR/X9UU9e35CCXTGwFi5iK4Nhg2pxJB?=
 =?iso-8859-1?Q?TdXLzVgXjzMjpXqyprZptmStY/odcrHKZq9/XRBNMhWEgLrDnDHStB4H4y?=
 =?iso-8859-1?Q?tnWp0JMKhjWiiXZPrVRVMG+bn6vLnQrGd886k9EILOSeRyoDmoQFydl9FP?=
 =?iso-8859-1?Q?5Jn916QJq5kChNtX5hfqFqQS7UNW+AWcAuWfMQk9jTDel5TawugpuZPekQ?=
 =?iso-8859-1?Q?8IY3LAb/CIDC+gw7YUBlmNNqHNrC7uwue0HxdO4XOqSfQ137T3MZjxLNKl?=
 =?iso-8859-1?Q?EBmhgt55a+Eg+X8ZJs/1rNmudaq2ZdrmQ8jTZ5hzWxDFw5E/SIzey8rrFr?=
 =?iso-8859-1?Q?aJTrfx4PMgWs/Nk+Rgm0YzvadxsKUWQqiw2wIRSUIAQtE5s7cNEb7ggiIk?=
 =?iso-8859-1?Q?uqw58aMqZxEp/7cdZ+Kd7Od5vVFDLlw2k+OJKQs+rEVwkBZukIt2yd+Sz1?=
 =?iso-8859-1?Q?Tsm/5DCgixLQ1exsGvrJzOCTDfAcx+hvQIsqL0CwwaQW422ojTExVkLp6t?=
 =?iso-8859-1?Q?uhSTbwuIYV0xvwEscRbbkHbjnYFwFRrbpjF9tzuTI2PxdQsuQmOf8PzD6g?=
 =?iso-8859-1?Q?iyn6a5w9x84eCyZm/XKG+5djSphY+CnER5cmVfN6cEtgnr9SZ7yIIZJRJf?=
 =?iso-8859-1?Q?kKNAeUj8jIhrVajJj5UcJ4nC8NhpFdBO5LM/xi1yUt/e9SIt1j7pzyEuPt?=
 =?iso-8859-1?Q?wgDAERY/QG1YGtje5owukE+JBVz5Dc7yd262soB3VI4gXy/5hWbpiN/sTw?=
 =?iso-8859-1?Q?3Zwvyu8qfm92/oBPugoG4blN1JuY0K8QabIaz6tiwk9GJb6q6XyQ3HRVHr?=
 =?iso-8859-1?Q?ny8q9IZHPwc1jmyhoe30fvamOSb7NPSHx4JF98lSx3KXyQZI7yKmNt2w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YTo6DjgHFxnI/tBbuO2ENykD9od/4iCQpST/s07SiSM6hmrwvly6k/587+LfmC6jY2AXk10KfcFoRydqajkPUuAT4W5jccr8y7QTOQ+u+hAT+buqlg6vbKjrdvXiYZT5UaQbGPjKayyCw7gK6tmLjwLqkuOnYjggEe6NgzzPpigF95OI+2U1IBnAGWSO4yt8IgTLYiM1FolIBEs7IWJRKuDEKs0gYfLxBSExQKIyfEkDYFKQkZadG48ixvNA1IlFPmCdKdXNHhg552VLUTkSHRVdXh4G5vY1szH3Hgx7LHyay8StprBYrw/SKZSXV9x/vEtXplZMhc3YQXLRlhQlJfxBdzMOk7F9wyshwgvJqfQ8a11i1u9+1E0vOgGjY+yF9kMTQ3Mo3N/MKAQau/roFjjWUmo6OQdlNS+7gGt2erqSqTeJLvvBnZF63WZVWoaz1/oyXMKw+SbxJiQiccVS8UqGpM4qIEeDTmmnglm+n2wfkMqV6hKYw1OderkxPQ5ZE+GcNRCeNChgJhR0aZveSyalM+GNbepbq/XoEKEYoqJbfbGPl6b/L8mywM1NrP1wDuj+AZduzvzZ8ZyrlQbLQw+fns9p4r/4n35bmh51ens=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e16af4d-6068-4231-a5a6-08dcaa929a3b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 21:09:41.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tZxSsfbnfYRLTDEA9ibPHL3qKoJmNpmY2aOFG6fSa8NMiDZKhrsBzcbSYSFNj56zRhZLLEvRr4bBtc5buFVoMKl6XUiR32qBqC7/Z3Kqas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5115
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_14,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407220157
X-Proofpoint-GUID: V-_YhxvNeKLlGDiwEaZKJbYqxuPBaWNr
X-Proofpoint-ORIG-GUID: V-_YhxvNeKLlGDiwEaZKJbYqxuPBaWNr

On Sat, Jul 20, 2024 at 07:26:44PM -0400, Eugene Loh wrote:
> On 7/19/24 23:58, Kris Van Hees wrote:
> 
> > On Thu, Jun 27, 2024 at 10:03:13PM -0400, eugene.loh--- via DTrace-devel wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Each output record has a EPID associated with it, allowing the consumer
> > > to get both a data description and a PRID (so it can report PRID and
> > > probe function and name).  We want to support uprobes that trigger for
> > > multiple PRIDs, however, basically breaking this scheme.
> > So, the EPID is (before this patch) an index into a list of ddescs and pdescs,
> > effectively associating an id (EPID) with a { ddesc, pdesc } pair.  It is also
> > a unique id for a clause as it is used for a particular pdesc.  When you have
> > multiple probes that match a given pdesc for a given clause, the EPID still
> > identifies the correct ddesc, but obviously the pdesc data won't be quite what
> > you expect since that is PRID dependent.
> > 
> > Which is indeed why we need extra information, as you outline below...
> > > So, expand the EPID to 64 bits, half for the old-style EPID (based on
> > > static information about the D programs) and half for the PRID (discovered
> > > at run time).
> > Of course, this is only really needed for select providers (e.g. USDT) whereas
> > for all other cases, the single EPID suffices on its own.  Therefore, I would
> > expect that we do not place the PRID in the upper 32 buts of the EPID *unless*
> > it is needed to override the "template" PRID that is associated with the basic
> > EPID (lower 32 bits).  Doing things that way things will look more familiar
> > anyway for users who expect to typically see EPIDs in low values, and it also
> > keeps the code design where (in general) the EPID identifies the ddesc and the
> > pdesc.
> > 
> > It means we have some code that needs to deal with the exception case, but I
> > don't see that as a problem becacuse most of the time it won't be used.
> > 
> > In that sense, we could look at the USDT-type case as an exceptional case.  So,
> > it would need special code in dt_get_bvar() to put the PRID in the top 32 bits
> > of the EPID when it needs to return the value for epid.  Which means it needs
> > to know when to do so.  That could perhaps be done using some flag in the
> > mstate or something.  Similarly, the prologue of the clause could put the PRID
> > in those top 32 bits when the clause is called for a case that needs it (which
> > perhaps again could be indicated in the mstate)?
> > 
> > In fact, if that works, then such a flag in the mstate can also be used to
> > dynamically generate the provider name (probeprov bvar) rather than needing to
> > add it to the strtab as a string.  That might solve some additional issues or
> > complexities that are seen in other patches where the strtab is getting updated
> > at runtime to add more strings.
> > 
> > Why would a scheme like this not work?  I.e. why do we need to add the PRID in
> > the top 32 bits of a 64-bit EPID for *all* cases when only USDT needs it?
> 
> I don't think we're forced into the choice presented by this patch. Other
> solutions are possible.  I just don't see the value is having two solutions,
> one for non-USDT/non-pid and one for USDT/pid.  (You say something will be
> more familiar to users, but... what exactly is more familiar?  Users know
> what EPID 23 is?)  (You talk about dynamically generating the provname
> bvar.  That's a cool/interesting idea, but it seems to me to be independent
> of what we're talking about here.)  Some things can be streamlined if we
> just settle on one way of capturing epid->prid info for the consumer. 
> Instead of two solutions -- both "prid in high epid bits" as well as
> "pdesc[epid]" mapping -- we can throw the pdesc away.
> 
> tl/dr.  We could maintain two mechanisms for doing this stuff.  I just don't
> see what the value is in maintaining two mechanisms for solving one problem.

When I originally suggested widening the EPID, I envisioned only doing it for
the cases thata need it, i.e. keep the EPID and its semantics the same for all
probes, but adding in an 'override' PRID that represents that the 'native' EPID
is being used for a probe that is created based on the probe that the 'native'
EPID refers to.  So, such USDT probes would be an exception.

I understand you prefer to make the widened EPID generic and make it apply to
all cases.  While that goes against the original design, I can see how we can
redesign things to use such a mechanism, but then we essentially do away with
what an EPID actually is.  That is OK.  But that implies greater changes are
needed to make this approach a clean design.  I.e. we no longer have an EPID
that refers to a ( pdesc, ddesc ) pair.

In your current implementation you replace the EPID -> pdesc association with
a direct use of the PRID that uniquely identifies the probe (which is in all
technicality different from referring to a pdesc but in practice it is the
same thing here because the pdesc that used to get associated with the EPID
was for a single particular probe).  But you keep the EPID as an index into
the dt_ddescs.  That is unnecessary and without the direct reference of the
EPID to the pdesc, the entire meaning of the EPID (Enabled Probe ID) becomes
meaningless as far as the internal implementation of DTrace is concerned.

With the approach you took, we really do not need EPIDs anymore and they should
become an artifact of the consumer (mostly for backwards compatibility) and for
that they can be assembled when needed (epid bvar and as a value passed to the
consumer in dtrace_probedata_t).

Instead, we care about the PRID that uniquely identifies the probe we are
storing data for, and the ddesc that is associated with the clause that is
generating the data.  That ddesc is uniquely associated with the clause that it
gets constructed for, so if all clauses have a unique id, then that is quite
sufficient to also determine the ddesc for that clause.  And incidentally, we
have such an id already because we generate one when we generate the identifier
name for the clause (essentially a function name).

Therefore, it seems to me that a cleaner design would be to keep an array of
clauses (or perhaps statements, so that it can be used as retained statements
for wildcard matching on pdesc), indexed by clause id, and to store that clause
id in the output buffer.

So, instead of storing EPID (even a widened EPID), we would store two values:
PRID and a clause ID (unique across the dtrace session - not to be confused by
the clause id that we use in error probe arguments - that is a clause counter
*within* a particular program).  The PRID identifies the probe and the clause
ID identifies the ddesc.

And for the two cases where an epid value is needed, it can be constructed as
(PRID << 32) | clause-id.

By the way, the clause id within a program that we currently use will probably
need to be replaced with more useful error location data like filename and
line number.  But in the meantime we might as well use the global clause id
instead, because the in-program clause id was never really useful anyway.  But
using the actual clause id can be useful because it can be related to the
clause identifier as reported in disassembler output.
implementing because using the clause number 

> > > The EPID seen by compile-time files like dt_cc.c or dt_map.c are still
> > > the old-style EPIDs (even if now 64-bit) since they have no knowledge
> > > of the run-time PRIDs.
> > > 
> > > Further, we do not need to expand:
> > > - the mstate (since it already had the PRID anyhow)
> > > - the output buffer (since it already had an unused 4-byte pad)
> > > 
> > > The combination of EPID and PRID is for the built-in variable epid as
> > > well as what the consumer reads.
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   bpf/get_bvar.c                                |  6 ++-
> > >   bpf/probe_error.c                             |  2 +-
> > >   include/dtrace/universal.h                    |  2 +-
> > >   libdtrace/dt_bpf.c                            |  2 -
> > >   libdtrace/dt_cg.c                             | 43 +++++++++++--------
> > >   libdtrace/dt_consume.c                        | 28 ++++++++----
> > >   libdtrace/dt_dctx.h                           | 12 ++++--
> > >   libdtrace/dt_handle.c                         |  9 ++--
> > >   libdtrace/dt_map.c                            |  3 ++
> > >   libdtrace/dt_open.c                           |  2 +-
> > >   test/demo/dtrace/error.r                      |  2 +-
> > >   test/stress/buffering/tst.resize3-manual.r    |  2 +-
> > >   test/stress/buffering/tst.resize3.r           |  2 +-
> > >   test/unittest/actions/setopt/tst.badopt.r     | 14 +++---
> > >   .../arrays/tst.declared-bounds.runtime_out.r  |  2 +-
> > >   test/unittest/codegen/err.deref_0.r           |  2 +-
> > >   test/unittest/codegen/err.deref_1.r           |  2 +-
> > >   test/unittest/codegen/err.deref_i0.r          |  2 +-
> > >   test/unittest/codegen/err.deref_i1.r          |  2 +-
> > >   .../unittest/codegen/err.deref_string-assoc.r |  2 +-
> > >   test/unittest/codegen/err.deref_string-gvar.r |  2 +-
> > >   test/unittest/codegen/err.deref_string-lvar.r |  2 +-
> > >   test/unittest/codegen/err.deref_string-tvar.r |  2 +-
> > >   .../codegen/err.str_NULL_plus_offset-assoc.r  |  2 +-
> > >   .../codegen/err.str_NULL_plus_offset-lvar.r   |  2 +-
> > >   .../codegen/err.str_NULL_plus_offset-tvar.r   |  2 +-
> > >   .../codegen/err.str_NULL_plus_offset.r        |  2 +-
> > >   test/unittest/disasm/tst.vartab-bvar.r        |  2 +-
> > >   .../tst.DTRACEFLT_BADADDR.null_ptr_field.r    |  2 +-
> > >   test/unittest/error/tst.DTRACEFLT_BADADDR.r   |  4 +-
> > >   .../error/tst.DTRACEFLT_DIVZERO.div.r         |  2 +-
> > >   .../error/tst.DTRACEFLT_DIVZERO.mod.r         |  2 +-
> > >   test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |  4 +-
> > >   .../error/tst.clause_scope-begin-ended.r      |  2 +-
> > >   test/unittest/error/tst.clause_scope-begin.r  |  2 +-
> > >   .../error/tst.clause_scope-regular.r.p        | 12 +++++-
> > >   test/unittest/error/tst.error.r               |  2 +-
> > >   test/unittest/error/tst.errorend.r            |  2 +-
> > >   .../alloca/err.alloca-bcopy-before-beyond.r   |  2 +-
> > >   .../alloca/err.alloca-bcopy-before-bottom.r   |  2 +-
> > >   .../alloca/err.alloca-bcopy-beyond-top.r      |  2 +-
> > >   .../alloca/err.alloca-bcopy-crossing-bottom.r |  2 +-
> > >   .../alloca/err.alloca-bcopy-crossing-top.r    |  2 +-
> > >   .../alloca/err.alloca-crossing-clauses.r      |  2 +-
> > >   .../alloca/err.alloca-load-before-bottom.r    |  2 +-
> > >   .../funcs/alloca/err.alloca-load-beyond-top.r |  2 +-
> > >   .../alloca/err.alloca-load-crossing-bottom.r  |  2 +-
> > >   .../alloca/err.alloca-null-deref-lvalue.r     |  2 +-
> > >   .../funcs/alloca/err.alloca-null-deref.r      |  2 +-
> > >   .../err.alloca-scratch-exceeding-bcopy.r      |  2 +-
> > >   .../alloca/err.alloca-store-before-bottom.r   |  2 +-
> > >   .../alloca/err.alloca-store-beyond-top.r      |  2 +-
> > >   .../alloca/err.alloca-store-crossing-bottom.r |  2 +-
> > >   test/unittest/funcs/bcopy/err.badbcopy1.r     |  2 +-
> > >   test/unittest/funcs/bcopy/err.badbcopy4.r     |  2 +-
> > >   test/unittest/funcs/bcopy/err.badbcopy5.r     |  2 +-
> > >   test/unittest/funcs/bcopy/err.badbcopy6.r     |  2 +-
> > >   test/unittest/funcs/bcopy/err.badbcopy7.r     |  2 +-
> > >   test/unittest/funcs/bcopy/err.badbcopy8.r     |  2 +-
> > >   test/unittest/funcs/copyin/err.badaddr.r      |  2 +-
> > >   test/unittest/funcs/copyin/err.null_arg1.r    |  2 +-
> > >   test/unittest/funcs/copyinstr/err.badaddr.r   |  2 +-
> > >   test/unittest/funcs/copyinstr/err.null_arg1.r |  2 +-
> > >   test/unittest/funcs/copyinto/err.badaddr.r    |  2 +-
> > >   test/unittest/funcs/copyinto/err.badsize.r    |  2 +-
> > >   test/unittest/funcs/copyinto/err.null_arg1.r  |  2 +-
> > >   test/unittest/funcs/err.badalloca.r.p         | 12 +++++-
> > >   test/unittest/funcs/err.link_ntopbadaddr.r    |  2 +-
> > >   test/unittest/funcs/err.link_ntopbadarg.r     |  2 +-
> > >   .../inet_ntoa6/err.inet_ntoa6.arg1_null.r     |  2 +-
> > >   .../err.inet_ntoa6.arg1_null_const.r          |  2 +-
> > >   test/unittest/funcs/strlen/tst.null.r         |  2 +-
> > >   test/unittest/funcs/strtok/tst.strtok_null.r  |  2 +-
> > >   .../funcs/strtok/tst.strtok_nulldel.r         |  2 +-
> > >   .../funcs/strtok/tst.strtok_nullstr.r         |  2 +-
> > >   .../funcs/strtok/tst.strtok_nullstr2.r        |  2 +-
> > >   .../funcs/substr/err.substr_null_arg1.r       |  2 +-
> > >   test/unittest/pointers/err.AllocaOverrun.r    |  2 +-
> > >   test/unittest/pointers/err.BadAlign.r         |  2 +-
> > >   test/unittest/pointers/err.InvalidAddress2.r  |  2 +-
> > >   test/unittest/pointers/err.InvalidAddress4.r  |  2 +-
> > >   .../speculation/err.CommitWithInvalid.r       |  2 +-
> > >   .../speculation/err.DiscardWithInvalid.r      |  2 +-
> > >   .../speculation/tst.SpecSizeVariations.r      | 22 ----------
> > >   .../speculation/tst.SpecSizeVariations.sh     |  2 +-
> > >   test/unittest/speculation/tst.negcommit.r     |  2 +-
> > >   86 files changed, 169 insertions(+), 148 deletions(-)
> > > 
> > > diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> > > index a0c04f3a..5673c94b 100644
> > > --- a/bpf/get_bvar.c
> > > +++ b/bpf/get_bvar.c
> > > @@ -48,8 +48,10 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
> > >   			mst->tstamp = bpf_ktime_get_ns();
> > >   		return mst->tstamp;
> > > -	case DIF_VAR_EPID:
> > > -		return mst->epid;
> > > +	case DIF_VAR_EPID: {
> > > +		uint64_t val = mst->prid;
> > > +		return (val << 32) | mst->epid;
> > > +	}
> > >   	case DIF_VAR_ID:
> > >   		return mst->prid;
> > >   	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
> > > diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> > > index a6616c2f..c8b21d7c 100644
> > > --- a/bpf/probe_error.c
> > > +++ b/bpf/probe_error.c
> > > @@ -31,7 +31,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
> > >   	int		oldprid = mst->prid;
> > >   	mst->argv[0] = 0;
> > > -	mst->argv[1] = mst->epid;
> > > +	mst->argv[1] = (((uint64_t)mst->prid) << 32) | mst->epid;
> > >   	mst->argv[2] = mst->clid;
> > >   	mst->argv[3] = pc;
> > >   	mst->argv[4] = fault;
> > > diff --git a/include/dtrace/universal.h b/include/dtrace/universal.h
> > > index d6562489..655ea772 100644
> > > --- a/include/dtrace/universal.h
> > > +++ b/include/dtrace/universal.h
> > > @@ -37,7 +37,7 @@ typedef uint16_t	dtrace_actkind_t;	/* action kind */
> > >   typedef uint32_t	dtrace_aggid_t;		/* aggregation identifier */
> > >   typedef uint32_t	dtrace_cacheid_t;	/* predicate cache identifier */
> > > -typedef uint32_t	dtrace_epid_t;		/* enabled probe identifier */
> > > +typedef uint64_t	dtrace_epid_t;		/* enabled probe identifier */
> > >   typedef uint32_t	dtrace_optid_t;		/* option identifier */
> > >   typedef uint32_t	dtrace_specid_t;	/* speculation identifier */
> > > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > > index 71c6a446..428cb407 100644
> > > --- a/libdtrace/dt_bpf.c
> > > +++ b/libdtrace/dt_bpf.c
> > > @@ -778,7 +778,6 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
> > >    * The size of the memory region is the sum of:
> > >    *	- size of the DTrace machine state, rounded up to the nearest
> > >    *	  multiple of 8
> > > - *	- 8 bytes padding for trace buffer alignment purposes
> > >    *	- maximum trace buffer record size, rounded up to the nearest
> > >    *	  multiple of 8
> > >    *	- size of dctx->mem (see dt_dctx.h)
> > > @@ -787,7 +786,6 @@ static int
> > >   gmap_create_mem(dtrace_hdl_t *dtp)
> > >   {
> > >   	size_t	sz = roundup(sizeof(dt_mstate_t), 8) +
> > > -		     8 +
> > >   		     roundup(dtp->dt_maxreclen, 8) +
> > >   		     DMEM_SIZE(dtp);
> > > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > > index 2fb2d0d8..d27a8cb2 100644
> > > --- a/libdtrace/dt_cg.c
> > > +++ b/libdtrace/dt_cg.c
> > > @@ -275,15 +275,9 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
> > >   	 *	buf = rc + roundup(sizeof(dt_mstate_t), 8);
> > >   	 *				// add %r0, roundup(
> > >   	 *						sizeof(dt_mstate_t), 8)
> > > -	 *	*((uint64_t *)&buf[0]) = 0;
> > > -	 *				// stdw [%r0 + 0], 0
> > > -	 *	buf += 8;		// add %r0, 8
> > > -	 *				//     (%r0 = pointer to buffer space)
> > >   	 *	dctx.buf = buf;		// stdw [%r9 + DCTX_BUF], %r0
> > >   	 */
> > >   	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, roundup(sizeof(dt_mstate_t), 8)));
> > > -	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, 0, 0));
> > > -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, 8));
> > >   	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, DCTX_BUF, BPF_REG_0));
> > >   	/*
> > > @@ -1094,8 +1088,6 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
> > >   	 *	dctx->mst->specsize = 0;// stdw [%r0 + DMST_SPECSIZE], 0
> > >   	 *	dctx->mst->epid = EPID;	// stw [%r0 + DMST_EPID], EPID
> > >   	 *	dctx->mst->clid = CLID;	// stw [%r0 + DMST_CLID], CLID
> > > -	 *	*((uint32_t *)&buf[DBUF_EPID]) = EPID;
> > > -	 *				// stw [%r9 + DBUF_EPID], EPID
> > >   	 */
> > >   	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
> > >   	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_FAULT, 0));
> > > @@ -1103,7 +1095,13 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
> > >   	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_SPECSIZE, 0));
> > >   	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_EPID, -1), epid);
> > >   	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_CLID, -1), clid);
> > > -	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_EPID, -1), epid);
> > > +
> > > +	/*
> > > +	 *	Zero out the leading 4 bytes of the buffer.
> > > +	 *	*((uint32_t *)&buf[DBUF_PAD]) = 0;
> > > +	 *				// stw [%r9 + DBUF_PAD], 0
> > > +	 */
> > > +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_PAD, 0));
> > >   	/*
> > >   	 *	Set the speculation ID field to zero to indicate no active
> > > @@ -1113,6 +1111,18 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
> > >   	 */
> > >   	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_SPECID, 0));
> > > +	/*
> > > +	 *	*((uint64_t *)&buf[DBUF_EPID]) = (dctx->mst->prid << 32) | EPID;
> > > +	 *				// ld %r1, [%r0 + DMST_PRID]
> > > +	 *				// lsh %r1, 32
> > > +	 *				// or %r1, epid
> > > +	 *				// stdw [%r9 + DBUF_EPID], %r1
> > > +	 */
> > > +	emit (dlp, BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, DMST_PRID));
> > > +	emit (dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_1, 32));
> > > +	emite(dlp, BPF_ALU64_IMM(BPF_OR, BPF_REG_1, -1), epid);
> > > +	emit (dlp, BPF_STORE(BPF_DW, BPF_REG_9, DBUF_EPID, BPF_REG_1));
> > > +
> > >   	/*
> > >   	 * If there is a predicate:
> > >   	 *
> > > @@ -1131,10 +1141,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
> > >   	TRACE_REGSET("Prologue: End  ");
> > >   	/*
> > > -	 * Account for 32-bit EPID (at offset 0) and 32-bit speculation ID (at
> > > -	 * offset 4).
> > > +	 * Set the offset for the beginning of trace data.
> > >   	 */
> > > -	pcb->pcb_bufoff += 2 * sizeof(uint32_t);
> > > +	pcb->pcb_bufoff = DBUF_DATA;
> > >   }
> > >   /*
> > > @@ -1169,15 +1178,15 @@ dt_cg_epilogue(dt_pcb_t *pcb)
> > >   		/*
> > >   		 *	rc = bpf_perf_event_output(dctx->ctx, &buffers,
> > >   		 *				   BPF_F_CURRENT_CPU,
> > > -		 *				   buf - 4, bufoff + 4);
> > > +		 *				   buf + 4, bufoff - 4);
> > >   		 *				// lddw %r1, [%fp + DT_STK_DCTX]
> > >   		 *				// lddw %r1, [%r1 + DCTX_CTX]
> > >   		 *				// lddw %r2, &buffers
> > >   		 *				// lddw %r3, BPF_F_CURRENT_CPU
> > >   		 *				// mov %r4, %r9
> > > -		 *				// add %r4, -4
> > > +		 *				// add %r4, 4
> > >   		 *				// mov %r5, pcb->pcb_bufoff
> > > -		 *				// add %r5, 4
> > > +		 *				// add %r5, -4
> > >   		 *				// call bpf_perf_event_output
> > >   		 */
> > >   		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_FP, DT_STK_DCTX));
> > > @@ -1185,9 +1194,9 @@ dt_cg_epilogue(dt_pcb_t *pcb)
> > >   		dt_cg_xsetx(dlp, buffers, DT_LBL_NONE, BPF_REG_2, buffers->di_id);
> > >   		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_3, BPF_F_CURRENT_CPU);
> > >   		emit(dlp, BPF_MOV_REG(BPF_REG_4, BPF_REG_9));
> > > -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, -4));
> > > +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, 4));
> > >   		emit(dlp, BPF_MOV_IMM(BPF_REG_5, pcb->pcb_bufoff));
> > > -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, 4));
> > > +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, -4));
> > >   		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_perf_event_output));
> > >   		/*
> > > diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> > > index 7dfec72f..adbd2c7f 100644
> > > --- a/libdtrace/dt_consume.c
> > > +++ b/libdtrace/dt_consume.c
> > > @@ -14,9 +14,11 @@
> > >   #include <ctype.h>
> > >   #include <alloca.h>
> > >   #include <dt_impl.h>
> > > +#include <dt_dctx.h>
> > >   #include <dt_module.h>
> > >   #include <dt_pcap.h>
> > >   #include <dt_peb.h>
> > > +#include <dt_probe.h>
> > >   #include <dt_state.h>
> > >   #include <dt_string.h>
> > >   #include <libproc.h>
> > > @@ -478,7 +480,7 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
> > >   	 */
> > >   	if (flow == DTRACEFLOW_ENTRY) {
> > >   		if (last != DTRACE_EPIDNONE && id != last &&
> > > -		    pd->id == dtp->dt_pdesc[last]->id)
> > > +		    pd->id == dtp->dt_probes[last >> 32]->desc->id)
> > >   			flow = DTRACEFLOW_NONE;
> > >   	}
> > > @@ -2202,19 +2204,23 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
> > >   		     int peekflags, dtrace_epid_t *last, int committing,
> > >   		     void *arg)
> > >   {
> > > +	int			specid;
> > >   	dtrace_epid_t		epid;
> > > +	uint32_t		prid;
> > >   	dtrace_datadesc_t	*epd;
> > >   	dt_spec_buf_t		tmpl;
> > >   	dt_spec_buf_t		*dtsb;
> > > -	int			specid;
> > >   	int			i;
> > >   	int			rval;
> > >   	dtrace_workstatus_t	ret;
> > >   	int			commit_discard_seen, only_commit_discards;
> > >   	int			data_recording = 1;
> > > -	epid = ((uint32_t *)data)[0];
> > > -	specid = ((uint32_t *)data)[1];
> > > +	specid = *((uint32_t *)(data + DBUF_SPECID));
> > > +	epid = *((uint64_t *)(data + DBUF_EPID));
> > > +	prid = epid >> 32;
> > > +	if (prid > dtp->dt_probe_id)
> > > +		return dt_set_errno(dtp, EDT_BADEPID);
> > >   	/*
> > >   	 * Fill in the epid and address of the epid in the buffer.  We need to
> > > @@ -2227,6 +2233,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
> > >   					 &pdat->dtpda_pdesc);
> > >   	if (rval != 0)
> > >   		return dt_set_errno(dtp, EDT_BADEPID);
> > > +	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
> > >   	epd = pdat->dtpda_ddesc;
> > >   	if (epd->dtdd_uarg != DT_ECB_DEFAULT) {
> > > @@ -2661,9 +2668,8 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
> > >   		 * struct {
> > >   		 *	struct perf_event_header	header;
> > >   		 *	uint32_t			size;
> > > -		 *	uint32_t			pad;
> > > -		 *	uint32_t			epid;
> > >   		 *	uint32_t			specid;
> > > +		 *	dtrace_epid_t			epid;
> > >   		 *	uint64_t			data[n];
> > >   		 * }
> > >   		 * and 'data' points to the 'size' member at this point.
> > > @@ -2673,13 +2679,17 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
> > >   			return dt_set_errno(dtp, EDT_DSIZE);
> > >   		size = *(uint32_t *)data;
> > > -		data += sizeof(size);
> > >   		ptr += sizeof(size) + size;
> > >   		if (ptr != buf + hdr->size)
> > >   			return dt_set_errno(dtp, EDT_DSIZE);
> > > -		data += sizeof(uint32_t);		/* skip padding */
> > > -		size -= sizeof(uint32_t);
> > > +		/*
> > > +		 * The "size" measures from specid to the end.  But our buffer
> > > +		 * offsets are relative to &size itself, to preserve 8-byte
> > > +		 * alignment.  So, we leave data pointing at size, and we increase
> > > +		 * size by 4 bytes.
> > > +		 */
> > > +		size += 4;
> > >   		return dt_consume_one_probe(dtp, fp, data, size, pdat, efunc,
> > >   					    rfunc, flow, quiet, peekflags,
> > > diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> > > index 1422ad24..6d38b0c2 100644
> > > --- a/libdtrace/dt_dctx.h
> > > +++ b/libdtrace/dt_dctx.h
> > > @@ -82,16 +82,20 @@ typedef struct dt_dctx {
> > >    * The dctx->buf pointer references a block of memory that contains:
> > >    *
> > >    *                       +----------------+
> > > - *                  0 -> | EPID           |
> > > + *                  0 -> | pad            |
> > >    *                       +----------------+
> > > - *		    4 -> | Speculation ID |
> > > + *                  4 -> | Speculation ID |
> > >    *                       +----------------+
> > > - *                       | Trace Data     |
> > > + *                  8 -> | EPID           |
> > > + *                       +----------------+
> > > + *                 16 -> | Trace Data     |
> > >    *                       |      ...       |
> > >    *                       +----------------+
> > >    */
> > > -#define DBUF_EPID	0
> > > +#define DBUF_PAD	0
> > >   #define DBUF_SPECID	4
> > > +#define DBUF_EPID	8
> > > +#define DBUF_DATA	16
> > >   /*
> > >    * The dctx->mem pointer references a block of memory that contains:
> > > diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
> > > index 4c9b9413..b1ba5f9f 100644
> > > --- a/libdtrace/dt_handle.c
> > > +++ b/libdtrace/dt_handle.c
> > > @@ -14,6 +14,7 @@
> > >   #include <alloca.h>
> > >   #include <dt_impl.h>
> > > +#include <dt_probe.h>
> > >   #include <dt_program.h>
> > >   static const char _dt_errprog[] =
> > > @@ -147,11 +148,11 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
> > >   	 * This is an error.  We have the following items here:  EPID,
> > >   	 * faulting action, BPF pc, fault code and faulting address.
> > >   	 */
> > > -	epid = (uint32_t)DT_REC(uint64_t, 0);
> > > +	epid = DT_REC(uint64_t, 0);
> > >   	if (dt_epid_lookup(dtp, epid, &errdd, &errpd) != 0)
> > >   		return dt_set_errno(dtp, EDT_BADERROR);
> > > -
> > > +	errpd = (dtrace_probedesc_t *)dtp->dt_probes[epid>>32]->desc;
> > >   	err.dteda_ddesc = errdd;
> > >   	err.dteda_pdesc = errpd;
> > >   	err.dteda_cpu = data->dtpda_cpu;
> > > @@ -195,7 +196,7 @@ no_addr:
> > >   		details[0] = 0;
> > >   	}
> > > -	snprintf(str, len, "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): "
> > > +	snprintf(str, len, "error on enabled probe ID %lu (ID %u: %s:%s:%s:%s): "
> > >   			   "%s%s in %s%s",
> > >   		 epid, errpd->id, errpd->prv, errpd->mod, errpd->fun,
> > >   		 errpd->prb, dtrace_faultstr(dtp, err.dteda_fault), details,
> > > @@ -256,7 +257,7 @@ dt_handle_liberr(dtrace_hdl_t *dtp, const dtrace_probedata_t *data,
> > >   	str = alloca(len);
> > >   	snprintf(str, len,
> > > -		 "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): %s",
> > > +		 "error on enabled probe ID %lu (ID %u: %s:%s:%s:%s): %s",
> > >   		 data->dtpda_epid, errpd->id, errpd->prv, errpd->mod,
> > >   		 errpd->fun, errpd->prb, faultstr);
> > > diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
> > > index c685274d..fe6194a7 100644
> > > --- a/libdtrace/dt_map.c
> > > +++ b/libdtrace/dt_map.c
> > > @@ -137,6 +137,9 @@ int
> > >   dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
> > >   	       dtrace_probedesc_t **pdp)
> > >   {
> > > +	/* Remove the PRID portion of the EPID. */
> > > +	epid &= 0xffffffff;
> > > +
> > >   	if (epid >= dtp->dt_maxprobe ||
> > >   	    dtp->dt_ddesc[epid] == NULL || dtp->dt_pdesc[epid] == NULL)
> > >   		return -1;
> > > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > > index 5c922488..0550379f 100644
> > > --- a/libdtrace/dt_open.c
> > > +++ b/libdtrace/dt_open.c
> > > @@ -169,7 +169,7 @@ static const dt_ident_t _dtrace_globals[] = {
> > >   { "discard", DT_IDENT_ACTFUNC, 0, DT_ACT_DISCARD, DT_ATTR_STABCMN, DT_VERS_1_0,
> > >   	&dt_idops_func, "void(int)" },
> > >   { "epid", DT_IDENT_SCALAR, 0, DIF_VAR_EPID, DT_ATTR_STABCMN, DT_VERS_1_0,
> > > -	&dt_idops_type, "uint_t" },
> > > +	&dt_idops_type, "uint64_t" },
> > >   { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
> > >   	&dt_idops_type, "int" },
> > >   { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
> > > diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
> > > index d3904f47..2504e793 100644
> > > --- a/test/demo/dtrace/error.r
> > > +++ b/test/demo/dtrace/error.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/stress/buffering/tst.resize3-manual.r b/test/stress/buffering/tst.resize3-manual.r
> > > index 43b647c7..25819f15 100644
> > > --- a/test/stress/buffering/tst.resize3-manual.r
> > > +++ b/test/stress/buffering/tst.resize3-manual.r
> > > @@ -1,5 +1,5 @@
> > >                      FUNCTION:NAME
> > > -                          :BEGIN           3
> > > +                          :BEGIN            4294967299
> > >                             :BEGIN
> > >   -- @@stderr --
> > > diff --git a/test/stress/buffering/tst.resize3.r b/test/stress/buffering/tst.resize3.r
> > > index 9c471158..5e6afe81 100644
> > > --- a/test/stress/buffering/tst.resize3.r
> > > +++ b/test/stress/buffering/tst.resize3.r
> > > @@ -1,5 +1,5 @@
> > >                      FUNCTION:NAME
> > > -                          :BEGIN           3
> > > +                          :BEGIN            4294967299
> > >                             :BEGIN
> > >   -- @@stderr --
> > > diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
> > > index 29e39fd4..b1c6d148 100644
> > > --- a/test/unittest/actions/setopt/tst.badopt.r
> > > +++ b/test/unittest/actions/setopt/tst.badopt.r
> > > @@ -1,16 +1,16 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > > +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
> > > +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
> > > +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
> > > +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
> > > +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
> > > +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
> > > +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
> > > diff --git a/test/unittest/arrays/tst.declared-bounds.runtime_out.r b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
> > > index 4917528d..fa6e3b73 100644
> > > --- a/test/unittest/arrays/tst.declared-bounds.runtime_out.r
> > > +++ b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
> > > @@ -1,3 +1,3 @@
> > >   expected run-time error
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): index out of bounds (8) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): index out of bounds (8) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.deref_0.r b/test/unittest/codegen/err.deref_0.r
> > > index 07c1dc52..ef71d557 100644
> > > --- a/test/unittest/codegen/err.deref_0.r
> > > +++ b/test/unittest/codegen/err.deref_0.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.deref_1.r b/test/unittest/codegen/err.deref_1.r
> > > index a2ca8ac4..11bf0b20 100644
> > > --- a/test/unittest/codegen/err.deref_1.r
> > > +++ b/test/unittest/codegen/err.deref_1.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.deref_i0.r b/test/unittest/codegen/err.deref_i0.r
> > > index 07c1dc52..ef71d557 100644
> > > --- a/test/unittest/codegen/err.deref_i0.r
> > > +++ b/test/unittest/codegen/err.deref_i0.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.deref_i1.r b/test/unittest/codegen/err.deref_i1.r
> > > index a2ca8ac4..11bf0b20 100644
> > > --- a/test/unittest/codegen/err.deref_i1.r
> > > +++ b/test/unittest/codegen/err.deref_i1.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.deref_string-assoc.r b/test/unittest/codegen/err.deref_string-assoc.r
> > > index 08277992..b047a341 100644
> > > --- a/test/unittest/codegen/err.deref_string-assoc.r
> > > +++ b/test/unittest/codegen/err.deref_string-assoc.r
> > > @@ -1,3 +1,3 @@
> > >   66
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.deref_string-gvar.r b/test/unittest/codegen/err.deref_string-gvar.r
> > > index 08277992..b047a341 100644
> > > --- a/test/unittest/codegen/err.deref_string-gvar.r
> > > +++ b/test/unittest/codegen/err.deref_string-gvar.r
> > > @@ -1,3 +1,3 @@
> > >   66
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.deref_string-lvar.r b/test/unittest/codegen/err.deref_string-lvar.r
> > > index 08277992..b047a341 100644
> > > --- a/test/unittest/codegen/err.deref_string-lvar.r
> > > +++ b/test/unittest/codegen/err.deref_string-lvar.r
> > > @@ -1,3 +1,3 @@
> > >   66
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.deref_string-tvar.r b/test/unittest/codegen/err.deref_string-tvar.r
> > > index 08277992..b047a341 100644
> > > --- a/test/unittest/codegen/err.deref_string-tvar.r
> > > +++ b/test/unittest/codegen/err.deref_string-tvar.r
> > > @@ -1,3 +1,3 @@
> > >   66
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
> > > +++ b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
> > > +++ b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
> > > +++ b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/codegen/err.str_NULL_plus_offset.r b/test/unittest/codegen/err.str_NULL_plus_offset.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/codegen/err.str_NULL_plus_offset.r
> > > +++ b/test/unittest/codegen/err.str_NULL_plus_offset.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/disasm/tst.vartab-bvar.r b/test/unittest/disasm/tst.vartab-bvar.r
> > > index 06d7c52b..53e5f618 100644
> > > --- a/test/unittest/disasm/tst.vartab-bvar.r
> > > +++ b/test/unittest/disasm/tst.vartab-bvar.r
> > > @@ -4,7 +4,7 @@ curthread               scl glb r    D type (pointer) (size 8)
> > >   timestamp               scl glb r    D type (integer) (size 8)
> > >   vtimestamp              scl glb r    D type (integer) (size 8)
> > >   ipl                     scl glb r    D type (integer) (size 4)
> > > -epid                    scl glb r    D type (integer) (size 4)
> > > +epid                    scl glb r    D type (integer) (size 8)
> > >   id                      scl glb r    D type (integer) (size 4)
> > >   arg0                    scl glb r    D type (integer) (size 8)
> > >   arg1                    scl glb r    D type (integer) (size 8)
> > > diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
> > > +++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
> > > index b9f5f43c..5556955d 100644
> > > --- a/test/unittest/error/tst.DTRACEFLT_BADADDR.r
> > > +++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
> > > @@ -1,6 +1,6 @@
> > > -The arguments are 3 1 1 0
> > > +The arguments are 4294967299 1 1 0
> > >   The value of arg4 should be 1
> > >   The value of arg5 should be 0
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
> > > index e6d6afa2..80cd485b 100644
> > > --- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
> > > +++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
> > > index e6d6afa2..80cd485b 100644
> > > --- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
> > > +++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > > index 1e4fdd64..31752a9e 100644
> > > --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > > +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> > > @@ -1,5 +1,5 @@
> > > -The arguments are 3 1 PC 1 64
> > > +The arguments are 4294967299 1 PC 1 64
> > >   The value of arg4 = 0
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/error/tst.clause_scope-begin-ended.r b/test/unittest/error/tst.clause_scope-begin-ended.r
> > > index 8d57382e..7c88b227 100644
> > > --- a/test/unittest/error/tst.clause_scope-begin-ended.r
> > > +++ b/test/unittest/error/tst.clause_scope-begin-ended.r
> > > @@ -2,4 +2,4 @@ Error fired
> > >   Clause executed
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/error/tst.clause_scope-begin.r b/test/unittest/error/tst.clause_scope-begin.r
> > > index 8d57382e..7c88b227 100644
> > > --- a/test/unittest/error/tst.clause_scope-begin.r
> > > +++ b/test/unittest/error/tst.clause_scope-begin.r
> > > @@ -2,4 +2,4 @@ Error fired
> > >   Clause executed
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/error/tst.clause_scope-regular.r.p b/test/unittest/error/tst.clause_scope-regular.r.p
> > > index 7659601b..8117b8ab 100755
> > > --- a/test/unittest/error/tst.clause_scope-regular.r.p
> > > +++ b/test/unittest/error/tst.clause_scope-regular.r.p
> > > @@ -1,3 +1,11 @@
> > > -#!/bin/sed -f
> > > +#!/usr/bin/awk -f
> > > +
> > >   # This report has a variable probe ID in it.
> > > -s/ID [0-9][0-9]*: profile/ID nnn: profile/
> > > +/^dtrace: error on enabled probe ID / {
> > > +    $7 = and($7, 0xffffffff);    # mask out the high 32 bits (variable prid)
> > > +}
> > > +
> > > +{
> > > +    sub("ID [0-9][0-9]*: profile", "ID nnn: profile");
> > > +    print;
> > > +}
> > > diff --git a/test/unittest/error/tst.error.r b/test/unittest/error/tst.error.r
> > > index 0d29bcc8..82c6da2d 100644
> > > --- a/test/unittest/error/tst.error.r
> > > +++ b/test/unittest/error/tst.error.r
> > > @@ -1,4 +1,4 @@
> > >   Error fired
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/error/tst.errorend.r b/test/unittest/error/tst.errorend.r
> > > index 73abf697..17cbee17 100644
> > > --- a/test/unittest/error/tst.errorend.r
> > > +++ b/test/unittest/error/tst.errorend.r
> > > @@ -2,4 +2,4 @@ Error fired
> > >   End fired after exit
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
> > > index 4257f567..9638fa5b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
> > > index f5ff855d..35cf68b1 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref.r b/test/unittest/funcs/alloca/err.alloca-null-deref.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-null-deref.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-null-deref.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
> > > index 4257f567..9638fa5b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
> > > +++ b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/bcopy/err.badbcopy1.r b/test/unittest/funcs/bcopy/err.badbcopy1.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/bcopy/err.badbcopy1.r
> > > +++ b/test/unittest/funcs/bcopy/err.badbcopy1.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/bcopy/err.badbcopy4.r b/test/unittest/funcs/bcopy/err.badbcopy4.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/bcopy/err.badbcopy4.r
> > > +++ b/test/unittest/funcs/bcopy/err.badbcopy4.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/bcopy/err.badbcopy5.r b/test/unittest/funcs/bcopy/err.badbcopy5.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/bcopy/err.badbcopy5.r
> > > +++ b/test/unittest/funcs/bcopy/err.badbcopy5.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/bcopy/err.badbcopy6.r b/test/unittest/funcs/bcopy/err.badbcopy6.r
> > > index 4257f567..9638fa5b 100644
> > > --- a/test/unittest/funcs/bcopy/err.badbcopy6.r
> > > +++ b/test/unittest/funcs/bcopy/err.badbcopy6.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/bcopy/err.badbcopy7.r b/test/unittest/funcs/bcopy/err.badbcopy7.r
> > > index 4257f567..9638fa5b 100644
> > > --- a/test/unittest/funcs/bcopy/err.badbcopy7.r
> > > +++ b/test/unittest/funcs/bcopy/err.badbcopy7.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/bcopy/err.badbcopy8.r b/test/unittest/funcs/bcopy/err.badbcopy8.r
> > > index 4257f567..9638fa5b 100644
> > > --- a/test/unittest/funcs/bcopy/err.badbcopy8.r
> > > +++ b/test/unittest/funcs/bcopy/err.badbcopy8.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/copyin/err.badaddr.r b/test/unittest/funcs/copyin/err.badaddr.r
> > > index ba4a4695..dadaa45b 100644
> > > --- a/test/unittest/funcs/copyin/err.badaddr.r
> > > +++ b/test/unittest/funcs/copyin/err.badaddr.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/copyin/err.badaddr.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/copyin/err.null_arg1.r b/test/unittest/funcs/copyin/err.null_arg1.r
> > > index a806d107..c0739a4d 100644
> > > --- a/test/unittest/funcs/copyin/err.null_arg1.r
> > > +++ b/test/unittest/funcs/copyin/err.null_arg1.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/copyin/err.null_arg1.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/copyinstr/err.badaddr.r b/test/unittest/funcs/copyinstr/err.badaddr.r
> > > index 0f566d6e..76861803 100644
> > > --- a/test/unittest/funcs/copyinstr/err.badaddr.r
> > > +++ b/test/unittest/funcs/copyinstr/err.badaddr.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/copyinstr/err.badaddr.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/copyinstr/err.null_arg1.r b/test/unittest/funcs/copyinstr/err.null_arg1.r
> > > index cdd7c22c..074882e0 100644
> > > --- a/test/unittest/funcs/copyinstr/err.null_arg1.r
> > > +++ b/test/unittest/funcs/copyinstr/err.null_arg1.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/copyinstr/err.null_arg1.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/copyinto/err.badaddr.r b/test/unittest/funcs/copyinto/err.badaddr.r
> > > index 11861e1f..9c2e65c2 100644
> > > --- a/test/unittest/funcs/copyinto/err.badaddr.r
> > > +++ b/test/unittest/funcs/copyinto/err.badaddr.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/copyinto/err.badaddr.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/copyinto/err.badsize.r b/test/unittest/funcs/copyinto/err.badsize.r
> > > index ec4b062e..7e99c307 100644
> > > --- a/test/unittest/funcs/copyinto/err.badsize.r
> > > +++ b/test/unittest/funcs/copyinto/err.badsize.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/copyinto/err.badsize.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/copyinto/err.null_arg1.r b/test/unittest/funcs/copyinto/err.null_arg1.r
> > > index f568ee5c..7c1fa9e0 100644
> > > --- a/test/unittest/funcs/copyinto/err.null_arg1.r
> > > +++ b/test/unittest/funcs/copyinto/err.null_arg1.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/copyinto/err.null_arg1.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/err.badalloca.r.p b/test/unittest/funcs/err.badalloca.r.p
> > > index d7a88a39..15f99035 100755
> > > --- a/test/unittest/funcs/err.badalloca.r.p
> > > +++ b/test/unittest/funcs/err.badalloca.r.p
> > > @@ -1,3 +1,11 @@
> > > -#!/bin/sed -f
> > > +#!/usr/bin/awk -f
> > > -s/(ID [0-9]*/(ID NNN/g
> > > +# This report has a variable probe ID in it.
> > > +/^dtrace: error on enabled probe ID / {
> > > +    $7 = and($7, 0xffffffff);    # mask out the high 32 bits (variable prid)
> > > +}
> > > +
> > > +{
> > > +    sub("ID [0-9]*: profile", "ID NNN: profile");
> > > +    print;
> > > +}
> > > diff --git a/test/unittest/funcs/err.link_ntopbadaddr.r b/test/unittest/funcs/err.link_ntopbadaddr.r
> > > index b798b5e0..f0973529 100644
> > > --- a/test/unittest/funcs/err.link_ntopbadaddr.r
> > > +++ b/test/unittest/funcs/err.link_ntopbadaddr.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/err.link_ntopbadarg.r b/test/unittest/funcs/err.link_ntopbadarg.r
> > > index e386a67c..3c677e9f 100644
> > > --- a/test/unittest/funcs/err.link_ntopbadarg.r
> > > +++ b/test/unittest/funcs/err.link_ntopbadarg.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
> > > +++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
> > > +++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/strlen/tst.null.r b/test/unittest/funcs/strlen/tst.null.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/strlen/tst.null.r
> > > +++ b/test/unittest/funcs/strlen/tst.null.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/strtok/tst.strtok_null.r b/test/unittest/funcs/strtok/tst.strtok_null.r
> > > index 03226aa1..4c51c5e9 100644
> > > --- a/test/unittest/funcs/strtok/tst.strtok_null.r
> > > +++ b/test/unittest/funcs/strtok/tst.strtok_null.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/strtok/tst.strtok_null.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/strtok/tst.strtok_nulldel.r b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
> > > index 70f8e4e2..2ab9938d 100644
> > > --- a/test/unittest/funcs/strtok/tst.strtok_nulldel.r
> > > +++ b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nulldel.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr.r b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
> > > index a57b2469..be5ffe14 100644
> > > --- a/test/unittest/funcs/strtok/tst.strtok_nullstr.r
> > > +++ b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
> > > index d7df3aca..6c6fe35a 100644
> > > --- a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
> > > +++ b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
> > > @@ -4,4 +4,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr2.d' matched 4 probes
> > > -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
> > > diff --git a/test/unittest/funcs/substr/err.substr_null_arg1.r b/test/unittest/funcs/substr/err.substr_null_arg1.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/funcs/substr/err.substr_null_arg1.r
> > > +++ b/test/unittest/funcs/substr/err.substr_null_arg1.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/pointers/err.AllocaOverrun.r b/test/unittest/pointers/err.AllocaOverrun.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/pointers/err.AllocaOverrun.r
> > > +++ b/test/unittest/pointers/err.AllocaOverrun.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/pointers/err.BadAlign.r b/test/unittest/pointers/err.BadAlign.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/pointers/err.BadAlign.r
> > > +++ b/test/unittest/pointers/err.BadAlign.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/pointers/err.InvalidAddress2.r b/test/unittest/pointers/err.InvalidAddress2.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/pointers/err.InvalidAddress2.r
> > > +++ b/test/unittest/pointers/err.InvalidAddress2.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/pointers/err.InvalidAddress4.r b/test/unittest/pointers/err.InvalidAddress4.r
> > > index 187543b6..64a3861b 100644
> > > --- a/test/unittest/pointers/err.InvalidAddress4.r
> > > +++ b/test/unittest/pointers/err.InvalidAddress4.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> > > diff --git a/test/unittest/speculation/err.CommitWithInvalid.r b/test/unittest/speculation/err.CommitWithInvalid.r
> > > index fc072417..e8a71c29 100644
> > > --- a/test/unittest/speculation/err.CommitWithInvalid.r
> > > +++ b/test/unittest/speculation/err.CommitWithInvalid.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
> > > diff --git a/test/unittest/speculation/err.DiscardWithInvalid.r b/test/unittest/speculation/err.DiscardWithInvalid.r
> > > index fc072417..e8a71c29 100644
> > > --- a/test/unittest/speculation/err.DiscardWithInvalid.r
> > > +++ b/test/unittest/speculation/err.DiscardWithInvalid.r
> > > @@ -1,3 +1,3 @@
> > >   -- @@stderr --
> > > -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
> > > diff --git a/test/unittest/speculation/tst.SpecSizeVariations.r b/test/unittest/speculation/tst.SpecSizeVariations.r
> > > index 51f0596c..2748b307 100644
> > > --- a/test/unittest/speculation/tst.SpecSizeVariations.r
> > > +++ b/test/unittest/speculation/tst.SpecSizeVariations.r
> > > @@ -11,26 +11,6 @@ Speculative buffer ID: 1
> > >   123456706
> > >   counts: 1 1
> > > -Speculative buffer ID: 1
> > > -123456700
> > > -123456701
> > > -123456702
> > > -123456703
> > > -123456704
> > > -123456705
> > > -123456706
> > > -counts: 1 1
> > > -
> > > -Speculative buffer ID: 1
> > > -123456700
> > > -123456701
> > > -123456702
> > > -123456703
> > > -123456704
> > > -123456705
> > > -123456706
> > > -counts: 2 1
> > > -
> > >   Speculative buffer ID: 1
> > >   123456700
> > >   123456701
> > > @@ -64,5 +44,3 @@ counts: 2 1
> > >   dtrace: 2 speculative drops
> > >   dtrace: 1 speculative drop
> > >   dtrace: 1 speculative drop
> > > -dtrace: 1 speculative drop
> > > -dtrace: 1 speculative drop
> > > diff --git a/test/unittest/speculation/tst.SpecSizeVariations.sh b/test/unittest/speculation/tst.SpecSizeVariations.sh
> > > index 75e527d9..79995b59 100755
> > > --- a/test/unittest/speculation/tst.SpecSizeVariations.sh
> > > +++ b/test/unittest/speculation/tst.SpecSizeVariations.sh
> > > @@ -9,7 +9,7 @@
> > >   dtrace=$1
> > > -for x in 63 64 79 80 143 144; do
> > > +for x in 71 72 159 160; do
> > >   	$dtrace $dt_flags -xspecsize=$x -qn '
> > >   	BEGIN
> > >   	{
> > > diff --git a/test/unittest/speculation/tst.negcommit.r b/test/unittest/speculation/tst.negcommit.r
> > > index 69f246a0..29a3a538 100644
> > > --- a/test/unittest/speculation/tst.negcommit.r
> > > +++ b/test/unittest/speculation/tst.negcommit.r
> > > @@ -3,4 +3,4 @@
> > >   -- @@stderr --
> > >   dtrace: script 'test/unittest/speculation/tst.negcommit.d' matched 2 probes
> > > -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
> > > +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
> > > -- 
> > > 2.43.5
> > > 
> > > 
> > > _______________________________________________
> > > DTrace-devel mailing list
> > > DTrace-devel@oss.oracle.com
> > > https://oss.oracle.com/mailman/listinfo/dtrace-devel
