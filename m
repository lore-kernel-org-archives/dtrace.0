Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF4A205AB4
	for <dtrace@lists.linux.dev>; Wed,  6 Nov 2024 22:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730931547; cv=fail; b=AuWbP8NfAAAjUlh3l35GpRYprD5BLY+pGeMYP7bEgsHvAsz9j0sgBB/OSqwrA55n1x8urG8DGIjGVot4qEjTEO6eFz0m2xzZ3MxCnQkJgqinGxDMbOviXr8P9oHYAnnlNyDdM0fZrchzAxKj4kAlH48KcEF2BKB8YYxs0NsNkhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730931547; c=relaxed/simple;
	bh=7QJvEmPPrJf60QHmBYTIQMx/qWSgE+S6j56eH8OizzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ECE0AUgj+XTHJFjn2mFLXo/nSfIqsYQhkXGWK1uqdIXDyWjyZH3/5YAiznqsjh9RiPYq+9UqYWZMp+7NSo0LzDCUErXVa0QedhfPUKIht5rX+1+vZEUutFFaJylWoWlPZA56hLEk8xf74cnlTp3zPvHGvNGFI10FQ8D4lI0UOv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AkOiKjWH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fQm2JEE0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AkOiKjWH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fQm2JEE0"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6Ltcxd023319
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 22:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=5oxG+FUJn675c1j6yj
	AqOY/+uvaUSitJggSRVm63smo=; b=AkOiKjWHhZ+qFrwZuQNjTHw6NKzLGAEq2E
	z+3tXo3n3e8NBd6ObyByKxInpvmMsml2hn75v3dK9XYFrX9tZilWVrmJsJQ13ZZN
	vA+UT0+cg2Djh9tzQH7qByqZxVFqd4UEzmlEb2/D8R7dddhOfpFHkM9l1AZT4X56
	mi3p7DoafUjGEK35pYPmGryoTzHMMfDXXdnfKhx6B9cIPQ22/DYeO9EZaRroIxWn
	BAAAMtP2D0Q1+fuUayhJkITL+ibrnyBkPlkintOM94rsvx8sgrdyX2fBRjrkP4d6
	Jcedqm1CLAu7yYvgYCIap096GrragMWLBR3Of1pW0JaXqPDu3P8g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42qh03cawc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 22:19:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6LbRoa036767
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 22:19:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nah97hxt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 22:19:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMin30r2eTtwZMBDItrnznjpWvrdfEzg3GwJ14OhqGCd6tcOhe8heVZXXpibKE5b5KJudXD6EA6CHfkdwWwPvzFnQpYmV0gL5RPmRtURg78W1KJJzmT0wrrcgGLoddmhn0TLvOOXDrXPzdJvZ93wmobNWL6OiGJoxFKUT09+ZQ3Veeqs/d0sfFlnS1rEUoSeOiq6BuyADsw4tWLrn1wTmyHQ2sL346h6Dr01GhBcmY1BFNqWsAmkw3YkALrKoY6uVQQazQ/tiu3gedOZLu3YXnpe+IxiYKzjMI46Yk+HkCCedwui/EeXaH4s8kQFjat0m27GCK23/EBDoutb+gEQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oxG+FUJn675c1j6yjAqOY/+uvaUSitJggSRVm63smo=;
 b=sFKk5PhfiZNUCi5QqVNUvsylF5nB56IODt/ka3Mi6cmWr2hUrWnShnq/ZL7Cm5pIFI6BtDJpFp9sN4oTbpkNGX3/dwCy+wDZTyUo9rW/vq8Gnsd08MUNgA0KL/zTwrZ1AujoVcLLPqS4ET6rp/C0BL43Rka9nuksQPTnIr3sel8/WMPzjbp0SX9QntYSrMxEOvCgc2mj5UrpF3IXkqTkuNNliNXMu3DEDMETj9GPqk3fLhd+sdfAP36EIJjr+vLyI/2OxX+JVvJHu7hRX7mckW91MboWTnUDu/PH/QWq2SsGjf+pvsJUq0nxQv0s1ic/6/EOBn0J3jxTayVsswayPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oxG+FUJn675c1j6yjAqOY/+uvaUSitJggSRVm63smo=;
 b=fQm2JEE05yRFYfOuznleF9VUcD+4zKtf9hKoySpFsphQmKcbwcVVXnHDOeeuGZsEhzKBd9b/CMW8LFe4OLe5azQyTvGCu11eOkuQJOB9ZTXuIVcSxTsIi85S3b14DvuiYtzuriqGTxrnq1WT4BhjhoajjnVr98c6n3XTasr3OxM=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA0PR10MB7580.namprd10.prod.outlook.com (2603:10b6:208:490::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 22:19:01 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 22:19:01 +0000
Date: Wed, 6 Nov 2024 17:18:54 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 4/6] usdt: typed args and arg mapping
Message-ID: <ZyvrTjP00r5pRmzL@kvh-deb-bpf.us.oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
 <20241105000608.333229-5-nick.alcock@oracle.com>
 <ZyppufnpOOJuaDxU@oracle.com>
 <87ses4ehnq.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ses4ehnq.fsf@esperi.org.uk>
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA0PR10MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 0901dc6d-272a-4fb4-7dff-08dcfeb103de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7fkEgiHWSdOSSBGvsa0eAmwgJhohtQxIaVPR8DRmoo/gr2XEJz2M7sMF8cEV?=
 =?us-ascii?Q?Oufb8QJiPP6LFT4v8jH0KImkUyk0/E+mVkKYbRNI62cFNo1VN73orOtbeab3?=
 =?us-ascii?Q?u67spsTK+p4DQcfLf6gLgtIF37Y946EzJ+Yts69IACZPPgknDeV5+wKQx4Dn?=
 =?us-ascii?Q?QKKnBVvCekmcWp3R5QPqjSeDJipInF8JjgLOB/ZlBHTMmEZE0+jmy/xEXI80?=
 =?us-ascii?Q?eAog/enk9UXAwYvxY8NZC1bJrXA+PMHzejMopVWw6FgDhBdCYBpgzJAMa4T3?=
 =?us-ascii?Q?sDk3CWnuKbuL6d4aenc03fQJj6r1ECviwtmG+G86SxRXtcosXE0ud7o/+2pY?=
 =?us-ascii?Q?Jn+lDeRj6yXVBHS1Kkjh9ewIXfK5DviUOJnfr2P0ORRx59G6xjq5Ka5bKwXx?=
 =?us-ascii?Q?l95VKsdloT0IRqxNrynTc8+NYb28zExxXT8KHkSfgggoiEi8e/11RPIehZT+?=
 =?us-ascii?Q?NejH2A3T3ac//gNtN/Rx9maROglORpy2TjZfD74680H85OMza7dHlwnxcj/x?=
 =?us-ascii?Q?rz3CH2EepJXve/x5zs/pAGlJMn2+Jw9sOZI02eiij2OfXmdBJBUnx9VxTjhQ?=
 =?us-ascii?Q?5W0E9TPfsWRU0We5nFvzpYs0dgDr3Bgfc7a+mLX+1/OyIxyeJ3QVXFuaYvbZ?=
 =?us-ascii?Q?DgXky9n9phG5OELSKwqiT75YZAMebsA97VzFzeMXagyIjgrskQps7guhPdUF?=
 =?us-ascii?Q?ZrmAgl0FNASZWAx5L/jYl2IG28kCHntO5Aodw1luCxvAJH72ya1J7Z/1wRRc?=
 =?us-ascii?Q?s856G1hHF0ebUha0EqqBZFEkiLEAXXimAmLuqZLrSKYialzamZNyqETuXOME?=
 =?us-ascii?Q?ZupmgDMgFv2WJ4ejMP7J++DMiQZpQm3rQ4BAZbJ0KMmIJPCunb6e22/lhkze?=
 =?us-ascii?Q?Jyy/ivJoKrYg2LfNnBu5M9hBd9doGvJcPHeo350D/q3Ye018Phu0Qf0JjimD?=
 =?us-ascii?Q?ZJaELf2EBsdacuukUpQJ9X0vX/OQ4EP2zEt2i5X29q2XqbtV+uBsNbI/UrV+?=
 =?us-ascii?Q?tBjbbibLtFlhP/G3iwMi8SN2oS5md+wgyBHUcle1VkISGHBesQW57sU0pTWR?=
 =?us-ascii?Q?zoap0B8+mAlL9ayXAPw3yseUsJsrmMm//nKqNDZW0ClayeqaNjk56Iib9L1W?=
 =?us-ascii?Q?waSJgBmOMsPnCw8QUv90WyhsjDitLATKofV5UfvPAYyFgeZtGR+rwGJHcJAj?=
 =?us-ascii?Q?mFKQV+fW+mHF7B4+4zNs4SwEqR87fkSC3e3LlwcSHm0rfjWnUqf20AdQ/OCX?=
 =?us-ascii?Q?IRpN4Zm1zMJBFPLU6bgBwQx88bXghLQ8Qoz1QIt1R34yflk8OyKSNkrDnLI5?=
 =?us-ascii?Q?VjI2lA5omhSFxWrXAX7bCyph?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fv6NNHeS2ItKtAEiMpkgBIHdv94zGj9FeeFIdYlN9x9nT9sibz3q679yB2qN?=
 =?us-ascii?Q?QqNwo+opytF6Qth4UDGraUYtZGDhR/vwBHE6PAH4VGfPRwQd6WPuEgKL9fbu?=
 =?us-ascii?Q?krBepKJg2NfapiptM66H1sqrbDyzbGIzbgtKVTJ6gaBDOygTGfTd/gyxOJ1j?=
 =?us-ascii?Q?NxQXSFMEzJ61E+fi1ACnUveE4hSHemK49/tOI6/VvcguYJLsAbol3UBMleTO?=
 =?us-ascii?Q?YmPayWqNaxkGIlNOVhe7j7TUzdwomwe99+u0rFjrjDolgI9eQzkxZUxYDyu7?=
 =?us-ascii?Q?aIimPcOagi4aKOaCKUmzW2x/g0is74BEHZKMtoHha0MvGn7EZyXHzosK3Ei8?=
 =?us-ascii?Q?/Gkvtd+Fv1/AAUK5ZiqFdR+Z17RRWMgoSfysCYvXfhPslwApM84kcbDHEJJz?=
 =?us-ascii?Q?mONQMqUQdecF+MhuT3p1VHGZy0sn6WJDm6CNRgTkZxq4fxrSbn0S9qNV/H8r?=
 =?us-ascii?Q?VJCB2ppzRZ9yonhU545zAdBmLuI+06E6wuII8lR6b5ZuLCHiI0nLtbiFVatF?=
 =?us-ascii?Q?omFnUTvAQTmi9mLSprHJ45Q/U9635qjES2vgBDmwZaikP1GhLr/N+1aX3UIl?=
 =?us-ascii?Q?8ozU/1IARJBhQmTEb//5gMvQTNcHWpSYPlZBaekhJPN3IYTT174Guc4k/k/D?=
 =?us-ascii?Q?6sLxmIDuA0f1X15qRwNKrztUL57CtNIEOnZ2IjsZxFcue3XhPH4uLow+XqpW?=
 =?us-ascii?Q?Q17Z6KfB3qS3J7yMBbC5m8cS+fvi59U0UuasSRtUTVDEx2gDjdvHnu/+jleR?=
 =?us-ascii?Q?JAVh9l3Vn9r/MZgXoE+awThLY9ATOyzRpjSPJ6fGe7JRa5Sz+cXGln/mdZIQ?=
 =?us-ascii?Q?5jsBI7ByTu8X+xMPLKIveX7aPzLkFGIfnnMo5ATHu4ORck1Br3SMDly68QAl?=
 =?us-ascii?Q?KYnwXTWBucknsxjo1UEUxrTgUiXbifQfxhp/VPVzHczolINrP4poKgeLcrj+?=
 =?us-ascii?Q?sqp3vt2i0KFbhQWLLai5Jzf8ZR6MU7qykHFgwOneQ5XvP6kZKKMgyHjNbJ+8?=
 =?us-ascii?Q?61ytyVIW63lKyPL6VaiP67dpVK+VHF97tI1jc/RCpfmZLLR0TwRiMDJzV6fV?=
 =?us-ascii?Q?TuEiMmwiOQ4tWvxhD1imwHKBDN6dfHvCy2ieLYU2P2KUy1BL+2bwaye7naQs?=
 =?us-ascii?Q?LBRbq6dcy+U+w1A7j9w88tu9LroZfWk6jSFeMOEQWRyVpfWw4Qe1oSjVkDO1?=
 =?us-ascii?Q?0j5avXoKKRYATIfIMhQx5wC6V4KCURKtydWnbu/bGY/sQfrXk9QEhbdlW4ew?=
 =?us-ascii?Q?uqhSYhsKJjcYKrQqeDucop5PRS9J1ZEkwrqBaXNfabNeRUXp1LEz46WpDtcG?=
 =?us-ascii?Q?HJwNq7PU0dHOQ4zcBvSk4cyUEQLpCh9XqLfd+UxiyuVlp1rF7vGJUyjOYMjq?=
 =?us-ascii?Q?t46i8ykX0zeYS6apfIRbwoSRVFg5xMO09rizbWqgmqCqkx1+Xj7ASPYBtfbo?=
 =?us-ascii?Q?lVLl/wiJxnEy+o4GR+QlNxkj/LAf0BuO9zcaoLiMY12vV57qD7tgut3fubH4?=
 =?us-ascii?Q?Xj/XfdbWj7FdnA0+cG/pEnltdtKl2f+X0QoHy4tQroubd5xT7hygWH+uos8w?=
 =?us-ascii?Q?7df98xgx5VY6JAhh5rdS6vI9i027KHvur40KRy/fA2rU7BwPvFtDweUV5N5J?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bOQ93uAnjlMdE4MWqnBUoG+xeFuS0PAZZ+h85+LVW8rnvv6vLvR//Ia/3HuZ/GRexfvgMiGzHBHMNnv24p/z9pZTNVlg/iZUTFDYMcc/9y0kCHnK/VwvmNjc2MvuZocmFRpIW7tWxAPVwJcUw6cHDV22eykx9fXWHHE9mgATKRDQ57gYIGf1Yp30YJ/9ndLNJiNoy5i60TRe1z/c51vIJT+GIH1pNbhC5ILZWLBbsxv5czLIfD6ut9Z+vjgtPEPpqmO23hBIj3UOYTVyqbr5hJtDhJT2FO+lIeUCvPjmA9dPsC7QLHKkeGXgYHExjih4C1+eqEbbGFC4Ae+H20lXlVpr2czOmfxobko+Ht7P5wLUL4pqoLOg6qJYIt0eCa6EuH44YMQecM+sSwz7eucuNH2ZnULZ1SiAL+zGucpUBXx/47sw5ekHgFKIP1IQpNCJ9QiS8lD8dxRI2x8YnyCsi46akQ4ER/P7/CnTUs67+FFRmc5tTMtZpqKEiD66Uja/6lGOMh7bCO7g7E4+RUGpIL5g8RZMBWwxXK+qA6FmnmLsL59dclGbMPld3/7o18/dzr2OFyUGwfv59GoDI2ocE/KZmpHx4xnjJTzg/oFJy1Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0901dc6d-272a-4fb4-7dff-08dcfeb103de
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 22:19:00.9929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4b7Ul/XZuKmC4vhz/MQ6Op8JfVGzYgKa3uerzY3ke3Kmg7UgF9aYstzsF1gMeDB0I4qWGmezvI7SamrvqU6f4kMR0wqvSlpegWS12eOyFko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7580
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_16,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411060171
X-Proofpoint-GUID: cLMXJmde9G4QPbVLOQk1wcSkWMFTUu9M
X-Proofpoint-ORIG-GUID: cLMXJmde9G4QPbVLOQk1wcSkWMFTUu9M

