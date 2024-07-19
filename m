Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8CB147C96
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721425280; cv=fail; b=ZknHdJtDBABjCKIy6lESPD2xrOSui79c7jeCiPEtSsxQ85p6rK7UpY1w3yDvDb2pegcs5yM4xbINPDbsSAgcVIurMQ/z5OJyIhETHQCwTsalL0ZqRh8sNY4l3YL7d7ekZfxVCXF3jXDS0hxySF+gBTluwaTt5rWSL7wo2cU7VZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721425280; c=relaxed/simple;
	bh=03tHmLFzlZuEMXDVOFMoXEEvMHqqOazJjvNeTmCCYcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eVq50j6xzgH4XY7UjgJDIOm6XvxJL1ViSw2zqYfHV5/oCHX92lYCNH38mUD/ZW9lj0GlEZC8Y1c1GV38OeMW5H9hOi9RmSafcLwEmja/MHpmj6iDijl6xNOX/yGjt51hD90Fz3e6zxHDa4ExgBIAXsJWp8xnfQp0QbrWF9r9zhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UaI6MQ72; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B7s44mrF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UaI6MQ72";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B7s44mrF"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JLerhU000321
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=vfLY719fDvJTVvq
	x0fyHu0EbCp0zNSk4XaQOATFkZHo=; b=UaI6MQ72XJSJDhsfYYDMalaUTyFInlD
	KpWghd2WHdhmja0l1pmCNJI+qVYEWcJSVI1qiTvqw9gJtv6xFP9i1awj/HO5+spQ
	JIiNTpS3XGEv4N5cXO6RhuCqrRmIhXcHiotQI52GEosDw3luEwVj0PtGoF8kzRRw
	C7DcOiIyRIFLi7jB5OEwlcUKwkf+umpH90XsjWAQKPL43G6XfgY6p23G/3e+JsSz
	eDoMDIPa1/6uyScEnKBmelMPm374OJIDCwziTsw+umR8+mrmrDuHwWgaXIxFF2xM
	R5R7X3NPNfEj8n0jIXI9izI71XyFDrMzyg4uZyhFVRH0ZhrplZcgcKQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40g08vr00k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:41:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JJUXik020224
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:41:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf27qjw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:41:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmmGKoLFDb0O4mREAFD3/xeUPHpKoMoMrLH3xLmHu2K5zfLKwMeq18wG3MN5bfNbF3JgixWT7n2YV99Bqc68YyamC5yvFT6Tbab7EuTJEoc/OQEo/tvmMVfeqFAagr7BG9vVGwNVHm0m2WxddE+JeL/XvXO3vl1PYLvWOOUCzjGLB/svt1ep5Tpo1+kEI5t6yJfGGeWLK95/XNTLte02IIWmcucE+coJPh7scp124bvNEniJvqwO0b2MNNqJkQ8gCUtXMag9UWnAWF9izagDhVo6RVZu0MeiDMZFaBmbOGRVYcMKAnnlE44/6tVntoHQB0oRbnpvZ8OkP9tkrZ85Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfLY719fDvJTVvqx0fyHu0EbCp0zNSk4XaQOATFkZHo=;
 b=dHqVxI9MGMJebEVkaUyYeCxX4ig3PVVeBUeud2YU5ph1skDK3Oe74Du1LITQ26EHutvwZGa60wLj0sOh55tmrN+6xcBOeyYSsQCsmogOT03vwrCi9PevXhxDWpgB4ddbgr64g6VUChheuUv4j3USP+5+Ws6nb1x4Ur//g/v5IJAhDwdjoRMeKU4NG5jL8xcxSY1ZwlHET/zrpCGPOtacjzoo41GJXEa8NOEpUwEMoJ3K3ZhxW5Nu57QdI7RoUxyTbiCtZKngqRt6jW8qomu2wufYQPOOzT+/OqxTKcuVHdyzJXYK/+nRRq95hSUDvtJGBwe+UuCmN7WKYO5WxdeeHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfLY719fDvJTVvqx0fyHu0EbCp0zNSk4XaQOATFkZHo=;
 b=B7s44mrFlFtU3BSwYJHk6R+gWOnDuD+sQA1egQPWO8aWQ9YfFlG8vQjvLZxMUUssC96oKyE8bRBUibevjTTu7egH9MLBSXwJGnt61BBdA7koaLe4UfSHqd3BgGPDcEgt6kD5f7VBL/RnLPndmWbFnyUy5AHEARM8LJokCsZyhXs=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BY5PR10MB4258.namprd10.prod.outlook.com (2603:10b6:a03:208::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 19 Jul
 2024 21:41:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 21:41:13 +0000
Date: Fri, 19 Jul 2024 17:41:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 29/38] Allow relocation of the ERROR PRID
Message-ID: <ZprddULVHQOJhnpT@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-10-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-10-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P123CA0210.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BY5PR10MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b806386-bff4-42ff-a83c-08dca83b830c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CQvyll9OrMQmKX1C0z1YUiMgXjJ241qVJAJ14GoFHYw9HfDr+z8YMrbLCnS3?=
 =?us-ascii?Q?Bi+CQ1Te+mdM4CxtozZjjquoG05VlQtcGweGnssnQwRDXWwkkLGEnDA30Gsd?=
 =?us-ascii?Q?rCG3y2yFDREfEuJV3ALMl5FEjKNntANW4p73cWDyiHt3giHsPnkg1GV36JgU?=
 =?us-ascii?Q?sX03tL0QBYzsrvanuY4Hc2dFJl4sSxvAiNe6VdoawJubsVdSVQLV+aTG1DV7?=
 =?us-ascii?Q?IyXupwGtKc1xlBqbvXGCo7KgRYmg4GYynOTeIINDT/eyBwr4yFGrg8UDu8sR?=
 =?us-ascii?Q?KLM6mIwh5HGCemqUkfQwDwC6XDFOfipKKSkp5OMiuEQxhhGKgtRAP9JVzop6?=
 =?us-ascii?Q?QP3Nya9iEXJznnzyqHHVHLB4bndUsn1+FfPXlKWbblDwtBpg7r2xcX6OUXES?=
 =?us-ascii?Q?uWy0I/hvJiRUmVnsAhOP1yEBOigSuXd2VSAHbEzZi/uaeJAki9FRmlt+F3/K?=
 =?us-ascii?Q?v9a9imKjhDEcoJBScclYIRjUnH0w7abwsqosur6/kV95ppIxwbjzHVhvImJH?=
 =?us-ascii?Q?P7uU1tL9dpnA6tzvDGHx7Ez2xAiSgznqxv6d5dHiPCBHo3I71pAIquohWtrT?=
 =?us-ascii?Q?RQpQl7/TDDzHeFhlriLelu6ICLnDqFGPVlPGUQER6XNVzJKoeVZP+AtwzEjQ?=
 =?us-ascii?Q?9sjF/Ap6Nem8Ge+F3f0AbDtURS2rl7Pe3Fo/T4zJoRxyQIvZDmDBrL7NBN26?=
 =?us-ascii?Q?Nj3OjNPK9piDAHs6yaib1LvcqAYKLSLOtVFf+VUQNekzezBH4c6PMol+P1pb?=
 =?us-ascii?Q?7dE3lpb1xGo/dlMn/f96czhL8jjKGW3PmoLwiV1o3Mj8KzG2nvgPwEGjQVEN?=
 =?us-ascii?Q?WmA6yuPDtmSXDuDu+/5btuKyEj5vdTcpTY//GaidWUGDmjvOsCIW7DY3HJfN?=
 =?us-ascii?Q?cdMU98jslIQWmYROKu/fV/+UN7WDeuBE/ekejcDRCqOlcwC7FNi13EvcegUN?=
 =?us-ascii?Q?bJz5Kdctbf/VNM9V8asRpXxxC1/Oib1pHteMFqBdMTMU5zZdyfWBXdlbBOQl?=
 =?us-ascii?Q?spxrlGmPsOsmgDAzq+PwS7UJgyKLAPa5wbt83Tz3Qp09bQzYW70o8hC+VUKY?=
 =?us-ascii?Q?e9DjbEddjx7vcU0WpqTtrJhvfD6jBz5KYfiLMRWxZo2xzlegqUtVRRAwJdKw?=
 =?us-ascii?Q?Vb9ZU/YTkDpM8zNDngkNTqvFhyJ5nqGxQ8dPJo5naOKfZnoK+OzVZnGtEDg3?=
 =?us-ascii?Q?Vh9gmBnSjN1ov6aNpReKXuDwyVYmpn/7Gf9iroDMlOppfQe3WPnRPEV2jP3u?=
 =?us-ascii?Q?E87Dj+dQLyi8NeKOaANNaJHIprEb3QGTRLRaXfi1z2kmlUuBGgHd7zVIJcdI?=
 =?us-ascii?Q?+Sgu6XU13PD8NOzo+CKRWMJnDCqm6/9EE5cheKSdcc3NxVvxWnCvrel2jd78?=
 =?us-ascii?Q?D0/2wx4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IP4MiIu5EQYA0o2YegKHOX9UhE799OL2x7boldWgjJlnvGAcmoxTrb0XKJv8?=
 =?us-ascii?Q?P8cE+YS7reFpeJt3kGcdTgrdFxPhhq7xmxYJ8vC3ayyYSU2jmHnR4NxozERc?=
 =?us-ascii?Q?g95qlco9EPJBitHqXVPMn7Boo3+jH22yH0qxYPDwrQDwIAqcgWJxemvCRLAH?=
 =?us-ascii?Q?FhF5x3ikVml95VYAj4RAmHh/52bCCcBCHA46jG9Jt9L3PYpaXJW0yRLyCFcl?=
 =?us-ascii?Q?W+TMCC8rK+hwlcMRZTpRyt1MTpMeqqGED7O+pHrL/vQtNfm1PKAMUY57SN0f?=
 =?us-ascii?Q?e/LTbZvp/5sL8U83+pA4et8FfwsTZCYYiRY+qSuUDx9rLvAuRSy41OdhmHeU?=
 =?us-ascii?Q?5mYC9xngN75h+z9u0y4svfaNHUfRMwGw5bTOFNHfUPVl3JUyoqpLaORSneul?=
 =?us-ascii?Q?j2/TWh4hNjp+qmjsvtaH40Wybge8pdHONSmLKJwGOmVdiKJQmKAQpr8TGb0N?=
 =?us-ascii?Q?p9walAoo+Dt6qwmApdQqLGlH3jzC2NiE+7IFocbIbm5Mf3Jp3rre01vw741v?=
 =?us-ascii?Q?s/TH+9+vduF9Wqro3BaEK8UIIB7preKa7AMjfsmdWcM6pDbRIoJHfQEPN8q3?=
 =?us-ascii?Q?GAxo6tnoI95MamiGIaxdRS7krAXVqjQ9K6MFn/K5Ftu5CYD9CbNvxBnliqTm?=
 =?us-ascii?Q?Bxkcgwb1OF/FQM1g0z2GIaADgitVfEI0h+xy1apDACKCrkJ3Xn/h0ZbizbiE?=
 =?us-ascii?Q?2TAtjMyK+JIqfl3OMYsrueIMCkI37IYoHLfukRS0poTSnr1EUS1Jyb0vMcx6?=
 =?us-ascii?Q?l5LzxClcGNu9nkcqyW+yXoHrL/kXf+nrjsYLTTfSoUtK/GjEfcpGU8gHNzjE?=
 =?us-ascii?Q?uhGRnk0JFO5surUoLS9VerYpZDUCnIt6mjDRTBvoGimvQkDmFx46A5EGF0ip?=
 =?us-ascii?Q?qQo4QDUSvUyOzPthXfoizqxH0mB9+XREs4QDAyThbzIKRMe6HsZMKqMwVvSa?=
 =?us-ascii?Q?75AJitKHnZ/hnt4H/Q4cmUVl/RWgbMW8xoBNKPf/uxtAEy/VrrtwOY9ieuUw?=
 =?us-ascii?Q?61zLbuOeYKI5ni7e+LoI8ZIYJrwLOU0nkO3wIWfUBR3q4oDKCDtaoI9UEf9T?=
 =?us-ascii?Q?STGPKhTfp0ezfsfuu2H+x6rrSsEufSMXqLW3PzZP1DuYRnuk+8DA2n9yRxd3?=
 =?us-ascii?Q?a6pLk2YoM50TB5zmQqLNSo8+UJMeQYJmYDi2N9l+k81eKhbXM//Gb7Prdc2f?=
 =?us-ascii?Q?17GoafXw1nFPRWnp4Wk2VCTH+6Y+OJNZm8EwoVvQjs+BEU46UoTTU3T+YYXT?=
 =?us-ascii?Q?88UVZvAv0eVycHUdlAuaPF4sAuEXs3EvlemkpTSk4yJUmlcGcQxp5C33fiEx?=
 =?us-ascii?Q?lk1+mGyHygXzdzpCiRba+sGIwBJTFAMayiAAD8jP72W/roeDw28PaGTpub7m?=
 =?us-ascii?Q?NI4kEkcX244rQVVKwWwxjTCtZG0yIp3iLmlJ25YhNI67cRCFoc48wED8eEq9?=
 =?us-ascii?Q?+WYxNRVh3mSiboDE8CU2NpWT3p+GbanJX/631PlH3o21iRXk9IqLWRZKSw4D?=
 =?us-ascii?Q?I0YAYN36KM8mTQdXrfSdX2wbLeOMhcrVs7OZ8SogaezUN7hpE7sSEr+lpRCe?=
 =?us-ascii?Q?/OxY4JGN5CcyADtCuyMUb8PA3f+rAeP7o/3AAVF+cY3mVsuAy0KXSrwet2j4?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7uq5BZDtQIUAl2CQsQC60cBa8Zb2kuYyZZgqEes2pYDxLp06f9tLUOczEK9SvYN3pWcNyNmjbdg8Waz+wAjrxv82DQAvZfhvRLkqAZFSQiFyD7GBlIwCGmWDDPSU5Z9Lv1XM7mXyZ+ws3UNQ32n08ilrn7Mj4fvMK65NqwSVrfzSGaedgnTPH2b2wL3Rks5hVKM03gQwVBcOr06FiMChSE8yS/OdRhUAfbSXOk81uRAJ94ZTn5VPfEaBkcjkaaQfn92T1wbGGx5TT8lpWqgNfLp0C4aYddEKRn+BuZ6BpDsdr42fi0o6DioPTrRDbgzOJWsH9jctBs61wX1RbvmUiX0L39bXlOpA/ATu9DwWP7/V2XArzJ7NgmiunU2kQh+kMMM9nODUmDSyzBk/6ddCQGzhbwt6TcPkEOrUKAcqDhhy4iZemmeTWcw0Jmq+GSC6Mw7tfcWH0voVC8RF3ehsPhLK8qZdCAcd2fVoahupK/DtpoUU7WHY/steRH++EOJLRT8el8i50lYtOj89xVmtoJ9JUH9jsOHoM485zuz41k5JsOBPFpd4aKxoKSIlRaDpo5cqgglQVZRtY+BJnYtTnrWDk1lMf5jN2HwXzfbp9zU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b806386-bff4-42ff-a83c-08dca83b830c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 21:41:13.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKv7TchXBQ+y5CiDWgJjJmRqQvFFQuriXDk41t1GiqIZT/2jCi1mJctgM6VjfyVuHpEosbvpmdq5DAmOBoDsRJjBSwFtxh4Smh1SlTGrfvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4258
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_08,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190160
X-Proofpoint-ORIG-GUID: M_VD_2SWf1XX96ouRwxA2KX2tpMBPq4d
X-Proofpoint-GUID: M_VD_2SWf1XX96ouRwxA2KX2tpMBPq4d

