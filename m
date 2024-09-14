Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885CF1CFEAF
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726331166; cv=fail; b=R4D+CmXi54m2WWvMsdCDyk57ha00G4uwnRu5P+aEnQWRrpfpiySUv0aQwzUkWooE4lYzWMZnsMVkt9upM0NTeRW8Vt1pD0f7CrewKuKBOR2NEp1cUvQpvCKjbFFjg+FstrDVdqYcX9QjrfoCYjoPjF74hGsXAOL3IOXJtQJgjYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726331166; c=relaxed/simple;
	bh=PYoIomybGUAWlrwKRlbsEySJhttuY3iOGvopCMDjBOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=prvhxHRte7ukwyl4adP4UDzjk0xf28RJwkKbWb7OVbGrvCk6KLmX9tCfkKg5WbSN1gksNTBeB100q+hFxypqd1zFsgsPEk6b7Od0pAfUFGHSLGgI1EsQMD/l+8v/bNRmi8q8dhELDfYnkOJJKi0a0xXcSwP94pKiQFFO3gJcLFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h+JSjTTP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cWIu1LfD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h+JSjTTP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cWIu1LfD"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EABmYA031044
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=mBJeeN19jPxpiua
	Kxaim1rTsQnQKUKImahllmcLTuSI=; b=h+JSjTTPlzjXmcO+pmzQv14K4/zNEmI
	w9gUZf1FrN1kEORUlFYVK5yO4ju0WVx4PhMt193GrFXMqhRz5wVmCGH9BZ9JKAJU
	jFjCLuUkChOKeJGqkwSUc60O32mQnNiW0djmg5k8V1eBUIT6mdsDNvld+19/1q3r
	HkRsfZmJU8H2CD953lhU5F55v4lMJ5KBx792Y7P9FvKkqo5d0eg68DOcENJjmi3Z
	YFd1vevxBzHzWs/30QtrSYwM64RNfpwsuoNd44vGSkKkVvb8LLkbf4pN8Bv23olj
	xQb2VxF3N5TgEjP1qv3bc7QFP/EeWlbNTtpmdPCvxw8/ZdjwRQs9yyA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3sfgkjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:26:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEou7H012854
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:26:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6mew6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 16:26:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4cgVfuyQBDxAwmmSjao1aoCuFWefCoMiYQpJEcUddoYFpYFwA+9rIB0IE30FeBSDTq35aLxu/52C4rFg/WqN+3SNE0DAd6zVirLir3uOzbXCMPZKCikSw6ffLGEM5EX3F6oBvkMDB8noXVit4vg+isH6KdR3I1b0rXmsZJbUrZve01LVnVNEQZanfxp3xl8AjakjfJzkGuMlByWIF1QulTkkpeXKrW9DEAZI8gyuKY3C0QuU/nev++/vcywamr1Expg0TbCmEK3sQ0PQTl9/RNd8wxTNF0kudnBlg6rGkA+xAX0xiZ4/o3UOfqKEpTWId8eEuY7/cIEe/46R1jAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBJeeN19jPxpiuaKxaim1rTsQnQKUKImahllmcLTuSI=;
 b=EDlhufaVfhui/yeVoxHxEH7oiiC2NrQ4kc/rfY3SDV8iHrq8IPloAkmlvbbsWe4yFdemqrQLrcyFWOumhSy4LdrsQAwk17U0f5RLs3xLixqAeMo0M+kqmb4LtHqxlbX75zlQx7TkDf0TYuP0VO7QkiZcJhMqtP1Ouf/MGprVnK83GeObQL6m6d4g54bvuDgfExb16Gq00Bqh/Z8uLIYqHoDTEsF3A3HSfzHTDx+FzqM381Xx857yy5iS1WDmjhdLp1f5JbqJrQ9vLPBbS0z7LviHKLhxklEbJDtphE6CHq4sZq613+kfN4agDUVMU6tuGebihhTCuJ3ddP2KUa4Cmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBJeeN19jPxpiuaKxaim1rTsQnQKUKImahllmcLTuSI=;
 b=cWIu1LfDMT1LYKtP1O818oH70/Jy5ow/KhF+2EkopEv5DTh9A/dRKLhCfsY4r7RhxhYXngu9oPeN10PqYD3maYUNTY5FqOk1t/MOlN/t7dWKN85MGORxyKKIzVV3SgQjQwdRtZy5n//4CgTN7kC3avC5MpHZtWaSEMqkxVKL5cQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4798.namprd10.prod.outlook.com (2603:10b6:a03:2df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 16:26:00 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.003; Sat, 14 Sep 2024
 16:26:00 +0000
