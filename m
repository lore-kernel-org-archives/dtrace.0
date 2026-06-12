Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3116C3F888D
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281347; cv=fail; b=NJd1Q4vnks6AE6SKf185pZHZ64sxQPV77mL2ijW28nLKjcM4MfEAe2AR3GOKRom2bFNrcyA6pTaQspS/yrJefL5P8wygYjM7i3N+Gf+0+GOayumvKTGBdQgsuCElP++0+sK1jESVRs4QSy0WZJYrt6Z2Mb3qWQrG1OQL3QdYVaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281347; c=relaxed/simple;
	bh=nD7GpiAf5FpSHi6+POFiNnEPXRI9twdqfJeTKFv5L7M=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=RQTbPrNlhydTRw0UDClUf31NAAaI0BQg+QkKNw8SNHChRD5cxVXI1lf0MlBaKspdfB/ZQvJjk5oY/VGCscYxGyLj+vB/gLB25OYPKpLyO6f5Ez3ZCgVENMZmxf13/iRwPbkVUjZd53264uPwqdaa4676iW/o3wqwA05Ow6FORHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BRExtS3K; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wR8cSZ4f; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BRExtS3K";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wR8cSZ4f"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C7NFeu1929192
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=vt1Ccth9OwZinlPioQDdYjLmGE76iJnUsjAAyLA3Nds=; b=
	BRExtS3K80tH4XSGct4MiFVSly8w+C9cM9gErqyaqWN4o7lo7uhdqTyZMwrT/zMY
	fRBBy9mSD/iWdCs6j3GwP9bXdfjy5LW+RRyGloUsARj0Y4Gx4j98VG02w8mCfE8s
	hv78zamhFSs26CJc+BpPIPe7eHvVPTaw6NAq4uCpIVHLG8WQOIoX93xif+W/cMzs
	pUtQuDbviFK7KOMhQhxW5+VNP2Pw9AmfIwJnoJOYwa7lMHdou/d9YV6rX7S2fiNP
	wk3pUVw9+0diTY6/QhLBAsH+QKiM6JrCw0aOi73OC2LAMcMqA+8K7QsCRh83tD22
	1LN6AKwwWVhSJg+GTsqjsQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe6uu916-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65CGD69E014463
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:19 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013018.outbound.protection.outlook.com [40.93.196.18])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4erh0u2q04-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jb040nUlZYiinBYbv65OpJO/k1j7nWYEMIFkpzoaYauTKrxgs/TRDwWWmnMWzHakRv0ug8raS1q7fGAOzgl6p6yPMtZYXPsxkOLYvN/FbCwR5jX/JYMIefAUuhSl7Fd8sQ5Ig6yszd4NtASID4UqDGTvNgVZOwoBTK0XGJ6+dIiQoJbOFjIfLEgowXxNzznWvOkt7iV7OZoaQ45Td5kZuclwll6adTYkoiCbuueg+YIKUkwTJb33mxDTcHvQI4cjypkRjmKE7rTzzY7eA3ZhJ4jZiHNTDK2Jr+6RiWy0VNRaS85+6lwXveflcsCLCzZcSaLCmiXJopPfy7w08g2gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt1Ccth9OwZinlPioQDdYjLmGE76iJnUsjAAyLA3Nds=;
 b=AaqwCM12Hdd2wuXBDh1nxcDEp+vFmv4nHN6Dssm2scoOBuFAMpvALSsgGKhplljtGCiSDVumkc8eUUPwnYonACSc0q1p74W4Xo8g+Rl6X23crxYpgkqiLjAlwui7baUvWpyoD3z7YRk013cCjf7V5ykew4xUI9fxnDR5zV+lc2q3JC3YEAmEYhmobMw12OItBlP2hgmN1NbgjDIaoFOJUOwwCvWh36iB9sMDRKYZn1gasU9DKDGCEHSxINnY+UBKldqRbKVf3XAhA2Earv0PK+YuTuoAVAdEjw4RlkoaLBzS6l0U03KVB5Lvhimdc7Xy8erE302YuY5/vGDTngykYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt1Ccth9OwZinlPioQDdYjLmGE76iJnUsjAAyLA3Nds=;
 b=wR8cSZ4fplbtPzfDNvBQOJFpr9ijqAuvN0LDwDUrC6kUXQ77fasJu875JCvGXi3Ipqbpjj2egkf30c1QDbNCGu9frlUm2gpKGP/zp0bhGZUYSWYadpIi4BeyNtSYs3Fbxwz7ruoRkDjxqk3zu1SHspCRhIyozLYoqyrFEO7cLvI=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by SN4PR10MB5637.namprd10.prod.outlook.com (2603:10b6:806:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:22:17 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:22:17 +0000
Date: Fri, 12 Jun 2026 16:22:13 +0000
Message-ID: <715ce418876945f45b4c792287b4fb21@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/6] dtprobed: fix dof_stash resource cleanup
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:5:333::32) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|SN4PR10MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 13c2bd4a-bb5f-46ee-423f-08dec89ec55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|17002099007|18002099003|5023799004|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	FvN2dwB5+HlB7o/nwhF0+o8vL2QOhLkqsm/qsb1jiFiFhZPn662s8fgezEFGdTvAtEaff1AW71PlQOSanUo3YMtASPqTcMwNoOHoaill2eDTiN326XT9hH3IhOxcs9OeKY5IhtwpTm/SegMijL9ba2Z2KURp4l+fbvVbzRCiR3qShGyab2C56EoemLFgXRQAO20hmVY9+xJQ9Miq3WtrR8GYUx35+tgiwnSwxpBcmHXgxvTLr+5P2Uo+xi0G/rBmJITwmlNiJuOE89cwW907YMR4CBTFNzVH0zsEBXZWMXheLmrteQK0X2Nf0ld+ZWGEnRX+Z9gjIeS2haNnlHrRhL6F3/ogSrNbxqG4SkXkfjB4nY8M3MSWtLFffCH9zz1wX9U5gWgmY6cYnzj7jg9v3BwMO06/2SA/lR+5qSH96or5gcVUjmwv1ILSNuR1NYayrzRYKez56bVSnggcgSS4pADFYk8qQH9PH9FpVwblmKVhz2Nu+4vu43/ZSiXPJRkKZUUBBdFXiEPehGrbHh+p478jYwgXar4FvlhSO1hmlwUPYH5ss/i+LFl9sFf+k06j7czN8eckP3yJ1uCve0w+jlwd3xpipZGPFsecesXTD7WaYXD08OqKDcx6pks722X0Vy/cwJljcxQlr1eooRQLUY7rGQF7+w050tqlO3yM07XEA97d/vb+AkH+YaJ14oMt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(17002099007)(18002099003)(5023799004)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QVC+Q54T/HlvokGKSxSl8KzeRdJTadTDNuawKcszPcV/TCBhX4Df6z2tfzO7?=
 =?us-ascii?Q?7sgIXdx0ASH1JTDH1lPfP+yUEYqsJe3L8u9gd81d9X+tPn3j9ifCtUEGyY9N?=
 =?us-ascii?Q?/W2rIiteH7BJA9TPc/XzcnbcQtM3y9VlMtKXC56ZJz6kJ4lvEAF5M+xGYwac?=
 =?us-ascii?Q?KsLNOWOspzcw1hw0eKzQSuEmHXJgYAkyfhKeGc99crgahNVB95UewXVLWrKn?=
 =?us-ascii?Q?jD7B5kFaJMN2GQUPdJeV0RPMHmFgUjS/1MF6kNEyM3PFC2GPEtHc/w0vQyE+?=
 =?us-ascii?Q?GBewCTlbTcC1CJc0WAYPvEsccKg1wtxfuQnp+M/QOi9L7A+qD1JrYxXiUtQg?=
 =?us-ascii?Q?n0ZC6HvxV44LNcbQKtbx9/dTriOxZajPQG20rwYpA8IXiQzk6thH00BZYlqC?=
 =?us-ascii?Q?2vLz1pa3a+VzKJBNWFTo09PnMKLNTZb9yNZGlvvWUOVRvXevc5KS7DjDgs3K?=
 =?us-ascii?Q?IA920UrZ7+xhFCKGVkuEY85i5uC+lxOTtCHvWcehVm9WZGLpiGwzXGJWGHyi?=
 =?us-ascii?Q?Rr1hNLg0SYPmlcbG8t2zPoDMORoGOQyCCmh+fKqQ2zyKkQJ9hP2EeirFGNUP?=
 =?us-ascii?Q?MT+Rf/qeMEYoq8kHEJJfDT1NY2VMm6RaSSiJ777oS8GPku3ieEt1992NQz3B?=
 =?us-ascii?Q?ARWWKyQLr9fpDcrXFZ4ZgcmypqwgclqD7Omlvd2aSvPZe/p2rgQ759GerVmC?=
 =?us-ascii?Q?HaawPsZ2+zbbVH6qBu2fKzroSoijENhCFBUmcJGhukYJAsKdvO8p1tkxFthx?=
 =?us-ascii?Q?kbynzsYZgdHaSNEe7qeXmHPV4YDmyGIV4y2uBkktLBa4f9BTovl0lIBOFKnj?=
 =?us-ascii?Q?j1mAvCrId+ZCQ+zapImsYLv9HwrWhkt1LktmsQS2kkaonfAFraqoF6G6orIy?=
 =?us-ascii?Q?an2Ux3jxqSXDtRUb/CBtyWg3NyJte+grmNKzUUI+HNOks25ilJlAR3edrrIt?=
 =?us-ascii?Q?uZpdm3F4BatZmhcl+MSwY+BaSevdghaqt6msRLSPeo1rWAldMY8HzwA8+KKN?=
 =?us-ascii?Q?gNXHWJKTfFe5Qcmr/bSjcE5VP4PPEu3XUb1Lz3JUKMw1uecSuHs1mFX1lPxJ?=
 =?us-ascii?Q?PLzlqjhCoR+jAYTXf7bKYRYX1iPyn3+SUBkt6DZTfyel1Nzc+xLdmerSve7O?=
 =?us-ascii?Q?uSXZzKhYg2PuW7/3DSMwvE+DEmPRyjCF65CtjsIf+5Cq46LJJmoaEnE8EJuu?=
 =?us-ascii?Q?iNzlyM/8nb/SvOF2H0GQ8tKQXZoMMUkBbjvA9QevV2VgBmSZ0XirbSOFlsW9?=
 =?us-ascii?Q?sLujUj/G8bI7k7Rc/zDCe0MfgizNNAZVZBUUDpL/D7r/WWpnnD1YqBj0uRhL?=
 =?us-ascii?Q?aIcRtWK6CjgKiE0Y2y3s5HJaFj4wTrqbmUUQbS8lT0X3i5e24ntc5d0ZKEUq?=
 =?us-ascii?Q?6o0ciW6MNXJrNLrwcwMc9QdmIOBiP1DIAg3vIEwXeZNrF7jx/M62gkwHaBzM?=
 =?us-ascii?Q?UR3iOgLljezz4aw/MhsKmZMU/87hg4zSqr7rChyISF4zpYdoV0rZuEWh3Q8F?=
 =?us-ascii?Q?P/v11Y68m3ZE5myqj16fJE8p/msOninIX5l0kdUpU9zgHc6gpKVBMIqxoeCz?=
 =?us-ascii?Q?aAsBo1kcMF530Vs5z9hxOOSYrJAxrVSWlPc8WSjOBH2Pfw8KWXb7lBZGot1X?=
 =?us-ascii?Q?1FYPSyH5J8svi/K/KmKqMtrBE4E+FNQEfVjXdQL+B7fsXAuaUHmIgVsfqtL4?=
 =?us-ascii?Q?rZV/P8nM5/FdRF4Jb24lZOUODj9p4LDA7TtbCAzzmK/108OP1Ky5kuaJ9r7x?=
 =?us-ascii?Q?Yr92OiP2hY5BpoipRFJbjGU6GrUtFEc=3D?=
