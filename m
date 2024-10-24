Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6471DD0E6
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729777956; cv=fail; b=Drxlbe/T0a7jytd0XRQ+9M63CWQ7KyxC3RMl770FJlozmN49oyKn3snz8I/BF/EEQeKLAInDZhwp5PDvijtrt1OTZv9zfmoyChx4a2busYMigI4n3fajdWqiE8Bk0gF1dX7kPTKUQc2G180kDvkq7oFoNIyecAeXvSOmaXAU6SM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729777956; c=relaxed/simple;
	bh=908mJCduVjxUm50ya8cSr6MniOFv0CLdw+FBV+eazro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Azfr2ErV0HxAO2/yFGvNurFcOgHKljUvUajG57kTpq7MiuckBVi3GI0WZv43OqH9gpSeGkOEiX+XGurYUshyJHOSpKfD+jyFvVSSDWPvdDi+kn8+GBzMD3lAbaQlKUBNCYrzZG9fFgS0jzIuFigtQOCjRHERHZOZ21g+14+WjPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QGZjBaAf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cFTdd1Pp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QGZjBaAf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cFTdd1Pp"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OC1YoH019560
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 13:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=lsuNNJqVK6COXcKS74
	YcyMww76pw5JczQlE+goqXmQI=; b=QGZjBaAfuGeZMQk+dXmboT5ty9k9j/RBL5
	7vmNsHYZNAM/5kqrGYRIyET7PKKQN1vuQ+ycrGaERZxQTirdBlh1dno6lYkA+8Rc
	N6CNhGpp8h/F5EU/5jRZSwNz+Qb1kIrjFOJ7oe1bVR3PTptZhnZIakt3xSXfoJci
	Arfm06F2gLH89iXgLYUipkP0rTRAIEQPw/iabtX3OPT4rcT7d8jkr3d6gJYk6hkJ
	SQNOv0HmAkz0dv4XUqD+ykJQDtpNqGDUjw2omHicyC9srmzYRk1kLJMkhgJIqE4o
	nf2JrnEnxe1YaSPprFWkowAghDyHT2F1LZkUAQnrA2ZoOafSP3rQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42ckkr1y6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 13:52:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OCUtBR031096
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 13:52:31 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh2yy4e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 13:52:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZNTzVvZoP6ChTneU2bs5r2bBgevx7xW1/PheEiGMu8TfrmIJ2Ed8++8HuGBlWRXxSQ93Yjb6QnWYAIkJ1QMQHcUZFpRUpItX/hMFNaVTWnK5BGzkAF4HZ0XQkVwHjmqhLeRz2+oOb7lI3kgWw1BQrYpfx3DOyx+NS4YnCfi6VzGESwNznU8noV83nZ8yipOCA6oIljzfXVhvVMC/+JDiBj0Pca+I00hxuPEaVm27g4521LURCubg4M3Lr9oIwIplC/xeIZKN+nN+liYzlNsH7BiFGDwnsJBqZ67MsDbaqBETj9PRgLfGEeRwifKSohLTDFftI9sD3o2xtgUwslQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsuNNJqVK6COXcKS74YcyMww76pw5JczQlE+goqXmQI=;
 b=eECUnZrH69l64vPIQd4Ib3BTtZ4f5eNwcmmU5q8rV5wi9vRHy6zr9A3Cbe+VN5ewxV5Rdq8NxxWIUl/QgtktpSd1syZ01pR5uXDspp5PjZhdoON9teYC4ZBG22bS8/WqJwTFtdt+Bxohcs/tG60v6dQrA30UgpA5JFWc+EA2RoWUppXqe7O/KHoKT1f+JzmvIr283aoTBHuzgp+1d4U61z6rFOi8WZjIYJ9IQmryByPzsbhgLwNV3lEmzaauRzI84XyHnSu+ZG7KeCBjLJJyvT42Tdscg9M261X1HH0B3k1B+YxV4HYWlKOR5xfOjG1SaHS+xObu7VqsLxdPSq5QCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsuNNJqVK6COXcKS74YcyMww76pw5JczQlE+goqXmQI=;
 b=cFTdd1PpeEfxJt659ZSk3Wrd67r0b4DUJu9hEtwONkHDSDhouDSpCT8ZuPmiQSm7ViJ8HcG6wKNJfzVSj+GXZ3zeq/7u+lO7VWKApOO5/Su5DUCvZPFfPM2KWta0RzAK+IgWeij1eJY5tg8C0l7Jm57G1dnH99+I2OqvyKq1os4=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by MW6PR10MB7591.namprd10.prod.outlook.com (2603:10b6:303:249::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 24 Oct
 2024 13:52:28 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 13:52:28 +0000
Date: Thu, 24 Oct 2024 09:52:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 08/19] Support multiple overlying probes
 in the uprobe trampoline
