Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D189121A443
	for <dtrace@lists.linux.dev>; Wed, 18 Jun 2025 19:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750275680; cv=fail; b=MxmGPle2DIT6EHE8RZPCASje5FOikFR+K8v0PYy/UWpCYLqzmzzqrqlSxmHjAiXWus0Dz+BfAtxPus24VrVzkgY01SZjZ5MX8Vi/5zzBJsoaChijeg3l4wzpexp9CN26V+z05/XunnpmJdW987Bz9Jiomjv7X5sZAa7HDtIriEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750275680; c=relaxed/simple;
	bh=L4Mnc3kqiB4WZE9abJR5J26yUKBDbOKy/3d4/bTyhes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nz7gLCNX7awvY8JKNePuP8gR7h36DZHzunWyHsKUQtW6+qhbrpCKviqCxkAs33+Z1xnBixA2xH3/ohH+ud9349ebavVey2t3JESumD2EYdhX8zLaOfNFjZG0FNgdOHFuilOzuW/tZrIJzZkEX4cLUnziWX7j13OwhgvV4kcbuVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qNV/1JaI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U51ayLHV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qNV/1JaI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U51ayLHV"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IHfc6W003121
	for <dtrace@lists.linux.dev>; Wed, 18 Jun 2025 19:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=iRxxpwzLKyB9i3WnMu
	ekNZyNkLXmXBMIi3gL0TvqAug=; b=qNV/1JaIFkgq6iZLzcLadournMNkFcnG45
	BoqKDD016OKxbC13iU1WCgulIy80/T49+sgTseV0Zu6D0pHklyIFpfB+YMPPI984
	grqpCJL46MBykkUjoKZiYgNt7uYpiQtMCNNchiSUozUl9rsZ/eKKdoxeCEIdc0Y9
	drZD6rI1ZAC/UHEOakqtY77+GZkDRYyP9t+Ed7+j41CcVQoLj2Mw0696qKtE6jZI
	Mom1DsN8vxgtqjqAu2WweRvnX0nX7ZySiRzG155H4fYg/vhSWanze1K+tOlhc2NG
	/OrKvO3+S+LuP1U/cT3PzJg1IhNdZscDJViEDshFPLLrlwSKoMQw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xv3ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Jun 2025 19:41:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IJSVPo032069
	for <dtrace@lists.linux.dev>; Wed, 18 Jun 2025 19:41:16 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhb2wc4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Jun 2025 19:41:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uL+nQhjwD39Np64fJuE8Sh3Rt96ymlhptvtDKTlGi0ehJwSdJCiTakvPGab5JYrUWCbfSt6vN0oDZ6hCo0Cig1Nttt/inkeySwBHaYFO9Hj7axsRO8jKqVNpY6YZAl6YdHl7482LQljuV2GL2tEooXA7nayoF4sY9PMrVA57M5BfnXOvbvJEi29c3A0hQdcJ44rYTTp/wJv5e91hNklG3kGtz28DnMHQI9l7r4JomCBp6bdwpPynPWiFjDuJ8bYdaLXJ2NqITPmlEMxPT3eYSSoRuCy1Pi9CIC0P6E+weqRzsEH+Y0Wslv+rWKcAA3TsiTdiUum3SQdCZW0K63/qYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRxxpwzLKyB9i3WnMuekNZyNkLXmXBMIi3gL0TvqAug=;
 b=CMbiJ/DwKiM2vHxKMXnastK1z4i3BrAxrTYhrahKc3jxFtRqSCnb/G3rQw1eWptUIVBXrq3MHjkS/YCE//tplPyEnSns/2+v5ZQQZha5UxjyUOF40cuwyj1PTlXu7bCNRkSDYFt5bn862d5ddwej4l+enD8TuIpPt0ECYzsc5a5MQn0IweDB/61NUhfCc+EWlmLU5DHgCcaW85hTtRTV5fQlmSnzRjBFTaVC56CNd5jdYOoWVEK9B2OWkIq2n0o7PDKXFzKqDDljwzqC4M1q6b4+VucM5u96vVVMZXJ/pa/XAhdKTf8jlJjPA+tWxkM/9mrtLZpmg4zW8VLGH7Byag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRxxpwzLKyB9i3WnMuekNZyNkLXmXBMIi3gL0TvqAug=;
 b=U51ayLHVlAkLuBO1aWae7KNU7rGwCXOH4L4+6mRwJw9QYKwmxidvAU7MANW1krcZMVde3LJGUnaDX3/AQPKe/uxJSWXkwQnEWcHOsFWx2qgBu5MiN/dkCHJapkT2CVPhHRmHRGtfaR3tflJu7DxC30TSgLnfG5VGxC8YQDa/2SY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB5794.namprd10.prod.outlook.com (2603:10b6:510:f4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 18 Jun
 2025 19:41:12 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.019; Wed, 18 Jun 2025
 19:41:12 +0000
Date: Wed, 18 Jun 2025 15:41:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] libproc: make Psystem_daemon() detect modern systemd
 properly
