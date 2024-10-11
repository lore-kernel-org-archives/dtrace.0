Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33F11119A
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 02:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728614879; cv=fail; b=A2zBLCMyuLHn8iIOCKmmN2ZzBle5jav36akG3qu6G9y3B7ge7lD56Is3QJ+yisGsa7gZLY819jyGIloWB687Zq5NkJhCmTEFM5AtYKyev8qc8xDrlO6HvJUzAkZkj8akiu0OtXodNZNpt1TYo8CPljl5scMAEjLzhiyw0SlD/rY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728614879; c=relaxed/simple;
	bh=LJmSwGrfvk3b/MpdNN9Ow6+Kr+cPwkFYPf8Fhu9fRwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VEQ7W2d+fZaycFCk2aGh+qEQtw2tgAynPX4jWKkGBsSw4gOk3ZzVLIPmEAskyH6peAgK93ybOQBD6x0HLEhVOIckPfURhr9OYz3uVbhJ3GWRv6fB9DaYWLedqYxqIOUMQt2mr8fqbOiaKwG8okqdRzggpuGc+mqFPXDiDxAJu5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NLT55EsU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MR+0/erl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NLT55EsU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MR+0/erl"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AJteLh003071
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 02:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=NoVrITTyDgAg/86gk6
	nIxEgh7F/2KSOlLkHLvzGfdl8=; b=NLT55EsUe2Vibx8FGxfxPJqgfIuOATjsmI
	u+qEcAhXvCOBEaHrnG8UhOhdwuD2I6vaktKHYhOHbWWmXv6ecZA27/SVXdmtQPZp
	LijOw/SBhBvPVlMC5/TCJN+DeJ/uw66AnWAXTGiSJ1HrjuL/whr4vZKTzRNIMgjH
	n4UxFzNC3NisnX99kNHZTX7Ma82SUamPEEVufZotgKggSV6EyUQ40Du3PA3vkhZt
	0BPRuQz9lZgWoCm4NN9gFKHpyApNXZ4atzJ/2sGBMb4YFxgZhcIOKQ5mfa17LAtp
	PUMvazsB1erb9KlrA4yYPFaS15lOJQpPJopxuAKbbUGKngbCsm7w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42308dv1q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 02:47:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49ANdVC0017131
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 02:47:54 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwh5xh6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Oct 2024 02:47:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ao2DHJPRgxamVhFLcZReNqjv2xJu43uTXuhy9FRUCYDXHpVtbXbGiIhZWcawbzWZZ8uPV57N3FYOJsgTgMFJocq/ZpUpDsxl//kEDNF+JfoMBTWB0E5CY9vwlIFlEzTyI/8Esy8lx0RBuH+eM8skkLB/DJbNIzj/rjZYwk3j11ghFVHt2lIBpZHdehRd0nJE7FZLObwAo2fZSCL6/JVngYnOKjyLyimefplOn8OVG2qY/adZ3g+SC4dynYyKQYaDaq+IvWsYfGJUE4xxSYDFeieKUvVK7A56iyDq9/D2FVKdWBRY7S/pXQUESLXf/d23nCtSMuenu7QEFoKdyY9SnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoVrITTyDgAg/86gk6nIxEgh7F/2KSOlLkHLvzGfdl8=;
 b=VFl5SNlnK91q/U9ejWg07tSeAjbuCQ/UYYRwC18W60M6LoeweVt2/zhiSgkJtcWSEuUVn1QcpIKiwZBvC1sO84emWJNw6r4QHt2sPsuwyk3ssWpYVQU8+Wqz+fUymlQB6LpxHoy8D7O+X2pT74fsovs+uy6EDcFIuQZu+jLliO07VoU/cl+7HnUG454uiGqM0cXRJTGzaD1Z7DMDhFDmw8FE+9D0C4lm4f9YfNZaVgCBTecyTjv7wjCCbI//Eq24izhTJ6apyq0se5rKdEb9RV7aiYoZramQ6KhAa+MX0SMRcS/B+tEhbGf8TvT0upvbfufbTkbsh2A3iVCZkQETOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoVrITTyDgAg/86gk6nIxEgh7F/2KSOlLkHLvzGfdl8=;
 b=MR+0/erllCzIR39D9kikJ1YU8L+yLT32swK38n6X1xN6gJpHz/k6leTQ4xswtPEZRlcNQRFX9ZzO0e+8kC2u7x2mmZKcdxPHU3ur88LrOTiz+rzfC4+M45IyIaLAwKGQ8u60HAspbRwX8Aj3Sl3TdQPXixLGvqiVK7O9mRVVOoM=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SN4PR10MB5800.namprd10.prod.outlook.com (2603:10b6:806:20f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 02:47:51 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 02:47:51 +0000
Date: Thu, 10 Oct 2024 22:47:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH dtrace 0/3] fprobe fallback kprobe support, sched fix
Message-ID: <ZwiR1OCPiqdG9gEe@oracle.com>
References: <20241009140236.883884-1-alan.maguire@oracle.com>
 <Zwa+m69lJ00WQ7ju@oracle.com>
 <f39a5b93-5b56-4861-817e-1efd85809ff7@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f39a5b93-5b56-4861-817e-1efd85809ff7@oracle.com>
