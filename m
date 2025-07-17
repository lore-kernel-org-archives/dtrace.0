Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA931799F
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 00:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752711772; cv=fail; b=ZdaLSjO0Aa42kvh5Y2RcMsowhUx8K8UVosR/57rsDtqUpHwz7dvKx2gNDRtdN7qs+14rw+PwoduMZ9Cs5U8lBcwnsC42g7zNtiyYOLNUFkxOsx2F8mAngD1BUKLKY3Eo89pD7j77N5V5jgz8J39j8IUmetsm+V1OGhyfyaOcSu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752711772; c=relaxed/simple;
	bh=9St3icYtSYbDvvSBKr7j4lfZXMkW1PUncBFiPYwQJlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EwZCGgBcJDr+FQifMc0fzhDSSipw0Qbkcaod+muU/qrTx0H1iZMaaoXdaU81UFkl3wz146i78KmKWrMMd1Gq7su8UUXS2YTgjAJOXFNMaRUvzGPMWMJsjmLqiiQVvG6Ejdci1G5OGQSjKegbRVhOD83Waw1WQcn7NvYsxDHvMh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dyfr2jd+; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mlf57Hr+ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dyfr2jd+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mlf57Hr+"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GLfnEf023382
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 00:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=HT+RiR+ftm0wxyhOu66W4E8ugYxq40Qpx7iSesE0hlw=; b=
	dyfr2jd+uFCjEcw9cEw9+HihgepvoDthpOFbl1QRa0pWdYijNSAXXiRgnfUEos0h
	55AmV5eDJocPClp/d9udnpe2rF036Tn4bfgcjl1C62f7KxOIoYLuzmDmPG6SlLvs
	gk9rqtOlHMbjJX0E64hLHPZ4Wm1r6WT7OVZHlaTyOn0q58wPKO+ZCInVAv7MytsR
	UAxkjChuC5OOaXmm8v+jshl3ze0K6c5okat22CNwZp8gVmkESdkin+4P8ATpM+dz
	5ZSFhRoc22w4cc8nlOnnBcob5WXRoVCPlQla9S0/y0jnfrjrhwo82/rOXFA1prz2
	tHBIUtiEEO32Z+/MYDDHxA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8g2324-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 00:22:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GN7217040542
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 00:22:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5c2fe2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 17 Jul 2025 00:22:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qy3XrCwpNfWr26AMWpRxQdMyLoblLDp7lWsKRSMYTS5M4HZ9jJAbR7ulSs6/lBRJTQPU4aB2t6YoAIaxX2k61Q1HKcmh1nYpUWBXXHXLyP0zMr+sCu3NnIXpW7L2Mg2ZpmE1UcO1fN6+Kvc8PMUweKnxz57FINWWJ9JeG3fFrJ2WiDvk77tlMPTMVy9YJ18RBGuhRU/1rqSs7IrqanTp5HhPTuusYHtgZ9M7u5e41LLqCpHjC+BhszMhTPKB9Vl/VOLv3GiARKeeGjlln6rEQxTfaewSX2CPXeOCt4jkBkef+7tEFFgmoLAxrCvgIHSJGpVJIPAITjLQjZ8t8sJ+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hu7d1o6R+KLs7VyyRpYuoPYPaGuhm+8/lQr20u9pnBI=;
 b=YXLWiWP0JM8pHYq4ijP95kMTyALZsOIL1/iO00lvLU3wX7C9fdRJi6V8LOV6oeZFFI+OFAWuPPfzePOTjoJqSNd1UYlMv8b1ukpOJf3SwGA5Xm6RdHtkW7XytFAIdb9DJ11sG7T6EWXa9RO1mxAwqrLxRx79ITFybY3NWrAS7VvdGk7XTLwjUaRkBjyUUPYybhS5O6s2xGmjoH3J51r6g/4m//T3dgZJo2g5oArpsVeWxWB/O/9voRjAnq8orB1unFTma0Y6lzw4HNuYVVIgaswez/xjl+BjXCE/Zd2Nlsuxelw8PqQC9Y51FKC0An8HjMUpsPy+Vq26fIGi/29Yyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hu7d1o6R+KLs7VyyRpYuoPYPaGuhm+8/lQr20u9pnBI=;
 b=mlf57Hr+hk8R7ZWZoKSMCYyQyC0GU9lT6Q77p01d6P529WUOA3rMTfkxDSPkmwdL76KJq1B2cLcVL5b7F6KqeP7+G95BiHpv3QUFwLIN47T1dzolusXkvpxN/DTFJs/sdMLGdPXti/Ep2ctC1TK4n/r35kb170SaXabdkdDqZfw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH3PPF7D4C631E3.namprd10.prod.outlook.com (2603:10b6:518:1::7ae) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 00:22:45 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 00:22:45 +0000
