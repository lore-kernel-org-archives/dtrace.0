Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3E1C2BD
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576290; cv=fail; b=luJ5s++ZO4oopBXfYQJX8KXjSZB0kV7gJH3gfrqdfieRrh9Xat5hSky9NVo3KwdsLEozIx4HSSdlsr2K/Oziy0wfKF2AMB9NYEkDEWFKYb3LdaVdd3m+Uy0sgfLIyU27/u+wkKpc2KtidzGSJ4BHUVh16mkvAfBpCrE5kxTC27A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576290; c=relaxed/simple;
	bh=bvVAVfufyFn+NL0xtXV6RQeR9fqoa7mAkrcNvjKhUJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EUEG+7liUffADab6191n0o27xmeLMHUePkCHLp+gjURV2Nxj70GgTFUI37tmOSadQ7OO4ceJ5o/Vw3u6MBv50rJGuoPJyfVHP6yxlr6umO8W3EqHijRv+dnURjuQsU4rgYIE7TfJG8FAc8hQGoMIvltHR0weyiCCohvdXMVqja0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k9bgdp5C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lOgZbSSZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k9bgdp5C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lOgZbSSZ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723fxS7031717
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=JAXc5rlhjAgUi4L
	xy9tLEg5snoXHoHF9vHRd90yhaxE=; b=k9bgdp5CDHW5n6KpZaYBFLP4zREjjDQ
	4aIjnxoOQU+bhlS+whsQxftAYrZWorU832lnckfa7G+8DNsTXn8LV4ZoTgdYTqe4
	BG2329ZKzYLUQa0RDjavoG24lYuBI8JH1mxALd3IE2t3698O8pZ4fFHh4DmKxOfo
	yLsndZ4eEMjeWbRmk7x6+qKkj28cakecKANXT3+MdkEWs0EW9SYKk392jwkn2tpP
	QR87CPJAFazgSUt9znsEfv2sMWYcoqclVKrUrrRf7bjVL9550eFYnX4i6cLusDbl
	H/E+A42JBel1D0E/awZfYML5gbRLR0k34oNAhgG08m04ufrW7Xa4iUA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje1gdpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:24:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4723UtSK040126
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:24:47 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40pm86v3br-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:24:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZFcFTCBOBb/Y3zQ5a/QaCEe/y25lwu7O79xTVlIntkDLBhIFFFOU2inJ3DiRKfBuHgpV6Rxgv93JspP9OT8CHk4p8qKOl12SsCWlaXSUo5Byh7ij08kVYoNlAqcE+h5chHzDdJ1ICKZOlTnSjbVwKTmMJpYDDBec9kehU/2ok/nOwJA9MtAdtzENMQqcyGk4ZJFa42CoduFfjGhurKFZr1+GbRJpCsYCGG3ZgAEvy0X5iTOV/MiHKckyo4iLQmmvpaa2jXtiJ/HWJqKtJ7gcOljT0gpWXJzPlitPpoyJ0onLLW9NoEh2uFtg1LQm3dilmYJ2g88OtzAILJiNaWJOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAXc5rlhjAgUi4Lxy9tLEg5snoXHoHF9vHRd90yhaxE=;
 b=PNI3H/PlTcTeJJpKUzDRPMaUXwq+NyHJ5kS4DFCTOTLcX7eU5gLhvFUCiZ4Zi5Zmln1P0Oj3qjn4AtKzxUIaPhElsCoMuRqjLNj1qhQ+RD7G7CuqNlm5FUEgUGk6tdfq/U7Z5t5UwCxpUqgRq6A+k0pjakM/6cDDOn6NH+iG+Nx37wPZhSaP6duOSbDL5bzfuczxh1+0eTmqbU7lpU28tDrB+nGDpeIbjhOYOfQEFddfSADNOgwC2e/1eVnIHgK+r/4zMpEmzZkyjC5BdU4HptjcHdARLYAjKmc4MANy8eMhA9l4uQDi9KHEDKmIkHYqD3mlCWGb1t9oBESNuc/APw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAXc5rlhjAgUi4Lxy9tLEg5snoXHoHF9vHRd90yhaxE=;
 b=lOgZbSSZtlkBPsJYl/pmk+DV1/E8J8SswlTd8vvJXY0q5HHtaUgcT/i9a1F8s9Bw9v1tWeJWAVjOqpILwEyG3BGwUlyqmR9PMWp2MpaFuZeN2woJ512ouXu+wf5SgbId/xBvjfPAgkn2xlsfm5zo9hQ98WfynG5873skkNcw2Lo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB6777.namprd10.prod.outlook.com (2603:10b6:930:98::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 05:24:44 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:24:44 +0000
Date: Fri, 2 Aug 2024 01:24:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v2 2/9] build: initial pkg-config support
Message-ID: <ZqxtmQ3u1SXqjJwA@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
 <20240801132156.286780-3-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801132156.286780-3-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:208:329::10) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 23fda101-90c6-4984-1099-08dcb2b36ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?psUnWu4EosHdiy54vvAp/IOgAm0sRCok5acuDAOG0GcV5bbNtViBqZiUoCOX?=
 =?us-ascii?Q?YJUK0pUNwXFNk0aWEQO06QQtRjHbPAFjER57HR/E1KkSfchuhuZPUCtbRzkm?=
 =?us-ascii?Q?kTBPEObMv6qIROoHf2QooGo6MkNEkKa33XS68vv7sl3f9SZ5NJEXQKokW2Hu?=
 =?us-ascii?Q?K3vgnqmV5k9J4kLGTZ6pNe1O59uEIBLxQp3timiExlxGbmPKyLtTRDL980of?=
 =?us-ascii?Q?sH5BZsMCVKcqflr6f3fDDzLyQlJB03YdRXhcyM4Cbs/wv+PqMZypSCTxua/h?=
 =?us-ascii?Q?g57n2ch8pRVhNXMRO5DtK+NQVRQ7GyLoOKJMXTSYYYIJLg3ae3e/wVvai6cZ?=
 =?us-ascii?Q?c/H0QO1Gyhr4kQaDswW/RqGR3IWxDCCdkbMZpUwbAAXsR1/VP3Un9jlb2kEx?=
 =?us-ascii?Q?jxTrUb8znVKDGnopir7IFyqYuUaOCH/ArVCzzqsq77L5iSQdhrsdMpAtHmCO?=
 =?us-ascii?Q?BQgBO4uwQqJyaj/uM8cwzPTfqcHQ8EMtXP7YgyNrio17+tslSx029CHmlJv5?=
 =?us-ascii?Q?Fzp7MBDOsEuXdOyLjA7bOXM1LxIj55GF/Sp0ARbeX8cHfaFbLONd+BmJSdNI?=
 =?us-ascii?Q?o6HiFSp2jstJtHzgQb0JLAoAjYqYb1/tvOa7MfuiV68bzAOM5Ww1OAZl3rBV?=
 =?us-ascii?Q?HTuD5w11UUdcduyq2v8Fi8wfN2IL7W3In4YUcIf9dMBLX+H5LzX/bTjXw4x5?=
 =?us-ascii?Q?8rJbLQaYKreEOx7bayDTsdrnvOMlTbqX9ovQr1BvA7BbGjCMACResnELtW3H?=
 =?us-ascii?Q?HnNfEZ/iwLxzStofBB3G0HQsiCKPfM8xdoqDzms5VPXzuaaZg6rrpcL5wUTA?=
 =?us-ascii?Q?nKl5lfRYdne5Bk/JOskveFmY2JNny9pddj6hAoLIQxL5D/iTj0sCqxw4t0jK?=
 =?us-ascii?Q?LeBYhKSuBawEleiPyvejC+bNztuH3MTNkIYTZ7+3Y/201ON4XOFMofEiFos6?=
 =?us-ascii?Q?+eDWLbUqRDtQrwN70nEV0zpQaxL1tYfB77+AXWkI/EyER4VI36zkFXPa1J9k?=
 =?us-ascii?Q?TrhQnxuk837LRJCy8ZB45UtdE2WrIAtDBSY7wB31mv5YEN8+NZ9Of2psR4QN?=
 =?us-ascii?Q?FxxQPu23D0HDOTYGaMSSE9sBFJOIlliA39kzLDnjPJG5XaL6SfNSz20B8+br?=
 =?us-ascii?Q?iY2gRC13AdORRKd14XVjWssECal8Oh0usy8O85iuLOk4bKxWETrRppOpZt2o?=
 =?us-ascii?Q?gG83QlQhOyuSqeuLR1kZv5MpK60kE3VEwqwN0N3kse0bKBR0l0JA6XR/Nveq?=
 =?us-ascii?Q?3pLEs9IsVbVHkWvrD9UuDejH8v9oYTyFGxT17xE0wvNDMLEUWW4oxUaZ7Qiy?=
 =?us-ascii?Q?71yExgN6rFcNaLAGq8N7yGm9i0kRtwVhZuclIsYpe2jlaw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Yy5B+/lNsJXJEB8kKgZZmH+40lY3VzNgep3Md+Vn4ha530sBK4dCCpNfbK3?=
 =?us-ascii?Q?P5phTWAlIDh86XgdPNooTHZKfm0SsfhWxd7aXyapJt0/Q9GYxL4ElbEsW8C+?=
 =?us-ascii?Q?OYU/tNffthlFYczb9nWJpheLXlQNNhD1ZXep04p2CKlF/IiaB2ipaHOHd0m5?=
 =?us-ascii?Q?RlNocuNxaTvPIsZG5NbZCogfdpZSs8cJEwzVMJYcxPNj+c2KiPjaZsEnvgD1?=
 =?us-ascii?Q?VdFG4vcb29w+savYVfKrPrXYbwNWh66Rr9fFWLGXAipJ3QngskcrBzYUCFYP?=
 =?us-ascii?Q?DTM22tmhPS/LTPK2CW7/+u+Pe0Y9e16vPIwPF8vfxJIhWpWhlx1L9Ge+gF0o?=
 =?us-ascii?Q?yHSBsEeVLpMYMbx42CHEITPl/9sNNqv0hkkWqHM+Y7gqgriibyWyoL0yv8PG?=
 =?us-ascii?Q?COQuN1WQwZgQov+Fn4cqtc8Td4tIHhsCTTDClP5GTGY9HK8k6mh0aCBDJ2m9?=
 =?us-ascii?Q?iRC6VJUgBsUv1QzukivZNCyBK65vSLmeFybZiG+M2TN85LFmr4UM8eZYZiUl?=
 =?us-ascii?Q?6aXmZAevp5qjTeRMy8oDcu24cvI5LHLKixbvjv9p+nUuB9a78BqmtJj4LZur?=
 =?us-ascii?Q?Mn+IUxaOPIFf17IXujyMx9mZqWtFXp87NYehbnMcSGL1v/1N7UZE4h8drjYj?=
 =?us-ascii?Q?9N3a3yVodn024PFgqmnhiM2RZdB7drR/PiX1XhlUXbi2UY6JtSPFVIKwOqH3?=
 =?us-ascii?Q?hSIBGjAWj0X/iVZnThb1RHXMdrbPgXj9VA5AiZVhSaWu2nivDD4/UJNBtVKq?=
 =?us-ascii?Q?yXWOWTn0V88b8c74kN/i6H+JCjCHx128eu+W24PR76Kaprvxhy4byQ6oeCS4?=
 =?us-ascii?Q?lBipVVjJs8R9l2dLjB/++TWO37UHeEk7VAI9bHvLXj2if3jgYxDKv3cgLLPZ?=
 =?us-ascii?Q?GvyQlvN7ZQFzR3OtrnHFTSgO97b6I52fOJorFP9qeU+ADlCSc3Ny6jJE2hC9?=
 =?us-ascii?Q?F7mSm0tpa/NayYMUKRDkQlerNePguPdwlwuVaY1w2j2Xlf7oAKqq5wcXp222?=
 =?us-ascii?Q?4JNzO+kD66z3AjdyfVNkDLUFLROqhEpjygT82XRdQh/GpaPk0dqrJOqSwlwo?=
 =?us-ascii?Q?Phn5cWZQIgn0CXCEgbQ6+VrhnX+KSILqc9sAsn03xVygnwL1m9uh5QYVeTFZ?=
 =?us-ascii?Q?0x4rta0FJlgah4gfAcQs1IZD4MDyUlNIG1PwWBsTANobxPmRQZa4msQPoLlC?=
 =?us-ascii?Q?C2h9VXax0iJry2RAdlkTIcLgl0ScSfQemy4n6xhyohixaOaaUOoOBMMo9Q2G?=
 =?us-ascii?Q?8HY8L/W3IyKWF7knvPndyd7sKl6B1F63gstT5gbae32VBUFA2FRMC+Z2qZjB?=
 =?us-ascii?Q?UJwx2sTNGZ3e86RkFmTCLZoAjjoDV5P1cwOwMa4Ceo9hscdM1cqBEfEkldfW?=
 =?us-ascii?Q?wZdHPl4Cv7GxkrvxgNzH/Z2F1w14k3KNVSF/bOLRID41OtzKL/jh6zrrf3lj?=
 =?us-ascii?Q?WffB4FgKSHGI7r8Ijhd7/qV+2sR2egCg/PjR+uDT8rSp+JhYyardGGOe1Q5L?=
 =?us-ascii?Q?98OPKvVnmQUN7mgJK4kgDc3kYIZeLN+pedOX4VxEpHuJUrGaueTzPYWgTmmw?=
 =?us-ascii?Q?HKV+SdtXwpFgfI2X55MXZTQCrJgyq4qsbU3+gFmsA+JXzC7bptCw0Z5tH5Lx?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OZ9kZRhTfjK9aXjyQ93sIf0nKiuxicEMovqWBOPRFPiGGzB4ILwYnp4/sBSX/QnHNormqambboE/RTC+vXGv2jCWBxlnvsyITUmIIDCo+P8XkfztSP8tL8hspJTWE4OpQ2SDTWj1/eYtPETibbVS9jo0luDtq1sqDH+reW3BSC4ktpHZqoowPwhnsuFSUk+s64P/JpFQqY+FeNK+D3SSYp9f4YZK6P6K3fVoHsMa6UZk5OCR5ifCH4vZ4S0yJdcjNoxBZsUalvCZwNqsrgYRM0jnwEGWtWU4qma3Cf2bxz/aQwhEjZYQ3TSvLDj7JylA7Im3PK8MiZ++dUPb1BMuRI392c/eGjMy2RdMAoW2OgOc7JsPzk+cgVYNMbey1FE/ihmrv8v9WquTS90TObxM+NVrDeapp7wPIKrJVseVhYDlxsz5XHSQZOst2QDladIy3lS+w0WI7Y6MSjfY3zt2g9lh9S9IWMf9evLGSkDCCAY8pS/4iDqg7TvGS3EHsaxCADNitrL9DAKDiTkRW53oKtzldQ8QTrJUDv0Le2eXL6yLYj3y+zR2kSZhAGckbkE14Qdj0pkP9Bar8b6hbx5bo6nD7r5KQaTagBwqsBT6ggM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fda101-90c6-4984-1099-08dcb2b36ab7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:24:44.0021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91N92/yyuMVo86n9peYgpH0BaG/a7IeWjxqU1+Ci6Hcr9PeI+Dih8fhQkwZZUrhqAGBi2/yOZHTCSRQ2n8fOhvSSjwvwrjsVuU1t6DlU1eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6777
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020035
X-Proofpoint-GUID: IgigpIgDaFRKMyF_-UjJpEr4xNDUBZWZ
X-Proofpoint-ORIG-GUID: IgigpIgDaFRKMyF_-UjJpEr4xNDUBZWZ

