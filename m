Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1127117A2F8
	for <dtrace@lists.linux.dev>; Tue, 27 May 2025 05:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324604; cv=fail; b=ATv8Ww5mVJ2B86qhJc5CLFy1CAGm95FngiL7N2+g+LbsQOlqsrCQv696KphYV7Kh0rciW65iA8dQp9Do6mSrhLE6mdQRWJgHOqGMQKeKId3Vh7hL0E1oUWKa7zJ7pPcQFb+VXjahTpSChdfgtG2FyJjTHLERdZATDHPiUvLqo7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324604; c=relaxed/simple;
	bh=ImjjZMY9140xDwvXt4G2tVkvLdVD7+eXzp2HzCxdUKM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=f6zSqKnKPf5EW9l+AymSRNqdzrvdewSgzuBO7RPH0aIJuBRv/Px30rxKR0Q+bE56p2Hqj5aq2yqChlF474pI3dW67Y/MHgelIgUfWqqq20sXoRiJC63P38nue9WoD/fX63FyXubKS6/wHa/Nl4vVXPzZ0R8jzUgbd4pOZ/IhhSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ft7QXsCD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UztuKrza; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ft7QXsCD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UztuKrza"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R1u1lD001487
	for <dtrace@lists.linux.dev>; Tue, 27 May 2025 05:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=E5nIY7Vm/OuhzxzgAwFBhpMkuYcx5EFeYug1F1jEMUs=; b=
	Ft7QXsCDEQmgCNHvNjOPocB4LoserLxnz/ruA82WP+rqFaMYVZgUElFYCeBcRaVy
	VXiTUYIvaYF9Yv/DxP9YPgvY3rniebAsUAgGl0pGHFHwKIva5HyzJ0u7JFKISFeK
	Q0KYYaSDLH0LV/l8knuxh1nJ2pTPve2HyjDH7W6Da+JoL8VUHFGdS6WpGFluxpTy
	bNb4Tgvw5KDbhzpYO+dqOtSmRBYpSu8JkocIf1juXjXug6CirTicYw7IDM4In+Yp
	9uQhRNXoWmsE1fNbn3Cj0ksxcNgf7jdh5itkiSC3Z4SUXZ3eVveG3IDBy1o/FUAM
	ygPxY9dAdBxWXtKLgOxLYA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3pd2993-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 May 2025 05:43:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54R3Sdtd023137
	for <dtrace@lists.linux.dev>; Tue, 27 May 2025 05:43:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j8dgt2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 May 2025 05:43:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4mzqm7omAT/KdMVz6kXEMg0KN/4fh/CV0r602VtXqBzi8cZJzWZVFD//35WxN/8nvvzXhMNFaIgir7DJh1TnD0faOk/bkmisv/osA5auvnN+25m2EM6V+oALxuJI/sJJYoal7a9P6+2d2xt6/FHEzulgqGuJBd0MVaTVmK9+zqn+g7brRII/1KzgVDB7IHFAALfpFdYcaEyF3QSjBgDxVu3LWRVOHvTLXQfOsFPn+WXQZHsR+7OvVc4/++RXKC5W12zVQieXJLReF1OsDd6XevXQm9AiL5FYg9vnIcwPxHsuD3SUf2HAsA3gz62xzSUkPsI8WBYTbl4Aq2qbRNoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E5nIY7Vm/OuhzxzgAwFBhpMkuYcx5EFeYug1F1jEMUs=;
 b=pneFlPD18XrjmpsrbeSdhVpuN3xAUmSjeTT5xhvfGh5RnSSFxCxFwcdHHX9+vzbAhQYiu30lMUykz67TlZbA4oGTl+4hgPwsZRzqnc+unMYE6a8QI73DPYVjJHeTVk6IFWtgM7zhl6NNDG0fn/HiQ0E5pR0E/R4o6HdVaMpbsTHsGPEooYaLlwxg7hvH2eaZN700EenN4Tg/014nR4Lip5jWwoy+hXNGNI13exWUsw6IB95lernium7qjRHIj1k2jNVz/Mx9zZJnsuhgENZrE03Kn7573SFFegtSQF0ED/BXaKDaF60qim58LkbrD6oy9OSKGfOLaW/7q1+ksDm5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E5nIY7Vm/OuhzxzgAwFBhpMkuYcx5EFeYug1F1jEMUs=;
 b=UztuKrzaZmkYkeDYbsZdztlYWF3uF0hS5P7asrfZauY6FGtcPVcAqMVufqGgEW/+Y5VyJPFB7iIqAahclNghNn4Al9TOvYUbq3+CeXxpcwntgMDbOBi4yY2Fry/XNc3e72V6Dlwo3t+9rxx9g8WtETDgv2WKPGd77v/QiN8oy8A=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA0PR10MB7275.namprd10.prod.outlook.com (2603:10b6:208:3de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 27 May
 2025 05:43:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8746.035; Tue, 27 May 2025
 05:43:17 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Omit an aggregation record if [u][sym|mod] translation fails
Date: Tue, 27 May 2025 01:43:12 -0400
Message-Id: <20250527054313.4849-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013E07.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA0PR10MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 12627096-6cfe-4671-6d0e-08dd9ce161a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NDUxE3d1M6gronFRVe6P4u1XOS7yFmUVq2E6nxJYDOrmzkiwDISiGyZsBj0t?=
 =?us-ascii?Q?lmldC+eUduos+yJZZhtnhRSJdKYpCQmeQ91aJho36j9EFAAl1xp9wKEsilKT?=
 =?us-ascii?Q?Tcolu8Y4U+fmh8cclARXMs4pz6rKeh3VLWqDOeqfE4o5mQq4fv1cJCwiTVPv?=
 =?us-ascii?Q?4qG6uPl/JgAf8R/BPXVF7jGXNEZgP8FRjzxAWQU/zGlfc1IP/x0mO/yQcMfz?=
 =?us-ascii?Q?qb/aV3Z2wSbWU9e4F8QkLOvlRMYHLGPJDpQz9dz2jk/iUVaPOuQBBqbJXdCj?=
 =?us-ascii?Q?bojuo+193S+eWObj61K6SDrEOIoRMcmHej0Ztq+38nj8qGAXM7/pGwCGb/xp?=
 =?us-ascii?Q?m7wwYl+GCeftAxixoH8gVHVNLRCiF8x52CxriiqyuA+WXZWL0u/F2jpmDVMu?=
 =?us-ascii?Q?e3QS3rzdZOxEW/KxQOWzk7/u6kkyenP08T732IMrTuDNeMmhLMxRfcJiR/Qu?=
 =?us-ascii?Q?nCHOEXldT6nQC3RYphFzhVwXDC3AyESEWXMbtTqxpMJaiEGboMB/6UghW9Jv?=
 =?us-ascii?Q?v8LffhXBsmueE+KSTmVr8dTMohIQxmyn9yohB3xjCJ1NAPMYXQd8KpYGeHJ8?=
 =?us-ascii?Q?8yWU+SVT6BpHNp7S1jV3l1NM7pmLgk9XSjNFmwndn4mBLkJVDpGNxlzyY7Oj?=
 =?us-ascii?Q?oQtUw+rXAIpqpDm21LbJFpSsjz3+WT0D5Xr0nNmLkZqFstCCGdacgzrodPCk?=
 =?us-ascii?Q?9ODb+7E4M8WuiQo3sfWiFxh/dcrJx1Y9C3rDDksO/qwrInNgRjmnHPwMF24b?=
 =?us-ascii?Q?YDMxfQFoK/m8fWjaEqC4BwPdqaAzk5Zf7C0M4H1v9Qumic6LIxyZqsw53pqI?=
 =?us-ascii?Q?lB/44BSTPF0qQ0DUixP6rVz9uuUVcpc5gCJGMDlf6OKRipqEsJTI8oD2rRLj?=
 =?us-ascii?Q?F+VZy83zsaJinK46/1o9kbIvhupOT+zMqiOwWi2K8fDyygmx+NWXGK7cB3x6?=
 =?us-ascii?Q?idCO/9gRZns8sUwBCm5q0jiaPyQjYkE+2OLyoKPnrd6GzoxcqbWa6aUgpmw7?=
 =?us-ascii?Q?UBWllH+PNgjWFILzrdHQ30BY5sayAeZt2HoDNYOcw0GNpECPr10pHkEOEAKE?=
 =?us-ascii?Q?+ayV6IB5VH42SYAviyoReVC60TrNpKFep+tSbzO2wKDUFJ5kJukEFPYVWTsa?=
 =?us-ascii?Q?KGAHR+eYt8GvjFYDfQAQPHFyg/POkYdnMBxvmstH2WGLfRgQlUG8YnTXDrb5?=
 =?us-ascii?Q?v4mVp7GIIh3dOChRBPTEluk+cj5Wf2HM34/5fc/GTIf/UsxcmGSEy+xYSusW?=
 =?us-ascii?Q?B7uAi3M3vjS9StFAWPMzft6vZit3+iQiwQlC3pxyZ3JMUTj0off79/HqeQwH?=
 =?us-ascii?Q?p+jrbC3jjXBW2YSErrT5UC07rPjXo2Mq77EkjHhLZXKnc/RwbGXaIPtm9Oad?=
 =?us-ascii?Q?o6pZbWYOClI/ZTxNYDsga1xEqJN88+E4OleOFFOc7nml9rfJj2RMuRUolJO9?=
 =?us-ascii?Q?ae69HDaPuDo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?owj0Od18sBYPen2bz9ihbqWdKsTrNokj8U2+4cPF63TKx9IJNt+8u0vOCAFP?=
 =?us-ascii?Q?/nZhXZvQdJbaY7s7EVrTSDZpmFmM1hLCn6AQgEPhkx6Cg6v4d+09tkMqn3yu?=
 =?us-ascii?Q?ewRws0PpJx19kB7pHlSV2tvMveN/RgKkc8hRke8nNmXRn/F0Eva72OuNISPM?=
 =?us-ascii?Q?qzT0dhjUjPrHzmIkU8E11E81Pcz64xrpG1/GCXYAsuwFLPVLnsnCCCWCq/X1?=
 =?us-ascii?Q?2IUGdYGfZKZvIs0w1CXw+b8OOQcY7GCL1KTj1cxpJA6f67nGqLCLmMUpH2dH?=
 =?us-ascii?Q?BYtq7w6rDmIc3W848TCbdG7hDt9O7iPkoxgc4xQcHwdK30aneDveDa7ZBLIm?=
 =?us-ascii?Q?sP4BkuMc5ugSKwsNuK5RBSiae5PGUPmyrj8SwMrn3YnVCjd48oS408/tO+s0?=
 =?us-ascii?Q?hjb5OEdZlB02aoJdRfEhRuiEwjpCSRzv+Vlg4E3WN1yRHyf2rQ/SPPwoue5M?=
 =?us-ascii?Q?u6qXC7SYG7dSIWY14jdS/eGuWIO5xZvwJqLuzBb+gtg+bDJ72xJdlK7neVyJ?=
 =?us-ascii?Q?5h2+XD/ybr3+9/RGZEt4ZCMe6PfJFol3l1Gry9/BGR1/hSPwU2DE6oQwvONJ?=
 =?us-ascii?Q?SBd62TjX+Y7W0bxgo9UDqOt8kgW7GPOfquJQmIQUQB/IinwHXKNEYqMapeU6?=
 =?us-ascii?Q?fYzJk17975vpGxTSnj0m3OQRUtrO/EvLDtnSgHsKwpWppHproAJDZYbilsTN?=
 =?us-ascii?Q?7n0G2ON/0H+dcHw+SPruWbAaC91ipO1OVVifRRZlj8umWXO7qO+yZb5hCR0v?=
 =?us-ascii?Q?re7NRfw/CSfBjM82k/qbiwXH0Y5gO/0AUb3MH4xs6K5FNmV+RlMcrYgLYY+E?=
 =?us-ascii?Q?vqBzjDyCgVe4Q+TkgTBM9r6gyNPwn0vLhXQgDXUcoUpRvcO2uftZQqH2b56I?=
 =?us-ascii?Q?h/mU0FuYoO9gO2z4NJYa87h9jBbauAVyCug03YorSizgKoxM77+0Pot2B8tk?=
 =?us-ascii?Q?VIkNDupz+/+h6YT/GV4K8vzMQxXDbK4w8VJbVKwh6gLqfC696SFPm7LEfYHo?=
 =?us-ascii?Q?p2O6OsCVmU9B160iK3/phSfSu8bC8shhyJDkChOVLhwSI48iSagY7eKI3twA?=
 =?us-ascii?Q?WKTmh82w5B7PGH9VkPmnkSdCWIjJO2dzxfJFwjbATaXs6kkTaGiJGZxAYALG?=
 =?us-ascii?Q?BWQW7Fd+0rQ+4oY4w/O381lSXQqzUGMA5V7Tm3toVLdolqj0wXVDu/mm8QiI?=
 =?us-ascii?Q?teEX4br8MakQ+k6RSgpN/irW3a7bPeHV4QAgpnrCCk48BZj3cxMT6FZRQHzS?=
 =?us-ascii?Q?p0LvB/7VGlb3XyOF0cg4R3YSp+5XU3BW0tA2O++p/DHCdemiUwlBAWBf7uqO?=
 =?us-ascii?Q?q8ntA1RLuutZW/n05nSqcaH886senSg5l/TiAEWifVfKCAJhDuicE6WgWWSV?=
 =?us-ascii?Q?vLXS1Pv2PUcjMEkF7rUaKYu7v5SkJFJGgKt9J70YS15DTeHEXLx9y6o0XyNR?=
 =?us-ascii?Q?CU+Rox6HyM0nS5SxBlqv07Fo2YXke+vSaamFp1p8ePBOsKuViX48txInom2q?=
 =?us-ascii?Q?npIk9Y0HJO/Abws74bagQRhm3t7yade+uvbAzZ8l6toGd3c0iISwHwt3CD4D?=
 =?us-ascii?Q?gDqQGWY64xBwLKaUB0i2TVFDjZr60RVVl224bCku?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LTxncael+CczK/dQWdJXzLBus4CS0VdecDPRdauvgg8Fjq4Zjqo6tzEqHsCb9u6kHZyZnqq6AI64KE4LKjoIWgZmy8RrtmB0MSfoOB5orivPvuh17XuLpnuhTtxgOBJOw9LlbYABJ5zRVYPdu66+Mwu+lRHp2WO7FzdDw5RKsZv8tNMEx1SP9c+RP7NAny524JxskbBOVZtiDVyBrwE2TedAmb2NNZRpjZl2aHR8l+lXjhWEFCt399iA5fE8klQu/58HRaBmOK01o4Haz71MgN27RF4zSsyOPojplWHTtvhWI7MB11H/CYXE5OHXKiJpErYKi8zxftiowZc13clO3INC46A4QpoPnXujziV1oC7X8VMwUFVQF8TJJ9QgSwfflGwz83E1jexCzgF+L1eq/tbu9Ms2ufkpGRcYU9d+zxchW3lZzaThbvBBBAgDoJcz9bSdnRwWAIoo8bfdst4wtDAFRDK0t6Dye5RfuC1GFtUV2aOVDYQ4ZP6oHQnV724zZ1QeYx3qU2FHtNPkJ1vDrDRmZ/ptAXjS/9F5zGdhJtjCrdhYWPR4Iablq+tIL6T1BLu+AcmRuz+nGEXYgM4xhd14qLRpXEUWqC5cHVx+Sjs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12627096-6cfe-4671-6d0e-08dd9ce161a5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 05:43:17.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BudH1/C79J8k+EdTrVUGr0tWNgGa3dZLIb7iigY2I7Hjh/h2d/Bf5kV+xHC5HVQ1pnfWKRbygsuP1f+3JLr3ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7275
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270043
X-Proofpoint-ORIG-GUID: Aw832rvTjF9p9aKz5UiiEDtxu5VCXHIE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA0MyBTYWx0ZWRfXx1tPtJzFab2f MZvjtbTtY1ns9IzNIlNgqbqmvAhYUORL4sWJPFWz8Wu2C8mS2XwG7bHLFCfwTyCELlHmdXzllhD cJ3Eo5PF7D/8Q9pydqjDOYbf3ky8eX0G8AJVBf79HFG70ANXlf5Q7fIKxvKqGsm9So5w9IsZ5RJ
 RqswuG0WCi6uk45iIHI6+kCK0Au+DfXK096K32fmOpLKlF8lIBp+mIHKUb+nyAqYnaOlLheoL7z yQ6cTaqIhd9Jntq1CxCgg+6hIlP6/1lIp7ECUnSkYecZ2HFsNROWWN5/EvlpFj5NnChDdlmq3bk 2+imAzLX2KLc8W3lPws9E1KoT61Tr2dlFTjBqEz1/Gk5PdAxiuC+leQREiLuOAYbnne1x+hU6hH
 CLRs/1gRqz/D3lRmw9wsLcYUnBCImTQ967PbC8ONpavRgrt9Vm7hTmOTI+54gLWSXZuKoB6B
X-Authority-Analysis: v=2.4 cv=UZNRSLSN c=1 sm=1 tr=0 ts=683550f9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=MZKL1Twp2Rlje-_qR6YA:9 cc=ntf awl=host:14714
X-Proofpoint-GUID: Aw832rvTjF9p9aKz5UiiEDtxu5VCXHIE

From: Eugene Loh <eugene.loh@oracle.com>

An aggregation key can be a sym(), mod(), usym(), or umod()
translation of an address.  It is passed from producer to user
space as an address, and the consumer must translate the address.
It is possible for the translation to fail.

Omit a record if the translation fails.  This addresses failures
seen in
test/unittest/profile-n/tst.ufunc.sh
test/unittest/profile-n/tst.usym.sh
The problem was that the kernel's aggregation buffers are snapshot
multiple times.  If a translation ever fails, the raw address is
used instead.  Later on, when the aggregation is printed, if the
translation is successful, the raw key will report a count of 0.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_aggregate.c | 51 ++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 86f9d4d5b..40c1ae44f 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -317,61 +317,76 @@ dt_aggregate_quantizedcmp(int64_t *lhs, int64_t *rhs)
 	return 0;
 }
 
