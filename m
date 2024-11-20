Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424282F2A
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732135185; cv=fail; b=oRERSZVukyughUJSApnxqwnO8BAH7k4OgCA69p8Zk3FqDkfBZUSJA2WtDHcqdJOwgXK2+Lq8CKbSMCK/JoStEalJmYGwmTj2O8N3gYDHopQR2fuAJQqNbgWLdCM7yMJrVeq62KzPwnYooFR0r/ls66eeyeMJRI85s7UXHjNjg+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732135185; c=relaxed/simple;
	bh=K4677rDtn1iNg1MCK1U5bBKh1wxw2/teyLKRRpK8xx0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FAd0E/i3q8QLMRz51f/DEQ0svdabRkWAsJQtT1te6eJPAEuba1Om7sp06HHBLZS0m+zFaymltHq83ulWx0ymWwU8rLU7JcB6SUsRaGMv8M6GfTTkrkW8JO42c/oGxHdKdzYSoXMgi4TwG+yaUieAdp4U4a9gTvrDnZkjZ5afbfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WPfLfoZ+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G92i/5Gh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WPfLfoZ+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G92i/5Gh"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKMbRA032618
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=IWbzcjOdZ45MPXBlm71X+3cht2+VI+VnMI7gzVyXN1c=; b=
	WPfLfoZ+HkKaQ30sMOPPGnheUXHvPX47phwYF9OzVfyp5uYl+e5DFXBN5bgsubj8
	dkNAket2wnam6KSbZyPBT5L2sH2g9CA9X9lPS5y5fKTUFu5RpmMMRHEcLYWNOQA8
	XTdy7+yBuFzn240fTHHUJiMAf5ROXvv7XXD1zuI8IhIAvXdOdXXWAmxuoScoSuRZ
	xEW7XTNDGOvwuFQakW/iBO1L4cS+udleNg44o5WyZCmpW00/1eqnt714lZO5NaNY
	IFSQW74Bwt5yYWIKODTvyFc9EFmw0FnkftT6zajfhu/WsO7oxEP554VCWRDJlbYw
	cChNCPYeNbduSfBsg9jrhg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xjaa8agq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:39:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJDSSi023282
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:39:40 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42xhub54uk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 20:39:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1+zJuwKir428PKhtPKPEu1p7BMwY+QxiQUICOF9MSV5aq6o0Y1S2VOsAGrvTytmTapkIjbdUIy8FaYNEWoFkIczk96q/qL2WP48ja6cINKwtQkJnlWUNzWqy1qlUz2vQV6sNyapg4AeJAIBTeM/tFsORLb15gKuvs2mMK7jpVIDSCc+wbCIPSSfP3/iuWVIXOzQixScz1zAj9bG/UbSvfj0yVnS3n4K+dsF9D3yHLC+gSyuxr84tKDrqpdfc3bGGILVHWOx8QdyrJGl+BZIGD+5sTzIp6RxdJseJRlxTEvV8b6w+FZAPpihNooJT6Z8p7jHyVqirjViCAvERBy1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWbzcjOdZ45MPXBlm71X+3cht2+VI+VnMI7gzVyXN1c=;
 b=sFPh8mj8fDVaaT1o09JZNxvmdGuhrFqGxi/KBxc0tmkwkVNHncrVONWBDoX27ReqSDj+ryTpJxN9pVsUwgCds3qEHKxreBLnnlgCawzYg+z8Z1FOvTVPTA/Z9/pw4qfKNcEbmqBt3Cnn81RNu4AQpojPZeyyyBWnpxkWtfPSC0pEu3HcIrM9AXLpflk5zW3OHrVN9vrfyFlv2eq8Ekmp7TACmKncpP6SpQ6vmvjGbBr5qBvtxZrQ2C45BkfVUMSkHCuCT1pyxvELPiZ6zXaAjAdQq4OVuZKkgn0juhtNSXCIGlFxCYeLNzTAucXxWvSMSwigqylLeq0bDBxxIzL32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWbzcjOdZ45MPXBlm71X+3cht2+VI+VnMI7gzVyXN1c=;
 b=G92i/5Ghp3rqYJdjzzkCXREa1oDBXfNWZMijTu6Vgl65c7Tjz1DOxtIyEySKJT/aBb4Nd875mO8VVLzu08Int2g5Kq79yOwfzHm7S5oZpHN+DCqNikeC5H2GfWp9brOBbrzJIIOKlZejTFneIVCZHTWpFymf7o1fxyERQfqbckI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BN0PR10MB5093.namprd10.prod.outlook.com (2603:10b6:408:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Wed, 20 Nov
 2024 20:39:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8182.014; Wed, 20 Nov 2024
 20:39:37 +0000
Message-ID: <169ad5fa-885b-8127-d1a6-b986e1d208b0@oracle.com>
Date: Wed, 20 Nov 2024 15:39:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] test: stack_fbt
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241107232841.28752-1-eugene.loh@oracle.com>
 <Zz43EAAB87FOttWG@oracle.com> <Zz46wQyI22cZMdFU@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zz46wQyI22cZMdFU@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:408:ff::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BN0PR10MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 823e26c7-e8ff-44fe-b4d5-08dd09a37317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDJPNlQvTGlmWjhKZHRGRGdFS3dBZ21wL2FQaFlVb0Jnamo4dE0yKzhjR3Y4?=
 =?utf-8?B?a2dwL2dUWjlidjJzV2NnR2ZvN2FUOXI5MFJnc2FEOGVyN1RjbnBNVktzaTQx?=
 =?utf-8?B?QzB4VmtHbzFFTWxpenAvV29xSXIwTXpWSjRuTCtBcDJPNWZuMEFGZkFleEpK?=
 =?utf-8?B?M1NhbVN3eENzQjVwYk5aZ0xKdDFNNEFjSHU4TmszT2gxTmo0QmJ3bXdrVkZJ?=
 =?utf-8?B?aEl0UHhWZU5SV0dXMmlNTnBxRzNkTm0rN3JQcnJudWovcVQyeHE4R3ZCYkla?=
 =?utf-8?B?TUtHSnZxMHdtVTYxQjBOdkFHaTVDMnRMc28rakx2WENlNDl4SzdZWTJheFBi?=
 =?utf-8?B?MUhqL1JCZ1ZPMnJ5V1pwcldFYyt3RFA3NGI0cE9Ib2s5SDNucUZzSEF6U01N?=
 =?utf-8?B?c0ZoMmhlZlJFclhUaGFsVllxSzgreGtwelpvMUFrNklESEQwYndPQ2FoZ1U4?=
 =?utf-8?B?cWx4Y3doVHFRN2lWUlIrdDVRTUtuOVZQRWwza2Y1NnBTc1BJMmRaQ2pWVjF2?=
 =?utf-8?B?cWdDVGdYeHhBczJGRTZEMzZTajBaUi8yb2ZqZ3c2MVc4a1ZISElYMXNGQXFF?=
 =?utf-8?B?REQvUUhLbWJBcmx6NzRvREUrQ0VYUTlHaFUwSGhpZ3JzUHFYSkFGM1NyMFFK?=
 =?utf-8?B?N1hESnBjRXlQc1AxMHVsSE9haVZLNnRZbHI3SEE3ZmxoM0RkeDYvS0Fya0NO?=
 =?utf-8?B?N25pTER2STZ2aThVMkJrMXA5TUtwSTZPZVk1QkNWYUJPV1dMZ3VqRFh4aCtp?=
 =?utf-8?B?V3lTdkVPSWxjR0lIVW1VT0Q5Y1YyWkMrc09telZnSFFZeWZqYlhXY0lNTkFq?=
 =?utf-8?B?SEpLQzNuZWVQdVFwWnU2ckoydDZiaTFrNGtUMXB3cVIrYitQbUVyNHRDT1do?=
 =?utf-8?B?K0Q1cm94SGhhOW5OWXEzMW45WFVnMW94KzlwSVNWZzBhKzBOUURHdW5jd0d2?=
 =?utf-8?B?NVUyczZuajVyaG9JNFBYVEtYUkZTUVlDalpnUVhadHpVTnVpR0RnaGdhZVVv?=
 =?utf-8?B?Q1NaUmFIcnR4VGdVaWdJZ3QxeE0vLzgvOHorek8rNnpFU2JtN2J6cXBzL01n?=
 =?utf-8?B?aW9CU0gwQ3BFTVVsWFlub2ZzZzRrZVJOMTZCUGd4aTRCdUU0bUNpZTFEWUVN?=
 =?utf-8?B?NzEwZHNCTVZ5ODQ0ZlhqOGFHU2JXU0JDaFlJRm85T0IwRDkrejA2QUU3d016?=
 =?utf-8?B?WFNTZ3pFN3lDM3NJdTdoYm5CZVJsZ0VQL0JjWWpKV0lNNlUySG5JSUp0ODNp?=
 =?utf-8?B?Q2RvRmlEZVRFTFQ2MFJOSHVkM1RKWWhZdzJTNVFnL2hDK1NQcHhwS1Q5cGFa?=
 =?utf-8?B?NG1kaVZ1OFpzWnUwV1lCejFtZjdMMDFUdC9mbzcvVUcwSXJMTGxNNXR2TE50?=
 =?utf-8?B?dHlRUzBqUk4rdDJkK2ZDcnhDeTRvTmFNRGVzVXBJc3dkdC9GTDhMUTcySWRr?=
 =?utf-8?B?aVE2eWlqcUV4UXlkdWU2a2d5SmhqY1d2OU8vVTZZaFZVRU9hODVTcGRicVQ2?=
 =?utf-8?B?UWovQTZ2WVgyOC9BUDM3bld4ZzBZajFvanpVQW9rcTQ0b1hBMTBReEVWMWhh?=
 =?utf-8?B?QUE4SWxqSVBoQk1abjlDQ1BKbVk2VER5YW5CTTRSSmp6NkNacUVzV1ZOT0l2?=
 =?utf-8?B?RVdxOThEN0o5MkgzdjUvZTg5a21jRmdYV1BCMXVFZEk1ellaTVB1VkY2ZXV4?=
 =?utf-8?B?YmYzYWVoMjFVNG9BQ1ltNzJQYVVldE9OOEo4enh3SDRnS0hpRW5LdFEyYUFE?=
 =?utf-8?Q?r7DBVXwJPLRPbmJBLc3tVDnRSHNfes+EhBH5M9M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ylo2M1RaamRTVTAyOXM3Q1BKYS9kYllENkV2LzYyZnQvbkc3TEFzVWIzeVBJ?=
 =?utf-8?B?elVSQS9wR3lheU0wLzl2RlV4S09JeG1xUU1Eb0crVkhnNUwwMGo1SUhmY2dT?=
 =?utf-8?B?QUFFbFZVL2JrV0hNbDJGTjAxOCtlcTd1OGxGa1pyZ2c1bXI2VGFyOTBpbDQr?=
 =?utf-8?B?Z1RTT3RTYU5MMlg0QktTTzdjZVNBdExjTk9vejB1R09JNUVFeGpPY2puN0p4?=
 =?utf-8?B?TmdhcjdUNS9CRE5CR1dLSXlBNnFBV05jcXdzM0RFSlJaWWF6N2VMNzNrV1Rt?=
 =?utf-8?B?K3J3aXdRTXNXaURqb0ZxbkJheWRFTnFPR0YrOW43NVRRNWd0Z3BVQ3ZyM2FE?=
 =?utf-8?B?OERpakgycmZ0cHFQa0ErQUhFZ1plVC91Smp6UjRTcTlZNTdidjhTcUJxS1FY?=
 =?utf-8?B?aUtwZXVHdG02Y1lueFpLajBlWmY5V1FkK2d6cXBWT1Q3dlRBanR1akVocGQx?=
 =?utf-8?B?aFM5UzIrNXB6K2QybVc0dUxDY1JvLzdIVC9sbmV6OVI0c1liSndiSk04WDlB?=
 =?utf-8?B?NVBNK1dFWTZEQXczUURGQlk4ZjBsUHZPdHFrV2ZvUDBMZUpsYmRZS21mZHJt?=
 =?utf-8?B?MTRxYWFXL1dFVzJDUVVNOGVreXhhYXpmMTBBbXo5VTFnTzJNa2tlRmdObnB2?=
 =?utf-8?B?QS9qdHgydXRvUEdVN0gvNm1uM2piMU16QWVqcFhYbWNlMld0SW9XT0hXS0Jr?=
 =?utf-8?B?S0NLb0EvL0ZpMTJGVHlWd1Zvb0N6NU9PT0I4dnlXOWp6M0ZDZUNtam5ZUGZy?=
 =?utf-8?B?a0tIM0t0aWFxWkxFejkxMCtrOTdpMDRHRlhlM3h3Z1dXck1XMEYxaVQ5ZGpt?=
 =?utf-8?B?b2NCdVZaNjNyRTNrSGE2aHB2bXU2Y0lEc0lvZ3ZkanA3cWJXc3dwMVJqMnFT?=
 =?utf-8?B?WG9hQkRaUGlSV2wxYlkvZU9UMDJ3ZktSSjFjTGRXVjFCL3dEWHdITCtEeVpV?=
 =?utf-8?B?b0lqZW12SG9nT2NNcHVWS25ZUkhKRXczanc3TmZGU0RQZXlxMjRaOWZFWkZR?=
 =?utf-8?B?ZmlPWEd5NTdHeUJCeWxscG0yN1MwNW1WM2tXOWxKc3FjVGt2dktDaXhyT3Vv?=
 =?utf-8?B?RnBhL09nbm94MFV0RDk2aUplVlRpNlljR1MxaHlHdk10UkgrYzM2cUJMS3pZ?=
 =?utf-8?B?S2V6cDY4YWROQm5EL3hGRXN4dzhaZ2RTaXdSQy9XVGZVV1ZjelZMT1dqK0dp?=
 =?utf-8?B?bjhCOWhoK3c5U0MyRkRKcXFFWjA3cEZhbEo4ZEJlL3dqeTFyM0RyU3RFdXZj?=
 =?utf-8?B?Z3ltdkJoUVU4TmlYeTFSRS94QTJ2S3lpYlEzYjRWS1BDeldKeHZxL21yWEs0?=
 =?utf-8?B?YmVVWEVBNXlwWG9sT3MxSUhGTUU3NitTbjhOblBBOC9GQmw4YTAvRW5sVko3?=
 =?utf-8?B?VjY5bWhEY3VUekJEY2JjMVJkbkxDempFRVFxSExqeTQyaEg5K0paOUhJNjE1?=
 =?utf-8?B?TFB4a3N0MUpqQ0lsM1Joc1QrSkEvWFIva1NpUmpQM1gvRWpSWDZCaDFtUG0w?=
 =?utf-8?B?aVFWcWRoMjluUjJUdCtNQmdvUC9FeDcyc3NWc0UxTDBEWGRKZ0ZSeFM4NEhF?=
 =?utf-8?B?L1dTSVRRWGtNRTBVd2pTMjhVVjJadjJnbXQwVnYyU3lZeUdVMkFuai9vVWhj?=
 =?utf-8?B?NEovMk1NVDhTMTN3c0YzeTNrbnpwODhsdXVoT21ici9uOHVOZHZIUlVaU0ZT?=
 =?utf-8?B?Y1kzWDg5Qzg1NzlOSUNVS0c1WTZNS29aOElBbUt4d250N0d3MEN4Ykg3VlVN?=
 =?utf-8?B?U3U0Q0xWUlNIWitjYytiNEtkYlowUWdZdS9IL3JaNTNNRU9hT2FzanN2VThO?=
 =?utf-8?B?c2orb1BPQjZkRG4xajIwQ2V3Ly9FdXhwd2tJbmc2T0laMGIyRnZOT0lTeERJ?=
 =?utf-8?B?RWVOQmhrY1VhZ3d6MXhFRjkrWFlWWFZoYTU2R1NOek43Z1NSNzBxMThvWEsz?=
 =?utf-8?B?MUswMkJVWGhNZlozdTVid0dudTBPS1FVYVBrSHBlRFgwTU5PZnBGSWhxbEo1?=
 =?utf-8?B?Mkh1TDE5L1JUU1JHcHAvckxocHY0VlZkQVZOeDJWQ05GU2NoRDN0UHdnT0Jw?=
 =?utf-8?B?V2Z1Rlh2dVdLa3laamtVQmVhaE8wbmM0TGNIck94czZDTkhtekJ0RzJRWlV0?=
 =?utf-8?Q?gK0yp7SgeZMJSyYd0CykcH6pM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jnSfXGOXkwCxCmMvQXT6abN+Y8/nSriVMnupQvjjbmuRmoB72EIRRKC+2vsdG0Jkf7txZ8/cSbUB0FTLrOAN4x3oHqr0cfPhzo/GKqmA25qIS4HmfTP3+OMl1ScTvxlRbWAx5B+ZXFe/dP9TZwN2l8vxDm28Ay5aa5TurEB2lRlfDJspmdnBsTzvvj6HgH0sekryB6CmV6IYDF4j2TcMn//upxMmmRkjnyzYgN+NTYTXE+CDbA9essKrJ6W7XI9TH/cT2tcpF8DBU+Ts0cK5WezoSpW+Cxh4TrysUyjXC/UPcV/Q4BxylTfi+9BEBp35Gg0XeXQkQ/wkW9l8Kl0/MoNUXEkbAv3tMhT/FhiLPiziFVbiObNaHY3z+FlB3qPuVw3x9n97RWLyvdg+SqIA4J8vyy/FGhma22HOg2VbD07FXksTwcmopp9RQNudj//zKablSapGF83Eb+PbYNuD+Z6OhtwHe67yDYHgsG2kJZQnR3WrAwAM8WbOpC+EDXBB2M5D9sMnOcZDTKubePH8GCoSdl7HIglK/5wUoDQyrMwtuh9havdlIM2CtVx0Bf0vIjZGhE+cSEXpEKf9eMkOTAjHQvZ4Ri49sTtKkd2TjgU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823e26c7-e8ff-44fe-b4d5-08dd09a37317
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 20:39:37.3697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuzjHEeBo0fzO1E+sp2kJ4mEPcLlS/YINUQnUg3l9grNnnkCZq9j4jW6bz3NL/wd66PLMkJhZ8LxFyTQ/Xhz6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_17,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411200145
X-Proofpoint-ORIG-GUID: jg2lvXmq01r4tMCzOFnC3Px4xRvRpcKC
X-Proofpoint-GUID: jg2lvXmq01r4tMCzOFnC3Px4xRvRpcKC

On 11/20/24 14:38, Kris Van Hees wrote:

> On Wed, Nov 20, 2024 at 02:22:56PM -0500, Kris Van Hees wrote:
>> On Thu, Nov 07, 2024 at 06:28:41PM -0500, eugene.loh--- via DTrace-devel wrote:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
>>
>> ... with small changes as shown below.
> Also...  the full stack output comparison is riddled with issues because the
> low level entry point handling for syscalls is an atrea that has changed a
> lot and still changes.  E.g. this test fails now on a 6.8.8 upstream kernel
> because of the following difference:
>
> <               vmlinux`entry_SYSCALL_64+{ptr}
> ---
>>                vmlinux`entry_SYSCALL_64_after_hwframe+{ptr}
> Maybe it would be better to not bother trying to test the full stack trace
> because it is bound to keep changing and we'll keep needing to update the
> test to deal with various kernel versions.  After all, we do need to be able
> to pass tests with upstream kernels also.

Maybe.  Or we just bite the bullet and add more cases as they become 
needed.  After all, there is a framework here for being able to add new 
cases in the future.  There is the usual tension between simpler tests 
and more rigorous testing.