X-ClientProxiedBy: MN2PR18CA0019.namprd18.prod.outlook.com
 (2603:10b6:208:23c::24) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SN4PR10MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: af5e3bfb-f63e-450c-0ad8-08dce99f195b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iyvmbEagU4vTosCOaec5Oi5IzKQbi5/HTHowCP4hKz7zquSHsDvhFjkjbKxh?=
 =?us-ascii?Q?eyldyFKWDWhQbY1pN53BwddLsoZldO587YlB4RFbX35e/mi7sldvfMWqXqQP?=
 =?us-ascii?Q?6HBOAxCPjcFLZCBiTZBJw2TRdqyUchLhlmLhH8jlrCwXc3w7CbP9x9i8qSk/?=
 =?us-ascii?Q?mVAjgvJsJ2gc7cP+XQsmxw2oNTzxVv2l496RrC0mxNXskHRyG5SBDuK92eAS?=
 =?us-ascii?Q?mAZsoyDK7sXLf1nIuMOyGC/wB5HCtk3ka/HMIk7fhGSuwaJrMWWLiYfyGObW?=
 =?us-ascii?Q?EKoWrlTlPuxrLitaDWnWib/hdOIgg5abxm00Qov9RNvuwIe+dbfFQAganRiK?=
 =?us-ascii?Q?Mfr4lDR6JZ3s8+17vDb56K3WY4CsXfuz6UyWEyRDeu2yj1Q8M1uSPzgARUCL?=
 =?us-ascii?Q?8yVdTlVZkVMdV/yp4l9v3PnX16AHtAHB8SKaIgvtCPpQOiZi75f8VJONwtIr?=
 =?us-ascii?Q?viKMo5YcLaY7Olh8ep3kBIL7osRP3roRneoJkcTimI1T1L53mo2u0i454+6P?=
 =?us-ascii?Q?L7xkA3ZtgLMRLXG4qrvZrRanPIs2hWE6F/g6lYJMUKaE9lGmYv2R4Om8Qhn8?=
 =?us-ascii?Q?271pHFpiTf5DTcbV3cbGXbdpzZE766mFRWtoxV6B0IYnpARIYeHeV5gi+T0s?=
 =?us-ascii?Q?84sSIqE1GPkKh8C8J3XMGz3wyc3+rY4Wp+oXFk2bTsLtYmVc3groJI0F4jEg?=
 =?us-ascii?Q?0MMLPbK+3b2Y4YbgBoKlx6j/E7NPIjUwG1BllpVncyvQQgWU2oBXjkGUAh9h?=
 =?us-ascii?Q?3K0Lryp5QA+elVgbxc4a3DxcAaXZCjoFEX2HlUsEQA4nBngLxXvdKgau5E6k?=
 =?us-ascii?Q?quAGibAv/FLF1Vh14QLwJDiMeVq7BQRjgbIiZOqLso8wYKF1l8AjK7J6XijJ?=
 =?us-ascii?Q?rU4kSppAsyNJ9kN1LQ3jU2SOb0MXqV0Y3xtmJGgl7TdS8K4G7nX4UeiwgvGJ?=
 =?us-ascii?Q?vACfS05YPNJqswfyAqcC8Wav8YRUkPN9+8Z25hbFDA0XP264++BTx7SwT/zk?=
 =?us-ascii?Q?RyVtrIYH61+fVT0DF70OD8gho8TGCLyvh5H2j441Mai+QnaepNNM7z4AegM1?=
 =?us-ascii?Q?xUmyp7dlUiPDfEHBm9TmxqMzHCfIAexXeEfHG4IOg/r57M6ZgSeJcODVu4Ui?=
 =?us-ascii?Q?jy1wJwTGd2faaRfpO7Ltl2ob5k+0bKgbYvio5UotMpnNMfCUPCor2MqW0vgc?=
 =?us-ascii?Q?J0O2nZTCShOfCxbzd1SolfafvUJVelX0Pu87nXfDUSJAhQssujiNwtxtg0T1?=
 =?us-ascii?Q?QaO1h0a6/yHyON5D8DY6DzohR67pUa344VYlksGGfg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8rGl27E2qkaVnt+GIB76UdwRfweftotshnFutnaOdDMJURPnkpS5wTPc04ha?=
 =?us-ascii?Q?i/ScvIAqcIRVWQTz3bmxvjhdc6nO4VYRR4r7C0n+uOXpQfTuehRC9dcU3QnB?=
 =?us-ascii?Q?8vFfl57VKMlJPJxPOp/b7+/ZPF9aPlrhQ7oLoQIeatJdoaJGs/BoPyToghnJ?=
 =?us-ascii?Q?al611jsHIC4Xp/kRm//tHXVcwdKKChIborQCQ8u9qP5bJnDD/NZTK3c21TSW?=
 =?us-ascii?Q?kGwc41bllbZKcaX1jgKFl0hdBm/vYfeZN1IT/swnL3BCj3EOnMSEw3mjh6h1?=
 =?us-ascii?Q?AY6TZ8CfR0B529oyB09D8yacW4tpZLkGH/fHnk2VKUwR8Bi/bofEVTLi/JBX?=
 =?us-ascii?Q?juo0pXiAlIFNvbptOcu/yk2GCt7roFBhJXWyppsI47ggrzlSYQFh3hoUCJaT?=
 =?us-ascii?Q?mBNhgmfArl7NCEoGrTc/NLaWpulhSx+UPKovzhbJF0bolFfQSrEUzgYk8/6e?=
 =?us-ascii?Q?TejxnneL+9YFN4FVCoGNkQlQtRFclXB78XGfOZ9QcVBIZjfPsZtQ0LNvIJFT?=
 =?us-ascii?Q?MytIpVemJ3nFsDSScl4bB3OjdsE4A5It5hlIDtFSTtbLSjXdxgTor/QlWrlh?=
 =?us-ascii?Q?GHHC7X5ZyBnyP7ZMrOi77Wt21hoGuL1yVt92bDMzeEY6XZ+c1TwBrpp276rx?=
 =?us-ascii?Q?7+7QJnwwk2L0Qjlu+6wBIhuHY12E7GsIJtLiX/qYLgOR7Ro1OikfvjjZ9WvD?=
 =?us-ascii?Q?Tj4PXnrtrYF4MFdm5PiD1yh+ge2znD3tk3YNrGv51CiLJYIW2F/jOFbUrm8W?=
 =?us-ascii?Q?rzViRla/UiuXCBqW9GIYSBXAWzoQzVoxYvO2Bj2FKCS+9vOvNkdSAIaN5WXe?=
 =?us-ascii?Q?kmVNhvUIW+4y/aM2SLdkud3im4o9mfELcm0pyNXdXIfR+vpPrIeELYfClkQe?=
 =?us-ascii?Q?95312k6Si4RCJeqQzjaf36EnKT+E2tXSf5codb5vLWpIKhKbyfYszGuoOt5m?=
 =?us-ascii?Q?e4pK6ARsg4OJAT8tayaqOR+ZY/sfg3WfDPOwDc3R213rN8YnWTxrRZwWkGlg?=
 =?us-ascii?Q?IZkrPe5TOUC5fd9v8U7q97VyVtvXNSi8u1/tabHg2/v3X0iBQFoaVUPRhJZm?=
 =?us-ascii?Q?Ooef96Ak+JBZrJ37SqqhvIyczsaf3bLhnIAiBmx66maORhY2gsExNYaBQmWh?=
 =?us-ascii?Q?e43E8w7pNxzWgJ/msfNmUA8vyG83WsIW6o16QwqG6CxKyHlD0dr3TVjAv3va?=
 =?us-ascii?Q?+DgqzY3IzxSJ41njmlbwV5jUSofqyRzuKPCm7fP7PM5NgXqlKrpSRaA+QJHN?=
 =?us-ascii?Q?xC/SljLqJjA5DwpTOpftheRgOQF+QCksjFm1vOki/SfU1Jzge/uqMUR5/bij?=
 =?us-ascii?Q?Ypbj/U58N76Qesk5r4LyILAULT7I1Z+8j1N+DQZDyGBA/V5TT3485DBt9tgY?=
 =?us-ascii?Q?u4sFRnuFJ3ajWhtzjgZi1pP8UNM93z1B+YwV5U8eGOUiNlI+qJuRzS+Rr53M?=
 =?us-ascii?Q?/tdyFVti+gHkd0TPk0y64RD/PYiTNnRW0Onr0khzU7XI2EarPsewDNinegDP?=
 =?us-ascii?Q?waNjn2VGo0WPf61jTWqQgtizYm3HUCICn48nKNix8G5uDPkkEGxJ+wRHovwX?=
 =?us-ascii?Q?pIyySR5JCCc3XlvHMSL0C/13Q2iGdqpRuBXqRJQWvvcJm1U6LRV1OvBrzwOW?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ziVdlGvcq09SVLst8SArZ/weVf62rzHPmth28KmAzVWspZWIQpSctUozVk+jxYQ9/xXPs9rV4ekCTUXIMIJ+zNzKPJDr3MCNsWJZ3hcgbQpm8IJxUqMbeX3HxZuC8wmbiaou5P61PUM5fw61BJblEWBuXmfY3cZicWXnxf5LpI1jCl7rqFX0cYJaS/PC+jd6FGnmAULEBmEf7Ihc3dDbcsu8oK3rwT/Sb0+AmfYQaqblQnJyu38gmgJwwNv4ve+B/h/NSZq65CwLEGZARrCyHHTj7ntomcztTXoAFHOm5TDeeKin0uqWsqxI45hcCyoSpa6c0J2OAk6ny1/OfQ5BR8/eIh/12FM3RI6eSzZcfs1CKggxi5x1PTaIE/aD3GvuU0Vsaal/qC4e/H/CMH81wBJBvZF3/RNLoMhx+eAiQbRDj4xNAVgsTMz2wvSTqOAxpbd52imNOGFgVVgtycGsIeefmk99bTIOJqtrufioLH1V9/S76curg+zwHzKH0UOEif6yMotmvwaf01zI60RzFthD+fKFGWx9D4iDQ2z4rVrefG/uoEIGAGr+ESmqTeP/G1Q0Il9KgZKkBrTRct+iKmi5wop9FlIsBjx0onsMw8A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5e3bfb-f63e-450c-0ad8-08dce99f195b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 02:47:51.5202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VigC4CqPXCxeQqqpwF6Nikk1lqDHc4c7YoBdKp0aXo21mmmawFEZmaSQKp9aX60Tp1Jw67znztPhbXpUuZRkSFY4rq3hNcVOzChypSZ9BA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5800
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_19,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410110015
X-Proofpoint-ORIG-GUID: 8siv-h5sjW3-vsdTEpCsno3tgAsKnQTM
X-Proofpoint-GUID: 8siv-h5sjW3-vsdTEpCsno3tgAsKnQTM

