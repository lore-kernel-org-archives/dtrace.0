Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF39158A36
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 23:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723762848; cv=fail; b=RZ4Pi1/5pMJNkI9ZHG48xIGAwnbEnB44m4u2KSFXXn8WZ6bPuMuhYoBYQU8GdSEtltsQy88yOp6JlUCQ3lUYfIPR9cUyfK51xCqQM57BVOrNFrAokpxqDIde6f2zulWFgSCVZE1bwQVF03ZdES/fKYU3xs9PxglAuo4c7j3HPOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723762848; c=relaxed/simple;
	bh=OM8+kMM3MJXwEaFHCTXPQkNPPOG9Bd2e1waCr0mj7OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WUSW4BDrJeC36MqJe2wICGNgsa9cZoTuav+jHaip1D4fut6w3CEExRTSOdgK+TsoZeWfv8MOFDRIy902iAmGuIWkO5y8jdsP00aiY5ZZ1bh99uN1hXQYHVlY3BLh0HFTgnOI4/OdCcZgMlDhyuXKNrLaxAFJ7SDnPPGxHhvp298=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YuUrdzNw; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aCm5oQU5 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YuUrdzNw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aCm5oQU5"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FLvpOA001271
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 23:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=Gz2b4aSvT/akq50HvYDSISfG0jzZ4Fzc4awAcbhnm+k=; b=
	YuUrdzNw+aXmIpnxxvnaEPt1UtlgvBjDMfDSiciBc/Y+c/QLUKHUICV56YQWuLTh
	3EVTFNOU39kPAAKKO5bVWOB+F01iBRlhrh6ejon3RDrcUvrLlFqzgQrPVKvP7LAO
	LaykGlyiSSwBCNMipXAC4QqSTSvmqesZNr7iJq06T88DuXf1NUv5dra0nLk14yqb
	srSY0YlVmiYqks3AluTgoM6bS4cq0b1+ZwbAGCjB+TtYT0GioBy2VNhQF7vIpK+i
	2dd0jyDn3Gj4l3QPZ+o4ihF/ouX/wzDv2SnaIczNFUgrVu1eZ6Dd15DRK1DivsmK
	WyFcV9v4C5mfCqYpy/wOdw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wxt13j4e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 23:00:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FLo8Q9003681
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 23:00:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxncq7v3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 23:00:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dntpBK1h/ca/e4RtHCKRVbFsAs3yNIL2acSAfEUprcZDuUh50cR9ZXtxpaf75cWCNgYAct+NwObQH/LkhCVuUj50h+KQ1ztIpBGU+4tqXUP49opDT287ubq9J2bSjX+dPFtH85zRHHuSvSxlQv4v66ZzhTBkH5hsC7P1kvawEBetY/AoGt1gYg4Ym8gQfTXP01OJPMHIMuRTs2iyr8K7vSz7U0KkM4z8a1e8+DsOvnjiKafcb71CVap4vGeOM6Z7RiERtAQJmvgYYXyFHwq2+pXDs1HGYkrk+8iOyH9wKKZGx9Bdzq3ptW2eZL9uexZg6fqnHbHjjaFUdEB2oEIrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5Fc8DkOhGCOxfiCgvvg96tUV1E4wji8D7pLDqgWqcU=;
 b=XcZmnsnUwZ0PtZbIu7p2ZYO8+YDTk3xSh2pjd/NltNx/Oe+YXA2I9R1S4QEHW6fkgqBR+kdlvBprmagIYOUHDns0wSfHPJB6nQRjaVuHV5wS9P5QFJ3KfLrWiWKloUdYeShLhrEubP6uaR/An0Zgn8pUGXLz6kAojSEPAJMvJSRwZ5xKPvuLVKixTimFHY2HUfuRilehptwDxb5tIe6ShpcS/ZY4AvtWuTx4qerlwjMz5hTKwVao321iw2C27pxBZdkGrOL7aKjtq/JdLWxpYn1utXz0tvP5wjpdpnm+dGtYJLt3eF46PVk7HTPOuMnWOmi6QNbKtaW7zw9jS6yRvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5Fc8DkOhGCOxfiCgvvg96tUV1E4wji8D7pLDqgWqcU=;
 b=aCm5oQU5435E4SeP0GwEmcRNJzqFH1fn7QK0L8pErm9yYBOTQMPGr8KSFgajkKlhCHmnSIC9wVK38T8eZhchQ/3yg1bdJKrDHKVs9I94jxLP4SsScJxMi4u/2Bc6YxMktru4DEp2MRQFgmSk+XMPtVIaU26dk2J7b+aOfVQWz5Y=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM4PR10MB6694.namprd10.prod.outlook.com (2603:10b6:8:112::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Thu, 15 Aug
 2024 23:00:40 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 15 Aug 2024
 23:00:40 +0000
Date: Thu, 15 Aug 2024 19:00:37 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] agg: move aggregation declarations from
 dt_impl.h to dt_agrgegate.h
