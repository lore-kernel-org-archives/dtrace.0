Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6631A5BBD
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826366; cv=fail; b=cwkfGisb0L5pDjv0Pc8otSBGyqmh+dHlpZ4gReRPxw8maPJz0xfTyiKImKjCgCl3sLdmKlWAu7+IBfjreCTYsaSxd8jEJoR1HCsM1PHKhbM809zpT/xVjhW/c22zH/306uqMqeBY6l6VcRhpjIFMvnoVFW/PuA9YoKzTua8MpzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826366; c=relaxed/simple;
	bh=GcKLCRntmcQfF4CEC/kAl3Zlo3BEMg32jkqtyrh2PhM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=cfbvgC/WfYzwvlWBSePDdSeGP5o4H5uXORWG5k447BgX1wUNhweodSyKpO6q2mR3N9MG5NC/ln4wokdRZNG+3gF+yCXBllCTW+U1lnYyrb8dMmNyO/TkwhmDfCyQT3K9zk2F3cNwEK5935EvEwyP1U/5tzHIPID14b0UlgwL6F4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=r6Bz2qWA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZoCtpxNH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r6Bz2qWA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZoCtpxNH"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCted9023736
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=HqyeWnUt0IykFGxLKq
	4EqqjyaDMrqK7dsEaefxVSfQM=; b=r6Bz2qWAGRE3EvMXubKq1DJGDVUv23g0vS
	PZUvStfhjtRvCeGOpamsg9UAuPeNgrXeOKrB2h961T5q4Cni/r7ltcSo3Wmdi00s
	Om6MG9en00vH03AM81z0VDzCFmrAq0p6cTpa62sWZQkYcqobySxocB0PUMVmAZDv
	xAg3BGSOXmPcJiBc15om/q+B2u77SWoh/Gy8X5b3ZYgMKzkTq2MOUOUnhX2yf4za
	oRQas30MZ8V73bPcrsyvad5OjMGOUYO8hgI5nYYrFtuNMNruNKz9uYU5vNjeWM08
	ErgHa1gl2stw4D3E5fhLTfhyFxHI8RRh9roPfeuk1h41vunM42PA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dadbkfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:52:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DD4EkF031824
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:52:43 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvd0ed9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:52:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOy6qM2axk9rnlLjBtitr6aQgiWlVHw31AG3bmuBx4t33YGhc8RQK0bEd1Yu/Mm3VTMEm89E07gkSpxaBb+473AtF7884r1NACEZP0aUXGoZPXuLG6eLrQfmtSz75XA0X47u8bTKSEtv+S5WRlr8ekfmSL1+/D56eSIYvWr4buYZk3cVs1LxQluJgB1FisQvrJyk30R3BsnkOwejmYNKjAcFHW4PHRzYTx/5CjEr3R4AlqWFyOeZx3tY7dxErp4xIm9EuLAOPG9MmRp9qWyQ8MaN6MY00G/ny5G+FDBNruYppfOmCyUwfOp/zLptEUW7eAgzypfFfFSPfBU9speRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqyeWnUt0IykFGxLKq4EqqjyaDMrqK7dsEaefxVSfQM=;
 b=fjK4yhC1dSNgDryLUbOn6GZPGTYVm1i+RWlyXTFlLgRZtewYanb7Q+AIutf7SSjvCQvScE8KzXj2yx2zX7OunVbRNnEPF7EWoamd7O+3sHFwkaa+1Kjse0Fbj+GJs2yTZr/8NJ7H8NWDDP3SBS7QcHQltEdEL3YFEqmys/bfUERsvlL+wY9dDfKWa7tzJTduOVnkcu3HzV+OtZrU/N9QXupSh1YPXtbJnj7S8xCto5fvLiBztb6QywVtebmhJtpslpT8bHeljvmYLpz4RbdZS2fPCJ9zXMllKeQDp8DU4rY4D1A/2Vq/GiU8jVAxHrQoREWtHV0J3EnGA9BY9A7n3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqyeWnUt0IykFGxLKq4EqqjyaDMrqK7dsEaefxVSfQM=;
 b=ZoCtpxNHlZNbnQ9YasbZKt43xdflSsqaf86GRBMKk4DJ+GXOUmA+q/CyDYLaBcK95o3EGvovDRR7FuJyZTLdNJYgt7CmucLGY7YxclESv5MbBWEpyx6jSiE7yG4Sc5uermUx6nFMoXsA5BrntbiLwH5Swx6qU6E/SmDyivPAlz4=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by BY5PR10MB4179.namprd10.prod.outlook.com (2603:10b6:a03:206::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 13 Jun
 2025 14:52:41 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:52:41 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 10/14] Test: caller and stackdepth tests for sched provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-10-eugene.loh@oracle.com>
