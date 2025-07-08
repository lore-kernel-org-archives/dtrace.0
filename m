Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B7DF9E8
	for <dtrace@lists.linux.dev>; Tue,  8 Jul 2025 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995177; cv=fail; b=pLi7o7bjzMVpxuKQXJxpfGqX5nDs2h1rxoliiuPs32GPM70yJN1IVTA0PuX9lgbVubRi7M0d/921ognXFCdzvdTn1nnXFicpK5ZPpd9aM1c2VvdvMCmrqfepwEqHc5eTvrYIItVwD+LeEKTgqQV7BSd1pIo0M0JAypQHeT491MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995177; c=relaxed/simple;
	bh=Pe2o4yzLBcUd2Zmb2jB7f4dKuUdrUo/Xslos/8elEFE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HfVO3idc5E+cQimhhwHDjxK+crOwnMCE0qW+5IYhXp4goXjaCm9x7qIOcNrBr62LjgTQ5KG6JdAvTxJct8RPrgcuXnZdJQuXB8uh9rZv5p5YEAbtZMLN3rNQ0U6i2WRDzGsVsz9+F6ugjVuwQ4OZu2S9uO45Bpt8ovG55gmFh24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DsiSedfW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LAYcc672; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DsiSedfW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LAYcc672"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568Gavm1012318
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 17:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=H6bYBRlG+tUDdztGuuFSE5daQI6sneOzvWIYJsvQTLo=; b=
	DsiSedfWwdL8Y7JAmHDHVwR2qQoS2ZkFw/ocnN+PyRD0atVaadDr1u0zQdCJQJ8n
	5An6CanR387CgKi9hoV3V4FzePvSnSuSHRPahLQXAzjar9GIJSilL51B6LiYyQme
	WuxMT3w7wssTduMrBX6Ffqm2ab9cIxuf6pNiyJ/VyUCC2yfXJMu9oCnwwai4stWD
	gf0eaovceqiduDY40hG09WdnCJ1CBjliB+M3FRfJ6kmTnpBxciRsoIk5zYFYlqcp
	xF7Q6WyK6gBgCd0vXXDMuH1f+eNiR4yR4rZ3fd2mfVt7V39DulzL1q1UP906IX0Q
	8KII8D6GWhHlORl6ta6rxg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47s70j02n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 17:19:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 568GiBqE023610
	for <dtrace@lists.linux.dev>; Tue, 8 Jul 2025 17:19:33 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazon11013028.outbound.protection.outlook.com [52.101.44.28])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptga5fr5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 08 Jul 2025 17:19:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+XK9jVPk0Mi286gUgp2ugL6To9WN0Vh/TqEoDI3VNYpszadhGcLiWoLhIShcFuXwROPGLeC4ORoPhtrDa73ymMabqXfTfUbbeTeTnKBY7Nd7TSyAhtr75GVs5wmleURPZqyhb7mCLvyPq1ET+bNIDOsnh5ph1OJY9yu4FaPH/m/yPbdh3PrZDX5bfCp0+PChJ09UTJgUg2yXObLoIPez/LjvQoi0LFERc2/gmvc/8N7NOF4fneYBCzSqGfgvWaOOxXEKNBUQV9u/LRpy6pPlRgrzPXdFejmtaLW6RAJ75mRrAWOFbGrUgF8xVyhAKUTcHUojy573Pf2j1/ARc7J1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6bYBRlG+tUDdztGuuFSE5daQI6sneOzvWIYJsvQTLo=;
 b=SbAbrvDHb9vXlDicy7JyIuUKB5gdgIIgcVuLssoziGvjYz54/VmAaW5wsynzuiu+UUxTElfJKlx0IO1eKARuBO1D9rdJzSoiIJX8Ir8mLYqgjpSwqyyUteAoS9uDX13VfUwT2r6qBcrZfp/evSr6ICK0PQ4NKeZoAS3D6uNddIM9jzQRXB1YoFmP1dJkcrHpmb5ZHYcXftsOjKS4zHWW1h+BiKN0FHSnf9g7Bl7/QnKL89TYFapEpU3A/DvCCbUPJZN4xPt/om66Pn+8UFqX//byKTAeWT2beCHBPadHM9QdrcnsasrkBzQrJSQ0u+SNci7xjIWucIuO3u4dKjzP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6bYBRlG+tUDdztGuuFSE5daQI6sneOzvWIYJsvQTLo=;
 b=LAYcc672EdzNJN/iuA2JBVd1DiJOsmE448Q6i0sOmnTNT1QpQJhVT+643+Es2gRhQPcIW7Dc9ehq06iSP03A1NqFjVLg0+Xj35fOodvcJY/pdmW6a6euz3zMJaHgoB79ysnCR2cZPJRpFTh5MWy4fQl0kVvulp47Yzy4pWt3JfY=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 SA6PR10MB8205.namprd10.prod.outlook.com (2603:10b6:806:43e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Tue, 8 Jul 2025 17:19:30 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 17:19:30 +0000
Message-ID: <7acf8a29-0ccd-4efb-8b82-92b0bac6cebc@oracle.com>
Date: Tue, 8 Jul 2025 18:19:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
 <aGbT+p0DjRTFl7Oc@oracle.com>
 <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
 <aGbvQAmqsLA5+LaH@oracle.com> <aGcF67vQ8M942gh0@oracle.com>
 <21b12943-a166-41f4-8f30-8bb44e12317a@oracle.com>
 <aGv7kQqlPZt6Kmw6@oracle.com>
 <d74b40a6-0834-4edb-8cf9-dac28500a7cb@oracle.com>
 <aGwmKfOPU+NZ+ekf@oracle.com>
 <a2c14fbc-ac46-4e0b-804e-fb6e6c3e0751@oracle.com>
 <aGx1n+VfTcUaHIq6@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aGx1n+VfTcUaHIq6@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::15) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|SA6PR10MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a79dec-ee4d-42b0-f674-08ddbe439990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ampQVGxkOFlVbmpZemhmZW51NVRVTDlVbzAyUWJqT1dTODBRUXNmQUcyOFFY?=
 =?utf-8?B?NDdzWjdtTnl3cmUrbGxSSTFVQzJ6ZE53ZnMyWG5nc0JOcFZmOXl0bSthZHpi?=
 =?utf-8?B?WitjYVJiaHFMYUlPWlJZZ1FDNXdkU2g0d0RPVXpyYXEvNlFaODd1VmtjZzg4?=
 =?utf-8?B?RWQ0cmp0WllNdmtmd2grRXVQL3BWYjhPdENkWkI0NHpzVmZoRmlZaDM0UTd0?=
 =?utf-8?B?azlsaURCbUE3YXZJVWlOMmRGb3ZjOWlRMTAwNWw4Z3AweER0UzVGcVNqdjVo?=
 =?utf-8?B?Z2tTZjZiWVJtTExEU3ZIdlRBMmZJQVZ2dWRpWllOOVZ5Z2xZakhzdlNmY0c5?=
 =?utf-8?B?d0t5ZUZNekdwRDFoaFcxcmorZzdKR2pLNTNSMG9URXpTSkxYSW9uRWZUMkl6?=
 =?utf-8?B?SFJ2b1JqOTlsRjF4SGpxRnI3MVRleXM4eUsrODNrLzhvVHEwdWNKVUNta3lK?=
 =?utf-8?B?Y3k0Zlk4ZEg4SGFSYzBQT053QUtxeE1zQnMyckhtbDBYV2tSOFpsMGJyOHAw?=
 =?utf-8?B?SEFmYlhpeFdvWnpGTG1uWUFuQjFNSzZFWkl5bTJ4UEEvaXBsK2lnWnlpOUVl?=
 =?utf-8?B?RURRaVJvRnJvY05LYUFOVS93VGQ3MWd3TWFiSTZDZWh5RzZaK096dDUwbEhF?=
 =?utf-8?B?V0dWVkxXcGN6U0lQQk1XQ21wdDh2RWNIZXlTTnY5K3psN3MyQzUzdzhITTdS?=
 =?utf-8?B?cjBJRkwvT0tlQ0FyUlZPSk9NV3IxeWdUR1IvQTBVZ0d2UjcwVVVNbndWbFAv?=
 =?utf-8?B?N05abDZxcjd2SUQ4UzJjOVlRSzRSakFLMC9BTTVmMStSZ1N2dUlQcjRJcWdh?=
 =?utf-8?B?OTJsNjhBNlZ3TGpuWUdodTBpNjExYlNxRUdMZTR6OC9sbkdxb1E3dmdqUVR2?=
 =?utf-8?B?RDBPaG9lVTcrSXBnZ2dqRkhOS1p2bHlWcG5mMFhmZjhaTXBvV2FHUml2M1N3?=
 =?utf-8?B?TGJMRkhoV0NGRjlCeFhaQm51UUk2eWtiODJtQ0ZUajdydWw0bk9DVUkwVHZj?=
 =?utf-8?B?MUkwTDJYRUlXSFFBSEp4dEFoTG5aZkZHQzRvekR3VVZOaEU4N1dSaHNwYzBZ?=
 =?utf-8?B?QVhiVlZldEtVNWZSYjB2UC9JY1dFam1KWit0T1hSc1hBbnRrZlpRaWYyQWxG?=
 =?utf-8?B?R1Vsd2RmSThFUzM1WkJEWnBDUFdFbHhXcHdUclF5RUpHSTdpd0tkY1NES0U0?=
 =?utf-8?B?dmYzcWdjeXlXRDlEOGZZY3pkdXlqKzV2SlRBdDh4ZWl6a2dwVmpBRkZrL1NQ?=
 =?utf-8?B?aC9NNm5mb2VUdkVtNFpTLzZxZk1wZHFoUkdHZVY4LzBWSEVqSCtTTFVtV0E0?=
 =?utf-8?B?Y3ZubXp6aEhpT1VkYjFGOTdiRVk0bk9MUVBBck9RdXB1enFNSnQ4dTBCbzR6?=
 =?utf-8?B?akdWNm5rVmRQNTJiVmYveEpuZC9JazhXNndMb3NpQTczeGRKWHdHYTNFd3lH?=
 =?utf-8?B?YzFWb3M3WWJPdXNuOFRYVjNxaG9LMEJQbWxkLzd4UVhwNzFpVVI2amJBYWxo?=
 =?utf-8?B?dEhXVFloc21KQWo2UTFuNXlyU2JudFpoYktieXh0MzdKQUo5bFZXSWJqVTdI?=
 =?utf-8?B?WkdKNnpzV0pQd0hzOTBRUWwzL3Q2M1pNeTVlaGtvSlQ0UE1zd1l4NmVtRjJ6?=
 =?utf-8?B?Z0F4NG9uVURuZFc5aDNwQkwwQm4wQzNrS3FsYlNlTzBBS1FFa2ZkaktCZnp4?=
 =?utf-8?B?WHhnTEVpL2lSNFdnQ2d4dDVDTHl6Z3BiaGdwOGlzQ295V0ZmczZBbGRRSGdG?=
 =?utf-8?B?ZGZuWWpsQmhxNGJYN3FGaU9LZTBCQ2g5QytHRGVIQXp4dy9ZYlhsalIwLzFE?=
 =?utf-8?B?ZzEzNzdFSm5jbm1YS1gySVpLeVJ0VFNYdW0wZ25ISDQwSUcwVStBbzcrYUg4?=
 =?utf-8?B?M1dFL3l1QTQrRXFWVFRZaFZ3L01McFdjOEZ3TzNpT3FEN1l5Tk82cUZ0NElE?=
 =?utf-8?Q?vZJlHZ1zm9E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eERDakpYOFFQN2JOQW5xRC8veVc4ZzRaZUgzdGFRWjVVYUhWZ2ZMLzRBeXdZ?=
 =?utf-8?B?R2RmVFNlbFpXdTdWWUNPa1ZiS05XR0w0U2dncWlkU3NQekc4bGdiMlBMRnRQ?=
 =?utf-8?B?M0lNWnUvMjc2MDhIbDBGdE96QXREUUIydmdWVmx2cEJLRjY0WkVkSWJvZE40?=
 =?utf-8?B?Rlp1VjdhVEZoN09jaHJaTkI0ZFd6Q2E5QUhndWZnaE03QUVodXdXTTZhK0la?=
 =?utf-8?B?dGdLTDRHWFgxUUZMNkNTN2ZJV2dIT0o4bXdRTjBYQTZIUWFoeGpJQ2xuWDFo?=
 =?utf-8?B?REJRVFZraklsMEh1NVBVTm1ubFNPU3hJY1ZDUDdEVTJiRW1pVUErdDNXWTh3?=
 =?utf-8?B?ZVV3Tyt2d2FFRGZFZWxHcDJGRmdka0FsN08ra0l1TlBSeVU1enJWTmphK0N3?=
 =?utf-8?B?bldiK3JPSXlXN2JGZ1NxUHVpSzYwZXc4ZEdJditkcFV4Rnp5RVlXZzAzcjZV?=
 =?utf-8?B?cFBwbWMyLzk0dnhic3dESTVzWDBaNW1yR0RpY3pxVUV2aXJXYzFBSUtHdEg1?=
 =?utf-8?B?UnFjS1BzN0Zic2U0aVk4YUMvSGFrUXRzUEtMb1Z3bFVML1dSbVJWb25YWFIx?=
 =?utf-8?B?MFFDNVNGVlR0MG83alYydmxPQTZWWG9PTVRpOEcwTHdSdGFTTmVxNXFLRy9N?=
 =?utf-8?B?UFFDdkNkL3M4NHR6aExOemZTdUhRWE4xdWlFNzRYRzJxWkFPbHcwbHB2YS85?=
 =?utf-8?B?S3RKbmRDRzVRa2t0ZUxqZVd1bktWTzY2RUJTWlcrdUtSNGNrTDFQZVBmTVF6?=
 =?utf-8?B?SlQ2Yk1MK2pJS2FwdHVva2Z0RkczWkZtOENPTXRid1Q3TUlpcmZ3TUNtMWRt?=
 =?utf-8?B?S2ZOdXRydTV2cTBqQ1RjajJHTHowUHc3dSsrWVh3aE9GSWVvUHA2MEhLUm8x?=
 =?utf-8?B?RU5vaW9kSGZjTkF3TGIxeGlzS3hnWGFFeFlwb2drUzRyYTZSVW5xRlNhM0pa?=
 =?utf-8?B?RGpOVDFUNkNUa2pvR2laTWtIdmVGSGhaZnkvUFdFWFU1Nnl1RFFoalBxcmlT?=
 =?utf-8?B?ZzVMMCtUaEdEZ0pFUzBnRjNTVUlWaVFnbVdjb055SzgyTStjZmJuOXZ3NVVa?=
 =?utf-8?B?b1JMbXo1MUVlVldyK0NhbHBaQUhuUUpWTzRKaGF1TGZGaHk5enE3TkJzVThP?=
 =?utf-8?B?bGF6WGw5SGcyYUJvY1VObGY0dzU2VU1LNXhQb0pTTCt4M3Z2cGpJc014aDJo?=
 =?utf-8?B?ZlFGZ0tuSWt2SFk2SjVMRmYxd2ZZVmp0WUdqbU1CVW1vdnltYkRKVjZLM2dT?=
 =?utf-8?B?UnBiaTR3QXV2RHhRVktGRE5IczUxZkxQOW5iZ01ENEhxcHlFSDJWanpSU0pu?=
 =?utf-8?B?U0JISmJiT2ZpWjh0TjREQzd0bDhJY2hsQk9aLy9YcjhYa0VIMnlhcnBzeG5D?=
 =?utf-8?B?d0wrRjNLenliWUlGTHBZdXZnOXZ5eUZrUWc0dDd6VS9qSGRjV1N5dkFkbEpY?=
 =?utf-8?B?cXgzYXVYbUFUVXN2NmhQcDdEd0s4ZGFQNUlqODB1L0xyL3FPQnpTcjJvTmVZ?=
 =?utf-8?B?dWZST1RLSWVTM0IxaHFIWGxWUHpFNzA5RG12ci8zV1h2bGE1YitBaEt4aHNw?=
 =?utf-8?B?SjFVQ2llV2RVZHM5b3dPMXBWb1RWWTBJVTg1eEptL01OWDc2dFZEVktKUlRJ?=
 =?utf-8?B?OEJmNnVRWHd4cGFQQkJISEdyYkZiOGRjNGdJQlIvaW5Qdk1zek9jMGhkeXdX?=
 =?utf-8?B?eGNIaTdnMFMrOXpuR3k0RHVhVG1PR1U0OHM5elhxQ1k1ZW1odFRrV0wyZk4y?=
 =?utf-8?B?NTZPMW5veDFZU25sWlBkelF4YU5yMmM2c09ONlVMdnJQVTg0eXljWlVPQmw3?=
 =?utf-8?B?NHpwaDM2Q21nbFp5eXVNcjlib3BDRVVid0Y2QjRBOWJtWlRXN1BWTFFuejVh?=
 =?utf-8?B?OTd2eHlrSVhVTFhjTHYwclY2NjV5VnA1TTZlbzBua2FDOGhqa1BoOGtxYzht?=
 =?utf-8?B?RGo4OGlDYmUxaVRsZERXK2pQM25wcElKSGRkRDFjdXhBZHpLL0dXVFM2OEtP?=
 =?utf-8?B?Y3JxcCt4UUhRdjJxQ0dIYk9DTTNGTUlHUTVJWmp4R0VPSkYxYnhJMlliM1Uz?=
 =?utf-8?B?dWx2R3RWMmFvQ0Q5ZkNCMGlBYTVvRk84ZktsQnl6dWxkUFJWeTJsN0Y4bVFB?=
 =?utf-8?B?aEZNNVIvZVVhMTQ3cHU0U3hJSlI3QTN1bHFiSWtqcDZldnFNZlJWTUdCOWx3?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zGHwWZX9Is2tw6MguGeHv/ckom1IKqd0gj5PuOrEFQPOdPNkK3c/K6qu1eZnqOoxsu7u48VzAskCMN0yqqcYXezm5uBplten8+3bDhUV9as3f32Kn4aE0KQelNjW3gHqUIJruaz9vBCWZ2SRr/q1dPqNdZdQXRQl4b+lhhnLuqt2v5EWDXDIQcX2cGGQkza7GjWNIoBGf/1pE2I58AHgn7iHq3/ORcQ/az8pcjDmAda9Us5Uc9D84NsYuna3ZkulHob6zpKYbh6YP/DwuANDhLUJH7puHfOhDBkC3VEaibTWv+gxW7GHewKCzsVDD1ZWqeKjH7VpBxjq2NcVZp1XneU2IEe0grVVGmbxpsxZgSh7Sp57gg3dZ71/bVQ21JJGmJJp64gQhsyUbgjxJHkrgINBLQcypLXY9HAH6qntg+jcLVGCGGfx+oSl/UbhwMxw5gJzeyg65tav0qMOnQreyjxz8zeeOov90/ShcrD4U2tKaXt74UO88tTXMhMvrP/hPbjMbanIo0nkK9TEAOhbdfrDEQhjaseZhwq4jArMxP7XxFN3oOCcfjM5lrFfoan0RmYg09mOMt6pcPf+ZiRJ16fdsu6ECP0yDRER8EenaW8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a79dec-ee4d-42b0-f674-08ddbe439990
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 17:19:30.6679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Km60V+Y6PuanBbfeipcmTw73j2cp0HhFhsjcMxTAOYRphiE9ORyInEbeHhcCgWI8TEVk+Hilbxl5j75QuSvqUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8205
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507080146
X-Authority-Analysis: v=2.4 cv=Io8ecK/g c=1 sm=1 tr=0 ts=686d5326 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=vSEr__PmIMLMgjjHVkgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Z6x_3u3_BFmmoSNezVB2tEhDNY1-RyVq
X-Proofpoint-ORIG-GUID: Z6x_3u3_BFmmoSNezVB2tEhDNY1-RyVq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0NSBTYWx0ZWRfXy1tnG2NPMMHW T9bChW/mCkMgZNuzEjrkuljldeaq3dkJgrL73fLUAcPqCWF6bNS2tPZWLhbM/nkpaZdER1FRpt7 7ntwG3kEayqbwsVbsQ8ik6pbv3dvc50vYYOx18YProJWMw9+YZ72ReEomF5ypzv6E9BTqfhLQmh
 TBJMdRcHidhmwfXwd4er+TSk0nSfxIKYgXNuik10XyFksYN4Wl+0XmqQmPX+D5BVA2liZkQMb6f irnaRJYLtIV0Tii3k5Y+EDAdEAknFU6f4WQv9bom49DWd5oexU0J+1FEXJ67rg5Ff66yTqGE9da qI/3U6phuoCm6kzyGZDzzf5tVRV3eIMO+1RCleQhsTWU6+aFDUuCTNPqVxtSV/evGszK/uEnfcO
 jIxNUXvxfHC6ILiI6kRQ+tELJZa2FHNgMl5ifk5bZ6ItB4+NwDfnxndtGiRXVrEobcpcc+3X