X-Exchange-RoutingPolicyChecked:
	Uz2Xj4p5pHwPp4+R9Fj8So6wHlHY85b48TjxMTQVp0mSp1jdZ29uHilmi2ppCpHxxYbicAl7g6Kr/ykWA0/38BBYMA7xkSQO2wivP1Dvtf7JCYcUNIc19G6tA/mIbiXBlLR/kwVwgkp7mDEFgnRLrRCAg2wc14xnqqR/brwSkxzXHIBOzx6p9p9EqmMMJFtUp0kpOd5HBiFQjmya1gfOyOVSftcG+cdTnCRKpYBIcaKCTNlWEgxz5WC8lOsi2NdlbfWg4L/gR5sFizeMsskq7WTPPWZ9g6TqNeG/kh4AW0IrMdgwBJMQf2UT0oajGEpezJ+OSHBjCZa6tHji5ZfWuQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	st7xQ+QQ2OjMdkS4wFoqtFX29A2iLb9ttS8ddFZmbrDIxk3TPglkzHoM/zXE9XgjPIqwh+IXfSEBwkUATxF8itwP2dJDKmkjfr0jmb1KRD/TpRDTRAEuqj8cTXWGsixzGyIZSrFKCHhmMpaE+OUH8sN7JkxlApxM/rKjnMTURN5ClrDMtlhChpwRdejjsvxw3OjafcTWE+6sVCBSCAx0r+XBzkV1CDiwnaqe3a2hP/jyGjUR1Sc+OecY/LEEje4hkxryfs9sastIFia+SBssmQPD4gAtuBTymJlp3ezYrM2GlogN6AKqdm8WKZVdd4bYZjcYpEZ75eoJISG2tOOfbvF4Lqfnd+gmzNe0nj8LBMFogwC7yPgRbvc1Dnd+sYqn//rnSHcOJGrCNvJmm0FOUqgCcNkNyl76WHeaHVZxD07wm4wmd4yz0WLkjL/jwXwtFRsxjzdZh64ZkECKBPZvXqlwjBitjrMckppi+yhpiRV58hhJjCMp8ynrAY6E2DfKssoUcmgB/1bAwRl0Kk62AkTg3ZmqmJZHmo/9nOJccSLYeMV/1v/N+7zxUM0cFTuAB4MyzMdoRTGIR0Axd6AczU4EZf09uzJunc1Fzuudbqw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c2bd4a-bb5f-46ee-423f-08dec89ec55d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:22:17.5655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzD4trUVYS1R89eB6QtgkXDLYKrp4OPIAZnErsoGQfaC7c4a8Gb+q7uIpDBtYkX3fHaZDN/iMNDtS3gRlOk+sRGaZFiwYlaxhZPOWq6Db68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606120150
