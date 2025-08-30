Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16858DF76
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756525560; cv=fail; b=ddZdh6F+s3imE1wy7OGhfdmFgvDB8llJkCuOYfTdnKumAUjwTcsqRCh/IQKwd0uZc1Z6wv/RiH0PplthI+gSmUUDgo7FawrYN7ry2QLoNqQOFdXbp1wLApB1+50Pd6vHdfRnOsN6Xib1cWarcB8Y8SydwuRZ6Dj1G+Xx9OI+ubE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756525560; c=relaxed/simple;
	bh=8wutrqzchqiydqBrE48qaiL5N47qKdOxDUT1w1SITLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UUN0lV5LKzEAJdTTcWROoigPM1wv0bQKUAPxMlVc1vh4VJUYWF7WF6g62yN81YBjI7mCj/aR0fUSLcHeeda57d9h/EnyN2zuXEU7cpqOvayCVudhKbzS0E1VZ/nWhAjTs/KxrwW4ADwu6PAqmOaO6OEqmXLTNNurWKCwUR7OctY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LF2U3OE1; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TkFK88af reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LF2U3OE1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TkFK88af"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3cLVN016485
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=vgSK5bGrNEun2CVh6qt2+szC+8lGzU8tvS2qvpHlLeg=; b=
	LF2U3OE1/ayZiL9Ukrjn7zjFyiLiUVUCoBDGjPzIMMYB0pncx/pZb2Jk1EJoFkEc
	GlGqQNFvPYUzbkEK12ChUYRcjXYThYAPWweDjrqfNWg++iAhJms15tajdlJDgB/m
	mT+vxKFN8i9yye6eDLcKWlam0lfEgnYngA5Gq7t6HoiN3OhrgUwhpNqnI9c0zflX
	6noCrrFK1Zrv7xrQlHjWCV7cFCSwyKAv9EBJiUmMCUmJafHfdhYIcduT6J2SPpxU
	Cx9lymUEZp6+Yb6Fj1JRQSAZVI4QRJ6Egz1BvmXmhTIoiFdWUubDeP1O4xorkJJv
	EknQuLudzFqK2uVGv4eScw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48us6980ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:45:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3hoPY011741
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:45:55 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrcj2s2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 03:45:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNpdo3AQzuGdvxnqdUslfeO9AnygYDQV1sFTt5IhQ7d1SD64H4xU5Qhy9rIjXewkxUto5jPmRKA7q8h5tAQM94U/nsabxcYna4azGv4wjhOUDsaFcqS4gc3zaWIBYAUlcZ7/94P9sqIFin/uiiyj6M3T0/ug39nXSr5YKRYo1DbEkDjAh9hyhM4EkEkiOKVoFTd7eofS1UpTYmRZU+yJk8xZUBY92f/q4Gg+Nd+79NNoB01I1Ng7VMnypJ6ZdwbXDaHzPxLp7X/9WlWkrPQIYNuop5x3lU/IkARQmMgL3LORLn/zcAte1gNTcVU02al51bKxLm7exMXLrYhdtONoLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yObhj6wVrFVUg2vHGeMj3F8cgXChRFy69IaC4DKeJ04=;
 b=TPpck+TI6ZAet22tYBbuqwcJ7yqBKguB77IxeGC3VRx//vmbRgdWddOlbT984ZsAk+B/0KFzqlek1YN18Gn+NvdGJazSLAtyDGdWu8gDUWLQx3jW5oXBDwzzM3pn58YsGgeNKEuLc3lN5MxMAf3Tt9wlHIeI0w793gRAwfIzzZ7NJlkUVLtnu9sN/JhBzwJM8QFhG4nQioe2nnZXYU/880FHhDn3BDjgVy4s13UHMfzBU/AJblGX6SSPvIP2J/9c0tkFDffIQ2PE/WgsbF0CELnebfD1bKBSE1rDeaVFGB2Pn83N/22ONGc92NhcB55qwAXpG2ePnfFse0lq/qO93A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yObhj6wVrFVUg2vHGeMj3F8cgXChRFy69IaC4DKeJ04=;
 b=TkFK88afH7UTxSK/UMWglcGr+BOjsUIud6mgSQB2c7hgerFDKN5jYCH6DZKfFoKPgmd7Jc+SU3nVrFOflgwRh38HuCVN3VKkQJ68y6ta0O11KavONr1Es/vseF9KnlC2XJ0O2O38+yASDHB7pacvOP7LudX9cvmic6l5UHFk2jA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS7PR10MB5023.namprd10.prod.outlook.com (2603:10b6:5:38d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 03:45:49 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Sat, 30 Aug 2025
 03:45:42 +0000
Date: Fri, 29 Aug 2025 23:45:39 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] trace: print alloca pointers as actual pointer values
Message-ID: <aLJz49VC54M+QLb8@oracle.com>
References: <SJ0PR10MB5672B1B0CFC6BA287D97C4C5C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <02e33d7d-be6c-5f18-32e1-92fa28e0984b@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02e33d7d-be6c-5f18-32e1-92fa28e0984b@oracle.com>
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS7PR10MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: e0bc37af-faf1-43c0-c953-08dde777b1ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ngDaBH+fvgt9FvIDGAkQCDQq354yU36Yv+ee7FiI5nmt/cNIDMx2JEeMZC?=
 =?iso-8859-1?Q?zbdJND2nfa6PfOnraIAh2r7z1EOjZHpmhypsp2ROxwJrhGZXlrCDKvzmEY?=
 =?iso-8859-1?Q?i0GavsijyDFDXv4ddv/XCdl3RlJYHOZ6uCrBMKH/yJogXdACLDxERFYMUo?=
 =?iso-8859-1?Q?yEYmbaW4ILP/4d0YTBL3VzhuL6jpCPV+yaufb6WHplYnGYihxD5yYYfHcs?=
 =?iso-8859-1?Q?ulxB4ihMp5js+2jabST5AhqHf3K22fi2bNhRdjM8RcM9tudtSdc5vue+iV?=
 =?iso-8859-1?Q?yqlkf7NkjKE4bNsktg7nbdoi/aSSnrk5EMd4JV4CTx12xzyx5ccxxauMf0?=
 =?iso-8859-1?Q?1M0YJOzpusZUM5m0bzymIEV4q1KTblr0ncPP5lKTTBvoGaQrRN/orjViKO?=
 =?iso-8859-1?Q?/Gi184sGu1YmpIaygah2Ae4lil/lvrQWSNUaHotusV+UxTL8zxznHcRlRG?=
 =?iso-8859-1?Q?TnbD21VUWT35OTcFK802NmJULQZxIrZoXmXtBQLvCriUKEeaK6kWjkXtFe?=
 =?iso-8859-1?Q?VVlyCMrKsNbAe0v5jYOMqskuG96eqGjjmEiqBYD1t58FhsEf7zwmbKFtex?=
 =?iso-8859-1?Q?Xt7lP0P6vRRK2kdO65Yufkfk3hOAfqLPiBcgkYS2GGfUdZeDEcq5ezq5nO?=
 =?iso-8859-1?Q?MTDz1acnndl24EjZln1wnqIqeKssxQUfzFodhgcesA9hsAcfJ3OfIKURXO?=
 =?iso-8859-1?Q?IGHQNhfdL3q4OUE0TqpBpdW6tIbrZl+EqK/gd84leQPAWhL6bZ02GJ8JUb?=
 =?iso-8859-1?Q?ZH0+lm/QPy6my3Cj7mWzSgKh1YwUE2891jwYzeBQ/GTSY7JnTLT6o8h9wI?=
 =?iso-8859-1?Q?U1HkUPQ7dL+T8Q9Dxl4a8/yD+GkaZfOvjwpogvK2+AYt6fTJkYjtOmYdtn?=
 =?iso-8859-1?Q?Sz1JSD2UVUbQtiS08q2l1XeMULH7U6Ey55Tqk4ug0gwOsWw+13r8BXijVc?=
 =?iso-8859-1?Q?wtuMGi46Ra2VFnIXhAGRRzpsbA3ZJz6X2tv7wp1VlbiDa7uCjXDVQUbfAR?=
 =?iso-8859-1?Q?CjCvuJ4JIpvHt5zmr4d9Zlb8Adbzd2wZnfceePPG9k/f4UoBfKuiG4X+6y?=
 =?iso-8859-1?Q?PUe9exeCfk3Wb2fV1IrkUmUsl9G9HaEvmIRZ03pWxvj1HXCrd1hnMVSli0?=
 =?iso-8859-1?Q?rjn6z3yrNUPIHi7MoZohNPms/wqG9D46qhuEUPkOdzGD7DVR/z56yrOdBE?=
 =?iso-8859-1?Q?wdbsaTyWHMi/1oGRxDRWPMNy5plk1MFEihOEwqM2l/RxBHHVfgOB0ZVjvc?=
 =?iso-8859-1?Q?aOMvX9hznslL5qWgKGW0hZWXDdqVmgTix0YpiOsVR0W2XX2XVK3SFQHB7V?=
 =?iso-8859-1?Q?iL7a+keLn3oZCSWyzwWk6/hQ0vNjAMDFMWjH3ewiObdJfY9fqndbqxAVsB?=
 =?iso-8859-1?Q?YEeyfF7W9Yen5LWZEKttKDk6aefVNaBqmzomvp/88vkEwj6NuHr4CdXXSU?=
 =?iso-8859-1?Q?accFXCRi9oGxhxblDsXntfke0l1p6JfZ/KuMCjF6DrZgdn1YBA3lHExhkC?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?9PtKD8O3y3BkzC8votgexvMpMNFWu1PALyl2FOPkdBfuxd6+PKsJZSGFZo?=
 =?iso-8859-1?Q?un1e8SNg3o5iOVImtFhnB83OGPCId15Np4k4d2+CyFODAkvp0J99VAy367?=
 =?iso-8859-1?Q?QBQHAGlRSSK6ZL+TKeR/Y8sGdBxU5PDXb1a43/XZNWAkvM0jpqVt+kN/uF?=
 =?iso-8859-1?Q?z/GpKaYYwDYz/bcNW2c8cn1qFzrfR9XU9KzxRe2l7PKfTTwqgtpoplTF1t?=
 =?iso-8859-1?Q?gHWXrmReQUw1yiW8EiNaHtmew1p6Xf84IyT69uyvBtUfk2Z4oVaeK9Mr3G?=
 =?iso-8859-1?Q?MQYfCBJOU/P+rYGzQOJtQ6oHcZgTeVwsPS0dtalVM+8QfvOCExkyfB8QpT?=
 =?iso-8859-1?Q?oPj5T1WoqVIPgYvnVNzlrkeKAho0Q5voBhvaWqOnB5U7teM6sgiSkZFYzn?=
 =?iso-8859-1?Q?n2dI9sdQO52+AS7pd8OBH4d3kzOWSsPIjQcRyjsDE1+do5XwEMx9EURmNn?=
 =?iso-8859-1?Q?YkZVU+mNCFolUqw+BgGeHZnv6niSea7Zeb7s1zzr4h05aMokmx18IDMjy4?=
 =?iso-8859-1?Q?z/Vax2HlENGVOw44TSClNhY+lHVC0BAM4vllXaTxFuJsT9s9dTCikglu3t?=
 =?iso-8859-1?Q?6hXR4HtTM6eyt70R3hAAVwhqrLsb7xaHdGqWi3j7l4qB4a4fGLCel/fjyf?=
 =?iso-8859-1?Q?v1ZBB1JOSSniDG09ezeJ3Ur1mgp3paebey2diXYXoCW5E9bHsZ67AeKZ54?=
 =?iso-8859-1?Q?Y5cVlz4xNzSP5ZMEF/KHQt3MT+pvdBfOJFZ0JtNMXY1iZt7YezhH/djZr/?=
 =?iso-8859-1?Q?HrdvCIbjA1KTB4CCBVoP3pMA2CycZBuT0D7ccCC6y03AKQIJAR85PmZds4?=
 =?iso-8859-1?Q?m+/nyedh0QJ3l2pNwPXmv3v3l2JI/ox2CUHyPVFR4EVEvsEk7DSxHhut0D?=
 =?iso-8859-1?Q?a8BuUYqNS/5LzRDg3+ShliSCfzTFYA48eZu6AwJXDT3hO/px7DNwUpDZhn?=
 =?iso-8859-1?Q?14IVcUFYvz7oTL7ZleubpBltYyPtw6Bb6dFie13AKmipMcjQF//ITpUj62?=
 =?iso-8859-1?Q?RsqaxQyi+Vqq6el7G7tEjDcy+D3hFVbWIIWO7ImsPXUdLseQt2ZbsnYG4y?=
 =?iso-8859-1?Q?gs+NFQbz7tgBil6cajLYkEh+CRMGQWeo/TnZa6NVMLYVBaPS6e0XmU5RYI?=
 =?iso-8859-1?Q?H6hwttYiOBRO9RxAQLbtNu7OLm791ntj0Vk08hzBNxIjN+BJrmbJj5VSjd?=
 =?iso-8859-1?Q?gmzQpbH/BEw/ViFhcFI6R43ZJwLqEYE7wtCbGcE46A8ZYo/6TY8xS/z73R?=
 =?iso-8859-1?Q?rUub4QmfOVRclbkmaBmP2vWo/UFf48yUiw7x4iWnvksPOH+/Tlvsr4ArD8?=
 =?iso-8859-1?Q?W6Bse+0S0KaODa6rlH+HPR0NdAdgidM0MTcCC9LUI8LTS2TL3RbTb1HqCq?=
 =?iso-8859-1?Q?oq1GSm4Dg0tJCrSU4XLk32bZ4HwgJtlULBwdA5Z/nR+mfUeVYYMVJraJa5?=
 =?iso-8859-1?Q?KG/wL2ljN4TXWNTZTcEzuQYp2xXl0ABOnobef4qJjGhZojqQZf2kahNceS?=
 =?iso-8859-1?Q?dn5KeyeBGp18WojFaB3mR9hMj/xawgvjeHRbSsTIr7hZErXTnZKu278Oye?=
 =?iso-8859-1?Q?gkk44htFCgzbeUrJWkE9dmFA65P93iuxVat/qR/H7O9Zwl4S8NrdgljbA6?=
 =?iso-8859-1?Q?EOH8mnE+PFeh+2Tz9SC3ZtuaAw2NXBD9VvizCNH88ZWcPz8wuGCJc4dQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mS9W+5PWSiq7zHjQdVDLEK9N08mpm2WjsoBnsl1J+Pwt+9RkKDt+nl1FlSZnwJ1RUYJKNUOiFBkAs0VDg/ilqFHgC80z66m1ui4wRjaxRUXbaP+sHzvoxwFgPzcHABbFwU/ETxuH4D+MPn7Xar6TN41bS3T2d4XLpyTJh9BvKUyw+kRikc2m4KrQguqNkAhNYViaGtX+UgHii3NWkhC6tHGddJfv7axg2B9IwqXfFXhmkYN4bxmwGC3M6FPjyk6zNPipUFwjwTO6Mnd1NBfYrX1+qxIcHgEhFN0sn7zp5JLTT9kb9X0jmAPtoN08rBGMhIqRLxwWM7+m8LoLzcNyS3oT/f7TmcfZKg6PwNyje0glJLdLAA8BwML+fhs+ISbkNmVhRYM8fjCsh4oRNGxcMLvCyWRx4DQNDX9Hn+zx1tpfUm5BiwW5lCu9IS7pwrVLkmeoPTjbhYyO+X/FXQ2O+DUB+1lImcmjQcTl9yeYvqZdB7XGzh852S18TGgO7T9p91p1Z1hYFilifj1ETaGiQDkywF0Yjj4UsaChqO0kdD2SM+KW6K3hXGjbnypr8+oW3glUbDidtEF+62+toij3EudtQsxTm7WhLmfuKRskd9I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bc37af-faf1-43c0-c953-08dde777b1ab
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 03:45:42.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGC0vuS9yokPK8YSNUBr1lH8D7BKTW5iz2i5BlPdB2H8APKHdH3iBh6JlReQeE+W1ynu3HiY72K9ZZ1vcQ8dqkqO9VFKlRMQnDo1WLrNvMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5023
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508300033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyOSBTYWx0ZWRfX6N6r62Af7Rfr
 w53dSqiwotBapmttwohxFdxrAqNh2ijFlMXfq/ZTEJQ7FsK4xaDwIiOUTOTYqiL0Z0gxaz4APtd
 /vCquy/xb8r8hm4mwcrykBm+Ayn2g4a496rDd49yIO9vZqb1yq+D9xbDCobWh5f1JnehKnxLb+F
 be7TQforkIu4ulQU5trt7mGuWAy/SmpbIRgvhhrsytNxlqwYs0SVyuwo+le8QgDuJAgjsYloZFr
 Qjf1cAO0X8BKsfeWv/ST60+54KPUuO31+9p/DC1HbONnMYIaj73fLIctcFNKqSAiCF+uXdE1ZLn
 Le+3dR9uB8e97JOc4hndyEmwpeL8DCuEQg1CpxNbQELapOEwmWA0o5ydkOFDCtD0x7V3+w2k3oJ
 NWtfbMltbqAXihle+1Nv0JAAambDdw==
