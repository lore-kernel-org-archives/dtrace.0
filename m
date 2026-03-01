Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C0B31B10B
	for <dtrace@lists.linux.dev>; Sun,  1 Mar 2026 22:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772404792; cv=fail; b=HmSpePs/4wgEbC8GsAHvzmHXTXUIF36J83krFX+5ifkeIlfHmbNFdnVfBcehOybjBPYVzPsS5+VWeQT45qro9qrZ1uJaAh08peqMigC60u7GPvXRui2wiskxqZggUJzAk//b2UM+AU8CyeNQtKa8I69cB1moNhejGgk3/j/d6Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772404792; c=relaxed/simple;
	bh=A3Wvu8pVG0ZrvUZUXGfnSHCHb3Hr/ASsUbp75lKOG/w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hkc4OWtIKcMu8NWiDC4/dLR+/NVMcMOaeoYxHD4a+FUOjUcHR9zXMLNr7C/TjryN3dybsHuxh9SZtQhmURnv+B5kNfWL7ps+W63j/M61eACGAT2+G5fV5jfnDceKQL1hqtyLHHbijENA+deDuJS0JvhetiqmDSc9lkHVLE10uCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WQ48YlbL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fIzT22lo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WQ48YlbL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fIzT22lo"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621JeKLZ434298
	for <dtrace@lists.linux.dev>; Sun, 1 Mar 2026 22:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=bmVf5c0pXDfjH7Jhg8
	jpd8grS5odMzB2WM2G30guqu8=; b=WQ48YlbL/4QPWI4q1o3L0QAaIj81tupkIE
	nfQQM0HndMJaHANQ0Lo+KhQxnDswm+pj9LMiaAaZ7Zzyojt2U5tQoTQlOs8ynZ3t
	p4j7vYGUgiaXwix5UFQgPkROnTqMHkAQYAdE4MoI04M6PrKGsIWWJD5Z0XF44F99
	ww67VTcW28Ei2dCkvChUZTpVNOUMrii4ytASqnbmCdsNM8VbhjJuRkffXx0ikfy9
	6p87jSz6RYTanMFoBCXUyziaUoQN32Rl3yoRQ7l2PhCofgg5SeoIUmk51VY8Q9c2
	aMkSE7os/D49XXIBscBkJ9Kb7q32ooEySvfY78EDnOOEQjEMabyQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cksh8s9da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 01 Mar 2026 22:39:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 621ICwS4029786
	for <dtrace@lists.linux.dev>; Sun, 1 Mar 2026 22:39:48 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpt87uru-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 01 Mar 2026 22:39:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WN+M4Tn/mPM20RT5PGS8LEQDkx7fLtwWtyu7fbRT6kNjdRwFSzi+fXLU4mT1obtQH88tIGh/8Q1EsHh8RnJLLWZu6+4lEyfXzhV3aoIGXVEGREPxBV4/qfIU0raLxYu+v+T9R2DyNjZa+inxNUAr+LpggDkOWpo0wHziQg+KEvxwHtJYekDSlgWKXo6HNxt1uBLIA6/H5bfrgRbjY0Xh1lrhobIf/atyKNrQNQfnVpZAYC68Jds/Zxwb9s9HKgrlWFUL2EPLH+d8ahxkGVhtApmQLcT+OY3aYW1KLvkzcBDIc+Va8vT23ynFZ63ASkCj2JKOKicby6uQFP8UHDBrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmVf5c0pXDfjH7Jhg8jpd8grS5odMzB2WM2G30guqu8=;
 b=yVx0rUYFSjCTYh2tt/E+uY0zJS3EF+PTfjnmyhesb/MxrVc+f88wnm5PZjnGDhz1bli8rbbb7Gtz8UrEijJ6MMPHk4JFE/lde4Yq4PnuK2f6xFv6mRTU2Qd5g7f4tICxrcaQa2bfIzB+fMpEw6/F0wy7cUU/yfVbz54eBmgdyk6B6caWv+3VVNtrB9f0n1DEW7HlpbUQV1PJIG1vkwlWWaR1B4AurW6Qd/aqa+5E0gyPEgLXHQ+zgoV2Rg/qN1ALGGO9cb0TCAsrZwN9P9IHCJaClnYJQbruigqfP47pM3fl97yGBMF1uzUTCY9a5w5VlBF72hwsqvOkaLMReqirPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmVf5c0pXDfjH7Jhg8jpd8grS5odMzB2WM2G30guqu8=;
 b=fIzT22loTWcGEAE7Xv09V+cOA/fN9ENfQehlVuiKBI8TZf99Cq5WIuV10ujmuOo8Gav8158Tl0wvjclb3jXyp/4AeYSPt0EnCRI/6JTOr0UlSDk95n2S9JxuY8JGqy7YfuApFVxdkDKrX1WtSg/Jl7UhOBW4cEk9tQ1KYc6dYm0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB5099.namprd10.prod.outlook.com (2603:10b6:610:ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Sun, 1 Mar
 2026 22:39:46 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 22:39:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] test: Adjust sync timing