I plan to merge this patch with my r-b with changes outlined below if you are
OK with it.  No need for a new series.

On Wed, Nov 06, 2024 at 11:16:41AM +0000, Nick Alcock wrote:
> >> - * the firing of all dependent pid* probes and their clauses.
> >> + * the firing of all dependent pid* and USDT probes and their clauses, or (in
> >> + * the case of is-enabled probes), do the necessary copying (is-enabled probes
> >> + * have no associated clauses and their behaviour is hardwired).
> >> + *
> >> + * Trampolines associated with USDT probes will also arrange for argument
> >> + * shuffling if the argmap array calls for it.
> >
> > I would drop this since you mention the napping in a comment below already.
> 
> I was trying to describe what the function does, rather than only one
> thing it does which happens to be the first thing that was implemented
> (firing the dependent probes and their clauses). This is one of the
> things it does.
> 
> > Here is is potentially confusing because trampolines are associated with the
> > underlying probe, and that probe might have both pid probes and a USDT probe
> > associated with it.
> 
> So if I add "... for argument shuffling before the USDT clauses are
> invoked" in the appropriate place, is that OK?  (I assumed that was obvious.)

No, honestly, because you already made the case that adding a conditional to
only populate args for USDT is not wanted because other types of userspace
probes might have arguments also.  And that means they may also have argument
mapping data, and thus this is again not USDT-specific.  The comment in the
code itself is better.

