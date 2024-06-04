Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E6D149006
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524696; cv=fail; b=pd/YEqEP37tSTjd6E3gStjtT5wqnEMDzlnoQ8l8BwmGeXVjMmFX+nc897Ve53jC8DDyf6ZNJdZt5hxYX+QZlMNxs7iVZmBbLnY6hEUDqa/Kg2xpyk8sW60ZYwE+a0faDg5SW4RdLW0zM8NRGsEuLyk9FYtcg3LmlExcgc3lzKhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524696; c=relaxed/simple;
	bh=9SAQrLKd7nxjU0cB5cifmKZ+Gyrf8b3y3ocTymZC5HA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o1OseamlbIVchNyVkD5tATEb7aVGhTzGDHNryrOXkfXZNVpRxrCM0br7JRF/VomAprHYvgHQgIOJEbO3+tyooVG8JMuYyDKX6ofVfn215/Mch+BCk7b2xRNbcVL2fTu+vw0I1VjVwKDhoI+69xa5y2O1/j6mxwqKUEqL/eDpQ6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454Bo0dA024658
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:34 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DP9s0wcY0iKk4otg?=
 =?UTF-8?Q?PqdB0uaAV2pDqI3W+mkVBjWumJT4=3D;_b=3DY8qtvLQVLcABH5/mKBCFe7Na+2?=
 =?UTF-8?Q?CBhiHm11nX4f2XRnLfqv37fhOz1oO2ddST680z0ZKV_tgU0s7+ta/aGFSvYv+27?=
 =?UTF-8?Q?2JT+UmbmSJpyvO4hXeMgpbTEjyAt+xBEGHvixShZNfAXG1xV_Fhy7RsxTFN4svm?=
 =?UTF-8?Q?8B/tyG6Prm4OKTJ3BrkSVDZn04Nmv310njCt+FVf/V7IafTUf5vxEc_WO0hBldA?=
 =?UTF-8?Q?WDTM8vC81VRHJMiceoaXobs2HksgTBd9KDO2SKh6e6QEvAi7JBPBI6pi55o/_6D?=
 =?UTF-8?Q?VkeIVC427bZj4CWg4iyQU4RTdxjq/OzhX/zFf9cfi8K5D1dgFF76kaQLEs3pGZV?=
 =?UTF-8?Q?xCL_cQ=3D=3D_?=
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv3nwkry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:34 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HeN99020527
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:33 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrj2cp5c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NV642r6mdDYdmPPB5B4gbQLtfMxXDXNlEZ49xCU74j318PG1Dynqunh9UaxXkGbTmkTYWBzOMOv/yeeBRiTANIWICu19zk/5NUAMUWDMhCOVTM5oklxw8OFnf+yLdOPEsXLYdWznPcoo8d2CerC+RlgE6bO8SpCW/7S1ImMcAG66y6WQ6ysTEQoybiVijSVe0FE2vLCsnOEudIxG4F6dc7f4d8dJ52MbvrQJLaMlmhcaajKvIJ9dIaCdTD9FNAhg/XNGI0KraC+kcaqKpvlN6pDRX0OAhUsdTjvClwS9xO6CR2Y/T5gn5c4/29eSRZYs0g8M8OLZbhZeqlr8imdJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9s0wcY0iKk4otgPqdB0uaAV2pDqI3W+mkVBjWumJT4=;
 b=JaYpDagaLDTzQlzsEidNJfFeX7vviWqKZY4VQ9GCGho51Z7IjEBm4BC1Pngy+sUF/4rEXCCUESw/ME4zc+tHdXtmH1G4kGCPL308yPKo24AlUwuWY4Q55H8sL4B+RzV9gTppPlrH+v9JKJbmzUiGpTkbj91oZd9AWoUjegujYJ0JQe4adILHUCHuiMPowyHWPLoRpeUmHQN/CeIOBW6eB8RnDvbsKLWM2IgmPIWodJhAY8X57vNOuSL0pt7AEMgHOrXGr1lFRcHzEaZCabzRBAudaHSoJjo/CKPndEfNbMud62Nq8GRlauOuJIra0IzstSUGKyBQAK664ZV46+r5GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9s0wcY0iKk4otgPqdB0uaAV2pDqI3W+mkVBjWumJT4=;
 b=X8xMQ4Exb1xCfxsPX7yKrLHLwEGdNgeYF1xXmQGgSMQ7gWkELbvLeu7H1ls8KFGvdbIvbMCSkNLt3z9uXHPcZVGybBbDFnhi/3KUER1/9kAhmXoI2LxTpliHNYN4KdYbrkg5tRBDAEaF4Oq/1rhZXDMQUHQ/Tsp3o4YcBhDTSn4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:30 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 02/14] Clean up prp/uprp variable names
