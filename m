Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CB22222BA
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 23:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759102012; cv=fail; b=pJXcbFdx0Cq+YjK3KIetIYJhNOFS3oyGPpCYvIYaLYnyRK++Qdbgz17f9vHpm6FC7gvhOuuSkrwZGsMVZa8CNEp/YmMQImGabcERMMnYpp75LIAJi/zY23x3Q+2SD80/Bv06Gd/YMEdhLkoNu7l+bSolEt3WJ+fYnPb4/5SqVSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759102012; c=relaxed/simple;
	bh=fvWgtweTAGVKpGGuphNQUHlHbvehr+LBI6IKQqZCp/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BnzCcRZhdTcgCaQC8NI36sjvsJXvEba6jxRw2RknbSiaR5hvGjCYgamDiqEFrepR2CR910bld3jsCTUUwG1tYrLZebz6ayVDqjS5bTd3739hMGvNSiduwzC5lj4iIQ5sYzdivnm5C5zk8f+tkSPWTdodtWwKKrIndhgF1000lT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dThaAZC1; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vDVNUJZ4 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dThaAZC1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vDVNUJZ4"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMtIeE002522
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 23:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=hIb5uTtFqD3lBVLo0HeWikPXMvBfUtL0sE+rYs5Xjxc=; b=
	dThaAZC1ATn2pkzEmdYy1/L0EKIhUSAaqX9nx4ZloI3yp59jcc2jLobNNpYfsXoe
	MGXf+gzqTA/E9rt+KlIyBImx0l/yBf35JIByU1FE5E1zM8H/UVbEnWh+8EXdqdix
	as3Vwi6TmpHiwbVypV8bqK6kJaT38qyl6obMTkZPIg0Sbaj9fM1cSoPY6FGu5OAO
	b3dp1jfwo8MouJ7CVpML7ewtM7DqByeCz44C9CVa8dnTLMLyEE9AGo+p70CaeYRg
	CypSqliSe2Ch7YMTCfRzLpJ7rzp8K+zUW/71Se5h8AOk+lh2e/A/3oFiTbkWuL5r
	HPu6Kp57ph1p7p3QOq0GpA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49fe0k80m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 23:26:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58SKnwHW008130
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 23:26:47 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010044.outbound.protection.outlook.com [40.93.198.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c6qp8b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 28 Sep 2025 23:26:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrQBoTc8frKyeB/in9TlKcwmCbBwwIxnilPn8LYTDvD1pqX+QCjF+3qvzuL2pP+htuV5ZgRJAAMFu/W1dvjzEXGEv8GLBHc6T7OvMvLK/jy3nklSuwK/Rgk4WeXZTVBvSAOcB1kJYG9N90fqmN1fHvd1i2Y9sjNUDcl+yhfxCsYuJJqVdJLIK+3p+nsGIRSF3/l3yWGJmu1UdZrFTcj5YZJvzcA3yGxfkwia43B+O/jOGpa+BOSuc/vHLvyyqiRs1anwB5LJBFQaJ59zbTI/VkjSbA7Ep2ZOTikI69roRO+M1Rdr2G193RQ/YloToL+P3hRPNLOeqD5/KkMe7evtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIIc91Gq5hnqfE9n/wlJZA/q+VwqbKGKo6Pi34E+Gi8=;
 b=KUJBF5slrx+stnHvbP5Dq8FF/eSYABjTe9ATQKbm+YsvsWzZlwHEpjBqanVMTersqpHO0aMlG90/W+QDQjjlCPxSqmlg/mDIPTC34t1tdVmNbmSrMMFjALUAtZHgeBq7AWl/J6BxWngvBrqw3RbWnxEekMLCUBniDksTLApMOVK8Y7z6e5eH+GjRGBKP+0grXwlQUha/NOIDKbUQkU0OxmHOFZU5vcdqBWMNvWpVhLBNPNcg3XDZHppOmxsp1b4c19CGdVRc5/flR7LAyif2g+4JjEIZJM/P/cnOpktTrblkq966mu9FjJeQEnI68JkF9x5/ACkzbuuLZcwkkUylwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIIc91Gq5hnqfE9n/wlJZA/q+VwqbKGKo6Pi34E+Gi8=;
 b=vDVNUJZ4Kl3uDxRz/YWvPCOa7r5sRWP+pXG11ZeaWSo2fLQARLTPP3vA/1ZoGQEMRYBlzmusHuX99nD6dPwQ9o34Zwdsc8xBSEhwelVgdIv3CwQuvGD01xDkcm2eQPX8+O+f7+ccbbWeaf3rK8yeRoU00QoYNWmFXw9vR1UWGhA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by LV3PR10MB8155.namprd10.prod.outlook.com (2603:10b6:408:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 23:26:43 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.015; Sun, 28 Sep 2025
 23:26:43 +0000
Date: Sun, 28 Sep 2025 19:26:40 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] Unify the handling of stack traces in the consumer
Message-ID: <aNnEMAcUWAHHayGU@oracle.com>
References: <SJ0PR10MB5672DF8DE55F2405F015D86BC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <dd3f36f9-af02-7cd2-7d05-39c9250fd89a@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd3f36f9-af02-7cd2-7d05-39c9250fd89a@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|LV3PR10MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a49144-979c-4c12-501f-08ddfee67b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?naoR/SS8/C/Ryo3QmoYovgFHkBkBR5hB0qcH814tvDtB2hkS8C4L9HdVmB?=
 =?iso-8859-1?Q?FadYDb99hDKOf72hRkZzeOcQSGvwzfW3PUDCTv5qKr+ZnAg+Y1eQk/5pqF?=
 =?iso-8859-1?Q?SyIB2Fe11zaf5SFBMiyxoFxELbBQQgbXwSr9yYIG+++Uk0QITj/HhelA93?=
 =?iso-8859-1?Q?O5alGMt+qvwU4R3RMCNl7VOQb7N201Hm9renP5mPf/oEzeIqhXzk6t1mnE?=
 =?iso-8859-1?Q?IVWWzglwOvfiz+CHsO632HXBBnrWWsQZcQDhizn/iZfvzr1Irk2dUyZsFe?=
 =?iso-8859-1?Q?ZgGtJ3xBJKbp8jeTIKC2xOCahFjFLrDyB8OTz9x9Ct7ksLEwpytxIO6VEW?=
 =?iso-8859-1?Q?BeOM5yCijZH147qJ2LjHaE9/o2mPvLuhrsaN29BTgs5NhH2St/jdrP4lhF?=
 =?iso-8859-1?Q?ChX9nzPZ/FDlvXOzDjlaAAaEI7RhS4u+OP8aiBQuOe17kDCnwIPzU0Akvq?=
 =?iso-8859-1?Q?zx07zln75RHVUf1Gs7oGjl5XK3hjbvLHUq8Vwxgym+Jp4k5f8ieusFu5J7?=
 =?iso-8859-1?Q?6/TS81MufXb17uB3ZggSscHCq1tDDqB6S26xJagW6GSOkyEZDqjLnFwyd+?=
 =?iso-8859-1?Q?G0duNyqjxuirXDW6X0S7ABSqHDnLFv726PSA/B4f7G3NqhR3wyO+4zVoiG?=
 =?iso-8859-1?Q?uw3dw8clfX+ezC2xuzOYMBQnnZaaDOqBDtREYuThhjWyqzHFThC1pX4Ug7?=
 =?iso-8859-1?Q?AGhoK9KUTg6+eBWSXDqe2moRUXbToxWftJX+KoQQF53eIvEoYRPAC+lXoW?=
 =?iso-8859-1?Q?FfTx7A8OtucNM+QbInCCiHo1TwAKmOpwoKVgx7GYz6/DSTN8LTigwOif2F?=
 =?iso-8859-1?Q?3xYEL+q8jGTqMYAmW43XLgTKWNqxyGAYr1QD33HG8NaNQPbWu9SQ74uQWo?=
 =?iso-8859-1?Q?V7ijW1KSjeek+gpa0u64plgO9lMlmX9E4wtvsuCpXeov3LfqjQtIisWBtn?=
 =?iso-8859-1?Q?pAoxArWQXpFSwA6nraBLt6P8MYwrf3Xib1IuDzV3BUX/gQ90WIt9dp/XeY?=
 =?iso-8859-1?Q?93b3hSueuoX9h51FesRQFD0k03JspiTM6wg9+HgBkgd1RtAPtiUrFuqvHP?=
 =?iso-8859-1?Q?w13A9wAUnMgZzwqTF5nH3gXCiEV2AddAKQstcgHn3Po8Igdilm5N2gbo/7?=
 =?iso-8859-1?Q?X9MvXcOP1aulYO9PDltmCzhFl5FEGJzg7coAOEp1TykhmLDJdBK1Yrcep7?=
 =?iso-8859-1?Q?dR0dtwweZ+iw3IiPKN40VTUtKmD0KNdfUnXp+4HjJM4rs3m4Zvx0wcflYc?=
 =?iso-8859-1?Q?rg7JBgQ8b1BdiLLGW9UL3LRLBTwryhDRh/F6Hj3KIu/jfDDI7FOX8YT9P/?=
 =?iso-8859-1?Q?upZocFUoHRjjqwtUGo/VLpI59SOYuoYpAUnH75mEQryx1cqOJpxGfhPun9?=
 =?iso-8859-1?Q?t+MTo9DVJwyaMVLgikqd5CiLoKod1sHButYRSSjTvX5yB0qxBlH5MgAUmc?=
 =?iso-8859-1?Q?NQgvrg8GUsv0WR+CLwjTXRx3VqSv4c/S3apg5jhHfoC+PolfxtaAtS3lhG?=
 =?iso-8859-1?Q?LWModA+pP9f6vOh9A59XfU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?8fHPzwlCJGSLIEpNIq3ohLp6R5n+Q8h26jSUt6YYM71JKOedOabEVp3e4m?=
 =?iso-8859-1?Q?sQtMXt5F20EScStlQUWb8UMJX7wfxBG6DDe4PS8XvL/i3PjyR1ogzpMxSS?=
 =?iso-8859-1?Q?uGdL5os9AimVAY31F+3kPSXt+l5I7ng6NON3QY6i72m0iNWFQT1LP9ARN+?=
 =?iso-8859-1?Q?Aaz54iQsgcHQV8jSVEQmcE7JrI4xoW+3mQhSfmokANKf50YeHa0r7ropRs?=
 =?iso-8859-1?Q?AW/ZHb+kOuy+UwXiCWOxu6eE54nzKqCMK3no2voAffZjmJiMVk05PSIxxQ?=
 =?iso-8859-1?Q?Kft51tDd9Zc8UojVO0X+VFqrOBRTKYfpL+V+6DQCgm28B+lAfI0wZRrHwV?=
 =?iso-8859-1?Q?5tRs8qcIIM8whczseAHEKPvX+C4Bkwloo7+0xcnWGz03LLO1sR03A5qAv8?=
 =?iso-8859-1?Q?El07dZLCxBc5Mvf3/Aw8q/0uybKCJZqhCIDSjidR9aRFfbW4dExzfTLO/0?=
 =?iso-8859-1?Q?5Df7R9U6X3q5ODf0tVvXaLjX5g8PCSdwKOhPG1HmQk4+agDPc2RdR7jUa0?=
 =?iso-8859-1?Q?EBDk5br+tJ05/hJl54T4gOtAy/8JsTLTXEo6fuJY918Fk46f2uI49zGr+Y?=
 =?iso-8859-1?Q?up7WJsPxDmvopkaCSpJxfnzKbd6LjGMr3/DRpSi8l8TgTVzCvxYULCPmKh?=
 =?iso-8859-1?Q?cYkWSMQcE0psHtWawevlRvVQ4+A3QtwkazKehWUcYNVAJXanptRmNfHobn?=
 =?iso-8859-1?Q?XdxqxeWFVZkvONyY7N4ZOjEZn+6qk3hCwI8bICSSA7E0NCFKbIFNCtfX/m?=
 =?iso-8859-1?Q?mi12kSBnsbZ636OqStaGg4f145RA9oyEwUowf7m6ReC264rzavwd7/+r4J?=
 =?iso-8859-1?Q?9Q7WPVAcC/ESHx5qO3HABaAhltFRQyMIJPjAD2ZP3cJ8r/3TvCOhN4beMK?=
 =?iso-8859-1?Q?rRDz9ZLYj5i1pslV5oax5sce9QBziPNBu1dhFQehc7ZcbZVO9iV9b45+pR?=
 =?iso-8859-1?Q?56Alb1jChqJaZ+y5FpmEcF+TBfCs3RW+GxqQORz4Gko+UacwmX76VP5cDq?=
 =?iso-8859-1?Q?FIwjocFChwT+lu/vZ9Sz6biXoNAhYtpqj6SpFOKJGLvzrDcvTAhXp1dV75?=
 =?iso-8859-1?Q?Onf6l7jn6TGzDMUj+hFVOs2UwHOODRr6yANlKhgjSoWtYv4VL0LgCINhjO?=
 =?iso-8859-1?Q?Bq82sHb+unLvdMbhYkCRf3ogrqqk8YtRHB6V9C7PnvvvYIt58nu685s1kA?=
 =?iso-8859-1?Q?JlxBN0ECj3OcDH9fZTgayR5K7GKEy54+8nzX0BMFwUh6xnzmbkwQVi9/jd?=
 =?iso-8859-1?Q?4oRxQ1bl9rXmblQ5h4tmAVktzLXIgnBar/Uo7ZqY1aIcbZ3/c9aJ3/Om10?=
 =?iso-8859-1?Q?rql5tm9PfGerhrnLaKxrrnFkeb2QUO6eAJWEiGSF3wrorLfzxc63AjOm1O?=
 =?iso-8859-1?Q?4fcNklLM8qsEwfxECrndLom9gwl+iHN35DbCR51UR2i+kA4KgeRSAD2HXp?=
 =?iso-8859-1?Q?uR3umDHV6JlHGRQux3bGSeLIKsPk83zMBCznKFEbJl5pxL7R4ex0nHc4Mr?=
 =?iso-8859-1?Q?v7Te05zY1vv9nt0zNpgbusfUW0TMDP6IxYi12rADHbB5Onv4WKGne7/e3H?=
 =?iso-8859-1?Q?nTkw18TJqnb84+rhcPbKHdoZWpwu8rosNqNQdzO0uYeGebNZ3UgOrALVn1?=
 =?iso-8859-1?Q?Kr9sU/7jn8Hn2OjwS4rWYc0uBPYBkYEseW/CxJxsRD+cYZ/VPc8iSP3Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hbs/V6fpenddYpOmb5tmGLZY71SRkgMZtMX7Hdx5vzAqEo5DsxSNbv4zWImRB4iKEPiKZ6qJnhxN6H03NS+L/jSMAyLUZ00SiiWJKmBhrJn4VBHJc7XwmMDq8JcbXugn+mexoyKFP+DlrIOc7Su/+ekD7JHdBiJQZpjyPUPw14PnlfZCSB4eT+mSUt8OT+cKFOYDVRuciz+qps/st4P2i2Bg8n1kYEEKkJZo0vW88emeS12G7atTM6cz1RvuOn3bpuFctRNjiNBFw2urPyDCE0RxLpt08zaeKlq4Drsr1t7DMiu8aCQvWZKAH5P69hc2dorSdCOxICe8OwCUKpS125S83vTPkVI3kOoT1SLXKNXHL3LIeBnxEjfposBBtSEf3bDap5u9BOCBTVjDJjuI3JgyFK5m7EItcuXR1WNdlLC8F6JOrOltOI2Ub4lfe85dJOr7pRghPkrUi1sKMhM+K7pYVJd3M8Ag/I98n32M1D4yrSbSFLvnWp+P5jUITIXUpSHo+I0O3lrhoQapJS8/iYh+GoK7gbFZ3LKDoHrkPfceA4NHSKLmk4lhCOgI8k4u3TQ4zTqRRYa/equpr+R8XqVgw7wg2uo938h0v7hjst0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a49144-979c-4c12-501f-08ddfee67b9e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 23:26:42.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZIzSZmH9k0T1+HA9ZfJxc6QxWhBmmS7rccjWSCWKjsmlfUC9nt8MtWPCspa/Jvcx6jpsvpLtwNdXXHOuDErKYsSDf7UmKTls+XoRwsh19p0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8155
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_09,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509280230
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI4MDIyMiBTYWx0ZWRfXzhaTo341PSZg
 TG5lSxzOGiMC58MnajfiqmreXt60WB+GncjMZwG35sDLctedHZJ95JwyKd6sSVAQqeIJMVMX1MZ
 G+6+pFEHrvK3npfh0e6/z6Fk1KqiOfxcUSKZrC2ws9NIZL1G6l/fZGaYzWm8WgM8QNbaJK5PQh0
 j4Rs2lHCzkF9p88qYndXnDJ4GvY1hzHaKZSPN1CFzqgu9bfvOKlqIOpaGlcLHXQbg5RABg0iLA8
 dIKm8Ukg7P3R5vzWuxPCYVb6Nllc04/nNE/QGQRQT4KkEgDXcmww/fiN3CRLtb38vHbZ5WzMe60
 ttGy9u7r/jWtEzGYKZ1ybeGXCqY3LhqOkQ8uB0Jv9lEh0dqSfOpKF4vDNz/xavTtC9Duc0Zcl9I
 DQm8kNcSUXE8z1NHUHYr2qOPNSZs8g==
X-Authority-Analysis: v=2.4 cv=K5Qv3iWI c=1 sm=1 tr=0 ts=68d9c438 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=_BV9hzwGWiyBzwSZpXUA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: URYJRqPeJzUYK43Ri3R17BfEufeGuu2T
X-Proofpoint-GUID: URYJRqPeJzUYK43Ri3R17BfEufeGuu2T

On Sun, Sep 28, 2025 at 01:50:02AM -0400, Eugene Loh wrote:
> I guess my only meaningful comment (admittedly not huge) is that in the
> (new) dt_print_stack_user(), indent is passed in but then it is calculated
> inside the function.  I'm guessing the computation of ident inside the
> function is vestigial code that should be eliminated.

Hm, yes, will fix.

> The "That is far from ideal." sentence in the commit message is pretty
> vague.  Not a big deal, I guess.

> For kernel stacks, I guess size is always 8.  Could mention that? Also not a
> big deal.

I am not sure what you mean by this?  The size of the data that is set aide to
store the stack trace depends on the number of frames that is requested.

> On 9/23/25 12:01, Kris Van Hees wrote:
> 
> > Distinguishing between kernel stacks and userspace stacks was done
> > based on the action id, even when used outside of action context
> > (i.e. in aggregation keys).  That is far from ideal.
> > 
> > Encode the stack type along with the nframes and strsize values in
> > the data record description argument for stack() and ustack()
> > records.
> > 
> > The macros for managing that argument are moved to dt_impl.h since
> > they are internal to the DTrace implementation.
> > 
> > All printing of stack traces is now consolidated in dt_printf.c as
> > well.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   include/dtrace/actions_defines.h |   5 -
> >   libdtrace/dt_cg.c                |   6 +-
> >   libdtrace/dt_consume.c           | 256 ++---------------------------
> >   libdtrace/dt_impl.h              |  13 ++
> >   libdtrace/dt_printf.c            | 266 ++++++++++++++++++++++++++++---
> >   libdtrace/dt_printf.h            |  12 +-
> >   6 files changed, 275 insertions(+), 283 deletions(-)
> > 
> > diff --git a/include/dtrace/actions_defines.h b/include/dtrace/actions_defines.h
> > index 1a9c1a81..7c2f7dda 100644
> > --- a/include/dtrace/actions_defines.h
> > +++ b/include/dtrace/actions_defines.h
> > @@ -156,11 +156,6 @@
> >   		(uint16_t)(((x) & DTRACE_LLQUANTIZE_FACTORMASK) >> \
> >   			DTRACE_LLQUANTIZE_FACTORSHIFT)
> > -#define DTRACE_USTACK_NFRAMES(x)	(uint32_t)((x) & UINT32_MAX)
> > -#define DTRACE_USTACK_STRSIZE(x)	(uint32_t)((x) >> 32)
> > -#define DTRACE_USTACK_ARG(x, y)		\
> > -		((((uint64_t)(y)) << 32) | ((x) & UINT32_MAX))
> > -
> >   #ifndef _LP64
> >   # ifndef _LITTLE_ENDIAN
> >   #  define DTRACE_PTR(type, name)	uint32_t name##pad; type *name
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index 1f120e1d..2b81f2e0 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -2701,7 +2701,7 @@ dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
> >   		strsize = arg1->dn_value;
> >   	}
> > -	return DTRACE_USTACK_ARG(nframes, strsize);
> > +	return DTRACE_STACK_ARG(kind == DTRACEACT_USTACK, nframes, strsize);
> >   }
> >   /*
> > @@ -2738,7 +2738,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
> >   	/* Get sizing information from dnp->dn_arg. */
> >   	arg = dt_cg_stack_arg(dtp, dnp, kind);
> >   	prefsz = kind == DTRACEACT_USTACK ? sizeof(uint64_t) : 0;
> > -	nframes = DTRACE_USTACK_NFRAMES(arg);
> > +	nframes = DTRACE_STACK_NFRAMES(arg);
> >   	stacksize = nframes * sizeof(uint64_t);
> >   	/* Handle alignment and reserve space in the output buffer. */
> > @@ -8698,7 +8698,7 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   				case DT_ACT_USTACK:
> >   					arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
> >   					kind = DTRACEACT_USTACK;
> > -					size = 8 + 8 * DTRACE_USTACK_NFRAMES(arg);
> > +					size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
> >   					break;
> >   				case DT_ACT_JSTACK:
> >   					kind = DTRACEACT_JSTACK;
> > diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> > index 280ed42a..eca2139f 100644
> > --- a/libdtrace/dt_consume.c
> > +++ b/libdtrace/dt_consume.c
> > @@ -1079,232 +1079,6 @@ dt_print_tracemem(dtrace_hdl_t *dtp, FILE *fp, const dtrace_recdesc_t *rec,
> >   	return nconsumed;
> >   }
> > -int
> > -dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> > -    caddr_t addr, int depth, int size)
> > -{
> > -	dtrace_syminfo_t dts;
> > -	GElf_Sym sym;
> > -	int i, indent;
> > -	char c[PATH_MAX * 2];
> > -	uint64_t pc;
> > -
> > -	if (dt_printf(dtp, fp, "\n") < 0)
> > -		return -1;
> > -
> > -	if (format == NULL)
> > -		format = "%s";
> > -
> > -	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> > -		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> > -	else
> > -		indent = _dtrace_stkindent;
> > -
> > -	for (i = 0; i < depth; i++) {
> > -		switch (size) {
> > -		case sizeof(uint32_t):
> > -			/* LINTED - alignment */
> > -			pc = *((uint32_t *)addr);
> > -			break;
> > -
> > -		case sizeof(uint64_t):
> > -			/* LINTED - alignment */
> > -			pc = *((uint64_t *)addr);
> > -			break;
> > -
> > -		default:
> > -			return dt_set_errno(dtp, EDT_BADSTACKPC);
> > -		}
> > -
> > -		if (pc == 0)
> > -			break;
> > -
> > -		addr += size;
> > -
> > -		if (dt_printf(dtp, fp, "%*s", indent, "") < 0)
> > -			return -1;
> > -
> > -		if (dtrace_lookup_by_addr(dtp, pc, &sym, &dts) == 0) {
> > -			if (pc > sym.st_value)
> > -				snprintf(c, sizeof(c), "%s`%s+0x%llx",
> > -					 dts.object, dts.name,
> > -					 (long long unsigned)pc - sym.st_value);
> > -			else
> > -				snprintf(c, sizeof(c), "%s`%s",
> > -					 dts.object, dts.name);
> > -		} else {
> > -			/*
> > -			 * We'll repeat the lookup, but this time we'll specify
> > -			 * a NULL GElf_Sym -- indicating that we're only
> > -			 * interested in the containing module.
> > -			 */
> > -			if (dtrace_lookup_by_addr(dtp, pc, NULL, &dts) == 0)
> > -				snprintf(c, sizeof(c), "%s`0x%llx",
> > -					 dts.object, (long long unsigned)pc);
> > -			else
> > -				snprintf(c, sizeof(c), "0x%llx",
> > -				    (long long unsigned)pc);
> > -		}
> > -
> > -		if (dt_printf(dtp, fp, format, c) < 0)
> > -			return -1;
> > -
> > -		if (dt_printf(dtp, fp, "\n") < 0)
> > -			return -1;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> > -int
> > -dt_print_ustack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> > -    caddr_t addr, uint64_t arg)
> > -{
> > -	/* LINTED - alignment */
> > -	uint64_t *pc = ((uint64_t *)addr);
> > -	uint32_t depth = DTRACE_USTACK_NFRAMES(arg);
> > -	uint32_t strsize = DTRACE_USTACK_STRSIZE(arg);
> > -	const char *strbase = addr + (depth + 1) * sizeof(uint64_t);
> > -	const char *str = strsize ? strbase : NULL;
> > -	int err = 0;
> > -
> > -	const char *name;
> > -	char objname[PATH_MAX], c[PATH_MAX * 2];
> > -	GElf_Sym sym;
> > -	int i, indent;
> > -	pid_t pid = -1, tgid;
> > -
> > -	if (depth == 0)
> > -		return 0;
> > -
> > -	tgid = (pid_t)*pc++;
> > -
> > -	if (dt_printf(dtp, fp, "\n") < 0)
> > -		return -1;
> > -
> > -	if (format == NULL)
> > -		format = "%s";
> > -
> > -	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> > -		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> > -	else
> > -		indent = _dtrace_stkindent;
> > -
> > -	/*
> > -	 * Ultimately, we need to add an entry point in the library vector for
> > -	 * determining <symbol, offset> from <tgid, address>.  For now, if
> > -	 * this is a vector open, we just print the raw address or string.
> > -	 */
> > -	if (dtp->dt_vector == NULL)
> > -		pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
> > -		    DTRACE_PROC_SHORTLIVED);
> > -
> > -	for (i = 0; i < depth && pc[i] != 0; i++) {
> > -		const prmap_t *map;
> > -
> > -		if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> > -			break;
> > -		if (dtp->dt_options[DTRACEOPT_NORESOLVE] != DTRACEOPT_UNSET
> > -		    && pid >= 0) {
> > -			if (dt_Pobjname(dtp, pid, pc[i], objname,
> > -			    sizeof(objname)) != NULL) {
> > -				const prmap_t *pmap = NULL;
> > -				uint64_t offset = pc[i];
> > -
> > -				pmap = dt_Paddr_to_map(dtp, pid, pc[i]);
> > -
> > -				if (pmap)
> > -					offset = pc[i] - pmap->pr_vaddr;
> > -
> > -				snprintf(c, sizeof(c), "%s:0x%llx",
> > -				    dt_basename(objname), (unsigned long long)offset);
> > -
> > -			} else
> > -				snprintf(c, sizeof(c), "0x%llx",
> > -				    (unsigned long long)pc[i]);
> > -
> > -		} else if (pid >= 0 && dt_Plookup_by_addr(dtp, pid, pc[i],
> > -							  &name, &sym) == 0) {
> > -			if (dt_Pobjname(dtp, pid, pc[i], objname,
> > -					sizeof(objname)) != NULL) {
> > -				if (pc[i] > sym.st_value)
> > -					snprintf(c, sizeof(c), "%s`%s+0x%llx",
> > -						 dt_basename(objname), name,
> > -						 (unsigned long long)(pc[i] - sym.st_value));
> > -				else
> > -					snprintf(c, sizeof(c), "%s`%s",
> > -						 dt_basename(objname), name);
> > -			} else
> > -				snprintf(c, sizeof(c), "0x%llx",
> > -				    (unsigned long long)pc[i]);
> > -			/* Allocated by Plookup_by_addr. */
> > -			free((char *)name);
> > -		} else if (str != NULL && str[0] != '\0' && str[0] != '@' &&
> > -		    (pid >= 0 &&
> > -			((map = dt_Paddr_to_map(dtp, pid, pc[i])) == NULL ||
> > -			    (map->pr_mflags & MA_WRITE)))) {
> > -			/*
> > -			 * If the current string pointer in the string table
> > -			 * does not point to an empty string _and_ the program
> > -			 * counter falls in a writable region, we'll use the
> > -			 * string from the string table instead of the raw
> > -			 * address.  This last condition is necessary because
> > -			 * some (broken) ustack helpers will return a string
> > -			 * even for a program counter that they can't
> > -			 * identify.  If we have a string for a program
> > -			 * counter that falls in a segment that isn't
> > -			 * writable, we assume that we have fallen into this
> > -			 * case and we refuse to use the string.
> > -			 */
> > -			snprintf(c, sizeof(c), "%s", str);
> > -		} else {
> > -			if (pid >= 0 && dt_Pobjname(dtp, pid, pc[i], objname,
> > -			    sizeof(objname)) != NULL)
> > -				snprintf(c, sizeof(c), "%s`0x%llx",
> > -				    dt_basename(objname), (unsigned long long)pc[i]);
> > -			else
> > -				snprintf(c, sizeof(c), "0x%llx",
> > -				    (unsigned long long)pc[i]);
> > -		}
> > -
> > -		if ((err = dt_printf(dtp, fp, format, c)) < 0)
> > -			break;
> > -
> > -		if ((err = dt_printf(dtp, fp, "\n")) < 0)
> > -			break;
> > -
> > -		if (str != NULL && str[0] == '@') {
> > -			/*
> > -			 * If the first character of the string is an "at" sign,
> > -			 * then the string is inferred to be an annotation --
> > -			 * and it is printed out beneath the frame and offset
> > -			 * with brackets.
> > -			 */
> > -			if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> > -				break;
> > -
> > -			snprintf(c, sizeof(c), "  [ %s ]", &str[1]);
> > -
> > -			if ((err = dt_printf(dtp, fp, format, c)) < 0)
> > -				break;
> > -
> > -			if ((err = dt_printf(dtp, fp, "\n")) < 0)
> > -				break;
> > -		}
> > -
> > -		if (str != NULL) {
> > -			str += strlen(str) + 1;
> > -			if (str - strbase >= strsize)
> > -				str = NULL;
> > -		}
> > -	}
> > -
> > -	if (pid >= 0)
> > -		dt_proc_release_unlock(dtp, pid);
> > -
> > -	return err;
> > -}
> > -
> >   static int
> >   dt_print_usym(dtrace_hdl_t *dtp, FILE *fp, caddr_t addr, dtrace_actkind_t act)
> >   {
> > @@ -1355,7 +1129,7 @@ dt_print_umod(dtrace_hdl_t *dtp, FILE *fp, const char *format, caddr_t addr)
> >   		format = "  %-50s";
> >   	/*
> > -	 * See the comment in dt_print_ustack() for the rationale for
> > +	 * See the comment in dt_print_stack_user() for the rationale for
> >   	 * printing raw addresses in the vectored case.
> >   	 */
> >   	if (dtp->dt_vector == NULL)
> > @@ -1660,12 +1434,15 @@ dt_print_datum(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
> >   	switch (act) {
> >   	case DTRACEACT_STACK:
> > -		return dt_print_stack(dtp, fp, NULL, addr, rec->dtrd_arg,
> > -				      rec->dtrd_size / rec->dtrd_arg);
> > +	case DTRACEACT_USTACK: {
> > +		dtrace_probedata_t	pdat;
> > -	case DTRACEACT_USTACK:
> > -	case DTRACEACT_JSTACK:
> > -		return dt_print_ustack(dtp, fp, NULL, addr, rec->dtrd_arg);
> > +		/* dt_print_stack() uses dtpda_data only */
> > +		memset(&pdat, 0, sizeof(pdat));
> > +		pdat.dtpda_data = addr;
> > +
> > +		return dt_print_stack(dtp, fp, NULL, &pdat, rec, 1, NULL, 0);
> > +	}
> >   	case DTRACEACT_USYM:
> >   	case DTRACEACT_UADDR:
> > @@ -2467,14 +2244,6 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
> >   			return dt_set_errno(dtp, EDT_BADRVAL);
> >   		switch (act) {
> > -		case DTRACEACT_STACK: {
> > -			int depth = rec->dtrd_arg;
> > -
> > -			if (dt_print_stack(dtp, fp, NULL, recdata,
> > -					   depth, rec->dtrd_size / depth) < 0)
> > -				return -1;
> > -			continue;
> > -		}
> >   		case DTRACEACT_SYM:
> >   			if (dt_print_sym(dtp, fp, NULL, recdata) < 0)
> >   				return -1;
> > @@ -2483,11 +2252,10 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
> >   			if (dt_print_mod(dtp, fp, NULL, recdata) < 0)
> >   				return -1;
> >   			continue;
> > +		case DTRACEACT_STACK:
> >   		case DTRACEACT_USTACK:
> > -			if (dt_print_ustack(dtp, fp, NULL,
> > -					    recdata, rec->dtrd_arg) < 0)
> > -				return -1;
> > -			continue;
> > +			func = dt_print_stack;
> > +			break;
> >   		case DTRACEACT_USYM:
> >   		case DTRACEACT_UADDR:
> >   			if (dt_print_usym(dtp, fp, recdata, act) < 0)
> > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > index 7d8e4432..4dc4c9a7 100644
> > --- a/libdtrace/dt_impl.h
> > +++ b/libdtrace/dt_impl.h
> > @@ -236,6 +236,19 @@ typedef struct dt_tstring {
> >   	int		in_use;			/* In use (1) or not (0) */
> >   } dt_tstring_t;
> > +/*
> > + * The stack()/ustack() data record argument encodes:
> > + *  - the stack type (kernel or userspace)
> > + *  - the number of frames in the stack trace
> > + *  - the size of the optional string area for ustack()
> > + */
> > +#define DTRACE_STACK_IS_USER(x)		((x) & (1 << 31))
> > +#define DTRACE_STACK_NFRAMES(x)		(uint32_t)((x) & INT32_MAX)
> > +#define DTRACE_STACK_STRSIZE(x)		(uint32_t)((x) >> 32)
> > +#define DTRACE_STACK_ARG(t, x, y)	((((uint64_t)(y)) << 32) | \
> > +					 ((t) ? (1UL << 31) : 0) | \
> > +					 ((x) & INT32_MAX))
> > +
> >   typedef struct dt_dirpath {
> >   	dt_list_t dir_list;		/* linked-list forward/back pointers */
> >   	char *dir_path;			/* directory pathname */
> > diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> > index 1e01d468..4c276c26 100644
> > --- a/libdtrace/dt_printf.c
> > +++ b/libdtrace/dt_printf.c
> > @@ -374,6 +374,205 @@ pfprint_uaddr(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> >   	return dt_printf(dtp, fp, format, s);
> >   }
> > +static int
> > +dt_print_stack_kernel(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> > +		      caddr_t addr, int indent, uint32_t depth)
> > +{
> > +	dtrace_syminfo_t dts;
> > +	GElf_Sym sym;
> > +	int i;
> > +	char c[PATH_MAX * 2];
> > +	uint64_t pc;
> > +
> > +	if (format == NULL)
> > +		format = "%s";
> > +
> > +	for (i = 0; i < depth; i++) {
> > +		pc = *((uint64_t *)addr);
> > +		if (pc == 0)
> > +			break;
> > +
> > +		addr += sizeof(pc);
> > +
> > +		if (dt_printf(dtp, fp, "%*s", indent, "") < 0)
> > +			return -1;
> > +
> > +		if (dtrace_lookup_by_addr(dtp, pc, &sym, &dts) == 0) {
> > +			if (pc > sym.st_value)
> > +				snprintf(c, sizeof(c), "%s`%s+0x%llx",
> > +					 dts.object, dts.name,
> > +					 (long long unsigned)pc - sym.st_value);
> > +			else
> > +				snprintf(c, sizeof(c), "%s`%s",
> > +					 dts.object, dts.name);
> > +		} else {
> > +			/*
> > +			 * We'll repeat the lookup, but this time we'll specify
> > +			 * a NULL GElf_Sym -- indicating that we're only
> > +			 * interested in the containing module.
> > +			 */
> > +			if (dtrace_lookup_by_addr(dtp, pc, NULL, &dts) == 0)
> > +				snprintf(c, sizeof(c), "%s`0x%llx",
> > +					 dts.object, (long long unsigned)pc);
> > +			else
> > +				snprintf(c, sizeof(c), "0x%llx",
> > +				    (long long unsigned)pc);
> > +		}
> > +
> > +		if (dt_printf(dtp, fp, format, c) < 0)
> > +			return -1;
> > +
> > +		if (dt_printf(dtp, fp, "\n") < 0)
> > +			return -1;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> > +		    caddr_t addr, int indent, uint32_t depth, uint32_t strsize)
> > +{
> > +	/* LINTED - alignment */
> > +	uint64_t *pc = ((uint64_t *)addr);
> > +	const char *strbase = addr + (depth + 1) * sizeof(uint64_t);
> > +	const char *str = strsize ? strbase : NULL;
> > +	int err = 0;
> > +
> > +	const char *name;
> > +	char objname[PATH_MAX], c[PATH_MAX * 2];
> > +	GElf_Sym sym;
> > +	int i;
> > +	pid_t pid = -1, tgid;
> > +
> > +	if (depth == 0)
> > +		return 0;
> > +
> > +	tgid = (pid_t)*pc++;
> > +
> > +	if (format == NULL)
> > +		format = "%s";
> > +
> > +	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> > +		indent = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> > +	else
> > +		indent = _dtrace_stkindent;
> > +
> > +	/*
> > +	 * Ultimately, we need to add an entry point in the library vector for
> > +	 * determining <symbol, offset> from <tgid, address>.  For now, if
> > +	 * this is a vector open, we just print the raw address or string.
> > +	 */
> > +	if (dtp->dt_vector == NULL)
> > +		pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
> > +		    DTRACE_PROC_SHORTLIVED);
> > +
> > +	for (i = 0; i < depth && pc[i] != 0; i++) {
> > +		const prmap_t *map;
> > +
> > +		if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> > +			break;
> > +		if (dtp->dt_options[DTRACEOPT_NORESOLVE] != DTRACEOPT_UNSET
> > +		    && pid >= 0) {
> > +			if (dt_Pobjname(dtp, pid, pc[i], objname,
> > +			    sizeof(objname)) != NULL) {
> > +				const prmap_t *pmap = NULL;
> > +				uint64_t offset = pc[i];
> > +
> > +				pmap = dt_Paddr_to_map(dtp, pid, pc[i]);
> > +
> > +				if (pmap)
> > +					offset = pc[i] - pmap->pr_vaddr;
> > +
> > +				snprintf(c, sizeof(c), "%s:0x%llx",
> > +				    dt_basename(objname), (unsigned long long)offset);
> > +
> > +			} else
> > +				snprintf(c, sizeof(c), "0x%llx",
> > +				    (unsigned long long)pc[i]);
> > +
> > +		} else if (pid >= 0 && dt_Plookup_by_addr(dtp, pid, pc[i],
> > +							  &name, &sym) == 0) {
> > +			if (dt_Pobjname(dtp, pid, pc[i], objname,
> > +					sizeof(objname)) != NULL) {
> > +				if (pc[i] > sym.st_value)
> > +					snprintf(c, sizeof(c), "%s`%s+0x%llx",
> > +						 dt_basename(objname), name,
> > +						 (unsigned long long)(pc[i] - sym.st_value));
> > +				else
> > +					snprintf(c, sizeof(c), "%s`%s",
> > +						 dt_basename(objname), name);
> > +			} else
> > +				snprintf(c, sizeof(c), "0x%llx",
> > +				    (unsigned long long)pc[i]);
> > +			/* Allocated by Plookup_by_addr. */
> > +			free((char *)name);
> > +		} else if (str != NULL && str[0] != '\0' && str[0] != '@' &&
> > +		    (pid >= 0 &&
> > +			((map = dt_Paddr_to_map(dtp, pid, pc[i])) == NULL ||
> > +			    (map->pr_mflags & MA_WRITE)))) {
> > +			/*
> > +			 * If the current string pointer in the string table
> > +			 * does not point to an empty string _and_ the program
> > +			 * counter falls in a writable region, we'll use the
> > +			 * string from the string table instead of the raw
> > +			 * address.  This last condition is necessary because
> > +			 * some (broken) ustack helpers will return a string
> > +			 * even for a program counter that they can't
> > +			 * identify.  If we have a string for a program
> > +			 * counter that falls in a segment that isn't
> > +			 * writable, we assume that we have fallen into this
> > +			 * case and we refuse to use the string.
> > +			 */
> > +			snprintf(c, sizeof(c), "%s", str);
> > +		} else {
> > +			if (pid >= 0 && dt_Pobjname(dtp, pid, pc[i], objname,
> > +			    sizeof(objname)) != NULL)
> > +				snprintf(c, sizeof(c), "%s`0x%llx",
> > +				    dt_basename(objname), (unsigned long long)pc[i]);
> > +			else
> > +				snprintf(c, sizeof(c), "0x%llx",
> > +				    (unsigned long long)pc[i]);
> > +		}
> > +
> > +		if ((err = dt_printf(dtp, fp, format, c)) < 0)
> > +			break;
> > +
> > +		if ((err = dt_printf(dtp, fp, "\n")) < 0)
> > +			break;
> > +
> > +		if (str != NULL && str[0] == '@') {
> > +			/*
> > +			 * If the first character of the string is an "at" sign,
> > +			 * then the string is inferred to be an annotation --
> > +			 * and it is printed out beneath the frame and offset
> > +			 * with brackets.
> > +			 */
> > +			if ((err = dt_printf(dtp, fp, "%*s", indent, "")) < 0)
> > +				break;
> > +
> > +			snprintf(c, sizeof(c), "  [ %s ]", &str[1]);
> > +
> > +			if ((err = dt_printf(dtp, fp, format, c)) < 0)
> > +				break;
> > +
> > +			if ((err = dt_printf(dtp, fp, "\n")) < 0)
> > +				break;
> > +		}
> > +
> > +		if (str != NULL) {
> > +			str += strlen(str) + 1;
> > +			if (str - strbase >= strsize)
> > +				str = NULL;
> > +		}
> > +	}
> > +
> > +	if (pid >= 0)
> > +		dt_proc_release_unlock(dtp, pid);
> > +
> > +	return err;
> > +}
> > +
> >   /*ARGSUSED*/
> >   static int
> >   pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> > @@ -381,19 +580,20 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> >   	      uint64_t normal, uint64_t sig)
> >   {
> >   	int width;
> > -	dtrace_optval_t saved = dtp->dt_options[DTRACEOPT_STACKINDENT];
> >   	const dtrace_recdesc_t *rec = pfd->pfd_rec;
> >   	caddr_t addr = (caddr_t)vaddr;
> > +	uint32_t depth = DTRACE_STACK_NFRAMES(rec->dtrd_arg);
> >   	int err = 0;
> > +	if (depth == 0)
> > +		return 0;
> > +
> >   	/*
> > -	 * We have stashed the value of the STACKINDENT option, and we will
> > -	 * now override it for the purposes of formatting the stack.  If the
> > -	 * field has been specified as left-aligned (i.e. (%-#), we set the
> > -	 * indentation to be the width.  This is a slightly odd semantic, but
> > -	 * it's useful functionality -- and it's slightly odd to begin with to
> > -	 * be using a single format specifier to be formatting multiple lines
> > -	 * of text...
> > +	 * If the field has been specified as left-aligned (i.e. (%-#), we use
> > +	 * the field width as indentation.  This is a slightly odd semantic
> > +	 * but it's useful functionality -- and it's slightly odd to begin with
> > +	 * to be using a single format specifier to be formatting multiple
> > +	 * lines of text...
> >   	 */
> >   	if (pfd->pfd_dynwidth < 0) {
> >   		assert(pfd->pfd_flags & DT_PFCONV_DYNWIDTH);
> > @@ -404,24 +604,14 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
> >   		width = 0;
> >   	}
> > -	dtp->dt_options[DTRACEOPT_STACKINDENT] = width;
> > -
> > -	switch (rec->dtrd_action) {
> > -	case DTRACEACT_USTACK:
> > -	case DTRACEACT_JSTACK:
> > -		err = dt_print_ustack(dtp, fp, format, addr, rec->dtrd_arg);
> > -		break;
> > -
> > -	case DTRACEACT_STACK:
> > -		err = dt_print_stack(dtp, fp, format, addr, rec->dtrd_arg,
> > -		    rec->dtrd_size / rec->dtrd_arg);
> > -		break;
> > -
> > -	default:
> > -		assert(0);
> > -	}
> > +	if (dt_printf(dtp, fp, "\n") < 0)
> > +		return -1;
> > -	dtp->dt_options[DTRACEOPT_STACKINDENT] = saved;
> > +	if (DTRACE_STACK_IS_USER(rec->dtrd_arg))
> > +		err = dt_print_stack_user(dtp, fp, format, addr, width, depth,
> > +					  DTRACE_STACK_STRSIZE(rec->dtrd_arg));
> > +	else
> > +		err = dt_print_stack_kernel(dtp, fp, format, addr, width, depth);
> >   	return err;
> >   }
> > @@ -2287,3 +2477,29 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> >   	return 2;
> >   }
> > +
> > +int
> > +dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> > +	       const dtrace_probedata_t *data, const dtrace_recdesc_t *recs,
> > +	        uint_t nrecs, const void *buf, size_t len)
> > +{
> > +	const char	*format;
> > +	dt_pfargd_t	pfd;
> > +
> > +	if (fmtdata == NULL)
> > +		format = "%s";
> > +	else
> > +		format = ((dt_pfargv_t *)fmtdata)->pfv_format;
> > +
> > +	/* pfprint_stack() uses pfd_rec, pfd_flags, and pfd_width only */
> > +	memset(&pfd, 0, sizeof(pfd));
> > +	pfd.pfd_rec = recs;
> > +	pfd.pfd_flags = DT_PFCONV_LEFT;
> > +
> > +	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> > +		pfd.pfd_width = (int)dtp->dt_options[DTRACEOPT_STACKINDENT];
> > +	else
> > +		pfd.pfd_width = _dtrace_stkindent;
> > +
> > +	return pfprint_stack(dtp, fp, format, &pfd, data->dtpda_data, 0, 0, 0);
> > +}
> > diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
> > index f08e48eb..7a1d0dda 100644
> > --- a/libdtrace/dt_printf.h
> > +++ b/libdtrace/dt_printf.h
> > @@ -102,16 +102,16 @@ extern void dt_printf_validate(dt_pfargv_t *, uint_t,
> >   extern void dt_printa_validate(struct dt_node *, struct dt_node *);
> > -extern int dt_print_stack(dtrace_hdl_t *, FILE *,
> > -    const char *, caddr_t, int, int);
> > -extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
> > -    const char *, caddr_t, uint64_t);
> >   extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
> >   extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
> >   extern int dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> >   			 const dtrace_probedata_t *data,
> > -			 const dtrace_recdesc_t *recs,
> > -			 uint_t nrecs, const void *buf, size_t len);
> > +			 const dtrace_recdesc_t *recs, uint_t nrecs,
> > +			 const void *buf, size_t len);
> > +extern int dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> > +			  const dtrace_probedata_t *data,
> > +			  const dtrace_recdesc_t *recs, uint_t nrecs,
> > +			  const void *buf, size_t len);
> >   #ifdef	__cplusplus
> >   }
