Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8E73ED3CC
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281346; cv=fail; b=GF4brr/1VqT6BATMkCo7o3pYjf3miS2yBR9b+WmF1OibwhE4TDBVe+GWhJeh1FJT9pzZ8rQBjvV8ZXLo8sP/IaPFMRMRhjLfmqx+TN565yNYDS5nA05LoE0WJDSUd/maR18Q8qhaWy0pgALz25BxBI6ZNdb7NSd8nfwHFXXxmno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281346; c=relaxed/simple;
	bh=307rYR4bK/pLEJEyJ4JQRvPxw0nJZaCGn3/noHAa+Gw=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=pFMMTeMqR41dNDejSZKNiqbCsbLDfVWMzWQ4hIyRh1JxA5LDRy0Mc08srZmKMdhEGJIaRWQZslZWhpnFFBrYEyaOS3xl9YJBK6MwV63G3HgSutVXmXwG8bUH08YkP4/8w6brLj2NANAwot7AMbO5IB3i1MWtBk3IOWtOg59KivA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ioI5fpmH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c1JWyX7J; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ioI5fpmH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c1JWyX7J"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C7Ng2d1679653
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=5pPZOy/UjzxfPCDrjmaD3dFV5V4uWcRk7F/iMDuSJoM=; b=
	ioI5fpmHzpXR60imxhfFCxyRGPzNKSE2CZicb10tXGKHz+yCzLM7CH5Cnk3g1LBK
	6UVp69nyJBISZOWUK+HLVAc7SZoXR4QdxfMU8aMgC1RRZnEbTe6JTCziGwE4e9MI
	e9n/vV7+ZqguB+zVOQAmSmZlMiy+FDY05orFtUg7LcX45QqeElmy9iwMxcSA1cHJ
	k/Xb5ReEwiBCvPgXL+rZv07qYOTmOfsBMCeypXrZpM1+nBvMAnU/xann+gBAU/D0
	T3PoKA2hM1bukfZZ2bDfQ2vOPf8KxavInVotKDcPlp4MjoYj0/OVzqAdpOTxVVxe
	JCsBHjLFiLGcG15Cf0ligQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe6wk8qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65CGINqr011786
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:17 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013069.outbound.protection.outlook.com [40.93.196.69])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4erh9wt1yf-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Jun 2026 16:22:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bi1BfUfaMKWeVoM4QWOohLOKwV8Yw56ohDvAO2LaO7wzEvlNBql+oUUkuZWyYfOFJiCjrNgvt9vNl5ZNwYvrBXAF0lc9mASI62/2rgrOeAWEPRhXWqmF8NE0c5MAtNbIo6LU1IDbb5HimZzq1csXAT4btIsi9+BsjODX3oPNvEOj+GsYR64rdHzOTRQB9W8Su6yvaj6u8tligtLYeZK28o14HpiLgMuDacONXo0MpTPTRKorDLmbrafIYr6Dv/SNEK3VJHJLqrGKhTHJ/knGm9FjtFbejwUBjwB7xav+D1xYv3wJC2avLWw07YHweQnzGnZ8f2r+D+05+dqhSc6kyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pPZOy/UjzxfPCDrjmaD3dFV5V4uWcRk7F/iMDuSJoM=;
 b=fan5DT9tRAmXjn4zNsM9o521W5+PlvXJnXcp58YEiJRmyP7FgynMvo63S/43e/uaLfHyB7xucIlfuEaSUHg4sojielVM7z8RoVLPoShaOaGsdb74WVn8nY1wEA2A8m4gLdbLhGelHlbyl5xgou2fWW8pGy8liJBOnFmiCG1AIlj+R6bCsKfdfj95gWt7HuHs0IGkJKE9B2+N4WZjcKgx3+pmRE4kjIYHKegTjNR0Ek2CRXyi6/CpAWLn/5+mm5EHFwLvvqmchjYay40+fgQ+U0yVTl4qB/bzkSa4PZyXfsjU3raT5CFWGPWv5pQBzWsN+6rD9MdpSx87dDPmjBLMcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pPZOy/UjzxfPCDrjmaD3dFV5V4uWcRk7F/iMDuSJoM=;
 b=c1JWyX7Jaz1FrILHoKR/3vZQrwYgLtXMSV2EikgrcQ9cuthxO2bzPXofUyFNOwcUByt1u7Ld/QLZ2IsDcQ/zDi9Q641d/4pgax7c679dueshiBmsa9D/w0ADXEXE6Mw+Cao95xlbKLSoRL+2AkESIknrX0sXv6+EJkxQxEFoRNI=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by SN4PR10MB5637.namprd10.prod.outlook.com (2603:10b6:806:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 16:22:12 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 16:22:12 +0000
Date: Fri, 12 Jun 2026 16:22:08 +0000
Message-ID: <267e4c253a2bb0ad7da283444ba45f14@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/6] usdt_parser: harden DOF and note bounds checks
Content-Type: text/plain
X-ClientProxiedBy: DS1PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:8:456::16) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|SN4PR10MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 8226155f-9d8c-4545-0940-08dec89ec22a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|17002099007|18002099003|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	PGrxnHQ007DDZM3w97nJSzz7vTG61i8TsXGuKo2C5G5FTaWGyHL43P4Du9Hx5sqjj8KEWLjGc4OrUuW0K3q4itkNgjc4YztJsAK9/weBVS+B1IEaLRSSMysrv3MotlPO+mRfMSmiDNpG28R/ToO1BKhNcLpa1eHCaYc1Sb2rXkAy7ZmhlC/Lw2Mbp7V9n2oe7cVIxJ56qQ/czJUWUgMw75VcDVAWAYRM9bjXlVi0DA5POACDrhr1XmMyDm6Q96H/xYhKNztOtQ7LMoOWAlzEeiCzAX9/JadWloAA2No2/h/R1Oc0CtgJ3M71/fpsT/GJT4vKiiONIPkCE6mLgpKwMTL4aPZ+1lXlLCAwmuzRrKXBGD2EtubfmonPSJjzBzfYQaL+oWJxIpfIgJj8QicPmgKqYp0vcLKdmPM+WWdUObNIQOWlrMt0YIkvVlJ6vIeBNfkJW+loo6k2qLcBYyY2aBuA7ELQyWVz4z62xsG/tnsxek0q/CbBnXc6MLChNSAqleftqkf5fvbiCWPfMOKZRpOl4q2WvsCAej3F2QUmmKbr7wRv1dj3otodpJ0KDAkwzP4QmFGxzv3nHCnFp409bOfjqxGdq8ML8y5EVqy9PlFoD5hHzcM8Cst8oqgXFQIq2zaCKO8by5LLhe75OZUDq40+vDHCDgLmUe5meshL0TcNqQUxzU7Btt4nX4W9Wit2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(17002099007)(18002099003)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VNcyqYAwYjhH3UjGIx5k6FhzeXtdhsQOPUlxCudf98IyyTvWJlrdTFGN+EbL?=
 =?us-ascii?Q?4vgv8QEY74jnmKpmvDhhvezjFZFCIO7FClhup4hGbE8JQ3q3yp5PWPZoOevl?=
 =?us-ascii?Q?jyWKOtDqyJ7RslWxSc7YNkPVDc2I79HWbSIWgYDc/Phk/293bXRlU5udT74H?=
 =?us-ascii?Q?70YdxCP4uHfiI0HF2RbNQ74rphBNO4ad/E4dM17hvRc8N7yOOCawtuoyhFI2?=
 =?us-ascii?Q?VF9CqdF53H23Kbf7SJTMcCFYB2enMGL9aVvleGvgGTgkVKuEdER8v9vYYjPY?=
 =?us-ascii?Q?wGgIyFMgV3ulgWOzCAfBJQhQoKv/hhDDdkrTCgOkOOer9DYe0nG6wklSzzUe?=
 =?us-ascii?Q?xYSnpCV+Jxk1RJMDCvs4j44LPbXUIFL30mOM1clWc6LYZq6QgFxo+z/rht2q?=
 =?us-ascii?Q?lQMOLMZVuwQrkOPH46b9rlmLVQyMia2wvJrrJ7q5fB63fsN/6UlQkhDyWG3d?=
 =?us-ascii?Q?t2+Pqn5YLQht77o3djqErUWHC2Jcacz2tMzP769gvpTJjfiQKo8XiOieopUw?=
 =?us-ascii?Q?rsWeif3sU55g2zItiewg3D0RRL1j7j0KkKfO0BvSHF3uMU4YBjbPAwatL9Yd?=
 =?us-ascii?Q?G/m8tkHo1Gmj/Pkc1Cu/eIiwWsCLw0QcBkW1vtawUNAA7PjDslBIjTdcsdi/?=
 =?us-ascii?Q?WqUnVK+fORKxj5jcpWMwqwMER8anyoboE/3E065tQmkRKFp1Y2VlpKF6I7yW?=
 =?us-ascii?Q?h3WiKl4vNrvJOsuG1uO9Guoz19c4HeHyiQiswNeO2KvCANTsrf0dKWiQo7tb?=
 =?us-ascii?Q?0elodwvInSdgij3wW7NZ1+V33QFisudsArdwWoCPdZ8VlXdX/do6DxE/4BKZ?=
 =?us-ascii?Q?E18lcUqBb6qYI1ej+XoaJqChcXLgyigEIBkVb0qEzy1y0QZ+Wmd2DCO6A1t7?=
 =?us-ascii?Q?DyDbFIxGilxdVP9XO68MnQbVcGOxB2kyvaezZFm+COAIIAEWXigRgWW/2pdu?=
 =?us-ascii?Q?fAbRJDPMa2jo9BJp08ivbAdAX6mowdmNrervE4AuSkTf+TVPHI9kg46JXgIR?=
 =?us-ascii?Q?NQ/IvxwXRdGXpbISmqJ/W9Ejf/pCNWqVIHcxes/wYclXoiWfzecbDIgH957P?=
 =?us-ascii?Q?L3RcWwloGrYq+w7/cBnz2j3kSCo1Bogoh2fEQmFGoECm4uE6Qm310WlxH3FJ?=
 =?us-ascii?Q?4btHWKto3DbH1IR8eOqaAu0wa54iVYYYTYdvGFo/6TwqIwRvrCq3rLBH1EgH?=
 =?us-ascii?Q?kZAEmX5wDOXlseylRW3QsF0HduzZIYhoOfn9NAMIxNfjiv4sxN4yzpOt64R+?=
 =?us-ascii?Q?msiC2b5zfkGMzmn9QcbP6PedSbf3fHMcGQcRhhv9FavELj8o5MCHhm4NA1sf?=
 =?us-ascii?Q?hfDAvQgD5WMneR2jmWQrvyhCskfc99IjBUdKFK5CRYBYCy66Ie6VpIUnPPEN?=
 =?us-ascii?Q?GMpZX8Ly9eKP7hJpP2hl0hPCnMawH2petAi/FHDMlwjosPQbcglkXzIVP3R2?=
 =?us-ascii?Q?KCLw8+JM5gN0SxJ961MKeGRepAPINt8BJc1NfXPmxsmXGOqHvHOFiyiF21Sb?=
 =?us-ascii?Q?2A7L7vQ+Oz4yDfBd3f7x9kjmOiRuudCTL4rYhmKFB/gCYjqK2n0ITyOUSsrj?=
 =?us-ascii?Q?8C4LBJTiMytwql8He0zh2WABALbE2LDTzKOBayqonwBG6srLOXhSCQsP2h2Q?=
 =?us-ascii?Q?gOzboONt0tgfrpICdczDWrKMUuSrwQpDw91bQWoA061wKRlGFJ04CquGzECz?=
 =?us-ascii?Q?MLBrODCWFFK4atPK16A77r82sb8TnI8UKcadf7qG4obIDvk2ihyF4EBYtI4g?=
 =?us-ascii?Q?Wb9h1ucLA/XbSU9szcDXg+pW+jPOnmU=3D?=
