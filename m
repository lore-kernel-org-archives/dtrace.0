Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F18C1E3DE7
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733225790; cv=fail; b=lQyAdiQAugM6yAs0Dxw6Q6bIJL79BCvzXR0B7H7tD7InP2CW9LtsQ02leJ+doLP9P+eyCmiVSujOtXYpEVoPAIcoEvLdwxddcYpVjC53Lt3Zg/9i1aVccmZbT8SaUY7o3oIFlOipOPc+tCYSqaZM41Lkm5IoH3kO5j8IDb21MLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733225790; c=relaxed/simple;
	bh=qCGZlIgUY41xY8lANyQo6hc1/Q262eQaCajXYmhtW+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WCWbPUe+0XLMBIHYq/T+HkWSctpeiPL3WCte0YTW7SShQ545ursOeJOnIXCYkYUOUtPLBlVPf+ONdPfybseJPd1SeejKUFCVrZyw0M7wjj520lG5H9ZUJKeZrnIkL/thFLDKQwmFCbFy69Db33RDkmJMK8Kn7zgQYwWsCsKJZ6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P5HBK8DF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lQ7+0tW1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P5HBK8DF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lQ7+0tW1"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B37Xa9o018735
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZzwAbnMDLNcYyeNe9M+CjOGjTs8r8LcGAW3rnhdSzZ0=; b=
	P5HBK8DFRGzQIfAcMmXt1q59e15iDXYM4miebpo+jXKUOGvpjmsRiOjzbGj69lEq
	gHAh6SBqbSKFlj1XgHpcJVIMYH/eO7qJIFWmVhOF2FpSJHyM/xqM3yPWuGiCbbfj
	WO2ZXb93cvuhNSO5ibKZZkgb91ZkGu3F3QrAhCNSvfU72VS+juoxeZENjuNICSq6
	zjcyJLG/zDHTbGTv7P0N3ClA8T6fV3jXvx/jyjntmV2/ks1bz80jk5TTVduTvqWI
	rdJd4hkN8jo9qSg0PGoiPTofrmyobeO+HerkgziLCAc7da5ky/+vbWoMmWPexHCm
	s1UOWhp67/3cwXaAUOMTfg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437s4c5twu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3BBSh5032798
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 11:36:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s57wf9m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 11:36:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPE3sPc7Mpvd3u441hn0WEy4W9jQPgDqgU/qgde1OJYeauTbBoCVvqmbQnWNFUDMxModGTDMsvAvokn/h4v2xdcjAV5uQNMfBo7SdfO00IARpMvbxJsVpBaArqM38C/DI5z0apMcDT+0Ya+VDmME4Pzg0u7gingyMClGaq7kQO/RnkX7FZZ4Zes1nw4xNlmjVQRMX5mpDgT8mH31oS8/vNQT9Fj5OPmcI11/H52Uu5hn7R99FrxzlA+N5Es5DygA2aqrXZk93FBbr/ls0QbVFFpMrA70+JU9BK7OM/y+8+ldC4+Pm05SV4kjHfOizVQCiCytKtK2pmQfnQiZUZozcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzwAbnMDLNcYyeNe9M+CjOGjTs8r8LcGAW3rnhdSzZ0=;
 b=xWctS5dNnTOvU10rCD4+Y0qLWMeA0ic2gKZqVj5mhuYi2H1LqRwedzn1PHPV04lOGBR6p6BA2AZk+lTGBgw2GI5P2VCc3+E4DhqyOysImKRXpwSU1laHojcluuTKi3nVi7nDuij13UZBjefCTQD9lPuBomt0UOgoHtOtS5NNeL0H7xI9WpApiDEyR8gFD30RIaBqebPahGmDEQnhule/kJtQRLXPpY28Gi/uFmoaK0sp6w2PTajIyE8swuKUjuj1oEu21u7SXehipGMn8BYed7UgSsZ6xAkkCrgI9/TymbuNeoJThtfw/SEBjrCQxVgjqD5dkYPZwQ46rK+Vbsh1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzwAbnMDLNcYyeNe9M+CjOGjTs8r8LcGAW3rnhdSzZ0=;
 b=lQ7+0tW12Lwc7qVuGA50sGl6CeteipPWGgxhlaZRRhfzSYTcwjn7+N6CmoB6bb4hB18hn/sXS0fnK+1ordxIrm2lSYp3SgQKfvlNmVDx3BOJU4I6KNGMb7BPz1Frejli98pwDyVKOim9rpnn+D20UAckeliBdIqAyMQ8m1/SPxs=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by LV3PR10MB8177.namprd10.prod.outlook.com (2603:10b6:408:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 11:36:17 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 11:36:17 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH 1/5] Revert "Tweak self-armouring"
