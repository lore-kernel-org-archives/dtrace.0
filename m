Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3641922FB
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752593856; cv=fail; b=P94pE5A3K+ewvMnNidoXMrUNkpcvPTS7WSnTvIacp+LbcTnnR1bmGw6vE7w514kAmzsej90h1kshIrZzJ60hDzC5JkKmd1HDRKP7QrfYbAVqG1LfeiXvepkqAlgBIM22GqYjF0/gx7B/1cPAgIDSLGKnI1NvVbQUhIPWu3t4//E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752593856; c=relaxed/simple;
	bh=DyIJrilxkNRY6phi0hUDo1mD04UbMMbvpISbvnxoZLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NixksD6oebDuIQxqrkC2x31cK9r+9vRNvfhKqqsZpcKIk5a+mY83I5ueSNC/VLiaVIGNMoaAdfU4XxawvMvySxYNR76OBPDjdhFz7O6imBBDonZXNXeFbafrTefCqA+YubmCGQxCnvbEyrRO30RNyQJVDud6NiyDk+KXMMwSwyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cVYGn08G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BaNBXXH7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cVYGn08G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BaNBXXH7"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZCXu009067
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=p20TIcg6CrcImVYMm6
	RNYkd1F294aSiCNa2VjJTeSV4=; b=cVYGn08GMAXuVZKFhoN2dKgtD9FmCRb/wH
	Hpy8XNq400uuO34D3QkePIa36AU+3zMJdDsilgk/69qvvQnEvhKzEHeRKU4bdyNN
	/3U7yYMq/j4Lm9lcafQ276ZCxxkxSeMFM6Esm2qblFxnesqmJ//lgsAcf1t2cQxI
	9LG7plrQ7n3joGWl4FaDaRtWLvACZ2JEg/xHQZjP1iEvZm9O23wIkRm0RRuY/JGL
	lQPueON9wx32H3nl3iUkPZTn4iXNx2dLRQN8It/fPkKc0pFZtBiYRTrcLi1ahUS9
	4UyuxeNdi3cE0RxS+B/VooDl/f7gHjZXq+tt3skz48yQi7MuESQA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujy4px8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:37:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FF4WSS029669
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:37:33 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5a4abx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 15:37:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyNYhQtAhAmUWgOXdROmJgimMDE2cNyWCeaVK/NpLynGerje8B1qrD4oHsyTaaMPYdVpxYymPg7uTiFXKIdS49cz77o8s36MN4ee1z1sfGmOqoVqrIZOrGxAQ9jnVPuFc8VzloMWJwman4GZ8IHVxqpLehhx4fXpOJj3b6mAaAnWVskeacdty6e70IHTk6Gh2CB0ahMrt4CkakaqtChNLoQlhHK2bro+72nYIZpW1x/U4XiuIcT2Ik15iRtWXFqwHwGKs6wESUGl8U3Ahz5TeIj6vwPMB6cgP7hMJbYeazlrpoemcmll0c8bmxJAMhy25JttOizENKaiDFp8Rsgl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p20TIcg6CrcImVYMm6RNYkd1F294aSiCNa2VjJTeSV4=;
 b=UQ8hjZPpiRIJmqYiPS8N1ZFgH7/Jloq2Xx7JlzMV0szM8QKGpXh6aNu+uEO77KRVuuzLGsGozh/rTZKRWEMPmvEsOzqwLbYFXCsD060G/ZHn/zF9/d76hRucpQxEVML53nK87OUHk4GujwH9yeB9UoEczuHekXydegFZORZCjcYbzcsW7SQVhYWrhjPMPLnPcZAhyC+kzIufSh+y4O383Os0lFLlZ1sHL+dJdVQgKXMur5i9cGtdCwjYSiaWFiqNvuMN0u8KGzJ4A1U5P0n/8JbQ9PljyXTHK7ZtQEgKy7VMOm8SVeWwbsEwizdm40j9XzfGQlGxGSc7bp4keFNGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p20TIcg6CrcImVYMm6RNYkd1F294aSiCNa2VjJTeSV4=;
 b=BaNBXXH7oZS9h3m7a7scFAMlHicfEvl5KHCZFTGdrgcQZlQaVZCYi8N/dAEfz/KQ7vmDulFxXrHxIYhy59fyapdwk/N0NGmsLxk0nEMyLQFlBtFaq44uDX6lHeziOiFPHyqW9SNB7VspSWoTGXDC4xXS4jrnh8zfg//kmD8Yta8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH3PR10MB7932.namprd10.prod.outlook.com (2603:10b6:610:1ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 15:37:30 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 15:37:30 +0000
