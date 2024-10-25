Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6618B473
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824849; cv=fail; b=Nbabo6N7kEOR7M6SLp7Mrw6gvGy34S2OTmeOIEflhpVwUulwELFPcMxmiXGi+DZkPCNW5cGJ0MK25qbADXn4o1HHNl4Ll+ASKtpY7g3goMHkJlhMZC/HLOOPx9i9louKQ9YKummv2yLL/2ZDxrKzWL6hIVHxDwITtc2ret9iJkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824849; c=relaxed/simple;
	bh=rd02zDVRGz8naLZifuD3aCrmkKc92FRgZTc8+NVNm08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OngaTURxIF9QXPf9Do/yCr67KRLutHjrDWNn6HbkiqGwZ6C9b0IO9Dj0IBsz67coJU0E8ZUTTSTKE54tHd3wBS5++lMMIc+U8wtuaCxMO92xeZLsfbFixA28TJN9yei0zGzTeAQgZmobMVxJ6E8G5lAB2K6C3yNuJEIURjCmKtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e8GicTRv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k7WFlWiR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e8GicTRv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k7WFlWiR"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fc7R026583;
	Fri, 25 Oct 2024 02:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=8ZhYu0qKCNS9xHfZHu
	gqFGChf/J0tWx35z/EOMryIhw=; b=e8GicTRvznSlRYSFyxhojHvQXttecOWaJI
	0aKrNNxAsYbGnXBeV9NOKR2mqRK90hy7G1mkUpGhcMP2w7w46vwV/kRESqfIGdmf
	Mm/g/+u8b5onE/fUqTLfFE77yl25ve/3Uyssc19paJydXevkKUbrrbeMNv2hqXHQ
	6ycOn0VsiRwdKU7d5ieywngdDfReuCUitiNLMEU1jyQgCXAXiiCxBZglV4G1wyT5
	Cto4zwt/fRNifnyWpWpd5wipBE0z0Q8UbZAMYntVnbK6S0pr9B/ggcMIAh63hgEi
	+CPH5jW/gdrOqrdJJUhW7BC31zMYCSDZ6PYLiFFM981ntpGqo6iQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42cqv3k4s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:54:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P1kOs2030867;
	Fri, 25 Oct 2024 02:54:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh3s384-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:54:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BVnjfECN5U1yZqstbGQ+1lsdtqD1RpCsASRinqEMtGZcnw5U1bAMLzNc+xwZijMZBoqtshynL0tcEVFUNJvXHsOqqLIVgilAR27GMLb2gNvWCGUX5+f27LuyY/nb02sQ0dWH0Qd9e1dwB01Er4SHThycdYKEDqinCwYZYmLlhpLjcdbtqvZ2aOUb9l2iVy9OpxhoVEuzKIPxin5tFbe6BBxFZQ/U+z8TFNOLzSWyou06A9xqol1DtmOHXJ439RzRJEULXDNoQ45o64gKFubdhkdNl3Wxnddrq7fXh/FiFTEFXy6WQCf6+dnlGv6Tdmn9kCodln6cTqiYgfARDibMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZhYu0qKCNS9xHfZHugqFGChf/J0tWx35z/EOMryIhw=;
 b=ENXydxkSn8vaMvUhxZ7JV0UI/77wLrZsFBx5nKyuWcF5aDl7pTTzrCNr1rnoNeuiyxI45FD9n/J54CEnYaj5U8hywkygQnbHxtW4XNqGVSrkaLbZQ/MpPVDJPieHuU+9gw5JIyoFsy5huawN8aMNZsMj8ORIRLzvNksaYw/kn3RzzkFZIyfm+XfOn8l5EqacVptSo+aKQfCvGShxbn90cFrAuv4JVPKuJXuv2UHa2gWVVwIrnf/NN9Vn4Ujjn8/xcmMJED42elnwdrueFsmjMtbOW5qkYjs7gWyIPXHFQol8WRJ957fiu9WFtbEEbI7/3MkOsVoVwENRPZ2ymTCitw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZhYu0qKCNS9xHfZHugqFGChf/J0tWx35z/EOMryIhw=;
 b=k7WFlWiRBohLb+mn15TvbCFRn+inhviAsWZbYlpheGBYoeAiDd76nRatNqU3Y/KCz+PYFXgvGdYO/t4ubu0z9EW8rgyxI8Av0ZpWkjiXufGpusJ5EQq1wcqkv/Lmvas584xnBAYcUkeYuaVMPBEsUowdty1Oj34FZvMgcBMXuEI=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA0PR10MB7135.namprd10.prod.outlook.com (2603:10b6:208:401::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 02:54:00 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:54:00 +0000
Date: Thu, 24 Oct 2024 22:53:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 12/14] man: add manpage for dtprobed(8)
Message-ID: <ZxsIRvjUwcpc-dkK@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-13-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-13-nick.alcock@oracle.com>
X-ClientProxiedBy: BYAPR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::41) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA0PR10MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0bb956-bed3-43a2-9906-08dcf4a046fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dkoTUspZYRxUBkHj96Akdbf9naIupuBCKiT/O9Hilw5hsccMy17iSzHdAva4?=
 =?us-ascii?Q?KnaB7+oHXuZi7V7dkzjveNxHy8MpbDls8+Iju0fudw7zyVGIY4QEAeUUF/6r?=
 =?us-ascii?Q?nQy8ys0jC/2XTv5gkSWD4BmwXyqU5zPQvErlRPoKItgnWouE7psDI6Fw+Qcz?=
 =?us-ascii?Q?67apYgI+tVuDm3Mpl56ED/47r0oZlmvQdWL1oXzf0UxhZIaxNAMDDRm7zGHA?=
 =?us-ascii?Q?gK8Ox4SiJL1ouJQESnD8abzXhjvAG2dxmoiyMDI5n1mW+/zFuneEed5ROHc0?=
 =?us-ascii?Q?KEhVJG5uDTZBHDLREgKf7oIxkBljLEx9HEc2vvnvYihN1vGAySWowLVxS8q0?=
 =?us-ascii?Q?DHoqfgLgZUvHlecWZFe3KlXoTONk6Caub9csUyDd9w7LAAUuWwqawJzzi0dz?=
 =?us-ascii?Q?BubQYv1dL5upmfB3fN37JNDyMwPij41Rlf4n3n6URyZqkozlvEHGoPWckDEK?=
 =?us-ascii?Q?BzuoCdOrXu9GSknY1aEjcaJdD7NU/XcGW1xeLrnuMECVP4FxfJa8LCyVNuJV?=
 =?us-ascii?Q?MIVGOnZ+RLAwvgRhQz5pQZ0Z8gJyimS6FSpCzCVGyrjQmqQPFs3dLglY6v2u?=
 =?us-ascii?Q?wmYrGVFTesBjd0kJ4dk9jDCF37N+Dm+nI46aRkrRtwGaKYHEYQW1OVxrYRfr?=
 =?us-ascii?Q?y117wKAzRp92yt0LhCUjTujp8jNRV1yTxNI9+ivOJCad+w+rrwlMx6bjR4SD?=
 =?us-ascii?Q?q6lrJOsesJsVB+uhF31sWy+KUM1c7W/MfYIfHaG0rUV/MMAJ1ggfKBDk2m9a?=
 =?us-ascii?Q?3aIqT6xc4DY8OjKEp4VTO9jk4G6F4VMm8j7ao3LREcTzgH+JP0nJUjHg4xFK?=
 =?us-ascii?Q?+hLRY/ZxClYH2ZyFNA2vuIUQXCojOCRHyQLQ6nZaak4c9hL8Rq4NuKQQuhrT?=
 =?us-ascii?Q?BMObCmjVRqZsb8Ltn6AMJ5rXoD1MuJzoCug86S2taBAqra27I9tfW+7p2G3J?=
 =?us-ascii?Q?BfOxonDWFWuSbareSMOhX5v/MtX6OBauBT8t+sNuWdPaq5m9DPLOfdis2YIm?=
 =?us-ascii?Q?m/Ag6lqk0t+WZobmr7jVlFZBDqz6suL+R6ncUSa+R0vk6NOzqcoBGZLImJaD?=
 =?us-ascii?Q?K1utuWNXW1PuXNj94BVx8qBg47N5AscV3Gao1cy1tKWxfSvQqrFxmmRhLUzj?=
 =?us-ascii?Q?2e6NWFsKFM8EabZw24MqIwj7o7bRwHfyLtppFAz9mn0oTQfnH2+FGdYyOTUq?=
 =?us-ascii?Q?ETvIZiF4ZrgTgF5edBg9iLw3w+NrQUHX8SXJZs0NSxp2SsxWpnwIejBJC3lF?=
 =?us-ascii?Q?+7CEjaYA4gZhPP2WkPZH76M4jfU+cM492AFUBDxZTQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c+EeWng0Xpq2v2JsrvTZSsohhKS7mG8eGAHFxQIe0gUWqH/utWfN/f0DcwVf?=
 =?us-ascii?Q?9aFuMmrMxA5Q9yolrjy/et9Urg4zc5heddhBcfg34lxsDEG0vmnmbrHJ7iQy?=
 =?us-ascii?Q?4DZ5KjkCIm8LGYebTcABHfyaCyeBK2mkCowEubOsODfb0E1WrjyLb8FcCo4P?=
 =?us-ascii?Q?1wFN5w2cV/a0qrxAiVS23tDpP6MRnCA8S8VdDFg0UI2/RpHWm3PIjmKeruBb?=
 =?us-ascii?Q?WpIAVcAlO0oyGdaUHGR/BEN/xsHAkeyIhnYue+jS5KVgAtM08YemdK+diUBv?=
 =?us-ascii?Q?ZgX94Z/JmNZTs/s+1EC0LGKvoFjjm8g18hbxWvp8Mi4hYgSwczseC48uuHPB?=
 =?us-ascii?Q?h8IlHjVOIsKMXjVqjyinc+Ro3WYCzwkGQP8gUwwvBFoThr7A+ohUriXZ+NFc?=
 =?us-ascii?Q?9ombK3lM63h26T/DBcq7kWEIVWSlSa1CaIPOmtGULLc5dntmH/EiTsQclniw?=
 =?us-ascii?Q?GF+IqCnClpAOnIbXHSgip6ivTDjsUwqhjar49x//5fDsBps4VOKbfEj9YLS6?=
 =?us-ascii?Q?u9KBuL9RK2RcdNgQzhYzNYP1r7nHfzqYttNBXQ3yiF+/bZCHyObdrD3eV82o?=
 =?us-ascii?Q?Yi+f9QdZnIZebKIrmikATfQBznK0GQo6IGpNPLZrsGNjaauRggzE6HoHtf6z?=
 =?us-ascii?Q?fReE7o73X+l+egDYPZA6p8BjyfXpKkxGwQTyp4PJg3zeFoMxcK3hIO0ZSenz?=
 =?us-ascii?Q?nipnjW4h7TeXlHjLseW0CRsFLzWfErAALsDsig8+aGb/sgDDf1dKmTNCA0oJ?=
 =?us-ascii?Q?Rg+f1DV6VwQ0X1d8lFHyukZlgzBar7hlQZTJVU5oBlSnH6kDJd/AVrPBuM1E?=
 =?us-ascii?Q?dkfjqwtPbHGi4kfnaIMCzY2aDDWz3YumEEwZvemeN06lrKTQPrzFcutJVvrL?=
 =?us-ascii?Q?GWAndL9hlYYrRzCTl9EzEQVPWIL+k3BdT+CYQ+GgrE3Xy3bZ0i/VuQBhsfa8?=
 =?us-ascii?Q?kR+c1vqTTSxVHmIXYoomZw9xrHgU6VHl55AkPstCorB+VDypYSjzlZEOLWB8?=
 =?us-ascii?Q?Fs6OtezHHW4U2pAyVsvUaOGKSe/5nWg3dInPkqB1RfH/V0jx2uh/PojmxCrz?=
 =?us-ascii?Q?iilEMuZexF15t+21HUdsS82HzOXtfHxDZ+q5WLOV5LAvosKyEB2LcM+bzX3p?=
 =?us-ascii?Q?dTxa8EvnWcOcTVfgVCDftKrJLkYj8hgtWc725QaeY1uCIT+88uecYyiwyY8t?=
 =?us-ascii?Q?BiLRBS2OLC5nplY2LuKY1ixUkvvoywE1nZ8dxjOkbkTuZ33MH6ZVz3OVl6Km?=
 =?us-ascii?Q?JAg3dckIdNksixwVCMudJFlJIMLT/rQ2Abs0SHE0s/AnC3t2Fn1Ym2VNR9Tw?=
 =?us-ascii?Q?8tgIRi2jWAvuz7mFab74R2l8wVT9fueCoZCcxdVfAf1migGrBZgZOmicd0c9?=
 =?us-ascii?Q?QpFJPqmc9yXV82MzfkKKWCcBufttO6a8fvKeoOK7rRWqg1owiIE5fq4zOsaL?=
 =?us-ascii?Q?AzQJctuHfH21EzLU1TUuW5GIXoWSMaGmm6UM254Wg3R0aSrgRXygUM5sP+JV?=
 =?us-ascii?Q?IkAZ7cZbfjrL1RKNJIjFyug3v8P9ChHqU575TE4xgf2IPGlV/zUedjbQ1y7u?=
 =?us-ascii?Q?w/ovoRlvyqtGP6YBCLcIbElror/KtafmO+6MiYzJa5a8OL6/c8ZUi+PhZzZl?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y/eNRR/Hky+k2y56g2uKhf0p3ZRSaJQmJLi1pc5INY5vw/cMiQvrNQu89uDXR5gYXiGHYFULR1MgyFw8nTH87hBaUM5x0ylUp65OY/rSXoPmmX49YYYzc1aAPIaXkO4F1+AhOOCSQ3JYxOee5k17oXiJKuamHFTiS5A3pDkulvQqyr+6QsgOBT+wPBUpmIhH2t71gCktx29loRpfUPdoDHIVWQXVorXmTkODtUqicujKl5vy0+NKmz8jviSCkCPO+6zQGRuri6ntY3v4KuUYsrKYw3zgI8CEqe0tYyfYwMo9zgt0VPQzs8VS3tKA6vi+maqKSKE1DFadgvo63IFIMU//RQkJuq5KLSn/Q86gqpTO/Fz1LOBZlJH0Kb4nQqeL6YLIERjamAWr0dfLgtljdcxKu6KG/jAG//9o6dyv5BqDmeSSwSMl/fKhTT/Aa8hDixGWvHZBXE4NhN0lFKVMvgIQiinGgGTGCGrpjd0HTpMuDu3fsVtGyf8+8ypMJfwfKQx+5TKFxCIGUI2ZuxdnQLWnfarySr8lnDSHcHjxPJ1BFfLgyI4EhIUQXRhMfwdECxATyS8WwhXXLvCXCdcrcozU4A7XSad8DIijExCYRAE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0bb956-bed3-43a2-9906-08dcf4a046fe
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:54:00.4043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0R5+/otj2UD2AKJcM9hHW+oK4ghP59HkJuLdJcy4yc3A93nv+JSxKIqYm7EfNmaoVmmikJbiZPtXnKk5CpzHYjxuWOsj67Cq6GibRdduFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7135
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250020
X-Proofpoint-ORIG-GUID: ONxqiQo3sCbwvI9LyEXw1xAUi14SbgxG
X-Proofpoint-GUID: ONxqiQo3sCbwvI9LyEXw1xAUi14SbgxG