-static void
+static int
 dt_aggregate_usym(dtrace_hdl_t *dtp, uint64_t *data)
 {
 	uint64_t tgid = data[0];
 	uint64_t *pc = &data[1];
 	pid_t pid;
 	GElf_Sym sym;
+	int rc = 0;
 
 	if (dtp->dt_vector != NULL)
-		return;
+		return -1;
 
 	pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
 	    DTRACE_PROC_SHORTLIVED);
 	if (pid < 0)
-		return;
+		return -1;
 
 	if (dt_Plookup_by_addr(dtp, pid, *pc, NULL, &sym) == 0)
 		*pc = sym.st_value;
+	else
+		rc = -1;
 
 	dt_proc_release_unlock(dtp, pid);
+
+	return rc;
 }
 
-static void
+static int
 dt_aggregate_umod(dtrace_hdl_t *dtp, uint64_t *data)
 {
 	uint64_t tgid = data[0];
 	uint64_t *pc = &data[1];
 	pid_t pid;
 	const prmap_t *map;
+	int rc = 0;
 
 	if (dtp->dt_vector != NULL)
-		return;
+		return -1;
 
 	pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
 	    DTRACE_PROC_SHORTLIVED);
 	if (pid < 0)
-		return;
+		return -1;
 
 	if ((map = dt_Paddr_to_map(dtp, pid, *pc)) != NULL)
 		*pc = map->pr_vaddr;
