Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333C1CEAAA
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726331712; cv=fail; b=Snc307qHbi9D7lQ1DlZiZ7Z1dzT0SfQFuap4oIKEP2FR7ycRhLdy2KZ3nYVnLCrev/hlYz1pZxt09oXu+zQp9lpLoB+RtQmgRRgOHXfFGp7gKTPEnQPyPJK3snRLOTmZtKzlKbOUkQTkJLMTxjnafYL/53nwpaWphdLR+dnTijQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726331712; c=relaxed/simple;
	bh=nTo96Qhfe89/epxmoAn3R83Va5WL5q7NtOXeUZ6YRxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JOLF+aGXBtMxf/fQQJ/P3V5kRy6C7jwpkn50DKeI+DGTYS4PBmbZ3Jwr0Eo/+uaUmh/4eS/MSN5CBAlkC+ydsMep/i8SB26PVtyqtWtq+M+Pwz91PsBInF7rfpF8xgJcx78ctO7DyscJKrN1tFwIxrV9O+W/gjbLSKY1dvNMKPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iRnWukFw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gCpQ+hq+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iRnWukFw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gCpQ+hq+"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EABfNF030374
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=elsrC05zOMi/T1t
	9SK6zEgJDN7VIeskSEI6SoMNPDg0=; b=iRnWukFwTIwbHxnLTB3QzgrnvERsMs7
	NtE2kzkj/EqZzidB8nfz1OXSbK4hw9CMnr9QK5uZNG5dPD2Lhaw7N60xKdlQwaan
	FifgEVrFBi+aho6AttThi1fw/SbAhw5fSkpWc6ayX+hGstgwpEMuRgAcdPDwSYj8
	T/u7hP4FLS+EF3pvasoEI73biScZghkYDFsLjghwPvK4VhoFUfOu3GOui5uNGSE3
	nc+Im6NU979K/7Aaq8gBSuUeP0mHdVSHvwUEzEnhja//P52fwTT2u+uzd1TQy73j
	dLaAJQpa5FagBdhdxkQKw1nv3TDkmfNpUE33VDjyJzH4L6glo+oaueg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3n38kra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:35:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EF0F1p019554
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:35:08 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6cr7u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMi4loYM792gwknDxiKy0AXh+c2kRJJASUHHpgd4kw5nwQLp/dHOAUAflgY1t8buxmq9GPI2BSj7oMpCjMYSKlBHYMwBrtsdO1aUAruSEkt08f+DaTnJQ0NMm5L296JjsThy49mHyu8wwmQDXrK4DTWyFL2whul8APPcOyiRwUERMIoQbii2JeRe4cke2484IWOd9LmxgvOsLjeppuB9oVLv9ZXiABlNWulVt/sQw8JwctXS6TPJp962unF2h1XK00rC2Jdzdvor+2MBaMHm5toR+fRu9XtPqYh3ZpzJic8+qNd+ilGVdy7Dcg3/oJxLLkHomlQvqirP91X783Zx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elsrC05zOMi/T1t9SK6zEgJDN7VIeskSEI6SoMNPDg0=;
 b=sOgctpkylJnbBlISvFbZXCkJonvL792wzCHhFoQzFOd9wGlnJ26ISj8bff1fdf20nyNsAF7nSzEB1OYBgtsPjCv/pRdHqw23D08mws/nmy7XXF+56br2WZjYLcnnQWP+O0Sd3ZheZpt9cFHDAR4qmRzKKfATufo/LGQvH2mrATXKUgy1La3xH/IlmIIt8W1DETS2uNP6ePotHgDEeFwqD+R6ZBqPcBLAGWJKZ+KbsFuXCwq7hWXY2gcdd2G3CpGqp8Ly2ur2jkkBuUSBIUsMhuZhF/+A3kKZ3CSblSpknrKiv6CEmfCq1aXlKXWeE9KNVFJMRdTt8I6sH9q3aTn4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elsrC05zOMi/T1t9SK6zEgJDN7VIeskSEI6SoMNPDg0=;
 b=gCpQ+hq+T+7qKkBOTdIJbzdAS2ADZvqOnxxDp57q49Psq/EYCovke4FgP0aTF5sOFBZQDwlWfxyoug3/XIxn9MaLVLCIffBdesg7nWHFxKg14gbXM+KiDQRGTjo2k7FDPOPCDHtjZv36Lo/mR58afh0Aje+NT8wEw7IjdjZRtw4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4798.namprd10.prod.outlook.com (2603:10b6:a03:2df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 16:35:05 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 16:35:05 +0000
Date: Sat, 14 Sep 2024 12:35:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 11/22] DTPPT_POST_OFFSETS is unused
Message-ID: <ZuW7N9w1ZPXPt4+X@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-11-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-11-eugene.loh@oracle.com>
X-ClientProxiedBy: BN1PR12CA0003.namprd12.prod.outlook.com
 (2603:10b6:408:e1::8) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: 5754bfee-a251-4e13-0a3e-08dcd4db3077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wa/6xZqE0Zt0EpGytGuhqoevU+eWPi2Jpy8+2nZW2u0gy/mke7FuQ95t3tC4?=
 =?us-ascii?Q?S4I/OHkzIjrJm2fNMqgO/MtEdHlA0L8c00/QLPxjgedAjBlOhdgP8rdhV43W?=
 =?us-ascii?Q?EhkkEZfea12oitoUKNxNDk67sr5v/XCfXTSIHtKje1WILtPA4mAvozSki4LT?=
 =?us-ascii?Q?WxOb5HtAR1IEVFPl5S2dqvR0+xlNjcbu0WPuqGrujs/YArrw21SviVDdbHzI?=
 =?us-ascii?Q?dQ3fNHOquaYbBMjzerhzLT/LbCyRaBZnsTTqxYNmiGDvjxERATR3Bt2uAqNr?=
 =?us-ascii?Q?mEKnPFMFwnKmyPFx5WObpAxPWkDQX0Pq0AJ6UpUAFTKctAXvx/qK6cruB5WH?=
 =?us-ascii?Q?S+bIDyVL1O6J2hodszIqIIv31G5J/AC8JZ780wP51rvrv2xrf7Js56tfcgoB?=
 =?us-ascii?Q?pVPNJa8VJj4q6Ivn005YPi9doGa5XbmkZgy4DkcK0TZJ+G+w/j4m4L3Cyq1o?=
 =?us-ascii?Q?zA75WG49lZ9DioVkI9ol/ffum+CsOp8ahBSWzfCbTlQVXqHK5eP2gzE424Gh?=
 =?us-ascii?Q?hg24pE6HxWN6EjJGkSpqVE0FDbrrzvRJjZt5gc1u4p3pIJKCJqWi8WgR+MwW?=
 =?us-ascii?Q?9PqG0Xpvc7V+8KrXQhPvYbI5L6T3jGKZVKzt0Z5Bk5TPWn5+R/Ea61lnhOm4?=
 =?us-ascii?Q?vMCNk0vdyzauLqyWAZts9vi8fH+OAFYkGZWqDHNLyKr4J+UMVXpsZx5YNMIm?=
 =?us-ascii?Q?UHAr7C+5hctUpNMiRCy8GlNDsqkh59bDMj55OISzkEmBB0NDYEj96ewXdjOA?=
 =?us-ascii?Q?vo4meAfn+ktb+lNg+kTHZPljHNeqTNO3ZFhOGF3CbyONGCP5G2KbxOF927WJ?=
 =?us-ascii?Q?59kdeCbVSLbynifFDVwA3YboOuKcUdIueIYl4/+twowAPPV+Fy89EJzoqbUZ?=
 =?us-ascii?Q?HG3L3mvVzZh1N3Q4xt7BT4G6cZKqpH7UCFXyW5FatiEMZQzryi3BNucFJI9z?=
 =?us-ascii?Q?0pgpGPwywEaN9UMykRI2TSQ6Cesr15At637HpO+/Y+J7i5hkYHcs/5UFmkNc?=
 =?us-ascii?Q?DoFD0C9uWNV7HdS29xFm5fVF5saUb8OuvMWuJlbFE6+9jwFm6aa9e4HWXXqP?=
 =?us-ascii?Q?vZrnP47IoT8CEiq1KI+WS1myaSz+hZqfIvvTPzXxW7ltV/4LzRjvfqjuwJk/?=
 =?us-ascii?Q?2lNNtZtzYy2BrQQWj2eVBYxy0wNmXRxFZDcqOpaMbG160w0wekX+V/SNud9i?=
 =?us-ascii?Q?xUVZiADA9ZpqwwLYEs7y6b9Dgh9zSQyEtqaVF6llOd61UabE3Y6RXk1q3iMP?=
 =?us-ascii?Q?zZIbhBlv9Khg/m1iZRb+ro9IOKf2kkjIKJkWylu3MLjreIWMWz8wfSzr+8aL?=
 =?us-ascii?Q?Ji6NEu1A9aZBtL3cHMospZqM3EtY8rEFNxSstYi3inFoNQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lFUAOb6rI7Fh0jtMr3R70MvHQK7gZaLZ9A9n+HioTbBekMsQ7FBPqz/loyhW?=
 =?us-ascii?Q?6+mNIY7jKZccONeBpi81ulHs0fYSEUs11c+j6yrjVuMKKD72u+INfLu5MZ7c?=
 =?us-ascii?Q?2Wjjtv2dTRyOCm9bIcIGVhPTLJgQw2f/AjP/fj7ZR5bajrV01UPn7AfyyI0C?=
 =?us-ascii?Q?tkS0D91fzEqdmIKZdbtX2uUQV1HfrGWIHY3/kqrYz5oRjDnjmUgrjaUJqqPy?=
 =?us-ascii?Q?8Gl/4hekHOPMvbf6+E5+6ZWZ8OZUGkK7umBRpM6toJHnbjpBXl3/JU8YeUHP?=
 =?us-ascii?Q?mT6wfMvSAoAiDSdSuaXOXlZESeT0s5ZZqMMnNlf6lrnQwAGOVf0JZaYk9Xdg?=
 =?us-ascii?Q?Q6ZMEESj3MccvMa2CdLE5SGfssUEQ+OUqpgjSonQvXwriy6uzsjMyZ3vQhr7?=
 =?us-ascii?Q?Ro1oouVm6dZVvjkN5lR95qwNSD2Kw9Zg5fIVjpQxBbdpaiyYLc2QkPayzsEK?=
 =?us-ascii?Q?mkLyIGu2W8eQ8H6bjl+B+t0UW0y2JfunZi1sd7cLU+1JY01YHX+KDck+itUG?=
 =?us-ascii?Q?ULzJTweW1R4lI9OUp4KurgO9b75LFrExAzUrCyN6d+9LnkOSj1y7SKTN+/Yv?=
 =?us-ascii?Q?n0YVZmLFKKx2uIcL8xxwuYvkT+QcooAhTWB49C+JEtRgZ7Ls0fc/DMmtVbAi?=
 =?us-ascii?Q?wGbioJ5nV1Jv0cJoftKO3IVbmL5s7bmRiAp1elemxC3wVrbAxe953InbKIHY?=
 =?us-ascii?Q?2xuvhMBXnSUW4j58Pp4d7NdcAxnvp4giFYIR2l1R4/iHWXqXUSjyaP6Bp9bm?=
 =?us-ascii?Q?OUjeSAZ7LaD92dqPkh5474dbXGnx7q9GpA20KSH1cfRBwL2x1sTHX3Zy2W98?=
 =?us-ascii?Q?TyMJNsfRgsuWnjkOpjUmUQbAyf8q7D/+eVfvc7TXbt2HaWY6xoDrL7XNoXYB?=
 =?us-ascii?Q?nkGf5WyGC3L2rAqJI6VgTT+odN/IcUec6Dii014tMZRoaCr6QJPEEZKjlH0W?=
 =?us-ascii?Q?7se+t1YSnapfFVvtqXlQRx2g8PaNibI0dtqItU4yw6ArYS95eWVAwMPwOeve?=
 =?us-ascii?Q?VQaDzOFuRek9z+SQPKejM4el3C8kRtOfqvy81RlN5LsdiYfSkl9+LDPTz8IJ?=
 =?us-ascii?Q?FCF8EoWUtDkK5svl+GykNgKorz7LCni2qoF2xt4NhREu5P3h+tZI7Bsi1/5s?=
 =?us-ascii?Q?hR5tttfuZHI0dmPF1R79qMlh4gRm+ead0/WOAbNl8zsYsRDzZctpzVxxNHIS?=
 =?us-ascii?Q?bAUhJ287mE9j2Y6m/GFz6lc2Dwfpqx2oQpVoKWEeDlPj/fg2g0lOl0i5SjvM?=
 =?us-ascii?Q?zK8T+BHJGJR4WpWfIoQS1v28JK2uUnX/JK3NjkJYHbOxwIM+uU1Gn/0jbapQ?=
 =?us-ascii?Q?2cjhqNtqLpE+b+ubD+0+hj5miZip05jRuMTTIjYp/EtWDtE7LnQXeKhltXCI?=
 =?us-ascii?Q?rCY0xPR2sTfAFsvKgjRvBYyUwZBqgKhtLyabfCD6UP1Ea0QWMLeGosKm6IA0?=
 =?us-ascii?Q?drrbBRiVQyE3laRNL+rq+wdzNR/xOd9D53kXNY8fAGsHBtBf1ad7lUQtFmWN?=
 =?us-ascii?Q?o8kuJ7yTVkxUJ4KseCaMutHCcXhBnlODsHmRracPgwUEFBn6+XKpETfDBYks?=
 =?us-ascii?Q?Hx9eFIwOrU3Yv25w56UyrG58ER9QEkI//rFIryCnWYnUQZYK8ALdget/x3xl?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ea4zhCHgs1W/YKlc0/D27fiNE9ETuiIWcicPMGPa5DsbZcWEJK5cwiGlMlnV7/mSmuC5ghbpsF0sOgK0Pk9pX3vf4md9nbTCQ9oO3QhTRELJ5v/+cRGfJXi7Q4sY8ngrzA+IJWtRy2USz87vDh7QJtK9c2NZAeaR7o/ZaH5IjI4ShvGtHB5t702DxZm7QvaTpcWUA/hTgs1HxlxaMarupkKJN/P7Lj1d8o4pG/CamVUHY2wyl0e0wcAWXh3c1WoLeui89VnlPJyvWrE5UHLr9PmBjIuRCvYjUupjnQ866jJnct8iOOFLP/x6iNHU4SNqkrcGg+O3K3PwlhO/DFthnM1teavDGBJhoCnmK+5PxB6FKUcTdkLL+2MSUvXDXGl3m7yFSKeVGkOKg3Yc4vRv2x7VqGmMsKAEN61n6pJmuGiY+92WOtmZ4g0gqToS1s2VfiF2DxwzdZT+X8/v0nGP86vH1wlVa4+0hU4bOTveKQHaaEgbGb+aDSmVXQ0bpK47EtL5kGBGta5+wKGdT1qhc9PalujYpqZdke04LgWi67MExNyaiQa1B5F65nEfQY+SCUKavxIaCzLtqrw4MIZ380Rrk+HSVUpTDkspF9DLi1g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5754bfee-a251-4e13-0a3e-08dcd4db3077
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 16:35:05.6527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 80tKos37ij+rk94w6tazxCCtS4C67d0t7g2iR34v5fSpbB7uPamigKvTRBobptgHZDxziSEpRxH8QsPCcQJiqsrJ7bdsmiO/Xet/gIPxqZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4798
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140116
X-Proofpoint-GUID: e08_I0XTPUAU-MU1ljYsIgay3dIF5-pp
X-Proofpoint-ORIG-GUID: e08_I0XTPUAU-MU1ljYsIgay3dIF5-pp

On Thu, Aug 29, 2024 at 01:22:08AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  include/dtrace/pid.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 1fd594b6..0129674a 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -22,7 +22,6 @@ typedef enum pid_probetype {
>  	DTPPT_ENTRY,
>  	DTPPT_RETURN,
>  	DTPPT_OFFSETS,
> -	DTPPT_POST_OFFSETS,
>  	DTPPT_IS_ENABLED
>  } pid_probetype_t;
>  
> -- 
> 2.43.5
> 