Date: Sun,  1 Mar 2026 17:39:43 -0500
Message-Id: <20260301223943.20324-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20260301223943.20324-1-eugene.loh@oracle.com>
References: <20260301223943.20324-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0080.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf379d7-6907-4812-f425-08de77e370b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	TpJKFmvpE8vXLC/w0l/0GRdhZnK/+IoS+a4GusYQXvrYdDg7a/K641sFefqGTPMTiqp9tmdi0cQS5AeOUUo72Ee/ohwhEJS3MtSPIQ3v6U8IWBfjNFN5CTEszg3Y3T55WxUj5aV8q76wq6tBve0rDBb1HoxI3xk7JW8qgtQIyz3q7emHNLY6nh/ANBq5xqlkCi3mhQzWH2fZBBz9oAp0wolgqV1QMMLz9ScF1UF7rdmEPLl1YxmWkz1RPWT/t0cDEKbSI33PhyvxqJUitdNCVEkJhYJncIHHJkpJvsdbXXpp2RISnPtbBMeDy2KjySKfAJmtnEL2OkE/YUVqHvcJGOidJ55D69Kxk6CCzJYoIxIy8n9mYLdq73mB5HOHH2T5FIDmjwuPQZsHsUL+MFRjO0VKVb8XE3d0BcXiacALEYCdUl6eN7v8cEaqROTkFnybJ/uXuMqJgz9edntYicHrEBXJeECC1c7r88+MmFKELXbzyVBDusXbYFYwnB7iqyEOoF+eeTxs3t2/0VmOEyMvcNG2BS1iTDn8qpygKuQgVf0Fj0dheaYASFRKhT49mAWKJ+pS95ui0+1KvieCbMlWm3PuHbeiTxC/T2WCHsP3bJ3/ICM8PdHZ93dCxLhNeKBp0jzIMHvid+9JOpVnZ2yo7+Xn9ceh4PG1KYNBUveWAa8fzEHkMeadYATKmjH3tK7B2MmcHwKMUFTgoNmdFWYDNU8Nx2gIz58kIweeG4lo0GVLfMmDjyY8AwWEHOCVd5lC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zr95gRmwYCaz1aSo0dscVYjDyzygPnaghFOPh1SlKjSUUbrHBLG7jQ1dlJB1?=
 =?us-ascii?Q?yH4MWhB1uzpgU1If34GAD+agHCa7xo8UvBzIMiOlfCxXgBxB6O3PLmGEfA/v?=
 =?us-ascii?Q?cbCUGw3tzTev31MY5WiEgBanKa13tBiJe0kzbKoaoxkdwZKk2EwXAUgr9rn6?=
 =?us-ascii?Q?vdfrI1FQANUUE7iLcuU/zDbSP7trY0JSgtyd3AUHKVF57eYaV1Aj61xC1UMO?=
 =?us-ascii?Q?45D9ybMIS0injTf0pjmKjnegR4dV+FMGE6qMn/BQl4GU2i4wny0sff+vcU0d?=
 =?us-ascii?Q?DNnCyoyOyu85/I2muwNzVr5gVjcCLgZGue1U70dpGier5er4wkHqZRpdUgLs?=
 =?us-ascii?Q?tmCE0gLTqH18mPfMpHyaMwAfNpBDhZ7Du1yCZnixUmBkelprfC4qEhhXOGg8?=
 =?us-ascii?Q?ssf3NHsC7oLKREJm460738fChQYCAIkbzpiAK70O4V+1eSaaWjZZjbqbL5Xd?=
 =?us-ascii?Q?UyPSBUcWT40FI7HZwkDmvJnzqpWHaE/iq8oefqXrKTwnUWptY6ejQhFtLNrq?=
 =?us-ascii?Q?88AsTxPce6KHN6hATfYE7m1brhTZB9HfFOk/IMwh30nCQ7J0yEkr1CGOudCD?=
 =?us-ascii?Q?nYzZrpzplo28Td2/89HQ3AIbZ79e3p/usux1Ekk1I2+MRi8mF4vJ2bzOHQkk?=
 =?us-ascii?Q?vy15kpuwa2lXB55IGPrtbeHdZM5DFc/Szsvcu2Hr6CduHT/StK7POb8YCI/g?=
 =?us-ascii?Q?tRddG8LSHeAwY5QuiZ/HBiLPNPo8VcN8FFEtN5gjqWWlAB/zaLcEF84Er9xn?=
 =?us-ascii?Q?twQtkfRgKuftqvzN0sVcbROyu9upU4jJIoDIUUH17fvdqFVPYHpIobXOM1H8?=
 =?us-ascii?Q?wvnMnM2CIk3y63Qhd5ictu1jP8uHPBMJZrGPpVFeYY8nmQq3JvtJ/jb3S674?=
 =?us-ascii?Q?GOilaHHjWo9jPnIrxzSlYpIPnJLNU7pP6Sz6t4+xtTMJP7H+x2ZaeodMU75k?=
 =?us-ascii?Q?Jc1cQbzHsV7w2b1lhZG8MaI7UZ8erd8lQpsiiggr6A5QnDbV3GpfOckys9PJ?=
 =?us-ascii?Q?lIaaItYf2QfYC78WJm0ts5apTr2N5fLWwcKOnOWWlA2BpHcapAZf1TBkumXM?=
 =?us-ascii?Q?xX2MJlajr3mBdlRYEnBQGYWPk9FXd4TJN4ZeBZ2iq5Dad6LPWVQPu2lYFKB7?=
 =?us-ascii?Q?h/XUleP+m4Msejs5VjHLJf0qo6tlRiQfOPXoDg0lYd9lDCFD2cBQ7n1eSWBT?=
 =?us-ascii?Q?p/rHdaq8PVY7nic/k1pIqALuSgNY0Z+j8qQLbM8TIDGMudy7TDGyeU+ZHZla?=
 =?us-ascii?Q?JMEf0AJ9hhuBFJx8tYXUV+c41c5zERaUl3pxdc40DV/pujvSssu78ueafHLS?=
 =?us-ascii?Q?6zgXPSkDIbtj99FFXiXk16ej4eGvsVzKkZVn+PVlTgUWLN35SEOTRCqNbHEC?=
 =?us-ascii?Q?YrMYG51c1XarxJXvQDCfu1Yn0ZClcE8OsOfuoh95gT4sVdxAiSr74yWXT1mY?=
 =?us-ascii?Q?D/ql+QReDBHeja3vjlqxDy+dwbZzT2H4Q1kQC63gr1GtZk586HqNrvheAjI3?=
 =?us-ascii?Q?IqSGIg9T18GenwNmWZJgbA6/Z6rQLVWcHHCF6xRWCObW7u2O1WMC057DVnJU?=
 =?us-ascii?Q?lpHgVUFcjvEojT0fZsxHz6Sc639H9M8cUhmKFmI6wTlxPPKxzA8V6kLTrYo/?=
 =?us-ascii?Q?hokX+/yPFWdgh/TZDn6KjBDMlZF3OgvSY0BySeag+Wto0tCOYCjewST5bd8j?=
 =?us-ascii?Q?d6Sp7lO3J8m3gl4lkOmm+J9mC9OzAhPryPGSsWZs2eJRqLBM+PBZhCih/oFG?=
 =?us-ascii?Q?YGG0mrohYw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AEEnzUSmg0sOxofG7vi+cnQJUpkRuNUfpqx/oVmckJFzwMTMtQ1HvLLUpkEZZVyUE4N7CrslM+8mWmUhJxRunEQxlLwLup6soNDlrfMklEJLzFMghCXNPSSS3FBHdC8Gz1WSlyzJjgWk3GwFjmKnbgn7h4D2dk/5YtdDsAqJ1l536DHY1HbZVla6RSzq+SAptNnfz9o2Iq2OlbBL2vj5ORo2maS0vVRyN3Bbf2Eqtxnn8xMsURNQujJbALZ3AQ7jYkk5qD0UNlrr0Zp//gesXTFbMCA4kQE8ZXbRoGDy1oskbcS2L+CIJPKz4uDXYP3tTndHcEyUrmhYD95BnvMjceUTYLvMnEcwYj+Uyjj1ZSX+IKFofm6tdWU762AkPOZoAxPaKUtHLocq/T+XuDbLLuTm0gsumhd2LyDmgGolXq51VVKKmJOu/2t1zHvGA4RvV2cVnZXlk5yHUIA6tkqtN6btWli922rA8SI3ksWF4LZzXPYIJEJ2edjEBK9OQ8QrgEVKp2gXqKfy5NljvLOpDtgNRdEwPly8cKfA8lWR/nLBxt14o8I0Jaew7dAGZ3V8hjChPFYl8YCIm4weqcxml1VZL73NMQuz/dU4kxOWQFo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf379d7-6907-4812-f425-08de77e370b3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 22:39:46.7255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJB0FBWcQqzSgFniCbLwO0caTsRCSMblEI37qPAnh7Ry2OzrVtrI/bWylDcHoaghBz8oBm1x8qCMEe2Nmq9qug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603010207
