Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82241196
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 00:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738282416; cv=fail; b=sJAHRKAKwWgyimqYJB5wjxxnvPMUP0lGFt8vr9bu5rnHRnEYLWLq8jh0nIbiTRrdmcRRp6WJrCOIHBLcBEXYIwQ48Y8sKSG4kxomiQUevgI2NigrmheakawpFpXmShNRqw3hergvPYqkbJWnRIpmn+mZYBBJm1VhZWOOqqVB1po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738282416; c=relaxed/simple;
	bh=mCxOhfdJwx324ngip0DsMeAaWtG78G+hXIR3YbM5pN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PsViFLoLnk9E/KAv/JNXhIKnr7sOCXDFzViFF+l9dRQETVnuiT55hrxuucP8TyUqbhIpFLxdE7C9rPcxJI+iWNzOBuBz7OS0BnLX9XvIO9nIKPeIqkb4wgjPgnHdYF0OFI7G5Apr3ybvwcvwJY745waRdKUWhROPXWPFkHuUYaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R7czRWsy; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qSJN+mpe reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R7czRWsy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qSJN+mpe"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UMaoE4013749
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 00:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=CCskHkgVu2ZC4hDW4ojTJkw/IOhhVGxTkXaoBj718/0=; b=
	R7czRWsyP90EZZz4aMHdvDlPOgSMVojnbfLGqGKCePblittcwuJPIxbbAN5cbJ+M
	Vju4/inW9pkSC4/XiJCw89X0Dj0Q6med8d8dqMxGcKER2zW7jVc1Y8TQ1H8EF67g
	A+9vyAxghQ4cOinbErTAwHMTg56yGQF0x7SCefhTzxatnYC45O1vtzXFCUVy99lo
	c1vKJfBj7Xq74tUfqcGKgoRQXNNlE+hRIn3hFDZiajsisb3zEezH/rQhxxPgaOfm
	Grs7jefBZkQoDnvBldioepVjt8Ztoc5EzdgGwsqYNKiKrXIxN6hNpBfIc3o16hdx
	2O5VEgr0h8vDYKmXcndSTg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gjcc82wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 00:13:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UN0LHB004104
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 00:13:32 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gfe4a4w8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 Jan 2025 00:13:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVK5rFWzYrB1BAefF9zaQs7uBhREegAH5nAELP5SeX+fJC1/rezIWzPgO9c7tnFqlsBz46jTItHkNH490F3gcoZELiZo0vehO7arFttCQMji9e/uqaYO3gcF3TgVwDzMQzUE9wN/e3CIKff9okOxkPbvoIRHkIyfmucmbF4gwb9kXaHBfBui6RLnXHhfwHgDTeqU6ys/1qPiC9kcKUzMQOtCmKffK+XguQoXVFQ+sKi63evKTiy9FoZBlaVswqe0X/lyQwEupHaGNXpvA8dEHbSoetAFB+KebjR7dGMhq0VYCPgSBPfcrQHxkqsV4euwNN/35m5Hyvf5A4WE24/xkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0zYsYyuVd5SOkZPaCEckyeZYIPhpuKsdFn/E/tcPIc=;
 b=fzmiUtoVzYSZ/RlGR5f8GeSfk31Rt88GMkihGZpGsw/PBN1n5MlCPtaRSM62YmlBrH8VK3P4hKLLBVAHkbFFmeDNyHY92rcCUOFEP8xkK7Cmsxwo3yzf/FxXI0YHPEO/5VovU3kb82zNugGv786f11N9GU+gU3dr7xhUrILk2PMGgtNyfABkunh3IGADgNACRuA4Yknfj8SdPxPODH1xE8AmNvwEl+HFvXKRU7Cv4+jtnpac6dyocYj5EkVTCxObnUZHBFStFrvYSCb76rcB5X8RB7YwLHK2om+05Daa/0WyqzsYF9SMEx+NilIWGiF73OwrpBG4zwOfzfXjx5MXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0zYsYyuVd5SOkZPaCEckyeZYIPhpuKsdFn/E/tcPIc=;
 b=qSJN+mpe1UKQNqnuXR34vTsbgzzlLnKbbb8nNx14PJKfvekfmgj7nCnVcw6TAmilO5ieYg5kiYqqYRCQR6pubVDGbNqJCF6fHnYy131/5WC+ZIvU+8sTaFHlx6ddxwi4me9jRRvktlt40o2BPtwS5/UR4Rv4A/3CJZN87wEpOEY=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CO6PR10MB5539.namprd10.prod.outlook.com (2603:10b6:303:136::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 00:13:29 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Fri, 31 Jan 2025
 00:13:29 +0000
Date: Thu, 30 Jan 2025 19:13:26 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 6/6] procfs: populate pr_argc, pr_argv, and pr_envp with
 default values
