Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D1A21A4D1
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 15:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729871804; cv=fail; b=LItOy+3YPto0mVqUGObypyyBsZ3J+VOCAGuxoLqw/0irQWRc7h63XZUJlQEmpO/5NuP1vUnxiYOBSTOn15fx6U16pNFDXWb1/s2f70WlRdcKf7klHjYUN3j9YkneX22dH6nbAiNG8Q7QWknPApv0ksNGJpCsl/6vs02tfaRau18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729871804; c=relaxed/simple;
	bh=8lY4UzWd8GhKRKI9sss9zpMYokPg8DkUDkW5dtq9uc4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=VTj/aBp+yt4Yxc9MK+d0LUTopEYqjNgTFL1xdI7g+kPRE8bBZPaL76oRb6vy+J6+5m7uAanWxgZejT+C+YfC5j1CHKLt/DdcKGXFFzfNfAKr9pZ6wejfJ9TqjHKY9TbZEOhTbvhOyWDS1JWXHv7H8n5TZRTCeO/L7EwvWv5xqy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gys2bgP+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W+4S4HOn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gys2bgP+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W+4S4HOn"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PFfmaI019276
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 15:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=fusPo1X+/CDKC5K7dv
	34Sm08q9mv3E7SWBrCdVDhu9k=; b=gys2bgP+/RRXIgjoBD1WVFm8we8EGP0hwX
	8Jy9Xwp1grG7v6zvytnNoiEHd7QQBiaZJkl6751Ob9KXihOAGil8NzlCVarwjDNS
	I3bT3ykROCwElisUAFJcmzt8F9snmgLg74ifYRh3t+4wlTdffeFJA/07QHfGc27c
	SWdDOmL0px9cgv7OL2vWYtisZ9Z9B04h8svSpIJUgPE/mos6dZKlbydTXZgLtawR
	4wZLVFPQXeRCnscGz8FjgtsjHtwE/fB36WC3rMZRKg2DVRry/iYC8VAYiUvttus2
	ZVkSnCf0rxKu1itU+zc5JyCd9SCLOHNzoocEYqqF2NlMaUIP2Elw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c57qn95s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 15:56:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PEAVap036721
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 15:56:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh5fvft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 15:56:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbhmvc9MsEyHEvx8A9ce3VseePwsEsl/3JZ0xJIjYTfwmsahWJm99AZWwrmGUl3bNgLvuhQwp8QrKDlEmJXH5zLWQzcUofm/4jXjmFd85ac7IlsFUtambmodym0DAdhP92UeE/jpMk0inRv1ndoaMIsO+SnxcA4Jdzih4DwbVVTBpO7iwaVVG/E6YtSnVLIYtKQLHzknzI7oSdracWIIGHvNETHJx1HqxYveqnUhyQW5BcdkA42q6Bd9q5OzO9M1MlvnB/WKtt+Y3nJD4kMyTMPSfWZPctlsZvn+vGhIw9ZwwHcUjVYYMOHnFzHasWN4VhmNRQmz68shoL1I/Uwc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fusPo1X+/CDKC5K7dv34Sm08q9mv3E7SWBrCdVDhu9k=;
 b=aw17k5LMZaIKyT7bKmf9VoG82mJnfXxCeapoZsdOJZ52OpN4cuPxfO5BIAV8sB1oyRwrlCjLXDTZpbw2DPWxEbLmUYAGz4v5MhR0Ds62Xm3kWfRq6MkAkX16Xcp8/Ls9IzALI8QNIXBIHbpKvRt4bYJ0p9qL2QoB2xeDrjR9VC7l2Wrw4SHVMB5b03U+PIJ3fXep3qd8AzIRiVjA9iaD4FPq/SlzdM5t29t0bvHf8JSLk2pqewW5DiQkJx1XDZEXpZeP1b3SAwlZCq19Pn1FVKi8agwrd64nZM/mUhQSUJKspv997Yf2pTnncMwhwX3tnmDLBRxBzg1HiGDitX4XrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fusPo1X+/CDKC5K7dv34Sm08q9mv3E7SWBrCdVDhu9k=;
 b=W+4S4HOn1a7a3G5kvofyKznAz+x9dnzFeeqSXpIOmJCM+h5v+NqQrsJJ1r45z3IdiWNAQM1pooe0LDGDGmRixXk5qWWORy6xCkmF8AZmvzxhgzOYtkV5HwRlwkJ6g4HiYYuxW03nOxcs9n6OS1TMWm4bRqeCnEVxNXEWrS4P5yk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH0PR10MB5034.namprd10.prod.outlook.com (2603:10b6:610:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 15:56:32 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Fri, 25 Oct 2024
 15:56:32 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/6] cg: add argument remapping in the trampoline
