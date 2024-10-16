Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302820F5D3
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094322; cv=fail; b=IaHuCt7hGqvF2qDba2PUhoqHNnZQk38XDa531Gs7wISuCUTtMxQRFYjvFOWJ0RRtKySzncR7XdLso8dMXBC0HKgsOdl35Dy+qroZ/Xdlu+IdeObetBRvaAYmhugTGH5n3LTPrcTEl+amFIb+pFQc23tB+PUNjMK8MvXxtlviq4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094322; c=relaxed/simple;
	bh=mkOvAKXHBJEdSN/NXOsL7Za4bp6dSGF0g/2J1VoEe0E=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YU7lbjtnJuk4uwXSfNfAyZ0xscYS9Yawk0QUoef2mzB8oJ7m4HAjS6jMnAuLUyY6PZawfsky21JPMijIVfdm3rEuKNX6y686BIwyWIfndNm/qGp5vN84/SHiqqIU829PNt4Knk2f51W0sRwrvgWnaYD1/fIqPH+/hRIQBTaHa90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yw9fOM+C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qtNZaXmX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yw9fOM+C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qtNZaXmX"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFfieL024673
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Y/dyRV+SRz2nUx6qwHSySIyYI9wdCSbPYTS4MfEsnBU=; b=
	Yw9fOM+C0EfFdUvFhJCY33K91+50yritKhS0nxDXSAMZ8tg3TENVb1NI7en9+yGy
	eDaQ2nKcz7sPQNyOEzETuyUoBP8QH/ccu+w8csV4TTP6G2ak56aWi+pQKQzmlsOH
	VUIswlRLw4SbPMIqIjsdzNGy6kuq2SaSu5jc1OZkCoMPusLbEmF2+Wbv8Zb/Fgvx
	KvpXSfesc9rLGNddFpcUM9lwvX+bPKyxPG9Y8mRHdI/y5BKXRMiAuNlQBgZds+EI
	R+k9HGF0bLKty06Mzdol26TQQJEeOtIqJBflIVyZWCnpIN1rvP/v4yUjfWFHuLf/
	EpWMh+uw88+AvC1mdUJN5A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427gq7m705-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:58:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFobDD026558
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:58:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjfk8k0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 15:58:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCkRdyi2LC6FdAzbDZS8wCSXROl9CXyDI7eWQZ69RZ3X5qV4LI7eEdGnE1n0Qlbfg/mP9Ea919orJqNDhAgfU4keZc/OGn4CgTOLMCeuHVmaZnwnoIBysLubQz5ZQerx++znLuXHkt4UOOADXN2MHWG7uvE3LZwF8dKr1HQt6MkUKGe0kulncFaBznrkQ37qCryamzacepvbbnrp51IS0/HfQOB79G8fMY9BtOgSs8pT7PUhN88yQHekpFW+moC//zszMWWHKZRqImnGoYulETe1EID5LzPa/FaIR559HDGXdMEvZd495BOtQm+ZZT/Mb5wDalfq+hx8mp8Olb6iFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/dyRV+SRz2nUx6qwHSySIyYI9wdCSbPYTS4MfEsnBU=;
 b=vDjMAqPrFySMrU8HLojxwWseTVTcMF600Akna+LbMohmhMUMmRyLRmjr5boJzpxkyGIOIp5FK56YlEQBKu66agcuj/D5tnrdiNNFigPy/SDyI8q2Ly8K6/6QkfXyrlozODUzh6WD+Wvx1HbYXbFblxayA0PbKGlDZ47G9Fn2CoGz00WloTLa16urwNqtrFKBVh2IxFtaVcVLb0S3DGgqz0I+eq94+c95mLRWS7ON5gn9rIbNBtUW7EbXfMMHpZ9AKoAwDjsnzo03uWZqSkPerBIj0QRlFdTGZwHgnxu1dmsrQw5RtYVQGPKE9OPwMXV3OYG8tXQ2KMOI1enSUX2zow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/dyRV+SRz2nUx6qwHSySIyYI9wdCSbPYTS4MfEsnBU=;
 b=qtNZaXmXNvqS5/HC0EzXEMXZC6WSY8RTetifIWcUn0w0wXjOljAoug59CgeHr7T/hE7xS0zj2fQN6dFcl+X24HfqEbPxGfGPpyokTOkDJEyKYrTlSC2qTNlFe4S1JM3jtVqRCNBiprMHdhxRqPQ9HT/wQIMIbcg3YSwQyODWZck=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB4963.namprd10.prod.outlook.com (2603:10b6:208:326::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Wed, 16 Oct
 2024 15:58:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 15:58:34 +0000
Message-ID: <6f60547b-06ed-6bd4-d703-ff8b802f1d8b@oracle.com>
Date: Wed, 16 Oct 2024 11:58:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/6] Deferred attach of underlying USDT probes
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241009054535.28199-1-eugene.loh@oracle.com>
 <20241009054535.28199-2-eugene.loh@oracle.com>
