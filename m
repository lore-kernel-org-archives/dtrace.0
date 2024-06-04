Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86B114BF8F
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 21:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717537122; cv=fail; b=l+uHMrbOxMLhBLuTUh99w5w0UTXJkN6xMMa95egpz30dBlDXNkwV0tfuNgAjkjpya1QeTuPvkBlEYUFm0EqBKdGGnM8AVu3fio4JiJvW0ICTBOcUO6soQ684b4NWl6dO+4v+EduUAeDfWotiLFOfqlTkGfxF4yuf3q8sgNl8tro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717537122; c=relaxed/simple;
	bh=fvC83IbvhDnHPbboV3i9gaZDtZZ3JNW9Uf0jDMwbK1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q6sMEC7rJJOnbUP4Q0NfVuvOz6uMmNcumEeMtSQqaRCzNhsyPnTaKvKwa4yMk9eaIn+rIgsdDP57I/cNXvuncFNXw5PbeXD0e1rIG/xUQV1I5SFOjtrmHMqFJavg9TSMfgAeF+yYFzfB3Z8Xvq0KSZmaemsTRXmCn1CoWJFyNSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454J0v6Z026488
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 21:38:40 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcc:content-type:date:from:in-reply-to:message-id:mime-versio?=
 =?UTF-8?Q?n:references:subject:to;_s=3Dcorp-2023-11-20;_bh=3DKKIMlZ5Ymdhi?=
 =?UTF-8?Q?bBZLnRTb3J+CWR2g2kQfMWhpKqPIARo=3D;_b=3DPmois/B0C6WVVAiUYfNPdcX?=
 =?UTF-8?Q?jSPQV8yt+c9T+AyXFCIvl1LGu3tHWfSIc7lThZ+Fpg3rE_I6eiSWKzsB0zXmtJT?=
 =?UTF-8?Q?0B8s8Z9kBpAyNkTBUHx82zCtDOXLVtfShX34MIzOltvbVtdjnwi_+G4FcL1E5Ct?=
 =?UTF-8?Q?0DS0N+OXITPzIeQhim9Vu7aZo05/23ZzwGqeVR5ed0XpiEmvfZtv1xk4S_dyz7g?=
 =?UTF-8?Q?qc+TPEAqFZWcvVgThA/aaCOqMkTXWhWJyCYrrTmjQsD41I4v5q0KJ63+gK05K4E?=
 =?UTF-8?Q?_IdERGSaMZINCuZ7fi5mHbwe6qW3HqI5yfaT8/1jBZJOPyVUUM4L4cO2BDXUG2M?=
 =?UTF-8?Q?ltG1ta_0w=3D=3D_?=
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv07x021-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 21:38:39 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454L13Tu016185
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 21:38:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrsaptsq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 21:38:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d59XI1E1DKEiCeEB4L1sNkX6tcdn5T2cr7mSw7BvGtkTqiqkZnfJx0/2vQeDSCb3tppjNXjPkNo/NvlCcVtlmM9pVdYjKu8gj3JBQ3Ny1dZ7zaB9motRI+ivFrkCD8MxmN9PYaWwcA6yqUphRLaJVshH4k3ml+z1FMBWxzo0muimv4pXm8Ib99uxEiunW853pGCdHc2FjqQdWNJb787Tz+UTEiHmTseah3O5LyNTTrQ15Omep+KBufo4poqM6Noj7kKUb1UE8yLDvAS9EYt25sFRDIsV3vp8naTyL1s+jP4oRWyuNaoQLttuH/aRsdVRiImRpjRJEJv3fOYcXosK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKIMlZ5YmdhibBZLnRTb3J+CWR2g2kQfMWhpKqPIARo=;
 b=XKjrj7WCaj9mzFmdo2XXbV/6sC7wOm/6M+BwFKt1AEcx0Wb9Hth8S3f6ZsOC/IKaoPGUZgeUoyYGUfEvVY4eMBsT8PtEeBeTTYxEC1n1VdIGEIO/gWC/4IeC1LxTHVfSnA5vb8cWr4PAGhoA9tuium6NxKSyzJLCi0sLxfEOHbVGkZYNHZJyH0z3c9wfFfHoab6qG9q71D7uur1iRRxjucxqfOtWvx1Ce6CrTVPqTGSjKyVlJacw0786w8bP6X5k4QJEqLn/ac3fYANFmiLuUeKXhaBurC+6k7Pt/YaGlue0jnytjFVUOAYtrLZAbVjU9SERowWbox57ZGhY5Lbe7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKIMlZ5YmdhibBZLnRTb3J+CWR2g2kQfMWhpKqPIARo=;
 b=CKNHGzNaGcTxIcB6/kDQq8BjvmelFVQmhuhdJc6CKzubbK9hSYD+PJmuAxAdETUsinP3p1XAqEqQfCi/QyEV/9yiprExVqQTVfJjJrCU74TGVrUFvcENUaHkPJNokLqsbOpz4Yem7Sc9Y2AbIM7/kwm2Eb4ksNiArWZ5JlKUnA0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB7087.namprd10.prod.outlook.com (2603:10b6:510:27f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 21:38:20 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 21:38:20 +0000
Date: Tue, 4 Jun 2024 17:38:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 05/14] Add a hook for a provider-specific
 "update" function
