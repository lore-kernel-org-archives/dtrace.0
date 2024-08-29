Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE5DDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909203; cv=fail; b=pXBZJLl663nKe5DCzXyqdGHFPaUNGNHGsgtwLRWbC/Qdf8IOKihWYMpJ2ExP2JDAX4Ro2R4mMFZy7OSteDmns1xki5LrO86PB4q1R4k4E5Vz0XXYNEDs4CuuniQY88gs7fPVHwVQnEpuybAzXwjmaJ3dHg11S3pJpPA2lDR9dPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909203; c=relaxed/simple;
	bh=m7i6q4IDPMSfcAVQbJyj8BHhaznu8gqheHo7kwezssw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N0qGlBLlg/zKknz5UIvjF4qWFIJj3nacyWtFPD4husT7bKuZbAnYMPU7ad9qy6DG3ts3EF7t6inucEpseWBq9IR3sVHHu8fl/HKvpYGKFJfX1RxRpZ5DnksFDOON3glAqLqsHzaUqxaBET0yq3NMwqwTqF0CvWox1i9+tlBomJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AB6+Gg18; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lv6OO3Wu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AB6+Gg18";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lv6OO3Wu"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fjxA028824
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=hNAjOcbf+eiQhJ
	fiesUzhhWPbH2nKcx4oUkXza3g7V4=; b=AB6+Gg18jm5HQbBngPqDQWfIdbUnmf
	2B9B4hd57lwFYk4TgiQTaBvBNV6fyuc1Oyhth69wsyIeY7mwDUl50lYa5W5oxvWA
	dEcoYehIy+8HW800fAeuEfNFFPfQ5wZPRgY7sc4i6kt2CNMDUhZT7LTS3IL/2/aO
	EAPuYl96ltqfhLsPVcK5Z7ph5cjcOrEWODan0t4yXruxbQAl8G4h/fXxuGOCKio/
	2rSPLut1Iqks6vFAGgxZqvjvAgIAlcKnPGy4judY0LosU669cQ5HLI9FYnWs5JE4
	uROqupvLHI99SdqyYCWrEah+3t7dX8j7fwyfGNsPpsLDiqq5MLiy1LtQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwv39s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4Qkk9016855
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:36 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5unmkd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKvmSZVf/ByopyW2vQ1TzpKTAOQOhwp9LFus2OL+khbtFqNQq29SwK3W6nztUsrpyr/I8Em0j0UK5NW5thjDdeR3BG3lqCtd3Wb7nNyzWN/wL8oPWz+9eaZQqT2Z95jZmLwpVtKU8oUOXCWBBt4p3sXSQq+2ug6ilIe65RurnbiKG+lj96WTxBN6cn/fkX7wI+O+z/6fujaNycXriZ8qPII9OHWCv8eunehDusNfd5nvOUuI4V0wDu75a8zrqmmtnG5M38ooYgSzflwB6aRIXAoz/eRqiGXE87rOwV2PiD4AhUum6hN+T6VYsp9TWuKMixXWdiPeBkBSI3JwpukX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hNAjOcbf+eiQhJfiesUzhhWPbH2nKcx4oUkXza3g7V4=;
 b=SEzYXrR309whNDQ9988O5/l8p0V/3Khj0u454YHMX2BP2QDc1ZPsvC+2xmwZAUvjUhBY7UsWLUJI63sgR8yGs2CL9LiFfL5eUc9vf87eoEnc9XIa4WyryQr+N3KJk6DQcKu8yeTV8YnWMWyuw+xYgggsVqmcaH5A+stJaw9fVeczrneAqmntOKyaW1elp2Q1HdmTiNPRZQwTAm5AvIa1xylXd9U2DAr19pSdg47xwZC7JmDtKlPdTRiqUhxxJ5ExG9+glgEviHVyRHkzykNjyhFitawcL3MFnxjBkpNd2cg8yRvJ8s4sL+D8P84vxYnFvuj+YUxPsW+NdVKFe6UyiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNAjOcbf+eiQhJfiesUzhhWPbH2nKcx4oUkXza3g7V4=;
 b=Lv6OO3WuuebNUIoxcbU5yieZc6VscD8eI7Z8SEvcdHVZnqoYUFdfDEuyh3b5WnZXpsDcTYsrWMLxo4UIj0xXhAQwIfdwUt1jnG7Jpf7ck5W0mIw9SyhFZNJUvlhiUrlywDBGmxwg9giIdumsRU5B2Jb3CEhVr8epZdWUbvmjk4o=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:33 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:33 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 13/19] Get rid of relocatable EPID, dt_nextepid, and dt_ddesc[]
