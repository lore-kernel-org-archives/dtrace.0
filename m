Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833AA1FBEA8
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754506251; cv=fail; b=BoCPT71iUnoTSIxr2OXJihyB0AclTPI7e0bv7ccNtyis7iQtnI5iZehoBEyXp5bN0Z0IY+J6AaG7iCvVP6UJqVHupOVFCM1Bhjp8hybIQ9h4yrOv/DkPSCwvgCxhxxBVxpopJE/1dIdwxJ4NYw2EWcdjuSSzJivp3to8/SDbmA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754506251; c=relaxed/simple;
	bh=HPLseVhVKqnTrUalQiuYZqD3gdnf8AyZwzUywYDMh6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XmcILd4NUusaPBTNxxL/O6JItRXFih1iPZesAS4iqwnjZ54bxfOXbmVAPHqpT99Bs5KeNq/GEBxh3u1bywKdiIUZa1x+bf43juFCrSRuj5m048cRmDYugcErZHtT+BtTB4C4PKPlViMthpPFY1r/nwegayBo4aTJ9qCxnTbdeUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QKxhMQaK; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fatNFgIo reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QKxhMQaK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fatNFgIo"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576GRPV5010799
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 18:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wB3qKOMBFhJVmQ1PCsvLoYN0dX21gy/cDe6yu4KzS1M=; b=
	QKxhMQaK32/5M5DSiFon+7tNqJC9ZsOhNeYVxwQoz09JfCAer2x4ZkndzNc/W1nk
	vdzkVn+iOwLfxKETRvDboonOXxJ8dMD4/m4y+7JxKE2kB4N8bmya3DZDbv9bWSr2
	idrt9DYBThtzxklULy4d8nMHZ9F6d8XRBXW5R1/O2lsHt5zPYLqrfosJksoHyurt
	0q2MGV8QxCKPK37gkYyK1n6cIxgfPXgM5Mr1ztp8llbsxpP4diHbX5mZTHf09akf
	FA6FasQUZI9gEGwkyqoA9tBTet/VzZJ3H0QV2Zi5C0ohRwRrxObdErSOR6KxBX9B
	4g3OWS/Nb3e/UreXgrXppQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvh2cph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 18:50:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576IoJH1009798
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 18:50:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwmdk04-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 18:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unwa3LshhjGzVBD6t5c+qt26O3Vh1dAlrv4ojrNJuHjbWhEFByTuMNTYMda/nA52soTOYDWil8F/rrnOEVbzgeu2pIT10AglWVWmka/Aut3AYcQIOl8TjRd1spQSxqXrlgGJ8P5CvB+txbG3A0RXeiG6arrMxIzfHzja/NCC9bVIShActsVN67EhmHo+vET39na8bF0xVJeMAeqW6pXki50097TP4PNlVlYKfZrzjJrP+PxQb28wWh8I2mYpd4WCrkyY3EHzjGYcRlfdAJriI2L5fmQ8nhL22fKudY6n0GN1Kbh13a9OIsA03aHwhNd2qyg9P0KLxVLJUiROwBwo0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saU3E7X6RDgeAdoLxa4SmWG8GyaOGNJc2ULME23BO14=;
 b=Fksdby2g3BtnKCBUXLLSZpH/Swqf6UgZc0kaPgs369tBrtYu8Br5/h5GSR4QJz0QkFbqXFOiL4Ft8FqZSGfE7G0oOwogP+m+Qr6gMAEkVsgy9bcBFznVxBAceVT8VhT9bJpZz8d6MBtQhEQaaIQ/1PgPkuKA1CXCHe6d474Z6vp8sNxFK/o7R286U8y2IOlVYOHG9aB2eBzGCPGY2P4m7E1wx7LssFsBCSx51/XFKZ/WK/dkyI4E5SJkEUTVvM17dcQiXcGTn+te+S6vCfgcfoUhbz8kTFzAiLGDFjZVMtvP2tvKQUL/02p0YNZ8UuJhfaIPmJedFA4ceIT6A1o47A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saU3E7X6RDgeAdoLxa4SmWG8GyaOGNJc2ULME23BO14=;
 b=fatNFgIooohA55wXhvs9ByD40pTn3TDWfr6X2YBuV2dISi/zRgFuyqrSRNcXp8Lp9lpHuLmiAhup6I9YffN7S0bB+u5mbl68h/hu946M0HMeJR6cYeQkyX/0+p3J2cBkkBhaPWU+cq9ccjHP4is3L767u6C8BbtJtH+3TDCZQKY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS7PR10MB4878.namprd10.prod.outlook.com (2603:10b6:5:3a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 18:50:45 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 18:50:44 +0000
Date: Wed, 6 Aug 2025 14:50:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] examples: add script fcalls.d
Message-ID: <aJOkAssVhOLLoY+2@oracle.com>
References: <20250804234243.6470-1-eugene.loh@oracle.com>
 <0e81db02-c723-d34a-2ca4-58b2ad2727bd@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e81db02-c723-d34a-2ca4-58b2ad2727bd@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS7PR10MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: b1605e84-323f-4be5-95cb-08ddd51a266e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?4NrW1CSUtSvTlXSKer+NrgQNlUIifVprV//zVGUTdW6yCaLKneWCYpg6c6?=
 =?iso-8859-1?Q?cq9UIk6kJ+UsvsAiuTEY6VPAlj1gt+xga3AlziTOjno9MfXUvxN9qO+fqD?=
 =?iso-8859-1?Q?O8w4k1u66czKvIFYfjqox9NTtJJhL1mTThrSY5Mvkvl1gi0+LsXn3yEypT?=
 =?iso-8859-1?Q?rdbADq+aEMpoayZNY/tLXgjtqRO1lwIO7Jr+t9MTU41xv4Aw3d0Mqt04dS?=
 =?iso-8859-1?Q?/iaAv4MYetdkSzQLh1Td89OT+GnBAQnp9CXNwdRsG0OLLIF1wC7nho7Ti+?=
 =?iso-8859-1?Q?hPPHj9OmaVt6AmQrkbbawrvQNqizkDFgtkS0/urIL9tcERj9fqjBjt5VM5?=
 =?iso-8859-1?Q?fx5ReitsQCeWUlbtJBxoqoankVTP+x04ZWwEs1YEg8sy8Octjolu0GVfUY?=
 =?iso-8859-1?Q?08fXruqtdHQuV0MUbtCfT65jX0xCsZCcaSXZQ3vFL6/OeEbqM2Y8wIcoL1?=
 =?iso-8859-1?Q?d8TLn+e/kXqo+GDVng0ZPnS2gVG0CjMlJEv7uGLJC6pYjOYJganrW5VLY8?=
 =?iso-8859-1?Q?2rc57OcKj5mog+JyBBQhwM0m2Is/d5Q1zTpomgBnSQK8k6YN7Y/Hxg+t2h?=
 =?iso-8859-1?Q?JfWuJdBVskgmyv4GzeSVrMbwrbDQl7wjcE5C7eFY7ywEluxhJxyBewhtP7?=
 =?iso-8859-1?Q?t6r5mCJ0CVIfaIaA8QRvDauL2FKUSJVUmx9WPPgM3KLMZDIRUnvkF+hkOP?=
 =?iso-8859-1?Q?IqVE9rEU7oZHUmrmT9igINPTbJmJOMZiiuCPXcQtG0mBqD9WluD1VVlTR1?=
 =?iso-8859-1?Q?V/e+2btivXBCf4+XcXeYMs6fn2m8p8zXJJ5YM2qiADdf5tzZb+u7SU4RXt?=
 =?iso-8859-1?Q?119XBvRKZevAFxgQQBPazPxFJZqp1qr7MS9ix04GTJ2ZNkuDjJyfStjXuh?=
 =?iso-8859-1?Q?Djx5ScJmOQGtUpMAsFsGk9A272faYvYv40zFtv6DLQjo8I937z1q12dv96?=
 =?iso-8859-1?Q?tqJYMUGd8O85bDu1P1O3qw4jJ3CT8jtp1DsN/CJRdVgVzwdaEnH0E7kO9y?=
 =?iso-8859-1?Q?hExPSLcs4aPizH9ohbsu5SdjwQuTu130jodQP68en7uxlfZ7SHjjBaCXtu?=
 =?iso-8859-1?Q?T25H+MYUm2FDWs2XbuZG2TKN46lu/SaEFKvXKGE56fU8OtokieDmVcbptO?=
 =?iso-8859-1?Q?4bTHTswq6HCX0l83Uvs3ilV3aG5DtKiZJrKfIZ7Qg0MNDxkythXd+I9EII?=
 =?iso-8859-1?Q?pV1XLUsRl3ZocLM4ycl2mXSaxjDDqn1QsBwEW6cCmOUtLJDWoNogzYkVM6?=
 =?iso-8859-1?Q?eioEy1rBjyXuRZZoaTAJj/sQEj50B3GJdxhm8+psHHJiIqhmDkNU2pNvUO?=
 =?iso-8859-1?Q?7PiTJW2FZMmuoWCUvd2thP/ntlZvr1IOxChyKoU7egr3sdfMqUoaDAtcB8?=
 =?iso-8859-1?Q?hMTtGJ4H3J/J4BLbbOSArAOP4AlScSWvgNmp/CryHy6pOdV4ULHf7vjFVz?=
 =?iso-8859-1?Q?KDvF1eUSuGsNEiHT46He1DXw0P+qyOrN3syKzzViWc7a6+ssJpKY3Xtt+M?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7Z3RJ1/XhUQOGm+dNkcL8UB0lMMWiNZlJY6FBkdSS0Lzf3/1E8zXJflL36?=
 =?iso-8859-1?Q?8l+JvCnLN7ioVcRBosawCK8cwLPApZrOLRn45qZNck9oOQcN571g8PAXtE?=
 =?iso-8859-1?Q?tzucRm4Eq5aEo8tY+dXJBskQ9HExZQqGf5xmefTIgezm1E1lMfDSdHpaaH?=
 =?iso-8859-1?Q?tJcbTRNOrtpdLVWQLExcTI54p9X37gF1mgZjaOzeXYU8IZ/VVLT7xHZQTj?=
 =?iso-8859-1?Q?iTi3nkrUfPKXUlsI9OfwPQJU4laiLlp/9PeG679I+LS2+hfN9Ou3Rsii5g?=
 =?iso-8859-1?Q?geBWLldRmvk7X0hjTWKTSBSoKAoMHLSr/mFFTk+9MCvyvB99Dj4ktqpM8R?=
 =?iso-8859-1?Q?lUYrfxr7YRRTKrORv5FAKPf3yNNTfzmwYwgmqEtvy/e//zQIzrJjH6zSb6?=
 =?iso-8859-1?Q?/ZKzRS0Ta2hRC1PhE9aghFAHEab4Pd5D/hU19hMylpXJtbjg/UViCrYmYC?=
 =?iso-8859-1?Q?una72pxaG9yXpYacBegJRO+FBQA85Ewj6kjv30vTE/7+1ZWcZYV71u8fY8?=
 =?iso-8859-1?Q?fIfyZisel80NFQ4XDQ9gptvsMf8fYyyYV7xFuucgg7QYcymyjMxW7Bgqga?=
 =?iso-8859-1?Q?IBdFDqF/i3SnCgnN1gQmcGeF+8SQPOp1mPN45c4V/rGB1dCbL7JYo3vkM9?=
 =?iso-8859-1?Q?8+sfoIw/TCcQxwIC/FIvM3T0xnpbGwuT9F0Sk0Ze8oAYKRgVvI8OD2namy?=
 =?iso-8859-1?Q?NJiWzKSBjat7iapn03rXERvIPGFxxxYSYAlP1eCpyBmihNFd3w33+XJTST?=
 =?iso-8859-1?Q?nRsOjYSUc0ucOD1mBq3CyvJixSDwDcE91gqAwnUCZarsIqWfyEVkLQbzUV?=
 =?iso-8859-1?Q?bACRqqlKTeFK39FektHeXspjlM/Da17hxfFfSxf/wegsyWEFocfkWAWNXW?=
 =?iso-8859-1?Q?C9EW0c1KuoihGdlhq0lkEiIxROay7CNUJM3IdQkJDjHpTWDinzYIbEEmkx?=
 =?iso-8859-1?Q?3lddCLP9lhdDfgJDnB55po/CJ/ySmb+thItlexuForV/Xz6FIRl+wTzQ2Z?=
 =?iso-8859-1?Q?VYis50XE49+9xdrLLqaek2odwdQS0gBGtbWZmqwL6cxi9nZ/5YYTmTO2XM?=
 =?iso-8859-1?Q?sEsc677YxMAd19ibpcUL+WH+buAvw9FQarDFjS+/GJXq1ASn0GCjAaIArv?=
 =?iso-8859-1?Q?A/P2Zuh9f41s0RG6owG/MPB/+TiN59F972/aD8SloyOHlZH7pAH7HQZQZ1?=
 =?iso-8859-1?Q?jlxXJMgF5yWdFaQRU+SSIAUr4UqPBwZPwqvh0HLWcq/V8gLdzTGjazkNsa?=
 =?iso-8859-1?Q?AbxmXShiS8yhtrfP3AjjQVy390BOkW00rkwwaelYS8hIVhuBi3SweUrAU/?=
 =?iso-8859-1?Q?synJ3Cj6vUzdkRq6bbxOUPUVb6fOX8GhO3aUGdnfY3WV5DlM5XGJUbmAgs?=
 =?iso-8859-1?Q?t96DBTdOWxQpOvsdEjNexpj56yu1XEX+lVin4EUzwYXOWZ1jHxpQ4BKofg?=
 =?iso-8859-1?Q?902eRVjA2/6C4wPSldQy7ajPu1mL/6FCsUNurE25t9n8d8gPMICpQaRwS8?=
 =?iso-8859-1?Q?qlto9pYqnNxi/J/ATMZRHNlw0kU2oYVxEGuZxoWzQ+10vzddSfbF+SyhQy?=
 =?iso-8859-1?Q?E6VRqwjobVeJSkadNPMSEvKlOOhJ6gZ/qXSf/9M76ztSsU+qLeEXH5Pcv2?=
 =?iso-8859-1?Q?c4Ua4MCUHD63bJuSxBch51yaxWY8Um6PsuNc8SSkNvkslD2I20ne311g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/ro8hgpUDopcM7uCjvgHcTVm1SmXMZrPdgui9FvySIzX0gnEX+c0qNXb9aUtbJXojFA/tx9q+704Kr5RXyDuA+xGHVEpiwSs+d5Bzllq2uHkxU/O+aElIiLK7ldDbPHemmSHpaqEC17GuqIgE05InQuWWxsMo9zcGfI0S+OFdNnOecs6HN3CDDe54NYLMPup27dohG1OURw7zLCsc7zWi+VHl8kUhPgEhAzzIpAZ2/8Isvhpf/XFPvx/LIkgx3UR0bfQ60OPKo41nDSM2VRpoUHkFrkKQD3w2mqnUOlAJd+1gQuoXlf2jGpAjWEQEl2EmwOn9B0uwwZHt1ht437DVh52307Rk7KaB0ZmJR6lu/E11lCiGtMTF//PsXGzd+uKh0CmmHIoSEXJBDXW9LinZ2ik9tJorNvfNvI7o0bqu3mR2yvwSFwmM1+dwezBy47y3aaKOYIXFk6TYi6nflj74sr9KalBb+liJHsCLyyovXOqOgEuasFztEHq5gKIRmJ59hBJ3aKcLTsISU0U5+ilHwtQ3ZuUUY9BXfkfN5ohXAoTAwMdT/WvkiGjs7Lv+93SV6y9Jp6uzH9ur4FWRt1Z37cZpnmwEAuDFvbzxrGoVeU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1605e84-323f-4be5-95cb-08ddd51a266e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 18:50:44.8695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+RBOCTMjLmoCsFweQGXcjl0UnrUe6NAC6m6dvGOnnhbD5955mcvxdpR5DnHy6BQCX/C4DxE8B6YVjNUAVqGum53RyKZDn2sfVVE4MmhIQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4878
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060125
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEyNSBTYWx0ZWRfX/YRHIgRWL6Gw
 9CQLTM/I/qlGwF/wwFFYuLgxcPaIeSwH45cwbrza5GHAlGQYj4BhkYATU1zbt01tIE2Q2Vgw+ak
 hT/nvxpJRNbk2gFJLaOGblhNxDA8bhzeA8tfqEsosiWwR9mw8c+3ddpubifChp3KoO9+MOYH3iC
 IvFH+ovyRmNTAunCS4JpkgxI+VHQnP6iT56VSvgU6BoxbihU2aCgDkJaVhnCbnw5D8AaxCF5TL9
 ofaypFoKdb0iSe5NWd3aYkl8sPmaXljZhuiX9uG/hIBQVPO17cjoh2A6+mwHATiPmgJUFnRt/wQ
 QlZdk4FJUg+sjZDgOd8/NZwZg+aVmtB975ZX88ob+ZCjXWnH77lqCLveZT+mCYIJJaR7u3XgTON
 0mbfQaaH/oI1c3edP6DALE4SV/LbjwpapkAkVEjYHD6k53dT3deoF20H2Iy+aiyAaA8CZnUF
