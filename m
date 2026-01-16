Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45D036B05D
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 16:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580546; cv=fail; b=X/KBkENW/TNgWCIsdlE/lpdRN/ziy2eElo7ZVtKpO+JgbdDOnUnrV1T7H+rxG3lDvauP9w986hWfrj5/vy2MXXxIiPOTVkbyU4s7Ul3XgHCKF89a1/f+Vcr8lgdGbRWmDQB0PJl9L2GEXiJaIZ10dUnYAflhKP6i4uEYUvN+ihQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580546; c=relaxed/simple;
	bh=WtfpUgixum0MllhcJg/E84djUnMuqlNxOLA32/7gf6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DvcB6JDKx3d/n7dqiPF+lW3LW32gtVeWYg0J5GjZsmHLRs5TnojWo69flWXCH4JlhN0ApWQhmGH1IqTSpopeslZvOprIvJ/iuEcUnwtDVYPjEfmtTxGg2s+siY0gONVamrQPugJMiILphTWgcUK7p6S2LDZVXp1aQ+7xS7PtTMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Uvyc7+D4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UnxFsml6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Uvyc7+D4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UnxFsml6"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GDike61910595
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 16:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZdsnvFfaEyTrEw7Okj
	3dB2Dv7ojhBvlB8uozAVKQeok=; b=Uvyc7+D4PMF3/wrTl/MnvBa+f2UagkGV09
	sgR1Hee5XxydXDCS1ri2OEdHUpp2fgqhgrfWURJR31gny2ZWIIGfCROSVY6nJ1BL
	5F29QlvafZeYFBOUkOWYSvQ5tnUBCUSj6U6SDVuSHZdw0IkPK6V63z8PFguB19NB
	doOsbCs+r+hz2bWgG2NY+UD76BD2Ofpf9umsZGbzBpSW2wWmZBZ/rQ27hsXFlAx1
	zdyyU3xjM2tG2MskAUylkF9LE4Vz5xlmzay5oRIyF4PmZt39i5xAPuh9iQ94eTXt
	CGapA7MxZyK+PvcZuhhwvpRNtkz9RkBhg4XOjyfmftZ9kmnBHPfg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkh7ntamb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 16:22:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GFQa8k001930
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 16:22:20 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7d2n0w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 16:22:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sK03p/jgh4mr2DyStWzYgDxO+HEOFBOecCI1CkY17vs+WidfdGgaSr/CEKe8jQeoA6BBtxRpKKrPgq64vBUh7kYD2O28ffc6zmU4z5IrRvrnDPhfZg53P5ldSlZgU7aXPCut0sZ4avBR/sH2fGikhZUjSxTkfEdG6Qh+P4rVE84FkLzU+UudH3VbetVKEEQ31qTvew+JOSQhAOvnkZ87QbI4H76ZV/wnlohuAi8gQqIkMKVz/j3OU94pLx57j+nMOacnCRmcKVKHpND6+cD3eOgdcN5Z+dKm3MLpSBqJWxW1f68nTk3JixM51Ydy/WCCY56E+Ui5LCVQA2k3DTFOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdsnvFfaEyTrEw7Okj3dB2Dv7ojhBvlB8uozAVKQeok=;
 b=l2k6PNTupZYLdP1D5NIvvWErt+byQJtakaadLiay5/0wFPS3PpHFOm79PiqYZJ6+H45pZn4Tp3ruoSiUmaJ+9Rqj73nPZYfoKyoXhd41HWPNFbUPXmf4nRusA4Ime1XSViFwe+jUmclWdFcooOWfV9Yk5exwwvCqJ+KJY5+boraz25lhNhKBJhIyLFD+reQTMmyHt9ApGx/JZiXcRDsjyZO5cVro156VU6UREtttXVTcTwQK+ut/bMAo+de7YuyXXfnM/5u6y5N9kwOIfOl5/Yd9AoJxW1Yx2SXKDO4L8UQRhgPdEP2attx4guYaCG4cOlXpGGDIE8fNu/mHYv3akw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdsnvFfaEyTrEw7Okj3dB2Dv7ojhBvlB8uozAVKQeok=;
 b=UnxFsml6qARYFtTdHo+ovVCW7abWFsL8Xm72Ezj+SL/Sje3WJlQDGA+o9vHJ4ydkUPju3tbxfJdI8jvvOsEAA5li9NaV/JGkv3vV4sIIWftRmz7yd038B0lf6YjGdGbiCTUH8l71krvsLczsGE5CkKywkWkXLXBS580NVFHLNdI=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CYYPR10MB7673.namprd10.prod.outlook.com (2603:10b6:930:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 16:22:17 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 16:22:16 +0000
Date: Fri, 16 Jan 2026 11:22:13 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 0/9] stapsdt provider: simple system-wide probing
Message-ID: <aWpltdHVZyT9_gKc@kvh-deb-bpf.us.oracle.com>
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
 <aWpPxsFlQgZ9M49f@kvh-deb-bpf.us.oracle.com>
 <b1973c8b-09bb-4528-9339-28110b48976f@oracle.com>
 <aWpaLckFtfY9uUPK@kvh-deb-bpf.us.oracle.com>
 <a82a70e5-d74a-4148-88dd-05983e59ef5c@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a82a70e5-d74a-4148-88dd-05983e59ef5c@oracle.com>
