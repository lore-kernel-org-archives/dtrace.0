Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EE54CB5B
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771390961; cv=fail; b=R9nC5LSf8FFqfFaRyYZihA7k61hETwJBaZT0zp3DwFbd0OEt2f2DKLvJXU4Z8776w70QumQwY6laZbZMYYjykfDN2BjIIPMX8sl1y+xrSisoVkhTDXKaWib37adVAYlJZ8J/QGKZKY2kyQJM53iqBeLSGBQqVKS2M/7fsQ1mD2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771390961; c=relaxed/simple;
	bh=5fGMA915EluWGOvobhC0H336+43Xdzg1Nxyj0vtvSKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WPxR6KyMjWKc47qSpAZu+n1sp2dkrEXxpNwFRtt7BBruP6FI14sAJPMlImkQjxXmWxZb5QVYAKQ1o8p7zImgvjjLIR21mfS3gmcpMx6fphuM32CGVhuWaGrNIeTfjIKZYt9f5axCE/d1n4/84P5BcLuorjwvbghkhSHVoz69Ivw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JZf74XGJ; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YggdPXRC reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JZf74XGJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YggdPXRC"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I4ZOnj1535463
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:02:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=ZHH3DJON5Oq3S/GYmj471KVDGENcqJ+gtbVFxPLfeY4=; b=
	JZf74XGJpaeJkhYfd9W9AmfgDDoqFnZlcz4c3zMu4t5vrO98MmF2hjlZ920L2NB1
	6UlfEsUVySxEBx4BzQYfr5JDv+zqlch+3P7NeZIHsaVs0jsGGjOtg1zJ3ZGvfbdA
	TDXrRv/zYPhQpn7iS0Yci+l0P2qPHBcH965TduL/uxFmSFYVhZ6ud1X2iOui9A0s
	34fSGjVx5vSyHSWRTemzc2RBeLBTwXa6rkefmkuqgqGtL+h//4/ZVeZPWDBwEn2D
	kJap+i/D0NU0jqvl4zuSD2h8LyB5oMeN8Fl7PBiF8uJZpW17IX0LO0GjT4UZr8Iv
	CdqkWb1q2+zPdyNp5SODuw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj3t4w6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:02:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61I1hvOI037095
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:02:37 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012007.outbound.protection.outlook.com [40.107.200.7])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb284v6u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Feb 2026 05:02:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTrUX27ORAcdlu8hLlW57+M6ZVVe9wnJI2lCqwYJkyvepC22WuX1ykmrAFtJkk//ufyodYFh76MUQdp7fbk1r6+gIVWkW1lJJNXjCzvw4/rJpCWHRaUw9YUGWnZUpdv+GvfWNY1uHAxjj+WP7igSZG49ORyTzKUC3Jw4f2uOTb2g+tvOVb6xcSvWjEtbkbfqzscHLlayxBb+4NuAIIXBvO90szUHoIfYR+diNpP4RpIjH0OByE/C7LRm7GEnzBJ+lCf356+SpRuFmGoEDp0f1K3wZNly6FTy1rE5faA1sFseYSCXqMz71806ZO6JQ+QKw8naxJGPn+KyDZmKjFdCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri7Kch7JxFhDfspFvgbfDSIq8lMNWULICmkEqP69yus=;
 b=cNGltifChv5BbC6Sg1w/D33L0s00CwpkFJhcimMlXxBVKQ3ANOUlEfeek5qmENuHv1yFHyge2vvncVPLU4pmI0aaEktJEkYAKlp6w1q9tV/uy4eBSgp+NZSJAcYswPe/vb+PGrtc7stPWXyiRnDQVYlRhymb3Ms4eFDV2LiPnmZoujuneyDFiGtdd3/y6WpGsrGv3GUir4JpecS1Pyu8phK/GpJEiaaj1W7mJLp946yS9vIue5a6SHnxXWJeGLhcSyk+VMx9sd3mZHQToH5xfkrndiC81AG/HVVlTr+aFnk4XQ8B9UWpPXDeSso3ifZtWmHM3S4Qn74N6MNEBLNbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri7Kch7JxFhDfspFvgbfDSIq8lMNWULICmkEqP69yus=;
 b=YggdPXRCzaAvA4Qb/GuE5QIG10bnkUH9GBw2jYTlRn2ITv4xpD3Uf5jliW7DFRpDZfYxSk5JuHiBC/TMLAgqCDh0xWUB2dUbHybRGHYYx1APfbGHiyUu2LvntogGuG8uj007Oca+VDBzR1/JoABJwGw9OxxtJSJEQsrzTIZyzRk=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BLAPR10MB5170.namprd10.prod.outlook.com (2603:10b6:208:321::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 05:02:34 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 05:02:34 +0000
Date: Wed, 18 Feb 2026 00:02:31 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] usdt: enforce provider name size limit
Message-ID: <aZVH53pgYGQBiOy8@oracle.com>
References: <DS0PR10MB7522C161F2C7C0F342DE99BAC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
 <a756f0fe-2496-6964-6d16-97fd707e0c1c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a756f0fe-2496-6964-6d16-97fd707e0c1c@oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BLAPR10MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 128e86d3-60ae-43e1-39f6-08de6eaaed5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?Sc6E52WqvIRX/t96Bpc39a1Qt3Ip2Ai2cKYsK/z+oNgUWgZic3q3dIaUPd?=
 =?iso-8859-1?Q?aioGT1OwBAl6WYfnlTE8Dz9LmDORpp9XygAV4atyvBB21D7cHRIVeWd9If?=
 =?iso-8859-1?Q?iE/I1H923oORounx1bAFb+V9KUWUBpuAoAmNCRYatEHAhUcBcAn5gIlmSv?=
 =?iso-8859-1?Q?4+QBAFHM+zWNouiLSTuIWXMB7wykaz6QwZ9je3+UpZDMYokH2GqTxweJuq?=
 =?iso-8859-1?Q?u4tePaN7mIdlOjdILPPqT6ewgETdTAGlmE3pl9Kt4Qbxg/b8iDAjrXHeeD?=
 =?iso-8859-1?Q?lFSFTFNbABRMpOlB7E+17Z7tUJDTr5tJBsE2HS35kceWE/j5N7Ns6/PuUm?=
 =?iso-8859-1?Q?pp2XsueRe9XOPPzylZAUNVsUmayWmto4Ymmot0dY0YEmRg2YLzf5dBWXFk?=
 =?iso-8859-1?Q?pzuMzlrNyHWqUCcwbxXGp5C1YpjdiG5GtEg45mN6KO3gT7v4zbuS2jinFA?=
 =?iso-8859-1?Q?PM6/2PgK1ZCIONI44c4twQaN6mjH1PzgevlhLtXIqO822OWILvWU6EfKJp?=
 =?iso-8859-1?Q?x/9nJ9sd1OXEfk2CWGidLCYhPTN2emGYusgmv3F0yNhQz434jj1Xvw3UOV?=
 =?iso-8859-1?Q?E2Q2Azn1rEBFatScaxseNmD74ApaD0dHD3Wbp50h9jWOwcjuJp3hx6W0OU?=
 =?iso-8859-1?Q?PeS5pVt1sMIDqZeiYDYgAK86DZWev6cr997txrKkbXN+zzdi76V+d9PHe3?=
 =?iso-8859-1?Q?/FBEEp0w1MJYdcSz52LXYP5r46SDLAB9/3z0wVwDRHuLcNy52HmxcrQh2Q?=
 =?iso-8859-1?Q?tcs1ryco6skslCfSjuuFX96MsTjkV/0bDqYybVzowv3j0dMC0uZwek628l?=
 =?iso-8859-1?Q?hNFBzK7fi7VcX+r38Q03MijYZE/QMKTTjpw90WnUHzsN73PMVJqnFhjVGh?=
 =?iso-8859-1?Q?AAPyTvWmfTevQC47/WiH2i8pfFBf5jcuUU3SpHCKY1ttfvs166Ah8PEAMI?=
 =?iso-8859-1?Q?JTXkkpwoBgPlxl/hRwgtqFcMukDyEtKewjOcukVWr9ENA2QK/1qMBaQkbl?=
 =?iso-8859-1?Q?CjxrzOLd4f69cgj673Y+iVoxccOGCw2KA3HpgYXixPVjD8Du6ZNdM5I4Mi?=
 =?iso-8859-1?Q?p/DaHJrdP3itggIXfgqaLXn/8PL17xr40lfSpKsx5FyAGDwgxX5xfLue9B?=
 =?iso-8859-1?Q?3Jk+jgKgBJ8DS9dYeB1PZFeGyH3MZ3RTgO5LrHTHmYB+SD+5rqs9gCYNS9?=
 =?iso-8859-1?Q?J3HbI2u6+9oKkW1ggtxOZaP/jBZu/GgrGGn1faHa8M2gxLf3VmiBFXG9Ku?=
 =?iso-8859-1?Q?R4JZSLmjOa9Hwqy1pJQkHMRmMg2sfo6hLkIQV6kWAE2z1gWK3yja6BMsiO?=
 =?iso-8859-1?Q?efPy82tSsfQ3fqyYaI3CXz+kqztNFuTdI4LZzDDotkSF0hUGuZOQHjJ1Qn?=
 =?iso-8859-1?Q?0Rn9aXvXLfcoj6E2EEwpLthYVX2FLvM2ayvCmhpxohqEp8WRe8hoQ9AvHE?=
 =?iso-8859-1?Q?PNFMQEo+RpPKg21cuJJ0PkDRnA78nILpYzzrjtUwvow9/XDBM8FJ5q00Yk?=
 =?iso-8859-1?Q?50MjcGS4hV5+5wS/90SydjEdhJnPqp2Cw94ADs3ZK0pKsgUxAZGVYyBCR9?=
 =?iso-8859-1?Q?JBNn2ueHLbWS+wVw5V+53P3qXeB4HmhJPHFxW/BptVGeZP+n09C7v0IMnM?=
 =?iso-8859-1?Q?Db8FTzNChy0Zs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JQtlwIbbOqPKN3sQWD7mwXBB0JLRjU7kHL7wZycu1PuJqby2NqR7noewJT?=
 =?iso-8859-1?Q?JLMVH+UfmKyshMLixcca77U0/IucfepsGSe26RlvnGKOxeiMCTmcnAr2/I?=
 =?iso-8859-1?Q?phrg/81tpCgR4VyP9RYod533O6sY6p83+5Rc8/CiFp2Y1qMzTihZYoehsW?=
 =?iso-8859-1?Q?k0DpUuU1sx7hl7Xw/tmwckVJgv26t2zC1t+CUuRxJHyojqX3gSbnH8gQ2S?=
 =?iso-8859-1?Q?1gP9Gb3Qpgh02AVKnk7dGFyq9cdQEwFWY4QrKXs7Ys4X9bcZiMcQxBYydq?=
 =?iso-8859-1?Q?adIAPFoPntj+ggwViC6X/hYI50AW4VWa0lFDpwQQL1lZm2VUrSH94sopat?=
 =?iso-8859-1?Q?Zg4au7tPcYki3TNxyC87Z59P00ZzgxNB/hw/CfVnoGtS4Hu6O3seZWS3Lz?=
 =?iso-8859-1?Q?y+HHuED/3c4NbWaRbf5JgqALBIZXLc7H94ft5eAvtzEhm50uXnTUr6cpFb?=
 =?iso-8859-1?Q?d/dWbwsG1rW3smnXBB8t+PTsd8TCQDvaRs9gtcbeiCdTznBFc5cNGkfMqY?=
 =?iso-8859-1?Q?4BB7Fv9/N+clro370QTGd0qs075n86tRnUQvZY5sJPj6FkLzKx/SNMmagU?=
 =?iso-8859-1?Q?cKP2zAyvT/7gZ6mFcNh5mojvRjA2yZnLIQf0QT8Ojaavu7gm7uVzTNrxG9?=
 =?iso-8859-1?Q?ismM/Gi/j0ANzqDY0i5Q+bRCHiu1SdUkBKaq6BxbBXkd0UsQ9J07gWOD65?=
 =?iso-8859-1?Q?vrBjt4gIeKSgDF+CAplpWhfveVl1RhLqfYYZBTnEKLEx60MClZM/MsB8tJ?=
 =?iso-8859-1?Q?wz7QT7EboqkvJCtBUREtNOgZwmnVLOPeISG8ohlsVfQ3itKlejDOknFsb6?=
 =?iso-8859-1?Q?tJaBPfsqJcJ0cY1z9d99IVWx5yEFBhrIt6y+NFp/k4SWvaMsX7D8EvPEMy?=
 =?iso-8859-1?Q?j1T8oTgK8HFhUvD5HKbUtHOx6Ac3QNXGKEytYN0DNsqOW317g+yiLF6P0V?=
 =?iso-8859-1?Q?P+YSmapH+LQSkZwdnIQgA+zt5wLBdm7Mae7kvkSZFzmB5njvIBASKOrcGf?=
 =?iso-8859-1?Q?EM7/jbi194jjYE2l4ZZBzjVnilLYVx9LT9BNq++4Nvhb5qdBjOw0R+Hc/W?=
 =?iso-8859-1?Q?UqMVUnP6WhQT2euR47o1SAYUNkTIRNSy8/6lCV1Au1JID93LDtOJhDszvT?=
 =?iso-8859-1?Q?ahhhKdXnGBwTlHZWAQLeORSN+uJx57ygk88uTSO+27ZqcbOndssD2nxtec?=
 =?iso-8859-1?Q?DcSpAmFsid8iA1v2v9neiDcA2h93OgRaOncnJ0COgHIEQZGeziFJysYY15?=
 =?iso-8859-1?Q?CUFezVf2IQc1o7MrJZO2sY9VtmW9z0nyXjqM5LIyAqKo0zmBAPQmLeeRWi?=
 =?iso-8859-1?Q?48Z6ClbiOJmjg9/nDckebt7UCy05SI69bOoOyrOlK6zM5IxW2n4XbneQjh?=
 =?iso-8859-1?Q?dFOmqEbnqw52feLfJUVxtW4Jh+tqKHyFWOV11QdR1wfxO7KPfFqouEajeX?=
 =?iso-8859-1?Q?dA8zaOS74vZcNK2j3LPL1pJnuZ9nRcbSVVEegkDx3JOYWNJg5hIgHqytck?=
 =?iso-8859-1?Q?pxUlSvJkPKZ+1L9Pc8cmSHdl8Ndq8BAanNcEH8kA+pzxE8+VTsGzWR6PYS?=
 =?iso-8859-1?Q?IkTV72ZVXRMCN80PVXLr2ilF3bWu6wBztprwjbBqH42gNhrOdLA7D8aqwe?=
 =?iso-8859-1?Q?DObyTSg2Y8l7YlOhsHnwOdbXx7BXsEXamPJA3dULUUm/1+poAqDIpLLKJ2?=
 =?iso-8859-1?Q?/JAfyNYycu1UEMVShWQ9YHSMIRVq8pN0ihMBuBQ3HX+eCk9sJpigg4Muwf?=
 =?iso-8859-1?Q?MvHZZ5zUQYmTfxj2N2Z2z0+4R/+U0Q99eTQk1MbrMeblkYAyPnusPHvKcO?=
 =?iso-8859-1?Q?L301IyhdgQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8q7Rf8kYmH6OLHCn7CTIcw4B2w8zmKsB5+hgEXW0F/NTAjmuCafS8R1znL1z669HKZsj/BjCLvKutrYAJJzeLvNrrB+efeUbmM/e7WQ7IOKYPgAh60E4yapioSDab+EcZweAw2uEuuAknwP/HczD9yam9L6jqM5gBYqghKB06UJEpABGYrr34pAqTWJIJkNfaHUXw5ZJXpX/jV3DpzJGu3YRwf5S1/n6ttitPAACJaO47k0XUUjOkj5Alor6Nk3J3xaqFAUUSdFnU3pO/fbgVURxHWX4EJq0CVmLYy3ZWjcWu2jKLkO0ZtY32rsFCwZPy7CPMXUg62Uop0bB6EYlfo1J3ycSLU026lcvJA87pQHUMWf3J0lRUck+bI/BbEVFL0CFte5iQpp352meMwgi4M/BOTF8xMTvIpa/Waf666dYUpu9Myt+Rb+QAyf+l5Hu1zpqHiDVUyxD3SuAThMfXh+vKod8V9bCIkwH86/Q9A3vQJAYuDkZLBWTyZeXgsQBYxHBNx2b9M7DJqLQeOOmb+4dNAtEgix4kf7t/CWm+/398rDlRYRjvRRXHuv8973xOKTDcYJEkHeRtXIXI6s7Bc+grcoQiZDV7eNnD/OtJA8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128e86d3-60ae-43e1-39f6-08de6eaaed5a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 05:02:34.0325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajgHfdKB0uHng+aURvTR0+kfhhvVU2OopLcv2obWSrG05I1hX9qUxrW5BRdcogqvTfjE+ugrO0Ak3yXULuIhu9OrqkpTljxwCc84lCbLzy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602180041
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA0MSBTYWx0ZWRfX9IcHM8t10G9t
 ogJgIxwYODCvb7p1Lw8xNodDaWGx2scxkiwJKsJjbAbplmxotVQk2iuMWxnjwnE1dHGpWJKBnrm
 gH7tEyAA6vFSNXha/1HGETdCaxwEYW6GsBixsh2fgrtLHoEly9+AyBRB5cdSMiKmWr5z1MOE4lh
 TqzTiASWElxed5k4EajpbUrooB8SdGiZL51STlqDR3S+Jy3WXhTsgUkTjU/8f8JCgP2GR2SRKfx
 93JLPz6N0Slx/BY5ZCH6vsnVurP4rqPw5486oLDnzKFSK/v6/ew9cctm9R0cbTNojmCLvyRyHkX
 PIPlN4swDBWDM//9BuEbs47OhW85fOs6AAQq97QgmcoZDruyMy5Xb+O36tcx5dbOmlliSEnjEG/
 JHbrrwhXRTOjKYYbjCsd75xx9XLJSf/hL0QKxzWDOxUYCTOgfhBvKp9dJ6cPWjtvTiuJxvG1Z1i
 +nVl349KPAtmBmSEzsyYEERlRuvP4SOajTXhtivw=
