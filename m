Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471A31D9663
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 05:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741757666; cv=fail; b=qkcyW3IdCAxaEdYxDATOWUwuIndKMC4IZSAR2IfrNg3yvWJtmoXi3lbUQnSCSIGjE7HWA7ZnFc4dXdj5kQCFH1ZJw5OGc3qgGoHxUzP4gV48f10nVs1Cr8Qvgy9BL4ECPvsE88SEAiJFZWcvMZbPUtZ8ElfEf/15vhg0CGEkX6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741757666; c=relaxed/simple;
	bh=ek2AFVUtwzUz4sCA/IqD494e0V8sUrLd+EhydkEf7WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=La86i6tWDpnA8T/7/ZFSM81HenWG/cHgz32bmvQU9VhjJbskqww0Kmhb5GIi9YmT4+5BapV8WD4f4DUKC1OMJbfT8jV2d7BaD42BAge76MwE69AEGp6Be03b7AO4HOG619x4DrpKh8jxEZmY3Dr+1aPKjp1m/rZkAu9D++ycjgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XY8/aCx6; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ENr7f1Hl reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XY8/aCx6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ENr7f1Hl"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C1hmLe003374
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 05:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=/DLkWoYLxBm6auMQwb/rcqSM43D0M3VzYi7dYY5uhZw=; b=
	XY8/aCx6j09FRtqOsvpQo7Me3b82NoAjavT+IdW4eYxNjppbvpGoAXA87y67GYrm
	qNqppE1FMJklFg8Lyt4Cq++6oT2cxHJreAHmW+p8o6rBf/q5Mns/A/ArMqTsInCv
	T2NV9vbobOTzvZlDslSBI3Oblusw6KV4kYh2Z40lFnOmfyQx/QZ0oVByJSqXvOWm
	e9mPLi8icqimuvM77/traOua+G6xsaxyXFBxitl7K7pyj4REdHO2m000hwJsv2zd
	u/dZ4SnZ+GaIB5cYJzzy+cs4xqZYFd7PhJCN+9wDVvWUvCiWLucSg+3q2tEFIYsG
	ZY6G6FQd7G/bLGnraFct4g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45au4h8vjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 05:34:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52C4YhtT004459
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 05:34:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45atn09hd3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 05:34:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQi9hA429iTcIwtykbaZfBrACkse/H1d3m/vfrOUQUNqWkU3JUtO0UqrNAfDWpiqNj+MumVdE7I449jUBeTcFpZyBN1+20gQPAPNx7QhsOBQCu8mRpiTT0acuw24IWeYqr68GRM6xDS+qt/hU8D8UkM3O198R4gZMDB3ck7DyNhh7JfaP0HC3RuwofYtIMvNbEgS1HLmsumISVcVLY1RZm8sj5Ozkm+2+2JZh4Ar/XS3hA/YjAF4PQFryRvm6aOuIBJHmrQf3DN6ORSfBS5S6xB1X3GNbyvr2GShM4vmk/0gkj142aYD076dirYG5DeTWQGEodRHcVL4ji3+aX0NdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPHwtadLVYW5xBvvrvjQdvnd2pepscXxY0mzrp2hmBI=;
 b=Gftai52elyCXq1hAchrYxY/SA4bMCLCKsAgPtsoo9Ytohtl/nbqASD+sl6uFTi6i1pYAtu6p+8NYnw/gzKJ068PCPcmLSvYtPYbGtzRn7uQBS/V1CbWnehoCJgScza/MoEirRE1c63CZfRjY+XiCJvIO9szmJa8ZEuIQzt8ggMh4fZPpvUqJH8hSZWMupEtKhWbIF98J7jtlutq1L4DOeL5QcsOnIg7jfIX6No4b914NeGptxNv/XE9H+1kn/FAOthzfsO6Zo73LFHM8XTK8xOqCmFOVZvWXJvlmjhgQpxAOiNGks9TU97CVMvWyrdEpPjvgFR8IRU2hq6E6Hi3W9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPHwtadLVYW5xBvvrvjQdvnd2pepscXxY0mzrp2hmBI=;
 b=ENr7f1HljSUbjDcytOS8JLvrj6QViLKxS3C5xyNIntT/Q6RIF2cjOWGkD4ERZGOk0CX9AFUmvCpDfg1HbSHg+1L5OJZYG8RqZiNvRmRHJh2sJq7liSn8rxIp2YT9JV0F/XItaWOYnbnnVCzpyvbEs0OUyjFrrOdncPoxMmTiGKg=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by BLAPR10MB4900.namprd10.prod.outlook.com (2603:10b6:208:30c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 05:33:48 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 05:33:48 +0000
Date: Wed, 12 Mar 2025 01:33:46 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 6/8] fbt: performance improvements
Message-ID: <Z9EcukBSIMGcxe8Q@oracle.com>
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
 <20250307213441.9495-5-kris.van.hees@oracle.com>
 <a7159b93-884b-9911-b736-f500b3b8a6de@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7159b93-884b-9911-b736-f500b3b8a6de@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|BLAPR10MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8cf2e3-779d-41b7-e47a-08dd6127772a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?LuSJMv1aAij1EyPRKt5Bfbt6h5soiFlRkyamI1gSYSMkyP8Yuk9HvbRKOS?=
 =?iso-8859-1?Q?Hzw6nu7oOBUdvMksXCRVYRar+NMSpRgAv8+/U+LmIeJcssoPD8sYeu6lO3?=
 =?iso-8859-1?Q?c1jFMolP25LEw/XbJZdpe1OWXbA3zAwyQ6isYrCAo1tdbq85fg8kFZWyS0?=
 =?iso-8859-1?Q?/ir/ZFfbvBizDXPDqeqTsTIhg0dtWsIVL34QIVmV03Ehd7W+HNRim3FV2w?=
 =?iso-8859-1?Q?iYJVkonwKhHSItpxEg3i9XpKnDMDWgtKaw1v9/DtItwWY/9/303OFrdMmX?=
 =?iso-8859-1?Q?HGVlnDCrhdJ5NSsgtWWfFlrZlXjEixG+eDgkhIPzPmUf9qGdsesroA7Ypi?=
 =?iso-8859-1?Q?LH2V3yyTKc6+fU3KpHfqQhu6Duq49yb7R+PIwojcrZsf8sucSo1W9n+1WA?=
 =?iso-8859-1?Q?NlB0VV8ZwpdBY3RhjXBa6IBDZ6zZ8k/GwnMY0jl67M4OIO3lKo3MEuHnKC?=
 =?iso-8859-1?Q?DQ2cH6fgQxKsrI/roH+FoIHBckIfGT7BlcBxFwIqcgaV/MMhCuTyNY+2HC?=
 =?iso-8859-1?Q?QYhictnzRzQ3sa4DrHrM6t5tnNBNh6ncB+jTpT1my+drAENJu6crJFDkdF?=
 =?iso-8859-1?Q?ngrv+TktEY1qjFdDE/r/hCn04zfOWL8rFJM/nB8KvYW8LsFG15C7Az2vw7?=
 =?iso-8859-1?Q?BM7yYjd46ZW1ioVxrlhSCtvQF5kgRYDRXqfzXS5FeQpBGmx/mfFmqVp+9y?=
 =?iso-8859-1?Q?WP5LnMiH+PHFomsNyehbdsg5E81YNg8UnoP4bmz0mV3r8lVJot4sAxO4AJ?=
 =?iso-8859-1?Q?WKhh080+TlB8063qPcXADZkHw5zbGa6RQyqk+jSmg3NffGuY9q4iz9+xot?=
 =?iso-8859-1?Q?CVYgw6pSBMNvOqZrQzzlzysm+u8/dtu5mw68idH1hc1ebOjNzIUh9OK7RA?=
 =?iso-8859-1?Q?zQF8hr9hiuZNdD1oMwFbJ+I3Sh1ekG8Gvo+tqp1C2+82BK0Gyd7vBBHFR2?=
 =?iso-8859-1?Q?+Cb4YQAIXlvTMYzBkdNAYSnZAV7VyIT9q/u0PCscnj9LOxbNIheQYhJTy8?=
 =?iso-8859-1?Q?u9kRUYVxkWkLRvMlBzrXCRIBkWW4gnDhqqaT9ynW4DUnQPwBemgA3rPuGz?=
 =?iso-8859-1?Q?r0EYvPfn7wO3WOKnzpUuLbA9hA6C0z+4WQpWapxFbeCkuLWMOyDcDIUWDO?=
 =?iso-8859-1?Q?REbvnLYsu9CU/1JT5L+eTLJNZnnaiARNKiIHOV717Jwrzbjpu34hp8/ep3?=
 =?iso-8859-1?Q?gSOFJzZ6LOU9TfdfSfOlctc8I33AHyGouKc81j1CdTbphONOG8cMotOXAf?=
 =?iso-8859-1?Q?n8TLWgcjTRGlxrk9uL3MxoWrSx9A2byFGWM668u7Rrc22BmluG/BqUp2yU?=
 =?iso-8859-1?Q?iXr80XPjZkhY9340UEH5AK7IacfJLfew3Uj8get0cCUqayw9AmODG+UW/R?=
 =?iso-8859-1?Q?ZEHe6ZOrwsGLddbMtov1luOvyPxK9jKLpkU15OR2rMNxDcqLkvzyudY8jF?=
 =?iso-8859-1?Q?aGgwjlaViPfrYxex?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?T8kAxRTTxf8pR7zIcUWa17yxh4Xp0UEeJ45+zEuxdj7IlCTaz5SPEKFfdj?=
 =?iso-8859-1?Q?1YftbovWLGGh1e0+QgCAMg93YwXsDKDzk/0aFXEN09i3zYfRRvaIihQJBt?=
 =?iso-8859-1?Q?uqkWEpFqxALp3HWis4G1Ay1ABFjpDHHHwAsw5/rQSlLoKvLNUAOi3B7t3L?=
 =?iso-8859-1?Q?NQtV560WfTLYuOK3D4m8sONcS3tV8/lvbCk+JA36xl00+8rpAaN3SEk6wK?=
 =?iso-8859-1?Q?pkcjMnM/P/4aYAzKk1SVUDzLCcoLOOgt9B5pvdnbJctOIjx+ESrD5dKbT8?=
 =?iso-8859-1?Q?lSjy5PMEKXICtP+XVMRtJ+1VeLeFmfERzzJUTEDKxQxHTa/B+rfv2dJYPi?=
 =?iso-8859-1?Q?M+lM4AM3IKm+ddo9ID/oMopQ0gjWH6omh3Y6IgFSu3uYlBzGYloCK6CtYx?=
 =?iso-8859-1?Q?k+vpsTY6NW9Qg9Sdg/YeCM7D46cvppMjMDK/WTlaJN2AwzYSg28GN1fayh?=
 =?iso-8859-1?Q?zTw0sEtbPXttXWFwIEeuo5BkgzSZ0i+xtoIwzpBSPaxrPMDOrgZWclYETZ?=
 =?iso-8859-1?Q?nTznEU2SRzytovASoJrteFmhKTffT3L6KKojVPaBQOpC1hAjbY5X1vkWDA?=
 =?iso-8859-1?Q?TgyBX2cSi26zJghDAqnXJTkRp8ZpryGuhR8pyPBwg5KALoInIjiEdj5tLj?=
 =?iso-8859-1?Q?nfTxsdSM+eywxJZ+2GaHxnlV5si2P9NTimN4cc8IQ5kMhn1sIwtsFxlMru?=
 =?iso-8859-1?Q?enfAzqVf/ui9p1MEMCf03RYZDtYuLcmVVmVCAD9a7uKT1/CblgRMk3eUG9?=
 =?iso-8859-1?Q?Xyyw/u4vc96EgeqeHsUGm5L9ScACAQZxOrvtuBpF8cfXp7ECe4znKwJXbw?=
 =?iso-8859-1?Q?YKSKXt5kK2RL3E1gg4MIhxWvsOm7/Ov9RA/ENFuTouS+Qy+BQjfR6sF6XY?=
 =?iso-8859-1?Q?aXV08a2WqJvW4k6dHeUWkc65as367ZrU49S8s4eInll6sjMX+qhzElm5PF?=
 =?iso-8859-1?Q?TD4iQr41hz6CRijvNfF3sJ14ZeaQhLiqQIywcC96CIV4U5d6t/FQG7236U?=
 =?iso-8859-1?Q?mUwE9+dhEuRUbNLTKjxjT8x2bXktCmcq9IyE+g6Vf0QkGE4i+PTTDBKbFA?=
 =?iso-8859-1?Q?Mn5YbMeGgjDiEfc5At9WH4KzIXMJ7M6jiyk6Hf8jFe/sBuKP3Ito6XPQej?=
 =?iso-8859-1?Q?XgxQCeDF0Zf8NvxLCL9WZgo+UOLfedFLVxrO2KADzjI3Ha5DJGSnBMDn++?=
 =?iso-8859-1?Q?RRXeo9mQ9Wi1ZBChRAU7OogV5u0XGPhaZmNxmZDPCcXdagJ6FqpCNBsyAB?=
 =?iso-8859-1?Q?cbXvWLIEGpkGdUL+qRg+lAIRCqF+elm5rZwSXlTbrTaOKy1E4c6uk2CYU2?=
 =?iso-8859-1?Q?TwnWfWcCcAzG1avRf4hVVFszjfhRkZiIK25hKjHacMgn+l9KTD/rwrrVYw?=
 =?iso-8859-1?Q?P33w85mfl0fVJIYG+ClJ4ZIWmGwGD7cwvdByP+7TOzGhBDEKn3ZgwxbCmZ?=
 =?iso-8859-1?Q?pUUFaRwMLWyhZHxh1xR0IB2Wtez4MXIxAYGZjZjeon3QDmyFZmzd5goRqY?=
 =?iso-8859-1?Q?rmFfWJ2QDRzObqplBS3yQckkD0QPP4P1hvqfSrpsWtrqjmXcpifolcrlEh?=
 =?iso-8859-1?Q?1MW1f2LPGOQRZwjPtdF9JWz02s+gD2ENMRndv/Ef1AoMfVT/bb/RiARWn0?=
 =?iso-8859-1?Q?GnRNyVarkwWRZOIYeGeWpv2yEqGSqkiW631GNAUWqSnUSMSg0j43DIvQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zQ5Dw9AVTXM9Tfd39lkFPWqURreUgmZQh8p87jh/vOTDEieEaoDITiMg0fL3J1lUhh+5WnOJ3QjHkbFlF0UPRTstQXiN+02da3rQUug6vTdiXA07vGwFjOxBJnswLy0ev7zYJ5K7kSK2rC7GhWu4SvuAQsI+ES+cWXMya3Sxwira9oicZQELR3A7a+se2bvz/RGm65/hovPQl2pAhwI+FD9h4z2PDwESmS1/klGvtBMVN2NFlWNd1gWohttmFxSCxCq9Jnh6w4XcqIDwkiLUlB2mea0wS+qxJp1aWEcf7l5Q+PAWM8FCxfdkCLcnKGAF1Ox0XqPvvBhs98U26Xq+Qo+9JyGxcpNWaHolhRRwggJN5Mm5vGsw7KwaowhyyX6XPd7X0umcOAKCyIaANiy9+03onJUH9dDJ0L1/lHwreqe9KRsxw3rZeFzofsLUiB+tin2UfSI7JLQqkGTnU4aKyJUzGQ2MOaZMe//k2bLtAEN5hmUatJ4D7OckdRex+Kqtbs0G0vj+jPEhnGp5xYQ7jV4YTrxVK/mtjnotZmbJl69a3n1ltZYVzUUh3cal1pUVowDz1HcP9CdFWI3YzRAQm2idOjEBvPnNlL1vK+XwWw0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8cf2e3-779d-41b7-e47a-08dd6127772a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 05:33:48.8643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4xb2bR8lr0tjdLoyt5hna+0BFlpTZD93S1cJbZhoTj9a7Z4g8IByxRbIxak54o1hKOJRdGu7K30gOZA+5pKaEg9Gi7wEWmORBk4a6V3G0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4900
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503120037
X-Proofpoint-GUID: HEJLn7IQzPq63Vnj3_sAwCONDBlx1ohl
X-Proofpoint-ORIG-GUID: HEJLn7IQzPq63Vnj3_sAwCONDBlx1ohl