+	else
+		rc = -1;
 
 	dt_proc_release_unlock(dtp, pid);
+
+	return rc;
 }
 
-static void
+static int
 dt_aggregate_sym(dtrace_hdl_t *dtp, uint64_t *data)
 {
 	GElf_Sym sym;
 	uint64_t *pc = data;
+	int rc = 0;
 
 	if (dtrace_lookup_by_addr(dtp, *pc, &sym, NULL) == 0)
 		*pc = sym.st_value;
+	else
+		rc = -1;
+
+	return rc;
 }
 
-static void
+static int
 dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
 {
 	dt_module_t *dmp;
@@ -385,7 +400,7 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
 		 * appear more than once in aggregation output).  It seems
 		 * unlikely that anyone will ever notice or care...
 		 */
-		return;
+		return -1;
 	}
 
 	for (dmp = dt_list_next(&dtp->dt_modlist); dmp != NULL;
@@ -400,7 +415,7 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
 			    dtrace_addr_range_cmp) != NULL) {
 
 			*addr = dmp->dm_text_addrs[0].dar_va;
-			return;
+			return 0;
 		}
 
 		if (dmp->dm_data_addrs != NULL &&
@@ -413,9 +428,11 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
 			else
 				*addr = dmp->dm_data_addrs[0].dar_va;
 
-			return;
+			return 0;
 		}
 	}
+
+	return -1;
 }
 
 static dtrace_aggid_t
@@ -606,16 +623,20 @@ dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
 
 		switch(agg->dtagd_krecs[i].dtrd_action) {
 		case DTRACEACT_USYM:
-			dt_aggregate_usym(dtp, p);
+			if (dt_aggregate_usym(dtp, p) == -1)
+				return 0;
 			break;
 		case DTRACEACT_UMOD:
-			dt_aggregate_umod(dtp, p);
+			if (dt_aggregate_umod(dtp, p) == -1)
+				return 0;
 			break;
 		case DTRACEACT_SYM:
-			dt_aggregate_sym(dtp, p);
+			if (dt_aggregate_sym(dtp, p) == -1)
+				return 0;
 			break;
 		case DTRACEACT_MOD:
-			dt_aggregate_mod(dtp, p);
+			if (dt_aggregate_mod(dtp, p) == -1)
+				return 0;
 			break;
 		default:
 			break;
-- 
2.43.5

