Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A448AD24
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758643304; cv=fail; b=ihUB1qk9UCN65e6+zu6ci1bvfkN6OvaGlEXOcXzbSdck5QZqYH00pC6poajL2XIP2gJedPks/s7oatmqQbsSCD9YS/bi01FoJMHmmU9YpOYk6FDMz+HqQqH33WHJeuL5oA/48iMHmXhJE4T/5e69A8oYXiLePz0+5OJbsQQs19I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758643304; c=relaxed/simple;
	bh=kfFflZq/lWjBy98p8WYPdM1HLiWUNf8bXtvHpmDcdhI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=eOk7UXshK07K4MgPgJfVui0ivWRbeq+qo35dfRtJimovH9kalFMhEUGfTDNQEq6K0OFAaWLpNzwL24tp1Fo/FhEq0Ql39a+Do4pbThzlob/sFFN+PNugFw/9Ns9lYj45sMJen44exsZ4R6e9QMtEGtn4tRrFhHZsnaR/pUE6FyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fK+d0Icq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dEDstxat; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fK+d0Icq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dEDstxat"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEavm7004651
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 16:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=wF3rW9kWgJRy/tX3H792YfQk7GNuIhhv6xBKop48ZLw=; b=
	fK+d0IcqiSgpwQlnxmfSKFAlDldyLOKtat44C/zxRtAtOLAzhfziPcj3/oynLhn5
	OrVM3G+8522kR3d/Q5ZFO2PG3T6S8UIuFVEscC7+ADMqw+boqBNnVbYjLRai6ag7
	PggWh7aJRe31j/x46uwp1MFb1wtj+5D1d+gr1hauEvt8dz1CDGDc+PWtSyJwlXnB
	UXKKI7YJBb4qwdewd26CcLRDwwCL/UiJ8L/XzUwxiYvvqohcIpeXw0IkABLwbAjM
	G8xfi+feMYq4esUN3MNfBIp0d98ZLj/h5eqsharu+w2PHazmAuOYDKIY0t8w2kOH
	SEV01nj6y0Nw8BMmn8Mfew==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499m59cytq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 16:01:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NFCNDf002072
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 16:01:36 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq8d90r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 16:01:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxOrgxt+xRFd2JWAD+bu7tvv7mfjXsc47MeLkVAuLKY+zX7BZPtc7vpQ0AZo/9NogaxFzsXKM3B4SfGBL1yq+lphFzL/pcJTE+tF7U6joKdJ5l9ThcTKNpKqAsfwQcvNSPjdFfZ9i9tV374qYdoSUttrvd+4jAG1F7fTtN1ACmex2b/N4Pl+z+ghXaEV5xuYOcU9IEBRxNo41up6PPtYbMa6+OzG8Z1t8XmL16+P1UwVn7yBiUrXOLTDqx03TByoaHa4CzRL7xYUe2lQGb87mWr+52U4wC2DD4A7pIn4zfvYkcMul5O8Z28u7QtiGx6nQlGYAtgQODynys2Vkm5N6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF3rW9kWgJRy/tX3H792YfQk7GNuIhhv6xBKop48ZLw=;
 b=HKdpspsP9iP60bZc+peLeNTwbz34pvt2JQ0ElEVerJGuCuMwk9CET/bNJqP0e/QnfTnSR/2MFr13JqsZXpkEuhhXN+UCPBcrzRl0J83hMSLmWIcvMwnhza5LoOQG+lBKPoB4MyOBaPZEJeC9i1ngVFEU5aASgfFRN4B67i1/FaS6ruv1WXqB//XjHWjn3RUfbRcU0XplUSXOdCFpmQ8tk2dYmSVfatyGwHG/OFHA3j92e46DNVyjnvKsB/oeLGZ2dhXtRt5BcOzOQjet/DnG+38YKx7GJXluWiMCEGX+or3f0WK7KVb5fHp0M0ICcncq2dF97UVxNv0liHngmBTXLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF3rW9kWgJRy/tX3H792YfQk7GNuIhhv6xBKop48ZLw=;
 b=dEDstxatXwj/ih4FHzDpSEa+seCglS3uWyGzAnQ2zrNlEJNTbKcgnHU8zyp8dVhmZnw89IQI4tErxVG5lf0hFL06TpWd0ALdD6HIkelPlBbYC9pDcA8VQjdZL6Jp01rUzKyvjUF5KeVmnDjKfGqsdlcYOvkU7PrxTotM0Y3MA2M=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS4PPF3689F8B17.namprd10.prod.outlook.com (2603:10b6:f:fc00::d12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 23 Sep
 2025 16:01:27 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 16:01:26 +0000
Date: Tue, 23 Sep 2025 12:01:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Unify the handling of stack traces in the consumer
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672DF8DE55F2405F015D86BC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS4PPF3689F8B17:EE_
X-MS-Office365-Filtering-Correlation-Id: b318ea8f-2202-481d-8464-08ddfaba7331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yL7SexyCjqVZn4Vwx7ly4EdG8DszWNDEFx1cdnMzfdOyG98pdmpbHTQ/AflA?=
 =?us-ascii?Q?P7veRiJxUWlO8EQD7FGbxz9NeCBdtuYyJjho+G0pdfO1uftZsOKeGDtOdEvX?=
 =?us-ascii?Q?yT0DS6BrApZBKBf5o8vCnaoKRYG2BZozxZSwvHtAozzkxbyc4vzQTtvzVucE?=
 =?us-ascii?Q?mr66/3/hsPFl2imaT+WJ4hG3pGV36kVz2Hb8UGsY23dR1iCmZ+txEjkYQxMV?=
 =?us-ascii?Q?rSvw7r6nc/9lm6q0u3vr+CIYI2fkkh8NqqvUOCK8swvrQWGgEqJYDGbmdsf5?=
 =?us-ascii?Q?cqNozPNTjOV/7aPeVVX6CDwZfWEBd+Ji6zds0M4DBHEg0xIyOO5g+bB3klPl?=
 =?us-ascii?Q?oDE7ZCiPZQPjClZSMAu2loj7lOjKid1BS4QlxQChigMhOL0ORzn7d+Sx8T6j?=
 =?us-ascii?Q?a5fx7Tcl9NQ3OUz2P2Sno7rJy8Yr2weXxcUSfw3cikImdMUtcvGSMcnyzvoq?=
 =?us-ascii?Q?2wsDyl7Zev6sniUboV2hhOkZkX5I0f7NLLiNhY1+wV3jQOMULfPxfSzEhdnY?=
 =?us-ascii?Q?NcaTMbLj1zQxWprsm2vd1gF72vcHGjyZEc5ihq46q52k/w3tC0U95YW5G6pp?=
 =?us-ascii?Q?iqkKOrmF00IcoEVlu8uqtM5P5im9zl7VKsfRwkA2Be2dFUeS8w9R+pkEI3ak?=
 =?us-ascii?Q?QqqqA9fBcwuJIG7V1NuFhOk5kZ/kI0KnwCB0FLBzvho3PS0nojaELr0C8bJR?=
 =?us-ascii?Q?BjB2YU1vJC9cprjCdCbwQjmChQX5AS/M5nK69A8LLQE0zsNJH7DOe1809/5c?=
 =?us-ascii?Q?jwkRwMFBtqam2BSx8xt/poqqM0eGb39OxNkhO9dWf8mw0p9lXYlkblAuz00t?=
 =?us-ascii?Q?GSEi8CkTVomkifzlMLAvqUx+Le9jgYijRpEZoO1gAyQKTQC9H545clU6hB7O?=
 =?us-ascii?Q?GNe2P9Hg4kV5oADfvYdVIAgmIZhpWG4yf9wvr3M3HpbyjDi0iKTokGr8Du6o?=
 =?us-ascii?Q?zaxiJy9UDFqSJND9d+uFzODmVfajLiuIR+dE2EIhBP/CL2o3hy2thwW7rVuC?=
 =?us-ascii?Q?FoRGbfvuMXK0/pSVTw9ONNLKJyJJJ/c+1qD1eR8Bjlesu86d6uek9pLD9eIW?=
 =?us-ascii?Q?FYLcq1LEVw5c0h4mCXQbRezKhZb1+LK6ocyLXsH4A5YD4S3IRcRPMmOfIJZ+?=
 =?us-ascii?Q?TZ+bucJN0I+sriQbBeQjdqD2+UWJSvec5clamkvL7ma+qHwVCsqZSuHG818J?=
 =?us-ascii?Q?Q0ias34MCGJAz9/nSkKosijEr4a1bIEQvquBvFtGGGTnV9pAc3aceAwdxWEk?=
 =?us-ascii?Q?lyetEtIqmdIqANVe7W/4zprb321OvkPogxHJdIDgGFlXituVkTFQtRPEW5dB?=
 =?us-ascii?Q?kqkEsRglRG381FhVyp2ycIbOe4+rOzG7ZyWg6g8rf9GmUJXlZKI4RVpZoYNa?=
 =?us-ascii?Q?ewmiuXQmvRSqr6wtGYtPW6u52g80K1J0RJSwfatAWYPE+0CbGf1+5nb/3T4O?=
 =?us-ascii?Q?q2JBoCklMq0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dmp9hzFxOsioh1Lqvcq8sieZmM278Kw3dJq31Pz2ys4Q85JSLVkzYU0inVbq?=
 =?us-ascii?Q?VF2rLoM/lyizR0hOnQw1mY2WCs7d8QW+OADEUJ23anHHypeU85w6Fy3PASWS?=
 =?us-ascii?Q?Fs9bA2ATNrudIz+ZGO4/gUc0ZBXpqCm/N6d/c17CARP7HZLu+9vLoWspqOCp?=
 =?us-ascii?Q?cRg82y8KfSzAqGBbJA59lEIbClM+fNsyv2oZi6Gqmbmfo9A3lGgdSbetvQHR?=
 =?us-ascii?Q?YwYr6SCQHpvO6Mjs5sgLb5sy8aE+9QZocMP71IQapldwrg1/ROVa6FEttQrB?=
 =?us-ascii?Q?UlC0k+GQBWpPS3EXgXYaOTIiGtGhD6K6ay5IV7rtqpn9lIo+fKo8r+72T/N3?=
 =?us-ascii?Q?QxBc623fg5NJ1uc+uxgcso+LHWFlAGfVJEMoa+2np+oiH2zY2KYzsxwIb08z?=
 =?us-ascii?Q?xykURJIMDh71bZ1YktEUhW0FuHqDMI8uFCGHJ7p+Vck9fjMdWlLo705rQaSg?=
 =?us-ascii?Q?3a4xBgVlpLqxyQbj1DhCtV3+DrrPFR4WDEFVWXBVjbIQr5xla6e7cXehdKDD?=
 =?us-ascii?Q?grW53UqifDRJ4W6SWwsxLcn5ShaEkuaYJ3tLKvf6yctx1ztY4tT94OxfoDSH?=
 =?us-ascii?Q?GV1meW5saOEsUiSAWBfLwNalOP+PqcJs+NAK+qi4dS7svwEeUdKiokRj0Svm?=
 =?us-ascii?Q?hMmOibDteUCKhNJzd5tpL2PdZc1jRq5Jv+QDDZFHvINKSBEQ1gNSy0ykrMe9?=
 =?us-ascii?Q?m65+CBIK2dsv2nWHA9bozsc7bB9Dorzg5krnzeGKQewDOejqN2OKxiLO96or?=
 =?us-ascii?Q?roY6Wn0PO+fepfPIehUP2tggLjnEBJvo671Z2ZVbgwtz3lqwLLHTT1Y1b8/a?=
 =?us-ascii?Q?0ltY+yJi1XpYQJDxYS1VC6hWuzum6cy3I7plORycpLhNwLZxAA9jioPwnBx7?=
 =?us-ascii?Q?S0KlzU+kHTcQZ2AA4/FVfY2v3VgJFL+8hKE1wynRbLSaXe56EOhHGNI+yAly?=
 =?us-ascii?Q?IVc0Y+IibnvGlvYiA1U2aGp1xdl31nJotb8dJ6MSuA/0o/mNqZWuTNtfrkUp?=
 =?us-ascii?Q?8A1djG5UWrHeOmQGDii1ugwx8T4T7/A1CixzmSvU7TcMQvWAjcOY20Z1J8e2?=
 =?us-ascii?Q?F3/4arLVae120fP2RCn20FfJ2mDNtZPHPOIO1E11jkUXGdHQHzt5ekDNgHzF?=
 =?us-ascii?Q?epOlKJmgSFcHNdvy2LLev+LBE682FFBFJsJBv0ikduXY/F/jEwWoGnFe8AQz?=
 =?us-ascii?Q?WYVo8Jh/5gllFr2s/ELx3CohfY04GAkY35sxTr5eaTlSXtNe/SzlX0pitw56?=
 =?us-ascii?Q?LVjyTHdREwkcFllHdT1AmNCyXq3ai0wD29Zc4Dv7X8BsPdgIAiMPuO2iSh+p?=
 =?us-ascii?Q?fnSIYKm+LFrMwb40c2PAklWNmJuSeLWUIGohIoe9D/5zuvzA4iT+BHtsag0V?=
 =?us-ascii?Q?PhvXH4IZFbCHwl4PyKs6KK+M3E9AY9xHcJCcZ5Nb0re6T+OZx6Ffcfo/CNh8?=
 =?us-ascii?Q?VBtsNfT4pl40IMQANi6RcjfIotITO256C86cAxPzthtCJ5WhdnaAjb6hxGdu?=
 =?us-ascii?Q?9pgxWDO/iBT5EK4G0M4afW2XHK4Qe9ghI8wrPU2tzZlJPx5m7d6K3ckKY/ij?=
 =?us-ascii?Q?M2n3bnE3hAW9jrm36J2b/FYC3lHJl42/y7pDvLiE2pqEhrPV28wUO6XkIzrT?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HE4lcLUBJenjRF3q7rD03AhN3suxpUFxsbbxe7BG6fU1AuHGU0oI+EK1zSpTmJu/cfJT6fxAx9KaC3TYariJpTk06VKRCVUXw7VUVluNSFs1F9Rq6YfYGBBCd4B9wN8rs25Jsff2i67cU8igFhlOyfIdfSim0Mm6cKum+EUAxi6NqaaW10UJHX6rK6DS3kyqll5/6qRKW4cMoLbxTdBoc93JDb//Er80dKBLI6GG9O6Lh92CoktL4H8ft/V2fPCOU8fovjacubCwbAOMZA5ofvmnh8du+QMcmAcFZReqCmf5Q0YjvaXbPHtchAps4LG0GtHQ8tMsDaio1GYo9zKeoPn4XIfKOyOEwcRva5YUBUrjcUHYcAY4lccu1Nf4gQyKkq3WANuX514xGRGQQVtedS5S3dpdDPAdPSFvgX5p0Rl/08IAivDze1JLP+1jbY33G+mg7OTmHkkG9shRu8qWcK5rle3cEbgSwcXkwZinTOk6ZXgfdrV353/bukDtqVLWmxxEAZmBsF8DRA0jjDmlhfXqUm8YToQ/ImCz/+8CS1AcINX3mHgmt2VYG87RvIJvTwNUkzNbqMQZ5ieaszCqc69vDZRFDSZihAiSPJiX3fY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b318ea8f-2202-481d-8464-08ddfaba7331
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 16:01:26.2248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZfs8gDsm3enCtpoAoZslaem8fVCiRe16IbUusZaVUL2FkQx28OSCL45QVEsdkL4GrIKKdhx/Gn4tDewR98WTc5n60EUdZx5lb8+baNC40A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF3689F8B17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230147
X-Proofpoint-ORIG-GUID: IxZlx1CTAMG9QoSGxywO-BM15V8BCKMg
X-Proofpoint-GUID: IxZlx1CTAMG9QoSGxywO-BM15V8BCKMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyOCBTYWx0ZWRfX7+9iCjiD89Vr
 fQkEszv3ZIS7G6Lrn6h8gL/KbVfDxCi1zOHvAeDP7vmswqgUz6omTqjoLqdHtrj8/44rviF9oUD
 lCiWjKggpCQEoUem27SHnkjnU6NDMeNaWzv7TA7nrTTsptYmTSl0L3ahyBPNab01pzAK2HiZoN4
 cJuuaOZLAWnWFgGIVJvzmyLZVehN9+OcwE0uvI1HNGqdi43kz+2Q8YlvjyeVzK6t3QV8h5ZvQfH
 QzrRHYoSng69xsrrxjpi8kKahXMHq7OBDdEI59B3QoWNs6tJjEsWbbBJEWYWR2gf47kKMlnvM8u
 1pAijGJ8ojQLWmC6mqgeYIq3STf9HsIVcfSpgBrTVJChrDlJKsxArmzaRHz5c4XWTjqk9NF89YS
 9x7i6IUM
X-Authority-Analysis: v=2.4 cv=HJrDFptv c=1 sm=1 tr=0 ts=68d2c463 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jTHfGQ1UN0Iryk_dgfEA:9

Distinguishing between kernel stacks and userspace stacks was done
based on the action id, even when used outside of action context
(i.e. in aggregation keys).  That is far from ideal.

Encode the stack type along with the nframes and strsize values in
the data record description argument for stack() and ustack()
records.

The macros for managing that argument are moved to dt_impl.h since
they are internal to the DTrace implementation.

All printing of stack traces is now consolidated in dt_printf.c as
well.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/actions_defines.h |   5 -
 libdtrace/dt_cg.c                |   6 +-
 libdtrace/dt_consume.c           | 256 ++---------------------------
 libdtrace/dt_impl.h              |  13 ++
 libdtrace/dt_printf.c            | 266 ++++++++++++++++++++++++++++---
 libdtrace/dt_printf.h            |  12 +-
 6 files changed, 275 insertions(+), 283 deletions(-)

diff --git a/include/dtrace/actions_defines.h b/include/dtrace/actions_defines.h
index 1a9c1a81..7c2f7dda 100644
--- a/include/dtrace/actions_defines.h
+++ b/include/dtrace/actions_defines.h
@@ -156,11 +156,6 @@
 		(uint16_t)(((x) & DTRACE_LLQUANTIZE_FACTORMASK) >> \
 			DTRACE_LLQUANTIZE_FACTORSHIFT)
 
-#define DTRACE_USTACK_NFRAMES(x)	(uint32_t)((x) & UINT32_MAX)
-#define DTRACE_USTACK_STRSIZE(x)	(uint32_t)((x) >> 32)
-#define DTRACE_USTACK_ARG(x, y)		\
-		((((uint64_t)(y)) << 32) | ((x) & UINT32_MAX))
-
 #ifndef _LP64
 # ifndef _LITTLE_ENDIAN
 #  define DTRACE_PTR(type, name)	uint32_t name##pad; type *name
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 1f120e1d..2b81f2e0 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -2701,7 +2701,7 @@ dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
 		strsize = arg1->dn_value;
 	}
 