On 08/07/2025 02:34, Kris Van Hees wrote:
> On Mon, Jul 07, 2025 at 10:51:10PM +0100, Alan Maguire wrote:
>> On 07/07/2025 20:55, Kris Van Hees wrote:
>>> On Mon, Jul 07, 2025 at 07:14:35PM +0100, Alan Maguire wrote:
>>>> On 07/07/2025 17:53, Kris Van Hees wrote:
>>>>> On Mon, Jul 07, 2025 at 05:32:19PM +0100, Alan Maguire wrote:
>>>>>> On 03/07/2025 23:36, Kris Van Hees wrote:
>>>>>>> On Thu, Jul 03, 2025 at 04:59:44PM -0400, Kris Van Hees wrote:
>>>>>>>> On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
>>>>>>>>> On 03/07/2025 20:03, Kris Van Hees wrote:
>>>>>>>>>> On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
>>>>>>>>>>> On 03/07/2025 19:26, Kris Van Hees wrote:
>>>>>>>>>>>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
>>>>>>>>>>>>> On 03/07/2025 18:06, Eugene Loh wrote:
>>>>>>>>>>>>>> On 7/3/25 12:59, Alan Maguire wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
>>>>>>>>>>>>>>>> patch 3/4 feedback).
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
>>>>>>>>>>>>>>> send probes?
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>     dtrace: failed to compile script /dev/stdin:
>>>>>>>>>>>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
>>>>>>>>>>>>>> inet_ntoa arg#1 (ipaddr_t *):
>>>>>>>>>>>>>>     Unknown type name
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
>>>>>>>>>>>>> need to add it to the core set of typedefs and add a type for a pointer
>>>>>>>>>>>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
>>>>>>>>>>>>
>>>>>>>>>>>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
>>>>>>>>>>>> this I believe?
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Unfortunately the #pragma include doesn't do enough; it just defines a
>>>>>>>>>>> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
>>>>>>>>>>> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
>>>>>>>>>>> typedef to net.d and doing the pointer lookup/addition but that doesn't
>>>>>>>>>>> work either. Seems we need the core typedef + pointer addition or we hit
>>>>>>>>>>> this failure.
>>>>>>>>>>
>>>>>>>>>> Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
>>>>>>>>>> you should be set.  That is what I did in my priliminary tcp provider impl.
>>>>>>>>>> I do believe that works.  Either way, we use inet_ntoa() in the ip.d
>>>>>>>>>> translators and that works with that typedef in the file, so this really ought
>>>>>>>>>> to work.
>>>>>>>>
>>>>>>>>> Yep, I tried that in the v2 patch series; Eugene hit the undefined error
>>>>>>>>> in one test and I now hit it consistently for all tcp/ip tests
>>>>>>>>> unfortunately with "typedef __be32 ipaddr_t;" in net.d.
>>>>>>>>>
>>>>>>>>> My assumption (probably wrong) is that the include of the library does
>>>>>>>>> happen but nothing triggers the pointer type generation for "ipaddr *"
>>>>>>>>> in the CTF dict. If there was a way to force that type generation at the
>>>>>>>>> .d file level that would be great, not sure I see a way currently tho.
>>>>>>>>
>>>>>>>> Well, like I said, it does work for ip.d so I don't see why this would be
>>>>>>>> any different.  I'll have a look and see if I can figure something out.
>>>>>>>
>>>>>>> Looking into this more, I think the problem is simply that you did not sync
>>>>>>> all the dlibs for the various kernel versions with the updated ip.d, net.d, and
>>>>>>> tcp.d files.  So, if the kernel on the OL8 instance you test on does not have
>>>>>>> your change, it will fail.
>>>>>>>
>>>>>>
>>>>>> No, don't think that's it; the .d files that matched the kernel I tested
>>>>>> on (6.10) were synced; the use of the 6.10 .d files was visible in the
>>>>>> error message. The problem appears to be around the fact that tcp.d uses
>>>>>> the ipaddr_t * in inet_ntoa(), but unlike ip.d (which uses ipaddr_t in
>>>>>> translated types) it does not have any other mention of ipaddr_t.
>>>>>> Adding an explicit cast in tcp.d to the argument to inet_ntoa() to
>>>>>> ipaddr_t * resolves the issue without having to add ipaddr_t to the core
>>>>>> type list.
>>>>>
>>>>> Can you reproduce this at will?  Can you give me specifics on OL version,
>>>>> kernel version, etc?  I'd like to be able to reproduce what you see, because
>>>>> so far, all I tried actually works once the ipaddr_t typedef is in net.d.
>>>>>
>>>>
>>>> Yep, it's 100% reproducible for me on an upstream (bpf-next 6.15) kernel
>>>> + OL9. Moving ipaddr_t to net.d works for ip.d but not tcp.d in that
>>>> environment. The extra casts for the inet_ntoa() parameters that I
>>>> mention above are needed in tcp.d to get things to work properly for me.
>>>>
>>>> I pushed a branch to
>>>>
>>>> https://github.com/alan-maguire/dtrace-utils/tree/remote-tcp-v3-wip-broken
>>>>
>>>> that illustrates the failure.
>>>>
>>>> Relative to devel, it consists of 6 commits
>>>>
>>>> 1: the v2 of the remote IP address change (ensuring the remote address
>>>> tests won't fail);
>>>> 2-4: a few prep patches for the tcp provider; and
>>>> 5: the tcp provider patch (in a v3 work-in-progress form); and finally
>>>> 6: the top-level commit then removes the casts I added to tcp.d in the
>>>> previous "tcp: new provider" commit. With that change in place on my
>>>> system, the previously-passing IP tests start failing.
>>>>
>>>> If I "git reset --hard HEAD~1" on that branch (reestablishing those
>>>> ipaddr_t * casts) and rebuild, the failures go away for me.
>>>
>>> I tested your tree on Debian with the 6.15 kernel, and this is the result:
>>>
>>> $ uname -a
>>> Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
>>> $ cat test/log/current/runtest.sum 
>>> dtrace: Oracle D 2.0
>>> This is DTrace 2.0.1
>>> dtrace(1) version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
>>> libdtrace version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
>>> Linux kvh-deb-bpf3 6.15.0 #1 SMP PREEMPT_DYNAMIC Mon Jul  7 15:19:59 EDT 2025 x86_64 GNU/Linux
>>> testsuite version-control ID: cf3219c3069ac51c6f03f7a6dcb50958213466fc
>>>
>>> test/unittest/tcp/tst.ipv4localtcp.sh: PASS.
>>> test/unittest/tcp/tst.ipv4localtcpstate.sh: PASS.
>>> test/unittest/tcp/tst.ipv4remotetcp.sh: PASS.
>>> test/unittest/tcp/tst.ipv4remotetcpstate.sh: PASS.
>>> test/unittest/tcp/tst.ipv6localtcp.sh: PASS.
>>> test/unittest/tcp/tst.ipv6localtcpstate.sh: PASS.
>>> 6 cases (6 PASS, 0 FAIL, 0 XPASS, 0 XFAIL, 0 SKIP)
>>>
>>> I will try to get 6.15 on an OL9 instance and try there, but either way, I
>>> have a feeling there is a binutils (libctf) discrepancy somewhere?  What
>>
>> could be; see below..
>>
>>> version of binutils is installed on your system (nm -V)?
>>
>> $ nm -V
>> GNU nm version 2.35.2-42.0.1.el9
>> Copyright (C) 2020 Free Software Foundation, Inc.
>> This program is free software; you may redistribute it under the terms of
>> the GNU General Public License version 3 or (at your option) any later
>> version.
>> This program has absolutely no warranty.
>>
>> Let me know if you need any more info. Thanks!
>>
>> Alan
> 
> 
> Tried it on OL9 with 6.15.4 kernel, and aside from some probes not firing,
> the tests work.
> 
> $ nm -V
> GNU nm version 2.35.2-63.0.1.el9
> Copyright (C) 2020 Free Software Foundation, Inc.
> This program is free software; you may redistribute it under the terms of
> the GNU General Public License version 3 or (at your option) any later version.
> This program has absolutely no warranty.
> 
> So I think you need to yum update your system?

I think I may have found another clue to why it's happening. I tried on
a gcc-toolset-14 -built system, with

$ nm -V
GNU nm version 2.41-3.el9
Copyright (C) 2023 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) any later
version.
This program has absolutely no warranty.


