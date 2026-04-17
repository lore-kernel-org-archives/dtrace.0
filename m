Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4342D7DD4
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776445648; cv=fail; b=t6aqUYK1SBveKlzS/DEf9NxfeZxU7qWjUmtWvHHh7Gz3UKOqxbMk1i0PUuumr4T0GCsPwClrSqQ4x2fMwK5ji9z5PIwrpkqpNRNlxeJ0joMIqX8bkv1cuuRsPQicP64MKzpcp17WvF5fPi0Hyoh+t0mju7hpUMR/RmPLmgZdx2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776445648; c=relaxed/simple;
	bh=w+PM+cMmdUyK29UBlN5+mh057PEUmGxen1BHjsz4wsM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=sbyR/fMLJoBZUNZvoWr2aaXWCpTyGh6spO7SpzGLDcgkMmGN8kCnR3RLquUkU6T63LcjQRWYLc7xBr447rrhMY10xMyoOds0oxogOuviXMFi9puxaFhmr1LUS78EJzMfqcnQ21077HVl3oygcCyRckTBGEavBcnJ7l4B/6qCpow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DEQqYJA/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h2XlXsyY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DEQqYJA/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h2XlXsyY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HC4hDL1031208
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=wYQoL8Dl1Dk/V1WL7t
	wKkxawHQOJquFBjEevnFnQJRI=; b=DEQqYJA/NsHJ37a2YAHPtf7QW9AfmVck0V
	3UwYnakLTyZlOu8/Rirp0vUSIfJL81QPqcsT/l1eBAx+TqLd7Z9NGbvq+X6xiGH5
	HMwxwOir+z3pwvTFApH7LM/xquGdQG8S5BCC2EXcAzcP5AnLUUb2Z2u6YuhAbQ8L
	8cLKe9A4vQNZuh9GVKpOdZFaLhJXyzH23KdI+FrRzUTIBEDEaEqeklQR+B+hjISe
	b00C7Jr801jJhT4aIh135pk0iKFHSYpoF3/HdDo19AUE3197KZs/mrFHJ7ijCTB9
	uVUXZbRgtyQbsqj+Mr8XalKiA9dTrnBXeSNI0A/WLNKFLH2bxHsg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85qjcj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:07:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63HH4PRg018355
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:07:18 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010018.outbound.protection.outlook.com [40.93.198.18])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nrtkug-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:07:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKQ8eIPLgMB9mLjukKqLv1XYDWZG1ftYRHcNWb8xIiqghg3phr7YDFx/OfUX22MZTsynApKwIdNjkyD9jq1bijOo8JrqPujf2eyZvnG5ovq86RLqHIKMr0YUFCZp6QZqZSuvp/3pzv/eqern35veP9UP5/hqKZ4Pa94Bpt7uaTuHBnL9zAU8F0mwuK71ToBC+X72kfWZBwcdJVf4LwgM9H5vVvGjC3KCs9vrDVSt2SmUKVZButOsE5giZ8o6tvxzT5ho+VD5lkKA2dVZucW5V2iGHf4R0g9wHgLxtX0xJH3BSBfbKbkamKiO1BaPfhNZLZHr18LaHMIC4RyhrCRSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYQoL8Dl1Dk/V1WL7twKkxawHQOJquFBjEevnFnQJRI=;
 b=WfYhelPvntga1pmwiAbAhmtEeHJLzsJFVT8i2Cv7QjZNB4NwApSabAlQByhqqpZWmvsjASZ/JFCGoVYE6Rtxjb9Kme9S2W6c6o9DcrGnIbWQFamecnwxK8iv8hKj8zJakWjh/B6ipGzZAlUr0/j06UULKHsRTyl+24egukYCsLRyebxggM/c00ObaEExnXBZOv2cZBy3OhnIv8Mec0T0Y1DFqp/ewqhQa1xJLV+y8ivhLgefuZ13lHmXceKXAGH64Vyi1jj5UpTruQwu5+scmYWEWMDk9n1nwCP0DNSy+mmEtMAqKufPKiPNTKavT2gi2GtmW4hitXheASPaSc42cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYQoL8Dl1Dk/V1WL7twKkxawHQOJquFBjEevnFnQJRI=;
 b=h2XlXsyYc3bEs5Vl0jbrfQ7rOcQnHSk86pa8fgFqmtifXLr0VgjrLh9q3G/rRIb4m+hc1PHCbwf9laBFKPV9EWsTEEDm4ji26m1r+93t7B6iTlXolZZc3LhX40rp12D0LeZ/ELY99W2WFOs0BBcnzXnKeK/bPLdBXaisOhfawSU=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by BN0PR10MB5173.namprd10.prod.outlook.com
 (2603:10b6:408:127::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 17:07:15 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Fri, 17 Apr 2026
 17:07:15 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] btf: add dt_btf_func_is_traceable()