Date: Sat, 14 Sep 2024 12:25:57 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 10/22] Simplify dtrace_stmt_create() attr init
Message-ID: <ZuW5FYlled3rjac3@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-10-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-10-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: d69b1f85-74be-4235-2a46-08dcd4d9eb6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hq8Pc8MYL7gBJk1cVv/cdnbZjxgn0BOfP0YY1QU9lFAw64sFOdIN4Jn5Sfjp?=
 =?us-ascii?Q?b5oHvwRt2xaxxCZ0oCRziXcBKt+MelwWlEcB2MKUw1AK2ZL9oOez57swdtQc?=
 =?us-ascii?Q?iOi82CyWuczBh9zAlvYDTeppHqKJd6luQMNr3IuWvn0bKvoTDoGoIcGcXIOI?=
 =?us-ascii?Q?FHeqFXFxgVL9rkOLneDoomX8PNCpY1Xv64mTh2do5s1GcnjhGBDBme6wTrdc?=
 =?us-ascii?Q?IuIwWMhWyeBK1bAGcH1faRtA8smw63DpQjdb6x+a9B+SHkzsx91NoJnTfDW/?=
 =?us-ascii?Q?7vV1ShfgfoPq5kGFNFf/rhGsko0502QXc1aRE4VoHso0yfrI9utYjlnqcWOc?=
 =?us-ascii?Q?/RdNT8x2kDCi5nVA3+81FRLUZGtwPnhv2ENIC1IYBMHk2K7BcuoV9dsbsjtf?=
 =?us-ascii?Q?8Z0oxvcxgWNW3ApILJ6IHxJ4v1AZqtFhbLy4eJozUXUw+1RuNsYSU7KMl6cZ?=
 =?us-ascii?Q?g3XE7MxkYM1mXgDZv9Zs7/FEXhZkuMEDb5idR1o5JdqIda1TlJ6LIwkCk8EC?=
 =?us-ascii?Q?xWK23qBUB9FXn0aG/zrOvL/M0eHNMv9MoxxuleGbrBQh1eqgDF4yFcuQD7Gq?=
 =?us-ascii?Q?ntytujngh+J1NLd78QSgR2SNrP8i3tXwEC6ZhvnWWZHfDFJ6vu8xgz1NlOJ+?=
 =?us-ascii?Q?8bnmJFaRWbxGKVB08+mtw817VAi9/VEhC78pQyur2DVUujCR5K4raL/DokMM?=
 =?us-ascii?Q?XjyexCPihoRSxgxUa0Z1WDDFs90GInam5WPSn1ktHMDtdnPQare4Kj5zsGfy?=
 =?us-ascii?Q?BFBW/afIznlU4zyMX5TP8g0CawooWck5f/hfWsdT56ZBtEJxK1Lr5IWyw56/?=
 =?us-ascii?Q?OxhYWhph5V0uiNQeJcKZA4IQ9FMyCqbHc8IZM+VvZzUbM/SdqTBlqNiMu1Ug?=
 =?us-ascii?Q?or2Her4pfmolhjrXY6zxpjr645esg7+ZqTpT0Y3N5U4dzPmdNhDQUqktdawV?=
 =?us-ascii?Q?9jDRKs9E2a37of9lmMl2QTgsCTwnKXLh/mMGW5CELKZlM5pqSwGOQM3MCHEm?=
 =?us-ascii?Q?ITbNYgPbVAVwrLrHDGDJ4Y3Wf0q2VH3dU1ok8Vr9n4AxWEKu2KP0q90ZZ8iy?=
 =?us-ascii?Q?b614mk3GjRI1lWyWmBB6Kdv/Q/0cRSYlnU0aqZFwib92/HH7Ctb5VrNeh/Z1?=
 =?us-ascii?Q?/lHfk0nFBViGF04b8pa9Ct6TVyC65BMP8Uj4JMoG/LfAylIAQYeK5r1VJt6A?=
 =?us-ascii?Q?gx07yCHU+/bFNXs27QHw4ALz6SYfPzhqAf57+d+GWeXMgtp2tutWnT3lRxL7?=
 =?us-ascii?Q?TWYsbulmoEbcXnCQ1vYGZlrXrDOXpbCbL0SH7CMVv8jVZp+TV7u+THqroNwd?=
 =?us-ascii?Q?vUjULY6nSgzQUydW7ENxBt56LLX3UYmoku0tNQTWxSfDeA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fla8w4DH4z9Rm1cLbL8w4K7ycWsP2rJho++IKuPlKopSTvJWJ3jB2xppVrzM?=
 =?us-ascii?Q?yC3rVcDHxETewdsUmTaob9ycZtVn51/KUESg2t6viveo8TpB2fSusZbVcTOu?=
 =?us-ascii?Q?bcW10HkSE3/mFKlkOJZbGW+oCAV10anSUSUxb5y+xntU5/KSxsnfcKU7oJT4?=
 =?us-ascii?Q?0+9F9d8y270PclEjMzueeXaBsqObqgE+uErIBlCLeeJxBOiSvls/miJqgCJO?=
 =?us-ascii?Q?FjnE2brbb9KHU8nghMyhKeovlSrFt5XNuKqkCJ4H2XZMgRHPAJPXdzaNq8fd?=
 =?us-ascii?Q?FwVAs7nwGX+65RozmZd2A1pz45Eyeljf6YHTLeEi2iFfOcqg9DB5V+RyDknE?=
 =?us-ascii?Q?MoAFGNVo1spQ9oSRa5H+UDdHw+/CScCENW/vVRZGgEgYDVEzme0JtxsphUex?=
 =?us-ascii?Q?9wRFmSUwolkhxHtk5nn99HCjqcHDemqoPyqQizwQ1P2dWhCSLd+5VwOatkLa?=
 =?us-ascii?Q?FddrvrilF/psE8vm0+v4VNK29pXdEA9wNaoaciejFaNjtGD9FpvgGUSOI64V?=
 =?us-ascii?Q?d2Qsm7gEp9pAt3jWdCcFVyKMSREAfPazNMUomVYTZbq74qCp76QKPjL9dOpp?=
 =?us-ascii?Q?a64IZcgdcHMAS+DqCoBrztnIVnjqi2/ujBCdAVr3n0ZIXASt5rYno1Zjh04i?=
 =?us-ascii?Q?pbsjJoVLeMvjvuiG06/xV8huIZaZV0ovd30x8vNqmrMnLKIv3zih7LcFXlnp?=
 =?us-ascii?Q?m/tiPDJ9o8FZ48fqmoyQb+E0dpFDyI8pvOW7eNJ67i/9yReLkMjo2f2SIIYt?=
 =?us-ascii?Q?4cRqs5tUoUBLZmuRCrWWnAPJB6WCXTKVsHQAn4ekX7ZyKusl3oozaOrkD1OB?=
 =?us-ascii?Q?sR7t0QlBuXZe0/r9SrIrBXBhGyhxKOruvsbxFFt1ZhUlo6IChzHpu3V8BHHb?=
 =?us-ascii?Q?Tr/3liwjx0c4w/nYgELkw2yc2KEIEwpCVEc9YFSDm3K3yyj7704PGhIpqxwv?=
 =?us-ascii?Q?7qx4GlvgLNOTK3yPA3g3KBGToVMQOM8SGiKLOimy6TMLTFmht6INU21HVHIk?=
 =?us-ascii?Q?+10DpCRPSv/1TaZ82L7Rla41Ag88757oiZfChbfw4yyKrCTYGLtNSmtjX/G1?=
 =?us-ascii?Q?1hADUwgjn9Zlpa83sz5UR93aPSHECQWuzZYZeqZWUzHIVwWCqmCgC1Guiufn?=
 =?us-ascii?Q?ItalhqkJSHpZNw4p2B2UNGHWFFzNueOVKeFf8mJLR6YtansBj7OfOayInqbj?=
 =?us-ascii?Q?0hHyRhF0Cb6XmZLAPizNcNzxC4bUvXbFwcG8DwsqJT5bmIDye0SHvI+if3kH?=
 =?us-ascii?Q?Qq/CsvLVLT/TEuZb7Vi4/23+wsYUbUGEY9TlmtNM3ZN6wKaVZkG8Y+ThTPCQ?=
 =?us-ascii?Q?KTfFNJMOoCHFwGg1b8r6wiXdLnbvWrZs8WFwBL6Dn6B1R0hLV1fcCyzSZ63G?=
 =?us-ascii?Q?1AZd8TOwz6mgFNhK3OXDbxZFwmTy/7VmuCDf282j1EZ9II+ayyHZLfP8ee15?=
 =?us-ascii?Q?JLYj+IU4qqNAC3cpwuyUAbwijR0RE4ORl2iWiQ1BIHlpwfqfwuum9W/hmVMl?=
 =?us-ascii?Q?lPD5p46Nb0qhMLL7q1OboJzNh5dtb2Sn1aP1ljqGUv66ClgNF+VwzqSihVdw?=
 =?us-ascii?Q?aJiLAU62aKmVd/9h6EAvitoaKwdHew/m6cgskkM8EuN3Q95VNvXRyzcraGgI?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IZMpXUyHWClr3Z2VJyTFn0VdnHzNATRLJj5nRD/QT/IXv5BKht+4wPCvJaVf0vICFWE9zX1NexFX7WEGLc24OC4kIRNRdXFy4eoDa+Gp92NsH1ocDrMfmvGBTEC7V1QkNDsWnV5r5uXuZlPT8RrSn0Rpu3ayjRJKzxClym4be4+jLKWmlKl53evhQkHguRdbhI87DHq1LF5BVxWFGGecSZXimtGkxj9BKQIoLRnTnffmrXhvd6PD3ayLbri/fNLNHAEuW6xghgR1qnmJnoL8p2aqtYU43FltJYbC4t7DfpD2Wgnh7bisenBtGTsfJDxO7f++vT1mmYHsRgnr6laNcXgkX7+YK7fN6lpDf2x9LWvhXjgmrgIivfy4H6iGPa4UFjdil5Ubdm0+e3BbfY6GdeOs9bvS6efpo5VQDkBNCpViqbqSq+0Wn1yFDLyqVQWDU01JlYuyJ9M+mB4QAcLdj9gLXCzT5GCeq6o3c5s+18MmIwhX6ZsGpsrr/Q/JSpj+wvF96/Hfq00/OwYYtnEC7UbtK5HCxxwPy5vr02611O5n7zJcP/0R+KTded8UzOIEJpJvbltaqTzkrqv8nlBglOLbv3NzfYH7ei37dhIzlq4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69b1f85-74be-4235-2a46-08dcd4d9eb6e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 16:26:00.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AH++NP+59RuK819tEkIHdtVRKs6bKVBmU8AvqpLJnc3bok4QGkwsxMdgLIfjroCzQuDdbwbjiqYYu/yfc++zFgE4FDweeuUDQAlTCiSJpxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4798
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409140115
X-Proofpoint-GUID: b5f9HV_l2kveqlJt0No-pXb3eaP8n53v
X-Proofpoint-ORIG-GUID: b5f9HV_l2kveqlJt0No-pXb3eaP8n53v

On Thu, Aug 29, 2024 at 01:22:07AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Even though dtrace_stmt_create() initializes dtsd_descattr and
> dtsd_stmtattr, there is no point to doing so.  Its only caller
> is dt_stmt_create(), which itself sets these members.

No, it is the other way around...  It should be done in dtrace_stmt_create()
and thus it is no longer needed in dt_stmt_create().  As dtrace_stmt_create()
is a libdtrace API function, it can be called from other code, and since it
is the function that actual creates the statement and initializes some of its
members, it is the logical place to retain setting the attr fields.

So, instead remove the assignments from dt_stmt_create().

> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_program.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> index a4b052fc..bdb434e0 100644
> --- a/libdtrace/dt_program.c
> +++ b/libdtrace/dt_program.c
> @@ -240,8 +240,6 @@ dtrace_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp)
>  
>  	dt_ecbdesc_hold(edp);
>  	sdp->dtsd_ecbdesc = edp;
> -	sdp->dtsd_descattr = _dtrace_defattr;
> -	sdp->dtsd_stmtattr = _dtrace_defattr;
>  
>  	return sdp;
>  }
> -- 
> 2.43.5
> 
