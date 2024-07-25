Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D312B7F
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721923360; cv=fail; b=ZGo2LvGxez/RjV8vp2fG7OaxY3cQO/pkKdAy/VWpOagUnsaAVliAU4VUj1SXSjLy3uWc/LBhxz4pS5+lSnPDDj8Or1WFElzUp81Ij0LwuiXDdzDNNt1JciI5x5bITC3YfhnKR9JJBjA49rng8aXhdL2ZRvcloiPxsgq4616w/YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721923360; c=relaxed/simple;
	bh=75WkzEdTTeR2RGaEvYd/E8CRvk+WLjvzB81MnSgAlV4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=sCJWlsmqvDGkPU43oM/UPOcsvMq3op0KH7ltQTjvYMIH6tQf2K21N98HOd92haKCtg6qM/iInqFViJt5XlGVfQ/PuZ6VVVeNo8Fkyxmob/y+rE2YMsPEgvR2jN2zck7ggkI7MJmCEXgj45/CBMFeo/z0wfyjsBugTV38eI9gpjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JKMHJMi4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H0+ONTen; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JKMHJMi4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H0+ONTen"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P8fUoF009072
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=mi1b6UdichP8ZX
	I5iTYc/9+s92rvb4dE68ecRJrR9wM=; b=JKMHJMi4EWf8T0yyIlGumqE55Oy0hE
	6nw/Q2ZWd2L5EhHckZVB3/Qqi6ZprwZgYdZ856JmZ2XIcul6oC5iF0xgenVQA0Ja
	uqeRlOcxAAf0L5+Tx23lLtlmXZJa0v1GjMkEoVgwdZ3eTIQc9/D8qms+td71Kcs3
	VLpvPvoy3Ggjg1hD3sEVCDRf2OjtgQhUH7hAnSNw+nFqh1py2HIEg7ArahW/VZWC
	VAT8wuQSm+rDnec7PY4jsO0QF6loPB7Y3yN5Ns3Y2EDRZPMvbWXd5IYwRoBWC2lo
	TuApbpEWJR/USUU9w+iaTIKRtRxPXGaHkcWYZeqCUxhF4cnKg6EgnlPA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hfxpm1e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:02:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46PEZnfA001224
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:02:36 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40h26cerkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 16:02:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPsbbbL6qx23iootLPYBgtpqGGE3Pu4T6xSzYZHgfV/JxNxBW6LKIfSEun/6qBwZrQ28e4fBepx2QE09dpybE6TuX747F7OvL3CPYdzbvs6oicbWXn7kgTzQ2gOnvq71SxlIKf3qpl2/M8RWGTn7Hvj1RKljCFwJzDCxI56ZblRGtrUln02zl1+4ZQkSyeoyQiO1PcsVuLsMJ7fFKmqtKIy1X1tZWGHp/fd1ewXLk1IKU3TPC6A17QvJLYJh2roZ+/yPjGFa0N0snA9sds7e8rac7zJFu70rod5ylLfmNF/a1e1m077FdVEadTR+yUmwfpH4n7lkE7FrCEHDq0b5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mi1b6UdichP8ZXI5iTYc/9+s92rvb4dE68ecRJrR9wM=;
 b=G/vg1upzOTuMqB17TWG6yRS/F3GP5Fbe+tVkrsBEJhBDiNsmsz0wtfU5vlmB88OwGWsNoNqduV34op8+7sSaBZgceVeGsBS0rPurNeDjnnUxl+ogN2vehMRnEORay3stT4aJwx1dI24PdwMamPBbFLAHBVkjecorpB/m3imuJTX3TBXxwUaNB6Em+REe3iM8j8gQja6VN0NIH8BVm7o4jlyWN72kC3rVAhGfrsu6AIhOaUFLRdklI6fMfsLWApR9H17xkx304rdBOqF8kxTMvmz9YvojtM1mJmu833gy8tcLz6xb9B+lxzputDW5lwryV4MNkPXIcU7VBldJaFXrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mi1b6UdichP8ZXI5iTYc/9+s92rvb4dE68ecRJrR9wM=;
 b=H0+ONTen6naaOxJJgDnps91x9pjRszhvYrd6qH3EUGDjp3oEKhe1TYKRpP8YfyXBbBmILXAMK3f3B+Mqyay/9IdAiOfKbbDhKjUhR5SzJ5q/iJbYXW+ACOl8nU87HIovlEBFyvk/FBCKGpaZKjOOiB5e21Drv4olk4DzusNFW1I=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by MW4PR10MB5703.namprd10.prod.outlook.com (2603:10b6:303:18d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 25 Jul
 2024 16:02:33 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7784.016; Thu, 25 Jul 2024
 16:02:32 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH] btf: ensure BTF-to-CTF conversion works
 for modules