On Wed, Mar 12, 2025 at 01:17:51AM -0400, Eugene Loh wrote:
> Sorry for the slow progress.  Anyhow, with this patch, I get failures on
> test/unittest/lockstat/tst.lockstat-summary.d on x86 UEK7 systems.  Stuff
> like:
> 
>         dtrace: could not enable tracing: BPF program load for
> 'fbt:vmlinux:native_queued_spin_lock_slowp: Invalid argument
> 
> Well, in dt_prov_lockstat.c, I see:
>         { "spin-spin", DTRACE_PROBESPEC_FUNC, "fbt::queued_spin_lock_*" },
>         { "spin-spin", DTRACE_PROBESPEC_FUNC,
> "fbt::native_queued_spin_lock_*" },
> 
> And on those problematic systems, I see:
>         $ sudo build/run-dtrace -lP fbt |& grep native_queued
>         98429        fbt           vmlinux native_queued_spin_lock_slowpath
> return
>         98428        fbt           vmlinux native_queued_spin_lock_slowpath
> entry
>          9433        fbt           vmlinux
> native_queued_spin_lock_slowpath.part.0 return
>          9432        fbt           vmlinux
> native_queued_spin_lock_slowpath.part.0 entry
> 
> In contrast, on UEK8, "dtrace -lP fbt" does not include the .part.0 probes.
> 
> Back on the UEK7 systems, if I modify dt_prov_lockstat.c like this:
>     -   { "spin-spin", DTRACE_PROBESPEC_FUNC,
> "fbt::native_queued_spin_lock_*" },
>     +   { "spin-spin", DTRACE_PROBESPEC_FUNC,
> "fbt::native_queued_spin_lock_slowpath" },
> the test passes.
> 
> Is that the right change to make?  If so, shall I submit a patch, or should
> it go with your patch series?

