Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45578287506
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758045614; cv=fail; b=CjVxIezNhFO3aJg1eaOPlTqkNCCRLLAm7ldAwEM3yqwp17iuPO76bfVCRp44JvVwJ0Kb/98oQuk/zIl02wAMJ2ZmyALAtBAu/osNWknkjqaW2ehqMGbCZWZYAtZ2hM/rhSzGdNKQknopIbdvCXiSybkNqte+fDlfsV/2r4Nsw1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758045614; c=relaxed/simple;
	bh=v+g3mU46BPPWOaR4zsZU/ru6+YJGODOnQyUaV05yw70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QA1UXZXEieX/e+pIJrOfkXB1R8jOQA6u9hCc7WILaiJXFHR1c9B98/p528KJhwgap0zry2hXHUU2KJnSeZqNm5Gj3fwmWTylLCFE6XdITggG4Yk6CpJMzzLPJqNKvLTckgRfuOTZ1RVm9jCmxWAqNSq8pu/bNYBEm31jpYJxLKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FuDstKuF; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=csE0yell reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FuDstKuF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="csE0yell"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GHu37S017863
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=D1s3tikTrmnWl8xh28hd7OYrySvdHmtVw4kbctxeZX8=; b=
	FuDstKuF5UcoL9wVRanMhQfZlOtEOAUOBIsi3Jf6/vQu7yJ4M3ypKlynP+6La1pX
	DWPtQcmkPERot+odv4IIl1iDCyZmj+MsoWt2BRxV374yyI+Dl1phcK2Kkci81pub
	3cYTbzJkm7lIJnDp5EgTJPqSqbaDnHCaqpahoQ1TXrKQcMCtAj+nhmug+D1/jAAB
	Kfi6gQi5ZH3ly0RnKuReaMy+oj1ojs83YOx0cqDFzbBWvBwieD7xMEMTfZfRjvog
	XeK8C/99pwBrKw+2xV6dq2dHT31KS14tSgxjg2hoZ4xVdfPpFSJGKRV1WiLFpnDw
	uIxTYp0UvkfpDTZmzsglzA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4950gbn6m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:00:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58GH8tq8033686
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:00:11 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2cqmvc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 18:00:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zf1YFr/qMdfu+qnQf5Y7k2wfD+/U1QYfC837xJNHDklKNdwz+1sX5+Yc8fZ6/O4tW4FUEU8sjtnrxRTnIwvM/PqqLaX5zupebyx8nV1i9gf7NOpaE+NfTnnn+MQnUOqfeFimWOtAJuvAcOare44LtBRuZXNvntCYRr68XULsidnlZIvCGDGiTjIAUtcsNYkfpeqzUJ2jLE7OOGT+voMX7s6Z/mztQiItSce0gmcFxJb6tg4filEiwowJ+LQjljbgGbCgRyknQMEp93a9M8Ly5m7erVQSjUnvd9PB8kKaqzKNTu0lm11yy3HPk8EGTDspioxnIPGbXImNAzDV9eOdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGrLCghFazHlzNHRMiac7X5U7moLXLXSh+aKpkdCoOA=;
 b=eV9Gxnv4CjarjAKlTQb386O4nRTSf7t6cG0vJOBDyKEqgrL3eSCNiEFAeOoNnEmkkrO1I1NF+PeggvopOhW/LS8wNDYGzc4K/Pv7lBKIAUGJTKlOACGiErizH76uyvqiUu+XuUpZm3IxMhPAejsAQLz+aHbW+YwXIdMHY4U/dQLBUzv6endjKrRtNDXe33vzFU9XDJCBR+a6vtTJzulL0TEACevtUhUC2YepebM6XAzk/Pvm0SRHoZfO6hk1Wnzt49GzUlId6NwkTb+AE9nizFv2NXj3+Yjn9gqjhV/MImhGUSdCefniWf/ZiOn9Xv+17wv2vmlmdny4HFbrRc6YXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGrLCghFazHlzNHRMiac7X5U7moLXLXSh+aKpkdCoOA=;
 b=csE0yell21FXCIPgNDIttMipBY4llwZKgucg4u0ZLo1JVy6jTVHfD7RUFX5T9nSpCYvHPZm42fwNCXo2PKwA3jjAZMKQsVIfVssxp88iPHpv2+GUoWqJEydGhEgfwdDtT4VJOzS/S3vttSOtlyaS21DNI/R9THJhp+e0AJF03+o=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA1PR10MB7594.namprd10.prod.outlook.com (2603:10b6:806:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 18:00:04 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9115.018; Tue, 16 Sep 2025
 18:00:03 +0000
Date: Tue, 16 Sep 2025 14:00:00 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v3] trace: print alloca pointers as actual
 pointer values