X-Proofpoint-ORIG-GUID: IMgKSxsV1ijd7Bx5bGn8tkLpssPLLGaj
X-Authority-Analysis: v=2.4 cv=D8VK6/Rj c=1 sm=1 tr=0 ts=69a4c035 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=32tqT44pmHxt8s1oKfkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDIwOCBTYWx0ZWRfXx5Zr39sPUBD7
 2Sajvl2gZvxnzFf4bZWqzEEPCvnZMpxkwGCrHujBAmI59InMvz4FvybD9Nn8W8eTFEG79ft0xSL
 6zn2yT3y/ncUK1sH4xCXc449sk3JXEBSFzWUZqGxTf+XsKNRN520hRZ/kQ+O+nYbJnJyijqtfsX
 9107anesuc5Z/UR2UuD87hug+OtNp1MqqJ31XRKyzjm/WLyd+PSDylTQYw2WUxv/ge/E5TARPCF
 xulSoEYL33mE7AfxHMWWAdmfZAJKLwXnKACqoXebpkYRH4bxbkJyOBT8LIW30HAho6qHAxyrRHd
 kWAiGPUYvtTDM7AuYpTQ0VHBgMj00nb7xLOvZ14SO/A1R1ILBgeRK5yAAl49dVw3f3XsA8asAgr
 Abmk4fBeur5MhwffeNK5mwW9+eSR1CtCz2peibPzOnqW75E5lnDBiW2bmxdEYVsW22M+Uzxx7mf
 LiKl93Sltng3o+gRBSA==
