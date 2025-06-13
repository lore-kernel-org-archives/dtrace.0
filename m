Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638A51C84BB
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826288; cv=fail; b=YlYlCt/VA573DCr0KNZB7cu/hPEZ2zq1/0cDHn1m/y/8LAhTC6PFhdA0LPHUMKwHpV6I1uG1SuVom94RSJxm6zhSRWOJhtzQTfQWrW5LZVEbVNlR9vQbgOji5AHGqAMtCfRH3u6mcItU1jJKg7TrPTRBGNQq+cqtz+SP47GMGWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826288; c=relaxed/simple;
	bh=HLf898JLwOeivHA+6MuKcnJurvlMRTn2sTuv4b3yVQE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=RfQCAl7Dv5p63vpYZCpXRE5MrA0TQ0OXSA1UiTlgIIUAHcSfwfScCPNKYVY3D78nk/9meC00vmEbpirWUaI/F9n1UGmBsNn6zU8VlGJUswyNyy4aOnr84IkF1WIr+Md28DtPjC5FbN1ALhId8dW1MXp4XmLiEq38S5dwLrugLtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Kop4pyzy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Mk0hotzC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Kop4pyzy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Mk0hotzC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtdHT005753
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2jdUD4rlLegpKi2REK
	Ro07L8GmtIFXfDIOfn9PJ8fWU=; b=Kop4pyzyYFub5sVjEFbVQecWtwdDUiNRoH
	dfZ0EcZ9F5KEuULF9aM6jJfey9n2lyXnPajoCiZ0qAPvZf4sYQsIYqJsIG5CN/Sm
	4COscakQTE0f5vihmRAmSQZTcKD6JFmUSpMdxiK9L9C6xjuJl6njFf02lJxub/1h
	7CKsUxgGCXGH5nIjbuylw6h4QBHy1DoaJPwOMZZ/uDO79Na8WOyo6/CFrRB3GxTQ
	VE8yakTiE5ypMPwZdYNyElOtAGey00FBnsN39t7uteiT9uv6pB2KpVlenIN/6jo6
	d+b2KlEMBwikD4zRGmVQVudlChfwdMpXcFpLnxOTZy9BJrae4DcA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbekqkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:51:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DD5tNh031995
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:51:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvd0d30-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:51:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHb7T/XskY+PlcEUO2I3Ke/64+WOARNZLz9pSWaqkOyL/2mlXPt3rzvlDo3ufPnZzJwOtiULlD4N/3vX7j3xx92efEYX4jkL4SUQ1zbnOeP4yF99zC1uzBAn2jzCarM8I60t+afW/z5jr1Acp9NeiNqCUgOj5KNRi2UndkZ05VNYjwgTSXHchN84/uUrffdaZOGhP++BnAXv/Y0GlYYWMKh3Qd9+6YaCrOGjsjwVO1LwVMwu4L+OHd9UICkoru6l6qvvxROqTBrtIZzYgOQtxPU96N7iTX83zlfOaxp44MrBHcMLQDld598Trwkwtldng/cd7pUDjfOQ5bFuDF1CPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2jdUD4rlLegpKi2REKRo07L8GmtIFXfDIOfn9PJ8fWU=;
 b=fOQZy9jvZkHUyQkyp0IEa3iK/G7D4mP9xvVa7EZpRsIShhalCGhbzc3abtesNDDhnrjEgwKeCWpYjIjBacXlhbhR5OPBXgHEKOXxY27d7ukSnKIrQ3L6J33jsWTyecSKHnqirFIUSAZPFdO4vKfgWxWi7ZrM7bpAMF8AIcThS9qm0eIwuqaWM6puuOPb08Ba4w114AXdZNX93BOC+GO7YM7iZUGzJqRnUEJXL5/OtNm1HkqxnhgII6i1MfL8+0tfLmhBsD4Pt0bXlczH6k6bDzckF5oWyKDnSI1DVwPxpo1ccfNfAWuI+dqfKgfyQlVdr8YGhO59iyAIbLg2Rh4IVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2jdUD4rlLegpKi2REKRo07L8GmtIFXfDIOfn9PJ8fWU=;
 b=Mk0hotzCGblwG0NJCaP6uBMgEPSnmVtsSF5101C63/hX/K+ZWxlMAiZ3oP14SNce+sjKvIxSjePrZrfUmbA6PlQ32eGYxWxEKGp6oC1D8ZDa87I0rlXKh1Yyt/vip4ZQj6Rg/NZqQrFSCuKhvmPAu7rQRHmH0bXXM626VGupOrw=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CY8PR10MB7267.namprd10.prod.outlook.com (2603:10b6:930:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 14:51:20 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:51:20 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 08/14] Test: caller and stackdepth tests
 for ip provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-8-eugene.loh@oracle.com>