Now I can run the following fine:

# build/dtrace -n 'ip:::send /args[4]->ipv4_protocol == IPPROTO_TCP/ {
@c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count(); } END {
printa(@c); }'
dtrace: description 'ip:::send ' matched 2 probes

However, if I add a syslibdir path - as the tests do when they execute -
I see

$ build/dtrace -xsyslibdir=$(pwd)/build/dlibs -n 'ip:::send
/args[4]->ipv4_protocol == IPPROTO_TCP/ { @c[args[2]->ip_saddr,
args[4]->ipv4_protocol] = count(); } END { printa(@c); }'
dtrace: invalid probe specifier ip:::send /args[4]->ipv4_protocol ==
IPPROTO_TCP/ { @c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count();
} END { printa(@c); }:
"/home/opc/src/dtrace-utils/build/dlibs/6.10/tcp.d", line 183: failed to
resolve type of inet_ntoa arg#1 (ipaddr_t *): Unknown type name

using -xdebug I see a lot less types added in the error case; i.e. only
the following are added when processing .d files:

libdtrace DEBUG 1751994411: typedef conninfo_t added as id 2147483678
libdtrace DEBUG 1751994411: typedef netstackid_t added as id 2147483679
libdtrace DEBUG 1751994411: typedef ipaddr_t added as id 2147483683
libdtrace DEBUG 1751994411: typedef in6_addr_t added as id 2147483695
libdtrace DEBUG 1751994411: typedef pktinfo_t added as id 2147483697
libdtrace DEBUG 1751994411: typedef csinfo_t added as id 2147483699
libdtrace DEBUG 1751994411: typedef tcpinfo_t added as id 2147483701
libdtrace DEBUG 1751994411: typedef tcpsinfo_t added as id 2147483703
libdtrace DEBUG 1751994411: typedef tcplsinfo_t added as id 2147483705