X-Proofpoint-GUID: IMgKSxsV1ijd7Bx5bGn8tkLpssPLLGaj

From: Eugene Loh <eugene.loh@oracle.com>

The nusdtprobes test was failing rather consistently on systems with
very large CPU counts.

The main problem was that dtrace programs with aggregations take a long
time to start up on such systems.  In particular, gmap_create_aggs()
tries to create an aggs_$cpu BPF map for each CPU, spending (in
measurements on one system) about 0.004 sec for each dt_bpf_map_create()
and 0.011 sec for each dt_bpf_map_update().  When there are hundreds of
CPUs, the time to start the job up increases by, for example, 5-6
seconds.  The test waits for dtrace to start up by checking "-e" on the
output file, but the aggs_$cpu delay occurs after the file is created.

Add a BEGIN clause to write to the output file.  Replace the "-e" test
with "-s".

The test has a sleep before starting a team of processes.  There is
perhaps no reason for this wait.  Nonetheless, we leave that sleep,
simply reducing the time to 1 second.

There is also a delay between launching processes and tracing them:

  x dtprobed sees newly launched processes rather quickly
  x dtrace tries discovery 1x/second
  x discovery is rather fast
  x starting a newly discovered probe is ~ 0.011sec (on one system)

For 40 probes, that last step is about 0.5 sec, but the total "sleep 3"
in the test before killing the new processes is apparently sufficient.

Make the corresponding "-e" to "-s" change in similar tests, even if
they have not shown the failure pattern.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.defer-Z-basic.sh | 10 +++++++---
 test/unittest/usdt/tst.defer-Z.sh       | 10 +++++++---
 test/unittest/usdt/tst.defer.sh         | 10 +++++++---
 test/unittest/usdt/tst.nusdtprobes.sh   | 10 +++++++---
 4 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/test/unittest/usdt/tst.defer-Z-basic.sh b/test/unittest/usdt/tst.defer-Z-basic.sh
