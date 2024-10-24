Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4851F1E7660
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729783118; cv=fail; b=Zw3RxRTvTjuLYqV/sVUIvr2Y2P0/zz+cuhlm4q902Tp3dsCsd9wyRMHUM69G/Is/VLco0sWY/s5xXCnw+GpYQIHx1Sn7kQGM5R/F4nr+bluB+vwmFpX7LYAdv5dD7/P8OjwrJjR1XgyF+mZqTWj4ZLplrGKSNS3tdGCqm0VrZ+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729783118; c=relaxed/simple;
	bh=CH7YKGl0jT0dkNGJw0FankXkUbiC3QvX8ZBKP8Cpe8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ICzjLXwKAzGdDWf86uxjnKf8D10mO24wNsx+lncxkd2UXh39N9qF5/KITdxE0WiQ+buQRUBDhYXBg869omaZjnQaxw3mWktAOnYBHx5hTOAxobFl910N7p5YLmqDDnvsH2jHD/uYt+G2X6RxEBgwU829X4CiPKOtCf4dfD8Q56M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U2xCZ9Jw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MpRF0Uwy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U2xCZ9Jw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MpRF0Uwy"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OC1iq4005235
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 15:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=1LVelzoCsZYDP2/sK0
	EjHdAlpUKZ7I1W0hyzOCRzix4=; b=U2xCZ9Jwi8zVzC6e7ciIaNF1q1wR4B1Pg+
	STgCjeGfLe9pdpe16EuA6bluQyOxSaOpcLKxhf68tbLaWxU8DDi0MZevkMk/rsP+
	apzaNzKITfLc+LHZYCUFK7iEhDfitiGhLodKPrmorU5/iwbH6WOnaaG/2eSo83AV
	ztti23Gf1lrjB79JD9u/urJuHgSGx4cpr80hR8n5GuSqguC5u7loVSBqG3z2nmK1
	GSbO2leCcuOIhbXGCErY5/Hqz7+gHWPT9D42ZXq1uY5gqTQj5cSTnVC8C8NRymOC
	ElKF3Cz6BbKRCbeEikOPdmG1DOCeRmNEqU846s2RmsdmpqrpT+MQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5asjwc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 15:18:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OE19Rt035996
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 15:18:33 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh43sb0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 15:18:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFfs79WMaKnyM1G1XUHFhxwlt1sExk6ASolWpWVUaQK7mKH/XssKJMaC3iRNzXVZ2i46t9JHqZTbRnyXirBJN3F0dVoouc/Lj5COUEqKGWvuPg5I8IgHDCcBg8M4J7rkKFPPt81H7twZjO6ThirvgzDB5vODXuoRskPDQGlYZKm3LUQhvxTuje/fvcElyxyfCR1LQOSt5Hg+Fx6zKJn4j28j6wWhlD5Ccr+ZpJc9Z5XP7c1qc3zSb0iARVhBnuOoOmsB6XnUk0XGUGSDP/09rX+CJYM14+nclUqRx7Kjg6/yn+MctCN1R6pgcQ9LJMWhFdXPoo1Xkgk7fwyig7Z06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LVelzoCsZYDP2/sK0EjHdAlpUKZ7I1W0hyzOCRzix4=;
 b=weH40Vu8S2K0IsFRxhqZ2l+OA8+KSMvEEzgh0de8cME2I3AxIeegPUMUC4bJ2523J+5o77ywfKTIFXz8vs9w719gXIdZ+hNtw9Tal1DpOvXpmzGuaJvqZnB89CLInYUG+086iLGKxGO8n1WO7+t03KQJP7UgKlqa5wmMvvVyfYQDSwsTUbW5XisROWddyj8aybjtK9e/lqBVG6PORUAv0jvY7eT5KrGa5VCbqsT8tFNe+HQUPNRSyWRW0s/oEt5msqSmX0Fm3feDpFVmJn05wuN1uKbv906Do2zshnNfE+F8n0E8jvIa+KWITsnsM5NeO2CHnv8TGuX3k4crjPYYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LVelzoCsZYDP2/sK0EjHdAlpUKZ7I1W0hyzOCRzix4=;
 b=MpRF0UwylWgfwIVmR8puk79pAUaXO7UyttJ9uLWvj2ggvtlg5R3HsmKRxuh/tLH41vWuzy1iwQdR4JoTdL/uOKC8f+d9voYTQa0bDKX93u4kB5B24jDLAUjZnKydMEhpdsvnrjL9K3PLaW6fhlvtPztRykA9THohBpCm+dg3NaY=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH7PR10MB6312.namprd10.prod.outlook.com (2603:10b6:510:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 15:18:29 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 15:18:29 +0000
Date: Thu, 24 Oct 2024 11:18:23 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 10/19] Remove the is-enabled provider
Message-ID: <ZxplP0zFxvZlzVNg@kvh-deb-bpf.us.oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-10-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052558.3525-10-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P123CA0421.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::12) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH7PR10MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fff043f-7321-473e-74ae-08dcf43f1d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I89tKyyRPBFLbSQmsk0Alode40ZlIc0RzfYZquMiWh+4xwXcP1v6zfvQxjfo?=
 =?us-ascii?Q?oPzQLOWgWz7NWhq6mI+bQ6UgbbXr4EBknRooCyO0U25yDn9TpL9U2PsPH0jP?=
 =?us-ascii?Q?GQFgQea/hsgLHdKcch42OExZNTK5ligVl2QrVFc4etV07218+UpQiZDqJI5G?=
 =?us-ascii?Q?ngAnD1x0pwn9VWRtiXjpGh1HlFwjwcFdwp4B0+MuUFEfE3xr8QOc0NxtiARf?=
 =?us-ascii?Q?EuM66PCMV+iA7rHf6s2urGpsLH7VNBs2G0wK7+wVP205GiOf5VQWcpkMTKkQ?=
 =?us-ascii?Q?i+eG/6kYhRbr5ezuu6vQHyvKpCQtAqirVUqv1B1mqBmqUB7/zmvUldzN7418?=
 =?us-ascii?Q?LkwUbfBjK6Fj7xemxqjEx/3wN9HoPPOiMz0sU0ztmUHGvyUMARxotlxQRqUz?=
 =?us-ascii?Q?aFfTC48qBgMtWsTQ8uJrmGVXWz/I7KESh5m2Dc9yTWrqUk4ReLRd/IiX6tmB?=
 =?us-ascii?Q?Fxc9yZ/jsn1OOhjcRunIm/dZMxGyFhEU17bE7VhvKRaRin/N3JMcIQRqo5pt?=
 =?us-ascii?Q?hPeGtUlceMGJPLoracLbHecd1Iqxn7Z2h6aEJcBwRTH2KXuE5Tat7oBOeI/x?=
 =?us-ascii?Q?9G0i67gePHY/n3rOUZeOLNd827fr73nL9RbF89nNO2vnEbIpZvhLq3Pxyznh?=
 =?us-ascii?Q?XCYSw5Gl6FOYYb7xtcIVxN/gJCiXCYRVjMhtWjavgTsrzaRsYPxjijgPKx1e?=
 =?us-ascii?Q?0ZQNYFwDYfnWl6bgbv6pSjMaeZ6mlh59RWXADYZ2CIaHTyJcWO3T2ajc3Mb2?=
 =?us-ascii?Q?kpbOeyCbN2+aB4W6qIM5M88QmzEiod9WpYqSGTcmhRe60a0Iz8xzHvff4VNr?=
 =?us-ascii?Q?LBh2TGVUwuRH4H04drE5/IceLtlcic/8AzM0lGxq/wZwASo86F6fg8XQE/xU?=
 =?us-ascii?Q?Yxj6ua/gQUjasAVQVdAEErCTGGNiw+MfTyQGc8nkKStBvm1EzEWKXeEoFKhT?=
 =?us-ascii?Q?f56u3YM9jOfOX6wIMypZ4ZTTEoMhkEr0KdE4PU4ISOGBTFEd1kAdlqQgT1+l?=
 =?us-ascii?Q?edw0QtvaMVuDiqyBx/CKazOqeyFRx0SYciNpjVPq3Itrw4jE0ZtYsKPp5c6k?=
 =?us-ascii?Q?kQC4HOYEC4qSE59L+CyQlB8HsVnHl9SZZfLsB+25OKgkR07Tw+V5SCsKVqsQ?=
 =?us-ascii?Q?GvdENKm9EK3hbpn2dK3ubqwEQbbSqZAa3+OhaYzHrfnD9WTXbjfSnAT75XDw?=
 =?us-ascii?Q?9U7J7vV0D8/9a5FY+D6djZmY7ZwJArJz7UyplUojEFXFm/jPsyW1ZGSgozLD?=
 =?us-ascii?Q?08a3SpDAcoMiX0PudbPUdpV32HA0pFHYsyguyLLlX/eywU5Ch7/guRkv3tpb?=
 =?us-ascii?Q?U6hy9zBJEpYds7KcZPhsafox?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+wkc4E9zpeE6rQUmioEFok1FOMEUFPmiZj1lHHZqmsVzfg6qKM2g/hESbOSV?=
 =?us-ascii?Q?dLo6EIhyahjjn2CZ4c0hD6BQ6KOCF8+qqA0up/Yvc8z82xvLQ0CGD7G69x2u?=
 =?us-ascii?Q?YGKn4zSkzn2gfF8hs+D5vpYrEo5c6zjAqcWwntXd0WNrPBzJ/GYX30ZtvEti?=
 =?us-ascii?Q?k6enGRAEo/Ob2Jh5mE+DV1+FW1t9Qi6gs+deiIa+XtDcOCzFwVtJD+3Hq5E1?=
 =?us-ascii?Q?znYxg2tSSgTsALa7h/CI4ytmR8vyvA4uH9FY0Mm9COOxVpbHbKxAxvjyxMPZ?=
 =?us-ascii?Q?18DetAO9lQxGfUcEOEjgWg4PIOwIN34XVYIGxyF8HkwqoQJYuGCjAzBlO0jm?=
 =?us-ascii?Q?3R8uOchxY2DrOja8qSrMnKdSen9zNKLOW2/ZIMJPQnmCJkXuPfjToZowgyKH?=
 =?us-ascii?Q?dKm6o+77YZuqF8r1vGMRBbdmuFati+J5UYgoVTsjq+tqjgPzdnf5LOkN+E+j?=
 =?us-ascii?Q?VD4xy5pENaKUL7KPxJylcniuehAnkUEC7lO+tklzTlbu0JKeBmzyd8Ptin9J?=
 =?us-ascii?Q?GQTeUqUcXD0OBJF/a8iNhDcuXa37uWeRO8q7dAaEl2rvXy98/NEVyiGPQGvx?=
 =?us-ascii?Q?+SptzLlJXo9PhviiDjlulJU6ARVAZ7Jq3ToGLbgF26DG/vkeLJkIoWRDCNa5?=
 =?us-ascii?Q?4AG8tQMkGwVQVftYaI+US0bJwS1gZXLm3tlXf2KVLeYGulaG9AiJA/IGroWZ?=
 =?us-ascii?Q?53vldl0BiDpoahXYnWwaniMxYVI/nfrPn+Rtd0ibFYG9zBwFgT8Ux2BAumCR?=
 =?us-ascii?Q?ANcnFGYtqxeqFwWuQWN7KzDry4ROqlzsJm5PrUT/XnBaV2K1Rfg+7sQz8efg?=
 =?us-ascii?Q?QcizjSGzCVEkROKeJ7w/fDPR21+aL9qQUM/ffRz6rhA5U1zG2G7J9U0PmMia?=
 =?us-ascii?Q?xTpfhfk35a6toLJs7BrkKw5dZPTOnFT7d56MVo24W8WOKsTAn76LzR1OeMpw?=
 =?us-ascii?Q?IeOjKUmyRjNyX2bJ7BQsiUyc1RhA7Fyeg7QZU6IL4Y40inD3VTyTjRZmlXGq?=
 =?us-ascii?Q?HxGD6mPFQ3xXSQ3WEIw0uib2+cq3VABD+FxQQVejp5lUNJgJJZqzFwyLpSes?=
 =?us-ascii?Q?IEF3htcK2nZq/NhBOSqnBOfMx0Iotb9CcBllbO9gG4JMDljd9pl4+TPENbWs?=
 =?us-ascii?Q?AmbLIPVzNW+zsR/ce5oTfjwQLR9OG824dmjQuxW2MQmTSUZQhJZhMBTB0bEA?=
 =?us-ascii?Q?aELR432A1QwMCdj6xV+A1GYu3XZQLGqsGAl7PPAMNQf7o8vYGP8NF8jGxB8m?=
 =?us-ascii?Q?ah8BaA+NsVSXlZbt53ZRQVEx3cCfgFz/9i0I7ViJkI8sN7JM12z+ltp21SwO?=
 =?us-ascii?Q?esFvea2ZH4bnsWRk6Bt35keDXOR90imabcvK9YucQeaF7IhpxPoRvIlJFEx1?=
 =?us-ascii?Q?hMiIwWWG2DavVVOyi/3nkIh394NGqVgAAIQ3yZkSgfSPrTthx/yEjcrDvsSv?=
 =?us-ascii?Q?juUtie4XapCs9um+dmkc6xgDe2luarAwYZDbuDjROoPvXS6l6NT3PBnAs/wi?=
 =?us-ascii?Q?jsoMLcabMo+NjdGe0X3Phc6FIkIxjVjlNmCExIdyx2wjuSlbNwJwBe07uBNG?=
 =?us-ascii?Q?X4d6dWyvqdYKBh42o+drpP+ic04F9MtRNNfrodDjidLzQNgR0PMJC6mRzEn4?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IbnM2HD5LqcmZLNzPKnTTOsjPk/C3iBjNGNlE//40Dua5iUpuojHIOiOFexV/ZtDFCuMGtzQPLhst6lA+DnAaOfPb8AsLZDvLk0Q7GPgbn8FybA0XiJV6NEok7+eGGLdJdUfOWw1izBviwevdvUceGX0953EfUHtjlM2FakyBftSG3GyJH5jpxv0swzUq5j1FLXhUTJKEvgWUGwR7MrefIAcJXgA2OH6vsol7EFrbZfqzB7U+2cW4147gHGb5dNTDocC/KuMdhXQZZNpaJZVBdz5R9YDyf7ksoVI0avxVXEeWsow3ykXXuWl0RMB0etvKFCstWsezq4TFCx9fKk/VsTGUmLWqIA7EAxtjxy21bmTnXyKeVWSdT/GT3f4FlUmOAYArQdZ+QzZWVgrIj2Ry71vFtPcobVyrbrNHZ2x57Ip6jBmSUjtTj059JSJR3z3wiGiwUBawuwiAh2EoWHVpiQQkt2gKnXvvSupMqXny74b/juE9w2dOSs5hvvPcum/VGHt0+lJo5XiTTf9bb6cXxQ9R7SmgB6J80gIVLR3IaXEQQzs07XVf8JnqRvhccE6wq5SIm6oj0Fm/mQJEMjt894/ZPUJ3VKstO+O8XT9xFI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fff043f-7321-473e-74ae-08dcf43f1d1c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 15:18:29.1268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBGDN3d/KZDKWuaQdxxrZzeh+zfOaR42tdfc+Fc/Th//MJ9VGHCogj5dLyxXXHAsmdJ8K4laX4Q7sNAwYH3MM67B8xvZ2gHdNkwgXytpJq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6312
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_15,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240125
X-Proofpoint-GUID: uX26FYZoDJgCtP75r_B5q_LArYMOREkZ
X-Proofpoint-ORIG-GUID: uX26FYZoDJgCtP75r_B5q_LArYMOREkZ