Date: Tue, 15 Jul 2025 11:37:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] cg: reject clauses using return() by default
Message-ID: <aHZ1t2OXWlWAzLaR@oracle.com>
References: <SJ0PR10MB567264A32C578A83EC920284C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <878qkpwxho.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qkpwxho.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH3PR10MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a73f620-ede0-41be-2d19-08ddc3b5827f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qNjwvCTVbCO3ivJMEagECiLCe67PRy4pvPA6WHS8xiYrFMAxD00TheSdzbTc?=
 =?us-ascii?Q?CFp7g7W70KkKH2ND27V26rda8XSw8uqCFaZOiakkQ35l8JEdcvmYKVNFn7ia?=
 =?us-ascii?Q?faj0IyAsG2XzK0PqP54TIe/RL107WN6qB7hOw/09DfOwMuhIfHgiulqogc5f?=
 =?us-ascii?Q?ueQD26tKLUlEULhu0PgyeX3v0zEr8bA/q6w3lQ0QD+dynBP70KDUbJjoipbn?=
 =?us-ascii?Q?jmXCuAhaXsse2vcyiz5DF6ObGbDul/iojEec8kQLADvJ4ZGPK/fn8KbenRpq?=
 =?us-ascii?Q?yLRYkWEHn87leyE+CMznkCvKnFgXcjCY5TAmBZiiBm86kkcxMwmsphcKa4NU?=
 =?us-ascii?Q?G1IfgVfzqtYD8hAYAq4e5++vCiijvGLWv5lPfJIiS9Y1HxCFOv6GSsjcX19U?=
 =?us-ascii?Q?2p8w0HZl6j16fFWA3h5T477bJdNGk+ndzhuuuAS49AOa1MnoHb56U+bXnDpN?=
 =?us-ascii?Q?typAbwAlMx2c7hVGv2EqCzIsdxGWzuODyjdDWKPxxcgBm5Y5pKE589DPxsZM?=
 =?us-ascii?Q?kYhY38rwYk1qZJz8em7zY4fsrJ2vnzvhH4PWcNadvHWZK13gmRJcdn7aflcc?=
 =?us-ascii?Q?ZYrOYJQXlsYpe6DY6UdW9kOZvHewt+hV6YMagbnEOVRX9nLL26wfH5LqBdVm?=
 =?us-ascii?Q?wbq3FnLpoSyTeXWaccZY0YbV/S8k6rBtwtSdn5FwCbx1YzKV5R04VL/MgIaK?=
 =?us-ascii?Q?9lyu5cQOkpRgEyX/hCK6gp94MtK5kUcFlk/5bnX+rZfhI1xUo5djN2NZ8wUN?=
 =?us-ascii?Q?qZpupT8IfAodKK8uH9ksvxYAt+aY0dPTqdXi4lRHCH8kAJjxXzur/taIfX8b?=
 =?us-ascii?Q?5MweQT860aizGoCP75ojAdZTNkB47ALXQgrAUAwAfbP4Ypg7wGJ3L5p5I9KY?=
 =?us-ascii?Q?voE53E83DIuIeF4xsoYVuZlcFHlPZ6Lw74rNMLsq9ebopyJYF4946HbekY8E?=
 =?us-ascii?Q?mnD/f01/dH/F8xoNkfDPk8aQvVIGFnMuwtzegSYOzipsohLWzFFejQNoEiVm?=
 =?us-ascii?Q?9DbV5ZwQkFeRG4SqKYVzl60G62zjkZKhBIFGiswKmfwAH3y+eW5pHq8yjXdy?=
 =?us-ascii?Q?B6ulHo8rQaROElyu2LGH006PMkw3SCXe/HQd7/VAD6c6tYx2o4f3TzAePsX1?=
 =?us-ascii?Q?xtpbWZdS+WdRilI/t8mVnCFDT2mLNOzzOtt+7pfOroElkLO3zJxItXLOhERd?=
 =?us-ascii?Q?JC3awukvP4E6U+A307bMssoztHdAqv138bWtjRTM+QpibeJ7mwYLGwqWKZ/t?=
 =?us-ascii?Q?LGu34MeR7ohOIyqIKyuqzky13nZeaoJ8uz45PfNCvo8GjbvRI/X2HTQ7LjfB?=
 =?us-ascii?Q?OKpb5al7Jzy/5JH0X2iLAbN1CaoDb62TGrFEwzaFEjfiggCjyiOsIwGcqM01?=
 =?us-ascii?Q?l/R0f2mnnR4Cs4W+9yUvWCFwo+1d45Hp5nZLpkFdRm7u0YBgAuleqei1hjkl?=
 =?us-ascii?Q?Bj8MLe42vyw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H8xvMVFadCtvFDFgcDH5gjyUJMRo17J9JNFXVe61WShf/hb/JvA1X03F5dt9?=
 =?us-ascii?Q?ac+v5OunNvQ4UT6IRbe7oJvMTcRQKOwaBF8IS/eePFzkvEi+sSLu/fCjoUP1?=
 =?us-ascii?Q?IP7klALoYgQ7+EgbOzi0lTE98OhzQo65BDZBCzqC/ctKTV7znRCbuUucGyyz?=
 =?us-ascii?Q?Mx4FWl7Z5ttEgrSYLdfOCJAjCHTkaEY/Ec/cDeQNRrQR5BL06RV6Hu6Bzu33?=
 =?us-ascii?Q?lwcQhIkvZp0ov3NQvYj0wLVhSw53uDiJecDhleLZ5IJaWHn1PpNTKQUK42eN?=
 =?us-ascii?Q?ZK4uk+3OaeQlF8DY1AEkT7nTSCFDtTAWD1JKik4thKtwbWB4KZRu/WpN4xTP?=
 =?us-ascii?Q?RdfEXKM5LyHb0tm0eIOxALn1ERsYLdNcksbiHwHkduO4rB4l23NHBhk+sPfs?=
 =?us-ascii?Q?PHiSsffLwdDSis0fkazjRX6e6QmrBVE8daEO5NXQKZrCEhsLznERm0VDtuxJ?=
 =?us-ascii?Q?QjwfLa7AGWCXTVbe8xjmkMHaDQ3PgzKnyfnKrmonVm29H53GIuTmCVQF66HU?=
 =?us-ascii?Q?G5W02XcvzOiBPSdeEdMT5bVkkl3TgMN6JasPjbwRtjqOTcXWD5Cb2G/To8J2?=
 =?us-ascii?Q?3HtK0GNNu1oC9Qqw/UmEFp22rQQELP9aHye8yL8U4V+rTjthxz3bje0JZ9xa?=
 =?us-ascii?Q?ndyd8MeTelTaUo7YrdDnu22+Z2KtLxseXDkPUoxzK5l1TpfrOXqpbIe+GlK0?=
 =?us-ascii?Q?VZdsPRL19MMxBSaRNEe0d9qFSx7bJRdacjzOrxBTO5X9blsGN8NkGox7li6D?=
 =?us-ascii?Q?Jphbr2UEMKpnpk93hdIbaOPui6+nyVshmmuCzOstXMCd3+VCWpLjKWrxyLOJ?=
 =?us-ascii?Q?ICqBz+iJxut/6G4CghSBUJnkbkofjYLNixEynVUTsYQmlsjWiHLXPSVaMMWB?=
 =?us-ascii?Q?ye1DMDZMuEYlU8B0kg2ywY8VZb5Gb/AJvpPx3Ug5LByKYdNXoxsfiWwyUgHI?=
 =?us-ascii?Q?qFMKkXylSFfKQ09mNMVL+/schysVO4OmTXrfLMKUsozQsVin8i/qcQoWjPIx?=
 =?us-ascii?Q?d9t77D09D0/m1cJg44w1DmxbQ9k+tD8vvgWt0Dc9gFtrUb0aXR+jXvU+isYh?=
 =?us-ascii?Q?CkM9M2h1B8oKQiigbxM6pM8ht4/rYaIci6MZZXEBNwESMTVHvzq7od5iRC4X?=
 =?us-ascii?Q?lW3cQSM1iRoE0TnH+gzw6BoL1iRlI7KuL61sjjaBRFgLONczOABS2L9GLDr0?=
 =?us-ascii?Q?9UusDKydcOk45FWNAvJXarNhY5/gvtpHKbYkvUA+Huk6uyZZGaIbisVlxAGE?=
 =?us-ascii?Q?4ekcmMYJqViRtosIbyVutomLWOov6sfMmSLIe9o4czogT5FqGq6+PzjzNdL8?=
 =?us-ascii?Q?Uj8U61X1ZhEC0JZea8gP0YrQNZteVdVTXDNXRWlOM/u99GCk1leuqZT18Wkk?=
 =?us-ascii?Q?qpb1N0SalHgNrk3DbmK44fCKJAgYz2GlIzH44zfM2pe/dVGciEuxASWDpb1C?=
 =?us-ascii?Q?nvCrAty55RZvgrWA3qtAHHpGV7+0a2m19IzNW2u0p900uj21PZbRstkAfKvQ?=
 =?us-ascii?Q?4F3Fg0w/LY1Qyp3JbDgw56XdiXt2R3M9WvwuEXbwYm1riPapXS5h/wRhDjAP?=
 =?us-ascii?Q?o58cUqwg7X48JLAqiPUl1ggBJuEvhhb3U1WYfTBhCHWbbk+jbwt0N80udeBo?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7zngIGjNvcajOo9mbWq1zJoGKRKN9bft1Zd+FByheU52pxZyJtO8p2w1fi8U6/OEgz0w7ZfcJHDrmPZldIJ/viqYAJ+GJDXT3wLKV1wdw3ShCg3oKTaoxEtgVsFbG83rrhgXiffGZ9hwhgWPe3QLTdzaH0sXglXFBZta2tFy188UEu+i5DXw1vq/6tVIiviqqbE1tUcB9VBhd9AC0cWHg3y+WYQopOYFFqMLqrHyLqGfajrsaVvfyJvdoZk8ukua9ytP1Si7OiKO4HXf/RnTm0dDc6zg3UNwGRVeeEFMoAoh/EaKYdDjgrkdR77v3RUNIvrFz8YxrbNil1O+bPLj6wbJHsxc8/ABOdmSNPbWXHOuVE0SkD3x3T6M67g4m9Jyco1xqfZwU+1Jbh1aFTsMvUv5L9GlbHs6znT0rgGeLnlxmQvXMfGaw/k1Fv2weIJVYtPYMu672PyBGwITbALGp+cWNt8O1Qx9dZ9W5m2ga51IsdsZTbg+9nUY9I+QA+J6sp7ahsAuwheiE44jw39G6dScU9SxiwqGzcgDyfn1GWCuLtrgY8NtABI+hh1IySYiNiZ+wq8UHqf6v1lfOnueiAKqo2Wt2tHG5lLrCWL8OPE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a73f620-ede0-41be-2d19-08ddc3b5827f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:37:30.3850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9fRR1d61RycMyXej5eKjFKTLilSXWxAJRHjRz3IPmKOE4Wkf8qMRlsdNGJ7WfSgI3yctbDtm36OHI7vrTLwMztP2mkvN2bNGh0kt4MSQbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7932
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507150143
X-Proofpoint-ORIG-GUID: ti7ZZicFAMt5qKRNn1N6j_aKQgmqIlyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE0NCBTYWx0ZWRfX0Q7kkAY8M1nV WCCFTiuwTAb8a0+bCKidYLKF49JRSudKuldc1wj88vtAobcDlvLuqsQZPveRtghIiHqtn4OuHY7 XBntpWmbOqc1hq324smmGVyXAWb+VOknbfZ8bhd5gJno2fe8zYtfvtDTT97LqsFWjYwlYn07ylB
 zydzVHJcBiGCjikxyeGhU5ryAh8gnv4IXmxEy5OXX5GhJtdWmof255Hwr9FVC//0rVzmUwddaho EoBJtmJen321X7lR56bNOioRS5mwtxzgBDr+GJc9EemxjhzdOK/isF8h0GG3fBnT6Pos26L2HFO vVvnTmd123IxHWx68tZyCs4cXBVrrt6nZXWSz4YV59EQszOefsXgJScPu+e4KNCB1kTDE/7qhdp
 YfepteCA/8nFbzpy5d1Vg/sbJKhpE9lbpcGCHzJs/DGiiztrYM+GQtwPam35mCD5aumH5+vm
