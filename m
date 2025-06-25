Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF134C83
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825124; cv=fail; b=mk0HKzF+D2bor071Jt4OFDN3EVRNFKpqtwleq2tfI2Qrm3wC/OBFX9Fb6gBhBy6Sl9atdd8uQNZyuNzMiy3j+EVXo5AsfvioyrIEjMQIJT6ibsz/rkNRFBtPuXASRJD17igcY0vzkUFUSHsoCl7ysj3z/teVwVwKiFqnRwc17B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825124; c=relaxed/simple;
	bh=YvaMA+HOrufZVdp/59i/AnCooKkMJvOtZCdreJdF/ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PGh+NQqTurvZFgYKLZOhP8sRrL7TRA5+cyqq1NIV45auplvJfT03f4nSGRKzGMA/nOW/GL2zgnhrldwb64pqddq6fcnevlpqJ6ike6VLmwi6XT6y8xmQeyEgDSHRIpWTQSH7fUZnXpYGXfeBJmwNEwOgKwruHnzP28YsgSbqPPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iV406S86; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N7Wqvcoe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iV406S86";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N7Wqvcoe"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMifck029857
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qluV1lxCo0pPHkrkOi
	IAZoZl44VasFasjEvlImmdjPc=; b=iV406S86bg6VVXntSCU9VfrxE86I8Xrly0
	aYWuhUm6ixmMV3/9c9ksTEaBDtI7Ywt2cZm5s37HNikb8rpLJ/2K8QUuMa2kZMeO
	CBNy8s5RorjfW+017ywdUpDx2l8mIW8NLPsMpX7o+hwdv5CJZPCjHsyTG7owq2Gu
	Tw0LwHGFxxOXLpWa0Gta36+oXGrXyap/5aekaRkTvFv7yYUKmbyNGQqXG0AI2E0z
	6IpCCXQzcG8eZ1jlg4Q4e9vBPcK9jxKmVuFeHhHw15P+BCj77kDWAmnOy5yOedWu
	fwnAVcgRBV0BP6EjGGSgIKIYAQNtkto4iTXhTRdbl1qQ6R8cARjA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y6gxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:18:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1aSln026281
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:18:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvx17x4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:18:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkqxswiUbX/cu04UI7oG9oNBkthbrn2PN/zN/ulyQbIHZ757KSkzUqNGPGlajmuhHpaPm1H0rJdc+3FpiA0QylnrLLTXEUj9QJ7MiiRixx8NG/19Gh4jgEVGQGl+dDx6Xaco8TjN/r5Qj+0bhKd7T5ofjHHG15c1m9CsY769i1+hrjqwgAKfub293ibETJkz4U7JjhMfZVuUqzB8Ss2/YOGIo24FLrkRxjZne1/pOgOja8JG+4rlw3RYnomSfKBXIAOeuW/5G2c20myRHZ04qIYxgURIVEnG9sXivX6V3+gNssMP3zJswW4HO4QaAvwmKkR1neuswxs1oWQaiKh+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qluV1lxCo0pPHkrkOiIAZoZl44VasFasjEvlImmdjPc=;
 b=BApZ2PyHpBWlFcWKPTivEAasfiSZASinGUbc7rWTskm/ouVvUcYIeQFq4QeYDGvLCJzjm8IItYQDQXTWwqtzCL0+3VPx+4wrm/6vJZ1G0J0zH74YXMyRcR9ubuqF0ZCb+iYNidZGCXSzJzQRn6Gu+FnlVdqVQh0napWOTVcObzShtGk49g9UO7z9ZL3j0+PTOtMKQg8XKnf4PtIPrIgElfGna5YyBs9/PtG+bFVTmpu3nypDJrI8/Zx83BiCvPB8CPCiARxWoGfuP2rLYoAjT5ZnGfkMGIDYiGxpqD/4pf2p2mysajWGQ3iOAPKxX2ifxDxDCuShxqSf1EMO/2Ovhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qluV1lxCo0pPHkrkOiIAZoZl44VasFasjEvlImmdjPc=;
 b=N7WqvcoeLlnt4PXELxEw3RxotIaR6AsDrR3OqrDK8Iqp68rPBJzNYj4lshxsT4gpZ28LNFzC1NrLMcWpSbI7qUOzEovtLfKgi8U+eSlv9FkRHtonRW19R3VYjhdOSpxxXuXf9cf4xxHrjusd415562cvGlBhYRqwgdjSsmULaN8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM4PR10MB6886.namprd10.prod.outlook.com (2603:10b6:8:102::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 04:18:37 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:18:37 +0000
Date: Wed, 25 Jun 2025 00:18:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 11/14] Test: caller and stackdepth tests for proc provider
Message-ID: <aFt4mlyGYSxQUPRa@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
 <20250522180118.27343-11-eugene.loh@oracle.com>
 <87ikkzbsmb.fsf@esperi.org.uk>
 <4e0a07a6-04a0-3d60-af59-ba32a41a03f6@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e0a07a6-04a0-3d60-af59-ba32a41a03f6@oracle.com>
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM4PR10MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 6309e045-df54-4815-8602-08ddb39f5b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QqIfqMJx2zPMScn4YD/pQki693VOW8T6WHKLBPhtCqh3URAkKBKsAAyF4W5o?=
 =?us-ascii?Q?+EYjR9OVaSjFf2HuoKvHABP8qsPQts6wIMulT/9K4lyY176QPD2fQVXKsdFh?=
 =?us-ascii?Q?mDjvMzM8vurzaImQeW8RkGIAAzi/wfrXvNuQLnXv6vBHXOJ3cXCu0YdBmwgN?=
 =?us-ascii?Q?t898cvb2UFZdiPyghwEkpE+8AeKMYetUPnDMCnUBQYVE3NX8OkYh4iR2PeOf?=
 =?us-ascii?Q?10mLu2E/CZ8yfxYRFOlNaUc+5wpZg/9DYEhUHcaM03z7qM3B1vHVsHiqxA6z?=
 =?us-ascii?Q?rQl61EzcGo5r6oJ8Zlw10sx+bEysnCySv6zTLKLpGwLNzXPG2MrES2C2ims5?=
 =?us-ascii?Q?d/14R3FU5sqhw4fZVb49q0rynLfoLQsXPjUjcYeQ4VfPmw8sPpt2gyQJuJ7B?=
 =?us-ascii?Q?0BRbOnY4H7o4/1hOghwByeyv62jOmqKNhXqIxXJP798F0VSsu8ChYIsUazoz?=
 =?us-ascii?Q?LrInAcaRIE/JL1+1yI3toZszmSVJ/Dfy1MTQLOvAhMomFsPMkJCqcDa7N/gY?=
 =?us-ascii?Q?UEBdcIML5k1o3YT9u6H4JMsY9eGGeWePdkAMYCeu6Zxszy26vxr3Nksoideh?=
 =?us-ascii?Q?1UVp2w2rHqU6Wc+w4T8WdIM7DIqj41uoHe9DeMN4H49R+ceL2j1+cF6M9g29?=
 =?us-ascii?Q?Fo5NcrT27+PFUodUFCYWjHqR2sbq6Wsb+4fl1K9nP8rBBwUNvu9EQhy94PUS?=
 =?us-ascii?Q?20bpviOrAQrW8XzgzOM/jwtkWWpgfIp5tT9I8TDk6i/zH4DY2h9qeGYpfvcU?=
 =?us-ascii?Q?xgZydjqv+57DGxJm7qHgjU9ENkpK/fH79FeBMbWiJ6KXLmKA5gYfjaUEj/A8?=
 =?us-ascii?Q?j7S3jzhUc7EWsjTSmIMCuLC7kzKeuTHC+BFUFvt1Dp5nBShBpNkzjwS9uNC4?=
 =?us-ascii?Q?ajL3U7AmAFfZrqY787NaD27ISnVO9TP4qxFu/ziRHFwAR3LtdLmH2Ey6CI39?=
 =?us-ascii?Q?gtujhjJVP4WL7jXnbOT8y8/HJLw1cJPKMQRJouU8CjbzvX7ZfTIsjV4dhAKa?=
 =?us-ascii?Q?xOsTT12gJNvpwjY1CWJezCE0Jahb9GKZV4RI/9DuB3v9TdybSrzZ+tGUDMyI?=
 =?us-ascii?Q?u83q1dQ+jGrC6Pzjy8pSNm/l5C/1cJbXugoXldP39+YTgcSdgT61TrtVA2i9?=
 =?us-ascii?Q?aNuvWA2P0u+2hRrEZ9TnBtv3jHi+b9GEFbGQzCihdBFa8CAFOctRh7+J6D3c?=
 =?us-ascii?Q?UkG8A9ufjSnFnqh8lKLEioObI6x1o/DdeBCuwWbF1rnNpCdsis1sCDrWAqZl?=
 =?us-ascii?Q?fk6wJbQrgY095uJ827J4ezbnJ4/lYXOVH0uxxiBFjhRHqM6W0i8qJstBcrUu?=
 =?us-ascii?Q?vDGi5xbbNEyrFtXMxZbGoapM9P+uZ9IyyRMce3MzzMfyjdjdgi0X0n/7hBaN?=
 =?us-ascii?Q?+jnoaJ8dIWAmfudz8dSDSCZO6q1sx67up89SfeJwosNZ4OQpT1FHYEz7ukJ0?=
 =?us-ascii?Q?av1KoxtVzj4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?htJ5BQPErsXQE54I62cfv3OGNUTkIReuRvtFIRiOswqucEmMzkKNbUYOxaKI?=
 =?us-ascii?Q?TaOYVIQpsPQflU87gq41Lkzck3fvPcDfX2Qe6tR6PlD4XrUDKZtYJkJTz9Od?=
 =?us-ascii?Q?oCC3rvtn1PH55vUGPod0LX0tIxrhGZg5cVSBjdjuU9w9vb6YgXdi3/2HQdgE?=
 =?us-ascii?Q?QX5fQALTlWub923DpplDdsVgNgqDpnMUFZXDK4h+6+A9MUhUw3bHbnk4CcCj?=
 =?us-ascii?Q?+trNfcDZByYxf/MkYzTTz9fmBkETMcJaSRFKPbJZxwOsPsFixp8UnXESr5fg?=
 =?us-ascii?Q?7Ow7rwE1ie5RXLQGjKuWdAXSTghnZSLvRYCnsK1yRgUH5uheNGOL/mYowl3t?=
 =?us-ascii?Q?8pcStMGOHV2mLa5btZ4mqHQj7kYAbdJNccsZ+CF5TGGa5RAchgkoAtd5Ay4q?=
 =?us-ascii?Q?xtTcfp5ZidyeDhuSCVgfEME2GX7/fLnYGh2Ul2daguFTPIk+W7ok+VX+RLvu?=
 =?us-ascii?Q?8ompwTifACPniYZRvs7tG9gAQGTHwbKhDJvHTghsDi3CJIJdfWArKePbYXIW?=
 =?us-ascii?Q?9Tauy99yuoulF+/OSFO2tu4oqLld3eFxOXM5JuaasZeGKIkm7zE5vV+YloC5?=
 =?us-ascii?Q?9doRYwmHT9A3/fHnPY+TGcgHeH76uw1xYLg49foOnSw9H6j6lUfwD97A43JV?=
 =?us-ascii?Q?eaWpbNzCZ7HCUgRI7ihkaaf4wQ8F+uKhTnngUHPc8r26kgNj1zEwRtia9uc7?=
 =?us-ascii?Q?DzmeoRnRHdvylidm49V5EdMB5+/k/OZLgUVmeSFYJlh967bgNLw3nvPox/Bf?=
 =?us-ascii?Q?sb0JKatpWE3R4Amx+b381ZSmxkA9iWxGBJRwIK3sKeAF5sX8ISwHsXtyYSQC?=
 =?us-ascii?Q?cbkYmV5OGdjfN6ktE5KoApqSlEPq3fBRR6lbGtvpWTMbfCy5aIQFCeuyGyI9?=
 =?us-ascii?Q?6hH9xVpaayRs8oCx/oCO8lvECAA0pvXvj1mf1xvIqPPfd8F9xTCFQbmMiWed?=
 =?us-ascii?Q?dcrgLcUct2ahRcJdHAzY6igLnwWY+VzndiayZgFsjsdsJs8S7rSzKAOmVrAz?=
 =?us-ascii?Q?j9iIiY0aIB5eCTjNYxVJGhrhb4rozhg97/x7WJMxtpcP3R38XCRCIK6PGkxO?=
 =?us-ascii?Q?Ar24jIZvJ+TJRlY781jK8P2GRl5NuUglTiE7hYPg9PmGjGsZ6s9gATttEsnA?=
 =?us-ascii?Q?ONERAAixUG+6OED6H3G3YzhGuMwp75XIKXqXAq7EAXkU1ibehpxHfsGUszke?=
 =?us-ascii?Q?cqx1N+Fxk966yZFGkkV4Zn8lfq9IKUmj32Lbcr6WMqBKJRDIiB0DKufaLBW+?=
 =?us-ascii?Q?fgw0MQOis/2N/dGlbYppyCRGiWi64EkMzlkIQmTdvnJudHc6z8AgUhA4vNwh?=
 =?us-ascii?Q?5K//k+NuY+H6miYJ6OWz+BPMS7tF4u4iP4x9CpsC3mr92032alux/kh5X221?=
 =?us-ascii?Q?Ylb3Sjf0gVr3JnCwcFLF/WmRoLqOnR2zYF+jx2DeMDovwXvLMeOxi1/SYGj6?=
 =?us-ascii?Q?BMcanzpRnKqrhAy4lYyauHNjY55ghLblnUbBA7NUDYE8o9qmh7tF5UMrkTvF?=
 =?us-ascii?Q?2a+r7jEm912SCr97zrHvMZxoR5olCnAVKoLgj6ybo39Y8vrVNtfZuhDenkrR?=
 =?us-ascii?Q?MFWlsAhrsTjpnOhBFeNI6KEHsdcgwmuqvcMaIBFuSeIbLpqR1oWPMVVbsi0l?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w7UWMAgNQMAcaJX/0Zuy+++Ji1lEW7LW4/mYI1F5gnaioX5mb5CZPWMzpxz3QUZMdLxWi6l6vpN9ac4RIgm/aoi/UCnrXL1fhIRaGFfOCTR3R3D//l4KMLC/uVERUUSZ4brKTLKlXYrIJ3mmPakoc7PtjRK2Mvpu0XH005d+s4atIdwn+mIGOsmwhnWFvX7dl5uqQgWjolV8fLCi2LvfY2F+W/4yDrvwN4BJoUSEKKzkfAFvxj0A1LFNm22U7JIA1U7Gjfwmmr+Tb4W9qvEJmDVYOUw2j3EP/Yo1Ul0ymKCJ6cMbxtARhaDkzyvBim7ZWTYw6GgGNIxdDGep1ItHqeMEebi5K/lYEx6YcVNi//UhARNvKAPH4VocKdqhQjvoS6k6GGavRFbgueAfpmKbNbFwEyvJEMoH18IP9szbPv7LC13uVkeIpU7rdwucVlnXXoX86JWFkKoiAPkK2Tvm7c6pZyILRSTT7zuoX7VcNPtMmtPP4XmqCVvfD1bVsysP0rr4Vy+D2Rqhn/awF7/0A5mrU74o4ztbOfwq0BkgDDjSEPDG5WJ+sjxMFv8d2gYYLzvA6MCba0qQdDkkb8ZBRxWuLLlgi1aDFP3r3ZYfNQ4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6309e045-df54-4815-8602-08ddb39f5b5b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:18:37.1265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3hUFsHMweoqOy8Tv7TqTZkACpQpD4gMDTuAjRjYDBbYG9AR4d7Lr+EAXabYFeZw803w7pu4r9g1pmEJITgIEMiQXFHsIYoPwpiOv7sLRBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250030
