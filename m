Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCDE1FBEB0
	for <dtrace@lists.linux.dev>; Sat,  6 Jun 2026 01:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780710921; cv=fail; b=jrV3dU6qOiglTre2NfI0/sBj0VkTUicvwFCc6wWu/WUOhjjTsUVYRLSKh9H0qv+Y2KhQV14yrG3wIOBb+iNjtXEu5/BCpRpCrZQQaP6yKPXUJhwGM3eFN9J/KIShx+IF9mC2Ucda0shGPcj8kklcYZf3E3O3AHWDm14CdX0GEKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780710921; c=relaxed/simple;
	bh=wE39CGYVZGfEwdsdR023BnpSp3RiIuCYJ9i5BemndlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vGRCHjSH5qnNu17/1l1mDHxWika3pHxDJZjDoB/DsEDlKdoSSWOs6yTJocIa+VhTSvJLc31vcz7cFqEkEGKRvURJDXJk2ZxonOOIuMKrp8RH9ZcQbqwycNWnTTUoXuGwH7KQUfTEH7nNUyM1dBN/y7vKeAuwhBw4Z58iryO6dH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e/nPnUeV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yWjcaaHH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e/nPnUeV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yWjcaaHH"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6561hUII1515265;
	Sat, 6 Jun 2026 01:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/PE8+52XJl82cKSGoB
	he5JrrXtdE0IM4+xBm+6k6Fio=; b=e/nPnUeVPMj3fcwO9lWGIAh1ek4f1pxA8n
	tY9JGhXWZciwfQ2wqVSWLrmudVos3gXjkr5bqOiqMf0ZdFjIubNuj/HrTAhhYV6y
	GlgwoTXOcQDav/72dIOIfJPi9ToE/iwsoqChPGYF7x4TF+57s2rtbfu41ukTFkC6
	V+VgMIAoCanMj86RLOhHMZ8fTLb56LomHrF2LFgdAdC8y5hH9UTJA0Q4KISjEUdf
	3iNgwqScTf6EMuLmUUeYMhETWQRQVa41iry1d3clF7psQt+vZR4IH/KvzQ2lUu2u
	Zu0ZXQ/dq+72skVxlfAaS5ljTORbQd9SjEo5+WkbTJuWo3S3+D8A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ema4y005q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 06 Jun 2026 01:55:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6561tFr7005173;
	Sat, 6 Jun 2026 01:55:16 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013071.outbound.protection.outlook.com [40.107.201.71])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0m09mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 06 Jun 2026 01:55:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNsgyYvk8lqPZy674AFg9y69787bNVwLKze6Av9pbN0TRp5w9XQ7Cgb4Re1GBEe4o2Oy+jU+h7BliPnfXR2qAosGKpnlaaEmsf/lqzwwMMLVM0SjlpByUt4c1B0livVQ8WJD8+hBCNwsLmtlhbleLkRHnqXYyq6q+CuS37/FxxPIAgLx+YbKJk9DKSeZEWiIDwv82pL1Zh6TVjAbv4up0UV67cCPo+h9vh/hiTzKjK8dAC/pVvgISqhIVpbojheLKlX7Jc4O+vrsYnir2pf0X6iq9iQOcPD9NJpB5wsDkCLKN6H0USRyG6Gs1j6Ypsg1rHBWZgzp2b1RslAXMr5Hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PE8+52XJl82cKSGoBhe5JrrXtdE0IM4+xBm+6k6Fio=;
 b=t4mdBOR6PH6JYm/V+541zJSkalcsX6SsWne9wy03eNxc7Y/PxNXGaGfSB572+30v71NTbmTqN28mPse7EgQLXeOJKpY7/aOR2lS3dMWzA2uU8ZuQ1cOs+vZvoJV7KEXe82CbUxUrw1y7NSgrxho2+z6trQ3YxX/yYlji/7JrPdyCOtmgLUEBQSj1DVJBTaGCM0BjZz0EZYqFtocRA+xjWMl6EVmg/OVw8JbJK4bleudHwAFZ38YTu1bGYVcYEtfNxdu1QYRorTEwLHlcBlJXDVnF+ad2CB5S5neWQU+hzIuVZeQpcm7Hr6pBpmfzUzewMu3iPJedpAbrpZhovB3/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PE8+52XJl82cKSGoBhe5JrrXtdE0IM4+xBm+6k6Fio=;
 b=yWjcaaHH111r9KGHuLPcOqQJ6ZNmANgVAOaKkgVXQ1Q3sKkzVsww78U/QEV9VYcaR2lLtIlvWVTNHygYwbUzBXZu6J6jyGzOo4+S0N40eBWE5HHUjXysCOmeNKxVZZxahIUAcAfuVd4tpqLYv6dtorh7A/8H6dLgpPhyTYJiiUg=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by CY8PR10MB6852.namprd10.prod.outlook.com (2603:10b6:930:84::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Sat, 6 Jun 2026
 01:54:22 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 01:54:22 +0000
Date: Fri, 5 Jun 2026 21:54:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        OpenAI Codex <codex@openai.com>
Subject: Re: [PATCH 1/6] libdtrace: Pack declared bitfields into C storage
 units
Message-ID: <aiN9y6yDFK3JVKoI@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
 <20260605221217.1211791-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605221217.1211791-2-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|CY8PR10MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4641ea-4048-4a03-1ca6-08dec36e8751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|3023799007|4143699003|5023799004|56012099006|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YfsP9BGHFaC4/z/18OpetfrLxKP2oniCpeEJiRNtrNUnpdMWz6bzg604D2RUWbczhgEwQg1m8Ee0q/cCUxBfE2diOuh6Qm4YoslCuw9C69O9KU1ksha1M477lXMTITmE3qcEbvEVqBUVpp6J7tTv8djka96bC/Aykh0BtQr7IKXuxy7Og6K8WTdU8OeT/srWAEgjIqttODaryou3lbqN5OH88gND05GGodCrlVhqXm4FfktHX2NubgWlY7cqUnYbsS5AU5JMQKQ2Z6L2SQrkZL+CjfPZ727Jc5wYBiCRD68g2qn0hu12uLFVLCiGzm0RSfTVPEz4beoAI4r+ErtrvwtNP+6dzvOMhvl9pC3ax2DCX0pK4FxDuQi4BUKNDVERZeB3ZUgQLOYDvbX3rD4H+ed8BXIMu1SEqh5V0EwFRTqUZ8xCoW+dJE9SN3GHNhz5TUmMt01J4O3MohEiLjGVcVU2FohPsXQ0xvKXZGTzZ2N/sVE1MYo5ozPKJla5Xo9o+ZTgJQ7MIqgHJNHu6xvuB/AE/ZYIoGCGstm0YlvD/q3XMK10Vk4qKQkP4lMTDTGUVjEG+07jkYsdxypiqc3aE/hLG/tyho4Gtx6LBdmxDLTErsRFvxH0lHin/HRzyUS1zNCYk3l6UGo6SBTFXhSRJRBmDqWA7X15wTDsiEl39Mj2uxrPZbrIwWoJr6Jo5m4d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(3023799007)(4143699003)(5023799004)(56012099006)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K+orM+i4dPdn6f/QGIAmItj01avBxBaxO1jpWpqRyzo+KNe4Ksfl/WB9Rc4C?=
 =?us-ascii?Q?TC9tupXZ/UcxwYUttprhIAhoZJwhNYmjFt2PUtH8DjHNI08Z+/lkJJEjPOJs?=
 =?us-ascii?Q?fFBmvjW1YKyJhCFcdZwbT6dgbKOR4bv6xTxnsRYf0ays9PIzhD8VoCgbSinC?=
 =?us-ascii?Q?fFNueKkB3vgbZlcCkvFaO/sticLXHTwtz4ccTA6Gcs5BLfxTDNXXlk0WFqOs?=
 =?us-ascii?Q?0vwQVeC7GHsn43j2qFC6bkbRACvZUCbKjTenrEyZe7fjdV1ZuxVTwUAVpRQh?=
 =?us-ascii?Q?xdzQPrfrLZ+QkQSDjpQq5mtKCkbDQHHhXF8KTiVFMQ3rFpDnUVILZ4cNrODG?=
 =?us-ascii?Q?3aBhk+0YL3IwEv985EL/MI/UAbyP3rCWl35w4hSSTR9Wm4pphI1lXJILju95?=
 =?us-ascii?Q?S2epOtrfdImZDgeWHSViHZoceyBHk1sZzB6fi5nlBEHxmV9VheWkdStlJUqs?=
 =?us-ascii?Q?ZdB/iOEYW4Yo1EhpeIkaeywvPx/tS+6zFbUIJnxSUm1ErE51zrx+F496RS1c?=
 =?us-ascii?Q?vDne0HujGWs7AhKHB5ewo5zMBprCOS+9CzhszvNGsfA++6ws/rlCy/b5AxKL?=
 =?us-ascii?Q?IGWuhCxzfLfvccpSGAHaZgoOPgcV+6G6blRdcdj2NIpSmbn3moQM/06jAnHO?=
 =?us-ascii?Q?1qIz6tdib8KfDL0W3zgrN8LsCOiszS0OqD73k0JO/Ie/AOfN0GL8edBbVaF+?=
 =?us-ascii?Q?wyun2/3YHIAXoBrLpJsMrCNapWF9zIwyQfP3r+9g00VdGI5xhxIFPNx4nmoQ?=
 =?us-ascii?Q?P2m2Kk+jd4yohxaJrgafAQsBdC/22Jtbyh9tPz/vUfPcxt+2shTVdqfzb1Xm?=
 =?us-ascii?Q?A5PBpmwmca5M6ox7MjTRNlghyycgbJQfIWJIRXgPFczKs9wLIx4tRf4Z+Tk5?=
 =?us-ascii?Q?Qf8RtyQrXMwUKHuE0cnR9cspnhQlV7W9yL05Mtue0s2FP3AebyLb8lbF9Dkd?=
 =?us-ascii?Q?kULwWXtvKk890MVkkAaUoCaiEwXbhqAhZYIDdUeXHm0VNalx8W43wtkEesqM?=
 =?us-ascii?Q?SgBcOXFiyX//YIHQixRUhPz1xAFxh8lJ0Ld/S738meUT3YqgltooZCsjAAv5?=
 =?us-ascii?Q?DpiyH1CTJukbUfXB8yNsGmp9L1HfZ2xvGuu+3wr8ctIi9fTFEU7qzmdaoDLN?=
 =?us-ascii?Q?hDhnGRNIoelwxF53CPdAZ5CUOuZT4vXpmZLMLSjvCqBv1zGltXQumgBa0GPc?=
 =?us-ascii?Q?wWoUAI5VHwbXXC/4il4ivJqXGioxwBTCR54mTFyNszTyUkRS06AoB31b1aAe?=
 =?us-ascii?Q?jILsSiCCJJySYu3BlVVZbTRp0KvYbDnrcjTGFqNkOYBwDMLvkHYrvqpATXXz?=
 =?us-ascii?Q?cBPy4W0SHKm+OrDCDmMbhSsBhxAgZ7dvqjACTgcsuJKyqgxGEAk6EVseAOe/?=
 =?us-ascii?Q?3r6tC2lNVt9vWGGZjhbg2U0R8qVuaD5Fd5f3punZA5mIVkJv/Vs2YEDCmuYk?=
 =?us-ascii?Q?48tVV3HiOlMsHALkU0G4PXq1oMQhi9HQqIxNzwvYZsrcZrs0NKY3uW8XO/LW?=
 =?us-ascii?Q?YgblQtxVv9P0OsEPGczpJ3wa8jRD8ryAFycJRTkJygCP3KYvcWtawMWBhN2X?=
 =?us-ascii?Q?A6BB7UDVmCbJQ7vWtQiGqAZtYgfWiAByX8y5o60VlGHAsmTAx6JRLpay3FMN?=
 =?us-ascii?Q?Mu2VJaVh180TLzFfqaZYt9GkXUYl5Ta/igsGlgyYEHReF2BwtNjsu52kNPv0?=
 =?us-ascii?Q?HwK3LPX2COC9l9zXUQIxaBpheRY5RzORn+G3y0dI7F+AWgwZH27kfysU0lgT?=
 =?us-ascii?Q?CX+ZzdvLMw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	OTDG698XPOelYXoCULQHWmXv9N4NA2JRXD2fCNGGyaQsWxW/tNdgOGkv669k0lTLbvrfwzg0ncb69f/KFabr0xpM7AwE5qvzkPQUC2XxpF3IgeO964y8AwonuT4cT4I2HATIt+FtyTo5HEKe5E7y+UJfukzeKz33fr7tKYOj9L2SPeW0D2x7BxPaxXKeSDpdc9fDJZSgUYpPLN1Z3NncuOipPQhRchty8w9wKH7QYyoC+ACxmFmaGdZJ2KiY6UMR3z+JRvVsqa03WBFiuFtER0JQCBpaqShAvuSaC6MU+FkJ5dZ6I6Kjza7LxznGLniqsQBpgp9Uo14MStT1KImXag==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YvAci4QOh8/4d1ApNPttkJgWXsc4igit2aLwvxdwR4crw2xQaiRT26JQhd1aiivzsLaOuEB7ZO7GpnU+mTJgz8YWu1BImHzCLgL6YpYj0jmLmJoKC98z+zdtQkVmzW3A1YR0D5UovgT90rLXVFHla7CXFJjD9zr0TgRk/xYXS79rKnPkF7Ltm38sPBV8f6cpGfWzdL+Pbu5CF2aRhv1GcBIQ0lWfitpFOIMrI3FwH4RDmvhFz1LpmkvmCyETY2SvnUn8WDAtKElF1R4NNwEVFTIXYIIsT90M0iEmFWQfpe3hxwrO62Llo7FMCpRXTsMIb4mXwf5Gai6NbZTbmECXS35uBaeRpJxXHw5iyCO+VkwkLp5to/EZG0jParnDEfNj+OY/eWYUorQrkOB+l4yiLKwM1Y4Oco6fXqNyAY4JQMMoJ9ET91Qnk5+xM0Psyky4T61RsEyAaPS394ejC28Z8ZTbO07pZ3c8hKk/yK/oH/E9eNZmOwpgtfA/4uKYe7y53dgh1xuqAt0svK+EFc6bt7OZMpaDsFCRbfcuaEz7pmKHmAIyMnAeF3fbBFdHXWWduFqfsoXx/I7CtbvSRVqthLIqg16L0rQL7zuNLM0vVTQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4641ea-4048-4a03-1ca6-08dec36e8751
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 01:54:21.9213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QJ7abhlrwSbkBt97TM6HgPWhPXkLLCXK2kSJg749YD67cGJwwJUOfgUWtyQhJ+rvO3Y3tehthMoVd581MjQX5vqoFsJXqNk7XtlNESFe7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6852
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2606060016
X-Authority-Analysis: v=2.4 cv=ZMvnX37b c=1 sm=1 tr=0 ts=6a237e05 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=LG5T7v2SAAAA:8 a=T_xTprW8O39UpOX11PYA:9 a=CjuIK1q_8ugA:10
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13723
X-Proofpoint-ORIG-GUID: KvT_pt1o3y3sxBFQawmF_-kvBo0nEwEH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDAxNiBTYWx0ZWRfX5U8gqqY3LUA4
 X+0pAFnNXxX5M5UbJx+FctFAhZfRRFK9sgh/3rhF4YhBRxI5GaKZH+q1VT7Bgz34e//QUHS56Hq
 mJ6VIg/QvrYBdEngIr5ptbDHVi+019LUzscpzYIN9jfzjTFPF8xrxCqrX0p0Mk+bjji8WKnVLa8
 X1nNCjUXv7g6Xq/lbhmI3dHY3foRT81MzxvnrYRKDGluMbGYmEkWrKJybENNm+/CenDnvwUV0gl
 l/rpmFZQCHVnWAHMWL2+NJY2StZG2/+TTTaa7HgZYD5GQZq+NwXMpYl7I0SLcov7G+BYZ8Qp1pM
 Bldn+ZKzSgWjR9Gnk/eHMMZp583+ZKEu3jPvakZO+R9egjs7SSVrf1+DQZCoejMQR4XfB3De9xj
 Y/2roJU7RyBNIS64fexxoJ3SyGvkZR5NEDPe9ouCSECYkNwnbrhHqtXUiiXIuoOq7FEwQaxm4Ag
 uVCSyueaMzssBcciM76uV04osqNcLe8Hbx1sNVxc=
X-Proofpoint-GUID: KvT_pt1o3y3sxBFQawmF_-kvBo0nEwEH

I hope that Nick is able to comment on this (he is on the list) because I seem
to recall that he has mentioned in the past that the packing of bitfields is
not strictly defined and that we therefore cannot always know how the compiler
performs the layout.  In other words, yes, we could change this but it is not
at all guaranteed to be correct for anything other than the compiler we test it
with.

If my recollection on this is correct, then it becomes a matter of making an
informed decision on what the "best" representation is as opposed to the
"correct" one (where "best" is defined as "most commonly used").

Also, if it is indeed implementation specific, that should certainly be
mentioned in comments and the commit message, so that it is clear that this is
a matter of a choice having been made rather than implementing a particular
standard-defined feature.

On Fri, Jun 05, 2026 at 11:12:12PM +0100, Alan Maguire wrote:
> dt_decl_member() represented each D-declared bitfield as a standalone
> integer type sized to the field width, then let libctf auto-place the
> member.  That made adjacent bitfields consume whole bytes instead of
> sharing the declared C storage unit.  Unnamed padding fields such as
> `unsigned int :24` were therefore treated as additional storage, causing
> ABI-visible layout drift; for example CPython's PyASCIIObject was sized
> as 56 bytes instead of 48 for python 3.6 when associated python3.6
> headers were included.
> 
> The problem in that case was the "state" bitfield which had the form:
> 
>   struct {
>       unsigned int interned:2;
>       unsigned int kind:3;
>       unsigned int compact:1;
>       unsigned int ascii:1;
>       unsigned int ready:1;
>       unsigned int :24;
>   } state;
> 
> i.e. it should have been a packed unsigned int (4 bytes) but DTrace
> was using adding 8 bytes to the representation size, also throwing
> off field offsets that followed.
> 
> Track bitfield allocation state while declaring struct/union members.
> For each storage unit, add an empty-name CTF member using the original
> base type to force the containing type to the C ABI size, and add named
> bitfields as CTF slices at explicit bit offsets within that unit.  Reset
> the allocation state for zero-width unnamed fields and non-bitfield
> members.
> 
> Also make bitfield code generation choose load/store sizes from both the
> field width and its intra-byte offset, since packed fields can now cross
> byte boundaries.
> 
> Update the bitfield sizeof test expectations to C ABI sizes and add a
> regression test for unnamed padding matching the PyASCIIObject layout:
> state size 4, wstr offset 40, total size 48.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
> ---
>  libdtrace/dt_cg.c                            |  33 ++--
>  libdtrace/dt_decl.c                          | 198 ++++++++++++++++---
>  libdtrace/dt_decl.h                          |   6 +
>  test/unittest/bitfields/tst.SizeofBitField.d |   6 +-
>  test/unittest/bitfields/tst.SizeofBitField.r |  12 +-
>  5 files changed, 201 insertions(+), 54 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index a77c022c..0859e9cb 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -92,6 +92,12 @@ clp2(size_t x)
>  	return x + 1;
>  }
>  
> +static size_t
> +dt_cg_bitfield_size(uint_t offset, uint_t bits)
> +{
> +	return clp2(P2ROUNDUP((offset % NBBY) + bits, NBBY) / NBBY);
> +}
> +
>  /*
>   * Determine the load size for the specified node and CTF type, and return the
>   * equivalent BPF size specifier.
> @@ -104,13 +110,13 @@ dt_cg_ldsize(dt_node_t *dnp, ctf_file_t *ctfp, ctf_id_t type, ssize_t *ret_size)
>  
>  	/*
>  	 * If we're loading a bit-field, the size of our load is found by
> -	 * rounding cte_bits up to a byte boundary and then finding the
> -	 * nearest power of two to this value (see clp2(), above).
> +	 * rounding the bit offset and size up to a byte boundary and then
> +	 * finding the nearest power of two to this value (see clp2(), above).
>  	 */
>  	if (dnp &&
>  	    (dnp->dn_flags & DT_NF_BITFIELD) &&
>  	    ctf_type_encoding(ctfp, type, &e) != CTF_ERR)
> -		size = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY);
> +		size = dt_cg_bitfield_size(e.cte_offset, e.cte_bits);
>  	else
>  		size = ctf_type_size(ctfp, type);
>  
> @@ -3586,7 +3592,8 @@ dt_cg_field_get(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp,
>  	if (dnp->dn_flags & DT_NF_REF)
>  		return;
>  
> -	op = dt_cg_ldsize(dnp, fp, mp->ctm_type, &size);
> +	size = dt_cg_bitfield_size(offset, e.cte_bits);
> +	op = bpf_ldst_size(size, 0);
>  	if (dnp->dn_left->dn_flags & (DT_NF_ALLOCA | DT_NF_DPTR))
>  		emit(dlp, BPF_LOAD(op, reg, reg, 0));
>  	else
> @@ -3653,8 +3660,7 @@ dt_cg_field_get(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp,
>  	 * nearest power of two to this value (see clp2(), above).
>  	 */
>  #ifdef _BIG_ENDIAN
> -	shift = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY) * NBBY -
> -		(offset + e.cte_bits);
> +	shift = size * NBBY - (offset + e.cte_bits);
>  #else
>  	shift = offset;
>  #endif
> @@ -3686,7 +3692,7 @@ dt_cg_field_set(dt_node_t *src, dt_irlist_t *dlp,
>  {
>  	uint64_t cmask, fmask, shift;
>  	int r1, r2;
> -	size_t offset;
> +	size_t offset, size;
>  
>  	ctf_membinfo_t m;
>  	ctf_encoding_t e;
> @@ -3731,9 +3737,10 @@ dt_cg_field_set(dt_node_t *src, dt_irlist_t *dlp,
>  	 * pass through the containing bits and zero the field bits.
>  	 */
>  #ifdef _BIG_ENDIAN
> -	shift = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY) * NBBY -
> -		(offset % NBBY + e.cte_bits);
> +	size = dt_cg_bitfield_size(offset, e.cte_bits);
> +	shift = size * NBBY - (offset % NBBY + e.cte_bits);
>  #else
> +	size = dt_cg_bitfield_size(offset, e.cte_bits);
>  	shift = offset % NBBY;
>  #endif
>  	fmask = (1ULL << e.cte_bits) - 1;
> @@ -3748,7 +3755,7 @@ dt_cg_field_set(dt_node_t *src, dt_irlist_t *dlp,
>  	 * r2 <<= shift
>  	 * r1 |= r2
>  	 */
> -	emit(dlp, BPF_LOAD(dt_cg_ldsize(dst, fp, m.ctm_type, NULL), r1, dst->dn_reg, 0));
> +	emit(dlp, BPF_LOAD(bpf_ldst_size(size, 0), r1, dst->dn_reg, 0));
>  	dt_cg_setx(dlp, r2, cmask);
>  	emit(dlp, BPF_ALU64_REG(BPF_AND, r1, r2));
>  	dt_cg_setx(dlp, r2, fmask);
> @@ -3770,12 +3777,12 @@ dt_cg_store(dt_node_t *src, dt_irlist_t *dlp, dt_regset_t *drp, dt_node_t *dst)
>  
>  	/*
>  	 * If we're storing into a bit-field, the size of our store is found by
> -	 * rounding dst's cte_bits up to a byte boundary and then finding the
> -	 * nearest power of two to this value (see clp2(), above).
> +	 * rounding dst's bit offset and size up to a byte boundary and then
> +	 * finding the nearest power of two to this value (see clp2(), above).
>  	 */
>  	if ((dst->dn_flags & DT_NF_BITFIELD) &&
>  	    ctf_type_encoding(dst->dn_ctfp, dst->dn_type, &e) != CTF_ERR)
> -		size = clp2(P2ROUNDUP(e.cte_bits, NBBY) / NBBY);
> +		size = dt_cg_bitfield_size(e.cte_offset, e.cte_bits);
>  	else
>  		size = dt_node_type_size(dst);
>  
> diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
> index 1f4936dd..29c58189 100644
> --- a/libdtrace/dt_decl.c
> +++ b/libdtrace/dt_decl.c
> @@ -16,6 +16,8 @@
>  #include <dt_module.h>
>  #include <dt_impl.h>
>  
> +static void dt_decl_bf_reset(dt_scope_t *);
> +
>  static dt_decl_t *
>  dt_decl_check(dt_decl_t *ddp)
>  {
> @@ -129,6 +131,7 @@ dt_decl_pop(void)
>  	dsp->ds_type = CTF_ERR;
>  	dsp->ds_class = DT_DC_DEFAULT;
>  	dsp->ds_enumval = -1;
> +	dt_decl_bf_reset(dsp);
>  
>  	return ddp;
>  }
> @@ -483,6 +486,89 @@ dt_decl_sou(uint_t kind, char *name)
>  	return ddp;
>  }
>  
> +static ulong_t
> +dt_decl_bf_align(ulong_t off, ulong_t align)
> +{
> +	return align == 0 ? off : ((off + align - 1) / align) * align;
> +}
> +
> +static void
> +dt_decl_bf_reset(dt_scope_t *dsp)
> +{
> +	dsp->ds_bf_active = 0;
> +	dsp->ds_bf_base = CTF_ERR;
> +	dsp->ds_bf_unit_off = 0;
> +	dsp->ds_bf_unit_bits = 0;
> +	dsp->ds_bf_unit_align = 0;
> +	dsp->ds_bf_next = 0;
> +}
> +
> +static ulong_t
> +dt_decl_bf_size(dt_scope_t *dsp)
> +{
> +	ssize_t size = ctf_type_size(dsp->ds_ctfp, dsp->ds_type);
> +
> +	if (size < 0) {
> +		xyerror(D_UNKNOWN, "failed to determine struct size: %s\n",
> +		    ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
> +	}
> +
> +	return (ulong_t)size * CHAR_BIT;
> +}
> +
> +static void
> +dt_decl_bf_anchor(dt_scope_t *dsp, ctf_id_t base, ulong_t off,
> +    const char *idname)
> +{
> +	if (ctf_add_member_offset(dsp->ds_ctfp, dsp->ds_type, "",
> +	    base, off) == CTF_ERR) {
> +		xyerror(D_UNKNOWN, "failed to define storage for "
> +		    "bit-field '%s': %s\n", idname,
> +		    ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
> +	}
> +}
> +
> +static void
> +dt_decl_bf_start(dt_scope_t *dsp, ctf_id_t base, uint_t unit_bits,
> +    uint_t unit_align, const char *idname)
> +{
> +	ulong_t off = dt_decl_bf_align(dt_decl_bf_size(dsp), unit_align);
> +
> +	dt_decl_bf_anchor(dsp, base, off, idname);
> +
> +	dsp->ds_bf_active = 1;
> +	dsp->ds_bf_base = base;
> +	dsp->ds_bf_unit_off = off;
> +	dsp->ds_bf_unit_bits = unit_bits;
> +	dsp->ds_bf_unit_align = unit_align;
> +	dsp->ds_bf_next = 0;
> +}
> +
> +static void
> +dt_decl_member_copy(dt_scope_t *dsp, dtrace_typeinfo_t *dtt,
> +    const char *idname)
> +{
> +	/*
> +	 * If the member type is not defined in the same CTF container as the
> +	 * one associated with the current scope (i.e. the container for the
> +	 * struct or union itself) or its parent, copy the member type into
> +	 * this container and reset dtt to refer to the copied type.
> +	 */
> +	if (dtt->dtt_ctfp != dsp->ds_ctfp &&
> +	    dtt->dtt_ctfp != ctf_parent_file(dsp->ds_ctfp)) {
> +
> +		dtt->dtt_type = ctf_add_type(dsp->ds_ctfp,
> +		    dtt->dtt_ctfp, dtt->dtt_type);
> +		dtt->dtt_ctfp = dsp->ds_ctfp;
> +
> +		if (dtt->dtt_type == CTF_ERR ||
> +		    ctf_update(dtt->dtt_ctfp) == CTF_ERR) {
> +			xyerror(D_UNKNOWN, "failed to copy type of '%s': %s\n",
> +			    idname, ctf_errmsg(ctf_errno(dtt->dtt_ctfp)));
> +		}
> +	}
> +}
> +
>  void
>  dt_decl_member(dt_node_t *dnp)
>  {
> @@ -542,22 +628,28 @@ dt_decl_member(dt_node_t *dnp)
>  		xyerror(D_DECL_VOIDOBJ, "cannot have void member: %s\n", ident);
>  
>  	/*
> -	 * If a bit-field qualifier was part of the member declaration, create
> -	 * a new integer type of the same name and attributes as the base type
> -	 * and size equal to the specified number of bits.  We reset 'dtt' to
> -	 * refer to this new bit-field type and continue on to add the member.
> +	 * If a bit-field qualifier was part of the member declaration, add a
> +	 * hidden storage-unit member to force the containing type to the C ABI
> +	 * size, and add the named field as a CTF slice at the corresponding bit
> +	 * offset within that unit.
>  	 */
>  	if (dnp != NULL) {
> +		ctf_id_t bftype;
> +		uint_t unit_bits, unit_align, width;
> +		ulong_t bitoff, memberoff;
> +		ssize_t align;
> +		int is_union;
> +
>  		dnp = dt_node_cook(dnp, DT_IDFLG_REF);
>  
>  		/*
>  		 * A bit-field member with no declarator is permitted to have
>  		 * size zero and indicates that no more fields are to be packed
> -		 * into the current storage unit.  We ignore these directives
> -		 * as the underlying ctf code currently does so for all fields.
> +		 * into the current storage unit.
>  		 */
>  		if (ident == NULL && dnp->dn_kind == DT_NODE_INT &&
>  		    dnp->dn_value == 0) {
> +			dt_decl_bf_reset(dsp);
>  			dt_node_free(dnp);
>  			goto done;
>  		}
> @@ -579,43 +671,77 @@ dt_decl_member(dt_node_t *dnp)
>  			    "for type: %s\n", idname);
>  		}
>  
> +		dt_decl_member_copy(dsp, &dtt, idname);
> +
> +		base = ctf_type_resolve(dtt.dtt_ctfp, dtt.dtt_type);
> +		unit_bits = cte.cte_bits;
> +		width = (uint_t)dnp->dn_value;
> +		align = ctf_type_align(dtt.dtt_ctfp, base);
> +		if (align < 0)
> +			align = size;
> +		unit_align = (uint_t)align * CHAR_BIT;
> +		if (unit_align == 0)
> +			unit_align = CHAR_BIT;
> +		is_union = ctf_type_kind(dsp->ds_ctfp, dsp->ds_type) ==
> +		    CTF_K_UNION;
> +
> +		if (is_union) {
> +			dt_decl_bf_anchor(dsp, base, 0, idname);
> +			bitoff = 0;
> +		} else {
> +			if (!dsp->ds_bf_active) {
> +				dt_decl_bf_start(dsp, base, unit_bits,
> +				    unit_align, idname);
> +			} else if (unit_bits > dsp->ds_bf_unit_bits &&
> +			    dsp->ds_bf_next + width <= unit_bits &&
> +			    dsp->ds_bf_unit_off % unit_align == 0) {
> +				dt_decl_bf_anchor(dsp, base,
> +				    dsp->ds_bf_unit_off, idname);
> +				dsp->ds_bf_base = base;
> +				dsp->ds_bf_unit_bits = unit_bits;
> +				dsp->ds_bf_unit_align = unit_align;
> +			} else if (dsp->ds_bf_next + width >
> +			    dsp->ds_bf_unit_bits) {
> +				dt_decl_bf_start(dsp, base, unit_bits,
> +				    unit_align, idname);
> +			}
> +
> +			bitoff = dsp->ds_bf_next;
> +			dsp->ds_bf_next += width;
> +		}
> +
> +		if (ident == NULL) {
> +			dt_node_free(dnp);
> +			goto done;
> +		}
> +
>  		cte.cte_offset = 0;
> -		cte.cte_bits = (uint_t)dnp->dn_value;
> +		cte.cte_bits = width;
> +		memberoff = is_union ? 0 :
> +		    dsp->ds_bf_unit_off + (bitoff / CHAR_BIT) * CHAR_BIT;
> +		cte.cte_offset = bitoff % CHAR_BIT;
>  
> -		dtt.dtt_type = ctf_add_integer(dsp->ds_ctfp,
> -		    CTF_ADD_NONROOT, ctf_type_name(dtt.dtt_ctfp,
> -		    dtt.dtt_type, n, sizeof(n)), &cte);
> +		bftype = ctf_add_slice(dsp->ds_ctfp, CTF_ADD_NONROOT,
> +		    base, &cte);
>  
> -		if (dtt.dtt_type == CTF_ERR ||
> -		    ctf_update(dsp->ds_ctfp) == CTF_ERR) {
> +		if (bftype == CTF_ERR) {
>  			xyerror(D_UNKNOWN, "failed to create type for "
>  			    "member '%s': %s\n", idname,
>  			    ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
>  		}
>  
> -		dtt.dtt_ctfp = dsp->ds_ctfp;
> +		if (ctf_add_member_offset(dsp->ds_ctfp, dsp->ds_type,
> +		    ident, bftype, memberoff) == CTF_ERR) {
> +			xyerror(D_UNKNOWN, "failed to define member '%s': %s\n",
> +			    idname, ctf_errmsg(ctf_errno(dsp->ds_ctfp)));
> +		}
> +
>  		dt_node_free(dnp);
> +		goto done;
>  	}
>  
> -	/*
> -	 * If the member type is not defined in the same CTF container as the
> -	 * one associated with the current scope (i.e. the container for the
> -	 * struct or union itself) or its parent, copy the member type into
> -	 * this container and reset dtt to refer to the copied type.
> -	 */
> -	if (dtt.dtt_ctfp != dsp->ds_ctfp &&
> -	    dtt.dtt_ctfp != ctf_parent_file(dsp->ds_ctfp)) {
> -
> -		dtt.dtt_type = ctf_add_type(dsp->ds_ctfp,
> -		    dtt.dtt_ctfp, dtt.dtt_type);
> -		dtt.dtt_ctfp = dsp->ds_ctfp;
> -
> -		if (dtt.dtt_type == CTF_ERR ||
> -		    ctf_update(dtt.dtt_ctfp) == CTF_ERR) {
> -			xyerror(D_UNKNOWN, "failed to copy type of '%s': %s\n",
> -			    idname, ctf_errmsg(ctf_errno(dtt.dtt_ctfp)));
> -		}
> -	}
> +	dt_decl_bf_reset(dsp);
> +	dt_decl_member_copy(dsp, &dtt, idname);
>  
>  	if (ctf_add_member(dsp->ds_ctfp, dsp->ds_type,
>  	    ident, dtt.dtt_type) == CTF_ERR) {
> @@ -1040,6 +1166,7 @@ dt_scope_create(dt_scope_t *dsp)
>  	dsp->ds_type = CTF_ERR;
>  	dsp->ds_class = DT_DC_DEFAULT;
>  	dsp->ds_enumval = -1;
> +	dt_decl_bf_reset(dsp);
>  }
>  
>  void
> @@ -1072,6 +1199,7 @@ dt_scope_push(ctf_file_t *ctfp, ctf_id_t type)
>  	dsp->ds_type = type;
>  	dsp->ds_class = rsp->ds_class;
>  	dsp->ds_enumval = rsp->ds_enumval;
> +	dt_decl_bf_reset(dsp);
>  
>  	dt_scope_create(rsp);
>  	rsp->ds_next = dsp;
> @@ -1101,6 +1229,12 @@ dt_scope_pop(void)
>  	rsp->ds_type = dsp->ds_type;
>  	rsp->ds_class = dsp->ds_class;
>  	rsp->ds_enumval = dsp->ds_enumval;
> +	rsp->ds_bf_active = dsp->ds_bf_active;
> +	rsp->ds_bf_base = dsp->ds_bf_base;
> +	rsp->ds_bf_unit_off = dsp->ds_bf_unit_off;
> +	rsp->ds_bf_unit_bits = dsp->ds_bf_unit_bits;
> +	rsp->ds_bf_unit_align = dsp->ds_bf_unit_align;
> +	rsp->ds_bf_next = dsp->ds_bf_next;
>  
>  	free(dsp);
>  	return rsp->ds_decl;
> diff --git a/libdtrace/dt_decl.h b/libdtrace/dt_decl.h
> index 0bec183b..4be31158 100644
> --- a/libdtrace/dt_decl.h
> +++ b/libdtrace/dt_decl.h
> @@ -58,6 +58,12 @@ typedef struct dt_scope {
>  	ctf_id_t ds_type;		/* CTF id of enclosing type */
>  	dt_dclass_t ds_class;		/* declaration class for this scope */
>  	int ds_enumval;			/* most recent enumerator value */
> +	int ds_bf_active;		/* bit-field allocation unit is active */
> +	ctf_id_t ds_bf_base;		/* bit-field allocation unit base type */
> +	ulong_t ds_bf_unit_off;		/* bit offset of bit-field unit */
> +	uint_t ds_bf_unit_bits;		/* size in bits of bit-field unit */
> +	uint_t ds_bf_unit_align;		/* alignment in bits of bit-field unit */
> +	uint_t ds_bf_next;		/* next bit offset in bit-field unit */
>  } dt_scope_t;
>  
>  extern dt_decl_t *dt_decl_alloc(ushort_t, char *);
> diff --git a/test/unittest/bitfields/tst.SizeofBitField.d b/test/unittest/bitfields/tst.SizeofBitField.d
> index 1eb4ab5d..2ad7df02 100644
> --- a/test/unittest/bitfields/tst.SizeofBitField.d
> +++ b/test/unittest/bitfields/tst.SizeofBitField.d
> @@ -80,9 +80,9 @@ BEGIN
>  }
>  
>  END
> -/(1 != sizeof(var1)) || (2 != sizeof(var2)) || (3 != sizeof(var3)) ||
> -    (4 != sizeof(var4)) || (5 != sizeof(var5)) || (6 != sizeof(var6))
> -    || (7 != sizeof(var7)) || (8 != sizeof(var8)) || (12 != sizeof(var12))/
> +/(4 != sizeof(var1)) || (4 != sizeof(var2)) || (4 != sizeof(var3)) ||
> +    (4 != sizeof(var4)) || (4 != sizeof(var5)) || (8 != sizeof(var6))
> +    || (8 != sizeof(var7)) || (8 != sizeof(var8)) || (12 != sizeof(var12))/
>  {
>  	exit(1);
>  }
> diff --git a/test/unittest/bitfields/tst.SizeofBitField.r b/test/unittest/bitfields/tst.SizeofBitField.r
> index 9d97b2aa..a5e4007b 100644
> --- a/test/unittest/bitfields/tst.SizeofBitField.r
> +++ b/test/unittest/bitfields/tst.SizeofBitField.r
> @@ -1,10 +1,10 @@
> -sizeof(bitRecord1): 1
> -sizeof(bitRecord2): 2
> -sizeof(bitRecord3): 3
> +sizeof(bitRecord1): 4
> +sizeof(bitRecord2): 4
> +sizeof(bitRecord3): 4
>  sizeof(bitRecord4): 4
> -sizeof(bitRecord5): 5
> -sizeof(bitRecord6): 6
> -sizeof(bitRecord7): 7
> +sizeof(bitRecord5): 4
> +sizeof(bitRecord6): 8
> +sizeof(bitRecord7): 8
>  sizeof(bitRecord8): 8
>  sizeof(bitRecord12): 12
>  
> -- 
> 2.43.5
> 