Message-ID: <aFMWVZrhuGDX2330@oracle.com>
References: <20250613164637.3110-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613164637.3110-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: 198d1b60-afa7-45ed-34db-08ddaea014c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hsQgmK25tLwvaY6SwFt7XR4Nv1MWkkf+bAjzJ5T6bHEkCvMVCMZ1sIG86y5Z?=
 =?us-ascii?Q?F4yvwhcIj3Zy32FGe53uSL6WK5b85Fo363YnkpoIYZSzu+iytpRBfoY9QYkX?=
 =?us-ascii?Q?he46D18RcUSRybFf8Kd/lUIFJyeA8FTNq/TpTKpi47pd+ZoLR5ezrPKmbgvk?=
 =?us-ascii?Q?Ap0zRAw4RQXKNBFMQURaCgnZQQdD99LkBtfH3VcOkG+mN9i7AAfq1eKY+XB9?=
 =?us-ascii?Q?6b+xw97hhNP9xoTPqeqOf1ARmYAmOusHC8UfULwYkUZbLfUHlXhe/UaxAVle?=
 =?us-ascii?Q?uGAEIx+MS3HFxznWfiq9cxiCv93DJeUxOs+m9YBPHl+bfh8iwu82lydxqGGT?=
 =?us-ascii?Q?XHVmKYHNO/AS+TKA5jWvVliWKBgcaKinRubnaL0islpEyjid2vUG26uXPLJb?=
 =?us-ascii?Q?NmEkLpWHv1GNFqX+e1sS/qZO2/ux6WLzVSW+/KmUk2rjgguPeHSFW3s4GWCQ?=
 =?us-ascii?Q?OznorQPBtc4cvoTLA5AQ+aS9ScdAnENWPW+nGZu1fkN0V073jXSZMmujJg3y?=
 =?us-ascii?Q?wouwh2Ed0Kb8px70nCLRglpOxJ6fyUNu773ti+zylA7x0bjGlrqPtHMubtbD?=
 =?us-ascii?Q?2xGOZULAEYM/JO8qs2q/XkP2mgN/6a9iZn4Rgx5rWQyAO1ObWKlrUqS0DMom?=
 =?us-ascii?Q?R1Mj8ECnr4hiUnUq7Pb8xWGMsqmPYqS/U6j485e941uW0QUIrZKCQIG/SGMs?=
 =?us-ascii?Q?RhHxCKwOGKiE6BqK1PP5nPA+1xi/6OlC4oB/Zq6XVP43tD1mJmrS3bK1aS8r?=
 =?us-ascii?Q?8fwK9/mwpdQYtuXWRlvCpn73xzCymhi2eIlxY3d5JaerqCYyDAeC6AStPUbO?=
 =?us-ascii?Q?9vDXAQHvNvIPVvURp9fmE0HVWS3KRfGUxFNshiF1vRlf+PsgRSQ5GEIRFheV?=
 =?us-ascii?Q?z5zJo1b+SI6NmwCy/VdZ6HsoKF96w3L8wXWYZ0Gi8/iWUi0oqJtXHljNDst4?=
 =?us-ascii?Q?HGcmgtEMnXs5w9wdZIil6Khm1+uhJvSEg0X17YOIOt+CnFBidkq7LdPKXXry?=
 =?us-ascii?Q?0JaprjzgBZzDSGhHdT02VBunmAXt/w5JGnJCw1M1o2abv5d9nG5EGMmYvPjw?=
 =?us-ascii?Q?lJSbN3TBMYMvT4Jvn42UnWGYlwtltGbQHJmnpYBPtOjfvBbdoKgJtpsiKoel?=
 =?us-ascii?Q?ADl+fJPxdvgzx+zbTcqQkAoxmHSWOsIl1rObqireW7WZuCMcRgOxry3Ifi3X?=
 =?us-ascii?Q?/XSIY7cT3TDGks6wNICNzIYQ13elBSwxfm6xsDAIISteLpEkqjRiVavRRhzl?=
 =?us-ascii?Q?cPPHPXQPOc7U3ns1CJ/PS5jVQdH4abmJGUsAz/v4tWhsuM1lIWHDy2tGFZ2A?=
 =?us-ascii?Q?OrljDjn/687JszziWhRGAtL3p/MXX2Zh07R2XCHJO31ZSWIJsG/yFzPqGqFd?=
 =?us-ascii?Q?dPTFplRHsxABjq6xyyRtM2I31Ol+qjXhi7aylRaYMQ4Sb+5YK6Su+C8sb+xO?=
 =?us-ascii?Q?GlyhcVu/sxY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tdKwDkbHf3hJBJ9T6kuPbFX9MZ67OoRn7ArB2WFsuPC3Geu6XfO/Xh+U/+ej?=
 =?us-ascii?Q?0teA1xfrNU4fWootx28CIHfpj6Dd9wLHqbhxzRfib9D4W7780tci77FUdw2h?=
 =?us-ascii?Q?jqbhUuWVOT97KwRem6K1fBEF5kyyWsteWDTFlnlh7YF9etsjo3ms8JWUjCja?=
 =?us-ascii?Q?kA2RmH9d0WqbPwlHuDPs5LKCH4QwH3uHeh1CLxsFiJ/PnWxVl+/LcCaQJR8X?=
 =?us-ascii?Q?ufxYodKcICOz+tyN+RduQr2HZOQxbblyl+u2SOQoCkK/07CyIXjslhcX6i+X?=
 =?us-ascii?Q?Fh3Y/ZEHcjwX5g7LNt9XBJwCyJ5f9559vlVykduj+Ms/dBuzJqzdFp3q7oa2?=
 =?us-ascii?Q?0juW3jLyXhI2HN0I3S9TjlIKLIdMJIqzC5uQKLe4JrjV/+zrHv3U/nXIlWOs?=
 =?us-ascii?Q?IeHDil/YDhYfM/ojVBmsIy9WR+KQ6fHj98Q0U9f5haqfq/1yfyM3ebqlygao?=
 =?us-ascii?Q?mDFfiqa0IP2vc6IYHnpIPcMCvbFvpKm8BGUZWsj0EJDLoPRRGH0Hbl6Hfa2Q?=
 =?us-ascii?Q?AG2APKrmIcO8wWBc9iJEPNpKl5Y0xAe9vJ72mHt+Sv9P17qqoW/Fl7O5uY+5?=
 =?us-ascii?Q?FFqWwt69VwygOxyTgMmL6/FytHEoXxJ5uD0+sdKfNn300TjIX5TsUnzzOfE7?=
 =?us-ascii?Q?K0IREUKSua9sHVQq5nxTIGcLyxsAuBBOeRLfLyvuPRrYjQlDSMnNSsE8WtOb?=
 =?us-ascii?Q?GI47jnMppfEKMUAEUAt/9oTf3oM54/04Bq7mOcsxZ2jTMar+MlhXmzbZR5kR?=
 =?us-ascii?Q?pIsD4LfY4F9282quiPPUmELszNEPaBZ1iMCwHzMQwIxo48iDwy+qExK3kpxf?=
 =?us-ascii?Q?3k5oGYEfmakieTuk3jK85RkQyUk92+tSUnoZR4L9THZoL8F4wKrng+wdUmuF?=
 =?us-ascii?Q?iUE07SFhYKhpc+XcxAqtVB8fhFpvS4g/XDLP4AS5y2ND8tjv9kcsQhWimr9I?=
 =?us-ascii?Q?+rly/ijtqQ78wvBHIa37ub9F9rI/lWJZkXR7J9AFv6xnIviKpIQCSSmzPjxi?=
 =?us-ascii?Q?ewvXVs/SSHJTuvXrzMuJGqWjAfhwKY+6rrOfywQRYPlB82B2Y0vlW0464QVH?=
 =?us-ascii?Q?pnnGS7Lal674VrRgrjjHV+AZmrBEx1C0zD6D+o51xwpllgaWbYC+kmWmsp0r?=
 =?us-ascii?Q?CHym9x6A69RSZEEBJSqng49TD+1D9pg+5QIfqMjb7i/hUQFTqN1ksYbuOnn6?=
 =?us-ascii?Q?rvuU/Niv1CitT5W0InMYLcnfZZsnQ3em+3phFoGRfX5DLrOEqbe8XNlm3/Ws?=
 =?us-ascii?Q?3x1MefDmPDOrpiCkM8Rr6Q6gKrkhx4dSCIVB5tVmlzoIBCNCx7JbZcvAcu8H?=
 =?us-ascii?Q?5bF7mIdUlAomOCBHuv1QXbFxY+CjgZt3QiLu0lGVfHj2Qw0sKKG6vAQ5wkdJ?=
 =?us-ascii?Q?ZC8CG6vskY0CUl9nBm+UfPrgBfJNn++M5KDsXj2OkOfhEuFpcPJDq7gWqcy/?=
 =?us-ascii?Q?BrDt4tQ0qsIZjGgedLpz7NkFcEoe39ibjguBo7gNa07JZZtqXmfiHTo8N9Ak?=
 =?us-ascii?Q?d7F1OJuPJVAa/9SEj5wr1CCMv1QnrQIg6O5RpjLWy+qz+lt7a2SOsteA22fJ?=
 =?us-ascii?Q?1ubl7hcGv8L8yYKE27vXRuhpe2F9WLPWQDCRmNXu90nTfU+F6ujW3XsaxuYa?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oyItSNb7wrkyqKoVwsQSvEJHOqTcTaEedmoSA1vgZzGfJ8Qht4ULkQn88kaheAkUnPco8bwO7AX7FDquMb7KpiBFKgsO7j5maiUmS5C5MJym57E/Dy8sYQDn/rrJIMixWc+/sLPvoUWRA0b/xQ8uquh35rydMzC3EI4EzMzQjLsOrI8LUIChM2UlAvDCAz5CG9ShFqPwAFyvS2ZTr2Js0pmd3WegdwDHSbPw85PExKkPIdTagaoFMBF56v7Y+5FvV185Nncly2Fq2xlgKYubWydv64YKGFROQJdUDq6uzlEAQeII4sijLqFa0fk8WY0KJqV46uIDQabYdXHuspiMj08LjZmFU2ev173Bn0LIhOJgVpRuC+5PqKuXM6G+oPM3XJZCFcF2MMuYHAiED/g54q0hE0dzNhKxz0mk6i1xDmLPES8CARCGppm1nyHed0ijYuS5VbaUsHoZRwkeLJbISuqSsKtPhB4A1VpLvaYwoObNc0za00Pq8BV5Bg+lKgc6y3OD2WcAscVUWvFhA0zv8Cqwa+6Qdc2iRe32UpStv+p6eRNn1ousKOcVAyo0B0o5KifJ2qcsK1DF4sHRjJg9HydbuBE+E1p/1re75PuEbgE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198d1b60-afa7-45ed-34db-08ddaea014c5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 19:41:12.4706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZ/b8L893G9ovMPNEmMa50d5CXHdSBGsUGSTzB6CcjbizydMzNQ5xOALXGRf+UJ2P9Wgm+e0HFx8S+qzgt/aqV6ZN9Swu3vf1O2ocevCYeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5794
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506180168
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE2OCBTYWx0ZWRfX0eq465Vszjms m0r9zC68YVkuEFyvKJfw6ah4wqM32Zgd9oli0pSLjXWti14zGrx9hJUayiYgUt+fZeIE1N/QUEd 51xtHwDHodgb+68lD6g7Ws9ltQFQ6uL80apSXmn1dUhy4Tgn/Cz9+vbZ7V+geTYxixvBWCp2725
 T9WSP6CpjFSxhhsEd1dyu/UEE9Ux+uZaoyMinPDAVnQ3JNtxCofh9q3kE7FoRew+ObOH5rT6aGg HPCC3iDFV+5JAw5lZT8JC2eePznbq1OkHHNR/Qql1y6pzoOo/nhG1vNKpOjPKWQV8M5wuejcWYe U6gVx8WGGt6WoV4bvZN3AjZkri2y+sKGTpDMReKGNFv35Pumu3zglGBAmYC1Wehz0n1WNs6xZUh
 SgopALLWW/m73zdorksXiaS0scIpHZOMIN/55kJTLQkeYukqoVuHfdSHcse8xWf2VcAwLIJv
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=6853165c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=AezME4_lQVbgBhvTBsIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: kZu2zENLFdZHi6IrR0pyp7I2Udb1vVq8
X-Proofpoint-ORIG-GUID: kZu2zENLFdZHi6IrR0pyp7I2Udb1vVq8