Date: Tue,  4 Jun 2024 14:11:01 -0400
Message-Id: <20240604181113.11505-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:208:c0::47) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de37da8-5ae9-495d-09d2-08dc84c1c273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ESiCD4KT6Zu41L728gH9huVLGkq+Xp5pHoNAO37p6Etiprie1Vm2bmJXSPaW?=
 =?us-ascii?Q?Lc/2fRW97T4heZcCLgSRz78ztH4TuMC/UpyM2CFeDTCmOXYYddPqomwEOg1r?=
 =?us-ascii?Q?gzebKGISEAUcIBNRKhgDvIJMcNJRpZL/97YFBQMjG4l3pDnHqlGorPzrxNx1?=
 =?us-ascii?Q?8D6+O61yuhvwusoCrBHKO53HntghuBHAuaX2A+/pTD7wT2UGZ1qQjCVRtVV6?=
 =?us-ascii?Q?9L4SZQLE7dMi659p9PhEnG3L32usS+c8oQtMvFf/AHo/rVfSfqf9nCy2uWmi?=
 =?us-ascii?Q?GQw7eAYJQgB/BhdhFk/eFK1k/pB44WR+deincgyomvD+H+KcFwk1EBR/edO8?=
 =?us-ascii?Q?8Riql7JK3FmKc6Fc31YMWFm/BNKbfK9cCCRt6TM1Q2L7wkq8PtkIsT4gSn7l?=
 =?us-ascii?Q?qB1PXrO0fxB2HS0lLJ6umBbfeHw3/ACMJbZ0ZyP0hJsy8Z8XjzqYRcK8p1wi?=
 =?us-ascii?Q?w3kY3LAoNzXxikdPar12R10s8KgMOBi0/rmge/NYdT1bIKa3Ccj25LyMnkyl?=
 =?us-ascii?Q?ZdYrV+uJFhP8pXtOcrUoxTXVw6Rixn7BNh2kd8rhb70xHy84Cpm2w6HtOf3P?=
 =?us-ascii?Q?Q8btuj6FENjr/0yosFizO3FiLprN9z4qjzY9rO7YmwHPHCkdoBdYevhlRA5j?=
 =?us-ascii?Q?6WPssW1slrK9Gu6BrwCWlQdtY1nLZ1Ihe4H4vs8sqL4Jf5OtLcdZzPanH9Rq?=
 =?us-ascii?Q?BEoutPpdSwrlwLMpEMD7sAQL200Z1MNat59uHyEA7Dr0hwgj0AxtLCrgeZzV?=
 =?us-ascii?Q?uVkEl1wNLVw+kBR7bulWpHWxIpm1QCbXqmAtXND5fho7gOj4iQohXC7TytSJ?=
 =?us-ascii?Q?XvmLu7oB/0htLiUDwn38FRe3+ODDOCT+eYsfNkwk4rmONNjA+DrWgv6TN66p?=
 =?us-ascii?Q?uUABslAcpr6pySvV9zqWTvDWJndq/5oGD7MsQZluYU0lP4ADsaj9PUGOMg8U?=
 =?us-ascii?Q?JyQc7FFl1esw3RCWriGOx+LsxdtTidUmlwBXFCQqzM5prMbJKMiGE6M1XIno?=
 =?us-ascii?Q?Ove+26ZRSG3HINUussLXdSxQluoPQoFTz0gXqQPGX+3Iz+c4fKanv2YU6NOk?=
 =?us-ascii?Q?Jp8QFIT/UVp0mnrdsHZ3NK1QTI8puSMbUMp821XXMOrW8M5glYtxSOkNlENJ?=
 =?us-ascii?Q?WOZwqBtkHF+RxpUFUKJoiDUHp7KpuMmf/misCMkrpEvEoqx/xFyVK2I05S1N?=
 =?us-ascii?Q?Rel7HZJvJO/Uth9GXr9LEOkoeyB6fVz7taiyzaDum7IiZ5hsIwii/4xMOLn2?=
 =?us-ascii?Q?LmGF9HYGzm2ScPJlGNrnrIjTcaejsbFqlvlvHmxLjQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XZgfFnFZjCaeGZi3Rgvj7noH99CGAwMsJM6a+0LVl+tpl4d+7sF6x+ue9mCd?=
 =?us-ascii?Q?wSWkFT8TsTN7QOuUkbQbyMp/vupZwEoR4zztQzFG1xkrzu5U/naYhY5ttX6H?=
 =?us-ascii?Q?V/gY1cRRMsmS2ro/SJSRFb638MBMjQ3BtT58KNWTBjpn8lQPyz/Wq4IUcHRi?=
 =?us-ascii?Q?RyHNN4TULlh+eyk46XyyNkZOpi08o/xkJUn314nDv3zKzN/YzEhnAqe5wOMs?=
 =?us-ascii?Q?cv2imPPQOGpdDJL2Ow6VuNeuXOGwOA/jNC/fgIr81jK+U9vmE7ekJaOkcSrh?=
 =?us-ascii?Q?tcz3GeapIaIjX6cjRA803QGDzwLjuzJgkfnUPlFCdun0JrMrVAZSIRu6Cr/P?=
 =?us-ascii?Q?hh17i/+P3Ew7UcaBNXwPnpE7zoWxJlOGwkAOZEaGTWlZBEBBJg8HO7D+7u6t?=
 =?us-ascii?Q?EWpJumq9FgWEsFoLyYoaQj9GCjf7l65tbimuDtt2IAXGZjPcwCqW/R3JyE/J?=
 =?us-ascii?Q?e8jGAAhnjGFFv/1MOfOo0QThlRe+qvkO6YL4kcePd5DhwkxwoZmLcW66o4Co?=
 =?us-ascii?Q?x6fjtLzzo6mUMgb3MxV6oBKzyJUkhga/dNZSmQmPy3edGiAHgMbfjyZVGaS+?=
 =?us-ascii?Q?oJPNFb24cw5ux6FyJXgPYsLxkLHPSQOUee46QGRLdlr9zSeRtlv8/CTQS1Am?=
 =?us-ascii?Q?dHj2qJyINiAG0Ps9Wa0Be6ishSkcWuSliN/9ijD1ptU4/XEfG1pmcUzcZes8?=
 =?us-ascii?Q?QcVYiJVyEgLxa7gGYJBIfl1Ew/Jtpva5esF5jHmMlNLZaCoFBPr2IiRc9ur2?=
 =?us-ascii?Q?rbKHs32l2WEkqGwKYqHV+3CLCG1Ntzttxex/Sy/le4PRgAUW1OAHojNiKzI8?=
 =?us-ascii?Q?OfD4orgm+nYt9mNd8/T6LkKrtkBs2c0LiWsMgFwKar75VKmtX0IoFGppM2S/?=
 =?us-ascii?Q?Yh9j90qjnUO/V7MvFNvugbRzFNpX9oOGgvOAX+XtBi+vl0O5sdVC21Ys2bBZ?=
 =?us-ascii?Q?68TGZ/nPIp5dJq/Meivjcl/rOszUWCOpWjMRZGJ4m7jlPnsG2DG3LP+yds5T?=
 =?us-ascii?Q?8QYvRkalx7E6Iugbdst286VH1tQYD/c0ls1JBfATmdNqNm7Ou0WhM/GxgsWi?=
 =?us-ascii?Q?xlJPtTJl0HX3xnQWxfRRQcT7PV8vVcLxuXgBg1H/fOzNq9bzLLsQQEPMgqod?=
 =?us-ascii?Q?IPZNjG+dspHgATkaM+IKZsf5BFtXyPki3fQSCGrr2rroRJ8Ko+opt12ncEmj?=
 =?us-ascii?Q?S1muvJY1jqSuiEW2D9riL7JLsXDZoB4LTb9cv4Ja0semf+QC7BCwvE5yy9W7?=
 =?us-ascii?Q?shFbOrwH5fYFoVAPNzvmdDpbn66bEA3k7QIRJsEWC94v/lWwh9w3oDeg+OdV?=
 =?us-ascii?Q?y+CsR9iWRv2eiJnEeWcyuqFYdkVPeE61wbU/JNLu5nsWW4uL6q9jwnn4fhMG?=
 =?us-ascii?Q?0Pm6tymJTRCDDFvUzN1N/GX4H9xy78fe8J9rBMQQG4dQ9QykYT64rAomH8jx?=
 =?us-ascii?Q?hH0HRS2JuUG5UmZWywQuurg7OR9D5YMdKoksU/+2CCkWEsx8SBOicbhxiNL5?=
 =?us-ascii?Q?vCHGtr16y7yqmvhwJ18rwpffyBokhM43NtjYaEqo3WSjx50l0k8FPOPAtJfX?=
 =?us-ascii?Q?6odXWOQxvz0e7D+ixfc7TJE3AYPsIH18b1VGoq5P?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	TBOH4rtN2Q/l6PUm+aXw6lyoy1D0pJ+ANEB4VtKAiJ4ogR2C9rqtTnPpty8fQT7Rn+9+EXMmPM9SaNzQroX7+klUnAUngmDH33038VgoYnaNy2e10CLhX/6qWjGIfkXnJKEV67CC5oqudGaALVvINwsR1DA+5IbUQZtAtK3LmyRynn9AZqMvD6qHMHDWIGEaZ6CgsvBtOibZ0EiaoIMSRVyb33/8FctHzaBqqwZPU8WnrfT33lovw9rMPN4g4+7u4ZlesbgxgzoAgbiTUIJhL6KboA9RAYcVPFJ9ZLFtd1mZEIflm+6QjKeI94sYO/lZdASr2aQOiFmge+7JEqS4QR6VsENkGFYi1vQQvFH1yUe0kWegWq9QetSo5y8MgG3wFxMRbGDrRtYmnuOaoENjhKH826ujykCmL1dagESzcvqmhIYUtVuZZMIxs5ixx4mA7DYkaS2sBx4l8IS+fAFT3ca0nUYdl9Fnt2He8HY7PcsVBMusbPFW4HEjvp97GcpF9ubbfPfZ/liaryQUs/UY9OFfgjIutr3ystl7XQWrPxR/UqFHqCemko5oI3UlP2JRLy/8panmVYmotQ7+EKMEE9/nZYHDWZ2CpjYKh0GMquE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de37da8-5ae9-495d-09d2-08dc84c1c273
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:30.7077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/i85G5xu4VsFE6gZAbyimmEXqIRGn2OPALJnNsq+NNZLsR2UTdcrhXF1JXqL52c2Xc0VWeQYld85zxcUi/Gjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-ORIG-GUID: WSuqB8HF_Rnjk3cy1kXoU8CN5NA0xIcL
X-Proofpoint-GUID: WSuqB8HF_Rnjk3cy1kXoU8CN5NA0xIcL

