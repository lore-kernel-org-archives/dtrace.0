Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41856273D66
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755207081; cv=fail; b=aYcx/XEXDjwUqTzVUvtrKNOv8rxN2G81YaX2C5CRLYFMTbPHzoLdy5trvZEJ0HqX1d5m2lTT6h3PckVnVJ+Zn7f+6N8RbwkT8dwzslhusI3x2E9M73kMIvoyyfX+C/HhBt2A1FL5ESY+ZBKOVh6eVdfCN/pxLkHpYlwGxcavNGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755207081; c=relaxed/simple;
	bh=Shy4ZVq8tEvftBX+nFeu8cEldRmo+rkKfNayNWf0q14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TMNBtUXiqqebiPS3D64PkwOFwNCHzIJIeJJZwPFfLbbbnL6OGsUzgq2Lc03LhkE+3t747RjTfyYnP+3In/KoHPN4Xx5qygSiF6leloRNwSMvXWaPwAekOxlJksg8YRhNUlfksUYhYoV1mX7MJHbOo/kWgCz1px96UwxYtKFUmPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j73LoAI5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fAM1/BKT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j73LoAI5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fAM1/BKT"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHg31X010713
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jIYKwXJC+SMR84UE3+
	oboOwGfkWetrQB3QJ4VL1ro58=; b=j73LoAI511ouxqm6kxwTZkXlTHdvatnuiN
	/lPT38DtkHbBV1XYUnL2JwV7uOWafERFbXBXmg5ZLmRWE/D4YcnB2ssudVuekELt
	ECAuRL3yFzQA6fVl+lwqnK8SBm7p4tdoJwUJvkXWZc3tfbeJhvBjgNlUiQdRS7qn
	BmsQRHZkB4/OH5IlzDEp7bR6UP+R/i6IAeGEvjDoAEJGnVIHwWIu1SupzJ7fpB2Q
	xOSlZlFsGmjoBWv5/32Bs4xNrUJs+jz00WOfu2hzvjL/zoGnfptiioKDuHXgG3rp
	WQFtbaFvBU76HyWvCWfleO0fbhUsKEIXuRbvjWMC44yw822H5hBA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw453149-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:31:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EKQF7B038542
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:31:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsku3x2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 21:31:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUsLdahIW+jSMzJ9Lvee4KBi/NNcehHB2o3wLGZjSBRwADw+Ydbcjwl2zKP0/oVjWMjrZW8p+/nM34zJZ2kS6Dwv1toJ1rKmMV5CmmG9eSRYUwdP5nBVthou0Pm2UPqSrXiwd8aqMFgX21SLxbANj2mdOoO9owqkpCDitlUg2W2/xv5Bt7xkyLR+CoZMbepxT8ufKw0AhtJzhqz45tyHJJTtmmvyJI6KrjzSPOJWledpOcAU9Gq/Yhf96J6sH0uePv+U58YXRtqC26q24tzdvI92uAqUI0fhz3UM8cgodoW9mhl15WXt9QXUWr6EdVg6c7D7/B8+xJ21MrdlM2mUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIYKwXJC+SMR84UE3+oboOwGfkWetrQB3QJ4VL1ro58=;
 b=Zlb3sTNF1GSiFlZZFz0OEMKxYTYqt8pX3ahuKJW6BFwx256LE6O/10SC2pXaApFS5KkHpwjLBthmu8LVFAUZgDBQpWHCez5XykFgR6+jum4HOzvscZ/ChfAyubJE8wx2U7V958N6BXB1+4sNz5TG3nnRnMrjnPzLUBLOiIvS339XMe6yivMnaxlfZF2l3YJE52qCRsJgbnCfgFgdyh9HtvnUo6t6o2T+pOnYoi3RniAFNdU2ym2UpTk9QHXDKhjQIQwWBN0xuZCANV4fc9he2K/3t+5WMOIBlPT01Yho/4K940dPSdWwp/1N++wE689yDwfiNPDLu9y0fh8qnUAOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIYKwXJC+SMR84UE3+oboOwGfkWetrQB3QJ4VL1ro58=;
 b=fAM1/BKTjWX/lJnwIWlShV5RZRlvAk/PGz6KsaPpE2OStuMnmepuZKqwmb4LKLO/kHYuj3aWXwMaP6ohZ8xgWMU2sy9pBIByodw7jJZJj/1L1CT87YVBiqt6hxdaOFawvZnm/J2yqb8PzbFVH4HxtzZSCPTpnZtnDTOhV6LNCIY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB7176.namprd10.prod.outlook.com (2603:10b6:8:f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Thu, 14 Aug
 2025 21:31:12 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 21:31:12 +0000
Date: Thu, 14 Aug 2025 17:31:08 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Use a more ubiquitous probe for
 return()-action tests
Message-ID: <aJ5VnPAV0C7pRcLL@oracle.com>
References: <20250814212620.12497-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814212620.12497-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: a33d3a1a-1b41-4fc1-80df-08dddb79e401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ft3/ZhnuYbkfVYyTvoIwdT72jU290najQXM5zAoC4eE8MuEHvx98lgZy6btI?=
 =?us-ascii?Q?2cxIm39VjKPIzLw9NDcHgn5dTLt6tQsRU9dsWrqXsz7d1EHS8Tfwl/tm0t+n?=
 =?us-ascii?Q?zsB28rz9P+NVAx5fDe6q/VgkLMoUptflxp3shB7ncQLuvCgaU7uBlnlOe7Jy?=
 =?us-ascii?Q?ikDVeHJPD3WndwJDFWRX0l0MSn2AOoNHptXtxwktR0lnAZnWnD5k4UPo/UQV?=
 =?us-ascii?Q?LKZybIX77NrfzMnTe3yyixPLhoAbrlXlQL95/3wgI3XjA0d/aIlHhEpYAkCi?=
 =?us-ascii?Q?YHW6cxPX7fKHVqq90W2Ku3bmRLRlY/HkylAn0u5FqxMOBz5jILAEJeXOtwWF?=
 =?us-ascii?Q?qkyDypzwc8y8EbM5ShfDKdmZrDLZTYE8MJvdwnEDdjzhUecEYWdfEvJ5GAJZ?=
 =?us-ascii?Q?Idt7NrVIbY+6BNjUdI9wm0N7q4L7duInYaAk63Vhsx13c/dvA6NGkbw6HQno?=
 =?us-ascii?Q?RR02P3hKV0ohSDcJQiLk85/y1/e3nJXFUlfyZ2g0eAXv2llJZYuhJ/OWhXuL?=
 =?us-ascii?Q?yhJ+pR/pEIdVJsgiDXXefMfOjwzmQ3tfBjse7KoXpPX5P7ftS0mMT5Mhtont?=
 =?us-ascii?Q?6XWsibMGgRl2spWbVmIRBw2MSzbAU/7MCIhIenVSye8uanEz/QEJKh0WrxO9?=
 =?us-ascii?Q?83DeCJQnq//T1tE+/xZF6g5yrsiaW7fuac+Nwwya0UyyEDD++SJ+Jd+/TF10?=
 =?us-ascii?Q?/z2mDKBQ06UGnE+nZ1E9mKRzQqCFyPKhgDqx3iMRNhdrb/Uko8oeAxqt0h4t?=
 =?us-ascii?Q?IDAdfP98vEaqOhIxg28aKSLWWvKOo5ouY5hNuldb3WlO0yX3TxcvvXM0P445?=
 =?us-ascii?Q?8ChaRaJQmOouztX4dOIRSW+LFVDFVwcB7KdE8WAhdPfgEc+wP57wJRaTt1dV?=
 =?us-ascii?Q?GWX3awow00c5tuN1TO8qUbVd1Wv/aZUBwOAVtW9nuGDjpDhBWXeWcjyTulFD?=
 =?us-ascii?Q?BaPRgsc3hPNQlIYgZcLm+ERCpxKGzxPureKNT40vQmpzUyiZuVYASHe22P5h?=
 =?us-ascii?Q?C83rW4eTAgCDH40pmnNSOuLzr4rXuutlWOdnr86uOaxK6585Z+PqrFFg4F94?=
 =?us-ascii?Q?5hezRblChQcd89qOi+YH3KXcy/bZrWDZbBxVqryfNTOwisRB+jCFtSmc3ps7?=
 =?us-ascii?Q?WqUsQI/Jtiyntp+ZpfZe6lInZ+2qgEoU6ioUO8hunthVhTeyCyUowXpsZIUG?=
 =?us-ascii?Q?s2teUniaQtahX5K0EDlH1dK5Zt2YOBe34lQ6H1+EyYBNW7H+zxFcYHzsKqYq?=
 =?us-ascii?Q?t7cruQF387Y2ApKIrG393dfeUPEPkdInIAjDE/kgdghiGyfxNaj9mQ8OZti1?=
 =?us-ascii?Q?A054XETvpEM477IhGoDnKWdH3gqkpT46aVBIIpIeVYAJ1awLshq0P1OOvHEn?=
 =?us-ascii?Q?49ruOGNWGwr42VSBn6S/UxT5eRvG/Bwq9R2YPxIIIrFrWaRZJYp5FLoPwpgU?=
 =?us-ascii?Q?el9QRchoaoQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vp++oCE/JPU7mOKBSCoSa3Q/Vul6odqTfLVoIyIookihOKBp48rQOoY6tKix?=
 =?us-ascii?Q?wyfTbKf3gg9TWZfsRoVE6xC/Z5f6LgQkqUbO+ZCtSwZBvjidIx2pe8iQ60HU?=
 =?us-ascii?Q?vS9ObKtbSfovj5AbBy4LaEWROxqJ71ogaB34UZ+ujLnjnJ0FXiSQgGGER0AS?=
 =?us-ascii?Q?zswcQnPeGFpC3fIRBNWtWK1sXA+hUuwJc50L9z7T9/uwG6DxyVNdAkZDVgOf?=
 =?us-ascii?Q?kCxZKxNcdYHDDXkC6eQy2Av6yUmrF7H2/XrUEPV0rD8jkEr14ejGSu0exHya?=
 =?us-ascii?Q?55Hwp+/GppTXG8nbYdGxMFBxRb5Wp1EIMEvqeyO7AeLLnbEhjFEkwb4e6gvr?=
 =?us-ascii?Q?jjxLMh2cGxfUip031yshq3aRaW+j98rkot3aykeDyPedUrg6TaO77Cof27Hq?=
 =?us-ascii?Q?6l1h8Cy5TEEeER7He+EbDImrJOUkyJYHyMiJJ/14xCDsb63srMxAcUxBZaJu?=
 =?us-ascii?Q?VfzBy1DjIxucbsNe/YHiUUlDDgLfE17K8qQwpv8I7eygao0g8i7K/93FleKu?=
 =?us-ascii?Q?JVUKcjSLDbHXuKi10UJTsprPpO+k3NOar31Ue6gIfuOndYVyH6rM3byKs+Ph?=
 =?us-ascii?Q?lzYZS5dnMSr4ppsMBw03GBAJctlXplDlaL8bkyJNf4ra8eadZwJq3jM+spTr?=
 =?us-ascii?Q?wGzL2l5IH5BpPahNtR1bfs59++ZqEK5ibry8I+tokA/pDI6rvmTXEhAeOceM?=
 =?us-ascii?Q?RO0Z3E0n3ZfmGHd4hkdSJxB5m/FoCnZq5+JFu3E9AYdgSXqMkXjcn7SXS7j2?=
 =?us-ascii?Q?zy5I8CPFy/Jle0QuQdlXcTj9iUirmEfTdeuNoRVSuCzi4/EmBs0ye5mouGKj?=
 =?us-ascii?Q?K+ZLrQvDxE/+3zyjJ9xltUObC8dbTsdMiDvCJUuw9xVwO+kElzh/pilYueWX?=
 =?us-ascii?Q?EWbHX2tZxHKxn+xHv1OAMhRPw1Frwtjn9eRzMpYYFXxgDn9q22Jl1FvIc8LZ?=
 =?us-ascii?Q?lpZeJiLjyeqcbxVmFfapP827UmRR490EiKOM/ULX2hVdb6H/8G3Q2qFwC57X?=
 =?us-ascii?Q?suuwkcYEu2POm6ialCW5Q6ICxrzmNmW41cdowtHTEnVK0br07aZBj5+pUy27?=
 =?us-ascii?Q?lfLOXR4FoJWM9yLz7HOLEvc28FpV/pGjl1RT2W+OmuJBepW4HHeP7U3CAp/r?=
 =?us-ascii?Q?HD0ou2l1ovfKXxI4Lj7nlY8vT1rm6kc1kodyxI6Wi/kc1gsyXDN1YzflFW9z?=
 =?us-ascii?Q?R78bF4uj6ugexaSawJW7ELMqRQkwtXhjr5X5hwP/e9bVftrMC2OJWso7Bqc9?=
 =?us-ascii?Q?ml+Q2mrJM78sX28LJ+VNgppOhkiRRD4yn1Sdpj2Ms/WgdP6CB9uL7mDqG2w4?=
 =?us-ascii?Q?NIEo1CCL3x0W2G8WQxkYzhqKcXSgEoJrMUO5tnx0kPDSi/MHbWrQ6w6AqoQA?=
 =?us-ascii?Q?35eJDTlVoNjNz3TPUaVSkk7w3tl2SoZrb9WhaqMgKsTbNn4FOxaSrD3rQCk4?=
 =?us-ascii?Q?jEjMbnT6Vgg3JWgVwn5snrBH5DIEE65Tevjxkd64mQ/An1hr74YAthwH9cMC?=
 =?us-ascii?Q?hzVrxfHxkhEUsVc81a3LlfPU8m1BToiphsQ6K31xbLIw7vNcaXPyLoeBLuI7?=
 =?us-ascii?Q?KnGhZlNK1Cul/wAB6D7kwtN1vM/bPaWcfjkbFywUdSlaJQfoW4BfZcbTnmZD?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XafGT0IEqU1TbfVHRY3klWR466SDatBqE4i69PcDeWb5tDXbeQ850tFahtUVvyH0RodOc9RRnkQqoSKZKIKQldT0ZQLpcQzqEd/n1iMc1D00Zyk1cVKvJf0LFZu3DNwE0hwHiF+HBnZsjAS0KZa+rr2htHlREe0jPYvXDbuKJZm3DUe1Y/35sMTLfNA3F5CIJTSamjyiVuOu93dt1rOtrqrv03A1KpgDVktwAMaw5dav5VF7kK/0eDUJ7k9X0zGG/bBcKtl/wPTQkUAcZN+wNlnI3uDPAsLH84FaQyTAg70Y/k+6pk+1uIRomHMBvqsCgbeXorgs9kOZX+mFoPV8H2eSAu7LCIYXbmipj4SrfPlimQ8JP1J8ujYErcFjjlVkJ4xcUCr77Zb4wo2xUrzcVz3EmOGhhSl56s5PohwXekqxB23v1Bz+RVTCfKfOfAlJFNhpb+X54OP2O9rZZJh+BMAUexkfj2ucV8SOrbMurHPiX+3N7RTdieIt3T6yO0gA/ZiEPELfk6aImClzHH1EHc9c/MVGBBT82Lm+zNxxcciFygGlxWTelwDM8YgtNJsC0gaipMiAxQqkijNIFl3pxuoDqRSgt36PZcSldRcaIeE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a33d3a1a-1b41-4fc1-80df-08dddb79e401
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 21:31:12.1527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnbvKjwZ3qOIJChIlsYkiiDJNN9etBDhT3XfXoqtMyFMOjrDN9KViEDG8oYUa2A9a6JdHaT1Bo5CN/TIrfuIHlII/aEhVApKUD094tdRIHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7176
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508140184
X-Proofpoint-ORIG-GUID: KWxblS07hu2mHITelKfTjzfFJX1fN1SM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE4NSBTYWx0ZWRfX1eNKv4mWJgAv
 zfRtU9LV1Dvr36p388CxntP4vjjlTWqZWTmT5bxuOQu9Lh6OF/mG6LWXPJysoglQCPHTn8m+1rp
 EbjmUI8wFhE7/hY5A5ILR5kQLAGD+2Rn8u9/5ePrj3IEAqqwEiOCt/6RFd7K6EuVKmhtL7F29wR
 tkzrd9ESg5Xi3x/U+X+5dFH7PHhJUO0tMy1mT9CXhuIQwXqthUTWCZLHh3Emf++EIiQEMhyiv2L
 rVZPXHRXbvlojJwXNfk2oAidHD/wvn45A1F/kBsYYAyFVpdXnxCtOvXIS/ZCno+wyg1tzCcByfE
 4pO+bcwgUr+CKYn+8Luk3uXuaPsdFn1i5NQPWCdvO0fJgoTC2YNQ3KCn+EXdk/6rgbcXh77yhlN
 tbdBLo7bXNJHJ4O73DwkfdVrP4QsLAs831phw6yzdgjjXUT+XJJHjqYSxIa7ylLjcsuTxvi4
X-Authority-Analysis: v=2.4 cv=X9FSKHTe c=1 sm=1 tr=0 ts=689e55a6 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=bRjpA8aBe-7axRVE27UA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12070
X-Proofpoint-GUID: KWxblS07hu2mHITelKfTjzfFJX1fN1SM

On Thu, Aug 14, 2025 at 05:26:20PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/actions/return/err.destructive.d | 2 +-
>  test/unittest/actions/return/tst.destructive.d | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/test/unittest/actions/return/err.destructive.d b/test/unittest/actions/return/err.destructive.d
> index 4c6f788ec..9beefbf66 100644
> --- a/test/unittest/actions/return/err.destructive.d
> +++ b/test/unittest/actions/return/err.destructive.d
> @@ -19,7 +19,7 @@ BEGIN
>  	exit(0);
>  }
>  
> -rawfbt:btrfs:open_ctree:entry
> +rawfbt:vmlinux:__*_sys_getpid:entry
>  /ok/
>  {
>  	return(0);
> diff --git a/test/unittest/actions/return/tst.destructive.d b/test/unittest/actions/return/tst.destructive.d
> index f1d9e4d32..25813b2cb 100644
> --- a/test/unittest/actions/return/tst.destructive.d
> +++ b/test/unittest/actions/return/tst.destructive.d
> @@ -20,7 +20,7 @@ BEGIN
>  	exit(0);
>  }
>  
> -rawfbt:btrfs:open_ctree:entry
> +rawfbt:vmlinux:__*_sys_getpid:entry
>  /ok/
>  {
>  	return(0);
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