X-Proofpoint-GUID: XnuQT3lc4E1G70ntRcbIrCPCPb0HDDU4
X-Proofpoint-ORIG-GUID: XnuQT3lc4E1G70ntRcbIrCPCPb0HDDU4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfX+lVhtgM/wl7a
 q6uBKwO8NbjPF0HG3gqBQRqiCFh2LUAMd5vwSKRuRM1m2KsxhTmBGky2Bfcvx1SIHacYThHot8p
 8WD/9B+hkZz0CIQoKaR/AX+Uu/15LEnnBjDk6g69E2ANpQSUsLVI
X-Authority-Analysis: v=2.4 cv=edINubEH c=1 sm=1 tr=0 ts=6a2c323c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=WelhCq8ezR2u9pqt0_sA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfX+SVUV22i/Umh
 exsyJBG9HS/xG0Pe5SFCpa/VtsAyXT/L4adALvM88OBcTAol7YiQ8xe1HEhJkf8DOFpY2nZd6se
 Cb8Q0CEdU7PtlpXQhx3s1jPyaSOckM6BRCh/D+Mc4yTsAxISJScl3BeB/sVT32TVlo1yY505jcB
 N2Pp1HQecYaHgGafhBQ30BuSOrr+Qno8J2qup4Wr3SIMc4HKL6eZIBT/2MCzBcHtGbBx7lEuoIl
 s38GWSAnLkvq5IB+GDRpE6dBKPJOKuqClmtg4YgidQko9pv9tGRiaxsre21tVHIV+Z8YcEJ/sRD
 LdDio2khXhn3NzrO2B4SltfUoiy8hwAL9jUs4KrXIoiwnoF1hWlXy8IpPj10/a+3FTic18kNlDI
 uf24ZSUtuAlycDLZSVe/yr5nEYNqLkxT7SMCdc6B0AMAMZahnnIv5sf3Byxbv2cGra01BoSaLVy
 9vZO7qJymkTUFCxrmNQ==

