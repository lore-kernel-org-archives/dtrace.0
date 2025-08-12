Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A81285C81
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755007583; cv=fail; b=mFR138AtGB497Ol0V0RkyurbMevwPwJkqEGqmnRvNENjR4Oh6ekIOo7HFenE4+1NzkS2OCbYeR+prKwCO7xJfEMu696PIWmJ+fsl0uQHZ4/N+tTxKCYsBztRfhSPQzhnJIxBUAYUzkoAEz04Iy40DR56s+5DpNWr3F62xrCzNHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755007583; c=relaxed/simple;
	bh=8ps+lTSnNp9uIzc93qeFMrlaFMCA9V7I17HkbpYafJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n564X11IIz3mn5esGAh6H8aVATdaytLYrduTTw6gjwQLkpCDsNv2xGOtOtTPS1ZExZV4nks5+RSqM0p0OPip3lNj0ZTxcGoCayYNlI6oN4XojkUeRC1WZr2YL1FlkHXW+zEpRUNl1OYDP6mEFCd7r0f7SNdgC/U5S9SMHzEke98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j4E+M8Ll; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qLXw/g+2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j4E+M8Ll";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qLXw/g+2"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDC0vB021862
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 14:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vmOtkiZJ98jGzrjpVK
	AC35W1vhqlENRwo5hvru2MS5M=; b=j4E+M8LlEsT+ebCfmcDR+gS40qgZsAUDox
	1k/93q8WQMj+3DvDWRmnfcDDL6EeklwsWMGVHZQBnxYqBD/z50zxmXZbQxIVvXPD
	ucKQsoonZUkCkeglJF46zi/1YN9Bn8/l1T/DRxVjXWhrrPl8130z8jR/Jh06MYM8
	SAwa2uZMGlA+FzCtSoHEST4b1KahO2LrfPMJQqbmNwHHSYGyMmIqml0VDnUDYVE5
	iqRfedENSeU/pYgyacl0IdgUHmp6bCL8uN/RO+l3qdSU7cuBkupJN1GzVp12zrrN
	DuBDGGIBWEaRCUr6zFRBe8+1nZu74jDgWCKg7JbvONViCnFRCkhA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4csyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 14:06:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDASNf017658
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 14:06:20 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013048.outbound.protection.outlook.com [40.93.201.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsa0ucg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 14:06:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8TijGE7ZsFiawv/ZJLC2xlPt3haXj2jWrCxzyba8DidMzc3jOhP1jSrDsors6l46yfqmY3U20ENxwCvTmicG3roqbPCPY5ZtB7gbm6zLmpQ2u2dJAd3xUOGuHYSoSHuS6bvKwnFo0N2p1G58AhVwAMhEWuoJVnFbj+zCI4ZswCv4reolrj6Z/2FOTJ5Rnf1VGvbOucBafVgEQOFlinG+B8cCts3UKfzt+NX+1t1vKWIFwkvDj9JN7cgcVBuJ6bM17kTTlZwdTmusuDqxC4zyYnDccmGNc4en2T9bNOeJJze0mohIvhWCkvRHzeOrRGPxXJFrvk43GsOlYKlwrCNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmOtkiZJ98jGzrjpVKAC35W1vhqlENRwo5hvru2MS5M=;
 b=dYS90VT+qrw9EjUEeiy2YuuF+GLsbHiB3XYoaiTYwFNosMdiAzRoAui5KvfZaeI3MwIdCFGedfSLhIzUsBkaL9LVyeB5UjzM3uTKF6SFQFk4W9x/RNhWK1WCFNFoqqtZ22X/GZd+UPbRx9u8dJsRR+PSKes/iSV21EQWhDuC9gqdZ/8nViOthrM2PScNc4/K+Y3DeP4/UjR5LENJUlABbO9Gc85Il0KwbsxeTGksb2yR49aIDBKTkjOsKsESt/DjChxOEMHmKV1F1cV5inrQufpB+TNNlKxAaIFS0TV7Nsbx8pwDxlyGxGu3lsdCYGaUF7Z8NzYpwDSZ1EgYwOo9cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmOtkiZJ98jGzrjpVKAC35W1vhqlENRwo5hvru2MS5M=;
 b=qLXw/g+2qih/qvpfu7NRq2MoGbdqudhPGgRp1c3OLkLI56SCp2BEk9jZVwlhaHIQBJWCqaZCBWhqrtt77hBW6m8zy2SAms2+4mOTBpQephM+ra/h/qzfcGoIPsQnm+qCcu9Xddew7v9YvcP+IixyGrQy4mqnRx4G0v3rEAIwIRk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH8PR10MB6526.namprd10.prod.outlook.com (2603:10b6:510:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 14:06:15 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 14:06:15 +0000
Date: Tue, 12 Aug 2025 10:06:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 1/2] Omit an aggregation record if [u][sym|mod]
 translation fails
Message-ID: <aJtKVPrg95RybNrv@oracle.com>
References: <20250603210834.21204-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603210834.21204-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH8PR10MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 59104d15-394f-4001-2d7d-08ddd9a966a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WHfFs/32O50lSEwmKsdSmhh2kqRZXP3pwgF/xM0E1szlVUQilksHB5A1JSsf?=
 =?us-ascii?Q?mK7VMtkj1GBzMjMRRhrDW2e0/NFDiq+hPgulNzWv1z5PqEUhlgzRyvTz71jk?=
 =?us-ascii?Q?dR34/Ca6oDSVc7BpyXniuWeCdYwn+F6oTNYUW3l6nGrkRl94SPUBDrSyVsDK?=
 =?us-ascii?Q?fx/FjcFbNq+eq577Jrq0DZI+jMEncrq6sDWWjkgjqusZq/f2/xLN/V+x7lGX?=
 =?us-ascii?Q?yH7W99zrAk82W6m3/nNpgXtRcGjpevCDlQOPKDZmWelenIwxCSR6BHhKbsf5?=
 =?us-ascii?Q?GICHL0TlapyotLq8uXrS5mQnRnga3kD3byRpGwigICvNpGAxP2jFzP2wlG38?=
 =?us-ascii?Q?hOxLJKU+MWHf1nW2MzTBrXLt/M+xAx+5Dyn3brR42qMVkT5OneHPht9d6oz6?=
 =?us-ascii?Q?OtzPXILKTD274o5qLpeQ/eOWanhF/8pBw9Dbk9yn/Srjx+kFEse/OgwXVqu2?=
 =?us-ascii?Q?da8io4gaMz5rjTUUxgFqJFbm66gHT7HHmusVcWTLoV8Np0yeTfjqQUho/Fz0?=
 =?us-ascii?Q?S4SvL/GtgTOxDtn+bIgghUEoyXBawgC2KiPpMAfoW9urKSkjfP8/1FTHZkjZ?=
 =?us-ascii?Q?ELBnIgSg0gHyeFaYbexNHNDfBg9Ommx7oOuBbkvjKmYmyeVzeGa6617I2fam?=
 =?us-ascii?Q?yYL+21r2Zhz/l07EFb1ekp3WyR8iGRhyZr1AIcqkZKubJ1ljKMBYnYJVWf4M?=
 =?us-ascii?Q?jyXx+a3JY8gIbYokzUxnUJT+sxSpcPVD9BLmVC8Wvpp1PlxlEK9QxORkOqOo?=
 =?us-ascii?Q?VDzKeeuM4EAbEOflbVAJ6PFSeUTGpfbfD4JZj/hMOhF46t15mmvoj1N891Jt?=
 =?us-ascii?Q?Wq10JTBdYHFbjGtDTFtgIFi3thqyyaFUhA96WOa002lKGKAr1ErNPfi3hzjj?=
 =?us-ascii?Q?MGqdEKu+s0XOqQLdp4dEZf/KjoETE7RUltcyvXPChIgpN6Mg3k+HbixchV4S?=
 =?us-ascii?Q?y4aJXnnMQ8n7SBwwyJrNH87lLmXB0gb/6Ek46ir/eh2eTWOuzXHxFv6YCbzS?=
 =?us-ascii?Q?UwliGirYwe6Wf1jVnqHRi7219jiz6Z3SZ7LRysUkbnPbrN018NGanV7H53yN?=
 =?us-ascii?Q?sdmHlDKuP06P8LGSji3wQnin97xEWs/SxfHOAlzoLYrnLZMRzRZDZamwrkAz?=
 =?us-ascii?Q?ndW5LEIcbvlNdE4XoZvXjNHfjkc3jNDkQsgWJgcjle6X5G50QyPXf9R2UJZ3?=
 =?us-ascii?Q?5U3l6oPwxHmdU+RdC3QubP1icLQs+uCWvTa7P0gRi2GlcK01EeLGlEeb86qZ?=
 =?us-ascii?Q?UGjvazAA6rW3QZ/Zjs878YgQRb6R8fGvVU5Ir2vWb8qC+LCjkj5iepGhspEw?=
 =?us-ascii?Q?bl9vHxoIRDAmYsDHqN0Sgm1wJRzUIcv4NX8gP/MK44R2TtR6fUuH6SZCYspV?=
 =?us-ascii?Q?0Bh31E1xY4/Vipv1sfOI8gRst7OuqHIU4bRoBsLgY7aUJp9qpNIEBvqoGKzP?=
 =?us-ascii?Q?k/93bbbrwXc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U06A/K4ldWbyDPihkZ1b+OxHOjSATnBSsr+NZKh4OL+CG8B+y3J7x5+aTvkc?=
 =?us-ascii?Q?IXkRoQvkp8V+yg7yYtFNe04x9bBZ+mYXZ5tlbFPDf9XFyDyFSQet21c+isrr?=
 =?us-ascii?Q?ROaKKICgTT5V1HtgnkT+66Q0nb4l16dThVz2nCz1PTKosztkwnfXPUBBw3B2?=
 =?us-ascii?Q?PqHScgwyWYAJy2USeMt+JzIm5EtjrOJ/belpMAInXKkcthlSMvA74hFtivrx?=
 =?us-ascii?Q?jiLqZT75y8O8BsejsXMfuURSV8mkXeB3ct95NGzdZFdlN9JWzEexIllEWaEw?=
 =?us-ascii?Q?niyx3l0pzvpD+NmqfRhN9OINFh2N1qDczYCQgF+dQ/L1+duRvR6scZCqYRSv?=
 =?us-ascii?Q?+PkKRGDzsBOh/o0s9VQCyVmPx4q7cJr05tCo2kDeyw9gDHFB2Ss/UB/NEFgN?=
 =?us-ascii?Q?ZzhN63T3zrMTWsCWKtZqjLR6et9KFbkPVaSRH5P2fzu9SEGlMfSV7pS2a+Y8?=
 =?us-ascii?Q?2MZMgHWnxGFCeg/Zsq3S3tAhMkan6dnEYk6tEky1zNmfavpXxrnr1CNubBH9?=
 =?us-ascii?Q?8Eff9MaZFWZt23zzr4D0621MAgaLt+K/3uzfDdjcaCRa3m9L3H+luAIvps6w?=
 =?us-ascii?Q?WCC7piBeaNOYtQ5HDxcXUUVHd1hRD46P1t8B4/LmO0NOG9oSsvwdSlPnCf9K?=
 =?us-ascii?Q?f1teyfjKp115cfEsQdKfFX13xjFqhe3UMa6McPPPUGB7NMTKarpe2Le9JvJQ?=
 =?us-ascii?Q?IndpM0FlzDOOSNf+dDid9MqMASs0cMQekgujNrUpKMa5ijNSGnqiDbhJA8pM?=
 =?us-ascii?Q?dStExVKpzbQvUXetwTyBI/P1QIWbLlf/II0nGxXlY6/n89prwY9hsYCKzuGM?=
 =?us-ascii?Q?c201XaFwJlSgulMDQ8sc9VDP9ghN8Mce9pm3z4U5aS+GL9j9BUNYLw63JlCc?=
 =?us-ascii?Q?9WVpHzvUn5Q+58TmPLuzrKFB2kCOYG/p7c9K6vs5hvLDY2zVaGAveYZZlK0H?=
 =?us-ascii?Q?7FpuUR6nBWxBXwmxVmynm0JJzTqKTCRJg/K8WKYOpdOjQw3v9oiBr5Bzu7JA?=
 =?us-ascii?Q?qw7vDo5PFyVwCMSBAUkKLi+3cEBGb7rGPVTpCPE0lOxBMrfp0c1k4CsVHoW3?=
 =?us-ascii?Q?BSLc6b23wTnxKiPTK/1djrROQMluK9tkEvM3j+GZJGF3A59Lipax9rsQHuEP?=
 =?us-ascii?Q?ZE/RZRjIzdl8MvsS6mNE3dbNWatrFJDTswuP5VeUNcIzukbOh6bBY3W5pE/+?=
 =?us-ascii?Q?pWe35MVPEdbLZf0tJpGUPV26fXcJGvE/6YGi5+ThBwewsP223Z+N2XogYs/E?=
 =?us-ascii?Q?AtjhEv1m4sTtocUrfVsv4J81bMn8B1pnFqc7nYquSIexrOB8iMbKlOrLZb0L?=
 =?us-ascii?Q?0zpqRHrGNcbagFJCW3m0qOd11xrTv33jU3Y9E6FQfiismKHm7jF320teQQFx?=
 =?us-ascii?Q?RAAKoOnet1jX/AmY1UK5J0Eu3mkz3OjJYghtAs4o8qErzHxDg4Qqxxsq3E2n?=
 =?us-ascii?Q?FrUS7PJbNQIJJsy4tWGa21HF9lk9TAejXZmS+FVc7cESlinnL/z5ZYiBzmc4?=
 =?us-ascii?Q?CMOtQeTgOyw3rieQ799udinBOCgtCPo9hUVLb9Nv5fH5V/olwZnbSgk+38ZG?=
 =?us-ascii?Q?/rDmx6MHD1uHe9L4AJde6cDcYuXrHN0rLzk/oMM7mWqcM8EjGRY9BiC5WwRo?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WUJBi0WuZ4vaIitMgk3GLxSS/r5Rutsnwx8iQp3h4YOPhJKC69oah5bVOljfPyampVekYV7NaGGZUz+K4XpRFK1IO+FIufqwjgV/ML8lAtq6wj6wgGMFrETDdS260IjqDKThXVfjwgCqPRCgJgzkHApZBsGlcmJpxJdB5A3vJJc9qcCvnGcgsVt52ti3ztt4NrRPwmh7hoSXKOmPl9yO+ffC7Lp5orZJnp02ghalJxS2rtKRH81MTg4wlc9qYZQTgwz2Zs6h8LmQtSwUi3w9vZSM7j8Y53IZYPGgAjw03VcjSNjBl4sqWoKBeGt1Ta9GktRQ16bRaTaSnFB0LtIjl8O4GpHwGZcexUoytXTJRFZJLTUvj3B+zGDDVeUJcrV6YDmUpiUmIPH8UM7BvKUSOBE+bbAtuZD2IOFB0XlSiZ6U4PQKY4y8X7h+AXEw70amWFR63+KmkAugLw0jlYeRzQqqug6QAZvz7AOcmIufPNvgGgolw6VEr+UF8j7JVGmJWNqjIWPppcsHU8OcnbxCWWhvaWUqPab47Rq+8FzrXUSxlII/axwYhfMOqPfKyYhA0nnHVulN9N9Te2iNi/HSSoqa3+k8w5xo5ftN5k3HuIk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59104d15-394f-4001-2d7d-08ddd9a966a7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 14:06:15.5560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3fNtTzgrp7wQrP6fNUjBxMgKap19hGl3FEgfOZ16VNctvMcVB7Nt6rUUZ4z/Y/0sD59uVjDgL3R/3SuWpSaxFo8Gh6TrF5+kecNrGlRkQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6526
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508120136
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDEzNiBTYWx0ZWRfX/xlZqe3Y3kSF
 SivWCQ0lmhEXE6Bk3nZu8xj3c6LzKPRfejUZBzm7AaiaXNK/z1oeiIE44WWLk8sT6W4lp5i7Gt3
 U8RaYcApIXc86EDTPl+1SR2F/SsL6r2cLzRXiHc+Sb4KfEflA7mnLTwlG870bq5CMDLL1vkDnyo
 vwCkHd6jx1/gt0n53+MqWY/RJ17toDmGNaQqT7k6k2XbtAd1hl0CnfosVkZqDFOC2vT3o+ggS2R
 O6UtCDeuE/tShfCOYnpoPMg8FF+lU/a9m72gVYJXJpLw9tdHlHESTjiF5kgWAmhbzXeNbG3N1Mw
 bpAguJKgnWK9SLqsZ1I29zGAbBR3ZRCCZyXWFML+/Kb9Vc34OPr0rK3BMB9k+HESkMoTGEyzcsL
 0UAYbJi0C7UBLF2LzDpPNiP5NG97TvS4VxUkpYFnYhEKJH+swkB1RPOD2XaARLfk5NEMHbMY
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689b4a5d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=e6jKOKMcv6BWoamRSP0A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: r5c-zOs7OFAZaxL_by2CMVDo3mXA8U6i
X-Proofpoint-ORIG-GUID: r5c-zOs7OFAZaxL_by2CMVDo3mXA8U6i

On Tue, Jun 03, 2025 at 05:08:34PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> An aggregation key can be a sym(), mod(), usym(), or umod()
> translation of an address.  It is passed from producer to user
> space as an address, and the consumer must translate the address.
> It is possible for the translation to fail.
> 
> Omit a record if the translation fails.  This addresses failures
> seen before OL9 in
>     test/unittest/profile-n/tst.ufunc.sh
>     test/unittest/profile-n/tst.usym.sh
> 
> The problem was that the kernel's aggregation buffers are snapshot
> multiple times.  If a translation ever fails, the raw address is
> used instead.  Later on, when the aggregation is printed, if the
> translation is successful, the raw key will report a count of 0.
> 
> E.g., we snapshot an aggregation.  The translation of address
> 0xabcedf fails and so the key remains 0xabcdef.  Later the
> aggregation is printed and, therefore, again snapshot.  The
> values are cleared.  This time the translation of the address
> -- say to the function starting at 0xabcd00 -- is successful.
> That aggregation key is successfully and correctly reported, but
> the the raw 0xabcdef will mysteriously be reported with a count 0.

More in detail: whenever a snapshot of the aggregation data is taken, its
key/value pairs are stored in a hashtable.  For keys that contain address
resolution elements like usym(), ufunc(), ... the address in the key is
replaced with the canonical address for the resolving function (start
address of a function for ufunc(), ...).

Therefore, if the resolving does not work (no symbol, module, ... found),
the key with the reported address is used, and a hash entry is added for
it.

If, at a later snapshot, the address *can* be resolved, the ley gets
modified with the canonical address in place of the reported address, and
the data gets hashed using that key.

Before every snapshot is taken, all aggregation data is cleared -- but the
hash table entries remain -- it is just their data that is cleared.  So,
the later snapshot that managed to get the address resolved will cause the
hash entry with the unresolved address to never get data populated, and that
is why is remains 0 from that point forward.

> It may be argued that some users would like to see addresses that
> could not be translated, but typically those unsuccessful addresses
> are not very meaningful.

The problem with this approach is that you drop data.  If e.g. you were to
collect this aggregation for a task that does not have symbolic address
data, all addresses would remain unresolved, and you would be ignoring them
all.  That is certainly not an acceptable approach.

With the on-demand snapshot code, I expect that this problem is less likely
to occur.  But it is certainly still a possibility - incidentally, this has
been a problem with the DTrace implementation from the Solaris days.  It has
the same potential problem.

Two approaches come to mind:
(1) account for aggregation values to be 0 (or MIN or MAX for their respective
    agg funcs), and omit those entries when the aggregation data is printed
(2) detect this situation (hash entry exists for both unresolved and resolved
    key), and if so, remove the unresolved hash entry

Both have some performance impact and/or make for more complex code.  In the
end, perhaps we could choose not to do anything about this and allow it to be
an artifact of address resolution issues on the system?  If anything, they
should be easy to spot because they are always going to be entries that have
(essentially) no value.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_aggregate.c | 51 ++++++++++++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> index a18de3a75..32b0faced 100644
> --- a/libdtrace/dt_aggregate.c
> +++ b/libdtrace/dt_aggregate.c
> @@ -317,61 +317,76 @@ dt_aggregate_quantizedcmp(int64_t *lhs, int64_t *rhs)
>  	return 0;
>  }
>  
> -static void
> +static int
>  dt_aggregate_usym(dtrace_hdl_t *dtp, uint64_t *data)
>  {
>  	uint64_t tgid = data[0];
>  	uint64_t *pc = &data[1];
>  	pid_t pid;
>  	GElf_Sym sym;
> +	int rc = 0;
>  
>  	if (dtp->dt_vector != NULL)
> -		return;
> +		return -1;
>  
>  	pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
>  	    DTRACE_PROC_SHORTLIVED);
>  	if (pid < 0)
> -		return;
> +		return -1;
>  
>  	if (dt_Plookup_by_addr(dtp, pid, *pc, NULL, &sym) == 0)
>  		*pc = sym.st_value;
> +	else
> +		rc = -1;
>  
>  	dt_proc_release_unlock(dtp, pid);
> +
> +	return rc;
>  }
>  
> -static void
> +static int
>  dt_aggregate_umod(dtrace_hdl_t *dtp, uint64_t *data)
>  {
>  	uint64_t tgid = data[0];
>  	uint64_t *pc = &data[1];
>  	pid_t pid;
>  	const prmap_t *map;
> +	int rc = 0;
>  
>  	if (dtp->dt_vector != NULL)
> -		return;
> +		return -1;
>  
>  	pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
>  	    DTRACE_PROC_SHORTLIVED);
>  	if (pid < 0)
> -		return;
> +		return -1;
>  
>  	if ((map = dt_Paddr_to_map(dtp, pid, *pc)) != NULL)
>  		*pc = map->pr_vaddr;
> +	else
> +		rc = -1;
>  
>  	dt_proc_release_unlock(dtp, pid);
> +
> +	return rc;
>  }
>  
> -static void
> +static int
>  dt_aggregate_sym(dtrace_hdl_t *dtp, uint64_t *data)
>  {
>  	GElf_Sym sym;
>  	uint64_t *pc = data;
> +	int rc = 0;
>  
>  	if (dtrace_lookup_by_addr(dtp, *pc, &sym, NULL) == 0)
>  		*pc = sym.st_value;
> +	else
> +		rc = -1;
> +
> +	return rc;
>  }
>  
> -static void
> +static int
>  dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
>  {
>  	dt_module_t *dmp;
> @@ -385,7 +400,7 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
>  		 * appear more than once in aggregation output).  It seems
>  		 * unlikely that anyone will ever notice or care...
>  		 */
> -		return;
> +		return -1;
>  	}
>  
>  	for (dmp = dt_list_next(&dtp->dt_modlist); dmp != NULL;
> @@ -400,7 +415,7 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
>  			    dtrace_addr_range_cmp) != NULL) {
>  
>  			*addr = dmp->dm_text_addrs[0].dar_va;
> -			return;
> +			return 0;
>  		}
>  
>  		if (dmp->dm_data_addrs != NULL &&
> @@ -413,9 +428,11 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
>  			else
>  				*addr = dmp->dm_data_addrs[0].dar_va;
>  
> -			return;
> +			return 0;
>  		}
>  	}
> +
> +	return -1;
>  }
>  
>  static dtrace_aggid_t
> @@ -574,16 +591,20 @@ dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
>  
>  		switch(agg->dtagd_krecs[i].dtrd_action) {
>  		case DTRACEACT_USYM:
> -			dt_aggregate_usym(dtp, p);
> +			if (dt_aggregate_usym(dtp, p) == -1)
> +				return 0;
>  			break;
>  		case DTRACEACT_UMOD:
> -			dt_aggregate_umod(dtp, p);
> +			if (dt_aggregate_umod(dtp, p) == -1)
> +				return 0;
>  			break;
>  		case DTRACEACT_SYM:
> -			dt_aggregate_sym(dtp, p);
> +			if (dt_aggregate_sym(dtp, p) == -1)
> +				return 0;
>  			break;
>  		case DTRACEACT_MOD:
> -			dt_aggregate_mod(dtp, p);
> +			if (dt_aggregate_mod(dtp, p) == -1)
> +				return 0;
>  			break;
>  		default:
>  			break;
> -- 
> 2.43.5
> 
