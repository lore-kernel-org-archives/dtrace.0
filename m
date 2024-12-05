Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1840194C6E
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 13:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406247; cv=fail; b=EuDvsIG4cFRyPnEtECWIkG2AWifIQsGNlqPoGLmePIagC1vI9GMOeTZxeF4OJood2b0tkvIz7VfMpMxDKpcZQ9y/i6aGfCOuzjA7HQNv9EUoN+u50opF+sBR0bRV7NYEkRHCs6uvNJS0oN7F8DY3Y57p9FH/EgOzx0zY1LyH94c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406247; c=relaxed/simple;
	bh=0SgLw0wYhGHoQRpepLA6O3vlnkcLpHWv9K5ZvDsF0H0=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=rsM3dgs0z8llZx+YVx/bPSUXXBxrsJCWr454Zu3/J4wElH+P+HZ117a1GLmWLj8I4hAUPfUoaNN0SEBuYJZ4+L8Sm6oOWZPIo2yzA2W3Yfo4wmHmxt+J9vXpIEFgJLGXrjzfDm7rl7T8s5WxJH9vlsdDtI5HcNhGrqrqEzPe/pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VzphT2zm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LAjGlrXQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VzphT2zm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LAjGlrXQ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Dfmjl002858
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 13:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=8rOrZkg0XmVHTV6sqS
	le2DdATcD0kQRrz9iDr1PQkOk=; b=VzphT2zm2hXSvemPyTJifDjwPVsqLitxMJ
	BUQK/D60dDkLERMa3re1/zomZvIVa2y47PYR1nlMI4U3z2pLYQd5Ql3guMjL/nfD
	FXAFiolzerQyY44TpIhCozbb68J+6XjK21XaKJVMpEWCeGp5Shj/EALlRd3MwWk4
	acbc9arfVDU7j7+x2B+IXWPNKikknTNJJ5lD3H2HnHhhhIDAo6BxfruP581RJFkk
	Zc3r9YCvtWRcKg1+3+fA/OLgcIfiuyKbjwihbUsWh4UbA5T5Vuqkz1xQ4Dm5nSD0
	XN8a9rrxX0ptsrCzsw30G2ihYOVjuYO56RZPE1JrEUoR6BejuBQw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tasawx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 13:44:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5CKX43040102
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 13:44:03 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836wuc85-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 13:44:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cqf+/gf/9fWsszesdjgS4DHzKM1Ca1uo2t1eFB6xk9EMIHs+CXjBeI8E7nMZ0+YEhRgU027WEh43OS4nxrNeg5nBFAVJ/ZW9I6Ow5mHXwm2G9lggXjT1SaXgDWyyKgh66/+pYhv62njpooBrIERdbYt28Qwumcs4VwfwXWrafd5QbOF5fB0tyjsXKNF6vLDur1FDmvj24rsk7hdrBJnSPQWphtq5Zu4h62dZ/9nAkvbq5A4Eu2kap4dRR1cL8iTbJJ+BYKznOFooPNZLF+QQHq+7a8qTkl7zmoZbwPR5htILZEsK5SuvvTeGQvSpEa4OVdGbsk/hXkOHuoUWxE2LEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rOrZkg0XmVHTV6sqSle2DdATcD0kQRrz9iDr1PQkOk=;
 b=JzEf5Ngb4L55fpOjkEFoYLbOPUmoL7Eyqu8YxxgFE2z+cD0HEnEut1DxOOZb919Xkxstk7eXd8J//Vlo6bhJoUo+MlrcLz1a60qyO6VrSxerbNvP7nIzze8fSkCYBffmAGeWO8QGZ46zRe/Tpw55encr/SKrfJHn9J+NFVAKOzjucE2M+EKkKOxSR2X4rdfJaWX4+ZN8E+hpItsrVwHbFHfuNFx/vu5vKpjMQTMWBylWdemHtb1Zw4X8ZMrzuyAhxzpUC829/FytpVEmwx91R9J4EgU2I5dq11hRQAnCTmwR17/oVCS9Ss8UMPdLau1bdKMGiasx2hRbjxppRwzkpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rOrZkg0XmVHTV6sqSle2DdATcD0kQRrz9iDr1PQkOk=;
 b=LAjGlrXQ6P0x37ykXLNUaMmTwS+mTAGgWhE6bQqaIN9ecudi7j73tyhJzWCzqRzM3p9rGB+m4VDCN+2WN1MKw0MOufIj8SWXqKc97J5kq/vCLTipZ2UIbQHST4+1t5q6fTPCs5pa/mEUiOeGTjQBkOoLtMar3xkUzGutArTSI+A=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by BLAPR10MB4964.namprd10.prod.outlook.com (2603:10b6:208:30c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 13:44:00 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%4]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 13:44:00 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/5] proc: more self-grab improvements