Message-ID: <aMmloLhzYupYUm1y@oracle.com>
References: <SJ0PR10MB5672162D698C139186ACCDACC215A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <487cd783-80c1-e037-0c28-c2ff94364a9d@oracle.com>
 <aMjA7o55OLI9cATN@oracle.com>
 <aMjXfFOSefOzjlQc@oracle.com>
 <aMljZhoquVQGtvRB@oracle.com>
 <aMmKIR8E5rdokSAr@oracle.com>
 <c6466eba-5bdf-c3fc-4ba2-6509bb4787cc@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6466eba-5bdf-c3fc-4ba2-6509bb4787cc@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA1PR10MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: acf2e542-8b5b-42ba-8772-08ddf54adc8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?vEZo+jmEhKCcQoXvce9QzojFlspov7enJcV7ePwyWSSRsA1WHLOEYFsj4t?=
 =?iso-8859-1?Q?naEcR0eqQzgUU3t4Zfqh+zGH5ikMfT+ISRTF39r/dEAox2uwtagO3IFwue?=
 =?iso-8859-1?Q?ENlGAvl6/Q0WSMAV2e3kS/2XoJRti5YoJaJVKPYxULDqQ61HxBGXKUrX09?=
 =?iso-8859-1?Q?H7erzB33NU0OX4BxhIcjNAIO2t/ia17OReEO7SdMngm43Fr/kw1Wn9taSn?=
 =?iso-8859-1?Q?wVpI4NxFq0OOsq+K+hFbbTsOY2qjsmmBGPoJf7hTeb8uBi4fN3dEdV5rQh?=
 =?iso-8859-1?Q?i1o4+oxz9VrMUL4uUlLZljOhD1P0cwgWKxW7yd5Lm5AQNs8JDwpgahj54u?=
 =?iso-8859-1?Q?KIaZHcYoKilZQrCmnMyZ6Ua1tIbXrsrz9Bqc9PQLArozOfnkJL3naS0sLO?=
 =?iso-8859-1?Q?SAYs4GtY0TjieeOM6l7X40apmQEX1AWhvu3R2tFHZp0XvIfL2weXbxC8/S?=
 =?iso-8859-1?Q?zHT4U0ZfHyP0SWdz5gyv8bcv+/Qz7bgYziJoOFLrsTqFJEQKOmVL+uugZK?=
 =?iso-8859-1?Q?Q+rSiCNH6xK+7h1KjOfiY4QiBccwZ8Wj/ZYBu2NkI6c8RzSZP7SANQJizy?=
 =?iso-8859-1?Q?l3AoIDQ61q+hxf5//S/UzOX1ckyywgjyO2M+EfcvD27p5QPJMTTOwqcYj9?=
 =?iso-8859-1?Q?QsoJj3LGLjFMjTWoyW6mdUj2BGK4OKQ44+Dz46Kep05fvu/3BlY5fWw70z?=
 =?iso-8859-1?Q?ZZSHXvGg5fMEOfTfccFSWT4gEAANmTy7tnwXXoPaVONFhDl2tM2SMrLXMu?=
 =?iso-8859-1?Q?ZzDzczLCUh0xFbWLlAFOibmq6uoOl8K6Iz4nnJNx93HseJeALSSMEwiPdh?=
 =?iso-8859-1?Q?I061xQ3qBgBGsIvFBXyIRqta3GXohkSoEiSRLa8q4bg86iUwyB7fpDU78k?=
 =?iso-8859-1?Q?9yE5bS9X0atSWlps9D+Ue34urdezi0pJjG5VS5azft25bHborIqh7BOuKd?=
 =?iso-8859-1?Q?sGPAnwnGM2ekJysBF8IRmzUdADWGUHKP9MerDHvncM5NpCZ8JD7sgzTQ40?=
 =?iso-8859-1?Q?VAJub9u7Vj674ahZuFsfsSNunBBWIlEi4rtwrbwgZ/+ObLCQvo0lLK2oh4?=
 =?iso-8859-1?Q?PCCzDTS+TYpu/iAFcb3EgiU7VanoypkErQlUm/jsetA6Iz2m4o3C1qRwgm?=
 =?iso-8859-1?Q?4UKoWxArMLbnFuid6vv08mW6PjsVethiwJdS/Dj6rGeRvtQjkjtTdq8YGf?=
 =?iso-8859-1?Q?aWOhsc6xFXdFIQOuaBq11DxDGcOMjzN7iHTvxeUI4eRU7rVABv5bhCkoif?=
 =?iso-8859-1?Q?dwWf0ZUiFSdPmXAND6wVTADNO1ehF1C1X9/qReJjQe0BoC3CSyg1tesLJn?=
 =?iso-8859-1?Q?MJaWxc3SIEPwodKOXNADCsTQYtDo5VxqVerxu2MR8H+Zs4QKIY0HfLgQhV?=
 =?iso-8859-1?Q?KmnrZp2Z5EHQFdnEucsCOUlt3EnBxIW4SrUvVHzkFUA8VZkP8O1IC8yipv?=
 =?iso-8859-1?Q?t5Wutq6lH3sitoLcNdvmRHyVVoJHa99Z41+V2Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Jmy9CjS46WAi5nR7ZacHCCR61ASJLYg5mxbsmRc6gR6uP2j0zvIafMILAL?=
 =?iso-8859-1?Q?3o8T9KSzySajI5uYYl3bXmfj3v+jmOlcy7chc7nuuIRhgCpIZHNQlX8hKt?=
 =?iso-8859-1?Q?IhJfHapk/GTS+WGK4Z4FDhxSKVEk3WHUa1lLPIDP31yKgI7Hsf2NEA61A1?=
 =?iso-8859-1?Q?4P6Kb8B7a4x83dB0gKYmx+0iPjRuBos7FOfGhvekULQRSr2/uK+PZHheGw?=
 =?iso-8859-1?Q?dDw0kZ/bJE0ByMA8rY+zzPY+7DPhn4rLFAgMYkVxYWfB63pLl5jaWYNPKI?=
 =?iso-8859-1?Q?a/UA/oq+WgKWQGmtHEOcMBbMawTH52i2b7UE45hxm28p7bbnetoE3Je1xd?=
 =?iso-8859-1?Q?5b74Gvog5mjaOFj97eOaRo3dmiBE1bfYTu+cAIafX1K06F9ScsY7t023/i?=
 =?iso-8859-1?Q?COR+vH7tRN5UJ7Y9pGnzV0882BTQz//I8bC19SfrfQ5l2EBh/hjWIEBY9b?=
 =?iso-8859-1?Q?IaDAf8hsHWKeHobQS5xQPcCqE8y+UuZuVXpiGp8Ame8B1/7ZsGWl+u+sUS?=
 =?iso-8859-1?Q?VPYzJrBZJc9bTYitkyqlDk54bSY7RVZgnIMQ4bkWbhlWAzgW8tPo1ObC7e?=
 =?iso-8859-1?Q?YKYf8PKRs9rxltvAbyIG67f+MbkwwW/MOlteFQW2ir/qshSLhs72CorfxS?=
 =?iso-8859-1?Q?7lEKZmeggDwzVJJy0yZHUhRxp3ptIqfST8oYJ2y1vSx4ZSKWT5bQ1JI5iL?=
 =?iso-8859-1?Q?3VkLdwJJYvlJxsQdzbfCP1JfifoGyI0tarhSrYos1yWFi0Q/wytV1DmwmC?=
 =?iso-8859-1?Q?ID0DvVGnXm4hZt6XEPB2u7K4No+VPa1PWbFaHEyHauMY2Cy0EPYVk7yx4X?=
 =?iso-8859-1?Q?U52NUMEnH1kAsdgqL89NiMQ2CcHH3f6Dk3d/D5nEZgyFuvoExslm2A0t+5?=
 =?iso-8859-1?Q?IEIoF1LGx3c+oacpKWYcANC1K56rG8XQAXLpe5Iw9ejMH5/e7jebBvI+dx?=
 =?iso-8859-1?Q?FZglWDQ0jGVtRJ74moAKnIexEgzvXeUja+krTSVwMFLolFAZRn+PNm6ZIG?=
 =?iso-8859-1?Q?EK57yowE6iFIh5U7XRLxEpFWgANtOt5fEHxzG94QpgbAoYPa2kXAqS1uu5?=
 =?iso-8859-1?Q?4BsT0c+UWoUHwRCmV/jrCYr9f+U6e+U8Umt/v4+pDFz/nI26noigYVY08M?=
 =?iso-8859-1?Q?FhQaZo+b31Ua2yWty4/Y78azCsWDNlvevg0Nr0SyTVorhYyLQ95Ypdv3uU?=
 =?iso-8859-1?Q?Kd5PX7x0IkL4s+PzXfUkyvR0n92Tfm8okmCnqcTIPeY4XOrRh2hGjg9h9F?=
 =?iso-8859-1?Q?eQX+aBzWmsPmy1AjCy5oWi7iWoIkVKwDeA9IPQLhNOtu8mXOry7CzXNdDu?=
 =?iso-8859-1?Q?RVdO5BXAYszZvdWlk6paga4pL2Mp/6YsLf1OwYsmE5AmAMcwq70leJQH+Y?=
 =?iso-8859-1?Q?2PLlpsDnsKWufr9VbAJqSHpXA2QXKzrc5DShkWciwX1qU11JdEk0opEcvt?=
 =?iso-8859-1?Q?HXIDYtG7cAQ5jgld2xyR0Wx2UKWzGmgelyXNlx+NGtEmwiU3+kjKqaNNMr?=
 =?iso-8859-1?Q?TVQ0m7rCjO1BOwL4QOUzYfqgrsRLUG3/TxwmZf1sh9ZNzBLiELqLJjgK4S?=
 =?iso-8859-1?Q?LXAF2SgaGILz5kpln3YeRDPEN+3mt23xPi9QuZRGDL4/mkgSmGkV+Zgixs?=
 =?iso-8859-1?Q?5HKvSR24mRzUcgY1hR91cOYgMDTt2qB3JLCcbq9jPfCLNqo5uDVwPwkg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FM6RRtokqrrRpF7xaTVEcyfWvlIemkHxmFkypTKDAXjkAs3As0Urjku9/Hefl6vM3U0BJEEph+kv2oATbyppDAV0UsdEvbvMVRQatepVDWHcPBXle2fWymUxCSklk4LSzkVQaPFzeolITOjtpagGaIRCVxDZo34V+HrP5nFXr2fOB7m7I1Tut57EEenkZ4eG2ISyv3l4XA3k+6YuysHDqURyHXW+uESBe0IcVTk4VdhA3KLYhyNeFALRtgyysdDQguHem2Lw/7ZaDFzXrWMTqVjSnSwU8Nx5ksCRm1r24so/QzLCCoK96lh1aSYcdWUCH2eTXmoVx7qTLeXANmUYzeyLqy0hS+QvV3BmDXp6t2k2oe92VoIZokgBicxbgpLLaeIixEt4OiPxdB9pl4S65oMnH1DmsN2ZjcVedI1kbzq8AQXpL7ugDZjt+cz+ZT0nnA8oT1otOUl/hSD6nETwfRgXt+gE5ks5HmZ0yqHISFVab8L3m7EzUvzZvcF+U0ZYMHSp7YnTgP2DvhJ28/ydb9/8JJPSYsvRPd4IB3ZK0TAKeepwDr4vgT22fA2mWegefmzE7898WVRhq+xRwvhCgkeQaOo5rMRVsrMFmw6GzO0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf2e542-8b5b-42ba-8772-08ddf54adc8b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 18:00:03.7141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRASNXpjzFgyR8Q93EyG6fvZ1M0hBHo2nbWXIcDLsDKdmlx57+NYszbPhnccO5pplVJ6g6b78GNoTjdfo3tRxS2bolr2NMX4blHzGtsWB1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7594
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509160167
X-Proofpoint-GUID: i8RyvD5JSagNGZeRviSemD0ffhtZpkJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNyBTYWx0ZWRfX9rcm78o+TvyC
 geNH6+sJHHgx42R6VefRClu+8iS94O92xQsJ72EyCLISnDMxblV6DbPKSNaV+WTa4IjlpsGvHrQ
 4zVG41YvaM4zlHIWAxUTtoU+i8xP8iKoiCYftSjzsJSO9S5RCr/dpWa6DM51Usjh00fUvT4bAQn
 8viuKx5bn6BGNVWP8L15gKo+yRqNQu8yBHZT7ArKY6+OD80qXKfHMj66LmbGT+BG08BMVhLSYws
 QblG1KdfDPLN39vtbflFTH8dJFwqfirC17mJeNRYK1hOrrkL5gMMYP5kjFI/5Ge8IH3X/7r6xqe
 6Xbq8XxvhXr8+gu8lAhjoZvIqq56NonybxWMyD6dfLslYt9FTReUYuAdeDDH0ofBJQ/OGCCcfDD
 OFbseDMD
