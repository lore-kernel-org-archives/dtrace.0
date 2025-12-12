Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FB2264F9C
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 04:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765514197; cv=fail; b=RMFxPeoPNa2NcN/omMG9JE9RXwUJEd7BNgcwHq5x+C0cCifnFWPQ0BvUM05sX/bCJIYo5f0Xyj+Xo5AOe+nu9uBiv/udTxSr4CXrrgLsf8bgUfm+sbrxm00CcPcqAQWxYuFg0dKajDhtJmzFDEZjfJUtYSJvDQfPyc+vKIrCV+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765514197; c=relaxed/simple;
	bh=d9WfWtTw5HII3oAc5Za15jZmY4bvB624osjAv1Fstl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uALeUEq6a1O8t/ELjFj7xeK2txGQtr3bdlikMqacgcG6nhuri9DQc+eDALY53zsdcTrRHFrY2nuqBx+p1KRPN6sCfA0kApuktyd10VE9njHTmuihCLwIG5XXXYPhKw201+kSdZtHlbiLET+f3hXA8AM3pKx5eCEC+x4bu0x4xFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gO4DZT3A; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q195GqEi reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gO4DZT3A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q195GqEi"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC1gi5c2659636
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 04:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=fPJ7/DqTf/NXpbi1A0aIxXHGyt3bpSVh0vXElUK99zI=; b=
	gO4DZT3AhxbsZKTdef6pN3If3w0OfSAqWuwSMCbUb7U6LKbXte+pXonawChkQjrN
	fJ8sbwou6S+0TSvaV0JW6/TqwhVeYTP3oeDFxrIydkPKGPuO/BuZqO1c7wOIa/My
	LjgUnVzGecVZMFpqACS3U3NpUZomS7KBwpVTzWA4o1aymgrjDSf5rKO/UXQsiJFf
	CXgrnYZSPNmlbfTlCilkPbayU/swV9uO0JnORDVCUAA3WeRoKqJPoB/ZJqRYlKUl
	MXmOy1xhSzwjEjj5o2h9KJGh/WYSAmG+BPupqV9cFOiOtUlTjNtIhmf7zggaUhZG
	5sEPNyVY/VcW8EB6Q+7FNw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aybqv2xqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 04:36:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BC1rkvN039957
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 04:36:34 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxpckvj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 04:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glAt2k8G8GFKq0zz8g38CbjOKYvPEgAJZZlAmd+am4RQSPJbgRKgRn377c6XMwhUqilnJHq8hidDEf5j1VTdNeZCzjRD7mSau9Ori5bSp66CqS2Ak1e1le6X2mZxZz32dE2V0KQJ2c3d712jexBNYu1Q77yKek5JDbCx0kw2NNJV69jXx+gJ87E/H8JtX8YyftdXiIThwSehJWxctCBA9qMenMh89IwoCBZfnAyU2A9KfYVpLJc1cKZJtnDRGNPbu67lMrcVuC6yhyjHpz+15Vn3Hr3YCtzCNgANf/ltv6Q/KJPZxbFQBh+bL7jGVn4ADXWtk5OwIn7WN7vTGrjS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w16cU5KO9oaugSF0kcZ6Ci9W/rJjdkdAqWGCjQsSvqs=;
 b=GW0HlCEMtWgUfnx8pln9v5EN1E6xUEyulB7ex+tDne6GQDPifjKgR8ZgVBD5TvY+ktMMaHjqHuNk3vZ7AZ7S6AmU4OikMIoSBChio72Ogs9esrqiko0lP0oU3hxwmxnE4z7ET+w6Zxu4uKKoCVzVar2fSsvRh0/4a1C3E/XCYExEDDNQsfejjLPy7GieV8WFoQQKZyHD3u29swR5RQAX1kAQPQK12g2VXM8yEhH051aLNzXnIbDR+lTZr9MOETI2SWlpv4CZsbFltD+9+mVkG5ToSByO44cxZYyNFgAoOvCORswhtPdH9Sz93dCHKIB5LhnBSpT8JYPbZ3JBZ0RJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w16cU5KO9oaugSF0kcZ6Ci9W/rJjdkdAqWGCjQsSvqs=;
 b=Q195GqEiDXIHhRJVsDA3c2wfRf6G4Ve+OzRLf5iTcG3Qaw+GpMIlN1Y4GVPMQkm8yFRa4H34QrEDRoCTWu4S+0aPyljNaAU1lNi8ZCwHkCKd+kwSG1SmdBGoxUbTlnzuEvwKu3r5hENxZxBfV+JDO4LNL2jR8FJ/Gi4ZnuPqn7U=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by LV0PR10MB997663.namprd10.prod.outlook.com (2603:10b6:408:33f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 04:36:32 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 04:36:31 +0000
Date: Thu, 11 Dec 2025 23:36:28 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] bpf: allocate the buffers BPF map to fit
 highest CPU id