X-Proofpoint-ORIG-GUID: Wx-ltfFetj3IDg4M7PrktxwsfafqxxbK
X-Authority-Analysis: v=2.4 cv=b/S/I9Gx c=1 sm=1 tr=0 ts=699547ee b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=685jB1qvVugPPpXOFk0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf
 awl=host:12253
X-Proofpoint-GUID: Wx-ltfFetj3IDg4M7PrktxwsfafqxxbK

On Tue, Feb 17, 2026 at 02:21:23PM -0500, Eugene Loh wrote:
> I'd like to understand this patch better.  In particular, in what sense can
> a PID take up to 10 chars?  What if it isn't that wide? If by coincidence
> all my PIDs just happen to be narrower, why must my provider name make space
> for a PID I'll never see.  IIUC, a PID will "typically" (whatever that
> means) not exceed 32768, well, or maybe 4194304.  So I might even be
> guaranteed that my PIDs will be shorter than 10 chars.

pid_t is an int (32-bit value) so it can take up to 10 decimal digits
(2147483647).  While it would be very unusual to see PIDs with such high
values, we need to account for the possibility because tis involves USDT
probes. i.e. probes that are built into libraries and applications.  Since
we do not know what systems they will be used (and trace) on, we need to
account for the worst case scenario.  It would not be acceptable that we
can trace on system A but not on system B just because A happens to have
lower value PIDs than B.

