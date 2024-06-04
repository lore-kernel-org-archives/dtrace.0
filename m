Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650963BB24
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524017; cv=fail; b=YpcBtimqRfUdMSuaeQ8sduxbrLWdpgdGYl/jM6hEytu10Whc6pKy/yi7kp6Q4qtrqFwg4fxqKyXpjKFoZGscdQjc+MdCy8j88eML9AkVt+rLPuZxVEcvYnXVYZV8t6vmo9vDLsfqr/n2PSMUXODsdthyXTXXk9NsTaUV0AknoGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524017; c=relaxed/simple;
	bh=H4HsTnWnU5570WyU5mV76gjl3ih11I+M7dfdMnQy0O8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dv0rHD/GxA1MRbVF8HoG1cyX1RetGQ/EI5L926JCr00xSi0lANHKlX0Ir2koxx93h5UTWOgpJblxtWA5HD8l2AHZh2NpP5JO9mB9ZU4u+LQAFg7lD1JSikUxQ1FfTEeUNCbs9cCF0mBWaH3ISMJowll4Ox/OaqzrwtVcVTRdQZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rimfwv7v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uuWHHQWU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rimfwv7v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uuWHHQWU"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnIhE028071
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type:date:from:message-id:mime-version:subject:to;
 s=corp-2023-11-20; bh=Jzh8ANOor3bHAS2RJiKUV/J272gcJCGLDxdNSOeLqTk=;
 b=Rimfwv7vSKl8y7aJbyXtZmu2av/WpfEY943wsLZDKSAfxZf3codhi0+3AmwsErjl/yri
 ke63SsPXt6xrraoNYsS/znN1EE7WYeGHFu6XYH7Ls28Wb+OBfbSRfRpyLKH60rw2rSSE
 LcMTD7YllD35GDtyhQT1kVm+XaYjBOVXRg7q1Pmm7bwnrNUNfXVH9+tuc9m8Dw0IvAT5
 7kFQiCHsoyFYsf/oJA9O4fMyDGbbMEcnWo7zilPKqxQ3nfg03YffGlkUXMcMA0f/j9VA
 5la6hBUBBLIQjFLdyXwohPRKXo51pP+d/iHlWaJMCmJDz0slMAdsut9M6ftqpM75h8j+ Tw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv58dke7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:14 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HTpRi005543
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrmdx8mt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=je4hArshJS+uBAHn+PFZdDx5plG2k1hFc/TlZ5N9Vr51tqTcrVLwvj/yNHBaJqhjeIEsGUknbGpGBz9+azB5iCcHNbGuMaCE5YgSkydMsc0/r8J7s5RG6rEIQhr0gGmIro0/YBdTxJkr5oHFQ4wPrBS+n8uGUnhxiuakexhYoBuyNQDynNWZY8p8IyFy+8TEb/UeQYg0QiQw4rXvSj3q0LB6GL6FtVZHaUh6HEpElZRwG6HljXyFPTju5KhU9Mc/ihyjl6uaImVht6bGsxU14e06aIyUSES8o+nl4ufLog7Czzouk4Lp/6k18qJ0u2bot90qXA5w7W2KNTqkPvSDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jzh8ANOor3bHAS2RJiKUV/J272gcJCGLDxdNSOeLqTk=;
 b=kKW1+IxmMibDd3ZdqW9dLsKRnle+0D+dMLt7s6nz12Sck60YFKsVvOmKKAasfNHnKBw5n5SuhMYLqhGiWbnEp9sAN2iwEiJl8BhtLHfUK60H76A5djHRqEl6BlSfC34KB88kVcXcEQPSz0rgpaMxZKGik2AahGuDdyZTbs3FPmCLbFPowaMu7EBQJzCijQ2aQYlwXXXcOFUz0lrb67SCL0L2/YXBqHT+bNIuL8Ddm+2FGTTBMKV022/r+xxzZoGD3rgLMkRZ9EG1A4/eeyeIISEhM2MAjt44bpeXqvB02DyxPx9ZBbCvdW6ldNyfnZWfYlh0rNWDnnQHQPPYVh+QaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jzh8ANOor3bHAS2RJiKUV/J272gcJCGLDxdNSOeLqTk=;
 b=uuWHHQWUD55uT0Glb3c1W/4JN8VzxyhXcSiZU51I1u5ZIMWiiFtDZyWUjmixeP13DYGOSl69bqwfOC5muc1tlMY5u5TJzKfRMAPa1vbgvwpXKGADH3kuYjnVUKMf3d8/aDzDWNgQhE5BERjHXXedS9EG0BNKAJ/KGZ9zdHYX+gk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6574.namprd10.prod.outlook.com (2603:10b6:510:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 4 Jun
 2024 18:00:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:00:11 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/8] test: Allow aggpercpu test to omit some CPUs
