Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC8728F5
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787962229; cv=fail; b=iUa1Ab63GhTgtOh5XD/hMr+Uonqp/rwP2eQeRTIPHvbYHMcMHVwBVWuU49rJhm09JTEEzQ7nvUcwkuy7PRGLsZNgn3WnNGvP/EHwSjVgAOlgUs1+xrPGh7APGS8GJRgW4nj8eL0Jd329GnlwBM8FSzKODmc3H7688z4KJbcMZA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787962229; c=relaxed/simple;
	bh=bUnffSylRxdNm3QGU1yry8HgTLj9QykNlKsvb7uQT/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y2jMnnShoFEjiS2nUx7WLjwwfHsJK7ghPz+7RuO5nKU4ttTfaDZ8Ckwxah626cz/cNX1Jx/n+ZGlmP1qCMJjwn+omPnYx+NRSXdnTPLjlRGn1p0hlGtds/FEl5BH74BiaPsSX+6j2TAHp15C8YW9ZMV1szM1fDDL0UuITjzPdyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WJTEnT9K; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZfS7HxYc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WJTEnT9K";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZfS7HxYc"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHK4aB3166929
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=olGwO/tcCUl4KTi1ttvdw8/ZZsUsyhbNiVbllEFgtts=; b=
	WJTEnT9K5OTqJx6TCZTdN6af5b5S9cPkXQGoyh42q1jlWZuMwHqcwN9bmgMCRq4x
	HgdTWhRr6KtY4aUSbsrfuq1GOgnQUojH6QAPG+3PpslV79sERelhLKK7JQmKMQ59
	QMTHcmJd57SpcSrHea6n04TQsg+cWi5DZEhmxi5nwC1Pz+usWGb6nwxlCRc9psHP
	ynK2gEZlLzjYmo+2p3s+hi0nKhk1+M6cAtZK3vyfqrCrkSQlL/YSbsfqX0JbLGTH
	4m0IqLrWrM/yBKI70dywf4tVMihmZlhY0oks7GbZ9JRA41c2eFlbh22e3IqHyau2
	3SsR4/eH4HC7/rac4dgo/A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g73ct2qwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:10:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67T0A7Xp006619
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:10:22 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010041.outbound.protection.outlook.com [40.93.198.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g846hn728-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 29 Aug 2026 00:10:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNraO/5y/Vyyu3tKQaCIgF/I0vgmJRUhDQ3cB/LNZpOP2ox6rPp6/gDnmLkSRrvlc1Dpj26W3NYhY60Z0zRZZlG+PF1EbGm7VYQn4HwFgbvmryF51yyiznKFbjaKcByNcoSGty8ivO1E/jp/Yl8Znb5YCWAxic0O+LmFu9cOb+c8VhjlqrX7eMmctDyhfg2iK7yro0hX+39W/2U16Qi9NDgiKbWORfwWPfiKjuNUugFV/dvpjGP97O5uWXQeNhSp5IYgtAJodCDyQkawn09ohk/CRGq7OMC8V4DjL/mB3wJ6j2NWORvxayYwJUpjNjp+9Jio0a52cashhBX6deJ7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olGwO/tcCUl4KTi1ttvdw8/ZZsUsyhbNiVbllEFgtts=;
 b=kLU4E1Q8iGS4CIgePbdIX2wHzlv5gpJBfR2hF5Nnhowy95maPRtinmd1KTxYqHQ7WF1B3v+PVZ9+3788pXuibHxwoETPOrJ0RVAR5FaWhkzGJ1NRUGZKKDREO2E1qXXgIhyzUgdAwjC2S8dyN6fItxfcpTmcM1lsEs+lWJWU3skOgdVLFlChvs70dBOtkuJ50PWKBaNmC+cfnvm3Ibj/h5ORjlbm4rJ2hGEyzb1Zj3lUYnswsZzh7P2DGVu09qKg/32VFEYmy2zxJea/BnPCSTKlWJFZvdMC2/LUy5iUEF/wajL/YC9mhFh3ffk1jD6DmaQrNnbKVX9PISRwP2hcHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olGwO/tcCUl4KTi1ttvdw8/ZZsUsyhbNiVbllEFgtts=;
 b=ZfS7HxYcZ5AcxL48vSK3PTylHsV0DejofmGAm4xY6LExt+28LoEnbIVPgxcOvzmB3qcNQcdTt5Esm/YfGl73Lx03ULOkxcSs2D5krEPANPJ2fmkIKWdpGcLeMTz/EiqxrBsaY5EHGOvsoJhVR7ZWjkjL34QjPDMCg4Hxb4KMb4o=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 SJ5PPF2D96878B0.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::79a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Sat, 29 Aug
 2026 00:10:18 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Sat, 29 Aug 2026
 00:10:18 +0000
Date: Sat, 29 Aug 2026 00:09:22 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] docs: Include provider names in probe references
Message-ID: <apIjMgZALS5iKrlB@kvh-deb-bpf>
References: <20260318214826.6296-1-eugene.loh@oracle.com>
 <20260318214826.6296-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318214826.6296-2-eugene.loh@oracle.com>
X-ClientProxiedBy: CH2PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:610:52::15) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|SJ5PPF2D96878B0:EE_
X-MS-Office365-Filtering-Correlation-Id: 603a84e0-41ea-4787-d7ce-08df0561e866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|4143699003|6133799003|3023799007|22082099003|18002099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	1SuLkHQ31IZBMlct17Zl4R00ubftrZRSqil3swJKiOv/VVz01AqACetxobrtfcB0uvfLlaeR/8c1lPD9asjs8aAl63oFb0X1EhXoumPcCWmA8QyoeZq46ToMuy4mN9ojWapb8aLgQ0+Cb+0tTfqF9au5t5D2qdz0kKf1mOrtbKcpVeYKmqQtLd3lnM7B7rvV8tVVZHmS5UJJXC99C64eTCTYTGzvXErx4oV5cOFR0LfzgrxWJZNmj6SlTqmY9xFFoa30AW8sl7SkmJGIymefpIy29tK7Z04EqaVR7085ba2ulSEfGNcQ9eMNmSQoNWLstmdk+dGYKQuznBFuO6Gn7IZu1C86f++HPfivRNZrgzGGtLAXB9jzq16BN6XBh5qBKQTaepZSWX7hUzjvXrmU1T0DbG3M12MUhCSNAuy0gzpJciaV6TbVQ2yVua0zozJiR5Dsn9jCr1uDRjzCXrMhor9SHY+In2JM0dShGsQHno1O5Vc2ZFve8opadyp+SWHU3aP8Gl1RThRCX83/oWgUzhlXujoBUNAXhzKR475+F2pNfYSrBLfPkPG9ycEUGIP/wcIrL1dDlClsR8Xn6aeXoF7LLlv7U+BdVRwT7dF9ILBnVYHOP8pKV1DWm8loeKGZMm278AhddlJnXVQi9C2vkl8UCGhaIj4nbkBu0prGfiU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0YzUFBHNXprSld5b2oybGZjUmVHM2x6OFVlMjZVZmxYNjV2SHN5MVlmQW1r?=
 =?utf-8?B?ZjU3YUI0VzJiZTJaQ0F3OFdnUHBmeHpxLy9YYWVzblRubkJFMUNLSXhjQmFs?=
 =?utf-8?B?SDFTZ2lmcHRlSlVKMXM2aHczZE9vY04xWFdHcytucFJXQlNLZVA0VDdMOU4r?=
 =?utf-8?B?UnQ5eFV4ejF3c3VTUmRndDBRWURyOUVCcXBKT05aNGNPeDNJdGZhTE9VNHN6?=
 =?utf-8?B?T0xycit1bFMwRUtyRFJuNE5iOGRHVWJTVW9kM3k1cEYwK1VWYlpnaC9mNFFQ?=
 =?utf-8?B?WnNzdFlLNHgwa2JiTy9ZTHpCb1hjTEV1VW9uQ3QzZFZwSEQvVU5GQ2h1bnk4?=
 =?utf-8?B?S1V4L0VPUExmZ25NQWp4V1U2NDZmUEx5bUg2MHZyNnFjZGFXS1g0SThDcTVN?=
 =?utf-8?B?elRqbkhWSnNtZjc3NXh1L1AwZU1lbFRnY1dHVHNwYlA4Ry9MNy9Ga2Y4ajJG?=
 =?utf-8?B?b1EvTEdacVVjMnFnQUMzYzA2ZENHNlNvanN4UHl2VlA3T0hOVDREd1ErY1ha?=
 =?utf-8?B?djA3MW5SWUcxTE9YR1JkcnNhUUc5eEpQV2Jxbm9NMDFvdVJOeWhxRHpyV1BI?=
 =?utf-8?B?MGc1NzZRNk9KS3JqczF3SGU2ZTVEVjd2dWhySE5HRVRIYnFCZlhFNHNsQ0py?=
 =?utf-8?B?RFhWR2gxZlJtMzFYRGt3VTFoUEdvMjYxa0xiOE5GWjdIWGtIMFlwWkhIMGpL?=
 =?utf-8?B?R2FSNlVYdTlnZktNUFREWTE2UkhyVnBlZmFQWjNKSi91SFpidG5OV05LemxL?=
 =?utf-8?B?N01LL25sRlowVHhReWxQREFSdUJKb3R5OTVESWFJRGU5TnVqWmF1OUF0S0Rp?=
 =?utf-8?B?M0EvSHljWGZGdnA1cGN1STFSQWlRZjROd0dra3RYeHluZnZMb3lGQzJKTUFH?=
 =?utf-8?B?NkN6NVRPaDl1dGpCNTVSdFJQQjkrY050YXdsTXFwTmVhR3dRUkl1ZzBibW5U?=
 =?utf-8?B?bWpnSDg2cEF6enczVzR5akp2ait6cURYcnAvUnV1NjJnclVRTXdLaUlvZC9n?=
 =?utf-8?B?ZnRBOGVUdEplRTFsT054MXo1cFdlZ0plNERiTkl2ejNXOWpaYjl3R2xlYUxu?=
 =?utf-8?B?VW9GbldBYnpYSTBTbUE4TVFjb1NHaDZITFBBU0ppc2Q2bk9DZlhLVWR5STlG?=
 =?utf-8?B?enFTWWhOc3ZFdzdkaEV0R2s4Smlqd1cyUzBJSmw3Wm9TT043R2V5b1E3ZzNE?=
 =?utf-8?B?OC9GMXFWUC9OamRQMTYrQlJXRnQyWE5aM1pVSFBBVFZkUTlGOFVkYmtrdzEr?=
 =?utf-8?B?RHJLMXk3YmJHQWhNNUVpa0tieVZjZmJTL0twbkxDKzVBaTdMV3ZpemdyVnlC?=
 =?utf-8?B?cHJyRk1OaWNORno3WHZoUkNqd001SkxkWmJUbGpGaGM0TmtpakJnL2o0U0ZI?=
 =?utf-8?B?b2drWTBVOWU0YXh2Z2N4cXhBN3hVV2Uxd3JSYjIrakhOdHZHUFJJMzNZQktt?=
 =?utf-8?B?STBuSWx4UXhJRE9ISko1dW93dkp3OEpURU1OYUNQakhBYU5uTTFNYzZBUWxG?=
 =?utf-8?B?WUJ2czRZQ0Yyb3Q0anRUWEVteWg5KzQ4SCtiT2lNa2NpOGRwQzFXQjlFQVVs?=
 =?utf-8?B?WEZGdDBTWEt2MDhDNGZVME5saHFVejZ2eUp6ZnNRVFZZVXpQbFBLNDlteU14?=
 =?utf-8?B?bktqTmZ6dzY1L09Fdm9nTWZoK0JnSS9HaEt0emk2Ry9ISlJuczBvR3AzRU9Y?=
 =?utf-8?B?UTY0SXpRd2lESXpKb1JYVE9pbFBya25hUHAva2krWStQOEZ6cUExZGpVeEFs?=
 =?utf-8?B?L05nbVlVcFZnK21nTFI3bGtSMWo1Z1dlNk0wODdkZ002NER1YktxSlA4dGpi?=
 =?utf-8?B?Y2Q1VnpkN3lzS1VwWm1haEhmUnBKNktpcStlcmpvcEpnQ25leS8yVzFwdlhE?=
 =?utf-8?B?Y3BuQzVOT0dNR1VXYUgvL1kvTHRhdVQzcDZwR1VjbHJFOUxvS01ZV3BscE1n?=
 =?utf-8?B?b1FJZEEydXNqNFVjMytGd1pjOVFoTTF0QzJ6T0FlOXFwbUd1cXVmbHFieE5i?=
 =?utf-8?B?bUhlZjgzaHZXMWpqeVNEeDRnekJmc09vN0JSd2xyNFJEOXlHUFZkbjhjU3Rm?=
 =?utf-8?B?VjBDR0JhS0VMZXhuVUZsanJoaXZlM2RjZml5OVJ0N3lVUzdoVGlFRHV6QzZG?=
 =?utf-8?B?VE1zd3RHVGxxSTdJTGpFSnFYUXp2eUtLQWs2ZXlXd2RwaFJlY0FJOHhzK2xU?=
 =?utf-8?B?T1U3eS9adm13K0VhNmY5ekxjY0haamx5YzN1YkJRNE8yS2pXOUduZGR3dzNi?=
 =?utf-8?B?QUNBaXJna2RVNHNaQ1NTckRKY0c0M1ZnUlpuQms1RG9LbWpLRTQ0cTB3UFdu?=
 =?utf-8?B?K1RhYjNyNS8rZzZaaVM0eTFFYlFzZkhIdzFDMVlRUTVEMkN0c3B4S1ZQemgw?=
 =?utf-8?Q?RG0xoQ3cMsIvf0dA=3D?=
