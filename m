Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C771A0BD6
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769924; cv=fail; b=C3Msxk3mF36SIX5DdOBp9oIIR8IFGutGGUT2wgg7CXjm8Z3/zj2AaykHkxJZuJGm27cKEe4GQAt6pAZsXYihhSUZbLXz+6uHNc/V/72SWh4l96PLIzznDh4phvq/Iii/BTjZ2Lrsk3p8qdQ/ORn8f8VazbA10B5XxRuQjerNbLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769924; c=relaxed/simple;
	bh=vFxCDDxd45+hb0y39NtZDkjBz5/fO4hHNlw9EbK/oe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AGO1i+pTRIyxGzRgeCo45wYsKkW8u+6Ic6GhNCokAiJjeL/AuDmYhMQs8eQGBrlqjTUKqqsHp1+rSRt4DYRC1bWSSQmcH76QjyE/mZULB/y78MHZ25W+y1B94kVufTXpD8V+TI5vSTumqFso47h27EoFYvAjtAWggnkB1BFgvQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NFIJeeRB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kM/m/RiN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NFIJeeRB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kM/m/RiN"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2fvQY008771;
	Thu, 24 Oct 2024 11:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=VxkaIpVNfghe2WfR+0mzv3KSjfe1xNFiUTeGyEJ7dv8=; b=
	NFIJeeRBWA0KokVAXojwl3nciqX0UNx/4PXD6VFMtjwd9N7gdgZr5ud5SOY4cMLi
	WeF/TJDlOSA6Xwqd951fCs+kYqVGVIJV9iC489zJXdHUyNQxgH6T8ejTX/YzbxVE
	Qyf4iHMfPKVDtMWpJ+uyfzu+wa3RqRS1MY1VASatRE6rGyno41dtN9EG5+1EYCu8
	mw+SpGOGi3zJBYpRYopGA/q0anBR2mcV4mkN1SXRrgXb8c6vDe95bA+5A6gn6wmE
	thSOlwI6akUB4kMm74UOWTH+9HUL0uzkwnrgNOAxu5uRd0V/0i/yDAdIaJVDyEJe
	rqYVHGOaE/ug8hvGEdnWHg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v2bq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OALqSn035737;
	Thu, 24 Oct 2024 11:38:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh3tgse-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJgA7iIT5NRK7opySTmhiJ8FpmN7LRTbOt+/gSM+xiPOVRzwFOOwyFYLJ/MO5yXyAFXlgVQARC9RFW5d44RKblkylbH6yMnOO+IK2i940LApw3o3LHON3f/vVG2LTORsoN3P5VMdFaI5cBMJA09f1zgyKtzwmr4NPqcv4kA3bNIaT+hRrEEoaGOaCykADh2wNw5omS6gP/Id/aR8Of+AtSwlveUNEz3cdom+ZtRWpDARFh8B9ErgWnuDlTtgBdm8hqwPHyMA8VFVc0UATJUzRcqXBcN8/mtMgGGyRL3Vo+p84roJ8o/KeIW1XcITfu3YfmOGubzCPljlYaIr5bemUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxkaIpVNfghe2WfR+0mzv3KSjfe1xNFiUTeGyEJ7dv8=;
 b=DFYk36GwTAL6R/bvwUJwVaUGPOXn647oeseociJTCRZG8iM8/m5/JPfEAbFnoyzSJyug034zM9+TwhBLFM1/1jk26Tlsb73sRMRmiGmHhjx9vIaWN+E/opkuxK+CPQ3s0kd4LLUCQt9W6ZEDBZsOBmsZ3xbcVS6tLpwuCieiiS/biVC/Ju1Cl55wv7wqyMsn/LkJc868KM/1mjUCnQXUyheLTDRvUUveIfi3k+pC6KwXNumf+Y7oA2wjQ/2jmEWxg4lbW3iRROChi4BctQxOjhZWer16wM5402yMgRCnnpCsGCe20KAAfr4iPmKZDl/VHaSJ7dJx1DgfG6Cq+k9eRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxkaIpVNfghe2WfR+0mzv3KSjfe1xNFiUTeGyEJ7dv8=;
 b=kM/m/RiNf0DH6VY9WnAvAfTrlBX6i54V1HlobtixVCzrHSmbUKkL1ROiDM2dMiVcuyR7DmFhrghyuYtlP1I+kMCgFs8kMa4BMl1VCqnyc7xK/pbETpe5tiVGJs2aXvBkT317XkF2q4umIl7eYHYigiAWDfUrV4PXHz8VdSIoldI=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7986.namprd10.prod.outlook.com (2603:10b6:610:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 11:38:25 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:25 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 12/14] man: add manpage for dtprobed(8)
