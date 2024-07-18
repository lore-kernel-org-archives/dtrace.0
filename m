Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3EF208BA
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721333599; cv=fail; b=Z+ROowhqKDjwCNo8edthF9EVaSPrYJHANKJgV6xX/OuDweVGUr0gHo821s90zGECSkYj1Z9sgLQztPi1g3BfKsE4y7Rm+3AzJ6XakRf7JF3Q249LkCF+HawF7IvXREDrtmdmlYqRaL66Ec0UB4gI33QtQtZXolAIwpyTv45OINo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721333599; c=relaxed/simple;
	bh=FzND9V6fn9bGzYfOCkCl7r0vyfmNiuTEY3HefSqpwhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pe6JA3p09R63S+iOc9G3tdEjpO95JBvMtqQu/GA+JV1cu1MdNIHfaELCJK4lLLNap9dNhjaNkuyLM6USprdp/dDl+bVfehCghpm8dSUtTh7VeDsqI7jSbbAVTwrk+y/bQP+RUrReRs4AzEoZPnbcfAXxEWI4rb9PIbX0/afE5g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FkJLBp5o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BBKVPyFp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FkJLBp5o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BBKVPyFp"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IK0PgW025309
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=bXMJY9bbD75fq+p
	UXuqQSmao3gtB4E1Q0Mt9Y6r/EwE=; b=FkJLBp5ozge8B6Q/6bVh4FudifZ3shI
	CTh5J+QlNBbmVJZO7n9h6xAokXtVz+2VSDNtwY/fZ0h50TaRdaUsLviQokgKydIY
	PW6U2sxO1ExvwK54++LFfbaUypn3Uxwu7nAXJBspVpcWq4GHExByPNmGCnsvAv2f
	NJXsLPd4rNReDT9szytF3emJq+yzN+cdDUmeOwmjH5vNhijeH//Lm2XkqUt07blo
	TzBr0Atl9ZrlxpNmIuRHJOlB8x8LcF+76UONNwNZDnZGLCa3WEapJUpEzss1BBFU
	YRcdq50gjsHGD4P/GegzLYI/iySrNjtGNxP2/+j1RX3gqY1CmE7nzVA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f9py80tv-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:13:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IIx6cq003803
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:03:38 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0w4s2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:03:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6L6ead4XpVIOgYCk9+r4TfGCvFUH7pHIh3OzdgdFLtNNxN0OmqlqgOrV1pL9/9qVNfYouCi0XO888sOpiSaKcrQFpbqefLCdF88oHTfdGkWAchkkqjh03HyWW5+l8JkEWmHheWaxAMR2+kLCoF5DDG/7KwtfDMs/he/5IXu0SfWQiMF04FSO8EJ5IQyeHg3sR8G9b7DveLyPxhooeEgttR3FI3qn8Rz0LtWiwFCmJM7u4vXAVvNymvFHq+Dk1nSCEnSZxWZwibpVkBzyIw9989RSRIug7wkCQP54V6OVk16EAGwNGGCiOrSISZEF7cRfwOsb2pLlwgm3eDb7YfhGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXMJY9bbD75fq+pUXuqQSmao3gtB4E1Q0Mt9Y6r/EwE=;
 b=bXlgx6T7eivArDUg08pxRFOTnytBtk4pTJYJ3DJ3eJnSUN4Re2qYhxICRZ848wtMlFk0h+rYTOK6SR6VRDeQkB0GcDtoK/0tuCrP477S2jrPK5NMm1FwbvtNbpKK4YUHemNXx9PzC+ylxRNPaSgBn6QROQMyMvZZ1GTuQUTzLcsetsJRPVKWoPbryRBMJ/PfFgu3yXmWHNASUWM9Js7H8g+L+2oYs8mv49xR1Mxdqmubj5OzLyGaZfFVjDrZQ9W7rW/Hl2E8Pw9wRvTLQXQM9IhGWDaE14LqGaxRfwnCr9lfdb1xy39mhfjAELI9n8TT56tsNhTWJe+8/7Xk8urpyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXMJY9bbD75fq+pUXuqQSmao3gtB4E1Q0Mt9Y6r/EwE=;
 b=BBKVPyFpkUTUJg9C1Q+C1pzFXnutOJZ+EBUjGByvzgRzn+cLyCQy0TbVsaIfVs/mOFuV0Ov8TarKLWf/pAOqnbNVDsF89r2/wwMmuyhRa+d1lGwx9mCLZf3fid8Efa/UFEU6IS6pURWL8s7ZpFuDJLHGYQYx++elpxs/nP7kfno=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CYXPR10MB7973.namprd10.prod.outlook.com (2603:10b6:930:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 20:03:17 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 20:03:17 +0000
Date: Thu, 18 Jul 2024 16:03:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 15/38] Remove orphaned dtrace_hdl_t component dt_prov_usdt
Message-ID: <Zpl1AurBdf5/nQVW@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-16-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-16-eugene.loh@oracle.com>
X-ClientProxiedBy: BN8PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:408:4c::20) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CYXPR10MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: ff545d65-4c5a-4aae-249b-08dca764aa42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EGuyNKyZeZyBI/Ym37lxzYdQaE3m3+wcSPQ131718hdJuyMB4g4VlNQji6tW?=
 =?us-ascii?Q?33IDKlcZUCKeNr7FDpfUqacKyVXkPuP8E3BV8Hajr6F66/MX1tQ646kWJKEf?=
 =?us-ascii?Q?hDS+Ek3PFwu5FzeOo7n4YpXZi6pQGaJgdmrJy1UHHaVXWwqcDFVxNLViECRw?=
 =?us-ascii?Q?BNcw/3vDrdW6knWgfqMNvWXiqPDCI7W7vxGe1hUuEJPuupelV8ym5MLrAIlM?=
 =?us-ascii?Q?lUxC59LBSgQSO58kJXRavcJSLYJDtPnq5pJl8yb73hivmiMLear8nedzQu+d?=
 =?us-ascii?Q?MteRGvBiSxhvZMy0BrEApNdpNJ8ru3c32NIo3m4Rwmm+Qt6P1duWLy9lH0n+?=
 =?us-ascii?Q?LdJQ5bmdV1HGKD6Ox0XxnZ/QefHKn+64SZnZbcDQoSUub7EuAIQPdvLfsYzA?=
 =?us-ascii?Q?sM9qMPRlv9sD8ZbRfolH+H/B6map3JcOKZLiwW7lNrBsEDFBZJW8F6dgUYuk?=
 =?us-ascii?Q?Ij4eWjRl/3Rwof0hjyjfWOfPnnWfPrz5q4rPGvCzFSnPLWFLzLaiS7nrOzzA?=
 =?us-ascii?Q?L6KS0d5AKzJBsl+CiALHvboQsPRhBd4mKuydk1TJcyw9aK6LeRfmXHigzWDO?=
 =?us-ascii?Q?PbfghX9Qo7ZOrnIPKR80i5JkWfCvcxkD21YeUmiIRElOnmQ2SDv5OJg6ayvK?=
 =?us-ascii?Q?IJa8m24jYcwnAgzV0EYYJQSA6HtsN4t5Po7NLxQqqAGPpSpU7rCf2dDbDb0K?=
 =?us-ascii?Q?FkdJyZ/p+xiUPWgoQsN/iZ5SxVdazZGq74EAjBuBsCjZ7dRepPS6sAACJp+w?=
 =?us-ascii?Q?p7jjRXZsLzpccSPB/WTxRMo/3fDd2PXfn0Iv2K7cGpn0UjD2dVbAQPOWRy/d?=
 =?us-ascii?Q?iz1YqcU8uUWB6QdU+axK/MMLd5ns90qQGryRoMPXX2UKFg4/LQEqaBTvIrYr?=
 =?us-ascii?Q?4ibHZ0BS6YCyooODxMsJoBlQgdY/wOoASObN74xxjT+fzJLS1BfePv42MXQ9?=
 =?us-ascii?Q?Nv4Nl4tNCw+pNlWlZl6w4Eg7j+0j0n3dE9VaCM806g1UZBlvZCqBTbwmhFGs?=
 =?us-ascii?Q?w2WsDQI3LqY+cu+juqFJmS+odOGXKTONnufEqOmvAG7puBypNlWmOG4UUIP+?=
 =?us-ascii?Q?MDcKveoE/AVoER//IFxfySdwnTAkc/CDX/lN+TWWM9kzY2pFyW+6cAyCWu8A?=
 =?us-ascii?Q?4qTI3Bers82Zvb0WRzK75irnYIxn7EQiUYPaC5hNIAfFj7GqgwEciXHEmPts?=
 =?us-ascii?Q?w/kj/JGPRIfF+zt/w6yMQFdT27tzHi9IeL2xk7MChfLoeiOA+Q0FTLAVfaMg?=
 =?us-ascii?Q?v61V6J5/7yld864AZH1oIHykFVP8+E4aB9F9QxrftgXPRFW+gvcMI3wEk4IY?=
 =?us-ascii?Q?8ahhQ+n2pyLnHbw8caiiyYMLhxSwqRNXB1au5PZ89PowOQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0hptGOz6hoM9scV6LQde6LFw8R8t/4qKHwRUwVb3o2bkLne0N6i330q/PYOW?=
 =?us-ascii?Q?w0dM6PnLsPSiQfB0XYQKVm8OY+5ruwpm+yZDiCoSmPOJgLj4ZCD9pngfajj8?=
 =?us-ascii?Q?xJ6W8EsguZ2zm703KTRZNgT4TBINTv9zStFtCy8ar4Bu9ETDgjMAJ6UptPkJ?=
 =?us-ascii?Q?YJlm7WVwIqT4W4328I2g398LeD//ESgZvReM9XaI9K16Ewk+r8Rhl7MkIt9G?=
 =?us-ascii?Q?8lU9/DmyLsV9BkhABjaRpkH13N84S1sQ9ZEphALtGi54LTql5Pbam+KcfeBi?=
 =?us-ascii?Q?ODYomRwuRBnPDp1/UYYRVhGv+i1DhD3bZakx6/3t3ZtU+TvSamyDv6T6VHyk?=
 =?us-ascii?Q?pj5Yk2FYfCHJmlC7yOt+NlKWwoWRMIzBrNsZFuBzn4kghl6PJKe8I8ajPqjE?=
 =?us-ascii?Q?3jHhaRxdHBZNvRemkJi9zwhBjSNjVV6lNufcqKyFgoxp0SHVTU9jHq29KUwU?=
 =?us-ascii?Q?EhItWAuHZvE9h4E3D+eRT0fB5337hf4wusOybB+lFYfQF8lKSsqNDyfrZgHD?=
 =?us-ascii?Q?pIJUvl6SRElKlG4zczQl4AK1LZs71QmKeb436MMiN9Mjt/1G++0944yBooaY?=
 =?us-ascii?Q?cBxDK86Gn0BdWMmC7o8fvvCeLWV9G/NykKOI9kogB37mwDFQ5CBF2j+/2lNC?=
 =?us-ascii?Q?zMrjygv/666GqIPOBpCQg/ZQ6VmsSYfbDs+kUF/XmjD0rEJYs0ZSIzssS8sW?=
 =?us-ascii?Q?+G2p8QtRmniaGhxZJGfLEnsNEpIwzDgDl94Vxo3j+qp3kM4vdgbuj7yE1v5f?=
 =?us-ascii?Q?mGf0MQKXKpiJJlvkWUf68nIYzoRTZXfsahBLWv0DH+S5I94vz3S1nWxcL75J?=
 =?us-ascii?Q?yL8XWfF/R9YD0Hl7fCs++jHdIwtKKfVcTjSzdwAjN3NG6T5/c44rwgvlsUFq?=
 =?us-ascii?Q?w6p5Dk1H9IcnCS/1kYcd32iaafDS5nxa5Q8vnEhmW1BnflO5e1HwwXxPMI1n?=
 =?us-ascii?Q?aoiZ03yEEAwEySQU/xK55bTW8An6qxXePm1cgRBI7Ic0I6tx1NuR1j2Y0ZCf?=
 =?us-ascii?Q?i6HvfutLI7vpd5ph5NxUmsOITjlWEUEVf54zDcguH3c4LAoM0V28uKwfFYty?=
 =?us-ascii?Q?sKq1LHQvg+dlYEEHulf9B10iA3PdxF8fmPgG2gxZHDsQYN5Yfi/hcogNNA5p?=
 =?us-ascii?Q?DBhFRvsGVyDJ+8+fcPshGLMI9UG7pdh3x/d5KxMvLjZXHCsGI7vXhSyVQCNz?=
 =?us-ascii?Q?x5dP1EqGllr84WEubOU0XlD/wm8oBtB3fZ3XyQEL30Qp3SpfVY1xsqoRkrx9?=
 =?us-ascii?Q?/c3VccoLGIvsYalc19sUmhFe/4eAPZs9YxrnZliZpYuP37ez7xI36tsGwf8E?=
 =?us-ascii?Q?EGiHaoKPq0Xo3YaAKwep/WnhkpJYh84mUDTQe0LMRWVhiTsuE7ezp9FuuGm9?=
 =?us-ascii?Q?X4vNKcAiXSCG7TLGYBvILrm+/hkdz0zuxxvVJkv4/S6ddCqGjGU3r1JVBIyc?=
 =?us-ascii?Q?bhM0b73ksLM1meSzR+nrPAh6G/qUSOWB+zeL1D7H4llkRDgQHHCwrFDsm746?=
 =?us-ascii?Q?r2PMERkH3NwYnReUCs4lPKUd2b8hfFO1rkKuotGQGYhwWp2BkASymdole+BZ?=
 =?us-ascii?Q?TJZyv2bcl3ruFttX/w8h92t2W8AcwfdZEzTqwJsS9UIb8oIPoSfcJk+m05xV?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	MgqWdETMrscGM4A0u2E9BN/q8zcWfHRLIr1K14hPBpcPNkRTpL3idfajDvMtV0ix4scJCt2Igx7grRoz5lzoMS/sN9CwQKfnyZLt7h2ISwJjcB69g0V6dCS/Tp1GdXx9lUc9bffRMXj6JvsOhYCkMA9Nk+mpqVpJ3NoVLDaEk5jB3P9GlPbbm6Dt2iOPRM3iVDM9OUqR/d6mvlFX1ZaEBjw6rXbzbyx+fEYQ4BA2i9xwwTrkVWf/n/1QwcUiUloIkoIS6P2i6RAZU3E2PdS1XpG+9jTbbWzx7BbR3eB+HXYGP7Sey0Lgys/j8Ct9vrup0q2QW61igNUU6hBzEW2+qejZSi8MArLRfsrIX5QVImflAuvI2dxgK5Mt+f74nRO9kGFKIoD64vH0cZPskmFJ4wkthZbqzPAd0eKu+EiegZndn2IYwfuWFg/YaFxiihUn0dJbnhicAIArgh2D0D32v/I9sb2JEihiqFc2F9mFK2oV4DApUnJvrJBEPuLNVbRyD3neqEDCjfQvqABFm8gni9ZbQ7bbH2GuBV3jG+OCd5dxiPi+9GU8muigd9+O4buml6HTg4UrGNDTIHXOwOIbl/BRpxEti83GjvWXiIx9TvQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff545d65-4c5a-4aae-249b-08dca764aa42
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 20:03:17.5538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Um9nQ+BDektkmVo3GVrr1EHjo2CE+MPGCTwjfM2M3z/zVZTfoZ1tDN+1mw8jFTE/5IBzHjbqnoqX3xrhVMOyvzJCG4Nv1DcRQ/Xcbx7emzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7973
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180134
X-Proofpoint-GUID: oQw_p4rotr12eTkfgCGGupPeCc1xcQQT
X-Proofpoint-ORIG-GUID: oQw_p4rotr12eTkfgCGGupPeCc1xcQQT

On Thu, Jun 27, 2024 at 01:34:32AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> This component was introduced by commit 95ac5e2496d1
> ("usdt: DTrace userspace side").
> 
> Its use was removed by commit e71a20d8
> ("dt_pid, dtprobed: move uprobe creation to dtrace"),
> but it was left in dt_impl.h.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_impl.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 3d3f58d5..d15c238c 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -349,7 +349,6 @@ struct dtrace_hdl {
>  
>  	dt_htab_t *dt_provs;	/* hash table of dt_provider_t's */
>  	const struct dt_provider *dt_prov_pid; /* PID provider */
> -	const struct dt_provider *dt_prov_usdt; /* USDT provider */
>  	int dt_proc_signal;	/* signal used to interrupt monitoring threads */
>  	struct sigaction dt_proc_oact;
>  	dt_proc_hash_t *dt_procs; /* hash table of grabbed process handles */
> -- 
> 2.18.4
> 
