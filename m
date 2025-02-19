Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46363235341
	for <dtrace@lists.linux.dev>; Wed, 19 Feb 2025 22:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740003201; cv=fail; b=n4y4cSRxrhXjUZ+YGvCsbpGc67qlHn/di+A1UlqgcBMANJa+e2Fwvr5Tf1mlp6lZbVXIXWgcxcflTQVhl86b7k32rot/UxA63HXyyYjeWldKdI6oW3NfdLagMjwvkbhdpCFYPahDWtQEdhb5MRBJGiQRYTlLxjhWjVcW7p+7kVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740003201; c=relaxed/simple;
	bh=CvVeaIKG2Whnt3GE46QMIfaHyPfxZVopjjTzl/wMR6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GIRXDlIYHve3F68SX65gG8CyBOGhC63Cs86+SUKRrw6tgyR/nbSPSoRLCOqeM5EfXkpfqRFNYBUBbIQhjmVHhQ5g1q6xnIvghT3bcGxfzRice+urK5Xi9Q5SDQ/ZVkZ2xzrjZm8vgjt6Phhlg0KfS8N/mcT9oKTzI8c9bP4AswA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K2apUq/i; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JC/ks93w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K2apUq/i";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JC/ks93w"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JM9YjJ020559
	for <dtrace@lists.linux.dev>; Wed, 19 Feb 2025 22:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=aAf/4OSrF9wgy5g0DB
	xHZIWRfukHfiWHQpycnTLXFnc=; b=K2apUq/i+FH1yUQEIYgUzE/1Fd53JwKDt2
	141F/Lf20n8fnRGDFjW85vPiRkC1SDY504bQYVIIi3+xCvrl2PNj77TFqYTAuCP1
	O69p89sQaJvakmeuK/v0dh/18lqnofUzvrZpTUF6eTN5dr1uTV0QbYEyEIUjreYn
	FVribQQVrcl+XVBGAqd+C5S7VuzCV5o1EPVAekraU6R+d6tF3HZeT6g6uMUqONLo
	p0qXuBKQ9jpmvOAn5m4uBMactvvpx67Szdh3hSovTJoBOwvNu63FWoFDNALx8NOS
	4GLIXR1gyrbyk7AypUbFMox3clFts5nybQH6IN1Ymzr2GOx/ItgA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w00m2wvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Feb 2025 22:13:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51JLNU43026518
	for <dtrace@lists.linux.dev>; Wed, 19 Feb 2025 22:13:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44w0spkgbg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Feb 2025 22:13:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTVTFKSCNENDbRw9d/JpN3T+swNsiHd60nU8Xfcu/s/9GCAFa+kqvGnOsyYfYOurizCuuVit9gUjHMpDtQn8kX9SsLXS/zm2M7YG+wC6iABOvzAg/ipve4HX5HWLujxg5Z9bkQi+YaEnDmV2YGaTQZUe3PVUinNzYUPBKSXSWclMkE9w6wsGZ5jEROLTYAp8UqibsV8o0ORkQ/BOY2+0XjCPAtCdfIv/j+WN/SiqqUOv5XAUwVVorah41CuTwP0AVgbLngMSXTaSNAZitqiI/6gm3mm9eRubBDNr4NqwwhDC+Z4scdsdrtoURmBTOYkQx95vLnhlA+r4xmhzb9PJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAf/4OSrF9wgy5g0DBxHZIWRfukHfiWHQpycnTLXFnc=;
 b=LHWRXJSTQdpiMwEHQcHtDXrdPwHA5o3ofPPAiav98wsv60ldVT3cWui+DHIbrriBf8AGj2wQf0nuahcPItk2k/TYfzFT/BG8Nhtw9F1vK+dtWcb7ap+r65enr1ZEkLP2URt6+61UuS837oAikgcJoTsmalLc+7+cK2C/6jzOXjTOvJS+6rO1zfmanmi08/TIWg3d99Qrvqwn1jmOfIyEoVCbWokxxgEjGRXCJHvnp9DnL7+OmjQ6D9YxAsZAFDa8/Y3ac7Hr1lkO8OCo7CqiwNVWGsyg9CSASyQ1Juumhh2vvGCJ4BJeOxDWp33JwFf6CjCDfNjGYJnyzx/6oc5Mfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAf/4OSrF9wgy5g0DBxHZIWRfukHfiWHQpycnTLXFnc=;
 b=JC/ks93w4krqdEvvU/J5hbtXFi4X7aWbvsUCwPaK8/asdx/7j+WhkpAhOgjr+EjZEJ3Q8hWGSdz4X0zmleLx+Pq7i88ZK4hTQqhhi08qSdY6t9i/xJqnq0Rgt8LYk15lJQSRC9SzpUcKCNjrATEemWYLKh99Te+xeZJ8xA+hKGk=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by MN6PR10MB8045.namprd10.prod.outlook.com (2603:10b6:208:4fb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 22:13:12 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 22:13:12 +0000
Date: Wed, 19 Feb 2025 17:13:09 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] Fix fprobe/kprobe selection
Message-ID: <Z7ZXdXnhgtHQW4Ju@oracle.com>
References: <20250219215142.10568-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219215142.10568-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|MN6PR10MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c12ed6b-71e8-496c-6039-08dd51329954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Op0VJtafogvNjelWs6CM4hglaFgQCZOgw6kX8ULqwSz8JyEZPfI1XZDMUhba?=
 =?us-ascii?Q?uaHxB0QINqOqkgzybfVZomt/XDaD5AY25aC0dTkpFSyqx1AOjdQek7gHYeCX?=
 =?us-ascii?Q?Z9pU+7q6BZysImoZUgJ0933qDJd1t24JXMcv2mVnP9ra/F7ny1yMrtkmok97?=
 =?us-ascii?Q?mmIDtJMLiXVchkDfQQSriSOvEVOPK8j2+wliqMu65kW2nJw3GS+d3gXVt0WF?=
 =?us-ascii?Q?wp2B9FXV1u9qpDbyNLXvPCAJ2U5BKCzy6gJumOBq0nKHGi/v3C0EjUj65N0n?=
 =?us-ascii?Q?cJzK2rb104tzp5ipYp1MT9CDobTLr0hdQmBUHUmPyp2PjWr0z+3lSbC3neix?=
 =?us-ascii?Q?2htDjEqLpNY98u4JWUq4idBcN4y4E0JsQt9uEAJSrH563iIBjfggUo+8ytJc?=
 =?us-ascii?Q?2qRPCV4n1++Uga9p7fgp8JMf7I3/l0gT6QJiCC7kOjjiLZR32VvH93K9rKm0?=
 =?us-ascii?Q?WYtAp5PbSeTC40kGlkYXmqIXZzwqtLQEEMCpF468k1LvJ0C3fMixZclfPn0f?=
 =?us-ascii?Q?e+TaswQatNQ8nKSXMVFBrmP1PHcOXEUX/uC/wSguaFolKLF6XEjF+FrT0Uzm?=
 =?us-ascii?Q?yYdti+ReTR+Xx7XMAmlYvTM0zvEihKVx0W6cO/WZXYpkW9Nz2y/YQwTljdfO?=
 =?us-ascii?Q?coBTfshXQrhud0dJzNypAwwOsQnvkWw8zATQmMzH+KqLDgNhU0mLC1X+/Fow?=
 =?us-ascii?Q?QLdQzUZaB9celn6x/bb98ji2Nq/ofQWF6gfSW6YsEPQu8Zt2MvfpkD/svUYA?=
 =?us-ascii?Q?EWVy21QdH+143oEEPC+wvIkQdHKyHISeXqDPOsen31ql2loc4SEz4briHeyG?=
 =?us-ascii?Q?bJ58mer6H4aa4aPEIwIdVv9e0TT4nHso1PWuyxhMGW+HebjqpjteL7S+Gkus?=
 =?us-ascii?Q?b8iRClLDeQJZxBaa8162lIC15C+9MBsI4k1rSqGY56FoNhDCO+fMVGUHfpVO?=
 =?us-ascii?Q?xDhZ0pyhisFCeVA5j07p/kXO1tgl/6djGpqZmtP1UCdJqB3YvrF9NJY254OI?=
 =?us-ascii?Q?DnFIJx/nv3fH8gkn8gwwNYvUx5BXRf26JGPiOLF+qUrOTxg3KQ8X4bTO554s?=
 =?us-ascii?Q?1IcKTvB02KXDhE+OK+3Q2LUXycOmnaqj0oulNBCW+puPpIsEHCJIW4V848kE?=
 =?us-ascii?Q?0XZG1f5bBysW/xekILQZ4GrC4lujzaHmZiWTm6TQJOykH+yH0EHu8PkqwVvN?=
 =?us-ascii?Q?50bHzw0yrwMwAQzc/h40JXLnj5LQnOjlUl/XuYUxGvQbb5fb2J0o0+UWGSyI?=
 =?us-ascii?Q?A6z8GerOHbpM5iZntIstODe7DPP2fS5xOBrSCKPF3k5E99B68SyZRSF0XqhY?=
 =?us-ascii?Q?gdnC58URoxLjfdVAgtw67ZcdKg4sSItVJpSkdf21wTAgZ9rD8wfA0SOrQIsS?=
 =?us-ascii?Q?3MrNRSm5K3tQWu36k3DKczYwZAsf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AULfaR+UV4H6MtTzJfit50dttGM7MatCPEFMkgtF9zVdyuCz8nUFQ1Jj2kGx?=
 =?us-ascii?Q?8thstsrwlRC6TOmnmcvNGctm8JNFCMATzVYWm1j4W5D+8xfoyvkSzy9Diu8z?=
 =?us-ascii?Q?Ov8HhW/26Q4p7xOjCKOvvZEEpN+BDbw9k4VfQnKYnL6US06mhNmo4/Qf0nF7?=
 =?us-ascii?Q?zMBQnnwq9oO9GdW7LLpm1Db0Qpz5qgXgYUn2C4Vggs7fsgGdcDj84etYjbva?=
 =?us-ascii?Q?jiEEAczBArL/EwhOg4fyneAllLXw1bz8NziVbXa+mMBMcbpLYJux5iLT3h+V?=
 =?us-ascii?Q?dqPFV38Qw/qDolkzrx7XjPSnZl5zkzpgt7v7jlFsFLyiB8McreF1ThZz/fI/?=
 =?us-ascii?Q?VEnPOBVlwLL+SlCVIzqFlI4eEAXYtM9tfKvUhaLdugq2dyAanROz68k/736J?=
 =?us-ascii?Q?QBGVXIzmg2ldr2zvvAbPYYcPXnOWifrVgUcgeehXAyYjNotagQ59602LXt7X?=
 =?us-ascii?Q?s+FLlwi4GjsDZfo3shnIcP7HLl1Xsnyt2DZln8EqnmlJriM+XDkcwooNAjwr?=
 =?us-ascii?Q?CNRU5YUY3En3DIbatuqGgzmgT4IbxPbgrDTzNrPrsWqjnHrsgXYt+X7vPeSB?=
 =?us-ascii?Q?TjzOq0bZpbp8m4bc8Yaz5kipzrt0VdWul/Pirj9CY5zNf3dV0EIUaCB7NQY+?=
 =?us-ascii?Q?YBELjYGYNP/gSZrvvWQoBGNdWHEK1woVuBnYv7vAbNcRrKvsH8tdTuJe+CAA?=
 =?us-ascii?Q?Dz0ULDdYNKNJa6CwKlC3e7apns3NGEduwa2YC9rbaRbu/M2/303m/u7hjEjc?=
 =?us-ascii?Q?IVm8B2f6e9bd/DUAWeceYZpVI+iYirjXe+GNdGYVLrRo+Ev0LexB8DHltC2g?=
 =?us-ascii?Q?1M4iBJYryLeAHvDcG0zfUkphMsO8EBjqGoQjuyD2Q/oqKLySkU75sfXWz5R1?=
 =?us-ascii?Q?lmK+N2frCKgYakpzZzSdg+7Y+og3rIfeDHp+t+I5f6Im/J1ZUIfLY/UMxJPi?=
 =?us-ascii?Q?09oqXc1jpaCUfpdspsvgOa6XUynRBM58TLQotCnzYTI8PLFN/OjrhIMkxKXV?=
 =?us-ascii?Q?O6KWscm/+PcMdobtE7Z5AsrgLDCbA00cUdpg1ifT8IaocqXomnMdX7iisc0X?=
 =?us-ascii?Q?KSnKBK3hGF3Cgid3DxwfG3Pz8mg5DmJCUNIUtHv33Ozp156svXw+668B9IcP?=
 =?us-ascii?Q?EHYPxRVMe7dbZgQZDTc+tMLyqnduYy6HlpmD/RpIbcvbL+yZd8RZHUa5S8mM?=
 =?us-ascii?Q?jikxNQUCQ9RIOVYAnG+yCjfydoW5U5Rp0owdMLddS6bqg2lcZt55KI6TMjNw?=
 =?us-ascii?Q?RSXp8gUOEYvmXWWn6WNPGYwG+/txIOLD9Y+xBqJKjdDMpNFMoakuIGRiFghz?=
 =?us-ascii?Q?TKWFvFxKnJ3TiEmb6T2WfGAn4bLgAkULqK+tcjIBLv8gaX07wD1thtBTxAeT?=
 =?us-ascii?Q?8hN74g4R0aXDsdu6RcfqzfJVdBQwwm/pCJkJYgXY4KPW0Iq8Ks7C0k1GjcOS?=
 =?us-ascii?Q?mydUv34QwiZ8TnOOloOuqIelaNx/c8pgKhMqKdAt2b+ScMc3nN0CIS/7qgf4?=
 =?us-ascii?Q?CJHaa2Hc74LUrqCqMUjFwzMiwrEsm7QQI/VTJFKpfo0aWr7iQqOvK4N1TI5V?=
 =?us-ascii?Q?CV3zu8YLkpZcsm/MYegX8kZcY5c1jdams+3Xc88IhSkTCt/HhgUk197w0Byg?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ek27NIc67oOzrp1ugQNYajVflv5eP/icVqC1VK7rEQcMrG6EoWdNkPauS+BB2AzTOu8G0xlzuvWo05PtC2yAhpAfmpq2klp95RrGOAHCiETDuDIORXRvEPufr5FSBB4S/2/Bj0UcyivdZopHkyDwwbNiLVPYdn+t6Q2FQoOvjDNi2DtYF54A2q+E8Yjctyfbcx21UyA+UrwpJhjjsZOIKoUVmovsDc6dREAt3wH8NjMsRg1Sh7lE8Lwxlw00MM4pUNlS3kZdNwZnHuaAqHSvJpXAu334a2FLMlSh8+VPXnKGhi94vfaH01LCrZipN48YtsAeGq/6DjfcrgAfI5olNmsA7U62j9osam66LeBrhHsH7SkANNIMUgyNUslqgPlkETQ61X4wOueY8NcaWMjtuw0Z0lxyVUSRSaYByeRA07rxVceM5Wq7bw0XshNDgm+NtDjzPIa9gGU3JMCGq5Frj3uAraXG9AmayYDdHTGnFoV2yP7+BhRFibySxuc0qRymJyP9XBtUDjSKPLlvvaMEYQV6k61baO34L4CG9MBpGb+azo3n5qUvWY8zoKQd0q0zAuUqhGPSLKXPCMmEO3c3Fi8VHzrpfD/3D5Ztjehw2bc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c12ed6b-71e8-496c-6039-08dd51329954
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 22:13:12.1190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOpXRpcaurHxsCJR2lHcsmKYUL+Aeo3fxLBLTdXAxxI9hq4x+KT6EIroVWxSn4s4O52SQ9jk6u4FahwOvRLGL4Iw3aQRSSDXzYa7DcpNv4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8045
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_09,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502190165
X-Proofpoint-ORIG-GUID: UH9XR6VNLk9bvMMKwpZ8EZhaHt9-PCud
X-Proofpoint-GUID: UH9XR6VNLk9bvMMKwpZ8EZhaHt9-PCud

On Wed, Feb 19, 2025 at 04:51:42PM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit 2a09b3bea504 ("fbt: clean up fprobe/kprobe support"),
> libdtrace/dt_prov_fbt.c populate() has this change:
> 
>     - impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
>     + dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_kprobe : dt_fbt_kprobe;
> 
> That is, regardless of the BPF_HAS() test, dt_fbt_kprobe is chosen.
> 
> Restore the choice to pick up dt_fbt_fprobe when appropriate.
> 
> It is hard to devise a test for this unique problem.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

and my aplogies for introducing this problem.  I believe it was caused by
needing to force test verification in the case that the kprobe option was
selected on a system, and I clearly forgot to revert that before preparing
the actual patch.

	Kris

> ---
>  libdtrace/dt_prov_fbt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index f0910c371..eef93879d 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -75,7 +75,7 @@ static int populate(dtrace_hdl_t *dtp)
>  	dtrace_syminfo_t	sip;
>  	dtrace_probedesc_t	pd;
>  
> -	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_kprobe : dt_fbt_kprobe;
> +	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
>  
>  	prv = dt_provider_create(dtp, prvname, &dt_fbt, &pattr, NULL);
>  	if (prv == NULL)
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