X-Proofpoint-ORIG-GUID: cN76Z3bR62KBXu-oSKgww5HrdH1JVPwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAyOSBTYWx0ZWRfX2laIxtDutGh7 4L1KyrM3/SSv9iSmLJ0KcQWiH1pHmhuJ4ftBV9VKSFh7I4Kiw8PgPYdSOedFh04aVW8cv9fu/Ak RE9Yz35REazBtb6mU0+ExCXuuBECZaSGid03gAyuztt/TCY/3rXP1naWXgOgx3UQnr6xxDlwh95
 Db+loZW9uswr20HKZIpCRLXwGeH8ZR2sO6xaEE5UaQ9RBxnUCht3GneoT7nqv35DwO8BJjxCoRa dB4a4Iwec3nYS/XO668zaEPHOYdmEfeqQ8Lehrep5AnEsjkQy4aUTv42MMts4BErpTMAdGKYhVO kPGxA2Dnbga5bTMg/YdkBPf9SOc5gSjTvPBVktTPb1tPBgN6JjIMks+s9DMu8GE/KiTSVu0jL4h
 2R6hweQ+GnJKD/Tp/XJacgb3yc85cnnnUosWbQr4f1OVfc9vgS2rIPKjzmGmJgRHC9l4gYhK
X-Proofpoint-GUID: cN76Z3bR62KBXu-oSKgww5HrdH1JVPwt
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685b78a0 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=FCcEcjUzAdZIc204j7AA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714

On Sun, Jun 15, 2025 at 01:50:02PM -0400, Eugene Loh wrote:
> Thanks.
> 
> I'm getting to these out of order, but I figured I'd mention that I'm going
> to turn the capitalized "Test:" into "test:" for this series of patches to
> conform to the style in related patches.

In that case, please post v2 of the series ASAP because I cannot merge without
updated patches.

> 
> On 6/13/25 10:53, Nick Alcock wrote:
> > On 22 May 2025, eugene loh told this:
> > 
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > 