Message-ID: <aTubzAk0Ls/rv9vk@oracle.com>
References: <DS0PR10MB7522B465E54B5F7C69B0609EC2A1A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <31311402-ac1d-3c3e-4e2b-5e0ae861deb1@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31311402-ac1d-3c3e-4e2b-5e0ae861deb1@oracle.com>
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|LV0PR10MB997663:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fcd6b68-5393-45c2-705b-08de393805f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?+B6vxqmVdCID5gzwMiFcRdcxm7yCTL8ir8NOdaKkxMdu5JkEle1+/5EQvm?=
 =?iso-8859-1?Q?EP1shJf3Gl2WlINuG9ESfp4pECfG4fNC9ZX8PfhablF/a60xQTdGYkKZGS?=
 =?iso-8859-1?Q?ZjO7R6kEFKeUExI8q38fFIB5FbYZrhb7AAGc0hUui4Jkjl5wIWfaG/qYDY?=
 =?iso-8859-1?Q?eyPUaqKz6Xo8Zqe45T7VJjdvfLO192Ac9Ztc3rVafPYQkIHPQwxEMfRtiF?=
 =?iso-8859-1?Q?jppsfa2BN+TAwx+Kv7VMxQwrK5ZR8bUfKpgBo5kLkTETRX5qPwPLa1fLWp?=
 =?iso-8859-1?Q?AM8HI6cnTVCI06mbWe1uO6bAwpDjFb+UfgdprTubPeohfPTHIIHdOirtgT?=
 =?iso-8859-1?Q?/xjN0obmyFWc0Js7H6Q+yHoXtAKrncL7glQBGHiFEO0ktVeJCIb65dH0oM?=
 =?iso-8859-1?Q?nv5pYEiVjaqENeOHtqhULUXN7sJ+fRbn7wZSK9z6ruDIfxoI3MCLnxI2kt?=
 =?iso-8859-1?Q?hXbVd5gn7I9T0AFTT86cFoQqQdQ1s72IjTThhkygVtZVC7YcHyaTp6nfOT?=
 =?iso-8859-1?Q?l0D+vxj9fDR2K8Cg53zlyH8BtTLfg9LdPjJ9DE/c8NNQ9tcff2Erip6zsq?=
 =?iso-8859-1?Q?kUzKzWkJB/SR1LIrE0lh7Q1eY0FIzcVs5u7qoHQ+mzIl8hBAyON4c6UBeY?=
 =?iso-8859-1?Q?8Qt/l6rJPq+B19x8Yv9hEHBXBtAUNjxy3pUJA3zSD6qc33eHyTUndvOJL2?=
 =?iso-8859-1?Q?blRqLfjPCx29jtiXpc3yhRXr/klG6zPlUZd3kc3BGWTOkCJBzqGNLsDCH0?=
 =?iso-8859-1?Q?5e6nCEcb4J0C7rJvnjEX/FJmtwmEVOA94UN/AYHHC76S6RonDKjR1CgGGQ?=
 =?iso-8859-1?Q?CtlGdYRTff+e1REYyYSFPKAqoQRd3ugJ5rAP+oHwuBNre2W+CxXc62hIwF?=
 =?iso-8859-1?Q?nuT1NYdXHojtWqUst9TH/pWWRl+MDMe9KrHEEvhoYESchNU+aI7PMOem5D?=
 =?iso-8859-1?Q?kV3Sx0L+3TngvaDH2G5+395K3iEuvtt+TbEE2/nLE7kOWBDOkSO2z1PUfe?=
 =?iso-8859-1?Q?OziYEBEDpbuFTvQp83s7OejTrU5H1LO0Lfo4v+ZHhjt6jzBYeQ7/b0mnb9?=
 =?iso-8859-1?Q?ZlxoP7qQZrm6OZrNrxk+m0p02fkSaBumOG/+Xbj82z44PNQx2b9bNRTStN?=
 =?iso-8859-1?Q?YKZ09LJTNJ3/PfhGRK9ZiBam1vKZD1D1lTAKhWvMJuP2/UO+UYdv6tx74n?=
 =?iso-8859-1?Q?JGwBhMsezxnYX3OzfjRRBUwJp5MOlXEc7y4qHMkBkvPQ1demeU/tXswkZB?=
 =?iso-8859-1?Q?ssuUEkjm+9EGu4TOa26wwbJZQ4rwCku564/sBJVy/SPpVuydCYATa8SKiS?=
 =?iso-8859-1?Q?z+/CB/HTDdqDlXM50dR+N5o8PGjf5ftnL/PK7s7uJ2xOzj7qD4yAC6n6ya?=
 =?iso-8859-1?Q?m5Ei9jFX9I4GkuO0Q87Tw2Y4NDpAMR4h0lFEfUuPt9pvm0VGuMPrNN74KH?=
 =?iso-8859-1?Q?/gx6xVlq7KiUYU6FxBTjBvCSovrSLEwGQXRd0Ek77IMrQN3qKTSuNV1b4g?=
 =?iso-8859-1?Q?d0BadH837WfsXrbWXjcH19?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?ouVu6vY3sCLdA9N+NjpGBnd8rtHHl2gzbWCkezSwYtCka4AFtetROncTRZ?=
 =?iso-8859-1?Q?5t4DyXwN7JxZTISKiGsjJIKWrCuBEMvMfeud9flrZ9AtLycKludUBgGbDk?=
 =?iso-8859-1?Q?ZTBAlD/wUJ23W0VPicU55lq4Hp+QjxVBAEyttze7YlUOkNKw+53VTm2anU?=
 =?iso-8859-1?Q?rPkh4ptTVbhm9Ld5TgQEaJza6tdhZBbl4+iEVJEUw+H4zTUWVvbii7Pxr9?=
 =?iso-8859-1?Q?6LYReWDLOOd1j5g/VJsfbDQwpNstGx0JmLsBfPDeeCe4BBM7aGBWy/lrGa?=
 =?iso-8859-1?Q?Af/ed+Vm860IDF9y5vlMcPUbsxcUJsXlKU1FTKbHTRU3krxeQQ7I+imTUn?=
 =?iso-8859-1?Q?pC4IYg/ZSAHfm+hpkUMDSuMhCyG6ZgBFyJyw/TzDMyZEYIh5oMkfaSwzpy?=
 =?iso-8859-1?Q?WGS0iLpQ/EkG5Z3vFnqZxkcG7nN2sZ5WWk2Nt3Swb8R14nYK8o/gW82WTM?=
 =?iso-8859-1?Q?WFuYL7QxQtdYAQ8aa/eLjkysBKw5MWdMm3jOpu08uYMDVS9/kXghzaOw+8?=
 =?iso-8859-1?Q?6O1rhHKTlNhrKNgQR555zmZljKClqaFBzFG13IBoGxU26ThDPvKoYCyrgk?=
 =?iso-8859-1?Q?9KKqYhkbc6Phepe4iZq6GYRTUjCwx0xLew02xhSL4cXeR/ZeVhjMa+xe64?=
 =?iso-8859-1?Q?7XxZu/B1Hp2Hsco7gqc0hCJAzP0EfVNJs6XSwlbjWYKxFZxVgzoC0838wf?=
 =?iso-8859-1?Q?aW8c4a6xSCruBq6zXo9LVONbaV6ShpcECPs3jE+39jecSjjT3zGfrPareE?=
 =?iso-8859-1?Q?WyO0Yb+2H5MkYiDcsGCpmAWau4AfdWZtyeBKrZWYEoCIT57Iclx4kjcTKg?=
 =?iso-8859-1?Q?34NO+8+7VLPmQPkh/NJIqy3EGSXbGl+9sf85n6g6DgWcOfPoJT2vzn+qTb?=
 =?iso-8859-1?Q?SEsFdnCvw9boJXl4HiwFI/rOFUPZ7cR1NJPBuNalDIzHYdE1H9K0+WtK6B?=
 =?iso-8859-1?Q?HrEar5EqQn3aJRk8Jbi9TP5cvUy2cVuEVn0Q/fIbpakOIx+k+HOjxiMiU+?=
 =?iso-8859-1?Q?LcLBJtks44LEKVb+k/EA/bya1nJL7r8o3VrRtUZiXKFRsnO6qgC9TRb43z?=
 =?iso-8859-1?Q?hBZ9J6rrCwtmZr0JYQcFkQfrMtk+GYEJPtwUFqGZu/GJTRB8vYfO7t00d0?=
 =?iso-8859-1?Q?K3+Rw1eLyqlRPxI+kA68Nk/3n6EuCU8RRCygA6VTXZiQlt1FHh07pvqYlf?=
 =?iso-8859-1?Q?orM1ipJH4UsxjLiwQwUZk7mFnsGRxnVNXkoVebLESUQk1Erk/GV9ItSEKS?=
 =?iso-8859-1?Q?6rtD0Of+9NFDEVcZcVwydzvrhbrt1kB1IYLwYNgeWVHNKMICunnDsNVF2I?=
 =?iso-8859-1?Q?eo5WnRwMwPx1L6WcHokfJo/AQ5biT3O5MwUwcM3yGL1yYrxy1EalkXb6Gz?=
 =?iso-8859-1?Q?36t6HYJufpck9MRO0V269EAFSrHtNW6bDQh8WzBeGQNL4Nft+Z1M+CpiWE?=
 =?iso-8859-1?Q?Wry2W5jGAQaC5doaA3fIOuzoh/8jKHdSZUm3ZaCQoZ1/k9oKJeN0ynqNhn?=
 =?iso-8859-1?Q?YtsBxdVhLluCBDb9XovK2c+aicMqmmi7rdv/17iBa8vasXmtCxUr7ECoIC?=
 =?iso-8859-1?Q?BuaIV63qV21t1hk6rcdEPYhsSp2L+YZFAWYAlQEObhwZvUtqKlrK9hmsQD?=
 =?iso-8859-1?Q?iHDaVtFd/w4Mg8z4h8TlaztUlHIHxvxbm41syU9GjYiNGkSgEmcXAMtg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cdG9cN8rgkMPhLbUbd0Xo/lFfA2kw+YFWn6EmJVTQrRHveoPciH6bOTl9PcDiolA8GAT0ly7L8nG0lGxrstYkKE9jn54H/Gi/DvWwv6641U3G5BUeYI6k8t7QKdlNvS/YaBn8W90HZArFEWFPSe+OgF73GO/qco7ikQYumtbaTNAswNcRqNi1AblrZ6YN5ab5hZ3rmwQcvDYSDLq7hv3p0fYIznYlamA2eMYXetvMvHGg9WGKMQWVBUDYmvRWeSWBNr6Q0Rqa3YLQiJGDPHjz/9zj+Pequg4xgBxh3uNR3Ed1BX2CDAs7xLgDp6E9JOBitZhv9hSnWuZraVP6PV6zJRWmukDcBTOQ8NDlUvnpjwJhuYhYsZfoN5/eeBt/ht7fnCR2SFklwUaAkfjW/+wDZV4N+2ntY/TNOn9G81vxPl5a6xllnjyBgpwiII5yEERYX1oOHltyG+CtrKWmfa4JsR9ucYcg+TaqAzUBolS5BT0x0J8v5m4xiNxR/PCfRDJ1lKYfBnZbrpwP8iZSRFMuNBKKR09PD5ARZDIMO7aXbvdE5cEHicpqDWENbVGmqi9cjdLRVv46DNxyxDMMpuPfLnmxgOhm0rcueVbkl3im5U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fcd6b68-5393-45c2-705b-08de393805f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:36:31.6913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GR/Rc9GQHX02j/HbqCJSOIkLgjeGPaFtPhKBEbX/f9mLi49VtO2oH4eKCYIvUfpdsBj36LkpUGy0wVDuUB0hwtHIWRf2dmt7wXSx3ksZrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997663
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512120034
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAzNCBTYWx0ZWRfX/lVg0N9RtCR3
 CAdRDEZfaLgJ8UA8CCMEa+JyBswtxdm8VeSPt0DGQe4bArjHPGPE4qLxLjXjkkszwDcwI1kRRSn
 3fbOfHJO8XQ6o7Hd1Zh3R8fefjhYgIBDvciluwhNsu0UIiQctipsW65fZHbcZKtyuXw1Ih96SQ5
 otNPMak2/fvNAQXY91jyiXVsPkZW7dXUKrnFeht+yTAHNHa8UsqJKwC2tzGWEPJ53Hy3su85jG3
 SOE7zva9k1HjXSte9+ZJpR+upO2RZ0sL+FPh7qlZcvXCQEGxbWWQOuUyD+HSQr0q51MPgXTv22M
 Ymlq6ZOcl3Q1kzjqU39Z3daM+su9PVqiMrTHGKX3vOdNhua1fLjVRyL9jT7bBTuqAzh0hSmGjGT
 DQsyU16z5dmiJqOg4c4lepChaZihhcDqfNpv4N4lIn3fwO54KuY=
