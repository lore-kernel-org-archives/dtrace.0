Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0226B258ED1
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 23:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762902595; cv=fail; b=Qz8NIsKQZi9ioYoGN3vFjaZs2Q6qWuboJdTOlDuWfX3azLwlhNZ3S6Ju1QBIaG87//xViPFjc9gTtsq9M3Kq4VQIxivRDH5EN26YckJjKHsLYrx2cnBJsY6Zi2Qltz8+TNBc4LJGBHGdWoEBs8oOhTQQXYco/Duw9sv3/97sVGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762902595; c=relaxed/simple;
	bh=44Akq0XblGdeRa7asryMoDRZokm+LWjg4g24xirbKQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X+EcvRH7zD26qveMgckmGBpb+/J+oShZI0aFEOJcBkSfrih5MSh0mNROeqGB7YofLrmTRgzncOIM6VJUH6glIBP9Q77X/1PkdaQy7aDRrGxJD6qAW4OS9WYVHoohK5H8yChOMQGFmHV97VzTR7uX8phAX1k6ldzN0ddWP3U0Djw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Lv1Uzw8k; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b+ECrg9d reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Lv1Uzw8k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b+ECrg9d"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABLVCqA031594
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 23:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=VJ314E0Z4vOCgrRduUwUj1JoxaP1TZTIkCsuibnHbx8=; b=
	Lv1Uzw8kIxz/bCEEsu4b2YWpfFx2E3XaQdoOqZQ5WASFA+44xmzCmaR7qm4u7XBx
	+qvY9zs5lTFJi4DGOQNWPNhSZd/IqNvLXn24EJSPvQO9BmewTGPN+Jclcpk1DrA2
	dNQL2yO0OYagAPYTMIaA1EnP2e91dBsPFtz2Ky+rCgV4fd3fQBW48vS/FYGv/2/f
	qujN8v26aL2zj2kgNowWG+d+p3kykBQjMHkeCRMqkjvdZUvP8+Hefdt2UdHFHaVq
	fbr3iu9HDMrb2JRKC29yE/K+3UjV8acgWAzYZ7/uHGrIE+Q8CpzUc+gmkux5dSO/
	XvKHMJVnZsIKEWU19bZkuA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acd468617-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 23:09:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABL2YfK020370
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 23:09:52 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010033.outbound.protection.outlook.com [52.101.61.33])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vaa089a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 23:09:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQCOPJEYVd8ieS4oAuKuBvKbGCAlx2UjEBai2dSweTcnBzQP1qMgCaQ+ZiEBVh8+9o2Jna6CEoNDzb6S0SeHEgg240HjVx5y+tjsVwmTgZ32i48+xFeVJAllj2yxTWR8CLZeLacY47uMlwJx+8Yu9xK6DDy9leu6gQj1eHw17bQ6CAnUXx6tPYh7DTYsddCGM0ym9v9+KD3LVUss0yuH87Br56GRRH7jLhbs/DJ1aEQNjbdFhba+Gs4FbK4UddNeq1tP56CZzLi2Ta2IzW+mvkPARSNo465DTSsJ19ppQRJYN3YYL7gcl75snknfy7z6f+XU4uVDYJlEI3cx4PiptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ec01BAKfc62a1hTWbXGs22f58ZUfv2Mtber3fFotAjI=;
 b=OXpOVLRCGNRv/BOC/2payEcchx2PYpQf2TBIKPfZ3dfeLWH5h3+uXCkQB7N4AD5wDaOmQWkxQeNpPkHdP4//iKaqfMjLSWX5Ydn2oEeSWCC8TTazLANWNx6atuwG6jUOohN/Qif09r3IdfwU7sTAMNLRCq5yxNlasdP6CIpQT46BnAKX80zbG6TBWlmAp6gR92KIkVFFnPLKJj0xu4vRY7AvI/8s00sVWzKnhvtG8jcGVea/QWrjxC6OsM0bWva6Q5uJrDkZqUmqVfsjhNqZh0Owx/1/VxTr1z8ckF6TJZvzF2oSZ8QX0yXdTZ5d82xiyuioQKIFrRSoKK1vaJJoxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ec01BAKfc62a1hTWbXGs22f58ZUfv2Mtber3fFotAjI=;
 b=b+ECrg9dHohWxABdhe4GAlF752fcuJ03E5avar9BuFwAWx53XCQtSmHXBpi/n+TNqsIEycV+0s7sKiLzoRslU8/Fw7kJyyvFnpWN1MG/YxVxau5D+lemLkYyb/WsL4Q8hEjjtV5OADjG7UAUixI7b3OjhaMLzpfcaVD8XbUnc1Q=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by CH0PR10MB5067.namprd10.prod.outlook.com (2603:10b6:610:da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 23:09:48 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 23:09:47 +0000
Date: Tue, 11 Nov 2025 18:09:44 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] test: fix tst.depth.sh to use proper trigger
Message-ID: <aRPCOEjZr75Tzf6B@oracle.com>
References: <BY5PR10MB3987726AB973C7AE7CB6D4BDC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
 <2f960b99-eaa1-d3f7-11f7-4643adcab8fe@oracle.com>
 <aRKmvyBLFPNRYOM3@oracle.com>
 <67df532b-f980-5ec0-ce0f-998d524829d8@oracle.com>
 <aRO07LKhWrmbhHEM@oracle.com>
 <00c33eaa-f2bf-d884-0552-d32ffe7e6a2c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00c33eaa-f2bf-d884-0552-d32ffe7e6a2c@oracle.com>
