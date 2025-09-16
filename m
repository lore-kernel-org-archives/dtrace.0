Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9232184E07
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028659; cv=fail; b=X6eihjtDg14MKhe5Dse6+8lNxvWyH6po0dWzbP+WEtXF/9L7s4QC/bjmfS07ZneBl2HHH1qnnBsWPlzM1TebtzUspyMpZUlBLu4R00IKv6DcYPts5g45yE1utumukfa8v2z52dhGHUaeazOl3emUYA81KQlJruhLulA4hTz5fh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028659; c=relaxed/simple;
	bh=smNaDhfqGZ/IW9ICgpbb2ZDmiGbNy7OKii0rhAFG/cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LG4YTBG8oYm0XdPI8IzgOKi/uSy0pcQrkaJk+jFYbo1Rm+3IkLVSGFHidVTmeM8x9dspNk/IDu8u7gZXcHtpcc1s882q94p4VZVfiAoACNskOJyF48IMrp6QEU4Ueppo/WO83AAROTL5lUwrl5QORIz3lEtQTSjnzrSIrdyZK+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=anxV6zI/; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qZnssg1H reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="anxV6zI/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qZnssg1H"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GD2gqI009952
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 13:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Rm0PxIODiWgDNs+ZH0VVwrPPvl+UBMwHiXRywtjSQvM=; b=
	anxV6zI/TV83QbC3IdOmNPcNBLxNYMvhpEr02r23oi/rxG0Y3GZ1RFBZvTWpiP4U
	GXN8tWkQ186VjPkWn6vacFPZ01m/F1E82o03EFqaWKngaSrslBkFc4Suk+w4j5ZJ
	VnegxBmkpp86k39DX/MZof08WDY/tHxkiWJQbPSXaVBJmf78EVkfF6/xvJSOZIeC
	zNey9d5hkH4izugSEKFw073qtIgNckuB38w+zGEmKmyw8dEDcBOX3IwyKvXZTCO3
	nSftRUpIjxydJaJDYamZwqdStaUC/G1syEVDY/3i6vZVApf29vONwHRsM+tS0oPX
	MXcx9Y7nUKq5nipH1/wz/w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4950gbmjwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 13:17:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58GD3lNc035137
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 13:17:35 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011069.outbound.protection.outlook.com [52.101.57.69])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2jnvkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 13:17:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ck9P8RsWsxkcu3CxBskBj4qYgTHRjnpjXp1NQ7la/G//vKB29gUdeS7+tdLfHAUPdD92DyH5xrcJ1fWFkwP70m3RN8H7C1HezYa3C/lhq4Y2kykl/FhzXPGp8ceojShP81gvnMvxxvotAKlZDR6attnXvS2VOymW6Vf8sxHYFY68KKvHX1JpnRNQ6C0yVULL5bSM400Dw/8eSLPo2BOINgaTrLWLOoeLzAbvHgC03z0zhUiLLnb5DWqFY7yGJTTRgEAL3mM9Vk9r5bvmIezWEbcKeSOg5OBWDVa7W1omAAzmt3/Xv6+w+H5E/AWkaa7kUkoK3la202q/wbpn92hGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpQT6yMoRVFRF6Ja3IhhorFTlaX+/eoXu2ceetiM1/0=;
 b=H53YIsuXY7AVWn2RNBwT3irO13ZErrt0mQGZQat57LgfA11P2ZWREihcTpEcEdVNW8L+yKh2rXg7YmVD2nOxeTNKesRYpbbHEypq+oxCx0s6Y4HATEN8MQq1iIN7fPqbfD4mk0wrHoeTLkDk7qEmmTa7cVWrN3vaRHaHBoi6nFZSwKd+DNka09zzDzj1S1TWgdX+Ii8eF8oG5v8yLllhLiH3B8R5nISMReZa1hwuxFEhIGbGabJ0vk1mHh6eKMbukF9t5jlbRfHsvJxxbF9f+womHIzhA9poxBunTz1F/CQEW/wtTDmL016W4UG9fJvCVgH0TWNMX7YCFdMyojRW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GpQT6yMoRVFRF6Ja3IhhorFTlaX+/eoXu2ceetiM1/0=;
 b=qZnssg1HEZ4IjOV5mpUoFbgXvYu6vKAcWN43YBZQiNqQUDXj36giQIkjhtojs124Kh2e3hxPpt2esxwRudI45R7Vsk+GuzvgqBLm9SpIhph11vayMG8O0212LfD/G/2FNnPHXfOzWeJ/p1la4Y00N8H5+nyA1HB/9cbMtj4fvTA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by LV8PR10MB7749.namprd10.prod.outlook.com (2603:10b6:408:1e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 13:17:29 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 13:17:29 +0000
Date: Tue, 16 Sep 2025 09:17:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v3] trace: print alloca pointers as actual
 pointer values
