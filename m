Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896388F77
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731329198; cv=fail; b=BZ6ilXNEL7s/cy8WGoR9FRYT1qWBK/UdKZB34ThBDnasHcCrs453VU/01EsVSlSEAaKYqVD/1br+SX/HCFDxV/bk9dXY+WMlf2An5TBzRdpyKr3dzSEmWG7V6De95lxhwcRsnGQdTFWaDRrHqWJ9zyTYwDLYnXqP690Bm2ecSNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731329198; c=relaxed/simple;
	bh=JdnkoBTZPQIAcl9AD3pbNnNbFOqj1eTwZTsW0il5SG4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=KiqzLPq0mzrObHQyZtkiEP5P9Mjlgf2ddOOWC6r1K/z6uJ6uXPS8xmDCpWQR9ImIx8FcSkJZqXgoF2X9gBnyD1Z3h2ozx3gpTILZ3FXGjl+uOJZJJbGy2b3CMV8L77WofMOepT5MbrPlXDw1Pm3tjhfnudnpE6yH6eKAwJNoL5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EhwWtXeb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xtR5fgA4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EhwWtXeb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xtR5fgA4"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB9soe4026306
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 12:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=P6icdN9uDVLib+9kbs
	BFGhYm4WAekr5jhGAC87yCGUg=; b=EhwWtXebBZsidGrNesqHfZudY/SDQwYbvb
	NgsGdQ/A5TEMSGVojjuSi14564mnfP1waPfMj9xG+lMwfpSwXBo4NqmQof38Fdiu
	k6PNbsTQI1eNML8iqto4YQMhoYUfB9zq/UZTQ0I4GhoAbGmjrb12uJ80xFavzKUt
	6dc5BtkOyU+m7aC3F3aHZ7wy4gGsJOfjSWxbNJdGs3krbmC0fNeIHuu8rymTNXwN
	EOYcGjjIf4dgBItE/NJKzFrVR5wSvMhTMcFlJ5f7YsqIZZh1evju07Hzz4ptCYIf
	mLcXqFNji02l1MQjTvPJYOStXp5PSHv2WOIaqS3M96rdZU7SfI8w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0k5aan7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 12:46:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABCKXlk037792
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 12:46:34 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx67090u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 12:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJvFPQ3iE0Q80BD7X3wHnTa4iH6Yfc8lvUlbJK3g8cp8H3h0vIxzWSxqeACZJIXTt7dEZLcnwKO2RxFM4Dho2J/yJ84Bnws/b0i2Uk9fQlubBiXorU+1nes3KLXWuQ1lkfpsxCkzNuK+KNzUZKhPGjAtLrYsEq/UrEEcHBLcH1oz+xB6EImXciVKGEv9ahLWw+KZlk0UZFPRCZ3vb18mQ2NrN9dqqq4LWS+qcRlMsYzHUTy2vRr4MIEsyw2/BtErtWXO+2SirAh6GLe8VIuPsFomgAwsY/WOSELu6/1L0L9edYKCVAHCapGZ3h2wwDBEqxHY94QIBGUtjhnuJSKBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6icdN9uDVLib+9kbsBFGhYm4WAekr5jhGAC87yCGUg=;
 b=PAHjzk/1Vbr2PFyhFMXuNdgrztzpIJiNflt2X57azv8JRnjgHYtRUFMkS1lfEEPX+aWmT0Bpr4Yb5OhQDSIHdDB402svN3yZXzos3I8naHaDLO6REku3xiO2gS/CbsYX/MBJMJv6G5+77BDiR//GnpwIfSrOvxfr42TPzCD4q1H3P06Svh5rY507r/d9ridUerwARH4kcR9aIfB7vWd6uk/97b6oNRlmm/V82SD1SFCvMqTjEW93piiU6UNH9eF+osQYzH9AZl6DGEX4+yQLeis7AdLH+im0ULiWUMl/PBNkam44NKm+Czzrt6nEyN4N2nCK+s8zoWIqACR28nZOUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6icdN9uDVLib+9kbsBFGhYm4WAekr5jhGAC87yCGUg=;
 b=xtR5fgA4gOf15Yd4X4gUyP6JgDQ+ZqzC2rjR+BtBdfixtiUi4TD1XMWlkkGTNrvg6yRuzgib+6A0Fd3OCG4K58Nf89pUPKSqMCFkTCjTpmaAU8ACGOiVY/7l2DOS7yN6+lrj5owlDMVFiqKZ8eCT3TOzq0YCPEg0DfWl4O6d8qw=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by LV3PR10MB7745.namprd10.prod.outlook.com (2603:10b6:408:1b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 12:46:30 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 12:46:30 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] Allow arbitrary tracefs mount points
