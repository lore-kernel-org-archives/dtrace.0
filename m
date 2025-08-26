Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952E83D984
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 04:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756184276; cv=fail; b=HVGRtUnPf/N403mogDdM4LtTchyv80LCH9je9VxLtUeL3+QrVm6OIItSvo1Az+QHptKiKde4WR0w5FfkLaiXgyDdPDx0xjkx54hDVKbm3KxcXTHb7qCT4CrPAQvYsKqHTDrOrZFcJEVSb6gQUQbNES7rLsATHQjn6GqiVMqaQOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756184276; c=relaxed/simple;
	bh=37ggJ6Nv6Vu641pgNyii0fV82vdSeK2gVJ3S70eXna0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QReuQEnYmIJgIMqNPgayqsd3nUgQR8koPi/r76BiuaZXsZYT05XVk95e4CieqjwS8V4LTfIjl+zRW8tlNqsPEt8XxebdKARAvxNI5FJWXmWPb1UjVQJ4gFNzttKwbiS+XZ2nt42BQaxo5t3mKzzkNTROYBo6EykZxRAvl7hoad4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kvyInBV3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZQHKeiVn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kvyInBV3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZQHKeiVn"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q2Cvlf006708
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 04:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=f3dsHkD/8LOCRZkw0lEkXHkm/vuBZvDpLWDYzSuVlvs=; b=
	kvyInBV3SCbmOJqLJBDzc1msqlZeWdEUscXQcMQ9bRRe43Xe/Mp5SA1fwjxVOBKX
	aXVWBn04zvUXTZ1VXnWHfGv4iOWbpRVEaKeRuNrp3lm2hRvuM4VzTsawX7n+AfxH
	/UL73EKA6IdOMtiSSPV1Cc4wkqJFLucL5UGEvMiJgMVck2FSIxKGds9yzBflSkGp
	qKU+JC0JF5BY9Qqmme9xWQbkkywprAv53IzrS3x5j1pmn/hsyMeKzNdqw41YNwAK
	y1AanDFuFGUizzytYbM75CBxVVoO0vP/2i/9FJVQyqPhm/l5zJ8aNL7oYvTkGo4O
	3h3EcQZRVtIOGEskxNZ/5A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q678uka1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 04:57:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q2GOc9027332
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 04:57:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q439060h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 04:57:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SN+n8uMO9XvftiujZjlgW5+LCVWXtpQ3Tnhi3Z7GFr3RNPjGorktZkjf856RnOZmsfGiCL/dYG29/FGIksKf1ZF4zCE3pwfJq+2Hj6sfMPNytUSn3fQvZlV1qzf0qXQaaRY6BQ4vF5R0vCNc92CaXpSTAt3LsLtK3NaeoVVzkxQnAqp5L5iIzbh1nv9Wy1ITTSSMOJ76XN7T8mDzHLRh41byy1ycl1AIdHntzdqJvr8MgX0AAwph8f/HCyDa1fS+wCIcJtMa2Dhf1bVSSxFRsMglzG5nmAxrx9SJK+KIkBdnVP/GLYOU1WgxiFCVozG93qbsK2BiRHwtIYA2kCdgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3dsHkD/8LOCRZkw0lEkXHkm/vuBZvDpLWDYzSuVlvs=;
 b=akaov+Kla9hzMEnX9po0l92TQvzm0bWJooVB6XpTLzCZqLodB+R/9uldMU+mYEolc7F1Rk8f3Mwa3UF8wslJQI8X3/dcqWABnI5+qDwyPEfMFDZIXIlFUFHzPumef8dJTMEsYZuenuU1R5+2yg4gSoDhCzmlko7d+E19opBZxeqPs8YhnrjjRc52rdH7Ro9WulPMt+tmFyEc0H8d4Sm6vfvfMlT0LP2doh46pEW63bm6oiPK+Zx0cCRISS10eHs1zmASUI7Hl5d0eML0n0FVeMkmRfT9hhxi7hFKCTYL46aW6051WKcP2826Y9sx+KTINNwXZYeu6uT7PnAwq6hjCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3dsHkD/8LOCRZkw0lEkXHkm/vuBZvDpLWDYzSuVlvs=;
 b=ZQHKeiVn0rPujp/NtoKdC8Db24QKG0PvQKaaBymdrblXXh9xIwowY7+kGG617SDhXZtdoMo9D7KBAnTXpWzz7pkmjuigAUN8asDvXENdZHJSy32q6hnUCrUAVazJWD8SzAaLS9FkPhZ7XQEdUjnyFA+JnTQHR4JN1pudn3n4Qvg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM3PPF311374B40.namprd10.prod.outlook.com (2603:10b6:f:fc00::c17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:57:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Tue, 26 Aug 2025
 04:57:49 +0000
Message-ID: <2073aa34-9bf7-47a2-1f89-13b17c58fafa@oracle.com>
Date: Tue, 26 Aug 2025 00:57:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tcp provider: use __ip_queue_xmit() as it is non-static
 on 5.4
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250825171605.486689-1-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250825171605.486689-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0036.prod.exchangelabs.com (2603:10b6:a02:80::49)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM3PPF311374B40:EE_
X-MS-Office365-Filtering-Correlation-Id: 199c7341-238f-4fd7-3674-08dde45d1ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWtCQk5FNGlXMVBEUjZMMHpLS2c0V2NkZDdKL0dTM3RCOEVMOExiMVE5VFpQ?=
 =?utf-8?B?Zm5BVm13VUloNWo1WmszZGU2S3FodUFyQUZ0elhIUUhjNVVSWVQvQmJyUUds?=
 =?utf-8?B?b1Y5ZDlJQW93aXJKR2RxZSt0Rkw3U1JtMGtYdU5wZytJQjlmUExBaXpTZGkw?=
 =?utf-8?B?b2Q0Y0lIK0c0YVJETzNmYWx6eW83aHdJYTVFSjdsMW1uMksvL3ptcjBvUGtM?=
 =?utf-8?B?YlVRcnpoVFJwVktzcjJJbEluODBBWjFiSHhrb3JKbnBEOVBGWStGRlg1eGV4?=
 =?utf-8?B?UndHWW5CdURCQUJzdVR6R2swd2IrRU02Wk1kbU9oUWtzUU5XVitnSnVBQ1pQ?=
 =?utf-8?B?ZE1Na05QVDlwS1JGVlpTREM3NjJQZWZiQ3N0RUlkdEJNTFJEbkdzbTBNbVRv?=
 =?utf-8?B?V0pqVGZ5UmpnSmxOazAvdEpCZEQ5Tmw3UUxobzNwYTJ4aGIySytZMWN5cERI?=
 =?utf-8?B?RnFPRDBNYWVxT2FwQ09pOW9admJtQXFaTWQ1SmNQVDJ0TjlhelR4SnJxR1lF?=
 =?utf-8?B?Y2pKZzJ2MysvV0JPclh5OFFHeGhHQ25uWU90RHoxcUEzcnAvRWk5U2wxc3Zj?=
 =?utf-8?B?UTBMQ21jdThneHJpWTNGQ0NpVjlqejZXcHpBdjZ2SG1DWVI3d2t1dFdEeDBw?=
 =?utf-8?B?c0I0bmFiOWlsa0JwWkgzSVp4NUtmM0Zwdi9iRmFNVmxhRWxBU1FlQXNMKy9s?=
 =?utf-8?B?UnNnQ1Z6OU1kZ0FvaHpkNDdqODEwY21PZ1pNZTF4UEVxRFQwWXNxNUZHZTFE?=
 =?utf-8?B?b3BFcG90clN3a3JCVmo5VVV0TFZuWCt4cGNNdVpIbUM0NXl0RnJVZlZvNm1q?=
 =?utf-8?B?SGVDcHpPSTRXWThPaHA0RWRRL3RjVVY4Wi9IUExPWWg0YzEvNitsWjFGOWZa?=
 =?utf-8?B?L3owSi9KZ1V1cTlhRUQvTXlYSjhRTHhrMkpVZkorV1ExMzFwYkhQdEdMY3dG?=
 =?utf-8?B?dnBHZlo2NG5aSlR2dVVjNnI5TWt0dkFOVjJvNXMwSXJFY21ZVFFwU29jT0xV?=
 =?utf-8?B?dEROOUczNHlLekJYMTlPM0hhcitoVm9qTnQyTXd5dzhxZlJHYnMvTUZZaUhn?=
 =?utf-8?B?VGl0dzg1VG9ONWZ3dWFDakNGQUFobS9oYjVNaTM2ZGNVUkN3TjdOczJXRklW?=
 =?utf-8?B?UXBWc1pSTnJXRzhUOWl3TEVkaWJtTVJ1d2pNR1lQN3NibWtsbnl3ZXQ1Q2Vn?=
 =?utf-8?B?K0tVbDRzQmdIdWhzR1paczZUMUZmMzhTcTNaTUdKeGY4cEU4MjJPbmczaFhW?=
 =?utf-8?B?bW1XUnhYQ25kam10MmpISm9DcXpydktaUjhMU200YzczR3VsbDdqdHZ6VkV6?=
 =?utf-8?B?ZlJWUmtYTGJaRWJkMzlkMlB6UWxSWlpYT2EvaG9KaWFpY3dsc0F4VXBHd2s2?=
 =?utf-8?B?TzJWQlVLLzFNWk4wemR1NE1qOTNxRGtLY0NROVRGV0xvZTlsTmhkRDlMMjFY?=
 =?utf-8?B?ODBHTHR6Qnp6cU1BS3h0RS82b1cwTmpKM2NQUEs3NnBsTXZWMklTbVdEUlFM?=
 =?utf-8?B?R3VVaDlKVUZOQU16VWV0NDRUSzFTTTRtdkFIblg4S2VUdTJHV09mK0JoM0pq?=
 =?utf-8?B?QnB6WTlVM2oxWkswQms5cXhFVHF6YTZQN1pEWTFzV0hDQ3RuYnROYjErc1Fv?=
 =?utf-8?B?bjg2eWt4UEpwK2xvOHVSQWVnL1NwbTErcjl5MnpFTFlyY2dEQnVmMktXS2dO?=
 =?utf-8?B?d21Fd0ZYSlMyc0VMZGhyYnVGNTh6TXNWR3JORGpZbDNUMERkK21SazdrNGdE?=
 =?utf-8?B?VytsT2ExLzZaZGxaSSszVnRXcFA5NGpITXBoWmdWNzNBZms0QW1sdzV1ZEJU?=
 =?utf-8?B?aHVhL3RTdlFiOWZvNGFjaFZwNUxLb1BSUmxIeXd2dHMyMkJaL3IranhETllp?=
 =?utf-8?B?QXVHa0FTeUFQTzQzMzFWM0ZFbEdOUFZzeGhzbVFGYmh2M2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3d6VXJVNjZPcDE0VlQvdS9jV25remVySnM0R2xjYUxsMG9EMWsyQXYrT3R0?=
 =?utf-8?B?WnoxSjhQOEhvbklKWkZaV1ZSRUpCQjVsb0loQlI5ZFFCK003dkNFeU1DU0RZ?=
 =?utf-8?B?M3ZSSW1JQWg1dk03dDk2emV2UEVsWXp4ZGNBRHpLSzJYU0d1V2tIN3c3NkRy?=
 =?utf-8?B?bm96RDExV2gvYVJTbERTY1FzOUpVazNSd0czM2szbHB5T0dsdDN2Ry92Nkd4?=
 =?utf-8?B?ZERuQ2FtNFM0bTY4Z2g1cWFkcVNDYURiL3NUUkJleUF1cldmRTQ3eUxxNFZE?=
 =?utf-8?B?ZlA2bGRFWlo3bXpWd1JzMWkxblRCSldSWWlsc2IyTlRZSzlKRE1FY1VzeVFx?=
 =?utf-8?B?VSsrVXdDdjlyOXA4dmZBZ2YvUEdYZFErM1lySjhFQVExMHEvZnVJSUtvV0p5?=
 =?utf-8?B?aDN2YXR2NFRlTlZCTUs0TXpncmh4ZnZCaGJuazlzbmJ3QzJYaWRMMjMwYTVK?=
 =?utf-8?B?T016enBEYWxrZjBDZVN5dUhqY2kvU08wMC9SYmJSc3M2QjNCK3gvOTVEWmdP?=
 =?utf-8?B?M1IxZjc3TnNaalN2TzNWODk5TXFEeitPeFRBTE5sWDhpaXJNNGZSeFUvbnp3?=
 =?utf-8?B?ODg0SlE3NDhUV0JLUlFzYXZ3ZVQwbzZQTnJYRUh1eU5ZcVJ6TmlHWG0zQVZU?=
 =?utf-8?B?ZTduVUFWVjRPY084MTlvUExRREpzK0NISDRBT2tlZndaMUpCNnlvM3lLNmlI?=
 =?utf-8?B?eG44aFM4YXN2MkM2Um5JekVBaUJ1cWtLdGdNTkYzSUVyN2RxTEZIUXFSUVU1?=
 =?utf-8?B?Q0QxZGUrYnQ1czR1WEZBM01NMUVaYmV3M2R2b0YxeUFiWmx2cDdoTTEyUjli?=
 =?utf-8?B?WlhhbDh0RkJPcUUyWStDd2kzNWdDcEwydjR4NDY0d05QZDd1cGFFSFlhNk5s?=
 =?utf-8?B?TGc3RnlkbVJsVWJhTVRvSTNtTXpvcDdmNG9NZktBY2lSZzdLWlNwN2ZVcjRB?=
 =?utf-8?B?cEZGQk15Qm4wcVVhejdhdDEzWGhTczhZa2R4R0M4UWhQM0RlcWkxT0JzZUEw?=
 =?utf-8?B?R0V3TFU5T0xwbExiODVqS21taXU3b2pKRWNLby9rTURJY0pxNVpiTlJQak9E?=
 =?utf-8?B?RGJwL1BQbWtHRzJqMDNMSlJLQ0pDdjJldmUrYUloc2Z3WElEMjhOOHZmME81?=
 =?utf-8?B?THdobGpCN2p3OWwwQldoWExFUHJhNmF0SHZoZk9lNVBhdDBleTREWDZTV3Vs?=
 =?utf-8?B?cjFBMnIySS8zTHh2UWowWG9LYS9oMjdlWGg4SFpuVHRrbUVxNEJ0eEpUWDAw?=
 =?utf-8?B?TXJ4RDJBUERLa21EUmwrV0d4dzZYc0ZlbDNNTjNRNEdyMkdONVFNTmhGUkg0?=
 =?utf-8?B?Y0lQYy82UDJJdEtvU1M0enJWQXE5RThJdXNQUzNFQXltQkNCNnY1TUdBMjNt?=
 =?utf-8?B?WTQ3OXBHZFNvK2VvbnZ2MHFENUtOZ0dRR2dFQzBvQlBKUWRiR21pc3gyM3dO?=
 =?utf-8?B?WjZoSEJ1UzJzdWVUTVhjckRxV3J1ZCtCak1Fd3k2d3ZZMXVMMFRhUWJKT1N2?=
 =?utf-8?B?Z2VQOG8vOG4zdUI5Q1JwUjNmc2RwKzhMU2xHTzhNTzBQTlZyeDlydHljeDRU?=
 =?utf-8?B?TVI3WHZNZzdmeXNCbGhzNXpxeDh4c2ZCYVFpSEVmVjVYZ0FWR09SdEwxYXZM?=
 =?utf-8?B?c0czamhBOGhoS3RjbE5hUlp6SjFGMGdoYVJtUmE2VWpFVVJKSzFGVDRsMitV?=
 =?utf-8?B?ZlU2R0lGdm1IRDdtMjcrenNlVVFYVXBCelhjemhTS0Nib0lxTy94WDdXRGtF?=
 =?utf-8?B?MjJOVnhCZ0dNOVpJbDE1MjZrMGxyTGtGUTdybkNpM2ExY2xXaUtENDgzanoy?=
 =?utf-8?B?SmdadXlQOXlxeFhDbEVVTHlVRnZkK2FHQW4zTjI5WE5CTGsvYlNQMXM4WS9t?=
 =?utf-8?B?QzFHWTZpSjVYNlZoWjIyei9ZbEtYZUYyVFdlc1lHbTNIWkQvbUhPSWhQNHly?=
 =?utf-8?B?ellocThoS0ZDTXZHRmtrMVYrYnNFOVJjS2R0UzJaQVBQWFp4a0MzWDBEOU5R?=
 =?utf-8?B?S2ZuWHR6blNOM0NBTHd2RFNKdmMvenQyY1MxQk4zelVPN0IxWFJ5dkExNnF0?=
 =?utf-8?B?Q2ZMbGhJRFpPVGJGZWwxdWNQNEZ3MmQ5c1FQeGZyaThwb1BGNmZITCs0QU9F?=
 =?utf-8?Q?8JVPiRRSeMZ8EXTekc0mOS826?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GKtpYLOREI7FqCImV2lCXCMDw69/T1hUKLrokvzRBY4J9qGwf12zODdbSomuNw5zi1mcLlIsVPck4Nd6guj19o5YiQ79aIR4e+PNGLx7i9Ucb+XHJCaF9JVO4/focP5+/0ItzUZWmgFIsi914B/cXjoggUElly6/GLJRVFLu4hfwaUcyXTOrPQfJcyqB8GmpZSO3eeUI1TveoSveYyXQvYphpDFY70A4jvTv8fb4k98uaDoW8y5NnaAAjS6O4YXHi+qm1DBBz0WPqQkl1px+sb+j0K3gbapGeNE4ii2IpJPgg1+1TFJhWLiY/B7FgZqNrw/pkLRQhyDoZZVLrCDQ0gHV9mJcEO4KNwXkttyToXKaVzksSHB40PWeh4ApdyqKFryhunox98emI+5UGA+kr3xNWNK2s7FzfqZFhM5EC3hX/QYP1JWJmdHNTebCv728BeFd1B+0fDoIJ5JuO1IhknCy2P3uIyRqkqgbT0UWIyLaI7vjzPRWchgG7z195e39fJ0cbIIyDahFJ06U2rrrSTztqaJtd7VZsiT6HYdlSv+4bDwV35X2KljKxTuDlwfLCNeLHrzZP+EIwCjyJMVLNJqwMnrhHvA5JTDnzWY27B0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199c7341-238f-4fd7-3674-08dde45d1ae6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:57:49.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEqMoEStUSMCRDOOEgHlvKP+T0YrdgVyVdHNOocgXPkNRHObwChbd8T9nQzJhRsVeyK8AhP0mPQsu/ZTFXoN+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF311374B40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508260041
X-Proofpoint-GUID: 33YTJzFq17XHJWfjjqCJAPOEvYTDu2aU
X-Proofpoint-ORIG-GUID: 33YTJzFq17XHJWfjjqCJAPOEvYTDu2aU
X-Authority-Analysis: v=2.4 cv=NrLRc9dJ c=1 sm=1 tr=0 ts=68ad3ed0 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=a72lYEwG9cSYg7sdjAoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNSBTYWx0ZWRfX+hU1mS8bUGd8
 km3AulF+DRbCLw7lpqFUvKD/nEev5prYRfvJtScMLTQQG+hZ/g0JX+Bg26rmJpBH0HCZdJ0D5p8
 b4XlroTzLMqK2nqWYMGgSa5WC39Zqz2t+vt9L2ZbXCHZ+aRbrm6MgKHbeVW2Wqm7LoAzmDm8vGk
 x+99XSM3C50ITjsEBaJh20FfwCJQQiXN2L8k8LOH3mXfTkv9ipVb/j9AYEBpwpOjkCrS7uAASqY
 bJ6NKMgMW+bRutDWqdv6EeTR2NsckKbGzc7go9wZE6vOMXxUGuCeUavnyPr7hyRzImgORE7p3Kf
 oLuLDgaEB96aiKRlJrrjkvOm735lnYqLL+i+w9yF7aiwtrWAlgIaIVmmrW87HsLeFjVubnevJ6M
 P3Sqppti

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

It tests fine.  Thanks.  Looking forward to the "state" fix!

On 8/25/25 13:16, Alan Maguire wrote:
> On older kernels - 5.4 to be precise - ip_queue_xmit() is a static
> function, so it is better to instrument __ip_queue_xmit() as it
> is extern so not prone to optimization on 5.4 and later kernels.
> With this change, the following previously-failing-on-UEK6U3 tcp tests
> pass (and continue to pass when tested on an upstream kernel):
>
> tst.ipv4localtcp.sh
> tst.ipv4remotetcp.sh
> tst.ipv6localtcp.sh
>
> More work is required to fix up the tcpstate tests for UEK6U3.
>
> Reported-by: Eugene Loh <eugene.loh@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>   libdtrace/dt_prov_tcp.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
> index ebdcfbc9..a191efe1 100644
> --- a/libdtrace/dt_prov_tcp.c
> +++ b/libdtrace/dt_prov_tcp.c
> @@ -37,7 +37,10 @@ static probe_dep_t	probes[] = {
>   	{ "connect-refused",
>   	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_reset:entry" },
>   	{ "connect-request",
> -	  DTRACE_PROBESPEC_NAME,	"fbt::ip_queue_xmit:entry" },
> +	/* ip_queue_xmit() is static for older kernels so use __ip_queue_xmit()
> +	 * which is non-static for older and newer kernels.
> +	 */
> +	  DTRACE_PROBESPEC_NAME,	"fbt::__ip_queue_xmit:entry" },
>   	/* ip6_xmit has > 6 args so cannot fentry on aarch64; use rawfbt */
>   	{ "connect-request",
>   	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_xmit:entry" },
> @@ -48,7 +51,7 @@ static probe_dep_t	probes[] = {
>   	{ "receive",
>   	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_v4_send_reset:entry" },
>   	{ "send",
> -	  DTRACE_PROBESPEC_NAME,	"fbt::ip_queue_xmit:entry" },
> +	  DTRACE_PROBESPEC_NAME,	"fbt::__ip_queue_xmit:entry" },
>   	/* ip_send_unicast_reply has 10 args so cannot fentry; use rawfbt */
>   	{ "send",
>   	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip_send_unicast_reply:entry" },