In-Reply-To: <20241009054535.28199-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c655825-6d6f-484e-eb6b-08dcedfb6341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEt4RnFtd2I1MzMwWDYrVmF1OE45Wm5pVVhuWm15SE9QZ3NBNVFETnNSUzVm?=
 =?utf-8?B?MHY2d20yaE9ERzlSMXRCUGkyVjJzRHlkK3pSYUt0MktmMFRPWDE4QldVK3Vm?=
 =?utf-8?B?R2RyZ0d5WVZwYlYyT3VKMzYvb1ErbG9DL2M1Yjl6d3JWejVMc0ozUERjWkJR?=
 =?utf-8?B?RnM3a2lVQnhxT0VMc2picU55bUhKaHJsUlc0U2ZwcGRjQjV6d3NrRk91Z280?=
 =?utf-8?B?U3BqcXRxdDErNUxRbno0RFpEZ2g2a2xVMzZOWGFucnk2MmwyNVlDUUNzamt6?=
 =?utf-8?B?dEFUNktibC9HbzFyMnFpd3FKMnhNc1FGNWx1TThpVnd3MnhWd2tyU1RueGll?=
 =?utf-8?B?YzB5bkVVeFI2ejJWa0ZOQ014VXFBMTNERjRWWHRmSW1hNjB0cVU0NlR0KzYx?=
 =?utf-8?B?MVNkdWtYL3VqTEFXYkM5enpMajVkTmh3L29SRmRGOHpiU3FXTDRkQUJ5a2xt?=
 =?utf-8?B?aHhvOVhsKzlVbHQ1Y1Z5OGVpMWpOdk9HNjlYeGRkMTBUd0kyNmRiT0U4eHYw?=
 =?utf-8?B?TDRIZmlPMXh3REE5VnhkT29xdjZvZEVoTXVPaS9sOGw1Z09MNG1KektGYjV6?=
 =?utf-8?B?M3pvblRyM2l6ZFczR0oxams2QjdadC9aSmxNV1hycithcFV0YUhibVhVNTNj?=
 =?utf-8?B?cHFOTUVhVk9jWXcvVHpDMlM4ZFVVLytWa0p3YnRmSEtCSzNJN1RyRlNBOHNs?=
 =?utf-8?B?TlRZWkwzanNXQy9XMXA1bktNUkJQdjBRSkIyWi9Kc1lPQ1V2UHQwR0lRYnEz?=
 =?utf-8?B?eHpGL21PVUlnY1lzRUZaTzZGcWFmeW9xL2Y3Q0pVVWxYNmhXRW5tZlRkUlQv?=
 =?utf-8?B?NnIxbzdmZ0UzeWNzQXhkWTEraVhmYUEyVit4Ukt4c2dkeUFGamJ2anhRYlpS?=
 =?utf-8?B?SkNqcTRNdnA4SktRbFkweVFoakdMZ09TUjBrS2RhdGN1d1Q4NytHaHBMbmJL?=
 =?utf-8?B?V2F2c0V6bW9rUGFEbXlkVUUwZ1pTVW03bG9QNzNjdWs1NXlVUjUvU2R1YkVi?=
 =?utf-8?B?N3AwS043UVJxT2VWeGEyQlR2T0pNcjFoTTFxNmdrLzhnTDJDdGxLanhGYmls?=
 =?utf-8?B?amxPUEV1QnRBOCtTZWQ1TTVQdFFnRFBqaHRTK2c0K1VxbHBYVFlRaGQ2c1BG?=
 =?utf-8?B?UkkwOFdia1BVdVVpY3RaWkJTTlM4NjhmVTZXa1V5RzYxdEtranBsU2FoTGhN?=
 =?utf-8?B?TEJSQ0hNd1ZEWHFEZHZPNko3REtqc0tPVkhaOHBQYlQ5eThYcGpRYlF6L1pD?=
 =?utf-8?B?MmJnSGNGU2lqWllCd3JjWWNqckY0djlIMkYySCtDZndwNkMyVFIya2R1TmpY?=
 =?utf-8?B?Kyt0MktPSWk3bndiU1FQRjRnT3dLSXZCbGIyR1AvdTVXdWp6djQyU1loaGJj?=
 =?utf-8?B?YkdqdXNCcWw1R0V3d0EyTlFsS3AyQ3ZSendwOU41elBIU1E4N0V1UnZKNVlE?=
 =?utf-8?B?TGhLMTRqdWxvSGtITmRZNHg2RGE4b2pWbUZ4YitUNC9vemVTSDZvVFYySG5C?=
 =?utf-8?B?elFQSjh2UFJzQjJVSkZsbFVRTHJpMnl3YVdmVmNOdjJDWFMzM2g4aHdPTVhK?=
 =?utf-8?B?c3BPdmhOek5qejBNVnYzU0RvcmNRY0dWRXNVNTJLKzd1MDBDNm8ySXdEd1VJ?=
 =?utf-8?B?REJzSkZ3aXNkZTFCV1Rna3pDWmlQU1hMQzRQY2RyNFZFbktlaXlOYUczeDNP?=
 =?utf-8?B?RHl1RlFnMzE3bnNjSVhYTHFYN2ZUZkhsT0RvL1Q2OU1sOUd3Z2UzMEFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzU5L1lhSkRVb1FDc1dKUFVNV3RxQ3N2TllqcTBVUW5DbTNNVnRVRkNJejJm?=
 =?utf-8?B?WU85dHY4Ly90cVpTQmFwTU5hQkt6RC9FL2pMRUM5OTNaVEx1SlRtODJFeTUv?=
 =?utf-8?B?ejEvTnJjTi9CbTJSbFVDSFB3STF2QXRMTU9NWlFEM29LTVlickdMa0IzMlhE?=
 =?utf-8?B?RWpBUzFUVTV3bCtPLzdtU1ZSWjl1VEQrcTB5SjZ2UWt1cGJvWnNsVHppbzdD?=
 =?utf-8?B?ZmF4M2dhd3hmMFFtcGVNMUk4U3VLSWg1V3FSY2dHL0wxQ0ovTGkzYStjdUFj?=
 =?utf-8?B?ZTA5WFJtREx1aE5XM2dNTE5Qd2dpRGU1bndQRkdkbkpZZ08rdlhzZHFoODFl?=
 =?utf-8?B?UUlUZ1lPVnZTNXNvaWUvL1RDR1hYWEFWaDhWSlhnckZnTmF2UWJ6blhPOElT?=
 =?utf-8?B?RmVySVZ6MWI3di8yTU9tVU5BbUtPcENVQytsay9FTHE4bi9ab2ovZzF4WmxM?=
 =?utf-8?B?cDlrdHpCRVBQclgybCsvcXZuVUJSR21TYVFNZkprREl4cTRjWDkwNlg1UzJN?=
 =?utf-8?B?emowY2N3c2RJd0F0L2lmUDBNdjVrRE1lRHdjbXFBTnMyV0JWaGVRQThwK1Yy?=
 =?utf-8?B?YWsyUWV3N05Ud2pwbkF2d0lIRi9GcEQ2bnhHWnpuMVlRSUM4V01tTmxJTnlu?=
 =?utf-8?B?V2dKc0I4djVrZVdxN05xZFdXN1RrWEZYQTVSZ1pqZ2liOVpFWGFWdVZReVpH?=
 =?utf-8?B?NVZqS2VhalBHaUlmZWVDVkNSSkszQUVYZVdTNXBHOGlsWWw3T2p2b0pZWGp6?=
 =?utf-8?B?dGRsTjNNRUlQYzR5K0w5Mk5seUpqNmFUU0t1S3duVmFiaEVzdTFFSkt6Q1M1?=
 =?utf-8?B?NVhFRU1jdmhVeFlaR3RvVnFVNGFtRFlJOU9UWVZpRjUxeVV0NG9na1FGaGNG?=
 =?utf-8?B?cC94R3Z2eU0yL3N5emtLU0xDTmhiZXgvWmpCdXFLbkc3VlhkSDEwU2Jwb29O?=
 =?utf-8?B?cEJwQm9ZSnE5M1Awelk2cTlJOUhTTXp1M0pIZzF6Y1d4RUovbGVqUllIRkxO?=
 =?utf-8?B?b1hyNmdOS1ZBS25VM3l4cWNBVzhydXJrd0V3ZEJtazZ1L1hseVVMNldydjJW?=
 =?utf-8?B?Y3J6ckFXZ0RwczNoc2tjc3lhcXRNWjl0MXpoM3NKUGw2YURpVnhydHRMUjZB?=
 =?utf-8?B?YXRRVmtKUUxTYllGZXJ6dEdyTjRWZnR6KzBOVTkrQ0VCZmN6L3prL1pwaXFR?=
 =?utf-8?B?R1FpUks3TnVIYWVuRExoWDB4dmxJbk5qTXBkV3FKMEpTbG9GRnMwSGIyejVK?=
 =?utf-8?B?ejdsVVcwdTVwMkg4OTBDdUh2cHRyakhCSk1WZDdoa29PQlhidmxRRjgvdEtn?=
 =?utf-8?B?eUs5YklVckJEYzFDdUpHOVRJZk9rRHphcUFXdXM1UVArQmV4bVU0b2cyYjRr?=
 =?utf-8?B?NXZMKzlLeEV3Q2lmb3dlU3pSSHExajdoRnl3NmRyb2wwOG9teFNOUUQrMHh0?=
 =?utf-8?B?bVliak5xekN5MEV3d1hUZnBTZG1pS2l0bmtIczJhSkZ5ejZ4ZWhBRk11b29B?=
 =?utf-8?B?YWlaNkIyM1dBT1pTaDROeWxkRmNaWjNCQkV2aW1PQ3BtUkdQVURUZmFJazBo?=
 =?utf-8?B?cHlLUXdsVXpONlZaMFVIQXlvMHJKc1RheldrTG1MVVJOOEZyaytVa2oxL3Vz?=
 =?utf-8?B?M0pIeFVUc0Ezc3lSYUVmQW95ODY5czBtOGQ4bzFPN01YanlNTGQrRyt6Sm9o?=
 =?utf-8?B?cmVrbGVPVTdUS1JVd1ZYNGRETHZKQUp1V0lwL25hKytuRnlPRFlNQklybGcx?=
 =?utf-8?B?UEpDMlQ1QVNjY1J4VDFvaGRHb3hqV3NHUC9KL0FQU1BJK1B2QlZwYituMXVX?=
 =?utf-8?B?UmNITzJhODk5Rk95NGZzd1B2bTByV1p5V0sxYy9rREVWa0g5dy8yb1FxM3lL?=
 =?utf-8?B?VGZRU2V5RW1HYy9vcmMrRXdQMXU4L3dwcStUaE1nbU9lYVB2T3hobWF2ZWc3?=
 =?utf-8?B?dnRHNEkvQTVrR3ZoMGc2NmtBeWRPRmMvS1IxcnlBTm03NTBCc3l1aVU0MzJZ?=
 =?utf-8?B?TEZhaDVyN2lPRzB1SVFQOGZKQ0xtbEt4SFBMcVJxdlRyMU0wWjZUaDdLaCtn?=
 =?utf-8?B?YlpqSThwRitjRGxIclB2TndqK29oV0ZYVkdyQzBBYUkzUHBxVFpMZ0E0SGpj?=
 =?utf-8?Q?SFffDz8dfuRpPgcngRlJxwZbY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4lqC90A8xP7K8jEOUqnico7w289j7ckE0CfcYd4z132CtWVakhdGgzUO+q3I0smxCWdS5iEqVbuEsmKJCTw2QKK8GiaV1ySUripkVSq1O8/aSu3sx0xJNkZVTksw2JU2NDwb7bGx0R1N938DYTjWu2I18wg4/0nZSCOUVnriERlVoDVNP9FBRtCLCFCmZ4n0aZZZnTqOTOI6mTlWuEMFnw4IW0i0mQmqvpBhGfXe07HqxTAlo+b6+NF5ie7ZmVYt45TuWUWkWqXf5AqVfFRSDhKOYBh73id1WonQ0LQVR3pazNsfve8B2Mf4PUXEgfjes1O3QHY38RXXoYrlGipIoyOcAvK/4yOY4JYibLzp81+OJy5Y1QdaQpGtLqjf8kUAQn3cpRC2weC7IJ5UkxpuC5KiJBG4WzYB+SxXXQgnONL1AJbszKfKtgHw3oj6Z7p6Ip+eBpxZwDMAGN3afEqvllf2hM/pTZBrVOjCVSyN7HcNCIEGeLtFQgTYEApQwMKIYb6cW7jLkDTgrnRoWHSNcnSJURj4lk3lNJxXlBa0vBqqbPjqtyE+6upIxYTHKNysECCOEj58I+QywadsusgdQC+x/pCXJlFAW27QpIRtoR4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c655825-6d6f-484e-eb6b-08dcedfb6341
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 15:58:33.9198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EvhIaguM/aVG0HEGiEnyjDsgIJaYC7B9Q++Q77IG03SLHdBDHq6K9oZ0nY8J+X13cOeuHVHT23ieneAld7S5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4963
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-16_13,2024-10-16_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410160101
X-Proofpoint-ORIG-GUID: MVKtHrHxXvJtldIR39r1nsBqA-qJ0dnD
X-Proofpoint-GUID: MVKtHrHxXvJtldIR39r1nsBqA-qJ0dnD

I am withdrawing this patch;  the rest of the 6-patch series is still 
good since it deals with tests.  With Kris's suggestion of 
dt_provider_discover(), the "deferred attach" will be absorbed into 
earlier patches.  The revised patches will be:

v2->v3 02/19 Add a hook for a provider-specific "update" function
     and will be renamed "Add a dt_provider_discover() function"

v5->v6 07/19 Create the BPF usdt_names and usdt_prids maps

v3->v4 09/19 Use usdt_prids map to call clauses conditionally for USDT 
probes

v2->v3 14/19 Ignore clauses in USDT trampoline if we know they are 
impossible

On 10/9/24 01:45, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> We would like dtrace to trace USDT processes that start
> even after the dtrace session has been launched.  In that
> case, the underlying probe cannot be attached when dtrace
> starts up;  rather, the BPF program must be attached once
> the USDT process has been detected.
>
> Therefore:
>
> *)  Make dt_bpf_load_prog() callable outside of dt_bpf.c.
>
> *)  Have update_uprobe() call dt_construct(), dt_link(),
>      dt_bpf_load_prog(), and attach() for any new underlying
>      probes.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