-	return DTRACE_USTACK_ARG(nframes, strsize);
+	return DTRACE_STACK_ARG(kind == DTRACEACT_USTACK, nframes, strsize);
 }
 
 /*
@@ -2738,7 +2738,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
 	/* Get sizing information from dnp->dn_arg. */
 	arg = dt_cg_stack_arg(dtp, dnp, kind);
 	prefsz = kind == DTRACEACT_USTACK ? sizeof(uint64_t) : 0;
-	nframes = DTRACE_USTACK_NFRAMES(arg);
+	nframes = DTRACE_STACK_NFRAMES(arg);
 	stacksize = nframes * sizeof(uint64_t);
 
 	/* Handle alignment and reserve space in the output buffer. */
@@ -8698,7 +8698,7 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 				case DT_ACT_USTACK:
 					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
 					kind = DTRACEACT_USTACK;
-					size = 8 + 8 * DTRACE_USTACK_NFRAMES(arg);
+					size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
 					break;
 				case DT_ACT_JSTACK:
 					kind = DTRACEACT_JSTACK;
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 280ed42a..eca2139f 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -1079,232 +1079,6 @@ dt_print_tracemem(dtrace_hdl_t *dtp, FILE *fp, const dtrace_recdesc_t *rec,
 	return nconsumed;
 }
 
