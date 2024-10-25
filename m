Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F83213120
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729889642; cv=fail; b=XLj6coaen/kRsV/s9JgClrOg0YC5wRAwuc2lk9ZaPn8SVMVcNz68VJ2L/ZDiconscEA7epR2u5TMGdsgPPinYJWR7Gf+cXMOF1AY4VQUQXAJa4Tkicn1x35j7qBvO6EQ7vqt0ZnVMfxe2Xi82WOXqpDnE+MdThQJzKyXSmnbyvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729889642; c=relaxed/simple;
	bh=DdAJbLLcAPxFbfh4Ur5iIKpHd27I05yv6D2J3BM4ssw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h5fqvdEOaxngKHlDEF5FSumsyKNmZqn1xvJyE0Uclt20dh+xekpkGy6QZhOeSByuFAApekv4MeFwYy57cyUqSA/C3OiGXZ+hg9BuXIpIJrBBJZKHTDB1Y7EAMPKLlPlV7BX3nYIOze15v42a9G4onSZ0vrKoZhEiXIFPqFpPFQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l9djDpfA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aMXQ09ah; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l9djDpfA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aMXQ09ah"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJdTES007212
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=GgHXIAEPxkPNUrH4yN
	B5mY1gPcukudBoYiNGo+NEi5M=; b=l9djDpfAwOMXKBUR5UzF5T1TBDG/0Uqunn
	vpNt7Q6s8lJ1yuhGEK+rKO/Yj/3/BU3IIl1kNVK106merHGnoUgsycu526YlQ0yv
	j7wbKfK2Ky/akmbVz/MZ2+CJslHIdfjrvS6iAXQh0Az6Mk817kWws7hDJxV+Edtk
	IM+lgLDEHSqHWuAwriD+tpBxkstZ/sM11TytCLg1oRFySYzdGwRh8mUDEKR3ShK5
	+JA/ys4wwrotlNZdD/XHnmnIq1sIXvp6zeIL/26/gyQ+R+3waI6FuEYmpQX7IAaQ
	yJsrBTAGXf1YmsFeZfoi9ySeRqDdsTiNNSp2Ae7ie1MakYkUzeDA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uwvse-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:53:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJVO2D008697
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:53:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42g36aymn7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:53:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF9T4H74tTq9z1pggZ0UBa4IMzvY7ipVl+CDIru69di2j4hp9xoe2fFmcrP3X0kAKVMjlT0ytlcVe7ulb8oUZo7BaufS7b80dfXWWdiwY6bKiZ5Bk52YQLRUjSX6PZesWNw1kpOCSKJmCfv1v0KeiJdpvSTIhTogp+5lMZY89nmYDXshaVlnxlrJyZyKiA2Z8vusjVJ3SQvGDRzrWL/Y+uwSH2vk+eDwBm97m382sOYMwC3y+TVdhIw4vtOLOkDBCXHZtK6hNOpYygyQBylA3wMahpzDf8FTZDERiSQw0nwi+djkxFY757M9g1JWxSO4zaYFPIrLkg7GbR0b6VJsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgHXIAEPxkPNUrH4yNB5mY1gPcukudBoYiNGo+NEi5M=;
 b=MNMcxT/jzqshqtkHFTizDC4sxNbusD/rG3WShmw7EBgn3V+l26Vi0voYBG5Q1pB0amjB19qNM4eVRw7TVrxSuzARra8tGjxcR2Q29k8yLumSDZL4HC9h8HJqsr5eN52wschpbz2hAnd0yJqB14jFMiwtSCG4/fzJD5DbLB18ucfg3cFLOMNWncGJBDKxg3Y34Dap3Z8AWdEkvOmdC98D1zjMxgn4iXFmu+SF/u3+xXegjw5gNcszUM9BPYAs0go4lrn7ySmbHEGx7OUIF8mf5Jg8b7cQy48MyfbTVx4f0d3XA7rf2ZzFm908wwh23R8tDwCNCL3LbX3nJTa8NKMe6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgHXIAEPxkPNUrH4yNB5mY1gPcukudBoYiNGo+NEi5M=;
 b=aMXQ09ahEVsMl/Huy1RzFwoOU8jRR8mTyxzn7OUWHFmAqoALhEaHsvfx6LLDPiw8w70gvt29/M8uUFhYGa/aUq8WzNWCznyvvKPKDFyox/NFnmzkg24wlr0inbyI6DMGTYbvDBdMFDsxfO/UCVzffPHdcWIcruHNIlxnWM+rIuI=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by LV8PR10MB7966.namprd10.prod.outlook.com (2603:10b6:408:202::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 20:53:53 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 20:53:53 +0000
Date: Fri, 25 Oct 2024 16:53:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/6] test: Remove some outdated and unhelpful comments
Message-ID: <ZxwFXacgFFIwUECd@kvh-deb-bpf.us.oracle.com>
References: <20240928022158.9206-1-eugene.loh@oracle.com>
 <20240928022158.9206-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240928022158.9206-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BN0PR04CA0087.namprd04.prod.outlook.com
 (2603:10b6:408:ea::32) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|LV8PR10MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: 45468238-043c-4179-a066-08dcf537227d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZMhRUQXrHONcIgXjGXth2mvar4uuXfif8uaHBfM4V1CoIo5zB6cLlxNnFeX3?=
 =?us-ascii?Q?RQxN0FtZm8SeV1jENB3Ai1p1yIdFEAtoMlL0MTUnvLPUYFkcODQNzmYLqZrj?=
 =?us-ascii?Q?9eZ+82FUTbjj9CmpTzMBposqiB/sZQ8ZF3++hihToBxuzk8g8V93YpO6mY/0?=
 =?us-ascii?Q?tvvBXcMYwyFcCCX0FDSj6RWMPoUCTIMBR7p2LsDYGBOhSArFd96fdgCRG5Ci?=
 =?us-ascii?Q?lmSUMnDbp69HI1jjxk7hCBnSzk4EEmJC26S78uGVkCrZEpoVkgo2eTfCdOiW?=
 =?us-ascii?Q?uCAoFvEuj4QlQKhi5+agvepv71cr+X6LiSGNRSid8HGtlOg6b8GlFOEmMTQC?=
 =?us-ascii?Q?dzEtQXdWoC3wNXMm7i/78zE65Ol+CuXXNro/liyiMUfeShzARAf5FWn2sd8z?=
 =?us-ascii?Q?MqCQLWltIcJIjtxEQn6lPhJBxLESrUQ+XQw0oz6NchTgyTIa/cRWYKugstJB?=
 =?us-ascii?Q?VFQ0tRdDo01z94Yhpcoa3ipt4hNGwkLPRR8eO3Rx+9P9OSnsSHOOWkWejWRh?=
 =?us-ascii?Q?gGe9OleC3pvI9mwM4rWANPl6+Ds3ROu5f1saj6Yr5+nJFei09yn2eJmr9uLt?=
 =?us-ascii?Q?9OxPBYLvzvd2OCVPW28MOd6rMZ0B1J4pwRxMoLSeE3vgjklym5SCYpIGH1u2?=
 =?us-ascii?Q?mLi+uc68yuAZlJBIBNnqoynmxH4Y9AJ3MAoPNBce62j30uvo/G/+j3dz2rJC?=
 =?us-ascii?Q?OSea8Pu1PXYz0YJFktnsneqyCEvD6hhO+dc4JDylqidnH6SyGwvHenVXfJhC?=
 =?us-ascii?Q?KHf48QemQH5n+owxBbQNjbCn7YWrZfYYSR0NYX7pnp64OaT+F6m6WjbnnqeS?=
 =?us-ascii?Q?U4PDqbZ/VMNx58E8Bw7CovdxDPgncxQtLWlEKTDdXSvd/Qvmaw7xhOWeIiuE?=
 =?us-ascii?Q?1AQHsVsPWMZalXqlVpPBgW4OhRYzB58Kq4zoFDevEDXzerSRDwhd5UmH2fNl?=
 =?us-ascii?Q?k8W5Miy9V2wKofu9IEcC9seSIya4CVqOu4HwxO9jBr0XlaZFG4XCnLQDvdEe?=
 =?us-ascii?Q?la2/aXmIU8flEzJTWCCuEwQP5Idh0Y+ybCRnhuhYdRSZ3lUbf+4Bu8Y0eo0t?=
 =?us-ascii?Q?dOrPBcsAN2WhLqW0J7lkmqwinWYXXgvkTVmlm2DksWmOPhg264K2Q8p4Nx0a?=
 =?us-ascii?Q?fxyoT+j/Z//cGKFEFLz4Rz2I0OJdGUZK4DGsrxJz2kbvVDTG89HSXa7EQjyb?=
 =?us-ascii?Q?a2ZRvnNw1KJKb9FJtDcBuB9nleqfYsCgO49ajVnimNvxb/OW4uwPqSyBcr01?=
 =?us-ascii?Q?V5BpsC/2JQXFKH0VZfhR5Mn5veWLJ1qlVLgPq4SvziHuMejION5KkUl8dbqP?=
 =?us-ascii?Q?b+OgSVEJtyyRZxTUWiuQ1DqI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RRozIazEmQusSh3TbNGzKUiCWjRCFemwa+BzrFLVeUQxIBxOtdOlZZ3B48zf?=
 =?us-ascii?Q?BKjmK8dWO4kwc1YXZOiVrveOb/Wyg8v0PoYYjLdsM5mMljr+qLUfUHP0PwE1?=
 =?us-ascii?Q?BduIXZFlTRIZKxLrHvmvOw9LUHX4rHb0g2lLbq/eUfBuMZcHvhEPmsxPTSmm?=
 =?us-ascii?Q?URss6N8LmkmYDpJPP6OgmYaGmx9gWh0IX58OKZv/CuAY91YfwdB8EBi/bNzZ?=
 =?us-ascii?Q?29+VCHdmqFvre3+KBrToNCrPgslS98D9YabobfEMbpzsJ+wIi3DR6lIUtuIW?=
 =?us-ascii?Q?ij0/9FZsPtW6UCodnizcr7n/aPwKJYyEX+QuMxZm88YzzcJRaYMkScNEGhyg?=
 =?us-ascii?Q?k3B9F/4R+KbHnIQ/dru48g8CxxDvfvOAl/Ssj3aDpkKSxd+M8E/u4u16Y6w2?=
 =?us-ascii?Q?wbN7OjIdm3r8Etav42uj3GWso7tcjRjbw68xj2DgfBCHvciKAF/SiONWJ/Dw?=
 =?us-ascii?Q?xbkbcgSzKXBWUGzuqqazYIKen7lEK8+w+BYfz2MifGtRNC8ReeSVpBRnjQnS?=
 =?us-ascii?Q?FYIEx8fLgoVRIK366ixOtt4emq5OEjgC5gLFR4SiURrwAytdXbv7fyP9eMji?=
 =?us-ascii?Q?c/kik3Zal5e/N+V+lTbzhDCeRZGSulTXwExRmE+J5xqYn+HOX1r3H7tpX9S8?=
 =?us-ascii?Q?Cmv1wtBykyXFVLtFhlBuFxJ5TUJ9DLHxOY0s486iw8BuOfJyIZsSLsi3ckRL?=
 =?us-ascii?Q?jq0sGieCeRROfhKKeN0eGpjRy/HeLG5jJjC92YY9MvwUIeh9ahmEt9Fg7HHE?=
 =?us-ascii?Q?Ev8uTaHG2P4fe03Y1LL/EzVevMQqZomjyOD/bGy24KFV6jAKGQ5nnE9DO4Zk?=
 =?us-ascii?Q?DcKmIlItK/wKG+8yuK3MsJ2cGh7NjR3dKmqIAtsgt105cb0/c55IyikW6/TP?=
 =?us-ascii?Q?ukFPoUlQFORWjmS4bK9MHqMR0OSnwhg+jLsdLM5RrjEfwaCKIAp3klsFeX5n?=
 =?us-ascii?Q?lYYFHeoJsvZENfqHXRLMFfGqmq2DK3N/Iu04io0PzHmd8uJHcBss/+sSErqM?=
 =?us-ascii?Q?RsmO+gZFbyCoDzSTJ1eGpv6BzD59vo3IGh05GUiWH+xjbUuTXaZWlru2RBGh?=
 =?us-ascii?Q?A/e8TBUSP6CQ0EKZ/GMWRH77YoD3I4VtYbkvpydGSnSlLJaRP6ENMj6yOrR7?=
 =?us-ascii?Q?qI4genwo8HURRs7ZK5oqIto60ADBjmgo0bMHevdQSvij2ECqdNYPiCPBZl5I?=
 =?us-ascii?Q?EjFck4tSBHnkTb6JFIXVMLZr2qZQ0FnLsAIKQ6seh7GLgYydc5Rm+IFTRLpS?=
 =?us-ascii?Q?fhWur3teHSxoi2MpfvvWuNxMb2DRdoFgO5DH7rSYsbSMTEts6la1jyaQaCGz?=
 =?us-ascii?Q?sRFYh41Ees3/Z1VzzHzRCwqZG0fRYb5kZy096SuAEgqDMJ6bXnwxg93d6RZ5?=
 =?us-ascii?Q?7x4+2osTA1qg/nNBlNv22I7GoTu3SNYuZwuhZJhqEU0O8WXPWsIaeParXpZc?=
 =?us-ascii?Q?Tb/8z1wIPwIpZ9LPBZIjvTCW13fXcD+Ev9yKdmIKNHFIKcEOq8iyqLfWAcoT?=
 =?us-ascii?Q?2pGvsRgbYD7h9tLCHK8a7PyeLj2z/AWeUl+CD04N3ZMCY48tpHf4PI1pA7wY?=
 =?us-ascii?Q?Z7wAF7U/XGjrCyNfJVjBxfHcxkW0+b4wrU5/tiLyHBAIz//dPZjbe4aGkKDM?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WcGauNwKn2cO6CbenrBGxI4+jKiRh3Z/M1WNiGj2t9girmZWkQFOb8ab+8pOYDbcS5nbZv+joHH2LrNELL68Fq09VkrwYrB1wKmttfN2zP64jVN/Ser2GGz8qiYO6TmMSgeN/WASfZhPZ8OBn0pH7DHmOT9WgGKWv64k0wQwayNO65IC16iIgy4KRwAqrCgAZDpesNFAEpewhhVut/rTZvLZ8ScMvn3lTlKGzcEccU9gv9OLOaPuoDHg9+F0lxQWhkeVj0oNGqtej4ak494fWFtouo+f9uP86Q3k3f5We78Z/8sCErvkEJ+Rx/6PzIvv+Oixb9t0GAB2eQiIYBYXKdp1DzI55eOB46xpKiNIUzhHdTX8icaVRdiu6c2LZnrmzMr8Fk8+PYMaEa82VHP6svYEw0dXWjrqnjYorwYAGtzi705/7H4CqZbJokliq4ahvDE3AlmGC4wWdXzijMQ6PaoLpn61AtqYITvJC3yRO+M6TOpUSqyhCBPl45lHC7k02D0u5x7Xyj9CgZjE0d8wj7Dv6IkWUVuZBh3c5IB0R73cIVuUTlkckYfVQNwiGVfw7gkoQ1nzjQkvad+DAP/CNrtf+iLNB/knIJUxcN3g7j8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45468238-043c-4179-a066-08dcf537227d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 20:53:53.1641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYTSzKp6iKc6QJuxu5IH/f2oBI9bF6PHc5/MlemFl7dPTE/xATTx9CW4lS/XUkVLXHR2X5C7jInno4TiYql/XS0ZnsVx9pY1Ah+zbx0YVYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7966
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250161
X-Proofpoint-GUID: L8QAUwypHWulNOqvFdu2TaW4_zK2mu_v
X-Proofpoint-ORIG-GUID: L8QAUwypHWulNOqvFdu2TaW4_zK2mu_v