From: Eugene Loh <eugene.loh@oracle.com>

Should prp be oprp?  Or should we use opr and upr?

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 55 +++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index afc1f628..cace406d 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -6,6 +6,31 @@
  *
  * The uprobe-based provider for DTrace (implementing pid and USDT providers).
  */
+/*
+ * This file uses both overlying probes (specified by the user) as well as
+ * underlying probes (the uprobes recognized by the kernel).  To minimize
+ * confusion, this file should use consistent variable names:
+ *
+ *     dt_probe_t	*prp;   //  overlying probe
+ *     dt_probe_t	*uprp;  // underlying probe
+ *
+ *             Either one might be returned by dt_probe_lookup() or
+ *             dt_probe_insert() or added to dt_enablings[] or dt_probes[].
+ *             Further, uprp might be returned by create_underlying().
+ *
+ *     dt_uprobe_t	*upp;   // uprobe associated with an underlying probe
+ *
+ *     list_probe_t	*pop;   //  overlying probe list
+ *     list_probe_t	*pup;   // underlying probe list
+ *
+ * The provider-specific prv_data has these meanings:
+ *
+ *     prp->prv_data            // dt_list_t of associated underlying probes
+ *
+ *     uprp->prv_data           // upp (the associated uprobe)
+ *
+ * Finally, note that upp->probes is a dt_list_t of overlying probes.
+ */
 #include <sys/types.h>
 #include <assert.h>
 #include <errno.h>