> >> +	for (i = 0; i < argc; i++) {
> >> +		argv[i].native = strdup(upp->args[i].native);
> >> +		if (upp->args[i].xlate)
> >> +			argv[i].xlate = strdup(upp->args[i].xlate);
> >> +		argv[i].mapping = i;
> >> +
> >
> > Perhaps add a comment here that this is code to handle an allocation failure?
> 
> ... er, the == NULL right after an allocation makes that sort of obvious?
> 
> > Or move this to the end of the function with a fail: label, and goto to that
> > if allocation fails (since that makes it more obvious that this is code to
> > handle an allocation failure).
> 
> That's much clearer, though you need to initialize i to zero to avoid
> compiler warnings in that case. Adjusted.

Hm, why would you need to init i to 0?  The compiler should be able to see
that you cannot reach the oom label except after i is already initialized by
the for loop.

Which compiler version flagged a warning on this when i is not initialized.

Also, you put a size_t j; declaration at the oom: label rather than at the
beginning of a code block (beginning of the function in this case).  I'll
change that in my copy before merging.

Also, in your patch you added a space before the label (I removed it because
we put labels at the left margin), and you introduced space indentation where
there should be a tab before the dt_free().

> >>  provider test_prov {
> >>  	probe place(int i, int j) : (int j, int i, int i, int j);
> >> +	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
> >> +	probe place3(int i, char *j) : (char *j);
> >> +	probe place4(int i, char *j) : ();
> >
> > It might be worth adding tests for -lvn for all these cases, as an extra
> > check that probe info is being provided correctly, even in the case where we
> > do not actually trace.
> 
> Good point! Added some.
> 
> -- 
> NULL && (void)
