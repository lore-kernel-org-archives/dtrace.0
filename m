Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B5CFBEA
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719540224; cv=fail; b=qNIJ+SsoWDckLXD6R9x/Nrxv5qwduMI+600EuBWi88ACOe6z9BV8e3drqDjNxTdWJMzj4GHRljIHH9PC+dToFYF8qEZbupYeZBxB/RTlmJfsjAoRmq4VAKHHxknCHnbMfF8fwCA2xdoap7K98fl4Euya90qrE+Xefhvbz88oS9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719540224; c=relaxed/simple;
	bh=i294D7hCNFG2MHAmvrNlfaj8aRpJpgYwjhLQONi1vxQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u8cbuHeXvWWS6lfxhcdL0EKK8U9zg7aG6zSVJPdM8H9UTy7VRoGn7bpJTCGUSKkQWQxko07woP9Q94C+9qL2MR3zXeTRObT4nFQQU8IThQ9dDClz/YNQtGx0pzGuYSQZDw8MLCwEyC5/krmD35xGg0Kf5Dqf3muYacmR7fEcbbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XoiOq6ah; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gi4+SpIa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XoiOq6ah";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gi4+SpIa"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RKBVJG013620
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=62/o/uv288FWvc
	l6JMEEkPTgUh16fgvC2iVwU2Tpufg=; b=XoiOq6ahIHzZ2jvLwDnL4JBmsSZRrh
	3JJudteq2Cs6O4obDwFEmu3QdhsgUQBIavo7TrJJ4lPXnu9s7gnBn0gTpx2lv9dc
	n8Xy3MtoE2wvJWvK8laYRsZd/Skh0eMTWbAf81Gd95VPQIsnmQ7X87Q/Qugn01rK
	keBD4Ck+mZqPyqDKzGZrbLuJ/Ls1QjdTkxMcGMYhF+Ewel3QyrZjbw3QswPATV8r
	4COlFkpV+nOyO2DdAADC7TPfBSZ8if4D4iwlSHd9Rvjz/SmOCL00QQFO4sngGcp8
	1bIVKpMHS6fej9iwX0KSH90FH3tl8RELKJrDBm0p8WXFNrLglTXtgQcQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn70f95j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45S16ekd017835
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2b4na4-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8d5Xg5vTxTFZj+HyxotIx1Q4dD5D7is2xUID4fspZoAqSUeFPsgmrp2SSUoNVvQ3vE5vEMhVtP/OzCQFSW2s9OlE1ugnwd0PDx/ucdL69wOdAj4PR77Cde0/u1Z9aTJDNyPkeGKuUkhekOmAwxKdkfsEd/oVeXlxyp2zu2tdesJt66T/+JsJ8ukdVNhdyo/JgHU63T+jjaK8CTgx193Z4HxDp+pYC3H3Pzvor0hj47Kpf3VEELw7YKj3sil9jYL0kqN7fK9pDTzrMdFhoU8HeUvjlvdnU4uWAAHgjUAEW+JLS6a5ctJ5he7JogJIRK1kNoAUMtOyp5dWfPIDRgrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62/o/uv288FWvcl6JMEEkPTgUh16fgvC2iVwU2Tpufg=;
 b=XDF5NIsSJLj9vHd8jmywZtzprRAe5b0c8Ut1AK/9p0K6KmttLx5jkm4vTzjc8aAltCeZrQ10lli0Pyy/yQlkwXueWURF+kPb2zrYAg0ePzbouhY3ZquFXbyDvjBKj6Fe81NjMmguwMs5MMvNp4Dgho8oIcxYPLS2cXFyMlRTj4MhaoYCqBZz0x1LgSD1RJXnmwTYxMbToG4T4oxt1fRVSHkPbZg+oYgtXz+Dz1NAWTKix7YV/VYUq0Un6TSApSq+pF+BNlweivLXmWsjpdTZWAS7r8dQtOQSCAXY3ZmzbYJ+xIwapht7+uvXO6TpKmVgDwYu9Anq9n1QUtRLxjQYbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62/o/uv288FWvcl6JMEEkPTgUh16fgvC2iVwU2Tpufg=;
 b=gi4+SpIav3IiIbMvkMOjnGQPEyxDIQQ+wYb03ek99+f5wSrgNhoJ6VzXgvSu2C4I/DJroDwPtrvkriOk6IQHMQYOTgVwArSJUke5O1ahylplYOWFYU5sNPpvFhpgHhBUWsIiM9d9e+pvlIKOzvryiCZ7AqKl0fMFSRy2IfjR/A0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6671.namprd10.prod.outlook.com (2603:10b6:510:217::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 02:03:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 02:03:30 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 38/38] Systemwide USDT WIP