On Fri, Sep 27, 2024 at 10:21:55PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/triggers/Build | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/test/triggers/Build b/test/triggers/Build
> index 0e8660e59..db80b30ed 100644
> --- a/test/triggers/Build
> +++ b/test/triggers/Build
> @@ -192,18 +192,18 @@ pid-tst-weak1_CFLAGS := -O0
>  pid-tst-weak2_CFLAGS := -O0
>  profile-tst-ufuncsort_CFLAGS := -O0
>  
> -# usdt-tst-argmap calls USDT probes (defined in argmap.d) using sys/sdt.h
> +# usdt-tst-argmap calls USDT probes using sys/sdt.h
>  usdt-tst-argmap_CFLAGS := -Iuts/common
>  usdt-tst-argmap_PROV := usdt-tst-argmap-prov.d
>  
> -# usdt-tst-args calls USDT probes (defined in args.d) using sys/sdt.h
> +# usdt-tst-args calls USDT probes using sys/sdt.h
>  usdt-tst-args_CFLAGS := -Iuts/common
>  usdt-tst-args_PROV := usdt-tst-args-prov.d
>  
> -# usdt-tst-forker calls USDT probes (defined in args.d) based on dtrace -h
> +# usdt-tst-forker calls USDT probes based on dtrace -h
>  usdt-tst-forker_PROV := usdt-tst-forker-prov.d
>  
> -# usdt-tst-special calls USDT probes (defined in prov.d) based on dtrace -h
> +# usdt-tst-special calls USDT probes based on dtrace -h
>  usdt-tst-special_CFLAGS := -fno-inline -O2
>  usdt-tst-special_PROV := usdt-tst-special-prov.d
>  
> -- 
> 2.43.5
> 