On Fri, Jun 13, 2025 at 05:46:37PM +0100, Nick Alcock wrote:
> Psystem_daemon() is used when carrying out shortlived grabs to detect
> whether a process is too risky to carry out invasive grabs of (you wouldn't
> usually want to stop syslogd or, God forbid, try to ptrace PID 1, unless
> explicitly requested via -p: the process just coming up in routine probe
> firing is not enough).
> 
> This has two code paths: a reliable one for systemd systems (which checks to
> see if the process is in the system slice, which contains precisely and only
> system daemons), and an unreliable one for other systems (which does the old
> Unix approach of consdering anything in the user uid range or with a TTY or
> with open standard FDs to TTYs to be not system daemons, and everything else
> to possibly be one).
> 
> We were checking to see if a system was systemd by looking for the systemd
> cgroup hierarchy name in any of the victim process's cgroups.  This was
> reliable back in the days of cgroups v1, but alas in v2 where systemd runs
> all the cgroups if it runs any and there are no longer multiple hierarchies,
> systemd no longer names its cgroups this way and the test fails, causing us
> to fall back to the unreliable pre-systemd approach.
> 
> Use a more reliable approach to detect systemd, the same approach used by
> sd_booted() in libsystemd; check for the existence of the
> /run/systemd/system directory.  Fix slice detection to work in the absence
> of a systemd hierarchy name, and everything else works unchanged.