No change should be needed to the lockstat provider.  You uncovered a bug
in my patch - I'll fix it.

In short, while the provide() function filters out function names that have
a '.' in them for the pdp->fun specification string, it fails to do so for
the case where globbing requires us to loop over possible function names that
could match pdp->fun (or all function names if pdp->fun == "").  We need to
exclude names with "." in them there also because the FBT provider does not
allow probing of those synmbols.

I think I'll just defer that check to provide_probe() since I can do it in a
single place for all cases.

Incidentally, I also just noticed that dt_modsym_mark_traceable(dtp); is being
done too early.  We only really need that to be done once we get to looking at
function symbols.  I'll move it - that way we avoid marking function traceable
for probes that cannot be FBT probes because of probe name or module name.

I'll send out a v2 tomorrow with that fix.

> On 3/7/25 16:34, Kris Van Hees wrote:
> > Up until now, FBT probes were registered for every symbol that was
> > listed as traceable.  Most tracing session do not use most or even
> > any of these, and the process of registering them all was quite
> > slow.
> > 
> > Going forward, FBT probes are registered on demand.
> > 
> > If any FBT probes are to be registered, the first will incur the
> > cost of reading the entire list of traceable symbols.  Any further
> > FBT probe registration will be able to be satisfied based on that
> > initial processing.  The performance improvement is therefore quite
> > significant for tracing sessions that do not trigger any FBT probe
> > registration, and if FBT probes are used, the improvement is still
> > quite noticable because only the probes that are actually needed
> > get registered.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_module.c   |  78 +++++++++++++++
> >   libdtrace/dt_module.h   |   2 +
> >   libdtrace/dt_prov_fbt.c | 217 +++++++++++++++++++++++++++-------------
> >   3 files changed, 228 insertions(+), 69 deletions(-)
> > 
> > diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> > index 2e915e2f..e7553a07 100644
> > --- a/libdtrace/dt_module.c
> > +++ b/libdtrace/dt_module.c
> > @@ -22,6 +22,7 @@
> >   #include <port.h>
> >   #include <zlib.h>
> > +#include <tracefs.h>
> >   #include <dt_kernel_module.h>
> >   #include <dt_module.h>
> > @@ -1044,6 +1045,83 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
> >   	}
> >   }
> > +#define PROBE_LIST		TRACEFS "available_filter_functions"
> > +
> > +/*
> > + * Determine which kernel functions are traceable and mark them.
> > + */
> > +void
> > +dt_modsym_mark_traceable(dtrace_hdl_t *dtp)
> > +{
> > +	FILE			*f;
> > +	char			*buf = NULL;
> > +	size_t			len = 0;
> > +
> > +	if (dt_symtab_traceable(dtp->dt_exec->dm_kernsyms))
> > +		return;
> > +
> > +	f = fopen(PROBE_LIST, "r");
> > +	if (f == NULL)
> > +		return;
> > +
> > +	while (getline(&buf, &len, f) >= 0) {
> > +		char			*p;
> > +		dt_symbol_t		*sym = NULL;
> > +
> > +		/*
> > +		 * Here buf is either "funcname\n" or "funcname [modname]\n".
> > +		 * The last line may not have a linefeed.
> > +		 */
> > +		p = strchr(buf, '\n');
> > +		if (p) {
> > +			*p = '\0';
> > +			if (p > buf && *(--p) == ']')
> > +				*p = '\0';
> > +		}
> > +
> > +		/*
> > +		 * Now buf is either "funcname" or "funcname [modname".  If
> > +		 * there is no module name provided, we will use the default.
> > +		 */
> > +		p = strchr(buf, ' ');
> > +		if (p) {
> > +			*p++ = '\0';
> > +			if (*p == '[')
> > +				p++;
> > +		}
> > +
> > +#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
> > +		/* Weed out __ftrace_invalid_address___* entries. */
> > +		if (strstarts(buf, "__ftrace_invalid_address__") ||
> > +		    strstarts(buf, "__probestub_") ||
> > +		    strstarts(buf, "__traceiter_"))
> > +			continue;
> > +#undef strstarts
> > +
> > +		/*
> > +		 * If we have a module name, look for the symbol in that
> > +		 * module.
> > +		 * If not, perform a general symbol lookup to find its first
> > +		 * instance.
> > +		 */
> > +		if (p) {
> > +			dt_module_t	*dmp = dt_module_lookup_by_name(dtp, p);
> > +
> > +			if (dmp)
> > +				sym = dt_module_symbol_by_name(dtp, dmp, buf);
> > +		} else
> > +			sym = dt_symbol_by_name(dtp, buf);
> > +
> > +		if (sym)
> > +			dt_symbol_set_traceable(sym);
> > +	}
> > +
> > +	free(buf);
> > +	fclose(f);
> > +
> > +	dt_symtab_set_traceable(dtp->dt_exec->dm_kernsyms);
> > +}
> > +
> >   /*
> >    * Symbol data can be collected in three ways:
> >    *  - kallmodsyms
> > diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
> > index 56df17a6..dd3ad17c 100644
> > --- a/libdtrace/dt_module.h
> > +++ b/libdtrace/dt_module.h
> > @@ -25,6 +25,8 @@ extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
> >   extern const char *dt_module_modelname(dt_module_t *);
> > +extern void dt_modsym_mark_traceable(dtrace_hdl_t *);
> > +
> >   #ifdef	__cplusplus
> >   }
> >   #endif
> > diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> > index eef93879..d837e14d 100644
> > --- a/libdtrace/dt_prov_fbt.c
> > +++ b/libdtrace/dt_prov_fbt.c
> > @@ -41,10 +41,8 @@
> >   #include "dt_pt_regs.h"
> >   static const char		prvname[] = "fbt";
> > -static const char		modname[] = "vmlinux";
> >   #define KPROBE_EVENTS		TRACEFS "kprobe_events"
> > -#define PROBE_LIST		TRACEFS "available_filter_functions"
> >   #define FBT_GROUP_FMT		GROUP_FMT "_%s"
> >   #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> > @@ -61,19 +59,11 @@ dt_provimpl_t			dt_fbt_fprobe;
> >   dt_provimpl_t			dt_fbt_kprobe;
> >   /*
> > - * Scan the PROBE_LIST file and add entry and return probes for every function
> > - * that is listed.
> > + * Create the fbt provider.
> >    */
> >   static int populate(dtrace_hdl_t *dtp)
> >   {
> >   	dt_provider_t		*prv;
> > -	FILE			*f;
> > -	char			*buf = NULL;
> > -	char			*p;
> > -	const char		*mod = modname;
> > -	size_t			n;
> > -	dtrace_syminfo_t	sip;
> > -	dtrace_probedesc_t	pd;
> >   	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
> > @@ -81,79 +71,166 @@ static int populate(dtrace_hdl_t *dtp)
> >   	if (prv == NULL)
> >   		return -1;			/* errno already set */
> > -	f = fopen(PROBE_LIST, "r");
> > -	if (f == NULL)
> > +	return 0;
> > +}
> > +
> > +/* Create a probe (if it does not exist yet). */
> > +static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> > +{
> > +	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
> > +
> > +	if (prv == NULL)
> > +		return 0;
> > +	if (dt_probe_lookup(dtp, pdp) != NULL)
> >   		return 0;
> > +	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
> > +		return 1;
> > -	while (getline(&buf, &n, f) >= 0) {
> > -		/*
> > -		 * Here buf is either "funcname\n" or "funcname [modname]\n".
> > -		 * The last line may not have a linefeed.
> > -		 */
> > -		p = strchr(buf, '\n');
> > -		if (p) {
> > -			*p = '\0';
> > -			if (p > buf && *(--p) == ']')
> > -				*p = '\0';
> > +	return 0;
> > +}
> > +
> > +/*
> > + * Try to provide probes for the given probe description.  The caller ensures
> > + * that the provider name in probe desxcription (if any) is a match for this
> > + * provider.  When this is called, we already know that this provider matches
> > + * the provider component of the probe specification.
> > + */
> > +#define FBT_ENTRY	1
> > +#define FBT_RETURN	2
> > +
> > +static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> > +{
> > +	int			n = 0;
> > +	int			prb = 0;
> > +	dt_module_t		*dmp = NULL;
> > +	dt_symbol_t		*sym = NULL;
> > +	dt_htab_next_t		*it = NULL;
> > +	dtrace_probedesc_t	pd;
> > +
> > +	dt_modsym_mark_traceable(dtp);
> > +
> > +	/*
> > +	 * Nothing to do if a probe name is specified and cannot match 'entry'
> > +	 * or 'return'.
> > +	 */
> > +	if (dt_gmatch("entry", pdp->prb))
> > +		prb |= FBT_ENTRY;
> > +	if (dt_gmatch("return", pdp->prb))
> > +		prb |= FBT_RETURN;
> > +	if (prb == 0)
> > +		return 0;
> > +
> > +	/* Synthetic function names are not supported for FBT. */
> > +	if (strchr(pdp->fun, '.'))
> > +		return 0;
> > +
> > +	/*
> > +	 * If we have an explicit module name, check it.  If not found, we can
> > +	 * ignore this request.
> > +	 */
> > +	if (pdp->mod[0] != '\0' && strchr(pdp->mod, '*') == NULL) {
> > +		dmp = dt_module_lookup_by_name(dtp, pdp->mod);
> > +		if (dmp == NULL)
> > +			return 0;
> > +	}
> > +
> > +	/*
> > +	 * If we have an explicit function name, we start with a basic symbol
> > +	 * name lookup.
> > +	 */
> > +	if (pdp->fun[0] != '\0' && strchr(pdp->fun, '*') == NULL) {
> > +		/* If we have a module, use it. */
> > +		if (dmp != NULL) {
> > +			sym = dt_module_symbol_by_name(dtp, dmp, pdp->fun);
> > +			if (sym == NULL)
> > +				return 0;
> > +			if (!dt_symbol_traceable(sym))
> > +				return 0;
> > +
> > +			pd.id = DTRACE_IDNONE;
> > +			pd.prv = pdp->prv;
> > +			pd.mod = dmp->dm_name;
> > +			pd.fun = pdp->fun;
> > +
> > +			if (prb & FBT_ENTRY) {
> > +				pd.prb = "entry";
> > +				n += provide_probe(dtp, &pd);
> > +			}
> > +			if (prb & FBT_RETURN) {
> > +				pd.prb = "return";
> > +				n += provide_probe(dtp, &pd);
> > +			}
> > +
> > +			return n;
> >   		}
> > -		/*
> > -		 * Now buf is either "funcname" or "funcname [modname".  If
> > -		 * there is no module name provided, we will use the default.
> > -		 */
> > -		p = strchr(buf, ' ');
> > -		if (p) {
> > -			*p++ = '\0';
> > -			if (*p == '[')
> > -				p++;
> > +		sym = dt_symbol_by_name(dtp, pdp->fun);
> > +		while (sym != NULL) {
> > +			const char	*mod = dt_symbol_module(sym)->dm_name;
> > +
> > +			if (dt_symbol_traceable(sym) &&
> > +			    dt_gmatch(mod, pdp->mod)) {
> > +				pd.id = DTRACE_IDNONE;
> > +				pd.prv = pdp->prv;
> > +				pd.mod = mod;
> > +				pd.fun = pdp->fun;
> > +
> > +				if (prb & FBT_ENTRY) {
> > +					pd.prb = "entry";
> > +					n += provide_probe(dtp, &pd);
> > +				}
> > +				if (prb & FBT_RETURN) {
> > +					pd.prb = "return";
> > +					n += provide_probe(dtp, &pd);
> > +				}
> > +
> > +			}
> > +			sym = dt_symbol_by_name_next(sym);
> >   		}
> > -		/* Weed out synthetic symbol names (that are invalid). */
> > -		if (strchr(buf, '.') != NULL)
> > +		return n;
> > +	}
> > +
> > +	/*
> > +	 * No explicit function name.  We need to go through all possible
> > +	 * symbol names and see if they match.
> > +	 */
> > +	while ((sym = dt_htab_next(dtp->dt_kernsyms, &it)) != NULL) {
> > +		dt_module_t	*smp;
> > +		const char	*fun;
> > +
> > +		/* Ensure the symbol can be traced. */
> > +		if (!dt_symbol_traceable(sym))
> >   			continue;
> > -#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
> > -		/* Weed out __ftrace_invalid_address___* entries. */
> > -		if (strstarts(buf, "__ftrace_invalid_address__") ||
> > -		    strstarts(buf, "__probestub_") ||
> > -		    strstarts(buf, "__traceiter_"))
> > +		/* Match the function name. */
> > +		fun = dt_symbol_name(sym);
> > +		if (!dt_gmatch(fun, pdp->fun))
> >   			continue;
> > -#undef strstarts
> > -		/*
> > -		 * If we did not see a module name, perform a symbol lookup to
> > -		 * try to determine the module name.
> > -		 */
> > -		if (!p) {
> > -			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
> > -						  NULL, &sip) == 0)
> > -				mod = sip.object;
> > -		} else
> > -			mod = p;
> > +		/* Validate the module name. */
> > +		smp = dt_symbol_module(sym);
> > +		if (dmp) {
> > +			if (smp != dmp)
> > +				continue;
> > +		} else if (!dt_gmatch(smp->dm_name, pdp->mod))
> > +			continue;
> > -		/*
> > -		 * Due to the lack of module names in
> > -		 * TRACEFS/available_filter_functions, there are some duplicate
> > -		 * function names.  We need to make sure that we do not create
> > -		 * duplicate probes for these.
> > -		 */
> >   		pd.id = DTRACE_IDNONE;
> > -		pd.prv = prvname;
> > -		pd.mod = mod;
> > -		pd.fun = buf;
> > -		pd.prb = "entry";
> > -		if (dt_probe_lookup(dtp, &pd) != NULL)
> > -			continue;
> > +		pd.prv = pdp->prv;
> > +		pd.mod = smp->dm_name;
> > +		pd.fun = fun;
> > -		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
> > -			n++;
> > -		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
> > -			n++;
> > +		if (prb & FBT_ENTRY) {
> > +			pd.prb = "entry";
> > +			n += provide_probe(dtp, &pd);
> > +		}
> > +		if (prb & FBT_RETURN) {
> > +			pd.prb = "return";
> > +			n += provide_probe(dtp, &pd);
> > +		}
> >   	}
> > -	free(buf);
> > -	fclose(f);
> > -
> >   	return n;
> >   }
> > @@ -447,6 +524,7 @@ dt_provimpl_t	dt_fbt_fprobe = {
> >   	.prog_type	= BPF_PROG_TYPE_TRACING,
> >   	.stack_skip	= 4,
> >   	.populate	= &populate,
> > +	.provide	= &provide,
> >   	.load_prog	= &fprobe_prog_load,
> >   	.trampoline	= &fprobe_trampoline,
> >   	.attach		= &dt_tp_probe_attach_raw,
> > @@ -459,6 +537,7 @@ dt_provimpl_t	dt_fbt_kprobe = {
> >   	.name		= prvname,
> >   	.prog_type	= BPF_PROG_TYPE_KPROBE,
> >   	.populate	= &populate,
> > +	.provide	= &provide,
> >   	.load_prog	= &dt_bpf_prog_load,
> >   	.trampoline	= &kprobe_trampoline,
> >   	.attach		= &kprobe_attach,
