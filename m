Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B761DF721
	for <dtrace@lists.linux.dev>; Mon,  6 Jan 2025 21:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736198058; cv=fail; b=PqOIUtv1zvHONn6Nq9dLS8hMArDhF05pb1RRkyhkuPiEy65aHuvf0+VqcY4MybYq9FOOEpuCx3awns+7hPnmKvQVkaovRAQhDduq657A9M3Zshg8ESAP3H2VQO3RXT6EjJ2vS7KyOQsAjb90uNVEDgSe3ulDGPrdqXMiRIpf6P8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736198058; c=relaxed/simple;
	bh=BKePYrPncG3HyuyHjuMpSKLuc36mAuXue1AMYzOV17w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hk2dhzwNAB9cW6RbqTJt4bSXPEW5T6j9Zl0hK7D+SWyjuacjAtKwg/Jco1yJi5W2x94XM3QZHxxEYf3UeLEaGZNn7och9W0uSHGWCnLQqkee55MEK5I9aWZPGIBTqIqNBiwsSf2SVrO+hrOc+QcWdPiJJZRGB4NMZmM382Fe95Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TDONXBrQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FDi6+TYR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TDONXBrQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FDi6+TYR"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506HtiYJ025633
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 21:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=rlQP84cLF5Zk/TdYed
	bPyGtxHy0LxXmaSk0OB8BPzQs=; b=TDONXBrQGdpAzXGc3evaLhcOrz+OuxVOBK
	Pe0CYWC5XMe72F6K6RTo3kqYOkUEO0Yyi17RwJik4vYk//Bb6xlcFqvrqjwWK2sq
	fSO7BbWUoUsiHpx8Ls++eNg1DLfgbc9JkdPwJy0mSoN5K7opBna9WrDThnoVdBhj
	77CWff3I4eoEjG6QvYr5Hb9rhVF700g/fQ8yDxtEqIyKJTA/Ctn6t6W0zC69tp+T
	iF3jRYNctobPzwa4H6fP38QKkhopnAUOMDspczLnYz11hl+w9rSi46zTG52p+52K
	Uj5icHscGDoZ9N25ehcsZ7xL2ZR/Yc5ozgk4rJQt1moNTe89FoqQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2bfda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 21:14:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 506K3vEs025483
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 21:14:14 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xue80608-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 21:14:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2IRAz79BRN59bjEihw0BBDAKkAUBtUljfmPD9KHnmDPTcQl+7ShMCzzouL3eEclYdEqcNoQPBqzxTJwn0Y2EzH4/CROP3gIBSeac7tCen1SYWq85eUUH7wkjGb4VgJEh/S3uc2FF0P6rRYCEj81bPINc9Xoe14BjMI15N3LFhG5OMkBrO4OA7Rt/cotPKQr9i/AsHGFVM8IE4sBfCLvsPASH+uIaq8Fb/FQXUGsQo9rgSHuYQXb2as9fjcTcInLhDEFQzUGeXvvWWaUNMzHCInnEQet+i5J5+6OAQcGscUXY12ORi/AjkDUYQkxSJosJqfSW0uvBrvBffwKptDZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlQP84cLF5Zk/TdYedbPyGtxHy0LxXmaSk0OB8BPzQs=;
 b=OKHluswoaZ39HXBaOp0T7cycHxkOA9iCcOwts5/Y3qbRVkvYykZd7wMreAJ9dlwnpvuqy8n0Gk2jzccrQsSQGtxoyTjeFNOMM23VxJA7igRF1JM69wVHueNF5OxIgmuJvLQO7sCrLgHaET8PcTZoJqjDZw3EHCoXOKOdk73R/tJYRBCMYWqERfuj9K0fHi3Z83WORA/vNNA5r/uRZUVCSKcl+UxA0MBcmICSziuMUFgSl3Cly3S+Ua5WZaNtAKj4r2atQ7ay7VLggfP1A55XdP/2wnPNL9TXcvEJyxs8lxfZEw1BgCFBXiowdjPrdzDpbxCAGGiao6ME17i4R8UmKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlQP84cLF5Zk/TdYedbPyGtxHy0LxXmaSk0OB8BPzQs=;
 b=FDi6+TYRLbgUHoTUCaAeLvqrZ5hNM+QjG4+SKNziw/NFwYvvbWbGp7VS5/emXvKLYi3k27ee5JtgSL3nyuSFBZOflhYL0owVFvXUqa0kiHUnW1uqtFlRq2NL3MhDZ75qY71Z0jFtoruXqd3AB4jRR/w1E9ZX+cSapIi0xfrMu4w=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH4PR10MB8147.namprd10.prod.outlook.com (2603:10b6:610:236::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 21:14:07 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 21:14:07 +0000
Date: Mon, 6 Jan 2025 16:14:04 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Have USDT "deferred" tests wait for dtrace to start
Message-ID: <Z3xHnOxgTYpJTosG@oracle.com>
References: <20241210230202.16603-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210230202.16603-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH4PR10MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2d45cf-26cb-4cd8-28c9-08dd2e970e53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T6HlghvlKIcVQk/PJNqJsCEV+2xW1Oej0dIds381l8f/yMjSMGDvLLul8Ish?=
 =?us-ascii?Q?9oX2ktyQhT/Ce7YU4ZHqbY8ufHspsF7SCqeXafpUlwGHVdP6QkmTgngqmG5f?=
 =?us-ascii?Q?+yKphF0RNrD0ccsnKAX2cbXLYtx+h5FeO1jraTDW3Kp4jvtsuIgIQCiUYYbQ?=
 =?us-ascii?Q?Ccj9oNDubLW1VoxfbIX4QnQqV4cxEuklmlVsXyIKwRx0bLemVU2JNBZkFsxL?=
 =?us-ascii?Q?RLk/r1Lmphz9DruFnYz2tPEWtb54oiN7Xwe8wbvQZhtWpftdNVEk/aanCzOR?=
 =?us-ascii?Q?/QYjhlainKINHCO5lbztbjwGAIrXbie7GeDXF3Yz8Qf0UPRatrmcJRZTGamt?=
 =?us-ascii?Q?yZHlvUAq8VkW4v2i9ku86/MTOwj5oKva2BsxDtk86aT6W7sgaSUCYkoou4Vj?=
 =?us-ascii?Q?fl3eKIQ/DKYBrWf2MUsmwlV2E6DSzMSU0GT0ktGp9ucERpLqk9Hp2ncD8Cii?=
 =?us-ascii?Q?e4YWoLM3Wy6cnxy1qYqRGA+Tu2iajJYcaVWD4xyWkw8fmZRqMJQ6bT5OE/It?=
 =?us-ascii?Q?ZJS38GD9cO4BRB391Priz7yKcN4kZTwL/PT4LR6CrP/yJDaUyrlWiIAKcikF?=
 =?us-ascii?Q?HXyPJF4AlPV/wWNifUlmDfH1Cnj6BlLkx6nw9kmTmj5DX/S3/pYJE2e+rwI+?=
 =?us-ascii?Q?MVHsPcdi0Xtyk+cCcqvqiaNNjj/tYb+tOvODbBG0NttKBVMaYnJJgJrR5cmW?=
 =?us-ascii?Q?11unVXTngBVCdRyfzN/bgFOMO0AkHPWixesB+5v+44F/Gg7PseCSx1HCq8Am?=
 =?us-ascii?Q?1pC+tNJmyWofIvJDJXX4/RgdIJOfnfOvmiaS6l0PrheELJmVbEuEZ6lwh9t4?=
 =?us-ascii?Q?nWnH3hCm93tt/B5Ji4AOeNGqH+8t3Q5wP+C4dnRP8go4FtZXiS7DOXHomMpb?=
 =?us-ascii?Q?EAaabj1igb+VqNwTWwfGLsTBnKX3V6UawZM+InAfFUUTREQ864/5udmlJVS4?=
 =?us-ascii?Q?y9caXJBL15Up9Hc56cMv8zJ0OasZCMKBb7TZ+TSRRSKP9WOepKb61EfSqTQr?=
 =?us-ascii?Q?UQ4yZngX+AcRv3NVQN+u0SxkoDlSUnaM3krWhV8Gr9avwM88BDkOSIgM4RIu?=
 =?us-ascii?Q?x7jfX5r00pbxqV043wk/zf6eymdski63ySRYRqrKX55bI4jcOl/oOauO3NdF?=
 =?us-ascii?Q?n6JAejsctlasM/k9ExY4nc70p0pQWnJaqJ7ix0X6bPZI0P/TPJEDhYD1GkKm?=
 =?us-ascii?Q?HLKpNzPZ+GWSqQ1d051/fgchUZeGt6Y6fQMsAa/csrTff9oDbLws+pdVh/Rw?=
 =?us-ascii?Q?/9DNgTIfGRrXB/ye/MeFgWq5kDV7eXVbDdTH74FtHwqbZ1bKktkFAUQE2lO6?=
 =?us-ascii?Q?EodgYLsJd64XYewiS2qAxJanghzX/xCjR/ZuPGtxdv+8mSMuiDgPKziP5rjG?=
 =?us-ascii?Q?cU2JsFh7ni42C/lFoOynRnppTTCp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HZYZ8UZYRhpyO635SoSlNSQDqP62Ryw4IcQ+tjA6UyihchdUoQvDXWQbPk5Y?=
 =?us-ascii?Q?sVI1UklivCb1Fq1qwVXuGksLjBHqDRuT5YoZ5XnADqIfy9cx0VlvPrem9Q++?=
 =?us-ascii?Q?BZ3RDkBQ4Ad3es/QC0wwb4S+8cTrvy6cTvraWr3owpQw3LcS4T0HXhAH5Cjv?=
 =?us-ascii?Q?RaOVy3xGsbe4HPcOCOzi/NJHJ7XKcwnpG5GjHUSOIL7lFsUE0732EUJ9aQ4j?=
 =?us-ascii?Q?MCIzrvBogAKAT8KbiRnGA1rnRnWO6G74KAgrbwSgLMMyGy9hBIJZJkKP0lvz?=
 =?us-ascii?Q?TldhqSzU4lGR+qImZsbWnJ1cXgVzQFTSGGvGsq7vdP/SMEkvKyX67QHPseMD?=
 =?us-ascii?Q?88/wJ2rGt1N5HNhqkSYauVrmPrOrkQ7wcwAJQ8MLdRU+pgOyJTWQ/NczZo3J?=
 =?us-ascii?Q?tzaS0jSNl9x5d6n6q7lXZwVg5zMiLprpEAli2JWTVIpp8ndIFC6Xya5Cv5wY?=
 =?us-ascii?Q?Q8tOv0D9XQHCUkH72SdZr2JSrc7/port6S2ibIWUD+m9qUmkbXC8DZeG/qjn?=
 =?us-ascii?Q?9qu6hL/2/DDvTpjA6SFlds3bElGb7IBKAgmFINv3VLN5OCW32Hcc3GD0gqyH?=
 =?us-ascii?Q?kFhGXz8hN6VksG6v5OW/bX4/aOisHpNf1W9m5CGDFO96UbBKevPDJrveubBH?=
 =?us-ascii?Q?4lALckiQTLSiofv8g6R9ecm8OrX+Z5Gz0swT+LvnfhzowhZzz/zbtLGvZUaB?=
 =?us-ascii?Q?qbQ6YjFUvIj3YgkwVBgf8IhG/L72LGAHWaD/mxBihGVjKexQziX9shQfG6A3?=
 =?us-ascii?Q?gnx5BW2ZcI3Q4UXiIQTCAGqIP1SFCLJoUmvboXLG9dBlweCjYC/LkZQWkziX?=
 =?us-ascii?Q?a7RMWtYkgW+eSqnwOpNxDsjorTVyQOnWHNGV9c1yIGaa4ZHjkZ/4ikQuCxJc?=
 =?us-ascii?Q?W+1eTBfIcaUGFkZMd0Ryv7J2owxGmRS6dzAOg/ldhTNJE8Mh6w0PjTbSBB0E?=
 =?us-ascii?Q?pE2h4sB8rovYrWl9Kjo2+dmslloUR7jhYh04w5M2gvBfU2zbL3hBuSjv+okN?=
 =?us-ascii?Q?bXX7/oaleMTBUXoy/9B6bmPQDu8Rsm/pWeAuNqhhKNaN3aL+9Jc6w9IupBwR?=
 =?us-ascii?Q?TbSMFMly8KVfz65QDs0B+0jKw4slieoMtf916jQFZCAgq486AJJWlSsxt5zH?=
 =?us-ascii?Q?UrQeby4y106F78jvF6006Nkcv7OFCCdjXdkcrKebWpkLNI56gIqdv0PyE1AH?=
 =?us-ascii?Q?av1qez53yN/WbqGD0RAcy+3NdQCN3It+520PB3kZJY/MJaZ4qvUDB2YLK5Tu?=
 =?us-ascii?Q?YzHd7VH7uKiNcayNPh8XM3YeFvdxfbjco/7Aw3FGcoonpGypwn1eE7Zy8UOE?=
 =?us-ascii?Q?x8sCI9Hp8cuk3dp4Y4Ms5NiNg8ZIR37oHdbdI2WtYesSSXnH1/fdGMEJho99?=
 =?us-ascii?Q?sJAdOUczPkB5Y+XqhQhrHkF4RsOoMzrR9rB5w89xjbKTTOuSU6rJXTSJajou?=
 =?us-ascii?Q?QtpDnVqVRImo2Vs9XTI7z97j1fDBmN7gB0pBHUwpOjvaD5vmSC2S2+qkVh8n?=
 =?us-ascii?Q?vUTzyHhUv4fLaXKGcX05ezEbr2L0kn78kSA/ZmQGSHGXLnWxGa2nxB1eAJ7z?=
 =?us-ascii?Q?Db1ZYyaaPNufpgEUMOxNw3l46mGVSbfP+zyqux2Lk2tE7/VsfbPWyPunaKpw?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jng2OcHnpzqfAzG7TvV5HDTjw1Wn7Tf2qWTARfP1u4yJynzsQNptGcTnefuIigED322MFVX0oD1VSaQB08NWnMjmhbq9qrIw0cqsYXdn4KmQe10y24eheKRDGL2PmR/uRm65O6D2gdjBGQtWGBpKGKcbNg9f7bF8ALLsDnLdKJVUL+aQCYyBuJ0DasAvg4pcCXGAjogawBum32uveU05UV/TS4tgYEM6pUBKaMf+TghdFw3m9/3NxENmftamLv9R4DrKZmM0rvBihQJG2TVTQzD9VSuWSMkLRxcmw6aSVeZwuqvfVasdjwAQWAlX/AHDXi7dOj1VODAoOTUWrS6wD854alAhzMht1XJ9MRJI4yxTsIWMPcBN3YJDvR6/e/JNg8xaJPzOzi2ZjvPih+iV8pla97KYJ8oz1ZJlyMxomvtVF8tmEswvmTlDbGI04WZ/GG6RW8eXaLJ/OyRWTAtQYXdKJsHqPc8bqNy+sx0J9/n2AFNpafQvHmAEwp8Mx4L0m7p5MJ4vfoNKq2+p7iSc9IuTp3veHo/a8XLiXk9zlP/1+Q31u8ADA4/1wSuhOZr8Tjifb97/xCJZGGA7Jo/tk1vWasn1Griq2qZUSTPkFBo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2d45cf-26cb-4cd8-28c9-08dd2e970e53
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 21:14:07.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qs1jK3DfyHeN+Ts4DUEpTJh99OjqVhoHVjaBqORZDIo/1SDVPXMclztnGFJQJ0mYJGzGLbrnDWk3CYOSEHwL8X7Ga5sLCRCQhS9SLa/mkqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501060185
X-Proofpoint-ORIG-GUID: YdmXieCKSPUlZLtRJN119S_ZG8DjYi2c
X-Proofpoint-GUID: YdmXieCKSPUlZLtRJN119S_ZG8DjYi2c

On Tue, Dec 10, 2024 at 06:02:02PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Systemwide USDT tracing includes having dtrace track USDT processes
> that start after it does.  Associated tests start dtrace first, wait
> a few seconds, and then start processes to be traced.
> 
> Waiting "a few seconds" can be insufficient, especially on slower
> systems or as more work is being performed during dtrace startup.
> 
> Change tests to wait for dtrace to start by polling on the output file.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... though hopefully in the very near future we will not need this anymore,
so we should revisit this once we have better (more timely) detection of USDT
probes.  Otherwise these tests might result in hiding issues with the timely
detection of the probes.

But for now, this is needed to ensure we have proper functional testing.

> ---
>  test/unittest/usdt/err.Z_no-w.sh      | 17 ++++++++++++++---
>  test/unittest/usdt/tst.defer-Z.sh     | 17 ++++++++++++++---
>  test/unittest/usdt/tst.defer.sh       | 17 ++++++++++++++---
>  test/unittest/usdt/tst.nusdtprobes.sh | 16 +++++++++++++---
>  4 files changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
> index 3833b4400..4f129341d 100755
> --- a/test/unittest/usdt/err.Z_no-w.sh
> +++ b/test/unittest/usdt/err.Z_no-w.sh
> @@ -34,9 +34,20 @@ testprov*:::foo
>  	raise(SIGUSR1);
>  }' &
>  dtpid=$!
> -sleep 4
> -if [[ ! -d /proc/$dtpid ]]; then
> -	echo ERROR dtrace died prematurely
> +
> +# Wait up to half of the timeout period for dtrace to start up.
> +
> +iter=$((timeout / 2))
> +while [ $iter -gt 0 ]; do
> +	sleep 1
> +	if [ -e dtrace.out ]; then
> +		break
> +	fi
> +	iter=$((iter - 1))
> +done
> +if [[ $iter -eq 0 ]]; then
> +	echo ERROR starting DTrace job
> +	cat dtrace.out
>  	exit 1
>  fi
>  
> diff --git a/test/unittest/usdt/tst.defer-Z.sh b/test/unittest/usdt/tst.defer-Z.sh
> index 52e92eb6b..ff2c5cbf1 100755
> --- a/test/unittest/usdt/tst.defer-Z.sh
> +++ b/test/unittest/usdt/tst.defer-Z.sh
> @@ -45,9 +45,20 @@ testprov*4:::bar
>  	@[pid, 3] = sum(pid % 100);
>  }' &
>  dtpid=$!
> -sleep 2
> -if [[ ! -d /proc/$dtpid ]]; then
> -	echo ERROR dtrace died
> +
> +# Wait up to half of the timeout period for dtrace to start up.
> +
> +iter=$((timeout / 2))
> +while [ $iter -gt 0 ]; do
> +	sleep 1
> +	if [ -e dtrace.out ]; then
> +		break
> +	fi
> +	iter=$((iter - 1))
> +done
> +if [[ $iter -eq 0 ]]; then
> +	echo ERROR starting DTrace job
> +	cat dtrace.out
>  	exit 1
>  fi
>  
> diff --git a/test/unittest/usdt/tst.defer.sh b/test/unittest/usdt/tst.defer.sh
> index 02ed1a767..073af12d5 100755
> --- a/test/unittest/usdt/tst.defer.sh
> +++ b/test/unittest/usdt/tst.defer.sh
> @@ -51,9 +51,20 @@ testprov*'$lastdigit':::bar
>  	@[pid, 3] = sum(pid % 100);
>  }' &
>  dtpid=$!
> -sleep 2
> -if [[ ! -d /proc/$dtpid ]]; then
> -	echo ERROR dtrace died
> +
> +# Wait up to half of the timeout period for dtrace to start up.
> +
> +iter=$((timeout / 2))
> +while [ $iter -gt 0 ]; do
> +	sleep 1
> +	if [ -e dtrace.out ]; then
> +		break
> +	fi
> +	iter=$((iter - 1))
> +done
> +if [[ $iter -eq 0 ]]; then
> +	echo ERROR starting DTrace job
> +	cat dtrace.out
>  	kill -USR1 ${pids[0]}
>  	wait       ${pids[0]}
>  	exit 1
> diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
> index d2d80fe8d..f275f921f 100755
> --- a/test/unittest/usdt/tst.nusdtprobes.sh
> +++ b/test/unittest/usdt/tst.nusdtprobes.sh
> @@ -105,9 +105,19 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
>  		@[probeprov, probemod, probefunc, probename] = count();
>  	}' &
>  	dtpid=$!
> -	sleep 2
> -	if [[ ! -d /proc/$dtpid ]]; then
> -		echo ERROR dtrace died
> +
> +	# Wait a little for dtrace to start up.
> +
> +	iter=$((timeout / 4))
> +	while [ $iter -gt 0 ]; do
> +		sleep 1
> +		if [ -e dtrace.out ]; then
> +			break
> +		fi
> +		iter=$((iter - 1))
> +	done
> +	if [[ $iter -eq 0 ]]; then
> +		echo ERROR starting DTrace job
>  		cat dtrace.out
>  		exit 1
>  	fi
> -- 
> 2.43.5
> 