X-Proofpoint-ORIG-GUID: mq1A1YlC3RAvC3PZLZviBjK5SiwohoMc
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=693b9bd2 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=bLhB4Iv3phJ4yDkxlTcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 cc=ntf awl=host:12110
X-Proofpoint-GUID: mq1A1YlC3RAvC3PZLZviBjK5SiwohoMc

On Thu, Dec 11, 2025 at 06:16:37PM -0500, Eugene Loh wrote:
> On 12/11/25 17:22, Kris Van Hees via DTrace-devel wrote:
> 
> > Even when less than the possible number of CPUs are online, the 'buffers'
> > BPF map should be allocated based on the highest possible CPU id because
> > probe data is written to the bufer
> 
> s/bufer/buffer/

Thanks.

> I guess a problem here is that we do not test this case.  It would be hard,
> but I suppose we should change this situation?

I am not entirely sure we *can* test this properly specialized configs.  The
problem came to light on a configuration that conveniently demonstrated the
problem because of a large gap of unavailable CPUs (0-127 possible, but only
0-7,100-127 were online).  Because in that situation, it is quite likely that
the CPU on which the events we are interested in occur falls beyond the end
of the buffers BPF map.

> What are the chances of our at least writing out what is per online CPU and
> what is per possible CPU id?  That way, a future developer would (hopefully)
> not have to reverse engineer this stuff.