@@ -118,7 +143,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	char			mod[DTRACE_MODNAMELEN];
 	char			prb[DTRACE_NAMELEN];
 	dtrace_probedesc_t	pd;
-	dt_probe_t		*prp;
+	dt_probe_t		*uprp;
 	dt_uprobe_t		*upp;
 	int			is_enabled = 0;
 
@@ -160,8 +185,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.fun = psp->pps_fun;
 	pd.prb = prb;
 
-	prp = dt_probe_lookup(dtp, &pd);
-	if (prp == NULL) {
+	uprp = dt_probe_lookup(dtp, &pd);
+	if (uprp == NULL) {
 		dt_provider_t	*pvp;
 
 		/* Get the provider for underlying probes. */
@@ -182,12 +207,12 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		if (upp->tp == NULL)
 			goto fail;
 
-		prp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
+		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
 				      upp);
-		if (prp == NULL)
+		if (uprp == NULL)
 			goto fail;
 	} else
-		upp = prp->prv_data;
+		upp = uprp->prv_data;
 
 	switch (psp->pps_type) {
 	case DTPPT_RETURN:
@@ -202,7 +227,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	     */
 	}
 
-	return prp;
+	return uprp;
 
 fail:
 	probe_destroy(dtp, upp);
@@ -394,8 +419,8 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
-	const dt_probe_t	*prp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = prp->prv_data;
+	const dt_probe_t	*uprp = pcb->pcb_probe;
+	const dt_uprobe_t	*upp = uprp->prv_data;
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 
@@ -508,8 +533,8 @@ copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
 static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
-	const dt_probe_t	*prp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = prp->prv_data;
+	const dt_probe_t	*uprp = pcb->pcb_probe;
+	const dt_uprobe_t	*upp = uprp->prv_data;
 	const list_probe_t	*pop;
 	uint_t			lbl_assign = dt_irlist_label(dlp);
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
@@ -636,9 +661,9 @@ out:
 	return name;
 }
 
-static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
+static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 {
-	dt_uprobe_t	*upp = prp->prv_data;
+	dt_uprobe_t	*upp = uprp->prv_data;
 	tp_probe_t	*tpp = upp->tp;
 	FILE		*f;
 	char		*fn;
@@ -733,9 +758,9 @@ out:
  * probes that didn't get created.  If the removal fails for some reason we are
  * out of luck - fortunately it is not harmful to the system as a whole.
  */
-static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
 {
-	dt_uprobe_t	*upp = prp->prv_data;
+	dt_uprobe_t	*upp = uprp->prv_data;
 	tp_probe_t	*tpp = upp->tp;
 
 	if (!dt_tp_has_info(tpp))
-- 
2.18.4