-int
-dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
-    caddr_t addr, int depth, int size)
-{
-	dtrace_syminfo_t dts;
-	GElf_Sym sym;
-	int i, indent;
-	char c[PATH_MAX * 2];
-	uint64_t pc;
-
-	if (dt_printf(dtp, fp, "\n") < 0)
-		return -1;
-
-	if (format == NULL)
-		format = "%s";
-
-	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
-		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
-	else
-		indent = _dtrace_stkindent;
-
-	for (i = 0; i < depth; i++) {
-		switch (size) {
-		case sizeof(uint32_t):
-			/* LINTED - alignment */
-			pc = *((uint32_t *)addr);
-			break;
-
-		case sizeof(uint64_t):
-			/* LINTED - alignment */
-			pc = *((uint64_t *)addr);
-			break;
-
-		default:
-			return dt_set_errno(dtp, EDT_BADSTACKPC);
-		}
-
-		if (pc == 0)
-			break;
-
-		addr += size;
-
-		if (dt_printf(dtp, fp, "%*s", indent, "") < 0)
-			return -1;
-
-		if (dtrace_lookup_by_addr(dtp, pc, &sym, &dts) == 0) {
-			if (pc > sym.st_value)
-				snprintf(c, sizeof(c), "%s`%s+0x%llx",
-					 dts.object, dts.name,
-					 (long long unsigned)pc - sym.st_value);
-			else
-				snprintf(c, sizeof(c), "%s`%s",
-					 dts.object, dts.name);
-		} else {
-			/*
-			 * We'll repeat the lookup, but this time we'll specify
-			 * a NULL GElf_Sym -- indicating that we're only
-			 * interested in the containing module.
-			 */
-			if (dtrace_lookup_by_addr(dtp, pc, NULL, &dts) == 0)
-				snprintf(c, sizeof(c), "%s`0x%llx",
-					 dts.object, (long long unsigned)pc);
-			else
-				snprintf(c, sizeof(c), "0x%llx",
-				    (long long unsigned)pc);
-		}
-
-		if (dt_printf(dtp, fp, format, c) < 0)
-			return -1;
-
-		if (dt_printf(dtp, fp, "\n") < 0)
-			return -1;
-	}
-
-	return 0;
-}
-
-int
-dt_print_ustack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
-    caddr_t addr, uint64_t arg)
-{
-	/* LINTED - alignment */
-	uint64_t *pc = ((uint64_t *)addr);
-	uint32_t depth = DTRACE_USTACK_NFRAMES(arg);
-	uint32_t strsize = DTRACE_USTACK_STRSIZE(arg);
-	const char *strbase = addr + (depth + 1) * sizeof(uint64_t);
-	const char *str = strsize ? strbase : NULL;
-	int err = 0;
-
-	const char *name;
-	char objname[PATH_MAX], c[PATH_MAX * 2];
-	GElf_Sym sym;
-	int i, indent;
-	pid_t pid = -1, tgid;
-
-	if (depth == 0)
-		return 0;
-
-	tgid = (pid_t)*pc++;
-
-	if (dt_printf(dtp, fp, "\n") < 0)
-		return -1;
-
-	if (format == NULL)
-		format = "%s";
-
-	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
-		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
-	else
-		indent = _dtrace_stkindent;
-
-	/*
-	 * Ultimately, we need to add an entry point in the library vector for
-	 * determining <symbol, offset> from <tgid, address>.  For now, if
-	 * this is a vector open, we just print the raw address or string.
-	 */
-	if (dtp->dt_vector == NULL)
-		pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
-		    DTRACE_PROC_SHORTLIVED);
-
-	for (i = 0; i < depth && pc[i] != 0; i++) {
-		const prmap_t *map;
-
-		if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
-			break;
-		if (dtp->dt_options[DTRACEOPT_NORESOLVE] != DTRACEOPT_UNSET
-		    && pid >= 0) {
-			if (dt_Pobjname(dtp, pid, pc[i], objname,
-			    sizeof(objname)) != NULL) {
-				const prmap_t *pmap = NULL;
-				uint64_t offset = pc[i];
-
-				pmap = dt_Paddr_to_map(dtp, pid, pc[i]);
-
-				if (pmap)
-					offset = pc[i] - pmap->pr_vaddr;
-
-				snprintf(c, sizeof(c), "%s:0x%llx",
-				    dt_basename(objname), (unsigned long long)offset);
-
-			} else
-				snprintf(c, sizeof(c), "0x%llx",
-				    (unsigned long long)pc[i]);
-
-		} else if (pid >= 0 && dt_Plookup_by_addr(dtp, pid, pc[i],
-							  &name, &sym) == 0) {
-			if (dt_Pobjname(dtp, pid, pc[i], objname,
-					sizeof(objname)) != NULL) {
-				if (pc[i] > sym.st_value)
-					snprintf(c, sizeof(c), "%s`%s+0x%llx",
-						 dt_basename(objname), name,
-						 (unsigned long long)(pc[i] - sym.st_value));
-				else
-					snprintf(c, sizeof(c), "%s`%s",
-						 dt_basename(objname), name);
-			} else
-				snprintf(c, sizeof(c), "0x%llx",
-				    (unsigned long long)pc[i]);
-			/* Allocated by Plookup_by_addr. */
-			free((char *)name);
-		} else if (str != NULL && str[0] != '\0' && str[0] != '@' &&
-		    (pid >= 0 &&
-			((map = dt_Paddr_to_map(dtp, pid, pc[i])) == NULL ||
-			    (map->pr_mflags & MA_WRITE)))) {
-			/*
-			 * If the current string pointer in the string table
-			 * does not point to an empty string _and_ the program
-			 * counter falls in a writable region, we'll use the
-			 * string from the string table instead of the raw
-			 * address.  This last condition is necessary because
-			 * some (broken) ustack helpers will return a string
-			 * even for a program counter that they can't
-			 * identify.  If we have a string for a program
-			 * counter that falls in a segment that isn't
-			 * writable, we assume that we have fallen into this
-			 * case and we refuse to use the string.
-			 */
-			snprintf(c, sizeof(c), "%s", str);
-		} else {
-			if (pid >= 0 && dt_Pobjname(dtp, pid, pc[i], objname,
-			    sizeof(objname)) != NULL)
-				snprintf(c, sizeof(c), "%s`0x%llx",
-				    dt_basename(objname), (unsigned long long)pc[i]);
-			else
-				snprintf(c, sizeof(c), "0x%llx",
-				    (unsigned long long)pc[i]);
-		}
-
-		if ((err = dt_printf(dtp, fp, format, c)) < 0)
-			break;
-
-		if ((err = dt_printf(dtp, fp, "\n")) < 0)
-			break;
-
-		if (str != NULL && str[0] == '@') {
-			/*
-			 * If the first character of the string is an "at" sign,
-			 * then the string is inferred to be an annotation --
-			 * and it is printed out beneath the frame and offset
-			 * with brackets.
-			 */
-			if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
-				break;
-
-			snprintf(c, sizeof(c), "  [ %s ]", &str[1]);
-
-			if ((err = dt_printf(dtp, fp, format, c)) < 0)
-				break;
-
-			if ((err = dt_printf(dtp, fp, "\n")) < 0)
-				break;
-		}
-
-		if (str != NULL) {
-			str += strlen(str) + 1;
-			if (str - strbase >= strsize)
-				str = NULL;
-		}
-	}
-
-	if (pid >= 0)
-		dt_proc_release_unlock(dtp, pid);
-
-	return err;
-}
-
 static int
 dt_print_usym(dtrace_hdl_t *dtp, FILE *fp, caddr_t addr, dtrace_actkind_t act)
 {
@@ -1355,7 +1129,7 @@ dt_print_umod(dtrace_hdl_t *dtp, FILE *fp, const char *format, caddr_t addr)
 		format = "  %-50s";
 
 	/*
-	 * See the comment in dt_print_ustack() for the rationale for
+	 * See the comment in dt_print_stack_user() for the rationale for
 	 * printing raw addresses in the vectored case.
 	 */
 	if (dtp->dt_vector == NULL)
@@ -1660,12 +1434,15 @@ dt_print_datum(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
 
 	switch (act) {
 	case DTRACEACT_STACK:
-		return dt_print_stack(dtp, fp, NULL, addr, rec->dtrd_arg,
-				      rec->dtrd_size / rec->dtrd_arg);
+	case DTRACEACT_USTACK: {
+		dtrace_probedata_t	pdat;
 
-	case DTRACEACT_USTACK:
-	case DTRACEACT_JSTACK:
-		return dt_print_ustack(dtp, fp, NULL, addr, rec->dtrd_arg);
+		/* dt_print_stack() uses dtpda_data only */
+		memset(&pdat, 0, sizeof(pdat));
+		pdat.dtpda_data = addr;
+
+		return dt_print_stack(dtp, fp, NULL, &pdat, rec, 1, NULL, 0);
+	}
 
 	case DTRACEACT_USYM:
 	case DTRACEACT_UADDR:
@@ -2467,14 +2244,6 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 			return dt_set_errno(dtp, EDT_BADRVAL);
 
 		switch (act) {
-		case DTRACEACT_STACK: {
-			int depth = rec->dtrd_arg;
-
-			if (dt_print_stack(dtp, fp, NULL, recdata,
-					   depth, rec->dtrd_size / depth) < 0)
-				return -1;
-			continue;
-		}
 		case DTRACEACT_SYM:
 			if (dt_print_sym(dtp, fp, NULL, recdata) < 0)
 				return -1;
@@ -2483,11 +2252,10 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 			if (dt_print_mod(dtp, fp, NULL, recdata) < 0)
 				return -1;
 			continue;
+		case DTRACEACT_STACK:
 		case DTRACEACT_USTACK:
-			if (dt_print_ustack(dtp, fp, NULL,
-					    recdata, rec->dtrd_arg) < 0)
-				return -1;
-			continue;
+			func = dt_print_stack;
+			break;
 		case DTRACEACT_USYM:
 		case DTRACEACT_UADDR:
 			if (dt_print_usym(dtp, fp, recdata, act) < 0)
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 7d8e4432..4dc4c9a7 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -236,6 +236,19 @@ typedef struct dt_tstring {
 	int		in_use;			/* In use (1) or not (0) */
 } dt_tstring_t;
 
+/*
+ * The stack()/ustack() data record argument encodes:
+ *  - the stack type (kernel or userspace)
+ *  - the number of frames in the stack trace
+ *  - the size of the optional string area for ustack()
+ */
+#define DTRACE_STACK_IS_USER(x)		((x) & (1 << 31))
+#define DTRACE_STACK_NFRAMES(x)		(uint32_t)((x) & INT32_MAX)
+#define DTRACE_STACK_STRSIZE(x)		(uint32_t)((x) >> 32)
+#define DTRACE_STACK_ARG(t, x, y)	((((uint64_t)(y)) << 32) | \
+					 ((t) ? (1UL << 31) : 0) | \
+					 ((x) & INT32_MAX))
+
 typedef struct dt_dirpath {
 	dt_list_t dir_list;		/* linked-list forward/back pointers */
 	char *dir_path;			/* directory pathname */
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index 1e01d468..4c276c26 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -374,6 +374,205 @@ pfprint_uaddr(dtrace_hdl_t *dtp, FILE *fp, const char *format,
 	return dt_printf(dtp, fp, format, s);
 }
 
+static int
+dt_print_stack_kernel(dtrace_hdl_t *dtp, FILE *fp, const char *format,
+		      caddr_t addr, int indent, uint32_t depth)
+{
+	dtrace_syminfo_t dts;
+	GElf_Sym sym;
+	int i;
+	char c[PATH_MAX * 2];
+	uint64_t pc;
+
+	if (format == NULL)
+		format = "%s";
+
+	for (i = 0; i < depth; i++) {
+		pc = *((uint64_t *)addr);
+		if (pc == 0)
+			break;
+
+		addr += sizeof(pc);
+
+		if (dt_printf(dtp, fp, "%*s", indent, "") < 0)
+			return -1;
+
+		if (dtrace_lookup_by_addr(dtp, pc, &sym, &dts) == 0) {
+			if (pc > sym.st_value)
+				snprintf(c, sizeof(c), "%s`%s+0x%llx",
+					 dts.object, dts.name,
+					 (long long unsigned)pc - sym.st_value);
+			else
+				snprintf(c, sizeof(c), "%s`%s",
+					 dts.object, dts.name);
+		} else {
+			/*
+			 * We'll repeat the lookup, but this time we'll specify
+			 * a NULL GElf_Sym -- indicating that we're only
+			 * interested in the containing module.
+			 */
+			if (dtrace_lookup_by_addr(dtp, pc, NULL, &dts) == 0)
+				snprintf(c, sizeof(c), "%s`0x%llx",
+					 dts.object, (long long unsigned)pc);
+			else
+				snprintf(c, sizeof(c), "0x%llx",
+				    (long long unsigned)pc);
+		}
+
+		if (dt_printf(dtp, fp, format, c) < 0)
+			return -1;
+
+		if (dt_printf(dtp, fp, "\n") < 0)
+			return -1;
+	}
+
+	return 0;
+}
+
+static int
+dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
+		    caddr_t addr, int indent, uint32_t depth, uint32_t strsize)
+{
+	/* LINTED - alignment */
+	uint64_t *pc = ((uint64_t *)addr);
+	const char *strbase = addr + (depth + 1) * sizeof(uint64_t);
+	const char *str = strsize ? strbase : NULL;
+	int err = 0;
+
+	const char *name;
+	char objname[PATH_MAX], c[PATH_MAX * 2];
+	GElf_Sym sym;
+	int i;
+	pid_t pid = -1, tgid;
+
+	if (depth == 0)
+		return 0;
+
+	tgid = (pid_t)*pc++;
+
+	if (format == NULL)
+		format = "%s";
+
+	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
+		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
+	else
+		indent = _dtrace_stkindent;
+
+	/*
+	 * Ultimately, we need to add an entry point in the library vector for
+	 * determining <symbol, offset> from <tgid, address>.  For now, if
+	 * this is a vector open, we just print the raw address or string.
+	 */
+	if (dtp->dt_vector == NULL)
+		pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
+		    DTRACE_PROC_SHORTLIVED);
+
+	for (i = 0; i < depth && pc[i] != 0; i++) {
+		const prmap_t *map;
+
+		if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
+			break;
+		if (dtp->dt_options[DTRACEOPT_NORESOLVE] != DTRACEOPT_UNSET
+		    && pid >= 0) {
+			if (dt_Pobjname(dtp, pid, pc[i], objname,
+			    sizeof(objname)) != NULL) {
+				const prmap_t *pmap = NULL;
+				uint64_t offset = pc[i];
+
+				pmap = dt_Paddr_to_map(dtp, pid, pc[i]);
+
+				if (pmap)
+					offset = pc[i] - pmap->pr_vaddr;
+
+				snprintf(c, sizeof(c), "%s:0x%llx",
+				    dt_basename(objname), (unsigned long long)offset);
+
+			} else
+				snprintf(c, sizeof(c), "0x%llx",
+				    (unsigned long long)pc[i]);
+
+		} else if (pid >= 0 && dt_Plookup_by_addr(dtp, pid, pc[i],
+							  &name, &sym) == 0) {
+			if (dt_Pobjname(dtp, pid, pc[i], objname,
+					sizeof(objname)) != NULL) {
+				if (pc[i] > sym.st_value)
+					snprintf(c, sizeof(c), "%s`%s+0x%llx",
+						 dt_basename(objname), name,
+						 (unsigned long long)(pc[i] - sym.st_value));
+				else
+					snprintf(c, sizeof(c), "%s`%s",
+						 dt_basename(objname), name);
+			} else
+				snprintf(c, sizeof(c), "0x%llx",
+				    (unsigned long long)pc[i]);
+			/* Allocated by Plookup_by_addr. */
+			free((char *)name);
+		} else if (str != NULL && str[0] != '\0' && str[0] != '@' &&
+		    (pid >= 0 &&
+			((map = dt_Paddr_to_map(dtp, pid, pc[i])) == NULL ||
+			    (map->pr_mflags & MA_WRITE)))) {
+			/*
+			 * If the current string pointer in the string table
+			 * does not point to an empty string _and_ the program
+			 * counter falls in a writable region, we'll use the
+			 * string from the string table instead of the raw
+			 * address.  This last condition is necessary because
+			 * some (broken) ustack helpers will return a string
+			 * even for a program counter that they can't
+			 * identify.  If we have a string for a program
+			 * counter that falls in a segment that isn't
+			 * writable, we assume that we have fallen into this
+			 * case and we refuse to use the string.
+			 */
+			snprintf(c, sizeof(c), "%s", str);
+		} else {
+			if (pid >= 0 && dt_Pobjname(dtp, pid, pc[i], objname,
+			    sizeof(objname)) != NULL)
+				snprintf(c, sizeof(c), "%s`0x%llx",
+				    dt_basename(objname), (unsigned long long)pc[i]);
+			else
+				snprintf(c, sizeof(c), "0x%llx",
+				    (unsigned long long)pc[i]);
+		}
+
+		if ((err = dt_printf(dtp, fp, format, c)) < 0)
+			break;
+
+		if ((err = dt_printf(dtp, fp, "\n")) < 0)
+			break;
+
+		if (str != NULL && str[0] == '@') {
+			/*
+			 * If the first character of the string is an "at" sign,
+			 * then the string is inferred to be an annotation --
+			 * and it is printed out beneath the frame and offset
+			 * with brackets.
+			 */
+			if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
+				break;
+
+			snprintf(c, sizeof(c), "  [ %s ]", &str[1]);
+
+			if ((err = dt_printf(dtp, fp, format, c)) < 0)
+				break;
+
+			if ((err = dt_printf(dtp, fp, "\n")) < 0)
+				break;
+		}
+
+		if (str != NULL) {
+			str += strlen(str) + 1;
+			if (str - strbase >= strsize)
+				str = NULL;
+		}
+	}
+
+	if (pid >= 0)
+		dt_proc_release_unlock(dtp, pid);
+
+	return err;
+}
+
 /*ARGSUSED*/
 static int
 pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
@@ -381,19 +580,20 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
 	      uint64_t normal, uint64_t sig)
 {
 	int width;
-	dtrace_optval_t saved = dtp->dt_options[DTRACEOPT_STACKINDENT];
 	const dtrace_recdesc_t *rec = pfd->pfd_rec;
 	caddr_t addr = (caddr_t)vaddr;
+	uint32_t depth = DTRACE_STACK_NFRAMES(rec->dtrd_arg);
 	int err = 0;
 
+	if (depth == 0)
+		return 0;
+
 	/*
-	 * We have stashed the value of the STACKINDENT option, and we will
-	 * now override it for the purposes of formatting the stack.  If the
-	 * field has been specified as left-aligned (i.e. (%-#), we set the
-	 * indentation to be the width.  This is a slightly odd semantic, but
-	 * it's useful functionality -- and it's slightly odd to begin with to
-	 * be using a single format specifier to be formatting multiple lines
-	 * of text...
+	 * If the field has been specified as left-aligned (i.e. (%-#), we use
+	 * the field width as indentation.  This is a slightly odd semantic
+	 * but it's useful functionality -- and it's slightly odd to begin with
+	 * to be using a single format specifier to be formatting multiple
+	 * lines of text...
 	 */
 	if (pfd->pfd_dynwidth < 0) {
 		assert(pfd->pfd_flags & DT_PFCONV_DYNWIDTH);
@@ -404,24 +604,14 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
 		width = 0;
 	}
 
-	dtp->dt_options[DTRACEOPT_STACKINDENT] = width;
-
-	switch (rec->dtrd_action) {
-	case DTRACEACT_USTACK:
-	case DTRACEACT_JSTACK:
-		err = dt_print_ustack(dtp, fp, format, addr, rec->dtrd_arg);
-		break;
-
-	case DTRACEACT_STACK:
-		err = dt_print_stack(dtp, fp, format, addr, rec->dtrd_arg,
-		    rec->dtrd_size / rec->dtrd_arg);
-		break;
-
-	default:
-		assert(0);
-	}
+	if (dt_printf(dtp, fp, "\n") < 0)
+		return -1;
 
-	dtp->dt_options[DTRACEOPT_STACKINDENT] = saved;
+	if (DTRACE_STACK_IS_USER(rec->dtrd_arg))
+		err = dt_print_stack_user(dtp, fp, format, addr, width, depth,
+					  DTRACE_STACK_STRSIZE(rec->dtrd_arg));
+	else
+		err = dt_print_stack_kernel(dtp, fp, format, addr, width, depth);
 
 	return err;
 }
@@ -2287,3 +2477,29 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
 
 	return 2;
 }
