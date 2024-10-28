Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C535B05E
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730132120; cv=fail; b=gnywNcE1AGa2OpZrPDPjr2PU91f+PqFLa3kLVpr6ipX/Qh5ASJ4FaiidHG/9GQN9ZksNDGzDRdJDo18hrjmU6Df3q9bJ0rVKlz1CH76BLO0LWshHuTZjviczfu1Vz0qav+A4jnfYaAvmFfDSbtBIRDkLbb6OzCdKeYb8p8f/uKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730132120; c=relaxed/simple;
	bh=EfoBLdZ0zjauqw+E3H23B90WBr3oj2BqFHUJqi1SecA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=V897uU6UDzgx1Ul4FeSFfLBEYhupzv2laSEYr0nHwl6NAHm2qMsuAUmjAl6kWspnzJz9d/CXXH8t7/6exAiRG1rTxYyhKJI2iE78u4dWDDnGEwYXPfqYQb6iqJTPh6t4rl33WT659qX2M1NnK74rkogq6+ik2IRGpAxRX2RZRYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hv2yJqxU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mF6tdwjv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hv2yJqxU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mF6tdwjv"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEteQE014146;
	Mon, 28 Oct 2024 16:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=1wMiqtroftGAYrM1Pd
	eiIXuVpUZByiUULL+vWoHh0ag=; b=Hv2yJqxUtNXhDP0NCoROOLMJwJ+iEHvhgk
	tWrI56zFJ/rX5G3No2SWe8WQZbKV2CU+uwiHjgNCzgt+thbk8Ng+/pTzjINpl0Y4
	Z3UZgOSzmHekkRF1uctnyk2kUE5kw+yrFpEw2XSUyy3jV7Xqf5l8o1KpfFSfWxnj
	EifUDd6fPbhoH06b4YuxfToVv/aX6rfBoFLEUrB0XAkrLmf2WfDFB9AdfyD9y3e+
	3gbegIlDahutZrM/eTobhub+9a4cO/4aKowPHBmEECrg4MDO/OrsphXVe3Gpikfw
	NE1bEPMEvHSekmqBs/mDzsFx79B9TL4jmUl5lbHZCuOyZzb98LRg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgwb99d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 16:15:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SFQFpc035074;
	Mon, 28 Oct 2024 16:15:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd64u8k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 16:15:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZ1+BvaSmvZc7w2CZjr2XsniejrEI1kV/0AYYzy4yQOsCQ0G3lSSuKP9oXlweZrB4tBAIKDhhQEIE3eh8xlasPWJ6SwgxVO4R7VpVwsO/qmJP1lLHcJYuOwYRgJvQbgWa84rikRgDoNGSChTaAzSM6vEt7t0N5upCftsVC4KlDrOuSQIotcJIS7kUWCjeent+Z8J8m7LN46rC3uCcYjov9b7zhuza9pr5ZaUZwc6SQXr3FPSiMEllJkd1LkByOWmDQfcYCDE/C5ZTbDbVGOXzWgb4kM1oUoyygLk8Z9tMFC40/XC3/yQZcwY3zge8NiX3XVGRsEz/4m9lmzvir+ABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wMiqtroftGAYrM1PdeiIXuVpUZByiUULL+vWoHh0ag=;
 b=DYF4J99PV+ugZMJ2sS+U7hp+1WL0v301QuoKrj6UXFYclaQAc0wwe6ASWRycTA9KPWFDGMyjmHLYIuYW+XlJpJJdJ3v2LFgzQUQedF0Yzdiioul0AOqOcnaBVrmoUfP5i0JLhQtSlejOgpd+iSPSaW1ML7mZ94bxdrQs5FTYc8aoUNdC9w4Nyu9+G/GutknHkPUeJGzwpf/xg1XC/7ObrSgAs2bRfWphvBkoCWXPSzWaH+BCCDxFo0ykvB7E0nFm0iZhYHEiYpQlPhCHFWcEyFR825zk2mHOnhaA3pNo5M5LGBNm30k4Zs0esMEFoqzh3y0fc+0er+A+HH+WwUWwVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wMiqtroftGAYrM1PdeiIXuVpUZByiUULL+vWoHh0ag=;
 b=mF6tdwjv8jOo7jYTlPZ1GG/yuzsM1KtxkY9ehJ958eA4SQj/db30wPz6teMIMmNCL7rcXmc6cS0xQlo1nBFRBYAfJVkiHn0j3lzrU/yDfQR/j8K1VSXAUmCW22x2Dfo5O2zxWET3UM9FNfFAOSI9W11MthpsRfLqWn2HkkxrcnY=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH2PR10MB4392.namprd10.prod.outlook.com (2603:10b6:610:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 16:15:04 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 16:15:04 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 01/14] No longer depend on libsystemd