Message-ID: <aMljZhoquVQGtvRB@oracle.com>
References: <SJ0PR10MB5672162D698C139186ACCDACC215A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <487cd783-80c1-e037-0c28-c2ff94364a9d@oracle.com>
 <aMjA7o55OLI9cATN@oracle.com>
 <aMjXfFOSefOzjlQc@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMjXfFOSefOzjlQc@oracle.com>
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|LV8PR10MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 07bef21c-deb8-4bf8-1506-08ddf5236361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?xrQ837/iABYcLmDooZ0s9yFGj+3yhQzhW8Q1EAd3OMdTL2CTyQWxD610rY?=
 =?iso-8859-1?Q?chJqZy8Jej5vULNLkZHEFUj8JHRyuMnrb+wMJQefhcMy14xRh7C744vrDb?=
 =?iso-8859-1?Q?6qg0eMnSKgkhyWQDJCi2WXqekD/ymIFa2P171ODC7t+jZky27IQg3UUZJy?=
 =?iso-8859-1?Q?FsKq2o4dSOIv48eNi4nNBHN96cZsXzRb3d0ruNGzHoQwnU/cCuvrhaW7pD?=
 =?iso-8859-1?Q?ougSej6bkdqp1qPflrHrF0ll7SVqNuV8mH0koX2DHuj/JQVN3pq19924Wl?=
 =?iso-8859-1?Q?vLTIHHdJ6jSXsebPTOZl9LflSUyVq+qpsECE/kLei1V9a0ixn6zjbzHbEX?=
 =?iso-8859-1?Q?VchYWknaGBVGc2hDjXBDnXg1PIC8c+aXYMmTqLc3UoDp6y7k09uQG5mvZE?=
 =?iso-8859-1?Q?YWy7OwNpLY9/LRY+6KnuX2q+P+LOLQnIP0xMUuXjovZVsgvO/9X+XSb25f?=
 =?iso-8859-1?Q?V2iUa4iunfe4r+/KKy29y8H7N+KdnXBX+3hGxu0eGizviSNG7NPZKyC/xr?=
 =?iso-8859-1?Q?rScOa4Kv1AIJ8F7VMEmeIdrLrEMXV/1APw4/RZXM2hATgPkT9oWiZYr9+2?=
 =?iso-8859-1?Q?oLPDyFvWhjhQ2W2eTSA4KZktKhGhVE3TVTcL9WUK46gMJxXx+TKuNRDFSF?=
 =?iso-8859-1?Q?q43zLMjPshVn2D8KtXNu71zr710ePPsvkDHEX0eZ1aYqACQaO5sJbv0t/Y?=
 =?iso-8859-1?Q?WkGn1ASIor1/FPuXbgjjQykbVuL7pVxhyuXaIersX0si1p5k8Lne1YqdsI?=
 =?iso-8859-1?Q?bgHmaW7Jnw44Rui67CNYFEeOoo3ri3dwjOfavZbvLWQ4dna1V/Z5M0FkoM?=
 =?iso-8859-1?Q?7RX8KwunKrlckiw6FjTWVmgsKmGwalgF9FjW5f/HfV0Ot3qrYDXApMwyrP?=
 =?iso-8859-1?Q?8DtGJeiajty8DL1c0oandj10T05y4IA18dUYK9e+u/noXOMluR39EnQ2AS?=
 =?iso-8859-1?Q?m2pb9VWg3RjsG1r+bA7jkYlz+E1j9HWX1lMRJ5asmKyoUYdTpctF6/aomq?=
 =?iso-8859-1?Q?BzOpX1YpOsKjwdtmjoxcb4FLBhBKXelZ8BGlCypfe7WCZHtWPOm9dgMCDm?=
 =?iso-8859-1?Q?IvBFEUUlAKwNbEB82ZvPPD/yjGPY8ymyzx5ytm9SyrKYyNp8FGQ3eWGTiQ?=
 =?iso-8859-1?Q?/MbnV2ZbL1ochtY4i+ZpSK4Rx2i6SGA+drTmov4Q40TYzjQqL2ehgt7GpN?=
 =?iso-8859-1?Q?tXlT8ck0OzIfT1sgYCBliq3n4c+69lMdhY2UJLbhzMtlvcpmYtj48CCwkk?=
 =?iso-8859-1?Q?4mJsy0szoUL/MsAV3DYJS7BCrG2DUvsYtxuwO1rOb7LCM7t5M380orCkcy?=
 =?iso-8859-1?Q?3ytT/rrTtvWTIXJt2useGwaDsoUpkezIGk66PPV3h+tdx+GVTtnxjyIkWT?=
 =?iso-8859-1?Q?cgp5BEAeo3/KXyiaj2myx0ayizRAw/ZatxlS5UUojiFPoHPd7BedBHagMQ?=
 =?iso-8859-1?Q?M5bEuJ2WK4Q7banhJASQIYkw/ZAN27Yux7epqC3r9cu0RLuhMTiKGaSnPy?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?lwAgfuEBwPkukvmlooNfbv6FOuZ0y2MLxJGXcRNbFWNj9jSIY5n9C+vCQM?=
 =?iso-8859-1?Q?+yYcF5lhwiBHr6wVY2a7REDJsmp5COSkMWqoAY5b/hpzPXf7vXQKy5Lkz9?=
 =?iso-8859-1?Q?6Gtr8gYMwSyoLbOpkhlWVHygfIpYCs2eeu3HL1vWAJUSF5HXIJd/uRc6jM?=
 =?iso-8859-1?Q?mpHA7SIhmjr0I7soD5TJC8Rgd/0IacWwMkY5ZeBMImnVo6mtpB194st8YQ?=
 =?iso-8859-1?Q?eK3cnWBdb5mcVdqNtuK2bpOVqDiVaEVumrJYCpGGNxuzbujNood1lpy9Il?=
 =?iso-8859-1?Q?lkAkNzPyZRpkOrNZzZ6/n/2nnw0P3+cIurKoS6er0uJ2DyaAxy0ZQN+aIE?=
 =?iso-8859-1?Q?Iw4WAB/zayKr6b+N5N7Qnxy1q/mQTRH4tdIDa5LD4CWq4hLbbA4W0AYfC5?=
 =?iso-8859-1?Q?lSS1cn6MRfxJPllVjhL/RsoCHKpLivfA0L8XL5uM73paQY4s91C2igMET7?=
 =?iso-8859-1?Q?S+sgK3sjLDFd/tiV1+P7GfTZ7Ws+g1HxMsZPPf+j4Gq4oQ60e6Sbt0+/cM?=
 =?iso-8859-1?Q?kUu3RUVOYdYuWAIOJxqq9zPqa84X1b5VAoTOjA5Ju5rcM6E5eEyCi+Ekgd?=
 =?iso-8859-1?Q?AbX9CMUdaY/D3cPec6WN1SqWSXJbg+/tShIFTyhZcVX+llVIbSExeLy2Q/?=
 =?iso-8859-1?Q?LP+QMO/FhvxYFG5s43WeCm41HnDSEimKu2u6nK8WrP60YuT477VXxlzCw5?=
 =?iso-8859-1?Q?HsOWpT+j6h6X+wWZlV3PLTQAVD14lXeCo6Xzukc2lyLGR3/tHBhPCs81Kc?=
 =?iso-8859-1?Q?Xhw6LOS1AboqYNSKfG1oKzJ7Zl61NAHC6fl7R+Dsj5whmc5OndV83Kn2bm?=
 =?iso-8859-1?Q?96ybwEzjQhBV2HZfkhc8rNs6CU3P/qwLmzrW65igHfjWcMjcKsZobvCCuP?=
 =?iso-8859-1?Q?ywUMa6sc1QALY11goL0l6HE6KgD1WoKJBGVn/4LGfmkE0hq1PGrg0FiW0L?=
 =?iso-8859-1?Q?tckM0MN2aq6qdix2IH7qeWnMHWglgse66kzqvpS4Vax2HdWDxeBf6HZR2s?=
 =?iso-8859-1?Q?Aq5YEez4XK8M0f2t+vEeg8FiIr/sK+6HG7CSX6HOmC9W4gyg1i4f4QmtOj?=
 =?iso-8859-1?Q?YMcov7HbB03ytpaJUjkHqivI/cuTBQ/94MEJHmC0s52g4Pd1JoZRHuMv29?=
 =?iso-8859-1?Q?yisbQD20gEUTdry/MPAQcutMiepgBme1CxuMDX5NPuMKG9jQB1cwkMzezn?=
 =?iso-8859-1?Q?FiIJWUK96xhNybXV+wR3BK3Oc+Ij0QfnQfQ4Pk5AFZKwmFtasny+q6CkmA?=
 =?iso-8859-1?Q?vjET92zU49Ikez37mBBoA4DNd37wZDMX6sXAYzsf6gxpw1SLJw/yRknLLq?=
 =?iso-8859-1?Q?dQ4aeuelWvMoTtpY8B2QBsUBhCw36cUOnApFqzRpP59Vlmlx1pjkUdo8HI?=
 =?iso-8859-1?Q?BYyk63Ldf9g49m+hWvwLorYHM5xxAZTWWLUCUYpHvkoB01xFJO0szIu1Nb?=
 =?iso-8859-1?Q?e3qd9J4zwCMOfuKjoWwTIh+ZQ1+/Qq5b6Q/zcOj7FyIyQg385r3wu9U7f0?=
 =?iso-8859-1?Q?h6kZD66bhetZxl1pvk7evYRldLIZeelj2AtasEcj4fZUMvjMOYAbSKtBoy?=
 =?iso-8859-1?Q?tlADcLd3/LR/Nz9AIC+5CldpjIDRiCS0e6c7eX0pIrZ/BR0v0KjY9mZtZb?=
 =?iso-8859-1?Q?fUS6yKkG0tcxqT+PFY/BQWg1ABQym2PRHw/6ge+tktpKgFY325rVw8rQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ccSxl3H1FNL0p19Vo0pLaXJ7dZ075Syby0Ez50Dp98/u2ysjbpki9OYQAh0HNYRZzn18xgoKxv0/5A/O6HMXKgXAQBPjvCICKwKFSLG0Yixj6pfIOEfmjl63qQq73BHwilIhO021VU7vcuwUlWqAMbg178uGU0k926yqgF+fqLS0JwaEoS08eS4229PHg5HJMd+q7b36SRTgcb+41wswyDBaaN6L01S01FS1vIRgf3q7Da6IRjOUVzYQG5LRrsL0VWAYzdBb7F2aGiTG7OHy2AwyjGvAXxGzSA6F5aeSMTTR0LT2O1XbOplsfsG4WakVoB/E1kxqt1BYqP30k50PvKh2JZf6AUQLk5jzehMXSAc9FJ1+bORedmRk6HPCMCEV2I9O5A0+ETwetDjn63mLoij5aNsJOTjwpL/L+g0oOVwFh8W5aMxa530pX8L8/eHztJ4i3CXHHQRPidaZL5r7c/MVGg/FR++aCl8IFvZeClP3B+PtLr8o9dUvgIAE5KXVCFlISj+fNP3vHB+x2FIsVSRSMz2PwJO3z6B+vOWNvyp3lrTRtT9E1EAf69Gxm8ta7XVAfy+1RRJLT1zQsgRulMkpZbZMKkg3EzUUyww1Kug=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07bef21c-deb8-4bf8-1506-08ddf5236361
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 13:17:29.7759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Bbt4Bh2KUTAluYKOdsqRI6aLz5OgdN6jO4rgZVn4uDV9d70gF7w8xpHQtWdG6B3jHf6W3BLm5fUUFBO+sXiYSK1BTKRw4LIMTfrHrGofjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7749
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509160123
X-Proofpoint-GUID: acNYesZjZGCm3TRV6HC4AtoC_xsqwOx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNyBTYWx0ZWRfX3qOBCPgkPh/V
 t3na5EmcZkZHuczCar2nJtIxF4ePZ80fgTeFDCots8y9vD1ngpS8SS+oG3t2W4wj61KDpL/Mzte
 rpu8sYGjjOgCtwN4rHHFSgu9DuMesGLlIElluKTHPQDWl/6cV0ZRIe4VY9/OoD3ToQ7vjeXHzie
 zKS4iXufJPvmQpVzP8nYdWGj8KnCgsRcBFnCHp7hsSbGv7d6Idmvwm7Sirp7mnVyf3TY+iFbAJJ
 JBP8qZnv/1sG9j9TR/xhJo1FgVFuoU0PUpFB2SCGQsPq5EiuVAcU6FhjS6bXlMxdnexjcZRaD09
 OgIVpe1qJ3AyC8IN6kOTYwk29hxfYXpvjvWHMNZcXhfJX/1dUdwcwkNTA/eJ56AeEe1SjHTARee
 iFn9OBiMMpXqnlzOm5CM0zW5n3sHSQ==
