Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C23E3B389E
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776445933; cv=fail; b=kmMrv75KEsEHnU3ZYx4N4qG3mOqZfVU5BNW772WEdm32OhgtS4bjFn+7G4eAjpyq8dwe01fWCujvO6g85fvhWrb+PlLF/tHFKBjsVuPPciCOPFS1WG3T07ccwXGoPsdQ3P08EFmLtMCll/rSqKI8JD+BQa4zT7e4Ed42CoYBfx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776445933; c=relaxed/simple;
	bh=sTEEBZZLl5aJe9ka7yr5WeTVRtnte2wid4JmQ5GTC/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=fFnUA0z5ejrsawSS8U1d70e9t0hALvHqWfA1j+uzOMXes990VOka9D+ZrDeX0HogjMyx9FdL9hzBOaeZjghZxxorZQCBretbfaDW7ISzSG4BaycU4oIdlwoJ665ZZVIlyNtONw/8fsTjwQL8FQ88QpiScw/JPmd5J6IeHSO62dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cNNzNZFd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nqcWUsgD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cNNzNZFd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nqcWUsgD"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HBqtgX515067
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=XRqit9vRh/LhOH2B+/
	pSFR/27tL9hQL1DKMsbqPZCZ8=; b=cNNzNZFdgnBIN+HFi3+YU/MkHhJ2U679Ks
	xXZImih8P4MaArX8uXi8qSyGILwhX57ofQbgikhIQqFFvWlZYupkvKkFgEgdUGaq
	iR6C+t8Ew+wb7GxJc57BSR0qYMsjc2hf4WrckjQfvJI1nACHj/ffkZxVsEYkD+eX
	FNOLnxhqXbFM5u9y717ihAxdcX5KPR8/eEdPeGKQziDdSeyTqTeh8enFcytd+TIZ
	XvvtF02lZQDTIk/ViGnwX28Lifg4vH8IsRSFvH5a4wZrEwofyN7zD/3uLlOxI3Ea
	w4QkNLQwOxtfpjiqXLd4btrMHXddHP+Oupjdz2r6R6A77+I35PDg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85jt7vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:11:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63HHAHa4005718
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:11:59 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013008.outbound.protection.outlook.com [40.93.201.8])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nr20yf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:11:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruyqBfwTF8xY7rdNeDKd9yK8XJ3tljW7HPi0E3JzklkpBbEQp4v3pUxrlXXneSLrFCHdDHOQGEVDY1xutKK7XR/lFEoFo6DYhI6Lj6FXesFlIooOOhHowqcyd780k8+jQnmDSnVtTLwJ2mnbseMbMP57rCMK3ICKVwZTM9utRS0MsxSRBlOQYP1bnaVOIawEQzseKVNbxGkluYcZOZXXx+28Bwy+Rg3D1J15+iiXwnEtvXR6RziUEoRIiu+R4X+TGvyE0IYEScCCio7h7gJJg5i86TYPLNtTCPSwZ/5yLDQJF4pE08TOBWg1V4yosou9UbPkNjQpLKkZWbp0+AaAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRqit9vRh/LhOH2B+/pSFR/27tL9hQL1DKMsbqPZCZ8=;
 b=TWAo4BUXDfBYXw5+1m3act4eAdpD7O3JwuZnly9dPQtMrr84U/el6Pfa5VoiBOp7goJ/OQi7cup+VOsNsMZUT+svA10ASWux3OVmhrFo/g+OAP5NSZJK/xVEosX/ChJddeXeabtkSCdQKvZ9Zz2sQQz+AW1vaQ8C63OO+99+NiDnj16dOp/2a/+1DuRrRGeW0N082wbhmlSjWW/y+WQHyVHUFKyJa3SHkGqoKYupI5rrXn/3k1r+vNsn0LYiDyfOZm1kxieiPywEwJYyEJLJzr5UQjQKl5cOcWNku3F1Vc9BkqCMPGlQbe0Se56HxVWee+Sa96COmy0EpTVuLLuvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRqit9vRh/LhOH2B+/pSFR/27tL9hQL1DKMsbqPZCZ8=;
 b=nqcWUsgDQhaUUTgIImQMHBZa+OyIjCZuAjmUzzBXgl6iNef8GqTJEwHVMJi2mJstNeDT9Xu+lEsuvhUbya1MVP6s6KFitIc6p4COU62J2nS5d2QY98rvKa5tP+qTQfkNEJIgRaOwZU4FSdFuZyPvYpTugRbXahG2XTfK20Isa2M=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SJ0PR10MB5694.namprd10.prod.outlook.com
 (2603:10b6:a03:3ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 17:11:51 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Fri, 17 Apr 2026
 17:11:51 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/4] fbt: do not provide untraceable functins (for fprobes)
