Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1212E571
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 03:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757992839; cv=fail; b=Ldgyvco+I1yyX5c+vP9nTQQ59r8GqW9AG7FFrpazKuG25zmqJDzGdyNW9bPBA2f10EN7GnXADPUzJuHBmjgGx4zjEMCjn4C2FFSKglQbyzAeG47KDgGmPdg5JsupMewf+TjKlJz2gjHpyT4kmOk8aJZBz2VtOMbsAOcTHDQSI4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757992839; c=relaxed/simple;
	bh=cNnMC9fDBheiKybVanpXA3KilbAbNP9T0dh1uiZJGjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XS1V3/jW738fS+qR33ThbIJry3eNpzBQiCRcTPtLFMn+s5UJCMIWA+EVviTNwLb0BsuXob8qn6kMnHSHDKNtYWT9UPurWF9E2RDwre2WGst9u7Ilt9HJtS3M3ItSU7AHgjSI4PhF013ORHrGcDlZsP/I4XRWARUThNXOWqlwCFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jA1dd5t9; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Pt5eBjW2 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jA1dd5t9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Pt5eBjW2"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G1gRoe029840
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 03:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=q4YvV9waUzw01tnFx+bM0u2nI9vudBS9z3zzntIaCs0=; b=
	jA1dd5t9M65lmMwlwk/cCI9ZrEeKb1ZZiy4KBxmqKSF5nI871O8IHZkY4Vj/6ctr
	JKaLdkPxzee0VgbSg8VI6ZT7Vx4PCM3hs2M3b84iMfMpCPRe7yi23KW2Gy6rKZ6a
	AP1oCQNj9d2Q4jMcRUu1HJWRbdCmdDUStFoxvNigsl0r/bEn6GtTopTqMm5qHCHZ
	YYBuDf+vIdLA0tsgf+xOqMN7jBf1G5psdDXQblpOU25u5AQAxZgHDBp+IWevaD0p
	4mMedlhzPGxBL5P4jgyiwDsg4eJWBLet40O59wMJfgpnLgUsu7rSR2amAgyXUG3/
	ttNwC2MfL2BegiDllDBDDQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49507w3pef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 03:20:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58G0x1uP028746
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 03:20:34 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2bsx0u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 03:20:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7YyLz/pQXtFUpUgYXRBVotQvyI2vanaO08rSjAkq5BtDf3Yd600j5mRfMqKPTt+5S2ULZTELP3oAfYRc7rw5Bwq7Fq4rEgHzfmuazZC3vVfvz5oHI0YBcHboA7CDiTsX+jplVWHcfAZPYcKOvqvNnvydRbiEAuKoojdNZI1kUB6I2tY8FCQhxMRjmBCRn+TtjcmDH40m/s2UVW6sV19RJ5rvwNw8jvSWG438oR+wlijszL3Gyob4RW4FcmtjCnGVO20Z9XOzkQWjIRR6XYbxFt05c/o/Xs74kJKYI/esdsCb2GG9khGaTjYxELNHPtvDBjV+gye99h4h5V+Ltbtuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JFmkchzzlXQGuE/UHw60qBeTIks27glj5Xmc22SOow=;
 b=ohdlAOI10EO5kEdjVmln/A6eZI5hoBRDy9QqSJ4nUk63RLRrgThEmeAG1VFre1tPVNpoLYc7K8rdD16Z+lShbrudxSHJVFhO2nRdJyGXDmACLRDNeA0bhgXJPDyVsasyBBslWC4rc7V1ocOibA0Loyr3yZr3t0H7T778fHfwM6SK42CKDPuPGuGWP8YWQ999LxXPJcef6tfgrrk2wREaaCansp/bglomXlQ3eEbOFD/sJuOU6vFFTZ0F0hyHvYlqSEaAGn4iPIZa+xXQA39idYBFMMnanG+R4rp9499Gu9xpbcvju1TBADXjvl8JQWJ9kVConJXIeJ6VXt3swJYNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JFmkchzzlXQGuE/UHw60qBeTIks27glj5Xmc22SOow=;
 b=Pt5eBjW2BK9nurWh4gqojkAFnPFmy+V85oPen+4RlN0UEPalAVq7OPBRdJMDBkrpzY4onQQfqQAh7bujN587ohy3iWRcYPXqzfGww8rEcXcdBtFYJPMT+b9B/cJJnTNIqEnAuQqm/oPJvRdTVNsWGNNzB3bOTJc6UjicsCX/Ii0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB7127.namprd10.prod.outlook.com (2603:10b6:8:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 03:20:31 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 03:20:31 +0000
Date: Mon, 15 Sep 2025 23:20:28 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v3] trace: print alloca pointers as actual
 pointer values