X-Proofpoint-ORIG-GUID: QC9U1YwY-AmfLsoIcIKbbSAJL3g0s378
X-Proofpoint-GUID: QC9U1YwY-AmfLsoIcIKbbSAJL3g0s378
X-Authority-Analysis: v=2.4 cv=UuBjN/wB c=1 sm=1 tr=0 ts=68b273f4 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4ZGanPWe_dUP1wXYHT4A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12068

On Fri, Aug 29, 2025 at 11:20:47PM -0400, Eugene Loh wrote:
> On 8/29/25 14:46, Kris Van Hees wrote:
> 
> > Because alloca pointers are stored internally as ofssets into the
> 
> s/ofssets/offsets/
> 
> For the test, how about converting the trace() to printf("%x")? Makes the
> script a little simpler and the hex output might feel more intuitive to a
> human reader if/when it ever comes to that.

The reason for using trace is that it is the most basic action that calls
dt_cg_store_val().  That is what we are exercising here.

> Most of all, the test fails wherever I tried it.  I think the problem is
> that the BPF verifier doesn't like adding a map_value pointer and an
> unbounded value... even if we do not dereference the result!  So, in this
> patch, drop the DT_NF_REF checks, instead calling
> dt_cg_alloca_access_check() everytime.

Ah, tehe joy of fixing one problem only to uncover another.  Dropping the
DT_NF_REF checks breaks other tests.  I'll have to see what needs to be done
to ensure that all tests pass correctly with a variant of this patch.