Message-ID: <Zr6IlRlfzcI5kQZW@oracle.com>
References: <SN7PR10MB6287B6602E0EA3DAF6FA4532C2802@SN7PR10MB6287.namprd10.prod.outlook.com>
 <0a853052-9594-b654-b4ed-2d4f3b11d59d@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a853052-9594-b654-b4ed-2d4f3b11d59d@oracle.com>
X-ClientProxiedBy: BL1PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::18) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM4PR10MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 007d7b06-6f16-4b4c-5728-08dcbd7e1544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?E97otaZ1AhgqTRwRfkni2makkDfgR070MAOkNq+t3+aDAxKcTASTM1bOGV?=
 =?iso-8859-1?Q?AdUVW/s8JHbimIzj9VY1nntRCYeHnrp3EYAOV5CKBsooMKPv55oT+fFeVB?=
 =?iso-8859-1?Q?EZlgkuOpMpEW2LGVHa9SwVLLOSZcfDi7pE1UjM7Q9/pMw+tawPPLGZitcB?=
 =?iso-8859-1?Q?z9wzGejzI9lp28Bj4o5ray774FifkcH/9XMvsfBFqC6GiudhjdkYflizZN?=
 =?iso-8859-1?Q?RnT0qHfXx92hvcbvJ76w+9MyCTwQDUyzzT0bYvBCvBDGTLy3Djpa2EpLWN?=
 =?iso-8859-1?Q?LTYXvl4KU6BssjbRRGRU+Sore/e+k5JNG85CnNglc474Lu156yHbr1q9qS?=
 =?iso-8859-1?Q?4OvsFnxe51SANNFAatQQVCkaDtDeAamUjqxZBvUckerEH2bE09hEjFVT6x?=
 =?iso-8859-1?Q?xbZ1wxDpOjG/NQHaadYNV3c00BUbQT2xitiEvs9ias64qm9kzA6UHK6Wmz?=
 =?iso-8859-1?Q?u6RGTvVv4qLNjXy0/Wq7+N8KZMCL0uujRXaSQuw1rMRu8yNFJWYPYt6H1m?=
 =?iso-8859-1?Q?4+gd21BlI6sneMwA5N8tu1VOD0XDqB9q5DrZL9ygWhrt1VvzY8wcSzGSkK?=
 =?iso-8859-1?Q?Eb58sCVXH8xo3p/2YNNTQwn84yVW6NO+hlpAqDUmsATuslHzGzIFLQEkTH?=
 =?iso-8859-1?Q?pWFJOPN/V6oRkTwxCmVAmRGDG+dJmGF6tACfWi2O4V9c4/dU9Odhc8evCN?=
 =?iso-8859-1?Q?lM+/njXoWS4qv+YDPO0NVf6acc3gKP13j7pN5mrmgKKCf5KqS/0Wn+08pM?=
 =?iso-8859-1?Q?jRPiAWOHz+zgOMDxTDovSYXilXop2Bp9vmlEqUgT1AtoUz1HmXg9djpQ2W?=
 =?iso-8859-1?Q?79WMLwsNskZYlrMUyJzE62r0GAGaF8mMC9QOIcdl979DaxqzS0sIwS4V4R?=
 =?iso-8859-1?Q?6JeUT9HURGpRjLJluwsj+bTTXUuNROrRizagtANSAv540MDO63c96NVNVw?=
 =?iso-8859-1?Q?VSvdZDboFGLINiJrw7tVeDJxvsrQw82sMjUtFbFPHNSWP08MUNEQ1yA1ye?=
 =?iso-8859-1?Q?TYdMrartEp7NAm7+XNhCpHjuwUICtYN0Ms9xWzQDsoylkyZRa1vx8JRwaU?=
 =?iso-8859-1?Q?vmWrAbf4vH70YsMl/UCHfD7DxrGsj7PX4S48wtzMdwh3WNrOdvBndRNbD1?=
 =?iso-8859-1?Q?ITl1CxEqEeRq2VRp+YqgA6FYjHJjZa134EByaPUBgSVRjPXIdsWSk4rqjg?=
 =?iso-8859-1?Q?J8e/puKJxbBRsvU56prHudt/En3EjQca3ZF1dRP297u3Jyr4CaiviX22Yu?=
 =?iso-8859-1?Q?9MNg52AwLmwd4gmasprWYlmEAPvJjuDjUT1o7v5BBYwqQhGJ+XgZkS9zYr?=
 =?iso-8859-1?Q?NwHqiHiFvYx1HLShreqaKbcCwC+kQhy19pGGjFvgpDF57rrCJqFXzoVM5O?=
 =?iso-8859-1?Q?8emiH4Z7T4PlNisQ93t6ETl3v9DloADTypPrl39c1/ODKL04plWss=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?XafVT1wLhWjV/zKglObfS823n28Pahrko4H9L5kjhIKSrCKzTurEiytG+W?=
 =?iso-8859-1?Q?XzsDe1hJCNIWUYVhGOfH7/Uom6b+tgsELJN5ZvNtICrezK0NBPMjqhAncj?=
 =?iso-8859-1?Q?DHUq/D1Vg7zfYtVYcSBftWPac7eVpIvR32xkR37/GYV56w0xHFbNkcjSFN?=
 =?iso-8859-1?Q?FElUOjHZ+WGsr76DZRMzVYhJX/0b0z2Ie60jlmIngxaiKTTV+UoxS5dQUi?=
 =?iso-8859-1?Q?CYEXQ0j2HxMknrSjv7zCoqB6Xm12rE/zZj/Ma1pthkjaUPAK8eOb9W90ur?=
 =?iso-8859-1?Q?JVYVa/gNPuyW6CCJj6gL5KzMSlIUYf+tgO75R3MjNcNrgF3SnAnoQuvHNl?=
 =?iso-8859-1?Q?gFagoHbsnh4h5J0xD540QSGuYw4Rqrk8WRpLRS8JRSAoviDFKpr5I3asPG?=
 =?iso-8859-1?Q?i0xSDlu0zjXY+VcnHZxC6LYkt+f27o2y+JCKRtXgmcowlrz+EOIn8adzm4?=
 =?iso-8859-1?Q?c6DqJJokitOhqcF5ZN+Pi5Gc5T9esD2Y9sAcfl46l4kkiIVCtZfrrGpHY6?=
 =?iso-8859-1?Q?RI3F5/XmQeZUWuIW6EErNtRCePSNHp1UvGnDcn4OG2H4wzfy6nmUr7nlNi?=
 =?iso-8859-1?Q?CTAhs0qzxmeInGGm1sToBlEgEhTJ+98a6KMW4WaXHyfyySG3dEnaYwMSX+?=
 =?iso-8859-1?Q?19lzTssyb1KEIpFEXR9IP0MZDrTABJ7axHGy2wK6O5aFyfiFhqhJyyr2YC?=
 =?iso-8859-1?Q?hlnsbmoXTGVEsYHnmV/JbPLl5k5/eUWa5TzB3G6LPZ1ELBrytZMHjSNOaz?=
 =?iso-8859-1?Q?o5FhqDnvHeIku1Pm1/VfeLX+agiG7V8TBLrH59Ta5Khu+OmsQWQpkk5TMB?=
 =?iso-8859-1?Q?LnhGSi858Mk5eiEW1qgZnwlNjmU6FiiRnke8OcYk5zQG4qLD4Wih94z89h?=
 =?iso-8859-1?Q?+QPT0Z4syXb3NfkSxTALvJmq+WClZccBgxoBWAtVgNyZPkZ5vHA+ecn8FC?=
 =?iso-8859-1?Q?4Yt5jeUQhSQh4H9xkXWqSEUOcsS/37jOaV3WH0sjn+TyZBDloAIVifgV6D?=
 =?iso-8859-1?Q?nTwGol7U67IwPC5EfuPM6yC4LSOqS8Anfrh7t45MFchsOi5L/nsxWx5Qu3?=
 =?iso-8859-1?Q?gT/+F/Sc6jUerfrYSFWnUDLMfIWd8FExCBPpIGIhy4VXBFczhT1RvfPfCS?=
 =?iso-8859-1?Q?1UlxFZPuTL7lm4RTKqT06vak75Uk8SR5dnNg9G9RjofkE1XyiiBvXRPOFf?=
 =?iso-8859-1?Q?H77CysyfPZWZVdwiZEy+CVs8VDcohetjPnI5dfxvV3WK3+ZN4S/DXiO1W6?=
 =?iso-8859-1?Q?tTYiMGKtcnHCeCDRP93efpUWssk2FG3iUyXI8QrbeNF43hMSvFriymZtbn?=
 =?iso-8859-1?Q?coc9iLVBKs/UpQgl/z4ADO1zI49SUxGC6pVwYCaFOjkaNexRf1iem+7dsa?=
 =?iso-8859-1?Q?jXELWurdxbhrtZB7H7QbMnZOeWOID+vRTkpAGeQ+wg9NRO+uK9AtYnNwhs?=
 =?iso-8859-1?Q?397badGQ+W7sz8MxiJyMuDJfKJmkYbynsdBdiW2Bfn6RR3SzYLEwTpgEOB?=
 =?iso-8859-1?Q?0T+Xw6SqWtZHb76wevjFMuXP51MLdiY891a5PB96VTtlbUKEBDvC2GrYA8?=
 =?iso-8859-1?Q?bwYJn0R8fjXhUnNLIXmMkXyxuBWFRFb1iQyJ8sw24eQ5smwn6FB73cuRzB?=
 =?iso-8859-1?Q?GWKBq/hfi4O01tP8h20z8OdTKH9t9lqrX/+thrBW35LRVlp7wiqOK/4A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pCQ2YbUxuWGxJQ2gSWwQ8gXzCINHBHBYruKVSW3Mb6bszWUlCGNQKJbm2MnxZbXaOmHWLjOZJagZT5J+3pSJPsGwTwnRdUi51VxebpTrkUWgQLyLJQstlqffsU45VtNd+GMO+MpRwnmjUC5Te3om7YX7oyahfHEcq0pZ/AWDTfRQ1n6C4F+IylZ8OXLwBfNHrwFCGpcWp51Vem0ZNsOsJD6CwHZsuzfgKi5CeKDw6Jy2NfPrmF/+ulNWarCmZ4ZnEVnhpYBS/6j8rm87HrWA+iNq3WuIlFoa0vleF1Aiw/1IYXOahbz8VMvR37pqMzyXjxgh4ICe1uys3Mial/3vUz2VLKme99LcgI/25bVjYdV1Z1a473xHSc6ZbG+zpyktcFLQpXpv3R6fc6B/Zl5rLlAoflWDxKNqHi5DnrObyLNUdNTUZ04H0HS10SJ5K6e5giadHKmVjZaDIcTnrBijxII1HbRDRuTFXUzc0vGdtcrOuT7yXWLMPErj7QCZ2FYSm1M53oTMvm4eyYFJwNZEdkRY/TjetfGE64Fvmzh/5oA4K1NAJe1MN4MsvmYiZFh6aFHLNp4rNOB5GAnoyEh3eCyt+Nod322segt4dPSwppk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007d7b06-6f16-4b4c-5728-08dcbd7e1544
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 23:00:40.1419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hoT2cCrTgVwbeif9A7onrI0S2Mb2F3+bO+9avY/UY+DX/sTfe+jovCZ7d+mkDx5UVfnP47qMKp/HGyn6NTjcR6M3QQKhMcguBBHY02jGVdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6694
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_15,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150167
X-Proofpoint-GUID: S_26O00g9za1FOdivViGO-FKLvLmj70-
X-Proofpoint-ORIG-GUID: S_26O00g9za1FOdivViGO-FKLvLmj70-