Close descriptors and release parsed buffers on every path when scanning
and reparsing the DOF stash.  Treat any non-negative openat() return as
success, clean up exec-mapping and raw-data reads through common error
paths, and avoid leaking mapping descriptors when reparsing can be
skipped.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 125 +++++++++++++++++++++++++++++++------------
 1 file changed, 91 insertions(+), 34 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 891d7a69..6e62bdf6 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -304,7 +304,8 @@ make_dof_name(dev_t dev, ino_t ino)
 {
 	char *ret;
 
-	if (asprintf(&ret, "%li-%li", (long) dev, (long) ino) < 0) {
+	if (asprintf(&ret, "%" PRIuMAX "-%" PRIuMAX,
+		     (uintmax_t)dev, (uintmax_t)ino) < 0) {
 		fuse_log(FUSE_LOG_ERR, "dtprobed: out of memory making DOF name\n");
 		return NULL;
 	}
@@ -317,12 +318,41 @@ make_dof_name(dev_t dev, ino_t ino)
 static int
 split_dof_name(const char *dof_name, dev_t *dev, ino_t *ino)
 {
-	if (sscanf(dof_name, "%li-%li", (long *) dev, (long *) ino) < 2) {
-		fuse_log(FUSE_LOG_ERR, "dtprobed: per-pid directory name %s unparseable\n",
-			 dof_name);
-		return -1;
-	}
+	uintmax_t	dev_val, ino_val;
+	dev_t		dev_tmp;
+	ino_t		ino_tmp;
+	char		*end, *ino_start;
+
+	if (dof_name[0] < '0' || dof_name[0] > '9')
+		goto err;
+
+	errno = 0;
+	dev_val = strtoumax(dof_name, &end, 10);
+	if (errno != 0 || end == dof_name || *end != '-')
+		goto err;
+
+	ino_start = end + 1;
+	if (*ino_start < '0' || *ino_start > '9')
+		goto err;
+
+	errno = 0;
+	ino_val = strtoumax(ino_start, &end, 10);
+	if (errno != 0 || end == ino_start || *end != '\0')
+		goto err;
+
+	dev_tmp = (dev_t)dev_val;
+	ino_tmp = (ino_t)ino_val;
+	if ((uintmax_t)dev_tmp != dev_val || (uintmax_t)ino_tmp != ino_val)
+		goto err;
+
+	*dev = dev_tmp;
+	*ino = ino_tmp;
 	return 0;
+
+err:
+		fuse_log(FUSE_LOG_ERR, "dtprobed: cannot derive dev/ino from %s\n",
+			 dof_name);
+	return -1;
 }
 
 /*
@@ -366,22 +396,19 @@ void
 dof_stash_free(dt_list_t *accum)
 {
 	dof_parsed_list_t *accump;
-	dof_parsed_list_t *last_accump = NULL;
+	dof_parsed_list_t *next = NULL;
 
-	for (accump = dt_list_next(accum); accump != NULL;
-	     accump = dt_list_next(accump)) {
+	for (accump = dt_list_next(accum); accump != NULL; accump = next) {
+		next = dt_list_next(accump);
 		dt_list_delete(accum, accump);
 
 		/*
 		 * All parsed memory regions are terminated by an EOF, so once
 		 * we encounter the EOF, this region can safely be freed.
 		 */
-		if (accump->parsed->type == DIT_EOF)
-			free(accump->parsed);
-		free(last_accump);
-		last_accump = accump;
+		free(accump->parsed);
+		free(accump);
 	}
-	free(last_accump);
 }
 
 /*
@@ -972,7 +999,7 @@ dof_stash_execed(pid_t pid, int perpid_dir, dev_t dev, ino_t ino)
 {
 	char *exec_mapping;
 	size_t size;
-	int fd;
+	int fd, rc;
 	dev_t old_dev;
 	ino_t old_ino;
 
@@ -983,20 +1010,42 @@ dof_stash_execed(pid_t pid, int perpid_dir, dev_t dev, ino_t ino)
 	}
 
 	exec_mapping = read_file(fd, -1, &size);
+	close(fd);
 	if (exec_mapping == NULL)
-		goto err_close;
+		goto err;
+	{
+		char *nul, *tmp;
 
-	if (split_dof_name(exec_mapping, &old_dev, &old_ino) < 0) {
-		fuse_log(FUSE_LOG_ERR, "PID %i, exec mapping \"%s\" unparseable\n",
-			 pid, exec_mapping);
-		goto err_free;
+		nul = memchr(exec_mapping, '\0', size);
+		if (nul != NULL && nul != exec_mapping + size - 1) {
+			free(exec_mapping);
+			goto err;
+		}
+
+		/*
+		 * Current exec-mapping files include a terminating NUL, but
+		 * older files do not.  Always append a terminator so the parser
+		 * can treat both forms as C strings.
+		 */
+		if (nul == NULL) {
+			tmp = realloc(exec_mapping, size + 1);
+			if (tmp == NULL) {
+				free(exec_mapping);
+				goto err;
+			}
+
+			exec_mapping = tmp;
+			exec_mapping[size] = '\0';
+		}
 	}