Is /run/systems/system guaranteed to always be the correct path or is that
configurable in systemd and thus could change depending on distro etc?

> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  libproc/Pcontrol.c | 33 +++++++++++++++++++++++----------
>  1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/libproc/Pcontrol.c b/libproc/Pcontrol.c
> index 7d9b5055f8201..02da472553d99 100644
> --- a/libproc/Pcontrol.c
> +++ b/libproc/Pcontrol.c
> @@ -2927,10 +2927,24 @@ Psystem_daemon(pid_t pid, uid_t useruid, const char *sysslice)
>  	int fd;
>  
>  	/*
> -	 * If this is a system running systemd, or we don't know yet, dig out
> -	 * the systemd cgroup line from /proc/$pid/cgroup.
> +	 * If we don't know if this systemd is running systemd, find out.
>  	 */
> -	if (systemd_system != 0) {
> +	if (systemd_system < 0) {
> +		struct stat st;
> +
> +		if (stat("/run/systemd/system", &st) < 0 ||
> +		    !S_ISDIR(st.st_mode))
> +			systemd_system = 0;
> +		else
> +			systemd_system = 1;
> +		_dprintf("systemd system.\n");
> +	}
> +
> +	/*
> +	 * If this is a system running systemd, dig out the systemd cgroup line
> +	 * from /proc/$pid/cgroup.
> +	 */
> +	if (systemd_system) {
>  		snprintf(procname, sizeof(procname), "%s/%d/cgroup",
>  		    procfs_path, pid);
>  
> @@ -2941,20 +2955,19 @@ Psystem_daemon(pid_t pid, uid_t useruid, const char *sysslice)
>  		}
>  
>  		while (getline(&buf, &n, fp) >= 0) {
> -			if (strstr(buf, ":name=systemd:") != NULL) {
> -				systemd_system = 1;
> +			if (strstr(buf, ".slice/") != NULL) {
>  				break;
>  			}
>  		}
>  		fclose(fp);
>  		if (systemd_system < 0)
>  			systemd_system = 0;
> -	}
>  
> -	/*
> -	 * We have the systemd cgroup line in buf.  Look at our slice name.
> -	 */
> -	if (systemd_system) {
> +		/*
> +		 * We have our slice's cgroup line in buf.  Extract the slice
> +		 * name, skipping over the hierarchy number and controller
> +		 * fields.
> +		 */
>  		char *colon = strchr(buf, ':');
>  		if (colon)
>  			colon = strchr(colon + 1, ':');
> 
> base-commit: aa63660a7cfcdeb1daf4fb63f1c15f75a1693064
> prerequisite-patch-id: fb67028e06b7f26c5cab857477a44609f50a1706
> prerequisite-patch-id: f663cbb68f1b30be83e8327ff098fff812ba85e6
> prerequisite-patch-id: 7f3cf0adb87fb636276334b0002338ec656f86f7
> prerequisite-patch-id: f4716e3bf14ed8233d49d2f7f07bda796f2f2ba7
> prerequisite-patch-id: 66c5402691e142580c92584b2eaa4e793146b1a1
> prerequisite-patch-id: f96954068cbbaca32084ca999daa825d6668ddd4
> prerequisite-patch-id: 6e71861d033f5658a807814dce1161465cc600c5
> prerequisite-patch-id: 7e219f03f4634783ebd0550542fa8dbe33e70fa3
> prerequisite-patch-id: e7dad794aa72e6d48edc277370f8cca25292d3ba
> prerequisite-patch-id: 9288cd08c77af53d45e9eef5828bca8bddd22258
> prerequisite-patch-id: 994fc434d3e5684814f090acd558aa1d29e737b6
> prerequisite-patch-id: 0b84e67ab3948f9edcf987ddbf9ce38df5656ed3
> prerequisite-patch-id: cb433110beec8b9e5745acb05930c06b890f4788
> prerequisite-patch-id: 71925afd1991d6b1800e0767e5c1420f5b8b43ed
> prerequisite-patch-id: 67fc0d710b58d6205a6877c4e89b531147b61b51
> prerequisite-patch-id: 5b2284dbf7638adacab912d64ccfa775a00632be
> -- 
> 2.48.1.283.g18c60a128c
> 