In-Reply-To: <IA0PR10MB7325F8591942AB9F13EC9EE5C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Tue, 14 Apr 2026 02:27:47 -0400")
References: <IA0PR10MB7325F8591942AB9F13EC9EE5C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
Emacs: ballast for RAM.
Date: Fri, 17 Apr 2026 18:07:12 +0100
Message-ID: <87eckdzfb3.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::16) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|BN0PR10MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c01bc9c-0a59-49d6-2908-08de9ca3c645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/+21NqDkgYtZ4JCo2gQyOTRzqH0jHNOOUKYNWvVAbVQCvM7hU0BnpwOCO+j29mcbB8Gv9xGPw/Y1G/HDhLqiuVvUHTd/AsB58mehB703sANqIyvyfImBkSYqVa7+0JipIm4JTieERXuFrVP2Ytd8UbD9utGl2bCamVa2KDV8L3DSPOhgh/p1cxogfNO4JieHZORyfQweJdcBDc1TWHbN0atOIDU9lNfBtDfHW/9sxAwk86d/Xm40X4f3gLy6plAoCCDUhO+YqOocW5zkkROleZpZ/jipX1+mmeOBhdFEjRC+FC8W3HMUO/xPLt+9NaTdPfOlN1U+azM5a8xTKZeR5d0LxoyqI9WfdIcWA1Egnd8AtHeiiXU8vq+C9EI0UqVc/HpSNHVXBZFZWF1se32vYgyibgI16iEj7GgUgyFXMqFLcD2wrfw8e0IqrgwFBO2HcNGOkavw/Da9VTi68kiB+08MRoSAn3yrT8xp7j14DOUplb44DX+of+IXAQtgAuQWWbAHpbQbJ1NaQ4bKvv2noz8fI12VEfdGhz9guUoOPPL781LzFzF2WWMMcXUPZZ6tfNWcRe/L49/QOjGLGLszglgo+A7O3cM3HCjaiPWQ2tlslzIU6KpNPNlRc3tbNBwtPiQJQjiLRlTObbgMMLkAkL+Dos69NI6ha1rTrLhS0OjFls0Z0L7dj0LkqSoyoOsaI4epHIEpYZ3Ibz3NjpQpkav7WDfwzB9lo4Vy3eT4QxM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?80bikoI2/gEUPucGgrXF/CfprweU1YPYv/FnL6KZNeCaiU2ksPxZ9iHWmevu?=
 =?us-ascii?Q?tF/v4er5Q107agWq6yFowwncDH7hGEp/aIFb1M0Hm+QzHg6gTfqbYeFOqV4c?=
 =?us-ascii?Q?7xruqtPA7klwWkPx3uVVL/OBqyizNY4FcstP0PVHV+b+pjMLRS3m3T46FDvS?=
 =?us-ascii?Q?pZchSZMXNc5UaG7h+3mXDZ9LQUTtVU9idiqby/GC1VsB5wxiCh/iRwcB4WFN?=
 =?us-ascii?Q?ypX11uWEd2bW5ZhuWMePbIG6w1uAgjJmVIyof6cBdAj1biD2S4UgbOoZ/CHM?=
 =?us-ascii?Q?6L3NjuhHqW7VKvNOyoCBoHtzXhwZS8hj2DtiUioWHd15gj5jmdrZv+KP4qKo?=
 =?us-ascii?Q?pfceQrO85Key2nCfj/tALC1FGu9Vg4V/TrMyZmaE9jnA5/7il52DqxGkykdN?=
 =?us-ascii?Q?FbA7sqC7RmD4X+de2Xy6HrowyoWfbUlyhX0WmM39rcMKhfS/pE9wHpmQfeLK?=
 =?us-ascii?Q?P3rWnbGtIyJsAMXNFs1JSpYoFAKWvlh9/qAZ2e2S9MCveS0jXh+x5am3Ywc8?=
 =?us-ascii?Q?imFFRAzzMh6m7CeWmRabk29qZhCZpgSElc7AU5eV6hZdSZE66egq52+rks/Q?=
 =?us-ascii?Q?kdwysrM6dPwE7GJDsTQ4vcJxlIFdquAIVSWdKSpcuijbMcM62enj1pZcrE2o?=
 =?us-ascii?Q?IL9z8gWLP4kQD1PLes7qOsleEoAmCDYTFOUGZEsaehgah8W4JeH1Vr8TYZ6s?=
 =?us-ascii?Q?71GUQr6OKE7nCYlq74mahJQWoUNKLScF6GIZuywjOHP6TXwQYT1LFxEqSe0S?=
 =?us-ascii?Q?xF4AIt3jn6dsUKViEFS/gafroHIUoTg5326VD6pzFTiWdiAtZ7Tc9mo0379U?=
 =?us-ascii?Q?twExu1xOEwl6cl1y+HIqJD+KdJiatHmMk5qlcm/1YJDSxAW9i/CjCUR//goj?=
 =?us-ascii?Q?HBI0La7MsDDQZ8pPH2bESxryfFc+QqTAoz/C2MkIKtP8MqQlKKq2DyXYgTe5?=
 =?us-ascii?Q?JJDbifYl6yIfgN6zgRWg3hkDOFpBr5L4oYWv/N8pLMqqp3H7FC2ZXeJcmniJ?=
 =?us-ascii?Q?n6UFGIgvspnUGI0XDYK2iCrvOdtMn0UwL+j8oWYWqa3PrL8FfcUJTjdMM6GX?=
 =?us-ascii?Q?vV12m1o2FJcux73E6tXsWJx1aWS0tY/4NMvwKmSPVcK+c5w+yd5HPgryTE+0?=
 =?us-ascii?Q?KpqWGb7u1pF+LGOoqEyLaNA0qoPj/uGP40UrwGyDVp550Fi5BYY/oL2lxsua?=
 =?us-ascii?Q?ANVqlzt5dYL9x6fB97t/RzdoA/fgMjf0kbHbyJ6RVOKVrIZXlL7qmnI8lbxe?=
 =?us-ascii?Q?N7wgTKZwDDsiwBuHBx1NctocrnQVX6AjOTGZlIXzUBRYmEbfELARP54Oq0Dq?=
 =?us-ascii?Q?JvZHUOtW0KRl1WDFGV5jGBDaPRDDPjakPERJVEesjhndlr+lFQLHsqgs3oOF?=
 =?us-ascii?Q?xlqp4Tlgg868xmesCckTi0xgodOuCOI0t8giECkPtQko3H2zmzNYbNO6iyKj?=
 =?us-ascii?Q?9NvuaV3ixNDKPbcxGB3fTDy3IsbV+EeuP84QuODcDbwqBVQuvef29fBZDhz/?=
 =?us-ascii?Q?2B0MVoi6urKleaoVX+NZiNbwzccNZx0rGk4nx0wtgZmym55eNdXmFY7f/nER?=
 =?us-ascii?Q?BSg70w5QBKxNwAzvZy7r9monH+/Eygnwd4yVpOXP0leStEpmLUMXCHO5B8Vq?=
 =?us-ascii?Q?Egz0MOfKqV1nAAgbLxN42LbfPhMB7fIxL6BaA0cs7yIUUbn4JEO+SJrC1RUW?=
 =?us-ascii?Q?SHPN9FhczgSUtzOz6pBr+HahAO5MMCDpV3ubfDrtQMW7xx+0xTMxo8vRvcK0?=
 =?us-ascii?Q?0f5c2Hvu6Q=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	o5y52oGFqy+NrP2DOsvKYLymrwhHx3hcr/UAZmHPJgwq9tfHJAMYRp7OJiAJfrqYZtGh8hebS9pS3m3w65C+WyeHXNnNobiMMKA3Kxz8Oy0jACh2JpTbi0nop0alDGitqrV3DxA3klaj22cGU1VQPj8gOvKSsi7t3LdVkl8j2vW4WXGWvYhf0P6lo/4/rIn/Hevr+zuNXqjCX/wvRPOWsL30uRYH+oTocAvfPHCorAvmQAK2FzUHV0SwNMq52MVTCE/7aavjKrPlfcgKAq/s3jkwOZ+7XEJbVz5IqEbcMfjZ3Zozh1nFDRzNSjI1IyPwquXJqCKuZRl9/OlX3Ez1HQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	StHDnqhpGGQKb/8OyLF8li4W+J/hnd1o7ZeR22J3rx6XzFf338q29XfnO9CADRgMDAXsmvXAhi9p9LWyvGeWg6k7hyRS31iYpqeZseUbxjOtcliyNrc9ooGL4wnBlh4OHYxUE97wu5CQUwHcLFoBn9Ag3G//Jnlq3v4XXMy3/KV2ym9ATFzUdTXfcc9dN/f9S8bet9cZBnJV4xqplnLWudX+xoIoN/lene0uuTEn/oBnwpJFnfJTxhY3Q2mr6tqGuyOTfTBr5Cnha96B8CVN1nr03ZzyIQ6hC3CyX1nO06rRtRQDHuQwUjn3p9sEzX2LErvwmnbNJd+RZHoAEEH4itYr6w48Pr5BxZYfWVye4ijuW06VpqyHwJaTf+F+Iyu01BEPXZElBfXk5PJw/59AzRDOX+Q4KQ1u+V5Fgm4ATONvwwj20wxo4W0RmQMfCFmqzxsikOMLb3mKZohsbWrJiX6azoUZJ3IQpSmJYv8gFlpuYmcS3VaS4TAZF1yxHei4+KJI8GjDQy5okMoqDcfMMFms6e2/frROn1+XABsimdRLTuvyo8KFc2uJd4rHbao5z9OCk4zTASeEsjnzYAhoOOgN7I/WKKfM4Y7vO4Jgd98=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c01bc9c-0a59-49d6-2908-08de9ca3c645
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:07:15.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ps588Cn9s2bbiP9XUwvM4mEVrdqUgDCGG2vV72gaPde29xVRn97HjliDNkIHdi/3wf9Ki1IdXCvoxi4DGKRERg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604170172
X-Authority-Analysis: v=2.4 cv=d77FDxjE c=1 sm=1 tr=0 ts=69e268c7 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=Pd17nu5kpJZlavasOVAA:9
 a=O8hF6Hzn-FEA:10 cc=ntf awl=host:12291
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE3MiBTYWx0ZWRfX0pSUN8zZgRgE
 ivhxOp1DHaZAUz/qR9hxfq4Fx8imh0DcBxUycw2lrBM/iVJPa0bC0Fw36SSpZSMEJOkzpaL/ewJ
 kOf9DZbadris/PlSx006Lx8tygMcBgsD3O7IS7OMsMGvLOUymjMi7UwEhEBx7Q+5xs5EF03E1BV
 24TJmEe0x3DT/ZAxR5p+sn/3zWMElL92sEFTkjcqSTYcxhj8o2tiUVj4tHGML8RKqBDG7ucNiW1
 cfe45eqiXw9BkHFievKKnnLOs2Lyl6wjDXayH0uwJsyYaGtkWZyTU327jcUH7aW5FVwlKbNx+tw
 07BJWKDz1TLe2SzsawMCkFsIW0khHil9WgxKQ/QHGvi5UZAcnPMfG0JzTcEP9n0j9K0we3qRqzj
 pvqxW+q5Q5Jd9fRHBJf032+rQBQp8aPGTJ3ZzZTsLsznONu3EoHCboB5Qt7a9LZmddMY3vCGsj/
 90mkVWSbtKI18UUuaxjNIXOPYU0fmclBPd7S8SCQ=