versus the good case:

libdtrace DEBUG 1751994399: typedef processorid_t added as id 2147483677
libdtrace DEBUG 1751994399: typedef psetid_t added as id 2147483678
libdtrace DEBUG 1751994399: typedef chipid_t added as id 2147483679
libdtrace DEBUG 1751994399: typedef lgrp_id_t added as id 2147483680
libdtrace DEBUG 1751994399: typedef cpuinfo_t added as id 2147483682
libdtrace DEBUG 1751994399: typedef cpuinfo_t_p added as id 2147483684
libdtrace DEBUG 1751994399: typedef time_t added as id 2147483688
libdtrace DEBUG 1751994399: typedef timestruc_t added as id 2147483690
libdtrace DEBUG 1751994399: typedef lwpsinfo_t added as id 2147483695
libdtrace DEBUG 1751994399: typedef taskid_t added as id 2147483696
libdtrace DEBUG 1751994399: typedef dprojid_t added as id 2147483697
libdtrace DEBUG 1751994399: typedef poolid_t added as id 2147483698
libdtrace DEBUG 1751994399: typedef zoneid_t added as id 2147483699
libdtrace DEBUG 1751994399: typedef psinfo_t added as id 2147490324
libdtrace DEBUG 1751994399: typedef conninfo_t added as id 2147490329
libdtrace DEBUG 1751994399: typedef netstackid_t added as id 2147490330
libdtrace DEBUG 1751994399: typedef ipaddr_t added as id 2147490331
libdtrace DEBUG 1751994399: typedef in6_addr_t added as id 2147490332
libdtrace DEBUG 1751994399: typedef pktinfo_t added as id 2147490334
libdtrace DEBUG 1751994399: typedef csinfo_t added as id 2147490336
libdtrace DEBUG 1751994399: skipping library
/usr/lib64/dtrace/6.10/udp.d: "/usr/lib64/dtrace/6.10/udp.d", line 10:
program requires provider udp
libdtrace DEBUG 1751994399: typedef tcpinfo_t added as id 2147490338
libdtrace DEBUG 1751994399: typedef tcpsinfo_t added as id 2147490340
libdtrace DEBUG 1751994399: typedef tcplsinfo_t added as id 2147490342
libdtrace DEBUG 1751994399: typedef ipinfo_t added as id 2147490350
libdtrace DEBUG 1751994399: typedef ifinfo_t added as id 2147490352
libdtrace DEBUG 1751994399: typedef ipv4info_t added as id 2147490361
libdtrace DEBUG 1751994399: typedef ipv6info_t added as id 2147490369
libdtrace DEBUG 1751994399: typedef void_ip_t added as id 2147490370
libdtrace DEBUG 1751994399: typedef __dtrace_tcp_void_ip_t added as id
2147490371
libdtrace DEBUG 1751994399: typedef caddr_t added as id 2147490380
libdtrace DEBUG 1751994399: typedef bufinfo_t added as id 2147490382
libdtrace DEBUG 1751994399: typedef devinfo_t added as id 2147490385

So it looks like sched.d wasn't processed for example, but weirdly in
the failing case net.d (containing the typedef ipaddr_t) and tcp.d were.

The actual error comes later though, after processing kernel/module BTF:

dtrace: invalid probe specifier ip:::send /args[4]->ipv4_protocol ==
IPPROTO_TCP/ { @c[args[2]->ip_saddr, args[4]->ipv4_protocol] = count();
} END { printa(@c); }:
"/home/opc/src/dtrace-utils/build/dlibs/6.10/tcp.d", line 183: failed to
resolve type of inet_ntoa arg#1 (ipaddr_t *): Unknown type name

And so I checked for differences in the build/dlibs files versus what is
installed, and found none. Maybe the above might help reproduce this at
least. Thanks!

Alan