X-Authority-Analysis: v=2.4 cv=Xtr6OUF9 c=1 sm=1 tr=0 ts=687675be cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=GwyZLW6mXgMdV13gveMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ti7ZZicFAMt5qKRNn1N6j_aKQgmqIlyM

On Tue, Jul 15, 2025 at 11:37:39AM +0100, Nick Alcock wrote:
> On 15 Jul 2025, Kris Van Hees verbalised:
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> 
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> 
> > ---
> >  libdtrace/dt_cg.c      | 10 +++++++++-
> >  libdtrace/dt_errtags.h |  1 +
> >  libdtrace/dtrace.h     | 19 ++++++++++---------
> >  3 files changed, 20 insertions(+), 10 deletions(-)
> >
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index 738597ed..0607cd4e 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -875,6 +875,10 @@ dt_cg_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_clause_arg_t *ar
> >  	 */
> >  	if (prp->prov->impl->reject_clause != NULL)
> >  		prp->prov->impl->reject_clause(prp, sdp->dtsd_clauseflags);
> > +	else if (sdp->dtsd_clauseflags & DT_CLSFLAG_RETURN)
> > +		xyerror(D_ACT_RETURN, "return() not allowed for %s:%s:%s:%s\n",
> > +			prp->desc->prv, prp->desc->mod, prp->desc->fun,
> > +			prp->desc->prb);
> 
> Ah, I guess these are the "default checks" given in the previous commit,
> so you can just set up the reject_clause() if destructive mode is on,
> and not need to check here at all.