What do you mean?  What is not clear about the current implementation?  I
do not think that there was an issue here of things not being documented
sufficiently - I simply made a silly mistake in the code.

> It seems to me that this patch is an improvement over the status quo.  On
> the other hand, given the limitations on what we're doing -- notably, the
> lack of regular, automated testing -- that should probably at least be
> acknowledged in the commit message.

I again do not know what you mean by this.  It is not an improvement over a
status quo, it is a fix for a genuine bug.

I also do not think it is fair to say that we lack regular, automated testing.
That is something we actually *are* doing (i.e. the build-and-test robots we
use internally).  This is a situation that primarily has not been detected
until now because we don't have all unusual configurations available for
testing at all times.  A system that has this gap of CPU ids in the list of
online CPUs is not common.  We can look into building a system just for that,
if we can, but it is the type of situation that hardly any automated testing
would uncover.  You simply cannot test everything.

I can add more details to the commit message about what the exact problem is
that is being solved.

> > that corresponds to a given CPU id,
> > which could be part of non-sequential CPU id configurations.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_bpf.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > index 0a57b7d2..6568a572 100644
> > --- a/libdtrace/dt_bpf.c
> > +++ b/libdtrace/dt_bpf.c
> > @@ -755,7 +755,7 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
> >   {
> >   	return create_gmap(dtp, "buffers", BPF_MAP_TYPE_PERF_EVENT_ARRAY,
> >   			   sizeof(uint32_t), sizeof(uint32_t),
> > -			   dtp->dt_conf.num_online_cpus);
> > +			   dtp->dt_conf.max_cpuid);
> >   }
> >   /*
