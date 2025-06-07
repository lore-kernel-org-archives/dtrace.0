Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1EFEC4
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 05:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749275560; cv=fail; b=dFGWNhP+H9id5Aep+vj4UXBOwjsGsuJ0/H/2088bJcJHAXOh5mICAe/fpo/V8LHPgXLyXUbpkzL0sL60Rn7Nf3+Y7leInDg1zjplS5xxsf5cn59Jzx8RoYZMSdG1m4dkseQ1uP11g/Rt6hiwwDeykxHHgjR7SM8ukgiqFOi5ad0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749275560; c=relaxed/simple;
	bh=HX4Kp1MCiruJkcvQdJIrIsrx632TVVl/jcAtqFknBow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KjK/Ie6+wxW/cN++edRivbc51Zs9L76Iw+5GWIYPkFt9Q91QvlJNmYU26zMyFPoikVSA7SNZeQEByytZU2wnREQhvAzN6DKENmFpFkWZUG0v2Z5sGyJHN7cicxFJi5iCn1XCImMc4+7D5KlJAs8e4j4WA9u0xyg8NQYr089BCD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VFFP3Fc1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kUme/R5f; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VFFP3Fc1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kUme/R5f"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5573iYfW015448
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 05:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ox4djENZKOITcT3Rxf
	6SpsL5feK8Mzn5YslQaMwfUso=; b=VFFP3Fc1v+3MhuesEvs6tGgK5L2uigPOH3
	S07OsEnO8WZJTdbIVwSBE8SQ2Te1iFJYpeLBBCu+OcBfzaLP9lftJdtYAejviBgM
	wX2nDJMCKvCBSNBbYPsGQ/dKl0jYGevyB9dWbtwKre5Ipat/nKHFgcVOs4QtWDJ+
	SRNOriM/XDJMgjTudxHDup0tfSEYBUXLTVGY/NCwQGQto0Ep8bH8xcEvNUb9mCnf
	ovabivrhj+ZC/9jPHIRxm0Qa6T2RLeYUpCoSg6nrw5jRr9O/qb78+ZqTnQv9GmHX
	aXZnHYs6HzaWXPR0SWwEPTum+ogKxoT0Es8dxUfAB4vAwwRY290Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c1482y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 05:52:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571YVMs021713
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 05:52:30 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6kk79-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 05:52:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aM5yLljBkgagJehb4z+Jxu3BFdsDUwkgCoGQsv4ma17in5KJdU68lrHatADjSp/0NqSTiIzMaqJZBo76ewCb9T5VbuRsH7vh6B5Pe+Cy+uX/fJwCtx3yEzpmvXkAdKK6DK6OZTDWlyAYwuLlIdNxXafZHJ9ks3GDQexV4/OkdGfgUet2j59FIn2aZrFKi5YRMLonPjUTlWKBilc9NinpM8Jhph++7jK2aTYH0ovKZ1a0dn9lWF+OVr0sk1rDzFRTJDwjoy/akLTJcSinKzavFtj1oXpMR31tkvgRK5OKTPTmxOr66zSrywoCJSASRciZ1cVB0Fi57SzB8wJfxSQs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ox4djENZKOITcT3Rxf6SpsL5feK8Mzn5YslQaMwfUso=;
 b=d1vGC8+TuKy1KgsQEgiQ5r9u48l6n91pXoxUrPYAXVl+0334hu+IEk3a+8b0bIJKcwTjPsBrNkBAVZQJ9e8yXvCnGcbuUSeW+k9bCgHfdG6Exn6g3hkMPeZ2RUNsqKE0AJAi8quSm+CSo0oWrM4D73y0+Cfm5zFaGtVLqDMaSm01lI1TWhI7yzmsVuOlqKZOApvkc1LMjW/cLFKPfmeIK2uQzeEQBA+zZjIlyPpyUiqmtnIuFAgjZlvV7E/beelXFvLRJ+ReKrWoGC0762aJRikorV65hRmI/KP6QM00QPOorfbbtKn72kgwcYMy3oBn43/7rN1cLvDFH3dereq3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ox4djENZKOITcT3Rxf6SpsL5feK8Mzn5YslQaMwfUso=;
 b=kUme/R5fYqF92MWJrWMHUdikQanutJoPn/7WzDazBZzqzMB/NMiQjBwt2qcmk1SwgCEPCTRYr8fuGEwdjjDdvwa6rdpRVdidw91M2cnQpHhzhT8256y+/Hojxfle7SLveHAqNJ1KOZ+jSoGrSSZ1oyJ/oF3i//Pbz/ZsZvWBrAk=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by BL4PR10MB8231.namprd10.prod.outlook.com (2603:10b6:208:4e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Sat, 7 Jun
 2025 05:52:28 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 05:52:28 +0000