Message-ID: <Zl+JSX3bKMb+QLdP@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
 <20240604181113.11505-6-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604181113.11505-6-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR01CA0066.prod.exchangelabs.com (2603:10b6:208:23f::35)
 To SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed48449-912d-4e5d-3ede-08dc84dea704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4hI0v/HTIwqc0sneBdPH/1H5t+DsUdI6bO1VdK5Y3pc/mCcG4yCD74mzvOxZ?=
 =?us-ascii?Q?bvHYmN8/VXtLwK0mtUfI5ckgHKYvVp7YRtw//9quyHAluEamfgOjTCBkZm4y?=
 =?us-ascii?Q?1joiitjnggV6F6G2WnjPcg9cWzTcNEKEsM0o4JlFM2+tKFP2bow3oJPq3Kb0?=
 =?us-ascii?Q?pwJb74mX+ToDhHzodWOezwVKRz7VUS6t9d/a1aT7Q3X3diwK5rFKP3paGEOF?=
 =?us-ascii?Q?jaiHBQoPz0Zym093zECTnyPk4BimTIHU8HWnei29gfl08RVPJiWK0rZz2PLe?=
 =?us-ascii?Q?euDojcG9xQ5+qp0a6eaPzGAqT3YvUk0lfqhyyVsAXWkjxuAbNvCFlGVmtkBa?=
 =?us-ascii?Q?r5Mn0acJBumu8fn3NWxJ09F/VvyYsxcvBT4ANznrdTzrQ5X8I3uczhpZL9KT?=
 =?us-ascii?Q?wVEvTGXV4TTBwIL2oFnk7DkWaIM7Lj7KDZwdLYzUmsKN0gRZynWXfUOFywLD?=
 =?us-ascii?Q?Qpe2BnViTiuSxDHlYIbdRoGl+XpGzl5Rq1OF8k/buYa0hZQWU7/gMcS4yq0b?=
 =?us-ascii?Q?hLYeimElqDtXgmvZ1yPXhL9F+0W4spC7u2W9HlgZkyUkMu7oZH1Qz48+Bu14?=
 =?us-ascii?Q?6TGfi82hPx51yjweTO50G+wSHT6ittEkhT5slTaWVo/+HrrK6/Pon9tavJ1O?=
 =?us-ascii?Q?yfE9NzdfYfhE/Qpan0cfFlU6gNzTWFIzZ+FPAQ5dBmQYv2qJTPS3GRop60iE?=
 =?us-ascii?Q?jqT99R7HKPM33QF224qXT1N6+hJ5BclwRymyK24Kf2RM1l2QCp3Qp9nXiiFK?=
 =?us-ascii?Q?3jetWjdqV0l6gs20+LzyLboMp6wHFB+yBHwiRf9unsOEbBSLeQppctdH2c17?=
 =?us-ascii?Q?dbIAzmu1AX/UaXQL7bn1voAcOKxM1TrYDwKnXLv45jdOfT5FDwX3VRSkORdk?=
 =?us-ascii?Q?E/8KEuPqBm5ZOYkWZmbm9Iccj7PlL8FCnXg8fBM6iOct+gkE+/AqTwlOeX+7?=
 =?us-ascii?Q?Hox2/nEEQHmk8Azax/ZTawyFmd/A9TBEqxaeXYBkhgh9CGXFMZ07mbOu7ciS?=
 =?us-ascii?Q?UiBgHgK0ePXyKxub0A3t1WK5EZE/fm5neEza5cD0yWr8iLBlv9r+T3gE0r0r?=
 =?us-ascii?Q?9+KuVhwm0Dhm2metLdluvSBcTv1aDeI/F2sfcRsV9KKSVzf7DOfVgMfUJnwD?=
 =?us-ascii?Q?4zRTjYclaF9ZwKRkmmHDm4KrCf5w4Qo0GVUR26WdgrlAtANXjJIPNpJodLn/?=
 =?us-ascii?Q?wcM8xYnNldMB3yL5vintIEAkt7/Wi7bMCQSWihRdWgxz8R7HIpbtHNhJT3Zt?=
 =?us-ascii?Q?X4tA+JzALLrDHjaH2MR3wa9xu1xvv8z5rzrks3uguaur/oDuLdDSVrwgpsNw?=
 =?us-ascii?Q?6LVjwqle+inA0e7/IVY7Fz4f?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T4ZXlxiQlp0ybSgsGaodRcYqzqip5uTxFxP8fJ6rNlrih2riY3+8pMVDEXwl?=
 =?us-ascii?Q?IYDUoEuaOL8/p7sh4JlaBI8kFHFUmncz3DBCSCX3JUWzEGKg03MaEYseALju?=
 =?us-ascii?Q?HBehYZJ0myjoMw95nbCr6q9vEKbVMsKFGZs02L+vhkqRXqzNp9J0O8irDL0x?=
 =?us-ascii?Q?rEPMGPMgYJygAt54raAwfoflTnUTXEcTkKZnVNy6IBAD7ASqzi5VgvVqbYZD?=
 =?us-ascii?Q?TtH9cYzYf0vyhvopC4E5CHGJt5wEJL/ylvk5ftKpp5f5IT7gX3etXX76M9p1?=
 =?us-ascii?Q?XjxvA/617vP6zmUXSVZjQB++8KxeWEexdjTngEba/FIuWLYR66iE2JSTl4ai?=
 =?us-ascii?Q?K1AQqBB8rgLhWQTSilYGufhZNMPD8+rWpaQpDngdIy4GPl+Qcko3Id/bPrx7?=
 =?us-ascii?Q?lE1jFmo6nQGng1HBren3ScltdrA8L5rmWVdqtteTRef8HA+vnoBoI1ubZYOn?=
 =?us-ascii?Q?i/Md1PdVR7epYW7d7AnwBuUJxd0wJuT3fS2wxlaBIxLL2o+ScGi+78Y/4jBw?=
 =?us-ascii?Q?VU0VEOca21fTDUTQXZCB521I7fqQ8rD6BfnnW3DXFK2p7WkzCEoeeetbRNz/?=
 =?us-ascii?Q?mCQDUbZHSjYHmp9kUYwf2+N5QVBm6QuUx9bw+JVodLKxH8LGFHCbCim/zcwI?=
 =?us-ascii?Q?CNjmydAwcJnupdafmAIBFKqM9GPhtz1IlGxe6NnYVs1olPQKafSOzgqREdoC?=
 =?us-ascii?Q?I9acjnBwBbkSJzaZ61fssNwRxuFqa7ToXoBRV1HB1ArjgiZjqeXDTFwFCUli?=
 =?us-ascii?Q?yLRZ4dMmgtfHYLYOGI1gCkc23czaIs3s+vBqAavexjKZPZoWn8NAQoLP1prE?=
 =?us-ascii?Q?Ib+VyAA5mN9RHPTdQNbvyWx2nzAR+E7qVbuICxX3Fg8s2aGJdpN6djoUrvrh?=
 =?us-ascii?Q?GL0UsN3rSXO1w2SeXDqBMA258O2aC+PYogBj8vnkMQo6EEqxc+dStA9TrM4B?=
 =?us-ascii?Q?vay6X1CjWMM30pIpxpN1METLPjvRCUfeAhzq8uIHKVo8OUXN9zi75Kgt/rp0?=
 =?us-ascii?Q?rATi2KxSHSUic0rW28zHnTnW8gQbPGEzvLQajeCQs4OmbAK0mhYVStqv5FRq?=
 =?us-ascii?Q?WwLUuFjBxLBBCJ2m+ZrqkXd+1d7KaVoOnTpcjkWbB9sAXM3NwiZ2MkXfIbPv?=
 =?us-ascii?Q?3lbba765VDHEnwtcLmCAGki1L84zYPgFRekGg1CIXBOHtmRfHUEKJl8SFEQC?=
 =?us-ascii?Q?fGgwsq3zgg2gjRb5kea0RrJU6QJ+DSMZkfxpV7z9qsIUX1GSqim+bpCY2AIP?=
 =?us-ascii?Q?L1NzBTQB/ADuBvYZjscNgxjGigNso7MCc1foejUYg6eTyr+WZW+p1qHOWGu2?=
 =?us-ascii?Q?0ujuVt51UO5vKNFkyfo4iK+wBxO6X1aEMjMRTqBP8jgl7CfsyEGtS4AX7t6a?=
 =?us-ascii?Q?M/tjXtKBcIgzWZ079AsDc/ZDbyS+suSx83URwIbQabW60JxHOqBCOCX7nhJ2?=
 =?us-ascii?Q?bwnDnpCHNCk0M37WLxQDZhaj89+36NC/Mhle8YrkSyemq66RTW1Tj2k0JjL7?=
 =?us-ascii?Q?CKG3bn4KTWuCtwSNs3D68TMVDalyyUYh+HhmLjCZWbuG74BrjRedEoLw0IEN?=
 =?us-ascii?Q?F1DTMwBwmG2/v+TWZ7yGceomNHnFbpYc+qeuYoejGAYYOuUjMsaMDHTCjZLk?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bei6wpAcwZX+IqNYkpOm1tjrQafzkDenklNxF4BS7DO9hV3GOy8qfW6bDEHLysr6HUKV4eBpS2Eri7tSlmCxbpLnbK5Qlb8TMdzQ/P3mev2ZtA8cNiMYEcFY8i8B5iMOI8oj5ATypJ/8frximB6iQamf7Z3OvWN6wV5lRtPC/rXdEZD71hcAXECg4otJTuFjO4+zGBN0UDUB6GDuwazJNNJ2ggK98/LCw0D/rqGxZ637Ee3AJVmIsqPOOLrX+vRi5j7fYWhFbdzTthN/ouNpr6NxOPlf83m7b1qZRzWiTtqJufQDw/XKy4w/RdIss6niNXKVoDHNhRxh16rbo6SErmxrnubYHo9s6KI9wgLyp2aCvFjqRu16AwPMTWq8AeDtWLIv2+ewP/D/hSGpV3NJe35Wk5I4+2Y2Vlbt39WpGnfXmZ6tuW8OyXdhZ6S1XXG3edEZ8voxZxYMiKRCazMjlkovvtTbu8kFeKBpwEWld7eHMCdr9QWVoB9QwkPvsfW/zX1Cr8lpq1sZFDFh+LsyppWFeft7HmjjCaEBV95HFhoD0cEO3yImB+hsnUmK2mSCaiQa87Eodxx3NZwu2SoXCwXXJFqnBu1b9T74nU+d/o8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed48449-912d-4e5d-3ede-08dc84dea704
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 21:38:20.0563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avJ9iR38sP3KC4xHqzOtJc3QrYD99tVEBhV8Ays1SbsW/vpJ4rC1ex4dZoXjv67Kr4Lb1i96uGKpKEaRuidpqToIaQJI0AMQsS+j4xDs35Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7087
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040175
X-Proofpoint-GUID: GlWXrBGVCj95J11BFK94FTdQX0tlmion
X-Proofpoint-ORIG-GUID: GlWXrBGVCj95J11BFK94FTdQX0tlmion

