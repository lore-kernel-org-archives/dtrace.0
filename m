Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741B2BB05
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721421114; cv=fail; b=oZ/d4LCdCjqtoWdAaeJe4oZj4Pg3jpC9QrE/h/5zJwz7yOWJRSyNLsYhGRx2QpqO6g9Ia9EDPOHHB0vABEB1aSLkcRfiD2UqrgFsoBFbb276Ysvi294qAqiMi0WivT4qg9WQvghqX7v4a1cpkfQvMmmeb4LnS2DJZIz8R3zf95I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721421114; c=relaxed/simple;
	bh=R/OnKj0gWIvJovxxmReU7RFCtVfXqHdO92+Ee60VNJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o8xhxsB9HF4rQRmsN92MTiM4KDvWJgiuPG+pbQJmaKkmbuQevxLvx054KZj/pImip2Qq0CrsxHc7vncgBgkX+s5vbAt9X14tppjsV6dRlzosImSMF9uF+tBHDTgtkvJeTwg85kq71rwSZywNycFj+Z665OpixlwXojSeS3+0lfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VYE6gEXj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WmyYIym6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VYE6gEXj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WmyYIym6"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JKPtK2019144
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=GPheKfBtYgyAQmV
	V2tPDoM8j6QF79Fg4TqTTj5Vl9Po=; b=VYE6gEXjtbXRAnOxPSp9sF3zyTS9jO7
	vA8QktGiRbZ/ZR4R9W+Q968Ia/83BEwTAIeq+B9CKNhg4RPi8ppPVb9lBvQNS4CJ
	8RNycIGFRFepgdyK6HgHetg1TkMazpq/aNMScn1Xi+O/nlOONy+JzMRFyXQw2WkR
	yVlMtRKMOfqbRW1QZ6gUTctGp7UUrgWa/TOcXzgyERNLy7MIKLKkwM2zKaeeinUE
	Grh7eF5IPDmbAOb9SIWs5sbY8gHzlyZ7rf9ma2y3x+9HGtrbgBdhIvNnQ3WmXzq3
	zkDJf3/njKfGVDj5Zp24Q08lrbMeahNdk+NNRnDsKZSn23l5hOOqi/A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fy5r009v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:31:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JJaYRM039565
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:31:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwey3t74-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:31:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJxilHUWfDCM4h79hfsOTw6bt1JVOwgTxjoiGBL+S2MAjy73ndOJT1on+2qBX6+nuv09cl9HMCEZM/UelxspSMgASAhLiJOp6A13Q2ianHcvSr5bDH+p9M+tOg8heJbaw8Ep6270s3cOw2dt/69sLJH7E8kWBue1fe/OV85koU43+UQgYlDWY3b5ACvvIXp4tbUqrcM/JfGveLEVxhesvL32TkcrVV7ilMMtXkMadZsQYC1LB9pi3Clk4VO5jRRAyJ0V+FuWhuhVzc1UY7Wsh+PgX3Up6RZBUOPOtOGoVaW0hkBQz0GC/MNcW/8MfVAtAX6toHGXVYCD/nKFnQ74yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPheKfBtYgyAQmVV2tPDoM8j6QF79Fg4TqTTj5Vl9Po=;
 b=jd5Id580iYRMXavDsnHA+tIdxOMYZYmN7KjCQCRJQwfeC43bilYeWDJltgNOo+SUNdkRuyhxkm7HQsoRZ5IkuQl0wbMfBjVYjO3O74Ir8Zg/78ZRBiasnWbxOMjyrPNPywr9UvASDe3BxX/nGximzeJJtNLXInFbe7NI3j40quv2yXL9h/b+iKG3tQoW7CJSn2yb7+9bLjqQpOGv3TKJhLfh3DdPKodTI8m5GQwarERqGMu2qcjqXLy4Nh3XRESc7fcmdmfBgoGs9ey6NnANCVVnqHkPf50bXLFkTb4pfBSmgHb+hXPkx/3KbQ40zsvXDmawmte/WQcDYc1Lh0WgFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPheKfBtYgyAQmVV2tPDoM8j6QF79Fg4TqTTj5Vl9Po=;
 b=WmyYIym6w4Q6hcAzoQSEqfwpCU22W2L0E8SqtQawPfoTWMIkyafM8IKEoi1slx8Pcga3UEJqstd9XN1AGj4HcEg0QvkooWQF8cpKGSAQdu3u0b7ixuZPJhDD+VbB/8CYTC2d9x/LE8VnBDlZnS1XNiJOc/ysjFusZKDmU48wEsw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB6248.namprd10.prod.outlook.com (2603:10b6:8:d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 20:31:38 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 20:31:38 +0000
Date: Fri, 19 Jul 2024 16:31:34 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 20/38] Add a hook for a provider-specific "update"
 function