X-ClientProxiedBy: PH7P221CA0049.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::32) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CYYPR10MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: 990f1433-2214-49b0-11b6-08de551b6a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cbZ7T9qN9MSujTw35Cep6vUhHXrUfAQz8Hi84hLelF/J4m4+jgV8l3PdM6rl?=
 =?us-ascii?Q?S8XD84ur7uM7tZJ0JK+5qUYXR2RSlHycJ/+rDMpzq/Nvyjm/RFKnQ83InSzH?=
 =?us-ascii?Q?+PSOMyTVZCpCGgm+DHSWDSZuoeCu4UyLJRlgqghMUz8m9r59xeE6JQrLJ9dI?=
 =?us-ascii?Q?lk0vIw8Z5KayaV2idByq66Pu+FVpxosLGSnriZcw5GLqtjm0sRlGDO7lODN6?=
 =?us-ascii?Q?JoUYlvSMk8uvLyt9kmADeYJMztbycPBMvMaJAFYLnAit4E+j2G7T1q08vsmU?=
 =?us-ascii?Q?otWCYk1PDFA8/YsYLWS+mDRLRMf9DhLj4JiM85YCZVPl1u86EX7J3LZkxujd?=
 =?us-ascii?Q?648CpcRE+SFifSlQRreF19JIC53BjXBf/3VHlLISvZ73FlhhnIgQFg/4s02E?=
 =?us-ascii?Q?E/PwIDNhDKU1mTT4leKyYn9GCs/NPmt4vXjrBPFwYGJ98DGU+K56PcSOsvqM?=
 =?us-ascii?Q?gwrshMzQI/6JFMqYuuR6Y5qvYxtLA+OBUtweyLBv6A9zYz354Q6xIJzGXS4J?=
 =?us-ascii?Q?0/SgxwZ9fkspcu8Ufbnqd8NlBEiQaDN0fvacKg29OjjilcjoZXHjPUXklMEv?=
 =?us-ascii?Q?+1oaZ6y+19zuwhIuZUhqMQ0VWMQCbQ6Xd7AKNA/fJ8cObX9YNZuFCkAlbz7h?=
 =?us-ascii?Q?Qbm1oXE+dMk8FANHH4k3boAoKSTTipWZcV9kMa03oC3TA/O10nC4MDTE0kwq?=
 =?us-ascii?Q?8uZwsSyBXuiLYoQsSZdHztXpsVtzLEMDZVHWdNQl+Qnpw1hwBarLjDhpYd4y?=
 =?us-ascii?Q?VMPxK1KLAJIGm92zWsOJcCBoivrL54OPLDgpjioKJTO+xeLikonlIpFkRTZw?=
 =?us-ascii?Q?rsMty7aUbgJMOME1lsZl40YQcDEfGchEaSXTjsYxZwdfrJ/Qt1XBoghrldLc?=
 =?us-ascii?Q?BiXaefu+aY1WKP49F0f5UigLyJDUP+FVNvYXeuusVtIgC4r9cks0yHQv7upZ?=
 =?us-ascii?Q?wistFTbAof+Kv2lI3WvAlkX3IXvwljiKv5AxyLpkr9JpLVcuelD/14ua/mGL?=
 =?us-ascii?Q?LDgDCrKwCtTUBgbCS7gjtIF2Qj7AvgTzfP7qX5iMmjTs8vRAAaGUPtVxrUQp?=
 =?us-ascii?Q?b2nVt62g4OtKiQugqNfpKXVsgEQT2q8Js5yQEo4brB9OMGfaUZI7YBSAkzuw?=
 =?us-ascii?Q?eqe5Q+IP4DZsB+KSqy3zmVrSomv4+KLRo2if1lN6DYuZ0W9mSK2wiIvzz3b7?=
 =?us-ascii?Q?edIxTfjLWMZWWvGueaNOXtR49yLUd4XoDOJXbXeYShUX3LobL1rY2nq0qpnN?=
 =?us-ascii?Q?Epu8v0NjHYnu3af4cvbSqweJSlx4povAGePjBI6VeiTTGWHDbKGZnnKP70aD?=
 =?us-ascii?Q?0u8ymCRxb7nMMGFO6BpjcX6Gxik4wfU7yE188g8iaiTClOhR4QoIevLjQoME?=
 =?us-ascii?Q?nvu5SzP+pzM53oekkWnwP/73yIGBVJ4ZNJRfKaR0Ztc5qIqp+8CbWiW8VMUP?=
 =?us-ascii?Q?VDp3qBsOqeEoYwfOte1Vm+DbUJxNLId/ZEGw6yyPEonTqvjbJC63apM4J1sV?=
 =?us-ascii?Q?Nxi65U5zkzslFi58Gdr0ad2jEC9QbmroIHrHIuzYryorrZjmaVA5FcNxpqPt?=
 =?us-ascii?Q?aVZts+RcctJuTy16nik=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4Ek4p4WaVIx5YrZTNEHvQ26jNjRwl1mpm8pGZ0UR+LLojdu/L6VYucyFp74P?=
 =?us-ascii?Q?abfqaw6MmMcBrG7H6tjLJfSg+HbaAmpChjMHJ9H5CUvLpERVVvAwmghF279c?=
 =?us-ascii?Q?Jsz0WU/2OZnIEhk4zy1KeDexfFoqK6llCAnuv6dDdExZKWS5C55FOAa0AcUM?=
 =?us-ascii?Q?bUYZaHet5ko10GgWDFvNu0gXL8/20lvfXS3qQxFllZZhI25Rhwp9Lykb2mIw?=
 =?us-ascii?Q?v8weoL3UJBZJhorYIw2/C6ZuiToY4wnXnKq/Bav7j9Bl9Cp3PZlQFOX36OTP?=
 =?us-ascii?Q?GdSk3aOk1oNGaAjkrlWPq+N8WQ0Rfv8acMy099bLF/kRHo3uaj0kfOHN5iNC?=
 =?us-ascii?Q?7V64Y1HgY39UodQ8arDwYJh87pWJMwVQgtcd5DytgMG9wPVoby1bACMCvy1J?=
 =?us-ascii?Q?y1cxG3QTb5Ua0nax80RxeRE16GwASpcOwE3fMne5WXQI4NeS745CUXNVJimK?=
 =?us-ascii?Q?vGyv0v/iQVldYB/iDSaa9TRsQFmxmZbOeGUvabJPHqXY7jOkkjmhmzOW1UoS?=
 =?us-ascii?Q?wsX+azd2JbTPIAaA8egRjfpt/3rzmKdhD7jW11xz8mw5Pq5JEXToSJvs+Z6C?=
 =?us-ascii?Q?hLrnpMDhCiBUqhpjizS7DYgEprQjwJr+BIv9XJyMo9lltWcEr5bYM8xirREr?=
 =?us-ascii?Q?TCiFxh7+ISz2OOgR+MSjb654DTLEHSR6BOrrmnyqUyYKPPiLNc+Gcl87cGBo?=
 =?us-ascii?Q?L3n+IyTfyERxHKbKNW/mrbrnpRVjl4HFWLrlSoAXoeoUWkDt9ZkMSy9HrSAS?=
 =?us-ascii?Q?KzZKnIGOENWQst+WKxy5ZxotCqTnI5gXZTQ7Mega6qhOy/g158kKqJU4EDs0?=
 =?us-ascii?Q?wFLvljq+BYwiE+9vQ15lDKVI1j06ym3CaZIw9ueXZUlonO88O0Ecr8oxQ//n?=
 =?us-ascii?Q?LZ6GBK+EFtVhNo6vEIa1B3roUOhowYMV6y8F7UHai9f9AaKoPdK+9ozK5Wdi?=
 =?us-ascii?Q?KW4YFy/pF+4pqN/ky5PE0q93hjrgSNp4sXOeWfER3CURiqv7E8y9VU52Gf8c?=
 =?us-ascii?Q?SdCX+ykhNhHpJIPdZ3LECkjg/zwHuAGcNK6MbAqUMyEIqESzTsH6nvMwQgaV?=
 =?us-ascii?Q?udyQF4J5EGXaBEVIjSUdvBZk8pQbwhKj6aaW7840MUHSyUpd0b2ax0qfDTJT?=
 =?us-ascii?Q?B+l6EIG76uO8rLGuhCBDbcDPE1V4vyhiceAvAC6NgVK5+8BuX7kazMGytn3h?=
 =?us-ascii?Q?GZY3MJOykhShJ8ZaTaeZ0yfTHdQsY018jPGCYXj93n7sc8Gw4vog4Gh7vitR?=
 =?us-ascii?Q?MKWb51tF4Wizi2iPxpQoJb1Xm/tQWbH5BsU8uhc7GKa6Y/k0sl+g89QMyI8x?=
 =?us-ascii?Q?0NJ9Lb67LfXRs52tYNA8CVu7v6XihyYHFlySF+HydTp8oOL9c1Qsq7ytAE3q?=
 =?us-ascii?Q?2Jn2FJgTin4gh6806Wk2N2Um+M/N9IAVfoSgIuECeT0OSv7uet0dyZtgZ2Yq?=
 =?us-ascii?Q?VwEWzGOuzD0/e52jNM0Rj0gSgkMMElzJSQ8o5I8eikae6osSOfok/JRBttYP?=
 =?us-ascii?Q?rYXuj2LdZg9kqpRllRlz3oBp5emXfgydgDYbaEFpT5Uy+Xp4aENrNgcFJzF1?=
 =?us-ascii?Q?lZ7HI8wnd0As+q/TmpoLNfDlQUBfbt/1F5yt+p1Li37ZC21MmN341Sfg6s3o?=
 =?us-ascii?Q?N4rNU6ofjlFBWONkPSf8IGcNmzA0p5AtNg7WRZs8rlBO4OB76VyD4gCCtZOs?=
 =?us-ascii?Q?rNvJUbf84vYLlRpRDtAbkvtqVd1TGRA5Qp3nu7snybKxOmAcAGJB+w/RNVwn?=
 =?us-ascii?Q?vRkaG/fVmemwRP9PLoRJOKPm70Tw5dg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oHVpPVsAXsaoSKwFUKuqrOl+zsQh2cNxr6vZ2U0kKedTCEGCfwqdPO3i69dy8pGnx8yoIlA11e5uh+E2yZDkmR7qkOBJsGAEp0Z9BB9vHwJROXj7KFtgnhUMHWoZSNADZxfa4Y45sAQUHfHIL2mchAP7NlVmUWHfHeZ4TmnTfKHABP8xSzw+mPW4FfWTqou9c/311/K6/sPTUcLvoXxFc1h56ns8rdJA4HPX816d7Cq2XoiL4rGrDpbhTuM9KwsS6EA1KBzntp2t8I+xkEo0HwjcynWVxL9HWU7Zd0xKNfH8GPvpSyxhE3E33t4xp/0D/4uWpgA5e64cLTkXV4DdJceGvRjyuDLgxaBfPaKoRa8yg3nZyhJENdxo95xjTcEch7eA2/OUg4sX/xOTPSBgnQa/QEY1q8qd7TfwQlwOf2eF065IAa+vsSVy/vZExFAnPlc3m0V3Xhff70KyPKpjEfPByTQ3A0KolEQFeU/Kn2CHudWFUXjarX4fVGSREROjm5zdcnk4r6yYjNzEAxyFKRT6seXyO9qcTgtTr8ZT3hx+oMKmgAJfh4FnsqNrReyLvdeDFE+/Ov53WNleLBHnLUdPEEi++FR9m7wKGJrzZA0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990f1433-2214-49b0-11b6-08de551b6a1b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 16:22:16.7954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7xu4mwqYBbmyW++/sdXABPcXnAj5EPV3JD8NWOy04lOlsxdREdaF1z7zB5EqAL8ZVsr4v36YKt/cJMHpKbplMBFqx0owCnSriRfQjPm5h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7673
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=650 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601160118
X-Proofpoint-GUID: Qn7otnlrlQ4crFFwBSWEuDT4DlZO3Phx
X-Authority-Analysis: v=2.4 cv=X7Bf6WTe c=1 sm=1 tr=0 ts=696a65bd cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=LpcU4NsEbS6nmg26XRUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDExOCBTYWx0ZWRfX48YFZeA5uYv+
 lcrax8ljunj0TSwPlj1qWeebTfCQ2gUjUct2z3l2bfH5c77M99oMvOiDxj9wtPLKa8jTOYbBpnd
 +0kK+NMvJc0pbzvqo9KOI0irxLaRvg0Ah9cb98WXtJJSm/o1CRJERv1RHLU/fJM3U5TegdnjWkq
 /ZVn+xTUOKonL7DHw6UXQm5m2Um1/IY6zcbg9s4pnogfLEZSNPxyWPcjRFeCYkVQv3Bmbj4zInI
 j7ZQauxgBcZ+WXJPSaRyQy2IcLcT4eN0zFA/tF8yNtYZqNMrvbv1VnnWmPD0SrPbyItu//li6ox
 FpX6KDKgY/82wYEOOTnqEnIW4CSYZho6lb5KMnwPrGJjfj6tlhXn3+cenFfH+Rmz0GjBmDQ5m67
 hOe2EFIcXoISme3FvPgRDgSMhd2tlugRCHUwjO9KT3kOoF9Yr7hH2+PRBDtYDjBjSQzGadprUfk
 c+mQrST2TIujHYJxitQ==
