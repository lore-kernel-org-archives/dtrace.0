Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AB11DFDA1
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150300; cv=fail; b=e+eymxKhol67K3fa3pTEGnZLfHNjZLwBuXUn8kxd23dxFKlCMOSCTanspUMzAC09oEe+eWa2H8J20aCNi2Ky/pt5ei6mGAfCcI5pHKbkIA4yOTtLHMg0DqWDp2d8mV1PpzShQs5hxSUaLqnY+pAu5EecLD7gsvb/zNkEfM5KQmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150300; c=relaxed/simple;
	bh=oi7SPmCCNcbhF6ggnxYDYV9h/XrmghiPFJQto2hKhRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CNzv9CjtgNSu+LTiC49X2EG7N1CkNPUagqaVPk+D1z0Emd9qkhQjfzrR38y2rYwpY2Wspp+c2dmxf5LyVXupzIpD9OCZaAf9i7krpo2eXWqmEp99L4R/cuDLOAIJkUNnop8OGsmP8/2DUl7qSKVv4jM3dXuv4jXwqFKpni/xZ3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bhalKJj5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wNDNDgQ0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bhalKJj5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wNDNDgQ0"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtZDF020917;
	Mon, 28 Oct 2024 21:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=t7Ydb+f2gPaJ5pI74IUR3n1NayvzICCk/uzUNW8CNlk=; b=
	bhalKJj5lPQGy/eZs03VSqtIUSJ5pT+4vGG47a1cuePj//zTQc4CmEZ2zxrD6kiW
	pEubBsqo02+1S60CICVd68Y9hCq/pds0+O6dytI2fVx5Nzc5v+VzW894/QmzPePq
	VOoi7sEA1xwQJFe88QO3/NUAXzoC0/eRbEVWklIYqSN35CBBGe2NO5STAdXU+XCV
	9OpMIz3Ctgs1JdHgtM7qZW2cBf11PBsnmHyKyks+TsllZdkMQm94n+7uFi6i+NRU
	A7sY34eDy7AQ0/C9KhWUu92i4p1U6gnszv8dCqhIGLcxANxZ3OnTVYaMud0iDwDQ
	2A2wB04Ye1nyTBiVf21R3w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp3yx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKgdcJ040770;
	Mon, 28 Oct 2024 21:18:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnan360u-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxlD4Yua3516yKyqmMMv2bP4ntZDmc9SghlctBYMUl67SxYRW8XTB5OWtnKxS0RgmpMkgs2/9Py6Rf4jySSjAwJfq1djZOEMO0EfaYNfwXnoR/VjHlyOSlmbnVXLtBZYbYy4HYpSPhlpM4QuPupzeC82mUVtrjsAAysOQDjhw20ZEV/aSyG8kVg8m6eFM/uh15gtgYubBM5ZP2lcDZGxvG1EcsduY6TqlXch70vdRbFtgjLT9yCg5oRUNAx9SbDeLGgmk1biHQCwZdZvaripADIHGDQIla7MUfcgyYwMrfFFguRLcjkpULlBT/c3eA7FJQrS1KuD7r66QtSA+aXT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7Ydb+f2gPaJ5pI74IUR3n1NayvzICCk/uzUNW8CNlk=;
 b=r49AFJ0iGlYKFzn1/5aYjVT3PyynQcrSSu4p5+gJ3xf/DZ98My8nhUqJOOkzQojGe1PTirCWQSom+uee3kfVvHYeLwGxue/g+dwFMeUDOUWJmFzgg43wzMKFU5uPegubehMvub+RB8VwNllFUXzoNR8d2pnj4a8+mAYjf5aJVwHO3Au4kmb4whSAFeYhdmLkWbLTEuHKYkizAnLRIckUUPrlDD6r3czJPTPOJF28ucJi3nWj4mS32qOUhfId40j7SdDSAET5+uEZhvHDkltFUUTc7+WyUhUI+NEkFCDj4fhRq5T3SieG+eWKfV+twFs+cJPtT+NqxNvNVvUBVvA/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7Ydb+f2gPaJ5pI74IUR3n1NayvzICCk/uzUNW8CNlk=;
 b=wNDNDgQ0WYjoRkNFjQsOAejeqataSWBP8pZe0kD5AXF+CNnf2/kW8fbyeXilyF8eOWZQzju6eJIqJYW9SXrB2mCZOrkKS4lQXe/sKLAxzlQHAHl/NkXk8MdmFPkoKQ0NnKHTRhM/UCDwaNGCTrpzCZNAPnPLJ2N59OGk85XlII0=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:11 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:11 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org, Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 02/14] pkgconfig: drop spaces in variable decls
