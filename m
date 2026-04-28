Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76E12F7462
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777403134; cv=fail; b=G4Q/Wtc6drm2YwDv1IdeOuAfDmUBAt/m8y+Us1r61eP7osO0NlEyVSPDYi8CCffLlmUszCaxU3ymLJUaxtcb2KislJLGnINUdv5ni/DxWjl64hNb1QrEdwARuLsLkFJIaXqWXMrRh6qZN7YQ4AQzCgZ9AWluWdCT3mAr2+OoVDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777403134; c=relaxed/simple;
	bh=GdUBlMRqIisr3Oz0CH0ArvDI37GrYHkAuW2jM9XcBOU=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=ZIGbUkchpu+UFvP744KIAkXWm1W4eeXoNfB+zxafTPvYvVY43UuQkq/xrn3Cr+pzHdQR88sRTIV4DWHx+9OjrRQSq6NosnVhl6F597am6D5I9RUbQhcOVNsbZ1UpDhFoZ8Tg7gD5EVBcUjaErVcWXUw9AtiHssMdUU0YhASTKUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J+XKnSnZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EiWlx9R9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J+XKnSnZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EiWlx9R9"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SGYpNj720929
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=wqYprJuUPD1VxD94AnNTqgnW7zbgAv0JqQu4gD1My9s=; b=
	J+XKnSnZQrDbgs/aEEls6cIB17MHvuhS5r9FlIfuLV6h4nUBPPGMvSxnlV5Gppou
	MPaUmaulaSCVwKTGM1a/A563lQYpSQ2LaqKBkCp4Wdv9t5VDAhMYAia57sWw1mlC
	xoxlHCDVIDYybqy+SbnvtZ6vafFhVjsf0TpIe8sLj37C7y/4cMVIGxixsAWr+lBn
	XMEdTaEoEIN0spQ0NfNll8uaIkMzer8917FDzkM4NeFbzhZaJwo5XJADxfRQDkDU
	3UDzKmee+hYYwsIPTsB+8O/N+Tm1/438vjlyGE19Hf8yeTZeuGDaI3qdR+/eXG60
	qrO4HjS10OAzgd62xjziyw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4drp5t0m3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63SJ1OuZ034166
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:30 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4drm2cg06q-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:05:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLjoSlX0Vcvb38f4CYaNgC4QoP7bhu3BVOadpwvXT5LUFzYxR7423JwVnP83tTPZpuhSO1uaOR3VOkeiEITtk/6jLCE8pv/y3bbx0ijWpjHK1A16rzZ2LxF8zY3isQeGxrQyS71aXzwX3g9bJLZTxfzlkycJ/gfl0dfKzjwCvimXzm724i+tYgZhFDyG6t7isY+CymS4NBxSedjuLX8y+b3gUltrnYAA+IWF9yvztUVPZOl2auovCjo6QvYq3d+W2ri1HMBUBcg/OWqndo8A+F7S107zdJc/MUqHSsi/arknuMqUBCLkc3O2EKkpMICJpULnLFh14Zt7iTQs8EYTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqYprJuUPD1VxD94AnNTqgnW7zbgAv0JqQu4gD1My9s=;
 b=g5+jcLkVAQw3FPvcq1oOGC8QrNH5ucY6iVwDE579lNRyw5kKShm7p6z+pABDXlSlbZ4/UIUKi+YTMc1W6opjyGISl4K3t+kLZllT5oox/ltLpcSzBuzxgrw+77eEUtyAFOogp7LCPngyjZZc/q+Ww6jCt5IVhOWiUk+X+XPWx9Nw+R5e7h2L3lOGsNX3ZX7pSrNjGlQIk5BnG8Nr8W04rZ/9MEhacD3SW65eoNsBnm0yC0yjXEwx5qNZ0f4mBjwNye5GrKfrAm+Pno/E8YR8Wr8ENjBB5Q+2G+52dwymDTye5Rm/7dA5aBtEst7HG3MDr4EjEhYE8XVLYBvSQ3FX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqYprJuUPD1VxD94AnNTqgnW7zbgAv0JqQu4gD1My9s=;
 b=EiWlx9R9PMAwmx09gzU12OBNPFoKKNlFqY4vuIkABRiAHFqF+ZXj60c2nl00zV6YEzYD0UAyWbxUQ2XxQvQ5fJpq/C33GxezpG5lErj15vxo0uRubkuN7VUO3Qpf/XTYyP2+E3kQHrMoS1ubPWlhoXPumhO5XjKxAiC4el53THw=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 19:05:28 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9846.028; Tue, 28 Apr 2026
 19:05:28 +0000