In-Reply-To: <IA0PR10MB7325BFFD3DC90AC2FEFCADD9C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Tue, 14 Apr 2026 02:27:48 -0400")
References: <IA0PR10MB7325BFFD3DC90AC2FEFCADD9C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
Emacs: Our Lady of Perpetual Garbage Collection
Date: Fri, 17 Apr 2026 18:11:48 +0100
Message-ID: <87a4v1zf3f.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0185.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:376::13) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SJ0PR10MB5694:EE_
X-MS-Office365-Filtering-Correlation-Id: 57018c31-8f65-4c6e-5308-08de9ca46ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CTRgprnkJ3FHQB5QKyGWW2LPS4nG7frXPfzWF2NPAx03kULC7qOB5GknzVh2HIqqbsZU79Ih4WMye15Qq9LjOVUrVNSA2rQ76eIKvMaQosmQ7kNbQqrCKRLH+b1r+1CtlNH9HKUkilst89PjM/cknRaDAz/8UTYQRMH1APg/ru6P0P+VJj6HKchdtkE2h62+CSxF9j6vWxXdYkBvxfisvdNRH48kLLMfM8NCKRJqmC38McRFBG2S4r0OCdtxqcvlIJbzKkB2uaO62sb4bVnqz/GKcpnLgNirxbMznZarRZ+Gl8B39ecQN8hlmCNdg5mAdyBOCLIrWefmtutUzqoGw4wohZV4N4jIoQvWiTReTIY+hEQpYYMveO1MEpiIkZEsDTRa9AVrKlZPWtmblm7khpnmiR5PwQIA9+kGTmyc/tSmwug2EDDLKn5oA9SraIf70IrHXwXQ6JS05TJ/jaa+bAJ1Z+TcNy4LYYr2p2I7ZMfSC8SDEttWgayA24z86VLWAENcUIy89e9zeq3+l9xB5F46+4+hgz8VXznEq8N/5NJBXJbDF67xEKiapapHWNIIqPXGSXVGvRjcCuYHBC+oOMYIP5x+kGIpZHPYAyVAF/9sNaFhPqPmTZE8WKYvHOQWniTGawZHIoIF/tGQEargFhzheI/Tt/pQoVVszZLx9YVbKJu+AGdB4rqHcFEPT5xcvcmlRsR7fIiV6sN/ocFfb/WmLWUHULjcOk0jz7wk5Js=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LtBlrEQUZrERscso9d8S++IfNAL2I59gMnYxZdSlwG6d45XjhcntE7C0zc/x?=
 =?us-ascii?Q?V4wNZvLBLQzkZedC8chXarSKxnZ3Bm219x6ItS8K/AQlzgGV775zFxaQM9HV?=
 =?us-ascii?Q?Wnii4aKnCbov6mPrEksdcm21vfJ0svRh6UhfzPE5OWeIOg+FZHWjNlhc+AiY?=
 =?us-ascii?Q?/Wn5ZbZf0an3pwezIY27tLu40vzphRrXcvpHBBv76CbaZiDa6clvkLZCYnSp?=
 =?us-ascii?Q?CImbvH9gbzy7FGWMiHCKe2Xh/DzjqoVVYQBHZ9WQWnWB9CiX2Gb2Egx0IX6b?=
 =?us-ascii?Q?NRVNDNeU+4+bxunNq1XPCDvmSNGSqt4iCHlcA+eF+ythLcuqm2VxXwQpn9rb?=
 =?us-ascii?Q?/DPvOhKGr/S3plSGbm5B83KU9AK8le/iS6VRlQPSUYY2rJ7bagEoGgZqMXWz?=
 =?us-ascii?Q?UDwLKqbGdkHoI1/JK1/CUuv2knkAwweQL6ISOrFSVkONT95BXAUS4EKBCnnw?=
 =?us-ascii?Q?u9nqoh+Vo+oECXbhivFRTgS5Ckj67VE/0wRHqWRUw8+xbnpRJPQHjMCJU0im?=
 =?us-ascii?Q?7C4MrCZaoBRroTc8Yee09HvIFS0NckWk/mKFSGkwLoHsDJwlatEgCIlSj99W?=
 =?us-ascii?Q?ZJqJ6t/kjZGGPBEXxHOG7ONdEwHEH6nhrsGFIZ5xl79gVvMXSRkx2J9weqvV?=
 =?us-ascii?Q?sE4KRNpgRHT9UyPJJU6EGJ1iMSC7PJ1asGq5bQD2QfepFLAoJ18tDW0J/ReE?=
 =?us-ascii?Q?1oJfeiTIG2BIDPDt4/OFMhrciMC0lyjQ1xDb5kHCcc3rvDrn2K0tOQkJAC6c?=
 =?us-ascii?Q?uTbzWZYj1wt/tRDokh1zKvEUbe7M+Pdkt/ly0EArBBS7yowHBAvTmgpNZWwr?=
 =?us-ascii?Q?5CeGOlqx207FJugtGq0vibcfr57c9IF0qniFxlEL6a+OnL4i+F3zFVbKoRky?=
 =?us-ascii?Q?/loxbAtqSWpfGyGZzpbD04eUofCSTfi5dFoGobd44bnhTP9BcL/+tM76R/S7?=
 =?us-ascii?Q?DJ6Q5JNOveJBH7E6RJfuK3q9Kf7KLVSL8Yf2wk8mNSWjJ5f0y+SEcynokdLn?=
 =?us-ascii?Q?ZSkiWVIiVNcN2zkZbOo+hxJEXwhfiW9FKjdexbXJeOc5l3L/K8AplmD6NJjP?=
 =?us-ascii?Q?hzjKzdqJ8rBQy0hgGMsPbJbBXAV9AV3hscjMuj9XB0fkroollMcHV4FIad+j?=
 =?us-ascii?Q?QG3AZzKpNu82XtbMRwyqnkegXSaqyvnwKtJBpOWSmokiD5LIcsmtLexlrVuA?=
 =?us-ascii?Q?uLTxp/sR81D0ynXySAM8+xg0DQtVf94OXt50q+6YOwVwmwbBncLLCSz4chMI?=
 =?us-ascii?Q?ENu4G1tzqIIom9/gydZAEk8vB71Yn4RYMNLyE59wznC/0p533n6kHJWUa7Sk?=
 =?us-ascii?Q?JAFsvHHywBYyWtO9ENdFSH/butYz64TrQzjMsysNyg8eUNmwlGRZS89393mg?=
 =?us-ascii?Q?cmf4WyFbndP0e97Tz4wQ78aXC9kYaGRqYxlKHtGsYRdsgsr0RKxyrThTZlOh?=
 =?us-ascii?Q?09+Ha4p4AihBKGFQ5uooWDeK1GSZPfCoHiyE69CzBpneATs8fJtdzSHos2PH?=
 =?us-ascii?Q?k8W73NJ8zIHVy+CSw6ZXklicSpRA50kFmGTzO1E93hDkas/RJXr4bLVhTrFO?=
 =?us-ascii?Q?VNP/LTQIseUbgiWcQG/lovdboC92zSP+N184IFJsY5Rkigetx59ujlrz8q/O?=
 =?us-ascii?Q?dXygxx2D1wxPK/jtZ0Q5+z6lujFt3QaiEZjQq2zvD1wl86blVwyKv75bQQnF?=
 =?us-ascii?Q?skprUzzcNw2tw6kWjrU8BPyxzNK3tesquldLSm2qZEkUVva9rVRd4zUR1V74?=
 =?us-ascii?Q?BPGjoim+MQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	rXhMj6X8uOe4XsZRBPyvC2frfEsVJjEG9QdBmZlshPF61zty5hVrPrb4mPQvaUBWQYwz3SXcQznPsaqPHPwzjr1iSTP58WtkOB3t58Qi76uhqVpzdA3o4C9qpLCQdZg59GkwH1FQAV6MnCTZOJT45Ooz6nyqzmrNdmq9gt0Zmz3i+BjKAD3GdrEPLH11lrhSE1g0UOIXYxHBwbX9vgq717GrCAl3gYGOH4LJ3THKoHuveVnL3E2SMIwYc78c/YjkzVWL9NWkd6jaWY0+jvAWndq2tg1bpo+Sxdh7S9H5sPn50KXn10dCwUaqcmcu7+NZe9ifFwF17D/mXQoKSM18iw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aqV2I4HTA+pT9GR6j/OMiZ7cZQaPiPw0mcu7/s6/kYHNdCsUyFiEqEuwy4WiloOOdmNR114AwYNOxVwDVQO4C1Ca68LelgFqaD9yn7Y+MD0b/MpwP9gsRq7ChzLhLOFuLi93qzc1f5iQ/WMNgzH2OYhUk2JLZ2d+SLYtX6HvQts8uobKSttrBf/cJEzy+O3rB300c1S9fcwiCLfymVWNbtwDTZ2vmlGB+/gNtbHnVgjY5RP/WO0IaNuCJr/6DEOTNLdIP3+iB3SpTgUgeQ+5eFsC71M3d74FSs63gA0tKgWWBZfS80Nl5q6oQr7LVaYuxFw8BKuTdf2LxZh50NM0tUeW0eZC+8e6cH1PEBWnlDHp2S3nCSyhrBQLfwtQsQujTvqdp0o+Bv556pHkM7+HZC+TKW0XB21jhro9Ef7zGu3J2gTKAacDZ5lAFSzuGutA7iT/eBO/R5K+/wCOh4oJ3KOIGfEOdQrxbqr+MjSNDe4UnXasIxcCq+h6h/B2rcXQJySZQF14aOCOZy67UX8AK4gh8oSsb/EMQ9x/BcpItmQfgA+ErLaT18i1eTdbbckE73jLZCLvQm6SKpAPcC4ui6GdgqPMPCfwaweCX1H1W+I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57018c31-8f65-4c6e-5308-08de9ca46ac4
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:11:51.4812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPv6Rc1EHSbAWJEVnTjOHAC7s4OYsYRYNE9SoRBqPRN8M2HiL/5SiHdHNEuxg0IY3PtXWs0992xgekbDEJePLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5694
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2604070000 definitions=main-2604170173
X-Proofpoint-ORIG-GUID: c0vT5nRwsdToCNmeAn7HOG7I55t76RiE
X-Proofpoint-GUID: c0vT5nRwsdToCNmeAn7HOG7I55t76RiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE3MyBTYWx0ZWRfXxpeYcE+YAUC7
 ecaBWhZJ7VBOB5zWrnCP5t9dp4H7YyX4kh2qih8LJ7tv6z0CL1LRW9VVvrTVJ8eilR7Drg2KycF
 3AiqdCbH1QuNRj2OPWUDegP3iJsm2qMTUdjb8ZESw5J2jiBHGJsFCRHhBLl8Pqu/k8FmH0Gy0nf
 w4AjZoyCRGK/MpsML26fLOtSRIams/DIUZ7O9JZtaMYT+aNOte2uXzaTMd88WaUGvxv+0VJvLLW
 8w9BmB8o5SwDVuhSW1TKQNFy+r15sYmYslyhj+kQywUH/1WJBIVtulI5WXl6+xWxqKBmXJLFVuL
 Ps414+NNBH9VsnGbOZccJq2bJKhGds6qoZwWrU3wf0ZwMUYnE3/CSxxnPAEVbWZWFLsi9pgqKLa
 DacUTWJWIpXRJtLR/4utjl+CFLBxBxJTbIdkOxXohFl2UiK9OJCbYQ9hJMMKjt9MY0/KMY/cTUG
 MHSoS4HK9uGfJFveED0ibOTRfNZgi+dfHjhet26E=
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=69e269df b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=UDo75xZVUMoK8bP2ShwA:9
 a=O8hF6Hzn-FEA:10 cc=ntf awl=host:12292

