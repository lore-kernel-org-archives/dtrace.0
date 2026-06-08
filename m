Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456A63A9615
	for <dtrace@lists.linux.dev>; Mon,  8 Jun 2026 20:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780950439; cv=fail; b=rnMnoQEl0buNN6R6Vhq+QJkb8uUqzkmQMQ+Qo22WqtAeVDJkl3mA+8dt85pT0ftH7YreE9vPB+KUzvb3Zj4rgIAXlBSMkHR4Ws5Fo0zEE0gpHKKIKOuXX8htteyNaQl/wYjLWAjDQO4dFwYi4I4i8jXfEK8SZmpKyobJNLrnPFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780950439; c=relaxed/simple;
	bh=huPYSSGdozldWiLjda39AZklEtFfr6xrvpnag8yMqlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PhxiDN1fRPAhbVdKhC13QYLd4w3hxgv+QhKw9sKd8guoHfK5TDV40TpzQmQhQG2Xk+BAy4jIO/Xe9371isxGh5e0m+NLq/vcXZA0XdZYtRAmICKno3k4SVylbLuWrd/0LHnO3r30vT58v8ZeEa+w+uHolzZHDw8OO79G8wvNVYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oWSpGimc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tH829tTI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oWSpGimc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tH829tTI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658HSYKN429107;
	Mon, 8 Jun 2026 20:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=z1CI6iku4KH8BQ/0zZ
	vEHO4AOJ8dkKlaYsQo+ePkB+o=; b=oWSpGimcwidu6CCRS3fQUzXwO8gPX0lziO
	J8kHcsSChk6qSCbNmfmyRDMTN0GcMbuh9bfmLeRAdDZ9EfYydgyC4KmfXdUcO4Rk
	dddDIptsJlXl9ELIpFIraUstGlxZkJiWmfD180VurZhZXFkBWW1FKOLl9ithTaqQ
	/cA1596DdXKiIQ74ImiPK9Gz8HElJ12fo4SdEHQaCZP4MiVSFKptA/ZT/GfCNl2e
	MpIiQZTpFWOu9mkAD4f+/j9f/PGqfN6Ck5DYlBdikE158QbSbKz5SLOnuJsSUKmt
	w9nvOckx4J6xPLWlPqf+lLBeyGVCvpo/nmdodZynxn14i3o9q5Ig==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4embe7k4g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 20:27:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 658KN9sa037994;
	Mon, 8 Jun 2026 20:27:15 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010070.outbound.protection.outlook.com [52.101.61.70])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0e0hed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 20:27:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmHV8qWujVEkDjNwNG6VqyhzapEUhIDgYE4RfuHMBqHP3L85qpQwAQpLRmOM6J8iqGRgLyxzJAR6lrADbA5LnvVjTcA4kEBDPewe+/AB7aNbN6tPW7L3EM7MhPrxs97ahyu9XZ6hV5/hiofYcoYdphqu6rjiQsfeWqjcraHOjYKLUajwy073Y93h23N2eyZqIUCg2jTH8DjH7X6+Vbbqwz8q3YA2bE4ihf44H4cYvNwn9NI4Z9EFkX19MFy/tGS4p4dS9I6+06Ycu0QNKlRUtmtr8EmVuTvTyHQt4eIzGSxD+T72/vYb8Nd94fl63m2coFN12yVmx37aoF3ARdGoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1CI6iku4KH8BQ/0zZvEHO4AOJ8dkKlaYsQo+ePkB+o=;
 b=pCr6OEbcHxnr5pH3GR20PySEqUf0c3Is3jplTefZ3eKNECrpUjNnlkEhM2Cs6ZIImvmnokPxqJwXnWbQJo2CDquV9eoAj1kU700IUVRkYo3qWKvA5DU3LYdL6paQTVOhm/Ar/0Un0/zK5umo7Y30tH2HDUHllfXgp0AxldF31ZQxaw3OeYT+HnUisNl9hG+HuTe9kiodH/FJ5sCubr5EYZiNNg3XA2hT7KQ875oYvE/pRRYv/Ytw06tsGFuSZhHQpSdN4p5wWNte0nnKw6aSVt+Le3f7m6Yq11hiu/4lom3Y/02djbWwg0dITfv/vlWdO+ElEbsCrLIbhwTz/5ObtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1CI6iku4KH8BQ/0zZvEHO4AOJ8dkKlaYsQo+ePkB+o=;
 b=tH829tTIe5hpKmqZOb1AzJYA05SMva18te0F50vJAPTuuPJ/ikjDQqeAhz5+wf0Q3+/53oTi2QY9MMuFYFi7ODhDqAa4Pr7Y/cp6/DDqHAZKBugvguJFNUfnxtlRwdV1+AMrkh8Vqtvoj0D3mA0NdqgEK9KIu8Q/lcT0g2wKJM0=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by IA1PR10MB7198.namprd10.prod.outlook.com (2603:10b6:208:3f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 20:27:10 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 20:27:09 +0000
Date: Mon, 8 Jun 2026 16:27:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        OpenAI Codex <codex@openai.com>, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 4/6] dtrace: Add uresolve(symbol_name[,
 optional_fallback]) for symbol lookup