On Thu, Aug 29, 2024 at 01:25:49AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The trampoline for the is-enabled provider is unnecessarily complicated.
> We do not need dt_cg_tramp_copy_regs() since the copied values will not
> be used.  Nor do we need the (second) copy of regs[arg0] to mst->arg[0].
> We can inline copyout_val().
> 
> Actually, we can simply consolidate the USDT and is-enabled providers.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c | 165 ++++++-------------------------------
>  1 file changed, 26 insertions(+), 139 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 6403842f..98d7b79b 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -44,7 +44,6 @@
>  
>  /* Provider name for the underlying probes. */
>  static const char	prvname[] = "uprobe";
> -static const char	prvname_is_enabled[] = "uprobe__is_enabled";
>  
>  #define PP_IS_RETURN	1
>  #define PP_IS_FUNCALL	2
> @@ -82,7 +81,6 @@ static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
>  };
>  
> -dt_provimpl_t	dt_uprobe_is_enabled;
>  dt_provimpl_t	dt_pid;
>  dt_provimpl_t	dt_usdt;
>  
> @@ -93,8 +91,6 @@ static int populate(dtrace_hdl_t *dtp)
>  
>  	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
>  			       NULL) == NULL ||
> -	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
> -			       &dt_uprobe_is_enabled, &pattr, NULL) == NULL ||
>  	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
>  			       NULL) == NULL ||
>  	    dt_provider_create(dtp, dt_usdt.name, &dt_usdt, &pattr,
> @@ -404,7 +400,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	dtrace_probedesc_t	pd;
>  	dt_probe_t		*uprp;
>  	dt_uprobe_t		*upp;
> -	int			is_enabled = 0;
>  
>  	/*
>  	 * The underlying probes (uprobes) represent the tracepoints that pid
> @@ -427,8 +422,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  		strcpy(prb, "return");
>  		break;
>  	case DTPPT_IS_ENABLED:
> -		is_enabled = 1;
> -		/* Fallthrough. */
>  	case DTPPT_ENTRY:
>  	case DTPPT_OFFSETS:
>  		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
> @@ -439,7 +432,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	}
>  
>  	pd.id = DTRACE_IDNONE;
> -	pd.prv = is_enabled ? prvname_is_enabled : prvname;
> +	pd.prv = prvname;
>  	pd.mod = mod;
>  	pd.fun = psp->pps_fun;
>  	pd.prb = prb;
> @@ -631,21 +624,6 @@ static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
>  		dt_probe_enable(dtp, uprp);
>  	}
>  
> -	/*
> -	 * If necessary, we need to enable is-enabled probes too (if they
> -	 * exist).
> -	 */
> -	if (is_usdt) {
> -		dtrace_probedesc_t pd;
> -		dt_probe_t *iep;
> -
> -		memcpy(&pd, &prp->desc, sizeof(pd));
> -		pd.prv = prvname_is_enabled;
> -		iep = dt_probe_lookup(dtp, &pd);
> -		if (iep != NULL)
> -			dt_probe_enable(dtp, iep);
> -	}
> -
>  	/*
>  	 * Finally, ensure we're in the list of enablings as well.
>  	 * (This ensures that, among other things, the probes map
> @@ -790,6 +768,29 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>  	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
>  
> +	if (upp->flags & PP_IS_ENABLED) {
> +		/*
> +		 * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
> +		 * prototype looks like:
> +		 *
> +		 *	int is_enabled(int *arg)
> +		 *
> +		 * The trampoline writes 1 into the location pointed to by the passed-in arg.
> +		 */
> +		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, PT_REGS_ARG0));
> +		emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> +		emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
> +		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
> +
> +		goto out;
> +	}