Message-ID: <Z5wVpqvyvpficImp@oracle.com>
References: <PH8PR10MB633769A4429BE0BA293C8FE0C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <4b5002a1-1c42-9ab1-92f8-3cbb29368de3@oracle.com>
 <Z5wFUtaCwaxo1LpL@oracle.com>
 <bde7dcb7-380e-dc11-08bb-58c14a6d5230@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bde7dcb7-380e-dc11-08bb-58c14a6d5230@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CO6PR10MB5539:EE_
X-MS-Office365-Filtering-Correlation-Id: d6158df3-e557-460b-2b12-08dd418c16bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?cCxvU4pq9Vv7Vlcn2iNWc16mfzpZjulgONNVG7XePBrylC9TMg7CALPcgF?=
 =?iso-8859-1?Q?1RhN78IGEPscvLOo5xfqwUEXx8ew0ui9e0Ta9U46FAuHjHBOHzCXYFgvXM?=
 =?iso-8859-1?Q?hZUsEed73Dhmxv7ua+VngJPOqVrxy1Rp4NaGueGHjgfzNjssZdIiidB7Gv?=
 =?iso-8859-1?Q?sCxAeB3dQwbcgyh4lmBEH71qbKzZp5ZpvOpHFFzTNTL5vnpor3ekM21KwS?=
 =?iso-8859-1?Q?QG5b/wq3detBJJhd5opEtrhKblbsTUFbr4+sNdN5dXIj22Wc5DD8O2fgmj?=
 =?iso-8859-1?Q?CgGvzIG8TmKU1meGW50tQeUST3qfXZT9iE6eqr371gQi0df7Y3uws3FMDm?=
 =?iso-8859-1?Q?izClXfe6gOGOd9sFS90lHqaF6XjxyXxa4IR55QpoWCkMwfWZfYs4QEAwwd?=
 =?iso-8859-1?Q?J9r9eT4XYQtn1YkT8iDnoeGGOGJ6gah++NaOADi4j0tHhToe/+8Bms5fyU?=
 =?iso-8859-1?Q?gQL/k7SauPddDdu5W8BgY+nvV9OuQz8H9cL2obxKZj0OpRV1BTGv6u/VZu?=
 =?iso-8859-1?Q?aXIhv+iJ4LpBRemO5zrBzXbPWR0ucXB8d7GXySPY13eukbweZsWfxBNNbW?=
 =?iso-8859-1?Q?UZBALaEyxJMqssSao3vnNQwYpnUDLwCDt2n/tkH9WoopvxfyuuaxfsNl6y?=
 =?iso-8859-1?Q?2cnpxzsTfs5bB6vY4vG6rUzi7HhENnTUoj64AfbzHd7Bs605kIn5IDXytU?=
 =?iso-8859-1?Q?Z0KRQL9HKPqLm5uTEvjJEeGOYmv6YHVs5Q3LGmotTIPqdVOU9IntG+9a1l?=
 =?iso-8859-1?Q?Eg4sJ93Vh5SRWEXkDxuei7D3DjY6FTnguFMye2firtVTM9fKqr1not8+TP?=
 =?iso-8859-1?Q?oGjLNxgXVBMyMv73CPFLr00fCpp+C4uc8U8v1jm/fMdXwIy3STcWiLKnc2?=
 =?iso-8859-1?Q?oq0CSXL32d09P+kUWw161UZ8X7khdngyjhHUEoqYeRfPs3nwuaqWqbUyts?=
 =?iso-8859-1?Q?OEcGwi0NJB8Mv6GnZKUUFpIniBDtCrpf+QKzna3TAtGLHPvr3YoVZDcDiJ?=
 =?iso-8859-1?Q?9DLrJ0JQ5SnNY3Wp88F2gdrkUrpX4P8/geURbFR2dTubWQQUKxK8ycRdPJ?=
 =?iso-8859-1?Q?P9o/t4QzdF3QdyQ3kmOALNGCml7sTKi9QeFnzBeFohMGW3HW39wwz2xI/F?=
 =?iso-8859-1?Q?qr5t5+h5YQNSBSdgLnrkOv7sxIxJPdotqdzI4ON4u73fpzkstINHVhGhIn?=
 =?iso-8859-1?Q?WC0Il6m0Ygt1K8JmBjEfhHGxBowDr3NYiw8em+XDwLtCvHNzljyvooqfv+?=
 =?iso-8859-1?Q?bF+AEQKigS647oLJK7GSWt8e5L+wrPKTDu8oOrkGkHMqllg3V0251TKqkb?=
 =?iso-8859-1?Q?U4Vbkjabc10HQrTdfnROQJ4tlo8fTfahC15Qun6VeTXrOy+maLFqxNctNi?=
 =?iso-8859-1?Q?THReyLEpYLJaVrcBYPblCKLV2EIFShAjsTN6MUq+OZTQZHalj0cSlGQ1D1?=
 =?iso-8859-1?Q?NIBH3nkNPI2UayaB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?XPSvLl3iwJS1rAJev+Q+cSJtxSxph+HhC+mqPl3usl0nc/o6n/dHQvHyC/?=
 =?iso-8859-1?Q?4fK+nXFGqkoYzimyTBxMi/55ZWaY+qcJdL4nCm6gdSbY/QHg27+CWqJLQS?=
 =?iso-8859-1?Q?N2xXpkyixkDyutr9Z07C+FeVKIH4pXYwBGZcOReVbjpha1SK8ikeMfPO09?=
 =?iso-8859-1?Q?Ta7BO3ZeWKiIdPvoGWQB4u/GLhja3j3IciQIHm7/G+T3GLTGWwEXayuBwl?=
 =?iso-8859-1?Q?N23p1wbN8Wb/JF9QqiHuggmEMsjFE74F6gjaptSkrK7dHqKRFN0Y4ph/Ou?=
 =?iso-8859-1?Q?NhmD0XjvyfEAhgcMs3HnOclgPOcIJduyQtFOnouIubA7dzQeFRp7RZUb2u?=
 =?iso-8859-1?Q?vLLt1066muML0nAhZVeEZyOH4ZrdTTvHcVa8BvnR7EVz7T+0vPZ/BOnQ9I?=
 =?iso-8859-1?Q?w6c3NGpCY2ieZ5Uv0sNk7RFrRo0thjYKn9qWw31Q1TGHOaHHfVt+TTk/ce?=
 =?iso-8859-1?Q?yjMJSgMe1gFWO+j8T+AXeZmOE+Bsf/U7vNKKPRhAATfgGBAkV2ktPkt1CG?=
 =?iso-8859-1?Q?TQlTD6whr89EcL4mjb2TcFtVo7G4KWU/D4YEiUsSpCnYcMZi/9WeCIo+kP?=
 =?iso-8859-1?Q?gYtvWiPh+06lk1FClEIRQvDe85tZSvBv95LiTjfOE3lYG77F3qggREdQd/?=
 =?iso-8859-1?Q?tG6wacuJiuYXBFSWO8M+VPTGXEKIIDq5rooZFuhaWc4u3HhnU1z7qu6o8G?=
 =?iso-8859-1?Q?Il2SMAZOR0LglgMFw3n4eydPirLtkOabye3bfA7Mq1ePmu0P2FUoIW6jIW?=
 =?iso-8859-1?Q?2XjRwyarTbvg90kqPYjG7dbrfR/ylljNO9/7ohlz+Pm0vkytXR9f3+Gwab?=
 =?iso-8859-1?Q?BK7Wec07D9MdoVt7zQB6EBrc5YuD7E0nOM5hKEmxaBexngfaZpoIzZ5xkT?=
 =?iso-8859-1?Q?OE7x65RHI0HDZerZCjJA8xxT2t63dPUt4n0ogZYHvbDM7qbmoURr9oMjW4?=
 =?iso-8859-1?Q?bJ+W/KcebMnMhCQ37Y/uHpBGA97mkeRWjiAH1LPDtei9lfybfWRkBOOi8D?=
 =?iso-8859-1?Q?GTEtJ1vIs0B9zPe23XBaGAo0K9/Rf9otJhPjGll1WVCZMEZ3Qc4R8FAuBk?=
 =?iso-8859-1?Q?6a7+p9tTPldtiq+vwzhJggZT72uZmFyzgOpFdu2tkhRLegd/hZydkdS+Zz?=
 =?iso-8859-1?Q?JlUw6To5Vdb8suQe4jj90GYfQzbYXvv+1uIxjXx2dgrChqWap6H41ZKUZF?=
 =?iso-8859-1?Q?k3oMAlhLPgcOCdwBOSnPUyCdG+BdLD00+O+NGLph8hiPaGH6xUEA+EuowE?=
 =?iso-8859-1?Q?DKGL8RwqdU90GYQoesyWXw7LgyrXzHoT77U2s13sm5Fs9CnDb+q3Wk26uG?=
 =?iso-8859-1?Q?9ejDLLLh4w1XRACmNLK2PYZqOdNndwhOXLr60NFcFaTv47cbVOqBakkEDr?=
 =?iso-8859-1?Q?S/5XALFsnfdWbzPMmpTEAsfRLMnVBCJ5KAwLfJcTE4zuc7nF1XeMY9Sq5t?=
 =?iso-8859-1?Q?zcFPKoOSI/mTGDxv56VCF0wmQhhtU23wtt7hgLABfiJtb5hdAwJEZLck0W?=
 =?iso-8859-1?Q?cic5bFw4WNneu6QRewAP+/V5tQnE3BZcAYC/5m+mBFrgNN9zoGzzYX5yqA?=
 =?iso-8859-1?Q?VtSxQibGoMGh+puaOfLUssMXZHCyiTl5hE1DsPNAkylyw6rzp//MvezVq4?=
 =?iso-8859-1?Q?pvqYJN/aZ/pI+vJ+pfS1xrGfTkIolwzNz2ugUcofvO3vcdsesRsLsAhg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QJWiAe4hsYCUL3ft4dQixsxBA+YOM5xiqMqJM5z+k1R9ozaPlWoY0IhCJqqFYs5AT3dFTLg22fRAYf9XWevGPmGcCoFGZzLRrSUiHvLXMsYF51QWOuqsGyaU2NnRtJAnBl9sXwqMDFo55MGL20B0Vd4RcXdb0oRnqdV5u5U/F7cQNM/fzPzT3D30uwo+62SIdN2hjEBQOQjqij32T/jtk8umUkdn4MOjT1sMEzqBXfvfUP5a93Q8VDz5az4fafAspPq3ELYpVlFHp8K+uqQZzsiO51bBkJqQmOmXS015+g6Rjr0v0CA4OiKRwqf/dJO9C49ai0U3GGRPimZXJ7ySJn94aY9fyOyAcpxpSmiD9SIlAYfy/hMHWa1mVDbQB0rct56EVfq5FN/vKY1dgFgx8HowoeHO6CBSM/K9QCN+xhkccPiSHGcJIfsHg+MNPPfPNfn32tus3MB3L/rdWl7wPH/RYzVTOgPmhwU+Dy1nZCXZ6R91hIcCG2m/i6GMNjFxUSYKLWrm9iq+xEXe1JgQaDliIt11WVpvRuTS88SAR6T5scq4/ScUIyP5m85O5D8U60hPf52bWmsQJWaC4T5zXLxFvBaAWyttcWBd47mWnHU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6158df3-e557-460b-2b12-08dd418c16bf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 00:13:29.2053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2arJuUUo4nx8qf1lNrrHmOvLKrXy+Cs/joXaP1815qPqJUdSHXyoDuiEjgPAqb6a96V4E0ZbL2lys939KJxk6JgWfgtkQ8mgZC2qajEfNNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_10,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501300184