X-Exchange-RoutingPolicyChecked:
	Rd7NMdoQbjD8rIIeRnegRl/gO28fH53/EJnDgMnGCgDprxP8Y6Q9Y9JaEclhtrmNnWQEtIddhJcafZH96+Tmh0s7itGzWXvnLnNq5q6hnVnPjKVvXW6bTKDMtCZQzLyw8DeZpJFLgDtuZEQKXFT8L3t3YPdOPxe4VhgfyMy/4GCS6ZOT8J/gCz7gfyn/UwGqjCY7oqGC3HlGbIAwW4N4Qb7MBs8Ag54nLGhU2UJOMQ+40yW80ZYdUKJplvNCt3Ayohvsqtc30nhqA+d7G9CGVbaTr13j0rxJRdE4t8mm8NQAh/QrwF69MQ+nOuJIj3mWDEG2V8GB6OQVshYWEhj0nw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o+CEswQxL6X6ZsIJAGVt2fdZsqawlZYdrdANOcg5QnNYChV2fes0dupMO3y08Lo/OynXr+gq9C4UpqDxieMAyi4uDtY8sTUCXCj/hf/Tvc1EwIKbX+Pg/zrZV375OZyq3oE0z79pzvUDJM/wDVL87+tETwHsyh/dcrKovIzUNbWqxiIEZJv9Pn6rj0Q9qRPTkRUn9vLsClIH4pLBnCdam7RbWL/0q53PaTw+8g6gYrrbNZseRQbnLXQMN2i14Yhe/2jfT/u3BWH8j0VrdDorXkG+nSe0XvsqC8y1tecL+txAVImOdtqKS2iKEZcmguSGnSIUDbN3iOMceV7jaKBl9TwWUxZVn+yGBkc91wK603PXyafXvVc/LMSN89zvUY/XQkRlWQ5ts7pZYXCUzDBBODqh1ZgsqEeTeTbso9gciVRi8AoiVy1l2myxD+R+O6SxAx0gs32+Q+3EV0l32LNx7hzqKcPKeSlUCUc6I187558KhPMx0btAW7adFm6MdWrTdEdoKqzChzuDc3myA1X6pYD73r6oln/VC/RHh3tGKjjetrhEIR4j2NeMst74ckdto8epWAjWu9EnXBOKItMPxQMU0PJ5rZelSd5wk//iXpI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8226155f-9d8c-4545-0940-08dec89ec22a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 16:22:12.2271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45OlBdjpcWQLnEeuqPUSuHvJZMZmHl6fQ6AnxflcYDJzfPvinVafIXBVRw/iTAlPXEuVmQesyptczEsduXOaO2cHtpRDavaYi1PBI/gpifY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606120151
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfX34FiPz7kDfa4
 DW9zdlqnqNszpztK2Ow2xezX1+/MNGwxVcee/QMaO+dHtz7aKISbgd++eT7yO3bDw39MnM35NMy
 91n2n1G3e9cHmGv9tVSS7tM+hsSFsdjFuCgFw3IszanXPeYYidOW6sQx4qOkrreo0qcqZl5G54w
 stAjdXJckv/eCyhyAlVSvNEfTn63NYuTgvFjH11NSOPVhsnNYTql4PVnglxvLBxuSjIvs9gyAsm
 7KDZqzI7CBfsJY2YNUmgtNK5jHmjob+wqffkSQUgnijzilHqR9Z6S95tlPAjs2YyKRU4MmZCve+
 YfVvJk0gvvvjNZP0l02m19f/0CY2WTJfzo5A9S9hkeHQLpyAVMfo2ICKPJg0LcgKOkkyWalfwW4
 vATzAyud1ZrumrtheOXE1ziZJIiMaA8HvqOn5SDOtJ6b5Sx0+MSFSgBNUMesKuGnoqpSQNwgwKU
 OTu/Bh2I2ICMiR6D+2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE1MSBTYWx0ZWRfX1M8o+6PTCt+c
 CSIbEzTDiUcLoMhcnl5+L7hyZQ8BE67+AU5B2/omEBfbwfTNRw7GmJEclWHCDNR56kh8uEFVFCY
 PiOQDYT1nJaFRRmNid2wqzts5UkhZPJuuEKoA4r+//rN8jyuo7od