+
+int
+dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
+	       const dtrace_probedata_t *data, const dtrace_recdesc_t *recs,
+	        uint_t nrecs, const void *buf, size_t len)
+{
+	const char	*format;
+	dt_pfargd_t	pfd;
+
+	if (fmtdata == NULL)
+		format = "%s";
+	else
+		format = ((dt_pfargv_t *)fmtdata)->pfv_format;
+
+	/* pfprint_stack() uses pfd_rec, pfd_flags, and pfd_width only */
+	memset(&pfd, 0, sizeof(pfd));
+	pfd.pfd_rec = recs;
+	pfd.pfd_flags = DT_PFCONV_LEFT;
+
+	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
+		pfd.pfd_width = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
+	else
+		pfd.pfd_width = _dtrace_stkindent;
+
+	return pfprint_stack(dtp, fp, format, &pfd, data->dtpda_data, 0, 0, 0);
+}
diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
index f08e48eb..7a1d0dda 100644
--- a/libdtrace/dt_printf.h
+++ b/libdtrace/dt_printf.h
@@ -102,16 +102,16 @@ extern void dt_printf_validate(dt_pfargv_t *, uint_t,
 
 extern void dt_printa_validate(struct dt_node *, struct dt_node *);
 
-extern int dt_print_stack(dtrace_hdl_t *, FILE *,
-    const char *, caddr_t, int, int);
-extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
-    const char *, caddr_t, uint64_t);
 extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
 extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
 extern int dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
 			 const dtrace_probedata_t *data,
-			 const dtrace_recdesc_t *recs,
-			 uint_t nrecs, const void *buf, size_t len);
+			 const dtrace_recdesc_t *recs, uint_t nrecs,
+			 const void *buf, size_t len);
+extern int dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
+			  const dtrace_probedata_t *data,
+			  const dtrace_recdesc_t *recs, uint_t nrecs,
+			  const void *buf, size_t len);
 
 #ifdef	__cplusplus
 }
-- 
2.43.5