X-Proofpoint-ORIG-GUID: 9MJuFHlDixll8wyiLyts7WgufRXJ2otA
X-Proofpoint-GUID: 9MJuFHlDixll8wyiLyts7WgufRXJ2otA
X-Authority-Analysis: v=2.4 cv=Hpl2G1TS c=1 sm=1 tr=0 ts=6893a408 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=iyolZM6xbs_oNVwb980A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Mon, Aug 04, 2025 at 08:06:59PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

I am confused... is this a R-b that means that the patch can go in as-is, or
are you expecting changes?  I also see discussion about a README.  Is that a
prerequisite or companion patch that is expected to go in with this one, or
is this one separete and could potentially go in on its own before a README?

> I wouldn't mind a blank line separating each clause from the comment block
> that follows it.
> 
> Incidentally, when git applies a patch with "git am", it squeaks when there
> is trailing white space.  In this case, "both" (at the end of a line) was
> followed by a space.  (That trailing space was removed for this patch, but
> might still be in the original.)
> 
> Depending on where we want to go with this, it'd be nice to have tests for
> examples, so that if an example is going to break that we'll know about it. 
> There is currently a test/demo directory with a similar purpose but
> antiquated tests.  Maybe there could be a test/examples directory.  The
> trigger code could possibly be something we already have.  E.g., in
> test/triggers/* -- something that terminates by itself (or not) and has
> nontrivial call stack (for this example) or even multithreaded!  And
> predictable (checkable) behavior.  Possibilities include:
>     test/triggers/futex
>     test/triggers/libproc-dlmadopen (multithreaded)
>     test/triggers/ustack-tst-basic
> but one could argue that's beyond the scope of this patch.
> 
> On 8/4/25 19:42, eugene.loh@oracle.com wrote:
> > From: Ruud van der Pas <ruud.vanderpas@oracle.com>
> > 
> > This is a script to list and count function calls.
> > 
> > dtrace/ChangeLog
> > 2025-08-01  Ruud van der Pas  <ruud.vanderpas@oracle.com>
> > 
> > 	* examples/fcalls.d: List and count function calls.
> > 
> > Signed-off-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> > ---
> >   examples/fcalls.d | 88 +++++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 88 insertions(+)
> >   create mode 100755 examples/fcalls.d
> > 
> > diff --git a/examples/fcalls.d b/examples/fcalls.d
> > new file mode 100755
> > index 000000000..8116ecc6f
> > --- /dev/null
> > +++ b/examples/fcalls.d
> > @@ -0,0 +1,88 @@
> > +#!/usr/sbin/dtrace -s
> > +
> > +/*
> > + *  NAME
> > + *    fcalls.d - list the functions executed by an application
> > + *
> > + *  SYNOPSIS
> > + *    sudo ./fcalls.d -c "<name-of-application> [app options]"
> > + *
> > + *  DESCRIPTION
> > + *    This program lists the functions executed by the target
> > + *    application.  In addition to this, the number of calls to
> > + *    each function is printed.  This information is given on a
> > + *    per-thread basis, as well as aggregated over all threads.
> > + *
> > + *  NOTES
> > + *    - Since a.out is used in the probe definitions, library calls
> > + *    are excluded.  If a library like libc should be included,
> > + *    duplicate the probe definitions and in the copied lines
> > + *    replace a.out by libc.so.
> > + *    For example:
> > + *    pid$target:a.out::entry,pid$target:libc.so::entry
> > + *      { ... }
> > + *    - It is assumed that a function called main is executed.
> > + *    If this is not the case, this is not a critical error.
> > + *    The first probe is used to capture the name of the executable,
> > + *    but this is not critical.  The probe and printf statement
> > + *    can safely be removed, or replaced by a suitable alternative.
> > + */
> > +
> > +/*
> > + *  Suppress the default output from the dtrace command and
> > + *  have printa() print the data sorted by the first field.
> > + */
> > +#pragma D option quiet
> > +#pragma D option aggsortkey=1
> > +#pragma D option aggsortkeypos=0
> > +
> > +/*
> > + *  Store the name of the target application.  The probe
> > + *  is restricted to main only, because the exec name needs
> > + *  to be captured only once.
> > + */
> > +pid$target:a.out:main:entry
> > +{
> > +  executable_name = execname;
> > +}
> > +/*
> > + *  Use 4 aggregations to store the total number of function
> > + *  calls, the counts per function and per thread, both
> > + *  seperately and differentiated by thread and function.
> > + */
> > +pid$target:a.out::entry
> > +{
> > +  @total_call_counts                          = count();
> > +  @call_counts_per_function[probefunc]        = count();
> > +  @call_counts_per_thr[tid]                   = count();
> > +  @counts_per_thr_and_function[tid,probefunc] = count();
> > +}
> > +/*
> > + *  Print the results.  Use format strings to create a
> > + *  table lay-out.
> > + */
> > +END {
> > +  printf("===========================================\n");
> > +  printf("      Function Call Count Statistics\n");
> > +  printf("===========================================\n");
> > +  printf("Name of the executable: %s\n" ,executable_name);
> > +  printa("Total function calls  : %@d\n",@total_call_counts);
> > +
> > +  printf("\n===========================================\n");
> > +  printf("      Aggregated Function Call Counts\n");
> > +  printf("===========================================\n");
> > +  printf("%-25s %12s\n\n","Function name","Count");
> > +  printa("%-25s %@12d\n",@call_counts_per_function);
> > +
> > +  printf("\n===========================================\n");
> > +  printf("      Function Call Counts Per Thread\n");
> > +  printf("===========================================\n");
> > +  printf("%-7s %12s\n\n", "TID","Count");
> > +  printa("%-7d %@12d\n",@call_counts_per_thr);
> > +
> > +  printf("\n===========================================\n");
> > +  printf("      Thread Level Function Call Counts\n");
> > +  printf("===========================================\n");
> > +  printf("%-7s  %-25s %8s\n\n","TID","Function name","Count");
> > +  printa("%-7d  %-25s %@8d\n",@counts_per_thr_and_function);
> > +}