Date: Tue,  3 Dec 2024 11:36:06 +0000
Message-ID: <20241203113610.75104-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
In-Reply-To: <20241203113610.75104-1-nick.alcock@oracle.com>
References: <20241203113610.75104-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0340.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::21) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|LV3PR10MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: c46ece56-f3ac-440d-516c-08dd138eb362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0cKVi5O1AuJ2Q6XCJVyTtQ+Z32vWhcT/TVPUXCX2EwVBD0Uyu5Uq9RQWelK5?=
 =?us-ascii?Q?zVC5HgNbSgyA69lyq6qirfqqBSGcq8iZZJUnAzp0Us3JzB3RtzWUL2yjMLvJ?=
 =?us-ascii?Q?5Zbss0lDv/fJcvTNfak30WotsaeYNP1mSjHUPWlXbj34LqtPGZY+ufCVExdA?=
 =?us-ascii?Q?aX0GwzRmzX/9RUaRUb9rkXEWUiHdeybc2pxUPgDrARdMWBwWT9cGGPhKvr5x?=
 =?us-ascii?Q?r+BmPQ6kb2SwsSXkFeYxpO4TtGTMSnwVl62Kel4HQujqrzVe2+0mBDZ3hEcO?=
 =?us-ascii?Q?n0AWoGueWEzc1N9XHPsU3Qhpf/4W2bVkxrMxueyRYGU8/I0BOh8X3WjlqWNo?=
 =?us-ascii?Q?gkXlY83caK5nl/yZTwH332zW5i3KCi8RlwvszBTyGRG38EC7KgrlwCuNVNfv?=
 =?us-ascii?Q?svz94h7viLwtJxqqa6Qp/ZAk8+oBlB6NOycLn4hjs7ImflVfLsMbmDtdjiAG?=
 =?us-ascii?Q?wNFs1FtkY0t4ArSU08qtcwnJ9kKBHZZv+W7IrhhwoK9M4rQa+JwYwxnkv6iv?=
 =?us-ascii?Q?QTzuDy+6zRY+3ttDGfJnWj9yfIYl/nu+yDDVGE6A2a52/siY2+J5E+0MDkX4?=
 =?us-ascii?Q?wUrHjuv42lTCRbmnFcV/pXU/X3NLFPW2S4iX/fMMFMTUekdp4s8ALIUFZK1G?=
 =?us-ascii?Q?rXOx2sYBkKpQDYANYvITowoJkUBZ5YzrJ2aZ09mMteEhvq/uM3EjxKaUthfE?=
 =?us-ascii?Q?9V+tPl1m6PqnekhIP1K5ao/r7vurpJXhix58/YjQMH/WgatL8KU7KYFn1khv?=
 =?us-ascii?Q?/kVUts0FZ21tCw4SnXWKKSyF3X8wopqc8BmlliMIFJpvH4RyPNMuYOuxogTE?=
 =?us-ascii?Q?D+FDKbB22O5kgRnuFsyBv9gxKbRug804EXcJjIhRq/5YOTdryNe5oQpnHZmB?=
 =?us-ascii?Q?jW3PQPTwreiwz7brm5psGCMFybz11wHxV9xYgDJsg+55ZAzukwTXpLlAGPqa?=
 =?us-ascii?Q?KzUhjlgTf+1wDkr/HHcOw/tXAaEUE9Bdu/QEE1JikjlBwSVOuiIG0+IDCuM+?=
 =?us-ascii?Q?8YRQKrJDzuMxpZ1wTwkpWdD5nfkbqjZfaCz2dHktQ0r6MhlLO0McnYBS/BzE?=
 =?us-ascii?Q?43gjl9wMS3yxNfJR5U3BscjXZwYdOqIjyrHHFVX8C9ZL2Bnsb4IzKoTKjDhv?=
 =?us-ascii?Q?9PVOtX42Kh/XTZBFdh/JocjU0WkP3JEpFyVqY5Rb5eyenFcInICSAGy0BdOI?=
 =?us-ascii?Q?dIrLMOObWj1R9XROe9+9+WFyyyv2KdoEs9GdQYJVvhsIi+sWAoZfmi6nhaXj?=
 =?us-ascii?Q?bODsk9S8a3cV5uSboe8wrjyqPNL9fxG12waciSPLsq7JmxqQKh1Ckwr886R6?=
 =?us-ascii?Q?DCmF+OfwiIqlMPRZyUe0ejTwP+ANrREAwHl4HpOwYs3N2A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?89ytFTlolYt88HlshBDMFFhSPI/GwEINrV40F8kKiyQl8ufPcRzHk8yzy5m1?=
 =?us-ascii?Q?GseVofynHRmxmfrwFb4oAbBwgdKsWLcWKAXNDeETbhkkf8nxNXmcrfERdMvi?=
 =?us-ascii?Q?ZgDz4GY6s+ipAo1XTJtPcMGTJ1J2GgnOcYK7SYLJZANX1HRDAuXi3nAER9wD?=
 =?us-ascii?Q?FDTKHgdV2khP1b9WUtbyU+UL979JUC+9ileJFvgAQOe13iIQrfuuMl7L8NtZ?=
 =?us-ascii?Q?BYEJzl+pFUw2hy3JH0/z5jhDD1j6edch+/sceRHGLqYg/flgaql39IX9j6qg?=
 =?us-ascii?Q?x/V7CwTfTV0T0mJQNOG8qEE7AsDe372dgd2a6MNJOUTPwEjA6clkyGOh2JYx?=
 =?us-ascii?Q?6EWdkCyINw72HpJQPl/dH4/CgnNqvfRM4IXDok82XYO3Hm3ZIA42a/AJjs/X?=
 =?us-ascii?Q?nl/jWMWa28g6t5I0R7lT74ZbulH5+mbi1segyZ06PS8LWXStQhLDynAMrLsq?=
 =?us-ascii?Q?dWa8aC4qKLGczz48FGuXBv8YPBpq9Tg2v5MvOuEUuHJRxv4LkFv5afJaWCNd?=
 =?us-ascii?Q?thWc3hAuzefBmaNQ0vaIeE4IytYuJjGUM9+EowhBHjxX/JEV7gmEEFaE72Gt?=
 =?us-ascii?Q?HAvjk4H/w5JA7xBfw4tOcFs9Df2smbA9rShf8NPrIMRhW4vWYlxVy9dnLp17?=
 =?us-ascii?Q?Kj940pWlUg/DN11mgQ5GwRUjiGMXrfzt5qApd0pDyn+JYOO2VCuUF0pa2UcY?=
 =?us-ascii?Q?Su+vdbXHscTalKJCRpQEO2WB2a3fdEuqlqQXoMQnKrhWxNAqINfVBTHESyRt?=
 =?us-ascii?Q?a9FMoKv6dzfod9U0nXBRBUbSAH2Tv1MhwyBgMOtVoBTzglxnzTC7BFoiPrIW?=
 =?us-ascii?Q?nCP1LRCNPFMZw0EX/U+J/fwUy3ltjGQ+y0xxfjDHgIKidTgjexCU/UKbpYKI?=
 =?us-ascii?Q?QXNhx8K+lDVrINB6mv5KN9Rgo1oe4+99360uKtcr2mTynbk6il0XI09qumPs?=
 =?us-ascii?Q?lqVRINOirR+32dNrIyUQV7M3MEcS1pE/t6bu7AZULNIEjBCyvMu2pLDqIjA4?=
 =?us-ascii?Q?pABUtmctSTMbqd/DYiAcAbL/g5/hDQqXYhO2MpikpbRj12pdpzPBNskTScEc?=
 =?us-ascii?Q?n7rQoWoTHa9/MUoWL9Mi+D5u1SIQ7Y68+m0shHI1puassVkvZS1p5SbkE5T+?=
 =?us-ascii?Q?sR8UyPaoWoWH8/EUoTnAUjxuZava5jEDOBkVfPr92kbzC8e7nYgUpE2s3D8S?=
 =?us-ascii?Q?tMHViwc1p3PuVKg4lDkrCmBFjJuXKU5/ECdG7h5jFwZf7URYZpTsUFglAmEN?=
 =?us-ascii?Q?dVuzlo1fxPNcZz5Ta/HFUsEc92HfpN10OkdrP8OIxVaNDDqg5Y3P6ZLhO1BM?=
 =?us-ascii?Q?lFt46g8qXWv60tkhgOk6Z4Wu7nEixT1GUMg2rDSbdPq6G1hI9VYJ0LIeRMKa?=
 =?us-ascii?Q?v5ZrzYX9e1NbLNNB5XIap2hUzY90k6XpJspFCTEmv9GPFoMdu5lpxAQ3AdcN?=
 =?us-ascii?Q?GOB3po+TO1woh1yd6fizIUvXXciS9PJhft63DSKOpenl7lcx4meBkmVoxIny?=
 =?us-ascii?Q?XU9ZDWpgPbJ3TV4YroHWOXPVIfX6xR4jLeMVZ5/Wl4pKicuSGzezZWs7NviY?=
 =?us-ascii?Q?lkPFVww3lX7dyB1UAq7AERS87jb7NmbJBniUukeMKDX9/299GW4mswgL+CM8?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t9Na+TcvRJPG6EWcybZN9AQs45iAA0a8xk+O7xPuEX9X68ccqSKPVaqMKpPnho/fnCiUpshAdeaeHUmLDqbLpT6qkJ9i8Xe9uhytuLyTHr5XMGhKtYIxaJgRA+xa6vVNBSA8j85YUhRBm9WaQ9pbzaP1fIKGFTj2YGme/D4uNqSB5b1XwqUjv1saoSDz5U/iFPUOz20sZiWZlY0dbaWZ+qQvC5tO2UkUuBTBjyjSFn2HjQuhiCePySQ8Zhw6Z4ra/OAVlT5l43RLqFnANBfkhL/1NcjQ+rVJLoeYN9WvOhBKdil8alPvnpG2dYBO0/uNqyPB2aaKUzhq3AaEXGGarQ85dwbtM5dy3vCFN+HNUM/fRCWmXreWik6/qA2lMgtswGSFBoZxTMpRAMBufeeoLeGdrRQ/nsy/2X/I3rRkrdxAWNV+JuaZ0S9F+mJC9UqXSO6dWnKFLkgbJa48zr9devaxPoQytNANrqCxqonGmfuGr9yUNKP9oLkXi2+kNfrDxn6t25hL86A+huIlEFrv3boUZg6G97+xaC6+XNXKkwy//TT2dZohZ3bQpPItWA6X1O6p9UxLMcoU3rRACAT66GA4pLy0gF8fnhytj5zzYFQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c46ece56-f3ac-440d-516c-08dd138eb362
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 11:36:17.3215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5VQ8OF9BOZuo8q3Wm5e7MNV7bHzF+V1ECi1GsCn24TAV17uzJdZ+a0zAREuvv+LtVMckWTw5vnYa5GvTVQkpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412030100
X-Proofpoint-ORIG-GUID: 0q60ifWimYQumd_bBD7kxDdwp99-DYcB
X-Proofpoint-GUID: 0q60ifWimYQumd_bBD7kxDdwp99-DYcB

This reverts commit 39cf54d2e98ac877d4b5e5ba6313f717173ca380.
---
 libdtrace/dt_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_proc.c b/libdtrace/dt_proc.c
index 7c3eb2a24a512..a052abbacf204 100644
--- a/libdtrace/dt_proc.c
+++ b/libdtrace/dt_proc.c
@@ -954,7 +954,7 @@ dt_proc_control(void *arg)
 
 			if ((Psystem_daemon(dpr->dpr_pid, dtp->dt_useruid,
 				    dtp->dt_sysslice) > 0) ||
-			    (tracer_pid != getpid()) ||
+			    (tracer_pid == getpid()) ||
 			    (tgid == getpid()))
 				noninvasive = 2;
 		}
-- 
2.47.1.279.g84c5f4e78e