References: <20241106164656.421931-1-nick.alcock@oracle.com>
	<Zy0D6TwCsiTMv81w@oracle.com>
Emacs: because you deserve a brk today.
Date: Mon, 11 Nov 2024 12:46:25 +0000
In-Reply-To: <Zy0D6TwCsiTMv81w@oracle.com> (Kris Van Hees's message of "Thu, 7
	Nov 2024 13:16:09 -0500")
Message-ID: <87bjym5466.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::6) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|LV3PR10MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c9f54f-d80b-46b0-4e21-08dd024edda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WnxtOulvDljpa+kH0XvfXQNd2CegdNe+qN1bxgTW5dTCjjPpxnraNlsOoPE9?=
 =?us-ascii?Q?YRyyEUlivE+QyvceeEOLBdOvy90EiRjHiVSln67CwD0VbMdfXU8hV1CgvAvm?=
 =?us-ascii?Q?Gvp09fKZobwwBD5BGMCnxplAzHqKeG1BLX0HnYDVFz6YYCCqqo44OaVrIgPl?=
 =?us-ascii?Q?OJpgTWMzN3Bu0hfNcAc+6s08VwTHujjVHOaypwu+tNRzVHpc4wdSRbYzwBFd?=
 =?us-ascii?Q?qblXcRh0heuIUte51Mrd2I3j8zsq8mOErm+W+a9/PtlrezhZe5DPA5SP3BFZ?=
 =?us-ascii?Q?qwXgZnd9hZQtYwFQStsoxLXTUq67aJ1geFKiysPnc7cU4BiXfXrqR2irbnNm?=
 =?us-ascii?Q?wGohaLq17AR4H53ExNrb/enb/4uHEpR9f773dtKU81uo1uDQRnviOxdX60mZ?=
 =?us-ascii?Q?23W0BZyqsHK6H+JkkScv0SfBT3gLgs8B6sQne7soOywpKIqRyR+FeG57juvk?=
 =?us-ascii?Q?VK6EEgvjjP6yqr94ftt0RsW55TAIh/WdV9FOpqi2Mi35CZqT3VFjHy3BCy12?=
 =?us-ascii?Q?oNZaEmfQpxl/v7grudpkB/OhUeF3YPneqpXs5A+7rHWkLxAidW0Q/n4Ziu2W?=
 =?us-ascii?Q?SgNSF9h+UT3v51y1P341fpE3zvRI905OzMOjNMbNN+tJ5YaQGZ0NAgqMFrrP?=
 =?us-ascii?Q?gvV5NC8huE58JdWQlCco608u9NWsYhy/Cg9AqCyUEiNvGF/HomKNaWZNj/M0?=
 =?us-ascii?Q?wcbuTv5xchw5oARgHIDit/Bjeg+T5q9p65/3kYLTrC4ZEeHGB7s35cypj1kv?=
 =?us-ascii?Q?ZDmY+4dDxuQny3Bl61KZom2RK+KrXBUFb9mH5lOHOhmLUdf3SoVUjkxEjjLc?=
 =?us-ascii?Q?x0F3lsEOVGB8jYELmLZaA2cB0AE8Yl2i38Tst/D8IJyVBTK3QIC6fHmIt1Nl?=
 =?us-ascii?Q?4C7prMfBhnREUPufgPleoI1i919SZbGqeNIUG/BxwZl5/NSYVpe9SIAIJa4C?=
 =?us-ascii?Q?bnIP2iZoItqHiAI92vToeurMAmiazwVN/CPqQ0sbYREiuN6jUuYtbZHMHH09?=
 =?us-ascii?Q?3bihRQB2omoY1PEB75vMd+6z9FzhQwpCkqgLMUWbAP3r+mt9Bh7NhhppSg/B?=
 =?us-ascii?Q?Axle226tjj7H1qNvwlTAeO5+akYO7uwX17Gxn7xUqBIpqgClSY69SuTomnTY?=
 =?us-ascii?Q?zkCb5AFolx5jEWGDnsyjjUSfkAfqWYiU0M2nD3DFleSfLBTN0yV+EOv1tuxQ?=
 =?us-ascii?Q?g9RpDbjITFfd8+bqi6QBg1TcrDpjc4oQ69x5gh0ulicNvGhZnP55t5ebZK6L?=
 =?us-ascii?Q?3dItrLg0dPKXEJAOj+QL1x2+gNPnM5NDh0wrqmYGbVCMpoFaCP8uYrnj76w7?=
 =?us-ascii?Q?Mae9g6c83+pIuIjQCL4lbema?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3UTuAbCxXukof3s39MJNjTgKIY4uR9oLiHyI20ssyQiwOv5ALMbY09IfuIn5?=
 =?us-ascii?Q?zScYVzfnPEcej9XE+scsEwv6HzQ3vYWtBDi85RWqKSacSWYHxk+1gdHN3Ybb?=
 =?us-ascii?Q?8A1Edoxdi29PfCLEvTG+feGoG+s5AogE9GCaFmWc7Las54cyBXhF2rKiqz5Q?=
 =?us-ascii?Q?KAYS80HEMNuSPPAhs9AyVokUdGWarFIr9s04O+1+Aohatd/At//eM2jzXgNA?=
 =?us-ascii?Q?EaALbnrWFEe5svNihuBBRn5cNyL2vhcjG9YikSMETTGYzWmOBX0gwHznrTTa?=
 =?us-ascii?Q?JFCH8Id0J3I0X+qgABjPfI3mL/tni9kEY0xJcWmW2bLp9dmcogBCVkmmCPRR?=
 =?us-ascii?Q?IT0qO/WKYdA1EM6vagiOXWRrLlidKtFQIU1RSY76r2tEy7Ca67TrRUvdYzDa?=
 =?us-ascii?Q?Uauk3w38k8buWLkiuITxsRohQngLmKh2FWtIYh0pPOikOLDbzQZwocGplMuL?=
 =?us-ascii?Q?cbeIbAu1A3hgUb6iSNr+gFdEuDFGCwX2GGoPuQZgN/XTBR8O6PAp4StVJ3qv?=
 =?us-ascii?Q?9Hk/iKsEe1+/jqrV0PxcNHVSyteE75wenFRJHhwhP+xr4sPULFrE/23hZ20F?=
 =?us-ascii?Q?4xZ+cdqwhnBN3sRRqpLyshFOD/HdnT6njtq+ADZwqvXhkui04TDFmfVbRKFa?=
 =?us-ascii?Q?s5mLLJ3gv/ErWM3a/9SUlaPrF7L+Sn4KSSRRI5kSPlDDqXDtZVCPo+gpjihx?=
 =?us-ascii?Q?VVn3BqS6cTvtEoVV38bma2Nr3iLDWNLUwpHsWProERSRWdk1TieDfLDJjgz+?=
 =?us-ascii?Q?xYLq1N8KDdn+0VlwHmxvyfCh+d0jn/M0mLWDQizk8Zf6E/tAIz5ngPEegMB2?=
 =?us-ascii?Q?Vi77ByMZpiXhfUzGRrBQH9i16o54BQaG5N3p1JHajf+3wSmrcA6bGGt9LIfe?=
 =?us-ascii?Q?DoK7i6abMJcvbCglAOQwZxWEpfvxRrfwxH+wxUcM5KWwLFkr+Txd5SbWcYsM?=
 =?us-ascii?Q?YjzKrl/yOteoGT53IAiEmpSRpatFRw0kAJ4djBtYFwf8P+qRkCShCqiCdwhm?=
 =?us-ascii?Q?8jn+Dji8PdHQ8gNcqe0g77VNjAyZZWS6/OLzKGIrBztlUQi3eL/zwDRP+f/s?=
 =?us-ascii?Q?ot1FvjpQaSefgMT4i+r5RO3Oe/Tj/1AIojr4gjkF7yLiIlLXn5ku4L3umOKt?=
 =?us-ascii?Q?Rx4miaUm1MniuXhzQ3xOaKMaYzUfs4UM0oauGIom2lgTCiVq3KfjmdKNw72+?=
 =?us-ascii?Q?ZV2eeTdJUuxVhQy3jwaFfTXB3sOPt+txsglMmb2wMtYM6IKiTYFPwzPszgOO?=
 =?us-ascii?Q?p5bOz/aN56CFFj5RxQaGFTcrDvqokrxtrQWGQabCgfi+A6pvCjPlDCJH0LAa?=
 =?us-ascii?Q?UUFFHMMZKTtN461sAfbqF38IPR7rvK/SABDyMLUOW9fqhdZ2DniszkU45lEu?=
 =?us-ascii?Q?paCp58qZVHZMMBP4/IWpZf6OFTuJKKds/rs1Azza1Ep3F7aj1ypdHyMraN07?=
 =?us-ascii?Q?MUp4bxTVVji6B20Tf+T+Ts1Qvrucx7ZSFfP2qSxmoCNub4uImMXBHdej1uos?=
 =?us-ascii?Q?tOxqgr2YMYQbLgRX6mfvvFybsHJxH0xZg+6InAtwhnKdNfOv36SgBfWlHA4Y?=
 =?us-ascii?Q?5w0nbT7h/cZBpkDZlEHBbwQRK7iroAflkUaxV6/2i9xJnYo/ep6HNx2Qq3oE?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IBFIBdePUrDynil7aIthA1/H7A1x85F2bfpuZgSXH/viPZ28SXOXM5JTsFNRN7ARfe4sIuxL92ZBhZt5fSiCPDkT/MMRiUc9HAHed8JCOCq7DdX/1Dar3r3oKvMtQ+JBg0Gz5QW75BmE/4LY55UJDq4qU7Z/MYNsOiG12b7GuS/4nhANcO0OHTJ5CZZBr6wn5qa/Z09+Ftf17cmJbAjsDlIVzDx3MPtTlilhRlpQgvKV39KqTdDPCX6W4pjeldlLs60PGELaWeEi9ieitknGB/N+YIonbv+YnHq6EuNiP0NXtK5qy22vFHi9HwbllNyUFqa7wabZAktHZC+jWVJxBnw+s+eSVjhStTI8GK15G6zJPFYXbj8UKmvjGGl9kxaj7LxeZL/xjfceRDA+q5RjWOKqqhkvWXFz4Jaf0ztQB65t1VufJS/C5GAj9kvzNMkeRxvKet3aPNuur/oz+ClkOLeILDjZELZCi8WwuAhg0/tOnCz74rbID3fd7q8TpunxD7b7vOVLlR+tQXKER9V5faGTkTK2GeT26ST+OGej9UmJYiJb6ZxZvwR1/Hc2Xl9MtDRPjidWutcSF49F/arEgnVEOYij4dkSQGwqAZLmdBU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c9f54f-d80b-46b0-4e21-08dd024edda1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 12:46:30.7807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uqV++pM28ROBdDveF0jcfLr+n4rLZ66jkgVlULMf/TtLzMBYMv3YVv9wZugSGTfWHm526CI1KvBzzCeB3efI3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7745
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411110106
X-Proofpoint-ORIG-GUID: uM-BansTn2yFn18qmuBvulErCD6iuK5e
X-Proofpoint-GUID: uM-BansTn2yFn18qmuBvulErCD6iuK5e

