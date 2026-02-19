Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5249B346FA5
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516569; cv=fail; b=RuJ5cGGM2Y/TCWNDCYJFRqeQNOuamGdf0W5LRwFk6HJVuTSZEj7w5PWmclcI4iZUvYrD6QmVByyK/sUzsCzVuPxR+90pmPuE4J5And3DMdifta3yplY6Diq1ndTgSY2SITwlKkKRZcdyvvxcr/aufs4Z38/I9uTANccKOkxe3zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516569; c=relaxed/simple;
	bh=PKegPq5SoSTL9j3dZ5flqBXG4tTyg0ORJMu/Pn4AOSU=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=CNFZJlYjJYnwizAY18DnMVS8BH1+nr2tJSQzgPfcsEqTTHbj9p2IVJnRd+BFvErXHQwJA2FKTvT282RAaOYt2U4DVj7+M2tV4E3GXh9woDhCNNo1yuQPLtXOYUWigeNlOMXBGJNaYBaTYUq2EdzFjXvD2u4SFFObxzL3g4WqKHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BD9bN9p7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vs2HSOhT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BD9bN9p7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vs2HSOhT"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J7SkDO026220
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=R1EhhqUeTAjA+IZo8V0EHFkfFJtyx4KqlOmkf87hSp4=; b=
	BD9bN9p7pXDXDwH7UBXhqIFJ8bNT6PPMu1dJLMkmdTG0uTG95Du37qRU24sRvT6d
	H0ZYlElY1qcLNKvSSu74CFeRAQ+Rv9TVeF7hF1/V9KQjaZSnR5kxJN2DZmhfL18y
	D0eHmGWcJ4HRN+3lxpmo6ZgArkQtCcTOHjRLs/f9lSWmKBMLPnUAISDRCVaUMJO/
	07Ap2SaZlLGHxl8/1jgGShdMLSj6FO/Yw5fQYywZ+NVEwtowkpEDgANHrq4zMxUB
	ALTBlLKkXbclGseOhQvIka6WxWzgy7AnhLpgWUmAv6LmDVQW7EMoa7UwIzAhA9F9
	lonBOodmaiWxBPKJPZzYuA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj0rfp1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61JETTRr016114
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:06 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ce4ax34md-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Feb 2026 15:56:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l98tBK2Umx1MF3eABDBPyUat3WzoBrKglTPYzSXZmsgkatqdGl/uCK/cw/pJgnRJc82bgUcFO29T5tvlp4uCKaeF7Kp1bIwoPJfnbQntGy4UhWUNryRbVB4PTHP5BE45XGh1H1vGTqXc9hLnaf4iXPTcUpIYvalQ2hgiZaseOlUzdeUVf5lnppONDl9ZcAb99JkNKZsjIsNZhEek/TUMRMVoiH62rBWWY18i3NaW0CeXJfAdzOGlSIuahTSAl344LiZEKUlEDabrPNniDyiv6GdsEy+JGOVvAufNCLo9qQJUrX2YzOMkiXBPx7izq9tAAZoSD5rmr8u53I6i5zytZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1EhhqUeTAjA+IZo8V0EHFkfFJtyx4KqlOmkf87hSp4=;
 b=QV5KYMko5oMyHicvBhQ9kn5yWOU4txrALTXh+NuQvLFradFxEt2716L61jheBmNGWN+43AP3dw9L+3vzLT+KRsZIIYv3wYbnu6QYjuS0UgnYV8/cFGrlfuk9uGHymeUwcry/4hFIlentkFxJP6WlweehmhslBbyMQi0pU+BEb07HZ/P156N/EIS+6Mc6TEyXnxxIPlGCf/mnXReDI/QPQSezvjTs94lqPLL30FKsO3h/vw4JTbw2LVxklSHXck9KVuzRtKhsuNwe9d8j3RSQ26Dq41cpJUpQlj/fh/YNReZ/scRnopruo4cokLlHTyLE08KPjHOyv2STd9w7gwxZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1EhhqUeTAjA+IZo8V0EHFkfFJtyx4KqlOmkf87hSp4=;
 b=Vs2HSOhTCBKwhp/brCWytUKpaBQum0htjLl20WazmTQIiKXIv9FLsV1OgpR/zMieEfyQ/VQc5Ch6ALqV5x/+EQaPjXhgPsKvgXHWESGpIYyOziHSJLxqkEOLeM3hSKFLvzMDNMelarLIUqH/njSKeHqQ4DFKWxdXno9yE3HQZnM=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by IA3PR10MB8395.namprd10.prod.outlook.com (2603:10b6:208:57f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 19 Feb
 2026 15:55:58 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:55:58 +0000
Date: Thu, 19 Feb 2026 10:55:57 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] usdt: enforce provider name size limit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522E8B33F4324C52F522B90C26BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|IA3PR10MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3b14bb-115a-44b0-4138-08de6fcf5f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SAqZQ/5ixh0Jz1jvpknyVJdPMsf1oaLEgBilCLVkFc8z7CvjxDdWiB+7jT7Q?=
 =?us-ascii?Q?F06ZdssM9mu2ktmSBvLTdLS3AW7mjO/L3v814dpEo3eaDe1oYVexwU2HJgnm?=
 =?us-ascii?Q?JX1dD9aTN9kW1REokuZEDndooGSpOqjxt3ikk7kJboMjfScZ/Noij17EXh2P?=
 =?us-ascii?Q?VfoevLGPCNcTtA+eBjHB2G019CbpYfr5syNN5YhXVxhmGjSot4mYLKOFE0Bx?=
 =?us-ascii?Q?uttMIOmhEN8j13G6/Wr4XvPF3Vic4i9jbVMc8DIjD7GsEL9/5qufqE6P9G4T?=
 =?us-ascii?Q?ZKJgKEuYXS4eAJgz640vLKmwoOJKARQ2JjNONg596cdKBfwZUTaQWdCIxT20?=
 =?us-ascii?Q?k/MgD1Qwsw7z0mqK9MXE7oakoCUf6w/Q5EW7QaTk2IWQCYicg4DHbys5Ghza?=
 =?us-ascii?Q?rnq2POrUXd9gTTYrcyeG4lPrQEv00IcmyQykOIiUPVRmUBCqMKz1DHh1nz/c?=
 =?us-ascii?Q?3/DUhZNB3wpYyS60SKRgFSVolionbbvixWmIXirVwjm4WVn457ysRWGxmdAG?=
 =?us-ascii?Q?WlP170CTpCAE0Q2DKGg2fpZ9tj9oN6VobFfsx0KdLSe2LPAH7iz//BxvsZMj?=
 =?us-ascii?Q?g5ctgr3e89RrQuvLEGbTAG6DiqJWMv09HjRZb8vKUwY5lAeTN61QzYVrAYxR?=
 =?us-ascii?Q?XGE99nvtvEQyaM87SR4SPfjwujMwmzoRqTp0LHnpUdphgZEr3/Rcadp+1Jmm?=
 =?us-ascii?Q?RW2FnzoE90pudo15B56Z8nrgKZ3WgiLxQxKlWmqgjr4y7TmEJNBOtQW1khpX?=
 =?us-ascii?Q?1eGUYsW8pqFVx5USBGb+G0x1nB+CD0ILTf2JOmZeUev1AAzULF/SQAA88mh3?=
 =?us-ascii?Q?7Lx21Apms9pE8NtvqLFHYpcBNI8Srf4thnYoMzM3MOzwSZg6aTuCPnnqiuVU?=
 =?us-ascii?Q?gXL5Pd0zY4GJGyrMxYfnx6DdLEnWq3DYKWf9L6ul7qDlyOjnDkEf6XSsXCUM?=
 =?us-ascii?Q?oWPjg/vXpJBMRQ/rt9ltYDrMdUgczR0tl2XglfnaZcZnCeFkj0MA81U9Jyp/?=
 =?us-ascii?Q?RN/sVf5cMn2CmD/0zBPunSi6xg0wBEoTSGME4h9UISCX+ytf1KRKH7ZAss/H?=
 =?us-ascii?Q?ZKH0+NVAj2ez0ibwDVMyR+qrl/p4qKvEiex8Ow+LMThXhKa7vi1XXeKpZFGs?=
 =?us-ascii?Q?DXOzLrMbXjBHG5PZUYG0awn9zk538D3qtvFNC+SV1JY1UwRm0EpJDW8sfcnq?=
 =?us-ascii?Q?Oz1gWyoPxFDAYqy7CoUUAMxeggygmkfNqNODHzGLOLD+nL+yvecxllC+F7bu?=
 =?us-ascii?Q?BUh6O+1l7ZHfMxcJTU3Cq2szcuT/sF7ch1+k3RFvC0mt9zSgJwTjXmLWYOGP?=
 =?us-ascii?Q?7DDdl1jBwOkZgnXAgBwOzSFRg+MlBvyk8Y0VcFCyYAEWmKbi2lp6JlMlviYJ?=
 =?us-ascii?Q?1dmZf+kZTXtMcT/R3iygcmQ6m3uWhzwiTyexj3sofAenxnuWy+GryZ2NhIkr?=
 =?us-ascii?Q?4E3q6jucC08cadlTdAbskNFXkXqGB67ZKU9RE3W/JL+bMYIlfFlGEnj4T0Ht?=
 =?us-ascii?Q?Dk5+P84Rj+rrElMrcxH4lsDEtdUKNWJ1yECQNqaQCL53qGwyqk/UII5qriO4?=
 =?us-ascii?Q?1bySD2eiveP7pVbpGqA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KTpZ4yH5CDmkx6mCExpx/+clq/EpIv5XxQSclyxbPT9Cg1OOqm/1ZcTfVS2N?=
 =?us-ascii?Q?LZcd/83fNue29Yy1eEXZCS2z0msW+Z5Dhgujr/+iYeg3rspxJkePDE75XUzU?=
 =?us-ascii?Q?WQKslP7d5xjKjV/YcEVmHGosFUWTi5Mvmzz+MUX4l4gZHcnm3vovkU24iFNW?=
 =?us-ascii?Q?5tPDkvKnwiHLC91/j7qnARTLXrljn6KkwI1Gup+6JuCXCZPH9E+unrJdO0vL?=
 =?us-ascii?Q?v2F9lpukSK/l0YweYKyn9ZiCpCIwkC+IBip+UqMDYUk9yRoQzd5jhP8aCCet?=
 =?us-ascii?Q?K+/2YBgsWBHrEAWJHgpt0SKBjKBRRzr6Ml0HMWXm5pkIW53ZfVmZBLkai5/x?=
 =?us-ascii?Q?sIVzTiR1uaWxo0pGiyIj5+GZaOlHTTRH8LC4kx2TWDtpUM8ov4sRnD1hS4zc?=
 =?us-ascii?Q?uebP/QHNMYIOxAnYuqoMafsVm2jXSsS/0SkrfyCH4jJZN/zUkTGES5laX3kJ?=
 =?us-ascii?Q?gaHwNBWqZZl5xy1UWDpBc+UkrkW0jOOIQIO8saxQ9Z9nVyoCVK+u9qjpD6wF?=
 =?us-ascii?Q?37/mAbMOTzJANqv45oD/CiWb5AlT2FNeQx9O7k/vvyKNifiL5UDu4Qj2v+x+?=
 =?us-ascii?Q?qUxTj6Mz/aCvxAX+lsMa4gqMsrCuOwgqsdfjJ9dn5B6A751fBd7shY0gmEf+?=
 =?us-ascii?Q?u5p9Gat2kzQ4VWGDdgD/ZhUpD3za38XLtDZRmPQoYRxGyf94jdHk13M16rzy?=
 =?us-ascii?Q?/Gi05SseNwvJUwX8RjEfYknAv3jwkuhFO2KRSJOhHsV3qU5qY6o3WrVYwL9H?=
 =?us-ascii?Q?MBhmuKVDJNbuRuFZzSLxPmheqvK69+ih9nHoJYjpQCFdPGcOVjzCJk86gSEA?=
 =?us-ascii?Q?SfeMG9PQ5SIhyat/ItZemxUP17IjgUvL0GlMjcJ0mGhjgb5eA5O+im4EaDL8?=
 =?us-ascii?Q?a/d4Gs2duFkX0+Dn0l5R45Ds9ypcEBgK5ZrOLj+xjjD2OyRqp6gJO9VVoD1K?=
 =?us-ascii?Q?KOfxOteRolR4PfwbTuN0RIwQBKiTJ8IMHCfXp4o6t3kVJEuQt2sXVP+CBy7r?=
 =?us-ascii?Q?InCxLVDbz8Ptxf79WqOguaPAfoSDdepjLqQzDgPKXiWjiR38/bE7wLSpYBLP?=
 =?us-ascii?Q?NhTs1r12o+16tcldtEEhuF8o/A2hZ2Ma1GKvucRb3W/TFTAVR35ePbjvhWJQ?=
 =?us-ascii?Q?bLZgqoe22FINzvrDprtck1wAvozrIt3iNlCzioz6cQP387k44vJyYpFtseJn?=
 =?us-ascii?Q?OCn+LuiLB9KX4xfU2B3adO1NyRtMmBV8gk5qzQunl66+sT+HM9NBBRIKG0Rb?=
 =?us-ascii?Q?ts79toVuDg+iAzrS1sdK28cxONnlZlDuYlsxhZeSQlAou6ZSl5CObY2NZngd?=
 =?us-ascii?Q?dKac92XPU/W4XUCaMUS3DiupxWoeFcnMkoLv3uNe8jVALTk4p4U9C5U7Mesa?=
 =?us-ascii?Q?v38muhPbcwPUJqsOvsURFpleoRq2Ju5TEoIWoJ9tO6xejVQV9pGHT0lafpzb?=
 =?us-ascii?Q?ZwZPTx91XO6D2XLaYZE/M8QtBHjkbFsWq804yex23LIHQ158XxKyRKwI+VAL?=
 =?us-ascii?Q?rEoTqSGRoIyaVvJsCA5HMLJ9IemUCkTu0f366ks7oD5OXLrGUfHCXYahzPZt?=
 =?us-ascii?Q?MoTW5PnI2GkAaDhMxdl7rRWDTz31th/INsiUWF6Hn029p1VqSfnhNI0ePcL7?=
 =?us-ascii?Q?2g5wUjWyQI5lRqhxNIIy3p5ejgkRGt3gBKYbSvvuCdsMKvD3+Ou8ax79LvqO?=
 =?us-ascii?Q?akrM/TTY4HBbN/Nf6Dojena1+9kgb9o5LLvAjWMLV+s3X2/KXLyUpzUKJhXY?=
 =?us-ascii?Q?kOEPzuW4sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6pi9t68eDjZw2vYL7mIT1k9/poGYhKESMpwt+/gXA7yNuVqAFqNTdOlIfxVNb5iiKQmwADr3VFIvay4RgDeldTkWfFb+1fcsLnmA6R8Rv+2Vg97XkR4d+RoYhWJk6KWQM9a9898ct9Q3+j/9iljY4QjN8JBKVL1N6tjwvEOtWlsbGRPshtGJMSU24yF0ioFwo0IHtMP6iHHD0IsIh7OpDpXh4RYGf9qqQWDyS8RorncCPvj/yvvYlPXl5zCE2bypdZHKG5bcuVDU4R4wm1u0H3vrfjEFlumtuT1iuHm2SrYEYC0nztyEwHOtABqgcKLRdUBCstoyitCMuKYtxkCtBOK7C+nFyr1kA3SQlLrickc5XGqbHQORYTtgnV3sQGVHFJjg4KJsouV7O/khGdEuto7SGPy0xskSwarh10bRG+8nZwqAyQ2Qw/VUrzo8WK45sacqmid475FO7/uHIl0XC1v2dJxhwWbXJEybvGyd6c7eV1AMACA0m13YMOlnFRZFWvuvZ0tquSV4IlDiInTBHMvisMhN3sFtceJTTFcmRcC3uat6qFg3B4bT6o0YDMTYuRBmv8AoX86APw7SMkBEgHid9rSIbibaFwZ9Nfqr71Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3b14bb-115a-44b0-4138-08de6fcf5f4e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:55:58.5138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEYlivfhZuuwPxQdfaDkKcRQqkiIMcXK6aqWKKfU+NvbDclaqFgkEZ74awB94W9Y4GddwEpuRVWOYULCCG5na/cJFiAmn9i6O8BGv6EPzk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8395
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602190144
X-Authority-Analysis: v=2.4 cv=V6RwEOni c=1 sm=1 tr=0 ts=69973297 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=BwwVrbhTaRPK0IXjvj8A:9
X-Proofpoint-ORIG-GUID: khdl_U2u-hB6QsWxnY0PY0zkpS8WMcdx
X-Proofpoint-GUID: khdl_U2u-hB6QsWxnY0PY0zkpS8WMcdx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0NCBTYWx0ZWRfX3JkbI9ZzRJS5
 3NBUs5Zb4xXXim6wSrXnfj3/cPAtOEd3ZAYZqEk1S1dpq1lFtbHCNtECT11OUoaUlUrezKHJbwP
 CFkodtIssKIdeNSBRu3C49Wk7MiBbZlmGKjBp5JxX+OKv+LKhr3IzXNUqHpSUVKEhhsDEoRAP01
 JZHD7FobhOkoJmXf9HB2vkkD0ichDgbusXzU4zMOfzpsLMWoKbh6LWzgm+5bIrFJe4YHWOralgy
 GcvjhnOrOAt9a7HKosrdwminddU2eo6wsMdzu5P+BZA6fHnexGhqzy5N93PdfkLTh+c3mA94ERN
 QDQoKnewt90oD7KUsPKVicyPHk/kQehePbXJ3HdmUuntn+2dQe8DqR/gw2NbnoZTUzxWmAVEBn+
 itqLFXHUCtifmaHivY8rdRRCCG7zXjW0Mr47kBkQ/0E91Tzziz9fT214xgANs5WHiBrgw+ui8SM
 qGtoZ6u0c4wuCVQPcgg==