X-Proofpoint-GUID: n_HAio_f-oPUQYJf2f_-mW6qlrfeefas
X-Authority-Analysis: v=2.4 cv=V6JNF+ni c=1 sm=1 tr=0 ts=6a2c3239 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=3SKV51kbMdS3KCy6ErcA:9
X-Proofpoint-ORIG-GUID: n_HAio_f-oPUQYJf2f_-mW6qlrfeefas

Validate DOF section metadata before use, require ELF note strings to
terminate within their declared payloads, and check parsed DOF record
sizes before DTrace consumes them.  This keeps malformed parser input
or stash data from driving out-of-bounds reads in either the parser or
the host.

Orabug: 39352038
Orabug: 39352051
Orabug: 39351967
CVE: CVE-2026-46831
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 include/dtrace/pid.h          |   2 +-
 libcommon/usdt_parser.h       |  10 ++-
 libcommon/usdt_parser_dof.c   |  25 +++---
 libcommon/usdt_parser_notes.c | 106 +++++++++++++++++++------
 libdtrace/dt_pid.c            | 142 ++++++++++++++++++++++++++++++----
 5 files changed, 233 insertions(+), 52 deletions(-)

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 4a239b07..88f9366c 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -45,7 +45,7 @@ typedef struct pid_probespec {
 	size_t pps_nargvlen;			/* (high estimate of) length of array */
 	char *pps_xargv;			/* array of xlated args */
 	size_t pps_xargvlen;			/* (high estimate of) length of array */
-	int8_t *pps_argmap;			/* mapped arg indexes */
+	uint8_t *pps_argmap;			/* mapped arg indexes */
 	char *pps_sargv;			/* list of arg sources */
 	int pps_flags;				/* flags */
 
diff --git a/libcommon/usdt_parser.h b/libcommon/usdt_parser.h
index b11207d1..99fc3033 100644
--- a/libcommon/usdt_parser.h
+++ b/libcommon/usdt_parser.h
@@ -136,7 +136,7 @@ typedef struct dof_parsed {
 			 * Mapping from native arg index to xlated arg index.
 			 * xargc in length.
 			 */
-			int8_t argmap[1];
+			uint8_t argmap[1];
 		} argmap;
 
 		struct dpi_tracepoint_info {
@@ -171,6 +171,14 @@ typedef struct dof_parsed {
 	};
 } dof_parsed_t;
 
+#define DIT_PROVIDER_HEADSZ	offsetof(dof_parsed_t, provider.name)
+#define DIT_PROBE_HEADSZ	offsetof(dof_parsed_t, probe.name)
+#define DIT_TRACEPOINT_HEADSZ	offsetof(dof_parsed_t, tracepoint.args)
+#define DIT_ERR_HEADSZ		offsetof(dof_parsed_t, err.err)
+#define DIT_ARGS_NATIVE_HEADSZ	offsetof(dof_parsed_t, nargs.args)
+#define DIT_ARGS_XLAT_HEADSZ	offsetof(dof_parsed_t, xargs.args)
+#define DIT_ARGS_MAP_HEADSZ	offsetof(dof_parsed_t, argmap.argmap)
+
 /*
  * Host-side: in usdt_parser_host.c.
  * The host is the non-jailed process that talks to the jailed parser.
diff --git a/libcommon/usdt_parser_dof.c b/libcommon/usdt_parser_dof.c
index bc8e185a..e2166985 100644
--- a/libcommon/usdt_parser_dof.c
+++ b/libcommon/usdt_parser_dof.c
@@ -275,8 +275,8 @@ dof_slurp(int out, dof_hdr_t *dof, uint64_t ubase)
 		return -1;
 	}
 
-	if (dof->dofh_secsize == 0) {
-		usdt_error(out, EINVAL, "zero section header size");
+	if (dof->dofh_secsize != sizeof(dof_sec_t)) {
+		usdt_error(out, EINVAL, "incorrect section header size");
 		return -1;
 	}
 
@@ -462,7 +462,7 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		return -1;
 	}
 
-	if (prb_sec->dofs_entsize == 0 ||
+	if (prb_sec->dofs_entsize < sizeof(dof_probe_t) ||
 	    prb_sec->dofs_entsize > prb_sec->dofs_size) {
 		usdt_error(out, EINVAL, "invalid entry size %x, max %lx",
 			   prb_sec->dofs_entsize, prb_sec->dofs_size);
@@ -615,11 +615,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		typeidx = prb->dofpr_xargv;
 		typestr = strtab + prb->dofpr_xargv;
 		for (k = 0; k < prb->dofpr_xargc; k++) {
-			if (arg[prb->dofpr_argidx + k] > prb->dofpr_nargc) {
+			if (arg[prb->dofpr_argidx + k] >= prb->dofpr_nargc) {
 				usdt_error(out, EINVAL, "bad native argument index "
 					   "for arg %i: %i (max %i)", k,
 					   arg[prb->dofpr_argidx + k],
-					   prb->dofpr_nargc);
+					   prb->dofpr_nargc - 1);
 				return -1;
 			}
 
@@ -748,7 +748,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	 * flags.
 	 */
 
-	msg_size = offsetof(dof_parsed_t, probe.name) +
+	msg_size = DIT_PROBE_HEADSZ +
 		   strlen(dhpb->dthpb_mod) + 1 +
 		   strlen(dhpb->dthpb_func) + 1 +
 		   strlen(dhpb->dthpb_name) + 1;
@@ -786,7 +786,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 		size_t	nargs_size;
 
 		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
-		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
+		msg_size = DIT_ARGS_NATIVE_HEADSZ + nargs_size;
 
 		msg = malloc(msg_size);
 		if (!msg)
@@ -808,8 +808,7 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 
 			xargs_size = strings_len(dhpb->dthpb_xtypes,
 						 dhpb->dthpb_xargc);
-			msg_size = offsetof(dof_parsed_t, xargs.args) +
-				   xargs_size;
+			msg_size = DIT_ARGS_XLAT_HEADSZ + xargs_size;
 
 			msg = malloc(msg_size);
 			if (!msg)
@@ -826,9 +825,8 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 
 			/* Then the mapping table. */
 
-			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
-			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
-				   map_size;
+			map_size = dhpb->dthpb_xargc * sizeof(uint8_t);
+			msg_size = DIT_ARGS_MAP_HEADSZ + map_size;
 
 			msg = malloc(msg_size);
 			if (!msg)
@@ -922,8 +920,7 @@ emit_provider(int out, dof_helper_t *dhp,
 	}
 
 	dhpb.dthpb_prov = strtab + prov->dofpv_name;
-	provider_msg_size = offsetof(dof_parsed_t, provider.name) +
-	    strlen(dhpb.dthpb_prov) + 1;
+	provider_msg_size = DIT_PROVIDER_HEADSZ + strlen(dhpb.dthpb_prov) + 1;
 
 	provider_msg = malloc(provider_msg_size);
 	if (!provider_msg) {
diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
index c98c9fb0..7742024e 100644
--- a/libcommon/usdt_parser_notes.c
+++ b/libcommon/usdt_parser_notes.c
@@ -73,6 +73,10 @@ get_note(int out, usdt_data_t *data, ssize_t off, usdt_note_t *note)
 	}
 
 	note->name = (char *)data->buf + off;
+	if (memchr(note->name, '\0', sz) == NULL) {
+		usdt_error(out, EINVAL, "Unterminated name");
+		return -1;
+	}
 	off += ALIGN(sz, 4);
 
 	dt_dbg_usdt("ELF note '%s' (%d bytes)\n",
@@ -272,6 +276,25 @@ static dt_htab_ops_t pmap_htab_ops = {
         .next = (htab_next_fn)prb_next
 };
 
+/*
+ * Return the length of string 'str' (excluding the terminating NUL, if it
+ * terminates before the supplied 'end', and -1 otherwise.
+ */
+static ssize_t
+cstrlen(const char *str, const char *end)
+{
+	const char	*p;
+
+	if (str >= end)
+		return -1;
+
+	p = memchr(str, '\0', end - str);
+	if (p == NULL)
+		return -1;
+
+	return p - str;
+}
+
 /*
  * Return the cummulative string length of 'cnt' consecutive 0-terminated
  * strings.  If skip > 0, it indicates how many extra bytes are to be skipped
@@ -284,10 +307,12 @@ strarray_size(uint8_t cnt, const char *str, const char *end, size_t skip)
 	const char	*p = str;
 
 	while (cnt-- > 0) {
-		if (p >= end)
+		ssize_t	len = cstrlen(p, end);
+
+		if (len < 0 || skip > (size_t)(end - (p + len + 1)))
 			return -1;
 
-		p += strlen(p) + 1 + skip;
+		p += len + 1 + skip;
 	}
 
 	return p - str;
@@ -298,14 +323,21 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		usdt_note_t *note)
 {
 	const char	*p = note->desc;
+	const char	*end = p + note->hdr->n_descsz;
 	dt_provider_t	prvt, *pvp;
 	const uint32_t	*vals;
 	uint32_t	probec;
+	ssize_t		len;
 	int		i;
 
+	len = cstrlen(p, end);
+	if (len == -1) {
+		usdt_error(out, EINVAL, "Unterminated provider name");
+		return -1;
+	}
 	prvt.name = p;
-	p += ALIGN(strlen(p) + 1, 4);
-	if (p + 6 * sizeof(uint32_t) - note->desc > note->hdr->n_descsz) {
+	p += ALIGN(len + 1, 4);
+	if (p + 6 * sizeof(uint32_t) > end) {
 		usdt_error(out, EINVAL, "Incomplete note data");
 		return -1;
 	}
@@ -342,13 +374,18 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		ssize_t		len;
 
 		p = (const char *)ALIGN((uintptr_t)p, 4);
+		len = cstrlen(p, end);
+		if (len == -1) {
+			usdt_error(out, EINVAL, "Unterminated probe name");
+			return -1;
+		}
 		prbt.prv = pvp->name;
 		prbt.mod = dhp->dofhp_mod;
 		prbt.fun = NULL;
 		prbt.prb = p;
 		prbt.off = 0;
-		p += strlen(p) + 1;
-		if (p + 2 * sizeof(uint8_t) - note->desc > note->hdr->n_descsz) {
+		p += len + 1;
+		if (p + 2 * sizeof(uint8_t) > end) {
 			usdt_error(out, EINVAL, "Incomplete note data");
 			return -1;
 		}
@@ -374,8 +411,7 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		prp->ntp = 0;
 		prp->is_enabled = 0;
 		prp->nargc = argc = *(uint8_t *)p++;
-		len = strarray_size(argc, p, note->desc + note->hdr->n_descsz,
-				    0);
+		len = strarray_size(argc, p, end, 0);
 		if (len == -1) {
 			usdt_error(out, EINVAL, "Incomplete note data");
 			return -1;
@@ -384,7 +420,7 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		prp->nargs = p;
 
 		p += len;
-		if (p - note->desc > note->hdr->n_descsz) {
+		if (p >= end) {
 			usdt_error(out, EINVAL, "Incomplete note data");
 			return -1;
 		}
@@ -411,6 +447,11 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 				q = stpcpy(q, p);
 				q++;
 				p += strlen(p) + 1;
+				if (*(uint8_t *)p >= prp->nargc) {
+					usdt_error(out, EINVAL,
+						   "bad native argument index");
+					return -1;
+				}
 				prp->xmap[j] = *p;
 				p++;
 			}
@@ -432,7 +473,9 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		usdt_note_t *note)
 {
 	const char	*p = note->desc;
+	const char	*end = p + note->hdr->n_descsz;
 	uint64_t	off, fno;
+	ssize_t		len;
 	dt_probe_t	prbt, *prp;
 
 	data = data->next;
@@ -441,7 +484,7 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		return -1;
 	}
 
-	if (p + 2 * sizeof(uint64_t) - note->desc > note->hdr->n_descsz) {
+	if (p + 2 * sizeof(uint64_t) >= end) {
 		usdt_error(out, EINVAL, "Incomplete note data");
 		return -1;
 	}
@@ -450,10 +493,15 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 	p += sizeof(uint64_t);
 	fno = *(uint64_t *)p;
 	p += sizeof(uint64_t);
+	len = cstrlen(p, end);
+	if (len == -1) {
+		usdt_error(out, EINVAL, "Unterminated provider name");
+		return -1;
+	}
 
 	prbt.prv = p;
-	p += strlen(p) + 1;
-	if (p - note->desc > note->hdr->n_descsz) {
+	p += len + 1;
+	if (p >= end) {
 		usdt_error(out, EINVAL, "Incomplete note data");
 		return -1;
 	}
@@ -463,9 +511,18 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		return -1;
 	}
 	prbt.fun = (char *)data->buf + fno;
+	if (cstrlen(prbt.fun, (char *)data->buf + data->size) == -1) {
+		usdt_error(out, EINVAL, "Unterminated function name");
+		return -1;
+	}
+	len = cstrlen(p, end);
+	if (len == -1) {
+		usdt_error(out, EINVAL, "Unterminated probe name");
+		return -1;
+	}
 	prbt.prb = p;
-	p += strlen(p) + 1;
-	if (p - note->desc > note->hdr->n_descsz) {
+	p += len + 1;
+	if (p >= end) {
 		usdt_error(out, EINVAL, "Incomplete note data");
 		return -1;
 	}
@@ -510,9 +567,14 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 	prp->is_enabled = (note->hdr->n_type == _USDT_EN_NOTE_TYPE ? 1 : 0);
 	prp->ntp = 0;
 	prp->sargc = *p++;
+	len = cstrlen(p, end);
+	if (len == -1) {
+		usdt_error(out, EINVAL, "Unterminated argument string");
+		return -1;
+	}
 	prp->sargs = p;
-	p += strlen(p) + 1;
-	if (p - note->desc > note->hdr->n_descsz) {
+	p += len + 1;
+	if (p > end) {
 		usdt_error(out, EINVAL, "Incomplete note data");
 		return -1;
 	}
@@ -537,22 +599,22 @@ alloc_msg(int out, dof_parsed_info_t type, size_t len)
 
 	switch (type) {
 	case DIT_PROVIDER:
-		len += offsetof(dof_parsed_t, provider.name);
+		len += DIT_PROVIDER_HEADSZ;
 		break;
 	case DIT_PROBE:
-		len += offsetof(dof_parsed_t, probe.name);
+		len += DIT_PROBE_HEADSZ;
 		break;
 	case DIT_ARGS_NATIVE:
-		len += offsetof(dof_parsed_t, nargs.args);
+		len += DIT_ARGS_NATIVE_HEADSZ;
 		break;
 	case DIT_ARGS_XLAT:
-		len += offsetof(dof_parsed_t, xargs.args);
+		len += DIT_ARGS_XLAT_HEADSZ;
 		break;
 	case DIT_ARGS_MAP:
-		len += offsetof(dof_parsed_t, argmap.argmap);
+		len += DIT_ARGS_MAP_HEADSZ;
 		break;
 	case DIT_TRACEPOINT:
-		len += offsetof(dof_parsed_t, tracepoint.args);
+		len += DIT_TRACEPOINT_HEADSZ;
 		break;
 	default:
 		usdt_error(out, EINVAL, "Unknown dof_parsed_t type: %d", type);
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 7e6e5d90..e20bc82b 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -782,25 +782,93 @@ err:
 }
 
 /*
- * A quick check that a parsed DOF record read hasn't incurred a buffer overrun
- * and is of the type expected.
+ * Ensure that the buffer has enough data to read the record of the expected
+ * type.  Ensure that all records have at least 1 byte of payload data.
  */
 static int
 validate_dof_record(const char *path, const dof_parsed_t *parsed,
-		    dof_parsed_info_t expected, size_t buf_size,
+		    dof_parsed_info_t type, size_t headsz, size_t buf_size,
 		    size_t seen_size)
 {
-	if (buf_size < seen_size) {
+	size_t	data_size;
+
+	/* If we have read more than there is, we must always fail. */
+	if (buf_size < seen_size)
+		data_size = 0;
+	else
+		data_size = buf_size - seen_size;
+
+	if (data_size < headsz || data_size < parsed->size) {
 		dt_dprintf("DOF too small when adding probes (seen %zi bytes)\n",
 			   seen_size);
 		return 0;
 	}
 
-	if (parsed->type != expected) {
+	if (parsed->size < headsz + 1) {
+		dt_dprintf("DOF record too small: expected %zi, got %zi\n",
+			   headsz, parsed->size);
+		return 0;
+	}
+
+	if (parsed->type != type) {
 		dt_dprintf("%s format invalid: expected %i, got %i\n", path,
-			   expected, parsed->type);
+			   type, parsed->type);
 		return 0;
 	}
+
+	return 1;
+}
+
+/*
+ * Validate a payload containing CNT consecutive NUL-terminated strings.
+ */
+static int
+validate_string_payload(const char *path, const char *payload,
+			size_t payload_size, size_t cnt)
+{
+	const char	*p = payload;
+	const char	*end = payload + payload_size;
+	size_t		i;
+
+	for (i = 0; i < cnt; i++) {
+		const char	*nul;
+
+		if (p >= end) {
+			dt_dprintf("%s string payload too small\n", path);
+			return 0;
+		}
+
+		nul = memchr(p, '\0', end - p);
+		if (nul == NULL) {
+			dt_dprintf("%s string payload unterminated\n", path);
+			return 0;
+		}
+
+		p = nul + 1;
+	}
+
+	return 1;
+}
+
+static int
+validate_argmap_payload(const char *path, const uint8_t *argmap,
+			size_t payload_size, size_t nargc, size_t xargc)
+{
+	size_t	i;
+
+	if (payload_size < xargc * sizeof(uint8_t)) {
+		dt_dprintf("%s argmap payload too small\n", path);
+		return 0;
+	}
+
+	for (i = 0; i < xargc; i++) {
+		if (argmap[i] >= nargc) {
+			dt_dprintf("%s argmap entry %zi invalid: %u >= %zi\n",
+				   path, i, argmap[i], nargc);
+			return 0;
+		}
+	}
+
 	return 1;
 }
 
@@ -908,13 +976,13 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 		char *dof_buf = NULL, *p;
 		struct stat s;
 		char *path;
-		size_t dof_buf_size, seen_size = 0;
+		size_t dof_buf_size, seen_size = 0, payload_size;
 		uint64_t *dof_version;
 		char *prv, *mod, *fun, *prb;
 		dof_parsed_t *provider, *probe;
 		ssize_t nargvlen = 0, xargvlen = 0;
 		char *nargv = NULL, *xargv = NULL;
-		int8_t *argmap = NULL;
+		uint8_t *argmap = NULL;
 
 		/*
 		 * Regular files only: in particular, skip . and ..,
@@ -929,7 +997,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			goto per_mapping_err;
 
 		dof_buf = read_file(path, &dof_buf_size);
-		if (dof_buf == NULL)
+		if (dof_buf == NULL || dof_buf_size < sizeof(uint64_t))
 			goto per_mapping_err;
 		dof_version = (uint64_t *) dof_buf;
 		if (*dof_version != DOF_PARSED_VERSION) {
@@ -945,27 +1013,50 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 		 * probe.
 		 */
 		provider = (dof_parsed_t *) p;
-		if (!validate_dof_record(path, provider, DIT_PROVIDER, dof_buf_size,
+		if (!validate_dof_record(path, provider, DIT_PROVIDER,
+					 DIT_PROVIDER_HEADSZ, dof_buf_size,
 					 seen_size))
 			goto parse_err;
 
+		/*
+		 * Ensure that a validly terminated string follows the record
+		 * header.
+		 */
 		prv = provider->provider.name;
+		payload_size = provider->size - DIT_PROVIDER_HEADSZ;
+		if (memchr(prv, '\0', payload_size) == NULL)
+			goto parse_err;
 
 		p += provider->size;
 		seen_size += provider->size;
 
 		probe = (dof_parsed_t *) p;
-		if (!validate_dof_record(path, probe, DIT_PROBE, dof_buf_size,
+		if (!validate_dof_record(path, probe, DIT_PROBE,
+					 DIT_PROBE_HEADSZ, dof_buf_size,
 					 seen_size))
 			goto parse_err;
 
 		mod = probe->probe.name;
+		payload_size = probe->size - DIT_PROBE_HEADSZ;
+		if (memchr(mod, '\0', payload_size) == NULL)
+			goto parse_err;
+
 		fun = mod + strlen(mod) + 1;
+		payload_size -= strlen(mod) + 1;
+		if (memchr(fun, '\0', payload_size) == NULL)
+			goto parse_err;
 		prb = fun + strlen(fun) + 1;
+		payload_size -= strlen(fun) + 1;
+		if (memchr(prb, '\0', payload_size) == NULL)
+			goto parse_err;
 
 		p += probe->size;
 		seen_size += probe->size;
 
+		if (probe->probe.nargc > UINT8_MAX ||
+		    probe->probe.xargc > UINT8_MAX)
+			goto parse_err;
+
 		/*
 		 * Assume the order given in dof_parser.h, for simplicity.
 		 */
@@ -973,11 +1064,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			dof_parsed_t *args = (dof_parsed_t *) p;
 
 			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
+						 DIT_ARGS_NATIVE_HEADSZ,
 						 dof_buf_size, seen_size))
 				goto parse_err;
 
 			nargv = args->nargs.args;
-			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
+			payload_size = args->size - DIT_ARGS_NATIVE_HEADSZ;
+			if (!validate_string_payload(path, nargv, payload_size,
+						     probe->probe.nargc))
+				goto parse_err;
+			nargvlen = payload_size;
 			assert(nargvlen >= 0);
 
 			p += args->size;
@@ -987,11 +1083,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			dof_parsed_t *args = (dof_parsed_t *) p;
 
 			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
+						 DIT_ARGS_XLAT_HEADSZ,
 						 dof_buf_size, seen_size))
 				goto parse_err;
 
 			xargv = args->xargs.args;
-			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
+			payload_size = args->size - DIT_ARGS_XLAT_HEADSZ;
+			if (!validate_string_payload(path, xargv, payload_size,
+						     probe->probe.xargc))
+				goto parse_err;
+			xargvlen = payload_size;
 			assert(xargvlen >= 0);
 
 			p += args->size;
@@ -999,10 +1100,16 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			args = (dof_parsed_t *) p;
 
 			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
+						 DIT_ARGS_MAP_HEADSZ,
 						 dof_buf_size, seen_size))
 				goto parse_err;
 
 			argmap = args->argmap.argmap;
+			payload_size = args->size - DIT_ARGS_MAP_HEADSZ;
+			if (!validate_argmap_payload(path, argmap, payload_size,
+						     probe->probe.nargc,
+						     probe->probe.xargc))
+				goto parse_err;
 
 			p += args->size;
 			seen_size += args->size;
@@ -1017,6 +1124,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			const prmap_t *pmp;
 
 			if (!validate_dof_record(path, tp, DIT_TRACEPOINT,
+						 DIT_TRACEPOINT_HEADSZ,
 						 dof_buf_size, seen_size))
 				goto parse_err;
 
@@ -1073,9 +1181,15 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			if (argmap)
 				psp.pps_argmap = argmap;
 
-			if (tp->tracepoint.args[0] != 0)
+			if (tp->tracepoint.args[0] != 0) {
 				psp.pps_sargv = tp->tracepoint.args;
 
+				payload_size = tp->size - DIT_TRACEPOINT_HEADSZ;
+				if (memchr(psp.pps_sargv, '\0',
+					   payload_size) == NULL)
+					goto parse_err;
+			}
+
 			dt_dprintf("providing %s:%s:%s:%s for pid %d @ %lx\n",
 				   psp.pps_prv, psp.pps_mod, psp.pps_fun,
 				   psp.pps_prb, psp.pps_pid, psp.pps_off);
-- 
2.47.3