On Thu, Oct 24, 2024 at 12:37:56PM +0100, Nick Alcock wrote:
> Cross-reference it from dtrace(8).
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> Bug: https://github.com/oracle/dtrace-utils/issues/94

Bug: before Signed-off-by:

Also (see below)...

> ---
>  cmd/dtrace.8        |  3 ++-
>  dtprobed/Build      |  2 ++
>  dtprobed/dtprobed.8 | 66 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 70 insertions(+), 1 deletion(-)
>  create mode 100644 dtprobed/dtprobed.8
> 
> diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
> index fb9392d29cb2..c299073239eb 100644
> --- a/cmd/dtrace.8
> +++ b/cmd/dtrace.8
> @@ -184,7 +184,8 @@ Options set this way are overridden both by options specified via \fB\-x\fR on t
>  .
>  .SH SEE ALSO
>  .BR cpp (1),
> -.BR ssh (1)
> +.BR ssh (1),
> +.BR dtprobed (1)
>  .LP
>  .I Oracle Linux DTrace Guide
>  .
> diff --git a/dtprobed/Build b/dtprobed/Build
> index 346cd6aee190..7d98ddf836c3 100644
> --- a/dtprobed/Build
> +++ b/dtprobed/Build
> @@ -57,6 +57,8 @@ install::
>  	mkdir -p $(INSTSBINDIR)
>  	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
>  	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
> +	$(call describe-install-target,$(INSTMANDIR),dtprobed.8)
> +	install -m 644 $(dtprobed_DIR)/dtprobed.8 $(INSTMANDIR)/man8
>  	mkdir -p $(INSTUDEVDIR)
>  	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
>  	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
> diff --git a/dtprobed/dtprobed.8 b/dtprobed/dtprobed.8
> new file mode 100644
> index 000000000000..145cece1840d
> --- /dev/null
> +++ b/dtprobed/dtprobed.8
> @@ -0,0 +1,66 @@
> +'\" te
> +.\" Oracle Linux DTrace.
> +.\" Copyright (c) 2009, 2024, Oracle and/or its affiliates. All Rights Reserved.
> +.\" Licensed under the Universal Permissive License v 1.0 as shown at
> +.\" http://oss.oracle.com/licenses/upl.
> +.TH dtrace 8 "22 Oct 2023" "Oracle Linux" "Linux Programmer's Manual"
> +.SH NAME
> +dtprobed \- USDT-tracking daemon
> +.SH SYNOPSIS
> +.SY dtprobed
> +.OP -Fd
> +.OP \-d devname
> +.OP \-t timeout
> +.YS
> +.
> +.SH DESCRIPTION
> +.LP
> +\fBdtprobed\fP is a component of the DTrace system that keeps track of USDT probes within running processes, parsing and storing the DOF they provide for later consumption by \fBdtrace\fP proper.
> +.LP
> +\fBdtprobed\fP should be started as soon as possible after startup and should always be kept running: processes that start before it may not have usable USDT probes.  On systemd systems this is usually done automatically.  (Restarting on upgrade should also be done for you by the packaging system.)
> +.LP
> +The following options are supported:
> +.TP
> +\fB\-F\fP
> +Put \fBdtprobed\fP into the foreground: log output to \fIstderr\fP instead of the syslog. (Routinely used by systemd.)
> +.TP
> +\fB\-d\fP
> +Enable debugging: log extra output, and disable sandboxing of the DOF parser.
> +.TP
> +\fB-n\fP \fIdevname\fP
> +Name the CUSE device something other than the default \fIdtrace/helper\fP. DOF-containing processes will not connect to this instance unless pointed at it via the \fIDTRACE_DOF_INIT_DEVNAME\fP environment variable.  Using this option is necessary if for some reason (perhaps debugging) you want to have two dtprobeds running at once.  (They will still share a state directory, so DTrace will know about all probes discovered by all running \fBdtprobed\fPs.)
> +.TP
> +\fB\-t\fP \fItimeout\fP
> +Timeout, in seconds, for DOF reads from the parser child.  DOF that takes longer than this to parse will be discarded.  The default (5 seconds) is probably always reasonable. Setting this too low might cause legitimate DOF to be discarded: setting it too high might cause faulty DOF to block \fBdtprobed\fP, preventing registration of new probes.
> +.
> +.SH "ENVIRONMENT VARIABLES"
> +.LP
> +Ignoring internal testing-only variables, \fBdtprobed\fP itself does not accept any environment variables: but programs that talk to it (any program that contains USDT probes) do accept some.
> +.TP
> +\fIDTRACE_DOF_INIT_DEBUG\fP
> +Output debugging messages to standard error if set (to anything).
> +.TP
> +\fIDTRACE_DOF_INIT_DEVNAME\fP
> +The full name of the helper device to send registration requests on: by default, \fI/dev/dtrace/helper\fP. \fBdtprobed\fP is listening on the other end of this device.
> +.TP
> +\fIDTRACE_DOF_INIT_DISABLE\fP
> +Disable DOF registration entirely.
> +.
> +.SH FILES
> +.
> +.TP
> +\fI/run/dtrace/stash\fP
> +Private stash of DOF.
> +.TP
> +\fI/run/dtrace/probes\fP
> +Parsed representations of every probe.  The parsed representation is shared between
> +.MR dtrace 8
> +and \fBdtprobed\fP, and can change between releases: on upgrade, \fBdtprobed\fP should be restarted, and will regenerate any parsed DOF that is needed, so \fBdtrace\fPs started after the upgrade will still work.  (Still-running \fBdtrace\fPs from before the upgrade may become unable to see newly-added probes.)
> +.
> +.SH SEE ALSO
> +.
> +.BR cpp (1),
> +.BR ssh (1),
> +.BR dtprobed (1)

I would think this would refer to dtrace (only).  There does not seem to be
any point in referring to cpp, ssh, dtprobed.  Copied from dtrace.8 and forgot
to edit out?

> +.LP
> +.I Oracle Linux DTrace Guide
> -- 
> 2.46.0.278.g36e3a12567
> 