Message-ID: <aMjXfFOSefOzjlQc@oracle.com>
References: <SJ0PR10MB5672162D698C139186ACCDACC215A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <487cd783-80c1-e037-0c28-c2ff94364a9d@oracle.com>
 <aMjA7o55OLI9cATN@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMjA7o55OLI9cATN@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: 770d350e-dbe0-4279-3ac9-08ddf4cffe09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?R0qYF97P+ny61uE2/YJkwCWAiTk6jFgfUOhRWJ4O6QM7dIgZI/VwBiggm0?=
 =?iso-8859-1?Q?deyQ/dbF88tuPoXatOdppvwP3M/oBb03h+fBD+K47mHcVbrXPM2Cmso6eR?=
 =?iso-8859-1?Q?ZgmYffaC2jI1Oiu8JStNdsg7UcBM910I4T4zzCNpZkzJjwuje9kDlWNcGS?=
 =?iso-8859-1?Q?3xZlb1TEaV5/MRjlc+Dlj9eBMw63c3Bs5RqOwQCqc1ShVJOa1IRqrAHudI?=
 =?iso-8859-1?Q?texVPnT7yntTE+r3/U5Re5M6XlONfE6T/rYPTXst7AeIebHkCXtyRq+HNm?=
 =?iso-8859-1?Q?IO8m6eD5oXZEOlALt+txLUw9nv0pUJ3TbSqF9BrLvIlHqC6I8j92HWdv6U?=
 =?iso-8859-1?Q?4U5+w2a8iQVSrFLCPjJ0s7QmbCFN22oyhShEdsRHFuqSKLHqJxcRFdv9wx?=
 =?iso-8859-1?Q?P0iSrgMIZv1ciR2zkFgVZXP54NOgz8zxA+wtsHfaubFkpnZZm2JoDi1gQA?=
 =?iso-8859-1?Q?P2IFdkgFFBsP0AW5GlMG8gJBf/Fmc21LDcOn7S4TGFJ029f1lP5r6zvef4?=
 =?iso-8859-1?Q?BXz9goQ5NOSHanB4JfHdygtjfnEgcEwsQqjPEkuZpwmX/MVRDMkL48JAXT?=
 =?iso-8859-1?Q?G1dJo0cEU5iurO/FwLWKGfFuT80Fm4Yctbrgr6DRQstcQdN7ZpOKCpnviv?=
 =?iso-8859-1?Q?dJ9Eg3XMJwjPK3n6pHjcvlHewOCyMsUTbYI5VL5pRyc54mpmnOBSEkmXE8?=
 =?iso-8859-1?Q?cebcH/Jr4+rKZs+xSt3HayjHXxFLlRvtreCUyBsdkH25IurGYbzk1tKxOO?=
 =?iso-8859-1?Q?Z1NSnwjxfxY8T+tXt+sIA/TCxtxQOj11R/oxGMrYzAx1cn07PC7fM5QJ/a?=
 =?iso-8859-1?Q?nf5IrAGgPrPyGVJ5/Rw+1UPfnn2ChVlzRSCpnHB5AcpdgmDNIC8bWD3eHM?=
 =?iso-8859-1?Q?XOk7FbKGGpFr1Fed1EmSGEWvQ/RXSzaPno15sgS5c8PvNZI4+kHUIvzUNo?=
 =?iso-8859-1?Q?oYPxe6qUajDlQBjS4/UgXtXRaeU81pcc1baUEHmVurvQ9i9Ti8AIwdiAX/?=
 =?iso-8859-1?Q?2MTcmlEDK1ULHAhOUEDLe1xWfMliDlWGu+xWPmr2neo0vE+Wd5zlpfG+re?=
 =?iso-8859-1?Q?IwvGyl2NqEi7AifdjiMZXVX/YtCh6ihe0GBvCFQS10pKqs/xOp1kBgBgkX?=
 =?iso-8859-1?Q?aoVlOd0oNf2C3wJb+C7YmDranxG7IvkToJf95hnpOVMmcFuBEcM8bLiV4K?=
 =?iso-8859-1?Q?xA9W0DayYWnrI4uUxJMZja9LZ6xlCs/ixyQwswtog3z75B1rot2rGaElCW?=
 =?iso-8859-1?Q?vzMpmAaVCG7tB2p/O9MuSGmqBBPOtjcZ/wNS22iKa4p03Wc/OZZTVwGVqw?=
 =?iso-8859-1?Q?aGyBWQVZ5FQxUUMaQrtqUgYAGSee8Jwodw90nvclEb0blj9KhyLBu0c/yr?=
 =?iso-8859-1?Q?vMljAgIojHjLKEKoXx+KCxQOm4YQSM31YAh6WfuZF8F8mLXT5/nEy5onoj?=
 =?iso-8859-1?Q?9/Fi6uCWBPjKoJcc4Zq+RC0WQSXBXD0r1ys6e81mLGYJJCQTdDXGzzfgL6?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?NeQGKRBnVaESoqevjPZxqSmMiSQ5GnmDYZWfk1ynGTTMcOpLtDjUqKJst2?=
 =?iso-8859-1?Q?kFfo3edwJH1O9Voy7H8QqovO/32gssqcqms7dqbegN84tHPS6F8VDsyhcU?=
 =?iso-8859-1?Q?d5yyRI8Iu0xAi624YwiFIrtyqW0I9Tn5cxxXow9hj+V98R0lw45mxQioec?=
 =?iso-8859-1?Q?FfkM4ihSAyJm50gZaCcvruyV1rlij4hbWDHp57VaU1PLGiIB9udw2OVft+?=
 =?iso-8859-1?Q?tEPMgCiifxMg7PUjOZCi6b7vtYZz1EDcSGmlivNLzuX7jSz6hcbF5lbSGb?=
 =?iso-8859-1?Q?9iPityTXFuWvKohWRBEgaAsf3Vwb85AMyddOJkG10jvaKmb9Dp9Crmfegp?=
 =?iso-8859-1?Q?MkiuwK8btmbvc9dtK1hpFdTOFvVSUxgwiEiNK8GdAVlZjudydodhomdgsy?=
 =?iso-8859-1?Q?l4jS4sXHpsgJ6yUQh57GDucfCyX75UzxVmeKOz0YdzUkaSJGn4Q4bHDSWE?=
 =?iso-8859-1?Q?8PeICKBT5pgVF8P3w1+0NYkmKvGKG9GSRDMUGxLf4V0IrvUVi4ZjWl88fL?=
 =?iso-8859-1?Q?BTKz3mA5hIhLyh6ZBKIL4I7lvg4YKNKPg028vKdLX3g/d+Fl9C/EkYRKbf?=
 =?iso-8859-1?Q?ZJtruD2FfUCXar2j8+ZqJau2U9X2r25ZKAPfOOi80XHcf7opeTM3YupKRC?=
 =?iso-8859-1?Q?QYNYoGLGI/LHbkvNfA4KlzOSu4CKWapzNj3U0sIld162sbLkSaYFK7jS2Q?=
 =?iso-8859-1?Q?KSeCgLxQcDv9FbDdkdWYCh77+xSRX/7jMjjf5T/LGR6PdoswuKHmenjMru?=
 =?iso-8859-1?Q?ivRL2FyliKYX405IeBbk1bG0ECxuApBLfcMImoQhLakpAAcW7gWggMS+cW?=
 =?iso-8859-1?Q?gk7fqldGwXpM0AEmfiBfpo3UokBg/t3kOZi7Rxuwn2OFIdDEpoGoeDXivV?=
 =?iso-8859-1?Q?rTH23E/QA7KCIbWV9KO1wNWe7j7U57A0KOZlhkHqWcCK5RWes8WTek4vlL?=
 =?iso-8859-1?Q?62PVmyYo0TZlcD3jCYF9YOcJP309j5OMIKT2PBulq9/PQ+guxnm0UAJB/j?=
 =?iso-8859-1?Q?Gp5+iNkgPVUO31r8xfxXsMe16/SSbHtfIgJMcFHHbU2fO5G5cUOviU2Vqq?=
 =?iso-8859-1?Q?k8J8EPMIiMDH3h8B8sUDHBmIVpzrMpYfLSb5oEe4UhdRE2cTd3mekwtBVe?=
 =?iso-8859-1?Q?n0dSN0/GFdQfnUSoOSX5sIeR8+h3E7uc0I98EUl3jFK8jYesGaqnwkW0cb?=
 =?iso-8859-1?Q?oWP0Y53OLtcw5YQjmWqb6Y4fIg5c/FOSCuo3qH8yC2jxCzFy7pIL3xI9UH?=
 =?iso-8859-1?Q?wAKUNtLq8SRjZstpxNR5AO/1SOzSHl/uWWMDOu5Xw54k3wgFu9YXCaP9Qo?=
 =?iso-8859-1?Q?3+X1O2fLaerkh8GJLYuapl+LguBVo/B+O/KJy3mnXOim6xGjEi7Bszz7UF?=
 =?iso-8859-1?Q?+uU9omzigmu/dt2ZLERiBEDK7uSt02xEWnIMpUyL9uumhEzPdaH84/3Jye?=
 =?iso-8859-1?Q?tETVJrlkhS/tCPhv1FEbCX/GLuXbmeJB/4v1XdNZ07Jtudt40nLAaybzdE?=
 =?iso-8859-1?Q?1TqXliKRBr61dQJ4DtT1NAnHp7csxM1Qcj/eMoLd6mdSxZLZu3RvqhhE4K?=
 =?iso-8859-1?Q?cMgKMmf9yjK3A+IwJytyHphqPYEJ/lJemt8eDSSLL1JKHw6lbI5aby5F7V?=
 =?iso-8859-1?Q?cJPWMLNCIxxVT+XAJP+p/QRCto+5hKLgfKuSmfiJWYTju1LF7AGDXZPg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wkXpb+TT3GCxGt1giasDLMYXp89nyVQ1Zzh65dnBHljRLNHPr32PY4IWGp1KewtnzvMPu9uoSqEGAM8IBnEsjxMDYDo33rcxLs6XWrbSTzHNxT8j9BkNs6vRRnh3kEw5OzeraOCQSqg98rkLN5B8qFb1yiugC0+BdQiqF3Cjkcxl3N8vs7ohgNJR+lic+s5lwq0cwz0qg1GZuPE75BNj/pMP45NOCvMKZGggv2efv5/M6p15/f7Xi2zmv/nqxt8mYA1n5VR/8OZRoou8z3GQpjizqo25MCz9ouxM/Rtu7nX73hs0AkkVh5Dc7ABGaSxLZnP25v48WkaezajBX9BXyFWslAfa1GnamybGlnMxe3u4vBPH+193UmEzPjFi3jGzldapMRh0PRx4GdlDyjcek2Os4jxnJpLCmKFRtaAPgxw8Ft9cWeC68nqzzJ2TvvunT0VjPz81S6nOnnR3ZUkExq9K8LIGkyo6MZQV+w43nTGWn2dxcV+liIbK98rIRmqYryJi7CaxuZYMDhV5X4v6YZJQ7kEVwgQ61p2bWLPSF0nLztb4WR6VH5rdusR6/UkGkfSFE6C28BWTRNUyAKr/HFMEXevrKY8yZm1c9/iz/aA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770d350e-dbe0-4279-3ac9-08ddf4cffe09
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 03:20:31.5687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jcY5h38gCbg1zNtEpYSa9eIwc63d/pV/+nyrgMoShbAQFCw2QCfXg26rNIPdpZQmLRwECS3Is5iWttNJkC34UQs9QZnL95Bu95oShhtst0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7127
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509160031
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX0T1y7fZn41S4
 mU448GG2rH0xxncbAkwnnRj1YpR6wTkl8uz+PZXPhL5WEgcfPal60zQfZUG4ayI+K06cgg5kgdF
 Y2wYjVfRok3K3lwuPnSJ40eG2mp/UpHB9r/0bj5xNqlumpdT+eo/e0hT1EdjmVUQ2z3EAFi1dOG
 klkvGWQmwf1JS/qag0WA74kr+K19GEz5GXNz/lZkSRAlQURQeC6FsMJ1Q5TT5oVGz4WpnmVzL/B
 oTz9ocWMHMb3Gao42HoCQIXVPcAwAtek6/WQ/uRQUQYaWnYXaVl8hqKqXMLsqEv4VIOItdCEH9F
 1fdGnlUvLIkvkSlRHFMPNfYzuGYX/aEU18+wzi7lu53gONRT96R/eKRfocanTsosV9ur0fqVawJ
 fpbKrZIV