References: <SN7PR10MB6287CB0F14DD5FBF62319CBDC2AB2@SN7PR10MB6287.namprd10.prod.outlook.com>
Emacs: freely redistributable; void where prohibited by law.
Date: Thu, 25 Jul 2024 17:02:26 +0100
In-Reply-To: <SN7PR10MB6287CB0F14DD5FBF62319CBDC2AB2@SN7PR10MB6287.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Thu, 25 Jul 2024
	00:56:11 -0400")
Message-ID: <87ikwtxxwt.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0301.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::19) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|MW4PR10MB5703:EE_
X-MS-Office365-Filtering-Correlation-Id: 10fbc0b3-35f7-4729-41de-08dcacc33162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rs86Mhti+IKC/unu6gqwRnUE12lvxTZmIXcmRKap1PuNLHj61qlcaOzn/laj?=
 =?us-ascii?Q?mRhndz8KeON95dmMJkVyps+0KTsW0QZTvNmeQ7A+fEgGKRV+KzpIqU4sTawW?=
 =?us-ascii?Q?i6Ysq8AOA3X3rthzxw/kxuciofcuT4Bcp0fFJ+ycX+cWvsdsyawOx0hBWIyT?=
 =?us-ascii?Q?HuZD/aL8zuLcnkxzNzX1/Y03bV8nKzSzAcaIMiAk7bx8n/sd+g0XwlpzxdIT?=
 =?us-ascii?Q?dhDZ+v0ZAKThHGdCAhRRaTB6BBHuMhFT8r6TWL9alCi5wnQHljy83bOl+u9I?=
 =?us-ascii?Q?9QB5zzBPN0IabNXyqXM+Ue3KdyIWgIb5nGqPCUmE3Fm5CrKl/WwOVrwBIibU?=
 =?us-ascii?Q?pP6SwXdIAW3oqlKwsZds63DIe4PksGZZ8RaSNG4Jqget32NXdbZI7VGqc/yN?=
 =?us-ascii?Q?9/FkZDMUbaIzMUaoW0WL7lviMQC8ZUojavrefJfyFMJTSzyZmUP7zrWnhq3j?=
 =?us-ascii?Q?Z1cKDLwg6MVijniKOW90vELa3TtZzbn4RskJhQ+PFoa1YZWzNJlFP1jxQqGi?=
 =?us-ascii?Q?V8bUY/WEenk+a4y8FKmrThg2cq1iErNQnnJLp3GRbZk6q6cWxfCVnCWoDPTC?=
 =?us-ascii?Q?ypdYBDwRxwA2pwE6rD9xlacJTyvGXXv1oi6NbcS37RqZm5/AQWtbO/3oWBhn?=
 =?us-ascii?Q?fU/JeFf86npgRQIgByyxCM8Gu5dugpHfFDZPCYoTtBKrRAE3gcvBAcE3UvJL?=
 =?us-ascii?Q?Qqws2FSXD51R6XOgN2VHy3fWqp00x5iibWyOHPXO0b5oiyX1578VYi7gm/BY?=
 =?us-ascii?Q?bL3m8mbaRLZNVDJvqu1KxhyTwcQFEu6TzBM4GRjbQWmx/XVUZLTQ29oKHBIY?=
 =?us-ascii?Q?wK/SD1YGhR/+MMhSRz2wZElMo+WePkubKXqT6GdIxWmI0/SP/I5a3ep8IXyW?=
 =?us-ascii?Q?AtZPc9SLfrRI/kVHvO3KAy0SdY+rVkrXjMYhiZwIRRNfCHwXu2JgeLhE19NK?=
 =?us-ascii?Q?zVwM3BvhLLIVkt3x000/VCxgHylAOOClA1dgrmXmvLcMbVdujhhfuaeyRLXq?=
 =?us-ascii?Q?0/zUiWMl+O2me1iLeCndShlW9trbMvchR5dnExd5vH1mGK0A1OtGOkn3vFxd?=
 =?us-ascii?Q?jKHbvRtAT+BJtx1zeiu1X0wI+tKlQxzjfTL2AalZ0iZBGkv9YDN4i4B7v1mB?=
 =?us-ascii?Q?kC5Fc0Xeczyqjsmoqnw2VGooIvAUeT/zSBbGGM2nywHIW6l3wFjTsMeHlHBv?=
 =?us-ascii?Q?Obp1tno6d3L2PM/i4Wy42GkiJXHIqPTf+9UNAqJyF53nOpf6Q0WTAVZ3lBR2?=
 =?us-ascii?Q?ZxmdJiCccgaLTTKFqPjlTdCmMsGxWBDgtAN1aHGuIBgHbmBYFUabNMo9qzsc?=
 =?us-ascii?Q?cftkNf+93xYDbufCtctYSwuWA/uSKFn5CYJPjXHLXDTNWg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NM8iDkc/AqI2vytWftJJmcAa9qYpe7lIqTRTk3yLw2VSu4ESk6Wr04Sjmop7?=
 =?us-ascii?Q?TUNFf5fecEeSsuAPRr9wcypZyUgVQIXYGxA6pjNRXEn8Th+1dQMpY5c845uq?=
 =?us-ascii?Q?7bu1DzobCb+Q7VP4Rzqsb/PT4Ul2fmaaD8i84nL0JpAeGvltD1Pyf27wqaVb?=
 =?us-ascii?Q?BnDRJvP1dfWjNmPzMMGK+9KBJ2pOUtAYLTwbJkH8YPXiqF4d7jQwpPMnRMLU?=
 =?us-ascii?Q?5wxe0pVm9n8PtEzkvfGnTdX85tE0fWYF/IubZ0jCsY18bVbDMfptetNyHCEm?=
 =?us-ascii?Q?obpJL+hOPErZjTYz4MZHJtsmCWqdE3frnxKz7/sC07cKlBkPvRywRk3VkE6V?=
 =?us-ascii?Q?LbXIlIHHT6bCaX05ZjPg8y932TkK73rSfQZfV4plp+6m98ZIFHQf3NeYkcHS?=
 =?us-ascii?Q?najthrDhTzhqKw/Xhzt2+62FcprhIrxBrNX78DeEcZDzRlosj/f3FvAffJUP?=
 =?us-ascii?Q?mtKAkDGgOs8XfkweGu0h7umtOcRNMY9FpzHjwBqvsy3HCLc/++fmeBnYVIi4?=
 =?us-ascii?Q?wgTrERrBBsSnzeUZHW0RRw4RcGSdtX4YgvwRZezaZzt+V4kwm4ZituDLmsO8?=
 =?us-ascii?Q?TnK2uMOuH9U0IpiXdkykf2ObRsJKJwn7NgtD2q2cpmgJdU7m08ZAGScYrPrD?=
 =?us-ascii?Q?S9muM4StHAzRIMAsla42xNojPgToj9uWUGA1e6Ee5Gc4QMs9MQh1KxXGa+LO?=
 =?us-ascii?Q?nsWDQjLN700xpgoxjSSR0+oJd+93i7N1Xwb67sDqlfJ50EP1yz3Vp9eZrIux?=
 =?us-ascii?Q?LuSkjTsfEfmZ1Y2CyabCs6BjKoePF1Wx32Dp9AR2nnad/USDadEy06YqBuxH?=
 =?us-ascii?Q?cN84majiggaTTytOyeFQ9Eo43igj4RJcPCifM44/r6YLfga8H7FCeVCNxg/w?=
 =?us-ascii?Q?um8YRZ9GW7DhqWDIaalBxeUWkaBBbbBNuSaCglfVjhLqwtJncIZYRlm0WtfF?=
 =?us-ascii?Q?y9qI5OxcKXyfxdVoYNkEGXnXhTNbNDS9YWUPWf/IIMCny2vgRimtr4B6Vyr8?=
 =?us-ascii?Q?RwCuzgMeW6w7rPyA/2xWeCIOcO4jjCdfmGMsTi9ZrCSGEX8Md5n3NN6K+hPY?=
 =?us-ascii?Q?PInvucWAHduLnXN2Z90ThyOv5wC179geXwtea6yI0+3mXe/JDLfmGIzID4mf?=
 =?us-ascii?Q?FtkFeWzAZWUuojpo9kfjxDRYXsCI6BVERTqGT9DwOeWLWiQu0jl37ZG12Fwg?=
 =?us-ascii?Q?fcEpnB8ubOmM/IocR4/9tMkCavLZEf0PLI1SdbQvw7WdgPpXysu5MLaa7wqV?=
 =?us-ascii?Q?cNrEyUY19PsGjFXVdceft6DVOMFuExOGz6AIYcMkrgGwocl5gPc5vzpcLDMz?=
 =?us-ascii?Q?vlkAQRLkLZFaZ9SwgZiX4Lr6mJfA/rTeH/5nRFXZuoSpTY0yw3sDk5HGikNt?=
 =?us-ascii?Q?pXklvbROhHicC6TY9z2xr6dQJxOAPxpAHP+1Y1J5j1AAJ9VnVUOy+d6146tw?=
 =?us-ascii?Q?AHWAWhPafwGWkS9x9odPO5zzYZmjKt7FmVUe6Mrap9eWK1RwXehq7bqCdOBj?=
 =?us-ascii?Q?n3Fowm/S059jSMC9xpKUBm2swvPTq+2R7znIFyzM2jMFCwIPX+WYVZdqYSQ/?=
 =?us-ascii?Q?DCPw6PWr8/BspYYsxjQTnBMBtVEloXTKYdNqSazwTQPQU9zJ/LMppRtdvlP9?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MChCEfdCIe2Y0WEmuZS+gMg/vXe3l/wmDFfHFsgCWbZOUHIcBHdVlskhx/sJGi3vUaPpvbGKs2+O5CXcCaTMtY/XJv5SmZRCzOy17vrdb0mwnY5boDb2YUfGQwDgUgnYJh8b+DqiUeDhTOR0opWAGau3xgxTR2Rg185hXhO9mWKJkG2+6QyDcTrFPlHKyzPh5E6z8eeAbhnWtzHo8Hzd7EkW63nqQ0ZabiK1CMZpCzTJBk86YEhpFomyk9uRWg6AoRYbWEkPbRGGrBbkXaVWE4xGN46WUX76IWyQEexb/Tfxv0g6bhBI86CtXgxQQd8kT9e9t2fL0X4RtuJH1txrq55bAwI3/wAhHu6uW3gNkWaxQUZOdbq38+mcYfW7a9b3rAtZf++bqUYt1/Jp7mtMw7Fged5Yb0KNcnWhtE3skn6/o+yhc3MFqvzQd/4LI9sMU5iJLMucbEPyi7oeEB2/n60zxf6V9Lu9/wdTgNXCpsj+2pmRjbc0klU5tfGwwsPmT+RCRgwY/J/9/wS84L+KWONLntZEI1AlZCixejwwX38AToICPmLCqwB3pUSZxwMXELXOkF+KEFzK90rcrRIs2FXvO52zKMRQtsALSRKTv/Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fbc0b3-35f7-4729-41de-08dcacc33162
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 16:02:32.9278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PT16p1DX9IcovYTP2R0FLM/vN9uAcWg9YTgNGtsHoLaNv60ECO62LEC8m04pR7uYWl86DkJY8efkEoH9+59KSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5703
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_14,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=967
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250109
X-Proofpoint-GUID: 8SyhQIH8B9gFfVMIXMgHKtZYDQWT2m7t
X-Proofpoint-ORIG-GUID: 8SyhQIH8B9gFfVMIXMgHKtZYDQWT2m7t