> I wrote a longer explanation of this.  Here it is, in case it's helpful.
> 
> The BPF verifier complains something like this:
> 
>     [...]
>     r8 = *(u64 *)(r10 -8) R8_w=fp-88          r8 = dctx
>     r8 = *(u64 *)(r8 +72) R8_w=map_value(...) r8 = dctx->gvar
>     r8 = *(u64 *)(r8 + 0) R8_w=inv(id=0)      r8 = arr
>     r7 = *(u64 *)(r10 -8) R7_w=fp-88          r7 = dctx
>     r7 = *(u64 *)(r7 +40) R7_w=map_value(...) r7 = dctx->scratchmem
>     r8 += r7              math between map_value pointer and register with
> unbounded min value is not allowed
> 
> So what has happened is that we assign r8=arr (first gvar), whose value is
> small since it's an alloca().  Then, we go to the new dt_cg.c code:
> 
>     if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF))
>         dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg, DT_ISIMM, size);
>     dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
> 
> We do NOT call the dt_cg_alloca_access_check(), but drop directly into
> dt_cg_alloca_ptr().  It allocates %r7 and does something like this:
> 
>     dt_cg_access_dctx(%r7, dlp, drp, DCTX_SCRATCHMEM);
>     emit(dlp,  BPF_ALU64_REG(BPF_ADD, %r8, %r7));
> 
> Anyhow, that last add is forbidden, because %r7 is dctx->scratchmem and %r8
> is unbounded.
> 
> I guess the problem is that the dt_cg_alloca_access_check() is not being
> called, and the BPF verifier doesn't like that, even though we are not
> dereferencing the pointer.
> 
> Maybe drop the &DT_NF_REF conditions in the new code introduced by the
> patch?