X-Authority-Analysis: v=2.4 cv=QIloRhLL c=1 sm=1 tr=0 ts=68c96370 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=q_jU6kKvKikixnDcVSAA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13614
X-Proofpoint-ORIG-GUID: acNYesZjZGCm3TRV6HC4AtoC_xsqwOx_

Eugene: Can you test with my kvh/2.0-branch-dev branch from ca-tools4?  I
cannot reproduce the failures you are seeing with this patch, so I wonder
if it is a combination of patches that resolves these issues, and testing
with just this one just doesn't give you the right picture.

On Mon, Sep 15, 2025 at 11:20:28PM -0400, Kris Van Hees wrote:
> On Mon, Sep 15, 2025 at 09:44:14PM -0400, Kris Van Hees wrote:
> > On Mon, Sep 15, 2025 at 04:41:43PM -0400, Eugene Loh wrote:
> > > Largely similar comments to previous versions of this patch:
> > > 
> > > On 9/15/25 13:36, Kris Van Hees via DTrace-devel wrote:
> > > > Because alloca pointers are stored internally as ofssets into the
> > > 
> > > The same as for v1 and v2:  s/ofssets/offsets/.
> > 
> > Ok, yes, sorry - been spending time on functionality over typos.
> > 
> > > > scratchmem area, they were printed as small integers.  They are
> > > > now printed as actual pointer values into kernel space.
> > > 
> > > And, again, the patch performs poorly against testing.
> > > 
> > > The new test gives me:
> > >     -OK 1 OK 333 OK 55555
> > >     +OK 1059965305 OK 1059965637 OK 1060020859
> > > which is to say that the dereferenced values are wrong.  (They are all the
> > > correct values plus some offset.)
> > > 
> > > And with this patch, these pre-existing tests fail:
> > >     test/unittest/builtinvar/tst.tid_pid.sh: FAIL: erroneous exitcode (1).
> > >     test/unittest/funcs/alloca/tst.alloca-bcopy-top.d: FAIL: expected
> > > results differ.
> > >     test/unittest/funcs/bcopy/tst.bcopy_arg_order.d: FAIL: expected results
> > > differ.
> > >     test/unittest/funcs/copyinto/tst.copyinto_arg_order.d: FAIL: expected
> > > results differ.
> > 
> > Hm, this is getting frustrating.  Tracking down why I was not seeing those
> > failures on my end.
> 
> Where are you seeing these failures?  Do you have the pointer subtraction patch
> applied before this one?
> 
> > > btw...
> > > 
> > > > diff --git a/test/unittest/actions/trace/tst.alloca.r.p b/test/unittest/actions/trace/tst.alloca.r.p
> > > > new file mode 100755
> > > > @@ -0,0 +1,11 @@
> > > > +#!/usr/bin/gawk -f
> > > > +
> > > > +{
> > > > +	$1 = $1 > 0x7fffffff ? "OK" : "BAD";
> > > > +	$3 = $3 > 0x7fffffff ? "OK" : "BAD";
> > > > +	$5 = $5 > 0x7fffffff ? "OK" : "BAD";
> > > > +}
> > > > +
> > > > +{
> > > > +	print;
> > > > +}
> > > 
> > > Why are these split over two awk clauses?  Can't they co-exist in the same
> > > clause?
> > 
> > Yes they can.  But they don't have to.