> On 2/17/26 11:35, Kris Van Hees via DTrace-devel wrote:
> > Since USDT provider names have a PID appended to them, the base provider
> > name cannot be longer than 53 characters (PID can take up to 10 chars).
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_link.c                     | 24 ++++++++++++---
> >   test/unittest/usdt/err.prov-too-long.r  |  3 ++
> >   test/unittest/usdt/err.prov-too-long.sh | 41 +++++++++++++++++++++++++
> >   3 files changed, 63 insertions(+), 5 deletions(-)
> >   create mode 100644 test/unittest/usdt/err.prov-too-long.r
> >   create mode 100755 test/unittest/usdt/err.prov-too-long.sh
> > 
> > diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
> > index ffa16d9a..e77f06f7 100644
> > --- a/libdtrace/dt_link.c
> > +++ b/libdtrace/dt_link.c
> > @@ -148,7 +148,15 @@ note_add_provider(usdt_elf_t *usdt, dt_provider_t *pvp)
> >   	usdt->base = ALIGN(usdt->base + usdt->size, 4);
> >   	usdt->size = 0;
> > +	/* Ensure there is enough space in the provider name for the PID. */
> >   	len = strlen(pvp->desc.dtvd_name);
> > +	if (len > DTRACE_PROVNAMELEN - 10 - 1)
> > +		return dt_link_error(usdt->dtp, NULL, -1,
> > +				     "USDT provider name may not exceed %d "
> > +				     "characters: %s\n",
> > +				     DTRACE_PROVNAMELEN - 11,
> > +				     pvp->desc.dtvd_name);
> > +
> >   	sz = PROV_NOTE_HEADSZ +
> >   	     ALIGN(len + 1, 4) +	/* provider name */
> >   	     6 * sizeof(uint32_t);	/* stability attributes */
> > @@ -382,12 +390,16 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
> >   	shdr->sh_addralign = sizeof(char);
> >   	/* Add the provider definitions. */
> > -	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL)
> > -		note_add_provider(usdt, pvp);
> > +	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
> > +		if (note_add_provider(usdt, pvp) == -1)
> > +			goto fail;
> > +	}
> >   	if (!(flags & DTRACE_D_STRIP)) {
> > -		note_add_version(usdt);
> > -		note_add_utsname(usdt);
> > +		if (note_add_version(usdt) == -1)
> > +			goto fail;
> > +		if (note_add_utsname(usdt) == -1)
> > +			goto fail;
> >   	}
> >   	dt_free(dtp, usdt);
> > @@ -492,7 +504,9 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
> >   	if (!dtp->dt_lazyload)
> >   		unlink(file);
> > -	create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
> > +	ret = create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
> > +	if (ret == -1)
> > +		goto done;
> >   	if (status != 0 || lseek(fd, 0, SEEK_SET) != 0)
> >   		return dt_link_error(dtp, NULL, -1,
> > diff --git a/test/unittest/usdt/err.prov-too-long.r b/test/unittest/usdt/err.prov-too-long.r
> > new file mode 100644
> > index 00000000..1305f434
> > --- /dev/null
> > +++ b/test/unittest/usdt/err.prov-too-long.r
> > @@ -0,0 +1,3 @@
> > +-- @@stderr --
> > +dtrace: failed to link script prov: USDT provider name may not exceed 53 characters: test_12345678901234567890123456789012345678901234_prov
> > +failed to create DOF
> > diff --git a/test/unittest/usdt/err.prov-too-long.sh b/test/unittest/usdt/err.prov-too-long.sh
> > new file mode 100755
> > index 00000000..599e461e
> > --- /dev/null
> > +++ b/test/unittest/usdt/err.prov-too-long.sh
> > @@ -0,0 +1,41 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +#
> > +
> > +# Ensure that provider names longer than 53 chars are rejected at link time.
> > +
> > +if [ $# != 1 ]; then
> > +	echo expected one argument: '<'dtrace-path'>'
> > +	exit 2
> > +fi
> > +
> > +
> > +dtrace=$1
> > +
> > +DIRNAME="$tmpdir/prov-too-long.$$.$RANDOM"
> > +mkdir -p $DIRNAME
> > +cd $DIRNAME
> > +
> > +cat > prov.d <<EOF
> > +/* Provider name is 53 chars long */
> > +provider test_1234567890123456789012345678901234567890123_prov {
> > +	probe go();
> > +};
> > +/* Provider name is 54 chars long */
> > +provider test_12345678901234567890123456789012345678901234_prov {
> > +	probe go();
> > +};
> > +EOF
> > +
> > +$dtrace $dt_flags -G -s prov.d
> > +if [ $? -ne 0 ]; then
> > +	echo "failed to create DOF" >& 2
> > +	exit 1
> > +fi
> > +
> > +echo "DOF creation should have failed" >& 2
> > +exit 0