X-Proofpoint-ORIG-GUID: idv1Z2isdJAS8cxemEKTMHsIHWiFxsz-
X-Proofpoint-GUID: idv1Z2isdJAS8cxemEKTMHsIHWiFxsz-

On 14 Apr 2026, Kris Van Hees spake thusly:

> Add a function to determine whether a function (given by BTF id) can be
> traced using BPF fentry/fexit probes.  It implements checks inspired by
> btf_distill_func_proto() in kernel/bpf/btf.c.

... looks reasonable.

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(though you might possibly want to implement the suggestion below, it's
very much optional.)

> ---
>  libdtrace/dt_btf.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_btf.h |  2 ++
>  2 files changed, 67 insertions(+)
>
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index 56eb96a4e..fbf377b4e 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -1020,3 +1020,68 @@ dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
>  
>  	return 0;
>  }
> +
> +/*
> + * Return 1 if the function referenced by the BTF id can be traced using the
> + * fprobe/fexit facility.  Specifically, that the function is not variadic and
> + * that none of its arguments exceeds the acceptable value size (16 bytes).
> + * (See btf_distill_func_proto() in kernel/bpf/btf.c for reference.)
> + */
> +#define MAX_BPF_FUNC_REG_REGS	5

A shame we need to hardwire this. More of a shame that we need to
hardwire it deep in a .c file where it'll almost certainly be overlooked
when the time comes to change it. Stick it in a suitable header, maybe?

