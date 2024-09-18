Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8545BEC
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726650166; cv=fail; b=qM5o9OgK9lzjoR0Qgij81n2pSyGxGhj9mIADpRprSktavddQZDA4gqVx39FJt9OPj2BDvEL7yi9Mtcko7EAev1HXayQmayMx9EJSfA1BF4E5F6Btwsvgy73zMsaeUveKgcjuUtZXmKBJxIqTmmylAeGTfCUb22UXouvRFyyeu0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726650166; c=relaxed/simple;
	bh=pZdRFqE0O8mR79SEOpgV81FFuVKUAzYiV8qL03xWc7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nm/JcEIIoThehahml0tiogiM4JBUzxAsUM0h1TdGghEpst5EQoKD3jDC5W+0UodiV3FcO9Keo7RYKcc9dPVuad/GtuTQacow7EiK1lgvGGlpmC2+qRDV+doN9D0xnQRoY/BaY7uujD6o67mvQWLVr1c6Un3SAtOB17r4jCU5vaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EJ3bayf0; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hnJqJt6L reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EJ3bayf0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hnJqJt6L"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48I7tckd012566
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 09:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=ryDdp5t0YBw/TIgt/Bqfjzx38mGcyRVJDajPAngeErU=; b=
	EJ3bayf02eyVNeIFafGKgvjKO73Nkgpxu+rsClvxPxy4/E/mZZCrA48htEZP0jRa
	l+tzl0I50sjl+4LzBaRFbVFTZIRQW/7sYmyTBqDutUL7yfi8brndlemqA6fOzGyY
	Im86xe+AUeNBhY+ToiD/Tkt51780cKDdPJ0TNdSHXulWuPqXKUsFPwJLpo9VkXYJ
	lu+dPhFomLqCnX/uTgVv7Uyz3Zp7qfbeltB/wOMCfVy1oxUZrkZ1atRGMfLiSyAn
	+1sbhS9Vg4Jb5z+1BAMwVe1qZdkw/oWsIEINTnKLJjGo4NGHPxxBT5QN7+xzazL3
	iNxTRQ8lXanmMRG/YRmulw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3pdrfth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 09:02:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48I7NJSc018394
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 09:02:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41nycxrkpv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Sep 2024 09:02:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooIl5wJQ+ElYMzcLHdm60WYcWkNLLB+8aDL4RXCNBeO1br25JsNsguVfReBqneilH8v12oSOm78FUpT6faoO3Fs6FWmGxUpZiZ9HoAwrOe+Z4iYtFcPUoU3wioRVlYII1QPnKesPaM1PpqlTNXlZD3GC08eVOv67BvOMn11gPPPABcqgESdKvF8B4+zb68e1h/X8ZLKFM+yqj8aBb7EB4KRbjfW+Mp2lGm547zPMtYbfkY55iZuRCFsGnKlff2JNHQkjM3Mb6zP0DwwIa5ecugU1hDjsnw6ncm0mZFiE9/aHMA/CAA6V/jXCQ3Yww6EVS3B20xpGFTmLEB2DjYKuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrcyQRnfPSnRfpl4STsnXecQWq56UZTU7yObT9EwPMM=;
 b=Qd5jv7WqIgwQc798VEByquPog3KRxiHazqR0FkPH3xYdhMj9C4lYkwgVz28GK/rui38R96D2Lk0I9RF+lJyarX+VIb5UCOBdNKy9PRYp6mWNuIWZdAWiAW7EPKjY5PW00r4/dqWRQl9a2QOGTsosXLPZCXeSLGC7VDMuY1rw3MQV99TeRGSV6q6hDjFkgFRtJYf6uops2FVt5IoQqwRc0HU3j0qCYwZ2Hq2ue1CEmmET2mCHoX8YsGLKK45VN3jmlDUtxd6dYhwIWrMZq4l/WGPvm2sl65678dz4ww6aCmFCbQeIa7NjgEO7bnpE+kWyPJkwYfZf8e1Qx79B3crWmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrcyQRnfPSnRfpl4STsnXecQWq56UZTU7yObT9EwPMM=;
 b=hnJqJt6L0jceUR/+opd91AjM+s0c/pqvwsZ+dgPGWII1KnEHqe9DYDa36dqKFwm9zwyPyqDNAEh40WqGSExQgwZnHb3ttQTq4GJHyth3r7pjaSsSv5SXhb0bbsRo0vBr+LrhlFtC1M1yzhCd7HFWkG9QsfRKDLgea708doYz8aY=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA1PR10MB5843.namprd10.prod.outlook.com (2603:10b6:806:22a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Wed, 18 Sep
 2024 09:02:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 09:02:13 +0000
Date: Wed, 18 Sep 2024 05:02:10 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Relocation processing for the ERROR program is done too
 early
Message-ID: <ZuqXErk-esuIo0KT@kvh-deb-bpf.us.oracle.com>
References: <ZuT7zAFGovJBCJzE@oracle.com>
 <389fd430-37aa-d16e-8b3c-9034dc41d6fd@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <389fd430-37aa-d16e-8b3c-9034dc41d6fd@oracle.com>
X-ClientProxiedBy: BYAPR06CA0038.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA1PR10MB5843:EE_
X-MS-Office365-Filtering-Correlation-Id: df86aecb-7d44-43f6-634b-08dcd7c095ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?MbiF2eIkW26/TiQ5PIYkBWFJ41wqUeVpC+uFaITYWgYgvPpZBj6HleT2/T?=
 =?iso-8859-1?Q?9hpM0V+5ETV6jySat43tiE9Ay81DWpqQB/zUBTSy8SSD14qmTnayXPWxh5?=
 =?iso-8859-1?Q?N4hAJSTijWk4ky09jMiz23NG+rrheUyN8h08c6Zfuv1YdYrluMApIT1R1n?=
 =?iso-8859-1?Q?2lde4R64VXd2MMkXO6sa7FuPCJ8kqL/XY3NkI8SvyJ9Swf8GG59ST319WZ?=
 =?iso-8859-1?Q?Fh+fqwEopIsYZHkBuIJb/c5sX69GqvIgLXWGXI8PzFe8idi5WYvoK6d4tw?=
 =?iso-8859-1?Q?66u2KxAMG/O/unAoSJqtjdfJowDJVhYBlM6J8v3GZEBfZ0Y4/qmyx0NAW6?=
 =?iso-8859-1?Q?G22aH4VvF1ZrK7wNVyNT3CwyIQ2ZThpbr1sWWOOrPo7PqaFHVVMLK3cHhC?=
 =?iso-8859-1?Q?U5QGq/Jz6d7Xk9TQjl0g+sHEca73KhaBked2L2voUE1E7pWc180+g1Jm9p?=
 =?iso-8859-1?Q?jG519/Ev2jGnLJIR89vUo55Dl1C6FTnCLj3H/g3kMlEWoxm6refaYHHs5Y?=
 =?iso-8859-1?Q?4X/8mqEYBid2TDw/0xqeuACslYLj+C0T+Nbejk9B2cwCs0jJGPmE1pNlyA?=
 =?iso-8859-1?Q?DUmSBs+s6Ri9EsFj+XObFTwhEgUdSGccNebUv5NIQMpPMwSEkGXuOHeKky?=
 =?iso-8859-1?Q?sUMjLi1rVmzjgOX14QWBZms97zvr9mBMU+jShXlCmbFHiIpcOPcGT9GlwJ?=
 =?iso-8859-1?Q?/onXxc6DbrQLDVKuxBdtt4lMIIPeOdfnE6VTcnbw8x+jVFMTjDXsagkG3k?=
 =?iso-8859-1?Q?a2uN7Y7QUrtbt7d8eK9rVxDXoENk8UzVNNaehSpwCR7pVo0FtkxBPNpdV9?=
 =?iso-8859-1?Q?7GvMrEBFvDhwoQPcP9VNR/GYvxgkov+9BMHInCLDqJMuqvDRf0JstkmUKK?=
 =?iso-8859-1?Q?z8kt60y1oHrHIMUfue4iT/kP3Ws/s36m7SOENpsTjqA0azTYHWByIKMMRH?=
 =?iso-8859-1?Q?LtvFf4pq6yTNFiPLaul1B2PAyEAVD/pFLd/Fr4qB5rZoGqATHuaHomi+Zr?=
 =?iso-8859-1?Q?n2T5qn0AfqQKwjF5IQfPhDua8xxkibJM4drkPVOD/NE19L18CJPcF0Nbeu?=
 =?iso-8859-1?Q?jNJATH+h75NVvLkLa7XLb3aF34MeNaZYTw5O1LctvVXybLOYJWCfl6Lj5e?=
 =?iso-8859-1?Q?9I6i6Po1LIPGunbxED3gi3YuJmlkv/DgMknqsinhqALGGn0ORejTr+afnz?=
 =?iso-8859-1?Q?6wyxDvi7Uk4wfLxikUXOx2oH87EZVQ+EBx2mncliM4ERESy0aHmv7hsPlQ?=
 =?iso-8859-1?Q?8pES2B1JIZEvJTMU9yy8o15O3XtSmiNS2vvYYLQVC63KPuxhTGACcyIrve?=
 =?iso-8859-1?Q?NxBhKcdeHojbCoo0Ohay3ywGpJhk8J85v8pzpRGrUL7JxHBuv5hVW+uxPA?=
 =?iso-8859-1?Q?3rZoukG1HZ30zKtSYlN40fmVE5yzvg9vbQVVXvZc0aL5NfUq0HvRo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?KzWs5M+NJw9R9mvQF6VAww8vUxdJhTIDQMU3cUSCbN2gSMyvaRyl3DH3Bj?=
 =?iso-8859-1?Q?3rl/pWHYQu/vCReBGq3B+tBefIduhHqVwHKpz2S2yYbF98dMEWiuK4csli?=
 =?iso-8859-1?Q?GnRYA8C7ciZriK8PrepEojZu8kehtUfUyaoYd3/MwlJAF+oICaelGqXmQs?=
 =?iso-8859-1?Q?03rchVG5q7Dcsuqw8EqDvGPTVp5aKk111fOtJDQWRBiYf/eRZUNbWEwPCz?=
 =?iso-8859-1?Q?2IaOOGxlAhBt7oCRstn3EPaFRTq/Jrc63uFoMvGwn2DdB0dCMw/NvkjOxA?=
 =?iso-8859-1?Q?K6Cq1js7h9IUqxuNkBcdh75YIj6YGnTVH1WiVG+zonmTZKKrtEnFreK+Ye?=
 =?iso-8859-1?Q?SPUr9LlW2ecwcuiWMdOMKNVMG6m98SODRDho5coYU9fd/IAlC7izCR2C/t?=
 =?iso-8859-1?Q?7wQTKsUc7ts1r/Q857D1Z1AMuUkGBKJlnDD+BMvYpnOaqUUHkzCfk9kkRe?=
 =?iso-8859-1?Q?1SU1eYSRuT3uuP/71+y8ywMJU0mL1/zBGc9SU/KSolCAHCWKJTa0QNv7hO?=
 =?iso-8859-1?Q?rbGRm9Y4QtMC9DtBL3jMPNnE/nyctRY3jFqxn+hu+/8dchZcUmeitFGh1H?=
 =?iso-8859-1?Q?FVvhDJcSZOZzyBpA8kYStSP+3Jy+sYQyYYJG/kqrfrEOVt2bUL1UOhShbF?=
 =?iso-8859-1?Q?85dDhGBNeEiCD9KiibwZOTC5f/XF5oOL+H7DnOo749+sRt5pur/J0oqAst?=
 =?iso-8859-1?Q?/pDAZrozVp61ffbf4DT894pdGdvGZM47ynbEBu47J121HrOhRRWw3btU3g?=
 =?iso-8859-1?Q?GIU8YgqtdPYHF9tQNNmiGqJfctVZSRNvOrg80z8ku9MVaVzGU5+YD3a1Tw?=
 =?iso-8859-1?Q?8cJcQX1oqelqvq6DRw76fW0p7NDxWAZg5QjEBtLbSba0ELot7Cm3NbU0UY?=
 =?iso-8859-1?Q?vaJrvq6OR+ms1KRGIedBoHuKUdCQQes5VwIMl7Y3jM8jgrjutrhsCVfMGt?=
 =?iso-8859-1?Q?8vq9TjOYrNROR46lTSkPR1TNexOV9TI04/5q5lerx+friDL2vSMD/QHLc0?=
 =?iso-8859-1?Q?yGUlk9H1DxYk6skADanuTJ32LNQ/bLZ4OwSWq4pdkttRptUNzzdWNZlagp?=
 =?iso-8859-1?Q?0ZXdP7LCx0zSue7RMMgKH0L1b4xmZ9IrR00TUPDaxhiWlEeKsV4HKRQ9EP?=
 =?iso-8859-1?Q?yyoOXtqGH2/KD3xRrkazqPJd6ZK0uEh6tc6yYjxGYVVeP43HYV9M4ccnia?=
 =?iso-8859-1?Q?tzdpUlb9Hmi3qF+eEkYCrdDAB9bF29YJtj60hhpN+Fa67o9ZO2EI6nzBpK?=
 =?iso-8859-1?Q?BVtBm/cMykILMi9zuRX/UXr/50wxa2pisCWUY6nUCopoTNbnToqQZzUjIA?=
 =?iso-8859-1?Q?b5ZUoVt6EhJqEx5wvcNdRQcH05ToJQ+ivY+/EzcjQTSQBYrnJ+7ErKQeD5?=
 =?iso-8859-1?Q?x4/zc+BgA+zx1zaC7Y4NFao5TOgWMN/N5hV9z1PGYtJERWsMz+NISPVwRe?=
 =?iso-8859-1?Q?E+UvMktm1IfyBObU0MyOwpkR0lEV9O8V3ZUCydKE5FEzKvs5gofYqghMn+?=
 =?iso-8859-1?Q?iL/7Np/SiT8RP7CnN8F2ZdZ0V0qeNfByW1UxSfBEFNj1kqVNJo7e3YKJB6?=
 =?iso-8859-1?Q?DIA5gdzYU5Px4+XYeGcJUQKRZ5C1TorKXj8p3nEotTbVGnu5f8aFMi4G0j?=
 =?iso-8859-1?Q?wb17OKt1I6vJOsuLwWA11HwbglnqGH5Hn2uSUYIS/mdyuRfduJnNq3Ew?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q9ww+lGc0vOHr5RThSo/orwYm2zsCk0MSDq6WKEJRM54fLkLmLIAzPnrzru5M8TN1SnGz6WsbIp/GHu1sTaNNn/fDuC7Mz/rjm37DrxyUoCO4VTQ7mwV/U3luavueM+HdPvDgD199QnVxo6jNRNFG3sgAkPrhXbQ3/PfJz871awW/4r0n4E4Jcl8GZ72DXpAqfRxZqnnZXv6d2KHDSv96W1ictvJ4AJ4pQpW7QamRGp7AcsYUdmAf77gXIvex65B4dfHxZoKLWnidUY3QeGNxmJ0mpyNQnK6cUTmsTraANvrr32igXLFiPXdYNSWTqfHYWDL1P2rvBdt1i4t2vPpy/ayL699JYk+lEVXvlj1tlAd4X3CH0p2h7pRU52YK3a8Yx/beRSxrSYJSXv1YJwszLypmt+cdk+bASlx4/uoppCEu3hlmK49NH8ZO95pEHJoiRQqUSLzA0tA3I5ySHis0wIPCz0v+SJMB8UzdS1rcIWqkOZ/rlNJGtyGUVx+dmTsbxtqelik8Y49W08bFKtoKW6+kcaaiIdV6rSHI/zx9/6i1ghuF6pAs8UXBQNCdstI4WAUxRnv2fxh8RGG3RSD7WV3iYaCdKD1o+ZqT6vWdo8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df86aecb-7d44-43f6-634b-08dcd7c095ef
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 09:02:13.0054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjLUbWKlPZ/rypRdL1H7TNeW6coVRRg3ljxjjUkLrZWMw/jnSEYnODTU785kkDXj1KC0nxQGj9yPbjm6P1A22ljlOyr6k5dOBu2pRPkIgsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5843
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_07,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409180056
X-Proofpoint-GUID: f29evw1fleG4a8Oo3870tsn2-FfNGMIp
X-Proofpoint-ORIG-GUID: f29evw1fleG4a8Oo3870tsn2-FfNGMIp

On Mon, Sep 16, 2024 at 06:58:01PM -0400, Eugene Loh wrote:
> Thanks.  I see your R-b.  So, no further review is needed?  If this patch
> has broader scope than the initial patch, should further checks be added to
> the test -- e.g., to demonstrate that other issues are fixed as well?

Yes and no.  You found the first known instance of this issue, and while I
indicated that there are other cases, testing them all would be tricky (and
may change over time).  I think that the test you have is sufficient for all
cases because the fix is not specific to the test.

> On 9/13/24 22:58, Kris Van Hees wrote:
> > When we call dtrace_go(), we do something like this:
> > 
> >      dt_bpf_make_progs()
> >          dt_program_construct()        // just for ERROR
> >              dt_link()
> >                  dt_link_construct()
> >      dt_bpf_gmap_create()
> >      dt_bpf_load_progs()               // other
> >              dt_link()
> >                  dt_link_construct()
> > 
> > In dt_link_construct() we dive down and find dt_get_bvar().  One of the
> > relocations is to supply the value of STBSZ.  The first dt_link() is for
> > ERROR, while the subsequent calls in dt_bpf_load_progs() are for other
> > clauses -- that is, two separate versions of dt_get_bvar() are used.
> > Meanwhile, the value of STBSZ is not set until dt_bpf_gmap_create().
> > This means that the ERROR copy of dt_get_bvar() does not have STBSZ set
> > properly. This means that if ERROR accesses probeprov or probename,
> > dt_get_bvar() returns the beginning of the string table, which is a NUL
> > terminator.  Some other relocation values have similar issues.
> > 
> > Move the ERROR program construction to dt_bpf_load_progs().
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_bpf.c                          | 40 +++++++++++----------
> >   test/unittest/builtinvar/tst.probe_dtrace.d | 34 ++++++++++++++++++
> >   test/unittest/builtinvar/tst.probe_dtrace.r |  6 ++++
> >   3 files changed, 61 insertions(+), 19 deletions(-)
> >   create mode 100644 test/unittest/builtinvar/tst.probe_dtrace.d
> >   create mode 100644 test/unittest/builtinvar/tst.probe_dtrace.r
> > 
> > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > index 70597d65..df427c86 100644
> > --- a/libdtrace/dt_bpf.c
> > +++ b/libdtrace/dt_bpf.c
> > @@ -1212,30 +1212,14 @@ int
> >   dt_bpf_make_progs(dtrace_hdl_t *dtp, uint_t cflags)
> >   {
> >   	dt_probe_t	*prp;
> > -	dtrace_difo_t	*dp;
> > -	dt_ident_t	*idp = dt_dlib_get_func(dtp, "dt_error");
> > -
> > -	assert(idp != NULL);
> > -
> > -	/*
> > -	 * First construct the ERROR probe program (to be included in probe
> > -	 * programs that may trigger a fault).
> > -	 *
> > -	 * After constructing the program, we need to patch up any calls to
> > -	 * dt_error because DTrace cannot handle faults in ERROR itself.
> > -	 */
> > -	dp = dt_program_construct(dtp, dtp->dt_error, cflags, idp);
> > -	if (dp == NULL)
> > -		return -1;
> > -
> > -	idp->di_flags |= DT_IDFLG_CGREG;	/* mark it as inline-ready */
> > -	dt_bpf_reloc_error_prog(dtp, dp);
> >   	/*
> >   	 * Now construct all the other programs.
> >   	 */
> >   	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
> >   	     prp = dt_list_next(prp)) {
> > +		dtrace_difo_t	*dp;
> > +
> >   		/* Already done. */
> >   		if (prp == dtp->dt_error)
> >   			continue;
> > @@ -1263,7 +1247,25 @@ int
> >   dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
> >   {
> >   	dt_probe_t	*prp;
> > +	dtrace_difo_t	*dp;
> >   	dtrace_optval_t	dest_ok = DTRACEOPT_UNSET;
> > +	dt_ident_t	*idp = dt_dlib_get_func(dtp, "dt_error");
> > +
> > +	assert(idp != NULL);
> > +
> > +	/*
> > +	 * First construct the ERROR probe program (to be linked in probe
> > +	 * programs that may trigger a fault).
> > +	 *
> > +	 * After constructing the program, we need to patch up any calls to
> > +	 * dt_error because DTrace cannot handle faults in ERROR itself (yet).
> > +	 */
> > +	dp = dt_program_construct(dtp, dtp->dt_error, cflags, idp);
> > +	if (dp == NULL)
> > +		return -1;
> > +
> > +	idp->di_flags |= DT_IDFLG_CGREG;	/* mark it as inline-ready */
> > +	dt_bpf_reloc_error_prog(dtp, dp);
> >   	/*
> >   	 * Determine whether we can allow destructive actions.
> > @@ -1272,10 +1274,10 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
> >   	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
> >   	     prp = dt_list_next(prp)) {
> > -		dtrace_difo_t	*dp = prp->difo;
> >   		int		fd;
> >   		int		rc = -1;
> > +		dp = prp->difo;
> >   		if (dp == NULL)
> >   			continue;
> > diff --git a/test/unittest/builtinvar/tst.probe_dtrace.d b/test/unittest/builtinvar/tst.probe_dtrace.d
> > new file mode 100644
> > index 00000000..d08067ad
> > --- /dev/null
> > +++ b/test/unittest/builtinvar/tst.probe_dtrace.d
> > @@ -0,0 +1,34 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION:
> > + * Built-in variables listing provider, module, function, and name
> > + * are correct from dtrace-provider probes.
> > + *
> > + * SECTION: Variables/Built-in Variables
> > + */
> > +
> > +#pragma D option quiet
> > +
> > +/* Check build-in variables from the dtrace-provider probes. */
> > +BEGIN,ERROR,END
> > +{
> > +	printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
> > +}
> > +
> > +/* Cause the ERROR probe to fire. */
> > +BEGIN
> > +{
> > +	*((int*)0);
> > +}
> > +
> > +/* Cause the END probe to fire. */
> > +BEGIN,ERROR
> > +{
> > +	exit(0);
> > +}
> > diff --git a/test/unittest/builtinvar/tst.probe_dtrace.r b/test/unittest/builtinvar/tst.probe_dtrace.r
> > new file mode 100644
> > index 00000000..e6cccc88
> > --- /dev/null
> > +++ b/test/unittest/builtinvar/tst.probe_dtrace.r
> > @@ -0,0 +1,6 @@
> > +dtrace:::BEGIN
> > +dtrace:::ERROR
> > +dtrace:::END
> > +
> > +-- @@stderr --
> > +dtrace: error in dt_clause_3 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