X-Proofpoint-ORIG-GUID: Bki-XLP86pwryc5Oh5_eiopganqqnGCn
X-Authority-Analysis: v=2.4 cv=RtPFLDmK c=1 sm=1 tr=0 ts=68c8d783 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=J2S_kEiBHrzRrNnwerEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: Bki-XLP86pwryc5Oh5_eiopganqqnGCn

On Mon, Sep 15, 2025 at 09:44:14PM -0400, Kris Van Hees wrote:
> On Mon, Sep 15, 2025 at 04:41:43PM -0400, Eugene Loh wrote:
> > Largely similar comments to previous versions of this patch:
> > 
> > On 9/15/25 13:36, Kris Van Hees via DTrace-devel wrote:
> > > Because alloca pointers are stored internally as ofssets into the
> > 
> > The same as for v1 and v2:  s/ofssets/offsets/.
> 
> Ok, yes, sorry - been spending time on functionality over typos.
> 
> > > scratchmem area, they were printed as small integers.  They are
> > > now printed as actual pointer values into kernel space.
> > 
> > And, again, the patch performs poorly against testing.
> > 
> > The new test gives me:
> >     -OK 1 OK 333 OK 55555
> >     +OK 1059965305 OK 1059965637 OK 1060020859
> > which is to say that the dereferenced values are wrong.  (They are all the
> > correct values plus some offset.)
> > 
> > And with this patch, these pre-existing tests fail:
> >     test/unittest/builtinvar/tst.tid_pid.sh: FAIL: erroneous exitcode (1).
> >     test/unittest/funcs/alloca/tst.alloca-bcopy-top.d: FAIL: expected
> > results differ.
> >     test/unittest/funcs/bcopy/tst.bcopy_arg_order.d: FAIL: expected results
> > differ.
> >     test/unittest/funcs/copyinto/tst.copyinto_arg_order.d: FAIL: expected
> > results differ.
> 
> Hm, this is getting frustrating.  Tracking down why I was not seeing those
> failures on my end.

Where are you seeing these failures?  Do you have the pointer subtraction patch
applied before this one?

> > btw...
> > 
> > > diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
> > > new file mode 100755
> > > @@ -0,0 +1,11 @@
> > > +#!/usr/bin/gawk -f
> > > +
> > > +{
> > > +	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
> > > +	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
> > > +	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
> > > +}
> > > +
> > > +{
> > > +	print;
> > > +}
> > 
> > Why are these split over two awk clauses?  Can't they co-exist in the same
> > clause?
> 
> Yes they can.  But they don't have to.