Date: Thu, 27 Jun 2024 22:03:16 -0400
Message-Id: <20240628020316.32544-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240628020316.32544-1-eugene.loh@oracle.com>
References: <20240628020316.32544-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: f50908dd-7f1a-4cb9-5417-08dc9716819c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6dQH76APdXTX7QziRG30ntMSrhMeyMFkcaOiXjEb9vdVOoxpZitRCUjyfXNB?=
 =?us-ascii?Q?xISW4cFv1VDYX7BJn9/pqI9iLxXQamMyoZGM5VgF4FxTHLlzh9Dpt9QylLIG?=
 =?us-ascii?Q?LAGS+j2ejmg0D049MmGj7zrZ0amtJEIBG8rw5s/wCGg/Fk+9SBrM9iBq7NxQ?=
 =?us-ascii?Q?QywxJht2YaUUA4wkuUqvMihqJsCSt/JRE6vq1AdDJrh8TprXJfbvSSBjZECB?=
 =?us-ascii?Q?U1j50Iy3vdP5+uYQg4U8Kh4Zyt2LL0tNm0YrXr+wrsEPvRuRSeXNkP79nqdT?=
 =?us-ascii?Q?ARp/o5muaMYlNUAt5sP8ZE6c66GK1NZyKVhMWtP5y6xoVbIKBCnxLZWqR/sV?=
 =?us-ascii?Q?LyFggLyjaa48mKb9lAEUUs7wHXwxSLjSzU/ZpluP97/MHtFWICGqFEimFUPr?=
 =?us-ascii?Q?xRr+ug7lhgCh2YQtNK3haEzkFQVhs4jQodhfRfB8NsNoAg/ZFegZFAAm7glr?=
 =?us-ascii?Q?tYTrVq9MjHZFoQxhFs6oUSbq2V+AW/LKGWqkYMMRZayK4OlX8ftM88xz6Aqy?=
 =?us-ascii?Q?wxzR/n0phGeDit2FbgLx3i/C4hK8dlP3nmfE80uRhtn4B1pUj79GQoistKCJ?=
 =?us-ascii?Q?PciUKpK8NQx3qx2WLb4Pj7EgFkkyJ7VVaWOkMvrrAzQpGR4eSlSo9Ohdiwmr?=
 =?us-ascii?Q?zQU1CASf7OwXOps2QvYwAzX6sQOi9tI8N790L06JEkPihYEQt2TNaAg+4WU3?=
 =?us-ascii?Q?EjZOt2SAwoHxaQBUkSm56/ViZKfyPEobZRpZl5mQZE2mLlpqnZMhouQQcpuL?=
 =?us-ascii?Q?Ntk9jwZ+T4dmbghgmmtyajQNHvY6puCfnYMFK3Jr2xscE2UEtJ089veo53Ux?=
 =?us-ascii?Q?RNYzygXCFpYeNYj9LOmbvBeofBlVUt+dBdfQiqOq+sQ9379HckUM3rp7jvnb?=
 =?us-ascii?Q?I2r+776PE07WM4X3gmSZ2ope1wqT9SHJYmLbTWps/Spup2Yfl0ggUIXgkG4g?=
 =?us-ascii?Q?Uc28BWh3OE5RkZXN6Myt3fcE5l4m18nYmXsMGMFxUloYRyE2LvhFysrUw1FC?=
 =?us-ascii?Q?ryWXFEq14gvi+HSUzcDjLJvo+VfvwTSlL0VqXC0rde78DjAfCsuqSoDB4Qiw?=
 =?us-ascii?Q?3FPrKQHuo+gh95kC8Y6nexUkw2+YuR8VD1GcdFGM0B9Z2VfVNnnrkj+5Xhzz?=
 =?us-ascii?Q?Xt2PO1RBqIK2r9RVX/DiHF3gyWRod/UgWyQRUbtzBbgHbiGKvunS/IQcgeT/?=
 =?us-ascii?Q?jhPeNH4tPAKEOw1x2ICVxx/t823hkYBRhMsMXnFYdJpU38Eq/Yn7wInL1qhC?=
 =?us-ascii?Q?sHI3dhMbdmAVvoSBjtMPn2AGWAl19EbAHrvLXVmOn0/FZBgW7Su0sd89Gv9c?=
 =?us-ascii?Q?lbttz1gn7zKG2NuS93LWNi5KsFBDtMO/RwxzIyvbBqruFw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EgSOk13R+A8EJVvZMGVED6xtUqICkLD4p7EudGCTktZTKhliUntUZXFKsfpU?=
 =?us-ascii?Q?uZyD3OFb/V0q7R1g6fqQQg5MVsjEBKnNJXq7HPeLQawUcVVvlHueymwxg49+?=
 =?us-ascii?Q?Sus4X22GlaKPc+VbGA8HCvVUMaGFORxwdRenyiNHChKjrQz1VPVmCUeqVx4a?=
 =?us-ascii?Q?aF27HhWItDTyJqTrCcpthnPqMSLLMdS6RqxSmt0y8YNpdNrnADi27rgX1kj2?=
 =?us-ascii?Q?hTTdWMW/er13k5b/KbImGwFdAVdU9fJpETLHFPdApyUcBOzLUX5DLi3TNG4e?=
 =?us-ascii?Q?F5lB4MbIfHnBZbGtrzxH++FLzLb7CBuTvuJoRDoVr9O4BATYgE1SEDa+GSxv?=
 =?us-ascii?Q?Qqr36/ChakBifjaygIZ0OvtNk/FxQqDSanWodrz3hHrEuMYl3prjDSgkOVXc?=
 =?us-ascii?Q?7hfHWVhv4ZTDaIrwwFDdOuAETbt7qvY4oZjQ0x7GKHJ2+277dW0Qh7fNZ+I7?=
 =?us-ascii?Q?5jusPHqUZu7LkdWUASOR13QUwO4yC0fpZYqGcWjM1MSYNlrtYVRFuWJxPVMC?=
 =?us-ascii?Q?LW/dNwE8+ZVvkCzSc23rgDubZ7Lag9aLDWDJsBqLplCRITJTPd7SbomEQjHI?=
 =?us-ascii?Q?QV4LscTEgWGKJmDh7iiHfHUoesTgJfxlVAE/B4slroBhwpSOv/FrPul7FQA0?=
 =?us-ascii?Q?/P8hGr6TEpSRg26J1XKrm3b9UQUqPswM8vFGzq72WjMu5B/+4Dg5fnOLYNM8?=
 =?us-ascii?Q?eRYWkWe8kvRGp/wRdao69/4XNVS8Bm1bw/Ftl8FaNcnsuUtFavXnPuZTaV4b?=
 =?us-ascii?Q?zGP9DbdWuLtZwgknZrOjX0i2ShFYBRBvW08AJmnojQDFaKMQ9sepaD4WKKGY?=
 =?us-ascii?Q?6pIQ0XLkQcmDE9bP2CdaqaJ+jGTWj6MMmgRGkHeFKcXoUxMIJXW59vOfidyY?=
 =?us-ascii?Q?4EWEMUJb9rUhukS0sBAYhWAKpPycViKDMZglav1+DCKeXIYRYXYHrMa6rsof?=
 =?us-ascii?Q?cOxJUODNr2XwYCOomZV2p4zzd2sLsWN6q0v0FrXjN8LpZ3VbsffElumVp4GJ?=
 =?us-ascii?Q?5GFqS9S2spzy6RVhpwnG606iEWDSDUSuTqpXl54L7KPvs1HrM1F4NqgqwVOw?=
 =?us-ascii?Q?gl/46+nnaymhqKGQCOYNpedRqGSeFPFBt2vZiplAzSCqhwCebDKE0Tg43K2y?=
 =?us-ascii?Q?WJ50ZSutTSqz4kdoWHGf7nt2Q3bpc2sR6RXUv83FxwoW0NjPKrqksfY1yQe9?=
 =?us-ascii?Q?Att7NhYnSbfhL50Kh7VYhpctO9yH9qvSVDe3JBhpBMRZCHMrtZOIFur6ObW4?=
 =?us-ascii?Q?ShvzQzBCQQBkxbE7axx/1tIYO0CuEyt22FnHCXBr+VSNY36CMnoi7kx4CtoS?=
 =?us-ascii?Q?S60H2uKUpESqadEhiYeGdWU0XGKjWTE+wAOG0VpHSCYTdquSBscLVB0fg0mo?=
 =?us-ascii?Q?4Q7xcL7MapDb4Mx+9zIy3D4sI/vx4wB9Lizlh+QBNpGnc5NW8MUFAYiiwxUZ?=
 =?us-ascii?Q?7T32wdaPk4McQRlMkToY6Z3YnJM+eTldO/BxbOZdwWXRh6g+0juhgFz1EDTC?=
 =?us-ascii?Q?qEFnlMPXjQp0ouXn4lsMASS0qmd57dSYdINNJH5YOFD82Te/4COKkjv5OoWY?=
 =?us-ascii?Q?0CQlzdSO/HKhcnTUFsaMMQdpv1fKxgxZI1r5p8F5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fXwmbaO+3Z3gyHhVoctsnQRwBRDS/4CXvD7YVTj1ctLIfu1j34esE2H5ZduM6Hh8ZYbdoY/+pf3lB7aLLaRSp74mxSxzaszQJWeHRGfVel0DRFEPQuXuJ+wq/j6L0CoIL4mdnoY7CkJru9u8dqyrED2zVAGD7o+Vc2aQ8Vdjuz1c1Aa5Ok5ODnu4+R9viz1UYWO5zuxqiDMd18u43tM1Sn9ctZdbSWvHDfwH+6ky6z/8H4L2Ssk5lXMlrujqghQ2Y0/zXNC+Uifjx0OJW4Tw+clOehpnD9ikyW52DahWrxeZalIpUujskobToy2lvkk4RmUxChlLsWcPYN2ElqKhuA5SWa3lqHTkZsCaxMLDweN6taFtJczi85V2h9TuIA3edehgqrQdFE0X9V0Sk0iINkpG3kWhDv2Gs9QuMu7mng1ocxy/v2ERm66GZSbc1JKdGtKSHTRn2uhCkquAoCc7vvVhsZ4FHSloxAJ3a/p53Rj9DrVic0uyX4S76sr96vN45eOra02L4TaiGIitsPzsEPPKtRvrYua134g/Q4vstDm55STbi/v0hlkRl8jwxPMZhnUDQ4z/kuqmG8g6mdoA9zo0hTHso/8zttG1UPf55dg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f50908dd-7f1a-4cb9-5417-08dc9716819c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 02:03:30.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jcw9pP3yvLhu1DoKHkRDCrKx/BJPGmKZmMfeKs6DEKqap3fQ3NUrWPrcB+I5qpUyNZXM5b2GyWo5UrOLeQCCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6671
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_16,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406280014
X-Proofpoint-ORIG-GUID: 2_Jyu9tzlsmQqaNLPjbZBH6YfGTE0vtK
X-Proofpoint-GUID: 2_Jyu9tzlsmQqaNLPjbZBH6YfGTE0vtK