X-ClientProxiedBy: BLAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:208:36e::19) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|CH0PR10MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: 4959b17c-dbb6-4043-ad6d-08de217768a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?WIgdyY6twcbqw6VkA2L30hSCI7Cg0KIWltYwVe/W4LTdYDBwfkzc7kvN4c?=
 =?iso-8859-1?Q?OJlOcpfAZRa5gVs7lhu/QFl9+xXq1p3DGoY0uCJ8bp7oMlnzACRZT3oJVa?=
 =?iso-8859-1?Q?kvovR23idM4qWlUIYDL5XEgQj772GRQ1v2DArF0PrmCyawPvepupxftRUi?=
 =?iso-8859-1?Q?CCpsMr03QdP8RpGfnTvH/UG4ztDfs2YD1U/yrM6nnzqUETzxzKjEvNcdj0?=
 =?iso-8859-1?Q?4MEvUqptDJBwDh5oFNSpv3f99YECHVDbbH/JuF02DB5lRnzo93h46s0kCg?=
 =?iso-8859-1?Q?XXx4Mjn89l24eQe1Zvsl4wbmrPEOksbeioPFQFcItTcGxXzd/mOOF/6sOC?=
 =?iso-8859-1?Q?8UikrDhL8VgSeJwPCy3abNDt1+lg77FRO8s+OVQTsoT7SD+O0IXdXhsMhj?=
 =?iso-8859-1?Q?zjc7oX8O9FNZGQ8kXNsslQfMXF0RZe7GBgYH4dS6Jxz3e+qvSR24ufLLJ3?=
 =?iso-8859-1?Q?fxFnxBDEwO5XD5Cc/PQhOyhBNCgmlvtAvPZ0CzTpty5hNWp4s4JMMMZQ5A?=
 =?iso-8859-1?Q?BOcJjtoPbzW62hIDDS0LCaidKDcNx8l+Ztt6QaYeRAwe+gbt0+njFFznzS?=
 =?iso-8859-1?Q?lHtvQtWbQO+bypvhHZZU3m11ITE+Yc99SM3Ph4mLef/6j2IcW6KhMfwGQS?=
 =?iso-8859-1?Q?+VgodLNzZXpj0fzQO/a2H/aidc0PoVYmrS0VNNJL68ElQl+7/B0pcRc2bZ?=
 =?iso-8859-1?Q?FF8LotQAd/BrTTTAPqe4QOx/JCW6Rvobru4NB5qcPO/wfgkioXBKNjI4sQ?=
 =?iso-8859-1?Q?s+itLYmSgQeixOxD28c2PiO8agoBW5+9oATFTEdY92ZzPSVOMaBobkKg6l?=
 =?iso-8859-1?Q?AKmw0Xfsz9CARjyMuaUCDBvG0f6vV1W5wPoKexHZbVSV7cpDt48pEX6bjU?=
 =?iso-8859-1?Q?+pxmufISF9BrTqfFaS0w2rHDsd7m2auCQz8jTA60vtEb9CYF1Wk4b5rsum?=
 =?iso-8859-1?Q?DNgMit4lloy+GItJNdQTMq6n4Svksxi99t3C4aaqdtqxCREV+NFVnKc2eF?=
 =?iso-8859-1?Q?w6fxDf3Pj+2hVftHF4JwCSWneLPBegyFUvUg/lxjmt1qtUYqpBwX1F4kIg?=
 =?iso-8859-1?Q?lB8m//YRhsu/DX3qH+XPalIjiXpbBdlm6xoJkZa1KgQD2hXj+FfSzWkMbP?=
 =?iso-8859-1?Q?myinBm6YEEVrmsMkeaKTNHZzUbi1gHN8zJAlVkWmCC2OjBB46gegknMQZU?=
 =?iso-8859-1?Q?cjQvzwVegUjqaiCU5R9u8dWSv7XX3o4/Ws6+Ae8kv81n7bfZF2SlpAZEOt?=
 =?iso-8859-1?Q?OA4RtGxoYXnL6C5R/BD0Vh6bDC2pR8u0cMy7HXojbI5oYr8Brq4+RJhhye?=
 =?iso-8859-1?Q?IGeKiZ9sFjUJNlKjcUQuwThzwZkO/ERYqnGqSkEy1ShFOCFqe9EjtYLFJF?=
 =?iso-8859-1?Q?YUGEZfDo0t13RRObAy31uwHl1qjmySGgTzudpm/YMkpDx8flMgGs7bvJSO?=
 =?iso-8859-1?Q?vTXi2g7CXIUp7b4RbNFSvlT/5rbaxJ8qd3tgv3dxh/NfaYVdmGPgLfhYyO?=
 =?iso-8859-1?Q?2VZrRAfIv4BEYWt6WIAU0M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?3V1RHqUE94BLjSiPdzY2AV4rrQ6h7CSx87g1o/w7T0RGKJQhR8osNRSONf?=
 =?iso-8859-1?Q?sxmY6nRwrHeoHdV+SZ70js2UnVF99nUzHi/jonKtEdgfVfAvqoGVWil4TW?=
 =?iso-8859-1?Q?CrOzbfZc/tH4hVYoAmEa6amJft2rfbQTHh2uxqI3NLDdG1JO8LGVJKUKGE?=
 =?iso-8859-1?Q?DTQv1nUAtvLu4K91TfN9c6WMTQHBJ+xstgMwLTULID45Cs+VhkoHLnroNM?=
 =?iso-8859-1?Q?Ags9DB/IXyvvaTEQHYLmKuAK6LjzgeW6Mvkxe8hfUuk/IySVvjlObl/Co0?=
 =?iso-8859-1?Q?6tO0eObPPFBXrcyes372uLsvDwRurd1muEbzbK7zU3FKE5hAAcXMpRMOcL?=
 =?iso-8859-1?Q?lxLnG9HQvaOKqq9z1hrTzXGAqvPFQ/V/EGUkHKizMKa4zrw8HwOmLwvSqE?=
 =?iso-8859-1?Q?RZcrzFFnfV0BRbh4u2AXPBiUbKJdddjCgebNMi6SDjfctUeA5ALdWWnZMk?=
 =?iso-8859-1?Q?sR+WkdKHCSx7QsU/lWm8SMOmSeqnytZM8hLAv7/zW1jtDRCySsUOw7Q0vm?=
 =?iso-8859-1?Q?ZVwAmTl1XP5qMmUWixX+8P91EXcL7ZQM8fq7nLFX3ENt+EjQj4NgLqAy+f?=
 =?iso-8859-1?Q?pEwiF+AzK5KOyOPU7qBh+43Q/7l9uY/i2EpRbNWr2Aqziu4kgdAHHnB1S/?=
 =?iso-8859-1?Q?muC/5OnVtp2zcPbIDGg/pEhQcTlnOW6ySp+apSRSAlJFhJlLRE5byapCC5?=
 =?iso-8859-1?Q?Aeuprbt01iPPntk85YU8SD6PxUMzkET4DeLDMg2SRWtaXN/WnuBzQlXFn1?=
 =?iso-8859-1?Q?5KvziKEFTlfw0V8Mk4tlkvxT/X3PI8r7FTE59Vwj8s4jFFcGc16QZg16jo?=
 =?iso-8859-1?Q?QKzdpHOpkhIzg5HV4dqiskTgTSV4TshX1hW2CWJmHbtqyBVfuDEzyVL+EK?=
 =?iso-8859-1?Q?u9wudLfBmaj7/syrOE8NTOMlZdn9DsKbal9GETsOTXXJJTrAZOqG5Zy70Z?=
 =?iso-8859-1?Q?C8KWpl5wzaemAydVbh1/151jqMfmth/zMf5InibG1+Q0XM+5OH6XRvYjQl?=
 =?iso-8859-1?Q?3wDQT2L2aqQ5k8K5aexwUXtvdcMjqBKNlTkVpuo2j7pZhDGdpzFQ/MYGNS?=
 =?iso-8859-1?Q?Wy1WjyD99ryK8ma4tMbas4olBjg8lc0iyCNfB3Gr5VZLaH0LjwgxY33JNB?=
 =?iso-8859-1?Q?XS7O95TYhyzqeGyzVNwZc7lOSTLg/Bu2tsmJ3exoHDAFXx0zrz9VqEKY66?=
 =?iso-8859-1?Q?BqMrndRzbl59xeKtElh7Z0Rwn5PQwfAi04NbLAL+O00nHe7xzULsl6h8ph?=
 =?iso-8859-1?Q?q+aLBFRbG1UKkCc5s+ihc19TLI9/Q+OKnh6FXL5nRohd+mZACb2DLNajLj?=
 =?iso-8859-1?Q?Npvgmyh6uXXXB4mrwSj0ePf7d0QgTls4/nIhGI1zGpNoeGFdwZiIybUJYp?=
 =?iso-8859-1?Q?WcdjvAA6326gUMVVs88RkIzlCEhYghlVAUiZsLeYIijNAJM1KttSIV8J21?=
 =?iso-8859-1?Q?KcuwgqIhwKFe13l+TAJ29LWjpEQVHVedhzjW4+geCeMVtoTQNJiadPr6h9?=
 =?iso-8859-1?Q?Lk5uiF2AneldpWnU9mMRxAYRMj+EjUlEpMcYXe/6YPbjxwUDDiD64P35nu?=
 =?iso-8859-1?Q?hAhAf+i6tDSgfQctvneM4fQNFrP855rskq3UNBZ+El9xtps7d1VPR3HoJ3?=
 =?iso-8859-1?Q?3OvOi4+WZGhGpSuvhXPGsUDsdfoDVa4dB+gESURmHQkbSIOFQIfv+weQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m5Ll8OaNv8ZC0w6/ZAoQauYF9lpAfC+9Dmh2RVs8hwn0RVj0KxvfMwBqJeygoCJyxfHY1bCDIwWQXmZiX44NESmHtDxTwgZ8jh9CE1kMJMJThrMZjhRQ1lc7IA0JOfhn7JhgVmMBOQZYvwK0dEqafFI7qIDHeV9CuAMNp5cfdyyOnR8LRFPHpPIpCHgYTJZvnz4JfBqa/d0ZASRmdxHTJFN9vAWr8g+1Vgj6BmHDl3LbOvUgGRdstvTBZASdRU1bxfwi3PsyKZYsDwmga4kSd81u48AUTs/Bo7q91igr3vYB9FRNK8CRGFtUBToa6/G0MpphGK5uO6FUclEwQ+Ec0ZBSAqEZlLFaS9hCPFhHt/WhqQPMzEWEzSnS3cfM5t8ygutr+P+TId9Mj+UssNDOQZ9OfVUCXqa1mEbxekARJOKLHk2/5DMbxeK0yOHFLFe0VtwIfrosGNN4NJi2LaApvie5RJ5sj/dcyTq490yaU2cwfmzYaC2NmRubJUiZmr4MzW3th6Zk3nyIQ2T2vx8bFKjXs9TyUmkZWXanR+HFdW7oHPxsJXGkN/C0mhgI7si6HjqstHycEtsQUHbtoyw4E7DF+bkd8o+I0/xJZiBD6pw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4959b17c-dbb6-4043-ad6d-08de217768a0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 23:09:47.4411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7hXmDyhTxyJzzI29aZn0Zn0ZoNVTY7rO9t1QEZ9IOA0SPxoXAiYEPS9Qg3yi6KKHfSMbf1G2Mg7A+rsVsrHqERk4Ap4f8qeN10zDROhkao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5067
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511110189
X-Authority-Analysis: v=2.4 cv=DMiCIiNb c=1 sm=1 tr=0 ts=6913c241 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=FYTserBjYhUVow-vFzwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE3NSBTYWx0ZWRfXzqGjANCx4cB2
 pXLJzXAm3B3X8Fw3aTLwA/mBhcffrMDbGuhHqFpWVjYAgZdI7YzFnzgvMaKJSxZpiTHmbXpAC/i
 RKh114+SmB0TvT+dcyhCMYKFyswq75jPka2G9oTARjnU65550BEPBVdlmqKR5B3xeGNxZUrh7Ox
 Vp0Jbn2IDftxrXeQTc/EUGNyUNeDiyTtyhtvh3LBbw1FIRviWlm+4wuSJ1rz6bnCtHmxyrwuWDi
 Sf/sTohLHc/ruU2EiYqW/HfSrZPYPy8A0zC2BY/qpSjHsAzFTDdirynMy14EuU9ul67JNt4+tPQ
 bC6tP5kBfUD2qdsMQw4LFPSQHxw7tDA3xQkB/AcxQlrux+/4q8cFuwofHdNY+fEIh63tDqCi0dn
 xIxUvZyx2haHQtmFx3I+k4rRyJJLtA==