References: <20241024113758.182050-1-nick.alcock@oracle.com>
	<20241024113758.182050-2-nick.alcock@oracle.com>
	<ZxsAplgn-aSrZkF2@kvh-deb-bpf.us.oracle.com>
Emacs: Our Lady of Perpetual Garbage Collection
Date: Mon, 28 Oct 2024 16:14:57 +0000
In-Reply-To: <ZxsAplgn-aSrZkF2@kvh-deb-bpf.us.oracle.com> (Kris Van Hees's
	message of "Thu, 24 Oct 2024 22:21:26 -0400")
Message-ID: <8734kgrypq.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::23) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH2PR10MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 444367cf-1543-40fd-354a-08dcf76bae42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z/b7dlKJDiOxon/sB7X41S+rttziivj4Odk+mmDZvKeHgVZY3pH1WD4u777a?=
 =?us-ascii?Q?Or5AutDj6OGPsD2YCJcaQ2hfvH7H5yPe3xceNTwYyft4EKcE9P5/wC8alChD?=
 =?us-ascii?Q?CH2BoeyNMQNFTpzwX2tWQ+LuhWa5q+uuVXGUMf4Atxp0EKGYBZfuiDWeRYJM?=
 =?us-ascii?Q?rFBh0rD0N0DJ867WXwGKKMEnixXIWcBlzyk3IL58HLXar2hr87E0ZbnlS3Av?=
 =?us-ascii?Q?WhN5Du8iqFw8IrvAwgyEYuMGPaEK7xTrBa9vYoYuv36YP9tLZYxBpgIcEmZR?=
 =?us-ascii?Q?y4NtScIm+cTHgevlAhvnN/sC+SEH2fre3UC9eNTQUkZEVydrWEh89O+VSQv5?=
 =?us-ascii?Q?iyYtGbhb3KGFdJjwB6ORUmv0s2AtzVE2KFrJjZYOZnObmaVINjr6RuDJZrOs?=
 =?us-ascii?Q?iRpg+xfTde8AfC5OnbfMfqS7o0b4mFXlCUJ5obOQ1qKTuvgz0291f/HVnR1t?=
 =?us-ascii?Q?/fn3QvrcLcH7yy092A2jELxIH7eRA+jPxn/M/NfocF2Cyq2DiWlaXZEys1EM?=
 =?us-ascii?Q?1tG51rFo8qk95gFvqrqFz40fFZ2cHpnPmUgjLjBFsbPjYz91Gq5WWQFE2QsU?=
 =?us-ascii?Q?wYEbpeQPMIx+y2F1rqEgnX1fwvPmh8tJIXoCTR3n7VJzkXmUd7TTWZnksIO4?=
 =?us-ascii?Q?CCXw7poEUheNrAzIJM5KFSPorvJKwbFgRDioMrbYFLCvShc6AicwDvNz9OQj?=
 =?us-ascii?Q?WaMxrmOAOk5OpsiLA1GRTX78LUKc5rt2nPkfYmB3bbIBjFlaEoScT9WdQF9r?=
 =?us-ascii?Q?Sgau1CRndAxPVQA86IHxzoyUX4ad90jjMbav4BeI/lKxQik6DvgZYg7k/xBM?=
 =?us-ascii?Q?9GtNAMuHA9QvSIkOZBinNOt3pmf2wNdG7gn8TX1Yiu9nR9Gf+55stVgtzeC/?=
 =?us-ascii?Q?dMN4qt6gh7jaCD5+mH7fT2lTNbvZpl9VgPeyarR1o28HYTpHX5xbnX7r+bNR?=
 =?us-ascii?Q?2KmmyDmgTdD5YwfElQIjcT+dIoXbF8kiuTV/fEhA3TLQcl1aHS3Y7ouO7I5w?=
 =?us-ascii?Q?ZsnBGeJBCXHWV2/ePnZrPNPwLYkcyd1HHw9JnMTfBUJkK23cBduAsP442YNt?=
 =?us-ascii?Q?QPf/z+wb4k7EHoirvllNmTEkWVvjue1oPmeETSxbVWsS/KUHmPVTXg25tB9v?=
 =?us-ascii?Q?4ACd+6y0JmrqbsWzelhR5RDuEXYSYQhe5WK2++D/AcH0QRYmIKeepGaQTKQa?=
 =?us-ascii?Q?mnSqVnMCBl3laCjgX/cDdw64vTriZELrNiwbz22AyUOGDgwyF7uqqrXDIsXu?=
 =?us-ascii?Q?qIZVyO2nURsOlB3IqNA5zY11AuTLnGX0uTy8UWFNGzV6lwOojO6C3E3dSjy7?=
 =?us-ascii?Q?zKHjzLpvi1lDh3h9WhiX/ENF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?atMknYWAi2ryRySHqq2v22MG0gG6psl7af9WV1IaI2aRH/XLg4FrZKjG19Eu?=
 =?us-ascii?Q?Auk0g/ANQplS1oYsxXbSHARfYyRGYG9XRFllYvOHxRvbHecCVJC0bG3Wd1Rb?=
 =?us-ascii?Q?D+DL/ZunKG935VTtpXhywDl/IvPUpnaFYUCnmfRQHNA3Afjz2JuxZc1PDr86?=
 =?us-ascii?Q?w7CgCoeAcVN1yaRmoRgTiNcqSbSMoPlwwX6Do7BgzzJnKYOJtd1Y/Riafmaq?=
 =?us-ascii?Q?wm8JGFthKc7nk9QOntCAd51abk8ONoN1OWc2IkXI7mAc1QA7xeStYt0ATxri?=
 =?us-ascii?Q?CDpeXhponGtoozjo1p94dCI0GNAv3xrymej+Z+kI8Xf8tSkJcPcRQbIBjQht?=
 =?us-ascii?Q?KxWL4LlXx1PM+poJCxY/i3zcGU+1U1IdvUFPMSuRnJ0600d+alaFxM0WRNPE?=
 =?us-ascii?Q?5P2Rl8g2c5pTN2qwklCSL++vSSF2+EazWjy4ql4U7X2OI3ALBcq9iBVllo2C?=
 =?us-ascii?Q?niV11RCOnKr6tzO75meVuht4FH/a0FDi/U3z8DSU5Xcu0nI7qzW4ah9Nh9p1?=
 =?us-ascii?Q?46s+zIeIPZVOXpkdWGoTYFOHxYqDnvN75rd8rLCTB9DI0MYVDliBn9VG6NHp?=
 =?us-ascii?Q?HtdorE72iXX0RyHkYb/mDVxM+MBnAL7TnjNPyTp3S7U4ceE7aajWSyW9NYQO?=
 =?us-ascii?Q?/Xycws1Lv62JnlFa7M2yQpDY5Qqq8qVKjujaABlgPHBqrLK7jdcveskWx1Kb?=
 =?us-ascii?Q?xVjAdWyl/kwxKTYNBSMgC+PIykgxpkgLvqxwKfb2m9iJwJGbKFg1SK1povXp?=
 =?us-ascii?Q?soFmRXu+e3qwPamFLWrGXLjXO0WU1oJcCAotVafHCW0HKqtcj3+gOkeIwkcK?=
 =?us-ascii?Q?063Jrdi0/GHfrmha2fjz9+NQmqcjGXG/XOK8LBBadyR29QKEeUYk9rMwuRlD?=
 =?us-ascii?Q?mmM50u1AZuuM9QJcwUr9DaTN2Vtj1lMHzBaxnU5ImY3yi6wivx7xLKFqlJEA?=
 =?us-ascii?Q?QrVT/4hEh/nUttCzaGCq7ufxkT8NCbvmdWoEVIy9HVyTHn1+zQvj1AExaO5n?=
 =?us-ascii?Q?x+zlY8r1EuGTmQgE16HO9WDh6KmoP9KUCfUVIR/OfHU5hy6clm5wJz3O6XFK?=
 =?us-ascii?Q?2VXwzkBthVsL75RfXIpnxNC/uUgknHQv3UPy9c3cUverxMK7lDimxfONXaJM?=
 =?us-ascii?Q?phj2p5rCnS1jjSo2eW9oEUDwlkchrqI6msNSfJXTLIQ0NQ6e+KxoPTp/QI+Y?=
 =?us-ascii?Q?GKYfpbD/6HgXljh+AhkBWimTjwvSoZG8+GRZrJv3Zm3nkpVC30G3WqwSq5p6?=
 =?us-ascii?Q?YJnx7TGrbHcXP2l8KSjax1+yiH5gJuw8o0nWcox/cR0sYODQEbOEwqoPIOEa?=
 =?us-ascii?Q?CqvJV5ExWrO+oCpayXj0DcWQOXuTKqXteOSSEBhgOR/EBsPyJZlEmwXrl6FQ?=
 =?us-ascii?Q?j9yxhaLJT617AGGZJgHcBUdqGtGOkA9LcCAmPqePQlKQR27V6qjUSAyoaUQt?=
 =?us-ascii?Q?jtWrJb/Kyr0je1QwJqptNM4kQBzPxEI8JY9HWP6Nvqcjnkwdbi52AQSXbMiG?=
 =?us-ascii?Q?YVOQlH1Q74JagQDrxi7jHmEbMsc5XMuSmiFGg++lbOneXixsw/Nbc9EabQ59?=
 =?us-ascii?Q?oR8z9ZBAG1KIs+vfQ/+VDerMY/5vlys0Ri8ll4UWYgmUvm5cB1k/DyMVAx5j?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Z9urFXyvN6orv/oa7YOZNM0CypIThrkymNaXZNsgS3yG0J0Vh1QIYmjrxv5kwOtqgStJ1o0wP0cHX4hryKGLmz9HSjxySg8OYxrNAN9wuBLFbV97qheOcn85eDYBs5kXPfATrPsmLxugftm2xu8j4n475fx79YwTDVn8J6YfdEgQxlLclNKBG5lmGSVlxRR6OoJYIIJLaBzcCbRntXXzG9JJrBC6FZa9lGwfX+TB9vrEXhcC8usQezMoBt1JM65E2nP+uK5fGDcT5iBVSbflLcLyq3JD1zQkw8PfQCHs3UjRSj8aTEBpkpkkHvy70Guh84gzOfNCEi4mow8+cRFUDVpjPb+QUg2D/sB9GvNnbmw5hUNXalB9WUljzddORKMls2uN/BRxCX9yUOhnbyeD0ybLpSQNsQsZZVXRAo9m6P3pdLihuYVtKGHZo2s5YeSzO1LtGLoAjHb6N4qSdDqGs0gDFBSOWlV9PtLux7c85TWQlE6Wo4/EfXbiTVPKgWY0VgECAwxBPJuKa5yqdHLCeha8TqTfi/i+NpXfLw5GORSYXLJjv+RaCezjCQxdq0mJSZPqMqBNH2IO3V3T++wro4VS7yme+mPEIDCnguwSb6c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444367cf-1543-40fd-354a-08dcf76bae42
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:15:04.1985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cXf8Pxbd+h+4LAV8ZrEkASJU6fTexzcqjti+k3gxT/HXSN7nM1CGTxZxZ+q64CU+ysftH4CJHibDWJfL5B5WUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4392
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_05,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280129
X-Proofpoint-ORIG-GUID: Ra1aWKdibcmdBxQCJ1j6K5xGTrMeY6Fq
X-Proofpoint-GUID: Ra1aWKdibcmdBxQCJ1j6K5xGTrMeY6Fq