Why is this patch needed?  As far as I can see, BEGIN, END, and ERROR are
always created as the first 3 probes (in that order), so they will have probe
IDs 1, 2, and 3.

On Thu, Jun 27, 2024 at 01:38:55AM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_bpf.h   | 1 +
>  libdtrace/dt_cc.c    | 3 +++
>  libdtrace/dt_dlibs.c | 1 +
>  3 files changed, 5 insertions(+)
> 
> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> index 5b2df264..58cf29cc 100644
> --- a/libdtrace/dt_bpf.h
> +++ b/libdtrace/dt_bpf.h
> @@ -56,6 +56,7 @@ extern "C" {
>  #define DT_CONST_ZERO_OFF		22
>  #define DT_CONST_STACK_OFF		23
>  #define DT_CONST_STACK_SKIP		24
> +#define DT_CONST_ERROR_PRID		25
>  
>  #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
>  #define DT_BPF_LOG_SIZE_SMALL	4096
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index d1ee3843..3d9a9c79 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -1076,6 +1076,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  				nrp->dofr_data = sizeof(uint64_t)
>  				    * dtp->dt_options[DTRACEOPT_MAXFRAMES];
>  				continue;
> +			case DT_CONST_ERROR_PRID:
> +				nrp->dofr_data = dtp->dt_error->desc->id;
> +				continue;
>  			case DT_CONST_BOOTTM:
>  				if (boottime == 0 && get_boottime())
>  					return -1;
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index bc883e11..1fb561ad 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -80,6 +80,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL_ID(STBSZ, DT_IDENT_SCALAR, DT_CONST_STBSZ),
>  	DT_BPF_SYMBOL_ID(STRSZ, DT_IDENT_SCALAR, DT_CONST_STRSZ),
>  	DT_BPF_SYMBOL_ID(STKSIZ, DT_IDENT_SCALAR, DT_CONST_STKSIZ),
> +	DT_BPF_SYMBOL_ID(ERROR_PRID, DT_IDENT_SCALAR, DT_CONST_ERROR_PRID),
>  	DT_BPF_SYMBOL_ID(BOOTTM, DT_IDENT_SCALAR, DT_CONST_BOOTTM),
>  	DT_BPF_SYMBOL_ID(NSPEC, DT_IDENT_SCALAR, DT_CONST_NSPEC),
>  	DT_BPF_SYMBOL_ID(NCPUS, DT_IDENT_SCALAR, DT_CONST_NCPUS),
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