On Thu, Aug 01, 2024 at 02:21:49PM +0100, Nick Alcock wrote:
> This initial pkg-config file, dtrace_sdt.pc, points at the location
> of the sdt.h include file.  We immediately use it in make check in the
> installed testsuite, compensating for any install-time changes in the
> location of the dtrace libdir.
> 
> Further changes will be forthcoming to properly support relocatable
> installation.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  GNUmakefile          |  2 ++
>  configure            |  2 ++
>  dtrace.spec          |  1 +
>  runtest.sh           |  2 +-
>  uts/Build            | 14 +++++++++++++-
>  uts/dtrace_sdt.pc.in |  6 ++++++
>  6 files changed, 25 insertions(+), 2 deletions(-)
>  create mode 100644 uts/dtrace_sdt.pc.in
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index b1109727dc66..0fc9b3b5e85c 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -100,6 +100,8 @@ DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
>  INSTDOCDIR = $(DESTDIR)$(DOCDIR)
>  MANDIR = $(prefix)/share/man/man8
>  INSTMANDIR = $(DESTDIR)$(MANDIR)
> +PKGCONFIGDIR = $(prefix)/share/pkgconfig
> +INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
>  TESTDIR = $(prefix)/lib$(BITNESS)/dtrace/testsuite
>  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
>  TARGETS =
> diff --git a/configure b/configure
> index c423bc82b763..462548bcc69c 100755
> --- a/configure
> +++ b/configure
> @@ -60,6 +60,7 @@ Installation paths:
>  --sbindir=PREFIX/sbin				Alias for --bindir
>  --includedir=PREFIX/include			#include directory
>  --mandir=PREFIX/share/man/man8			Manpage directory
> +--pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
>  --udevdir=PREFIX/lib/udev/rules.d		udev rules directory
>  --systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
>  --docdir=PREFIX/share/doc/dtrace		Documentation directory
> @@ -130,6 +131,7 @@ for option in "$@"; do
>          --systemd-unit-dir=*) write_make_var SYSTEMDUNITDIR "$option";;
>          --docdir=*) write_make_var DOCDIR "$option";;
>          --mandir=*) write_make_var MANDIR "$option";;
> +        --pkg-config-dir=*) write_make_var PKGCONFIGDIR "$option";;
>          --testdir=*) write_make_var TESTDIR "$option";;
>          CC=*) write_make_var CC "$option";;
>          CPP=*) write_make_var PREPROCESS "$option";;
> diff --git a/dtrace.spec b/dtrace.spec
> index 28eeaa478376..1887fcadaed6 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -246,6 +246,7 @@ systemctl start dtprobed || :
>  %{_libdir}/libdtrace.so.*
>  %{_sbindir}/dtrace
>  %{_sbindir}/dtprobed
> +%{_datadir}/pkgconfig/dtrace_sdt.pc
>  %{_mandir}/man8/dtrace.8.gz
>  %doc %{_docdir}/dtrace-%{version}/*
>  %{_unitdir}/dtprobed.service
> diff --git a/runtest.sh b/runtest.sh
> index 3bcd676ea788..cc9703e12c16 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -579,7 +579,7 @@ else
>      dtrace="/usr/sbin/dtrace"
>      test_libdir="installed"
>      test_ldflags=""
> -    test_cppflags="-DARCH_$arch -I/usr/lib64/dtrace/include"
> +    test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt)"
>  
>      if [[ ! -x $dtrace ]]; then
>          echo "$dtrace not available." >&2
> diff --git a/uts/Build b/uts/Build
> index 864b2dfdacbf..feafa21369f2 100644
> --- a/uts/Build
> +++ b/uts/Build
> @@ -14,11 +14,16 @@ SYS_HEADERS_INSTALL := common/sys/dtrace.h \
>  
>  # sdt*.h are used by programs that contain USDT probes that want to define
>  # probes by hand rather than using dtrace -h.  SystemTap has another header
> -# with the same name, so we install these out of the way.
> +# with the same name, so we install these out of the way and provide a
> +# pkg-config file to pull them in.
>  
>  PROBE_HEADERS_INSTALL := common/sys/sdt.h \
>                           common/sys/sdt_internal.h
>  
> +# The pkg-config files undergo a few translations with sed before installation.
> +
> +SHARE_PKG_CONFIG_INSTALL := dtrace_sdt.pc
> +
>  install::
>  	mkdir -p $(INSTINCLUDEDIR)/sys
>  	$(call describe-install-target,$(INSTINCLUDEDIR)/sys,$(notdir $(SYS_HEADERS_INSTALL)))
> @@ -26,3 +31,10 @@ install::
>  	mkdir -p $(INSTSDTINCLUDEDIR)/sys
>  	$(call describe-install-target,$(INSTSDTINCLUDEDIR)/sys,$(notdir $(PROBE_HEADERS_INSTALL)))
>  	cd $(uts_DIR) && install -m 644 $(PROBE_HEADERS_INSTALL) $(INSTSDTINCLUDEDIR)/sys
> +	mkdir -p $(INSTPKGCONFIGDIR)
> +	$(call describe-install-target,$(INSTPKGCONFIGDIR),$(SHARE_PKG_CONFIG_INSTALL))
> +	for name in $(SHARE_PKG_CONFIG_INSTALL); do \
> +		cd $(uts_DIR) && \
> +		    sed 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g; s,@VERSION@,$(VERSION),g' < \
> +			$${name}.in > $(INSTPKGCONFIGDIR)/$$name; \
> +	done
> diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
> new file mode 100644
> index 000000000000..c5506f9355d9
> --- /dev/null
> +++ b/uts/dtrace_sdt.pc.in
> @@ -0,0 +1,6 @@
> +sdtincludedir = @SDTINCLUDEDIR@
> +
> +Name: DTrace SDT
> +Description: DTrace raw SDT headers
> +Version: @VERSION@
> +Cflags: -I${sdtincludedir}
> -- 
> 2.46.0.277.ge12b8151ed
