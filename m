Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F7517D6
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 16:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768581169; cv=fail; b=SQ1KFcTFsCEjYOj1IkIsWjCosf/nIj9ooA0ut1PmheAjWPNELXV+4v3gWUDGScNq0soMTlV2bFoflDmYO0HOQfStIesPj/w1svFXk5N9DR+LllHP5TPzLkD7YSeBvJZhT9A/WHjs/CeLBSfFWdmTrtfFpPdQVssfDuRwH7jX4k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768581169; c=relaxed/simple;
	bh=to5phw9uwRejQou98KAL0J+7s3MMCEvm4UHJQWyqsJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GgVL48uzNCGckANEoj2oMKfjYRl0++uXTMx4eNbPQqJ5LnIB/8DwqceEqg8S45fkfWcdqQHhuuPKAkCIh+oQ4f/0bvCIdTbYEZruhhpnqQAwlECs88Tv0rM60wprlN5LODI6mgftxULCqc4mPtlGJQ2F96yj3NO3vq9NvF0JVF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oRK5QKTb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qOoPORqN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oRK5QKTb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qOoPORqN"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GE62sN1431774
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 16:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qdeB4AwTDVqTy3P+Mw
	WgJ9DHl0FvQhR0+csiwWC0bos=; b=oRK5QKTbfXFkpOn3w1HrU9NgRaWiMcdgPD
	AO4POEL+W/DX6GMN9rtfvl/klXu5Y9GMFueePWXyACgbiR9/E6UKXTuU/jARVKOM
	c/ExlI4qSuxNyA7VtrhcCd3KlNNeO+oPzyTQpXjPM8JsSDIzTFfVtV/4JlqpNWDQ
	7Jjl5h4wywAlk709ZE2vzEnDsD3MS+cS7RHf4HPe9ceXCfqLp/C9wTECFEltrl2a
	tWzOCW4q+GnwOXHH28fVZbAr/t7Of0UfqdC5OFshVJ7iHLhEf4C2yZuUKyGWyEQ6
	O2kDBO2thWyhrDIN+g+VPFBw0FIjJCpV0XckylOBpXJP0JZ8Usyg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkqq5a7cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 16:32:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GGB4JL040474
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 16:32:46 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010070.outbound.protection.outlook.com [52.101.85.70])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7gvsvt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 16:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvngUwv1+o9dXttWqr3oBxayxPCnbq5DCwol61xvre3AQ/T5CaHHonHfsoxD6pYCflHFfGSxqmPp/Q+KeUjaJNziJDeAayem359C4ipghYG+Z+77FxO9ZWBJLCBkBRrxXtTrfJ7qWF2296piYuUtV/cBTpRF9oP0vaI0e5KZfW5NWiFTR3ouBioMZ28AEh7pehTdroWye7MENOVfaw6BrBN5HbnPM989GsheMgSrcBHqePg5B9RZSbQ/iYGxjXg7oZAaC6hqBFYTzbmNQTQmyMlO8NO8AxF2sRVc+Apc+kqkYFu71T14x9p3SRCflp8bpetm6egt4I/YxDNKa/uAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdeB4AwTDVqTy3P+MwWgJ9DHl0FvQhR0+csiwWC0bos=;
 b=nWoOMA1CCUPcK+Ukt2gQEpFjwg4eSlsTR/fbdki8kgEpvaYzQXLwdRD13YpjGNnyRYHOjRrxbaxJZavBkvjs8kgXYkZM1stKb98AuiYbn8u85ACp0qV3nhKPW78V0QC8lS6Gp5UmfqPN9gzVkiQYzCH2fBt5jxbgUhM2iRVOQ+T7PF5n1D27xJhH24dE8fZuheLK6nDh57EXDvLclL2Qs27Tv+9H+ubfNsqrnvqRYGOiR9NGiQqT17RvOW9+IB+tHar3Z3Q5yQ7dMS45Lr/HXiRRQd1nd1iRnTeYQ/hQHZLHFh3e4QJimDSEbpYtNSx1FDD1FvTNxnxsLMtKXiuF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdeB4AwTDVqTy3P+MwWgJ9DHl0FvQhR0+csiwWC0bos=;
 b=qOoPORqNPD9y4UH7Tsvf+WvpuQfcJZH9Ys44csMCwJf47UyNBfGlUm4nKOJM7iwaxMJ1SDDj5fKoeedFB5lxcjxNfzqmx1SzPMk8yD7hYFxUOQ7Ftnr7a0l6wv4+vCrrQ1t4x9F07YNA1Ql68pZZF88GVN+kfwBHTEmH9HXL44k=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ0PR10MB5565.namprd10.prod.outlook.com (2603:10b6:a03:3d2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 16:32:43 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 16:32:43 +0000
Date: Fri, 16 Jan 2026 11:32:39 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Remove args[3] from sdt:task::task_rename probe
Message-ID: <aWpoJ28y-j2FTdEn@kvh-deb-bpf.us.oracle.com>
References: <20251221203711.11353-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251221203711.11353-1-eugene.loh@oracle.com>
X-ClientProxiedBy: MN0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:208:52f::22) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ0PR10MB5565:EE_
X-MS-Office365-Filtering-Correlation-Id: cb19b3e2-801b-47fa-3a51-08de551cdf65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8TlCTjpkP2rAu6NPHEkpOuKtZIjlxN/vLTCQPehxSz6mzUyQHhzjXs1OzYL+?=
 =?us-ascii?Q?lHQ9rXe/boIsyRbcBhPrSy528ViUa7cgEuKVmM/2IXnNryETXF5LuHxGno7r?=
 =?us-ascii?Q?GB4ypCL15C2csbB2SwchSWu32yQyjcSOAZA7vW3TwP+3TDbl0HejBpE03uGl?=
 =?us-ascii?Q?XrD5dPWdHRAFIOI2fcYBMKY7FyQPZYvVglsmlTAtugCHhtP+i+lWkpdQ0HZh?=
 =?us-ascii?Q?hVkhzenF99waabzPF7p3DTu7pn7yoRXnP8wT2AA2SO7MZzmj7V0LVsJsA55Z?=
 =?us-ascii?Q?Wz37l8SCdutyL0iRLcFJIQvTDIs3HmkBAhb4N3xJiNmsxq6xck5n5JqX7G15?=
 =?us-ascii?Q?c/ZpcccEraiDfzgjjGFJ0AcsYqJ74A5otGPl6slMMeQI5uLHtPz5wUISLR+b?=
 =?us-ascii?Q?mhu+rk2Qw1wdwhYrLKIK7lyTO45HmVm/lzQ5YkAVeAbj/A5klRq5R2n0oPwP?=
 =?us-ascii?Q?W9D9lvzmw4Q+QHR46cNEV4vS/ubzC9HJsgfRd4D7qFeILLalPiGYcM8gYjqc?=
 =?us-ascii?Q?jEgd37RmPwVHjN5JKlmyAkHVR1UzyALOx/ARitP/vnWVp1zRjr/TtE/KdGEO?=
 =?us-ascii?Q?scSGCDACseY7qW9VYYyU5EWhE7GkoCzfI9ff9HRBNoxcS2cTQe7ZMLt3H5k+?=
 =?us-ascii?Q?tKa9czC7NYBKTh4y2aAiwnk/K/WScBQ8ssNsOrytIEraJ+0bUXpTMNhHNFX4?=
 =?us-ascii?Q?WBeJIZO9dPc9HOqcwaOFRzmSUVIw6pn1/ZfYfeaN8RhkPD7ouJBpXeDpGGQH?=
 =?us-ascii?Q?6pFbJtM91R0p46JNRexhSquNQhayRBr3xgE/T8Koc5Gm17t6YscbvJjUVIDu?=
 =?us-ascii?Q?5fYBMedq9tpAKKm+gPVrTf9ypB/2s+DUVsxZeo5FL6/yjv1F78BtCs7l82d7?=
 =?us-ascii?Q?Ghy8EVxQdFODyIgXnBUh24P1faLWv9/o6U5yp2uPnnkWi5JqAWCPBwTld/4a?=
 =?us-ascii?Q?wutWRaNeIC+UbTy0CC52zjcwSnGtco8Kc8nHIRjPY2QSwNpPtxZgSmdPNNyU?=
 =?us-ascii?Q?EhyQ+t4koYWwkGqCBBrJ1DvBXmQr2+egSUcoCChZbET04YVAgaim2jLZSDNN?=
 =?us-ascii?Q?td4alNNIMa6lJpeJIzGHzX1iY+O+zLck7crWpiFOXwufEyzZPapMwP8ALntD?=
 =?us-ascii?Q?ehQqjFGfNnia8JEjFc6Rq9x0NoTw339482rvNIWJzV7KKBGy/fc1g4NGaVY6?=
 =?us-ascii?Q?EwTDVsqwcweWsT1qDkZQiosfgW7/J7wP78DZbAdNd31LS7kRfstXIU2tHFzG?=
 =?us-ascii?Q?yzE/hFYKjCatPDrukji1BbREIlBoZWaUsF5BHQXmG/eVCoKrtdvV1e0KmmyZ?=
 =?us-ascii?Q?qiffJJUIZcX+eEFvsU5bxy6bZXfmt8zCOib7PVFibV7nPXnaKqYobyhcA1Af?=
 =?us-ascii?Q?FiMhsaNH9PhpsaegsvaIrcIZ+ve0hWOXVai7Kc7Th340nEsFv+QPWMPRL3Rc?=
 =?us-ascii?Q?i26UNd9aJz1EwHXkVzN2lRTlCCPiwv2IPP42CWAyKslnKJ6XtNbszROyqgKd?=
 =?us-ascii?Q?Ax3sh9VbHF/w9Gh3W8yCN0H3Bn1JVoxhHj0V640GS3lYzo4wycE+gXK3cXaW?=
 =?us-ascii?Q?KaEBe7LuBiQjgYzP4pQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VniqmBMJw28/h1dF7t0nHcd4I1GreTnOyGgpYKqOmnyp8XiQSNNnwgkCU8A/?=
 =?us-ascii?Q?JWIAR6koePGobribLd0pONKPCsbt+7TNTgygizwjNIKzXuXenhus7GX+ofFz?=
 =?us-ascii?Q?iTefzbw8BYNqJu4BTlqjI6m6meGAEqDmjZzLB8LXJJ7WHzacQ6x4W92QeWdb?=
 =?us-ascii?Q?hirrQbsOxupwJHwTA28fPuCCAkjGU5aZaknjDpn/qcXiocLS90wzQpyWSS+b?=
 =?us-ascii?Q?evSxbvGijmSTyL3dAa+QTjsC42pa7UdBS9GZ2guu4TTlFUM1m4QUga7PAgnx?=
 =?us-ascii?Q?pB8hJ3bX6/olexIKqiXXmyX6PQ3jksnvHSDkigahcjmBjuPrpwwhqoyb+UY3?=
 =?us-ascii?Q?ZoJo9dV1ldwAiSYtpsEsBg7nNyXLzODKoWIm+7Z46ddduxS6CYSWVKTvLY/T?=
 =?us-ascii?Q?6UiaKbKn2LMlVuldBTXYappHg9SD7VwaNHeUQQMh2HdkxtqHgjdHjf6g4XXy?=
 =?us-ascii?Q?c+oLXJCvFMpMHGsAxlso5ZWIPGce3eztD6yvUrrGogfvlIr05fhAV10vZfNQ?=
 =?us-ascii?Q?4zt2ZPTAYnAok7DtRp67OZoEVufYciu13oQC2xlYGW6MtEMMKBB18cjXJLy5?=
 =?us-ascii?Q?+gOks33SJGhKvKq8LXe12Nm8znXn9TwNxd74ly6cFQZOgecmxhfYhm6XC6ae?=
 =?us-ascii?Q?t2mNw8h/vpbNYhZT7fsa4t5eH/l98b9ei8S7R4NPj2jmV3sQ0uLpBztBRaDJ?=
 =?us-ascii?Q?AwZ5X9PZl3MJZ+BtUw7Vl5t3fEvLToiqzcXCaoYoDY5bLA/ZiQqkkxYQqjOw?=
 =?us-ascii?Q?W7/ebn8nUEfy2buxnuzAS56dEgYgP9n6riaJWjz+uPpmd2NhmdgU3Rt3ySjF?=
 =?us-ascii?Q?0BCSh+vHM+ZuXAcgjvMG57OhbkUQt9ADVaKFJe+1wKkadpe1wil9CKOHbq3b?=
 =?us-ascii?Q?5qkonrzUe8LTxUeCMHZGlna49bvhVd/2yRWnUg8SZxU1JXW82Rfcwf7hpeiJ?=
 =?us-ascii?Q?HZdTCrDPJe9d5EXomIi1gZPjw6yfQFLnqzwJkiDwVZo5I62i/U5tzT1XRxoF?=
 =?us-ascii?Q?sxhzj1uJP4KR/216NzpniatHMb6faeiNvkdQ6LTHV4NGgHty6A/w8k6q1ODH?=
 =?us-ascii?Q?XMwT3vHVqcZq8g4yXUW03V91ULv7LCcp+8TQLRDQCgdVBG2m1ASG9MqX1zeR?=
 =?us-ascii?Q?Fpxj71HAivmWa3OE+VpLLDC5DL7vZFU9OyfXsjiVqoJTt7d/56g6LU/oy2pv?=
 =?us-ascii?Q?OOc35NmB7G7HrIgwcM70PMu/zZyFVJVH3KusFYZbqpcdFD8tvpHxJClWz/vm?=
 =?us-ascii?Q?/jyP/tn7CfccEdUC5qJmHXfcuoSz8Q5a9JKt4M0ArioqHm1oomcnJ97FLGb8?=
 =?us-ascii?Q?QZf8cTSuMQnzSGfhVA3rkkYZgKh1W0WaBFHPyG+84PBqqlGepAmfLtw70vQu?=
 =?us-ascii?Q?0carm8zXvFLbzQ2e5R0VIz5vFWlvAsLDKLjUWFadY7F6wH8Qhyz5bP4OPRC2?=
 =?us-ascii?Q?cbC8FSXIc0RPBNclVpnrlArwP5GkJ0HdXecNJoCjS98akCoqP+lW/oz9nluk?=
 =?us-ascii?Q?3msNJtwblUDkxvkEoNPgO50p0oAO3oeej5yz8KJeE+8ujWGKzOMjY3n4oHBp?=
 =?us-ascii?Q?C4Z4GVXHwciF/U9I0s25C3BMdgcBLfC3XQOqj9qyTFI+tRZ1FMwbXPGx6+jK?=
 =?us-ascii?Q?NuWJtdKd5JBVk0RHeZ5ywr+1bXVVXrnJ9B1ethaumUmjr+I9JIGNoyaLseSi?=
 =?us-ascii?Q?mfKf5KZjYjURusxkrETMwh+5F1L3qcjUmYc9n/KwtlRQ1ub6etU71qNzHmB6?=
 =?us-ascii?Q?ojx9LE0MkId3Cd4daITt2DQNwFP9R4A=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	suD41IzmamLCR0UlEAUjE+v7KvUG0DFETeYY95UmswMP+KMPW3e9OcMDry1pzXigIqQs24g9d9ab13EdXhbUNchzAMg+zL1MAnBcX5bnOc2BFIaBgSbRteV/BORwhBc0RV49gKLVsYp6UGIx6JrU2Cs0hDY74wnXk1ZO8oc/b0IqWnjFzQ/kHhgGIU0gUdNseLm0UMA15Prs4Jqrjf0Uzv4qAXoyJEB0nFWmB6/1GMyArS/oyjVn1ZculBvsehvYdx9duEzUadOgihaj7VzGjiiOp66Z+Durxs9HK6nA3pyoiJ/eOn7SHerD+yq5P71c++UEHb2/XD7KSyZ/N3U5ptNQAS1BoX7JufjWdGOD7PE8ldD8YTJjivRoTb4wooDqaSs6XTh/38y/FAI8j7BSPSGP4XM6WHrb+wJUQO+EdreFCrTAVhCew78h9UO7R0MJtGVGYNMdRadsddCvDX/eFgy9PdPgVcXOhcjyj0tgTiI0mR+5in/9WbbNoFX5ZK9O+R6v7NYxcVX4kI2hBoSsO5NPyZX/+J4VeRU75yW57uZuoDTW02/dNY71z05Te1QTeOj4S2bPzCvITFs/r7Wht+hAe/re1xt0OiqGcMtY304=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb19b3e2-801b-47fa-3a51-08de551cdf65
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:32:43.0405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dw6KwdxZ/PmPVNXqg92w8m1LSHi/ts3gPRKsJsifhenivsSy6JjeDLmr7RvBRZHuY3QIwG0a3ehy7gpGcKnZdc9hh3VHaaJiyq3GgCQkhbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5565
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601160119
X-Proofpoint-ORIG-GUID: _82iJhIpwnOW2gDORkuR2Z9QEpDej-Ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEyMCBTYWx0ZWRfX1XOcxHy6qnZq
 WqV6BFcOTcdiccsBJ2Rzh0t2HceJso5gCEdapHibewJe95gAzDKQoBZO6/H9UvkOwCBSkI2aKO2
 KaD8DikUWzho0yBKsYHtRJuKJQ9gA660RsLRDGEoN9SCq+4vsJqeeIxmeCnZSBMT9cryQlTVVFV
 iqpwboNHQeXUWrpGhDlCmSacPH/ZIVnT8Qq6ehq/ebe7peAnYYQxepN1VZRXJ9s4+QfljvhUFfn
 uxL2WcgiYs6SFqAHSbiyWvaIHGNR1cvkQf6p0rJAgbgO+ajUDFXLyGuS1ss4m25y7XD6/nRDYwr
 5TWqsBfaH/1gyRaFxGfdauL6yPAu5c+zCoU6c+62ujelDHfyEAQpW3ipcutiA/MrkLcSilL/PfE
 QifnY8LK4t+PO2Hsgqd77vt/MM2IyNQ+QTAk6l5T0xixm68fVlFBH1pE/pSLeJqX8tRSA6ZUEgF
 BNpqTmN/UCreIq80OdXychrNaGS8wiqBFEGQ0p8I=