X-Proofpoint-GUID: FLiBNPP7VrVNNebQmprVdBlmVAY1yi7m
X-Proofpoint-ORIG-GUID: FLiBNPP7VrVNNebQmprVdBlmVAY1yi7m

On Tue, Nov 11, 2025 at 05:55:48PM -0500, Eugene Loh wrote:
> On 11/11/25 17:13, Kris Van Hees wrote:
> 
> > On Tue, Nov 11, 2025 at 03:50:37PM -0500, Eugene Loh wrote:
> > > On 11/10/25 22:00, Kris Van Hees wrote:
> > > 
> > > > On Mon, Nov 10, 2025 at 07:10:52PM -0500, Eugene Loh wrote:
> > > > > I'm against this patch.
> > > > > 
> > > > > The picky stuff is:
> > > > > - the Copyright year should be updated
> > > > Easy to fix - done.
> > > > 
> > > > > - the timeout probe could replace
> > > > >           tick-1sec /n++ == 10/
> > > > >     with simply
> > > > >           tick-10sec
> > > > Arguably, the two are not identical.  It depends on why one is used over the
> > > > other.  Here we could probably go either way, though it might be nice to have
> > > > the tick probe firing every second as a way to generate a bit more activity.
> > > > Given the frequency of the other probes, not really important though as far as
> > > > I can see.  Note that I didn't touch the timeout probe primarily because that
> > > > was not the purpose of this patch anyway.
> > > > 
> > > > > - the "delay" env var be set for delaydie???
> > > > Why?  We are simply using delaydie to have a trigger executable to execute.
> > > > This is a valid use of it (and it is used that same way in other tests also).
> > > > 
> > > > > - the ustacks for delaydie are perhaps not very interesting
> > > > That is not the point of the test, and for that matter, I highly doubt that
> > > > ustacks from date would have been any more interesting (aside from the fact
> > > > that you'd never know because the test didn't even work with date).
> > > > 
> > > > > A little more serious is that all this patch does is swap one failure mode
> > > > > for another.  What for?  It's XFAIL anyhow, and we do not check that we're
> > > > > getting a particular, expected failure.
> > > > The difference is that the pre-patch failure was due to a problem with the
> > > > actual test.  But since it is XFAIL that was reported as an expected failure,
> > > > which was entirely bogus.  After the patch, it still fails but at least it is
> > > > failing for valid reasons.  I.e. now we have a failure we should look into.
> > > > 
> > > > > The real problem, meanwhile, is that this patch leads to lots of test
> > > > > failures, at least for me.  Not every VM, but many.  Oh, and I do not mean
> > > > > on this test, because this test remains XFAIL anyhow.
> > > > > 
> > > > > Consider a subset of the VMs I run on.  I get these failures on the
> > > > > test/unittest/ustack/tst.*.d tests.  Why on these?  Because they run after
> > > > > tst.depth.sh.
> > > > > 
> > > > >           +------------------  arm OL8  UEK7
> > > > >           | +----------------  x86 OL9  UEK7
> > > > >           | | +--------------  arm OL9  UEK7
> > > > >           | | | +------------  x86 OL9  UEK8
> > > > >           | | | | +----------  arm OL9  UEK8
> > > > >           | | | | | +--------  arm OL10 UEK8
> > > > >           | | | | | |
> > > > >           v v v v v v
> > > > > 
> > > > >           x x x x x x   tst.kthread.d                 FAIL: timed out.
> > > > >           x   x   x x   tst.uaddr.d                   FAIL: timed out.
> > > > >           x   x   x x   tst.uaddr-pid0.d              FAIL: timed out.
> > > > >                   x x   tst.ufunc.d                   FAIL: timed out.
> > > > >               x   x x   tst.ufunc-pid0.d              FAIL: timed out.
> > > > >                   x x   tst.umod.d                    FAIL: timed out.
> > > > >                   x x   tst.ustack25_max95_profile.d  FAIL: timed out.
> > > > >                   x x   tst.ustack25_pid.d            FAIL: timed out.
> > > > >                   x x   tst.ustack25_profile.d        FAIL: timed out.
> > > > >                   x x   tst.ustack95_max25_profile.d  FAIL: timed out.
> > > > >                   x x   tst.ustack95_profile.d        FAIL: timed out.
> > > > >                   x x   tst.ustack_max25_profile.d    FAIL: timed out.
> > > > >                   x x   tst.ustack_profile.d          FAIL: timed out.
> > > > >                   x     tst.usym.d                    FAIL: timed out.
> > > > >                   x     tst.usym-pid0.d               FAIL: timed out.
> > > > > 
> > > > > I think the problem is that tst.depth.sh -- with this patch, in any case --
> > > > > turns on a huge number of probes.  That causes problems for this test, but
> > > > > not in the sense of it FAILing since it is marked XFAIL anyhow.  (All this
> > > > > patch does is change the FAIL from one problem to another, but we still do
> > > > > not specify what failure we expect to see nor check that that is what we
> > > > > get.)
> > > > > 
> > > > > So, the problem is not with this test, but that the system is left in some
> > > > > whacked state due to having attempted so many probes.  As a result, the
> > > > > process "dtrace -o $file -c delaydie" is still around well after the depth
> > > > > test has finished, the load average remains high, the pid0 process does not
> > > > > run, and many tests time out.  How long (how many seconds or how many tests)
> > > > > does this effect last?  It depends, as one can see above.
> > > > > 
> > > > > This raises all sorts of other questions as well, such as whether tests in
> > > > > our test suite should be allowed to depend on running on a somewhat idle
> > > > > system, whether we (dtrace or the test suite) are cleaning up well enough,
> > > > > etc.
> > > > There is of course the aspect that this patch is part of a series, and the
> > > > next patch in the series should resolve the impact issues of this test.  If
> > > > it makes you more happy, I'd happily move this patch to the end of the series.
> > > > I don't see how it matters, because this crazy fallout from tst.depth.sh will
> > > > be an issue either way until the per-PID uprohes support is applied.
> > > I don't get it.
> > > 
> > > First of all, the crazy fallout results with the patch and it doesn't
> > > without the patch.  Without the patch the test was basically SKIPing
> > > (admittedly as a mistaken side effect of a test defect).
> > > 
> > > Second, the above results, with the crazy fallout, included the entire patch
> > > series.  That is, the tip of the branch looked like this:
> > Well, it was not clear from your email that you were testing this after you
> > applied the entire series.  That of course changes the situation.
> > 
> > Clearly, there may be more wrong with this test.  Or it might be pointing on a
> > potential issue where DTrace might leave things hanging in a state that takes
> > too long to clean up.  Either way, though, the change in this patch is needed
> > to make this test even remotely useful.
> > 
> > If the patch causes the test to trigger other tests to fail, then more work
> > is needed.  I would still recommend that we let this patch go through, as it
> > *is* a correct fix for a problem.
> > 
> > And then look at what the new issue is that this test brings to light, and fix
> > what is needed to fix that.
> 
> How about having the patch also SKIP the test and we simply file a bug to
> track the issue.  Otherwise, we're simply invalidating a bunch of other
> tests (in the process, increasing the run time of the test suite).  The
> cascade of FAILs is even longer than I indicated for one of the VMs.  The
> patch is a fix to a problem, but it's only a partial fix to what's going on
> here, a partial fix that sabotages quite a few other tests.  The related
> problems can be tracked much more efficiently and directly with a bug
> ticket.