Date: Thu, 24 Oct 2024 12:37:56 +0100
Message-ID: <20241024113758.182050-13-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0043.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::16) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: d84cc5ca-7c34-4a88-9dee-08dcf4205f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ehdAIK1r6CKusDJluehahmIn2ez0JTHtQ5kLJqCODXTlXhOe+KxDZwDbI0TG?=
 =?us-ascii?Q?anEqEDLoKx+ISAGGYbK+3+rjwZsfxTLDlNYQQ0c+3FXE3zCYsP1cUnlLxyDy?=
 =?us-ascii?Q?AffNbwbHBG5X2afcY01ADoO9pStlTF86rqAumaOSSaOQ4uuegYfFbysqVGjL?=
 =?us-ascii?Q?sW6octdjfLwLK/n8y4odI57AHR6VJWnNaspuVBu4R5xBjdtW844Q5AwBc1E2?=
 =?us-ascii?Q?WXSP9PQJIBE0CYs2vHCsiK1pdQA1l7YtA3sZbtiKQXKgTHMMZ5JTzAWj931P?=
 =?us-ascii?Q?hhYhbzY1AtBECPjo6F+nNcPt9x0m3sMqR9ouASmwoPYSXg2FfzJRwrGOCtc/?=
 =?us-ascii?Q?z3Mv7XuLkYmHjqghdgWFSdKQKB0BTapo3suKl9vJhlaMRII2LIvLFIHUCO+h?=
 =?us-ascii?Q?uvPZURRVaHQQ2LSG+J0XnmGUp/CU5/R6CGwZVdf1+ShT//CDMErmVplR1Uk4?=
 =?us-ascii?Q?0w7F1yEBkdzqzYOu68nPqeIPMJ7pT+Y5wq849xeF3XKW7AE8MW/3tXB+vvCs?=
 =?us-ascii?Q?yDRAVzgZ0SlQgXvLbnbWtX3nSCKS0jQAoar3X/mjXCt9QQtQDkhKnYyq1JwE?=
 =?us-ascii?Q?TjxwWOGaS9BU1dQgogcBIXlEE/l58wVQ03YiTu0uQ5UDTQjevjsKDUJDWYGj?=
 =?us-ascii?Q?B1jeiyMaOlvRED7gl2JuH0LsNJxPQn4qL5dh+sP6sIL1dJOdMPl7qDIJJjZ+?=
 =?us-ascii?Q?gUgbHL5cD16suNE4/CT9Hle7SrIQzvC79CqiOLuJX5AujrmcMWWLhVnxi7qv?=
 =?us-ascii?Q?wbNrRe5WDCeSor3g2nyR3h3VFIPwrzZkrvxSvmUJYatsBSlGLBdFXzr2RiFK?=
 =?us-ascii?Q?7w0a+rVqV/758zJUvs5xNEwkonMswKSHMqkjUn9FcJUnLH6zDwLXMpylVrPW?=
 =?us-ascii?Q?3gbbQO8VnlrSgpN54QkGS1ly8LG28t982/YntSQJIpANWGkLU7er9cr7hKqS?=
 =?us-ascii?Q?AjFBeM/o41vT80CGMS08e5WWiH0sRMMzLbfhaTRqLLTXPWO3grWURntgde1Y?=
 =?us-ascii?Q?/Asms1Q/PYOQMR8ul6BGlQinOGoe3Flky5X7B3mqmYF0LBmpiwhhEclcqHgU?=
 =?us-ascii?Q?HAx/yibHaXoIMXDO7R2bR9j19ycC5XFMVLUWH4zjhh0KSEpkQymUO3d43v7f?=
 =?us-ascii?Q?CK997pasc1Ivx9l2ebkYMS34ZslyGISUkt7F9x4h311/G4frQ0Vo2DVLSrXd?=
 =?us-ascii?Q?jsi4bNvCUjN0nd6H8GtyIg3dR6nZthNZk7/lBGldw2Aq63x+qv8oM29NcOHm?=
 =?us-ascii?Q?t80AW0DAFnADUI8ZG9kUsCtNwdroEICBqTIwSqmlhQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cwmzi7kdq4h/kQYdcjnUnKvStuDnhvFDvVuz6w2MlLwnRlz4Or0Cn3OCGlHw?=
 =?us-ascii?Q?DK7pYPB1C3H5wZ0DUkx1uB/I39Ic6fJHEmsWqsaSHIWj9k8Cc8wenXEbZIdJ?=
 =?us-ascii?Q?UcctSZofunSaosgTiA7yk51jVRLUzKPq2ihXgLdvj5/L6mBU9lGKrNMa0WY1?=
 =?us-ascii?Q?RAoDr200+hrRIsbhMC269Fd95viiNPO4zcB//qTbNP8w3fZB2pleJ9BucyMG?=
 =?us-ascii?Q?Re8KZ62ohQvc86kcAJLuR5BJVeCddS1qU7mGAc2L7QlSgbDAMi5HRAtdOsXi?=
 =?us-ascii?Q?uPjdm2kDj3uXV4opmQhgGBkLjlpqmPY9NlOpL5iR8+3462T9EcNSvfJaMMPw?=
 =?us-ascii?Q?MOGk8d9eowBSG+G7/mOnJK4fI8Ok4y3TmTRZ5fT3B0aTdyv/rO2cCNTKTLj5?=
 =?us-ascii?Q?TOi6MXfosgXeCuCCo4dgQKE3u5Qt46Xg1TJachVNzaiRd7kaKn76aL4q9VaK?=
 =?us-ascii?Q?WTSecTz1+WrzvvqmQ/QcTo8Zpk6ADE37lM05Zhd5UNbu/ahgXV8IYfASwiSz?=
 =?us-ascii?Q?AQafZkT/qnEsfqHODkGgskKHFKJpnjbMRKqia/Y2quuVC9mn+OUVcG+JNEfT?=
 =?us-ascii?Q?GUj8zZmjs58rj6Ijtkg0A8XTB0gXbVzGaNq2WJeXXoXeQzQ6MPXiIZw0s/II?=
 =?us-ascii?Q?MNo9x/HpyXFwcLP5LRWK3zPiwBRXjxE4vxgtQ9grMXSH+RpGiS58tp983kWa?=
 =?us-ascii?Q?AnhDl0wdVXZC05mLpobtP3S6pSkO3PRvnwirZZDNPCXRIekTuqf9nlRNXJkC?=
 =?us-ascii?Q?i8EF1TjSxKvKtOgrQCTyHliRjdBzgphpkzMKUzBVmEy9WoUMdo1v582PoZcp?=
 =?us-ascii?Q?VJgzxbHjRmhxI0EmgXV/2pkE4AIiRb5OStzxJ8V0CoCi0VLMCrTfyBN0XbRq?=
 =?us-ascii?Q?gQFxf3hWY/HtxOUID2ZssJoFvSltUJM/UwQfPkUVV3OrZuOQxwbSILfgyzOz?=
 =?us-ascii?Q?lgPviFKzIHxJzXrSND5Me8srM4Mk8Ew4N2gpEvwu4VDGxh++HHtH9LEzg8kL?=
 =?us-ascii?Q?oGiAIa2PwiRG0wj5gEERBzyJuEpKKz5raB6cAJsiI8xH8cIWt4Yp74U9+mJO?=
 =?us-ascii?Q?18e1iEccfbPAl4QUWVY/6bMXgDTe7Di02A08mj6QNb8s6QpV8s6e4jRe7Knp?=
 =?us-ascii?Q?1wpyTL+NHQ7l5SkQjrtsYDJLbs8tbjpOLuLRLFhLYfPC4UhaLZs6EidTMDgB?=
 =?us-ascii?Q?TRpRjcSr/Usr0rEFo8loiBimfz9T6i9gqOZ1PGD8UCrr7OJDPkxs8+aA1LvG?=
 =?us-ascii?Q?ueNcpFQjjxYpGWzzZzOuU9IryMMN0XdnpUksyQZRC/HXU7mRTxgZfuisznng?=
 =?us-ascii?Q?/EHhxbPDD1Aw2b5dXqjKULO2i2R1U7Am8BOrTah6YzorJwvz5oAChlxhcWAW?=
 =?us-ascii?Q?xDg+awaBYt/zq5fvF8vPlnSPQC5Ddl+Pgzix3hsXxpB/YZrmaVmNl7WuI+hl?=
 =?us-ascii?Q?aFIKoiGLNzV09oLnQunL4TzOxp/kD39+e6okl9GYat25wEXrwqpqY7BQlCN+?=
 =?us-ascii?Q?/+X04TTy/jXE0ZFJ9syk1gMP5unNSWV8dVvZVKaGy34r/b5oG2GffgWlY/E7?=
 =?us-ascii?Q?pr7n2C5JnEIL7mobA4t8pmG2OsEIqmheioYbzODeStvwLnIy84eBjSusfOF7?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UeXX4J8NrH0LAZ2fxDa+u1CtATpnDNomlgLGHPCQH78inFnsEjjJCrw++Sd+6PPWt+UGTQjUOHh1oFA1xPylzgiroBD2D3OC8RVUoSSytaZICY8MYrKh84ei36BMykfQr37QWJU4V5Y/vWFcq2VkhT/wjBTFjHqextm8j/O8G7Blq2xm95r+QrVcXmnKm+HYyMfkgsNDPJDrGo/NQ7NZ+cJbGMoOnG2tgDfe6w0oHfKu7RSHAzHZDJEMkalvQ/2xqTiBKf7jZanPAV+jdaf+ubd7pIaw8+Obt5WvZzVaWX2ReIKXcWP6xVAu1MXouzzvx5YQARwmhiP4WOXGXIM+BsQXCeSgb1tdSljuhAAyZXk6nWKCIu1LS4Yawc2f3f6BZfkCkLyQ0Asn0yHH0vUqRX/+2dcgqoh/BJ6cFI5gI1TU9bThpgV9YLEoYRiLR4dTvNa7soTGdFyGii51xidXC7IMl8LLUry1V0/BGiz2etmmKb0Khi8eyCPeNz6kk3rCmOCmmXWi4Hi1khaqIQG+4xHGcPL4bhCzQkkb9RfPEfmByPqmh96pHtfhTvJOogbRZe2g5+si6ZFKGCbd58pocIjzZSGk9p94ImqnLaqAUC0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84cc5ca-7c34-4a88-9dee-08dcf4205f3f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:25.5366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F21qKp1GO6UWvc+oUYNX3rhxvTfJAhrlqV8Q4u56GNz4ONC0/m7dgYrfVMEA2SJM7xSaLGegNJqY51jupFrxIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: 12puPyOpVj7YjKNpx35xl1ClzPZiBYoA