Date: Tue,  4 Jun 2024 14:00:01 -0400
Message-Id: <20240604180008.11331-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f557b3-8f2d-45e3-391f-08dc84c02d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AWxh7cX0CF+zkIlFLNUwur0mWKIwN7v9FcVfIPRDoUZy2lUnQ3rf951lsVFS?=
 =?us-ascii?Q?3GOw3ndVYN9Z8vIXujRJHZiKx7HduKirwa9Pkcq9wDmm8qC6T6fTfxeQqk7G?=
 =?us-ascii?Q?oZHAZqY8H+kR1+tVu6wTTPSpMIQlmdc5jIya5LOGoGgbo10PnUBNbKAS7WZ7?=
 =?us-ascii?Q?2uZ34veLfvBrGeLRxisGgc4KO9AbV6+DqZL7pWMfxHU1MzkZeu4mN9W1yikf?=
 =?us-ascii?Q?k61CWE2qQf/Lt+WPo23NYvwrsxZl1Ku470c2sM6Qjd0+U7kkZyIIRaMJq23F?=
 =?us-ascii?Q?5ZJsP7WVTYv37+0MNAkIWN6dislmV8URYaNc/grAoZt6vCTejOkrdw+/4Lju?=
 =?us-ascii?Q?mILOYZl3JLNCRO+Gb5jxTW0PhTiMuC8DNbri2DbZBmlM9a7BzhHrShF/t7CA?=
 =?us-ascii?Q?0eZiWpYQU5YXhQyLT8oNrZmev8MaoOuO0N5DV9xSgms/JzrvMeopVgSpHyCt?=
 =?us-ascii?Q?4uSp0cYo0NpPd3I+oPKn1VQBBWLrrkMjS+7hVhpR+Hn3KJBKST8wtIDe4lun?=
 =?us-ascii?Q?pW6sJJLinlpM4OZorhqG3VJZZYXcRs1XNAwq2TCEY+yKZOWPSP/ChMU1wIZB?=
 =?us-ascii?Q?AdKna8ICAJaYdlU6f390++Ry9zsnT2KLFrw3oSlGDPISVfjGS6oqoOQV3clv?=
 =?us-ascii?Q?ePuu3+sANR2d4i+usntTwp2yAcs/ZDRDMgrAskhTxT4IksX6ow2bn3hSNBEI?=
 =?us-ascii?Q?gHTPRj1qXGpWKdRFnPH/4Qv65PdrClwIFhkanIsNx/0rPL/kC9qs6b68Vxkc?=
 =?us-ascii?Q?LBxPjWF90F8CvVOkJnwp8rFySVEzASMCgkmf4V++S4QXNYl0L2/L4jbpLnng?=
 =?us-ascii?Q?iuMnky0rSTuY9bz9k1o1UThXUL1kwNV/NUvXzf5PpLrV0FdbrSbQ9Iqswnos?=
 =?us-ascii?Q?xpiYEhFtPqeYAAOt/L6oE4ZGg0QhV06s2mWSkziQHJp8eN1cMp3LWKfn/+L1?=
 =?us-ascii?Q?SYt/dHtAIpG16NWOkSFxZZH1OBwO1zAtFK34PPSRfR+d9o+bOmAeyfJQ45gM?=
 =?us-ascii?Q?naMK5wf+gcWcStQthFoDsDSvH5h265SdbxQfBHkeMwrgeF9zFFv3rBfirNZV?=
 =?us-ascii?Q?wHOQEmYXUinAs2Lo3slUQsCTU515atCf0Dx4CuMXdLtc95LnQzH34x4VSZrE?=
 =?us-ascii?Q?HfYJnxqK0KVRoh/KbMs3mZw5eIx2slA5Jjxe90TN6MrWekNdI3WJNRWu2ib0?=
 =?us-ascii?Q?aTxPBA1CUmQEppLyMcG9RFl+iCFuLOS+zzWtEf4Vh22Hick/BAG2/ujbz1ii?=
 =?us-ascii?Q?EQDPsf3bmmX/UR9qOWz/5CgiiKH/MgBbi1ZU893Ie2Vb11vFh4HA4/TI3Bbb?=
 =?us-ascii?Q?w65eQ2zn4TB0/xFMfq9+Avbh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HbdzUjZbFOiKw2EN+E2eVqfp7Dr1WRiuQQ0NVEzabASb/L8CyL02X599EOIi?=
 =?us-ascii?Q?poPey02V+fT8BuXtBAKPQfg5V7RZ4GdklYhyGcXyXvpTTByFqdbziCE4fAAA?=
 =?us-ascii?Q?ckvZ0AEMlqeQl/lOO4EUwOHutz0FtbeuDpXUGAw8t+k7NgRQj8DrvJ/m4mQH?=
 =?us-ascii?Q?OMevFPvnELMCg3g1hgltwSpD5T5BREzNinoMU61CWlyix13HDkzYfM4J2ttt?=
 =?us-ascii?Q?eELxONJ5xcRkQLcL6KPglutU2itlRGC3f11fpaQxjNKDNQn3b4kJYj6F5+DV?=
 =?us-ascii?Q?KP5zsTiXbwl/LrF87LYwDlIQfsjLY0QFBKtAOYHrNCbfs+V55pj9eRqRofO8?=
 =?us-ascii?Q?btWvf691o8txawIqJ6H4TnADNmWhTHB93zvdq5u5EfvCZFQl4mBqA14aBD0g?=
 =?us-ascii?Q?hIYDqb9eupscD4QWHRET5RxkM3ulrrTas/CtpMQ394w2gbr3lCxQXU6K3afe?=
 =?us-ascii?Q?wivw4bNRXWeCdd8/4Wyqe/5F+vpsP5cXYcnbI5Z++nt+jAKokZPa0+bddjHh?=
 =?us-ascii?Q?WTxHh1RVlAOm+6FrdO2dBDaUYj66Z8wSBoO9akXD2y9dTfTHql9JZMApgOqt?=
 =?us-ascii?Q?i74Ft7o85R3o3K2UjY9ne272mW+3z7VTabvweNZCeFbR7sIy3s8HK9zzmnV1?=
 =?us-ascii?Q?6tW0uECgmDXDsY8XCIvSH9OH5UiYeLLLO9MLFWkRnFjvMZUAQZYQrffdxZAa?=
 =?us-ascii?Q?zU2EC6h3yUO6gZSi7N+KHf4PeZCnywxwvNyhQ1LkyDxjCIdr65BdNAmsY6DK?=
 =?us-ascii?Q?/LH1tW+MZuxx2ADGJf6XKCEZx/ywF1t8q+9COmvsxq/zFLowvFrd8A5Z4HzC?=
 =?us-ascii?Q?AA287MkLEp5dUlmon4WA8QptQhMlc+bHVaozg9oyh8IsKsZ1ZXxuHdOJAVxG?=
 =?us-ascii?Q?P+N8Ca84TCKMpA7CG9DPe8JzKgeA3UyTpuR+xe9UmgmPskptpo4dlQ74/TUv?=
 =?us-ascii?Q?1414UOgwyBlKGDaXvifo1+/m8YCjDh/lp5QA+cujOSLmDxE2KxgYCwfPpGO3?=
 =?us-ascii?Q?px2MUZheR9PIIL0Uf5W2mIBXksI5rb1ajX6aDUdgUe08+tEuocxTNDTFgMtu?=
 =?us-ascii?Q?fTLEIx+oY+CUW7vzs0AN1XUtg64jJIW3G1DbmgWst76h8Ar8z4F40d+Wc4Zw?=
 =?us-ascii?Q?MucH1uQOUzmLenvZeBdt3zIbrSVgpd30dQ0L33XwRAW+Vsx22CK6kNhoM4xG?=
 =?us-ascii?Q?l/Bcvt5pQfJyykg12yfB5N6UoKAObM+S02znDGyaH5k+bIAZcswcx+A8eaE9?=
 =?us-ascii?Q?V9miaIKYFfrKlLQhUflJ0Wz7X729EbNoJpKHicq7ypjBGKeO+68rZwoeeeTQ?=
 =?us-ascii?Q?TQKo+FOSbOOXERBjqN4xbOwioQgCmquJUa5KzIGodVzvrn00s+HwQueDJbqO?=
 =?us-ascii?Q?EIg5/USWU4BxojhxXsZnhXLonJOWF6YsjzuiazY/yIzuF9cEr2AI94yBZKCU?=
 =?us-ascii?Q?56QREy1tfIEb5jxX2Xzhl2WyndEfq4+RlI/zfr7nGEhwLBgmdlrOG81Q2tSx?=
 =?us-ascii?Q?EGzvjXihuK8Wj/ZvRjRIJspmYvReijvOjdwqbatItR2FMqKM9ifDr2ADrKyB?=
 =?us-ascii?Q?DQogm2rWLWL1ox2IZ6VtHqWbOxNOYetvlhYboRgc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rFvWoDyFOrM8JqyBENb1wJmXd3aPFxWP8AEWz5rM8PdRCWhx5yCaWT4Mc0z2rdRE+cJZKCwZ0OWo5Wrfe+mzrqqVCDMOerjFA9ZtDR1x8WTGteFjKYHuGnA8BLawn0KZZJHrTrveZPYEtPmjG+BPRqMqxD7Dv1jcuNKyO3qeLtjqlIugH7m0XUIsB/S1KeOCQ/poyhVCDLgc8ce6jj/JP5U6ireRf9W3u6qtkIJeOl1xHfC/ujpjxMK3IrIB47KavetweTP5hfBbVcBGAenC9ua9B1CLsKqT/qy1xKmLa57kKvQD8koGeABaeh6srDbqBoPvwpUDK72DyhhvayAbFB2e5zbfRw5vlMMIzU5Xf4cvnXSlGlldAuo+XRIBxpkE15hfj/1n75HHUKatConVxd+9oRAPyg/W6U39UNRBf/y7aioUb63fl3tC2G856/9MhkhgMfNu/u11YN54BRZybayOU1KmF1HKcTLX3mZfLCrMEVjpfnrH/zQn57rRnhIX1K1IiysxxCNLob5aNAkO4kfJTMfVnqlYvL+9BFVHqB1OHizGC2snHvOqGdL8G0hMuj9cZJMcIMUf3ZRZ+JlRuvggguGRLawwe/j/86A8v2I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f557b3-8f2d-45e3-391f-08dc84c02d57
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:00:10.9810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEPjaTap7xO4PAG9E1bBvpeFMukfrJ6dkcjN0dBNyxhkldiAAWcbsrh1hTANnfO5g6vnM63X0hJCZmoyZ+xKwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6574
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040144
X-Proofpoint-ORIG-GUID: 0cK1B8pqW1muyXZ7r62VdtP9y0mME1hq
X-Proofpoint-GUID: 0cK1B8pqW1muyXZ7r62VdtP9y0mME1hq