Emacs: it's like swatting a fly with a supernova.
Date: Fri, 13 Jun 2025 15:52:39 +0100
In-Reply-To: <20250522180118.27343-10-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:14 -0400")
Message-ID: <87msabbsnc.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0319.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::7) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|BY5PR10MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: cce73987-722e-4c1f-cd1a-08ddaa89f27a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LsehyI4tFOHo1++a+pe8ZUmWY02mZr8eS4AVecRqglqMMo08b8U5LvEJQp4U?=
 =?us-ascii?Q?F6b43NemV+bbnr9hJfPgimW/KevHnsUSelfD5F0uDDFOrq5b3npQ8vr5899L?=
 =?us-ascii?Q?DRrQdZX2r0l7+Ow4XCkS2dF/YcbeY8MvX6yYaFu4o6BhuR0mFwWXGeb7/rbJ?=
 =?us-ascii?Q?k4leVjgPeFw5CxRSNnRkXE4KGfn2GUeEuoY2WQ1L9pocET3r/xP0Lal3tZW3?=
 =?us-ascii?Q?SG8MNQjfZ9hRReVw08onHlfGrjNKldsT5IZ1HnBbXeOZ04EizytcCFuguukQ?=
 =?us-ascii?Q?R1Asm/5E/pnGmyj8eTgI8w97aRYpTHQ0dhqY2ux6DyRNkv4m4hTv8l2I9cho?=
 =?us-ascii?Q?ITRZQkz3hutj5QH5OXum6iJE9HApy2lkwvVHT1poijTf//2Qwq/pieVdp92w?=
 =?us-ascii?Q?d1xipQ7IlvU4Hnm4F0snlfShSmiPJo+h4ILFtEM+P3v7UwksR38BF92njIxC?=
 =?us-ascii?Q?twmokEhVeRdUg8R2l1tVWScTexUvJhFLxw1IXPsgIYv73LWUsEqnOKr/r3aE?=
 =?us-ascii?Q?NVk4nqOWA1bVF4hVMDt0UzQuwBh1JA26gV6WhKzsiWHYJ2gwBJxiIhcYEqM4?=
 =?us-ascii?Q?jAsqUEwbs8GfE06ySbXdX0UeovRgmtqzCwWMw/+NtAiFDFuMimrcVKKS6hDS?=
 =?us-ascii?Q?zShN3xWHipCvizpeGdlCCRro1S0sbell1C9jDY/fitM+v9Wa2CiIEMM0rC0w?=
 =?us-ascii?Q?C3QxkGoSu1o/oNSM/VLvvEGK171vdAMJsXjSSOlljpf/+dFl2/dt3DJTvSw1?=
 =?us-ascii?Q?w4685kfv7bU2s1He5hVgKdqNNLCMHd79niLdwe+eoBztybBaTM/1BV6W84xe?=
 =?us-ascii?Q?nhJXN4Q+uCfJBqW3R2SuEejAb39e7THlEpeKAs3RvY0KE8Z+kSvSdtoxcDWZ?=
 =?us-ascii?Q?KRyAumACqLlpvQSkoFkwscb20UKAUNMcDYtoT6ziMS8Hl5xlGdXq8XU9yZNF?=
 =?us-ascii?Q?BfiDyBQBDjfhD4VIP0u+jHCAqt8ZP96eEib45RXyeFm10gGq2E3RKCXlLzGn?=
 =?us-ascii?Q?3q5E2fY/AU+hd6rcIMgSwPfx03JJ3cpWTXLJDV3ywEJf6NcBAGRsxy8D3P+t?=
 =?us-ascii?Q?2CV5wGJb9iT6uzczOmMXDTb2GBCFrJvzsnAJ/YvsYoS/Gps67Mhp0sKWdCRP?=
 =?us-ascii?Q?2hlGK991tr/Lob6ZGMzEjETtj0+hDXx3tcwjB4p44hYj/NEyaZltp0wDHvtH?=
 =?us-ascii?Q?WX8qgmMNkC7xcO+tr4KHqMljm8F8nnAPr1hhe+DhHiVbMVqzm9NtcDHMoJuh?=
 =?us-ascii?Q?8dSv0OOGCbwGOtTRbW8o4KJ4Z4Vp2yd3F6tntaONhdzGVwtr6hY7WnwtuDxg?=
 =?us-ascii?Q?KXFhGgVLQaCsSWMX+MzIPxgKMFmitRcBX8tzqJcyZnk726Z7xdkOlS1f5zKM?=
 =?us-ascii?Q?RGHJLZpXVDmulx4fJ7nar1LRElKJQvInkNDfFqUnbTo/Z8Gttayfh/LGZYSP?=
 =?us-ascii?Q?P9hb+KNWthY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1XHOpdhb8GwISpX6W0Hpxsh5ecYuDP1//+j6+nWSxEaHuYUYhnBe3gFqJOd7?=
 =?us-ascii?Q?sjpEVFpDCjj9fjOP5xHP1w0I0A+xn1G39nBi3kGFTJa3VrCGk6HM+uEEy9Iu?=
 =?us-ascii?Q?qLVmTs6pWipaYJfRt4CquESYYioCeYiUHa/S+GcftB/xAkiCn6ANTKteHcFD?=
 =?us-ascii?Q?SQbO9GfLcAbA+QZuDGyymfq3Z0sis6vsDq/w7Q77BY0+CPa/+9dp3XqB5d3r?=
 =?us-ascii?Q?XDAAU9xNMpEslxmSfAwDTkxrO++30miB2zuarwnUrSrq82P5vqQJ0woLPzBV?=
 =?us-ascii?Q?XsD0HQUMt27rMvYHlUU4W/U0vSY7r8KxA31bKlcTV77/4V2AEx72XWSFteuq?=
 =?us-ascii?Q?9P1m8NuWOGP3PU1j8jeJvar5zRi5ZU8vfppbK1qG0MZN6TeNWqRWzUXYyqMq?=
 =?us-ascii?Q?KMRlvUAwFdfXvc7Hir8HA72SzptwmUP29fPawb+n7+JOSMEDeIYyv6g0jtCU?=
 =?us-ascii?Q?lJYoi0FMdkrDb5aDiZhhDdwIz7NB5Fvyw4/pq2v/+gQttmOd9OHCz2zSDGgG?=
 =?us-ascii?Q?DZyz594r0d+UZOe96jNSvMdEk0sV1hdC9HlvSPuij1yLO4NB4S7ENN2xTGi2?=
 =?us-ascii?Q?SQ8qqOsgXB7NmvCrfyGqnwVJOvy/Ck3O8f7gksIvoCMWLohJ1IHQOlrcJBPQ?=
 =?us-ascii?Q?FQbOT1YPCkPb24Vhkff6zagunU76BTLDJUR9VBZVIH8MtqnrjNlvLXHc+gnB?=
 =?us-ascii?Q?IP7hN8Uyc+/s7q2BlkYVvzHygKNI3lmI9Yetq9Bavx1EAsH9gNNhYXpJgBHM?=
 =?us-ascii?Q?sMJzbHs7QPBdEBwBmVFS6hsNdjU5ls9E6+x9dJM2caQAfBhINmWMP0HUZXZ5?=
 =?us-ascii?Q?Of8UFEbUHi0UkVqL/YaR5ZN9+YQbWkxCl64P2AK2gRvHnaVGwS2Zqn5Gld7F?=
 =?us-ascii?Q?oKRR8sMI7q0CkAJiI7HzjqGK8XEpWMzZIl4eHR5rcyf5vsQcTRQbGopG5bHR?=
 =?us-ascii?Q?0A5WKgWIwDHViggQRBZzXBHfJkgR7ZzwyfRKZUHm8Bw6Xnu45e7hQpypaIfZ?=
 =?us-ascii?Q?9UaMGwiMHgVdbV72h65Br3Dr6cSRw0+73BQmqF2Rf4RBbVW1u13t8jNYEqO7?=
 =?us-ascii?Q?ywI0VZz4A3CuSQeq0HanQPLZ/0GHXoRknovWE5IB1vH9Gat9atvEeusY2GX1?=
 =?us-ascii?Q?lnAkg6+Onrs0CLfXTK5WZ2fElthIkPAKSOv1eFRVkETMo7uZIW+UKXqONN7M?=
 =?us-ascii?Q?emD1hNVqEeWLDqoViir5/McIlHLXpPX9/Z5x1i49E4upy7yp5OYfqo5wqCe/?=
 =?us-ascii?Q?MM/8ofepmXYMqN94o7ZEXJXQ6yMtnLTONPyPlcvPuMXfJml/yN8ibin1pt7f?=
 =?us-ascii?Q?hAmvf6IsjVH12DDe7pi/3j+FYj80AQm+7erb1VFTEG4oFKFDZ1TJ0TlVQLov?=
 =?us-ascii?Q?Y6XD7feAIG4mbeB0pGsCStQDpogX9On1RfysHRRkI84RK41bSn1CW2/DDPE2?=
 =?us-ascii?Q?aXSV8lTPbYDOA73CJHOVNr8yop6n23UiahLnpEKwhz7Ld4P23/i/r0xu5Ny7?=
 =?us-ascii?Q?zvsmZHkrZdTquaPKEWnSj1m1MqbPBA81U4h+i1WGFXhnYN+PLybLm569L5UK?=
 =?us-ascii?Q?dB7mdoiM2/tgkpPQ8/73oMMa2fFbEgYL99RV97fcLtiQfs+4dhCf+0cHojHa?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NLKrPfstwA+04iQeJWtader6YtWiZArab0qohDwl4QU5Dv+rphInj8PvkVb0saQ2O11OLbKYQkZyrm2AgOOmUsYuRQ9iMOltX12SUKFUXGMgq1BxXmBxK+wkMET9LVM5zbysGm+G8TamuwPJ6WTIscRy+JhJbMJcKX96x4h3RPQk1t3YFlaGTNL18eWi9nyeBMPmbxNT2l7wFej9QF+vuopMHtq7atftes+Fqsjnmr432DFo4lu7XWtG2PLmg1NwpS5ZP/dj9jrexQ0Y2R0l0z4DIjuaFn4UOQyYw7hVKtzu/sV/7SDDuHfD7ogOd8hduH2Nkh47rhb4gu9kojFn0F7yPX1HV3m9OGY694loM8VC/951inJOCdhRZ6Q3KP7XA0s5dcdBXC44zAJ/20sdZT9BerQf2ehej4v5auo0LcDnSWnHXbVYl9PiIRN93bULcckaJHfFGoNZ3vS8xrWk/+mMKtE9PxSJu6v84EzSsQxoL0P6rCAXcNvNBnXU63xM6sFavSaT1KhCsXwXWyhiEx/Wue3r989gj4aCd6TmiHoSa/tBGoq1xXCj57TB2rQ+rT9wy1CNtZZIKhxTmdF0i2LlgbqrPrjzH7wtniqJWxo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce73987-722e-4c1f-cd1a-08ddaa89f27a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:52:41.3346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VuHwP6U0O6xMdogMEtRYBLlY1zPhBeIMxkey5Qqt7dIE5DtrmA0YgsRT47m0FR5XDuuV5bAPnH0YDAsDS23OvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4179
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130107
X-Proofpoint-ORIG-GUID: B5kq2LHPE7wkFroOgSaCpZDxV1fZjS4G
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=684c3b3c cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ttqUlfu53Zy3l2AAJ6wA:9 a=bQS9OzEy0soA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNyBTYWx0ZWRfX8x9b7KCEYpUn lmJTsTVcBlgCJ4Q9DZ24bwgoxcJEIGQDAu5RQ5Kf+5sc3HRyE8sWBiiGF13EY+kqWIgFxpQOsnG BxULp4sGeAZlS+LQQ+MZaDhxtWvQL8iYKg9Wca7fyG1q5vcY17DSgg6scpxw4sAbxWQwR7dyyLr
 degEpQ8utCEZrADpXe+3e3GWAdgZOcYK3MUNDREmUcd3Im37Bb2DPJPOx3LL1NKy/SZZY5uQ4sW wuFchiN+Vnah+DfHhjUfkhD/3Mqb3mEg/V4jhT1LlFF/gpKLV8Ddzbc03g67zbziIVh07ICNHrP WpZvOj5kBk/4tuMQ4WJXOsWrISnsEuI6XerNS02xbgVNyoFTxt0W28CtjAbzS9dbzgTOW4Jsyho
 P/Me9Pdd0OAxoKh1rCJy0RB+0EDWoKHn4jQlRp4nKamnHG28aO0I5XNA4EM1zSQ8lU/9Nm97
X-Proofpoint-GUID: B5kq2LHPE7wkFroOgSaCpZDxV1fZjS4G

On 22 May 2025, eugene loh uttered the following:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
