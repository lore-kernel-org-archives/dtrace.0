Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EBF14830F
	for <dtrace@lists.linux.dev>; Fri,  7 Feb 2025 06:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908534; cv=fail; b=JSM9k4d1dDatsoqEvTWUIj+ZVI3+GY3MmyNUH4+8VZ8HQyzykFgVlRiMIm9o6Dyq6omqFeV6Kf9fQG64AqsKAUb3lIv5Km3hI8EEyWqMpB5LZfIW2V6sWxCOUDzzFPbYpoJBpLs/v3VaxiR8j3xAV+v6dHdNe4sYyXgAL1hDG8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908534; c=relaxed/simple;
	bh=gvW0fjOeGnqmi1T2VoFwWaFBtM8GTVIJReY/QyFc78Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dvnHCM5C8poKZTgibNjrYSxgzekyIxjGmY2AreqpnHzBN4q6bmBe/Ww1YdK6+gxO5RthpKW50IAOaMlWxLdjPEMYHnX2Vhv/zzOh9N88pEJytIbC5pVk7cnGT/hw735+Lt1eu1ysY4PKZRllzIgf0ceTGauyHtSaKASFnLhpaTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JZcu67s7; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F2245oMN reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JZcu67s7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F2245oMN"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5171ts6S017532
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 06:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Z7jEx8hRglXLNyFIbWsW0kwfwqSwJ/BIGqOdLBIohxY=; b=
	JZcu67s7/ZNlfpNLKnjRYF3HBol3+MBOoPe2HPksQ3SNRlkL2vFNOVgmsvmWZM5f
	B1674V03514m02TPA87HXff/45XD0vvvJk/nqlaG9LUk52U5aIWRK1D6/6a9p3K7
	tTb5phLNSfJuNhxOCJ9AP+0uqm3nz6ZQdIgOJ6EITnIElgnnfxr5Q4TTghkjjS3d
	rFXUx2CHGZOTYgGtnqPp02u+2NiS7OGjbBnOTZS0eBYYMO4Q4BgRwR7Ncn45oZO1
	bpD3zLEewj1+daRYtig1xW1MUwwGiRgZVm7ehMfKCB3510h4g/ft0w6u0IxtNvYv
	QMYV1OJmK4P249inVxWYew==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhbtjud3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 06:08:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51759I69027028
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 06:08:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fqywv1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 06:08:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxMl4S0mGMbiSLH6PZPXZsGqKHcCosKnhTZMf3mfB1uQZIZY5BCAvVi/LhmT09Ef4e6OGjcqft+d7pdVsCZmNN7ijVz2S8xj7DXTfBIiVENRL/OMfJM0dyWaifa55WUDWS4cYndw5/ERSSaGGAry8Q7J2iPrDjy2ktYutYXPXpqvVBDlYTjRuAH1pXsjsX7JEsomcha/BFb4Sx9mq8aQwfyBvoz/6LX3KzZ8MCSZNUsqT7x3iQq2T2K9IdgwwuXf5pwfryW1HRvtTnXaiyhvdFsDPJuG/MY57tMbO7Nyoix1wedu3Pj88w9kjb7CNAyF13LzrxSfnlXbYS7GrGEb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1iqgODSwh9+vWs8LcUgKJjfPPs0H9V2gpPLK6ikOf8=;
 b=GonFJPvA2nEcQRVarxPQXCpKf8moyIuDqfp8aW5hRp34mn+dy368qFxOkMGCWAli9+tRtG1runvGwPzv4FiJQ8F8ZFd0ZnofZYWaEWQfghV8W25SdQEwf9C022QwmNVbj+e/7MCyzGuFsTVC8lpsZI2XlKujD/nZj941v2tGlNgfpXbj4bKKeJ7TAiChvjehpz3CCOc/XvuVDIea012AROneISPXKiDpOLQK+7UJXaOf/fA9PzyOat9i4Wggoz8RGWSVsJg+D2Ssel+0wAnSvZjXJ5f2JoGmuv7YWCLOK7WkbyDxzzGe5au/mUglQjI5YChJ7m6+OQUJWwzVweCySA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1iqgODSwh9+vWs8LcUgKJjfPPs0H9V2gpPLK6ikOf8=;
 b=F2245oMNqjwCxLEH9+emBq3TUS9scVsVyHpd0ck2pKZzrFyChpp5HE0VESwq/w68qroEKD15w2khRpz9bTWuDda36J4lMQfgA+50CT+sqj34i2JsBBN7comw13DYaMfkEdr2/UmWRQqpz+BctfOrg0ZRiMgKKgx1Agw9V6XfDPE=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by BN0PR10MB5061.namprd10.prod.outlook.com (2603:10b6:408:12b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 06:08:45 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 06:08:45 +0000
Date: Fri, 7 Feb 2025 01:08:42 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] trace: fix char-array handling
Message-ID: <Z6WjagszZArcAVqI@oracle.com>
References: <PH8PR10MB6337447CA1EB2716CC4CE522C2F62@PH8PR10MB6337.namprd10.prod.outlook.com>
 <5629b0db-a8ed-5b75-4bcf-e1ffc7e6daca@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5629b0db-a8ed-5b75-4bcf-e1ffc7e6daca@oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|BN0PR10MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2e4c24-3d9f-4223-af55-08dd473de124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?rQi9OTOY2cMMMQpZseE+esVAtSmTwHcXa9t7L04jGVEDXFHTsuU0xeb4XY?=
 =?iso-8859-1?Q?LHHWPzajYXCuhW+oIeuZFJEmBx0fs3Jeesfaq7en00qFrAapXrDU6tmjhA?=
 =?iso-8859-1?Q?EzmCEC8aEdkCEk1V3grUvkfZB39dMhVWcgrSsNwCXXHCuIp8OL37NahdBv?=
 =?iso-8859-1?Q?2sVBRFmSFrSuiTzwPnyqiVOldBZqCJ7xa4qwg3l9DrF5DDyijT/MZE4+ft?=
 =?iso-8859-1?Q?jib8wPpBSfybNmZWNQ+kcneMWqGgd0onfZSuZqDeDKrjXYiTOB8LtI05xp?=
 =?iso-8859-1?Q?6gf9HZ3IPJiBKpwvVzzQMjeN/wtQftBPhxTjrMOq+1VEiJNdRwNr84M1SV?=
 =?iso-8859-1?Q?s6rwFm0Zg+wx2BsbvgJxDK3eLCSH23JeT86G5dCs7+4aogSJZRKBXEUW9i?=
 =?iso-8859-1?Q?xiXefQkjhfqQtIY0jRTVfwDFtBtego7AqYDyDraBWFvbB2+wqhp7w2lV4m?=
 =?iso-8859-1?Q?hDTiptB1t3vzIvJGhAMa8p2iwvg9uRfI8LTUYBZHQRq6DdpA8g9c66a/wR?=
 =?iso-8859-1?Q?vLeWKiehzTwGiI1uoG8n3gc7+TxSsSkCzR5Y5sNsyUO5eo5F+oUz4IMd+J?=
 =?iso-8859-1?Q?0ZgL5rI4Kc9SMH55Lfdx48tEnC5HfSGBXm9s6YQhpP8cG90WcmvQnC1hC0?=
 =?iso-8859-1?Q?HvPnCwpzHD13RBRwHKTvbvxMPtCYZOk5H2VCPHDMgTyovsyWIJ/2piNSQG?=
 =?iso-8859-1?Q?HsYCuU/5tuN5+KCcgIobvIFqIkDikRsWnr8I6YPmHX6yKShZF8OEUWBJWg?=
 =?iso-8859-1?Q?xR6YaF5ZktkwXcpvwdpyTQLrqMA56JEvM3ZKKjhpvM+DpIZqk0DYIWAza1?=
 =?iso-8859-1?Q?VRsLal4l7n+JFurepTt9amCwHlMiJai7sS7lk5j10h4Ap5F9KhIs6lYDbV?=
 =?iso-8859-1?Q?r5r8FBTsoqV/37PONphpSfiJxckomWfLGq7HFKGPTy+79N45wsLGpPtKIW?=
 =?iso-8859-1?Q?QTAZEwE5hX+sY524dP/SDWTtp0+UPl1yZbMOwmO9UOs2uOuTMrPFzBbRdt?=
 =?iso-8859-1?Q?ijiNUYAoq++XbaUyDAwjnIryF/cX3jt84oXDQ0uUm95RvNfcOlsACUgSU9?=
 =?iso-8859-1?Q?eu+sIro5wCYlKRF/6iNL9Wy7EcXDrUwbeqCyi+1XbKji8apidGk8nzdZyg?=
 =?iso-8859-1?Q?FHRZyGpCifkLK8YGStmZeR1DBNShiukONKDPBbNueB8x28iLVBuTQwGRZ0?=
 =?iso-8859-1?Q?oJXkS24lm9E4PS3RXvIM+JQI0e3XkzqzSsSI+pYUtMxT+2ac0WDePHj1uX?=
 =?iso-8859-1?Q?E1ovXgj68STk5EbNHixRQwm/5u5x8iADYJ03et9c35/kwTBB2YRWCK2zfB?=
 =?iso-8859-1?Q?smi1zWCS8GOiVhpod4kMjUaaE//K33AxgYlghbQ0SEMXrnppxnhMpgrk0s?=
 =?iso-8859-1?Q?A5an/BqNh48FRyUbXxd+yu4Y5fEv+9VA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?E5GgWXzJNc0DNVbHSS3XCtnYFBSU9kTW6qbgA5cWX+rJfcA5Qs0yu6GQ9h?=
 =?iso-8859-1?Q?pZeg0Bait/YiF0ro/6IOBpDxZR8aFjZHMNJkcHdiOPGnquANzK0gjfqLoB?=
 =?iso-8859-1?Q?KRNdBF8ZrFBS5RHRsSvE9itm7BUOUehaSTwrRGML/B1VXnLm6cqZ8oDeSO?=
 =?iso-8859-1?Q?n5MHIn6BSZS7CN7SoAAMzrzZffUjoZhcGtgkuOSH56F5nrFYEizRVlIWyK?=
 =?iso-8859-1?Q?kkse92GoC1p/Opqo4lumDbh2hfd2e3tLaXqVgyVRiMf3p4UBtNvuQc30WW?=
 =?iso-8859-1?Q?6xNLnD+42JihdrS1QxLPtnD7w5kKLUaJFMcsq/t6YIoyV+TnhVKh/d/T9t?=
 =?iso-8859-1?Q?zLG0ipd8EmlptxQ9LKuEiqMFSyMDmIPTwsof3iHKIoQng6TC9pNDANZt+R?=
 =?iso-8859-1?Q?ICIDI3QhJcw0XIykhB17uSkbMe9KrpcqXCDLf5DEldoKfs0V//TyEw+RGj?=
 =?iso-8859-1?Q?tqQqIwQEj81gu8q4pRaL69Cpf0INdG4nzKJTS9Q8qwiSBMkJdcDboV/2Yt?=
 =?iso-8859-1?Q?niXJuN9TgdpKce+BngNDO+KY3YU6iVWOO2Os+naxa/qqoZfZ78urQhHnYj?=
 =?iso-8859-1?Q?nlBanRtes+YCPq7XNosluO9VFrBHSsRz0UJEA0w54lijzk6uaT3Z8VLDNI?=
 =?iso-8859-1?Q?oSRJmgp6G1tn9vtTnee4HMftMe38StkUTNXWp+7L4Lo2hOKMiSULwxm/r1?=
 =?iso-8859-1?Q?2AfoHCD2+5NyIoqfxn4AuHkOwndoe107szaqbmhl1UrOWf4fPKnnbDCjOL?=
 =?iso-8859-1?Q?8qPH6DBcqQgyQRxKFxCGXpgQzYG1mVZco3P+z9kLM/z2lIw9JHaQYH1TWS?=
 =?iso-8859-1?Q?4FhIKdH0yBDUubLoR74bsuzokk+F8rqujh6/NtjoWRc5+p/Z8c1YXHobSt?=
 =?iso-8859-1?Q?n6tpHk6EucYvJRLkqpwygoUkjsAxxKhvBM/RD2LMVc/KO+qiZhchPyahHI?=
 =?iso-8859-1?Q?RA/cmxXiR6s8xjmj/Vvhfwl4Ne0CVoPsQmkNMimRU/lpnSrHgE7WvEFHdH?=
 =?iso-8859-1?Q?/6tPfPKK+qzI+KCUfepbi3xjBNYjOekWZJAaJlPjZgFeb8NO+sPhCkZUNZ?=
 =?iso-8859-1?Q?FnGDH8iHlZ9TBJ6IWTHuGeqUuw2FewDEYt3apqVTMHZtm1JpL0xrNg55fb?=
 =?iso-8859-1?Q?dQ4VTmtLVNpSMtHS62UFYTJXZCl4hhYpXdbuACimG2u7ut8hl0eTPsqPlG?=
 =?iso-8859-1?Q?lyMeNX1JJ3r2wsHNgbVTPhxAmOEOv62guTnILASItYED9qz2YANk4TKV1P?=
 =?iso-8859-1?Q?ClAtGdpVkap5LyUR7lClCFDXtcDc/lpGYLu2q+v5sfwpOSMbKppgU3S6m2?=
 =?iso-8859-1?Q?yjDA3ez/lP4HfPBk9/GNGz3rL66jyJZmq/jEto/HEjom9GFGsj/Kqy/epV?=
 =?iso-8859-1?Q?u0TYhwPvmhZDrnToVceXToDThaZVcuXfux0xG8HqD4CJ9lmNZfkrq8gTBS?=
 =?iso-8859-1?Q?RWqLcFUf+grsJZzTRbIhCr6E91Q5BSIVvah3IoFqZ6csiiYhMQNJ+AGSWk?=
 =?iso-8859-1?Q?DdY46n95CCZjlHoDjF8EUL6lSd39Z3SrBBtS0+Ucbk6uN8bdkj0l5aH4E5?=
 =?iso-8859-1?Q?XNEFEB1luV7M706GTk1GcyfmWZidm8X2PzycSO/IuamrQVBGX4nVRBw0rr?=
 =?iso-8859-1?Q?hNdT1QEOSeowRGKF3mYqOsnQAglts9pmOBtdufb+Fl/3f2mP9vxMIirA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l3HY2F4E3dhOTxEu5GqZimk9WuX8ujKn0p8U5/LzyBbw1oQwRJQTHsdIwettFd33nDldGh8S+Pq+BDJP10FSKoT8xM1ry5wqi1txyC30Te+6dS1Pp5xoB4AuZgoeIRQfVvbOc3XBFZvNq4Cr4DwzItDOP3qE1irQ/8w+ctaljzEVDcu96X+1sLoaIn4JZShY3a8/U7xqKag92npcST59AVBHlXBEwvJY6gJjgd/fXTTGs7aDTJIUXRTx0t88J2QBBFvtk8vh2fjlPHAaYKoPdX/ZtwZin61dAieGLwZFZE24veWf82Kd/AjoWW+eW+YRUJJ565fbHYBTT5ukVgYm/xRit9YGF+fk77OCL5si9iQQ3i6V3JsG+FD2vc0ScQhHDrHdIpN8R6Jys7LYA9LO0CioOF35fTehN93s3vRfYkOfaODs/dFczpoWzVKxI2cLm4hd46tjRs1ITQIzzPXvs5Ii3khGYldVRMAVoErMzKbOXVLfMZvxSn53gGVvh+6KSDRhZcS3P9Wkbh1MLPGCBTQ7BvHxzFl8fn8JEwXeR7+l5w13FnXaWyUcVSC+oXuvYN1zN47/mDDcSbOFV09SdNTwKw3Jb5YS6Hz70ygiWCA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2e4c24-3d9f-4223-af55-08dd473de124
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:08:45.3932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHd5t+GWs6TzuOixXrHL2niRVNZ4OUgiwWh/BJJoJuf2SYxXXBtJ4SK9CiPhPVnNbKW5Xt4Wny0qIWrCeugcjVW1pGsjgNrHV1YBeczSGTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5061
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_02,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502070041
X-Proofpoint-GUID: ONcUlt7MO7tv0F5ppNKVeJE2pXuVLkgi
X-Proofpoint-ORIG-GUID: ONcUlt7MO7tv0F5ppNKVeJE2pXuVLkgi