X-Exchange-RoutingPolicyChecked:
	dyy6mhga0nlzg9p0R/pKPNktUph18TuPyqbK2oKUSv/eGgFo+HhaDoO+uRdb7d2BE0I2sFXNEhU9+fN7tbzIIcwtuabY6gHU/XnZpku0qBlPgLYgpcChVzFTcUKS4mYgdKXIoezQ5/AgE1JlpB2RhQ7hQs/FdA1vt9foKqlQ+OxbO1I4JQDd5l37KIoDg1tJXY+5JR+MOCOq887vIFxL+80BvHiTLHjup0/595bax82PVG2KhZNFDN5JCrfqDJNvU4XvNPmreN9YZyARwPIGRc+yPzg7MHzTydQTgCY5YMSWb7Isc0/xle7FikeOifr5l9AMzqbkQP3i3aIYj+eJgQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Dnh3gTvKRgU+noGPavjb88eBoXVB/ORC7G+UvaS07W9bY+CJAyJpkAMzfkA2UyL9pSuKnlXsX8xddr8LFOox+oSlES0GK46r0Ub0f2ujhvh9R1WsAXcRQ8zBnG62LtQP2dOSoy3RO2oF2xrZu54ArxgR60QVNpe9G9pHGTbALpE2hvcbedWa3Rp9XKdp839sXniG2vvWlrtkFZEo9NHy7tzcQCU5a3IjwJjFx2F2VvCZIQxFTmGIPcn9s9Ps3d7ZUQGQHie/4XCYyy8SLvctKN5H9sgcdEBAOSOAV208FHCzERXcQx3s8jQXvKOf/EjN+QL16f1+otYiaSm3OduBlzLvrUImAx2YeSp8A2TF4Jys4sgDu8ZVzk+zWXm7CLKmD7Gp7gHtmjWocVo+1m+kD5Cr7cWh3ELKnpH3wi49131ZPt9TNWaMozi5+nX3rs7+7MXTYubout7blfZfSa+2I6NEPrgb1ZyGEBZFIrjCjX5G/BAyuQcOgltMlYl9e6tyTE6KW6EjgyYtbyZhqCmi2t4i8/h+5wVxihW59bsxfdAWMSzvnHhBrQbYnOTDkNBXRXMhaqBbxSfV9SHK+xOWCu8jgYRxz0HxLVcNWJvbh9A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 603a84e0-41ea-4787-d7ce-08df0561e866
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 00:10:18.0274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUce90gF6EIq4FphUN6vkkPWESZvAvMzrP2h2/cvo5MI31r/puJvxGa1jkIRetrgHPETJVpcTz5h3kASJcrqnabqBFdpxvaZg/Z3ebOO0AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2D96878B0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606160000 definitions=main-2608290000
X-Authority-Analysis: v=2.4 cv=D+h37PRj c=1 sm=1 tr=0 ts=6a922370 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8
 a=tAAsRsVw66YUjp4rYmYA:9 a=68dEo-z8PKyfCJsZ:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDIxMCBTYWx0ZWRfX45NiMMizcnR8
 8y5G4vqrgtsVKeKeKGMuntuXVIeeMXl55ts/7EA+2PwmxyV2/A+1M0moKjmxFlY30Q1za/QNUjc
 lVuaKk+s+9R/b3dg4xBum1p2stneB3WQ9Xm4hv07/LbuvQB4WQC3
X-Proofpoint-ORIG-GUID: LJAR1NhTk7Y5WCNwavMwaPSvAX_vhex5
X-Proofpoint-GUID: LJAR1NhTk7Y5WCNwavMwaPSvAX_vhex5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDIxMCBTYWx0ZWRfX7SvnUpJC4yrq
 jMkd13daN0CYhcOAWI7IBdu9/sa9Q4OXsD8Iax1WjJovcYvPHbcuX/yoYCdVZZwQ0wigG1bsEFr
 K0BzWrDLNKc502ccbPwaAWvAuwxc0gFsLIaLn0HHzWA3BZCE+x/SYb4lqBDuuWJcAXk+I1sSynE
 QKWbETP/MrtQ1AlHkB+3cLvVBvI0AMfO0w/DnaXToZ03994nmR/2vcuiRmmwPothALXHpjieG0W
 bAjXtxPBOn6gGlVlZUe9kbI7tu22+AiK2pvHa5A0/LbilAjigGhGr3Dg9bfgQAy1vRQvwrnEMpN
 wxKLTvdMy+5yrEu06n8IagWwgcO//+bsQ0ug7BvhRQm97GG0SJ5kaVQTfY59DHgSCLZYReeFUS4
 x81Uc4AXfwEV09MGnPNBJ4DtyQ80MBIctUJ4BDnBqZpM6P61KZyocgtR2rVOVkOa/JH163kt8ad
 OpGkUl8zOeURGZaoKGw==

