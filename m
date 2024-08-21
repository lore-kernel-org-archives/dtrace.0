Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1905416EBF2
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 21:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724276930; cv=fail; b=qm4/vDTtRPGN09aUz7TrlLn1aY9HcjWpc/TmXcC+J38Lmv0uqWSMnQSb2+wJcs/uRl0Vi2yP2ABrcUWGhaxfMg93tJIdLkASHOqd17T3r7AY8F8YVZf6tZm+UrYi5wqssaWxCIYdgVAFYZMsL+2yGO6r9iZHb68PuaxxdTCgCeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724276930; c=relaxed/simple;
	bh=wscdGY7l/zCokS5svpLGvngf/1/HTxm+3sJx5jG3SaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lFblM4hJpsabyGCrKC1k9+xQjhflOW6dRqVWJEf7aW5BKYWTw4mqHf2O8CdlD2u36dfuFf/hJVLPT8EybKFFY058Uy/LU90EcUx+7RKw1kCGlp/dAlPEDO/BiLy8OK4E5gi04Y7SUhCoLIuTaViSfhvIE2EBKmB78pUMI4etDuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W/8ZUYJB; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XQpJSvYZ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W/8ZUYJB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XQpJSvYZ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LKtWT2017012
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 21:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=tCfcu+ueehRwko9v3oPRW9N3VDabzy7V/kDi5XRMYUA=; b=
	W/8ZUYJBP27po0YxN3ZAQPKyBveNRNQqc0PpOt32fe3ZecPXKXTMMlX7s0qKUbJr
	05eXd8rQe+QT7iIc/BJCbfKU7OMTG2asfNSLhSX0/pDYFB/5Xic/rZLNFJZ20+jI
	isZnHxGQFnznY8kAqA1iFoB2IWTCvw3WUV3NqvWJeNQsAKdOHQMR5nnGN0Lf/xoI
	m7KgA8aODrc9sQOde8WhrRM4VlJOxWWlNjMcJuZ3/hkMWzbyhuWUmPw289sQi2H/
	791W25cBMtASLUt6M1RZhaWAOH4s57+mY66LPSaWTxmwaZs1+Eti/rpWKZR/HjV0
	ZAYDjt2Ry9Cbbrl797lesQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412mdt0nwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 21:48:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47LLE2wV013759
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 21:48:46 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 415qyj13re-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 21:48:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJBOeHMC+ca8km7eO1FQsKTnZGZ4E7MQwJV5yV+4h2ywosWiVSJHT1WYngXqj8nPneQ+4WAf/jKn2REeIv1eqeW6Al6t7EWRAzwSUlC1pMJw7tOl+QPtxvdlVahsdjM9/vXcEX/mPTJhSRhGXlnCD5uLw9sQ/Y6KmyfyesNpujwk5wX0S2HEo/1p2ph1C/opayOfun75sXdzHva+ouhJ95Go/sd9KILgRILetUzvEe0h6N2qG0bkinHoYZ3tm4y8vFHl8qGfp9lidJrb5JxZiUeXeDPk0/MndEZXKkC1mhNhbSgbOChqBDOfozQEPClJAZRizRYhKizXmW8HIbuLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njv624SI/jK5i3IMq7RME8knuuEJGxyp3ExhiFQztMA=;
 b=x4XTkUCSCneHuVvvmcuS7YPOgT4Bvyojoz17v5IIcNpZjB/qSsaiBDbBlZ52L7q6VqCH8xiWXTPPRoYQPRajOxnmVo7d5L7UoydpZTyT5EaomOaasjfr62dnN3tCilBQCcgbLjrAid/1LAyeDqWwF3wLzfFtwG9Oja+dRiwOcGcdUXD4je87eUNQCAFlxm7Cw/XMW1rMDG4JbVdYH9VUTjf1azh18DypBgHGTWtqQou7sDfQMHT7pB9gK+DW0akoTxocw20AS3ojg26/LqrEiQmqdwWuiIZoKHv0gAee5GcbVvXOW8Uvb8r80gk6lfhksyP6RivCmTXLnVbrCBQCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njv624SI/jK5i3IMq7RME8knuuEJGxyp3ExhiFQztMA=;
 b=XQpJSvYZfWYEEOvq5Vq371+JqMi9v6JH9/qEKQgD7dPNelGXc3dESorycIGK5+iEqVDvsFn3qEYIc+8RiLoyWqQYiwoDbYl/GM13EBnuNe8/uaIDKmgjxgxE7wad5VIDOPN313ePFk6QELPZGuLiChXjAfaFYs91UTnpfk1cxHI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA3PR10MB8139.namprd10.prod.outlook.com (2603:10b6:208:514::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 21:48:42 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Wed, 21 Aug 2024
 21:48:42 +0000
Date: Wed, 21 Aug 2024 17:48:39 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] ioctl: remove obsolete ioctl definitions and ddead code
 that used them