On 14 Apr 2026, Kris Van Hees uttered the following:

> Subject: Re: [PATCH 4/4] fbt: do not provide untraceable functins (for fprobes)

Typo.

> Ensure that we do not provide FBT probes for functions that cannot be
> probed using BPF fentry/fexit probes if fprobes are the default.

I guess falling back to kprobes for those single functions alone is
either too complicated or has unpleasantly visible side-effects?

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_prov_fbt.c | 47 ++++++++++++++++++++++++++---------------
>  1 file changed, 30 insertions(+), 17 deletions(-)
>
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 59e4583b2..a2f20c9bc 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -86,14 +86,30 @@ static int populate(dtrace_hdl_t *dtp)
>  }
>  
>  /* Create a probe (if it does not exist yet). */
> -static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
> +static int provide_probe(dtrace_hdl_t *dtp, dt_module_t *dmp,
> +			 dtrace_probedesc_t *pdp)
>  {
>  	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
>  
>  	if (prv == NULL)
>  		return 0;
> +	pdp->mod = dmp->dm_name;
>  	if (dt_probe_lookup(dtp, pdp) != NULL)
>  		return 0;
> +
> +	/*
> +	 * The BPF verifier does not allow fentry/fexit probing of variadic
> +	 * functions.

This comment is wrong now that this is being implemented via another
function: the fact that dt_btf_func_is_traceable() checks variadicity
belongs above that function (and is indeed there).  Something like

/*
 * Do not provide probes for functions with BTF that indicates that they
 * are not traceable.
 */

maybe?

> +	 */
> +	if (prv->impl->prog_type == BPF_PROG_TYPE_TRACING) {
> +		int32_t	btf_id;
> +
> +		btf_id = dt_btf_lookup_name_kind(dtp, dmp, pdp->fun, BTF_KIND_FUNC);
> +		if (btf_id <= 0 ||
> +		    !dt_btf_func_is_traceable(dtp, dmp->dm_btf, btf_id))
> +			return -1;
> +	}
> +
>  	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
>  		return 1;
>  

The hunks below appear to be doing something not called out in the
commit log. I think this is getting the symbol module right?

> @@ -173,16 +189,15 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  
>  			pd.id = DTRACE_IDNONE;
>  			pd.prv = pdp->prv;
> -			pd.mod = dmp->dm_name;
>  			pd.fun = pdp->fun;
>  
>  			if (prb & FBT_ENTRY) {
>  				pd.prb = "entry";
> -				n += provide_probe(dtp, &pd);
> +				n += provide_probe(dtp, dmp, &pd);
>  			}
>  			if (prb & FBT_RETURN) {
>  				pd.prb = "return";
> -				n += provide_probe(dtp, &pd);
> +				n += provide_probe(dtp, dmp, &pd);
>  			}
>  
>  			return n;
> @@ -190,22 +205,20 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  
>  		sym = dt_symbol_by_name(dtp, pdp->fun);
>  		while (sym != NULL) {
> -			const char	*mod = dt_symbol_module(sym)->dm_name;
> -
> +			dmp = dt_symbol_module(sym);
>  			if (dt_symbol_traceable(sym) &&
> -			    dt_gmatch(mod, pdp->mod)) {
> +			    dt_gmatch(dmp->dm_name, pdp->mod)) {
>  				pd.id = DTRACE_IDNONE;
>  				pd.prv = pdp->prv;
> -				pd.mod = mod;
>  				pd.fun = pdp->fun;
>  
>  				if (prb & FBT_ENTRY) {
>  					pd.prb = "entry";
> -					n += provide_probe(dtp, &pd);
> +					n += provide_probe(dtp, dmp, &pd);
>  				}
>  				if (prb & FBT_RETURN) {
>  					pd.prb = "return";
> -					n += provide_probe(dtp, &pd);
> +					n += provide_probe(dtp, dmp, &pd);
>  				}
>  
>  			}
> @@ -242,16 +255,15 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  
>  		pd.id = DTRACE_IDNONE;
>  		pd.prv = pdp->prv;
> -		pd.mod = smp->dm_name;
>  		pd.fun = fun;
>  
>  		if (prb & FBT_ENTRY) {
>  			pd.prb = "entry";
> -			n += provide_probe(dtp, &pd);
> +			n += provide_probe(dtp, smp, &pd);
>  		}
>  		if (prb & FBT_RETURN) {
>  			pd.prb = "return";
> -			n += provide_probe(dtp, &pd);
> +			n += provide_probe(dtp, smp, &pd);
>  		}
>  	}
>  

The need for this trampoline change is also rather opaque.

> @@ -323,10 +335,11 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		 */
>  		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
>  		if (dmp && prp->argc == 2) {
> -			int32_t	btf_id = dt_tp_probe_get_id(prp);
> -			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
> -
> -			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
> +			emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
> +			emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> +			emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> +			emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ret]));
> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
>  			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
>  		}
>  	}

-- 
NULL && (void)