References: <20241203113610.75104-1-nick.alcock@oracle.com>
	<20241203113610.75104-3-nick.alcock@oracle.com>
	<87frn43mqq.fsf@esperi.org.uk> <878qsus2uv.fsf@esperi.org.uk>
Emacs: because Hell was full.
Date: Thu, 05 Dec 2024 13:43:57 +0000
In-Reply-To: <878qsus2uv.fsf@esperi.org.uk> (Nick Alcock via DTrace-devel's
	message of "Thu, 05 Dec 2024 12:58:48 +0000")
Message-ID: <87cyi6p7mq.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0290.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::14) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|BLAPR10MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dac0161-ab63-46c7-cbde-08dd1532dfc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k0i/DQ6RvYeixdcpsn0CJN/4ywLQHYYbzMsAqkm/XvNozHrud1q9BZHBgiqq?=
 =?us-ascii?Q?Zg6ZZJF41UK0WgXDpRUgbiGqIcsfL4SvQ9Zoa481pqVP1t191tqPWdBzMfjg?=
 =?us-ascii?Q?7PER2Nf/rp6MClAb5Bokjqdrb2BXho1852bcWm6ISuqgXFwqc2fNm8ng/yTU?=
 =?us-ascii?Q?TBhAHIHGoIRRxPSifunBpsdSFsUDZ34dEQHP+Q9Kiq3fFdJ4ryQWTucPMBgF?=
 =?us-ascii?Q?9RyfM0KQ8r8IYJplOhJ/zPTH5TcjpvZSnOYcBLrTGL+iq9hiOtRVxT+1oXb1?=
 =?us-ascii?Q?ZCrh0u8zIs2cybEtsKElE0HQ/BevbKrujt+AzVFCRCphYw4CYtWIXIxLthcY?=
 =?us-ascii?Q?Gad/1QttjVaJ9gjGy41DdaF0MwNKipMbqew7MHio25n99CE7aDZDdqVnxnUb?=
 =?us-ascii?Q?xZcKyMlBfjoviCjf90ffRYEEz9xsMDePccb09bdGRVjP/bWWc1jkmbJm8vYV?=
 =?us-ascii?Q?6/NwDuVq/SvA9Iv4zmw5CqK4ZlIaAhPQ5+jw9bl1S0zWc/4RjorY6/IQmvTr?=
 =?us-ascii?Q?1vqVQtWlK+DSKjU4DqixJ1acZ87jobURYJupKZAQxeDYaEg9YseMJWmKP1Pr?=
 =?us-ascii?Q?c1bmhUQ+4D9nCHBIfmm3J8dVwtmVRHbq+YnWObWB+Os2Fj9IZ3NYqXWZ3Z1g?=
 =?us-ascii?Q?frkuDWbnR/PXRutSpC+iT8qao/yGB9RazQdMWNh6HQDuQeYdM7lh1e/DcEAc?=
 =?us-ascii?Q?moLM7/jnFBDJUL4+i2NrDkPRDi9iohHlwK5lbOqRUiAHN0YAC0dlAMhVkqaZ?=
 =?us-ascii?Q?MxBTNme5ot4V6ssC8i246UFUYpWLNE7kQz8wbWNo7D9CEJcSrGavIPGD8L+x?=
 =?us-ascii?Q?G2GnOkLpOS1uDtoMHPvciZ4kBa0XHEQH5xPyOORYqCy5Y+VYEn78rrsgLZ2N?=
 =?us-ascii?Q?F6cK1zRBqzQiacvzAJ/0T+SyEBJs/YYFhH1awwUd+YEKrixpxbAfTVq4cx5p?=
 =?us-ascii?Q?f+kinjU74OgVIWYo2lsHks0yKXN81CkOnUln/iA2QdpftjT1E1ZnuHLPenZ+?=
 =?us-ascii?Q?EYrbkHhqAMF5PkPvuz7ovv8EFkb+pBojMsGmmnpuuepJIMDXAN7rb7nLnX+n?=
 =?us-ascii?Q?wYwbqIhFQ3Dr0fIfZ3dtft88Lo5fkhPmTQQJaopDgtQVdrPyqOlS7DazTgbP?=
 =?us-ascii?Q?EAEjJ0PeK/xEUn6eeuLMAODKQLcVXdBAUeBJk/xGwJwTmi8+q3bOz5fce/KF?=
 =?us-ascii?Q?EuTKu07VW8pLES+twSZ8Pv4HswUBgrIPzuRFA5CPf6oTF0Snjclwdye+wkF2?=
 =?us-ascii?Q?kBGE42+JZEotcQtEX14UML7xmWc2Y+d+886d/1Ig68OZMCrM249zJ4Gxd0rL?=
 =?us-ascii?Q?f8tQM/My55vyJKnFQtMbbKQUP77eD5QJnPqW9bC/YiJdSA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5SPYM09xv4UKlMa5zViIpP7grYRr04O9gfiI+3Z0jr1nt7RmDETCU76NQKDY?=
 =?us-ascii?Q?euTSOfo/+nhTTOAmYD4nwIBzNtVFyETdHM0QppuMnJb3YzNFLqabAKskD1AE?=
 =?us-ascii?Q?IHL/U0F8ZsbX86on45arE8M49tycH3M0uzc/BKXcr4nNzboUOAL/f5g27B7k?=
 =?us-ascii?Q?SIN/h+FDrC77F3ndZyI7Dj8vJZqe/NJHlHGXVRueT7f5W6eLO0ywAeHFY4wL?=
 =?us-ascii?Q?8A0I6lpCZ0eOsWzSj9COfZyeKKfvg8DxRqAGkUbnbIcN5lrIswfiGN/UVzq8?=
 =?us-ascii?Q?6PV01LE6fpMmGT16wEL9suNpO/m2WKZg+o+e3FWTiOo70herzxHPSFuMrmdX?=
 =?us-ascii?Q?YHW/OJRZZhSBy5x9+SsnySGZSMmlGyPPlw3QvD2q+jxXHtzfWQLTufX29yfJ?=
 =?us-ascii?Q?UpW5Hs9F90RwIcfdQ+mK+IL6/MrN1ccf9NUjkBk/UEqOWFBkgudzRSXENJzN?=
 =?us-ascii?Q?+PiWqd70Z4f2dlMgcyqqMKEDkk4yVecs9mP1Ka2qJqoS/+h9oNQQTeDfSSLu?=
 =?us-ascii?Q?gMVfZzAIyHQam4HOyKMaEY/cuASXVs6YlznY7wOMb0viT14ncDY4NW6v4bzl?=
 =?us-ascii?Q?cIihNNeuUqqmMquY05NUKVmfFFns0GEl54YVG7yDiyX+b+s8ny8B7K77pg67?=
 =?us-ascii?Q?7rlYPK4higDETa/W86f7hgl1/8PNHyz9hEzcOvx8q+lNZ/uta55oCEfuOAwf?=
 =?us-ascii?Q?KYNKE60+z3KGCe9XX2Vko1NQoNC4ZsxPg9OF3Sgnh72kSPpVJ0ZULSTtwv9U?=
 =?us-ascii?Q?b9q0ARMMFxYSbZIguNnAwnWMMgIyI+cJIkCOmJSh62/fbfLrxUOwEXC2ObWB?=
 =?us-ascii?Q?GKSzfVMxB9DLW63MGSECgQafbgptt5cGQpop3TR56yrDcyHIQ1ojXRxaQfkC?=
 =?us-ascii?Q?f7yhiky7ikGjNSeAmRg2Sgv+lJfEIm+jxIwp+q7rykIfW0Sxgjw914S0Bk1S?=
 =?us-ascii?Q?p1A0eRM+sg5qK7M0geI81eBgyXtxmc9foYnsQ/4VYAhXYnTFsnRU2mbt2nRB?=
 =?us-ascii?Q?wA/Of4pYykN1t//QFGk7UbeGGGEFq1Xx+AcfyTS3XWSvQS9pNAC36TQSHndc?=
 =?us-ascii?Q?soGrczkAouBxjyGXvht09ca3Q4jaXYqNS9qZTtUsw5WtjsB9oZfGsND9ux1V?=
 =?us-ascii?Q?TlagE/MqxvS92H42dQ7B8/RDwtjBoR/EyQ0L/QLw6ul9gt8yniBajsirnQW2?=
 =?us-ascii?Q?ml/4GYz7c+dbaYS4A5cPImeJtMnBfICJtYGXgSx4G1MYrnmK6aDd+1+c9r4a?=
 =?us-ascii?Q?QQOrM2P1SAO9YRTakYhiAqL5nSfaBnxCQxOxAwl/2TtJSsgdx+ffbKFEiVQl?=
 =?us-ascii?Q?1PWiZkE21U0xmYasSbRoXTtesNRRkj5wng4zDPA4iiTKztP1I6SqWis/Hbgg?=
 =?us-ascii?Q?CeiOm23N7+7fNWg7nhBmq1dCHucImAh5GZ25EKjaELFBk/d44yEq+GfPGUu8?=
 =?us-ascii?Q?6piTX1m4djePowxcHj4DUVYFahmuGKg3D26nVHnZz/7pslEnRdaJnFyI0tDR?=
 =?us-ascii?Q?y97BEj6+eDLloNRrs9YS7Oef/bUS+llrorRZpzvF57ie4vGrKcGHs21u4V9j?=
 =?us-ascii?Q?HQfII1VOw+WHv9sjne5v4CMpHvcYMR10RJ6sMPLLqA7mIoIWymp+xXHhulWz?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SLYIRfc1TNauVbjvUPJU8R/7sErh5KrZy7hAcQ0UHO45rFh5i/hgjceREu7ichArOc+boZe0+67OLwLeKsTz8IwTtd02IjD1o4Kx0LTquYNiBjJf/YIk9jrh/jUsIvdlBLFy7FhLvdeWZ6xkFE50w2/I5rZLe+IA0OBsuRgvNNRZewjJB8lrwKhuGcWr3AzB9sb/OPIhZRab6MbX/3isGWe19ngEOFHHQZLeYw5/e/mekEs+djJr9X2TwTfP6L2t54pFXmS55G5wLAvazCZyTU1dUASO+DnKYtDhKjjZDhfknx5bSiwMRzPFdoFEUWDy8Q0aOpu+uMOJo22zluLe36NOXiEuuvB8NONWNq1smbA745BA5CSeyfnYulSfGwK6pl6gHio50K4iz3DDCPdCiOitHNmjfTl0GMgwhu5BLHi4NzzvGVk/cTmX9VoIHHVWJglBBrS0rT6/4gAqllQyxITY0lrbAqWfXajDkM3HT8VzObLfmVvx6iHxfrkCRGGxmP7zGnOTg9FB/7cbdFb772pDuEpqjPAV0BuqHO5aVX334SBkVuBwAR95r0YYmabbY8XcJvdFSiRHzvMuVM7VAiF1pqsFD8nVJ7nGHdyQth0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dac0161-ab63-46c7-cbde-08dd1532dfc5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 13:44:00.4747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfNklVNQqzRUPCPlI3HzbDHhwt+E+xoaJHjtw5E9kIMELpxhzu5C2xfgZwoUDXB9wjWys4Xcj5FFmqe/55QMbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4964
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_11,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=748 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050099
X-Proofpoint-GUID: 7wpNwUxHQTccqdKSYV-QDbFtb46DA5DR
X-Proofpoint-ORIG-GUID: 7wpNwUxHQTccqdKSYV-QDbFtb46DA5DR

On 5 Dec 2024, Nick Alcock via DTrace-devel spake thusly:
> Even proc/tst.signals.sh seems to be consistently passing now,
> and that's another unstable-marked nasty test I hadn't got round to
> looking at in ever so long...

Never mind: if this one fails once, it starts XFAILing for every
subsequent run, with different failures every time, and seemingly never
passes again. Very strange, given the lack of any way for the process to
pass state between runs (it doesn't rely on dtprobed or anything). Needs
more debugging after all.

-- 
NULL && (void)
