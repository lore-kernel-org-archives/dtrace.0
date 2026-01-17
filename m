Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4B42C0285
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768618691; cv=fail; b=kDIgzLN1/P4+K41YvQ5efP0AqWWtuQWuIe4VH1ja+o2i7JI92orKjTF02YAVJGzKu7dU+C2lAdzIS7RSDJr4yRVopPaSD7+gJwbmh4vxAOAzIP7lti9GIaw7KKJfLZVDloYSBtUohLciylltRkM50pDnKBtfOudFE6wwK2PLHOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768618691; c=relaxed/simple;
	bh=pWm3Htodj5bv8vwPBxLho/yE0d3aT/4NlyR/yPW3YNI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OHxan6Don/chQKPhOEY7Wt5kjxTTeVaVG52zdybdMZ8A0Vw7TTaxg3CCzsZSGdoCR3L3bq/2oHF+WGRzcsJtQCQteRDvKOEZfqbG2PI2JTz7sUZOsQBQajtpszwuJ4A/gP9ixKnDvSoWS0i5SNs/JNVeruJtZ5lZOkb3jpiwHK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mnvvHQDw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ST7576zY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mnvvHQDw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ST7576zY"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H1hL0C4035805
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Bh6o0CpD5BYD3nkr0y2s35QX6hZNpQ97PFuqAiRvVp4=; b=
	mnvvHQDwetckW9GSU9fXpY3WQiU8PqwIirkMrpz/+kvvTzU819bmN3RXqrvlFZSA
	LSMvcimwUyaCjbGSH2IqSEHInu4R9pt8ROT7JhtatAEbWiQwkVpaVFjY6xXHFAul
	ri/4NZXuoW13AZTx/viTneKT2ui26gMe9Qlx8cPBEhQE7TFxOjym60FufSK5V7Sq
	BkU3Y/yFjm9Ug3ysRZE63WHkTcGXyRfGpzbF70AiZ8/jmZUoUViUN5fIcUDs31w6
	IM4RrCaj4LjJDFF0a6s7MS3MdVDtSWgjeJmHvw17RYaQf+6esEXosr69RoLsgAkX
	tFTo/VK5tJk/m+3XHpolFQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br10vr1rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:58:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60H1Y5Vx022456
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:58:07 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010060.outbound.protection.outlook.com [52.101.193.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0va1nk3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Jan 2026 02:58:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JupQZusA9GL9799tN6Gds3eoF4PgGah/LZ4yge5F8j67bKVRmJf8CCXoNupsunUwl4dCM/lrKFhgSYPLfcL6zvVXMz2U0vv+M1PRbXc+XnBRgNT2ugS/zZw2MmNqthVZMhq3MSFIZ104nPk0HsVOdaeZsCNVCoLTf+Nbq5aicPjOuV9MhjSoHtgtf413/YY4xpZopW9IJW0ORjNCsDQtnc+ElQJPFSl6u69cYiK3IKmvJje6xEsYCgLAhPNNj0aVVDBD1ir2yxXYma0bs+SE/ikjZT5FY7gdbW+un8x8xuoK1DNPzPyuRnIxeDoeFIY94g5AEurgLGt9qemVx6KIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bh6o0CpD5BYD3nkr0y2s35QX6hZNpQ97PFuqAiRvVp4=;
 b=BBDTrI1SKpZfuekAZp8MqRFhG568EPezMMBnijOg8fEE5mI4Q4A/YKrKmXVRd7zGbyIphaMHh6LQPLatBETmZSXUkNHOGvgqQQ59SQFWuU/N9BflGf5P33ENHT/bEl/VgMQt9u9Bnfn2C64Sy8ExYHoe+sJPev2IpEfu80nkh0dYIbb9huMQ8TtCQp+JsIYs3Yg/P6djRjapxuFX8r6LDPOrnYP3yA+hV01i9cSU6MI65fYkZZ8WfsikkxP0gDaaZJqiYoWRWVL5CG/arpmwz982VlicN2FGhFHQMp+JaojuJZ0gURhNAUZ5mfI4fWopTU5p1zQ5G20bePmabsbqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bh6o0CpD5BYD3nkr0y2s35QX6hZNpQ97PFuqAiRvVp4=;
 b=ST7576zYs00YURyJp3ObY8jXZLWKFs3zcV1lcPvhg6+epjHvFsh96g8CvaR1TlJXPFf0zFYTFQH8GifAKpQP+0F4RC/0xglOIHHOt/tWKilmpB+PHBYbOC3+f2Z0qnezmcjs2535RsgRfSxUiZkehzIFW0eaHi4AXhabbxvcQv4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB5153.namprd10.prod.outlook.com (2603:10b6:208:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Sat, 17 Jan
 2026 02:58:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Sat, 17 Jan 2026
 02:58:01 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Add ERROR clause to prevent hang from runtime error
Date: Fri, 16 Jan 2026 21:57:59 -0500
Message-Id: <20260117025759.26210-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0099.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: 626bd640-d03e-4926-d5fb-08de55743a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?48U0jJ6LxSa6zjukpkNqrfOeZvC7g+kKdR4Ny3X/cy6sM9Zm9YWvTORySjLS?=
 =?us-ascii?Q?G6To+vVAjmSZGIinObJJKdSIi5L58npNGU7nw3Hu5fndPcJkevcxuC3IIBVo?=
 =?us-ascii?Q?vNYVeKe4i90xtxjtDBWap7neXL3pDOR2rzJp87cSQNqhCdlPusw0XOTA2Vp4?=
 =?us-ascii?Q?7+bXtp2vDFhrrAearcrkoQTrNFNI80cGOQ8imexIl0TSiMnJq4Jl9mJH9w6z?=
 =?us-ascii?Q?zjzeZ+sAxIy0euZNipSmuHbse4HBGHditqjnO3vap+rFs2jS+eKOPGM6ZDly?=
 =?us-ascii?Q?bdoVcMo72KVGjtx5FnZhzy5LPF6b30D/IIR/blgis9HI/cXTpDzhQ0d6et1o?=
 =?us-ascii?Q?GO0ks0s+n0yaJgYsnlyQbKxD7J8bIdW++CrAoHLrW5XITQvZP/H45kGt2h2t?=
 =?us-ascii?Q?eeUGTI2Ij8mMJoFDWTzBEg2rjbHY/Wh7UPSOKrVpIxtU0encKyp7bkuLv1gO?=
 =?us-ascii?Q?bQRA6m//eU3ud2FN+PzSQwZGrXBhfGyOCq+SbdeDZWShBbNokPfrRmotEV0n?=
 =?us-ascii?Q?zKBufCRirJkhUf/61voI736IMI9sByNL+UjqU6q3h1udlGYXlw9OVTX8xaz/?=
 =?us-ascii?Q?gzvJ/8ifjNRwqYnpcVCklB1icj5LqprVEj8gI/1jEZE2gdgL3t0SctG/niTt?=
 =?us-ascii?Q?cwTfCWFBLHPUQs7wzZvXI5Z+6IaNFmRRR3x9FaVWZJuXJYpr0D9LafzQa2Yj?=
 =?us-ascii?Q?CMS0taP6uMkICbpmiXZCDUf9Uu7ixmTi2xnLPer4h1xak1kqHf+4vwZ3Dc6L?=
 =?us-ascii?Q?7+2vnAjEP6XD4MamO5toXeoQ0kmPo9WYrNnL10d9rheyfaxOmQmcKB7374Fg?=
 =?us-ascii?Q?DbrM1KPedwr9uXS+lqJ5kN2keiaYj/f+Uk1AgTFMZCdOgf5QioxoCer7tvvC?=
 =?us-ascii?Q?MyxdkJdTeH91W9GP0oMh23jiHdYP2mzHOg3RuBnnXY/FI3jXtiuPm2YSLme+?=
 =?us-ascii?Q?J1+uwPa2V+EaltDdWwcc9WbxehIAh8iPdmjr7zzndm6xM03iwFvUFWVWsD3u?=
 =?us-ascii?Q?dJIlz7JTIMLqM2/8Fu0hmqK2rUXoY3IYbclafJGoGBtE7sFrIibEnXi7N0NR?=
 =?us-ascii?Q?EE6SPNNb8y46RaH/XtRkjY2e/7S173ZCDvcr9fRKjPhHL5L3/vTQiFiYZlRq?=
 =?us-ascii?Q?zkOc5iUnS1QeMc+ZIKdiwQUfHEBbrdgK51ILn5IuihzpRfIdsYacmYVSjWc4?=
 =?us-ascii?Q?hrD8V1yZfb6Uh6V9RzhH9rcR79AOx83wM5XixVbK776pIQCOpFLY44i06/Px?=
 =?us-ascii?Q?sd078B3ldbgn7nmHMWxSBeASWo4nQGyNmC8ivA8HMqYG5++8XXmvqAa9emPF?=
 =?us-ascii?Q?pSgr/17HRUPoaa3pAeGs+55yx5tCOXc1gvermLeJvcE5ms9Ob7xNhyQ63q/9?=
 =?us-ascii?Q?TVV0V/IA/cbVHK0zaG/zfvH2gX99KUwHOhBx5VYS615r3L09t73eFhC17toZ?=
 =?us-ascii?Q?R9w/3g0rNrtdUsWj5rTGvdLNQsvSVMYjFzlJ0Ajn5LCRsQbANK6iA6lWzPS/?=
 =?us-ascii?Q?0pGori9OPVSy4rW+8hiCaWow9IDfFved/+57VYoUGyhkRMu16OIxePBbho/i?=
 =?us-ascii?Q?3xXPf5AvBHK8SQBOyVfhvgI7i8N8gOHttARJMZSs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V2pyMJAj8pTI6bHGSdZgm7a+1INjXTHxzqkUz1nNeDpK/rhffio6QrutBBAt?=
 =?us-ascii?Q?yDRgJlS2tqakGPZbMyPBa1PL5IGe8EoPvaVm8+T0pq7FULjo7eKd0Lys9XcJ?=
 =?us-ascii?Q?Tb0Bj3bG1Zzr/AUFnZ2S+RXkf7W/FnZQRhM2PKHoGXpNygHLgdsjIAP0Po8H?=
 =?us-ascii?Q?8bfVGa4KxRNC6uepjXcovkN1QDyBUUVJ0vRLhdeZwrEqlnd3LZx6Sa9Dxb7Q?=
 =?us-ascii?Q?e8+JVKpLS857bCz/ZovRJ9vkIanjI2isx8RGw48URQz+rD957wALapNcBG2i?=
 =?us-ascii?Q?VjhoqoEczpuDpY4jpg69L/db+mSFnvey5k/RolfpQStGZ45wfI8F9+r71Jcz?=
 =?us-ascii?Q?ns4jJk/2z2h15cVEz8A9lNlNH1U79Z9BHodpqOgzN2Li6UYmnpwRxC5PYPsi?=
 =?us-ascii?Q?CvpnGJsUcrHwcP/knl6QZTQNbbTFQA+OH/X0WlZaqIViwZEF5NYz4ihlv2kx?=
 =?us-ascii?Q?u5TmnuywY6lLAVunqYyLKwzM+GSQye9T4DP8gESYUiM2PurnziA8lTFa5dyq?=
 =?us-ascii?Q?CTyRjagSJksRILvTmvWBKOIrRKTKtxUgCbiGFvrQXsaCoDAJOVURn11riyqY?=
 =?us-ascii?Q?BydQoxtPaeWAp3NncHGQxpbCKFJHUAe+QHWpmoLn3H0RTnRJtIXxwgTDvqys?=
 =?us-ascii?Q?oFh7WNsAbZMmx1Bg0q6RyR3/l2eT4FQrvrjpbPgvFeZNvG0CVOsK/b1wFfjS?=
 =?us-ascii?Q?l0lnqM9JNWj62aasEf/xatobkkwEjxSgGWzAnkcaUxDIZ1h3WD+CEkRrmCtX?=
 =?us-ascii?Q?x3w/mnuk07e85/mC94GQfLdUskakcNvm2FJPmiTifD1Kbn6KY0Rp3iQejlKE?=
 =?us-ascii?Q?PraHA0ZjN/Nty8LKEUL3wHdSocCmPml3LMtHZXhzxq5Rjuk/TFyifJx/7K3v?=
 =?us-ascii?Q?HIqRdhJjwZS/wDdyby1N2ZpVrwnN9lEAaeMgFIuXHWzNyOoS3E3pJ37sh99T?=
 =?us-ascii?Q?YtMMFgblYP33fBD/Smz9iwmQkw4Q2O4Uy9f5Va8SXk2oxocEQmeKajLAs3gD?=
 =?us-ascii?Q?IbtuCGnJzHuBWYLCnLLVljPlgdgHdQJYPPyTGHF2r+lWUmlTgD81TKafzYhY?=
 =?us-ascii?Q?kZgSzzWHybrm2ZxYqcFcOysbWF5gqrUYIDHNNWjQekdYGZefO8O9NV7ioam2?=
 =?us-ascii?Q?z7f0aYqpevj5NJuips6wMKbqKmfThpidFF22go3KFgQyDV35zPpMhSw7HnVT?=
 =?us-ascii?Q?fa9MO9nNk5sJao7zuKjvVdIrcY0GWc96+DW0CgiK2BBx92UVJWWHPgGBcwGu?=
 =?us-ascii?Q?umihpqK+pHLqKD5yl3hnkEmd4zM3WOb/1XGDjHBhDjSFhOAjbMBzBnfDbRWC?=
 =?us-ascii?Q?zCxbWB33d6pEbMd40ZlM3nxMw2xhObI9hyGwjvCfNz3HGVboExkylBqeuaxg?=
 =?us-ascii?Q?fUNW87DG8C+lvRFTm08qMJzp9V6nmVVoH12yGZ03HkY9aN83/KmGZs5AhWuc?=
 =?us-ascii?Q?9L3hzMhOKrcEuw4jKrVYkPl/1FUTZuBfGROjo65fSv0Fi70lXYOotGG7mFEL?=
 =?us-ascii?Q?vow0fwtqL9WvOKOjN6ku/x4jA0MQYjfkNtV2iHooVq7ysT66zFKXhuH/Htg5?=
 =?us-ascii?Q?UqCycJvNy+ug6QoGqa0YoaUA2Yp4cqw8ePqCxrcNaYMUdeEyGOFI3ILPFxgO?=
 =?us-ascii?Q?kIGAsGgcxYZLiPsPSvb+K/ZeCWXpkmo/cdclkNWBBwfz4nrh7Inn7oqrPkGj?=
 =?us-ascii?Q?zmwZazyihRGD0zZrk/BXIx9rYbv2Wd/WnXA+sdT2QRbco/Ltu0+golY6TYSE?=
 =?us-ascii?Q?Q5qMF3ry/w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S7rLu64M2x3WpldX0ZtxHNze5I8BdaqyiJlEudOgrV1tKgqgJa5Ls3sjZRpqA5AXMWfOec9KsxLvFAaL4bFRJDW+MktkcuiwhMBMX7+nzIk8CtOuxDrtR7BBiwEk03qtDiqImUp7EuQZdp7MWzqnYScKbrbw1ZyYW/AWC2Q0mf61N2+HHpA1XCXygVFBBiHHE4Lb14GD+2KLMUuQcf+5kMMAC11D03z5LA4sdCxYzZ0qn60U3fjgsnfNoe4jOdEolMWyqTRYPP/vDHhXprK1JR+MhUeq0YxAfdayuPfYM0E3AajNCgok1jBcBkBiRGiyyO9uiMNoLAO/L2numvHRmcYE91DG16hCqYElYSGm9FSSnYBfz+VYUIdzpBTVuhlllLrwb+6ShBhaje3ls9x2+FoX1fpifTwlQBICjYPbxDMfSwp4bgcrHnOgZ9K8QyGz2tkSgRJHNaW3YpiCvzNJ1id5b4R4Y8egjc6VsbYK79J8WjQ/+TdJe7GZbdd5E2yvrQuRZc4lD7m+ZqU769hNnf8/ym+RzFqw+3JXT3510qmt283jLa4wOTtF9rGNm+r/LXe2BdOzgG2QuyKyvxhmQSrLCL6BjVYt6iHfy+fmBho=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 626bd640-d03e-4926-d5fb-08de55743a1f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 02:58:01.4112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cOgDBAQjgEQ1ucOLTMrYqHGpjXn1GpjM/2THouFrq9D7rkA4VBYKvszbeA4DinI6bauUPYWRHtbsyVJq3LfDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601170023
X-Authority-Analysis: v=2.4 cv=H4nWAuYi c=1 sm=1 tr=0 ts=696afac0 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=lVFsP0LyvDe2ofc61JcA:9 cc=ntf awl=host:12109
X-Proofpoint-GUID: FC9rPjppHULtthfw8Py2d4iA8gq_1no7
X-Proofpoint-ORIG-GUID: FC9rPjppHULtthfw8Py2d4iA8gq_1no7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDAyMyBTYWx0ZWRfX7Qt/BOH58z0G
 ufZwZAfOzNm0DQg4WJeDw/4TERfHRdKIhVkHvs9C1+FHBpPOfxCFXZChOFEQn4dDMPY2Jmfj95U
 wr4O5uO5OOjCVMAW6jXoieqJZ0snA4D2mdh40G8lciJ/zn6Ym7nHYot5LCxhgyrC/i4kZ45d5mx
 vasytbY14IggL4JGErlmV1G51rbVQ9DXY/YTunCO9W0ApjcX8giCndZK/FjqkUTMxSoMWFJSHx6
 CJyl4tBnB4zceJzWIBVWSgvk4YVOzoT34njQ46HMUk7zQLoDZlOgJACIM1ghS6NFJItnaLZbXeD
 /V6V5KSUcuB/mPIA3ALOm97rib8k6dESNPm3HNcGwbqFrkTO4La6JW+MxamG6RW7CtKVxxbdPXr
 LMpjKz1phMjB0wMCjOvSoInKaRis0OJ85pYr8tB0xdB6D8e2O8WgR9V+AeGf4/mYdQo/FM5u7ky
 BP+VPzSBkuH8Z9Ef7Q62to4CQbttayzYaEp4ZSOc=

From: Eugene Loh <eugene.loh@oracle.com>

These tests XFAIL.  Since they incur runtime failures, the scripts hang,
waiting for the test suite to time them out.

Add an ERROR clause to each test, so that XFAILs do not hang needlessly.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/funcs/strtok/tst.strtok.d | 8 +++++++-
 test/unittest/funcs/substr/tst.substr.d | 8 +++++++-
 test/unittest/types/tst.struct.d        | 8 +++++++-
 test/unittest/types/tst.typedef.d       | 8 +++++++-
 4 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/test/unittest/funcs/strtok/tst.strtok.d b/test/unittest/funcs/strtok/tst.strtok.d
index 8ffe1066..b39e44bc 100644
--- a/test/unittest/funcs/strtok/tst.strtok.d
+++ b/test/unittest/funcs/strtok/tst.strtok.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -124,3 +124,9 @@ tick-1ms
 {
 	exit(0);
 }
+
+ERROR
+{
+	printf("ERROR\n");
+	exit(1);
+}
diff --git a/test/unittest/funcs/substr/tst.substr.d b/test/unittest/funcs/substr/tst.substr.d
index 4dcef73b..580dfa0f 100644
--- a/test/unittest/funcs/substr/tst.substr.d
+++ b/test/unittest/funcs/substr/tst.substr.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2008, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2008, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -209,3 +209,9 @@ tick-1ms
 	printf("\texit($failed);\n}\n");
 	exit(0);
 }
+
+ERROR
+{
+	printf("ERROR\n");
+	exit(1);
+}
diff --git a/test/unittest/types/tst.struct.d b/test/unittest/types/tst.struct.d
index 627a8585..77499789 100644
--- a/test/unittest/types/tst.struct.d
+++ b/test/unittest/types/tst.struct.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -49,3 +49,9 @@ BEGIN
 
 	exit(0);
 }
+
+ERROR
+{
+	printf("ERROR\n");
+	exit(1);
+}
diff --git a/test/unittest/types/tst.typedef.d b/test/unittest/types/tst.typedef.d
index 744c93c2..7ec3bcd3 100644
--- a/test/unittest/types/tst.typedef.d
+++ b/test/unittest/types/tst.typedef.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -49,3 +49,9 @@ BEGIN
 
 	exit(0);
 }
+
+ERROR
+{
+	printf("ERROR\n");
+	exit(1);
+}
-- 
2.47.3