X-Proofpoint-ORIG-GUID: Qn7otnlrlQ4crFFwBSWEuDT4DlZO3Phx

On Fri, Jan 16, 2026 at 03:36:01PM +0000, Alan Maguire wrote:

<< trimmed >>

> > Oh, I certainly agree that this is the functionality we want.  I am just saying
> > that the tests in the series do not in any way exercise that functionality, so
> > there is no testsuite verification that any of this actually works and that if
> > a regression were to occur, that there would be tests that show that.
> > 
> > So, we definitely need tests in this series that show:
> > 
> > 1. show it works for executables and libraries with -c (you already have those)
> > 2. show it works for executables and libraries with a program that was started
> >    before dtrace
> > 3. show it works for executables and libraries with a program that was started
> >    before dtrace AND for a second program that was started after dtrace
> > 4. show it works for executables and libraries with two or more programs that
> >    get started after dtrace
> > 
> > (I think those are all the cases one would expect to work)
> >
> 
> yep, that sounds right. I'll work to add tests to cover these cases explicitly.

Thanks.

> What do you want to do about the absolute path support - will I remove it?

Let's leave it in for now - once we have the tests, I can review this more in
detail, and we can evaluate better what the best approach may be.  If adding
support for absolute paths in the module component, then we will have to rework
more in the lexer to support that without side-effects.  If using library path
turns out to be the best way to go after all, we can revive that.  But I won't
know until we have full tests and I can do a better review and make more
informed suggestions.
