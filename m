Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951362222C8
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 21:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755637644; cv=fail; b=HcpECwdnEh4xB9DSwDHE+/hJFU1bVoBFuNE3CBd6cMZkX7tvOZQxo35n2Ec2oj9l9FIQXFzdFbHpifJoYDithGM8AUP/SK508K9XLYDPq2aA+K3nhuBhQheOkmfJx1uj8tZ3BDsQzBYNnxzgUTM+QXxsuYSfUSwd2ROqzfsu/IM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755637644; c=relaxed/simple;
	bh=HqgJoTsxaShDFOV6Cr57VsawB9ZKCsvEflF8Shzml/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UZzN9ARsrg4mIIs4GJNSJwO7EOsC/eGxfCusg3bpZYWwqKZwgcU7otBR/JMSsJkm4xoCSCJUGlP94/HRdf5gaOsdHSmXQqp5QcNRWJjlyvws6EIu9MLb33qE9ZZmAvMX9+tKv/ZPbXmyoHcOzp+p+0YOv8lFK6Nmx8ICjWP2Uo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mByE+lbw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G5dtfpag; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mByE+lbw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G5dtfpag"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL2HvV023172
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 21:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=x3JkH5PabR7akOlVs0
	sc01BmI+WxIRMCicHI1P2Et4A=; b=mByE+lbwbCa3PrLNXatW3+2UO6PEc6V1cR
	YWhocPCK0BlVmYYB4etKL0woV+UbuMMHFfXIHyL0unx+ADUIMBwVqITf6usu0Tz1
	HsnX+6Y0ZEGMb/DB6luAfpYE4+MHSdtx8opNWbK1SZ7WJxSNWF/U0gTL/aBgcD1l
	OnRtu2aVVTuxMhxe9b4RB+Jy+UAP+MZKWBf3/PEW2VGj+yszVMQ1sXj5S7mg+UBM
	QXpt8Xu6YQpOOZa2FJl5Zs9a6okCVxQT3656SdqRiqPJQPGqpuHVa99bex6u7BPZ
	wS6qRQoUYcuIiN47CWHD256jLqYXdet1B1XfGJ6MO1XXZEul7VmQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48n0tqr070-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 21:07:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57JJ4Ggw030286
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 21:07:20 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48my3t433f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Aug 2025 21:07:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryPGYutIsMeTQvR+nPpX+X+cz3bcvg2ieEII+YBdY52izd5WWPpRP0J3dvzvK5y8vP2cc7izrBD7nynJIRmSyAvMQP6ktZ6K5Eme1TT1QvCsaPFYSgutxRoXywvl3fnUwR0PLtxRYtVOn/ASlLoQvI0yJfNc+RIpkzPSjB1xrfdvcIB6bsVAZDIwvoPP6Icnc3CqHE3/9SeEmtAnbwoaoxUMupMbVAxAHoVM895iLtWJXxkT26a5mybkWjo/R2ZPOLgH2A/2foio2XM6mlrDb+VJTeCjFpRHq9uDCrCrWjxqEPyBQle3P5U0FwnYLsRt2Jk8+5gIc3AbGPXBE967qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3JkH5PabR7akOlVs0sc01BmI+WxIRMCicHI1P2Et4A=;
 b=fulvB/45hmzluJ1QH9JnQ/JkclnABHlc/8gfR1/L4ISjTMDTv/CzTtBW17olADT1Obv2YADenj8ihPOEZnNwLLf5jkWFGeI6MDQr+VlzFPHUJMl0P6nDT/eULdl59bMXXBCr7HYMnPDAd9KUohRe/UdjaOg91PC+74vz1B6YAyCdcuRHogIcIhF6yw9wxCdf5G0G/5o7rxa6tDUOgXDYdhKEz35JLZF2ZbEE6l1/zZRGpBrdVIFiWlS14j9BL5QhlWQ594MUt58Ka9nQHifl+ydyzERbb52RDCjHlPL3rP4HvHZpvylV1OZt4bDHKgwRi48VqvzofmquPD4PD/d8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3JkH5PabR7akOlVs0sc01BmI+WxIRMCicHI1P2Et4A=;
 b=G5dtfpagmjNLj0CEFbyBH6IJtXdPOlpyzsFjEeC7+5ehiOhvFuVpc/ien6L/moPcailT4/w766eNU0i2PpqCLtAeuRzxdhRLkXkQmnGwwiWm1T18bJ//BQKnts0MSIWHfvYmxC7TurL1kBKThnspg+NbFKHubnnDB4vdDyRWVK0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CO1PR10MB4529.namprd10.prod.outlook.com (2603:10b6:303:96::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 21:07:17 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 21:07:17 +0000