On 25 Jul 2024, Kris Van Hees via DTrace-devel verbalised:

> The recent introduction of code to always load BTF data for modules
> broke the BTF-to-CTF conversion for modules.  This patch ensures that
> the BTF-to-CTF convertor code is called from any module that does not
> contain CTF data.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_module.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index 5e608446..cbbb1d3c 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -962,8 +962,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  			dt_dprintf("Cannot open CTF archive %s: %s; "
>  				   "looking for in-module CTF instead.\n",
>  				   ctfa_name, ctf_errmsg(dtp->dt_ctferr));
> -#endif
>  			return;
> +#endif
>  		}

I'm having to refresh old memories here, so this could be wrong, but...

... this hunk seems wrong to me. Why is this return here at all? The
original implementation (before the converter) tries to load the shared
CTF from a variety of places (of which this is just the first) then goes
on to try to load standalone module CTF if the CTF for this module isn't
present in it. With that return in there, if the CTFA isn't found we
fail to look for CTF at all on the libdtrace-ctf (!HAVE_LIBCTF) pathway,
which is precisely the time in which some of those fallbacks (.ko.ctf
etc) may be needed.

Why not just drop the return?

>  		if (dtp->dt_ctfa_path == NULL)
> @@ -1018,6 +1018,11 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  
>  		dmp->dm_flags |= DT_DM_CTF_ARCHIVED;
>  		ctf_setspecific(dmp->dm_ctfp, dmp);
> +#ifdef HAVE_LIBCTF
> +	} else {
> +		/* Generate CTF from BTF for the module. */
> +		dt_kern_module_ctf_from_btf(dtp, dmp);
> +#endif
>  	}

This should probably be one conditional later, so that we only build
from BTF if there is no out-of-tree module with CTF in it. (i.e. at the
very end.)

-- 
NULL && (void)