Sure, but then I would suggest you submit a tiny patch to do the skipping, so
that we can revert that later without also reverting the needed change from
this patch.

> > > 59a49ce9 (tag: 2.0.4) doc: Add blank line before bold text so it is rendered
> > > correctly
> > > 61e69762 bpf: fix file descriptor leak
> > > 20780963 uprobe: remove unnecessary enable_*() functions
> > > 170c4cf9 test: fix tst.depth.sh to use proper trigger
> > > cf7ae35b uprobe: Implement PID-specific uprobes
> > > 
> > > If there are other bits/patches I should try, let me know.
> > > 
> > > > > On 11/10/25 10:27, Kris Van Hees wrote:
> > > > > > The test used 'date' as its trigger but that caused the test to XFAIL
> > > > > > for the wrong reason: date does not have symbols and therefore dtrace
> > > > > > failed to enable probes for it.
> > > > > > 
> > > > > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > > > > ---
> > > > > >     test/unittest/ustack/tst.depth.sh | 8 ++++----
> > > > > >     1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
> > > > > > index dec16a3a..977d1b42 100755
> > > > > > --- a/test/unittest/ustack/tst.depth.sh
> > > > > > +++ b/test/unittest/ustack/tst.depth.sh
> > > > > > @@ -16,7 +16,7 @@ dtrace=$1
> > > > > >     rm -f $file
> > > > > > -$dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
> > > > > > +$dtrace $dt_flags -o $file -c test/triggers/delaydie -s /dev/stdin <<EOF
> > > > > >     	#pragma D option quiet
> > > > > >     	#pragma D option bufsize=1M
> > > > > > @@ -45,7 +45,7 @@ $dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
> > > > > >     EOF
> > > > > >     status=$?
> > > > > > -if [ "$status" -ne 0 ]; then
> > > > > > +if [ $status -ne 0 ]; then
> > > > > >     	echo $tst: dtrace failed
> > > > > >     	rm -f $file
> > > > > >     	exit $status
> > > > > > @@ -78,8 +78,8 @@ EOF
> > > > > >     status=$?
> > > > > > -count=`wc -l $file | cut -f1 -do`
> > > > > > -if [ "$count" -lt 1000 ]; then
> > > > > > +count=`wc -l $file | cut -f1 -d' '`
> > > > > > +if [ $count -lt 1000 ]; then
> > > > > >     	echo $tst: output was too short
> > > > > >     	status=1
> > > > > >     fi