On Thu, Oct 10, 2024 at 10:03:37PM +0100, Alan Maguire wrote:
> hi Kris
> 
> thanks for the detailed explanation! Replies below..
> 
> On 09/10/2024 18:34, Kris Van Hees wrote:
> > Hi Alan,
> > 
> > I see what you are doing here and I think that it certainly has merit, but I
> > would say that the implementation is breaking some assumptions that are part
> > of the provider design in the code base.  The way that a probe is related to
> > a provider implementation is rather fundamental and you end up breaking that
> > by having a fprobe-backed probe actually use the kprobe implementation.  I am
> > thinking how we can establish the same without breaking that association.
> > 
> > There is also the fact to consider that if we end up attaching a given probe
> > both as an fprobe-backed FBT probe and a kprobe-based FBT probe, things can
> > get really interesting because the defined order of execution of clauses will
> > no longer be satisfied.
> > 
> > Now, what perhaps could work is if we were to first try to determine whether
> > we can use a fprobe-backed for an FBT probe, and if that is not possible, do
> > a fall-back to a kprobe-backed probe by removing the probe and re-inserting it
> > as a kprobe-backed FBT probe.  Since a probe is associated with a provider by
> > a pointer to the provider implementation, that should work.
> > 
> > It should also still work for probe lookup (though that should no longer be
> > taking place at that point in processing) because the lookup code is based
> > on the provider name selecting the correct bucket, which can contain probes
> > that have that same provider name even if the implementation for them is
> > different.
> > 
> > This way we can never have a probe that is associated with the fprobe
> > implementation but really ends up using the kprobe implementation.  The
> > association between probe and provider implementation would still be kept
> > as-is.
> > 
> > Do you think that would work?
> 
> I've been looking at the code, and the problem I see is that it's hard
> to find a place where we can look at the actually _used_ probes (as
> opposed to those we populate()) and make determinations around kprobe
> support. My first go at this was simply to use the kprobe implementation
> for all functions containing a ".". However, as you observed, that could
> potentially result in a mix of fprobe and kprobe for a particular probe
> context which isn't allowed.
> 
> And for programs where a probe participates in multiple contexts we'd
> need to worry about whether probe replacement in one then had knock-on
> effects for fprobe/kprobe mixing, timing etc. Specifically if we
> replaced a fprobe by a kprobe for one clause, we'd need to do the same
> for it in other clauses I think.