X-Proofpoint-ORIG-GUID: 12puPyOpVj7YjKNpx35xl1ClzPZiBYoA

Cross-reference it from dtrace(8).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Bug: https://github.com/oracle/dtrace-utils/issues/94
---
 cmd/dtrace.8        |  3 ++-
 dtprobed/Build      |  2 ++
 dtprobed/dtprobed.8 | 66 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 dtprobed/dtprobed.8

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index fb9392d29cb2..c299073239eb 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -184,7 +184,8 @@ Options set this way are overridden both by options specified via \fB\-x\fR on t
 .
 .SH SEE ALSO
 .BR cpp (1),
-.BR ssh (1)
+.BR ssh (1),
+.BR dtprobed (1)
 .LP
 .I Oracle Linux DTrace Guide
 .
diff --git a/dtprobed/Build b/dtprobed/Build
index 346cd6aee190..7d98ddf836c3 100644
--- a/dtprobed/Build
+++ b/dtprobed/Build
@@ -57,6 +57,8 @@ install::
 	mkdir -p $(INSTSBINDIR)
 	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
 	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
+	$(call describe-install-target,$(INSTMANDIR),dtprobed.8)
+	install -m 644 $(dtprobed_DIR)/dtprobed.8 $(INSTMANDIR)/man8
 	mkdir -p $(INSTUDEVDIR)
 	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
 	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