-	return !((dev == old_dev) && (ino == old_ino));
 
-err_free:
+	rc = split_dof_name(exec_mapping, &old_dev, &old_ino);
 	free(exec_mapping);
-err_close:
-	close(fd);
+	if (rc < 0)
+		goto err;
+
+	return !((dev == old_dev) && (ino == old_ino));
+
 err:
 	fuse_log(FUSE_LOG_ERR, "Cannot determine if PID %i has execed; assuming not: %s\n",
 		 pid, strerror(errno));
@@ -1146,7 +1195,7 @@ dof_stash_add(pid_t pid, dev_t dev, ino_t ino, dev_t exec_dev, dev_t exec_ino,
 		 * already-existing file as a do-nothing condition.
 		 */
 		if (dof_stash_write_file(perpid_dir, "exec-mapping", exec_mapping,
-					 strlen(exec_mapping), 1) < 0) {
+					 strlen(exec_mapping) + 1, 1) < 0) {
 			free(exec_mapping);
 			goto err_unlink_nomsg;
 		}
@@ -1765,7 +1814,7 @@ read_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
 	      int dummy)
 {
 	int fd;
-	usdt_data_t *dp;
+	usdt_data_t *dp = NULL;
 
 	/*
 	 * If the file does not exist, we assume that we have reached the last
@@ -1786,18 +1835,21 @@ read_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
 	 * to this next pointer and end the block chain.
 	 */
 	if ((dp = malloc(sizeof(usdt_data_t))) == NULL)
-		return -1;
+		goto err;
 
 	dp->size = 0;
 	dp->base = 0;
 	dp->next = NULL;
 
-	if ((dp->buf = read_file(fd, -1, &dp->size)) == NULL) {
-		close(fd);
-		free(dp);
-		return -1;
+	if ((dp->buf = read_file(fd, -1, &dp->size)) == NULL)
+		goto err;
+	if (dp->size < sizeof(size_t)) {
+		free(dp->buf);
+		goto err;
 	}
 
+	close(fd);
+
 	/*
 	 * Raw data blocks are written as a base address (size_t) followed by
 	 * the actual data.  Set dp->base from the data just read, and adjust
@@ -1810,6 +1862,11 @@ read_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
 
 	((usdt_data_t *)data)->next = dp;
 	return 1;
+
+err:
+	close(fd);
+	free(dp);
+	return -1;
 }
 
 /*
@@ -1930,7 +1987,7 @@ reparse_dof(int out, int in,
 			 */
 			if (!force) {
 				if ((fd = openat(mapping_fd, "parsed/version",
-						 O_RDONLY | O_CLOEXEC)) == 0) {
+						 O_RDONLY | O_CLOEXEC)) >= 0) {
 					uint64_t *parsed_version;
 
 					parsed_version = read_file(fd, sizeof(uint64_t),
@@ -1940,6 +1997,7 @@ reparse_dof(int out, int in,
 					if (parsed_version != NULL &&
 					    *parsed_version == DOF_PARSED_VERSION) {
 						fuse_log(FUSE_LOG_DEBUG, "No need to reparse\n");
+						close(mapping_fd);
 						continue;
 					}
 
@@ -1957,8 +2015,7 @@ reparse_dof(int out, int in,
 			}
 
 			if (split_dof_name(mapping_ent->d_name, &dev, &ino) < 0) {
-				fuse_log(FUSE_LOG_ERR, "when reparsing DOF for PID %s, cannot derive dev/ino from %s: ignored\n",
-					 pid_ent->d_name, mapping_ent->d_name);
+				close(mapping_fd);
 				continue;
 			}
 
-- 
2.47.3

