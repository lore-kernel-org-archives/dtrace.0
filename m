Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD01A3BAD
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733652; cv=fail; b=MrY/ujHB+Tb90ADKMoSxv1+1ipE1oqUaBdTsZZcXzAKk5Fo5LXrlSWqJMkyg6fxXkS65NpE3L6h10/QoLcNfSAsf9ZLzxB+abX32xuX8gYzcVe38urSXJc8yocknqiS98JMwqOz5DKVa7zzGCQ3okpa/fu4OSmazYrqyfipgTps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733652; c=relaxed/simple;
	bh=XoD3prZ0qneBsGCg9ypdMGglW3M3Q+ILXq+eKESfnQc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VWKsjUg2AzBt6dOqwNvARlG8cBH7zO5/n+BaFR1c7Gvbwh4ANKT0MPwVIvLslWoQgtuWp2tekIigmLEGEHWJuQzgakgvee79xYNMCVmDSYA6WIV4zLbnNfmeEV3z1lY+ZNpv+amNjYZj5TGZjHZ60qRNGDR4JiM1njC8p6VMiuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F6Xqwnwm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GIvu2T5k; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F6Xqwnwm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GIvu2T5k"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMNjdX019594
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=J1cJw4VPEXpBxoyE0T
	W1ajaqW2Ju0nH48ehQNaIi7XE=; b=F6XqwnwmdCV4lIThvt1WlIho6Ykd1tQ0FN
	ThtYg20z0Ta3TdPnYJLztlVNQEtwjkEfwRU6242hsgOYGjbpUcMqxFlXNSrXirUS
	ml2lAuc5N5oo3TF66KwSnuTi8E0a4udiW/EYgcA2/NwoMR7iJMVakMBUMA9zkVKn
	r8ovoqQP+i3qonb74k2p0C4H143C56cGFMq8707vBXf91FCgMpuF4gIVSiNbUi3K
	fXt7ulS5TC64/iOWu/Q2lE8KG4rydm06bYAZuC8ofzTaoCZfSVYM6Hm0M0vYd7Or
	TwWhwiQ8FeAvgjzQbkSZGR0kWwWhRa27o8s8ZvW8Yd/DPjlDWa/g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43jaj5ktx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKKVA97035705
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:29 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fcymjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3tnNsCC8B+iTDzUc4GEGKL9GQNgCFNJhvF0sS6mGcPK0EIHBrlD3nWuI7twKtmQvjSHU6wpBRI3Tpw0a2lcLjalDJ5spfFvOZTS34qzXMSFD1JVfZ3CVLqfrlNzcJzv5sKmQ8Np2DPza3vgFYtzX7GuwhQK4Wc4zP5hoqPmm7JOAjRfGGz5s8cTXvl9aqiz/XAXKwAoevxBdwqrUU4Rm2bDJs14iB8c8S+YOZ17+b9tulQiexV9+7QkmvmZ98tP2bKxwUUB/fhl8UgfdwRcJpfnNgSLcOUQKsZAyqZsImCUNcqF3ygg7Q8y9gHNVFPIGb2MAgwyg4jNg+oaMHg62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1cJw4VPEXpBxoyE0TW1ajaqW2Ju0nH48ehQNaIi7XE=;
 b=aZKpioex2s5S5Ged99Di3xaQx77kL0ATGUyl0aHi5dTlW6+yJM4jsScQVgAYIrwVVyEfNWo8CqDm0T8HPu+yQUfje6js1TRlisIjed1Q5Eqe+p1IUGpDf1Tznnpm2PS6+EHe1JdHnHw7ILRv/oO1yksLFF1gJXlUHTvQkGHVsXhl6Hq31tc3h+cXP3jxEJumFzVQ62pu27v3gbXGQFe1nje0940kJB0iEVcpzyRIvDSw5NchYe3syHCcDXzB9FDoQqrLEMvBv9kre012X9D/Zr8xkRZ3b+gCHoxwaXajLZv/fkqxZzmI5jbxopo43IinHTu8FKEnXsYKN5rlLlwN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1cJw4VPEXpBxoyE0TW1ajaqW2Ju0nH48ehQNaIi7XE=;
 b=GIvu2T5kgRpWY9RQQUMyOIroVkfFQwi/9T+v6+0oCLoRPoq0V2+3mAlTycG5Kmmr95TZlZ8nXgr+CWBKzvt7wTfIKVY89YnPYtH/O75on5MdX9xhtHn0MYK0klSsVF7CSpdYGytFM7Pl5vL3b/VBsou2ujWi9Ns6zjs9lgFhDd0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4594.namprd10.prod.outlook.com (2603:10b6:303:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 22:27:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:27:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/6] Use prb instead of psp.pps_prb
