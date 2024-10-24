Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE9C1C4A0F
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769922; cv=fail; b=ajFtv+fqSdgCjIzajo03OMOUgvcOBMLUeWEo0MqTwDxZH31PGIzuKbXGRN6B82XDkU13wmyXN0YdoiTFHGat6OdCSYfoCzUh8JP5KFLvIKCdUgO6LZT07Xqg640JeJ73cuP0cLsKC01/gY7z6u78v2p/zdCv58+eL7L4BttYIRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769922; c=relaxed/simple;
	bh=ZX5Sipjgjh7LwZfh1zOh37NVEImn4vjFhmMgsfIsCDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aCYmWMc0zk9nlKfJDY97wWqnQaqejjXhmsfhuryk9OwhYL4mNOey3QprxJAA4r58qnrM8oL06LDCDbLjFA8vTw77g+eWo3xouCTKiZwRIfcs4Q+0OZsL3cwP060YeTeS/OpXquVUXGqiOkbuky9Ar7GVMT18Cu9E6nQ1MsNirCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nb+OSFUw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VsE3B8Mo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nb+OSFUw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VsE3B8Mo"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2feNq029764;
	Thu, 24 Oct 2024 11:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=rHeKTaSNKFOaA6WnRWUPrbbftMQcVXzqnweTVjJsKQw=; b=
	nb+OSFUw8BlSeLdiwYe0K02ffYtp4tPZxKi357sJuFs7dRXHes2/VtW0/D+EFsN0
	9GhmWZGVmMwMkUyIirRDpKYVEPULEei0sVs5HvUlhn5m/ZopO03rGolI5xn6qkn6
	QdaxOT2SyCgnZltlUVcLTvrCKnzjYpJTlugF5x7iQJ/Yg1g/EqWGAK5U5TtDjDQ3
	A7twMRVmyw2Za+nrBvhJj1BbxAE0t++nlOAth+LrBNDHWZ/cvQeEQrpro/e8LLSH
	gTBW1jLX0ooUfnFhrBV1ABau+OgkFaVi9MotYldNfa72t9YLLqDTlrtM2T5QMgj4
	S3uMqH1yqRJ+k4ys072nag==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5asjc0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAuppY039487;
	Thu, 24 Oct 2024 11:38:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhcbqfa-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6kOJpdOw3d9CFlU3IWR/Cx/sPx4Z7wm8rrCpbtVI1vvwKdaudJZoP0nYCJ735xUNNYrNMELLWzY6QeOQObTlauA3/zQGNuHBIlkG1N+6vhVbU01sBfUJx9B1cBB4nU+/i/YSbt4BGzJZcV+cTmHJ7NfQSlRn/Ad0wVTOIyLknyndlN9O1+3EU53iNxwt/JUOuh0eDWw5ST3Ij3DU5EB2krFRavD4+EguSlgsQT5T2jIOaruTbJWoUtcj+8dys1iPa1GymaUdRRY+QieCoK5cfgHUuhPvzermXclyl7sczqJcrhkpYFeDnaKXMJ0Mzot9ZK+WVx4BxU21wNdIicxTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHeKTaSNKFOaA6WnRWUPrbbftMQcVXzqnweTVjJsKQw=;
 b=U5iBaO5qDbrXEAyaB/Tj7k0g6aSHz9LVrSl53QJNGInlzLCiu9eOpgbXGUwtlRF672IIhTbJyI5Qiahj9OHWhYcxZFd0JBFt48eoS9YUsXfk/B5IFvOEnakQzqHNRPbmyf8Jp3luRyuPWK0uKmOkIIs8Q/CNtUCf1t9o6xPYi/myrszi0oi1/4WswZJjR3b1EWbYsYaM1QvwpJ8mlV4Zts7dJCVbmxP3FmxQGfkwLLHRX5s5ECeiPkJ2Ymw+8nm37cwHb5sWgM+kacbUifcpzdvrE6Gd8rflhizO4kmUEq8/HLJlZd2DH22SXHe0cGNPn7vkD7/lukGV4Bz+KQaZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHeKTaSNKFOaA6WnRWUPrbbftMQcVXzqnweTVjJsKQw=;
 b=VsE3B8Mo1IshK0DZUcF1/E4TJUTE3rsMmKbdSCSqrzhNoryrLvrrgFiE8zMj9oaPs4TnUhQJTfhIzyBmbF53enR2hRpSiM+xYOOW4+aCuaIuBK01aXUU7r0rjzxCgM0NNdBVzXVTK9JEe+crKBQsE2VqmDnBxPfuggKJESDVhaE=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:38:16 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:16 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 07/14] man: the synopsis is ended with .YS, not .SY