Yes, this is where the comment block should start talking about default check.
The check has to be specific to DT_CLSFLAG_RETURN because we do not want to
just reject a clause based on whetehr destructive mode is on or not.  That is
done elsewhere (but in the future could be added here - as a future change to
the -w patch Eugene posted).

> > diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> > index 20672d3f..f0c1b8dc 100644
> > --- a/libdtrace/dtrace.h
> > +++ b/libdtrace/dtrace.h
> > @@ -154,15 +154,16 @@ typedef struct dtrace_stmtdesc {
> >  } dtrace_stmtdesc_t;
> >  
> >  /* dtsd clause flags */
> > -#define DT_CLSFLAG_DATAREC		1	/* data-recording */
> > -#define DT_CLSFLAG_SPECULATE		2	/* speculate */
> > -#define DT_CLSFLAG_COMMIT		4	/* commit */
> > -#define DT_CLSFLAG_COMMIT_DISCARD	8	/* commit/discard */
> > -#define DT_CLSFLAG_EXIT			16	/* exit */
> > -#define DT_CLSFLAG_DESTRUCT		32	/* destructive */
> > -#define DT_CLSFLAG_AGGREGATION		64	/* aggregation */
> > -#define DT_CLSFLAG_USDT_INCLUDE		128	/* could be used in USDT clause */
> > -#define DT_CLSFLAG_USDT_EXCLUDE		256	/* could not be used in USDT clause */
> > +#define DT_CLSFLAG_DATAREC		0x0001	/* data-recording */
> > +#define DT_CLSFLAG_SPECULATE		0x0002	/* speculate */
> > +#define DT_CLSFLAG_COMMIT		0x0004	/* commit */
> > +#define DT_CLSFLAG_COMMIT_DISCARD	0x0008	/* commit/discard */
> > +#define DT_CLSFLAG_EXIT			0x0010	/* exit */
> > +#define DT_CLSFLAG_DESTRUCT		0x0020	/* destructive */
> > +#define DT_CLSFLAG_RETURN		0x0040	/* aggregation */
> > +#define DT_CLSFLAG_AGGREGATION		0x0080	/* return action */
> > +#define DT_CLSFLAG_USDT_INCLUDE		0x0100	/* could be used in USDT clause */
> > +#define DT_CLSFLAG_USDT_EXCLUDE		0x0200	/* could not be used in USDT clause */
> 
> Oh yes please! I mean we all know our powers of two anyway, but this is
> just cleaner. (Not sure why you stuffed DT_CLSFLAG_RETURN in the middle
> like that, though.)

It just seemed like the better place, so USDT_INCLUDE and USDT_EXCLUDE are
nicely at 0x0100 and 0x0200.