On Fri, Feb 07, 2025 at 01:04:53AM -0500, Eugene Loh wrote:
> I don't understand the relevant code very well, but
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Incidentally, it looks funny to have so many "new" files have 2022
> copyrights on them, but I suppose they're inheriting a lot from pre-existing
> tests... so, okay.

I'll have a look.  Copyright years may need to be updated.

> Also...
> 
> On 2/6/25 11:46, Kris Van Hees wrote:
> > The special handling of strings in the consumer's trace implementation
> > did not correctly account for char-arrays that do not necessarily are
> 
> s/do not necessarily are/are not necessarily/
> 
> > intended to hold string data.  Thr trace action is documented to print
> 
> s/Thr/The/
> 
> > data as an ASCII string if it can be represented as such, i.e. if it
> > comprises only printable characters, optionally terminated by one or
> > more 0-bytes.
> 
> That doesn't read quite right to me.  E.g., 'a' 'b' 0 'c' 0 looks to me like
> "only printable chars, terminated by one or more 0 bytes" yet I think it's
> supposed to be dumped (not printed as a string). I'm not sure and maybe it
> doesn't matter.

'a' 'b' 0 'c' 0 will indeed by bumped as raw bytes because it is not a string
followed by one or more 0-bytes, but rather a potential string that has a
non-printable character (byte) embedded in it, which causes it to not be seen
as a string at all.