Message-ID: <ZxpRGdMvnZLAYt+7@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-8-eugene.loh@oracle.com>
 <Zxm0GsvMqDP0lO8c@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zxm0GsvMqDP0lO8c@kvh-deb-bpf.us.oracle.com>
X-ClientProxiedBy: MN2PR18CA0014.namprd18.prod.outlook.com
 (2603:10b6:208:23c::19) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|MW6PR10MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: 52af61f6-7a42-491a-70b8-08dcf433192e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZuV2cba6FKw0xBxjZXPGMnaotTt4Yed/UnpNkASLs1gKODLVQUj5z8l5lSmL?=
 =?us-ascii?Q?gJLSijkf1NhS/0FbYaLcNhgMST6KY7NprZ8Gn/7vcpP4fpRG1nRpm0jy9VLt?=
 =?us-ascii?Q?SBmEqyx3lOVGn6U4qYlFmakU7pXn693Zxk7KEzjg2T+ITbMzYR0MQVPWewpt?=
 =?us-ascii?Q?4DqqeGFT6/Wcs7fyjBHnY/UCqpGjILVoJ3zH5gKlfm75CfhsnHIR7wWp5NaW?=
 =?us-ascii?Q?uROjiyPZfyJo+PTWWtG5YptA2YcMvVSSmx3d58k0YinfQ3wSt6U/En5Yo1Hd?=
 =?us-ascii?Q?R+n3Vrgqy30HjahPhws3NrDjaeqAWmEUD4zmPI6YCzXyZ1WDyYWrhwBi3nh7?=
 =?us-ascii?Q?CQ5gr+WtOy77ztQrZ4FPUHkDUGhElQznS7SYDl6j5kU99c4/Bp9ilfygRkQt?=
 =?us-ascii?Q?3S/u9jOOOBCd4y93mqo1/j1J61JdFmF64tQEXdgSt43Oa/bSwmo3CUAtP/kS?=
 =?us-ascii?Q?SjhVAmm9AeYlzXbDCQdsDRnKLGFWaOi+KFoaKcJPMFvwZs5qZ/KurRUOgdj6?=
 =?us-ascii?Q?YMmPqzkdKzxkplIBUeePVGKUHcEcwG4J8HOauUYiaD3HIKdjNdy6/GBxr4ux?=
 =?us-ascii?Q?mNvlttEA+zWkePRnWiJoNIYzfK2FT6LXwlRnW+xDbz0uJLLiaMJX8k1Gs2CN?=
 =?us-ascii?Q?NSml6AsNwLewOCEDeKuxtmLdR2xCHGjlzE8PojdxaJJzi11tG1TRbD94XcTd?=
 =?us-ascii?Q?sWZBlDFNdSf9IHUc4henYqAnaZmPukW6YeZg0xzAzGGOxslsZh5YOdGaRE8M?=
 =?us-ascii?Q?linop3ofTTI7cEHXtOZFyjlcC2/CHQCYx9csBHtD65pwpzcdFchX1mQGVTXW?=
 =?us-ascii?Q?tyulYDlRrm5YV1igj3ckuxKHZ/dhIikJMy0oJk3zCw51LqpqaD+mDGgHpPBW?=
 =?us-ascii?Q?R2gU6NMKHOoLVBUWktIJI4TAqtwdj2KvFT2kqTAZwSY9JH1L7TeXRF+6pw5P?=
 =?us-ascii?Q?UfAX1CEDLOKgbhZPc3JUxHPAoS0js94HkK+0ErwHXok9sJg8pN0uH4fX2bcV?=
 =?us-ascii?Q?9/3iraDPjXljMUfaELs2Lv53/TKGmfOinOEI8zKQxxZKeJez4fJc3bGUivP8?=
 =?us-ascii?Q?Q/GIvyP1Pju01GHgavfmhZBRHvM93zcfHa17kh2C+/9KFwu9ncKobvXiikgY?=
 =?us-ascii?Q?ZjgN2xx7tit3/XCeSiK/ONEDafSXjJhTevZy0DpCqIDcHJDfB8dR3konl7+0?=
 =?us-ascii?Q?iQPn1cK/hAdh/XPDd/hq7WQKSy4FRB+iw7ubyastnhbEyUng1lUbArbpuolj?=
 =?us-ascii?Q?Z2aGNXwMQwW4Z/DnQWwiak3Ngf7m0gZ2/g5WcaGnHrbo9S9LCTPokb/EBUDk?=
 =?us-ascii?Q?iNaI+hZQTTcsryxMDZEok1x7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nyyIYMI5spV59Ot3yf9D0OSF9pgGYi3YzDSPNulX2p7AgmPfWCNwP5JogeM+?=
 =?us-ascii?Q?iKXed4Eb9WwI0GESDxYBQ7/tIUhmFBpw+j9D8kLNpyWlJan5y1KmxiRQpjWq?=
 =?us-ascii?Q?4M5dfP8uAjdtpJVp0JY0fIZ/tl5W9Se7WTa/pOm+InRGIX2X71p/5dMbb2M1?=
 =?us-ascii?Q?oDzRFUWk2rLTffvwG7kavnZmPAD/jreVKwIgZ3eDtXKZKiQN4+AIyyqpV3WU?=
 =?us-ascii?Q?ZGPdV30sWZfqDmBdMlb+Rz4Tt+P8H1CKljXlH1Iw5oZSZoPuGfn/LrCqMewg?=
 =?us-ascii?Q?o0pwTWW4okRWluKhhPAXWHL9EFnrIvQeOgZntf5juhRqWr5gxRI4PUvNhbqD?=
 =?us-ascii?Q?/uh1PDHvW7KmGgAh4sAupiBk4P08AorQj1x1VPFneZPQhU6QMEOTJOkjbPb1?=
 =?us-ascii?Q?1zuSAt6MuYX+roALTYxaqVmxWGcdFXJm20gT3zubOQE2zfIaCL2IcR8rfPXJ?=
 =?us-ascii?Q?GGxNq3jdXpbwaKxXhdFcg/rvbgGu58aaM1eByUWJjN3eu1z8xDbJbbcZjr6q?=
 =?us-ascii?Q?J+O1ShHi6Aph9nuvb7DrNSV6abJgI1lDX7ZpZqImieRe62ezypcqsCy2sm8G?=
 =?us-ascii?Q?cvKDd39fNRT/890Ov+luMYaPJLronpRsMU9yzwz4qNNcU6tL6ZJlG+VhUuGE?=
 =?us-ascii?Q?71a/S59UqjvuWOl/hSLQfGqt9I5R99eRxBVz0U/wE2O1fFaRoCvfD4xFheDo?=
 =?us-ascii?Q?m9g7m53cNWh5RljYl7XUT39zMaeQY43j75vAUCM06Qsf2Zs0jhjceohTLluj?=
 =?us-ascii?Q?wPbGRsgAu1hdZDwmbUv6fl5XmhjrlGJxJD4bsn1CdbXTcfwsJDuVyW+MPtn7?=
 =?us-ascii?Q?jzzlNPLXvperxNxXJjlCqWMmmwV+dMWNRr37uRq+Hni5KDJ/QADtgFFo45z6?=
 =?us-ascii?Q?blKgWFJCDtYuy0qD97jcWNQPl/qNRc8fCDCdZlxMRnwdXNx4stHQvpcTUtha?=
 =?us-ascii?Q?ly9gXCB1GXV0HFX64pgXWjphQwJkSGPRma43+5xv4b5DjIpah+xm9aC5R7kB?=
 =?us-ascii?Q?PmnEvWtAo/qXgoSc8mV9Easp8IX8QRqUMkcsJjxFQUmbsS9f72Xpj/iM/7SQ?=
 =?us-ascii?Q?wixzZgk8qzDvk2t5UG4+TYPDpcvkIER1NuUP+B213mUkAs4hFqs3d437dvSk?=
 =?us-ascii?Q?De2qrLgmQ5nSl5CkouSjQ7cFSlz3FjCmxV0D9qNT7vnV7SSWzuA+g5jNbhAv?=
 =?us-ascii?Q?i11dAdoYy0G7fn/K+vQf9TwFwB/J2PZwpFYEkjehPJ3THiPn6nVCVg6RI8VR?=
 =?us-ascii?Q?nCDziG1SdgOLirRYwRnGTl6fJnMPtzZIFeMLh+VlJzBEUm49omXj7h1QsJU1?=
 =?us-ascii?Q?851SLShvaj8/qRB6CX19HfMMP7nGHbmC7GvN8GUihAkrJ6glTv+Kg0vGfcYe?=
 =?us-ascii?Q?mjAm0Mnn2uKk2sRk+3wBaTM7mr2mBLMfgswI5EwItCyw6srR0Wy3fgHntFfL?=
 =?us-ascii?Q?Nt1h6A9w8ZJ/xlV2rtQL6nGFqQ+JI+YiJIbD4xWhxGF5HBQrYtFS0SLK98zN?=
 =?us-ascii?Q?bu77Y4BbihIz+VWovkv9jq8yFDGuBz1wB2OV6eZbydK92MZxFvuEWpGHFZRs?=
 =?us-ascii?Q?uqau/4wuQjdWttH/546HGgkm5rRV+eJhTtHDxX3XupomjG4fmt4wy5bVOfRK?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0kNd2KODUyJt1jKftC9PcVTJs3UM0bxWEVkgl45vmsVYnoJv1ZThnSeyJO8U5+wRK+9JgxzkMW5L2zqHApzqU0e5Ufe6stunoSd7asHQP3WQwsLjk6KeRsC33M8M/5Dq55Pj/HeJP9RPi9LqBs7fnsho1hqJVg87pLpVQ84XyH1wa+PQksQ6xGrYhWRe8Urjd0XRpqB5CNpvG/PIJhnns0fYDZdob+/FXD2mpoNqfAgQ1nqEC3M0E1ohsSv0LsholDgJjywG3GHoXZP0ha2C31RBJT9tsRXbZgPQj/Q7JB3SLT4SK5xcRt5hYd6I1vYSNymDudXTWyAo87gqGfHIUZwei9LYYSDTOJgoZuLOKEACjnVZhZOTSXk0k1GPXWraHRgnqowcFtPXKrgCPvb6b8HDOsiigrQG/tS1cyNkZpzKtefEv/pT2eHmC5iMS3XE2vhvXrKA4cMTEAFKhrDdRKSGvAZ/hI7sL9smuolexSWn3LBlTOTKwIHMB16bwf/Xfkz1nctW9YGizo9XuopeNguBqPrdL7sUzD1e0MNT1Pvuz2WQn3Lk9AiN7odjesDgohh6AyAWcg1xlqbI/9ZxvMpqurB2VX622eIV6k0Vq4g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52af61f6-7a42-491a-70b8-08dcf433192e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 13:52:28.3983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oMx9cwVOkAwqKjLIc+XyIAwoPagTU7R8ifLTyGH/DBS0Sv/aKpJAZyP+QHU9TM9+2AP+NJvqcSjSs88/r3hFg9wS0GGYWmvfP8fVGQRPP48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7591
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_15,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240113
X-Proofpoint-GUID: gdI9K6p2YIB__knsMo4N9ewXH0T-vrYE
X-Proofpoint-ORIG-GUID: gdI9K6p2YIB__knsMo4N9ewXH0T-vrYE