index 61adb4601..fad91e5fe 100755
--- a/test/unittest/usdt/tst.defer-Z-basic.sh
+++ b/test/unittest/usdt/tst.defer-Z-basic.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2025, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -22,6 +22,10 @@ cp $trigger main
 
 # Start dtrace.
 $dtrace $dt_flags -Zq -o dtrace.out -n '
+BEGIN
+{
+	printf("BEGIN\n");
+}
 testprov*:::foo,
 testprov*:::bar
 {
@@ -33,7 +37,7 @@ dtpid=$!
 iter=$((timeout / 2))
 while [ $iter -gt 0 ]; do
 	sleep 1
-	if [ -e dtrace.out ]; then
+	if [ -s dtrace.out ]; then
 		break
 	fi
 	iter=$((iter - 1))
@@ -79,7 +83,7 @@ if ! diff -q main.out.post main.out.expected; then
 fi
 
 # Regularize the DTrace output, and check it.
-awk 'NF > 0 { map[$2 " " $1]++; }
+awk 'NF > 1 { map[$2 " " $1]++; }
      END { for (i in map) printf "%s %d\n", i, map[i]; }' dtrace.out > dtrace.out.post
 
 echo "$tpid main:bar 10" > dtrace.out.expected
diff --git a/test/unittest/usdt/tst.defer-Z.sh b/test/unittest/usdt/tst.defer-Z.sh
index ff2c5cbf1..db49cd583 100755
--- a/test/unittest/usdt/tst.defer-Z.sh
+++ b/test/unittest/usdt/tst.defer-Z.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -29,6 +29,10 @@ cp $trigger main
 # Start dtrace.
 
 $dtrace $dt_flags -Zwq -o dtrace.out -n '
+BEGIN
+{
+	printf("BEGIN\n");
+}
 testprov*:::foo
 {
 	raise(SIGUSR1);
@@ -51,7 +55,7 @@ dtpid=$!
 iter=$((timeout / 2))
 while [ $iter -gt 0 ]; do
 	sleep 1
-	if [ -e dtrace.out ]; then
+	if [ -s dtrace.out ]; then
 		break
 	fi
 	iter=$((iter - 1))
@@ -128,7 +132,7 @@ done
 # Check the dtrace output.
 
 #     regularize the dtrace output
-awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
+awk 'NF == 3 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
 
 #     determine what to expect
 
diff --git a/test/unittest/usdt/tst.defer.sh b/test/unittest/usdt/tst.defer.sh
index 073af12d5..a1c29571c 100755
--- a/test/unittest/usdt/tst.defer.sh
+++ b/test/unittest/usdt/tst.defer.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -39,6 +39,10 @@ lastdigit=$((${pids[0]} % 10))
 # Start dtrace.
 
 $dtrace $dt_flags -wq -o dtrace.out -n '
+BEGIN
+{
+	printf("BEGIN\n");
+}
 testprov*:::foo
 {
 	raise(SIGUSR1);
@@ -57,7 +61,7 @@ dtpid=$!
 iter=$((timeout / 2))
 while [ $iter -gt 0 ]; do
 	sleep 1
-	if [ -e dtrace.out ]; then
+	if [ -s dtrace.out ]; then
 		break
 	fi
 	iter=$((iter - 1))
@@ -135,7 +139,7 @@ done
 # Check the dtrace output.
 
 #     regularize the dtrace output
-awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
+awk 'NF == 3 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
 
 #     determine what to expect
 
diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
index 93c56e382..5e3a49724 100755
--- a/test/unittest/usdt/tst.nusdtprobes.sh
+++ b/test/unittest/usdt/tst.nusdtprobes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -100,6 +100,10 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
 
 	rm -f dtrace.out
 	$dtrace $dt_flags $nusdt -Zq -o dtrace.out -n '
+	BEGIN
+	{
+		printf("BEGIN\n");
+	}
 	testprov*:::
 	{
 		@[probeprov, probemod, probefunc, probename] = count();
@@ -111,7 +115,7 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
 	iter=$((timeout / 4))
 	while [ $iter -gt 0 ]; do
 		sleep 1
-		if [ -e dtrace.out ]; then
+		if [ -s dtrace.out ]; then
 			break
 		fi
 		iter=$((iter - 1))
@@ -127,7 +131,7 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
 	rm -f check.txt
 	for (( iteam = 0; iteam < $nteams; iteam++ )); do
 		# Start the team, writing out expected output.
-		sleep 2
+		sleep 1
 		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
 			./main &
 			pids[$immbr]=$!
-- 
2.47.3