Date: Sat, 7 Jun 2025 01:52:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test:  Adapt USDT PC search for USDT LTO changes
Message-ID: <aEPTmiN1+ChsB45+@oracle.com>
References: <20250603042146.11894-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603042146.11894-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|BL4PR10MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae210dd-a587-4673-af87-08dda5877c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w601Y4iNNtnjW8R2Xy2QFUwaoNxa3OH+nQdB+hcP67hEyUiV8r5wP2xrm23u?=
 =?us-ascii?Q?fRKAiVw1F9a5PQ2ICU7yQx17aUmQLVnY9W6BmmfmFnBUQr96kKYMe6sZF2b5?=
 =?us-ascii?Q?oSkYpgRMouV1oTM9Skqm9oZ6oqehxeZWY5E6m3f14luf2doHnDeu8w3l/fIE?=
 =?us-ascii?Q?RyScwrBNXIyedBZ6JEKxdyEv6vdCnVY0o99k1guRkdeOdBWL950C08T0zheJ?=
 =?us-ascii?Q?kG05VlfU7UJ5UNK01mH15XgtbU+Z02cA5UHv5izyMpIoZ+j4h/I6/26+yEvm?=
 =?us-ascii?Q?WO8evl42Q4g7TJ4FXNy1DIZVVtbt7Tx3JehmPYXCmC+/+y0teG7zk00L0uU7?=
 =?us-ascii?Q?Ffcz4qZSr8qBzSSTCUtAWHplAZ4yyi67cvHiWrYvv7SNN+i4kr+c1NvC+/ez?=
 =?us-ascii?Q?KedkiOLEb8x9nuQQmhU82Gywj+bV9ACRTURCvMQOjNjIcJDQdELD0cN3DTVx?=
 =?us-ascii?Q?W46L9fxlyz649nZek/gCNW8AE8GeYfY6dvWzHU5PtMEyoJLOuFaZ9q8Ru3Se?=
 =?us-ascii?Q?rV7lDfYFz2dEiitA0kQRuB+n/4jxD7mWI0bqrb0KUiD4LzMrEBa8HmW4nJir?=
 =?us-ascii?Q?/+MQ2AMbBaJe3slNzqzrWpLOKjjHiFjoy5VhGCWKEByD3n5cq9bNg7MLzI/u?=
 =?us-ascii?Q?lETYCFA8HXkxZvjrwxqiiha69PiZ8INikyXAWcHQBsGDsBxLLHRTHDZIbQ3W?=
 =?us-ascii?Q?LUDdbokuaPvV/OuCitsdERJXCZI8cDKpZZSvMxAT9mz2e47lEgogcFZTsTaa?=
 =?us-ascii?Q?SeIOfknZ4vrgz5otqmfvz3E5exGExuY96Fd0wSsogZ7YALn+114KexizQmjr?=
 =?us-ascii?Q?SWZiEIXWhe2FRX8GOss3Na8F7056wz28ezS7xnbEpcG4PYb2h2fy6LH9kXAT?=
 =?us-ascii?Q?k1RB4IOeqL7KTFrA/7BVzpi/9ltrVS9ZByQG44CWa9ReH1jA6ykBl/k2wBXF?=
 =?us-ascii?Q?3T4ebKrfIlHUFCBwbsROPsKPkniqWE6agNWiaFcadK51qQxKDJrG/seQus8M?=
 =?us-ascii?Q?beSyKcqQ+Zk0XiGojTajUk902jEtkWX8doervR/+GULmEB2LMkowobAo4NTh?=
 =?us-ascii?Q?NO8Cp3GLf0PglSKcU1sAld9H/7F5iKVLpjMMUrEa68ZUhHwdWQymPgD98QF3?=
 =?us-ascii?Q?Tba8BMqo9Ojdj5Kpr964Et1/zmVNaaoNMEMFQIPYeqgeS/57dmsxH7xAnUZG?=
 =?us-ascii?Q?5YhEKygGQ2V0hCH3lQ/dTYk2qRd1EutNoockVQyd6iZ7LT46yw1+dGauj8vS?=
 =?us-ascii?Q?J4gADi2K+GynKWp9Y2hgtsqJWewDLeF2eWkpC4NW9rnN0HNqfTYaytuLmj/1?=
 =?us-ascii?Q?h7FrTNGFnvh6/oVjt4TUiZnf8WwNuH0VU4ug334e1Pp5QhgJrWVlI8Gx5yea?=
 =?us-ascii?Q?ETqzds6nU6Xy36ancl1so/QQiVVYEq8t4Cdf0KPDea8nxCVHZBsXfusSkZ/Q?=
 =?us-ascii?Q?QXUXaEEV/Ho=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fMjM5LppeyW3dvvZMufP2DiIWB28CsRu7v+M+YXnBeqqXnD6s9yeo0ATSTPH?=
 =?us-ascii?Q?GEJd+RgV4A+pHnDCl8M8ItZcQqv3AnidxtUmgc3GMwHlDbGLlN8Jn+VVxdLv?=
 =?us-ascii?Q?Bh11CnKhD2NeRz+2i4Tamnz3hzSTyJ20YXUD1/fTTXa2E+GYXeKW1WSUg80F?=
 =?us-ascii?Q?sTr57yYTX3Ll28HqoGMU59DnHhPIw81MlLiSEpryfagWWCwDlDtpf+A3W1D1?=
 =?us-ascii?Q?w+gVE98P6smSoPvtPyekK8akg3k3cTlHlR5k8CjxtnatdR2SKDH9IxCXK4YZ?=
 =?us-ascii?Q?I4LVFZDf1afuqyCCKEKVq2lf5ilfs7txWg5wFlKHcibSzbRsHoCvf4Zd/Z+m?=
 =?us-ascii?Q?cGTDiRSbFZ5lchINXGQlj7OQmA5uHZ+7gD6/8WfjqLqjJWvdLcrZ3S98JfS8?=
 =?us-ascii?Q?ZJKdDSiRIIg1rw692JrhmB2jdccaU42vpItCeYrLz1GjXtN9GiyWH95fQhG/?=
 =?us-ascii?Q?J92SLMNC79quOIECqWfOkQoFeXKYiHCleA4h9gpWICjgRVEx/sNLKKZmoCX+?=
 =?us-ascii?Q?tWQ+pA1Qm333dKxs3rVlYiaPVE7smZiobf9yZW6HG6et5qH3/aYFXrTXxT+U?=
 =?us-ascii?Q?RkIfGTO+hVc43Glmyz+fq4HHCpAIqhwToAmSZiAuDDK7YfYJGjeYuUm6jGA8?=
 =?us-ascii?Q?oEjm5FOx4gigIQadsowvgaHxYoG1YogucBLtV/wFZwowgawC4pRWt7Krapb+?=
 =?us-ascii?Q?v8SBiGmp1PRfBlwt0fk5FCc8j7Gc8NIv32Yx4cwQhv5Knfl4Ti2d+WjCr1IE?=
 =?us-ascii?Q?rO0yQxV5EbWqKAQbvDeOmipLqP345gxKBdv5dfy5xmi0LdcjhsWBZtnmtn8O?=
 =?us-ascii?Q?Wn+9mOi8EMD+rFmsdi5EAkeuZ39YG5kWsbKT+ocj73yHhA79pCAdUEbvLpJX?=
 =?us-ascii?Q?6uXyyFw2bRnhjVHQKydzt9/kc9MCQ47tgDEgB/1IXfE5Sa949FdPElNaTYhb?=
 =?us-ascii?Q?lVKNJ9SEuCbQxUDKD7c9o5qimrx8tpmZAR3Z9egI7j+awczIJqg1vUQbspr5?=
 =?us-ascii?Q?B4gkwpRXUataJlCgGi49ahP+NFPxDAwdvDV932AqCkvYfv7d0xllt5vSwPyo?=
 =?us-ascii?Q?H4y5r1wQUJNFKcWRhp24SrM5rR2vL1TYc5739uaWDXw7i68RSaMFMAfKtKsu?=
 =?us-ascii?Q?ghfjv68weSdQ/dGzDm3D45AhhoWGS83vUxnLSxe5DOngQmXzXabWM4wSmCQF?=
 =?us-ascii?Q?XPr5hr6knC6tMCzZ8EzYKYkn4p86DNbs8L9NL4jPqtI/8aUpmmDqinw18MaS?=
 =?us-ascii?Q?A9EbCaLwkNtqcSHcnuhksO3SuN3yurgg0pFgZToy55RZR8g6Hwcfp2SHu4+6?=
 =?us-ascii?Q?m+ZP+uWqNiy1GXUrbMAlEsiWLmaSuSgz5L5IjGFSMsqlbGnArqjyHTLoHBiP?=
 =?us-ascii?Q?HSxwfLEKv8dlXoKYOEVRoQcidqlUID3zv1oxK//wBQEMEu0FTga3z+ptymLo?=
 =?us-ascii?Q?iktYnwu21aoyXDkzMG5y6OQGfck2Spg68U0xWANXD3MzZ/ow3hhaiqpqtbmw?=
 =?us-ascii?Q?4SiUhi2QAE/e/O1+WK8W+WZaNLnUoju44jqScI6V1K1QlgSoeBA8AFqUUcGt?=
 =?us-ascii?Q?K6xiTYQGR0F++QdMfNsDHkI5UHGoTKUntZ82EXVmHzVuSuIj5As+tDyNG6vf?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6X5XwrvpPwjXjj/mPKdLm55o/QdiAa7uC8aCwRJWU6We2xGIFHrYcG3VkNXlj8qk2J5YB8Z6QERtieD3nmP0Z+Pr2QZQ74cadrX/JQvUeMAHWfmLworh5oudTUieiQiYVAW2ooNTPTZBMN8lEI1YWDAyjcYl++xHlWJ0i4QPJ/JeRBRosdVNlvSb+wGmnwHUdDK1JnYxbsNJPfCo55KCry5g3r4HQGiH1kd4alK1Yl/zeCAr7Vv6MgPSivG5z8opI122Hp1JADoQRcsEmc03FVVTlVRC6ufhG14MvNIibQLy5wTb/e4kx9+Uwv0eGDEfvp1jc3RVt//cKfEZk6rkssB3F4mcefHBqrgyg5PtN8Da9FVg7azLU7Q9kGtDhDK9jkXFAJzM+XHwGVLLfo0C626mBf/pUh/VIQmH6jNJHiYyDbJcfudRG63wwlXw0Ymf1oBbU/F1FMD6Yw96R4LxPEWObUslbYGdJiU+wxSLHdYzBFZCKf2nAxQ/yNrM6rjBldHnii+rDxoTRCVTFyPJr/F4tYh/eHwko2Q7WnpZDw8bNmqxHDkkxW6gE9TciEaRrf/j9/4L3iGSWOvE6hV2YWMfw4TXPyfdOn3zR/D2PXY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae210dd-a587-4673-af87-08dda5877c59
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 05:52:28.3291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9vLyHObQ0qp4kBRkYq/KehVHidvy+pN9p17rStWGCspHzqVUZJqe0CDdGeFp4bDhFBKTVlvDSr/jff5AysJJvXo597MTI9LvRyXf1bS6OHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR10MB8231
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070041
X-Proofpoint-GUID: rW-1SJk_ti8BKQ-wzk9yF5D-VWe109y0
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6843d3a0 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=KlniFK40oddZU6-iBBkA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0MSBTYWx0ZWRfX0a61IJffhmvY gSg8Wpy0dVqDDtH8UYgrH1D04JCPsDXzqJqEBWM2WZsgh0vj4pDOcN2T55Z+TpKZFBkNCAG2ggv fBuOsSvhx67nZDhXFRKoSEB9sOALEjvdFuTAZyLKCbExVuwPr4+SXksbtQlosNmZyPUmm1XuGMP
 lWVuoeME/fQvnk0UXrDwdPuQIzc0sL672+GLXeE4mFSb2qdTZWxIXi6S1PxewDqgZbGL7FQCiwS lUXmBnLcNkMKnc+t8ktXvW2zuX6UFNIHJcJkHqnXSD7B/t/HhdkRDAQA1FSxBwrK1v7j4F4ajiv Nbmsp+ypsSDr651PcK8XzIP9G8d0S18OSEn2yc11OdNU+W6h7pUhR4CAvCm2NThMd1tg4tOri0p
 KkJ1g9zKfSlGhlEZZDubl3wFT4LrgYtPoqh7/a4Z45NCpsqdm/W9czk1WFH4I9RmeofAO53/