Message-ID: <aiclmi7vWR5IhX4a@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
 <20260605221217.1211791-5-alan.maguire@oracle.com>
 <aiNzBHzLAk45BqeS@oracle.com>
 <e5411146-fb52-4ff1-8660-3ed5ae561149@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5411146-fb52-4ff1-8660-3ed5ae561149@oracle.com>
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|IA1PR10MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: d1780c55-4085-477f-7bc9-08dec59c5068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|6133799003|22082099003|18002099003|3023799007|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	bl0/N0OdSz6xiDaF1yO0gjMXfcthc27mjQRqcf2NlSxFX1PRjW3astH2pDBauSxrTCirAvgA3hOEvjuFaZN89u5VppKGLRW22mOWTJcjtOERImQKzOFPwydC2dAtkNCPW+mCtgyHDnFzgQ2PNhA+Yjy3yXwDhhc03zzoj28q2P49zdIy1isqnkC6yjI6S6RhLPH3S+3MQ5xK3x863bldThPyRUjRrLr46q/1U0RlX1b0TqcOUNn4EHXaoC5pCrB7tarFTkUwzdXqLcdzv1hW+/pOlaT18Pk/QkWiKgf6du5ayDDcO+X/8OtoWNnTWoYq5b5zQRPD63SJN6gw0EzW9lwjLEIkmVGDK1js3jSOQ3fmfPzWcFkwNg0VatGo/bAqRjVTSHJaKyfZVerGpfTwBi6vGHfXY8SPwviFfKU38dwRYpZVQEfh7ZcqHB0ouZDfutQ3g/AHLvX0K9CJKmlHe0aqIieTC5HGvUmpS0tiYgjtjBI99Z2jEvwEVXbooajwjFjGlTwvsakF4IEOxHjS6iXr3LyeOUq6x4l3VGZzlvChChwJMLWsIIdCmZPu0fuCKmBQ4AJgWm4xeLb9ynE3P4cXVOz2usXgyx14U/fGCxEgN+QKVi3PVYo8df1wMJVdOMzcAOmUcaJrPJBqYO5j39SP9oXsWCX1hkLtxyS+q+k3gPtOoXr0goaRKz5RzRo3Adp00YLCcKkMY/b5rNEDdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PixjlEQ9B4PZ4za9MaB5p81OyUE5n+zCxXR41rOxHKQoDuBRU8TahMmQqc6i?=
 =?us-ascii?Q?t8eE4UvwqRd5rFcGs6AQ3CFHpHxUfLVV96qZOBmQ1LOoRtoXyHJ1DIXbYzeC?=
 =?us-ascii?Q?ZItcSccOIseKQSPCN9UQiMJxsZrjYgTueubWXmoE9B+rEU4LIuLEWdk0qFOz?=
 =?us-ascii?Q?0u4NosOo2Ft5F64kO3s6sLzRQVvItnMkQCoHZxWyQSW4ZTkQqNO+w+t1pvGt?=
 =?us-ascii?Q?T0AAHm/ySraZyBWJgHa9hgPGlbC9f/pg7Vjjf261FfqypAeUNRFFbyAmsORk?=
 =?us-ascii?Q?N22TIuVjF/SoS2CleX+w0BVOxzHZ9bKeR1c0ruOELI0xS6iqD4hu4lLX7+Lf?=
 =?us-ascii?Q?6OVE4EgrIDI2HvpIiWMVUBxkt1da6P8mQTPhV/IfrQ2zZr+iAkLlH2/nGTha?=
 =?us-ascii?Q?V8ojidz4k1iQyT7EaSr4Hu4Eoj0TcyR/eVjCtZnevGcH7BTIbDGFpqsRU2eT?=
 =?us-ascii?Q?Mp3WQeBNIplOi2zBWNFnOC4NVTyqJ4/WxtJBCKkzghqY2QJ2sETTp8B/3LHw?=
 =?us-ascii?Q?d4hlGvwnhHgAu8AuE+psS7H43JWLoZ/ccDe39r7fHue8myRYTdcV1Tj+vWdD?=
 =?us-ascii?Q?Oz9RpU4Lax15gGvo/m1jcPOKZtmEMxRn2+VAsu80EpPT8ry0EPwhUcHipCLf?=
 =?us-ascii?Q?cfOkcjyCQnHu6ygx3l5d7FPn5rVzjW1Exap0ehZRQlMcrTntjxgLOqPgvY+d?=
 =?us-ascii?Q?vqQruB3DRTuG0kVIwZHo70cSSFqUiaAT2hvKWqOcoYWREiKMU0+xlIQ06MES?=
 =?us-ascii?Q?wTuIO+hK2aGn/o3RNECC6BvVccsOnXHZgpVMNAp+bmvKtT4T4fieTaxiCNmG?=
 =?us-ascii?Q?oDamOd2VQRZXIXekbgpg0s+cV6E3CuZN0dQHTYA2HwJvlQ2OQ7FN7PrOLQgV?=
 =?us-ascii?Q?FAoslY642QADcgS6pV757of0Tq4zyM8Fdr1dPnJ02dSteWhrKDSNtlSA0kXu?=
 =?us-ascii?Q?QkTCkL+90PiQ2HDqdgdilBFieKtYVYKf46N4oiT7crXQPWoIFTRwwO3S0AEn?=
 =?us-ascii?Q?hGwwN5NCpJhObHzBeDZtT+99apxH+hNL3DwTktoZ6eOEgUcF7xPgtENj67fq?=
 =?us-ascii?Q?DH2+2NhZGopyZgeeSfygIrYqZzljIg/xknrlcLo+ZHs2mXHYsKPwC5gGbpBE?=
 =?us-ascii?Q?jgNZxlFX3FHQsjktqaKI3Ajtpmmx7QoImrOvfc63gSbMimDEdpfZuh/xsMw6?=
 =?us-ascii?Q?RI2iGo3kWQJgbzBjXXFkBdFe+utZNBUrIizRwAI1AtihkqNymXlhWsGz/FFq?=
 =?us-ascii?Q?lzO8d5KWVtzHedIIlMqOpXzOVP8g6mc5HlZ9Q40JVwzlRDJ3kcdE9KhanjcJ?=
 =?us-ascii?Q?1hMRPt6wV9FM/UCwRX+sw47rjzGWXqvkhAH0PG3oYJCSIVjoYi/ASd29XfVm?=
 =?us-ascii?Q?lFGr+phzm+lST3h15RcAZ8Eed8anNSZfWdmtHSsvOpC7C0rdrhds8xIRykmN?=
 =?us-ascii?Q?69Jb0OkdKTfVJQzIgHa9eY9n/hDtLo+wA+SYrDUREK0zVHImDnrvEzwVePkj?=
 =?us-ascii?Q?+OtW/r2UGUvZX8X4zdVE2txMruhaOUWsqgKno9qbJL7mz3zi33GHySWXQq7k?=
 =?us-ascii?Q?IcFLeXL/q7UxmfhQHJPsfhlhmUcUYumcoP9cDGlJxQkOcDuEjI4Mc0MFHAIS?=
 =?us-ascii?Q?am2pfa6Utf0wijG3AlVMsoUjzfhNplN/jfUzNno3INqFlNj9R0ZipPoINhuM?=
 =?us-ascii?Q?Af1XErPV0cs86vrz5+pzIpuloaAyb/fLLEeeM1HL1BsV/cVOUEkiI/opcFsZ?=
 =?us-ascii?Q?gaKP2IZiew=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	lInFB7tTPBt07eaQapmHFB2HFgCkm3MOL47XYk+e2SB87WJNkHvfIwH9vXqHN7PxWVc0YvlrK5+jnfb9+ZdG7QtN4i40vVlRGRvGNhnRBjmJhRdi3smi3GHsNP3uwt6pJClIbERr3B8tDt3BXVr+lwNS3yQZAKgchKc7v8xiSYUvFzSeJWF9nu/Fg03YIGFaJJMlnRGryYMf+WtF2HVHomhMgLAYLVhkaMK57szAqyllcdxNBiJbNJL7Up1APTVXGdEyD8SS4ghnFeuDK1lP62D0YYd4DS7zRjYmJfHZu78xV7XqN1Lf7wfBQjrB1KSn2AaPxddtgaq+98JCl/Ad7Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	v6kRPhiTL5CQ81bEkde24BwPj/oqPO1jbxIbDa6JKWcrHkNCTc7EY1rXGoCOImDb5p8pbPbrjRiD8efhyEGG04kMV/St1WwJvW7B41gUEdy6PHsQ6O2XoKQbQSXtfgrodNebPNtIt/nUey1ZJGnejrr1zQ2K5ZeHQ+293pf6KgYPxGAOw/swf7zjpRUlaJeS9mKLwlSgjn13kc60EVxRsbgd8blLWjNN+6pljgFVj+vU0tvotGhapNgNv5jvQtuSFBj0fTNrS7hOYkQ48pAEUZFQX4vzErjp2oMF8vx9ZC+YvghGanuorGsThPdNU7UUnyx471/Ozc8E7mgyVouxmFJcHILpc1dkLIgMJB5uVgMcOcfb4D/8+gSTjqU9b4NZI3s/YjdlRxAiHNZipjjIoyeOJw/T1UmyBCXpHJ2n1DNCXgGVFKGhjFn3HHD/3v1B62inLrdereZmJTuLicz3m3orAj2E9sfugkRml3ZJRgDyOs9H+mJH9UjAqQwEd3/92ffFbp0Z07NmjDMwvK3C2jcJYCTtpQ1A4aNkQCovDyk5Kbq9cG/CN35hEGfvNVB0wbA9qZWYkp7txpvFD8WFaDWug1WQE/TifI3vZEmAm38=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1780c55-4085-477f-7bc9-08dec59c5068
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 20:27:09.0952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHhdIYPoqOOq2rFeZL7UxFb/3ktC1Xl0n3n7XfxN+DDzOfl6zuwqjqn+OvqmE+Pci9kTLiDDTwz9AdnwC/ccQ9WNcaZdqOnaCPxKZc4ddTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7198
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606080185
X-Proofpoint-ORIG-GUID: rxSlORyZ1-dsxtqHxYTUzFYWqeSFR-NP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE4NSBTYWx0ZWRfXxrDOXqmG+d/t
 u1xHYQxDr9q8rXu549LmUlOqp5ny+FqwkL7R1qRA/9cHbBBoFbdfNL2uPcIwL5GdE3VUf0083zf
 hAZQAWGxQnGq+PGlbGuBwmSjR8omPoFtiSNUsbMo4YevLercVAWJsxLGG0BImZqzZFH7RMjgqkE
 Jio07WcvNBT4cRMAMDRRtYde2Ip01LdG4AFDoyEIIsf4BDSKbX0VVv+6ynZHSlqyuwP/lu2mRSU
 AX2z5gDGZc9WubzyRlTBovxO2wW+0s9ciQh5d2VzXgQHlXN4YggmLUH2J3fue1KjninI+sTeW6r
 dhnAhQ4tAqOIeuJVfNKDgPFDCsDBxlSiRcoiBzorljYYdPlE4oZcGG3/OCMnouZocC4vfyu2vzR
 p7pUp8zILrTyn/s75m4WIQYQvRtAX/mgL3o2e6PP5sS22dQegIgNzjkehQr4OsvX5MkCH3/3Zri
 4rFmndHTllT6wmZE6Sg==