X-Authority-Analysis: v=2.4 cv=QIloRhLL c=1 sm=1 tr=0 ts=68c9a5ac b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=0TkvnAsSDD1bg4WKMf4A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: i8RyvD5JSagNGZeRviSemD0ffhtZpkJB

On Tue, Sep 16, 2025 at 01:07:50PM -0400, Eugene Loh wrote:
> Just cleaning up my inbox...
> 
> On 9/16/25 12:02, Kris Van Hees wrote:
> 
> > On Tue, Sep 16, 2025 at 09:17:26AM -0400, Kris Van Hees wrote:
> > > Eugene: Can you test with my kvh/2.0-branch-dev branch from ca-tools4?
> Yeah.  I get the same issues.
> > Ah, I just took my tree, and merged dev-queue into it, and now I am seeing the
> > issue pop up with tst.tid_pid.sh at least so will look at that right now.
> Cool.  Let me know if you need something else.
> > > On Mon, Sep 15, 2025 at 11:20:28PM -0400, Kris Van Hees wrote:
> > > > Do you have the pointer subtraction patch applied before this one?
> Yes.

These are the failures I see:

test/unittest/aggs/tst.aggmod_full2.sh: FAIL: erroneous exitcode (1).
test/unittest/builtinvar/tst.tid_pid.sh: FAIL: erroneous exitcode (1).
test/unittest/consumer/tst.merge_ranges_bug25767469.c: FAIL: erroneous exitcode (1).
test/unittest/consumer/tst.symbols.c: FAIL: erroneous exitcode (1).
test/unittest/version/err.1.1.d: FAIL: core dumped.

Only the tid_pid one seems to be related to the alloca handling code in
store_val().

Do you see other failures in addition to this?