X-Proofpoint-ORIG-GUID: rW-1SJk_ti8BKQ-wzk9yF5D-VWe109y0

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

On Tue, Jun 03, 2025 at 12:21:46AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> To check USDT PCs, we looked at disassembly for characteristics that
> indicated USDT probes.
> 
> With LTO, however, USDT instrumentation has changed.
> 
> Therefore, use showUSDT in tst.pidprobes.sh to extract USDT PCs.
> 
> Note that tst.pidargs.sh and tst.pidargmap.sh depend on
> tst.pidprobes.sh.  Therefore, those tests also benefit from this change.
> They do not yet pass, however, since index 0 for args[] is said to be
> out of range.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c          |   2 +-
>  test/unittest/usdt/tst.pidprobes.sh | 114 ++++++++++------------------
>  2 files changed, 40 insertions(+), 76 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 26f513fe..aecb07d5 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -901,7 +901,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	pd.fun = "";
>  	pd.prb = prb;
>  
> -fprintf(stderr, "Underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv, psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
> +// fprintf(stderr, "Underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv, psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
>  	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
>  		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
>  	uprp = dt_probe_lookup(dtp, &pd);
> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
> index 0c75d796..6a1fa984 100755
> --- a/test/unittest/usdt/tst.pidprobes.sh
> +++ b/test/unittest/usdt/tst.pidprobes.sh
> @@ -19,6 +19,7 @@ mapping=${3:-}
>  
>  # Set up test directory.
>  
> +d=`pwd`
>  DIRNAME=$tmpdir/pidprobes.$$.$RANDOM
>  mkdir -p $DIRNAME
>  cd $DIRNAME
> @@ -74,9 +75,6 @@ if [ $? -ne 0 ]; then
>  	echo "failed to compile test" >&2
>  	exit 1
>  fi
> -if [[ `uname -m` = "aarch64" ]]; then
> -	objdump -d main.o > disasm_foo.txt.before
> -fi
>  $dtrace $dt_flags -G -64 -s prov.d main.o
>  if [ $? -ne 0 ]; then
>  	echo "failed to create DOF" >&2
> @@ -183,84 +181,50 @@ if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
>  fi
>  pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
>  
> -# From the disassembly, get the PCs for USDT probes.
> -# Check libdtrace/dt_link.c's arch-dependent dt_modtext() to see
> -# what sequence of instructions signal a USDT probe.
> -
> -if [[ `uname -m` = "x86_64" ]]; then
> -
> -	# It is the first of five nop instructions in a row.
> -	# So track pc[-6], pc[-5], pc[-4], pc[-3], pc[-2], pc[-1], pc[0]
> -	# as well as whether they are nop.
> -
> -	usdt_pcs_all=`awk '
> -	BEGIN {
> -		pc6 = -1; is_nop6 = 0;
> -		pc5 = -1; is_nop5 = 0;
> -		pc4 = -1; is_nop4 = 0;
> -		pc3 = -1; is_nop3 = 0;
> -		pc2 = -1; is_nop2 = 0;
> -		pc1 = -1; is_nop1 = 0;
> +# From showUSDT output, get the PCs for USDT probes.  We look for output like:
> +#     Note usdt, type N:
> +#       Offset 0xoffset
> +#       Function Offset 0xfoffset
> +#       Probe pyramid::foo:entry
> +$d/test/utils/showUSDT main | awk '
> +/^ *Note usdt, type / {
> +	getline;
> +	if (!match($0, /^ *Offset *0x[0-9a-f]* *$/)) {
> +		print "ERROR: expect Offset";
> +		exit(1);
>  	}
> -	{
> -		# pc0 is current instruction
> -		pc0 = strtonum("0x"$1);
> -
> -		# decide whether it is a nop
> -		is_nop0 = 0;
> -		if (NF == 3 &&
> -		    $2 == "90" &&
> -		    $3 == "nop")
> -			is_nop0 = 1;
> -
> -		# report if pc[-5] is a USDT instruction
> -		if (is_nop6 == 0 &&
> -		    is_nop5 == 1 &&
> -		    is_nop4 == 1 &&
> -		    is_nop3 == 1 &&
> -		    is_nop2 == 1 &&
> -		    is_nop1 == 1 &&
> -		    is_nop0 == 0)
> -			print pc5;
> -
> -		# prepare advance to next instruction
> -		pc6 = pc5;  is_nop6 = is_nop5;
> -		pc5 = pc4;  is_nop5 = is_nop4;
> -		pc4 = pc3;  is_nop4 = is_nop3;
> -		pc3 = pc2;  is_nop3 = is_nop2;
> -		pc2 = pc1;  is_nop2 = is_nop1;
> -		pc1 = pc0;  is_nop1 = is_nop0;
> -	}' disasm_foo.txt`
> -
> -	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
> -	if [ `echo $usdt_pcs_all | awk '{print NF}'` -ne 4 ]; then
> -		echo ERROR: expected 4 USDT probes but got $usdt_pcs_all
> -		cat disasm_foo.txt
> -		exit 1
> -	fi
> +	off = strtonum($2);
>  
> -	# Separate them into regular and is-enabled PCs.
> -	# We assume they alternate.
> -	usdt_pcs=`echo $usdt_pcs_all | awk '{ print $1, $3 }'`
> -	usdt_pcs_isenabled=`echo $usdt_pcs_all | awk '{ print $2, $4 }'`
> +	getline;
> +	if (!match($0, /^ *Function Offset *0x[0-9a-f]* *$/)) {
> +		print "ERROR: expect Function Offset";
> +		exit(1);
> +	}
>  
> -elif [[ `uname -m` = "aarch64" ]]; then
> +	getline;
> +	if (!match($0, /^ *Probe pyramid::foo:entry/)) {
> +		print "ERROR: expect Probe pyramid::foo:entry";
> +		exit(1);
> +	}
>  
> -	# The initial compilation of foo() makes it obvious where the
> -	# USDT probes are.  We just have to add the function offset in.
> -	usdt_pcs=`awk '/<__dtrace_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
> -	usdt_pcs_isenabled=`awk '/<__dtraceenabled_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
> +	print off, $0;
> +} ' > usdt_pcs.txt
> +if [ $? -ne 0 ]; then
> +	echo ERROR: showUSDT output to awk
> +	$d/test/utils/showUSDT main
> +	exit 1
> +fi
> +usdt_pcs=`awk '!/is-enabled/ { sub("0x", ""); print $1}' usdt_pcs.txt`
> +usdt_pcs_isenabled=`awk '/is-enabled/ { sub("0x", ""); print $1}' usdt_pcs.txt`
>  
> -	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
> -	if [ `echo $usdt_pcs | awk '{print NF}'` -ne 2 -o \
> -	     `echo $usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
> -		echo ERROR: expected 4 USDT probes but got $usdt_pcs and $usdt_pcs_isenabled
> -		cat disasm_foo.txt.before
> -		exit 1
> -	fi
> +# We expect 2 USDT probes plus 2 is-enabled.
>  
> -else
> -	echo ERROR unrecognized machine hardware name
> +if [ `echo $usdt_pcs           | awk '{print NF}'` -ne 2 ]; then
> +	echo ERROR: expected 2 USDT regular probes but got $usdt_pcs
> +	exit 1
> +fi
> +if [ `echo $usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
> +	echo ERROR: expected 2 USDT is-enabled probes but got $usdt_pcs_isenabled
>  	exit 1
>  fi
>  
> -- 
> 2.43.5
> 