X-Authority-Analysis: v=2.4 cv=J9KnLQnS c=1 sm=1 tr=0 ts=696a682f b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=CFdBCi7Au30zKPRMnoQA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13654
X-Proofpoint-GUID: _82iJhIpwnOW2gDORkuR2Z9QEpDej-Ga

On Sun, Dec 21, 2025 at 03:37:11PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Commit e3f6a4227 ("tracing: Remove pid in task_rename tracing output")
> of the Linux kernel (6.14-rc1) removed the pid (first) argument to the
> task_rename tracepoint.  The corresponding DTrace sdt probe, therefore,
> has one less argument.  Change the test to omit args[3], regardless of
> the kernel version.
> 
> Change the test to emit more diagnostic output in case of failure.
> 
> Commit 564efa04c ("test: adjust sdt.tst.args.d for task_rename
> tracepoint differences") of DTrace already handles this task_rename
> issue for test/unittest/sdt/tst.args-*.d by simply skipping one test
> or the other depending on whether the kernel version is < or >= 6.14.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/disasm/tst.ann-bvar.r  |  1 -
>  test/unittest/disasm/tst.ann-bvar.sh | 14 +++++++++++---
>  2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/test/unittest/disasm/tst.ann-bvar.r b/test/unittest/disasm/tst.ann-bvar.r
> index a55fb6deb..9ec0d8187 100644
> --- a/test/unittest/disasm/tst.ann-bvar.r
> +++ b/test/unittest/disasm/tst.ann-bvar.r
> @@ -11,7 +11,6 @@
>  85 0 1 0000 ffffffff    call dt_bvar_args             ! args[0]
>  85 0 1 0000 ffffffff    call dt_bvar_args             ! args[1]
>  85 0 1 0000 ffffffff    call dt_bvar_args             ! args[2]
> -85 0 1 0000 ffffffff    call dt_bvar_args             ! args[3]
>  85 0 1 0000 ffffffff    call dt_bvar_caller           ! caller
>  85 0 1 0000 ffffffff    call dt_bvar_curcpu           ! curcpu
>  85 0 1 0000 ffffffff    call dt_bvar_curthread        ! curthread
> diff --git a/test/unittest/disasm/tst.ann-bvar.sh b/test/unittest/disasm/tst.ann-bvar.sh
> index 61e838d10..d7caeecfb 100755
> --- a/test/unittest/disasm/tst.ann-bvar.sh
> +++ b/test/unittest/disasm/tst.ann-bvar.sh
> @@ -1,12 +1,13 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2022, 2026, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
>  
>  dtrace=$1
> +tmpfile=$tmpdir/tst.ann_bvar.$$
>  
>  $dtrace $dt_flags -Sen '
>  sdt:task::task_rename
> @@ -24,7 +25,7 @@ sdt:task::task_rename
>  	trace(args[0]);
>  	trace(args[1]);
>  	trace(args[2]);
> -	trace(args[3]);
> +/*	trace(args[3]); */
>  	trace(caller);
>  	trace(curcpu);
>  	trace(curthread);
> @@ -50,6 +51,13 @@ sdt:task::task_rename
>  	trace(walltimestamp);
>  	exit(0);
>  }
> -' 2>&1 | gawk '/ call dt_bvar_/ { sub(/^[^:]+: /, ""); print; }'
> +' >& $tmpfile
> +if [ $? -ne 0 ]; then
> +	echo "ERROR: DTrace not successful"
> +	cat $tmpfile
> +	exit 1
> +fi
> +
> +gawk '/ call dt_bvar_/ { sub(/^[^:]+: /, ""); print; }' $tmpfile
>  
>  exit $?
> -- 
> 2.47.3
> 