> Another possible test is all bytes are 0, but I'm not worried about whether
> such a test is included.
> 
> > The implementation for trace on both producer and consumer side was
> > using the data alignment as a marker to determine whether data should
> > be printed as a string (alignment == 1) or not.  The real alignment
> > of the data should be used, reverting code back to the necessary
> > heuristics in dt_print_bytes().
> > 
> > The dtrace_diftype struct has its dtdt_pad member renamed as dtdt_align.
> > 
> > Added several new test cases to cover various possibilities.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   include/dtrace/dif.h                          |  2 +-
> >   libdtrace/dt_cg.c                             | 16 ++++++----
> >   libdtrace/dt_consume.c                        | 20 ++-----------
> >   libdtrace/dt_parser.c                         |  2 +-
> >   .../actions/trace/tst.array-char-multi-nul.d  | 30 +++++++++++++++++++
> >   .../actions/trace/tst.array-char-multi-nul.r  |  8 +++++
> >   .../trace/tst.array-char-str-multi-nul.d      | 30 +++++++++++++++++++
> >   .../trace/tst.array-char-str-multi-nul.r      |  5 ++++
> >   .../actions/trace/tst.array-char-str-no-nul.d | 30 +++++++++++++++++++
> >   .../actions/trace/tst.array-char-str-no-nul.r |  5 ++++
> >   .../actions/trace/tst.array-char-str.d        | 30 +++++++++++++++++++
> >   .../actions/trace/tst.array-char-str.r        |  5 ++++
> >   .../trace/tst.array-char-unprintable.d        | 30 +++++++++++++++++++
> >   .../trace/tst.array-char-unprintable.r        |  8 +++++
> >   test/unittest/actions/trace/tst.array.d       | 11 +++++--
> >   test/unittest/actions/trace/tst.array.r       |  2 +-
> >   test/unittest/actions/trace/tst.array.r.p     |  6 ----
> >   17 files changed, 206 insertions(+), 34 deletions(-)
> >   create mode 100644 test/unittest/actions/trace/tst.array-char-multi-nul.d
> >   create mode 100644 test/unittest/actions/trace/tst.array-char-multi-nul.r
> >   create mode 100644 test/unittest/actions/trace/tst.array-char-str-multi-nul.d
> >   create mode 100644 test/unittest/actions/trace/tst.array-char-str-multi-nul.r
> >   create mode 100644 test/unittest/actions/trace/tst.array-char-str-no-nul.d
> >   create mode 100644 test/unittest/actions/trace/tst.array-char-str-no-nul.r
> >   create mode 100644 test/unittest/actions/trace/tst.array-char-str.d
> >   create mode 100644 test/unittest/actions/trace/tst.array-char-str.r
> >   create mode 100644 test/unittest/actions/trace/tst.array-char-unprintable.d
> >   create mode 100644 test/unittest/actions/trace/tst.array-char-unprintable.r
> >   delete mode 100755 test/unittest/actions/trace/tst.array.r.p
> > 
> > diff --git a/include/dtrace/dif.h b/include/dtrace/dif.h
> > index 576bda2c..70257b2f 100644
> > --- a/include/dtrace/dif.h
> > +++ b/include/dtrace/dif.h
> > @@ -33,7 +33,7 @@ typedef struct dtrace_diftype {
> >   	uint8_t dtdt_kind;
> >   	uint8_t dtdt_ckind;
> >   	uint8_t dtdt_flags;
> > -	uint8_t dtdt_pad;
> > +	uint8_t dtdt_align;
> >   	uint32_t dtdt_size;
> >   } dtrace_diftype_t;
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index 6e74b4b0..a5c9aa09 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -1601,12 +1601,11 @@ static int
> >   dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
> >   		dt_pfargv_t *pfp, int arg)
> >   {
> > -	dtrace_diftype_t	vtype;
> >   	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
> >   	dt_irlist_t		*dlp = &pcb->pcb_ir;
> >   	dt_regset_t		*drp = pcb->pcb_regs;
> >   	uint_t			off;
> > -	size_t			size;
> > +	size_t			size, align;
> >   	int			not_null = 0;
> >   	int			cflags = pcb->pcb_stmt->dtsd_clauseflags;
> > @@ -1619,10 +1618,14 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
> >   			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >   		emit(dlp, BPF_MOV_IMM(dnp->dn_reg, dnp->dn_ident->di_id));
> >   		size = sizeof(dnp->dn_ident->di_id);
> > +		align = size;
> >   	} else {
> > +		dtrace_diftype_t	vtype;
> > +
> >   		dt_cg_node(dnp, dlp, drp);
> >   		dt_node_diftype(dtp, dnp, &vtype);
> >   		size = vtype.dtdt_size;
> > +		align = vtype.dtdt_align;
> >   		/*
> >   		 * A DEREF of a REF node does not get resolved in dt_cg_node()
> > @@ -1664,7 +1667,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
> >   	if (dt_node_is_scalar(dnp) || dt_node_is_float(dnp) ||
> >   	    dnp->dn_kind == DT_NODE_AGG) {
> > -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, size, pfp,
> > +		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, align, pfp,
> >   				 arg);
> >   		emit(dlp, BPF_STOREX(size, BPF_REG_9, off, dnp->dn_reg));
> > @@ -1678,8 +1681,8 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
> >   			dt_cg_check_ptr_arg(dlp, drp, dnp, NULL);
> >   		TRACE_REGSET("store_val(): Begin ");
> > -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1,
> > -				 1, pfp, arg);
> > +		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1, 1, pfp,
> > +				 arg);
> >   		/*
> >   		 * Copy the string data (no more than STRSIZE + 1 bytes) to the
> > @@ -1706,7 +1709,8 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
> >   	/* Handle tracing of by-ref values (arrays, struct, union). */
> >   	if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF)) {
> > -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, 2, pfp, arg);
> > +		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, align, pfp,
> > +				 arg);
> >   		TRACE_REGSET("store_val(): Begin ");
> >   		if (!not_null)
> > diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> > index 74004c69..58a2ead9 100644
> > --- a/libdtrace/dt_consume.c
> > +++ b/libdtrace/dt_consume.c
> > @@ -1921,23 +1921,9 @@ dt_print_trace(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
> >   	if (dtp->dt_options[DTRACEOPT_RAWBYTES] != DTRACEOPT_UNSET)
> >   		return dt_print_rawbytes(dtp, fp, data, rec->dtrd_size);
> > -	/*
> > -	 * String data can be recognized as a non-scalar data item with
> > -	 * alignment == 1.
> > -	 * Any other non-scalar data items are printed as a byte stream.
> > -	 */
> > -	if (rec->dtrd_arg == DT_NF_REF) {
> > -		char	*s = (char *)data;
> > -
> > -		if (rec->dtrd_alignment > 1)
> > -			return dt_print_rawbytes(dtp, fp, data, rec->dtrd_size);
> > -
> > -		/* We have a string.  Print it. */
> > -		if (quiet)
> > -			return dt_printf(dtp, fp, "%s", s);
> > -		else
> > -			return dt_printf(dtp, fp, "  %-33s", s);
> > -	}
> > +	/* Handle non-scalar data. */
> > +	if (rec->dtrd_arg == DT_NF_REF)
> > +		return dt_print_bytes(dtp, fp, data, rec->dtrd_size, 33, quiet);
> >   	/*
> >   	 * Differentiate between signed and unsigned numeric values.
> > diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
> > index 325ba881..eefe8341 100644
> > --- a/libdtrace/dt_parser.c
> > +++ b/libdtrace/dt_parser.c
> > @@ -4914,7 +4914,7 @@ dt_node_diftype(dtrace_hdl_t *dtp, const dt_node_t *dnp, dtrace_diftype_t *tp)
> >   	}
> >   	tp->dtdt_flags = (dnp->dn_flags & DT_NF_REF) ? DIF_TF_BYREF : 0;
> > -	tp->dtdt_pad = 0;
> > +	tp->dtdt_align = ctf_type_align(dnp->dn_ctfp, dnp->dn_type);
> >   	tp->dtdt_size = ctf_type_size(dnp->dn_ctfp, dnp->dn_type);
> >   }
> > diff --git a/test/unittest/actions/trace/tst.array-char-multi-nul.d b/test/unittest/actions/trace/tst.array-char-multi-nul.d
> > new file mode 100644
> > index 00000000..187fb711
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.array-char-multi-nul.d
> > @@ -0,0 +1,30 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The trace() action prints a char-array of printable characters
> > + *	      with multiple 0-bytes in its content.
> > + *
> > + * SECTION: Actions and Subroutines/trace()
> > + */
> > +
> > +char n[9];
> > +
> > +BEGIN
> > +{
> > +	n[0] = 'a';
> > +	n[1] = 'A';
> > +	n[2] = 0;
> > +	n[3] = 'B';
> > +	n[4] = 0;
> > +	n[5] = 'C';
> > +	n[6] = 0;
> > +	n[7] = 'D';
> > +	n[8] = 'e';
> > +	trace(n);
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/actions/trace/tst.array-char-multi-nul.r b/test/unittest/actions/trace/tst.array-char-multi-nul.r
> > new file mode 100644
> > index 00000000..c1361e75
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.array-char-multi-nul.r
> > @@ -0,0 +1,8 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN
> > +             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> > +         0: 61 41 00 42 00 43 00 44 65                       aA.B.C.De
> > +
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/actions/trace/tst.array-char-multi-nul.d' matched 1 probe
> > diff --git a/test/unittest/actions/trace/tst.array-char-str-multi-nul.d b/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
> > new file mode 100644
> > index 00000000..75164cd3
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
> > @@ -0,0 +1,30 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The trace() action prints a char-array of printable characters
> > + *	      followed y by multiple 0-bytes correctly.
> > + *
> > + * SECTION: Actions and Subroutines/trace()
> > + */
> > +
> > +char n[9];
> > +
> > +BEGIN
> > +{
> > +	n[0] = 'a';
> > +	n[1] = 'A';
> > +	n[2] = 'b';
> > +	n[3] = 'B';
> > +	n[4] = 'c';
> > +	n[5] = 0;
> > +	n[6] = 0;
> > +	n[7] = 0;
> > +	n[8] = 0;
> > +	trace(n);
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/actions/trace/tst.array-char-str-multi-nul.r b/test/unittest/actions/trace/tst.array-char-str-multi-nul.r
> > new file mode 100644
> > index 00000000..1951ae69
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.array-char-str-multi-nul.r
> > @@ -0,0 +1,5 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN   aAbBc
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/actions/trace/tst.array-char-str-multi-nul.d' matched 1 probe
> > diff --git a/test/unittest/actions/trace/tst.array-char-str-no-nul.d b/test/unittest/actions/trace/tst.array-char-str-no-nul.d
> > new file mode 100644
> > index 00000000..532c3519
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.array-char-str-no-nul.d
> > @@ -0,0 +1,30 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The trace() action prints a char-aarray of printable characters
> > + *	      (not terminated) correctly.
> > + *
> > + * SECTION: Actions and Subroutines/trace()
> > + */
> > +
> > +char n[9];
> > +
> > +BEGIN
> > +{
> > +	n[0] = 'a';
> > +	n[1] = 'A';
> > +	n[2] = 'b';
> > +	n[3] = 'B';
> > +	n[4] = 'c';
> > +	n[5] = 'C';
> > +	n[6] = 'd';
> > +	n[7] = 'D';
> > +	n[8] = 'e';
> > +	trace(n);
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/actions/trace/tst.array-char-str-no-nul.r b/test/unittest/actions/trace/tst.array-char-str-no-nul.r
> > new file mode 100644
> > index 00000000..3d56e520
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.array-char-str-no-nul.r
> > @@ -0,0 +1,5 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN   aAbBcCdDe
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/actions/trace/tst.array-char-str-no-nul.d' matched 1 probe
> > diff --git a/test/unittest/actions/trace/tst.array-char-str.d b/test/unittest/actions/trace/tst.array-char-str.d
> > new file mode 100644
> > index 00000000..70f6371f
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.array-char-str.d
> > @@ -0,0 +1,30 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The trace() action prints a char-array of printable characters
> > + *	      (terminated) correctly.
> > + *
> > + * SECTION: Actions and Subroutines/trace()
> > + */
> > +
> > +char n[9];
> > +
> > +BEGIN
> > +{
> > +	n[0] = 'a';
> > +	n[1] = 'A';
> > +	n[2] = 'b';
> > +	n[3] = 'B';
> > +	n[4] = 'c';
> > +	n[5] = 'C';
> > +	n[6] = 'd';
> > +	n[7] = 'D';
> > +	n[8] = '\0';
> > +	trace(n);
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/actions/trace/tst.array-char-str.r b/test/unittest/actions/trace/tst.array-char-str.r
> > new file mode 100644
> > index 00000000..9778ddd2
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.array-char-str.r
> > @@ -0,0 +1,5 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN   aAbBcCdD
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/actions/trace/tst.array-char-str.d' matched 1 probe
> > diff --git a/test/unittest/actions/trace/tst.array-char-unprintable.d b/test/unittest/actions/trace/tst.array-char-unprintable.d
> > new file mode 100644
> > index 00000000..d88df369
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.array-char-unprintable.d
> > @@ -0,0 +1,30 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: The trace() action prints a char-array with a non-printable
> > + *	      character correctly.
> > + *
> > + * SECTION: Actions and Subroutines/trace()
> > + */
> > +
> > +char n[9];
> > +
> > +BEGIN
> > +{
> > +	n[0] = 'a';
> > +	n[1] = 'A';
> > +	n[2] = 'b';
> > +	n[3] = 'B';
> > +	n[4] = 'c';
> > +	n[5] = 5;
> > +	n[6] = 'd';
> > +	n[7] = 'D';
> > +	n[8] = '\0';
> > +	trace(n);
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/actions/trace/tst.array-char-unprintable.r b/test/unittest/actions/trace/tst.array-char-unprintable.r
> > new file mode 100644
> > index 00000000..1f84fcfa
> > --- /dev/null
> > +++ b/test/unittest/actions/trace/tst.array-char-unprintable.r
> > @@ -0,0 +1,8 @@
> > +                   FUNCTION:NAME
> > +                          :BEGIN
> > +             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> > +         0: 61 41 62 42 63 05 64 44 00                       aAbBc.dD.
> > +
> > +
> > +-- @@stderr --
> > +dtrace: script 'test/unittest/actions/trace/tst.array-char-unprintable.d' matched 1 probe
> > diff --git a/test/unittest/actions/trace/tst.array.d b/test/unittest/actions/trace/tst.array.d
> > index 104d42e1..0779d90f 100644
> > --- a/test/unittest/actions/trace/tst.array.d
> > +++ b/test/unittest/actions/trace/tst.array.d
> > @@ -1,6 +1,6 @@
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -11,8 +11,15 @@
> >    * SECTION: Actions and Subroutines/trace()
> >    */
> > +short n[5];
> > +
> >   BEGIN
> >   {
> > -	trace(curthread->comm);
> > +	n[0] = 0x1234;
> > +	n[1] = 0x5678;
> > +	n[2] = 0x0000;
> > +	n[3] = 0x8765;
> > +	n[4] = 0x4321;
> > +	trace(n);
> >   	exit(0);
> >   }
> > diff --git a/test/unittest/actions/trace/tst.array.r b/test/unittest/actions/trace/tst.array.r
> > index fbb674b6..52ff28ec 100644
> > --- a/test/unittest/actions/trace/tst.array.r
> > +++ b/test/unittest/actions/trace/tst.array.r
> > @@ -1,7 +1,7 @@
> >                      FUNCTION:NAME
> >                             :BEGIN
> >                0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> > -         0: 64 74 72 61 63 65 00 00 00 00 00 00 00 00 00 00  dtrace..........
> > +         0: 34 12 78 56 00 00 65 87 21 43                    4.xV..e.!C
> >   -- @@stderr --
> > diff --git a/test/unittest/actions/trace/tst.array.r.p b/test/unittest/actions/trace/tst.array.r.p
> > deleted file mode 100755
> > index b8cc8daf..00000000
> > --- a/test/unittest/actions/trace/tst.array.r.p
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -#!/usr/bin/gawk -f
> > -
> > -# Some Linux kernel versions leave garbage at the end of the string.
> > -{ sub(/( [0-9A-F]{2}){9}  /, " 00 00 00 00 00 00 00 00 00  "); }
> > -{ sub(/  dtrace\..{9}/, "  dtrace.........."); }
> > -{ print; }