On Thu, Aug 15, 2024 at 06:40:18PM -0400, Eugene Loh via DTrace-devel wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> I assume it compiles.  So that's the main test.

For sure.

> I assume you mean to get rid of the #if 0 blocks (two instances) in
> dt_aggregate.h.

Woops, yes, that needs to go.

> Do residual
>     #define DT_AGGDATA_COUNTER     0
>     #define DT_AGGDATA_RECORD      1
> remain in dt_impl.h?

Ah yes, that needs to go aw well.

> Mention the dt_aggregate allocation thing.

Will do.

> On 8/15/24 17:07, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_aggregate.c | 64 +++++++++++++++++++++++-----
> >   libdtrace/dt_aggregate.h | 91 ++++++++++++++++++++++++++++++++++++++++
> >   libdtrace/dt_cg.c        |  1 +
> >   libdtrace/dt_consume.c   |  1 +
> >   libdtrace/dt_impl.h      | 53 +----------------------
> >   libdtrace/dt_open.c      |  3 ++
> >   libdtrace/dt_options.c   |  6 +--
> >   libdtrace/dt_printf.c    |  3 +-
> >   libdtrace/dt_work.c      | 13 +++---
> >   9 files changed, 163 insertions(+), 72 deletions(-)
> >   create mode 100644 libdtrace/dt_aggregate.h
> > 
> > diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> > index 6472360b..329b8ffa 100644
> > --- a/libdtrace/dt_aggregate.c
> > +++ b/libdtrace/dt_aggregate.c
> > @@ -16,8 +16,32 @@
> >   #include <libproc.h>
> >   #include <port.h>
> > +#include <dt_aggregate.h>
> >   #include <dt_bpf.h>
> > +typedef struct dt_ahashent {
> > +	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
> > +	struct dt_ahashent *dtahe_next;		/* next on hash chain */
> > +	struct dt_ahashent *dtahe_prevall;	/* prev on list of all */
> > +	struct dt_ahashent *dtahe_nextall;	/* next on list of all */
> > +	uint64_t dtahe_hval;			/* hash value */
> > +	dtrace_aggdata_t dtahe_data;		/* data */
> > +} dt_ahashent_t;
> > +
> > +typedef struct dt_ahash {
> > +	dt_ahashent_t	**dtah_hash;		/* hash table */
> > +	dt_ahashent_t	*dtah_all;		/* list of all elements */
> > +	size_t		dtah_size;		/* size of hash table */
> > +} dt_ahash_t;
> > +
> > +struct dt_aggregate {
> > +	char *dtat_key;			/* aggregation key */
> > +	char *dtat_buf;			/* aggregation data buffer */
> > +	char *dtat_nextkey;		/* next aggregation key */
> > +	int dtat_flags;			/* aggregate flags */
> > +	dt_ahash_t dtat_hash;		/* aggregate hash table */
> > +};
> > +
> >   #define	DTRACE_AHASHSIZE	32779		/* big 'ol prime */
> >   /*
> > @@ -34,6 +58,21 @@ static int dt_keypos;
> >   #define	DT_LESSTHAN	(dt_revsort == 0 ? -1 : 1)
> >   #define	DT_GREATERTHAN	(dt_revsort == 0 ? 1 : -1)
> > +int
> > +dt_aggregate_init(dtrace_hdl_t *dtp) {
> > +	dtp->dt_aggregate = dt_zalloc(dtp, sizeof(dt_aggregate_t));
> > +	if (dtp->dt_aggregate == NULL)
> > +		return dt_set_errno(dtp, EDT_NOMEM);
> > +
> > +	return 0;
> > +}
> > +
> > +void
> > +dt_aggregate_set_option(dtrace_hdl_t *dtp, uintptr_t opt)
> > +{
> > +	dtp->dt_aggregate->dtat_flags |= opt;
> > +}
> > +
> >   static int
> >   dt_aggregate_countcmp(int64_t *lhs, int64_t *rhs)
> >   {
> > @@ -503,7 +542,7 @@ static int
> >   dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
> >   		      const char *data)
> >   {
> > -	dt_ahash_t		*agh = &dtp->dt_aggregate.dtat_hash;
> > +	dt_ahash_t		*agh = &dtp->dt_aggregate->dtat_hash;
> >   	dt_ahashent_t		*h;
> >   	dtrace_aggdesc_t	*agg;
> >   	dtrace_aggdata_t	*agd;
> > @@ -621,7 +660,7 @@ hashnext:
> >   	memcpy(ptr, data, size);
> >   	agd->dtada_data = ptr;
> > -	if (dtp->dt_aggregate.dtat_flags & DTRACE_A_PERCPU) {
> > +	if (dtp->dt_aggregate->dtat_flags & DTRACE_A_PERCPU) {
> >   		int i, max_cpus = dtp->dt_conf.max_cpuid + 1;
> >   		dtrace_recdesc_t	*rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
> > @@ -658,7 +697,7 @@ hashnext:
> >   static int
> >   dt_aggregate_snap_cpu(dtrace_hdl_t *dtp, processorid_t cpu, int fd)
> >   {
> > -	dt_aggregate_t		*agp = &dtp->dt_aggregate;
> > +	dt_aggregate_t		*agp = dtp->dt_aggregate;
> >   	size_t			ksize = dtp->dt_maxtuplesize;
> >   	char			*key = agp->dtat_key;
> >   	char			*data = agp->dtat_buf;
> > @@ -692,7 +731,7 @@ int
> >   dtrace_aggregate_snap(dtrace_hdl_t *dtp)
> >   {
> >   	dtrace_optval_t	interval = dtp->dt_options[DTRACEOPT_AGGRATE];
> > -	dt_aggregate_t	*agp = &dtp->dt_aggregate;
> > +	dt_aggregate_t	*agp = dtp->dt_aggregate;
> >   	int		i, rval;
> >   	/* Has tracing started yet? */
> > @@ -1104,7 +1143,7 @@ dt_aggregate_bundlecmp(const void *lhs, const void *rhs)
> >   int
> >   dt_aggregate_go(dtrace_hdl_t *dtp)
> >   {
> > -	dt_aggregate_t	*agp = &dtp->dt_aggregate;
> > +	dt_aggregate_t	*agp = dtp->dt_aggregate;
> >   	dt_ahash_t	*agh = &agp->dtat_hash;
> >   	/* If there are no aggregations there is nothing to do. */
> > @@ -1149,7 +1188,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
> >   {
> >   	dtrace_aggdata_t	*agd = &h->dtahe_data;
> >   	int			i, ncpus = dtp->dt_conf.num_online_cpus;
> > -	char			*key = dtp->dt_aggregate.dtat_key;
> > +	char			*key = dtp->dt_aggregate->dtat_key;
> >   	memset(key, 0, dtp->dt_maxtuplesize);
> >   	memcpy(key, agd->dtada_key, agd->dtada_desc->dtagd_ksize);
> > @@ -1171,7 +1210,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
> >   static int
> >   dt_aggwalk_rval(dtrace_hdl_t *dtp, dt_ahashent_t *h, int rval)
> >   {
> > -	dt_aggregate_t *agp = &dtp->dt_aggregate;
> > +	dt_aggregate_t *agp = dtp->dt_aggregate;
> >   	switch (rval) {
> >   	case DTRACE_AGGWALK_NEXT:
> > @@ -1281,7 +1320,7 @@ int
> >   dtrace_aggregate_walk(dtrace_hdl_t *dtp, dtrace_aggregate_f *func, void *arg)
> >   {
> >   	dt_ahashent_t *h, *next;
> > -	dt_ahash_t *hash = &dtp->dt_aggregate.dtat_hash;
> > +	dt_ahash_t *hash = &dtp->dt_aggregate->dtat_hash;
> >   	for (h = hash->dtah_all; h != NULL; h = next) {
> >   		/*
> > @@ -1302,7 +1341,7 @@ static int
> >   dt_aggregate_walk_sorted(dtrace_hdl_t *dtp, dtrace_aggregate_f *func,
> >   			 void *arg, int (*sfunc)(const void *, const void *))
> >   {
> > -	dt_aggregate_t *agp = &dtp->dt_aggregate;
> > +	dt_aggregate_t *agp = dtp->dt_aggregate;
> >   	dt_ahashent_t *h, **sorted;
> >   	dt_ahash_t *hash = &agp->dtat_hash;
> >   	size_t i, nentries = 0;
> > @@ -1428,7 +1467,7 @@ dtrace_aggregate_walk_joined(dtrace_hdl_t *dtp, dtrace_aggid_t *aggvars,
> >   			     int naggvars, dtrace_aggregate_walk_joined_f *func,
> >   			     void *arg)
> >   {
> > -	dt_aggregate_t *agp = &dtp->dt_aggregate;
> > +	dt_aggregate_t *agp = dtp->dt_aggregate;
> >   	dt_ahashent_t *h, **sorted = NULL, ***bundle, **nbundle;
> >   	const dtrace_aggdata_t **data;
> >   	dt_ahashent_t *zaggdata = NULL;
> > @@ -1829,7 +1868,7 @@ dtrace_aggregate_clear(dtrace_hdl_t *dtp)
> >   void
> >   dt_aggregate_destroy(dtrace_hdl_t *dtp)
> >   {
> > -	dt_aggregate_t		*agp = &dtp->dt_aggregate;
> > +	dt_aggregate_t		*agp = dtp->dt_aggregate;
> >   	dt_ahash_t		*hash = &agp->dtat_hash;
> >   	dt_ahashent_t		*h, *next;
> >   	dtrace_aggdata_t	*agd;
> > @@ -1864,4 +1903,7 @@ dt_aggregate_destroy(dtrace_hdl_t *dtp)
> >   	dt_free(dtp, agp->dtat_key);
> >   	dt_free(dtp, agp->dtat_buf);
> >   	dt_free(dtp, agp->dtat_nextkey);
> > +	dt_free(dtp, agp);
> > +
> > +	dtp->dt_aggregate = NULL;
> >   }
> > diff --git a/libdtrace/dt_aggregate.h b/libdtrace/dt_aggregate.h
> > new file mode 100644
> > index 00000000..33921a72
> > --- /dev/null
> > +++ b/libdtrace/dt_aggregate.h
> > @@ -0,0 +1,91 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +#ifndef	_DT_AGGREGATE_H
> > +#define	_DT_AGGREGATE_H
> > +
> > +#if 0
> > +#include <sys/param.h>
> > +#include <setjmp.h>
> > +#include <sys/ctf-api.h>
> > +#include <dtrace.h>
> > +#include <pthread.h>
> > +
> > +#include <sys/types.h>
> > +#include <sys/dtrace_types.h>
> > +#include <sys/utsname.h>
> > +#include <sys/compiler.h>
> > +#include <math.h>
> > +#include <signal.h>
> > +#include <string.h>
> > +#include <stddef.h>
> > +#include <bpf_asm.h>
> > +#endif
> > +
> > +#ifdef	__cplusplus
> > +extern "C" {
> > +#endif
> > +
> > +#if 0
> > +#include <dt_bpf_maps.h>
> > +#include <dt_parser.h>
> > +#include <dt_regset.h>
> > +#include <dt_rodata.h>
> > +#include <dt_strtab.h>
> > +#include <dt_symtab.h>
> > +#include <dt_ident.h>
> > +#include <dt_htab.h>
> > +#include <dt_list.h>
> > +#include <dt_decl.h>
> > +#include <dt_as.h>
> > +#include <dt_proc.h>
> > +#include <dt_pcap.h>
> > +#include <dt_dof.h>
> > +#include <dt_pcb.h>
> > +#include <dt_printf.h>
> > +#include <dt_debug.h>
> > +#include <dt_version.h>
> > +#endif
> > +
> > +typedef struct dt_aggregate dt_aggregate_t;
> > +
> > +#define DT_AGGDATA_COUNTER	0
> > +#define DT_AGGDATA_RECORD	1
> > +
> > +/*
> > + * Aggregation functions.
> > + */
> > +#define	DT_AGG_BASE		DTRACEACT_AGGREGATION
> > +#define	DT_AGG(n)		(DT_AGG_BASE + (n))
> > +#define DT_AGG_IDX(n)		((n) - DT_AGG_BASE)
> > +#define DT_AGG_NUM		(DT_AGG_IDX(DT_AGG_HIGHEST))
> > +
> > +typedef enum dt_aggfid {
> > +	DT_AGG_AVG = DT_AGG_BASE,
> > +	DT_AGG_COUNT,
> > +	DT_AGG_LLQUANTIZE,
> > +	DT_AGG_LQUANTIZE,
> > +	DT_AGG_MAX,
> > +	DT_AGG_MIN,
> > +	DT_AGG_QUANTIZE,
> > +	DT_AGG_STDDEV,
> > +	DT_AGG_SUM,
> > +
> > +	DT_AGG_HIGHEST
> > +} dt_aggfid_t;
> > +
> > +extern int dt_aggregate_init(dtrace_hdl_t *);
> > +extern void dt_aggregate_set_option(dtrace_hdl_t *, uintptr_t);
> > +extern int dt_aggregate_go(dtrace_hdl_t *);
> > +extern int dt_aggregate_clear_one(const dtrace_aggdata_t *, void *);
> > +extern void dt_aggregate_destroy(dtrace_hdl_t *);
> > +
> > +#ifdef	__cplusplus
> > +}
> > +#endif
> > +
> > +#endif	/* _DT_AGGREGATE_H */
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index 164f9e5f..cce2535c 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -16,6 +16,7 @@
> >   #include <linux/if_arp.h>		/* ARPHRD_ETHER ARPHRD_INFINIBAND */
> >   #include <dt_impl.h>
> > +#include <dt_aggregate.h>
> >   #include <dt_dis.h>
> >   #include <dt_dctx.h>
> >   #include <dt_cg.h>
> > diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> > index 07856746..6ad73324 100644
> > --- a/libdtrace/dt_consume.c
> > +++ b/libdtrace/dt_consume.c
> > @@ -14,6 +14,7 @@
> >   #include <ctype.h>
> >   #include <alloca.h>
> >   #include <dt_impl.h>
> > +#include <dt_aggregate.h>
> >   #include <dt_module.h>
> >   #include <dt_pcap.h>
> >   #include <dt_peb.h>
> > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > index 88b31ce0..fa2b2602 100644
> > --- a/libdtrace/dt_impl.h
> > +++ b/libdtrace/dt_impl.h
> > @@ -83,6 +83,7 @@ extern "C" {
> >   #define DT_NULL_STRING ((uint16_t)0x7f00)
> >   #endif
> > +struct dt_aggregate;		/* see <dt_aggregate.h> */
> >   struct dt_module;		/* see below */
> >   struct dt_pfdict;		/* see <dt_printf.h> */
> >   struct dt_arg;			/* see below */
> > @@ -197,21 +198,6 @@ typedef struct dt_kern_path {
> >   #define DT_DM_CTF_ARCHIVED	0x4	/* module found in a CTF archive */
> >   #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
> > -typedef struct dt_ahashent {
> > -	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
> > -	struct dt_ahashent *dtahe_next;		/* next on hash chain */
> > -	struct dt_ahashent *dtahe_prevall;	/* prev on list of all */
> > -	struct dt_ahashent *dtahe_nextall;	/* next on list of all */
> > -	uint64_t dtahe_hval;			/* hash value */
> > -	dtrace_aggdata_t dtahe_data;		/* data */
> > -} dt_ahashent_t;
> > -
> > -typedef struct dt_ahash {
> > -	dt_ahashent_t	**dtah_hash;		/* hash table */
> > -	dt_ahashent_t	*dtah_all;		/* list of all elements */
> > -	size_t		dtah_size;		/* size of hash table */
> > -} dt_ahash_t;
> > -
> >   #define DT_AGGDATA_COUNTER	0
> >   #define DT_AGGDATA_RECORD	1
> > @@ -245,14 +231,6 @@ typedef struct dt_tstring {
> >   	int		in_use;			/* In use (1) or not (0) */
> >   } dt_tstring_t;
> > -typedef struct dt_aggregate {
> > -	char *dtat_key;			/* aggregation key */
> > -	char *dtat_buf;			/* aggregation data buffer */
> > -	char *dtat_nextkey;		/* next aggregation key */
> > -	int dtat_flags;			/* aggregate flags */
> > -	dt_ahash_t dtat_hash;		/* aggregate hash table */
> > -} dt_aggregate_t;
> > -
> >   typedef struct dt_dirpath {
> >   	dt_list_t dir_list;		/* linked-list forward/back pointers */
> >   	char *dir_path;			/* directory pathname */
> > @@ -387,7 +365,7 @@ struct dtrace_hdl {
> >   	size_t dt_maxagg;	/* max aggregation ID */
> >   	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
> >   	int dt_maxformat;	/* max format ID */
> > -	dt_aggregate_t dt_aggregate; /* aggregate */
> > +	struct dt_aggregate *dt_aggregate; /* aggregate */
> >   	struct dt_pebset *dt_pebset; /* perf event buffers set */
> >   	struct dt_pfdict *dt_pfdict; /* dictionary of printf conversions */
> >   	dt_version_t dt_vmax;	/* optional ceiling on program API binding */
> > @@ -593,28 +571,6 @@ struct dtrace_hdl {
> >   #define DT_ACT_MAX		31
> > -/*
> > - * Aggregation functions.
> > - */
> > -#define	DT_AGG_BASE		DTRACEACT_AGGREGATION
> > -#define	DT_AGG(n)		(DT_AGG_BASE + (n))
> > -#define DT_AGG_IDX(n)		((n) - DT_AGG_BASE)
> > -#define DT_AGG_NUM		(DT_AGG_IDX(DT_AGG_HIGHEST))
> > -
> > -typedef enum dt_aggfid {
> > -	DT_AGG_AVG = DT_AGG_BASE,
> > -	DT_AGG_COUNT,
> > -	DT_AGG_LLQUANTIZE,
> > -	DT_AGG_LQUANTIZE,
> > -	DT_AGG_MAX,
> > -	DT_AGG_MIN,
> > -	DT_AGG_QUANTIZE,
> > -	DT_AGG_STDDEV,
> > -	DT_AGG_SUM,
> > -
> > -	DT_AGG_HIGHEST
> > -} dt_aggfid_t;
> > -
> >   /*
> >    * Sentinel to tell freopen() to restore the saved stdout.  This must not
> >    * be ever valid for opening for write access via freopen(3C), which of
> > @@ -828,11 +784,6 @@ extern int dt_reduce(dtrace_hdl_t *, dt_version_t);
> >   extern dtrace_difo_t *dt_as(dt_pcb_t *);
> >   extern dtrace_difo_t *dt_difo_copy(dtrace_hdl_t *dtp, const dtrace_difo_t *odp);
> > -extern int dt_aggregate_go(dtrace_hdl_t *);
> > -extern int dt_aggregate_init(dtrace_hdl_t *);
> > -extern void dt_aggregate_destroy(dtrace_hdl_t *);
> > -extern int dt_aggregate_clear_one(const dtrace_aggdata_t *, void *);
> > -
> >   extern int dt_consume_init(dtrace_hdl_t *);
> >   extern void dt_consume_fini(dtrace_hdl_t *);
> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index 5c922488..77ffb6d2 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -28,6 +28,7 @@
> >   #include <libproc.h>
> >   #include <dt_impl.h>
> > +#include <dt_aggregate.h>
> >   #include <dt_bpf.h>
> >   #include <dt_pcap.h>
> >   #include <dt_program.h>
> > @@ -740,6 +741,8 @@ dt_vopen(int version, int flags, int *errp,
> >   	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
> >   	dtp->dt_nextepid = 1;
> >   	dtp->dt_maxprobe = 0;
> > +	if (dt_aggregate_init(dtp) == -1)
> > +		return set_open_errno(dtp, errp, dtrace_errno(dtp));
> >   	dtp->dt_vmax = DT_VERS_LATEST;
> >   	dtp->dt_cpp_path = strdup(_dtrace_defcpp);
> >   	dtp->dt_cpp_argv = malloc(sizeof(char *));
> > diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> > index 997f11a2..2f7917a0 100644
> > --- a/libdtrace/dt_options.c
> > +++ b/libdtrace/dt_options.c
> > @@ -20,6 +20,7 @@
> >   #include <ctype.h>
> >   #include <dt_impl.h>
> > +#include <dt_aggregate.h>
> >   #include <dt_pcap.h>
> >   #include <dt_string.h>
> >   #include <libproc.h>
> > @@ -27,12 +28,11 @@
> >   static int
> >   dt_opt_agg(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> >   {
> > -	dt_aggregate_t *agp = &dtp->dt_aggregate;
> > -
> >   	if (arg != NULL)
> >   		return dt_set_errno(dtp, EDT_BADOPTVAL);
> > -	agp->dtat_flags |= option;
> > +	dt_aggregate_set_option(dtp, option);
> > +
> >   	return 0;
> >   }
> > diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> > index e999498c..21ec7411 100644
> > --- a/libdtrace/dt_printf.c
> > +++ b/libdtrace/dt_printf.c
> > @@ -14,10 +14,11 @@
> >   #include <limits.h>
> >   #include <port.h>
> > +#include <dt_impl.h>
> > +#include <dt_aggregate.h>
> >   #include <dt_module.h>
> >   #include <dt_printf.h>
> >   #include <dt_string.h>
> > -#include <dt_impl.h>
> >   /*ARGSUSED*/
> >   static int
> > diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> > index 69a86358..13483301 100644
> > --- a/libdtrace/dt_work.c
> > +++ b/libdtrace/dt_work.c
> > @@ -5,12 +5,6 @@
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > -#include <dt_impl.h>
> > -#include <dt_peb.h>
> > -#include <dt_probe.h>
> > -#include <dt_bpf.h>
> > -#include <dt_bpf_maps.h>
> > -#include <dt_state.h>
> >   #include <stddef.h>
> >   #include <errno.h>
> >   #include <assert.h>
> > @@ -20,6 +14,13 @@
> >   #include <linux/perf_event.h>
> >   #include <sys/epoll.h>
> >   #include <valgrind/valgrind.h>
> > +#include <dt_impl.h>
> > +#include <dt_aggregate.h>
> > +#include <dt_peb.h>
> > +#include <dt_probe.h>
> > +#include <dt_bpf.h>
> > +#include <dt_bpf_maps.h>
> > +#include <dt_state.h>
> >   void
> >   BEGIN_probe(void)
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