Additional comment below...

On Wed, Oct 23, 2024 at 10:42:34PM -0400, Kris Van Hees via DTrace-devel wrote:
> On Thu, Aug 29, 2024 at 01:25:47AM -0400, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > An underlying probe could support all sorts of overlying probes:
> >   - pid entry
> >   - pid return
> >   - pid offset
> >   - USDT
> >   - USDT is-enabled
> > 
> > The overlying probes belonging to an underlying probe match the
> > underlying probe -- except possibly in pid.  So, an underlying
> > probe loops over its overlying probes, looking for a pid match.
> > 
> > The trampoline would look for only one match.
> > 
> > However, more than one overlying probe might match.  Therefore,
> > change the loop to keep going even after a match has been found.
> > 
> > Incidentally, it is actually only pid offset probes that could
> > "collide" with any other overlying probes for a given pid:
> > 
> > -)  pid return probes are implemented with uretprobes
> >     and so cannot "collide" with any other probes
> > 
> > -)  no two USDT probes -- is-enabled or not -- can map
> >     to the same underlying probe for any pid
> > 
> > -)  no USDT probe -- is-enabled or not -- can map to
> >     to the same underlying probe as a pid entry
> > 
> > So, possibly one could optimize the trampoline -- e.g., by adding
> > BPF code to exit once two matches have been made.
> > 
> > Incidentally, there is a small error in the patch.  The flag we
> > pass in to dt_cg_tramp_copy_args_from_regs() should depend on
> > whether the overlying probe is a pid or USDT probe.  We used to
> > check PP_IS_FUNCALL, the upp could be for both.  Instead of
> > fixing this problem, let us simply pretend it's a pid probe --
> > a later patch will move USDT probes to a different mechanism anyhow.
> 
> I think it is more clear to just keep the logic that is there for passing the
> flag, even if it is not exactly correct.  At least it is not a change from
> something that might be wrong to something that is more likely to be wrong.
> Either way, you are changing it in a subsequent patch so the change to a
> hardcoded 1 is not really helping anything other than making someone perhaps
> wonder why you changed it.
> 
> Alternatively, you could perhaps change the check for the PP_IS_FUNCALL flag
> to checking the prp->prov->impl, and selecting 1 for dt_pid and 0 for dt_usdt?
> Yes, you will change that in the subsequent patch, but it would be actually
> fixing this to be the correct condition anyway, right?
> 
> Summary, wrong -> different-wrong seems silly, wrong -> wrong (keeping it
> the same) is reasonable, wrong -> correct is of course preferred.
> 
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > ---
> >  libdtrace/dt_prov_uprobe.c          |  53 +++++-------
> >  test/unittest/pid/tst.entry_off0.sh | 125 ++++++++++++++++++++++++++++
> >  2 files changed, 147 insertions(+), 31 deletions(-)
> >  create mode 100755 test/unittest/pid/tst.entry_off0.sh
> > 
> > diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> > index 70e5c32d..bc5545fb 100644
> > --- a/libdtrace/dt_prov_uprobe.c
> > +++ b/libdtrace/dt_prov_uprobe.c
> > @@ -687,45 +687,23 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  	const list_probe_t	*pop;
> >  	uint_t			lbl_exit = pcb->pcb_exitlbl;
> >  
> > -	dt_cg_tramp_prologue(pcb);
> > +	dt_cg_tramp_prologue(pcb);                             // call this only once... is PRID set/relocated correctly?
> 
> I do not believe this change is needed (adding the comment).  A trampoline can
> only ever have a single prologue.
> 
> >  
> >  	/*
> >  	 * After the dt_cg_tramp_prologue() call, we have:
> >  	 *				//     (%r7 = dctx->mst)
> >  	 *				//     (%r8 = dctx->ctx)
> >  	 */
> > -
> > -	dt_cg_tramp_copy_regs(pcb);
> > -	if (upp->flags & PP_IS_RETURN)
> > -		dt_cg_tramp_copy_rval_from_regs(pcb);
> > -	else
> > -		dt_cg_tramp_copy_args_from_regs(pcb,
> > -						!(upp->flags & PP_IS_FUNCALL));
> > -
> > -	/*
> > -	 * Retrieve the PID of the process that caused the probe to fire.
> > -	 */
> > -	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> > -	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> > +	dt_cg_tramp_copy_regs(pcb);                            // call this only once for all clauses?
> >  
> >  	/*
> > -	 * Generate a composite conditional clause:
> > -	 *
> > -	 *	if (pid == PID1) {
> > -	 *		dctx->mst->prid = PRID1;
> > -	 *		< any number of clause calls >
> > -	 *		goto exit;
> > -	 *	} else if (pid == PID2) {
> > -	 *		dctx->mst->prid = PRID2;
> > -	 *		< any number of clause calls >
> > -	 *		goto exit;
> > -	 *	} else if (pid == ...) {
> > -	 *		< ... >
> > -	 *	}
> > +	 * Loop over overlying probes, calling clauses for those that match:
> >  	 *
> > -	 * It is valid and safe to use %r0 to hold the pid value because there
> > -	 * are no assignments to %r0 possible in between the conditional
> > -	 * statements.
> > +	 *	for overlying probes (that match except possibly for pid)
> > +	 *		if (pid matches) {
> > +	 *			dctx->mst->prid = PRID1;
> > +	 *			< any number of clause calls >
> > +	 *		}
> >  	 */
> >  	for (pop = dt_list_next(&upp->probes); pop != NULL;
> >  	     pop = dt_list_next(pop)) {
> > @@ -740,6 +718,20 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
> >  		assert(idp != NULL);
> >  
> > +		/*
> > +		 * Register copies.  FIXME:  What can be optimized?
> > +		 */
> 
> I would drop the FIXME.  There is not really much of anything that can be
> optimized because we need the register content in case some clause makes use
> of regs[].  And arguments need to be copied for argN and args[], unless we
> want to implement arg-access using a provider callback during CG, and that
> would be an optimization across all providers so definitely not something for
> now.  So, no need to have a FIXME.  It's biger than USDT :)
> 
> > +		if (upp->flags & PP_IS_RETURN)
> > +			dt_cg_tramp_copy_rval_from_regs(pcb);
> > +		else
> > +			dt_cg_tramp_copy_args_from_regs(pcb, 1);
> 
> Per my comment above, I think this should still retain the code that was here
> before (well, higher up) to select the correct flag to pass rather than just
> hardcoding it as 1 and mentioning it is a bug.  It is easy enough to just keep
> what was there as logic, and then change that in a subsequent patch.
> 
> Using (prp->prov->impl == &dt_pid ? 1 : 0) would do the trick, right?

Actually, since you already document that the pid return probe cannot collide
with other probes (but there could be multiple return probes, one per PID of
course), I think you can still keep the copy rval vs args outside the loop,
right?  And that also still works after subsequent patches, because you have
this before the loop for pid probes, and later there will be a test to be done
if it is a return probe, and after that a args_froom_regs for USDT.

I see no reason to move this inside to the loop.  What am I missing?

> 
> > +
> > +		/*
> > +		 * Retrieve the PID of the process that caused the probe to fire.
> > +		 */
> > +		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> > +		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> 
> Wouldn't it be better to retrieve the PID once, and store it in %r6, and then
> use it at every branch rather than retrieving the PID for every case?
> 
> > +
> >  		/*
> >  		 * Check whether this pid-provider probe serves the current
> >  		 * process, and emit a sequence of clauses for it when it does.
> > @@ -747,7 +739,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >  		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
> >  		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
> >  		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
> > -		emit(dlp,  BPF_JUMP(lbl_exit));
> >  		emitl(dlp, lbl_next,
> >  			   BPF_NOP());
> >  	}
> > diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
> > new file mode 100755
> > index 00000000..f1a75b6a
> > --- /dev/null
> > +++ b/test/unittest/pid/tst.entry_off0.sh
> > @@ -0,0 +1,125 @@
> > +#!/bin/bash
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +#
> > +
> > +dtrace=$1
> > +
> > +trig=`pwd`/test/triggers/ustack-tst-basic
> > +
> > +DIRNAME="$tmpdir/enter_off0.$$.$RANDOM"
> > +mkdir -p $DIRNAME
> > +cd $DIRNAME
> > +
> > +# Run DTrace, dumping all probe functions and names, plus PC, in a.out.
> > +
> > +$dtrace $dt_flags -c $trig -n '
> > +pid$target:a.out::
> > +{
> > +	@[probefunc, probename, uregs[R_PC]] = count();
> > +}
> > +
> > +profile:::tick-1s
> > +{
> > +	exit(0);
> > +}' > D.out
> > +if [ $? -ne 0 ]; then
> > +	echo ERROR: dtrace
> > +	cat D.out
> > +	exit 1
> > +fi
> > +
> > +# Generate the expected list of functions for our trigger program.
> > +
> > +echo main > expected.tmp
> > +echo mycallee >> expected.tmp
> > +for x in 0 1 2 3 4 5 6 7 8 9 \
> > +         a b c d e f g h i j k l m n o p q r s t u v w x y z \
> > +         A B C D E F G H I J K L M N O P Q R S T U V W X Y Z; do
> > +    echo myfunc_$x >> expected.tmp
> > +done
> > +sort expected.tmp > expected.txt
> > +
> > +# Check output for probe name "0" or "entry".
> > +
> > +awk '$2 == "0" || $2 == "entry"' D.out | awk '
> > +{
> > +	fun = $1;
> > +	prb = $2;
> > +	PC = $3;
> > +	cnt = $4;
> > +}
> > +
> > +# Check that the count is 1.
> > +cnt != 1 {
> > +	print "ERROR: count is not 1";
> > +	print;
> > +	exit(1);
> > +}
> > +
> > +# Check that we have not gotten the same (fun,prb) already.
> > +prb == "0" && fun in PC0 {
> > +	print "ERROR: already have offset 0 for this func";
> > +	print;
> > +	exit(1);
> > +}
> > +prb == "entry" && fun in PCentry {
> > +	print "ERROR: already have entry for this func";
> > +	print;
> > +	exit(1);
> > +}
> > +
> > +# Record the PC.
> > +prb ==   "0"   { PC0[fun] = PC; }
> > +prb == "entry" { PCentry[fun] = PC; }
> > +
> > +# Do final matchup.
> > +END {
> > +	# Walk functions for the offset-0 probes.
> > +	for (fun in PC0) {
> > +		# Make sure each offset-0 probe has a matching entry probe.
> > +		if (!(fun in PCentry)) {
> > +			print "ERROR: func", fun, "has offset-0 but no entry";
> > +			exit(1);
> > +		}
> > +
> > +		# Make sure the matching probes report the same PC.
> > +		if (PC0[fun] != PCentry[fun]) {
> > +			print "ERROR: func", fun, "has mismatching PCs for offset-0 and entry:", PC0[fun], PCentry[fun];
> > +			exit(1);
> > +		}
> > +
> > +		# Dump the function name and delete these entries.
> > +		print fun;
> > +		delete PC0[fun];
> > +		delete PCentry[fun];
> > +	}
> > +
> > +	# Check if there are any leftover entry probes.
> > +	for (fun in PCentry) {
> > +		print "ERROR: func", fun, "has entry but no offset-0";
> > +		exit(1);
> > +	}
> > +}
> > +' | sort > awk.out
> > +
> > +# Report any problems.
> > +
> > +if ! diff -q awk.out expected.txt; then
> > +	echo ERROR: diff failure
> > +	echo ==== function list
> > +	cat awk.out
> > +	echo ==== expected function list
> > +	cat expected.txt
> > +	echo ==== diff
> > +	diff awk.out expected.txt
> > +	echo ==== DTrace output
> > +	cat D.out
> > +	exit 1
> > +fi
> > +
> > +echo success
> > +exit 0
> > -- 
> > 2.43.5
> > 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