References: <20241018195808.270688-1-nick.alcock@oracle.com>
	<20241018195808.270688-5-nick.alcock@oracle.com>
	<ZxfkWjbS1c0vXLvn@oracle.com>
Emacs: anything free is worth what you paid for it.
Date: Fri, 25 Oct 2024 16:56:26 +0100
In-Reply-To: <ZxfkWjbS1c0vXLvn@oracle.com> (Kris Van Hees's message of "Tue,
	22 Oct 2024 13:43:54 -0400")
Message-ID: <87plnorxat.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0493.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::12) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH0PR10MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ed1a0c-9f2f-475d-702f-08dcf50d9834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SjiIYSPDJq7twclBmTBTw6QfkE/ndVaMw+GBmqrnFk7HSknXus67utPFMEGc?=
 =?us-ascii?Q?m4Jay84QC9AZKL3xAYoPyy2t9wWbglfuV2qzZl6cfDw3JlmyK803ZvKGRIfi?=
 =?us-ascii?Q?lPhNTPbe/PnkVZeQJOUMUY/MsjB3jhv89Npbq6Hoo1sud4SnwdAIbXMwmTk1?=
 =?us-ascii?Q?3xnAJb6ZsNWHk2JaprWpVDs+WCOXUtlut+40fjZW6Hfc6LCceBnUzFSuXzxj?=
 =?us-ascii?Q?jdOpCAY+v0dqjX747d6oDVc1abaRaUYxXrDNVs8K8X6klDWaWKUFopZN9uO4?=
 =?us-ascii?Q?Uu1IHiFaOZiJflXSIA31t+GU6SSrrBhKN3WDYyPR9mNoqWIGT8apUdGrz7iG?=
 =?us-ascii?Q?UWIsGDSjwKSEiuxFuUbFALVNw7akMCpm+HQQ6cR+qTY/l/I2RXortSo2yYyH?=
 =?us-ascii?Q?JK0EsPqpZM20zzmhPCu5cdeDCrQVkWtdtxk3NtKC2lTmr/YVcoQjllRxZZnT?=
 =?us-ascii?Q?knalA31NEGLE3S1D9ftA4aUf+OzO9KZiifWodUN+6FJNdNXZ9mwLRGS6+aeE?=
 =?us-ascii?Q?EZVAK69mYzY93BrMqiUwwOrvRzOkHDKFJwfksWng5p4+tFmv9DOJbVLizp3K?=
 =?us-ascii?Q?KTNiJJ6FogNtL0k2/cUTpb1iin1LnyQrC6s7qBsyTwVVEkqIbFb8IZNvGf88?=
 =?us-ascii?Q?58IMcBfBaB9L3lFvqKb5Ij8Ggzye2Ihue7Jtiwrdo0NPzq9WYUK0UJifn/NQ?=
 =?us-ascii?Q?gmuxawkmgCfiEdtYkvwODV1eac0Us2FnJNQYrx4bl9FnUANJDdvqhhm6HWrQ?=
 =?us-ascii?Q?8uogvqsOabRE4ShG8RGo88YgBIglHSYRxSGQTT3OMf39uUOIBfrOUok23M36?=
 =?us-ascii?Q?bIgWMp8QB/IE3IMdZtpuQbAoOqEoT7UuEx+DoSRhOosYKM0rPlKfkvB5Jm8N?=
 =?us-ascii?Q?An2s/RIS+NqiCv+E9Gn4iFfxHPsU96WKKnjJdNAvYxDzjHgJzvYUFucAGcpz?=
 =?us-ascii?Q?7hll4gRQTcl6YDgsBUsrBALSOLjcUuc83JpcylWm2hWBbRA4aZn7x5em8ib0?=
 =?us-ascii?Q?Yue2Zt73fdnib1Vqbka+Sc0FpSLhaGleVmIWkV74Twu/BKCIpe39Z9UhKZxK?=
 =?us-ascii?Q?xqy3VACuG6w7OLRufpL7VcMJCHDCW57STyWtdr3NvtA254E5JO6loXw939XI?=
 =?us-ascii?Q?/IP2bXZTl6s4gsxGDJYyIG2axZ6inqOORcLm44/ehO6CMgyfbEucCbqEOFA9?=
 =?us-ascii?Q?YTIVgTpRWMHmvz/KT1j+JO5wylsLMV/KbX0lKHJnB+9tc62xzjgGqk6XXBlR?=
 =?us-ascii?Q?Ce0DfgHRy3gxg2PK+xCKO1VJKegyzkfPuiGbG3gR8VP8p9NlADZMFUIvbGnn?=
 =?us-ascii?Q?mYLsMbX+wgGWOp+EaOpxQr2u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I94P0iFfvqtjZVTXFFIsbZYXMemphYDf5WtKO2wFqbbkSNMVx2uLUH07OJLW?=
 =?us-ascii?Q?jH230vovB/uS/p3OnUFHxvglmYSmMieyn1RMxcfeWnJnl+J2kvnuICVfYiem?=
 =?us-ascii?Q?+yxrG8fq8Q8cH6wKqwiUhPTVce+tY1FtMBUSmpfvQ+tvUL0hOeYRVlAPLXWl?=
 =?us-ascii?Q?UPMEMc28WYcSxQ4ogzVHCixGZh4jH49orrbchfT7t8gFDY9Xo6QxlcMY+GwO?=
 =?us-ascii?Q?XOt84ntC75EDNQycJL3IvFE9Zy+bAL+kXDb7VCo4UprbSY6dCJ32qt3bZdQH?=
 =?us-ascii?Q?edLlhJsr5hT/cRtIApEJQUN6vUKWGMrEfbYTMOJW6JFP3oxl0F5qVfgyQ7ye?=
 =?us-ascii?Q?VZOI4DqBTXqYiyDE5oKWyKJCsDT4dPS1UfdU/BnPhV79DIRbfTgw/TFGz5Ib?=
 =?us-ascii?Q?g5yUhGLzqT8OoGuVbvMO/jt63jsOo1bWyoXGJvEokam+LuhMMgHtNLD1zccU?=
 =?us-ascii?Q?2/QvpmGTD40zVHu+ZqYc4B2sqkq8UC55ZDlIfoK1MChUTfmh8JgeXgyBSqgs?=
 =?us-ascii?Q?zE2Mj2lx8SOX4EyapUd5eUVu8O4pITtQJGvq0YFnKBBrA2mAHr1w9q30WMLB?=
 =?us-ascii?Q?Fn/Dba/HG/LgVFnN4w1WHxMTI6MeHvTEVAYDGOV1KPj1aLxfHt78c+J18CJX?=
 =?us-ascii?Q?ijzF0H3GXD8RzBiyfgpa/LOPC3FfOSYdTZVjYE8kiKzURlAGL041KomLj1pD?=
 =?us-ascii?Q?iqpxLiBqAtB4tPz2TyKHHmCyXM6YBwAZO2F2x0e5jrVpboIepJRlqchLUgJ/?=
 =?us-ascii?Q?5lMi+Sb7q+2ochOyl1mFBEm5Eanxw1NijRxxKwsSxb7XYllEEHjJmnlToYr6?=
 =?us-ascii?Q?dwx9HfPDyNYG0PazyZ14VafvBaNik5tCfiOSCoRHWUhPsCOW/ohlcldzUM/Y?=
 =?us-ascii?Q?HIXl32GDEER2UqPIdZEVCBHiV5QG8FlmLoGZbUNl/iVDsC7C1rP0eaP6D5HO?=
 =?us-ascii?Q?4VVe8P/2/MGTnJ/eWp/wQyPaL+Ph6/9QcdAApBnchT9Fdhu7m7UgMMO8Mtjj?=
 =?us-ascii?Q?zqTFxpgVOy7X855jc3ntPbI88pBCOx3RnM/EeXPEnrkN0vUQuBxPFWEnR6rN?=
 =?us-ascii?Q?3VK2FeAvwweb6KW4r4UtaJJUInKDtYuATxvqn8uHj033jR5bocFG4puONhpl?=
 =?us-ascii?Q?FLYY2uSb2rFGJ9YZ/4vI+OeJ/ebZyRFSYzMEI1N+124tbzQpRWftJ8g7EXEP?=
 =?us-ascii?Q?V1dazp5sPGa5lgFH7aNiMpa0WFieABfv4EwXzLfB98emKDLt4NTXiDrS+B/H?=
 =?us-ascii?Q?CEk6En2jKm3ZRbtIHvRqZyg1UtlqyVRJyRV/3eKmpNapiqmuXAXdkhFofS32?=
 =?us-ascii?Q?ob9rePE+vLFH2M5R0Yse8TT17HLvWgaCnQ1XOWTFsB4OSm6em8+VbdAosmLf?=
 =?us-ascii?Q?L+SFrK64EWWmCQd96e9NP3A4ZWWwFbPENMk7xydrZbdwb7uFxhDn2XYrvJyx?=
 =?us-ascii?Q?dKrp1O5rIUroHYKSFzg8BwCTUsSL3CXM9YW54wyZCoDJK3wtfLqCguk8po8l?=
 =?us-ascii?Q?7t11j8vPMMPq4uCdXptET/qbCnsTIRuyanQtY/pkQZV7pOfK9pKXCqsotcWe?=
 =?us-ascii?Q?j+MXS41Ts3meV26r/pAhuW9YnSA0ggLPD4q91B2i9eWvVMesr1YpPy4mpH//?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dihfVKKk3vNZbK9DtJD+TL/mWnV3m8CH3HktJmT3LeRvGCxWimisd2OZTIhuOkpPMT5ppP36WqUmb4GQ9Z3Da/6dK4zcnqhUPHiyThus6WWJyHPy0kAlZbQ1eNwhTO/GLvp5jMfMNZwzAEF6fHZoz6Gu92X5yefNm3RKvjM6xFz14nLAJF5XmjZJoDGgle2CuXqcFqyzVcu7z0XB11S0XJsxdIgnmPJYXNaCMvjcNPf+arIwgUPxatbOIb81DvI7RD9jOAcyFwlU7PXznXg9gDeFz7J5XUSv+MqsuRE8XBHsYXYeajVeKLnSERp4kIhryYB/WAaYXlyEyO4oalFaeh1aoI1JgfpJaYy+mdMsqyKKxWD4gPl+6VjUnR1nF9bHXERcl+5EikNExTo3x6gKyLYRjuDZp1rHyrIsKCoXKXtE5I2cOJEYobi73+WMhaSVxm+zc02ffHSwKWyBs/kDBWlrJJC/0CpnbtBakd21nPKhqR+hNCqvjILMvjTrQbN9pjdrQ1pRKHEUl3X1LlRJr98kR3LnRc4eo2SiE24/nyksHwRFT8XB4mtxz87LPTXkVdWWSf4PLJ3Glcis6jknZUEs4rfT2plHBGhIpPEvwmU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ed1a0c-9f2f-475d-702f-08dcf50d9834
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 15:56:31.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWn1p5wX4niKnQuaWPezq6MKQRwRBcxqGd6sfj+c0buptYC3gbCjHh5XBgEIjLnVJXcSMQFqKtrJfi0k1CpZLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5034
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250123
X-Proofpoint-ORIG-GUID: v2hNl1_9hG7Eq-Yf2tYr-xW3zuyA_Rnx
X-Proofpoint-GUID: v2hNl1_9hG7Eq-Yf2tYr-xW3zuyA_Rnx