Date: Mon, 28 Oct 2024 21:17:51 +0000
Message-ID: <20241028211803.458685-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0129.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::20) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6bca2e-8c4c-4c19-4cd9-08dcf79606c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xGllMafLJnGSYJyPF07yGC9S3kMPGLr1IlTVbOmQeGp/pufKfj1RrbNrW5f7?=
 =?us-ascii?Q?6Y+PCkXrNkOlMGIocy14v1x1mpvDtC7d+3eU15xoTP/yeBJdq7bQL/5aiff6?=
 =?us-ascii?Q?oQ7qVDRZvyWSpTJj7xmJhNhoGGFF/g72r1nX15ChTr26XTGGzwtjxonFpE8H?=
 =?us-ascii?Q?FfhP/w/AeoYwO9TyX8vyQbCoC8zHB6V9DBm8WlmRvHShwYsOyvF0wllF1rnU?=
 =?us-ascii?Q?7yOfWm0TZ2EwFaBkbE4gHwHH1Tf6V8ArEMTYo1An6N/kXGnSRmCx9ha3qiY4?=
 =?us-ascii?Q?CFbPSGNKUTMxtTwk2gmWkAozS9BFq2HrVhj2dbUtXwXfzwqrDHYqohpbgY/9?=
 =?us-ascii?Q?FsKg4uH3b85LcNPI73M+oQ0UReiy1hdQ4yomXnqRbnViz1NmR+kQc6LIUbUa?=
 =?us-ascii?Q?P4zOgO6OLWmsbPNKkuLxySpOyvXLzEOfm4jY/DvrWeO8jabcbaTmDf9zFZki?=
 =?us-ascii?Q?IqIbcF6JcqCYNrcL1HHswmrjax1e1fMh605MB/v/Wwck9hW64J3v4syOfZif?=
 =?us-ascii?Q?NmBmYLUw8C9tsYs8nn2grGRevhqFYdQCfxWXUlNZlfS47C12GfT49O3uM2IX?=
 =?us-ascii?Q?QL4zEpDTnNXbxiqSCDiLudoiaTXxKJbUCY7+Sg8ATKY08pmcCks3cwcLMu6X?=
 =?us-ascii?Q?c2BXcQ3CbD47F932g1NH5czhtMV51WmmxcqM/h6CmonnR7C+MNQIdidWuuud?=
 =?us-ascii?Q?pv56/ozDeGB9z1Xey3o6MyRxKK7vb33ANvUBdD8+BErt6dIEcYxDR//HW4Cr?=
 =?us-ascii?Q?acfLYDrJL1duvyp+BknqNUl/Bq2jfh0n7se4+VH8snChoJ5FMxBQVz6Rt5w4?=
 =?us-ascii?Q?TDs0fMR/d6l6WWxbQ+1u0LRLefYo4PjwcBgABzzb5t4dprdv8NPAeYXRbq1z?=
 =?us-ascii?Q?yuRMA+P1bq+FIdMgZg8CUN7JP+giVMRo5drUysn8ekHblKkkKERv632jRlsV?=
 =?us-ascii?Q?bTBiJ/O2T+w9dw9M6i6gp74Gpe38j9uylG+Ru72YLU+QE63fkmgI0yg+rrQR?=
 =?us-ascii?Q?UlVoraQ/CfhiGZWHcTgJTDTjw/IjgmKB7lOt+ia242V+4EFYV32UmZkWE92p?=
 =?us-ascii?Q?OJ0IqkKYp6DErVZ/iMu6rAym/XuYLZuBw76CL9JL9eoXgaN0fjU1RnNpSK+9?=
 =?us-ascii?Q?2p512VMYHlR2YiL8mU40SI6oxo5WOmTidlHufUGnh8VMPgeaU1vV2r9taVjo?=
 =?us-ascii?Q?LiGRL526dkovtm09vYtN32QZpQOYwwh8wBXyDbkEi3QGaEJWQwX+8U2bePld?=
 =?us-ascii?Q?gzYrs3pz3LgfMcEE8PI3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TMBLCtpbLdeu4rQ+wVKhbg81K/LPDwGaQpeFBglVDE1NOFYNHXaQUAdhwAvr?=
 =?us-ascii?Q?UWIUqIUXVKqx2lHMdQzGtEI/Ds7Q6mGrBEb2vyYvsv+s4JF7M35ejHdI2z3+?=
 =?us-ascii?Q?Wz6acYO7ekjWbY0zpdxoBe3OGyXqjxnX97uTmKvGTdrWMhubCGliNmHPq2Vw?=
 =?us-ascii?Q?yaktJHetniwNP6kSDXSZbF48I/QRD6CCa7d7+xvZRL77mta9u2dbo/DMxPAU?=
 =?us-ascii?Q?oIuEudRRjx0BRiN2AqkwhsyWyL5D/vJYi9XLxEZO+HIp2jqjagnaglSv9Dn9?=
 =?us-ascii?Q?peuxEakCrwwUo3wphvxMqtUTnadB/qY0US3icq0OZzN+NK6Dwa0OnBu7sFRN?=
 =?us-ascii?Q?owCNH9i4tKOVbCB3WRMKdptSWHkY9XWM7N/v7uqgnc2dqTXQocgQU9E9uDZu?=
 =?us-ascii?Q?SC2gPkMcVwuRHlKWvrkLbXjzxG8XHl5SS9ltl2mAnAMUcfoLTrvZg2/IGaMu?=
 =?us-ascii?Q?jpTeyy/Hd79LkcynhYmkd1fQfY03TvmRdfqCLBPnMrWwjVaB0yCSCDqFSaM8?=
 =?us-ascii?Q?kDtmVEdx95dkMPXc1OotjZiwtRiUqOz/NL0DMm6oVud7c8DyedjqWzztIm6q?=
 =?us-ascii?Q?jXMd65EZ+xy/h91VYBjKNJFAvghJTaI4g+kFswSuGjaUjfdqtOq3fA6TD+P9?=
 =?us-ascii?Q?e2dVHuMAMRKkRUN22WV56ITM7JTjWLGmE/mD8VbxwrpZ3/chwgT5fSG8f+Ri?=
 =?us-ascii?Q?aAhMNqKebaug3oSlGywbDchLfkJqZ6bNKZsEMKKmrYV5UbbARw9LaPjVZYfk?=
 =?us-ascii?Q?Gt+0/t/EywRd+w/+py67yDeYtNQ7pDKCdO8uIu7eZWp/5VRH3XlMgemBBuj2?=
 =?us-ascii?Q?w7t5v/h4ZOXwKnEOMeUu+/HT481QWfT/WITjefUtfhPR9H4+foG3L/LKOypO?=
 =?us-ascii?Q?8TH8hRgh7LkZUwV8mlunHz0yfcQ9O7VjfYGodQfgR0O2ZbZ8ce7alMi+21aW?=
 =?us-ascii?Q?Xy9FHZBFf9aBIHUndOV7o8ukK4Mcj1ITuEznPnHfGlPFefp/qJrDnWQyLMB/?=
 =?us-ascii?Q?KYsBb1lm97YN7uNZamXvpb37z8SuOt7TjqrJ2y4/olOv7/AymxTx3If977Yb?=
 =?us-ascii?Q?tEarUeJxZHUWIJ0P7hqAcls9Je98hbjoDcN59H4qjo9jzaq2AQjrWzu2Phbo?=
 =?us-ascii?Q?tY4T5PWIY8qexixdSs0Sn0wlV3+p0YddiLWA5mXkkdCtXwVQ0FB1cPEERb1p?=
 =?us-ascii?Q?FOwtgBJabUssSdYXWZEp1/BLG+8A+0NJPtLDFnDQIS7fVrg7qkwL9jOQ3J+d?=
 =?us-ascii?Q?Cn+RMRlCnVM0glJOiPuyOf1q60lfG0uhorcBTWY031kdcuEEFd8rvUxxmtCw?=
 =?us-ascii?Q?uRdBFCcPni3W/EwsalO3GduB6F02wGUl9hfr2DPkfMBa2pgIZmIDzXG4BXM4?=
 =?us-ascii?Q?4YmEACJerps33KoRMpoTtbcGkRDhnAHnn/Vg163e6sl3n14Vec52Bjv1tpRf?=
 =?us-ascii?Q?ilMRmPXD8d5H9H8EPtqfkYZ7IyfNCp2pns8LK83NCQFMESLnyTu2AUgoRNwc?=
 =?us-ascii?Q?I8QCgdcrHrK0qjBkqWmg/AubPillcUSuMhfUuRx3uOyMkkj+ioDfXUdFZFX0?=
 =?us-ascii?Q?/9Ms6J5o6YgBxU4kzFyPNnilGD13rUTwheTpvWQI+w8LX+KdLGVUtMak3U8Y?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VSWgs+nAf+XpkY2SNiw/ler9wE7M5LqBavAgnL6W0C9s0ROY8YIcW8c9AmdmGp+VtoK2qSRSaQ1vnywkKmQ9JqC/2oIeWUeQKvpO16PnfEgARAI8mBLCExxuZogK+HDH9NvY+rAEyLzx34bml4VDQzKBjutluWwg156WEMoMdPCHtEqhR5PW5j66BNqwxLMOOYMUssxoGmGoaF/5ANduBDXpEAtI3Dxo0mR94zbC99okW9uQMhqw1ReiUaY9pm+RR7YoC8JE2ZzqKiewaUoYQ3JdvXKbD/TXxQzGGzowXx3GsLi4QeJ+TgIm2honVMvqMvRdj8lroJ6g2mog4OavPdLoLHOpa54YzVOLJwxv4p86JY845xo8DD9UbI/uQ/Ae20M9qkrqSAd5jsclmYaQdLhFxxwlXJwS6njmI78GfxqghWI5BaRZBSj75eAPIiSDjHdcmVFlni9yz8T48i6Xi1rKDnjPdFGYgVz/gcPoMraDJCYLeyoiihEZ3NJjHvaC4V8nv87oNyjJP10qR2GZeE2qemxxK/+1SmzhiE9E9127GRn6hSCuIJacaTi62xLEPiByxwZG7u1bWeRSdjKuBCPskHYTghQqajWUVDZvvBM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6bca2e-8c4c-4c19-4cd9-08dcf79606c5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:11.1800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: om3mepi28opLbIEQ8MGAjGuIHPwMLtSCjkz2yWnfz9VzNbWeBKKoMSx+9d0C6GHNfajxlQiGFeBPXIumCI2Ttg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-ORIG-GUID: sYD8C_KPUokQb-BLlluKjlKm9Ucp6CSb