X-Proofpoint-ORIG-GUID: FD2J3mUifvIZoT--5qQ5TJOXuOysAu5S
X-Proofpoint-GUID: FD2J3mUifvIZoT--5qQ5TJOXuOysAu5S

Good point - I'll withdraw the patch.  We can discuss about the best way
to handle the test issues in a later patch (series).

On Thu, Jan 30, 2025 at 06:43:17PM -0500, Eugene Loh wrote:
> On 1/30/25 18:03, Kris Van Hees wrote:
> 
> > On Thu, Jan 30, 2025 at 05:33:45PM -0500, Eugene Loh wrote:
> > > My main question is how it is better to provide incorrect results than it is
> > > not to have implemented this functionality?  How about just waiting until we
> > > implement this functionality?  Isn't it better that a user is told that we
> > > haven't implemented this stuff rather than give them results that are
> > > incorrect?
> > That is always a balance.  Ideally, we should have tests for each independent
> > member of each translator, so that we can do more fine grained testing.  But
> > it is not sensible that we do not end up testing any translator members because
> > some are not implemented, whereas providing a default value for them (which we
> > e.g. also do for members in the io translators).  That is the precedent I am
> > depending on here.
> 
> From the user's point of view, the choice is between:
> 
> *)  the status quo, where an attempt to use one of the unimplemented fields
> returns a rather nice error message that indicates what the problem is
> 
> *)  the proposed patch, where we "silently" return incorrect values, leaving
> the user with incorrect results or wasting time debugging the problem,
> filing a bug, etc.
> 
> So, there is hardly a balance here at all for users:  the status quo is far
> better.
> 
> From our test suite's point of view, there is a choice between less coverage
> (some tests XFAIL) and "more coverage", but I question that characterization
> since the "more coverage" case still doesn't check the correctness of the
> output.  Anyhow, to the extent that this is a test-suite issue, let's fix it
> in the test suite instead of polluting user-visible behavior.  Let's not
> "game the test suite" by modifying dtrace.  The whole set of tst.psinfo*.d
> tests are in need of overhaul;  so let's improve test coverage by cleaning
> up the tests rather than feeding users incorrect results.
> 
> If you'd like me to take a stab at cleaning up tst.psinfo*.d, let me know.
> 
> > > It is odd that XFAIL is being lifted when we are producing incorrect output,
> > > but I suppose that is the burden of some other test/s.  So, okay.
> > Yes, we need more fine grained tests.
> 
> FWIW, test/unittest/builtinvar/tst.psinfo.d would also XPASS with this
> patch.
> 
> > > On 1/28/25 01:31, Kris Van Hees wrote:
> > > > The pr_argc, pr_argv, and pr_envp fields in psinfo are not implemented
> > > > yet, so it makes sense to set them to 0 rather than not providing any
> > > > translator for them.