Date: Tue, 19 Aug 2025 17:07:15 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 2/2] Extend the USDT bit mask to multiple words
Message-ID: <aKTng7/MOecCH5u2@oracle.com>
References: <20250723005304.8407-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723005304.8407-1-eugene.loh@oracle.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CO1PR10MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c68ae6-666a-4d53-18b9-08dddf64612b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ocadOwGpSZ8lRjUd7iTY2+vXHxNSWoYhlvdzSa+uq5QO7ZyyvemMU0pzHrBn?=
 =?us-ascii?Q?Arp233ggcu685rtDflktlUgWys8czV8etKqs5iJZtUC5TUspHhh3y69ua6UP?=
 =?us-ascii?Q?cADVHTaodlG4X5rbBZ1MVyuSMi6umVuKwvC32/vnSMlGZDnibuoKX2CWIc5j?=
 =?us-ascii?Q?Fpu1W0cR4ujh7NG5NP4oMJZ3RBX5fFlry2uosXImPYVbFWdmePzVwSyj1QQA?=
 =?us-ascii?Q?GRo/x549/CAPcAN3sgWAqch5vbSjQp4q/B8XK+VHp106lb7fOW+SzZNqrAWO?=
 =?us-ascii?Q?uCDLjRGfRNQU+ndYg6MIz3SVW+P5ejFmrzL3Tmypz6q7+N19hMMiv1o8ljmk?=
 =?us-ascii?Q?cpblQe7NdsC+tPcS1+pdCWX4pK/XsiSTIDU+5y3a4X6c/zKrhg8ButHRHEVR?=
 =?us-ascii?Q?JLyj0ld8BcFmGqRMKN7upPyYJz7Ozzar/rxFhF0DL7rmq2ude61cRD7lqUwn?=
 =?us-ascii?Q?u5xbCXbSLG7Ph75+qFBorG1hMEXHglFKIvo75DDNB6Dg2Z9DPNxVkXX90Kjj?=
 =?us-ascii?Q?jWcFTBAT/P7Ms/ApMjJYZxOTwiH+mIAXLy31m/3MxX7W/2lVZ4WBcYJfjeaH?=
 =?us-ascii?Q?JQyqnK0h2gBsu3/OwIAL0c3qIM/f/p0XLQr89oKyuAnSkRBi6xuPP9aN7Ro5?=
 =?us-ascii?Q?Po4vsMUBOI8/gmdBH8ccYatPH1vgiltfV3hf8YfzrLhDQ41qAUwmFLBYW+zA?=
 =?us-ascii?Q?zkhgUjkOxE3I8Zi2QADpZFz6PAKfvCTe85uHkXXoLJSvnqb6Plq9+fnW2duG?=
 =?us-ascii?Q?1k6QlK5xmljQEqvhH7hBdCr4VfdvhjS8G1b+CcLUDK9w2CVzuE0jiVocPTl6?=
 =?us-ascii?Q?PqcbQ/Qv/ZtZCKKwN2RaVjpATAPwu/l+Lm2wnbcCjwx+oU1V7sf94ZHu1xE0?=
 =?us-ascii?Q?8Xyzz47IYE/cPaBsU/b1kYuLUAkpdsn/GNOq3e4fdPSvkN2EG/rhTxxr1Vgw?=
 =?us-ascii?Q?eBpImI0bg/rT+VM7scW1B0gRD9yjRKSDgiCNLRacpEyAKGVRnDIFhm+lVCdF?=
 =?us-ascii?Q?0qAMxdRByMxmWecozYaCWlIiQtC9oief/Dn+ciomayNz2XHDxzO94q5x10vn?=
 =?us-ascii?Q?qFdul7Z0erM6qQhLJMi5Z5dUaxokv7KRBig1YdW9H0a0RxLLr8z0WrmEoMQo?=
 =?us-ascii?Q?aDNkFDazYacS/AlSy4x29AkXQMIS7fsv3LYr1AaPxRTLXeX8Jjeffc9Q7xCD?=
 =?us-ascii?Q?Y+0wEOl1PwLb11/fqam25eprhVj8n+RK4nOl3d4PBoFH4T0GuDFcH9nDIceL?=
 =?us-ascii?Q?MSE0bZekvOAOQp7q+9ydxaMou3tfG6J17aQxfp5bKdEgbIBBeGFDMxFQ9WLH?=
 =?us-ascii?Q?tk3vmBkB3GgrxNjO9E3ScYyPDza2UciPqqpkH3O8z9L9Wn0X/qiCoCz8tDK5?=
 =?us-ascii?Q?SMMmFeWoDYMqMQbXFoGe1MvRWxJl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eU9r3e6JEURqbhyztiTHwoyaylvwf6kAqL6gTyupqBuNcI1yVU5r1LGrvgAZ?=
 =?us-ascii?Q?G9w0Fe+Ye9GD7X5D9ynzrCFlC+NOLOU04efpxlHHPUmrcD2jG3rGfijBw6VA?=
 =?us-ascii?Q?d69bgnT2ER3wjZFvHXVyeYNI2sow4GZVXrhHx765SE3M7GJvhRwH458NxYue?=
 =?us-ascii?Q?D4m2/yc7qmveyJjs7VYl7iky/dWjG6898PWlSP83nXjHgf45Hbm7yqz1Vlyu?=
 =?us-ascii?Q?2TmSoFvZjKDb/a45iIqFuTlQ2VA+YxBPVtpTMst3bLytutmb1wLyq4uL6Csv?=
 =?us-ascii?Q?WsqpV4CWHZwwxvO+3d7l2KpkbKAk/aHapcMyM/HfCT+rDrQVX3lvhByzN98w?=
 =?us-ascii?Q?j+e+N81OXjGPJsRDwbXfMpeyQrIBMat26QGttd9X449RFqB/OSf8H4LDc1or?=
 =?us-ascii?Q?v7pokmopVqDoVeutrOyqJNrfJN+00kyK2nPpDk8edyYNS/+pZ4lSMl0CHQLl?=
 =?us-ascii?Q?YbTQrUMwJSNbvWz/aNixM4qgf1MLrBwOsdIm/dgbCaddKIkrlGc84CHy0Qen?=
 =?us-ascii?Q?m+zmReDhbT7zNXTW/nJr9nsfOjfoQ03Bsuc/KNCc8CEFBI8kJ6vH53W9yH5j?=
 =?us-ascii?Q?WlcoHI4EwhpW9haTo38dxjOgfh7MuQ+UsADvGT73M4Yuciv78aXPO/CwZdzR?=
 =?us-ascii?Q?WXimJwdQPsIr8gFSWIjKoKPFnym6WSIn5MhCmku78Qlb4pgWUDFrw2UNmxzg?=
 =?us-ascii?Q?apw4kO7TR36dx1BBOca/M4L41JdpND9WydAqgDuX+32npJUIGyST646na2YV?=
 =?us-ascii?Q?PoO5l8vLUIZjvGmvfM7i4HkeamDUSSJViKFGA2Yp8AUkZG1Z1e0o7YdRGboF?=
 =?us-ascii?Q?3XKPxNx3siubHR2NA3jI6N4QbLbOec1GtOmZge5hsJyPty9BZ3i/Hkxr7zGb?=
 =?us-ascii?Q?fb1t9Hkywo1G0oe9Pum+J/p0RAz7u29aOEnfcH0ehz3XuWICgXUTws8bDVkw?=
 =?us-ascii?Q?V0irNBLlEqbdxAp7DwPisYt7fWFzlbqoRQy6P9X06yeneILjCyarRXMceth8?=
 =?us-ascii?Q?PUgGCL92J/HX3ETQ/x1LamA7Ea9A3HlDqFdr/bNGbCyyEJ8M+GeEcpi6aqSW?=
 =?us-ascii?Q?NRjhoWp8AndwT9dpnBewIoa6ozR+NbeGG0JBoivo3S+QCioVXQiyfpMQLErB?=
 =?us-ascii?Q?4I6HUaF/aCdf9KsaH7QHJsnqSqOkIPwBOzy8Hdc1pJogVy3ytUEDCz059beh?=
 =?us-ascii?Q?ugHqzS9LeJtX7dUwCfqwH7yqkSFamPwn5Bn+2dI0D4jWWdMKzIcdBwsAssQG?=
 =?us-ascii?Q?kqwvdtYrTx+1tDYXGbPNXOWSiNhs1z/6fX6ulFM4U1Efug7k7sW6E4M4Fr6Q?=
 =?us-ascii?Q?rCi3xaX+hyo7Wee54gxDbFNaaPrHUGNuU9alveMaI4EzJ9LVzOYfc9UvmkRv?=
 =?us-ascii?Q?YQr+Ab53lXa/F+qQYqzkhFVVRuVvGRS7sBSZvd+R7zqyyNv9JddhhBl6YIrb?=
 =?us-ascii?Q?zT+FT0kB5JuSZhxSbd4u1/TXaGJ/3YkooZWX1t9MHR6hyvfVrutmnumpuGrL?=
 =?us-ascii?Q?+huLun26v1ZMhVMZOH5Imo84LDpToLRFSX0T0KBoLHd+gtRop/2WyCQRcDCd?=
 =?us-ascii?Q?BYdUmaQvi9DA0/Q3xvlrzVoxfmnznFAj7BP3BV8MK8utt0hfI3B0gi+kTKUa?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pSQFgtmoS3WCPGzrX0RuhBZK1uixW4TP4VH/Pub41dFgfVZk4hDMI8OQ2nOtNEUeYvnKv7f2vxA8+W8m8GcfykfzvrKXq7mb+SONqmG9ZotvAM+KZXais2R9shQU0N/9qMceifjj0Lmdg9GKZfyAvU5H9RswShVZv1eh0LjmZtcERw2+l0uR5HdkxqcZm24ib8f90XzcTbfkx3iE2UUMBqbxKNV0HfpC5OKxAdnyY+F7cAP3MTwdOimwqN5hjzoCSKgLMCE+6SXndfLg1R2FHtDlEMc8dFCaZS9VY+95Y0JgsV3wyRLPuRS6vT77UTLd1Pfc/pX3pOFUHQBzKs2Qp4xiG39m44h3dgQKA4VmJh6PFMpIDr6s/U2Z4EicSoGTj7bULeFKpP4JvE65Cifu1yXOiZ/xk5kMZBwOkMhU/4qIjKOuHVrxcZnuSQEwyS5SftngvwO8naOh7ZxuiVbKnLgzErSEHhMjueQDkNGzsvchS26vJjG84XjdiBUq9k1M53Et5jxsdxcGS9QfucEPngRDfo/kKfFHeHRTWsN+wAjKDVHIMbPIwcwiKgFI8zjlhd8KqQIppe4fMmt2I//95RIoI14hRlI0yz7TTZPhO0o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c68ae6-666a-4d53-18b9-08dddf64612b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 21:07:17.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: to4p7N6FoGBMxe3R/bAz5s8LLhk0S0SJvi9c4IQAtzAxH815pzOf7CvpMNmNu+J6C3zQJWonPeHtyWQoJqpAF/mouIjjqh0AkdvoymzvLbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4529
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 phishscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508190196
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfXyb3+vy7gLU1v
 J8MGItBpXrJG/QZ4THCEGW92EJs2T9tKKr3HRARGdxxJ8WNfPElFGR6nyKnpDBJSc59rxqKx3id
 qWKDzj7yrAjcXrBi/zkumsUuR20eGy9YlpSgmBA8Htdc7t0V7zVQFDq1eMm64dqH0DldDtWEHKU
 TZPd/KVn1eSfO8j1in4q6TqBf6GtB2G5laOeSIBkIdpPDp7xZZkw92SxhsD58KYsLFJEppI6x3Z
 JTp4QgFPunZLj135YoQrvLZTBFFMFUkSgLoxx1BTCcRxiIvtYBPouqvZFg3yDkMK0cwe4yJz/zF
 ergA+nA3OBDrb3ljhC+6d4lKsM0ZN84EYMhY5vYps6zBSgvOCYPTvO+DoVZEJKgqDuhaBwWV9Zj
 5TCiiqE2q9cfLiP8JwNIr9geWPf4aLTf2S6oMIzWYoHXyzdXnRRBun9/ztbN6CtaekSYR1P6