Message-ID: <ZprNJnLix+hRYoTA@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 24507b5a-25c6-43b1-14f0-08dca831ca68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hPUcClN1wDivJDWBw5Iuckc0bciBW1Eg6RdnRaMCy0GDh7nuoBss5KVIQaqu?=
 =?us-ascii?Q?fwflURIOCPxvRsFvUwFnGuJLMRbmYPG9fSVxjB1buYvx7WCTbflUsnfd03xa?=
 =?us-ascii?Q?oWE29sXef4oUyUwSVDBpBS3a1kREkI2rCNNjOhQpRuWRKhRkC6r7aCs90Kig?=
 =?us-ascii?Q?4VhxZgxpfiRbRZZYEIINgSokL+7m7a8YCxHV5MIb1Vp6fkJ61eUdyfFiSTlK?=
 =?us-ascii?Q?vKIIbEPT/LzO9pZjiL9dkC+4OA6RG6+k4xCKXmypgN9n0n6gMieD17f8fgJf?=
 =?us-ascii?Q?FcgDOYWHfe5fmJRdjY3Yr+OILPt24x1LHZh5guYHYEhRhUiddFn3bekBRSeC?=
 =?us-ascii?Q?vJ7BdjBoFRBueGx0bjUu1jh3mHCOekRunE122kkWqXHRSs1mVtdfnpEoJ2BW?=
 =?us-ascii?Q?Wk4zpAezc28fTvCorJ5uGkscyj57mMvjvLlfsny47wsyfmbNPlm2MW1TjzZV?=
 =?us-ascii?Q?xq2V69ndhUFdsaeZgFObMv0GV26jlKvLEidrPh4EQoH5dlcWg5FCOQvy17Xg?=
 =?us-ascii?Q?XAo7AQxC4ZevyNhNpIybrisQbA78y+ixjfhpE1B0SAAsu3Iz9kfDlPF2MPxt?=
 =?us-ascii?Q?j1XzMsVuRCI03KC4rrYjUmT3jvE9sUyGNz7MH1CjhQruLrQSGfAZQ80WZTGV?=
 =?us-ascii?Q?9eqBh/WV6kvw3YFc0PlS4H4wwN1yuv4sQI4ckOsvkjMpJStI1BriraLYy49u?=
 =?us-ascii?Q?iWJ31G1YrsrSiGxl+EzcNf7NkmBcMZUpqS6yj73FE5sZlQi3ql5O8wIX4LCo?=
 =?us-ascii?Q?cU66ygWObk7471XANwW7Fl5g+oX8iGlVhoDQluv6+/EnxbtBVEU6MpbhO9uI?=
 =?us-ascii?Q?4qtYlXTQjX4BZDDpSI6DsEemewjMDd4Q5/IzkOrLO4vUM7ZjEzHR9uqahkxV?=
 =?us-ascii?Q?UpamqjlgEPQPrDbVmBSfh8LcFIUlt6FKLoqr/5CsjnFmkG4Kn0czsyt+YsS3?=
 =?us-ascii?Q?puI/0vzBa3sdpik0sNQ5+BQyYvaNJQ9yWARyBag+gXP5Z2tg+mjnbG1DbPqG?=
 =?us-ascii?Q?eK/gnAYzMMXGkPEcuVbcTwkyrERlof4DIX0t7V/Nngn0My9GToKZ6241mTPh?=
 =?us-ascii?Q?sDGXzyjVo6f4QhaoBSPo/F6awqhqxvANcosmqQMOiNoGRxUFVOq0bI5zN6Rz?=
 =?us-ascii?Q?warSD8QUuPIBhD7H5Mm2j4TZhjO9kOf1TRJMNpF53/PyBxnizjuOL/Lz2ku2?=
 =?us-ascii?Q?zihFw29+KP08/iALag6tJNV6xgAom/dr7at45ne45ylF0k7krTHLO4IHZht/?=
 =?us-ascii?Q?WsIpzpK2ldvJQA9m80yyC+aGArX3AKFmYe0EM1rA6+7ZQUM9NthBtlBxHKEP?=
 =?us-ascii?Q?WbQdNQDkN4b9wuEKfyz614tIWyg4qkLtWiCx98DL6nTAhA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JGbqhy82a9TqnLQgcJ1J94tz2+q4jsZjkcS2aVpI56r0SSNYJgATmoaY3EU4?=
 =?us-ascii?Q?GsphkWMa+mr2n7WyA2JGRzc+IIqJ8nNJrE3VV6wy3u+Xev7hoPGttTS1GNf/?=
 =?us-ascii?Q?n0IlNd9D/OyTix/n6erIgbnTOGQPAGQyKCFp0VkHiQA+j7mWlEpdHOp+hEZO?=
 =?us-ascii?Q?wxtryZ93OIMB3Rxc0W6PM5ARJKop7QSHwlhLlyR0YaqBdp0ODwzWh0Z8+APo?=
 =?us-ascii?Q?SOSVGwdycJAva9IMrixxIp/9V/SbB5IISPQrhWLn1+MjMxQ5+pOjdyiW9bp0?=
 =?us-ascii?Q?bVCuava3xVidmATnzekObCizlYkAqNlev4myFdCTgMYRlwx4ek+8p2NmdvWV?=
 =?us-ascii?Q?0ROo5P/vBBv7VD5F4FAyMBJACrOaWf4h9YF7yw3V1F4SNvyBEjfwnHPVSZy8?=
 =?us-ascii?Q?H+Hp/Xl2OeZtJH4NxdZAhEZxWiwxf7LXW9XgTOtAxW8r/pI1ADJqoUNq+rhT?=
 =?us-ascii?Q?j3wQRTJnvsOCgqAJVpAkNv+H+dtpzVKA/MeVliK3OAe/fFbb+ZJJwZzBnP4j?=
 =?us-ascii?Q?fNysfbQOE5Gtrgm54pD00pH7UbtXMdIY5cVKltv0w0/Rs+1RvFwAK5JVlovF?=
 =?us-ascii?Q?Io8SNpbCfJfrqT8CNZ3zxsre2D0kT4Qz+3DfSinlzb0LculWQ0uUe/mBtkkq?=
 =?us-ascii?Q?aEA03SrOwwWeSlKg5VHEFF5StJY75iGvgkxYahmylaGb/+QmCYKs/6TMfLjv?=
 =?us-ascii?Q?xl0f+Bh6fRN3Wmz4v3hgrJMarwfah8xJQdN3BxXnTNae9CCieLmeiBTQsb4F?=
 =?us-ascii?Q?lU8Ih9lbLFWzc407zVgpSeBrQlkTFiOWwIy+N11WF9f1ND/n1t6m55XeOdZh?=
 =?us-ascii?Q?ZvLQGUufCHSPbh1pr8aCt7F+cGQueslYtN8Q62RqgAoXgoYua0kyPs52KSl5?=
 =?us-ascii?Q?eRkobisSTdV3mLQLDEb5effw2WeQ4K6V8PwMgXrzMqGfG8V9jcBe0QuBajZO?=
 =?us-ascii?Q?n8kD3LI3yjScNJF5G3EN3T5AOwfP40CIyL3KksZrUKhKI2Srcs2CvdDJhbD/?=
 =?us-ascii?Q?SGN/QHKYwu1/QHXwyAGMZ0Uh42r1ysZIyaZSaHXp+iMjYGuZUfEX1wDNDxeD?=
 =?us-ascii?Q?uwGrfP5WagbUb+Rg2msmA8e2fdz74R8/Cp0bxsYt1LMqcIicg586tOI5jBxK?=
 =?us-ascii?Q?HsRDnLlOFTvYU4SNvR4jxA0vOS/O7Uf8JnShoXpJ3w1HpnnjIr7gQW6Or8og?=
 =?us-ascii?Q?z5HJlPDaVI7Sz1y5JoL7gGyRzJ4yD97OzRGE7y+rBwRJtsBw9nwWk0hd/RNA?=
 =?us-ascii?Q?0fBFayPCdme5cffjrji50PE9PWVQIkfwC8dx3QQgKN4Y8gf8Kx0+ioisWYvA?=
 =?us-ascii?Q?+CKcEt1fYS49o+dyxwCez6OcCIi+y2oDPeXU0dSp7Eh1X7xpTuSwJMqdyajC?=
 =?us-ascii?Q?8dJemTDsqNBL4iImiHo8DWUV488tkT7NX2cxUumNlrKUWL4+PNBooRMoxLgv?=
 =?us-ascii?Q?vMsjCgn7MOZnmibC+00O/uWxw9bxBwP5wx5wGiv8h9RJx3lWA/QggQk+1gXj?=
 =?us-ascii?Q?VMa3SF1qqFGH458XRx2pzMAaWmKv6N5FQpnWTkjA5VjspfDK3GQd13ENoKaL?=
 =?us-ascii?Q?2EaeC4Wbk22BXlJGMkMGB0kQp62Sx0b2dhnDiRmu3+ZMR2H8zbNESpWCV4J5?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ri95nfos/t9jpLw+IeTRBmBvPvZBsJprufsWTuQMLHdVbdoXRGUO68mQfuNjs+aNE0gxVH7z1KOXyL4pHCFdbmezhe+fiYeah9ydJKiI8fDy7bqbncBjcBUG+LmqWaF3GsRs5sJPVQZ86Y3vPikMhO0YgUsSS8AFsv+4W8mXMwuTSQNjFf5hwnyU70AbHi3ZiUsQND8yjJRVak3BHru7kbt4odQMkuYICW4KxX3Zu68F322UEQDtUW/auRyWrNlNf/328SJ3mM37ES0CVXoq78Wfn2RjCAoyVgWTbKuJsDyhI0pz2hVHSz3QDtILGWSJTZ7NjI9xK/CKwiE7/HBYdX8AQrr3aTWAdssGXJFt4cybiSGefxuc1mKNOmRqW2SE6y/IBRbnpMDDzl1zF9Q5N0Byy75zzCtH52Xe1McAcuuXMW/iQ9WEWPJAhJV7NnWK1qm1meC4DqG3/YLEzG8b+cBILNj0lLoXOSKS9Rayy37OCq2k+T8ORkdrjNWokK4+4YdcFL6Ej12D9MVdGxTBXa6QL48MDFClAmBYzVxv1wl2XTixy152RuHGorCVw+AIOjpoRQVrOA2jsNVSuZpUe8t/7S6hps0mFJT0PtMI/Fg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24507b5a-25c6-43b1-14f0-08dca831ca68
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 20:31:38.4208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvekqLgYD2lBu9Bn/pfmx8WMhHakJVeQKoATgcP/066VSXmrIUsjMT8pA59Uv8cIZ41sh2kvh5rwlivNX0MUHAHOUHw9KxQ+8BBuAl2TVsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6248
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_08,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407190152
X-Proofpoint-GUID: uQsXoX-58Al5iKO3b-z99fcbbtKKLn2F
X-Proofpoint-ORIG-GUID: uQsXoX-58Al5iKO3b-z99fcbbtKKLn2F