From: Eugene Loh <eugene.loh@oracle.com>

need to:
- review tests
- handle globs in dt_pid_create_probes_module()
- add process monitoring / inotify
- deal with FIXMEs

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c                             |   3 +-
 libdtrace/dt_pid.c                            | 132 +++++++++++++++---
 .../dtrace-util/tst.ListProbesNameUSDT.sh     |   1 -
 .../dtrace-util/tst.ListProbesProviderUSDT.sh |   1 -
 test/unittest/usdt/tst.forker.sh              |   1 -
 5 files changed, 118 insertions(+), 20 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index d09a9775..3f316775 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -278,7 +278,8 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	 * and tag -- we just have to longjmp() out of here.
 	 */
 	if (pdp->prv && pdp->prv[0] &&
-	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
+	    (isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
+	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
 	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
 	     pvp->pv_flags & DT_PROVIDER_PID) &&
 	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 996543b1..f964b2c6 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -605,6 +605,9 @@ dt_pid_fix_mod(dt_pid_probe_t *pp, dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	return pmp;
 }
 
+/*
+ * Create pid probes for the specified process.
+ */
 static int
 dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 			 dt_pcb_t *pcb, dt_proc_t *dpr)
@@ -702,6 +705,7 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 
 	return ret;
 }
+
 /*
  * Read a file into a buffer and return it.
  */