X-Proofpoint-GUID: rxSlORyZ1-dsxtqHxYTUzFYWqeSFR-NP
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a2725a4 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8
 a=LG5T7v2SAAAA:8 a=NG5wmnGRpvtQuZkeXMUA:9 a=VeWe3YRKdqvOQKJ6:21
 a=CjuIK1q_8ugA:10

On Mon, Jun 08, 2026 at 11:43:47AM +0100, Alan Maguire wrote:
> On 06/06/2026 02:08, Kris Van Hees wrote:
> > A few initial comments:
> > 
> > - How is this different from what ``symbol or object``symbol would provide?
> >   (Yes, as far as I know it never got fully implemented but I think this might
> >    be similar to what you are doing, and perhaps it would be better to use the
> >    already documented syntax, and actually implement it more fully.)
> >
> 
> this is a good idea; I've rebuilt using the existing `` syntax, and it works
> well.  My only reservation was losing the fallback behaviour that uresolve() provided;
> however I've implemented that with an option -xuresolvefail=zero which zeros out the 
> results of address resolution to allow scripts to handle missing symbols.

Hm, but the <module>``<symbol> resolving is done at compile time, so there
should be no need to have a fallback - if the symbol cannot be resolved, then
the script shouldn't be able to work.  This is similar to how kernel symbols
that do not exist cause <module>`<symbol> to fail to resolve and thus the
script won't compile.

Why would you end up trying to use a script using a userspace symbol without
knowing whether the symbol exists?  

> One other change below relating to your next question..
>  
> > - I think it is problematic that the cg code is making calls to a function in
> >   a particular provider.  THe architecture has been quite careful at avoiding
> >   breaking through that boundary.  I'm still digging a bit more through the
> >   code to determine exactly why that call is truly needed - it should not be
> >   necessary as far as I can see.
> > 
> 
> We can fix that as well; it is reasonable to expect in systemwide probe context
> that a user qualify their symbol with the object (with the proviso that we
> support path expansion as we do for the probemod). This requires a few minor
> lexical changes to support filenames with "." in them, but it makes sense and
> avoids us having to make inferences from the probe context. So in other words
> to retrieve a global variable from libpython during systemwide probing we'd have

Yes, the module name needs to allow for . characters, per the module naming
rules in DTrace.

> python*:libpython3.6m.so::function-entry
> {
> 	this->cur = copyin((uintptr_t)&libpython3.6m.so``_PyThreadState_Current, sizeof(void *));
> 	..
> }
> 
> > Resolution of a userspace symbol should essentially be a simple matter of:
> > 
> > 	object-base-addr + symbol-offset
> > 
> > where the object is a particular mapping within the address space of the
> > current user process.
> > 
> > On Fri, Jun 05, 2026 at 11:12:15PM +0100, Alan Maguire via DTrace-devel wrote:
> >> Add uresolve(symbol[, fallback]) to resolve user-space symbols from D
> >> scripts.  uresolve() resolves a symbol to an object-relative offset at
> >> compile time, then computes the process-specific runtime address at probe
> >> fire time as:
> >>
> >>     current uprobe IP - probe offset + symbol offset
> >>
> >> For pid$target probes, use the target process and its /proc/<pid>/maps state
> >> to find the symbol and translate it to the same object-relative coordinate
> >> used by uprobes.  For system-wide uprobes, resolve the offset from the probed
> >> object file.  In both cases, address generation is shared and remains dynamic;
> >> the presence of a target process does not bake in an absolute address.
> >>
> >> Use bpf_get_func_ip() when available so system-wide uprobes use the actual
> >> probed instruction address rather than a saved pt_regs IP that may contain
> >> the resume address.  Retain the saved-IP path as a fallback.
> >>
> >> This allows scripts to locate process-local data such as
> >> _PyThreadState_Current across ASLR and across system-wide probes firing in
> >> different processes.  The optional fallback argument is returned when the
> >> symbol cannot be resolved; without it, resolution failure remains a
> >> compile-time error.
> >>
> >> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> >> Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
> >> ---
> >>  include/dtrace/dif_defines.h |   3 +-
> >>  libdtrace/dt_bpf.c           |   1 +
> >>  libdtrace/dt_cg.c            | 456 +++++++++++++++++++++++++++++++++++
> >>  libdtrace/dt_open.c          |   2 +
> >>  libdtrace/dt_probe.h         |   1 +
> >>  libdtrace/dt_prov_uprobe.c   |  58 ++++-
> >>  6 files changed, 516 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> >> index edb98f06..63b8c293 100644
> >> --- a/include/dtrace/dif_defines.h
> >> +++ b/include/dtrace/dif_defines.h
> >> @@ -213,8 +213,9 @@
> >>  #define DIF_SUBR_LINK_NTOP		45
> >>  #define DIF_SUBR_STACK			46
> >>  #define DIF_SUBR_USTACK			47
> >> +#define DIF_SUBR_URESOLVE		48
> >>  
> >> -#define DIF_SUBR_MAX			47
> >> +#define DIF_SUBR_MAX			48
> >>  
> >>  typedef uint32_t	dif_instr_t;
> >>  
> >> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> >> index 146a66e3..aecd71d9 100644
> >> --- a/libdtrace/dt_bpf.c
> >> +++ b/libdtrace/dt_bpf.c
> >> @@ -470,6 +470,7 @@ dt_bpf_init_helpers(dtrace_hdl_t *dtp)
> >>  	BPF_HELPER_MAP(probe_read_user_str, probe_read_str);
> >>  	BPF_HELPER_MAP(probe_read_kernel, probe_read);
> >>  	BPF_HELPER_MAP(probe_read_kernel_str, probe_read_str);
> >> +	BPF_HELPER_MAP(get_func_ip, unspec);
> >>  	BPF_HELPER_MAP(get_current_task_btf, unspec);
> >>  	BPF_HELPER_MAP(task_pt_regs, unspec);
> >>  #undef BPF_HELPER_MAP
> >> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> >> index 1bd73e11..16c58e35 100644
> >> --- a/libdtrace/dt_cg.c
> >> +++ b/libdtrace/dt_cg.c
> >> @@ -11,6 +11,9 @@
> >>  #include <setjmp.h>
> >>  #include <assert.h>
> >>  #include <errno.h>
> >> +#include <ctype.h>
> >> +#include <fcntl.h>
> >> +#include <unistd.h>
> >>  
> >>  #include <sys/socket.h>			/* needed for if_arp.h on OL7/x86 */
> >>  #include <linux/if_arp.h>		/* ARPHRD_ETHER ARPHRD_INFINIBAND */
> >> @@ -6988,6 +6991,458 @@ dt_cg_subr_link_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >>  	dt_regset_free(drp, type->dn_reg);
> >>  }
> >>  
> >> +static const char *
> >> +dt_cg_basename(const char *path)
> >> +{
> >> +	const char	*p;
> >> +
> >> +	p = strrchr(path, '/');
> >> +	return p != NULL ? p + 1 : path;
> >> +}
> >> +
> >> +static int
> >> +dt_cg_parse_objname(const char *mod, Lmid_t *lmidp, const char **objp)
> >> +{
> >> +	char	*end;
> >> +
> >> +	if (mod == NULL || mod[0] == '\0' || strisglob(mod))
> >> +		return -1;
> >> +
> >> +	if (strncmp(mod, "LM", 2) == 0 && isdigit((unsigned char)mod[2])) {
> >> +		*lmidp = strtoul(mod + 2, &end, 16);
> >> +		if (*end != '`' || end[1] == '\0' || strchr(end + 1, '`'))
> >> +			return -1;
> >> +
> >> +		*objp = end + 1;
> >> +		return 0;
> >> +	}
> >> +
> >> +	*lmidp = PR_LMID_EVERY;
> >> +	*objp = mod;
> >> +	return 0;
> >> +}
> >> +
> >> +static int
> >> +dt_cg_probe_objname(const dt_probe_t *prp, Lmid_t *lmidp, const char **objp)
> >> +{
> >> +	if (prp == NULL || prp->desc == NULL)
> >> +		return -1;
> >> +
> >> +	return dt_cg_parse_objname(prp->desc->mod, lmidp, objp);
> >> +}
> >> +
> >> +static int
> >> +dt_cg_obj_matches_path(const char *obj, const char *path)
> >> +{
> >> +	const char	*base;
> >> +	Lmid_t		lmid;
> >> +
> >> +	if (obj == NULL || path == NULL)
> >> +		return 0;
> >> +
> >> +	if (dt_cg_parse_objname(obj, &lmid, &obj) == -1)
> >> +		return 0;
> >> +
> >> +	base = dt_cg_basename(path);
> >> +	return strcmp(obj, path) == 0 || strcmp(obj, base) == 0;
> >> +}
> >> +
> >> +static int
> >> +dt_cg_elf_sym_to_offset(Elf *elf, const GElf_Sym *sym, uint64_t *offp)
> >> +{
> >> +	GElf_Ehdr	ehdr;
> >> +	size_t		i, phnum;
> >> +	uint64_t	base = 0;
> >> +
> >> +	if (sym->st_shndx == SHN_UNDEF ||
> >> +	    gelf_getehdr(elf, &ehdr) == NULL ||
> >> +	    elf_getphdrnum(elf, &phnum) != 0)
> >> +		return -1;
> >> +
> >> +	/*
> >> +	 * Match the object-relative coordinate used by uprobe offsets.  For
> >> +	 * ET_DYN, libproc computes file_dyn_base from the first PT_LOAD
> >> +	 * segment's page offset.  For ET_EXEC, the load bias is zero and the
> >> +	 * first segment's vaddr remains part of the object-relative offset.
> >> +	 */
> >> +	for (i = 0; i < phnum; i++) {
> >> +		GElf_Phdr	phdr;
> >> +
> >> +		if (gelf_getphdr(elf, i, &phdr) == NULL ||
> >> +		    phdr.p_type != PT_LOAD)
> >> +			continue;
> >> +
> >> +		if (ehdr.e_type == ET_EXEC)
> >> +			base = phdr.p_vaddr;
> >> +		else if (ehdr.e_type == ET_DYN && phdr.p_align != 0)
> >> +			base = phdr.p_vaddr & (phdr.p_align - 1);
> >> +
> >> +		break;
> >> +	}
> >> +
> >> +	if (i == phnum || sym->st_value < base)
> >> +		return -1;
> >> +
> >> +	*offp = sym->st_value - base;
> >> +	return 0;
> >> +}
> >> +
> >> +static int
> >> +dt_cg_elf_lookup_symtab(Elf *elf, int type, const char *name, GElf_Sym *symp)
> >> +{
> >> +	Elf_Scn		*scn = NULL;
> >> +
> >> +	while ((scn = elf_nextscn(elf, scn)) != NULL) {
> >> +		GElf_Shdr	shdr;
> >> +		Elf_Data	*data;
> >> +		size_t		i, nsyms;
> >> +
> >> +		if (gelf_getshdr(scn, &shdr) == NULL ||
> >> +		    shdr.sh_type != type ||
> >> +		    shdr.sh_entsize == 0)
> >> +			continue;
> >> +
> >> +		data = elf_getdata(scn, NULL);
> >> +		if (data == NULL)
> >> +			continue;
> >> +
> >> +		nsyms = shdr.sh_size / shdr.sh_entsize;
> >> +		for (i = 0; i < nsyms; i++) {
> >> +			GElf_Sym	sym;
> >> +			const char	*s;
> >> +			uchar_t		stype;
> >> +
> >> +			if (gelf_getsym(data, i, &sym) == NULL ||
> >> +			    sym.st_name == 0 ||
> >> +			    sym.st_shndx == SHN_UNDEF)
> >> +				continue;
> >> +
> >> +			stype = GELF_ST_TYPE(sym.st_info);
> >> +			if (stype == STT_FILE || stype == STT_SECTION)
> >> +				continue;
> >> +
> >> +			s = elf_strptr(elf, shdr.sh_link, sym.st_name);
> >> +			if (s != NULL && strcmp(s, name) == 0) {
> >> +				*symp = sym;
> >> +				return 0;
> >> +			}
> >> +		}
> >> +	}
> >> +
> >> +	return -1;
> >> +}
> >> +
> >> +static int
> >> +dt_cg_elf_lookup_offset(const char *path, const char *name, uint64_t *offp)
> >> +{
> >> +	GElf_Sym	sym;
> >> +	Elf		*elf = NULL;
> >> +	int		fd, rc = -1;
> >> +
> >> +	fd = open(path, O_RDONLY);
> >> +	if (fd < 0)
> >> +		return -1;
> >> +
> >> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
> >> +	if (elf == NULL || elf_kind(elf) != ELF_K_ELF)
> >> +		goto out;
> >> +
> >> +	if (dt_cg_elf_lookup_symtab(elf, SHT_SYMTAB, name, &sym) == -1 &&
> >> +	    dt_cg_elf_lookup_symtab(elf, SHT_DYNSYM, name, &sym) == -1)
> >> +		goto out;
> >> +
> >> +	rc = dt_cg_elf_sym_to_offset(elf, &sym, offp);
> >> +
> >> +out:
> >> +	if (elf != NULL)
> >> +		elf_end(elf);
> >> +	close(fd);
> >> +	return rc;
> >> +}
> >> +
> >> +typedef struct dt_cg_uresolve_arg {
> >> +	const char	*name;
> >> +	const char	*obj;
> >> +	int		explicit_obj;
> >> +	int		nmatches;
> >> +	int		no_path;
> >> +	int		no_symbol;
> >> +	int		bad_object;
> >> +	int		different_offset;
> >> +	uint64_t	off;
> >> +} dt_cg_uresolve_arg_t;
> >> +
> >> +static int
> >> +dt_cg_uresolve_probe(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg)
> >> +{
> >> +	dt_cg_uresolve_arg_t	*uap = arg;
> >> +	const char		*path;
> >> +	uint64_t		off;
> >> +
> >> +	path = dt_probe_uprobe_path(prp);
> >> +	if (path == NULL) {
> >> +		uap->no_path = 1;
> >> +		return 1;
> >> +	}
> >> +
> >> +	if (uap->explicit_obj && !dt_cg_obj_matches_path(uap->obj, path)) {
> >> +		uap->bad_object = 1;
> >> +		return 1;
> >> +	}
> >> +
> >> +	if (dt_cg_elf_lookup_offset(path, uap->name, &off) != 0) {
> >> +		uap->no_symbol = 1;
> >> +		return 1;
> >> +	}
> >> +
> >> +	if (uap->nmatches++ == 0) {
> >> +		uap->off = off;
> >> +		return 0;
> >> +	}
> >> +
> >> +	if (uap->off != off) {
> >> +		uap->different_offset = 1;
> >> +		return 1;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int
> >> +dt_cg_uresolve_from_probe_file(dt_node_t *dnp, dt_node_t *arg,
> >> +			       const char *name, const char *obj,
> >> +			       int explicit_obj, int allow_fallback,
> >> +			       uint64_t *offp)
> >> +{
> >> +	dt_cg_uresolve_arg_t	uarg = { 0 };
> >> +	dtrace_hdl_t		*dtp = yypcb->pcb_hdl;
> >> +
> >> +	uarg.name = name;
> >> +	uarg.obj = obj;
> >> +	uarg.explicit_obj = explicit_obj;
> >> +
> >> +	if (yypcb->pcb_pdesc != NULL)
> >> +		dt_probe_iter(dtp, yypcb->pcb_pdesc, dt_cg_uresolve_probe,
> >> +			      NULL, &uarg);
> >> +	else if (yypcb->pcb_probe != NULL)
> >> +		dt_cg_uresolve_probe(dtp, yypcb->pcb_probe, &uarg);
> >> +
> >> +	if (uarg.bad_object)
> >> +		dnerror(arg, D_PROC_NAME, "uresolve( ) object %s does not "
> >> +			"match the current uprobe object\n", obj);
> >> +	if (uarg.no_path)
> >> +		dnerror(dnp, D_PROC_NAME, "uresolve( ) requires a unique "
> >> +			"uprobe object path for this probe\n");
> >> +	if (uarg.no_symbol) {
> >> +		if (allow_fallback)
> >> +			return -1;
> >> +
> >> +		dnerror(arg, D_PROC_FUNC, "failed to resolve user symbol %s "
> >> +			"in the current uprobe object\n", arg->dn_string);
> >> +	}
> >> +
> >> +	if (uarg.nmatches == 0) {
> >> +		dnerror(dnp, D_PROC_NAME, "uresolve( ) cannot determine the "
> >> +			"current uprobe object\n");
> >> +	}
> >> +
> >> +	if (uarg.different_offset)
> >> +		dnerror(arg, D_PROC_FUNC, "uresolve( ) matched multiple "
> >> +			"uprobe objects with different offsets for symbol %s\n",
> >> +			arg->dn_string);
> >> +
> >> +	*offp = uarg.off;
> >> +	return 0;
> >> +}
> >> +
> >> +static int
> >> +dt_cg_uresolve_from_target(dt_node_t *dnp, dt_node_t *arg, pid_t pid,
> >> +			   Lmid_t lmid, const char *obj, const char *name,
> >> +			   int allow_fallback, uint64_t *offp)
> >> +{
> >> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> >> +	const prmap_t	*mapp, *first;
> >> +	GElf_Sym	sym;
> >> +	pid_t		gpid;
> >> +	int		err = 0;
> >> +
> >> +	gpid = dt_proc_grab_lock(dtp, pid,
> >> +	    DTRACE_PROC_WAITING | DTRACE_PROC_SHORTLIVED);
> >> +	if (gpid <= 0)
> >> +		dnerror(dnp, D_PROC_GRAB, "failed to grab target process %d "
> >> +			"for uresolve( )\n", pid);
> >> +
> >> +	if (dt_Pxlookup_by_name(dtp, gpid, lmid, obj, name,
> >> +	    &sym, NULL) != 0) {
> >> +		err = 1;
> >> +	} else if ((mapp = dt_Paddr_to_map(dtp, gpid, sym.st_value)) == NULL ||
> >> +	    mapp->pr_file == NULL ||
> >> +	    (first = mapp->pr_file->first_segment) == NULL ||
> >> +	    sym.st_value < first->pr_vaddr) {
> >> +		err = 1;
> >> +	} else {
> >> +		*offp = sym.st_value - first->pr_vaddr;
> >> +	}
> >> +
> >> +	dt_proc_release_unlock(dtp, gpid);
> >> +
> >> +	if (err == 0)
> >> +		return 0;
> >> +
> >> +	if (allow_fallback)
> >> +		return -1;
> >> +
> >> +	dnerror(arg, D_PROC_FUNC, "failed to resolve target user symbol %s\n",
> >> +		arg->dn_string);
> >> +}
> >> +
> >> +static void
> >> +dt_cg_uresolve_emit_offset_addr(dt_node_t *dnp, dt_irlist_t *dlp,
> >> +				dt_regset_t *drp, uint64_t symoff)
> >> +{
> >> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> >> +	int	treg;
> >> +
> >> +	/*
> >> +	 * Compute the current object base from the saved user PC and the
> >> +	 * uprobe offset, then add the compile-time-resolved symbol offset.
> >> +	 * When available, use the kernel's current uprobe IP directly because
> >> +	 * the saved register block may not reliably carry the breakpoint
> >> +	 * address for system-wide uprobes across different processes.
> >> +	 */
> >> +	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
> >> +		if (dt_regset_xalloc_args(drp) == -1)
> >> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >> +		if (dt_regset_xalloc(drp, BPF_REG_0) == -1)
> >> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >> +
> >> +		dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
> >> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
> >> +		dt_regset_free_args(drp);
> >> +
> >> +		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
> >> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >> +
> >> +		emit(dlp, BPF_MOV_REG(dnp->dn_reg, BPF_REG_0));
> >> +		dt_regset_free(drp, BPF_REG_0);
> >> +	} else {
> >> +		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
> >> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >> +
> >> +		if ((treg = dt_regset_alloc(drp)) == -1)
> >> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >> +
> >> +		dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
> >> +		emit(dlp, BPF_LOAD(BPF_DW, dnp->dn_reg, treg,
> >> +				   DMST_REGS + PT_REGS_IP));
> >> +		dt_regset_free(drp, treg);
> >> +	}
> >> +
> >> +	if ((treg = dt_regset_alloc(drp)) == -1)
> >> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >> +
> >> +	dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
> >> +	emit(dlp, BPF_LOAD(BPF_DW, treg, treg, DMST_PROFF));
> >> +	emit(dlp, BPF_ALU64_REG(BPF_SUB, dnp->dn_reg, treg));
> >> +	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, treg, symoff);
> >> +	emit(dlp, BPF_ALU64_REG(BPF_ADD, dnp->dn_reg, treg));
> >> +
> >> +	dt_regset_free(drp, treg);
> >> +}
> >> +
> >> +static void
> >> +dt_cg_subr_uresolve(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >> +{
> >> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> >> +	dt_node_t	*arg = dnp->dn_args;
> >> +	dt_node_t	*fallback;
> >> +	dt_ident_t	*tidp;
> >> +	pid_t		pid = 0;
> >> +	char		*spec, *tick;
> >> +	const char	*obj = NULL;
> >> +	const char	*name;
> >> +	Lmid_t		lmid = PR_LMID_EVERY;
> >> +	uint64_t	off = 0;
> >> +	int		err = 0, explicit_obj = 0;
> >> +	int		use_fallback = 0;
> >> +
> >> +	if (arg == NULL || (arg->dn_list != NULL &&
> >> +	    arg->dn_list->dn_list != NULL))
> >> +		dnerror(dnp, D_PROTO_LEN, "uresolve( ) prototype mismatch: "
> >> +			"expected 1 or 2 arguments\n");
> >> +
> >> +	if (arg->dn_kind != DT_NODE_STRING)
> >> +		dnerror(arg, D_PROTO_ARG, "uresolve( ) argument #1 must be "
> >> +			"a string constant\n");
> >> +
> >> +	fallback = arg->dn_list;
> >> +	tidp = dt_idhash_lookup(dtp->dt_macros, "target");
> >> +	if (tidp != NULL)
> >> +		pid = tidp->di_id;
> >> +
> >> +	spec = strdup(arg->dn_string);
> >> +	if (spec == NULL)
> >> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
> >> +
> >> +	tick = strrchr(spec, '`');
> >> +	if (tick != NULL) {
> >> +		*tick = '\0';
> >> +		obj = spec;
> >> +		name = tick + 1;
> >> +		explicit_obj = 1;
> >> +
> >> +		if (*obj == '\0' || *name == '\0')
> >> +			err = 1;
> >> +	} else {
> >> +		name = spec;
> >> +	}
> >> +
> >> +	if (err != 0) {
> >> +		free(spec);
> >> +		dnerror(arg, D_PROC_NAME, "uresolve( ) argument must be "
> >> +			"\"symbol\" or \"object`symbol\"\n");
> >> +	}
> >> +
> >> +	if (pid == 0) {
> >> +		if (dt_cg_uresolve_from_probe_file(dnp, arg, name, obj,
> >> +		    explicit_obj, fallback != NULL, &off) != 0)
> >> +			use_fallback = 1;
> >> +		goto done;
> >> +	}
> >> +
> >> +	if (explicit_obj) {
> >> +		if (dt_cg_parse_objname(obj, &lmid, &obj) != 0) {
> >> +			free(spec);
> >> +			dnerror(arg, D_PROC_NAME, "uresolve( ) object %s is "
> >> +				"not a valid user object name\n", arg->dn_string);
> >> +		}
> >> +	} else if (dt_cg_probe_objname(yypcb->pcb_probe, &lmid, &obj) != 0) {
> >> +		const char	*path = dt_probe_uprobe_path(yypcb->pcb_probe);
> >> +
> >> +		if (path != NULL) {
> >> +			obj = path;
> >> +			lmid = PR_LMID_EVERY;
> >> +		} else {
> >> +			free(spec);
> >> +			dnerror(arg, D_PROC_NAME, "unqualified uresolve( ) "
> >> +				"requires a concrete probe module\n");
> >> +		}
> >> +	}
> >> +
> >> +	if (dt_cg_uresolve_from_target(dnp, arg, pid, lmid, obj, name,
> >> +	    fallback != NULL, &off) != 0)
> >> +		use_fallback = 1;
> >> +
> >> +done:
> >> +	free(spec);
> >> +
> >> +	if (use_fallback) {
> >> +		dt_cg_node(fallback, dlp, drp);
> >> +		dnp->dn_reg = fallback->dn_reg;
> >> +	} else
> >> +		dt_cg_uresolve_emit_offset_addr(dnp, dlp, drp, off);
> >> +}
> >> +
> >>  typedef void dt_cg_subr_f(dt_node_t *, dt_irlist_t *, dt_regset_t *);
> >>  
> >>  static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
> >> @@ -7039,6 +7494,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
> >>  	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
> >>  	[DIF_SUBR_STACK]		= &dt_cg_subr_stack,
> >>  	[DIF_SUBR_USTACK]		= &dt_cg_subr_ustack,
> >> +	[DIF_SUBR_URESOLVE]		= &dt_cg_subr_uresolve,
> >>  };
> >>  
> >>  static void
> >> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> >> index ca00788a..0505e2ff 100644
> >> --- a/libdtrace/dt_open.c
> >> +++ b/libdtrace/dt_open.c
> >> @@ -330,6 +330,8 @@ static const dt_ident_t _dtrace_globals[] = {
> >>  	DT_VERS_1_2, &dt_idops_func, "_usymaddr(uintptr_t)" },
> >>  { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
> >>  	&dt_idops_regs, NULL },
> >> +{ "uresolve", DT_IDENT_FUNC, 0, DIF_SUBR_URESOLVE, DT_ATTR_STABCMN,
> >> +	DT_VERS_2_0, &dt_idops_func, "uintptr_t(string, [uintptr_t])" },
> >>  { "ustack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
> >>  	DT_VERS_1_0, &dt_idops_func, "dt_stack_t([uint32_t], [uint32_t])" },
> >>  { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
> >> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
> >> index 54053cd3..bff47055 100644
> >> --- a/libdtrace/dt_probe.h
> >> +++ b/libdtrace/dt_probe.h
> >> @@ -102,6 +102,7 @@ typedef int dt_dependent_f(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg);
> >>  extern int dt_probe_dependent_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >>  				   dt_dependent_f *func, void *arg);
> >>  
> >> +extern const char *dt_probe_uprobe_path(const dt_probe_t *prp);
> >>  
> >>  extern void dt_probe_init(dtrace_hdl_t *dtp);
> >>  extern void dt_probe_detach_all(dtrace_hdl_t *dtp);
> >> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> >> index d53b1e43..9a481f59 100644
> >> --- a/libdtrace/dt_prov_uprobe.c
> >> +++ b/libdtrace/dt_prov_uprobe.c
> >> @@ -307,6 +307,47 @@ typedef struct uprobe_data {
> >>  	int	ref_shift;
> >>  } uprobe_data_t;
> >>  
> >> +dt_provimpl_t	dt_pid;
> >> +dt_provimpl_t	dt_usdt;
> >> +dt_provimpl_t	dt_stapsdt;
> >> +
> >> +const char *
> >> +dt_probe_uprobe_path(const dt_probe_t *prp)
> >> +{
> >> +	const dt_uprobe_t	*upp;
> >> +	const list_probe_t	*pup;
> >> +	const char		*path = NULL;
> >> +
> >> +	if (prp == NULL || prp->prov == NULL)
> >> +		return NULL;
> >> +
> >> +	if (prp->prov->impl == &dt_uprobe) {
> >> +		upp = prp->prv_data;
> >> +		return upp != NULL ? upp->fn : NULL;
> >> +	}
> >> +
> >> +	if (prp->prov->impl != &dt_pid &&
> >> +	    prp->prov->impl != &dt_usdt &&
> >> +	    prp->prov->impl != &dt_stapsdt)
> >> +		return NULL;
> >> +
> >> +	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> >> +		if (pup->probe == NULL || pup->probe->prv_data == NULL)
> >> +			return NULL;
> >> +
> >> +		upp = pup->probe->prv_data;
> >> +		if (upp->fn == NULL)
> >> +			return NULL;
> >> +
> >> +		if (path == NULL)
> >> +			path = upp->fn;
> >> +		else if (strcmp(path, upp->fn) != 0)
> >> +			return NULL;
> >> +	}
> >> +
> >> +	return path;
> >> +}
> >> +
> >>  static const dtrace_pattr_t	pattr = {
> >>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
> >>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> >> @@ -315,10 +356,6 @@ static const dtrace_pattr_t	pattr = {
> >>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> >>  };
> >>  
> >> -dt_provimpl_t	dt_pid;
> >> -dt_provimpl_t	dt_usdt;
> >> -dt_provimpl_t	dt_stapsdt;
> >> -
> >>  #define UPROBE_CONFIG	"/sys/bus/event_source/devices/uprobe/"
> >>  #define PERF_TYPE_FILE	(UPROBE_CONFIG "type")
> >>  #define RET_FLAG_FILE	(UPROBE_CONFIG "format/retprobe")
> >> @@ -1392,6 +1429,19 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >>  	 */
> >>  	dt_cg_tramp_copy_regs(pcb);
> >>  
> >> +	/*
> >> +	 * On some architectures the saved user IP in the uprobe pt_regs is the
> >> +	 * resume address rather than the probed instruction address.  Normalize
> >> +	 * the saved IP to the actual uprobe address when the kernel can provide
> >> +	 * it so consumers such as uresolve() can derive the correct object base.
> >> +	 */
> >> +	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
> >> +		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
> >> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
> >> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7,
> >> +				    DMST_REGS + PT_REGS_IP, BPF_REG_0));
> >> +	}
> >> +
> >>  	/*
> >>  	 * Record the uprobe instrumentation offset in the probe context.
> >>  	 * This is the same object-relative offset passed to perf_event_open()
> >> -- 
> >> 2.43.5
> >>
> >>
> >> _______________________________________________
> >> DTrace-devel mailing list
> >> DTrace-devel@oss.oracle.com
> >> https://oss.oracle.com/mailman/listinfo/dtrace-devel