From: Eugene Loh <eugene.loh@oracle.com>

The aggpercpu test uses profile-* to fire aggregations on every CPU.
But whether for good (offline CPUs) or bad (unreliable probe) reasons,
a CPU might not aggregate any values.

Allow this test to skip over such CPUs.  That is, while a BPF agg map
might have the correct default value for the aggregation function, it
may not see any anticipated data.  The quality of profile-* probes
should be checked by a different test.

Also, when computing avg() and stddev() in the awk check program,
truncate results to ints more often to mimic the algorithms in DTrace
for more robust checks.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/aggs/tst.aggpercpu.sh | 62 +++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/test/unittest/aggs/tst.aggpercpu.sh b/test/unittest/aggs/tst.aggpercpu.sh
index be74890a..6092bd17 100755
--- a/test/unittest/aggs/tst.aggpercpu.sh
+++ b/test/unittest/aggs/tst.aggpercpu.sh
@@ -46,7 +46,8 @@ fi
 awk '
     # The expected value for the aggregation is aggval.
     # The expected value on a CPU is (m * cpu + b).
-    function check(label, aggval, m, b) {
+    # The default value on a CPU that did not fire is defval.
+    function check(label, aggval, m, b, defval) {
         # Check the aggregation over all CPUs.
         getline;
         print "check:", $0;
@@ -54,12 +55,38 @@ awk '
 
         # Check the per-CPU values.
         for (i = 1; i <= ncpu; i++) {
-            getline;
-            print "check:", $0;
-            if (match($0, "^    \\[CPU ") != 1 ||
-                strtonum($2) != cpu[i] ||
-                strtonum($3) != m * cpu[i] + b)
-                printf("ERROR: %s, agg per cpu %d, line: %s\n", label, cpu[i], $0);
+            do {
+                getline;
+                print "check:", $0;
+
+                # pass is +1 for pass, -1 for error, 0 for skip CPU
+                pass = 0;
+
+                if (match($0, "^    \\[CPU ") != 1) {
+                    print "ERROR: no CPU to read"
+                    pass = -1;
+                } else if (strtonum($2) > cpu[i]) {
+                    print "ERROR: skipped over expected CPU"
+                    pass = -1;
+                } else if (strtonum($2) == cpu[i]) {
+                    if (strtonum($3) != m * cpu[i] + b) {
+                        print "ERROR: wrong value"
+                        pass = -1;
+                    } else {
+                        # right value
+                        pass = +1;
+                    }
+                } else if ($3 != defval) {
+                    print "ERROR: wrong default value"
+                    pass = -1;
+                } else {
+                    # skip over CPU that apparently did not fire
+                    pass = 0;
+                }
+
+                if (pass == -1)
+                    printf("ERROR: %s, agg per cpu %d, line: %s\n", label, cpu[i], $0);
+            } while (pass == 0);
         }
     }
 
@@ -99,13 +126,14 @@ awk '
     {
         # First we finish computing our estimates for avg and stddev.
         # (The other results require no further action.)
+        # (We keep truncating to ints to mimic DTrace algorithms.)
 
-        xavg /= xcnt;
+        xavg /= xcnt;             xavg = int(xavg);
 
-        xstm /= xcnt;
-        xstd /= xcnt;
+        xstm /= xcnt;             xstm = int(xstm);
+        xstd /= xcnt;             xstd = int(xstd);
         xstd -= xstm * xstm;
-        xstd = int(sqrt(xstd));
+        xstd = sqrt(xstd);        xstd = int(xstd);
 
         # Sort the cpus.
 
@@ -113,12 +141,12 @@ awk '
 
         # Now read the results and compare.
 
-        check("cnt", xcnt,  0,   1);
-        check("avg", xavg, 10,   3);
-        check("std", xstd,  0,   0);
-        check("min", xmin, 30, -10);
-        check("max", xmax, 40, -15);
-        check("sum", xsum, 50,   0);
+        check("cnt", xcnt,  0,   1, "0");
+        check("avg", xavg, 10,   3, "0");
+        check("std", xstd,  0,   0, "0");
+        check("min", xmin, 30, -10,  "9223372036854775807");
+        check("max", xmax, 40, -15, "-9223372036854775808");
+        check("sum", xsum, 50,   0, "0");
 
         printf("done\n");
     }
-- 
2.18.4