@@ -780,8 +784,8 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
 /*
  * Create underlying probes relating to the probespec passed on input.
  *
- * If dpr is set, just set up probes relating to mappings found in that one
- * process.  (dpr must in this case be locked.)
+ * dpr must be set and locked.  Just set up probes relating to mappings found
+ * in this one process.
  *
  * Return 0 on success or -1 on error.  (Failure to create specific underlying
  * probes is not an error.)
@@ -795,9 +799,6 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 	char *probepath = NULL;
 	glob_t probeglob = {0};
 
-	/*
-	 * Systemwide probing: not yet implemented.
-	 */
 	assert(dpr != NULL && dpr->dpr_proc);
 	assert(MUTEX_HELD(&dpr->dpr_lock));
 
@@ -1094,22 +1095,99 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 	return pid;
 }
 
+static const char *
+convert_pidglob(const char *s)
+{
+	/*
+	 * Convert a glob for "pid[1-9][0-9]*" into one for just the numerical
+	 * portion.  It will always be a subset of the input string.  A NULL
+	 * pointer is returned if there is no such string -- e.g., if the input
+	 * string is "foo1234".
+	 *
+	 * There is no need to check the entire string for legality.  E.g., if
+	 * the input string is "pid*q*", we can simply return "*q*".  Then, this
+	 * string will not match any "[1-9][0-9]*";  we do not need to intervene.
+	 */
+	const char	*p;
+	int		nchars = 0;	/* number of chars of "pid" we have seen so far */
+
+	for (p = s; ; p++) {
+		switch (*p) {
+		case 'p':
+			if (nchars > 0)
+				return NULL;
+			nchars = 1;
+			break;
+		case 'i':
+			if (nchars > 1)
+				return NULL;
+			if (nchars < 1 && p[-1] != '*')
+				return NULL;
+			nchars = 2;
+			break;
+		case 'd':
+			if (nchars > 2)
+				return NULL;
+			if (nchars < 2 && p[-1] != '*')
+				return NULL;
+			nchars = 3;
+			break;
+		case '*':
+			break;
+		case '\0':
+			if (p == s)
+				return NULL;
+			if (p[-1] != '*')
+				return p;
+			return p - 1;
+		default:
+			if (*p < '0' || *p > '9')
+				return NULL;
+			if (p == s)
+				return NULL;
+			if (p[-1] != '*')
+				return p;
+			return p - 1;
+		}
+	}
+}
+
 int
 dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 {
-	char provname[DTRACE_PROVNAMELEN];
 	dt_proc_t *dpr;
 	pid_t pid;
-	int err = 0;
+	int err = 0, i, nmatches = 0;
+	glob_t globbuf;
+	char *globpat;
 
 	assert(pcb != NULL);
 
-	if ((pid = dt_pid_get_pid(pdp, dtp, pcb, NULL)) == -1)
+	/* Exclude pid0 from being specifically requested. */
+	if (strcmp(pdp->prv, "pid0") == 0) {
+		dt_pid_error(dtp, pcb, NULL, D_PROC_BADPID,
+			     "pid0 does not contain a valid pid");
 		return -1;
+	}
+
+	/*
+	 * Try pid probes.
+	 */
+	asprintf(&globpat, "/proc/%s/map_files", convert_pidglob(pdp->prv));
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+	for (i = 0; i < nmatches; i++) {
+		if (strncmp(globbuf.gl_pathv[i], "/proc/self", 10) == 0)
+			continue;
+
+		pid = strtol(globbuf.gl_pathv[i] + strlen("/proc/"), NULL, 10);
 
-	snprintf(provname, sizeof(provname), "pid%d", (int)pid);
+#if 1
+		// FIXME: omit this check once we have confidence in convert_pidglob()
+		char provname[DTRACE_PROVNAMELEN];
+		snprintf(provname, sizeof(provname), "pid%d", (int)pid);
+		assert(gmatch(provname, pdp->prv) != 0);
+#endif
 
-	if (gmatch(provname, pdp->prv) != 0) {
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 			    "failed to grab process %d", (int)pid);
@@ -1119,14 +1197,35 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
+		// FIXME How should err be handled?
 		err = dt_pid_create_pid_probes(pdp, dtp, pcb, dpr);
 		dt_proc_release_unlock(dtp, pid);
 	}
+	free(globpat);
+	globfree(&globbuf);
 
 	/*
-	 * If it's not strictly a pid provider, we might match a USDT provider.
+	 * Try USDT probes.
 	 */
-	if (strcmp(provname, pdp->prv) != 0) {
+	asprintf(&globpat, "%s/probes/*/%s", dtp->dt_dofstash_path, pdp->prv);
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+	for (i = 0; i < nmatches; i++) {
+		char *s = globbuf.gl_pathv[i]
+			  + strlen(dtp->dt_dofstash_path)
+			  + strlen("/probes/");
+		dtrace_probedesc_t pdptmp;
+
+		pdptmp.prv = strchr(s, '/');
+		pdptmp.mod = pdp->mod[0] == '\0' ? "*" : pdp->mod;
+		pdptmp.fun = pdp->fun[0] == '\0' ? "*" : pdp->fun;
+		pdptmp.prb = pdp->prb[0] == '\0' ? "*" : pdp->prb;
+
+		pid = atoll(s);
+
+		// Check, since dtprobed takes a while to clean up dead processes.
+		if (!Pexists(pid))
+			continue;
+
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
 				      DTRACE_PROC_SHORTLIVED) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
@@ -1137,17 +1236,18 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
-		err = dt_pid_create_usdt_probes(dtp, dpr, pdp, pcb);
+		// FIXME: How should err be handled?
+		err = dt_pid_create_usdt_probes(dtp, dpr, &pdptmp, pcb);
 
 		/*
 		 * Put the module name in its canonical form.
 		 */
-		dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
+		dt_pid_fix_mod(NULL, &pdptmp, dtp, dpr->dpr_pid);
 
 		dt_proc_release_unlock(dtp, pid);
 	}
-
-	/* (USDT systemwide probing goes here.)  */
+	free(globpat);
+	globfree(&globbuf);
 
 	return err ? -1 : 0;
 }
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index c5dfc72b..9d8f06e9 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 644da2ac..6eae82ed 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
index 7cfa9eb5..92513eb5 100755
--- a/test/unittest/usdt/tst.forker.sh
+++ b/test/unittest/usdt/tst.forker.sh
@@ -7,7 +7,6 @@
 #
 #
 # @@timeout: 120
-# @@xfail: dtv2 USDT wildcard
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.43.5