On 22 Oct 2024, Kris Van Hees uttered the following:

> On Fri, Oct 18, 2024 at 08:58:06PM +0100, Nick Alcock wrote:
>> Before now, argument remapping was restricted to the args[] array, and was
>> implemented in dt_cg_array_op in the same place where we decide whether
>> to automatically copyin() userspace strings.
>
> remapping -> mapping (everywhere in this patch, and similarly, remap -> map)

Ack. I do hope none of the mapping code ever has to deal with BPF maps
for any reason or this will get *immensely* confusing.

>> But existing DTrace testcases suggest that remapping is also applied to argN
>> for USDT, and it would definitely be more *convenient* if it were (so that
>> argN and arg[N] always contain the same content, and only their types
>> differ).  Add a new function dt_cg_tramp_remap_args(), which can be
>> called from trampolines to apply remappings (destructively, but it keeps a
>> copy of the old args in the save area so you can unapply them if you need
>> to).  No existing providers do any remapping, so this is not yet called, but
>> it's about to be.
>
> I think that the preceding paragraph makes some wild assumptions that are not
> really in line with what the anticipated behaviour is.  For one, there is only
> a single existing DTrace testcase that involves argument mapping, and it is
> uncertain whether that reflects a conscious design decision.  It is certainly
> not consistent with the SDT implementation where argN reflects native values
> and args[] is to be used for translated arguments.