Since USDT provider names have a PID appended to them, the base provider
name cannot be longer than 53 characters (PID can take up to 10 chars).

This patch also fixes error reporting for linker errors.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_link.c                     | 24 ++++++++++++---
 test/unittest/usdt/err.prov-too-long.r  |  3 ++
 test/unittest/usdt/err.prov-too-long.sh | 41 +++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 5 deletions(-)
 create mode 100644 test/unittest/usdt/err.prov-too-long.r
 create mode 100755 test/unittest/usdt/err.prov-too-long.sh

diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
index ffa16d9a..6d733881 100644
--- a/libdtrace/dt_link.c
+++ b/libdtrace/dt_link.c
@@ -148,7 +148,15 @@ note_add_provider(usdt_elf_t *usdt, dt_provider_t *pvp)
 	usdt->base = ALIGN(usdt->base + usdt->size, 4);
 	usdt->size = 0;
 
+	/* Ensure there is enough space in the provider name for the PID. */
 	len = strlen(pvp->desc.dtvd_name);
+	if (len > DTRACE_PROVNAMELEN - 11)
+		return dt_link_error(usdt->dtp, NULL, -1,
+				     "USDT provider name may not exceed %d "
+				     "characters: %s\n",
+				     DTRACE_PROVNAMELEN - 11,
+				     pvp->desc.dtvd_name);
+
 	sz = PROV_NOTE_HEADSZ +
 	     ALIGN(len + 1, 4) +	/* provider name */
 	     6 * sizeof(uint32_t);	/* stability attributes */