Date: Thu, 24 Oct 2024 12:37:51 +0100
Message-ID: <20241024113758.182050-8-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::6) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c7327f-90d8-428d-b71b-08dcf4205999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nVXxFoEPXkxg9oPpahX77KMcWXiibHHiQFfGNP0RhnPoIK+2POmtgWcWOSus?=
 =?us-ascii?Q?aLKT+OZdheIxke0TMz5xZDpgnEuaTC9KiWGKFRUH2x38fWqojwS5Y711FLn0?=
 =?us-ascii?Q?O5CJb2X0/pBvsULUnZwFtojOl5h6T3skVVr4QgafAHB1JQTO+FhhqWKCjs0k?=
 =?us-ascii?Q?waHjXTt0d/92ZMmcpiT59hu0U2OzZPL5DQgZ1s9D3qZdq13BiSQa3dhHKEZ2?=
 =?us-ascii?Q?5fhjS6hY2zXUuF3Rv+83spIsyb9dKqxVJJOV9/UVNdCdRv42X8spuACYsqtW?=
 =?us-ascii?Q?FnfZsQy3fPmoASddjLV9KYAuDiibQ2OIuDMoCXaOF0JoLt5CnFPCOBCzZ1mQ?=
 =?us-ascii?Q?STNUAGAe4FY5dNa2a50SskBqGWwN+EdA9TevgwzPUa6hrraA7Yky10IuXqax?=
 =?us-ascii?Q?/RBxXuEDx6j5GYLfi8LpOSDtk4Fg/kXiBkK+hWIyX0bdmIDZ36AWHPaLDnUK?=
 =?us-ascii?Q?D2yIdLa26xnm94OLY47hZpgNK/Iu7RbRVmIgUEIxoBDChjoqrj7PpJu58QWU?=
 =?us-ascii?Q?WTHHzCDTt320HxzcEMtXssCwfayQfRtPdTBLI71oNlAspyN7hwHLz1CoNqGL?=
 =?us-ascii?Q?MElqpkGS/bNn3t960LHhuMGn+fAYud7+5ONh4I4na8iNoPAz03gpN9pMVlbM?=
 =?us-ascii?Q?c2rHBYAHUqX9r4lz/sgNVrgnPNKR4xFEdjcQGakd5X73K5oIttUkiACUZJr5?=
 =?us-ascii?Q?T93Ufhfq7eBzkfyC2O7VLKBbPdvcMWSNIowoVdzcXNiFgusFoeM4dt1lLxJH?=
 =?us-ascii?Q?kkc1gD35DUvo0M3fhL771hmHax6zk/pLpDCAKKah/PwDVJIqF15fP1QYHcyz?=
 =?us-ascii?Q?KBSJ7BMUgWVDGEfbQi3Y4k1Y18AGcqe/tz6+duTJoFLk1k8C2FKPS4s7Bmww?=
 =?us-ascii?Q?lortZqDQtP4OCGMrjiAB3u2XUePrJQ3W/3QN3UPqJ4zm4s+FVpFmeGQXdSSh?=
 =?us-ascii?Q?Ijgy+9eTI72kpA+RRqe/y+G6kEp1+fyDnn9y/aLvsjTkWxk7h8bcMj/ANcQv?=
 =?us-ascii?Q?29oeEbveM3CITypcTVzrth507PxbG71SZRjxA+wv/2uoUlZClxq966iGKdvC?=
 =?us-ascii?Q?h39jPi7g3Y/ecBA2WeKdnho2eORQM7hfLb4OZQZitTnOCNPQSechU+jdTb62?=
 =?us-ascii?Q?FzBLz7xVDZfhk9vk0I57YDP73yD/+P/hhR3yLjMec1FUpj9sJCqR1b1QMert?=
 =?us-ascii?Q?y/woVgDDcJtPQSz81X9PrFdO5jR/0lW/a9g1XvDy1dAsokufUlEf7xsFercP?=
 =?us-ascii?Q?j8nTx8H1qzTb8+c4pHJe2eGy/9fbi7GBsRPqMfkJI2D4+Z14JV/Nkw1jVKxs?=
 =?us-ascii?Q?wCJ7q0H+q1E37k3IitE6QJEU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?giLumG0agYfZOvAwPw1egTBwZr+6j7Omwv3EJ8Jfuw1M8aTSVzVtgokriPg1?=
 =?us-ascii?Q?nok3GGEqxnpm2L4WejDlrKr7Ih7PtmxXcFOFOIbNOYqVPex1PUFEr5v0Zxpj?=
 =?us-ascii?Q?oD8PEsLmiMTt/gXb354C01DNODiXcy25rK9ABOi6Xm8lTr3AzlQG4NPB1D3I?=
 =?us-ascii?Q?QjD189h3GLM7woN1DulaJnzC4hxWp1hLjERoieUNkYEp1upUHK4JoYdCHXUY?=
 =?us-ascii?Q?6HvKAyBqe1JI976F7lJN4WW1uxIqLmZGc+pDZYXPZwhGwQqzG0CJzvKjgwCU?=
 =?us-ascii?Q?8dQIpP/+4fVD9NFfPOKFXhuBGUcNP1MVofzHZVmiClbnllZQyF1Ep+tdMMtk?=
 =?us-ascii?Q?lxeCdr6nFlzMR1VUgrsb1u5IJlK5ncZaioWFWo1jb/FEhaLyr5vLb4LFiR31?=
 =?us-ascii?Q?xLMhPCVbYbrYKzt0dBTcencXHwIV/fhr/Pp8TqiT3/RfGtMt8Wv6lCwoRyVq?=
 =?us-ascii?Q?COEybxeOtFMWW4LjjcAzpNvR3QPyvc9Y+/NzvuG7lYrkzt4dOUiLCjvOiig1?=
 =?us-ascii?Q?gqKz0zi1xoNDG0upvj/NeHFdnUMkXHKFm0DdO1xHPb44sXkIN7je6SbLgg9B?=
 =?us-ascii?Q?sFoK/+YdrL5rezqhhmLn9DRphnvO+JmJzj3Pr4xrgGpFKI2InpKja9ywunHs?=
 =?us-ascii?Q?m+/VrOitnEq4AOMA1tOnz2Lw/qTQFUv31ZteneZE/FqZayxmWMaffXZXLEDn?=
 =?us-ascii?Q?Q3CeRtsMrGQ5Iwv7RnN8L6GKxtac4gwOjxDcRnSvOMkOxAhKUCIREyIkuE66?=
 =?us-ascii?Q?IBpMK49lgDrwwE2Sefja0v1zeHjZrO8tV7pd0T8QpgZhe6o3HwLknJgCsrTJ?=
 =?us-ascii?Q?YkfKeTk37Kc+tWuo7vS78/Ppn5Oo1h0lU+SVbKXIygWiazKkbOkZQvUM2ico?=
 =?us-ascii?Q?ouuuJuuqqkTwZsD20jHcmpe6tVgY/1JQDuhRKpTE9cr+PFyvccTnU6WIUwnR?=
 =?us-ascii?Q?RN4fDnh3qQTQOxPeCOSeCMlxdAUDd2U3m2FzfcduMocsNPB72oOaiAptb0AI?=
 =?us-ascii?Q?jkvmHOPx8Mi2w5jApsJH+dl8Mz8YGv7q9ad0x0SEHcmvb+KZxHxPqLAB1+MU?=
 =?us-ascii?Q?uxwLgWb96QLZE2LBDfKKuzJemeseXw3wu/8cpLX5IFkYQQaLjbK381XyQvA4?=
 =?us-ascii?Q?mwLjU3oD0CtiCYYGgLlfnR1rsmbNxmkcprtyYCSFlGgZbcoqN7wqwTzbcgXp?=
 =?us-ascii?Q?CORGnVKYRCF7aQNpvoq6VTHPWEVL8hH+rmsbQfRWyVglq/isJNcr8iln6AvD?=
 =?us-ascii?Q?UEEqT1ba0Ss+AqV+rzlJu/o0NhDqeIXrroRj0QyzGY6nN3X+r9aukuxehpca?=
 =?us-ascii?Q?cddq3CgV8l9oluJMcHukQNsARyoVT8Oni4++85yIi7s+rfvBzapA1vy65nPb?=
 =?us-ascii?Q?c0ZYbcW9Hcfxow4VyomBE0efB0SLjjndhZzNb6iIqB5HeXSlp0wN1nhYM5zs?=
 =?us-ascii?Q?/CGKXnrh+tB2V6SDWUHToFq+IEhwjNUdelYGSH4Yy/TSbx/px6iV0f2ggXkO?=
 =?us-ascii?Q?sU+PMv/mxNRDoAMuOLahH/K7z+gVv0H7pnFkq0osiYqs8w6v1l2ASZw5nQwp?=
 =?us-ascii?Q?pfjmbUhGFlN2apRgdVPG3TW2x5PD/2DjGBL34HrztY4K0Rwm8Tx3qj4iLqEO?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cAnX8S8ScFbHt+X4P6Hk3VN4uJsNMKlp4BPwddd9B12Urmy/wGNAoPZCtzc7DjgxCdLykH2D1hhwJDM21s8Eovd2Xc3oZORdT1EJWycOr3jgUfsVpqmJzqtfVIcDPw+pok4T3r0VB/hOO6vGIPQPLXSCm6kgTkFcKvLFU+6v8wv70iaQerrG16mSfejM77FIwg+EMFlHX2vFSjugWLZxh/9tm+99UaRGa1tsLoR9pXr+pWwYt0Z5Sj7QHqXKE2DVEz5M3E3guODyy33BykMVts7w9Rl+ku6w4Abxog0hzdn8TxVtyblvHAaFxXDQNo28p/5yKKugDVkoewbLdfrxcNQVRKvnocgwNXu9BpcU1C3qjGa2NhBmeBCa1vLwqB82t4OqoXqHt0oTuntFHWUX5d3dWs7t4u6eLTp439thNF/rC9Hku8eeaBeDx3Eoc5sj++uH+NAP35q9iG99j69DKsbpt+q46V11VGyw706+76/mrMbYw80FH8KefCNYEe+2mjgn7ukl83ToPG30tpkaitji+VoSak/hD2yeBd/9kssWUwxkwgDVETPh6JeX3I87QC8zMFGC3htYOSanwh8OLwWdT+y8PmPDLKh+ShtwQFk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c7327f-90d8-428d-b71b-08dcf4205999
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:15.9882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZwEnIvJbyu3kowJUME9OETPaCrqR7k5dkOLVwHvtUO7rXkg7lAHAsTHlbMSbYZDvkfrDu/8NH3r4vJVyMe+hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410240095
X-Proofpoint-GUID: tHVwNTF25jydAf6fTtbyy090azQfDQdg
X-Proofpoint-ORIG-GUID: tHVwNTF25jydAf6fTtbyy090azQfDQdg

.SY *starts* the synopsis.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 cmd/dtrace.8 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 0a1a15304aa1..940ddfc65d1a 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -33,8 +33,8 @@ dtrace \- DTrace dynamic tracing compiler and tracing utility
 .OP \-n [[[provider:]\ module:]\ function:]name\ [[predicate]\ action]
 .br
 .OP \-i probe-id\ [[predicate]\ action]
-.SY
-
+.YS
+.
 .SH DESCRIPTION
 .LP
 DTrace is a comprehensive dynamic tracing framework for the Linux operating system. DTrace provides a powerful infrastructure that permits administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs. 
-- 
2.46.0.278.g36e3a12567

