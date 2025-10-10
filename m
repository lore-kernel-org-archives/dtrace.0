Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB34322A817
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760066027; cv=fail; b=YiP6DsXhZN9ICNizCWeaoUqM6/4DIG+JqLsmVzBLwhAqPMrxNASFnY+DoDgdQhoLPiX90gn13E+KAt2ZsKYP9YaYkdAYYlgUXRdKW3Z/0zxAIaCsdYV2PeeZh+06V70zd+LKOAEZZXXC55ePGb25lirP3ZJBwXvt+KCs32phFok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760066027; c=relaxed/simple;
	bh=TkPsKDe9ZVU/dM2bl093ccUXB+3RFNwdBD4nP8lH3os=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MVJsBsaYpU+ul2CC7rhEnRc6+1KjrSOr5tLHL5b86f0F7LgHy/LFFWSAhRnKT+S2vw0LvoqF015wwBKNW9V3JqSd4HsiHLNGU278r0D7uZdAIsVI+bnFvXPcJkIhZOqevX33zHPB4FseGCpifWpYRBQmnUZkKd3Yo8JgXRAL4tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a4GpTB64; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GLwGzdVe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a4GpTB64";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GLwGzdVe"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A1NHaW022646
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=choVjqngBd6sv8QE98hESPVB1Iu1GS1sUSrAVCHriWw=; b=
	a4GpTB64f1tjxs5JwRFWJgwtVU8aX6lgWyeY8eQIb1jyLpb22NtDR33aYIuw2GJ4
	RHtXsW/ELm5wWuTmFvY0circp+VzXnOAEDkYNw2damhREJKV31tSb+PsgB9eooAS
	+HL8+Ly0zj7ePJ+EVfWb0w15auJfnW+3Ufu3Ke81fi4CYMdPcAVIKXtW5lARrv+l
	JpEMyQnwovUaB0hTHjB8dpgtv7+M0FKn3HTHFEBInsuVi+GkVD3P5FVWoSTaDrbk
	9Deq0abfVw2lWvUfQKaLVM4DmFdZR1MuF+DGr7Q7/Le1b9UMxE7kZRXEWogDQUlL
	KG9aw2UcwOcRxUsY9vOIlA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6cavn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:13:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59A1Ov1N029092
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:13:43 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010036.outbound.protection.outlook.com [52.101.193.36])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49nv68q52h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Oct 2025 03:13:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BF/+26FicWYq7W69BjCKZzrP72QNsvJDh92f895HB2AilQvJllzvhOARfbI67v7zXZX5a+VmDhxfBmALSIr0tm6kObRi3qJcB/PvEqMnRHltLrkbpT4V0d31uBRyzNebXVK2HkYuJu8tt510nxeEhWVXqNFY2cCy5LUaIa/GUtySYw9zb0U2c68DHyDFZRCnAG9WEZsHN4f5Kyny5O/0fDCHwIGHmu7EuFQcHZRGYOuEgDamnwe+Zk0ZLJAwSGyQYGKIlbXSvYxfWK9bWtX8Y9MDm9t6x5BEyrovGT7rhfCZTUhdnfksc1F3IukfK03xCELom5dCnhF4eNpVEeAXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=choVjqngBd6sv8QE98hESPVB1Iu1GS1sUSrAVCHriWw=;
 b=dqNPbjlydXUK9ebj27u/l14SAS9bWtnVkqg/7SGjJJuLW3VSs4vqWwuJg+1kFKtqWxLVpvazy5M0iawE7JHifhsPmwXXZEywThuXnjB52PaGW1DuTUoydKRVC2KN5YofBGWzpWMAFBvWZlsc2ir7/aY9jmNJ0ZMZtV3jLvBQRm/XVnzC+fsns3yhjJ6jOB7QM+17Gl47fG2fI5xvQ4cOxynFFE7TKZSxvGf5viuKC8XKDgb+fN0q3UicQeSrN4Rrc/XiEHKHx+UGcslQ1RSmS00TNztRBbyL+xLbKbZt2G1EMXKlN66JsMat3eWlzdCOgzDbgb19b0upcThIK4LWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=choVjqngBd6sv8QE98hESPVB1Iu1GS1sUSrAVCHriWw=;
 b=GLwGzdVehZX7IHb34omaUcSG2edwN93r15bSAAcAQ6F1UxGpl1hhZzZGUntQZN6P2szSDGvjXdm/sKOoRb2Uil4Cjw5lsaD+TPhv9V7brqAhD9A8EWlk861YWbiWlu9RUTN1e0g7aQSirf2be4CImnm5fqh3ztzaJgntIZDrwog=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB4940.namprd10.prod.outlook.com (2603:10b6:610:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 03:13:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 03:13:41 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Account again for variations in error messages
Date: Thu,  9 Oct 2025 23:13:38 -0400
Message-Id: <20251010031338.4016-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:a03:54::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: b2111c61-f2a6-4bc8-b8da-08de07ab033a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RKi7oYV2Lt4/+Nz489tX9HmAcJbFGmaO16S9qPTDb4mQ9T7P3ps0ZIe5WN4+?=
 =?us-ascii?Q?WB6T5LzDP1ecKNNmbEmFLlgWo+aPOZFB6g0OvB0g1RNkD5+tP83qcjTP1c3m?=
 =?us-ascii?Q?4rS6HLtH5XixE3ADWTOdN8Byr1Ho3Yj9IdSajIYClb1vTcuZBgeth3OQOdUy?=
 =?us-ascii?Q?67WQZ/u1vB7fO9yaNbbgKuQYtU4MRFEHFtyFLsey5+s4i5EANMc0lTlqsX3s?=
 =?us-ascii?Q?MeU14iTvhPUXhHSWPejWDhqXLUfdCuhudn+BSjExooXH66QCVtiNKNCJaSTH?=
 =?us-ascii?Q?TSLgRGbwrUoF5I6M2BmWKbAYjpHlnfsUMcMWajoukdKUGOZhD9XxGopbMN4O?=
 =?us-ascii?Q?/Pn6eiGfvAn18R2NzNZKCPJX8lFt6sqk6JWSxAXrWwFBuxQp4IwbRHw+j/b1?=
 =?us-ascii?Q?FXxlePhvMO3bP89QOsJmeU5VCaphhlU1u0IXdcPtSHKLwmIk+hDyATONtmKm?=
 =?us-ascii?Q?sw+ibdWNCUFh7BBN/EC5B349mWO0yv5QNgXgywchQVrJ3ui/3MdOP3vUWC7O?=
 =?us-ascii?Q?hZUcr/Y09sO8YpfpxxFpx1GHdxfBkFTbNT+JlvNQDvwmFAx5/53bbU6FbaC6?=
 =?us-ascii?Q?CYHVqoazAG6EbJrI21+NemVZS3fGShMUiLLXd+xjDp2v8ehj1j3prI50KRQR?=
 =?us-ascii?Q?mcF/iL920cgHMP2TXuYy/EmH/er0D1vwVet2ujPjXtu/fU07Tzqp16418p88?=
 =?us-ascii?Q?32/u4f+pkk0cXcanO2LHaGZI8GIX7T6Pmu+NTWte8W7806Q9anHvDxvRK9Qx?=
 =?us-ascii?Q?RNC+bkrxDb8nOpWKB3WmdN2R2AU2bTVjeemtYB+04xSz9NrxzBFn60BBRme1?=
 =?us-ascii?Q?/74cGCPEP5mlno9f42OQdPFYqIT50uqrDTaBwB4xA0efj9+dAy80eY8zmjUQ?=
 =?us-ascii?Q?xLsIkbJ48LGRWZjWW/hQJuk4qJJkn8G4CWZDIYH5YYj/wkkHKXU7Mln30bgZ?=
 =?us-ascii?Q?fgbP94U8HRGwZZ7QmWZihLHYEBi8aE8p1+P/NVWRd3xdFBLB0Pg/PsLhJvA9?=
 =?us-ascii?Q?WvA07cu9r8sKcMngKZ+SoQ7bfbax9v1IDfPHuSOnYEOwvS/t/6bYMPLk/nrg?=
 =?us-ascii?Q?JGxiXVfffjPFDgNc3AQWV8vSv3YfnhZrj/GaP+hsDRYgofm9TDSGueW4KOI/?=
 =?us-ascii?Q?Iyz/DUmoNy+DJXqR6zjo6Ksp+ZyAKjJteu9vussczflYMT+BpXKCT1ZDJN/8?=
 =?us-ascii?Q?82xbSBLhEQHrM7jU9mBD8E6wzKdWEOdSRJHr9twFWNFQcGM15A+/TNicT5cB?=
 =?us-ascii?Q?AQpODZaWCQU47Qm/CXPhtOY87UDSZo6vPL5e6upAhcuT2Oz0dvUKUoBFmsJ8?=
 =?us-ascii?Q?/cpIXNMyb9yIVfpxkEuv/7zyJZ/9Pfp4a9XR4Rkh1B/fCulG9acrrrsLK+Wg?=
 =?us-ascii?Q?YzzrzjXDIKPf8bCxIsVqZg5CuaV0CS61DhFcD7tffhmZB+RgSzaXmBN77m3I?=
 =?us-ascii?Q?dlKHnxiPF8L7WKVYYSpIMtO8QwUpK/bwtiT05Xq6KpNeDLzBSFe9hg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WyCvQEfBSJhHaeCK9WB51U+Nh91xLaiwuI2mcF/uIdvj6ShqHuCUzucDLHcC?=
 =?us-ascii?Q?TogSjkpUwgzzNwD6EZZtK240P/ioSbGcjsmwtNjauSkMHF9E5F+Xk7NmMeK0?=
 =?us-ascii?Q?oYPJ9/5RUcYlsYvexQeHCPsk92UHdzjCyzoc7Ql+jj/EnCiBJlFVcCM9ryx6?=
 =?us-ascii?Q?o5bwoWjMgiOCOP3RESqQa7ukvT1nqagly+TYfhRX37xszYYioqh//LoMaQK4?=
 =?us-ascii?Q?P6JC+EDqcsQzJIWtGU/X6YlwaJsW5eFJRkqCEEe1qAoJst2kB57frv6Zsk4t?=
 =?us-ascii?Q?yuAAJedxvaIadpXu2dZeeFrj8jDfd1ZuLYOYozkRzTGd+uF8BC5YyYcPBgW6?=
 =?us-ascii?Q?cqgLaxqdn/Mz0T6kKbdt1w079207OWFU8R6QPEvjws8Z8vS637Lpec/8B0NN?=
 =?us-ascii?Q?6GtxLfNm8pwRGQxUXBObKCuumb0IAFBd5Cl/kyJtleCuXpNuk3ttHEZQqHOn?=
 =?us-ascii?Q?6TiMtCZh+EFGDW8+BA0iu0vad0Q1htx0Bd23j2WWzyrpZDwHHEOxkZuiHVtS?=
 =?us-ascii?Q?gt/u1Y97B0C72+kzzGoIj4AJoDuTICPPOt4o2JScf70wb3VoH7mXinMUnOSs?=
 =?us-ascii?Q?Yj0Ux3ovDEaIsiUuO/Tng2W5cqJBxDQZngBH0GuXOvKxUxXRjo0qGkNTsWRF?=
 =?us-ascii?Q?fXv4xsS4VX9q+xtZiZghgxWv3GNJ4Jgk9kNWmTiiapRLk63uhpwJsFv5hUGO?=
 =?us-ascii?Q?CGiMqK2wCCmxqRO5lEHr3YQ9Rfp9hfWfQGUw2Xst16glcn+MjgpwFVMpgG16?=
 =?us-ascii?Q?oiLJe5Oe3FgFpCfg3qAuW65ZPlJTEuarX6tGmSRp5sRNyA0XvfbxgTMXIW3T?=
 =?us-ascii?Q?ixCca3poMaqJoeregD74kinQPdVaWREze1ZzVLkp5c5AG62Zk5Yixlmfiycu?=
 =?us-ascii?Q?6g/aiwgVf8mKXcCK+x1U2HsGlKvFsrGBSA0PMaK2TU6QUxJtBaoiG3Cj6ip+?=
 =?us-ascii?Q?81FgUv9hu0GJD0k9gj1ljxA4vKQKzV3KycPLMm5VkKYpaw1SZ9aVIk0MBrXe?=
 =?us-ascii?Q?X6DtcWYwnI5RdsJ1j3gfxkicjqJchi9h5Acl64BZFodukdlVrIEkHlUQa50b?=
 =?us-ascii?Q?/ASKnSA4Z8umy5rvRAaDKNgBwJTjRFlOBY33YAAjuxPP7c2BpgoXNYDr9YO0?=
 =?us-ascii?Q?RDDUepXJ3FUH79Qy0poDeJsUZtBjTJK5QnTo2kpvYMaTMogJfuKgSx5A9Orj?=
 =?us-ascii?Q?pSFE4zSMHnyK5W1wCfj/827i5Mj7G2CVRgxVXKNFsKkOfa05Xf7lF7POjga8?=
 =?us-ascii?Q?y12lFJj1SQtkmu0Ed6+jhsgXNJzqopvr86KRo10RhVjXgrbO+ljtVMbdJ0rv?=
 =?us-ascii?Q?Fmjtj/bgyxtoWkFzLYT6g25c43SmPVXAYXT4RXrbTDoJJfd5xf2sTXAfaBA3?=
 =?us-ascii?Q?VdGSjrFmnx/Onbxiwgc46KOo74D84AP6lmHefldyLaS3HrSlYw0vnlLzgfoA?=
 =?us-ascii?Q?sytiBsrt5ISk5+zrfVUoxXuAh66OS7FMZAfaHdnvvwziwERYUgDRJH47NPFF?=
 =?us-ascii?Q?kAJ5ezBu6tG+1vPEmK6jsISie2wDZHtAOhMJwpc0G3zkLK322TiOWh1ID+7U?=
 =?us-ascii?Q?RXnIG/arePx1Fo+PeCApofQKiFtCV6+g5I3FN7lp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N7BYlDsRhsUnkimovSAtM0dxsFHVLb3T8P/pSYlgedNyXi/xy6oUQzjMX7/5tWMMm2y7HVVpzVjJ+I7zLBK8Q6eRh+jqZOFS4tlLyQPoXvLgjEfKI+KcBGEXYez4KbN+ERmfIicEMh06MqsjU6sGNm3bTmMa9EHBfJ7hFWuRNReN7X1+JGk30mQpa6DK4+xTn51sXpY/c/Vkz/2MzMnal9vD1JKhySna1bfui1dmuUSFKzs5zQ9EB3N9ydvjrECsJSvKVqegH27InwJeoBEKcAUCtIvCXHPaxVWHpnlCXxcFlWgCCtxD70y0tDjSNMWWLGhYGHB+BkS367h5LAfxnIXpzROKoVEHR53w8+hzIu9FZdC0n1tAz2JUm4cYnAv1OC4pJHzMQP6R2fMvJTodDlEQUN4pt1CwTQI45urAnYk696wytMsb+WhiWh9hCkemdarTujS1mYZKPtuFFJu2lMFE/vJM6BpqZyd3EqcQkvvPBa2Isjh6dCWhiVnd6GwoDUer2x/plpjZUaHe+fA5UStqo9RmmdI6vvkgmlMHHW8Xon3R8nF8w8RjK47JKD7Xqdd++yn9+hh+ycN8Y21zMikwHck75L0W+2onMZS6Fbc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2111c61-f2a6-4bc8-b8da-08de07ab033a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 03:13:41.1236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/NgZYaBpz2MdWiv0Tvyaoi3a8D3S6gE0DovAm6PalItGTGMANYFpMcmn+rgNjEMOqxOJ5OU/YgPqSQZ0GPPpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4940
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510100018
X-Proofpoint-GUID: o5cOs5TIoB4deQwfrLvcUL3JnZaF2eq7
X-Proofpoint-ORIG-GUID: o5cOs5TIoB4deQwfrLvcUL3JnZaF2eq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX5vWZc/A3+KiO
 8icQ7nBe9uXTXrGEeua5XZCxAPvvzFXiVEZk6cl5LcUY/iftimGWPcMTeGiBIvkk8mR9UHHQJYX
 ejJqCS2+biM4Ixi1pgeQNme6rqxDR+k6xr0XGci6OlP4cZPYQpbjuD/tHZ7zPG5+mijzXeJgE/k
 i81okag2WmwYVmUlJ/UZvcyvds0lzcLtO2Ax/KRrDG/ysoi7lTCFO/QCiSxqSDRUvNsHgQtSVxo
 BoGBYMi96cU7pebSu5G7aVpCkrjK2wjzH4FQqANviO3g4DJs2/kBmfBB6LT8Ud/6WoyCq8QOO4L
 M/QX5f/x+aUk3uYEV75/rCShUctI7v1GrvRSNLoFHAkWArceRZDakXrHNQ5YVBRGj/NiY3MjUlw
 d0W1gH9p9VWbKSXND0SBc/Yr2nn+dzG7SHBweQ9BXaIr7ED3SNU=
X-Authority-Analysis: v=2.4 cv=FYA6BZ+6 c=1 sm=1 tr=0 ts=68e879e8 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=sWKEhP36mHoA:10 a=yPCof4ZbAAAA:8 a=RkIx9LfyliqrS7c7w04A:9
 cc=ntf awl=host:12092

From: Eugene Loh <eugene.loh@oracle.com>

In commit 944dac095 ("test: Account for variations in error messages"),
an attempt was made to account for variations in error messages.

However, it was applied to the branch after commit 49e646183
("test: dupstruct: fix extra duplicate identifier case"), and conflict
resolution was not consistent.  The earlier patch "standardized"
messages by applying an optional "enumerator" where that label was
missing;  the subsequent patch did the opposite.  Subsequently, some
logic got messed up.

Fix up the logic.  In particular, standardize on the shorter error
message (without the "enumerator" label) and adjust one .r file
accordingly.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/types/err.D_UNKNOWN.dupstruct.r | 2 +-
 test/utils/libctf.r.p                         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/test/unittest/types/err.D_UNKNOWN.dupstruct.r b/test/unittest/types/err.D_UNKNOWN.dupstruct.r
index 762b24f4c..7afa74aa7 100644
--- a/test/unittest/types/err.D_UNKNOWN.dupstruct.r
+++ b/test/unittest/types/err.D_UNKNOWN.dupstruct.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/types/err.D_UNKNOWN.dupstruct.d: [D_UNKNOWN] line 17: failed to define member 'x': Duplicate member, enumerator, or variable name
+dtrace: failed to compile script test/unittest/types/err.D_UNKNOWN.dupstruct.d: [D_UNKNOWN] line 17: failed to define member 'x': Duplicate member or variable name
diff --git a/test/utils/libctf.r.p b/test/utils/libctf.r.p
index 8a6fd8b13..b7c8a5e04 100755
--- a/test/utils/libctf.r.p
+++ b/test/utils/libctf.r.p
@@ -3,10 +3,10 @@
 # http://oss.oracle.com/licenses/upl.
 
 # Possible 'enumerator' label.
-/Duplicate member or variable name/ { sub(/Duplicate member/, "&, enumerator,"); }
+/Duplicate member, enumerator, or variable name/ { sub(/ber, enumerator, or var/, "ber or var"); }
 
 # Possible trailing '.'.
-/Duplicate member, enumerator, or variable name\.$/ { sub(/\.$/, ""); }
+/Duplicate member or variable name\.$/ { sub(/\.$/, ""); }
 /Member name not found\.$/ { sub(/\.$/, ""); }
 
 # Could be union or struct.
-- 
2.47.3

