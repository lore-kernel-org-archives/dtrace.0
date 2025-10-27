Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A85930FC0F
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761590195; cv=fail; b=TpxvBw8msRwvL4pnODn58bVUZc4WE0afUtTjnJMxmFyOEdBecFnL65TSAeAeJ7z7GeKOhef61sdarosoZfqKqI7L2c43iZ4Gm9c+A196q8ENNPynYOdQnp5WydEIIAP3F83Bjpng3QmJsQdB2dAy5JHBwdOL1D+yyLO6GnY/FeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761590195; c=relaxed/simple;
	bh=THacxzESRqM8rzIf3vqUCEyQy1ggas3oybGji6F72sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cS8ExzttiZsB7y0RCYnRHLEYwQjXvezlL9reql9HoZqhVxqry1nP1gCSRowx2WQqIyk7TT5RvmyQU8DZqVjwSBwej8kbfCje1mInzaVH+JLyrECCVMVx6zAzdT4iA0QpJ+R8SAZL3oP8i67898gspZGY//nMel84P+qj8zQh0KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ls382Uoc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BZ02Smfm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ls382Uoc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BZ02Smfm"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RDYFZi028651
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=S+osmigYWLRQQ52j4D
	1R+N03Wm6VEGRtp+ZpPN9v1bU=; b=Ls382UocykR9dejDlrg3XpsSmHtYdQ+KOX
	hxOSLtZh9fyky/Z6hMu+xWQDGV62JuM1bwlXQAeuhmWrdKXcFeJhO/kFRj28Qvap
	cX6lVI0/ViOK0W5tB2mxugN2EHxKbeXX/y5NfD+WDxm17cxgTruQRiHzoQACdEJg
	NdgOaIQwxdKDhvRbtQmkKc5X9noj2hdsFvxSvzamZqJ6S4DM5w0t5g65CWNzsp82
	YKnejnoPC+/asmCv8ETu6Z8CF5/CnC01xoIJGdG60Yv7GvSJUtXYIhBBY/co7/Qh
	ux0xJowa4SjRXyGt0rgA1dnu7T4iq8hQZZKNfeE4wGke6DO9wX0Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a22uu9pch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:36:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59RIGEOI031035
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:36:31 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n075kk2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:36:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mme/uzg1R1vz0QVRA2q6rfL1P42rpgybyGVxEq8kfCvZ51C5ETDWn/VUDbYJ9iQfdMvwo1mmzz88ot5f/uVSOmPJkerw+5KOntIGqFjDvsUR+B0gfBrtbfOTJViQYdd3hxrvV8dr2BtwYK+eSA/R96fyJQjBqOV8xRAdn2m1k/wLQZ0jRZKAc4nSbA1j4cpyMiSzhsQBXGfIeI9/TvL/G0wG5w6YCjIh8JAqfouHyNat677snKlPgXZEAdivEm5nu24fezsfgYsNm45umvpXARMHOWNxI4xI+l27ECAGIutEN+/c5y3NydKoNKO8s0B7QsOttEWphWEKlNgAQeswTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+osmigYWLRQQ52j4D1R+N03Wm6VEGRtp+ZpPN9v1bU=;
 b=KBK60mt1s+JNioE3LlRa5mLGSFskwor4fJP+sgPLtG62AbShNrFeR4UQ09K0HXqn51NHqYperq21Thp1gShDJCQwZoiOv9j0xdkOCc5b/fJZaljDx7ChcXtXek56AhDgNKRBwTZw+ppoD0Nsyh1axesIfp8IRTvMqMpjoKY3WRa9R0hAf+t0woRRzVr3O39eD8XoIXn/hHzJUd64HBg0KFT6HoFWrbLpxyfAawRb0NgZX5j7lgiWgv9Ptohs1LT1zl0gtdQM+WnakUQmcQzBC023yshT4VDMPtj1hBS5pj7Vzg4hwFAhNpPEe73gVmxQeXlURs1V3YW7jlOi7bkI1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+osmigYWLRQQ52j4D1R+N03Wm6VEGRtp+ZpPN9v1bU=;
 b=BZ02SmfmBcKAY5zaYlxIRI/fgNV1w8ZCB6fQ8IRsQVwbMD9I4g+egQYXMwUP1ZFmvWjpD2YqD7iVYuuVVWll7/oLw5QScl4gefIxTyRguJtHrqACjMLbDCxKX0SuGfBDnD4g0UAmOZuj7e8PM4gEQqyNL8hWf61t0F7A1I53gRY=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by BN0PR10MB5160.namprd10.prod.outlook.com (2603:10b6:408:115::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 18:36:28 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 18:36:27 +0000
Date: Mon, 27 Oct 2025 14:36:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] Bump up the version to 2.0.4
Message-ID: <aP+7qVE1WHjnSrmp@oracle.com>
References: <20251027022737.23921-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027022737.23921-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|BN0PR10MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5e5d14-6f98-4509-06c4-08de1587bd78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qy9dmO4AbyXNTptYIpVbuiQrZWUtqRftsibvLXs9ttvc88P31KLrf2Y00yD2?=
 =?us-ascii?Q?nIcnTrZKDD6TXSWbZfYLWK592fzBbzR+dMoGySlhoB3uJn+8FdYmlAhId9gb?=
 =?us-ascii?Q?kgyC1GZCDHIa25hiMdafprbFbjE7jEGuIv0Ma34VI+nNQbocE5KeVS+Ouef+?=
 =?us-ascii?Q?sUu+dwgs/ZD7I+BzDPzxDN/1Nr4tn/YPebpNKNnjaonFl4YEzW8BwcizKigF?=
 =?us-ascii?Q?GA08uLpbbm8adKFu/RCkktFWQHlZMX+388WUEtMUWLt8bmLyQnuGoe7Itrgw?=
 =?us-ascii?Q?8THZLs1VHF6eq6CEKEBwK0djSbY/+YGbYpK4Sd0JBFOYQ0RLii7GpN2Qordc?=
 =?us-ascii?Q?0swn7sTZPGnH5UboX5giKQmbcdvx+eRNtnaPAV93MDQBAo2CU0hIfe4BDo/p?=
 =?us-ascii?Q?zL/+iDzuUN7MU+sFKjLD8cI09pP5e5QmXtVD4cRfxULoXOxo1tNl8NVJ6J9K?=
 =?us-ascii?Q?9nWqIL8ZaOyr8AaXIYJ/S1KEjiFL3m+T07L2kWJ8xWjW2nOEYbERWtLuif3n?=
 =?us-ascii?Q?zwGSGqu5WSSeTI7IKZiYo2h6GZd+WtqRA6Uhs56PR/E0H0UPKb2yrQQGw3Jl?=
 =?us-ascii?Q?tZ8Y898fP61ARC0jef8ubJMFuuDAUl12EnA8q0AxraMatdT6vPalcpRVKcyS?=
 =?us-ascii?Q?f6a3JNcLuYj6+WHB/zWPpMSTA6RKof8QZGxyujohh9MuwUKCFh7kLKDFetMg?=
 =?us-ascii?Q?cKr/9dYTXI4AbzQf7w1eB13pEqkmFgcgivDGdRt7Y9UGMbdoiqnxNGP/Yo9Q?=
 =?us-ascii?Q?Asg4fMA+X6AwGijGYrdtnPJW5q11dw7Nc6fux+lJ/Y6DLwQaVm8MPO5UIanH?=
 =?us-ascii?Q?Ljq/Rfe3kGV3DJdK/o3oqijI6tHHNYEPIU6CDHCNfHLQsWGlnqVk8ValCTLQ?=
 =?us-ascii?Q?ga1YqKJmYEotUiHR40aL2vS5697rpTquYo8ByEPK+TvaJn0aVdFSp+fXcw3B?=
 =?us-ascii?Q?RBWJgbX6WWNRh1+L1B0OhcL6SDhDMJRKUh5PkPmWUo39inK+pAnUkzOtR/mP?=
 =?us-ascii?Q?VfYWqYs6czGQj5xxiTo0G7LNx1/HVdxMAYzIFhZuQTC8cMjZFKmUA7vWiNl1?=
 =?us-ascii?Q?43OeuiJdhkoDzh1lD0g94GYMFlS/tOXTvJ5V+qNQzvMnMqWhUMp7KHGZZYiF?=
 =?us-ascii?Q?KJxJcZiSFpl2OIRgcQAf10NPrAXZejd30MwnkTSNOi7iVRUfHzzJ2V4Fxbm3?=
 =?us-ascii?Q?keDU3X7nYYUgrZcEswoIdL15pOcJsOg+53rz0FwNX6v2SjASge09NOHkgUzT?=
 =?us-ascii?Q?CpVWkYfxuO5ysKcyj/ra7jNkk/AluHRpaXRxT7Ae5lnN4yjPTppK8kJ/rK4A?=
 =?us-ascii?Q?YCdrKCmReI5bdBGP5Xt7l0KEIefBD6y+5MUdKkAE3yDYOTrBX3/jITs3nPYJ?=
 =?us-ascii?Q?kOd+r8SQsU2pcUpmWQ3uSDEq5z6q92ZWTUbOTmGdR/C7OwVEISGP5tnUNwLA?=
 =?us-ascii?Q?euZtEpKrsl/JuHDJxuwWwxHRsyLy2XjU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nRUMvp4Y00rKCQZOZuUh6P8K0xAoeWlnWyfyqjyrnVRxY/+OMc76jnOvYEUW?=
 =?us-ascii?Q?iCvlyfMajo/fZ4qnoaKqd3EmdJU7YFejJOhjn6eWCdoYYPHnQjvjri6cnO9C?=
 =?us-ascii?Q?1ZmzYZruKG0ND1DRL+1OPM/iEbY83x90n/N6UWPnJnXHThxcR/eyN7LvRKA3?=
 =?us-ascii?Q?A2zVwr3WMHAFHC5m42f28IcflmJJS+1LQClMjs2kxzkgukflXiLxtpPYDM5D?=
 =?us-ascii?Q?pb0uTrev+lLHvTM/SafD5OKQ+jRpB07TgVrdN2mks4GoxuCZlOJztIFt7ctt?=
 =?us-ascii?Q?MbMeK4wfe2fFd3PWnL8HBBZWzMrjS+mlvaPpfs9hTHpGstL4hN4JkZ46yY7q?=
 =?us-ascii?Q?DP5XAz/Zi97oWUm6ROlGfWsGRr0OHuHff6/T0C35T8Htao07rlWgcp9ctqJf?=
 =?us-ascii?Q?f/xfQPcufu6m2g8srr555PczGX6nrkMadQ1XQmJ+X0f9EvTAQ+PzFrhEPot+?=
 =?us-ascii?Q?LKwbeW2vtgaMf/P0SEExTRHXHsWKN+EPo0rhhrQda8GQJWlFQQ4IjOFkjLgk?=
 =?us-ascii?Q?VMtKz75a9A0JVeodDHV0Gpy5Ia6NXnFmgd2BsXf/jymsY1LJuNrjh8q+cRNm?=
 =?us-ascii?Q?Rnch7fiBP4TGNolH05GQNAFdWmcLtwkxpt0CUDdIwUCqGnPirQv5qZ6BvYMu?=
 =?us-ascii?Q?sUCGTvHjMp5yhUQyq4CImPyJzTImuxrmEz8XoA2S5FoJHkgBs6QdOFZsq4pt?=
 =?us-ascii?Q?sQlcMIeC+QV3L3iswCsgbV0aULVCc8h6LgrY1+re9IJqhrp/ucPjT9COQq5k?=
 =?us-ascii?Q?cU3ynQcAd1y7IB4eNgRtHTnfiFVnKIupwkI/SCxw3sph0i1bktzmJHQ4rLob?=
 =?us-ascii?Q?RNffIWatqNOL8TDpJiMs4rCZXOLZHLc/d05fcViJsqLcgZ8giBWtlwTiTHb8?=
 =?us-ascii?Q?y5GtGitFxzW/7s8UMEjn3Ou9BUA0vDFy1Hgm78frybkcK/7PEKKbZCBcbErJ?=
 =?us-ascii?Q?GmhnokmkN4xE2W/I/J5qcAYkC38DhgsZvEm5y4EhpJYVlaCGeA/8BRPhZNbw?=
 =?us-ascii?Q?ARfCYq0XB0REvPgdIjCbMjaDraiuUIjeQNDbRMoR37hAa3GwtEviFlyhxSrz?=
 =?us-ascii?Q?QjKqwdZXhKQRbxberV4vo9FNC7nIO36hVhxZFzCtEGKDmuJwPhgh56vijClY?=
 =?us-ascii?Q?VsIs88EfqqcJy9rAWn+6bMqUzXi3l3ddbd+mxyfDQvMwucPtcwETJLxUtDIS?=
 =?us-ascii?Q?CxJ8xpCW6kFft9yL6lqdnYKlXIMC5RDk8iZEG0y2pT9v1DBLrkWzgjwjr4Gm?=
 =?us-ascii?Q?5fBE8nUGc+hh+HzPEad1zR6B8fYmfid3fRcHTR49Dci3O9Y8OO9m1DTi4GZD?=
 =?us-ascii?Q?87AgASCNawejxRsOhDQAkiLL25CnlGixGIO5xzafV16RO/ilZbU6GIWEKccJ?=
 =?us-ascii?Q?hVunncWSG7jsLXJcQGmZjE5bMUwBjs2De4yiLz8D+S/dKy+55laHImgIw44s?=
 =?us-ascii?Q?EMdyDdiRE2dFeonOIcOUEsvqz+YhffBnnq98fXXZDEnx3NlPCcJSGNlY+CJu?=
 =?us-ascii?Q?ri5iZpDjgew4L5TCbFTN1W6hkoCmpr5HUsrUs9OdC1zign+CvrDy7oOF9kl3?=
 =?us-ascii?Q?RfG5mFNc8RogIPCP1NDn0S9Y40/rZL1ZKN0vOC4bjkyTuBnDhFpA4D/QOxEZ?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Iq8DiRcP1vLg8DfTLrTWc0oS8PA5vrwacRmMB4g6coEseslA0ONl8tgjT5Aa2c/GOpU41jiewWqsETMzvVg92AE2cJt60S+ibCYqLIIpKrhqOKK4TrrRJF3U0BQlZ3FPKjwt1+QM4q7g9zYAkk+Y5EPzkuzK7MgGZImlOhOCr0sIxF37qRsC1ipuRvbDa226zKvcT/1T+P/dcYz4ylMCrB1opqr3qZ/AssmHC3Z0qQIXCXkK5WFg18BaDC9hTMliY0SGNmq28+svhQm+aSqhM/6Gl32rmXgontVJ/dXMZyrDNZRtpq78fS3DSqMA+gPai7MWRPrtReu9q395/vgIEx8cnaQzbeWlZmsdVOxp+Yj/O+O+kqrkOubHSUU0p2A9tUTT+RTeIdXE5D/Zk9Xfvm3KyXJhP4kvfe2eED+RMRXjrQXyt4l8rMKlGpTsrL4Sqv3JBAjthRslSRHJnH2t/638EX6KoIpSKXq4W3jWX3+cypYEQ1Km9U2iHOVCfTQgcWu/rtTh7KP0ez12TZL7tBa2sD+asf5WXntvDRU6mBejRRuqVk8Eo7DA0ppKoV8jEynQxw+Qvb0P2EFTPmoyHfNjlxOhYRWDKSS/v/o1Q0M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5e5d14-6f98-4509-06c4-08de1587bd78
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:36:27.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0EP7dw7pS6w5CrAwss+gmMEfyDWZyDsXYjvMvZhiJJBs9zktSF9xsRLn2zRqczO1QyJ1sofPlNWGFxOKMm/O/AkrlyMvhbjHbETvBwUm33o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5160
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510270171
X-Proofpoint-GUID: 3WrwcEq3Hkr6R_6c0gvHJMZnpxHpEqE1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1MSBTYWx0ZWRfX2Uag3YcbFm4i
 KLlnTnBTO/HuUkIn4Xt1c1GU9HOsqpwwp4qF3C9Y8vXF5KGWw3iBfIkIab+sYCLBx3UJhcwJOWm
 c0YWF3JKHRl5us+/rbX5tpMaJfqTb5x9sJV+1Ym3m3w6x9YbczrjrqZPIvKMupvKTTjVL0prp8m
 eb/WM661jCasosQLeYvEqQSCRlFeXKw5qV1y4RX7QJqPqnQ7gwi+zE7oB+K65Y6dyPFsCX672U+
 Vix11jTXAAtOaG/VLrWXEjK02bxXSX0ZOMOM237+sPk59bUh0Hwr1ugxEAGFAjvv8KsnO77a52o
 7v3gMMIEoikNg5kfa+cAahjqQGJXjioPxxQEQaceKNZM9bDzN1/RyU6R1aZ4JPt824JiIDywFsG
 1uOIic/aTtsm/gm3LhBD9WYbHlM4iw==