Yes, but note that the compilation of clauses does not actually involve
knowing anything about the probe implementation.  So that is no issue.
And since clauses for a particular probe are associated with the very
probe, replacing it (or perhaps moving it to another implementation) is
automatically going to affect all clauses associated with it.

> So I _think_ we're stuck with an either-or; either we can use fprobes
> everywhere, or we have to use kprobes everywhere in a program. Is that
> the case do you think?

Yes, but mostly for other reasons...  DTrace guarantees the execution of
clauses in program-order.  And that can only be provided for in BPF if we
execute the clauses for a particular probe within a single BPF program.
So, mixing kprobe and fprobe based instances of the same FBT probe would
result in 2 BPF programs, and thereby violate the clause order guarantee.

> If so, the question then becomes is there a way to iterate over the
> actually used fbt probes to make sure they are usable as fprobes; if not
> replacing all probes with a kprobe backend. The problem is the only
> place I see that is in the compile of the various clauses. We'd need (I
> think) some kind of prepare phase where we walk the clauses and figure
> out which probes are associated to make this determination. Once we
> start compiling clauses, I think it's too late to backpedal and replace
> an implementation.

Actually, on systems where fprobes are available, the probe definition (name,
arguments) won't change so changing the underlhing implementation won't be
an issue at the time of compiling the clauses.  It is only when we generate
the trampolines that it matters which implementation is being used.  So, we
can change the implementation after we know what the clauses need.