I think that is more likely that we need to scalarize the alloca pointer if
it not a REF, so that the arithmetic will be allowed (the verifier will no
longer know it is a map pointer).

> > scratchmem area, they were printed as small integers.  They are
> > now printed as actual pointer values into kernel space.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_cg.c                          | 19 +++++++++--------
> >   test/unittest/actions/trace/tst.alloca.d   | 24 ++++++++++++++++++++++
> >   test/unittest/actions/trace/tst.alloca.r   |  1 +
> >   test/unittest/actions/trace/tst.alloca.r.p | 11 ++++++++++
> >   4 files changed, 46 insertions(+), 9 deletions(-)
> >   create mode 100644 test/unittest/actions/trace/tst.alloca.d
> >   create mode 100644 test/unittest/actions/trace/tst.alloca.r
> >   create mode 100755 test/unittest/actions/trace/tst.alloca.r.p
> > 
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index cd9e7f4e9..7af3dd44b 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -1687,16 +1687,17 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
> >   		align = vtype.dtdt_align;
> >   		/*
> > -		 * A DEREF of a REF node does not get resolved in dt_cg_node()
> > -		 * because the ref node already holds the pointer.  But for
> > -		 * alloca pointers, that will be the offset into scratchmem so
> > -		 * we still need to turn it into a real pointer here.
> > +		 * Alloca pointers are stored as an offset into scratchmem, so
> > +		 * they need to be converted into real pointers before we go on.
> > +		 * If the alloca pointer is a REF or ref-by-value is requested,
> > +		 * we need to do bounds checking before turning the alloca
> > +		 * pointer into a real pointer.
> >   		 */
> > -		if (dnp->dn_kind == DT_NODE_OP1 &&
> > -		    dnp->dn_op == DT_TOK_DEREF && (dnp->dn_flags & DT_NF_REF) &&
> > -		    (dnp->dn_child->dn_flags & DT_NF_ALLOCA)) {
> > -			dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
> > -						  DT_ISIMM, size);
> > +		if (dnp->dn_flags & DT_NF_ALLOCA) {
> > +			if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF))
> > +				dt_cg_alloca_access_check(dlp, drp, dnp->dn_reg,
> > +							  DT_ISIMM, size);
> > +
> >   			dt_cg_alloca_ptr(dlp, drp, dnp->dn_reg, dnp->dn_reg);
> >   			not_null = 1;
> >   		}
> > diff --git a/test/unittest/actions/trace/tst.alloca.d b/test/unittest/actions/trace/tst.alloca.d
> > new file mode 100644
> > index 000000000..d2ff5152d
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.alloca.d
> > @@ -0,0 +1,24 @@
> > +#pragma D option quiet
> > +
> > +BEGIN
> > +{
> > +	arr = (int *)alloca(5 * sizeof(int));
> > +	idx = 4;
> > +	arr[0] = 1;
> > +	arr[1] = 22;
> > +	arr[2] = 333;
> > +	arr[3] = 4444;
> > +	arr[4] = 55555;
> > +	trace(arr);
> > +	trace(" ");
> > +	trace(*arr);
> > +	trace(" ");
> > +	trace(arr + 2);
> > +	trace(" ");
> > +	trace(*(arr + 2));
> > +	trace(" ");
> > +	trace(arr + idx);
> > +	trace(" ");
> > +	trace(*(arr + idx));
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/actions/trace/tst.alloca.r b/test/unittest/actions/trace/tst.alloca.r
> > new file mode 100644
> > index 000000000..e9bbf2f5d
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.alloca.r
> > @@ -0,0 +1 @@
> > +OK 1 OK 333 OK 55555
> > diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
> > new file mode 100755
> > index 000000000..8515861ad
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.alloca.r.p
> > @@ -0,0 +1,11 @@
> > +#!/usr/bin/gawk -f
> > +
> > +{
> > +	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
> > +	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
> > +	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
> > +}
> > +
> > +{
> > +	print;
> > +}