X-Proofpoint-GUID: sYD8C_KPUokQb-BLlluKjlKm9Ucp6CSb

The requirement to have variable declarations with no spaces in them is not
documented, nor does pkg-config seem to care, but most pkg-config scripts in
the wild conform to it and pkgconf --validate complains.

(pkgconf --validate may also complain about the Version lines. This is a bug
in pkgconf, <https://todo.sr.ht/~kaniini/pkgconf/15>, and should be
ignored.)

Bug: https://github.com/oracle/dtrace-utils/issues/105
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 uts/dtrace.pc.in     | 6 +++---
 uts/dtrace_sdt.pc.in | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/uts/dtrace.pc.in b/uts/dtrace.pc.in
index 9977082c5a7c..fda6f755166d 100644
--- a/uts/dtrace.pc.in
+++ b/uts/dtrace.pc.in
@@ -1,6 +1,6 @@
-includedir = @INCLUDEDIR@
-libdir = @LIBDIR@
-dtrace = @DTRACE@
+includedir=@INCLUDEDIR@
+libdir=@LIBDIR@
+dtrace=@DTRACE@
 
 Name: DTrace
 Description: DTrace consumer headers
diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
index 32474bc3f75d..90977661b761 100644
--- a/uts/dtrace_sdt.pc.in
+++ b/uts/dtrace_sdt.pc.in
@@ -1,5 +1,5 @@
-sdtincludedir = @SDTINCLUDEDIR@
-dtrace = @DTRACE@
+sdtincludedir=@SDTINCLUDEDIR@
+dtrace=@DTRACE@
 
 Name: DTrace SDT
 Description: DTrace raw SDT headers
-- 
2.46.0.278.g36e3a12567