> Or are there other places/ways to solve this I'm missing? Thanks!
> 
> Alan
> 
> > ONe complication I can think of is cases where both func and func.<suffix>
> > should be traced when you use an fbt::func:entry (or return) probe.  They
> > would both need to be done as kprobes, because (again) we cannot have a mix.
> > 
> > On Wed, Oct 09, 2024 at 03:02:33PM +0100, Alan Maguire wrote:
> >> This series is focused on solving a few issues with fprobe-based
> >> attachment which prevent us being able to attach to functions
> >> like finish_task_switch.isra.0.  Such functions are present in
> >> available_filter_functions, but because they either lack BTF
> >> representations or those representations are named without the
> >> .isra suffix, attachment via fentry/fexit is currently impossible.
> >> Falling back to kprobe attach is the best solution here.
> >>
> >> However providers have been written with the implicit assumption
> >> that certain aspects of the probes are shared across the provider;
> >> program type, stack skips etc.  Patch 1 addresses this by providing
> >> optional provider implementation callbacks to return these values
> >> for a specific probe.  Patch 2 then updates the fbt provider to
> >> use these mechanisms to support fallback to kprobe and to support
> >> "."-suffixed functions.  Finally patch 3 can then specify
> >> fbt::finish_task_switch*:return as the underlying probe for
> >> sched:::on-cpu.
> >>
> >> Tested on upstream, UEK7 (5.15-based kernel) and UEK6 (5.4-based).
> >>
> >> Alan Maguire (3):
> >>   dtrace: add support for probe-specific prog types, stack skips
> >>   fbt: support ".isra.0" suffixed functions
> >>   sched: fix on-cpu firing for kernels < 5.16
> >>
> >>  libdtrace/dt_bpf.c         |  4 +-
> >>  libdtrace/dt_cc.c          |  2 +-
> >>  libdtrace/dt_probe.c       | 16 ++++++++
> >>  libdtrace/dt_probe.h       |  2 +
> >>  libdtrace/dt_prov_fbt.c    | 84 +++++++++++++++++++++++++++++++-------
> >>  libdtrace/dt_prov_rawtp.c  |  2 +-
> >>  libdtrace/dt_prov_sched.c  | 23 +----------
> >>  libdtrace/dt_prov_sdt.c    |  2 +-
> >>  libdtrace/dt_provider.h    |  4 ++
> >>  libdtrace/dt_provider_tp.c | 12 +++++-
> >>  libdtrace/dt_provider_tp.h |  9 +++-
> >>  11 files changed, 117 insertions(+), 43 deletions(-)
> >>
> >> -- 
> >> 2.43.5
> >>