@@ -382,12 +390,16 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
 	shdr->sh_addralign = sizeof(char);
 
 	/* Add the provider definitions. */
-	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL)
-		note_add_provider(usdt, pvp);
+	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
+		if (note_add_provider(usdt, pvp) == -1)
+			goto fail;
+	}
 
 	if (!(flags & DTRACE_D_STRIP)) {
-		note_add_version(usdt);
-		note_add_utsname(usdt);
+		if (note_add_version(usdt) == -1)
+			goto fail;
+		if (note_add_utsname(usdt) == -1)
+			goto fail;
 	}
 
 	dt_free(dtp, usdt);
@@ -492,7 +504,9 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 	if (!dtp->dt_lazyload)
 		unlink(file);
 
-	create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
+	ret = create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
+	if (ret == -1)
+		goto done;
 
 	if (status != 0 || lseek(fd, 0, SEEK_SET) != 0)
 		return dt_link_error(dtp, NULL, -1,
diff --git a/test/unittest/usdt/err.prov-too-long.r b/test/unittest/usdt/err.prov-too-long.r
new file mode 100644
index 00000000..1305f434
--- /dev/null
+++ b/test/unittest/usdt/err.prov-too-long.r
@@ -0,0 +1,3 @@
+-- @@stderr --
+dtrace: failed to link script prov: USDT provider name may not exceed 53 characters: test_12345678901234567890123456789012345678901234_prov
+failed to create DOF
diff --git a/test/unittest/usdt/err.prov-too-long.sh b/test/unittest/usdt/err.prov-too-long.sh
new file mode 100755
index 00000000..599e461e
--- /dev/null
+++ b/test/unittest/usdt/err.prov-too-long.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+# Ensure that provider names longer than 53 chars are rejected at link time.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+
+dtrace=$1
+
+DIRNAME="$tmpdir/prov-too-long.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+/* Provider name is 53 chars long */
+provider test_1234567890123456789012345678901234567890123_prov {
+	probe go();
+};
+/* Provider name is 54 chars long */
+provider test_12345678901234567890123456789012345678901234_prov {
+	probe go();
+};
+EOF
+
+$dtrace $dt_flags -G -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+
+echo "DOF creation should have failed" >& 2
+exit 0
-- 
2.51.0