Date: Wed, 16 Jul 2025 20:22:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/3] cg: validate tstring alloc/free
Message-ID: <aHhCUiaKDLU9CHEk@oracle.com>
References: <SJ0PR10MB567277E28590C437C8E1955FC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <2032c9f8-aaa5-91ad-64ef-53ba665613b6@oracle.com>
 <529c8de5-2eaa-6bbd-1dfb-392ab4d4a4d0@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <529c8de5-2eaa-6bbd-1dfb-392ab4d4a4d0@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH3PPF7D4C631E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 85634afe-c30e-4c03-9321-08ddc4c80d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?MoHtftwxAaobBloLRW+PRom8zEHdHdZ/RJaSqKbeZ2A3emL4ssYzVqyrru?=
 =?iso-8859-1?Q?/1mO08Ld/k/8DzKyRWXnOP3NpJkbF6DyYiMfJXQcBAgyWI52O4y25/ZoH8?=
 =?iso-8859-1?Q?2DAgW71pZZC4R7ow4on8LjP2ipj3xmDOy58zeqwNTo+Vut0NZyHkxpeefa?=
 =?iso-8859-1?Q?cV6oPTamYrzU1sHjp+MmgApAVjhvtHFp4M6dd2Iu2vZEh5OnqtxFROWJOt?=
 =?iso-8859-1?Q?cVcJj94jeBUFeOco6dMeWDu7W6DDxSnFxZ0u5/rGepmBFsk1PUhBkRZwZt?=
 =?iso-8859-1?Q?cYgCm+7ymAzM8oj6qofNuHTA1cMlrmY+J6OHtezGf920h3jzEBRQj7ooCe?=
 =?iso-8859-1?Q?QhcBpBS4/z4AZqJwQ5WkEdHuDx81s7zsaEkl24mEou36RobG1wZ4AqrMyq?=
 =?iso-8859-1?Q?PuAyxqU/8WzKAxG2Do/i68PpaiisGS7JyYlOTDepUNZsCtqmRhoi059VXa?=
 =?iso-8859-1?Q?UPchRXePNQwXaUmsO5v4CXlcR9X+QilABC+yEhlp25xV5FZ22dKKEj8a+J?=
 =?iso-8859-1?Q?x2Dw038IhrlUzKweLQc2Dx2gRYR0av9InfHgsbcXHwgN4IQ3B2dsQs2+H4?=
 =?iso-8859-1?Q?MRmuNHiDUH8+v9h42JcvnBK8n4drPENRmxW6itKzrE3yV/OmX3uZfabAeE?=
 =?iso-8859-1?Q?lLOEy8rFabJhZ3GVAEcKbArbmt/3HeejlXDiBeUVjdirDDfIHZDcIlfT3n?=
 =?iso-8859-1?Q?vPJjxXCUmh0hjVGUsL/aWtkq9NQTKjv4Wl16JFe2W0Q5zFD8waLJd+9Gwt?=
 =?iso-8859-1?Q?4LPaIWXkLfRrW6GkyF0Q+NCuEtCBGTH4nEBbrY4f/I+/Z5NTM+D7C/P6a1?=
 =?iso-8859-1?Q?+76SbwnxAMXs4GEMu+M5XnTKiVczsfHRTu6gMprQkkoZcxF/LbwoYx9aVG?=
 =?iso-8859-1?Q?BvGX5mCTCzsWrzpOWDHhw+MtwavR9iTGmewTSCEfBL6XZwv7pfpZWXgxUI?=
 =?iso-8859-1?Q?htLV+Iyrzxbfrd7FWAjpxZRG1xVB0WVtNsd3V+hD58hub/bjayux46e/Gv?=
 =?iso-8859-1?Q?jlWDJncQqpXLX6v+k2m9iMNZrcNu16+QmiYjVtS/Z3a8JEDD8pQtfWsrgg?=
 =?iso-8859-1?Q?0lpBZBFcX1AF610akTDty5/jGjS6cvzJWPebe3VZ0kTvi5VoFIX5q9TBZy?=
 =?iso-8859-1?Q?VU+DZfHiGVGuQoQ5GiOSHGsU5Kv/5+8yM5lCuMV5M/1kRfi6h2nYULI6m9?=
 =?iso-8859-1?Q?zkxq3lVCAeZolqio9rUZpySb9pBLnj7d00XJn+oHoi+bSVTDVly8gI65Sl?=
 =?iso-8859-1?Q?bl1+ywVUcmrCBHAinc5rfGlv2pb1ZpyTZFJqP3IADuFlnz0x0wIMfTfhUs?=
 =?iso-8859-1?Q?4QJ5dqXK/Nf9QsHJq2y05ZFlx2rNXP4H8EPT0SW51rSGrL7WJbLzyA3EhS?=
 =?iso-8859-1?Q?DFFoW5r9BzaKIEiuvjMhucd1kyt0YvAEBSkx6r8KeVGaB/TXZrH/7k+Xb+?=
 =?iso-8859-1?Q?03VFfdA5JcOFR6KalW3BLMlujf3AP64xJ0/oDvgLtF+rINI1j4l2zb2ESE?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JEnU4wMQ+8NRG59RVbUgs1x/Uq/iqWyfG6n+GTAKhLnN6bJanQyjzMKDxN?=
 =?iso-8859-1?Q?GU74GkulXnCZskoAM+SZ0ygSRFCkiAukt4oWJNT329E4sN7Ni3NsB4B6Un?=
 =?iso-8859-1?Q?pWpWluqx8I4SUgXeUUwty/OiKFTuDIYJWEjD4Zy07nMUDLIZHbQcDrCSqG?=
 =?iso-8859-1?Q?kZg5qcDpuGj3de/J2QIiWWFLL6jI5DZCjuBil4Nvz1uh30ej33Xf1Gv76m?=
 =?iso-8859-1?Q?jqD2VP1CWQE3e1lsaYRv8arBNI1jK+Q3qiMxr0OiV/m8JTLDStbtQQZtW/?=
 =?iso-8859-1?Q?3P19BcTdsBiHAv65cunA4K7kKp3e+2BJ10m2n3NiH4gp8HngNgQ5HWo4kX?=
 =?iso-8859-1?Q?5qWjmrnTlBS6TAAPy3Rvyze8MS5HjbbMwYIsAA65tF/X5/4kYoCGhXvZ/d?=
 =?iso-8859-1?Q?OIDxu0YnmGlD7KhvYO7A4K/60rvnCTFwoyrkZEaEynNvCQdceQia9xylJO?=
 =?iso-8859-1?Q?YB7SP2Xxe89QWXsBA180OVpMSXGqRXwEjve2aJS9gwxBcDPet04t8wvZBG?=
 =?iso-8859-1?Q?3GcoTzukekz7Jfkd+sXS1YO9KX4yQrXZgiu8HzgZiVqGK6l2oDbqeFwQ2U?=
 =?iso-8859-1?Q?gkXbg8nxjNSHtAgCzCq/0sFiKb1RgVYYqneOCLsZLf4QULvOcXzav4GNG7?=
 =?iso-8859-1?Q?nfvZhb0Tx/lg7TfKcHK6HuFw/0CMOf/Ie6IXiudD1BOcVKdemYHrpBdEic?=
 =?iso-8859-1?Q?s3xa8WMggQ59l/ttGGi1FGWFLim6aJ3PK7cUZzwj1IuW3ECxeb1oc4TEkw?=
 =?iso-8859-1?Q?B5x0vu7PFaWoG+7MbCwxa3D99VzTJcl8YvuQ9YO8xRWwXX1eStfU88jhjB?=
 =?iso-8859-1?Q?sBliDAaT7lZsgw49Sn+Bjags8/LzERhP6VgZzeldSbaRQkpGLyNQaWuusO?=
 =?iso-8859-1?Q?zVIBQT+uN34AYV/KE6jDw5nZNafXkqw4zYMQ8rkAUWvZxrwag1togaFgvn?=
 =?iso-8859-1?Q?CjULTjOFq/wvdYew/UxYteS0fNHlG60evaVyBPM/vEnxZYZ5CuLfIRb3uF?=
 =?iso-8859-1?Q?vf9JrPaVkwCU2VX98+3raK4DmKzQm8IaDwjYu+wbBc94XJeTQI5wNd5qLp?=
 =?iso-8859-1?Q?vahzCicWO2cdMa3Vvn7YaVy5HOpNcFkYUl/ZDFRd4cRPBpgbgN6cIOK6ya?=
 =?iso-8859-1?Q?j4F5wTV26YDcNc77MwVYc4hH71SvosFoskKie3h3nxXiLZoMoTdJ0wFPbi?=
 =?iso-8859-1?Q?Jho7vXKKMJ4K+nx5aH3aDP9EaZZogK+XPHiNVw1dUOExL7JlKPvhffTt4M?=
 =?iso-8859-1?Q?E847LQkV8bOxAfB/tSoCsCBr3xyuu4GAIiwpoIPfJUIA0NIZYZUPNhPrxA?=
 =?iso-8859-1?Q?vjfudim2uOShx3s+giQKBllIr4R83qzOcBx4MB2++a8Y6izXD2gI1IJ4Zs?=
 =?iso-8859-1?Q?FNk5UysDCsCdsCrKDbPVWyatbfFaguIhCXa9h8SrwOvJBqJFRhCeH0h5Oc?=
 =?iso-8859-1?Q?miB8kH+pjyOsW2VPaADMjmltP5x/RZjTibEGQPmgXZ/Wxi3sCP7M6MZpCd?=
 =?iso-8859-1?Q?yE2bm7sRXNtT8qIGN0fkp8oh/wrrUclahhuUGx0/UsQmjt0690wmnl6QoP?=
 =?iso-8859-1?Q?gYHByuoFWq5LMvfDadB3roK5p+TzdNNlADJFVTsIzvHNcoZfT8J4Suzbnw?=
 =?iso-8859-1?Q?eqr3AddmOOhxI4UOKs7eExm7I3Fiul/WIzAlcuEWV4zH0tvWCYDeduwg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gPo3w9J0cZO6Y9BmGCLBaRRb3u4wWU53XFe8QQTtOiWgIkvj5nomKzthk3wk+oHf/zN0UXIObHas8WlDDAzAuNB8oveWW6C4aWkYs7Mv72vckqmnTGWnbc/U1ihf/GZUka6q4v/HAzM8BNsSaDn3e73jdy+1OM8VkxyMaoyWTfm+K887cK4vGCeF37j20kgq0Pb5CrKmcm/3fqUyZQ8yB9EaoDBsCHUmelYNcossOD1PlwEY8en+EGc54V0yUUv5xtezgKKjyqPw4gY7qVe3FmGY/mJoPQCMzwzkdywskPvUAhRK78I8fR3TeEo5khcV+2Xpj4BW2YSz/BX3Aj/nctGZrp1jTOOJ2M/Sqn4SfK3QiMenwCrKGMyBQ+kGLO7tAXjjVJUOcAe99qwE0+k6rMDXAs6CQRrk26E2bAQlpe3mzPMV1hdVyI3QHZeiyWdluPxpFpkCHKFeRDK+a4d8/lq/RuJ9FtODtcWlrqeuMpihH6J1+09O6xkL4+PSNYhd2xbkuGn+RZOGmO4bd2geRdJ3VTpEzeVZXv/0spBds9Se5j+dP0CMFFblxDT4q3ShlMa58z8SrUUPwYL+Q3OWIl9efzVrLMZ0Qv+1lV3kkdQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85634afe-c30e-4c03-9321-08ddc4c80d26
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 00:22:45.0794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iMcrA8MnVjl1XByxN+k9zdvKuBkv8Ngfe+m7sNk+YW8R/5oYS8720PHiGdtSHZ6q3TJJq0cmeRDaJP7u8JgfBoBU5EBhnrAujRqMPTQOWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7D4C631E3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_05,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507170001
X-Proofpoint-ORIG-GUID: WOFjJ3xiE7VwRFOhpt1VDXLKxzUjCzlH
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=68784259 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=LJo_iYgVvkt0L2QAGqsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13600
X-Proofpoint-GUID: WOFjJ3xiE7VwRFOhpt1VDXLKxzUjCzlH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDAwMSBTYWx0ZWRfXybVYiDxbdcaK /xUgNdByaVZs9nAavXvUrdecV8GhW4ZslMeB7TeSSPUeTSqD0dn9Y9K+ZZoLXCgZdOLH2IcjcKv yO2vkns2KHPHFZu0BoNqxYmG6+HRoCuy6NziAyktf2sX+WuFfwuyiBFsDheolq6zIRVTXi5f7Fg
 nPvmpGgBYJETP2o/pHCPbo6hychkn2sLNSt8VPeotFygVRTK3FsJBSRMqUsCyoqW99V42kRAz1A zSumDz8/7LoibHg8TS/EjRd76OxfpTSWvr2ETWuX8kuuST49HuoH8OKA/1oCu0aWtVjZv7l9WeN SZXdBJjgJnLlC3aP6XWg5k3XlKiufzwPm8RAfwZYMvKfgkJsBtC8eMW2aVJl6e0wZvT9LrGXved
 6KqvaF0PvHl23pAD+RRti8US5W9ijiHpl9TV+sk44Co8MOX0R9JsTjomKYseEtsxLI7LBz7u