Message-ID: <ZsZgt/IDv078Skrc@oracle.com>
References: <SN7PR10MB6287296B328D2B3163F27C48C28E2@SN7PR10MB6287.namprd10.prod.outlook.com>
 <3bc0ea4f-0f56-a19d-8805-ddeceb70c59d@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bc0ea4f-0f56-a19d-8805-ddeceb70c59d@oracle.com>
X-ClientProxiedBy: MN2PR08CA0024.namprd08.prod.outlook.com
 (2603:10b6:208:239::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA3PR10MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad2637e-fde2-441f-4f32-08dcc22b064d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?vjP0vcARMg0ckRZB0YY0RYtKkKVOglkY3Pe7rt0QV+14DHAdGQCdxaqGtN?=
 =?iso-8859-1?Q?Tq565Pcj1XZ2rm3myRxMkCrZlKlUe6Lo/4ZaxZVOVmBXI480fLm0OH0OSy?=
 =?iso-8859-1?Q?m2Qvd1z8ra5VWA4La6KrXoL5+gAhABln8usLbmrRlPkm95P5OxjkmL9vEd?=
 =?iso-8859-1?Q?KZsg5E0z0o45esmfvmxBP1DGOdRe+Ka8tjIQtToAcszISkD4UbJRG/xust?=
 =?iso-8859-1?Q?C2JI7mkcaWkqLGDBh4SoXWqnM9n3GZKQsRW28dW5OcENtgecdUVABZMz63?=
 =?iso-8859-1?Q?ZxIVgfc5t5ARh78k4/apzdwpU+8CzmyVXBvnR0R74/HAxmpU++TDE3/co7?=
 =?iso-8859-1?Q?2lj7P0MBZ9w9Lr/LgsdkisWf7424Oc2j1hUwIQg+bOhIIaR7w5LDwC2DM0?=
 =?iso-8859-1?Q?sDkTULo0qjA5e0jJgJ+2Mqn/lKYBnL5Le1OsqmRwkJZsOYuriB9tHGnulA?=
 =?iso-8859-1?Q?yMIaV1IQRh2sNRVoEjIrQV3EDttW68clkLSF+aalbii6b/KKfZ7uUpNUu0?=
 =?iso-8859-1?Q?ur3o+e4hi6qXgBVKadgFzFYyEVdHb2dIAnhL7uoqZbKj5YNM4VmUETk18/?=
 =?iso-8859-1?Q?t3QOL5piZAIDmxqDmezOVu2ZAE037Y0Q/UzDfKiy9vlLMzzkzy6NYZpwhW?=
 =?iso-8859-1?Q?2XkLp0bH9aeulVU1vJa0MvdO6r0V0PfM/RriRZu5FBA5GRbEntyqDkqS9d?=
 =?iso-8859-1?Q?lgw43CIU/kP0J2V0Eo7ACTybfBAHX62xcaqS10sqAdk347Ht8MYpj8PjTw?=
 =?iso-8859-1?Q?08uhcyVQvXrCXXb0s2D+7m0KobCWA7CGeJp2weoCcJc4vINkOBskrad9G3?=
 =?iso-8859-1?Q?XHsezOji22ZiC++iKFr49PQWHnakJjdFJLZGZP39AWl66oazNyOY1QSWNA?=
 =?iso-8859-1?Q?2cCpACvlL2AVMvsvM38yqSl/KR56/4SAOp3MZUeATvNIqc3fmwN8Nhed8B?=
 =?iso-8859-1?Q?45LXngR2hZmaBQRu2u7NPr8ZEanv64Y0MsFMETgHJc5HI4zR9XnEkSXDGG?=
 =?iso-8859-1?Q?Aqo+ZhuCAag2a4colm21M+SVUzPkkUeKHUAo330SN7AVZEEWnMjbGs7Lhy?=
 =?iso-8859-1?Q?xMuJW71edkSdf1daLzhNbCVAMsq5Nh/pKEbtJupilrntI5rcEnAEr1jwv5?=
 =?iso-8859-1?Q?xFyg+qeuoE192VBzvPDYtpgaFMxFwH0jNB0xF4/PbrwfNbwsYqp/keSbuo?=
 =?iso-8859-1?Q?+LoYcp1FfnZfg6VZbomFBiWTSImJ8rCE4oLu/Uq/4og4JZFK0iL3gFDIPR?=
 =?iso-8859-1?Q?YAPo7npS6KusbqdfzMJV+/g0qjtXf19lxG914JgEHN0udVtJYHJnqRacWl?=
 =?iso-8859-1?Q?fWc30Qv8KAjkRbMclSnTDJNPRSFXgFYzqwsEb1glxeIZmX8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?gIyPuGRhEZbq/AdRNqTAqfmu1OdtUmismRz2vfjkxH9WBgSEtQk8FkEMEt?=
 =?iso-8859-1?Q?seuMjne4OJ4DFWW4nA8w/LnLjjqXp0KWv5/B+m2cFHS6V6fp98Ihxk5ji/?=
 =?iso-8859-1?Q?V9FT5E33Y8RupAO+AbBc881FzL2aMfeq+hi57mXgrGEhp14XF2bcn4t0PF?=
 =?iso-8859-1?Q?1xBMOuNYQAywfaRxR5YKXcOB8S5MVb1TnjrSUSmk3+CDenEiZpypmbOZzq?=
 =?iso-8859-1?Q?8Y74O2hMt30pca4PTd8soJtio7FySV1HnPO55eoR4ucG1CSLG1r/R8GPVv?=
 =?iso-8859-1?Q?5FgXFf8AAvE5m6EPjswAu+J4RFfbnSDDZq8WoDLN7rJashH2djSrLDj9/k?=
 =?iso-8859-1?Q?ozw817VU0l9qrbykizorOp9NpNr8kPhPcNXPmq/RpVnFdm+7WEER31rflY?=
 =?iso-8859-1?Q?7TXynZulJyTaLcAZB7xJotDrpIGd4TbClHXaa3BmXmJNFmMXpy4f6NKwBw?=
 =?iso-8859-1?Q?/YxkZACwk76hqhmf/bGUB8m88Pq6HzD6qorV9MLeo34wfPh+/rWLxh8UXa?=
 =?iso-8859-1?Q?ZK5Ill3Dl3B+9dNQKi+YXaUOrwvhCtWLQ9ds7cykRiQmc5P8uZTy/SsJUI?=
 =?iso-8859-1?Q?AboZv5TRE5B6hcSIWAHm2X8/pZj+rjGoCZLKTUf4M1l6UYNTHsnnjoPPZh?=
 =?iso-8859-1?Q?AeeVleWf1+wgNIn8kIegl+B5wHy2n6X5lBKUWvYwrF27lOa4D0HeeceM2/?=
 =?iso-8859-1?Q?89KujyAnnace8dAkCFP3n+qfXX2xBwD90eG33l2sX3z7FJUeHQEHPzysyu?=
 =?iso-8859-1?Q?LKV6JeZRQAuR/A8UpAk4eSZ5sQthS7VMR9VfJtF8EBvF709IYVGsHKUwh8?=
 =?iso-8859-1?Q?0JXtTxeXogX/X8lKevDkgs6Cd15OyrGYvMu5D4M4rhgPV3Ax0liZ6paNQh?=
 =?iso-8859-1?Q?8M3Ylt46nkm3VR9BNMPjR77+qgybyoiYK2KUUFP9A/BS2mWqbDkcOnaniP?=
 =?iso-8859-1?Q?jtdRC1gnT14R0Iy+DR628qLNhqDbzj7g6OR70QUYlZMRjCQ5Yo2QIv5kfQ?=
 =?iso-8859-1?Q?tQ3IbUdZOjKX8ckqVkFUzGRoI+J6PH6ZAr2Zl50jBXidTjn89OSJu1p3da?=
 =?iso-8859-1?Q?ldy8HU23Vl9vocyFj8rxNKSHWhKZJpTFCua35VadCpWX+Piv9PJ5OM37/j?=
 =?iso-8859-1?Q?jeea1hsgU/J6eZ+/eTGs1z7dQVa23cwz8DO1gaIcNvFl93R1fanbMQCryE?=
 =?iso-8859-1?Q?1t6RdatH/01Bvye1nLlZzj7Jj2a1GdnZXLYdQRonM3FLXo+MB62+j3ry9X?=
 =?iso-8859-1?Q?ShkoZKJg9HP+bYa3B16/WwIGP0cmCtF1W8HmEE3iBhpI6XSj97W/T0IAQB?=
 =?iso-8859-1?Q?08VodXAqOn1qQoqYrjrxvH7rT8FkVNnVy7LSTBtbvL4bv3+mfLd/IsiO+Q?=
 =?iso-8859-1?Q?VTYEaufQtn8rpQ17MWbETI+70Uty9xGJdZxk54vx4YJqdJiNGp6nC3Ydh/?=
 =?iso-8859-1?Q?wSh0Ijha00h+jD7aMuIuVmimDiMz+CZadglGcQlRaIDIlQVKx8OQzxH8Bh?=
 =?iso-8859-1?Q?kflrM82ublb6cSN87Q7ULXjTMbSd6r70TdEpxLNO6ILbxyIeVl5ymW5FSO?=
 =?iso-8859-1?Q?PZxJg+OJGyIwXp7RnbXTsSLeeoPu7YB3iJnP8AR5ZUzF3uKPCnM9yqVCUQ?=
 =?iso-8859-1?Q?lyHLnvzSSqs0f/ClwXKDL819f/q3ojJBeDvFkUtyHzEGMzDUR8mdGyOA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uRlga37NbPc0/+dHN1Rd/BK8GROvjCweU+9EB3J4nS9vTedIqe5Uokt6fHJssl2eYoo+FDIcfa7/z4YXDEJBmcY0zVviErLtAAtD9NuP2WL1eDuv3AbxZ6RP/b0/yOKWVTVfmFWQsL0s1yJkj+S/v7Q1RXxAre4/GO4H6vLcGt9lgRFel4uMpXWeBzMx9BEM1Zv6K2eMHDORPNzL4LPM1jcH+PwA2YiJpaW/JVMDHOUNvMQJ2jpgZASbVFplihiAHfJNEs39tG/EhaTlwI9oxhEjHtxxkQ/o3z9vTYiAc8YqofH5cuTJo7afwqvsS4rKoy2XS16PewbedyvHd7Kurol9/Sa8U4Rb7vSolKYlfME8XaK3UONxWqjDJJESw7ux49Mn6+dy2ORtZwCANTuNcmPErwrXnHcgBhhfPqZoxICtSnZjg8sgZmAU7MOHgzbGLSBReumsuoxXvLfsf/LR1OqMbnsUtva8oD2b9Ngy+v7J6k4Vzmt8Hg9BbI3sUHUPA/8++HhRfDRgKiphXhFimcL3rD8gcV0yC2vQftWsDvwugXaFrVyqgbVjx5xXojsM1GjCvb+4Ud4cbQJpfccmbvt8vjSV6SkckyI6dEn3uh8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad2637e-fde2-441f-4f32-08dcc22b064d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 21:48:42.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZEmN39w/omxxB5ZIadH4ORAnlpcI87mhn9OXCgT9CIsKBTRaKeSW1RoX6ncvRgFN+RBTVwl6/APJA1N8EK950CYadV/MMbKKi1dUsx6eyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8139
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_15,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408210160
X-Proofpoint-ORIG-GUID: 7nhnPtScIvoxfZ41P4EwJlWwZUncMzWC
X-Proofpoint-GUID: 7nhnPtScIvoxfZ41P4EwJlWwZUncMzWC

On Wed, Aug 21, 2024 at 04:58:44PM -0400, Eugene Loh wrote:
> s/ddead/dead/ in subject line
> 
> The patch seems to leave these orphaned references:
> 
>     include/dtrace/dif.h: * use DTRACEIOC_CONF to dynamically obtain the
> number of registers provided by

Will fix.

>     include/dtrace/dif_defines.h: * use DTRACEIOC_CONF to dynamically obtain
> the number of registers provided by

Will fix.

>     libdtrace/dt_options.c: if (dt_ioctl(dtp, DTRACEIOC_DOFGET, &hdr) == -1)
>     libdtrace/dt_options.c: if (dt_ioctl(dtp, DTRACEIOC_DOFGET, dof) == -1)

Ah yes, that function can be removed also.

> 
> If you're getting rid of test/utils/baddof.c, then this should also go:
> 
>     test/utils/.gitignore:baddof
> 
> Also, then, what happens to "./runtest.sh --baddof"?  Shouldn't runtest.sh
> also be cleaned up?  (Look for "baddof" and "BADDOF".)

Ah, true.  Fixing...  (I wonder where the test was that used it.)

> What happens to test/utils/badioctl.c?  Disappear?  If so, then also need to
> clean up test/utils/Build and test/utils/.gitignore. And maybe also
> ./runtest., although "./runtest.sh --baddof" cleanup might already take care
> of that.

I believe that one is still in use (meant to test the DOF helper support so
it would be testing dtprobed).

> On 8/21/24 13:27, Kris Van Hees wrote:
> 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   include/dtrace/ioctl.h |  23 -----
> >   libdtrace/dt_probe.c   | 132 ----------------------------
> >   test/utils/Build       |   2 +-
> >   test/utils/baddof.c    | 191 -----------------------------------------
> >   4 files changed, 1 insertion(+), 347 deletions(-)
> >   delete mode 100644 test/utils/baddof.c
> > 
> > diff --git a/include/dtrace/ioctl.h b/include/dtrace/ioctl.h
> > index a2a3a93b..2273453a 100644
> > --- a/include/dtrace/ioctl.h
> > +++ b/include/dtrace/ioctl.h
> > @@ -9,30 +9,7 @@
> >   #define _DTRACE_IOCTL_H_
> >   #include <linux/ioctl.h>
> > -#include <dtrace/arg.h>
> > -#include <dtrace/conf.h>
> > -#include <dtrace/dof.h>
> > -#include <dtrace/enabling.h>
> >   #include <dtrace/helpers.h>
> > -#include <dtrace/metadesc.h>
> > -#include <dtrace/stability.h>
> > -#include <dtrace/status.h>
> > -
> > -#define DTRACEIOC		0xd4
> > -#define DTRACEIOC_PROVIDER	_IOR(DTRACEIOC, 1, dtrace_providerdesc_t)
> > -#define DTRACEIOC_PROBES	_IOR(DTRACEIOC, 2, dtrace_probedesc_t)
> > -#define DTRACEIOC_PROBEMATCH	_IOR(DTRACEIOC, 5, dtrace_probedesc_t)
> > -#define DTRACEIOC_ENABLE	_IOW(DTRACEIOC, 6, void *)
> > -#define DTRACEIOC_EPROBE	_IOW(DTRACEIOC, 8, dtrace_eprobedesc_t)
> > -#define DTRACEIOC_PROBEARG	_IOR(DTRACEIOC, 9, dtrace_argdesc_t)
> > -#define DTRACEIOC_CONF		_IOR(DTRACEIOC, 10, dtrace_conf_t)
> > -#define DTRACEIOC_STATUS	_IOR(DTRACEIOC, 11, dtrace_status_t)
> > -#define DTRACEIOC_GO		_IOW(DTRACEIOC, 12, processorid_t)
> > -#define DTRACEIOC_STOP		_IOW(DTRACEIOC, 13, processorid_t)
> > -#define DTRACEIOC_AGGDESC	_IOR(DTRACEIOC, 15, dtrace_aggdesc_t)
> > -#define DTRACEIOC_FORMAT	_IOR(DTRACEIOC, 16, dtrace_fmtdesc_t)
> > -#define DTRACEIOC_DOFGET	_IOR(DTRACEIOC, 17, dof_hdr_t)
> > -#define DTRACEIOC_REPLICATE	_IOR(DTRACEIOC, 18, void *)
> >   #define DTRACEHIOC		0xd8
> >   #define DTRACEHIOC_ADD		_IOW(DTRACEHIOC, 1, dof_hdr_t)
> > diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> > index e1099d75..a40b90a8 100644
> > --- a/libdtrace/dt_probe.c
> > +++ b/libdtrace/dt_probe.c
> > @@ -186,131 +186,6 @@ dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
> >   	return s;
> >   }
> > -/*
> > - * If a probe was discovered from the kernel, ask dtrace(7D) for a description
> > - * of each of its arguments, including native and translated types.
> > - */
> > -static dt_probe_t *
> > -dt_probe_discover(dt_provider_t *pvp, const dtrace_probedesc_t *pdp)
> > -{
> > -#ifdef FIXME
> > -	dtrace_hdl_t *dtp = pvp->pv_hdl;
> > -	char *name = dt_probe_key(pdp, alloca(dt_probe_keylen(pdp)));
> > -
> > -	dt_node_t *xargs, *nargs;
> > -	dt_ident_t *idp;
> > -	dt_probe_t *prp;
> > -
> > -	dtrace_typeinfo_t dtt;
> > -	int i, nc, xc;
> > -
> > -	int adc = _dtrace_argmax;
> > -	dt_argdesc_t *adv = alloca(sizeof(dt_argdesc_t) * adc);
> > -	dt_argdesc_t *adp = adv;
> > -
> > -	assert(strcmp(pvp->desc.dtvd_name, pdp->prv) == 0);
> > -	assert(pdp->id != DTRACE_IDNONE);
> > -
> > -	dt_dprintf("discovering probe %s:%s id=%d\n",
> > -		   pvp->desc.dtvd_name, name, pdp->id);
> > -
> > -	for (nc = -1, i = 0; i < adc; i++, adp++) {
> > -		memset(adp, 0, sizeof(dt_argdesc_t));
> > -		adp->ndx = i;
> > -		adp->id = pdp->id;
> > -
> > -		if (dt_ioctl(dtp, DTRACEIOC_PROBEARG, adp) != 0) {
> > -			dt_set_errno(dtp, errno);
> > -			return NULL;
> > -		}
> > -
> > -		if (adp->ndx == DTRACE_ARGNONE)
> > -			break; /* all argument descs have been retrieved */
> > -
> > -		nc = MAX(nc, adp->mapping);
> > -	}
> > -
> > -	xc = i;
> > -	nc++;
> > -
> > -	/*
> > -	 * Now that we have discovered the number of native and translated
> > -	 * arguments from the argument descriptions, allocate a new probe ident
> > -	 * and corresponding dt_probe_t and hash it into the provider.
> > -	 */
> > -	xargs = dt_probe_alloc_args(pvp, xc);
> > -	nargs = dt_probe_alloc_args(pvp, nc);
> > -
> > -	if ((xc != 0 && xargs == NULL) || (nc != 0 && nargs == NULL))
> > -		return NULL; /* dt_errno is set for us */
> > -
> > -	idp = dt_ident_create(name, DT_IDENT_PROBE, DT_IDFLG_ORPHAN, pdp->id,
> > -			      _dtrace_defattr, 0, &dt_idops_probe, NULL,
> > -			      dtp->dt_gen);
> > -
> > -	if (idp == NULL) {
> > -		dt_set_errno(dtp, EDT_NOMEM);
> > -		return NULL;
> > -	}
> > -
> > -	prp = dt_probe_create(dtp, idp, 2, nargs, nc, xargs, xc);
> > -	if (prp == NULL) {
> > -		dt_ident_destroy(idp);
> > -		return NULL;
> > -	}
> > -
> > -	dt_probe_declare(pvp, prp);
> > -
> > -	/*
> > -	 * Once our new dt_probe_t is fully constructed, iterate over the
> > -	 * cached argument descriptions and assign types to prp->nargv[]
> > -	 * and prp->xargv[] and assign mappings to prp->mapping[].
> > -	 */
> > -	for (adp = adv, i = 0; i < xc; i++, adp++) {
> > -		if (dtrace_type_strcompile(dtp,
> > -		    adp->native, &dtt) != 0) {
> > -			dt_dprintf("failed to resolve input type %s "
> > -			    "for %s:%s arg #%d: %s\n", adp->native,
> > -			    pvp->desc.dtvd_name, name, i + 1,
> > -			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> > -
> > -			dtt.dtt_object = NULL;
> > -			dtt.dtt_ctfp = NULL;
> > -			dtt.dtt_type = CTF_ERR;
> > -		} else {
> > -			dt_node_type_assign(prp->nargv[adp->mapping],
> > -			    dtt.dtt_ctfp, dtt.dtt_type);
> > -		}
> > -
> > -		if (dtt.dtt_type != CTF_ERR && (adp->xlate[0] == '\0' ||
> > -		    strcmp(adp->native, adp->xlate) == 0)) {
> > -			dt_node_type_propagate(prp->nargv[
> > -			    adp->mapping], prp->xargv[i]);
> > -		} else if (dtrace_type_strcompile(dtp,
> > -		    adp->xlate, &dtt) != 0) {
> > -			dt_dprintf("failed to resolve output type %s "
> > -			    "for %s:%s arg #%d: %s\n", adp->xlate,
> > -			    pvp->desc.dtvd_name, name, i + 1,
> > -			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> > -
> > -			dtt.dtt_object = NULL;
> > -			dtt.dtt_ctfp = NULL;
> > -			dtt.dtt_type = CTF_ERR;
> > -		} else {
> > -			dt_node_type_assign(prp->xargv[i],
> > -			    dtt.dtt_ctfp, dtt.dtt_type);
> > -		}
> > -
> > -		prp->mapping[i] = adp->mapping;
> > -		prp->argv[i] = dtt;
> > -	}
> > -
> > -	return prp;
> > -#else
> > -	return NULL;
> > -#endif
> > -}
> > -
> >   /*
> >    * Lookup a probe declaration based on a known provider and full or partially
> >    * specified module, function, and name.  If the probe is not known to us yet,
> > @@ -339,13 +214,6 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
> >   	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL)
> >   		return idp->di_data;
> > -	/*
> > -	 * If the probe isn't known, use the probe description computed above
> > -	 * to ask dtrace(7D) to find the first matching probe.
> > -	 */
> > -	if (dt_ioctl(dtp, DTRACEIOC_PROBEMATCH, &pd) == 0)
> > -		return dt_probe_discover(pvp, &pd);
> > -
> >   	if (errno == ESRCH || errno == EBADF)
> >   		dt_set_errno(dtp, EDT_NOPROBE);
> >   	else
> > diff --git a/test/utils/Build b/test/utils/Build
> > index 1398822b..494806fe 100644
> > --- a/test/utils/Build
> > +++ b/test/utils/Build
> > @@ -3,7 +3,7 @@
> >   # Licensed under the Universal Permissive License v 1.0 as shown at
> >   # http://oss.oracle.com/licenses/upl.
> > -TEST_UTILS = baddof badioctl workload_kernel workload_user showUSDT print-stack-layout
> > +TEST_UTILS = badioctl workload_kernel workload_user showUSDT print-stack-layout
> >   TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh
> >   define test-util-template
> > diff --git a/test/utils/baddof.c b/test/utils/baddof.c
> > deleted file mode 100644
> > index 5f844625..00000000
> > --- a/test/utils/baddof.c
> > +++ /dev/null
> > @@ -1,191 +0,0 @@
> > -/*
> > - * Oracle Linux DTrace.
> > - * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
> > - * Licensed under the Universal Permissive License v 1.0 as shown at
> > - * http://oss.oracle.com/licenses/upl.
> > - */
> > -
> > -#include <sys/types.h>
> > -#include <sys/stat.h>
> > -#include <sys/ioctl.h>
> > -#include <stdio.h>
> > -#include <stdlib.h>
> > -#include <stdarg.h>
> > -#include <fcntl.h>
> > -#include <errno.h>
> > -#include <math.h>
> > -#include <string.h>
> > -#include <dtrace.h>
> > -
> > -void
> > -fatal(char *fmt, ...)
> > -{
> > -	va_list ap;
> > -
> > -	va_start(ap, fmt);
> > -
> > -	fprintf(stderr, "%s: ", "baddof");
> > -	vfprintf(stderr, fmt, ap);
> > -
> > -	if (fmt[strlen(fmt) - 1] != '\n')
> > -		fprintf(stderr, ": %s\n", strerror(errno));
> > -
> > -	exit(1);
> > -}
> > -
> > -#define	LEAP_DISTANCE		20
> > -
> > -void
> > -corrupt(int fd, unsigned char *buf, int len)
> > -{
> > -	static int ttl, valid;
> > -	int bit, i;
> > -	unsigned char saved;
> > -	int val[LEAP_DISTANCE], pos[LEAP_DISTANCE];
> > -	int new, rv;
> > -
> > -again:
> > -	printf("valid DOF #%d\n", valid++);
> > -
> > -	/*
> > -	 * We are going iterate through, flipping one bit and attempting
> > -	 * to enable.
> > -	 */
> > -	for (bit = 0; bit < len * 8; bit++) {
> > -		saved = buf[bit / 8];
> > -		buf[bit / 8] ^= (1 << (bit % 8));
> > -
> > -		if ((bit % 100) == 0)
> > -			printf("%d\n", bit);
> > -
> > -		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) == -1) {
> > -			/*
> > -			 * That failed -- restore the bit and drive on.
> > -			 */
> > -			buf[bit / 8] = saved;
> > -			continue;
> > -		}
> > -
> > -		/*
> > -		 * That worked -- and it may have enabled probes.  To keep
> > -		 * enabled probes down to a reasonable level, we'll close
> > -		 * and reopen pseudodevice if we have more than 10,000
> > -		 * probes enabled.
> > -		 */
> > -		ttl += rv;
> > -
> > -		if (ttl < 10000) {
> > -			buf[bit / 8] = saved;
> > -			continue;
> > -		}
> > -
> > -		printf("enabled %d probes; resetting device.\n", ttl);
> > -		close(fd);
> > -
> > -		new = open("/dev/dtrace/dtrace", O_RDWR);
> > -
> > -		if (new == -1)
> > -			fatal("couldn't open DTrace pseudo device");
> > -
> > -		if (new != fd) {
> > -			dup2(new, fd);
> > -			close(new);
> > -		}
> > -
> > -		ttl = 0;
> > -		buf[bit / 8] = saved;
> > -	}
> > -
> > -	for (;;) {
> > -		/*
> > -		 * Now we want to get as many bits away as possible.  We flip
> > -		 * bits randomly -- getting as far away as we can until we don't
> > -		 * seem to be making any progress.
> > -		 */
> > -		for (i = 0; i < LEAP_DISTANCE; i++) {
> > -			/*
> > -			 * Pick a random bit and corrupt it.
> > -			 */
> > -			bit = lrand48() % (len * 8);
> > -
> > -			val[i] = buf[bit / 8];
> > -			pos[i] = bit / 8;
> > -			buf[bit / 8] ^= (1 << (bit % 8));
> > -		}
> > -
> > -		/*
> > -		 * Let's see if that managed to get us valid DOF...
> > -		 */
> > -		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) > 0) {
> > -			/*
> > -			 * Success!  This will be our new base for valid DOF.
> > -			 */
> > -			ttl += rv;
> > -			goto again;
> > -		}
> > -
> > -		/*
> > -		 * No luck -- we'll restore those bits and try flipping a
> > -		 * different set.  Note that this must be done in reverse
> > -		 * order...
> > -		 */
> > -		for (i = LEAP_DISTANCE - 1; i >= 0; i--)
> > -			buf[pos[i]] = val[i];
> > -	}
> > -}
> > -
> > -int
> > -main(int argc, char **argv)
> > -{
> > -	char *filename = argv[1];
> > -	dtrace_hdl_t *dtp;
> > -	dtrace_prog_t *pgp;
> > -	int err, fd, len;
> > -	FILE *fp;
> > -	unsigned char *dof, *copy;
> > -
> > -	if (argc < 1)
> > -		fatal("expected D script as argument\n");
> > -
> > -	if ((fp = fopen(filename, "r")) == NULL)
> > -		fatal("couldn't open %s", filename);
> > -
> > -	/*
> > -	 * First, we need to compile our provided D into DOF.
> > -	 */
> > -	if ((dtp = dtrace_open(DTRACE_VERSION, 0, &err)) == NULL) {
> > -		fatal("cannot open dtrace library: %s\n",
> > -		    dtrace_errmsg(NULL, err));
> > -	}
> > -
> > -	pgp = dtrace_program_fcompile(dtp, fp, 0, 0, NULL);
> > -	fclose(fp);
> > -
> > -	if (pgp == NULL) {
> > -		fatal("failed to compile script %s: %s\n", filename,
> > -		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> > -	}
> > -
> > -	dof = dtrace_dof_create(dtp, pgp, 0);
> > -	len = ((dof_hdr_t *)dof)->dofh_loadsz;
> > -
> > -	if ((copy = malloc(len)) == NULL)
> > -		fatal("could not allocate copy of %d bytes", len);
> > -
> > -	for (;;) {
> > -		memcpy(copy, dof, len);
> > -		/*
> > -		 * Open another instance of the dtrace device.
> > -		 */
> > -		fd = open("/dev/dtrace/dtrace", O_RDWR);
> > -
> > -		if (fd == -1)
> > -			fatal("couldn't open DTrace pseudo device");
> > -
> > -		corrupt(fd, copy, len);
> > -		close(fd);
> > -	}
> > -
> > -	/* NOTREACHED */
> > -	return 0;
> > -}