On 25 Oct 2024, Kris Van Hees stated:
> On Thu, Oct 24, 2024 at 12:37:45PM +0100, Nick Alcock wrote:
>> --- a/GNUmakefile
>> +++ b/GNUmakefile
>> @@ -102,6 +102,7 @@ PKGCONFIGDIR = $(prefix)/share/pkgconfig
>>  INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
>>  TESTDIR = $(LIBDIR)/dtrace/testsuite
>>  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
>> +WITH_SYSTEMD = true
>
> Why not: WITH_SYSTEMD = y
>
> (since everything else seems to use = y)

Fixed (though there is nothing else in GNUmakefile that uses = y, or in
any Build script, so I'm not sure what you're referring to...)

... oh, you mean in the output of Makeconfig. Makes sense, agreed.

>>  TARGETS =
>>  
>>  DTRACE ?= $(objdir)/dtrace
>> diff --git a/Makeconfig b/Makeconfig
>> index f3d47c086f4a..346078598624 100644
>> --- a/Makeconfig
>> +++ b/Makeconfig
>> @@ -218,7 +218,6 @@ $(eval $(call check-symbol-rule,ELF_GETSHDRSTRNDX,elf_getshdrstrndx,elf))
>>  $(eval $(call check-symbol-rule,LIBCTF,ctf_open,ctf,t))
>>  $(eval $(call check-symbol-rule,STRRSTR,strrstr,c))
>>  $(eval $(call check-symbol-rule,PTHREAD_ATFORK,pthread_atfork,c))
>> -$(eval $(call check-symbol-rule,LIBSYSTEMD,sd_notify,systemd,t))
>>  ifndef WANTS_LIBFUSE2
>>  $(eval $(call check-symbol-rule,FUSE_LOG,fuse_set_log_func,fuse3))
>>  $(eval $(call check-symbol-rule,LIBFUSE3,fuse_session_receive_buf,fuse3,t))
>> diff --git a/configure b/configure
>> index 4026a3eafcd3..42e496b97a7d 100755
>> --- a/configure
>> +++ b/configure
>> @@ -93,9 +93,13 @@ built locally, none of these should be needed):
>>  
>>  EOF
>>  	make help-overrides-header help-overrides-option
>> +	cat >&2 <<'EOF'
>> +--with-systemd=[yes/no]		Disable installation of the systemd unit files
>
> This makes no sense to me.  How would '--with-systemd' mean that installation
> of the systemd unit files is to be disabled?  Surely that is not the correct
> description?  Maybe something like: "Enable or disable ..." or
> "Specify whether ..."?

... that's a really stupid description, isn't it! I kept on rephrasing
until I got something that was in <80 and ended up with gibberish.

Simply 'Install the systemd unit files (default: yes)' 45 chars, just
barely fits in 80.

>> +        --with-systemd|--with-systemd=yes) write_make_var WITH_SYSTEMD "true";;
>
> "true" -> "y"

Ack.

I've also arranged that --with-systemd=y* turns it on, and n* turns it
off, entirely so yes and y turn it on, and n and no turn it off :)

-- 
NULL && (void)