Did the prior SDT implementation do that? My admittedly fading memory
said that args[] was unremapped even there. I thought this argN
is-is-nonremapped approach was something *you* thought up for DTrace
v2 SDT... but I could be wrong.

> The documentation states:
>
>   args[]
>   The typed arguments, if any, to the current probe. The args[] array is
>   accessed using an integer index, but each element is defined to be the type
>   corresponding to the given probe argument. For information about any typed
>   arguments, use dtrace -l with the verbose option -v and check Argument Types.
>
>   int64_t arg0, ..., arg9
>
>   The first ten input arguments to a probe, represented as raw 64-bit integers.
>   Values are meaningful only for arguments defined for the current probe.

... this doesn't really say anything one way or the other.

> Now, granted, this is a bit vague and does not entirely apply to SDT probes
> because there we actually have types for probe arguments anyway.  But I think
> a valid case can be made for argN to *always* be a raw 64-bit integer value
> (which you could explicitly cast to the type it really is) and to *always* be
> the raw arguments of the probe, i.e. what traditionally was passed as the
> argument to the dtrace_probe() function.  That would correspond to the native
> arguments for SDT and USDT.

I think a valid case can be made that you can always get to the untyped
equivalent of a mapped arg by just casting args[N] to uintptr_t, and
thus having args[N] be unmapped as well does give you access to
something you never could before. But that hardly makes what I said in
this commit message a "wild assumption", for goodness' sake. The
allegedly conclusive documentation you cite is nothing of the kind!
(However, what sdt is doing now does seem better in general.)

