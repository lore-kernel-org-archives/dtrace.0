Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D56A15A8
	for <dtrace@lists.linux.dev>; Wed,  9 Jul 2025 23:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752104726; cv=fail; b=iRYVU9fSsfuaR7JM9ZqO9c9UxDEjzzgiANNk8VbEYiE+oTV7//qzs9QrvlFoYc6KL3tShuWiykej0BHV7c5/l0Mtu3W/M915j3hKnwOVbop0KgPrEcBEI9q/gdIRrpW34jgofOuaE3If/NoNhbHmuCm+0WcQjVaIRBol/cz2gKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752104726; c=relaxed/simple;
	bh=C3Av663t0Jvfq0APkue3UXhjrSXWyiOqxofwGFYFjCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eWA1TMtqlzzqdnlJ3MuD1eXq6UXzipH3/K/Pae0T0Y1/vXrdU9nns+raK8tjXSRWE9tGExVKN3NXPIibJCdtx2h5D3wjvngguIx1MDF0n59ic6UO0eSTGZSKpwzz89hlqlQU1kqiLjjN5lD9rPnoKawjVMpYZNdd+DbEXxCYb1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o8ddL6eJ; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bMx2KrL0 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o8ddL6eJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bMx2KrL0"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Mfc1m020809
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 23:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=c66i/vRHgmnmcnNuwJEOHZ4NiIpbJHpjiGzCIxmdmDU=; b=
	o8ddL6eJxwn6qmZWZIX1k2a0xQIgaOxEaHvJB8fbGG1p+DWjM3nfR25YMRfkyAvv
	P5AfAjaU0RjOUBhDlkIMdFDk0BHJozxr9sdUaayNpVZ6dwGOE+KFlUJwJakioSUH
	12S4B92cDCKnVM0Lq4zxrpO18tuAsLH31lNPFGt6zaQLS6mth4tBhZu+HwVs5EUY
	ZKlqcqHDAwQ14ZqHh4vmnL2EOGaiJodbB1Ytdv3R2hLEGm+9u2aCoxr5SSnONYrW
	C+gBKvUs7FH1BHECfx+aQEqQ4n+dV178c3HYyXOWpT3NQapo6N5CLUN+VBf37360
	0dJ3hzFjsvBC6Boi/xCOCg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47t1em01ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 23:45:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 569M75iT027291
	for <dtrace@lists.linux.dev>; Wed, 9 Jul 2025 23:45:22 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgbk408-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 09 Jul 2025 23:45:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COLUKX8YSSZtHvracatptM+zaeHh8r2VxKQ/nKgAyfOQKUBZe4Vqc3qrMvoco5xquE3+t3HE94hRoC8+J390/NTNyCSgt+bcoTyLr0Wu+WTdgq8wvMpOSA5MfzSYDNHsCXO0dv6EVcr9hJwryAASVlbpIn3KmZtj/ah/3wxz0dcLmroh9FO3GuxopTj4cW9SvA7oz66KhRHJ/pjZW0P+NEgU5OJxnRa2i9kU7HDhb3R74iM9dZohsPc4M0ikbYTx+MZf0fLmIg7Mp/p0EjYmsqeA21pFMGe7X38d5sTjGjS3G5O9IdsbyteTjzkdjoNaSzyRdfmCbjQgUAWmedglGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMKuecpzbtNf1m6roBgY87wQBeMln1xU/ac+svEAGcY=;
 b=gsuZlg1UyL5gtkolXAfmmogI9G+tFAQe5G+PZm+/BEU5yAC20Kt7lbJIWv2h3qkCgrifOXFfgcSF7jCH9ZLeysNSn6IVxDlCAuxH/jXhXzX8fZ2jxJ0mmHDn1Ih53u/fVdtwkHOvFux1kGpwwoCsjL3r1Z9mdu/Ylp/9g6FCRxLRTxSbkbMnvkvGJKEMHqNl1rdzhQqmDd7W4CZ6bOk5gwNa4+6QQmbx1LfFTM/h5jcHkWsw8+LgWJDIIeviMjOykJ/s13wTJxP3Ar1ImIILqKwd7ifQXcFPzWKwiBzTb/4zKw/Guv+ESr1m0ytEKYw4qldkNmNJE4TVJc5HZRfS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMKuecpzbtNf1m6roBgY87wQBeMln1xU/ac+svEAGcY=;
 b=bMx2KrL09x+Dzrmu3vq0dhly8Hrav473WszCBZva8mk4H2Qfdy3uU8yR215XwuGGjmlRy2LeTCHI+o2hfvv6tGuxDqnZlR741WwLu7TZ8CB/yGqOYauZW31JYLTeiUslypU/+jd9SNgV1qdRpyUufDBBc0ZXmX2WMFpVitS7Zw8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB4520.namprd10.prod.outlook.com (2603:10b6:510:43::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Wed, 9 Jul
 2025 23:45:20 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Wed, 9 Jul 2025
 23:45:19 +0000
Date: Wed, 9 Jul 2025 19:45:16 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Skip err.Z_no-w for now
Message-ID: <aG7/DBUnMDy1PVVS@oracle.com>
References: <20250708045257.13808-1-eugene.loh@oracle.com>
 <87ldoyev5f.fsf@esperi.org.uk>
 <4677a328-8622-794b-5273-f0aaa6d12032@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4677a328-8622-794b-5273-f0aaa6d12032@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB4520:EE_
X-MS-Office365-Filtering-Correlation-Id: 0912df0f-209b-4a48-ddff-08ddbf42aa08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?XA0hcfYFYWv+61IbxtA9aAtwyKMh2tCFgTbUaT40irySxuFQGqEeF+UgCF?=
 =?iso-8859-1?Q?y7eMPox9dsr5/ZhaL8F79CR9JSHx4m9gf/QeAahx2ce/RICFdKmWTklUow?=
 =?iso-8859-1?Q?wk84VzEhQpaQ1dwDLrCLv7dwFjq4Ht8lk9n8z+/asIyOcWbwtXAIkM1hu9?=
 =?iso-8859-1?Q?rMOqxwFGw0jRvsQc7uQfLoCF3SqZnX14zDgRfN6wDg8LL0MmBru6FSYRHQ?=
 =?iso-8859-1?Q?9XB2LUMfrPlMD+bOG41Y8wx4z+5ZRqy60jaaAgN0lsRda3dqlhH4TY1oMA?=
 =?iso-8859-1?Q?q0JIX1UlLaGLycYxUQrHSbdibK9FWIiJBiMp+MgdD4gFTqpCB11J/YLNEB?=
 =?iso-8859-1?Q?s0mnT84L0mU4N946y/GJZR4/ywzfU/SVtLshG93fJRi5hU+RARYegA7fKc?=
 =?iso-8859-1?Q?0XtXvdI7IXYi/tfwqJjdB5EYuWFDivG4P811PbhiF47Vfga9S3JfxxYASa?=
 =?iso-8859-1?Q?kCLunWSLlj8HQ+OH6+T2ZQr/XPIAkPXM/WCplOoImTVbNkEfXkET7/RyFo?=
 =?iso-8859-1?Q?X03fU8paxJ3VTYCoZ98GoZk45ZBfgq6xlJPodRbIJS3YlRiUaPit7gogVi?=
 =?iso-8859-1?Q?GO1hKCDUAOl4HEHlJHqAGhto54F/KD0thjzdsPaHJpliMTzyuWW8mewKUr?=
 =?iso-8859-1?Q?6IVR66SOIknBaKApxuo8Z6UUgMTQYtxs0rpvr8PuWxXv0fg+98hB1C+ALE?=
 =?iso-8859-1?Q?A6Bs+OQb+E53wD3jo6ZyKP3uqMzlM+ioDEeOmREIhweNOBSEwzmPJWUre2?=
 =?iso-8859-1?Q?5INEMisi9vEXeOBHmRu/dp3Cov55liBlLLbq4SNQAE7ryP47Rafa1prF66?=
 =?iso-8859-1?Q?GrxEQwyryy6UtWM61z1Sy5KMh3oRZp1s2EYk2rs2XYYnJcPLrorfVCCudn?=
 =?iso-8859-1?Q?mNQyS+r2tN0A7gJIgv40iumSb9MoPEULIq8k+bU0CIlyjikF0PH8CQMFT5?=
 =?iso-8859-1?Q?gGHiRAy0CrpLpJJrbM7CoG10OuvxJ6KbRPMoDwKs+Xr1tL5LXLEMJ8Zm4x?=
 =?iso-8859-1?Q?kSs06BoSnHMNhuSAJpmTV19BdYFD59UeK07Gjs0IjnSNy9WgAyG9MNffnF?=
 =?iso-8859-1?Q?IvVZBx1Q0WWkygflZAM+J1vm6QhAjr3d8mC4KYbv67KQf4iMGBn6jt37wB?=
 =?iso-8859-1?Q?8fSGTCJJpSJ4Nxdb2pLH35CBZrBAFibGBTH/TrD+b6hAXtzPZ8OIr5pD31?=
 =?iso-8859-1?Q?jgk2kcatH6QCiIsIcwKVbGpaOaYYZUF2s1Tw0qjZwRweCqkcw0Xiz/hSMN?=
 =?iso-8859-1?Q?wnJsZtE0KnUXrIsaPkQFCD77cgik66+1RFr97WZvttAK62njeDjNGWP8gD?=
 =?iso-8859-1?Q?CZMYGnZ8iw9Hl+x9Kz7ix2QF6woegtaQpnlhDoCUSTXOJWpmCc6edIP3DT?=
 =?iso-8859-1?Q?d6h/bJ5+B5YAPzL3wPXXO263+dAJfRuOzUcRZbzjiwIwSd98oh+bPsnN8K?=
 =?iso-8859-1?Q?u+SR8emWPyh1YdfiEHv4BPOchs5/ZXzdKBXJthMLZ6KjCwwrJshYZW/L4h?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?3s4phT/MdbpGaWs+ypJGsfhuN0Ml8fSBSf3MOe4WLCwzG8ACDqD0xnv4Nv?=
 =?iso-8859-1?Q?INuLboDHBXo12f6s4403/lTvjOSbke/Slq/AFsFCeKrS7E9TPgY6tzGMUm?=
 =?iso-8859-1?Q?tcQWIaYynAmJ+wBTlw/Qrz00lW4DKaspNlc2sfNzlyCyYmSqLUGIW91HyP?=
 =?iso-8859-1?Q?WxU2zjAv0ZgcBn244tmNDzNj1qn8Qfc/RxjET5JGfM/C7USFfcmJUqPfX8?=
 =?iso-8859-1?Q?Pd4y2nzmqfe9NPmdZKbEYyQnxcMitMSxwMRmGg/lbP1f3teD3RGwz7zYDG?=
 =?iso-8859-1?Q?3rVeMQzbEB6NS9EOiFprHJD/aItelamPfCEiBYd7yCK+i7TFZVi47pU0p/?=
 =?iso-8859-1?Q?NLbk7nOUpqUGTQFsPFXzbFFgchYUMqV10bKo86jm9uC2XnWdl/rDa9g7LX?=
 =?iso-8859-1?Q?LilP2O2R+X4WZXbHQYHpBvy2NpwuYQ5FMuSQwGZNitFYhWD4boKkGnXBc7?=
 =?iso-8859-1?Q?Metn3vnAejqqOe8GM2cwc2CtQUn4m25Ybb1BnuSD9LawkrM1uTuAJFohlx?=
 =?iso-8859-1?Q?ME+DW/OLEsHHCUfPlameZHFESbY2K9oVQou6T5OKrj+v2C2jV/jet9IgiG?=
 =?iso-8859-1?Q?tin7lj+BQEtH4XbUnkd7OhmndQHMP4heVZ18RzYC/gmixE5nBJqVPG6bDD?=
 =?iso-8859-1?Q?45Ut9n2k+t5Qmpuk3b0XqheJkPWfpLuyfloyeATG8io79feI5sVLgxs9RZ?=
 =?iso-8859-1?Q?yxNOSU6cUfgaTeIyw2esa1TIDOzBTPeCaQiOC67hmRr2zqd5g6y7bzE6NZ?=
 =?iso-8859-1?Q?60E35TULxU1TIeax0/q61sj4X2q9AUSTKdczVZArv6FM5cwIOdj+Gh+H4s?=
 =?iso-8859-1?Q?msDLUzh6P4EawY+rEAZv7WBTUZH114O3t47LipBR+FR/kwJ0x3wO/0axoT?=
 =?iso-8859-1?Q?+gSuk5OUjy97doutIAGJmQFnaTRO4PZAib7C65gS3Wd7Bd6Zf5QFlWNp+r?=
 =?iso-8859-1?Q?b3n4iQBM0/YX5kB00V0CC/LXdnfZ14w6Iaf4Iz6FT+Fxsnc+BQSYgWs3UV?=
 =?iso-8859-1?Q?tnTqytS2xJmC/OjmFaDhAaw4MUF8ye2EIBt6fCt9WMKDZ5IpWhlj/WLaC4?=
 =?iso-8859-1?Q?5KFhV8u0p9sMxhAjuGahf400a3FPT56JykvK6I6o8Zz6knRgjUUS6cXd5e?=
 =?iso-8859-1?Q?5yZXWLYR4lTE0vmFWSaPqHfMDHpWXMo2jkU2/XVfLaDAI3eRLl0XKWNHbf?=
 =?iso-8859-1?Q?Go+yjhL8HNzCdslDs+QBcZ9f7CpNbTWrUpS+tqtxt0KJ2A6QViXudiJ/1T?=
 =?iso-8859-1?Q?0Zfr2fy3fbkmVmtUuxIIV01RmgcSCP2w42GNsoxsB1gmBaPLhdj4VMnUtY?=
 =?iso-8859-1?Q?dN/k2TuPRVjcz1wj/81Tql/lyKwa0So55UanjsuS26nVIVJ5GVZu/ldKHV?=
 =?iso-8859-1?Q?2hZLm/lHaPgihjyAdgzvFaOqZRDo/Hk7aNjrBlQso9ChmCjCCU7FBQ8AO5?=
 =?iso-8859-1?Q?628hzZHCIeadJygeBie5oLfXIcSARYFINwJsyuQHHkCDKP5k2DbpR+gYyi?=
 =?iso-8859-1?Q?+vYbPP0QoNqCv4KYk5CJMaeDJemoM+uk78zk+jddxdMsHj9I7GJ50NkZus?=
 =?iso-8859-1?Q?ddcF/W9aNaafxc0WAG/l2iTxiyO9Ck7zOLtzIsGIl+lOZfWQauj2wnHrtk?=
 =?iso-8859-1?Q?NUoy3rOPCYnShVBEYufILNWM1eubPqwghHbC0rbSG3eIV+0877YcFWdw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3UKhldaky6iAjgfwrVzRkzGSCWCDT7tZtP8du/9vcUHJTk7kxkJn8JFZ/ufuDy6DKBKSEOjn9KLGBQVF9HhIQolKh7f5ZLOBDbsM4AfyhPG4ak7SjelWNDxQAeNGc31ITvd5FvVsEQ1mXH2bzErmLQTEbCtaF+3YnH5JwlOVM2NilXX4WTMkVWRXk4o6Q7d6pTLGECpif4GxgeFwGjjlWo69zhK9STx2cq7xs6xm4rJzPSOwOXkTQ7NphFGKIqWIctW3kyP8uBH6EZUgmdLDr08FhFkQO3/Yw8glhSSR/9oYT7MAEnYDYVXJUmA5ZQaYmVLPqa13XMo4Tv7jWvgoCu94kNCFNdZrvTNDrqrQOl+36mKuTCjYOhIW5ARjrMALU2wYU453y2ffTcAPIID4bwTAZEtF76pp6BcEUdU+QZpSPuVEPsT8U3xCm0ajqKqiWSyu8llfxg/M67ky8ZarrfYXR+hybdrjVVukVo7Gnog5tFcBEYgkoPpJYc2M2lt5cIOgJ/aAn8gh4Iq4OBUfDlrKeYdwyRoWcWHJl/RtLvJmWYDUA05OSVJvez7KtQM1bYgQ/BjAR50p5e+awIXXj14ppV7YQoPlnx4JISoGBFc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0912df0f-209b-4a48-ddff-08ddbf42aa08
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 23:45:19.9156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CF6mfSdwDSZ3BxR7bKdIVYksnWHWP/cL8je2cWqtaXZuRCGdZQaAwv0j5pgb1Ut8aL0szmnzMlliTcsQdYIPl0UIqJ542GsfrY3P+P/SPog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4520
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507090214
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDIxMyBTYWx0ZWRfXy3bkyAX4Om3S yhke38faAe1Zwpxa9ID93qGNe8S8Ki/FZXJ00MwOsX4fExG39sbmF2T5E2S2GGnP2+FfBtE+u1o ZoTPvVVZ1/cjcXs380eYg+YKMV5hShU78zgNKXLyYexz35ppVip1jG1D41YKcCvA/frwGmpuo5N
 tyUCPfU2va0ejS6zCc1krmeIUwn9sY5iAiux8VgCnFh4ockLXrevUum5FRFTZQPrh+NJJz3lLUO g16QSLlJewriB3Q2i3KFLQCxJnNbW8CMELuI1EXpY27LsmsZ6SkiHVd9UCWS68XtslPca+hr2VZ sC3YHid2tM6a0rpxUuZ0FprlZSVf32zGk54essbBv+fZR4Q/xN0ysVE0HNDo5WDid8EgtIZBWKF
 1h0BJZb0w8l+7OW7Lc14F0MJ+MyAKJiJvclbgsoL95RJtgwfEPXMpLvtOVvSeFvlFIsnako/
X-Proofpoint-GUID: UnOfLUrUqeSqBvI7ee383g8KlsarBnLq
X-Authority-Analysis: v=2.4 cv=Arju3P9P c=1 sm=1 tr=0 ts=686eff13 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4uWUauLPgEUH2i-DhxAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:12057
X-Proofpoint-ORIG-GUID: UnOfLUrUqeSqBvI7ee383g8KlsarBnLq

Yes, this is a bug.  Solaris (and DTrace 1.x) would load all the DOF into the
kernel, even for probes that are not (yet) available (when -Z is used) because
the discovery of probes happened at the kernel level.

Since we do it at the userspace level, we do not load BPF programs for any
probes that we cannot attach to (yet), and therefore the destructive action
condition is not detected in this case.

That is obviously wrong.

There are a few ways to handle this:

- Report the error at compilation time, i.e. if we encounter a destructive
  action during compilation and -w was not set, we report an error.  That was
  not really a valid way to do it in the Solaris days because you could compile
  D code and save it, so you wouldn't want compilation to abort due to a
  destructive action because you didn't know yet if you were going to use it.
  We don't have anything to save compiled code right now, so this could be an
  option.  But it would change the error from a runtime error to a compile
  error, which is a change of behaviour.

- When we are ready to load programs and start tracing, we can loop through
  through the compiled clauses, and if any use destructive actions, abort if
  -w is not enabled.

- We could have destructive actions trigger setting a global flag, and check
  that when we start loading programs for tracing.

I think that the 3rd option is likely to be the nicest, because that flag can
be set during compilation, and if we ever implement something like saving and
loading compiled programs, this would still work fine (we would process BPF
programs that we load and set that flag upon load if an instruction is found
that amounts to a destructive action).

Thoughts?

On Wed, Jul 09, 2025 at 06:39:31PM -0400, Eugene Loh wrote:
> On 7/8/25 08:15, Nick Alcock wrote:
> 
> > From: Eugene Loh <eugene.loh@oracle.com>
> > > It is unclear what behavior is desired.  For example, consider:
> > > 
> > >       dtrace -Z -n 'BEGIN { exit(0) } foo:bar:baz:bop { raise(SIGUSR1) }'
> > ... isn't the lack of semicolons here a syntax error? (Or have I been
> > inserting them pointlessly all these years just because awk needs them?)
> 
> I routinely omit semicolons.  Okay since even Solaris.  E.g.,
> 
> # uname -s
> SunOS
> # /usr/sbin/dtrace -n 'BEGIN { printf("hello") } BEGIN { printf("world") }
> BEGIN { exit(0) }'
> dtrace: description 'BEGIN ' matched 3 probes
>  CPU     ID                    FUNCTION:NAME
>   51      1                           :BEGIN hello
>   51      1                           :BEGIN world
>   51      1                           :BEGIN
> 
> > > The first probe exists.  The second one will be ignored.  Solaris will
> > > reject the script with:
> > > 
> > >       dtrace: description 'BEGIN ' matched 1 probe
> > >       dtrace: could not enable tracing: Destructive actions not allowed
> > > 
> > > On Linux, we have:
> > > 
> > >       dtrace: description 'BEGIN ' matched 1 probe
> > >       CPU     ID                    FUNCTION:NAME
> > >         0      1                           :BEGIN
> > > 
> > > Perhaps both behaviors have merit.  For now, just skip the test to
> > > avoid test failures we are not ready to arbitrate.
> > Does execution fail if the probe exists but there's a BEGIN that exits?
> > I guess so.
> 
> Right.
> 
> > So the interesting question is: if you start with -Z and
> > specify a destructive action in a nonexistent probe, and then a
> > USDT-containing program starts up that provides that probe, what do we
> > do? If we don't terminate, that would be surprising. If we terminate in
> > the middle of execution, would that be more surprising than checking all
> > bodies at startup and failing early?
> 
> I think I finally understand what's going on.  The point of this patch was
> to move on to more urgent matters, but there is maybe a bug here I should
> fix.
> 
> Solaris rejects a clause even if it's not going to be used.  E.g.,
> 
>     # dtrace -Z -n 'BEGIN { exit(0) }
>         bogus:bogus:bogus:bogus { raise(SIGUSR1) }'
> 
> Solaris says:
> 
>     dtrace: description 'BEGIN ' matched 1 probe
>     dtrace: could not enable tracing: Destructive actions not allowed
> 
> Nevermind we do not use the second probe description.  It's a baddie.  Our
> Linux port has no such complaint.
> 
> What about the case you propose (which is, after all, the question being
> addressed by this test)?  Well, "it depends."  Put another way, we won't run
> a destructive clause without -w.  The problem is that during discovery, we
> might first encounter an is-enabled probe (which we "enable" since it's
> safe), then later encounter a real probe and reject it due to its
> destructive clause.  If you squint just right, you could see this as being
> not incorrect, but it's kind of goofy.
> 
> Ideally, enabling probes and their is-enabled probes atomically would be the
> right thing to do.  That's a tall order.
> 
> But falling back to the Solaris behavior of rejecting destructive clauses
> without -w is the right thing to do, even if we are not using them (yet).