This patch surely should be part of another one that actually provides some
code to use the new callback.  The implementation of the callback in any
particular provider could remain in its own patch after that if you like,
but adding this without the code that actually calls it seems less useful.
If anything, the commit message itself makes it so generic sounding that one
is likely to have no idea what this is meant to be used for, where it would
be called from, why, and what the expected result ought to be.

So, combine with the code that uses it please.  Which I will review next :)

On Thu, Jun 27, 2024 at 01:38:46AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> For up-coming USDT-probe support, we need to update a BPF map
> -- at least when the dtrace session starts but possibly also later
> to support systemwide USDT tracing for processes that may start up
> later.
> 
> One way to do this is with a USDT-specific update function.
> 
> For now, let's add a hook for providers to have provider-specific
> update functions.  User space can either call
> 
>     for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
>         if (dt_providers[i]->update)
>             dt_providers[i]->update(...);
>     }
> 
> any time it likes.  Or it can call dt_usdt.update(...).
> 
> This is for WIP.  A different approach can be adopted later instead.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_provider.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index b1b1b1b8..71b5a3c4 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -71,6 +71,8 @@ typedef struct dt_provimpl {
>  			      void *datap);
>  	void (*destroy)(dtrace_hdl_t *dtp,	/* free provider data */
>  			      void *datap);
> +	void (*update)(dtrace_hdl_t *dtp,	/* update provider-specific info */
> +			      void *datap);
>  } dt_provimpl_t;
>  
>  /* list dt_dtrace first */
> -- 
> 2.18.4
> 