X-Authority-Analysis: v=2.4 cv=Xe+EDY55 c=1 sm=1 tr=0 ts=68ffbbb0 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=OLmlzxVF3Hf-2cZkdAMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 3WrwcEq3Hkr6R_6c0gvHJMZnpxHpEqE1

On Sun, Oct 26, 2025 at 10:27:37PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Note that test/unittest/preprocessor/tst.predefined.sh checks that the
> __SUNW_D_VERSION preprocessor symbol is consistent with the "dtrace -vV"
> message, and both of them simply use the last entry of versions.list and
> therefore will be consistent for in-tree builds.
> 
> When RPM packages are built from the .spec file, however, _DT_VERSION,
> used for the "dtrace -vV" "This is" message, comes from the .spec file.
> 
> Append a 2.0.4 entry to versions.list.
> 
> Remove the VERSION=%{version} from dtrace.spec build's make line, so
> that the version of the implementation is defined by the source code
> itself.  The version in the spec file should be only the version of the
> packaging.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtrace.spec             | 3 +--
>  libdtrace/versions.list | 1 +
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/dtrace.spec b/dtrace.spec
> index a4f3ed774..e94025472 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -131,8 +131,7 @@ it always tests the installed DTrace.
>  %setup -q
>  
>  %build
> -make -j $(getconf _NPROCESSORS_ONLN) VERSION=%{version} \
> -	%{bpfc} %{maybe_use_fuse2}
> +make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2}
>  
>  # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
>  # and the testsuite requires debuginfo for proper operation.
> diff --git a/libdtrace/versions.list b/libdtrace/versions.list
> index 8986d2007..8d858f0bd 100644
> --- a/libdtrace/versions.list
> +++ b/libdtrace/versions.list
> @@ -65,3 +65,4 @@
>  2.0.1	D API 2.0.1 Linux (BPF)
>  2.0.2	D API 2.0.2 Linux (BPF)
>  2.0.3	D API 2.0.3 Linux (BPF)
> +2.0.4	D API 2.0.4 Linux (BPF)
> -- 
> 2.47.3
> 