On 7 Nov 2024, Kris Van Hees uttered the following:

> On Wed, Nov 06, 2024 at 04:46:56PM +0000, Nick Alcock via DTrace-devel wrote:
>> Tested with both in-practice-observed locations of debugfs.
>
> Since you mention that tracefs can be mounted anywhere, there definitely should
> be a test that exercises this functionality when tracefs is *not* mounted in
> any of the typical locations.

That's hard to do without disrupting later tests, really. You can't
mount --move tracefs and if you unmount it remounting it in the same way
it was mounted is... interesting.

I'm locally testing with unusual mount points, and it's easy to tweak a
VM so it always has a mount in the "other usual place".

> And I bet you meant to write 'tracefs' here and not 'debugfs'?

Ugh yes!

>> -	{ EDT_PRINT, "Missing or corrupt print() record" }
>> +	{ EDT_PRINT, "Missing or corrupt print() record" },
>> +	{ EDT_TRACEFS_MNT, "Cannot find tracefs mount point" }
>
> I think you could make the identifier a little shorter (EDT_TARCEFS would do),
> and maybe the message can be "Cannot find tracefs"?  Especially since the code
> that throws this error goes through all the mountpoints, so the issue is not
> that the mount point cannot be found but rather that tracefs is not mounted.

It's that we can't find the mount point. It might well still be mounted
in ways we can't find (e.g. in some other namespace, in a disconnected
subtree etc). Unlikely, I suppose...