Date: Tue, 28 Apr 2026 19:05:29 +0000
Message-ID: <ba06591b830e45ae2b15da9533867812@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/6] uprobe: fix memory leak
Content-Type: text/plain
X-ClientProxiedBy: DS7PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:5:3af::8) To IA0PR10MB7325.namprd10.prod.outlook.com
 (2603:10b6:208:407::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|CH0PR10MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: b8cd82c6-511c-4cde-5eec-08dea5591c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lfaTl5LrEaG/zM3uw2ihXGuU5eXC9eqF/O5PD9X/pZicPHmVkF7qO69FB4GNGw+k12YQQg9er1v86Z7i9XNcu+9el61vsoy/Lb82oevk3f9a2K7E/Z42HflfeFAZBtdqPG7Qg2yVUO9EdqI5iqR4MKm+h02sRSwhlzPJWQ6RJ/wSPB0Hc9EiEgPQNqpWVYYYxiWfao0ZXQUiyIDSFYqY6py7U6Rl2SFbBhjrw9Bs0qzk3hS3H53naWYU9EZJfPfaxn0kMMHMtjU6IFVi8DTuIjY9VMyoFAfbaBN8gPS+HWdWvTaeeLSr/jcKcwgXVhQ5q9LnxpcQWTIOxZmu9ssYwVdpUaS5ysEyT0t7CI7+HWOMMMmFBQNXCNeYeWgjDWNvhDaKUBc5sGBWZQQFf7OYwY4gCbzdqmSFBNi2/wKtt5Q6iCzvK4B8eaJ/UwdFBWALqULFCG8UNq3Rw0NdEZ4yT2cUn+0J84+KvcvFIhDgEBIGNhGK3K9QrU8tcpkCz/Vc9jxfWmeGV9k18I2KE29TM7iC21xLY1ROFddjLP37jaDXJVhNQ331CrsbMwr057hnckdlj9SErzkyYF28e2ZVBO0IZu4J5UqH+8LYLhmIglNAYgKkrwD5q8T/BXSe43zygggakvuOxwlRvQQ16V60YD67MHeCSpzZWNeag65mEKFfh+DCydNh6YeYYZasI9Tfu9qM5FUwIhYu6LAifg9bY8iTpwHjN2CYX4KMySYg4tE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kds4oTaJ7JS6zjA70mcv539UvU/2I7ba+phzcSFpCIY6wOqUy8H+MvBW4Tq9?=
 =?us-ascii?Q?13pu8xS5G1VYp5rnCvDuMWvzL9amo1ooXdBXn+LLx9AAxj3xIfbhtAZvzeOG?=
 =?us-ascii?Q?p2Pv6gBi6ByGPQDGDZtTnpU9CEORX0FRxHTGLDwYyTgmVzaOWac0+AVxImOm?=
 =?us-ascii?Q?ZdLLeJwKJn6VXWDh+r0PXWgQIGl2dyDNQsCqp0EJ2LMatx5dhK7SJ5MJUMBy?=
 =?us-ascii?Q?h726Z31QgIYCgLlb403YBSSsd9EoeU47rx4hjRRODaOw6LooVM9XA/xfFMVe?=
 =?us-ascii?Q?QqO32WEIOP+7zJBvVV3o8yHSimTIMp4WzTNoU+7XbjDls3+iU7jmWmaPo4Fr?=
 =?us-ascii?Q?WxCScgFHTf5Tkxl/Ms4DV7H3Lt2L2RfRiFlJR7VIddJ3mghYPtqRJP9fkHwY?=
 =?us-ascii?Q?27AR2P+nbHt20lYebWSJ9cJirOZqAFmiach2lrVo0/NAg9NoCT4/O9YNbid4?=
 =?us-ascii?Q?mH+KZAUekbthIHNgaPPPP6+Kd/mpyJiVE4okeud4VAlLPVgAfuXu8/c1jaP5?=
 =?us-ascii?Q?rFDuht2f2rQrMK6bWucwctyjcwLQVNpSdBDvZFcHyK3aLS4hWjXZxaXFlEgx?=
 =?us-ascii?Q?HvQUY8DwLSKEcd/1jiSevzfV8QPPwgdkYnUOqee+OMbzeX2xuJt7Tw/fDWV0?=
 =?us-ascii?Q?haK5Xl9Slvjke7HsNL2pVUy8pJ/zD/MM0BV0mKRFqC64VJlzyHi120jQHxsB?=
 =?us-ascii?Q?dsKL5UsYUP/SY5/y5/idJZPmPzsliP1C7p+oi/uarWGJdmNj8l2QZf+sHkSg?=
 =?us-ascii?Q?7ZTUeTlXpkbaNfZhZBXY8mrzuZeCv5cB5hOHvHzMCZmL72SQX+E2JSjRh7AD?=
 =?us-ascii?Q?DR9umNRxJEJEUq0HNNqX5sUXamN+umJqor/oyZhUc/bhn0efsssoLE0VZRvq?=
 =?us-ascii?Q?YlQn3mgXkQqWyp3tWGrrHjfb8vf6l3nUYinY0GpAnVsxq03FuTTR0NCIsdfe?=
 =?us-ascii?Q?SCMVwbjBnECVnMHmzlsqLUY18SdoemAFwdD9yfv7o0K/chflA8dVVbXEANcu?=
 =?us-ascii?Q?z+9st6LDopslaYtg8xbJMKIgSbYvy0j7HprFoB1iCbGE8ABaW2nxNUojler9?=
 =?us-ascii?Q?STDclz0Ja2DnwJov8V5YG/cSNXI1wmWw6JJnTSFjPTDlNaxOtFamSb8n4xoi?=
 =?us-ascii?Q?eWq9ZevNvVhwIUeu8IqHcjWJbD4IvT71ff98N5KpRyJL5rmKCYv5sHmyQYN0?=
 =?us-ascii?Q?hXvriYnyATFUPhb6DkOS1Y5yUwNcfgskgMRb6UMWdu7qs8+txAOxpydj2u6A?=
 =?us-ascii?Q?961pt+yhVPRxCepR/YlSzS7jxL0HYwQTuCe+iDOOIOOLdNIh7BgsGRDPdqVy?=
 =?us-ascii?Q?uPwHEQ3zo3SQ+jfUTwvSZ7NlbBCHv11F3T2MHFqU8QtBP7ctJVA65wZqnMSW?=
 =?us-ascii?Q?Ska1jNAbF8eCPQZwHphg1I2AUuIvBznzlBB4JySdi1N8DdxXgyQD7nst5LMU?=
 =?us-ascii?Q?MEl9QnC0GOORcsrEfEjLeMOZhZiD30KESNUYbh/37lw4msOL/Ags41HUkgB0?=
 =?us-ascii?Q?vDR2AVObnLNnjEiNQMf9D5APgkog0Cg/R7DDhgycAHW7ShrnvjNkNznvXdhY?=
 =?us-ascii?Q?hlGnpm4DeGkM9AW1rws8cHs/FI8/PcSJiepAHjwfrocPRqCj0FBjMW8FBcjV?=
 =?us-ascii?Q?++Xn/Bpj5CPqM+GuwXu68Bqz9oxUrGirq0ACJ+vsKd9V3IgwvdW/xFI6Ytl1?=
 =?us-ascii?Q?rl1vz/QmwL4zNPxlODI9HXFaKrBF5v7vz1bupFKRO4Lhz5hSXbL6hySYoOTp?=
 =?us-ascii?Q?DDNuSwMKmc5mqotsFRFx5ReU9yZf6Ts=3D?=
X-Exchange-RoutingPolicyChecked:
	R1DfUUJpxwO/qRH2+jpsmKG6OjmR7FiYFz1nm+qoVicIaKhhLSmpzj/yn4dweFdVFHzWygPgyiT7+UJ4fvku7eUtqoUwcuPSCQhO4amdsXlg3O7SZ0HeAR+AVgRaJ65sYo2rGZWWDLzHSkyTlhAOYv3z4ifj1y31I79ZnXJ3kS+wqyrqJvi2LBbmaS5nYxKIslIQc+ZezNdkcfu+Yg7oFhkLAto2D+wfXz6Tn1UWGCrbR3/cMp2Gph10aomhXnotsCDl4relqY+ehRqfAzRd5A/KBj2rwNJHx8+MRHMogq0Tedn4MaU+iKa3YPvuJzOvAFiKgZR11/+ac05IextPpg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yCskua6v4lrP9K+2TEc7IvJRYQEdIn6fySZxVIv76kx60vp/Da32xkuGW0fax49ttgfMa0QPPZtpw9/FArs4CmHS8sb18B4wrYK/HJk0s7irEmCUom801yDor5ZJA1AR7soeDahZjPWfSi9d0ZGXbiIq85tg+6DzacK82cG/7ActtPjvbpBz2SL6/pyH/aaskQDDigIV1/LMvv2WErEwSqZcNQ9xdxFEo1KELTbhuHuJ48G2wL9ya+TiDgL+W4jexKFCwaKFojsfqI9caxvbTm1c48t9Te3pPucd3ZPkwvte2dj0+IGrYMRi4eBc9t1X4zYd+GiD9/peOsNYm/K9/F/ZZuthVpmnFHhXSvSU+fGwsLz3/v/im9hsoq4iRDzX488CNZZfbQzZBwwh8Ez5WKnANtBQDJCwyHlBQSAUX7oiR/M2MY01ETTcG3RSGdLQ387mRqsWW7CXDCG+glDRUk6loDL1dlF/VIYuLnF0i1o28lzfQ8V9mk6Vy3z7dEIE4vEk/gZFzXT6GcM7aPG6C4zgG2q8FEptVCTNd/SqdTTHinSEnMeDz/Wysf90dEhKC54pK1pGK52FAfkrZBJffgGvGTwULVJKA98r+P/ttKk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cd82c6-511c-4cde-5eec-08dea5591c89
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 19:05:28.3459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tfcIxJLLc+T735t1AUN6eZIF3XA3sy06Z/FGVvUkeVOOCD/W6KCtxyTmZLRauUZkg1yrXNrnZJ/Q6YO/XthiNvZA6Zl1r4z5gQXE/jYy7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2604200000 definitions=main-2604280185
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE4NSBTYWx0ZWRfX4inpuovoh+yV
 kpeU1aqSED2F97VbZjTOl5ngFE8+j5kRFJndaBryDN/gnBDNbB2MFkeHjRNI4Uu0mJQLrpJZQhA
 Mp05Lv3HHcTkW2xHcmzl5762Jh6+UeSzE2dawImktSg6LpvOfmknHbCT8uN6tIT+eQOjm2gWEKD
 Ye/mlpmIfQRLu9Olx5iHcKPvMMwDW4kSsBm2lLXAabglZYxfRp0Y7C3b6eKiHamk5pfpcxiv3rT
 NwZnDLDWcGEmVSd5tRJWuONBSL6rw0WXyJYQHgIOdxdBRhZ5p03Na2p27S7rNxWKR7HoVbjCPii
 UlIFFIZsY4xUo7/9KmvNmqWCUBcgwP7XMT7F0MWfAXu2RurPRuIJyAYm92ISTDCrRxp4bE4QWUj
 2MIxG5V95DJloBWOz8855ZjGupkGfIwle1AELwJvS9jxx459L0d/Bu8xbIL6mdnuHuKCxsyGM+7
 xSV7zQaE5HH7Al4JPCVBGMlNU41AlhaHkqVXIGNQ=
X-Proofpoint-ORIG-GUID: 3_d6BcMA_Ux3dJMuG-oV2nk2ve9KVUfF
X-Proofpoint-GUID: 3_d6BcMA_Ux3dJMuG-oV2nk2ve9KVUfF
X-Authority-Analysis: v=2.4 cv=E7v9Y6dl c=1 sm=1 tr=0 ts=69f104fc b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=khPwjrE9d3kFVEkFrYAA:9 cc=ntf
 awl=host:12310

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e575b0724..0e0f6a560 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -434,6 +434,7 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 {
 	free_probe_list(dtp, datap);
+	dt_free(dtp, datap);
 }
 
 static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
@@ -1701,8 +1702,14 @@ oom:
 	return dt_set_errno(dtp, EDT_NOMEM);
 }
 
-/* Clean up the private provider data. */
-static void destroy(dtrace_hdl_t *dtp, void *arg)
+/* Clean up the private uproobe provider data. */
+static void destroy_uprobe(dtrace_hdl_t *dtp, void *arg)
+{
+	dt_free(dtp, arg);
+}
+
+/* Clean up the private USDT provider data. */
+static void destroy_usdt(dtrace_hdl_t *dtp, void *arg)
 {
 	dt_htab_destroy((dt_htab_t *)arg);
 }
@@ -1720,6 +1727,7 @@ dt_provimpl_t	dt_uprobe = {
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 	.add_probe	= &add_probe_uprobe,
+	.destroy	= &destroy_uprobe,
 };
 
 /*
@@ -1746,7 +1754,7 @@ dt_provimpl_t	dt_usdt = {
 	.probe_destroy	= &probe_destroy,
 	.discover	= &discover,
 	.add_probe	= &add_probe_usdt,
-	.destroy	= &destroy,
+	.destroy	= &destroy_usdt,
 };
 
 /*
-- 
2.53.0