Date: Thu, 29 Aug 2024 01:25:52 -0400
Message-Id: <20240829052558.3525-13-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: de2e3d55-0c48-4e97-a35d-08dcc7eb2533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YXu7voUscuEiEslAWZY5PnWTY4p4tojr8yT2zh5O8nX1DkqTL4fnAMYNLB56?=
 =?us-ascii?Q?x5KAxhKuiFpI+QuH/4GxBVV8hKR5jTLfiO/BP6sRsfADFv2CwqBKr4+qlfZ2?=
 =?us-ascii?Q?mXygBFG7BYp4i+ba3jADRsMMlKcew4KbSUUHrlWNv4VuxkZ3JPrT0lB7YqW3?=
 =?us-ascii?Q?2uHmKM0/wNcUa3ZbUyGjBenN8hEqngNRs6hOTz1fRcIm1Q9kkV50YjIGTwlg?=
 =?us-ascii?Q?/3HEY4FmfPyqGXOAlUgJi+EYw+OOFuzZYKP7B52XfbD83l1dL6AfmKP4m50O?=
 =?us-ascii?Q?/gdDb+fEi5nfRtgolW/COkCuu+nH5xricnaG2C78x0rn5sjPiUemb9TZQww2?=
 =?us-ascii?Q?aOFlVBrqtMoA8Gxs0WEE9eXjJnZ+KwwQC3EnYQhMHPWJW+AJQoWawPPImyAT?=
 =?us-ascii?Q?W2sZW9IofP7O6Z+4omrMryHX4A8zhQFNcZZFXvxzX92i8t2xcr5JoWpxJE8W?=
 =?us-ascii?Q?pdSisJX1xEu/AmocNh6kjMLpyLplrd47QP62ElgjBJmR/h06gEdao/b0Bs5y?=
 =?us-ascii?Q?N0AWDRG9Bu+Tmu4raHYnGe8gZNTlTPpQKktkQ5RiSbKBBxMDU1i5EaVhS30B?=
 =?us-ascii?Q?6DL4cXz6TnVE/52nAgQJ8e32jQw7h/zYRMA2oIl9auQ/zlbCbO5SoGd0bSTh?=
 =?us-ascii?Q?KbSy3Xcq1JznMgunbj6tOgAdWulPeVWT21uVjS8uRXLLaqrGmkj5TBb843mC?=
 =?us-ascii?Q?kGYj93viKywlpECgLHQutcuUaP3GMwajVr0eFe16pzfACkqyUNmt17o2haSz?=
 =?us-ascii?Q?JFZ0rKIoQxKufb2GBBnmAghptdCOgg3W2qYNMECHBjcWNrsk1BoSmwh3MGS5?=
 =?us-ascii?Q?IGyJLI9l6Y88HJGs6yOUeuM24i1TvYCANPwQWVDOyWS22uhaFTXvETnpxXke?=
 =?us-ascii?Q?h48oP17jYt+z5HEnBruNgmajhTxWRgGZxYyfp8jXfOMPHEBdh0ZVuOf9F6Rn?=
 =?us-ascii?Q?sZgDX8Fk8GxqRMbUgZaPLr+DqCSqmSw0BBl/EoFvqStZ+1FdEsH33gz9xU/A?=
 =?us-ascii?Q?OARdMda4g/zvfVTi1CkCWgA9s1xEZQ0rfuUxFiYNXhL1QlM4OSbkYhSua6hU?=
 =?us-ascii?Q?X1ynslRVN4OktWJma6uTGjMJxLNuhdPKwV0M7fZ65SHUeXuMcJtsMei2+BTI?=
 =?us-ascii?Q?MzGJHEcDaj9ixPJ9I31kHVBaZKVPH8gSdzuEnqG/ZpguP8tORmOsKM9MExZ3?=
 =?us-ascii?Q?LfaPDSmcQ4oDaLHgSVQJTPJUYr9+0NmhOKOW1cSItZif1ybtw0GacxsfX9o8?=
 =?us-ascii?Q?G3dMDpHG8IIhjYSCIOCOrLDvu5OmYdL4V4aNxKulkeDzVUeTdnvm+jWVL18g?=
 =?us-ascii?Q?FiWmyiJIzR4EE5XmpCbdNjBXlj4/VSkqTSe7dsVLsgAN5g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HXVwBmYai84ukHM/4FK19dZPWTg7QvJsp8ULaS5vy0PGBwn+t07ElOPCVHG3?=
 =?us-ascii?Q?xpw230as8aZ1VnoQ69VMQEIHV5ZbUCfqDHCzC8Vs2Z3HEVr5V9q85gpeSpZB?=
 =?us-ascii?Q?8KzU5FkB0Pg4kTdSsorw8h9L2hYv2xJsaJ5bDEiVBw1GkGX5TwxHPHKv6mAv?=
 =?us-ascii?Q?H016DKFgtNsL9rDkPhhmr1WnyPVLKDZ7lNtBufF6FfQE0SG+dPpTb2ZSajwb?=
 =?us-ascii?Q?9rl5g/qFrluiqaxxo7rh8vNnCeyiuEnyIQjTCML67EIlueJadsV6ci8V1s3g?=
 =?us-ascii?Q?vwF6rQ1f6kE7CLhYLiL64ypMVi8I3Qu7IsSQZSJ7GCkZsJIimUhtiHBJMijj?=
 =?us-ascii?Q?1SeW1wLYU4jUvrAJp8cF07uRowODpF0VN+ckLMBhNV8rZhjAhShF6Sk5MEr0?=
 =?us-ascii?Q?3CWLZ6oPxEMTOisvf/EJHzQDNf2T5yF02Z5FT+xNUc1PzmquT38dpprfnRmE?=
 =?us-ascii?Q?JDcGwvCqqq591JkgVrmFfuAoHRmvX6EJnjAZrm+ROhjCCt4/fHOfEfXx/lMR?=
 =?us-ascii?Q?YmIQpmvNvDoPmai3u6MaL1MrlX3SJT3ydASPPGLId9lWDcs0I/0XoXDGtp7j?=
 =?us-ascii?Q?xN5qWfLvrsaJV9M1q6A/kkFnjDKPYQXKfMFA1j+wbQtQTGlxp9knom69Qjbi?=
 =?us-ascii?Q?AhjC1Cbl3+FB0O5XQJz3D1gLs9AG1cAr2s72MveKjNvJEkMpdsDoUi2aH5DZ?=
 =?us-ascii?Q?T9s3nPxLDcvklt+oUIgxLCqxQ8gFALgp4GM3tTduhgk9xccXDI3XPwKx05Gh?=
 =?us-ascii?Q?BaJP+TlzB698rkduCpFdXPfWpoY1DwCfuSwcecUa1Fct5rKbeH4qCvdcjvxW?=
 =?us-ascii?Q?cfkEPOnOs1g9YTrNSYEwXtgSW1OIAzq980XuArUR5U9Fubasw5aHPLZiFJho?=
 =?us-ascii?Q?vuSmYCpCuR/EqIHjBqsHIjFfJA81dBALBTpW3YUTJUWglgFZvklQgxSzglB+?=
 =?us-ascii?Q?3uRcir2WQK17+PVMCi4kO1p9IXyn45g3ea0d3+oEIJULlk2rOHnteN04bnvt?=
 =?us-ascii?Q?V6IvanmpZJivcJOrJddwexPpV4gHp0frMw4xswASLovzUh9EmZNte4elGss/?=
 =?us-ascii?Q?X44czeClSU6wCRmQwp+9qg4Cb8NJ6avWoYpSrrWu/0vM9L36XiegvO54LOAr?=
 =?us-ascii?Q?qjjSn4dRr+dZLpeUM7bpuj3/yuPXSc62Lz4WDZIPv6S/DRND52lzJe8jfsIS?=
 =?us-ascii?Q?jUQmnA77t+7qC5rJ3G8cTsOe0ZxBtnyu1oswZ/Vo/GVFp3nCjdBBYQZ76l0/?=
 =?us-ascii?Q?PMBiPpPb6zAvt4j9OvwPDfyXrTcfr3GgGugzvnE1XDYG8J+aZ0IVjsyd0sSR?=
 =?us-ascii?Q?DflRTs4HNfEeiH/d9xmARHoNbahrjCLZYpHctIjBjKOXJJEcQaWjfDM8BXNF?=
 =?us-ascii?Q?W2eigZ6ly/gZeaMO2a6i1ONKDmHK9LSljMws14vwXOKQ5L//+nvJOZewFcvd?=
 =?us-ascii?Q?ujtCaLF3QqNJ6aNo4mo8mZjkF4yB/F+zoVHygsHpuCih0ejx8cTkyIAopitj?=
 =?us-ascii?Q?IjyutIidJwpxZv3i/wxXC76/PZ+5AIYlT1m6+b5kCZX6JUWMDbOAubPrL4eV?=
 =?us-ascii?Q?0EWKN2fgNgcyxKxyy8i/le/Plg0XPg5XzQqZ7/2d?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XmldRFRxGrvmdh2GO0kawO5YXe87u97gBvWo8bsKGfbPe6ekxLynfErfZvYNfKwaYo1s8hLH7EtExX6L92Uc53QqDEaFO9rUVJaS2e73Nyt8FVBei52QLm5FdpFFbznbiPPeuXZhMyU+Y/QCQWXrIDqOtM7shNpXiiSxn95DecExC/mC1d6Hl28Cb+ONr0BzEcoDaEVNUykWIg2V5jYG9NmM2mZwuxiA5nxNdwxlW2nZRKltXEqICNSq5+gaNwH4PzDe3aSNd3K0TZ5n2hqYDulqL+TrSAeCiL4BIWE9poNnN4hZB5LCpdgQNKUZAdkNnwlE3gDhy9XwKomdXycSDmK8qCOCQyIE8kVFOKapY8Q4oQNPXpmCvXd+4HdPeHN3+iSNMG9iO3555mkMa2GWbO+J8HCjReMGE2u+jvK/5jIDOtAVM58ARYoLMoMOXxpNjkRuMnpwCAo0sTK2OlZ3Aon2Fhqj5Npq/nQVlBXaQDVwJjIYL7x2XrA4UmDsHGDhoDqy2RhgxdxQ4p824Yj6iIUgsnzkdWSP1EGd65dIszbMfeR5uXTMYqCgoJHXrRxrZ/yl/sgBWkO3f+J6hj4l0zvqkIZDeAeiW3o8pauaNFE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de2e3d55-0c48-4e97-a35d-08dcc7eb2533
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:33.7294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNagMiMjJ0I/mYCO05NualDC8GCW/w16fmGV/KUqVAcUwAblMZ/wZRilARzrwSoLrHLtV1CH95S1CcTNIksGZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: _R2XvqOx2ni_eIEmDYJSgX_t8rYIBCTk
X-Proofpoint-ORIG-GUID: _R2XvqOx2ni_eIEmDYJSgX_t8rYIBCTk