X-Proofpoint-ORIG-GUID: kuvSTMepPvLM5KormNb9WdXI33Tmzqlj
X-Proofpoint-GUID: kuvSTMepPvLM5KormNb9WdXI33Tmzqlj
X-Authority-Analysis: v=2.4 cv=K/p73yWI c=1 sm=1 tr=0 ts=68a4e789 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=25z-RVXd-M3rJRpQfwoA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13600

I would like to hold off on this patch a bit longer.  I don't think it is too
likely people are running into toruble due to too many clauses, and it would
be nice to avoid adding more provider-specific logic in the core of DTrace.

My suggestion is that we move the creation of the USDT-specific maps to the
uprobe provider.  Since those maps are only ever used by the trampolines
created by this provider, the fds and other data can be stored in the
provider specific private data.  Upon first call to generate a trampoline we
can check whether it has been initialized, and if not, create the maps and
populate them.

This way all the USDT-specific handling remains within the uprobe provider,
and we actually fix the earlier inclusion of creation of USDT maps by the
generic code.

On Tue, Jul 22, 2025 at 08:53:04PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Currently, USDT is limited to 64 probe descriptions since the
> underlying probe uses a 64-bit mask to decide which probes to execute.
> 
> Change to a multi-word bit mask that can be extended to however many
> probe descriptions there are.
> 
> Also, change the mask words to be 32-bit rather than 64-bit.  The reason
> is that, commonly, there will be fewer than 32 probe descriptions.  In
> this case, we shorten the value of the "USDT prids" BPF map from 16 bytes
>         uint32_t        prid;
>         long long       mask[1];
> down to 8 bytes
>         uint32_t        prid;
>         uint32_t        mask[1];
> (The second member is smaller and no longer costs extra padding.)
> 
> We also add an
>         int dt_usdt_mask_bytes;
> to denote how many bytes will be needed for the mask.  This value is
> computed by usdt_mask_bytes_init().  Currently, this function is
> awkwardly called in gmap_create_usdt(), just before the value is needed.
> Such a call to a provider-specific function is clumsy, but there are no
> other calls to the provider between compilation (where the number of
> statements is determined) and this map creation.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.c                            |   6 +-
>  libdtrace/dt_bpf_maps.h                       |   4 +-
>  libdtrace/dt_impl.h                           |   1 +
>  libdtrace/dt_prov_uprobe.c                    |  87 +++++++++---
>  .../unittest/usdt/tst.manyprobedescriptions.r |   1 +
>  .../usdt/tst.manyprobedescriptions.sh         |  64 +++++++++
>  .../usdt/tst.manyprobedescriptions2.r         |   1 +
>  .../usdt/tst.manyprobedescriptions2.sh        | 127 ++++++++++++++++++
>  8 files changed, 267 insertions(+), 24 deletions(-)
>  create mode 100644 test/unittest/usdt/tst.manyprobedescriptions.r
>  create mode 100755 test/unittest/usdt/tst.manyprobedescriptions.sh
>  create mode 100644 test/unittest/usdt/tst.manyprobedescriptions2.r
>  create mode 100755 test/unittest/usdt/tst.manyprobedescriptions2.sh
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index ddd849d0b..fcb53f044 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -967,6 +967,7 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>  	return 0;
>  }
>  
> +void usdt_mask_bytes_init(dtrace_hdl_t *dtp);
>  /*
>   * Create the 'usdt_names' and 'usdt_prids' BPF maps.
>   *
> @@ -992,8 +993,11 @@ gmap_create_usdt(dtrace_hdl_t *dtp)
>  	if (dtp->dt_usdt_namesmap_fd == -1)
>  		return -1;
>  
> +	usdt_mask_bytes_init(dtp);
> +
>  	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
> -	    sizeof(usdt_prids_map_key_t), sizeof(usdt_prids_map_val_t), nusdtprobes);
> +	    sizeof(usdt_prids_map_key_t),
> +	    sizeof(usdt_prids_map_val_t) + dtp->dt_usdt_mask_bytes, nusdtprobes);
>  	if (dtp->dt_usdt_pridsmap_fd == -1)
>  		return -1;
>  
> diff --git a/libdtrace/dt_bpf_maps.h b/libdtrace/dt_bpf_maps.h
> index 884dc3983..ec5d4d7b1 100644
> --- a/libdtrace/dt_bpf_maps.h
> +++ b/libdtrace/dt_bpf_maps.h
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2019, 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2019, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -48,7 +48,7 @@ typedef struct usdt_prids_map_key {
>  } usdt_prids_map_key_t;
>  typedef struct usdt_prids_map_val {
>  	uint32_t	prid;		/* should be dtrace_id_t, sys/dtrace_types.h */
> -	long long	mask;
> +	uint32_t	mask[];
>  } usdt_prids_map_val_t;
>  
>  #ifdef  __cplusplus
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 2adc1252b..8bbc4dc1f 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -397,6 +397,7 @@ struct dtrace_hdl {
>  	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
>  	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
>  	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
> +	int dt_usdt_mask_bytes;	/* size of USDT mask in bytes */
>  	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
>  	void *dt_errarg;	/* error handler argument */
>  	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index e8f9f8c98..8b55fe319 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -403,7 +403,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>  	int			fdprids = dtp->dt_usdt_pridsmap_fd;
>  	int			fdnames = dtp->dt_usdt_namesmap_fd;
>  	usdt_prids_map_key_t	key, nxt;
> -	usdt_prids_map_val_t	val;
> +	usdt_prids_map_val_t	*val = alloca(sizeof(usdt_prids_map_val_t) + dtp->dt_usdt_mask_bytes);
>  	list_key_t		keys_to_delete, *elem, *elem_next;
>  	dt_probe_t		*prp, *prp_next;
>  
> @@ -418,7 +418,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>  	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
>  		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
>  
> -		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
> +		if (dt_bpf_map_lookup(fdprids, &key, val) == -1)
>  			return dt_set_errno(dtp, EDT_BPF);
>  
>  		/* Check if the process is still running. */
> @@ -431,7 +431,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>  			 * we might delete the same usdt_names entry
>  			 * multiple times.  That's okay.
>  			 */
> -			dt_bpf_map_delete(fdnames, &val.prid);
> +			dt_bpf_map_delete(fdnames, &val->prid);
>  
>  			/*
>  			 * Delete the usdt_prids entry.
> @@ -452,7 +452,7 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>  		 * FIXME.  There might be another case, where the process
>  		 * is still running, but some of its USDT probes are gone?
>  		 * So maybe we have to check for the existence of one of
> -		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
> +		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val->prid]->desc;
>  		 *     char *prv = ...pdp->prv minus the numerial part;
>  		 *
>  		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
> @@ -590,6 +590,31 @@ static void usdt_error(dt_pcb_t *pcb, const char *fmt, ...)
>  	longjmp(pcb->pcb_jmpbuf, EDT_COMPILER);
>  }
>  
> +void usdt_mask_bytes_init(dtrace_hdl_t *dtp)
> +{
> +	int i, n = 0, w = sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
> +
> +	/* Count how many statements cannot be ignored, regardless of uprp. */
> +	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
> +		dtrace_stmtdesc_t *stp;
> +
> +		stp = dtp->dt_stmts[i];
> +		if (stp == NULL || ignore_clause(dtp, i, NULL))
> +			continue;
> +
> +		n++;
> +	}
> +
> +	/* Determine how many bytes are needed for this many bits. */
> +	n = (n + CHAR_BIT - 1) / CHAR_BIT;
> +
> +	/* Determine how many words are needed for this many bytes. */
> +	n = (n + w - 1) / w;
> +
> +	/* Determine how many bytes are needed. */
> +	dtp->dt_usdt_mask_bytes = (n ? n : 1) * w;
> +}
> +
>  static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  {
>  	dtrace_difo_t   *dp;
> @@ -651,6 +676,7 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  	int				fd = dtp->dt_usdt_namesmap_fd;
>  	pid_t				pid;
>  	list_probe_t			*pup;
> +	usdt_prids_map_val_t		*val;
>  
>  	/* Add probe name elements to usdt_names map. */
>  	p = probnam;
> @@ -686,11 +712,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  	}
>  
>  	/* Add prid and bit mask to usdt_prids map. */
> +	val = alloca(sizeof(usdt_prids_map_val_t) + dtp->dt_usdt_mask_bytes);
>  	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
>  		dt_probe_t		*uprp = pup->probe;
> -		long long		mask = 0, bit = 1;
> +		uint32_t		iword = 0, mask = 0, bit = 1;
>  		usdt_prids_map_key_t	key;
> -		usdt_prids_map_val_t	val;
>  		dt_uprobe_t		*upp = uprp->prv_data;
>  
>  		/*
> @@ -704,15 +730,24 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  		if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
>  			int n;
>  
> +			/*
> +			 * The loop over n to dtp->dt_stmt_nextid, skipping
> +			 * ignore_clause(), should be the same here as in
> +			 * the trampoline.
> +			 */
>  			for (n = 0; n < dtp->dt_stmt_nextid; n++) {
>  				dtrace_stmtdesc_t *stp;
>  
>  				stp = dtp->dt_stmts[n];
> -				if (stp == NULL)
> +				if (stp == NULL || ignore_clause(dtp, n, uprp))
>  					continue;
>  
> -				if (ignore_clause(dtp, n, uprp))
> -					continue;
> +				if (bit == 0) {
> +					val->mask[iword] = mask;
> +					mask = 0;
> +					iword++;
> +					bit = 1;
> +				}
>  
>  				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
>  				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
> @@ -727,11 +762,11 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  		key.pid = pid;
>  		key.uprid = uprp->desc->id;
>  
> -		val.prid = prp->desc->id;
> -		val.mask = mask;
> +		val->prid = prp->desc->id;
> +		val->mask[iword] = mask;
>  
>  		// FIXME Check return value, but how should errors be handled?
> -		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
> +		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, val);
>  	}
>  
>  	return 0;
> @@ -1452,7 +1487,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	const list_probe_t	*pop;
>  	uint_t			lbl_exit = pcb->pcb_exitlbl;
>  	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
> -	int			n;
> +	int			n, ibit, w = CHAR_BIT * sizeof(((usdt_prids_map_val_t *)0)->mask[0]);
>  
>  	assert(usdt_prids != NULL);
>  
> @@ -1539,7 +1574,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 */
>  	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
>  	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
> -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
> +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP,
> +		   DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
>  	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
>  	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
>  	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> @@ -1573,8 +1609,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
>  	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
>  
> -	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
> -	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
> +	/* Store the value key for reuse. */
> +	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
>  
>  	/*
>  	 * Apply arg mappings, if needed.
> @@ -1588,21 +1624,29 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	/*
>  	 * Hold the bit mask in %r6 between clause calls.
>  	 */
> -	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> +	/*
> +	 * The loop over n to dtp->dt_stmt_nextid, skipping
> +	 * ignore_clause(), should be the same here as in
> +	 * add_probe_usdt().
> +	 */
> +	for (ibit = n = 0; n < dtp->dt_stmt_nextid; n++) {
>  		dtrace_stmtdesc_t *stp;
>  		dt_ident_t	*idp;
>  		uint_t		lbl_next;
>  
>  		stp = dtp->dt_stmts[n];
> -		if (stp == NULL)
> -			continue;
> -
> -		if (ignore_clause(dtp, n, uprp))
> +		if (stp == NULL || ignore_clause(dtp, n, uprp))
>  			continue;
>  
>  		idp = stp->dtsd_clause;
>  		lbl_next = dt_irlist_label(dlp);
>  
> +		/* Load the next word of the bit mask into %r6. */
> +		if (ibit % w == 0) {
> +			emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
> +			emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask[ibit / w])));
> +		}
> +
>  		/* If the lowest %r6 bit is 0, skip over this clause. */
>  		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
>  		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
> @@ -1630,6 +1674,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  
>  		/* Right-shift %r6. */
>  		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
> +		ibit++;
>  	}
>  
>  out:
> diff --git a/test/unittest/usdt/tst.manyprobedescriptions.r b/test/unittest/usdt/tst.manyprobedescriptions.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.manyprobedescriptions.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/usdt/tst.manyprobedescriptions.sh b/test/unittest/usdt/tst.manyprobedescriptions.sh
> new file mode 100755
> index 000000000..92a61d5b7
> --- /dev/null
> +++ b/test/unittest/usdt/tst.manyprobedescriptions.sh
> @@ -0,0 +1,64 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +dtrace=$1
> +TRIGGER=$PWD/test/triggers/usdt-tst-args
> +
> +DIRNAME="$tmpdir/usdt-many_probe_descriptions.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Construct the D scripts and output files.
> +# We stick 80 probe descriptions in each of 3 scripts to test
> +# USDT's ability to handle hundreds of probe descriptions.
> +for d in 0 1 2; do
> +for x in 00 01 02 03 04 05 06 07 08 09 \
> +         10 11 12 13 14 15 16 17 18 19 \
> +         20 21 22 23 24 25 26 27 28 29 \
> +         30 31 32 33 34 35 36 37 38 39 \
> +         40 41 42 43 44 45 46 47 48 49 \
> +         50 51 52 53 54 55 56 57 58 59 \
> +         60 61 62 63 64 65 66 67 68 69 \
> +         70 71 72 73 74 75 76 77 78 79 \
> +; do
> +	echo 'test_prov$target:::place { printf("'$d$x'\n"); }' >> D$d.d
> +	echo $d$x >> expect.txt
> +done
> +done
> +echo 'test_prov$target:::place { exit(0); }' >> D$d.d
> +echo >> expect.txt
> +
> +# Run DTrace.
> +
> +$dtrace $dt_flags -c $TRIGGER -q -s D0.d -s D1.d -s D2.d >& actual.txt
> +if [ $? -eq 0 ]; then
> +	if diff -q expect.txt actual.txt > /dev/null; then
> +		echo success
> +		exit 0
> +	else
> +		echo ERROR: did not get expected results
> +		echo === expect.txt
> +		cat      expect.txt
> +		echo === actual.txt
> +		cat      actual.txt
> +		echo === diff
> +		diff expect.txt actual.txt
> +	fi
> +else
> +	echo ERROR: dtrace error
> +	echo ==== output
> +	cat actual.txt
> +fi
> +
> +echo ==== script D0.d
> +cat D0.d
> +echo ==== script D1.d
> +cat D1.d
> +echo ==== script D2.d
> +cat D2.d
> +
> +exit 1
> diff --git a/test/unittest/usdt/tst.manyprobedescriptions2.r b/test/unittest/usdt/tst.manyprobedescriptions2.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.manyprobedescriptions2.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/usdt/tst.manyprobedescriptions2.sh b/test/unittest/usdt/tst.manyprobedescriptions2.sh
> new file mode 100755
> index 000000000..8001cec0b
> --- /dev/null
> +++ b/test/unittest/usdt/tst.manyprobedescriptions2.sh
> @@ -0,0 +1,127 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# This test uses many probes and probe descriptions.  Therefore, the
> +# number of BPF programs to load into the kernel -- dt_bpf_load_prog()
> +# calling prp->prov->impl->load_prog(), which is dt_bpf_prog_load() --
> +# and the duration of each load are both increasing.
> +# @@timeout: 400
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/usdt-many_probe_descriptions2.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Set the lists.
> +# - The probes will be foo$x$y.
> +# - The probe descriptions will be foo$x* and foo*$y, for each $d.
> +# So if there are nx items in xlist, ny in ylist, and nd in dlist,
> +# - there will be roughly nx*ny probes
> +# - there will be roughly (nx+ny)*nd probe descriptions
> +
> +xlist="a b c d e f g h i j k l m"
> +ylist="n o p q r s t u v w x y z"
> +dlist="0 1 2 3 4 5 6 7 8"
> +
> +# Make the trigger:  Preambles.
> +
> +echo "provider testprov {" > prov.d
> +
> +echo '#include "prov.h"' > main.c
> +echo 'int main(int argc, char **argv) {' >> main.c
> +
> +# Make the trigger:  Loop over the probes.
> +
> +for x in $xlist; do
> +for y in $ylist; do
> +    echo "probe foo$x$y();" >> prov.d
> +    echo "TESTPROV_FOO$x$y();" | awk '{ print(toupper($1)) }' >> main.c
> +done
> +done
> +
> +# Make the trigger:  Epilogues.
> +
> +echo "};" >> prov.d
> +echo "return 0; }" >> main.c
> +
> +# Build the trigger.
> +
> +$dtrace $dt_flags -h -s prov.d
> +if [ $? -ne 0 ]; then
> +	echo "failed to generate header file" >&2
> +	cat prov.d
> +	exit 1
> +fi
> +$CC $test_cppflags -c main.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test" >&2
> +	cat main.c
> +	exit 1
> +fi
> +$dtrace $dt_flags -G -64 -s prov.d main.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >&2
> +	exit 1
> +fi
> +$CC $test_ldflags -o main main.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >&2
> +	exit 1
> +fi
> +
> +# Prepare the D script, generating the probe descriptions.
> +
> +rm -f D.d
> +for d in $dlist; do
> +	for x in $xlist; do
> +		echo 'testprov$target:::foo'$x'* { printf("'$d' '$x'* %s\n", probename) }' >> D.d
> +	done
> +	for y in $ylist; do
> +		echo 'testprov$target:::foo*'$y' { printf("'$d' *'$y' %s\n", probename) }' >> D.d
> +	done
> +done
> +
> +# Prepare the expected output.
> +
> +for x in $xlist; do
> +for y in $ylist; do
> +for d in $dlist; do
> +	echo $d $x'*' foo$x$y >> expect.txt
> +	echo $d '*'$y foo$x$y >> expect.txt
> +done
> +done
> +done
> +echo >> expect.txt
> +
> +# Run DTrace.
> +
> +$dtrace $dt_flags -c ./main -qs D.d >& actual.txt
> +if [ $? -ne 0 ]; then
> +	echo ERROR: dtrace error
> +	echo "==== D script"
> +	cat D.d
> +	echo "==== output"
> +	cat actual.txt
> +	exit 1
> +fi
> +
> +# Check results.
> +
> +if diff -q expect.txt actual.txt; then
> +	echo success
> +	exit 0
> +else
> +	echo ERROR: unexpected results
> +	echo "==== expect"
> +	cat expect.txt
> +	echo "==== actual"
> +	cat actual.txt
> +	echo "==== diff"
> +	diff expect.txt actual.txt
> +	exit 1
> +fi
> -- 
> 2.43.5
> 