Emacs: an inspiring example of form following function... to Hell.
Date: Fri, 13 Jun 2025 15:51:18 +0100
In-Reply-To: <20250522180118.27343-8-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:12 -0400")
Message-ID: <87v7ozbspl.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::8) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CY8PR10MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: cb589b85-c777-4a1a-ea11-08ddaa89c261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?177RB1xNZIi0277YfvJK8uUjgs2rJK9lksf6f2q55keLel2B8NHzKAof8QkB?=
 =?us-ascii?Q?WoWLx7NV0vpvP1z18rvmQnJTVVxIDMQKUi/MQ6zE7sUgHuE8nY/rbk95BmIs?=
 =?us-ascii?Q?VWTTmguwegQTWz/4vrAoFSKTRE4ZCmkbWA/fnXsk6OjjNyw54p2hNz15eAPj?=
 =?us-ascii?Q?ibhji1E7beahd+nc2WfKKdC3cPhT1f23beS0jTGmfOs7TX73BfUXMi8Ktdsl?=
 =?us-ascii?Q?301RBjiKd68F5m4OCcPSpI8uUqPZgq8U2BpQX4TYtrB6cu+0TymF+pAUxP80?=
 =?us-ascii?Q?1Yu49zuCxIF2WYeVBoLCcEs5x6aWmXnp6zZl5lVR8DGKmBjljvwC+Wc/X8TD?=
 =?us-ascii?Q?3cMY3dvwL2ssace/Vhm8JtiBHqG142jLmNeGJaYtuoCW+ieicRaZ2pNvaCXV?=
 =?us-ascii?Q?RxJyZdzezf4I+NT8I+nsfWMS9ZtNv1o5AaY0LBJAkuulvGHJlzX3aHZNP5iU?=
 =?us-ascii?Q?ubtxeWKhUGB4nd6CnBIszLliZxlUhpRydSjwcAFtUAppO0Hdj4UN3ykJ8d1t?=
 =?us-ascii?Q?1qDAkpuOkjy60QbNE4BYyIsZBhRh1xSUM4uM8gbkfpZYKojrH1GmcrK8QcEl?=
 =?us-ascii?Q?kW6VSolwblp1GUmQ3+hBfNFdtzb5wyXyC6GQW4uUn/epKv5q1zX/Sd6R0EX8?=
 =?us-ascii?Q?T8A9TuAkMGfAtyHPQBxvKSEQZqtQg8vg8gjU3vRlNOXyC1eCzLOYGlJwV0X6?=
 =?us-ascii?Q?F0cVJg/oL6uC9e0NQcMEH8W9Xo7OkeEMwEeG0hImahfuPatjWzK+qD2nOKFx?=
 =?us-ascii?Q?4H67PtotlFR4KRaXQoesqsRgK28rUf6Ws/AdxrlYvJFMa1PTpEZdWz4sEnxD?=
 =?us-ascii?Q?csnlsb1yNjLApjLBgsWFDt/l1u90uvhN4fgTmQqvMIU4nqiFHVyz3se1mPqJ?=
 =?us-ascii?Q?iaB9UvMtCuVdfsvJQ80/bUARQrhLpQENSJpFAftT3hAOZEFBSzN4HLPW0Gqc?=
 =?us-ascii?Q?E5q75sfQ7ml+3+AIoZD0cW4zu9L3M3hQ9KQSbBI2jm182LZIJ5+sIn4Ao9JM?=
 =?us-ascii?Q?wk1x2m/ZmLYdFN/MSRIIr4M5f29J6121p8/xgfQg9dfytzyAz0IK3QT6PZ4a?=
 =?us-ascii?Q?Q1wzQwOV69tGpR4Rklc3MbGhtrbdtxArl1ncHBE21OIcWatq5/qFUdK9orKv?=
 =?us-ascii?Q?18J72/W/XLj8QtPwKgD64Ka8BsEt643axMTNZfz1WVJv4CwtE0MhMdXOhLee?=
 =?us-ascii?Q?Nt45xGn+2kD5a5zay2gCR9/PCynu2n1iyxUkzDajbHJW0hh7TSwhIdfimRDF?=
 =?us-ascii?Q?ymY4WK/y/cfJumzOC92X2iycNtq+C3lR0eebgeQnGe2KK0bb8yhM/MSHHIKF?=
 =?us-ascii?Q?vH89of4EZ5mY9OCB76DIGODlrZa80KLngDybZ+moySgb82OCexTiXDxdewt4?=
 =?us-ascii?Q?pFH64pTyNtMhgUzMGjQuGqedkMphyl1+aX/dKZkM+X+RoIXZauo/cBUAtfMx?=
 =?us-ascii?Q?+AB/5sorFDM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/dpfrQAjw4Y3Qp6oZE3L/cH11v+eyqSai70ixo/9iXlUqHIvNRtVZ6KpWrQ0?=
 =?us-ascii?Q?ib/htheLj2IDNcUXm+IgFClDOIrn+jKKHqE4g6IJSO9jiM6ZHJVokFGMDauh?=
 =?us-ascii?Q?nc/Mzaz3W9JcMqEs2JPdU6LvMf66xHsXSu+v8S9n2uH2Hiihv7Td3hd4AN8P?=
 =?us-ascii?Q?a9gdExRj/9eyvKhIO+cclrtnwenHYkaakbBOMGYC0XHoLkGwJDYDSHAH22x8?=
 =?us-ascii?Q?iaMNAwEJWzizakUBVD6KSXduQpSfH8CHP7KX+GPR13kpF9BwmLPgtPK/jvIh?=
 =?us-ascii?Q?aeqVXqZRPc9wauuf8rLW6HCjOYbC63X7CfWAnsfGNe8ndamg27ldQy1yDh5s?=
 =?us-ascii?Q?aLKBzr2ibNgyKaXtILXFdCcA4WNkuHC9QC2SaebXVgestq5z9AMgTI046zXS?=
 =?us-ascii?Q?6p6W/GSXzWzOzD9/khOVVCpP7HYid4ifRk56wcLw/vhM9682d2cdnf5OLPh1?=
 =?us-ascii?Q?85N+F5Pta92ik8V0J/1jLRVAvYdqo9hQRFKd1aqM9ilY09VBHuKXwF4IAfjh?=
 =?us-ascii?Q?ZXceJ/3dEUOck5le7YRjvVC7B25VcQGTRy1PMdIA+MFwQm59/J6v3Slnk+RI?=
 =?us-ascii?Q?8oDrnSf63r0SsQDm6z/sPYr4UpmhojWU9DtOflMslaxfZRmyfKRp9HG1vBrG?=
 =?us-ascii?Q?NDrxGmDAruHPcApKCKLVE8yH6BWJXGSLH1Lv8e7CNO296+eY+W+V5qx0NIIv?=
 =?us-ascii?Q?zEooXQwDoaPQDl30kfu1W/bN6M4sqllhhV6AAvBP+zQ3n6mV3u1W9vig6+np?=
 =?us-ascii?Q?17G1uieXbfv9KKHBdRRj1e+o43OtuDeVrKIbTofo6m6NMm9a5eka/GrNmxX/?=
 =?us-ascii?Q?M9ETnMpmdXWY59iLVTxP1hHMlW4ixRwFWaZoHa78ajoGR2Mgs3EqIfr38w4X?=
 =?us-ascii?Q?yJjKEr5sjVivaz5IQwX7WYvhYUxU/xLNylu41RvaK1ef95MIjtd0iQIE84Ye?=
 =?us-ascii?Q?uAmfy8Ch4UN93SGfClWzlx6NBUjEaPIpXkiQRYXYyKKkgUbYa5WKYoBJNCNf?=
 =?us-ascii?Q?UrvGVCFcwX3i5fJb1amVLPSnFWkaVQIlEzx9jHZxRa6YVpsTYqHuxv/0V6Rg?=
 =?us-ascii?Q?ACbUt8ddi8xjXzX45jNTLMjL1zw8vpqW3OKOQuh60wR4x6HlqHrNefvXRMFB?=
 =?us-ascii?Q?acZp8XNb6ZxTmCEeJvJslEag2JFJj2a543PTxEyUde0JHg0eIPcge1WWB5Vb?=
 =?us-ascii?Q?XialYGEDyWcBHQddsNFVHQPoeeLqyhk2rzfJBX8cyIBdVVFcdzGUGPH0UsBp?=
 =?us-ascii?Q?qt1hPFdiiFAHXcGa9ipAtE2RKBaOcmGOMnxT6L7a7Vjh8r8BFdp8f9RpQgwR?=
 =?us-ascii?Q?r12Uihuna/e08JCF9Syb1Lj2i50k1f143e55q96r3WUzFLpXvp+gp+pQ+3lV?=
 =?us-ascii?Q?FEvUI16iYPRxpSxaOPCOE6EwkdpxjQBQmWRrO+NEuV0bVFQfOZg5U64GcmTI?=
 =?us-ascii?Q?DqjOt6jqnGnX9IEIYn6s8mqMPNGxQsR+gRVif8uj9RLUlGK6zCX5U32fVUAI?=
 =?us-ascii?Q?TQfW6kGCQGuxdkWhYPCS1wDYQ0bAxS/ccMP/gHWNp3qpNIaLJxcXrCxIRaUW?=
 =?us-ascii?Q?USHgVmz1kd0SdNrpe5BLycndgK0Lyf4RSxTTY8gi2SqqzS91+GcbQpXihmYf?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OUQ0/rcXNrpAI3u/z9frhsIl5GMlMukkH+tAPXyuOe0W9g2s6uS7DeY5UBv0kfDmiCAwEuN+R5P3fyg962zB1C3qR4DO8CtXJT0/wb7Ww3F8OMLd78QDW66SDq0PIGWmGSEgJz7R5FB0bUs+REvQkpTl9qd0IMqHZQyvdXRCqS04ALGTbCaQ0YtHbCi/30SUQTs3rirlFxcQ6VZWXTvh29+PhV1U7pWJBdZA3paXFwC3WflcGghRQJMjA/2tm+CH316gEcbdxoYnBbvdHZVta41b8rKn42CbKau6XY2fpMwkTWHJMVcMhg3veVfWbw92PWFRvel63Fzkw7hTZyj5to0I7cdOgLBU7cHdIS6NuPp8uykerHj2xvfEjVXE27F1KZEbhHtdyw6vZrpPce+SGBfQBUF08eOXiKT5LGt2lSDzy3tO4Pdz5pY52KA4kscD97YF4UA0xJHGBLiOXnuDJiqdewrrb9gvUX0SciskO8skUEvti8E1CdsFBtV+vti5TGfmfBSzqA+rVXpzwx2pvsvvicGkvVlUmEuk6oLqs/NjKumks5gugJuQBNdf8ueKitoqu53K3xQy7RK2D0pCviq/QDZWJmwPDYmYYiZ6QiE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb589b85-c777-4a1a-ea11-08ddaa89c261
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:51:20.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hF4gjkmdSwHIxW1vnXKr2p3PQV2bm6CPix5XqZ0gOGiBrOh5qA2SbInjzZdQBdo+SYr4avlqbxoqaXAzYAfSoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7267
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130107
X-Proofpoint-GUID: zRxrnoYw5hRIziAdEFGv3_Qkw6_FkM_A
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=684c3aec cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=o-RUtwAiAMg1WUuiRWEA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: zRxrnoYw5hRIziAdEFGv3_Qkw6_FkM_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNyBTYWx0ZWRfX4X/c8m0fiS4L LM849FuBUF7a74V53qsF7YZKXbCo9Ks1Dap68W/3KR2yR9InVGlNGyTP/7up+AXisXBzNLtlCT3 pOObPvWb2I9pbpvRjeMWI2zfukFCO9xsmUaaOF6/alidvq+iIwOAf22s9yrB1Z86Dj6ydc/Zo18
 Rg2iDDe/gHLXVwKQodFItuUKhbAVPvl6S5VH0LWqfMP6XVvmYD9BjYl72ifvvwKUUjVx0ac6+Tl 89yUQVxWOvtX1SkYzx5H/GFKUBopReze6y38Iu0a0pSa5yMa8NjkkgW6pexKhjxXW3FwJIutEzN AKoM97pDepixlgb8f6nZ5TF5IIoNX102Z7fVjSnMNKh7MRfnC2fkc3kNvZ2lacHPKiuyJwrsRB5
 aeX+GbyCrFIcbdTodjDKyOjCPSWIj3ru0UfNM9R6RkvtlNmMIPTCJUWhMsmUPQMT6LqZ2Td6

On 22 May 2025, eugene loh spake thusly:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

with the microscopic caveat below.

> diff --git a/test/unittest/variables/bvar/perlping.pl b/test/unittest/variables/bvar/perlping.pl
> new file mode 100755
> index 000000000..97c9b09e9
> --- /dev/null
> +++ b/test/unittest/variables/bvar/perlping.pl
> @@ -0,0 +1,8 @@
> +#!/usr/bin/perl -w
> +# Oracle Linux DTrace.
> +# Copyright (c) 2016, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +use Net::Ping;
> +my $p = Net::Ping->new(${ARGV[0]}, 5, 56);
> +$p->ping(${ARGV[1]});

Is there some reason we can't just use $testdir/../../ip/perlping.pl and
avoid duplicating this?

-- 
NULL && (void)