diff --git a/dtprobed/dtprobed.8 b/dtprobed/dtprobed.8
new file mode 100644
index 000000000000..145cece1840d
--- /dev/null
+++ b/dtprobed/dtprobed.8
@@ -0,0 +1,66 @@
+'\" te
+.\" Oracle Linux DTrace.
+.\" Copyright (c) 2009, 2024, Oracle and/or its affiliates. All Rights Reserved.
+.\" Licensed under the Universal Permissive License v 1.0 as shown at
+.\" http://oss.oracle.com/licenses/upl.
+.TH dtrace 8 "22 Oct 2023" "Oracle Linux" "Linux Programmer's Manual"
+.SH NAME
+dtprobed \- USDT-tracking daemon
+.SH SYNOPSIS
+.SY dtprobed
+.OP -Fd
+.OP \-d devname
+.OP \-t timeout
+.YS
+.
+.SH DESCRIPTION
+.LP
+\fBdtprobed\fP is a component of the DTrace system that keeps track of USDT probes within running processes, parsing and storing the DOF they provide for later consumption by \fBdtrace\fP proper.
+.LP
+\fBdtprobed\fP should be started as soon as possible after startup and should always be kept running: processes that start before it may not have usable USDT probes.  On systemd systems this is usually done automatically.  (Restarting on upgrade should also be done for you by the packaging system.)
+.LP
+The following options are supported:
+.TP
+\fB\-F\fP
+Put \fBdtprobed\fP into the foreground: log output to \fIstderr\fP instead of the syslog. (Routinely used by systemd.)
+.TP
+\fB\-d\fP
+Enable debugging: log extra output, and disable sandboxing of the DOF parser.
+.TP
+\fB-n\fP \fIdevname\fP
+Name the CUSE device something other than the default \fIdtrace/helper\fP. DOF-containing processes will not connect to this instance unless pointed at it via the \fIDTRACE_DOF_INIT_DEVNAME\fP environment variable.  Using this option is necessary if for some reason (perhaps debugging) you want to have two dtprobeds running at once.  (They will still share a state directory, so DTrace will know about all probes discovered by all running \fBdtprobed\fPs.)
+.TP
+\fB\-t\fP \fItimeout\fP
+Timeout, in seconds, for DOF reads from the parser child.  DOF that takes longer than this to parse will be discarded.  The default (5 seconds) is probably always reasonable. Setting this too low might cause legitimate DOF to be discarded: setting it too high might cause faulty DOF to block \fBdtprobed\fP, preventing registration of new probes.
+.
+.SH "ENVIRONMENT VARIABLES"
+.LP
+Ignoring internal testing-only variables, \fBdtprobed\fP itself does not accept any environment variables: but programs that talk to it (any program that contains USDT probes) do accept some.
+.TP
+\fIDTRACE_DOF_INIT_DEBUG\fP
+Output debugging messages to standard error if set (to anything).
+.TP
+\fIDTRACE_DOF_INIT_DEVNAME\fP
+The full name of the helper device to send registration requests on: by default, \fI/dev/dtrace/helper\fP. \fBdtprobed\fP is listening on the other end of this device.
+.TP
+\fIDTRACE_DOF_INIT_DISABLE\fP
+Disable DOF registration entirely.
+.
+.SH FILES
+.
+.TP
+\fI/run/dtrace/stash\fP
+Private stash of DOF.
+.TP
+\fI/run/dtrace/probes\fP
+Parsed representations of every probe.  The parsed representation is shared between
+.MR dtrace 8
+and \fBdtprobed\fP, and can change between releases: on upgrade, \fBdtprobed\fP should be restarted, and will regenerate any parsed DOF that is needed, so \fBdtrace\fPs started after the upgrade will still work.  (Still-running \fBdtrace\fPs from before the upgrade may become unable to see newly-added probes.)
+.
+.SH SEE ALSO
+.
+.BR cpp (1),
+.BR ssh (1),
+.BR dtprobed (1)
+.LP
+.I Oracle Linux DTrace Guide
-- 
2.46.0.278.g36e3a12567