On Wed, Mar 18, 2026 at 05:48:26PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> While probe descriptions can omit fields, implying wildcard matching,
> best practice is probably to specify at least the provider.  This helps
> reduce chances of unexpected ambiguity and can help DTrace find matching
> probes more efficiently.
> 
> Change our documentation to employ and thereby illustrate this best
> practice.
> 
> In descriptions of the FBT and raw FBT providers, make this point
> explicitly, since typically an FBT probe would have a raw FBT
> counterpart (and vice versa) and in all likelihood a user does not want
> both.
> 
> Incidentally, in a runtime test of our test suite, there are only a few
> cases where a probe description matches both FBT and raw FBT probes.
> In test/unittest/, they are
> 
> test                                      probe description
> 
> dtrace-util/tst.ListProbesModuleClause.sh :vmlinux::
> dtrace-util/tst.ListProbes.sh             :::
> providers/rawfbt/tst.wildcard-provider.d  *fbt:vmlinux:do_sys_open*:entry
> regression/tst.unload-reload-oops.sh      :::
> 
> These uses are perhaps reasonable for those tests.
> 
> A recent user bug report was due, at least in part, to the fbt/rawfbt
> problem.
> 
> Orabug: 38931437
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  doc/tutorial/1.IntroducingDTrace.md           | 21 ++++++------
>  .../2.TracingOperatingSystemBehavior.md       | 34 +++++++++----------
>  .../3.TracingUserSpaceApplications.md         |  4 +--
>  .../dtrace-components-and-terminology.md      |  6 ++--
>  .../dtrace-howto-create-a-dtrace-script.md    |  2 +-
>  .../dtrace-howto-list-and-enable-probes.md    |  4 +--
>  .../how-to/dtrace-howto-use-predicates.md     |  2 +-
>  doc/userguide/reference/aggregation.md        |  2 +-
>  doc/userguide/reference/aggregation_stddev.md |  2 +-
>  doc/userguide/reference/aggregation_sum.md    |  6 ++--
>  ...gram_syntax_reference_program_structure.md | 15 ++++----
>  .../dtrace-ref-PointersandScalarArrays.md     |  8 ++---
>  ...ticallyDefinedTracingofUserApplications.md |  8 ++---
>  .../reference/dtrace-ref-StructsandUnions.md  |  6 ++--
>  ...dtrace-ref-TypesOperatorsandExpressions.md |  4 +--
>  .../reference/dtrace-ref-Variables.md         |  6 ++--
>  .../reference/dtrace_providers_dtrace.md      | 28 +++++++--------
>  .../reference/dtrace_providers_fbt.md         |  5 +++
>  .../reference/dtrace_providers_io.md          |  8 ++---
>  .../reference/dtrace_providers_proc.md        |  4 +--
>  .../reference/dtrace_providers_rawfbt.md      |  5 +++
>  doc/userguide/reference/function_alloca.md    |  2 +-
>  doc/userguide/reference/function_basename.md  |  2 +-
>  doc/userguide/reference/function_bcopy.md     |  2 +-
>  doc/userguide/reference/function_clear.md     |  6 ++--
>  .../reference/function_denormalize.md         |  4 +--
>  doc/userguide/reference/function_dirname.md   |  2 +-
>  doc/userguide/reference/function_exit.md      |  4 +--
>  doc/userguide/reference/function_ftruncate.md |  6 ++--
>  doc/userguide/reference/function_index.md     |  2 +-
>  doc/userguide/reference/function_inet_ntoa.md |  2 +-
>  doc/userguide/reference/function_lltostr.md   |  2 +-
>  doc/userguide/reference/function_normalize.md |  4 +--
>  doc/userguide/reference/function_printa.md    |  2 +-
>  doc/userguide/reference/function_printf.md    |  2 +-
>  doc/userguide/reference/function_rand.md      |  4 +--
>  doc/userguide/reference/function_rindex.md    |  2 +-
>  doc/userguide/reference/function_strchr.md    |  2 +-
>  doc/userguide/reference/function_strjoin.md   |  2 +-
>  doc/userguide/reference/function_strlen.md    |  2 +-
>  doc/userguide/reference/function_strrchr.md   |  2 +-
>  doc/userguide/reference/function_strstr.md    |  2 +-
>  doc/userguide/reference/function_strtok.md    | 10 +++---
>  doc/userguide/reference/function_substr.md    |  2 +-
>  doc/userguide/reference/function_system.md    |  2 +-
>  doc/userguide/reference/function_trace.md     |  2 +-
>  doc/userguide/reference/function_tracemem.md  |  2 +-
>  doc/userguide/reference/function_trunc.md     |  8 ++---
>  48 files changed, 139 insertions(+), 125 deletions(-)
> 
> diff --git a/doc/tutorial/1.IntroducingDTrace.md b/doc/tutorial/1.IntroducingDTrace.md
> index dffca17f7..728bb89fb 100644
> --- a/doc/tutorial/1.IntroducingDTrace.md
> +++ b/doc/tutorial/1.IntroducingDTrace.md
> @@ -149,7 +149,7 @@ Here are the providers in the Linux implementation of DTrace:
>  That is, these providers provide:
>  
>  - `dtrace`: probes that relate to DTrace itself,
> -    such as `BEGIN`, `ERROR`, and `END`.
> +    such as `dtrace:::BEGIN`, `dtrace:::ERROR`, and `dtrace:::END`.
>      You can use these probes to initialize DTrace's state before
>      tracing begins, process its state after tracing has completed,
>      and handle unexpected execution errors in other probes.
> @@ -283,9 +283,9 @@ that is in a file called `hello.d`.
>  #### Example: Simple D Program That Uses the BEGIN Probe (hello.d)
>  
>  ```
> -/* hello.d -- A simple D program that uses the BEGIN probe */
> +/* hello.d -- A simple D program that uses the dtrace:::BEGIN probe */
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>      /* This is a C-style comment */
>      trace("hello, world");
> @@ -300,7 +300,7 @@ of statements enclosed in braces `{}` following the probe name.
>  Each statement ends with a semicolon (`;`).
>  
>  In this example, the function `trace` directs DTrace to record the
> -specified argument, the string ”hello, world”, when the `BEGIN` probe fires,
> +specified argument, the string ”hello, world”, when the `dtrace:::BEGIN` probe fires,
>  and then print it out.
>  The function `exit()` tells DTrace to cease tracing and exit the `dtrace`
>  command.
> @@ -309,7 +309,8 @@ The full name of the `BEGIN` probe is `dtrace:::BEGIN`.
>  The `dtrace` provider provides three probes: `dtrace:::BEGIN`,
>  `dtrace:::END`, and `dtrace:::ERROR`.
>  Because these probe names are unique to the `dtrace` provider,
> -their names can be shortened to `BEGIN`, `END`, and `ERROR`.
> +they are often shortened to `BEGIN`, `END`, and `ERROR`,
> +but this guide uses the fully qualified forms to reduce ambiguity.
>  
>  When you have saved your program, you can run it by using the
>  `dtrace` command with the `-s` option,
> @@ -328,7 +329,7 @@ the default behavior of DTrace is to display information about
>  the CPU on which the script was running when a probe fired,
>  the ID of the probe, the name of the function that contains
>  the probe, and the name of the probe itself.
> -The function name is displayed as blank for `BEGIN`,
> +The function name is displayed as blank for `dtrace:::BEGIN`,
>  as DTrace provides this probe.
>  
>  You can suppress the probe information in a number of different
> @@ -343,19 +344,19 @@ hello, world
>  
>  Copy the `hello.d` program to the file `goodbye.d`.
>  Edit this file so that it traces the string "goodbye, world"
> -and uses the `END` probe instead of `BEGIN`.
> +and uses the `dtrace:::END` probe instead of `dtrace:::BEGIN`.
>  When you run this new script, you need to type `Ctrl-C` to cause the
>  probe to fire and exit `dtrace`.
>  
>  #### Solution to Exercise and Example: Using the END Probe
>  
>  The following is an example of a simple D program that
> -demonstrates the use of the `END` probe:
> +demonstrates the use of the `dtrace:::END` probe:
>  
>  ```
> -/* goodbye.d -- Simple D program that demonstrates the END probe */
> +/* goodbye.d -- Simple D program that demonstrates the dtrace:::END probe */
>  
> -END
> +dtrace:::END
>  {
>    trace("goodbye, world");
>  }
> diff --git a/doc/tutorial/2.TracingOperatingSystemBehavior.md b/doc/tutorial/2.TracingOperatingSystemBehavior.md
> index edfc89c01..c6bdab1d1 100644
> --- a/doc/tutorial/2.TracingOperatingSystemBehavior.md
> +++ b/doc/tutorial/2.TracingOperatingSystemBehavior.md
> @@ -155,7 +155,7 @@ for a description of the function.
>  
>  The process ID and user ID are available as the variables
>  `pid` and `uid`. Use the
> -`BEGIN` probe to create a header for the
> +`dtrace:::BEGIN` probe to create a header for the
>  output.
>  
>  #### Solution to Exercise: Using the printf() Function to Format Output
> @@ -163,7 +163,7 @@ output.
>  ```
>  /* syscalls1.d -- Modified version of syscalls.d that displays more information */
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    printf("%-7s %-4s %-16s %-16s\n","PID","UID","EXECNAME","FILENAME");
>    mypid = pid;
> @@ -222,7 +222,7 @@ The following is an example of the `tick.d` program.
>  ```
>  /* tick.d -- Perform an action at regular intervals */
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    i = 0;
>  }
> @@ -232,7 +232,7 @@ profile:::tick-1sec
>    printf("i = %d\n",++i);
>  }
>  
> -END
> +dtrace:::END
>  {
>    trace(i);
>  }
> @@ -287,7 +287,7 @@ i = 5
>  List the available `profile` provider probes.
>  Experiment with using a different `tick` probe.
>  Replace the `trace()` call in
> -`END` with a `printf()` call.
> +`dtrace:::END` with a `printf()` call.
>  
>  See
>  [Profile Provider](../userguide/reference/dtrace_providers_profile.md)
> @@ -322,7 +322,7 @@ for a description of the probes.
>  ```
>  /* tick1.d -- Modified version of tick.d */
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    i = 0;
>  }
> @@ -333,13 +333,13 @@ profile:::tick-500ms
>    printf("i = %d\n",++i);
>  }
>  
> -END
> +dtrace:::END
>  {
>    printf("\nFinal value of i = %d\n",i);
>  }
>  ```
>  
> -This example uses the `tick-500ms` probe,
> +This example uses the `profile:::tick-500ms` probe,
>  which fires twice per second.
>  
>  ```
> @@ -919,7 +919,7 @@ syscall::write:entry, syscall::read:entry, syscall::open:entry
>  }
>  ```
>  
> -The action that is associated with the `tick-100s` probe means that
> +The action that is associated with the `profile:::tick-100s` probe means that
>  `dtrace` exits after 100 seconds. By default, exit will print the
>  results of the aggregation.
>  
> @@ -1079,7 +1079,7 @@ profile:::tick-10sec {
>    exit(0);
>  }
>  
> -END
> +dtrace:::END
>  {
>    trunc(@, 5);
>  }
> @@ -1112,7 +1112,7 @@ in
>  for more information.
>  
>  The [`trunc()`](../userguide/reference/function_trunc.md) function
> -in the `END` action removes all but the 5 most important keys.
> +in the `dtrace:::END` action removes all but the 5 most important keys.
>  Here, there are fewer than 5 keys to start with.
>  
>  #### Exercise: Counting Context Switches on a System
> @@ -1122,7 +1122,7 @@ a timestamp and prints the number of context switches per CPU and
>  the total for all CPUs once per second, together with the CPU
>  number or `"total"`.
>  
> -- Using the `BEGIN` probe, print a header for the display
> +- Using the `dtrace:::BEGIN` probe, print a header for the display
>    with columns labelled `Timestamp`, `CPU`, and `Ncsw`.
>  
>  - Using the `sched:::on-cpu` probe to detect the end of a context switch,
> @@ -1300,7 +1300,7 @@ io:::done
>    start[args[0]->b_edev, args[0]->b_blkno] = 0;
>  }
>  
> -END
> +dtrace:::END
>  {
>    printa(" %s (%s)\n%@d\n", @);
>  }
> @@ -1417,7 +1417,7 @@ io:::done
>    start[args[0]->b_edev, args[0]->b_blkno, this->iodir] = 0;
>  }
>  
> -END
> +dtrace:::END
>  {
>    printa(" %s (%s) %s \n%@d\n", @);
>  }
> @@ -1506,7 +1506,7 @@ io:::done
>    @a[this->iodir] = lquantize(blkno,0,10,1)
>  }
>  
> -tick-10sec
> +profile:::tick-10sec
>  {
>    printf("%Y\n",walltimestamp);
>    /* Display the results of the aggregation */
> @@ -1660,7 +1660,7 @@ error instead of its number for any failed system call.
>  - Use `printf()` to display the user ID, the process ID, the
>    program name, the error name, and the name of the system call.
>  
> -- Use the `BEGIN` probe to print column headings.
> +- Use the `dtrace:::BEGIN` probe to print column headings.
>  
>  - Use the value of `errno` rather than `arg0` to test whether an
>    error from the range of mapped names has occurred in a system call.
> @@ -1677,7 +1677,7 @@ which displays error names.
>  
>  /* displayerrno.d -- Modified version of errno.d that displays error names */
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    printf("%-4s %-6s %-10s %-10s %s\n", "UID", "PID", "Prog", "Error", "Func");
>  
> diff --git a/doc/tutorial/3.TracingUserSpaceApplications.md b/doc/tutorial/3.TracingUserSpaceApplications.md
> index 1121a583f..2e5fac803 100644
> --- a/doc/tutorial/3.TracingUserSpaceApplications.md
> +++ b/doc/tutorial/3.TracingUserSpaceApplications.md
> @@ -704,7 +704,7 @@ probes in the application:
>  
>  /* show how much time elapses between each probe */
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    iterationCount = 0;
>  }
> @@ -751,7 +751,7 @@ primeget*:::query-final
>    iterationCount++;
>  }
>  
> -END
> +dtrace:::END
>  {
>    trace(iterationCount);
>  }
> diff --git a/doc/userguide/explanation/dtrace-components-and-terminology.md b/doc/userguide/explanation/dtrace-components-and-terminology.md
> index 9d08928ac..5e33e60bf 100644
> --- a/doc/userguide/explanation/dtrace-components-and-terminology.md
> +++ b/doc/userguide/explanation/dtrace-components-and-terminology.md
> @@ -9,7 +9,7 @@ DTrace is a framework that dynamically traces data into buffers that are read by
>  
>  ## Probes <a id="concept_terms_probes">
>  
> -DTrace works by using *probes* that identify particular instrumentation in the kernel or within a user space application, or which can be used to identify interval counters or performance event counters. Events such as when particular code is run or when a specific counter is incremented cause a probe to fire and DTrace can perform functions that are bound to the event in a program or script. For example, a probe can fire when a particular file is opened and a DTrace program can print information related to the event that can be useful for debugging or resolving an issue. Equally, at the moment that DTrace starts or ends any tracing activity, the `BEGIN` and `END` probes dedicated to these actions always fire.
> +DTrace works by using *probes* that identify particular instrumentation in the kernel or within a user space application, or which can be used to identify interval counters or performance event counters. Events such as when particular code is run or when a specific counter is incremented cause a probe to fire and DTrace can perform functions that are bound to the event in a program or script. For example, a probe can fire when a particular file is opened and a DTrace program can print information related to the event that can be useful for debugging or resolving an issue. Equally, at the moment that DTrace starts or ends any tracing activity, the `dtrace:::BEGIN` and `dtrace:::END` probes dedicated to these actions always fire.
>  
>  You can list all the available probes on a system by typing the following command:
>  
> @@ -49,7 +49,7 @@ Probes are made available by *providers*, which group particular kinds of instru
>  
>  -   **name**
>  
> -    The name that provides some idea of the probe's semantic meaning, such as `BEGIN` or `END`.
> +    The name that provides some idea of the probe's semantic meaning, such as `dtrace:::BEGIN` or `dtrace:::END`.
>  
>  
>  When referencing a probe, write all four parts of the probe description separated by colons:
> @@ -64,7 +64,7 @@ Some probes don't have a module or function identifier when they're listed. When
>  dtrace:::BEGIN
>  ```
>  
> -Probes aren't required to have a module and function. The dtrace `BEGIN`, `END` and `ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md) or the [CPC Provider](../reference/dtrace_providers_cpc.md), also don't include module or function identifiers in their descriptions.
> +Probes aren't required to have a module and function. The dtrace `dtrace:::BEGIN`, `dtrace:::END` and `dtrace:::ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md) or the [CPC Provider](../reference/dtrace_providers_cpc.md), also don't include module or function identifiers in their descriptions.
>  
>  ## D Programs <a id="concept_terms_programs">
>  
> diff --git a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> index 949ade0bf..4b3ef39fe 100644
> --- a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> +++ b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
> @@ -35,7 +35,7 @@ This tutorial provides successive steps toward developing a DTrace script that y
>        0      1                           :BEGIN   hello, world    
>      ```
>  
> -    Note that you didn't have to press `Ctrl`+`C` to exit because you specified the `exit` function for the `BEGIN` probe in the program.
> +    Note that you didn't have to press `Ctrl`+`C` to exit because you specified the `exit` function for the `dtrace:::BEGIN` probe in the program.
>  
>  3.  Open `hello.d` in the text editor and add an interpreter line to the beginning of the script.
>  
> diff --git a/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md b/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
> index 9325c6f1d..ef0b7c0a9 100644
> --- a/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
> +++ b/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
> @@ -91,9 +91,9 @@ DTrace providers publish available probes to DTrace so that you can enable them
>  
>  3.  Enable several probes by chaining them together in a request.
>  
> -    You can construct DTrace requests by using arbitrary numbers of probes and functions. For example, create a request using two probes by adding the `BEGIN` and `END` probes.
> +    You can construct DTrace requests by using arbitrary numbers of probes and functions. For example, create a request using two probes by adding the `dtrace:::BEGIN` and `dtrace:::END` probes.
>  
> -    Type the following command, and then press `Ctrl`+`C` in the shell again, after you see the line of output for the `BEGIN` probe:
> +    Type the following command, and then press `Ctrl`+`C` in the shell again, after you see the line of output for the `dtrace:::BEGIN` probe:
>  
>      ```
>      sudo dtrace -n dtrace:::BEGIN -n dtrace:::END 
> diff --git a/doc/userguide/how-to/dtrace-howto-use-predicates.md b/doc/userguide/how-to/dtrace-howto-use-predicates.md
> index d00d31a01..fce9d9121 100644
> --- a/doc/userguide/how-to/dtrace-howto-use-predicates.md
> +++ b/doc/userguide/how-to/dtrace-howto-use-predicates.md
> @@ -71,7 +71,7 @@ To illustrate predicates at work, you can create a D program that implements a 1
>      ```
>  
>  
> -This tutorial uses the `BEGIN` probe to initialize a variable integer `i` to 10 to begin the countdown. Next, the program uses the `tick-1sec` probe to implement a timer that fires once every second. Notice that in `countdown.d`, the `tick-1sec` probe description is used in two different clauses, each with a different predicate and function list. The predicate is a logical expression surrounded by enclosing slashes `//` that appears after the probe name and before the braces `{}` that surround the clause statement list.
> +This tutorial uses the `dtrace:::BEGIN` probe to initialize a variable integer `i` to 10 to begin the countdown. Next, the program uses the `profile:::tick-1sec` probe to implement a timer that fires once every second. Notice that in `countdown.d`, the `profile:::tick-1sec` probe description is used in two different clauses, each with a different predicate and function list. The predicate is a logical expression surrounded by enclosing slashes `//` that appears after the probe name and before the braces `{}` that surround the clause statement list.
>  
>  The first predicate tests whether `i` is greater than zero, indicating that the timer is still running:
>  
> diff --git a/doc/userguide/reference/aggregation.md b/doc/userguide/reference/aggregation.md
> index 4f39f568d..55eae157e 100644
> --- a/doc/userguide/reference/aggregation.md
> +++ b/doc/userguide/reference/aggregation.md
> @@ -44,7 +44,7 @@ By default, several aggregations are displayed in the order in which they're int
>  You can override this behavior by using the [`printa`](function_printa.md) function to print the aggregations.
>  The `printa` function also lets you precisely format the aggregation data by using a format string.
>  
> -If an aggregation isn't formatted with a `printa` statement in a D program, the `dtrace` command snapshots the aggregation data and prints the results after tracing has completed, using the default aggregation format. If an aggregation is formatted with a `printa` statement, the default behavior is disabled. You can achieve the same results by adding the `printa(@*aggregation-name*)` statement to an `END` probe clause in a program.
> +If an aggregation isn't formatted with a `printa` statement in a D program, the `dtrace` command snapshots the aggregation data and prints the results after tracing has completed, using the default aggregation format. If an aggregation is formatted with a `printa` statement, the default behavior is disabled. You can achieve the same results by adding the `printa(@*aggregation-name*)` statement to an `dtrace:::END` probe clause in a program.
>  
>  The default output format for the `avg`, `count`, `min`, `max`, `stddev`, and `sum` aggregating functions displays an integer decimal value corresponding to the aggregated value for each tuple. The default output format for the `quantize`, `lquantize`, and `llquantize` aggregating functions displays an ASCII histogram with the results. Aggregation tuples are printed as though `trace` had been applied to each tuple element.
>  
> diff --git a/doc/userguide/reference/aggregation_stddev.md b/doc/userguide/reference/aggregation_stddev.md
> index 42709e9ba..2ba9f16f5 100644
> --- a/doc/userguide/reference/aggregation_stddev.md
> +++ b/doc/userguide/reference/aggregation_stddev.md
> @@ -29,7 +29,7 @@ syscall::execve:return
>    self->ts = 0;
>  }
>  
> -END
> +dtrace:::END
>  {
>    printf("\nSTDDEV:");
>    printa(@execsd);
> diff --git a/doc/userguide/reference/aggregation_sum.md b/doc/userguide/reference/aggregation_sum.md
> index 17a75da4e..114bcd494 100644
> --- a/doc/userguide/reference/aggregation_sum.md
> +++ b/doc/userguide/reference/aggregation_sum.md
> @@ -14,19 +14,19 @@ The `sum` function is an aggregation function to used to obtain the total value
>  This example increments a variable, *i*, by 100 every 10 ms until *i* has a value of 1000. An aggregation is used to calculate the sum of values of *i*. This is equal to the expression: 0+100+200+300+400+500+600+700+800+900=4500.
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>  {
>          i = 0;
>  }
>  
> -tick-10ms
> +profile:::tick-10ms
>  /i < 1000/
>  {
>          @a = sum(i);
>          i += 100;
>  }
>  
> -tick-10ms
> +profile:::tick-10ms
>  /i == 1000/
>  {
>          exit(0);
> diff --git a/doc/userguide/reference/d_program_syntax_reference_program_structure.md b/doc/userguide/reference/d_program_syntax_reference_program_structure.md
> index dc6a31a3b..ab9c3627a 100644
> --- a/doc/userguide/reference/d_program_syntax_reference_program_structure.md
> +++ b/doc/userguide/reference/d_program_syntax_reference_program_structure.md
> @@ -37,13 +37,17 @@ probe descriptions
>  
>      -   **name**
>  
> -        The name that provides some idea of the probe's semantic meaning, such as `BEGIN` or `END`.
> +        The name that provides some idea of the probe's semantic meaning, such as `dtrace:::BEGIN` or `dtrace:::END`.
>  
> -    DTrace recognizes a form of shorthand when referencing probes. By convention, if you don't specify all the fields of a probe description, DTrace can match a request to all the probes with matching values in the parts of the name that you do specify. For example, you can reference the probe name `BEGIN` in a script to match *any* probe with the name field `BEGIN`, regardless of the value of the provider, module, and function fields. For example, you might see a probe referenced as:
> +    DTrace recognizes a form of shorthand when referencing probes.
> +    By convention, if you don't specify all the fields of a probe description,
> +    DTrace can match a request to all the probes with matching values in the parts of the name that you do specify.
> +    For example, you can reference the probe name `BEGIN` in a script to match *any* probe with the name field `BEGIN`,
> +    regardless of the value of the provider, module, and function fields.
>  
> -    ```
> -    BEGIN
> -    ```
> +    Nevertheless, it is good practice to specify components, such as the provider, in a probe description anyhow.
> +    This reduces the chances of unexpected ambiguity and can make it faster for DTrace to find probes.
> +    In this guide, we will typically specify the provider name.
>  
>      If a probe is referenced in a D program and it doesn't use a full probe description, the fields are interpreted based on an order of precedence:
>  
> @@ -144,4 +148,3 @@ A program can be stored on the file system and can be run by the DTrace utility.
>  A script can also include D pragma directives to set runtime and compiler options. See [DTrace Runtime and Compile-time Options Reference](dtrace_runtime_options.md) for more information on including this information in a script.
>  
>  **Parent topic:**[D Program Syntax Reference](../reference/d_program_syntax_reference.md)
> -
> diff --git a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> index 78ebfa176..5b71b09b1 100644
> --- a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> +++ b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
> @@ -38,7 +38,7 @@ Pointers are required in D because they're an intrinsic part of the OS's impleme
>  To observe DTrace's error handling and reporting, you could write a deliberately bad D program using pointers. For example, in an editor, type the following D program and save it in a file named `badptr.d`:
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>  {
>    x = (int *)NULL;
>    y = *x;
> @@ -53,7 +53,7 @@ dtrace: script '/tmp/badptr.d' matched 1 probe
>  dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address (0x0) in action #1 at BPF pc 156
>  ```
>  
> -Notice that the D program moves past the error and continues to run; the system and all observed processes remain unperturbed. You can also add an `ERROR` probe to any script to handle D errors. For details about the DTrace error mechanism, see [ERROR Probe](dtrace_providers_dtrace.md).
> +Notice that the D program moves past the error and continues to run; the system and all observed processes remain unperturbed. You can also add an `dtrace:::ERROR` probe to any script to handle D errors. For details about the DTrace error mechanism, see [ERROR Probe](dtrace_providers_dtrace.md).
>  
>  ## Pointer and Array Relationship <a id="dt_ptrarel_dlang">
>  
> @@ -80,7 +80,7 @@ The following D fragment illustrates this property:
>  ```
>  int *x;
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    trace(x);
>    trace(x + 1);
> @@ -98,7 +98,7 @@ For example, the following D program would trace the result `2`:
>  int *x, *y;
>  int a[5];
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    x = &a[0];
>    y = &a[2];
> diff --git a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> index 1ad4f6410..196f42692 100644
> --- a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> +++ b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> @@ -216,7 +216,7 @@ for example, when you use the D function `ustack()`. For example:
>          sudo dtrace -c ./a.out -q -n '
>              myprov$target:::my-put { printf("put %d %d\n", arg0, arg1); }
>              myprov$target:::my-get { printf("get\n"); }
> -            tick-5sec {exit(0)}'
> +            profile:::tick-5sec {exit(0)}'
>          ```
>  
>          This first example, runs the `a.out` command with the `-c` option.
> @@ -236,7 +236,7 @@ for example, when you use the D function `ustack()`. For example:
>          sudo dtrace -q -n '
>                   myprov'$pid':::my-put { printf("put %d %d\n", arg0, arg1); }
>                   myprov'$pid':::my-get { printf("get\n"); }
> -                 tick-5sec {exit(0)}'
> +                 profile:::tick-5sec {exit(0)}'
>          kill $pid
>          ```
>  
> @@ -251,7 +251,7 @@ for example, when you use the D function `ustack()`. For example:
>          sudo dtrace -Z -q -n '
>              myprov*:::my-put { printf("put %d %d\n", arg0, arg1); }
>              myprov*:::my-get { printf("get\n"); }
> -            tick-10sec {exit(0)}' &
> +            profile:::tick-10sec {exit(0)}' &
>          ./a.out &
>          ```
>  
> @@ -276,7 +276,7 @@ for example, when you use the D function `ustack()`. For example:
>      ```
>      sudo dtrace -c ./a.out -q -n '
>          myprov$target:::my-get { printf("get\n"); }
> -        tick-5sec {exit(0)}'
> +        profile:::tick-5sec {exit(0)}'
>      ```
>  
>      In this case, not only does the `put` probe not fire,
> diff --git a/doc/userguide/reference/dtrace-ref-StructsandUnions.md b/doc/userguide/reference/dtrace-ref-StructsandUnions.md
> index ba55bcf55..ff83d32d9 100644
> --- a/doc/userguide/reference/dtrace-ref-StructsandUnions.md
> +++ b/doc/userguide/reference/dtrace-ref-StructsandUnions.md
> @@ -34,7 +34,7 @@ syscall::read:return, syscall::write:return
>    elapsed[probefunc] += timestamp - ts[probefunc];
>  }
>  
> -END
> +dtrace:::END
>  {
>    printf("       calls max bytes elapsed nsecs\n");
>    printf("------ ----- --------- -------------\n");
> @@ -95,7 +95,7 @@ syscall::read:return, syscall::write:return
>    i[probefunc].elapsed += timestamp - i[probefunc].ts;
>  }
>  
> -END
> +dtrace:::END
>  {
>    printf("       calls max bytes elapsed nsecs\n");
>    printf("------ ----- --------- -------------\n");
> @@ -112,7 +112,7 @@ Run the program to return the results for a command. For example run the `sudo d
>  sudo dtrace -q -s rwinfo.d -c date
>  ```
>  
> -The `date` program runs and is traced until it exits and fires the `END` probe which prints the results:
> +The `date` program runs and is traced until it exits and fires the `dtrace:::END` probe which prints the results:
>  
>  ```
>   ...
> diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> index ef0910b90..01fa9d26e 100644
> --- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> +++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
> @@ -545,7 +545,7 @@ Integer modulus
>  </td></tr><tbody></table>
>  Arithmetic in D can only be performed on integer operands or on pointers. Arithmetic can't be performed on floating-point operands in D programs. The DTrace execution environment doesn't take any action on integer overflow or underflow. You must check for these conditions in situations where overflow and underflow can occur.
>  
> -However, the DTrace execution environment does automatically check for and report division by zero errors resulting from improper use of the `/` and `%` operators. If a D program contains an invalid division operation that's detectable at compile time, a compile error is returned and the compilation fails. If the invalid division operation takes place at run time, processing of the current clause is quit, and the `ERROR` probe is activated. If the D program has no clause for the `ERROR` probe, the error is printed and tracing continues. Otherwise, the actions in the clause assigned to the `ERROR` probe are processed. Errors that are detected by DTrace have no effect on other DTrace users or on the OS kernel. You therefore don't need to be concerned about causing any damage if a D program inadvertently contains one of these errors.
> +However, the DTrace execution environment does automatically check for and report division by zero errors resulting from improper use of the `/` and `%` operators. If a D program contains an invalid division operation that's detectable at compile time, a compile error is returned and the compilation fails. If the invalid division operation takes place at run time, processing of the current clause is quit, and the `dtrace:::ERROR` probe is activated. If the D program has no clause for the `dtrace:::ERROR` probe, the error is printed and tracing continues. Otherwise, the actions in the clause assigned to the `dtrace:::ERROR` probe are processed. Errors that are detected by DTrace have no effect on other DTrace users or on the OS kernel. You therefore don't need to be concerned about causing any damage if a D program inadvertently contains one of these errors.
>  
>  In addition to these binary operators, the `+` and `-` operators can also be used as unary operators, and these operators have higher precedence than any of the binary arithmetic operators. The order of precedence and associativity properties for all D operators is presented in [Operator Precedence](dtrace-ref-TypesOperatorsandExpressions.md). You can control precedence by grouping expressions in parentheses \(`()`\).
>  
> @@ -1229,7 +1229,7 @@ For example, the following D program would trace the string "`hello`" and intege
>  inline string hello = "hello";
>  inline int number = 100 + 23;
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    trace(hello);
>    trace(number);
> diff --git a/doc/userguide/reference/dtrace-ref-Variables.md b/doc/userguide/reference/dtrace-ref-Variables.md
> index 70e214c14..04c8afde3 100644
> --- a/doc/userguide/reference/dtrace-ref-Variables.md
> +++ b/doc/userguide/reference/dtrace-ref-Variables.md
> @@ -201,7 +201,7 @@ syscall::read:entry
>  }
>  ```
>  
> -D variable declarations can't assign initial values. You can use a `BEGIN` probe clause to assign any initial values. All global variable storage is filled with zeroes by DTrace before you first reference the variable.
> +D variable declarations can't assign initial values. You can use a `dtrace:::BEGIN` probe clause to assign any initial values. All global variable storage is filled with zeroes by DTrace before you first reference the variable.
>  
>  ### Thread-Local Variables
>  
> @@ -249,7 +249,7 @@ Clause-local variable are used to restrict the storage of a variable to the part
>  Clause-local variables can be referenced and assigned by prefixing with `this->`:
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>  {
>    this->secs = timestamp / 1000000000;
>    ...
> @@ -262,7 +262,7 @@ To declare a clause-local variable explicitly before using it, you can do so by
>  this int x;  /* an integer clause-local variable */
>  this char c; /* a character clause-local variable */
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    this->x = 123;
>    this->c = 'D';
> diff --git a/doc/userguide/reference/dtrace_providers_dtrace.md b/doc/userguide/reference/dtrace_providers_dtrace.md
> index 8b48e93ec..9ce7424ce 100644
> --- a/doc/userguide/reference/dtrace_providers_dtrace.md
> +++ b/doc/userguide/reference/dtrace_providers_dtrace.md
> @@ -9,9 +9,9 @@ Use these probes to initialize state before tracing begins, process state after
>  
>  ## BEGIN Probe <a id="dt_ref_begin_prov">
>  
> -The `BEGIN` probe fires before any other probe.
> +The `dtrace:::BEGIN` probe fires before any other probe.
>  
> -No other probe fires until all `BEGIN` clauses have completed. This probe can be used to initialize any state that's needed in other probes. The following example shows how to use the `BEGIN` probe to initialize an associative array to map between `mmap()` protection bits and a textual representation:
> +No other probe fires until all `dtrace:::BEGIN` clauses have completed. This probe can be used to initialize any state that's needed in other probes. The following example shows how to use the `dtrace:::BEGIN` probe to initialize an associative array to map between `mmap()` protection bits and a textual representation:
>  
>  ```
>  dtrace:::BEGIN
> @@ -32,13 +32,13 @@ syscall::mmap:entry
>  }
>  ```
>  
> -The `BEGIN` probe fires in an unspecified context, which means the output of `stack` or `ustack`, and the value of context-specific variables such as `execname`, are all arbitrary. These values should not be relied upon or interpreted to infer any meaningful information. No arguments are defined for the `BEGIN` probe.
> +The `dtrace:::BEGIN` probe fires in an unspecified context, which means the output of `stack` or `ustack`, and the value of context-specific variables such as `execname`, are all arbitrary. These values should not be relied upon or interpreted to infer any meaningful information. No arguments are defined for the `dtrace:::BEGIN` probe.
>  
>  ## END Probe <a id="dt_ref_end_prov">
>  
> -The `END` probe fires after all other probes.
> +The `dtrace:::END` probe fires after all other probes.
>  
> -This probe doesn't fire until all other probe clauses have completed. This probe can be used to process state that has been gathered or to format the output. The `printa` function is therefore often used in the `END` probe. The `BEGIN` and `END` probes can be used together to measure the total time that's spent tracing, for example:
> +This probe doesn't fire until all other probe clauses have completed. This probe can be used to process state that has been gathered or to format the output. The `printa` function is therefore often used in the `dtrace:::END` probe. The `dtrace:::BEGIN` and `dtrace:::END` probes can be used together to measure the total time that's spent tracing, for example:
>  
>  ```
>  dtrace:::BEGIN
> @@ -56,25 +56,25 @@ dtrace:::END
>  }
>  ```
>  
> -As with the `BEGIN` probe, no arguments are defined for the `END` probe. The context in which the `END` probe fires is arbitrary and can't be depended upon.
> +As with the `dtrace:::BEGIN` probe, no arguments are defined for the `dtrace:::END` probe. The context in which the `dtrace:::END` probe fires is arbitrary and can't be depended upon.
>  
>  
>  
>  **Note:**
>  
> -The [`exit`](function_exit.md) function causes tracing to stop and the `END` probe to fire.
> -However, a delay exists between the invocation of the `exit` function and when the `END` probe fires.
> +The [`exit`](function_exit.md) function causes tracing to stop and the `dtrace:::END` probe to fire.
> +However, a delay exists between the invocation of the `exit` function and when the `dtrace:::END` probe fires.
>  During this delay, no further probes can fire.
> -After a probe invokes the `exit` function, the `END` probe isn't fired until DTrace determines that `exit` has been called and stops tracing.
> +After a probe invokes the `exit` function, the `dtrace:::END` probe isn't fired until DTrace determines that `exit` has been called and stops tracing.
>  The rate at which the exit status is checked can be set by using `statusrate` option.
>  
>  ## ERROR Probe <a id="dt_ref_error_prov">
>  
> -The `ERROR` probe fires when a runtime error occurs during the processing of a clause for a DTrace probe.
> +The `dtrace:::ERROR` probe fires when a runtime error occurs during the processing of a clause for a DTrace probe.
>  
>  When a runtime error occurs, DTrace doesn't process the rest of the clause that resulted in the error. If an ERROR probe is included in the script, it's triggered immediately. After the ERROR probe is processed, tracing continues. If you want a D runtime error to stop all further tracing, you must include an `exit()` action in the clause for the ERROR probe.
>  
> -In the following example, a clause attempts to dereference a `NULL` pointer and causes the `ERROR` probe to fire. Save it in a file named `error.d`:
> +In the following example, a clause attempts to dereference a `NULL` pointer and causes the `dtrace:::ERROR` probe to fire. Save it in a file named `error.d`:
>  
>  ```
>  dtrace:::BEGIN
> @@ -98,9 +98,9 @@ CPU     ID                    FUNCTION:NAME
>  
>  ```
>  
> -The output indicates that the `ERROR` probe fired and that `dtrace` reported the error. `dtrace` has its own enabling of the `ERROR` probe so that it can report errors. Using the `ERROR` probe, you can create custom error handling.
> +The output indicates that the `dtrace:::ERROR` probe fired and that `dtrace` reported the error. `dtrace` has its own enabling of the `dtrace:::ERROR` probe so that it can report errors. Using the `dtrace:::ERROR` probe, you can create custom error handling.
>  
> -The arguments to the `ERROR` probe are described in the following table.
> +The arguments to the `dtrace:::ERROR` probe are described in the following table.
>  
>  <table><thead><tr><th>
>  
> @@ -313,7 +313,7 @@ Library level fault
>  
>  None.
>  </td></tr><tbody></table>
> -If the actions that are taken in the `ERROR` probe cause an error, that error is silently dropped. The `ERROR` probe isn't recursively invoked.
> +If the actions that are taken in the `dtrace:::ERROR` probe cause an error, that error is silently dropped. The `dtrace:::ERROR` probe isn't recursively invoked.
>  
>  ## dtrace Stability <a id="dt_ref_dtstability_prov">
>  
> diff --git a/doc/userguide/reference/dtrace_providers_fbt.md b/doc/userguide/reference/dtrace_providers_fbt.md
> index 295a21d83..f3c32ae1c 100644
> --- a/doc/userguide/reference/dtrace_providers_fbt.md
> +++ b/doc/userguide/reference/dtrace_providers_fbt.md
> @@ -13,6 +13,11 @@ An effective use of FBT probes requires knowledge of the kernel implementation.
>  
>  Because of the large number of FPB probes that are available, be specific about the modules and functions that you enable probes for. Performance can be impacted when the full range of FBT probes are enabled at the same time.
>  
> +Further, while it is generally best practice to specify the provider name explicitly,
> +an explicit provider name is especially important for FBT (and raw FBT) probes,
> +since an FBT probe will typically have a similarly named raw-FBT counterpart,
> +and in all likelihood one probably does not want both probes.
> +
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
>  ## fbt Probes <a id="dt_ref_fbtprobes_prov">
> diff --git a/doc/userguide/reference/dtrace_providers_io.md b/doc/userguide/reference/dtrace_providers_io.md
> index 67c5c7d34..f3105c1e0 100644
> --- a/doc/userguide/reference/dtrace_providers_io.md
> +++ b/doc/userguide/reference/dtrace_providers_io.md
> @@ -360,7 +360,7 @@ The following example script displays information for every I/O as it's issued.
>  ```
>  #pragma D option quiet
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    printf("%10s %2s\n", "DEVICE", "RW");
>  }
> @@ -390,7 +390,7 @@ You can make the example script slightly more sophisticated by using an associat
>  ```
>  #pragma D option quiet
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    printf("%10s %2s %7s\n", "DEVICE", "RW", "MS");
>  }
> @@ -423,7 +423,7 @@ io:::start
>    @[args[1]->dev_statname, execname, pid] = sum(args[0]->b_bcount);
>  }
>  
> -END
> +dtrace:::END
>  {
>    printf("%10s %20s %10s %15s\n", "DEVICE", "APP", "PID", "BYTES");
>    printa("%10s %20s %10d %15@d\n", @);
> @@ -481,7 +481,7 @@ io:::done
>    start[args[0]->b_edev, args[0]->b_blkno] = 0;
>  }
>  
> -END
> +dtrace:::END
>  {
>    printa(" %s (%s)\n%@d\n", @);
>  }
> diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
> index 3ac8b706a..c0f679944 100644
> --- a/doc/userguide/reference/dtrace_providers_proc.md
> +++ b/doc/userguide/reference/dtrace_providers_proc.md
> @@ -588,7 +588,7 @@ proc:::exec-failure
>    self->parent = NULL;
>  }
>  
> -END
> +dtrace:::END
>  {
>    printf("%-20s %-20s %s\n", "WHO", "WHAT", "COUNT");
>    printa("%-20s %-20s %@d\n", @);
> @@ -676,7 +676,7 @@ proc:::signal-send
>    @[execname, stringof(args[1]->pr_fname), args[2]] = count();
>  }
>  
> -END
> +dtrace:::END
>  {
>    printf("%20s %20s %12s %s\n",
>        "SENDER", "RECIPIENT", "SIG", "COUNT");
> diff --git a/doc/userguide/reference/dtrace_providers_rawfbt.md b/doc/userguide/reference/dtrace_providers_rawfbt.md
> index 7b1fc7723..6210bebe6 100644
> --- a/doc/userguide/reference/dtrace_providers_rawfbt.md
> +++ b/doc/userguide/reference/dtrace_providers_rawfbt.md
> @@ -18,6 +18,11 @@ sudo dtrace -lP rawfbt
>  As with the `fbt` provider, there could be tens of thousands of probes,
>  and effective use requires knowledge of the kernel implementation.
>  
> +And, as with the `fbt` provider, typically one should specify the provider name
> +explicitly for `rawfbt` probes;
> +a raw FBT probe will typically have a similarly named FBT counterpart,
> +and in all likelihood one probably does not want both probes.
> +
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
>  ## rawfbt Probes <a id="dt_ref_rawfbtprobes_prov">
> diff --git a/doc/userguide/reference/function_alloca.md b/doc/userguide/reference/function_alloca.md
> index 5457edb7e..d9170e755 100644
> --- a/doc/userguide/reference/function_alloca.md
> +++ b/doc/userguide/reference/function_alloca.md
> @@ -12,7 +12,7 @@ The `alloca` function allocates *size* bytes out of scratch memory, and returns
>  ## How to use alloca to assign a string to an allocated memory region and then to read it out again by using the pointer
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>  {
>          x = (string *)alloca(sizeof(string) + 1);
>          *x = "abc";
> diff --git a/doc/userguide/reference/function_basename.md b/doc/userguide/reference/function_basename.md
> index a6cd997f3..f5928dec8 100644
> --- a/doc/userguide/reference/function_basename.md
> +++ b/doc/userguide/reference/function_basename.md
> @@ -12,7 +12,7 @@ The `basename` function creates a string that consists of a copy of the specifie
>  ## How to use basename to return the last element of a path in a string
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>  {
>          printf("%s\n", basename("/foo/bar/baz"));
>          printf("%s\n", basename("/foo/bar///baz/"));
> diff --git a/doc/userguide/reference/function_bcopy.md b/doc/userguide/reference/function_bcopy.md
> index abbe143c3..fcd43387d 100644
> --- a/doc/userguide/reference/function_bcopy.md
> +++ b/doc/userguide/reference/function_bcopy.md
> @@ -14,7 +14,7 @@ The `bcopy` function copies *size* bytes from the memory that's pointed to by *s
>  In this example, the `bcopy` function is used to copy 14 characters from the ``linux_banner` pointer into a separate memory pointer, `s`, that's allocated 14 bytes of memory. The `printf` line prints a string of the value in stored in the pointer, `s`. The string that's printed is the same as the first 14 characters stored in ``linux_banner`.
>  
>  ```
> - BEGIN
> + dtrace:::BEGIN
>   {
>           s = (char *)alloca(14);
>           bcopy(`linux_banner, &s[0], 13);
> diff --git a/doc/userguide/reference/function_clear.md b/doc/userguide/reference/function_clear.md
> index de620b650..308e28cff 100644
> --- a/doc/userguide/reference/function_clear.md
> +++ b/doc/userguide/reference/function_clear.md
> @@ -13,12 +13,12 @@ If the key is referenced after the `clear` function is run, it has a zero value.
>  
>  ## How to use clear to show the system call rate only for the most recent ten-second period
>  
> -The `clear` function is used inside the `tick-10sec` probe to clear the counter values inside the `@func` aggregation.
> +The `clear` function is used inside the `profile:::tick-10sec` probe to clear the counter values inside the `@func` aggregation.
>  
>  ```
>  #pragma D option quiet
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    last = timestamp;
>  }
> @@ -28,7 +28,7 @@ syscall:::entry
>    @func[execname] = count();
>  }
>  
> -tick-10sec
> +profile:::tick-10sec
>  {
>    normalize(@func, (timestamp - last) / 1000000000);
>    printa(@func);
> diff --git a/doc/userguide/reference/function_denormalize.md b/doc/userguide/reference/function_denormalize.md
> index 03ab659e0..b6924a33a 100644
> --- a/doc/userguide/reference/function_denormalize.md
> +++ b/doc/userguide/reference/function_denormalize.md
> @@ -14,7 +14,7 @@ The `denormalize` function removes any normalization that's applied to a specifi
>  ```
>  #pragma D option quiet
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    start = timestamp;
>  }
> @@ -24,7 +24,7 @@ syscall:::entry
>    @func[execname] = count();
>  }
>  
> -END
> +dtrace:::END
>  {
>    this->seconds = (timestamp - start) / 1000000000;
>    printf("Ran for %d seconds.\n", this->seconds);
> diff --git a/doc/userguide/reference/function_dirname.md b/doc/userguide/reference/function_dirname.md
> index 02e949ed1..aa5a41a4a 100644
> --- a/doc/userguide/reference/function_dirname.md
> +++ b/doc/userguide/reference/function_dirname.md
> @@ -12,7 +12,7 @@ The `dirname` function creates a string that consists of all but the last level
>  ## How to use dirname to return the path up to the last element in a string
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>  {
>          printf("%s\n", dirname("/foo/bar/baz"));
>          printf("%s\n", dirname("/foo/bar///baz/"));
> diff --git a/doc/userguide/reference/function_exit.md b/doc/userguide/reference/function_exit.md
> index db7660f7d..549be403b 100644
> --- a/doc/userguide/reference/function_exit.md
> +++ b/doc/userguide/reference/function_exit.md
> @@ -9,12 +9,12 @@ void exit(int *status*)
>  
>  The `exit` function is used to immediately stop tracing and inform DTrace to do the following: stop tracing, perform any final processing, and call `exit()` with the specified *status* value. Because `exit` returns a status to user level, it's considered a data recording function. However, unlike other data recording functions, `exit` can't be speculatively traced. Note that because `exit` is a data recording function, it can be dropped.
>  
> -When `exit` is called, only those DTrace functions that are already in progress on other CPUs are completed. No new functions occur on any CPU. The only exception to this rule is the processing of the `END` probe, which is called after the DTrace has processed the `exit` function, and indicates that tracing must stop.
> +When `exit` is called, only those DTrace functions that are already in progress on other CPUs are completed. No new functions occur on any CPU. The only exception to this rule is the processing of the `dtrace:::END` probe, which is called after the DTrace has processed the `exit` function, and indicates that tracing must stop.
>  
>  ## How to use exit to end all tracing and exit with an exit value
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>  {
>    trace("hello, world");
>    exit(0);
> diff --git a/doc/userguide/reference/function_ftruncate.md b/doc/userguide/reference/function_ftruncate.md
> index 95ea17d7b..67f4f8e9d 100644
> --- a/doc/userguide/reference/function_ftruncate.md
> +++ b/doc/userguide/reference/function_ftruncate.md
> @@ -12,18 +12,18 @@ The `ftruncate` function is a data recording function that truncates the output
>  ## How to use ftruncate to truncate the stdout output stream, by using a counter
>  
>  ```
> -tick-10ms
> +profile:::tick-10ms
>  {
>      printf("%d\n", i++);
>  }
>  
> -tick-10ms
> +profile:::tick-10ms
>  /i == 10/
>  {
>      ftruncate();
>  }
>  
> -tick-10ms
> +profile:::tick-10ms
>  /i == 20/
>  {
>      exit(0);
> diff --git a/doc/userguide/reference/function_index.md b/doc/userguide/reference/function_index.md
> index e368eb1ef..e99bddbf8 100644
> --- a/doc/userguide/reference/function_index.md
> +++ b/doc/userguide/reference/function_index.md
> @@ -12,7 +12,7 @@ The `index` function finds the position of the first occurrence of a substring,
>  ## How to use index to identify the first occurrence of a substring within a string
>  
>  ```
> -BEGIN {
> +dtrace:::BEGIN {
>           x = "#canyoufindapenguininthisstring?";
>           y = "penguin";
>           printf("The penguin appears at character %3d\n", index(x, y));
> diff --git a/doc/userguide/reference/function_inet_ntoa.md b/doc/userguide/reference/function_inet_ntoa.md
> index 7d8993e8e..9957118c9 100644
> --- a/doc/userguide/reference/function_inet_ntoa.md
> +++ b/doc/userguide/reference/function_inet_ntoa.md
> @@ -16,7 +16,7 @@ In the example, an IP address pointer is created in scratch memory and populated
>  ```
>   typedef vmlinux`__be32 ipaddr_t;
>   ipaddr_t *ip4a;
> - BEGIN
> + dtrace:::BEGIN
>   {
>           ip4a = alloca(sizeof(ipaddr_t));
>           *ip4a = 0x0100007f;
> diff --git a/doc/userguide/reference/function_lltostr.md b/doc/userguide/reference/function_lltostr.md
> index 60ec9b9b5..36179bec9 100644
> --- a/doc/userguide/reference/function_lltostr.md
> +++ b/doc/userguide/reference/function_lltostr.md
> @@ -16,7 +16,7 @@ The example shows that the `printf` function treats the value as a string. The p
>  ```
>  #pragma D option strsize=7
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>      printf("%s\n", lltostr(1234567890));
>  }
> diff --git a/doc/userguide/reference/function_normalize.md b/doc/userguide/reference/function_normalize.md
> index 7fec4f798..f563c4173 100644
> --- a/doc/userguide/reference/function_normalize.md
> +++ b/doc/userguide/reference/function_normalize.md
> @@ -16,7 +16,7 @@ The normalize function is called against the aggregation. The time is divided to
>  ```
>  #pragma D option quiet
>  
> -BEGIN
> +dtrace:::BEGIN
>  {
>    start = timestamp;
>  }
> @@ -26,7 +26,7 @@ syscall:::entry
>    @func[execname] = count();
>  }
>  
> -END
> +dtrace:::END
>  {
>    normalize(@func, (timestamp - start) / 1000000000);
>  }
> diff --git a/doc/userguide/reference/function_printa.md b/doc/userguide/reference/function_printa.md
> index e81727b5a..ba031b1a5 100644
> --- a/doc/userguide/reference/function_printa.md
> +++ b/doc/userguide/reference/function_printa.md
> @@ -14,7 +14,7 @@ See the `printf(1)` manual page for more information on formatting directives. N
>  ## How to use printa to print basic formatting for different aggregations
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>  {
>          @a = avg(1);
>          @b = count();
> diff --git a/doc/userguide/reference/function_printf.md b/doc/userguide/reference/function_printf.md
> index b375fa209..78474a985 100644
> --- a/doc/userguide/reference/function_printf.md
> +++ b/doc/userguide/reference/function_printf.md
> @@ -14,7 +14,7 @@ See the `printf(1)` manual page for more information on formatting directives. N
>  ## How to use printf to print a formatted string
>  
>  ```
> -BEGIN {
> +dtrace:::BEGIN {
>     printf("execname is %s; priority is %d", execname, curlwpsinfo->pr_pri);
>  }
>  ```
> diff --git a/doc/userguide/reference/function_rand.md b/doc/userguide/reference/function_rand.md
> index 840c83aba..5b92a8870 100644
> --- a/doc/userguide/reference/function_rand.md
> +++ b/doc/userguide/reference/function_rand.md
> @@ -14,8 +14,8 @@ The `rand` function returns a pseudo random integer. The value returned is a wea
>  The example uses the trace function to print the generated integer in the trace output.
>  
>  ```
> -BEGIN{ 
> -   trace(rand()); 
> +dtrace:::BEGIN{
> +   trace(rand());
>  }
>  ```
>  
> diff --git a/doc/userguide/reference/function_rindex.md b/doc/userguide/reference/function_rindex.md
> index 820820048..9aebf89af 100644
> --- a/doc/userguide/reference/function_rindex.md
> +++ b/doc/userguide/reference/function_rindex.md
> @@ -12,7 +12,7 @@ The `rindex` function finds the position of the last occurrence of a substring,
>  ## How to use rindex to identify the last occurrence of a substring within a string
>  
>  ```
> -BEGIN {
> +dtrace:::BEGIN {
>           x = "#findthelastpenguininthepenguinstring!";
>           y = "penguin";
>           printf("The last penguin appears at character %3d\n", rindex(x, y));
> diff --git a/doc/userguide/reference/function_strchr.md b/doc/userguide/reference/function_strchr.md
> index 26759558c..321a6b94e 100644
> --- a/doc/userguide/reference/function_strchr.md
> +++ b/doc/userguide/reference/function_strchr.md
> @@ -14,7 +14,7 @@ The returned string is allocated out of scratch memory and is therefore valid on
>  ## How to use strchr to return a string starting at the first occurrence of a character
>  
>  ```
> - BEGIN
> + dtrace:::BEGIN
>   {
>           str = "fooeyfooeyfoo";
>           c = 'y';
> diff --git a/doc/userguide/reference/function_strjoin.md b/doc/userguide/reference/function_strjoin.md
> index 73f94c70f..0c0a1a878 100644
> --- a/doc/userguide/reference/function_strjoin.md
> +++ b/doc/userguide/reference/function_strjoin.md
> @@ -12,7 +12,7 @@ The `strjoin` function returns the concatenation of two specified strings. The r
>  ## How to use strjoin to concatenate two strings together
>  
>  ```
> -BEGIN {
> +dtrace:::BEGIN {
>       string1="foo";
>       string2="bar";
>       printf("%s",strjoin(string1,string2));
> diff --git a/doc/userguide/reference/function_strlen.md b/doc/userguide/reference/function_strlen.md
> index f873f47ea..aebafff9f 100644
> --- a/doc/userguide/reference/function_strlen.md
> +++ b/doc/userguide/reference/function_strlen.md
> @@ -12,7 +12,7 @@ The `strlen` function returns the length of a specified string in bytes, excludi
>  ## How to use strlen to return the length of a string
>  
>  ```
> -BEGIN {
> +dtrace:::BEGIN {
>       string1="foo bar?";
>       printf("%d",strlen(string1));
>       exit(0);
> diff --git a/doc/userguide/reference/function_strrchr.md b/doc/userguide/reference/function_strrchr.md
> index c611ed9fa..1bcd07669 100644
> --- a/doc/userguide/reference/function_strrchr.md
> +++ b/doc/userguide/reference/function_strrchr.md
> @@ -14,7 +14,7 @@ The returned string is allocated out of scratch memory and is therefore valid on
>  ## How to use strrchr to return the pointer to the last occurrence of a character
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>  {
>          str = "fooeyfooeyfoo";
>          c = 'y';
> diff --git a/doc/userguide/reference/function_strstr.md b/doc/userguide/reference/function_strstr.md
> index f1692bf54..66f79cc67 100644
> --- a/doc/userguide/reference/function_strstr.md
> +++ b/doc/userguide/reference/function_strstr.md
> @@ -12,7 +12,7 @@ The `strstr` function returns a substring starting at the first occurrence of a
>  ## How to use strstr to return a substring starting at the first occurrence of a substring in a string
>  
>  ```
> - BEGIN {
> + dtrace:::BEGIN {
>       string1="foo bar?";
>       substring=" ba";
>       # the following line prints " bar?"
> diff --git a/doc/userguide/reference/function_strtok.md b/doc/userguide/reference/function_strtok.md
> index 7819e5fcf..58e22094d 100644
> --- a/doc/userguide/reference/function_strtok.md
> +++ b/doc/userguide/reference/function_strtok.md
> @@ -14,29 +14,29 @@ The `strtok` function parses a string into a sequence of tokens by using a speci
>  In this example, `strtok` is used to break a comma delimited string into tokens. Because DTrace doesn't include flow-control structures similar to while loops, you must use predicates to emulate this functionality to step through each token. The example, shows how to walk through the first two tokens generated by the string. Each predicate gets the next token and checks that it's not a NULL value, which would represent the end of the string.
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>   {
>       this->str = "Carrots,Barley,Oatmeal,Corn,Beans";
>   }
>   
> - BEGIN
> + dtrace:::BEGIN
>   /(this->field = strtok(this->str, ",")) == NULL/
>   {
>           exit(1);
>   }
>   
> - BEGIN
> + dtrace:::BEGIN
>   {
>           printf("First token: %s\n", this->field);
>   }
>   
> - BEGIN
> + dtrace:::BEGIN
>   /(this->field = strtok(NULL, ",")) == NULL/
>   {
>           exit(2);
>   }
>   
> - BEGIN
> + dtrace:::BEGIN
>   {
>           printf("Second token: %s\n", this->field);
>           exit(0)
> diff --git a/doc/userguide/reference/function_substr.md b/doc/userguide/reference/function_substr.md
> index 9fb8fc5a7..3d9f7cf54 100644
> --- a/doc/userguide/reference/function_substr.md
> +++ b/doc/userguide/reference/function_substr.md
> @@ -14,7 +14,7 @@ The `substr` function returns the substring of a string, *string*, starting at t
>  In the example, the length of the substring returned is limited to 4 characters.
>  
>  ```
> - BEGIN {
> + dtrace:::BEGIN {
>       string1="daddyorchips";
>       trace(substr(string1,7,4))
>       exit(0)
> diff --git a/doc/userguide/reference/function_system.md b/doc/userguide/reference/function_system.md
> index f90c70d8f..bee3c2479 100644
> --- a/doc/userguide/reference/function_system.md
> +++ b/doc/userguide/reference/function_system.md
> @@ -19,7 +19,7 @@ Note that the pragma lines include the destructive option to permit DTrace to ru
>  #pragma D option destructive
>  #pragma D option quiet
>  
> -tick-1sec
> +profile:::tick-1sec
>  {
>  system("date")
>  }
> diff --git a/doc/userguide/reference/function_trace.md b/doc/userguide/reference/function_trace.md
> index ff9e05fc5..de836f6cf 100644
> --- a/doc/userguide/reference/function_trace.md
> +++ b/doc/userguide/reference/function_trace.md
> @@ -18,7 +18,7 @@ You can force the `trace` function to always use the binary format by specifying
>  The example shows the trace function being used to return output for a built-in variable, an expression, and a string value.
>  
>  ```
> -BEGIN
> +dtrace:::BEGIN
>  {
>  trace(execname);
>  trace(timestamp / 1000);
> diff --git a/doc/userguide/reference/function_tracemem.md b/doc/userguide/reference/function_tracemem.md
> index 1e3370c94..c9f8a7198 100644
> --- a/doc/userguide/reference/function_tracemem.md
> +++ b/doc/userguide/reference/function_tracemem.md
> @@ -16,7 +16,7 @@ Limiting the data that's copied to the buffer is useful when the data that you'r
>  The example creates a pointer to the current thread by using the built-in variable `curthread`.
>  
>  ```
> -BEGIN {
> +dtrace:::BEGIN {
>       p = curthread;
>       tracemem(p, 256);
>       exit(0);
> diff --git a/doc/userguide/reference/function_trunc.md b/doc/userguide/reference/function_trunc.md
> index b15cf3fe5..b2506f0e1 100644
> --- a/doc/userguide/reference/function_trunc.md
> +++ b/doc/userguide/reference/function_trunc.md
> @@ -16,7 +16,7 @@ By default, no keys are kept.
>  
>  ## How to use trunc to show the system call rate only for the most recent ten-second period
>  
> -The `trunc` function is used inside the `tick-10sec` probe to clear the keys inside the `@func` aggregation.
> +The `trunc` function is used inside the `profile:::tick-10sec` probe to clear the keys inside the `@func` aggregation.
>  
>  ```
>  #pragma D option quiet
> @@ -26,7 +26,7 @@ syscall:::entry
>    @func[execname] = count();
>  }
>  
> -tick-10sec
> +profile:::tick-10sec
>  {
>    printa(@func);
>    trunc(@func);
> @@ -39,10 +39,10 @@ retains keys and simply clears their values.
>  If the reported aggregations have too many keys, you can use the optional,
>  second argument to indicate how many keys to retain.
>  For example, you could limit the reporting to the 5 most common
> -functions by changing the `tick` probe to:
> +functions by changing the `profile:::tick-10sec` probe to:
>  
>  ```
> -tick-10sec
> +profile:::tick-10sec
>  {
>    trunc(@func, 5);
>    printa(@func);
> -- 
> 2.47.3
> 