Something occured to me...  Should the is-enabled probe also be PID-based?
Presumably, it is OK if we allow the guarded code to execute even if the
particular USDT pribe is not enabled for the PID, but it *could* lead to
inconsistent excution because if the associated USDT probe is not enabled,
is-enabled for thta USDT probe in that PID *should* not execute.

Right?  So there should be a check to see if PID is in the usdt_prids BPF map,
and only execute the writing of the 1 into *arg0 if the PID was found for the
correct (prid, PID) key?

> +
> +	/*
> +	 * Continue with normal USDT probes.
> +	 */
> +
>  	/* Read the PRID from the table lookup and store to mst->prid. */
>  	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
>  	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
> @@ -839,110 +840,11 @@ out:
>  	return 0;
>  }
>  
> -/*
> - * Copy the given immediate value into the address given by the specified probe
> - * argument.
> - */
> -static void
> -copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
> -{
> -	dt_regset_t	*drp = pcb->pcb_regs;
> -	dt_irlist_t	*dlp = &pcb->pcb_ir;
> -
> -	emitl(dlp, lbl, BPF_STORE_IMM(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0),
> -		val));
> -
> -	if (dt_regset_xalloc_args(drp) == -1)
> -		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> -	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(arg)));
> -	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> -	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> -	emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
> -	dt_regset_xalloc(drp, BPF_REG_0);
> -	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
> -
> -	/* XXX any point error-checking here? What can we possibly do? */
> -	dt_regset_free(drp, BPF_REG_0);
> -	dt_regset_free_args(drp);
> -}
> -
> -/*
> - * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
> - * prototype looks like:
> - *
> - *	int is_enabled(int *arg)
> - *
> - * The trampoline dereferences the passed-in arg and writes 1 into it if this is
> - * one of the processes for which the probe is enabled.
> - */
> -static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
> -{
> -	dt_irlist_t		*dlp = &pcb->pcb_ir;
> -	const dt_probe_t	*uprp = pcb->pcb_probe;
> -	dt_ident_t		*usdt_prids = dt_dlib_get_map(pcb->pcb_hdl, "usdt_prids");
> -
> -	assert(usdt_prids != NULL);
> -
> -	dt_cg_tramp_prologue(pcb);
> -
> -	/*
> -	 * After the dt_cg_tramp_prologue() call, we have:
> -	 *				//     (%r7 = dctx->mst)
> -	 *				//     (%r8 = dctx->ctx)
> -	 */
> -	dt_cg_tramp_copy_regs(pcb);
> -
> -	/*
> -	 * Copy in the first function argument, a pointer value to which
> -	 * the is-enabled state of the probe will be written (necessarily
> -	 * 1 if this probe is running at all).
> -	 */
> -	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, PT_REGS_ARG0));
> -	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> -
> -	/*
> -	 * Retrieve the PID of the process that caused the probe to fire.
> -	 */
> -	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> -
> -	/*
> -	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
> -	 * will be used on the BPF stack:
> -	 *
> -	 *     offset                                       value
> -	 *
> -	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
> -	 *
> -	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
> -	 *     ==
> -	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
> -	 */
> -	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
> -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
> -	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
> -	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
> -	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> -	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
> -
> -	/*
> -	 * If we succeeded, then we use copyout_val() above to assign:
> -	 *	    *arg0 = 1;
> -	 */
> -	copyout_val(pcb, DT_LBL_NONE, 1, 0);
> -
> -	dt_cg_tramp_return(pcb);
> -
> -	return 0;
> -}
> -
>  static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
>  {
>  	char	*name;
>  
> -	if (asprintf(&name, "dt_pid%s/%c_%llx_%llx_%lx",
> -		     flags & PP_IS_ENABLED ? "_is_enabled" : "",
> +	if (asprintf(&name, "dt_pid/%c_%llx_%llx_%lx",
>  		     flags & PP_IS_RETURN ? 'r' : 'p', (unsigned long long)dev,
>  		     (unsigned long long)ino, (unsigned long)addr) < 0)
>  		return NULL;
> @@ -952,7 +854,7 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
>  
>  /*
>   * Create a uprobe for a given dev/ino, mapping filename, and address: the
> - * uprobe may be a uretprobe or an is-enabled probe.  Return the probe's name as
> + * uprobe may be a uretprobe.  Return the probe's name as
>   * a new dynamically-allocated string, or NULL on error.
>   */
>  static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> @@ -1114,21 +1016,6 @@ dt_provimpl_t	dt_uprobe = {
>  	.update		= &update_uprobe,
>  };
>  
> -/*
> - * Used for underlying is-enabled uprobes.
> - */
> -dt_provimpl_t	dt_uprobe_is_enabled = {
> -	.name		= prvname_is_enabled,
> -	.prog_type	= BPF_PROG_TYPE_KPROBE,
> -	.populate	= &populate,
> -	.load_prog	= &dt_bpf_prog_load,
> -	.trampoline	= &trampoline_is_enabled,
> -	.attach		= &attach,
> -	.probe_info	= &probe_info,
> -	.detach		= &detach,
> -	.probe_destroy	= &probe_destroy_underlying,
> -};
> -
>  /*
>   * Used for pid probes.
>   */
> -- 
> 2.43.5
> 
