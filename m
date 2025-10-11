Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B281A9FAB
	for <dtrace@lists.linux.dev>; Sat, 11 Oct 2025 03:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760154449; cv=fail; b=cCT7q1CdIenkJVQECCiVM3Gjz8pxoLK4sMc+HhxqIB2v18e+cMb2y9k8gnmrtxOkS/XXf5mrJUvp7L2HX6yzcElUGzy9Wv7emKI/L8lFgvKiRpBYajzStrEjCrpjxtrA1vJJ/2gKT1+2Wi/7CXXdnCdB+okiVcnXa6/nl1XTxlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760154449; c=relaxed/simple;
	bh=a6CQApGhOrhpENUt9IPbowYx+exHlhMtgOXvl6kHdFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EXMrB1x6J5nrtpXSLW+AKsnFMjnbDH5dNB01JIKMJybkwjMVl7Wleu0iGO29CdZU+I7QeVysFPPYIlwH+eFw1m+bQvlNU7xS7Ksu14cX81x55ec+lpAxCgl9zMwY4HSsIk2mNkyseXrm/j97yyR4mkhGCOuNVwkAjohvmtQoaF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LpO9Yk6c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UWuUc8Wq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LpO9Yk6c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UWuUc8Wq"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B2tvKv012356
	for <dtrace@lists.linux.dev>; Sat, 11 Oct 2025 03:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=C54oLWY9PAA/7Xdlz0
	gMAs6uTgdns2z9hXDWUXKz3Xs=; b=LpO9Yk6cdQnljzPHJylRsK/TXsUwa8+Zfg
	RwW13AeGEXgzIU2k1cVhmDJxGkg7yG8E7aNi3Jygl2rEjT+H1WZ5FbG/B25aWNvZ
	oDNul3ON6yPgu7KYbUPbiVV6nfim+8jhwXHn206fpvMJ5D6lYlGK4qLjhACD7ktr
	rhze6YZIaX+d19H/KQs9aBwc4uKglGTJehLToNn55ECmrfrLdfkEs/hL5//YG/YL
	YcUw2niCb4qpCKCYoKXZIq8o05mOJOrlZTCHHNtfnv7RAt0RFiV3Ic4G+7ytWVNI
	ToZDmq9RfLHmJKdU40t1PslVBhMW/uXvjPLtpijGeXWltyA7RowA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qeusr0qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 11 Oct 2025 03:47:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59B1Xk0e037160
	for <dtrace@lists.linux.dev>; Sat, 11 Oct 2025 03:47:25 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012043.outbound.protection.outlook.com [40.107.200.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdp5t62c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 11 Oct 2025 03:47:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjkAjQ57DZvKzdiS1m9wBt5aANoSxXjJ7fiQM226vR6ZgMAdeq+WLx0Rpnx729HdCbdPKcKTK52+AHgwPwZIDNBqj64GuOPmncNEBRr2yROIwKbhC3NFLqOaNl7fgLJN2KwG3rXmh8yHRJYQ5DnpDfCBXCSx/ufBTS27JfwfJUXT1APN3J72JlDMiNksi9ES59dRN3Cme4UM4uHBYFlGPc6GErmC+RfUkq67Gjic5wXBQjJJAm+uh4IBmm+I19+5nMQ03fIlI3pE1glGsIOV6Bdn5tCJDAS3uyOf4Zvy6rF516cJWUmWoIqQ3UKctKWB6RQ92t9P+XY1HfiL00VeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C54oLWY9PAA/7Xdlz0gMAs6uTgdns2z9hXDWUXKz3Xs=;
 b=Li7waqAgbFL0IQV4iml9mCXeMdN070HrTCtarUV9XCxaLe47dvSz3yiZXW8M1q3rL0vKgSQ6yi4p4wkNB7IRwcibYya7UtN16F5/u7X52DmRFXxcfXbnvtQmP96onlhBgBgNWcqZIT2Ci4ig5idMNt79h27E1VR7aUJolTsJwoemYryxq6aMB9zGUDgIr4rf5Bb/OVd6HpsnBnOinxbgVrjz22qqDz3YIt97Rb0equMkZJGwJls2xeiumXlExXi0TzmSqn1xdw6LHzNUY8/lJ6GAUx5hk+pW0e8iXvwC823iLWI3R+37yL05WF9GE9e2sWNOONXwQsmZjg0rVHICZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C54oLWY9PAA/7Xdlz0gMAs6uTgdns2z9hXDWUXKz3Xs=;
 b=UWuUc8Wqi3hBQlI0tvF45OqvDk2UUYtQzAOdFcBhEJaTGMkmO0RZWEtu0QWFjJmQpi39TQqI5EwvWHxJHoxo+I3be3VF7/+VDWnTtdNebdC/Vxvu5exQjSbZxyU3kAcfj2ERm1PSkhMi6rkeSKKPlw8JIHg6XXoAsbjZGIqhvek=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH8PR10MB6340.namprd10.prod.outlook.com (2603:10b6:510:1cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 03:47:22 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 03:47:22 +0000
Date: Fri, 10 Oct 2025 23:47:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] usdt; perform __ to - conversion for usdt and prov notes
Message-ID: <aOnTR+13ITNIEHeb@oracle.com>
References: <SJ0PR10MB5672738898FBCFFE5C13ADEAC2ECA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR10MB5672738898FBCFFE5C13ADEAC2ECA@SJ0PR10MB5672.namprd10.prod.outlook.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH8PR10MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c641c9-a0aa-4396-9d76-08de0878e2b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vx/JEYKs1THz18eijjz3D0ZdtJTFi2toxQbpHw3vbrD3VQkZZJeM16HnZ7MN?=
 =?us-ascii?Q?7Wxl2Rzl3/ulLlvM1/VxshW1ouHcAbgEp1amWMS97HW+Z6B4d/5HLomq8t+e?=
 =?us-ascii?Q?9T4hbHQ3Yc2xNil/IlML5kCXRdaiWTHMPYKjhCKzKP3Afz7aluFV6exscqjL?=
 =?us-ascii?Q?6HdZK0Be2RQQMqL0b5NFr9l1dbScfMOWyLKgAOf0sxoIr7TNXr8rXHXN69SK?=
 =?us-ascii?Q?/n4JbeQMH/G9ckRpxjqtKpb9sm92VzrOxsRsG/SRiLefemxeLAqCDaJ88X8R?=
 =?us-ascii?Q?jqcz5WFh6aEt+FpNfjC8AWN8sHAFlo/OElhfMuEV/CKsvmJ2a84QI9WH1Wx6?=
 =?us-ascii?Q?CJadeSqGX5mQ07MnylHnjQ3ehdatrXN07/70w4QSj7BN7ekRaWFeS1F1CE37?=
 =?us-ascii?Q?J+wo5vFAgJnyJe/KQMu4apwEuw7BLxmVpIT47djQF3rHlruw5Xyg8yXmAgqO?=
 =?us-ascii?Q?qzkIo2ZtUaoPnZtt8Mtr41Zr5dEdIF1Eb9PyAYevQ3uo25m2dJQ6W1rXe5kk?=
 =?us-ascii?Q?YelBTbcq4gE8PBnQ4yEq738565U9znJEHYuHAsF7bRsf1EjKMmxXza92Ts0l?=
 =?us-ascii?Q?DttidT5QVjpgPvI8VS41C2P2EuVen3A6xbWLvXQS2N/5ixJl7zyRXGJ6vXJL?=
 =?us-ascii?Q?N7395Y1xIvMZSUtsRT7+h1r+pwd7r6wCFYrcdOshw8VdzXIs5N7+xSdB6rLM?=
 =?us-ascii?Q?+AwrEefyUaaLnciPIIX9iCpjj+eQov+CKNJN9odhT8FofUMTQRdmKdiDzFJd?=
 =?us-ascii?Q?2K94FDY+EYj5i81u5PUmUggLPQFqdAeoIV32/0xW0eXjUwnOuxTUWEBi5pgX?=
 =?us-ascii?Q?s2E02ne1Tn/90/fy8gXpsMmQn1VJzyuA82z5AhEZjug6sOQwOT+bM/IZnKPN?=
 =?us-ascii?Q?Tu69Mbabncbl6MwldJfLBQmHDI6OK214BeJZrbj3e5h1zaLxX3Y9SltFB0La?=
 =?us-ascii?Q?eTSXlYexklRwbOvK+pBlv5bIA86jchMO1+yyvx/xBx5dweVun9CHe0w17S6n?=
 =?us-ascii?Q?wd7WyYPAF2ma8oC9U54UQbfYGkgD4H7WM9zOL2k+H+rzRdyRx0bBRmH7xZhu?=
 =?us-ascii?Q?aQPqLiDwBVscHMPitjFQM8vl+JH8+2Dp12nSJMRifjwuiAxahpL7GLntCBsm?=
 =?us-ascii?Q?HzTEDYX9Wb8ZTxTQHiX6S8N5DWdiCldVIGxjjBbaflmtTUvVo7/VE4t1Tve4?=
 =?us-ascii?Q?lPPYWQKjXPZomY7oEGjuzZnZNTSpUrYty8CvAEz+zjTVDKU7AomfbuIU+MGV?=
 =?us-ascii?Q?OfiGKgpyl3JT8PinDUEyBbXE1BtG1gFoy5Q6aCcAD6VpqOis33O4fBrgHYv0?=
 =?us-ascii?Q?x38x1eYZvgOXulZLUaVcKQ8FLfT2XKzBVJOSKD7VBq0kjMP9t6BhE2JPT80J?=
 =?us-ascii?Q?mJIQZ3DLi7oKAUIeKFEanjLmTR/bSoBSuS1vItnI/yyOyNNNBjyTm7zR9ajZ?=
 =?us-ascii?Q?j1y0py73zZwyCS0ErFVCSqNz1wbOQjHZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rhMqqhPB4H1nS28zeh1TyndaoVerxIhTMxCRQPPeVz55WxXCvRxAH/+Nv6fD?=
 =?us-ascii?Q?mZyAA3tEeHy+JPZyxVsZt8rCNXnr4w8HONnZ1odBDDdMDBKYZDJ9ob1HyiYM?=
 =?us-ascii?Q?4XwRf0Mm+2H9hFR15DbzziCy2u8PPafFVhJZ5Gi8pKPfLPytiEdPZLtfr3nl?=
 =?us-ascii?Q?onX/QRwePO98sR1dGpfVl8iC9H7eoe7n8fS5/e6b2mm4PwTS/NJ+bORSGOeD?=
 =?us-ascii?Q?y3XoVtHwm9JGmlF3IvjIUwv/4CbRZVayAiUTBQtkHr7Q8/BI0WiOLzCjnHZ7?=
 =?us-ascii?Q?6JUaprteC0HjtXKm/ez9EwX63SPWxTRvjgSiRTHA8Vcv3bIcw6Cn4hDq6064?=
 =?us-ascii?Q?MyzG8dprJxRoDEB/h/z0hTogh1kLiuSbEUcRj2VJ7HojfevV10biZerluVB8?=
 =?us-ascii?Q?57hEqfUdI3ouEJotWnWHyZBCqY4lY77Ud2ej499u8LWiZcvhhC8issV/lhlI?=
 =?us-ascii?Q?jdJuK3KB11UcSEAptoUninLjpCMZFiLTPwJY7enEkcAyOjyoLuvB4fmB3JKy?=
 =?us-ascii?Q?OA8gNeFS102JEO8DZHTVkAaZi/DClWAx0nnndJoahDd8T6kmO50eDaZtPUAU?=
 =?us-ascii?Q?4WXFkYXNgAOm9D4PFRzCaRUoZ3HeUd1aYHAmSS0B30mDOxlpv3xfRwEa9wTX?=
 =?us-ascii?Q?ZRPZEdJw9IH8Go1b7ZEn0gWCxvrlX2RhXKbemsoqF55cM+2xLNbAX1hldERS?=
 =?us-ascii?Q?vMdHmLt2au53GzADiUDrJyyxjnMYkRZJYE7uLWywReEyNaO4f3zJr1p712DB?=
 =?us-ascii?Q?2wqLp3eKFCqLkqpCnbXaP6bSmIR9sosZUDXxEmVeQGAKGDH+r218v6gjbR4H?=
 =?us-ascii?Q?zcRKDLqTaR2GDYcO++AOINPWIs5gyJWxpGQbGrBe9ksUH3apqGekETHnUBay?=
 =?us-ascii?Q?ufhQwCn6vFqizATMpMy7QBMLMIbuTYFPVtQbgVIlRVj3NQ9AXgydveCQ9oxi?=
 =?us-ascii?Q?4j99Ne/cuV78N+9WaQXxRULIqm6AXtC781HB6VTAWpuwqio44ri1d/rnUq6o?=
 =?us-ascii?Q?LgDZlOlKR9XZ0ht3uuNq7xXXE1lskil6PgJq3kBSx/X/FSLEpfVgTyfECR8B?=
 =?us-ascii?Q?DxllY/orb8gCcaXtD1zBpgqfbCRbQ2nz03YPcVP1CiSSAGURLbMQlEhPTv+C?=
 =?us-ascii?Q?tcQTdFiVe4AK4hKRxlweSRZaalHeG4gwTpeE+nTrNSRB2jPmGY/HfD7WaHcs?=
 =?us-ascii?Q?gCHvacyH2QX8b/yKmMfCVE4wN51JFRdEykFXleVN+1aKUQIYrfWAbq/LUCLj?=
 =?us-ascii?Q?bARYtQy6Uew6IQ5hkoblBGA6YRP5dK/WbySTFGHDsCRT9XwQm8JejZK6sHja?=
 =?us-ascii?Q?l3zx4L072oUdoJXDK1whpzmcYdOtWmuQzNBb2640zGbs72Xn4TTQ4lzxcwEL?=
 =?us-ascii?Q?BNbT96Zb20KNI8Bx4cXR7FrNZRAUyawNgQ3M/u9cRFxAhbOBqgzXlY3MOVck?=
 =?us-ascii?Q?vN9TOHV4IE9QXA3h19srYmxLNhX5E0ZtcSWq4tAN1l+Sku2wCG38QmCkbNy3?=
 =?us-ascii?Q?OVotaaKVj9jH4FiDaFXUJrPp+Cqfo7NwZI4HE7i/CI52jhLUSb2J8NOxMiEf?=
 =?us-ascii?Q?twoPRh+78qlakWRDCBkFK+p/P+ThHt9AP4kDMnrE5Y+0Aw9nu0Dmb4MZL/yx?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i5hleuR9AAnnPKU5eQfHVfsgTDsyx4EaIXZcCwRtfwZVjoVfVWffO5vIVtIy40L7qJAvz/gOmhryrdHL0DRluMp+52uE3XyITTGDOSxxrSsmBTCoyDb1k1nTsKO2JuXbNZO/mJcgXa0nbBrnzwd6A4mMoIAgApMvLYVnBXG87pZcgOVxxr3vCgqKSIT9WGHnNzq9IqZnOXSnuYsWY3udypXKvu+b8X5h2T0TDOMlnrQGt0+Kdi7EphaQgxYRhcYQp/uwpiP+mMihcXGgFQFu+R9eZbUgnfYMw4R7VkY6OJYaZ1OeDoHCG7hvPAWtmVQrc0OfPvueKBFMapdhYygRElH7dnXVf+NZ0Whu3m8yfaElQBMdQjkq9m9be8M9BXejGIY7n+lrC7B5C+kAKS6a2aYJpQB1yJR7fXq/fzeUCpW+LkmgN4H00M2ElKsz13ZCUv54ck2yn5hBK4JWjss5Fpm2SrGwJhUC5YBrsB1o3/Dcjl5LAiLjmA2RwagSV2PSMkOUenp+fWCYqb2P2YmK7A45uQRQ3ujldllaEdSEOABvLqtakS5RfaIkfy+z1SfTff9tVVx2+K9n+r6tkPy5bpPPhQWDlrkzMYQQ9dFXrjg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c641c9-a0aa-4396-9d76-08de0878e2b0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 03:47:22.6404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFXiHHmgD5hAGUYyopao3It1rEJ+Nx6WiMdI5acypux1+kzECkQqkahMgsERZ7GEwimFm3JGiFK4WVJzOlvLm+bIcjeF0PqGyK/aPuAg9XE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6340
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510110020
X-Proofpoint-ORIG-GUID: _Ciqz25CbUg2TstI-6VGGfXK4MbzAAzl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfX0pKEplzXLa3D
 rwodKoDs+9FmsX2vM2rWRp0rn8psJr0b6wMIPQ8TmMFaXVaYtnLGbT87yDmViWRnl3ictEl45KZ
 ZFCLUH75hpUGLY3mmUiQ9JX2IXIcvufv7jQ67tXS9wqP/Tg2J6Op69ceEjZVlJxAT44QIgX4dwf
 VoJRk3ODA/Q8rP9EK6m7cjY2mIeN013iNoaD1pzy2u2EwAdfCca8+79tQ3Irh0xIXAaqPKEVsIa
 aVeCKrfhclty9VylpVyWIXPFKha4Jp9u3z+XP8XA7JOsvOW+B50vgdr/6L190TxHKjq6lv7pRu7
 semwxoUm5JqR28fxthv6SKT84HahmLybNkxViXMge/0Pga7Eqy+ZZrvkM+NZ7rHcKINKDjnZenS
 oTdvZDtrlOF0qkysb8GEvfWUKSep5A==
X-Authority-Analysis: v=2.4 cv=E7TAZKdl c=1 sm=1 tr=0 ts=68e9d34e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=zNyfhe0nP9FAOPvfvoYA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: _Ciqz25CbUg2TstI-6VGGfXK4MbzAAzl

Nevermind - patch withdrawn

On Fri, Oct 10, 2025 at 11:35:30PM -0400, Kris Van Hees wrote:
> The __ to - conversion was only done for usdt notes.  It needs to be
> done for both usdt and prov notes because they both contain probe
> names that may need converting.
> 
> Reported-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libcommon/usdt_parser_notes.c | 40 +++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 16 deletions(-)
> 
> diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
> index c98c9fb0..a8b46e65 100644
> --- a/libcommon/usdt_parser_notes.c
> +++ b/libcommon/usdt_parser_notes.c
> @@ -293,6 +293,27 @@ strarray_size(uint8_t cnt, const char *str, const char *end, size_t skip)
>  	return p - str;
>  }
>  
> +/*
> + * If the probe name has encoded hyphens, perform in-place changing from "__"
> + * into "-".
> + */
> +static void
> +fix_probe_name(const char *prb, const char *end)
> +{
> +	if (strstr(prb, "__") != NULL) {
> +		char		*q;
> +		const char	*s = prb;
> +
> +		for (q = (char *)s; s < end; s++, q++) {
> +			if (s[0] == '_' && s[1] == '_') {
> +				*q = '-';
> +				s++;
> +			} else if (s > q)
> +				*q = *s;
> +		}
> +	}
> +}
> +
>  static int
>  parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  		usdt_note_t *note)
> @@ -353,6 +374,8 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  			return -1;
>  		}
>  
> +		fix_probe_name(prbt.prb, p);
> +
>  		if ((prp = dt_htab_lookup(pvp->pmap, &prbt)) == NULL) {
>  			if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
>  				usdt_error(out, ENOMEM, "Failed to allocate probe");
> @@ -471,22 +494,7 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
>  	}
>  	prbt.off = off;
>  
> -	/*
> -	 * If the probe name has encoded hyphens, perform in-place changing
> -	 * from "__" into "-".
> -	 */
> -	if (strstr(prbt.prb, "__") != NULL) {
> -		char		*q;
> -		const char	*s = prbt.prb, *e = p;
> -
> -		for (q = (char *)s; s < e; s++, q++) {
> -			if (s[0] == '_' && s[1] == '_') {
> -				*q = '-';
> -				s++;
> -			} else if (s > q)
> -				*q = *s;
> -		}
> -	}
> +	fix_probe_name(prbt.prb, p);
>  
>  	if ((prp = dt_htab_lookup(prbmap, &prbt)) == NULL) {
>  		if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
> -- 
> 2.43.5
> 