> +int
> +dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
> +{
> +	btf_type_t	*type = dt_btf_real_type_by_id(dtp, btf, id);
> +	int		argc;
> +
> +	/* If no prototype is found, BPF fprobes do not work. */
> +	if (!type || BTF_INFO_KIND(type->info) != BTF_KIND_FUNC_PROTO)
> +		return 0;
> +
> +	/* If the return type is a struct or union, BPF fprobes do not work. */
> +	if (type->type != 0) {
> +		btf_type_t	*rtype = dt_btf_real_type_by_id(dtp, btf, type->type);
> +
> +		if (rtype == NULL)
> +			return 0;
> +
> +		switch (BTF_INFO_KIND(rtype->info)) {
> +		case BTF_KIND_STRUCT:
> +		case BTF_KIND_UNION:
> +			return 0;
> +		default:
> +			/* fall-through */
> +		}
> +	}
> +
> +	/*
> +	 * BPF fprobes do not support functions that are variadic or that have
> +	 * any arguments passed by value that are a struct or union of size
> +	 * greater than 16.
> +	 */
> +	argc = BTF_INFO_VLEN(type->info);
> +	if (argc > 0) {
> +		btf_param_t	*args = (btf_param_t *)(type + 1);
> +		int		i;
> +
> +		if (args[argc - 1].type == 0)		/* variadic */
> +			return 0;
> +
> +		for (i = 0; i < argc; i++) {
> +			type = dt_btf_real_type_by_id(dtp, btf, args[i].type);
> +			if (type == NULL)
> +				return 0;
> +
> +			switch (BTF_INFO_KIND(type->info)) {
> +			case BTF_KIND_STRUCT:
> +			case BTF_KIND_UNION:
> +				if (type->size > 16)	/* value size > 16 */
> +					return 0;
> +			default:
> +				/* fall-through */
> +			}
> +		}
> +	}
> +
> +	return 1;
> +}
> diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
> index d956ad940..2c921a033 100644
> --- a/libdtrace/dt_btf.h
> +++ b/libdtrace/dt_btf.h
> @@ -28,6 +28,8 @@ extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
>  			    uint32_t id);
>  extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
>  			       uint32_t id);
> +extern int dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf,
> +				    uint32_t id);
>  extern int dt_btf_get_module_ids(dtrace_hdl_t *);
>  extern int dt_btf_module_fd(const dt_module_t *);

-- 
NULL && (void)