Much like the previous patch not considering the generic nature of retained
enablings, this one should be part of that design also.  The functionality
we need to handle match-after-start probe specifications really should be
independent from any specific provider.  It may (well, almost certainly will)
require a hook in providers that need to do special handling.  But that would
be a specific hook for a specific purpose - not just an 'update' hook.

On Tue, Jun 04, 2024 at 02:11:04PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> For up-coming USDT-probe support, we need to update a BPF map
> -- at least when the dtrace session starts but possibly also later
> to support systemwide USDT tracing for processes that may start up
> later.
> 
> One way to do this is with a USDT-specific update function.
> 
> For now, let's add a hook for providers to have provider-specific
> update functions.  User space can either call
> 
>     for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
>         if (dt_providers[i]->update)
>             dt_providers[i]->update(...);
>     }
> 
> any time it likes.  Or it can call dt_usdt.update(...).
> 
> This is for WIP.  A different approach can be adopted later instead.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_provider.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 17b1844c..21ff15ad 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -68,6 +68,8 @@ typedef struct dt_provimpl {
>  			      void *datap);
>  	void (*destroy)(dtrace_hdl_t *dtp,	/* free provider data */
>  			      void *datap);
> +	void (*update)(dtrace_hdl_t *dtp,	/* update provider-specific info */
> +			      void *datap);
>  } dt_provimpl_t;
>  
>  /* list dt_dtrace first */
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