On Wed, Jul 16, 2025 at 07:07:59PM -0400, Eugene Loh wrote:
> I was a little concerned about this patch, but also wanted to expedite
> review.  FWIW, testing shows
> 
> test/unittest/builtinvar/tst.psinfo-bug21974606.d:
> test/unittest/builtinvar/tst.psinfo-bug22561297.d:
> test/unittest/builtinvar/tst.psinfo.d:
> test/unittest/builtinvar/tst.psinfo1.d:
> test/unittest/fbtprovider/tst.entryargs2.sh:
> test/unittest/funcs/copyinstr/tst.copyinstr-high-maxsize.d:
> test/unittest/funcs/copyinstr/tst.copyinstr-low-maxsize.d:
> test/unittest/funcs/copyinstr/tst.copyinstr-no-maxsize.d:
> test/unittest/funcs/copyinstr/tst.copyinstr.d:
> test/unittest/proc/tst.exec.sh:
> test/unittest/proc/tst.execfail.ENOENT.sh:
> test/unittest/proc/tst.execfail.sh:
> test/unittest/proc/tst.pr_psargs.d:
> test/unittest/proc/tst.pr_psargs_other_task.d:
> test/unittest/usdt/tst.argmap-typed-partial.d:
> test/unittest/usdt/tst.argmap-typed.d:
> test/unittest/variables/bvar/tst.execargs.d:
> test/demo/spec/specopen.d:
> 
> test/unittest/dif/bcopy.d:
> 
> failing on every VM.  (Well, bcopy is listed separately since we skip it on
> ARM.)  I'll try to put together a patch, but let me know if you already knew
> about this and have a fix.

I am looking into it as well.  Clearly, this patch is catching issues as
expected.