The MNT was to indicate that this is specifically about the user needing
to *mount* tracefs, rather than some other thing, but I guess I can
shorten it. I can't think of what that other thing might be anyway.

>>  };
>>  
>>  static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
>> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
>> index 68fb8ec53c06..9d246cef2e7f 100644
>> --- a/libdtrace/dt_impl.h
>> +++ b/libdtrace/dt_impl.h
>> @@ -354,6 +354,8 @@ struct dtrace_hdl {
>>  	char *dt_module_path;	/* pathname of kernel module root */
>>  	dt_version_t dt_kernver;/* kernel version, used in the libpath */
>>  	char *dt_dofstash_path;	/* Path to the DOF stash.  */
>> +	char *dt_tracefs_path;	/* Path to tracefs.  */
>> +	char *dt_tracefs_file;	/* See tracefs_file().  */
>
> I don't think you need this _file member (see below).

Yeah, if you want to have to free() it over and over again. I avoided
doing that because I thought it was unbearably noisy.

But the functions you suggest eliminate any need to do that!

>>  	uid_t dt_useruid;	/* lowest non-system uid: set via -xuseruid */
>>  	char *dt_sysslice;	/* the systemd system slice: set via -xsysslice */
>>  	uint_t dt_lazyload;	/* boolean:  set via -xlazyload */
>> @@ -643,6 +645,7 @@ enum {
>>  	EDT_TRACEMEM,		/* missing or corrupt tracemem() record */
>>  	EDT_PCAP,		/* missing or corrupt pcap() record */
>>  	EDT_PRINT,		/* missing or corrupt print() record */
>> +	EDT_TRACEFS_MNT,	/* cannot find tracefs mount point */
>
> EDT_TRACEFS, cannot find tracefs

ACK.

>>  };
>>  
>>  /*
>> @@ -713,6 +716,7 @@ extern void dt_conf_init(dtrace_hdl_t *);
>>  
>>  extern int dt_gmatch(const char *, const char *);
>>  extern char *dt_basename(char *);
>> +extern const char *tracefs_file(dtrace_hdl_t *, const char *);
>
> As mentioned below, I think it would make sense to change this to be:
>
> 	extern char *dt_tracefs_fn(dtrace_hdl_t *, const char *, ...);
>
> so it can operate as a *printf() style function.

Oh that's very nice! Why didn't I think of that etc.

This is why I love reviews :)

> As mentioned below, I think adding a function here would improve things:
>
> 	extern int dt_tracefs_open(dtrace_hdl_t *, const char *, mode_t);
>
> This will open the given file within tracefs and return the fd. 

Naah... go the whole hog:

extern int dt_tracefs_open(dtrace_hdl_t *, const char *, int flags, ...);

i.e. make it a printf-style function too.  With that, we don't even need
dt_tracefs_fn(), since literally nothing calls it.

(you do need the flags, and the mode is best defaulted I think, given
that no existing callers actually need it and it would uglify every call
and there is a reasonable default (0666). I agree that we must
unconditionally *pass* it in dt_tracefs_open() though, since we don't
know there if the callers passed flags that need it or not.)

>>  		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
>> -			 EVENTSFS, GROUP_DATA, prp->desc->prb);
>> +			 uprobe_events, GROUP_DATA, prp->desc->prb);
>
> ... to here with:
>
> 		fn = dt_tracefs_fn(dtp, "events/" GROUP_FMT "/%s/format",
> 				   GROUP_DATA, prp->desc->prb);
> 		if (fn == NULL)
> 			return -ENOENT;
>
> And apply the same changes to the other providers.

Ack! except this one can actually use dt_tracefd_open since it's used
to open a file... the same is true of all of them :) goodbye,
dt_tracefs_fn! Oh this is such a nice change, thank you!

>> --- a/libdtrace/dt_prov_fbt.c
>> +++ b/libdtrace/dt_prov_fbt.c
>> @@ -7,7 +7,7 @@
>>   * The Function Boundary Tracing (FBT) provider for DTrace.
>>   *
>>   * FBT probes are exposed by the kernel as kprobes.  They are listed in the
>> - * TRACEFS/available_filter_functions file.  Some kprobes are associated with
>> + * tracefs available_filter_functions file.  Some kprobes are associated with
>
> I would keep these comments as is because TRACEFS representing a static define
> or being a symbol to represent that this component is not pre-defined is quite
> equivalent.  CHanging it to "tracefs *" doesn't really make a difference.

I thought it was a reference to the #define in particular, which is gone.

Dropped.

>>  	FILE		*f;
>> -	char		fn[256];
>> +	const char	*syscallsfs;
>> +	char		fn[PATH_MAX];
>>  	int		rc;
>>  
>>  	/*
>>  	 * We know that the probe name is either "entry" or "return", so we can
>>  	 * just check the first character.
>>  	 */
>> -	strcpy(fn, SYSCALLSFS);
>> +	if ((syscallsfs = tracefs_file(dtp, SYSCALLSFS)) == NULL)
>> +		return -ENOENT;
>> +
>> +	strcpy(fn, syscallsfs);
>>  	if (prp->desc->prb[0] == 'e')
>>  		strcat(fn, "sys_enter_");
>
> This and the following code in that function could benefit from simply using
> dt_tracefs_fn() and doing a free on the returned string when done.

Absolutely! Actually we don't even need that, it's just doing an
open with it, we can just use dt_tracefs_open().

The result is wildly simpler and easier to read, despite using a ternary
conditional:

	fd = dt_tracefs_open(dtp, SYSCALLSFS "/sys_%s_%s/format", O_RDONLY,
			     (prp->desc->prb[0] == 'e') ? "enter" : "exit",
			     prp->desc->fun);

(caveat: only compile-tested so far, I'm sending this while make check
runs).

(I'm wondering if the general pattern of "open using this format string,
call dt_tp_probe_info() on it" should be encapsulated itself. A future
improvement perhaps.)

>> +{
>> +	free(dtp->dt_tracefs_file);
>> +
>> +	if (!dtp->dt_tracefs_path)
>> +		if (find_tracefs_path(dtp) < 0)
>> +			return NULL;		/* errno is set for us. */
>> +
>> +	if (asprintf(&dtp->dt_tracefs_file, "%s/%s", dtp->dt_tracefs_path, fn) < 0) {
>> +		dtp->dt_tracefs_file = NULL;
>> +		dt_set_errno(dtp, EDT_NOMEM);
>> +		return NULL;
>> +	}
>> +	return dtp->dt_tracefs_file;
>> +}
>
> Make this a function that takes a format string and optional arguments, and
> then uses vasprintf() to create the resulting string.  Callers can free the
> string (hardly an issue).
> 
> Add a function dt_tracefs_open(dtrace_hdl_t *dtp, const char *fn, mode_t mode)
> to open the given file under tracefs, returning the fd.  Returns -1 (after
> settinng errno) if the open fails for some reason.

I ruled this out because I didn't think it would be useful. This is
clearly ridiculous, it gets used multiple times and as you show it is
ever so much better than what I have now. Adjusted (with tiny change
noted above, they're both varargs now).

Another tiny improvement: we only accept tracefs paths that do not
contain percent characters, since they never should and if they do we
can't just slam them on the front of a format string without
modification like this.

>> diff --git a/test/unittest/funcs/tst.rw_.x b/test/unittest/funcs/tst.rw_.x
>> index 29c581116154..7e178778d900 100755
>> --- a/test/unittest/funcs/tst.rw_.x
>> +++ b/test/unittest/funcs/tst.rw_.x
>> @@ -1,6 +1,11 @@
>>  #!/bin/sh
>>  
>> -FUNCS=/sys/kernel/debug/tracing/available_filter_functions
>> +TRACEFS=/sys/kernel/tracing
>> +if [[ ! -e $TRACEFS/available_filter_functions ]]; then
>> +	TRACEFS=/sys/kernel/debug/tracing
>> +fi
>> +
>> +FUNCS=${TRACEFS}/available_filter_functions
>
> How about having runtest.sh determine the location (not just checking two
> possible places - look at the mount table), and export it as TRACEFS?  That
> way tests (incl. future tests) can depend on that.

Done! (exported as $tracefs because stuff runtest.sh exports is always
lowercase currently.)

It turns out to be literally a one-liner, i.e. shorter than the code it
replaces that does a worse job in the individual tests!

-- 
NULL && (void)