> Anyway, rather than making assumptions on what would be better or implying
> that there is sufficient evidence for one versus the other implementation,
> you should simply document that a test in the testsuite implies that the
> expectation is that argNM and args[N] are the same for USDT probes, and that
> you are adding a function to do apply this mapping, for use in trampoline code.

Sure!

> I also disagree that the function performs the saving of arguments itself.
> I think that the caller ought to take care of that, because the caller has a
> much better idea about when/if to save arguments, and when/if to restore them.

Well, the reshuffling is *done* by saving arguments and then copying
them out of the saved orig_arg area into the args area, so either it
does the saving itself, or it silently malfunctions if the caller
doesn't save, or it reimplements all the saving infrastructure for no
other reason than to use a *different name* so the caller can save.

The latter two options seem, well, entirely terrible, so I went the
former route.

>> The remapping info is still propagated up out of per-provider state so that
>> the parser can use it to tell what types the remapped arguments are and
>> to apply array-op remapping: users of dt_cg_tramp_remap_args() should set
>> the probe remapping to 1:1 and shuffle the native types correspondingly,
>> to match what dt_cg_tramp_remap_args() has done (in effect, calling it has
>> moved the native types around).
>
> I would drop this paragraph.  It is unnecessary and speculative at best about
> what other code should or should not do.

Hardly. It's documentation about how other code can get the arg types
right if they are using dt_cg_tramp_remap_args(). Would you prefer I
leave this entirely undescribed?! I could put it in a comment above
dt_cg_tramp_remap_args() (or rather the renamed dt_cg_tramp_map_args())
instead.

(Shifted into a comment, for now.)

> However, I think it might be a good idea to have this function actually rewrite
> the mapping data to become a pure i -> i mapping.

Can we guarantee that trampoline() is only ever invoked once, and that
it's invoked after probe_info is called? If it changes the remapping
array, any subsequent invocation will do the wrong thing. If it's
invoked before probe_info, it becomes impossible for probe_info to
adjust the xlated types appropriately.

This all seems like way too much coupling to me. At least done
this way trampoline() is idempotent and doesn't depend on being called
in the right (undocumented) order wrt probe_info.

(Or are you suggesting that dt_cg_tramp_map_args(), or its trampoline()
caller, shuffle the xargs too?! This seems even *further* from anything
a trampoline() function should do to me.)

>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>> ---
>>  libdtrace/dt_cg.c | 35 ++++++++++++++++++++++++++++++++++-
>>  libdtrace/dt_cg.h |  1 +
>>  2 files changed, 35 insertions(+), 1 deletion(-)
>> 
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index 39c27ab0ec0b..9709667d97fb 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -831,6 +831,34 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
>>  	}
>>  }
>>  
>> +/*
>> + * Remap arguments according to the array of remappings given.  The original
>
> Remap -> Map
> remapping -> mapping

Done.

>> + * arguments are overwritten (but saved).
>
> Caller should save.

As far as I can see this is not implementable without massive disruptive
ugly (or at least pointlessly duplicative) changes, see above. It
doesn't seem to buy us anything, either.

>> +
>> +	for (i = 0; i < nremappings; i++) {
>> +		if (remappings[i] != i) {
>> +			dt_dprintf("Remap: loading from %i, storing to %i\n", remappings[i], i);
>
> I would remove this debugging statement.  We don't really report debugging data
> at this level anywhere else, really.

Oops, didn't mean to leave that in.

>> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(remappings[i])));
>> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
>
> I would add:
> 			argmap[i] = i;
> to convert the mapping into a pure i -> i mapping, so no other code will apply
> argument mapping again.

I think not: see above.

-- 
NULL && (void)