From: Eugene Loh <eugene.loh@oracle.com>

We no longer have to assign an EPID value during relocation.  So we
no longer need dt_nextepid, dt_maxprobe, dt_ddesc[], dt_epid_add(),
or dt_epid_destroy() or to track an EPID during linking.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.h   | 47 +++++++++++++++++-----------------
 libdtrace/dt_cc.c    | 20 +++++----------
 libdtrace/dt_dlibs.c |  1 -
 libdtrace/dt_impl.h  |  5 ----
 libdtrace/dt_map.c   | 61 --------------------------------------------
 libdtrace/dt_open.c  |  3 ---
 6 files changed, 29 insertions(+), 108 deletions(-)

diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 5b2df264..5981eb0e 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -32,30 +32,29 @@ extern "C" {
 					(dtp)->dt_bpffeatures |= (feat); \
 				} while (0)
 
-#define DT_CONST_EPID			1
-#define DT_CONST_PRID			2
-#define DT_CONST_CLID			3
-#define DT_CONST_ARGC			4
-#define DT_CONST_STBSZ			5
-#define DT_CONST_STRSZ			6
-#define DT_CONST_STKSIZ			7
-#define DT_CONST_BOOTTM			8
-#define DT_CONST_NSPEC			9
-#define DT_CONST_NCPUS			10
-#define DT_CONST_PC			11
-#define DT_CONST_TUPSZ			12
-#define DT_CONST_TASK_PID		13
-#define DT_CONST_TASK_TGID		14
-#define DT_CONST_TASK_REAL_PARENT	15
-#define DT_CONST_TASK_COMM		16
-#define DT_CONST_MUTEX_OWNER		17
-#define DT_CONST_RWLOCK_CNTS		18
-#define DT_CONST_DCTX_RODATA		19
-#define DT_CONST_RODATA_OFF		20
-#define DT_CONST_RODATA_SIZE		21
-#define DT_CONST_ZERO_OFF		22
-#define DT_CONST_STACK_OFF		23
-#define DT_CONST_STACK_SKIP		24
+#define DT_CONST_PRID			1
+#define DT_CONST_CLID			2
+#define DT_CONST_ARGC			3
+#define DT_CONST_STBSZ			4
+#define DT_CONST_STRSZ			5
+#define DT_CONST_STKSIZ			6
+#define DT_CONST_BOOTTM			7
+#define DT_CONST_NSPEC			8
+#define DT_CONST_NCPUS			9
+#define DT_CONST_PC			10
+#define DT_CONST_TUPSZ			11
+#define DT_CONST_TASK_PID		12
+#define DT_CONST_TASK_TGID		13
+#define DT_CONST_TASK_REAL_PARENT	14
+#define DT_CONST_TASK_COMM		15
+#define DT_CONST_MUTEX_OWNER		16
+#define DT_CONST_RWLOCK_CNTS		17
+#define DT_CONST_DCTX_RODATA		18
+#define DT_CONST_RODATA_OFF		19
+#define DT_CONST_RODATA_SIZE		20
+#define DT_CONST_ZERO_OFF		21
+#define DT_CONST_STACK_OFF		22
+#define DT_CONST_STACK_SKIP		23
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 2510db86..b801c87a 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -949,7 +949,7 @@ static int get_boottime() {
 static int
 dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 		  dt_ident_t *idp, const dtrace_difo_t *sdp, uint_t *pcp,
-		  uint_t *rcp, uint_t *vcp, dtrace_epid_t epid, uint_t clid)
+		  uint_t *rcp, uint_t *vcp, uint_t clid)
 {
 	uint_t			pc = *pcp;
 	uint_t			rc = *rcp;
@@ -1030,7 +1030,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 	for (; len != 0; len--, rp++, nrp++) {
 		const char	*name = dt_difo_getstr(sdp, rp->dofr_name);
 		dtrace_difo_t	*rdp;
-		dtrace_epid_t	nepid;
 		int		ipc;
 
 		idp = dt_dlib_get_sym(dtp, name);
@@ -1045,9 +1044,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			}
 
 			switch (idp->di_id) {
-			case DT_CONST_EPID:
-				nrp->dofr_data = epid;
-				continue;
 			case DT_CONST_PRID:
 				nrp->dofr_data = prp->desc->id;
 				continue;
@@ -1212,13 +1208,10 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			rdp = dt_dlib_get_func_difo(dtp, idp);
 			if (rdp == NULL)
 				return -1;
-			if (rdp->dtdo_ddesc != NULL) {
-				nepid = dt_epid_add(dtp, rdp->dtdo_ddesc);
-				clid++;
-			} else
-				nepid = 0;
+			if (rdp->dtdo_ddesc != NULL)
+				clid++;               /* FIXME: dump this? */
 			ipc = dt_link_construct(dtp, prp, dp, idp, rdp, pcp,
-						rcp, vcp, nepid, clid);
+						rcp, vcp, clid);
 			if (ipc == -1)
 				return -1;
 
@@ -1259,7 +1252,7 @@ dt_link_resolve(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
 			continue;
 
 		/*
-		 * We are only relocating constants (EPID and ARGC) and call
+		 * We are only relocating constants and call
 		 * instructions to functions that have been linked in.
 		 */
 		switch (idp->di_kind) {
@@ -1332,8 +1325,7 @@ dt_link(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 	 */
 	insc = relc = varc = 0;
 
-	rc = dt_link_construct(dtp, prp, fdp, idp, dp, &insc, &relc, &varc, 0,
-			       0);
+	rc = dt_link_construct(dtp, prp, fdp, idp, dp, &insc, &relc, &varc, 0);
 	dt_dlib_reset(dtp, B_FALSE);
 	if (rc == -1)
 		goto fail;
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index 060cf28b..140ac9a6 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -74,7 +74,6 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(tuples, DT_IDENT_PTR),
 
 	/* BPF internal identifiers */
-	DT_BPF_SYMBOL_ID(EPID, DT_IDENT_SCALAR, DT_CONST_EPID),
 	DT_BPF_SYMBOL_ID(PRID, DT_IDENT_SCALAR, DT_CONST_PRID),
 	DT_BPF_SYMBOL_ID(CLID, DT_IDENT_SCALAR, DT_CONST_CLID),
 	DT_BPF_SYMBOL_ID(ARGC, DT_IDENT_SCALAR, DT_CONST_ARGC),
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 2378235c..3fa2b9d7 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -343,9 +343,6 @@ struct dtrace_hdl {
 	ctf_id_t dt_type_symaddr; /* cached CTF identifier for _symaddr type */
 	ctf_id_t dt_type_usymaddr; /* cached CTF ident. for _usymaddr type */
 	ctf_id_t dt_type_void;	/* cached CTF identifier for void type */
-	dtrace_epid_t dt_nextepid; /* next enabled probe ID to assign */
-	size_t dt_maxprobe;	/* max enabled probe ID */
-	dtrace_datadesc_t **dt_ddesc; /* probe data descriptions */
 	size_t dt_maxagg;	/* max aggregation ID */
 	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
 	struct dt_aggregate *dt_aggregate; /* aggregate */
@@ -779,9 +776,7 @@ extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
 extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
 extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
 extern int dt_datadesc_finalize(dtrace_hdl_t *, dtrace_datadesc_t *);
-extern dtrace_epid_t dt_epid_add(dtrace_hdl_t *, dtrace_datadesc_t *);
 extern int dt_epid_lookup(dtrace_hdl_t *, dtrace_epid_t, dtrace_datadesc_t **);
-extern void dt_epid_destroy(dtrace_hdl_t *);
 typedef void (*dt_cg_gap_f)(dt_pcb_t *, int);
 extern uint32_t dt_rec_add(dtrace_hdl_t *, dt_cg_gap_f, dtrace_actkind_t,
 			   uint32_t, uint16_t, dt_pfargv_t *, uint64_t);
diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
index 9011da5d..26f101e4 100644
--- a/libdtrace/dt_map.c
+++ b/libdtrace/dt_map.c
@@ -85,46 +85,6 @@ dt_datadesc_finalize(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
 	return 0;
 }
 
-/*
- * Associate a probe data description and probe description with an enabled
- * probe ID.  This means that the given ID refers to the program matching the
- * probe data description being attached to the probe that matches the probe
- * description.
- */
-dtrace_epid_t
-dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
-{
-	dtrace_id_t	max = dtp->dt_maxprobe;
-	dtrace_epid_t	epid;
-
-	epid = dtp->dt_nextepid++;
-	if (epid >= max || dtp->dt_ddesc == NULL) {
-		dtrace_id_t		nmax = max ? (max << 1) : 2;
-		dtrace_datadesc_t	**nddesc;
-
-		nddesc = dt_calloc(dtp, nmax, sizeof(void *));
-		if (nddesc == NULL)
-			return dt_set_errno(dtp, EDT_NOMEM);
-
-		if (dtp->dt_ddesc != NULL) {
-			size_t	osize = max * sizeof(void *);
-
-			memcpy(nddesc, dtp->dt_ddesc, osize);
-			dt_free(dtp, dtp->dt_ddesc);
-		}
-
-		dtp->dt_ddesc = nddesc;
-		dtp->dt_maxprobe = nmax;
-	}
-
-	if (dtp->dt_ddesc[epid] != NULL)
-		return epid;
-
-	dtp->dt_ddesc[epid] = dt_datadesc_hold(ddp);
-
-	return epid;
-}
-
 int
 dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp)
 {
@@ -140,27 +100,6 @@ dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp)
 	return (*ddp == NULL) ? -1 : 0;
 }
 
-void
-dt_epid_destroy(dtrace_hdl_t *dtp)
-{
-	size_t i;
-
-	assert((dtp->dt_ddesc != NULL && dtp->dt_maxprobe > 0) ||
-	       (dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
-
-	for (i = 0; i < dtp->dt_maxprobe; i++) {
-		if (dtp->dt_ddesc[i] == NULL)
-			continue;
-
-		dt_datadesc_release(dtp, dtp->dt_ddesc[i]);
-	}
-
-	free(dtp->dt_ddesc);
-	dtp->dt_ddesc = NULL;
-	dtp->dt_nextepid = 0;
-	dtp->dt_maxprobe = 0;
-}
-
 uint32_t
 dt_rec_add(dtrace_hdl_t *dtp, dt_cg_gap_f gapf, dtrace_actkind_t kind,
 	   uint32_t size, uint16_t alignment, dt_pfargv_t *pfp, uint64_t arg)
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 8ae6cdfa..848141dd 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -739,8 +739,6 @@ dt_vopen(int version, int flags, int *errp,
 	dt_proc_hash_create(dtp);
 	dt_proc_signal_init(dtp);
 	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
-	dtp->dt_nextepid = 1;
-	dtp->dt_maxprobe = 0;
 	if (dt_aggregate_init(dtp) == -1)
 		return set_open_errno(dtp, errp, dtrace_errno(dtp));
 	dtp->dt_vmax = DT_VERS_LATEST;
@@ -1303,7 +1301,6 @@ dtrace_close(dtrace_hdl_t *dtp)
 	if (dtp->dt_poll_fd != -1)
 		close(dtp->dt_poll_fd);
 
-	dt_epid_destroy(dtp);
 	dt_aggid_destroy(dtp);
 	dt_buffered_destroy(dtp);
 	dt_aggregate_destroy(dtp);
-- 
2.43.5