Date: Fri, 20 Dec 2024 17:27:12 -0500
Message-Id: <20241220222716.18511-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241220222716.18511-1-eugene.loh@oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:408:f8::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 0725185e-d921-4bcb-a1f4-08dd21457953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vni7jw4Zwui+RRRgGsL4MyprGdeRl8B1qdH4u9NW6ngNqfMjlpWAtYw6uxYf?=
 =?us-ascii?Q?Z8mI3i1gqf+ASu1SE5/XQ/0qlX6xUMrN72aUaw0eRIdhmPU5Pu6nwi9rpl1r?=
 =?us-ascii?Q?8uK4i7nOxKKOXF1CvR8f9oH9KmL8cmJGyvS7NQiVQCn3ElWMhgRJoTj7Eid7?=
 =?us-ascii?Q?TZlaf9gPWXyaKqslG80FVJAOsWoClTIoc5kv0IGkUK8C3oCU6QUzCidiJuxP?=
 =?us-ascii?Q?KZQp2egRm2Sc3QagABgIz1V7frvTFOcHzDqkNDipESleZdc8j5LzSuOCqZAO?=
 =?us-ascii?Q?dLaczzBsmqhzsl3psm5WZAd+u9X/KrW1TK9W9dpbgOk3QK8rJw4u21DonZTA?=
 =?us-ascii?Q?tZ99+YJQF2xtKhEmkOJKSL0o1EDXmi4wJBfEKLAopHMgnDDuv+UkYA1zmzHl?=
 =?us-ascii?Q?CmBv1Z/tu+UOQLKeIoNH++XNZAqnb+uXMA6mxoDpXTxU/X9Bls/lsbPS5e6R?=
 =?us-ascii?Q?SwMQt246Fpb8TtNkx+nDxD9wxc4h+515sQoc2kCHZIst/5YLSnndr+BEdAjw?=
 =?us-ascii?Q?ksuDxuxy0noxplc+tJpA+AjHqWPJesChEbqPnCAaknnseRHlAJ3JEkxxvBog?=
 =?us-ascii?Q?tVgfkwXAXnQ6JmSyjHc53jfi1tQ61I5N5V9B3pprs5AMIoa3BeqSI8D6oees?=
 =?us-ascii?Q?Aaf3jovx8Hcc+iQqBCYzbt+dbgjZeoRbPXI8muE1MJHHF9eub30z23+lPpWV?=
 =?us-ascii?Q?9ga5a9Nhlb/jsLqbxtt4lUpZrNtx75Vc0A/Bhna54myj5ttn1No/4TEfU1T2?=
 =?us-ascii?Q?Z+G2V3T2Eb/G6zamZ+R60uWj0w9xI38AUJ/hsEBVMEFWXSpzsCjvsVEE0yYl?=
 =?us-ascii?Q?nFZb07mM8RBrcE7C7KxcEQqaeT3Ubr2VwsJOuMmtRu3czCvvlvWBYkTzm51i?=
 =?us-ascii?Q?RMEJAIlMlFKuay95uC4DGRwh/CvSGVY70sEiV+Qqk3sFZtTxkPlgU9BJjFK9?=
 =?us-ascii?Q?+YBfRaEjJW4shADFjCpSmJ57TnxTYOPDT+3WN0Re2GO0Uzee5jTBHK9xda1G?=
 =?us-ascii?Q?hz+WIr9ZISbl8+sgc8tP6AXqIKq7zC3qnmC1gObwHMXjqy9GpY6M4qXXJzaN?=
 =?us-ascii?Q?5/Mia24qnnrJzFUzCCAd4s/QTdKz7cb1/i69BwAq5F5SUUnWmEeCrnwnAwMN?=
 =?us-ascii?Q?6pXFIjrju7HG7uVc55I61MM1GJ/jLwxpa5t3MQiwtyhb5Yk6si6vVDEa/fTC?=
 =?us-ascii?Q?h2pEoQNR0eeV6fvRaHZfi66CPhYk8ANtHhMbI3EpyqeG6jMDeOS3xFZ6saci?=
 =?us-ascii?Q?UYPPam1tFCwjD/60qQhcuhUV1bgPxMkBFucvpj3Ci0b3jDFJ8ucEtbm9b0fY?=
 =?us-ascii?Q?0dSL7rQ6pcPIxW94uxAUqjLnjgjM3nsdKRR7QWftJ+2hcF+o0CTB+W2k00ZJ?=
 =?us-ascii?Q?gYsNg1ktZHvwqFHnVNX25TvA9LDZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5SU9d8pTSnWV7vJILe+LCjMJoK8GvtWLfF47lhFI7gBlf4Vxq4SsK6/Gjsu0?=
 =?us-ascii?Q?O+bWNCKsChCE/G7VHC8PQZGp6efpbLJVRzOJ5xEiCt9TpuD3klfrwe5Zzxcd?=
 =?us-ascii?Q?KrDFUcM/RBvND4qhIuKEqe08zSke6rXAWLczKHC/80uO39pAWC/gCooaN9IV?=
 =?us-ascii?Q?n2T1UJCdIP3DWzch4zLDaRtit/Iz/JKN6QuGW+v3ePuRQefrvlCbh+/LZ8aB?=
 =?us-ascii?Q?01kdVLQQBSgh6WbZzPCAUXnLXES3hvNGoK9z2vu1AM3BLGug3GuiYWfh0ZMC?=
 =?us-ascii?Q?FptkFtzDR9HPm0UeKffZ4lC7WAeF0VvnBIJeeEGY26lU2huXEwKL3wDWPQj+?=
 =?us-ascii?Q?zu1zTW4wMJlov3C4qQYxFJvJSnjUmLJoHWQrStz8peJUyZi4oLQ52P6lbKcF?=
 =?us-ascii?Q?UfSl5tO1H0FPS3Y/tK0VDTglsofO2gRO9VPqnMtXhv6g5TUR3mHeONAm5yWQ?=
 =?us-ascii?Q?Y7aht5nyUqM3vFPQAaOMN8tA8x7i9UXfEIs43Uxux4dvELompI1rNLC7wRyI?=
 =?us-ascii?Q?TMuWOGYeODvvBGcWtKkMDZI9kekjsN/WDRkr0c8oNkrpm6p8gCta/qDZD5V9?=
 =?us-ascii?Q?+GZCp8fmMpMvIj4HcUHvm7lz0waHQSyu3eFpLR+dXos9mc9c1djoAssOqCkz?=
 =?us-ascii?Q?+e2Eezrs3Q5o2VVmFCcRvjsd4RC2f2JM2tjTkJQ/hDse2Ek4AsSVIjY0grFo?=
 =?us-ascii?Q?g2899W6DVz3YVpfxKswr5Oj/XedFp8UIx/mgWJNujjrvOb462MuWMFCirikU?=
 =?us-ascii?Q?A/th77gt2AnGlnzI3s5okgQqzlIiV3rguqspF1mXUc5dSxjV55CRjbCdshbV?=
 =?us-ascii?Q?Bjpy/DCNRHtKn1T6fwZSCOe6az0DgJvZi3uF4d5vsA1QYjG37M01YWyPhvLo?=
 =?us-ascii?Q?4I8CIqnejRjARBzg8Q94Cmaq7Z0YZ6QE9StfByxeRPWCGWNpJYUa2BLMDFv8?=
 =?us-ascii?Q?wli4Y5JiaTpyuQLn+ixbSskEgcig8zRhVwiJRzEBY3hmao23fv+J/ixwP3Jj?=
 =?us-ascii?Q?LM+nvqg0fBXJZw4sWCoHg8R+ZD/50qgAPkP1n8TVhkdxXSx4XE4Bbgcyaawo?=
 =?us-ascii?Q?i4bVE4tB0qiHltmoLDAgR0Tq73qHXVVLY7lvv+R8/QUbngZR4aIJfnZ3gpfu?=
 =?us-ascii?Q?Y+ZNrh9LiUiW3JveXDYDjRKKuSCkRSKRyq1E/v3LFCYHfu2n7bFvt21zk6K3?=
 =?us-ascii?Q?TCZ19uHlTarrAoUlg9MIAJWDCEtbZmBgkj79mDE/CvpHwiA7SssAV/tRi3w7?=
 =?us-ascii?Q?/AtI5ps8pWCKqXjC2qI9sA6Ygg6S6EAV+geupE98e1nWurTWCxgkl5ORYrYG?=
 =?us-ascii?Q?tIhFfBrQFL+yIdVE0YD4RJHTIXGahAjrWqp5F7hzVSqVdOWs2SWU8EuAuqnC?=
 =?us-ascii?Q?FLxYnx46qfUMUOSxSHSOxFiBPfY7/dydNmCfqyl3tCxdZ8NwfI9jkgQZgkXb?=
 =?us-ascii?Q?taQU22iZeBVx74hzzaeYDJUGhN68lUTVSRceDdHoioPzl/8hRhcKAh5DhElq?=
 =?us-ascii?Q?JEXy8A94b6AbXaKLlkJ0PR/ZCwza0pZ36RLe1yH43xJOHCBTSYZjD+P9fXZx?=
 =?us-ascii?Q?PgX2vlYzg9giB/mXJsJTR3mNHN566ykCX8i+ZWXv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/rAAYuLIRO1DoU+eqNllhHT1hQihI2BlHerF9J2R+ZAj63vV+fCcjow/BiNmvqJp35u4HAiZP+OyT0jHQhlBYVjkCxu49Aa4T7zYE3uDfFYmqncct0NqM6DfTxtbcRRjCU5e9A9cZJulrsWwQjJSUsdm5voQFDB+x7EPp/qOkLqs83DfR7LJ5/3DvLfPhybDsY0bp0MKoTgkg/nc6oL67n4Vb4298eHLA5UawhSyRfJxjlUvunGoO2NzZ1uwbyaHRV+TNDVhUAO303IbByXtHpBUNRnhzP9HLyhdADdzanIc5JTnEy0Wf5++dzD4w6IZPbFtGyE73VOJABulzvVD1MUlwJQHjA6SAILBm7ol/k5srNLq4hqln/w5ADRDpFwtbhCpAMPAH67POqet3TYL/2mlHgeb/eiqNExevfzQAnZrSZaCCbTL+s7L11PXGi8Csn0gl3CaF/YpzCqpBoPR6GQujkov+nWw36KJ0TaApf2rH6KJTqQayusB6FH/WL3PGxxTtoGMQGYyLfln9iNOLBhhrv+GWsYVnvJAQAM+G006TOL5yyLUL/XxLU/7Yb81Va72CH7zS+GfYOS5IXyzw5QvHi9f8WvakZzOFIW8BJ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0725185e-d921-4bcb-a1f4-08dd21457953
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:27:22.9203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rd1gMb8uMhNifFUYDIhkxKX6AR/Y3nLiHA26al2R33ZprpQ3X1VH9FqIzs0A077coN2ZmKQK6sgcRx0AZKIatg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4594
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200181
X-Proofpoint-GUID: Y1h2-jwHNEuwlcKN4HzTDKi6AhCQT5VP
X-Proofpoint-ORIG-GUID: Y1h2-jwHNEuwlcKN4HzTDKi6AhCQT5VP

From: Eugene Loh <eugene.loh@oracle.com>

Replace psp.pps_prb with prb, both because it is simpler and
more importantly psp.pps_prb has not yet been assigned!

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 2331d1aa7..27cd7d13f 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -995,7 +995,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 					     "Cannot get name of mapping containing "
 					     "%sprobe %s for pid %d\n",
 					     tp->tracepoint.is_enabled ? "is-enabled ": "",
-					     psp.pps_prb, dpr->dpr_pid);
+					     prb, dpr->dpr_pid);
 				goto oom;
 			}
 
-- 
2.43.5

