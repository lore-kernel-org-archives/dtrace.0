Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBB24D599
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 22:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729723428; cv=fail; b=As1xaBC9ltZCZuPSo1nFc2HVdJ7jl1gMN3D2Y6RD0rP4EHAXTQeVD32vkd9pbwiOfl3P7CiS5rolyaTX/6Jf8IXCZx7qWSc2g3YTtVWDSXvnOAPOwB+RMqfWzdt1t4CCywgNg8JV/f78bf8e5cPkg3lqb/62ORpLr8l9BeMpIa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729723428; c=relaxed/simple;
	bh=GjPNrnZ9ZoYKzbuFAy8x8V3smq4gnz0iRgdFnNJTaD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h1yJPFx/m3eO5LIqVfVRMX8OJ83IcgSLnJTUjwUNRSexvV5O3UHbfqsmEvshyT2SRuxPrNbpHiZqSNQ4eguv/KeJoB/6WPsuhnYK1BGyO9Ewhd3I5y6493KumT9wXdQ3qEwBysNdcFCiwgDMU40VVTtMdMZC09YoISSUCUl0Teo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gnrrcI8U; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hkm250qJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gnrrcI8U";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hkm250qJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NKcv6g026939
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 22:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=icHKkuAcRSeXRGpXE9
	aavzLa6zM0gAtNF/fYKceoscI=; b=gnrrcI8UdLKXkVwL++D/Mcb/t/dGbsZKUc
	KCx/biuG/8dmNnpUluk6VQh2EU2kyJA1bs8yGA1RGswSKL3/9s7z1k3LcbdTXRIh
	kCX9pnsiO/UMbhfW0tXRJx0eDeQsCBsixnOYzb55QBok48VH+0//7o96QnAfLQE4
	29EW2jSAoLAWcXlWM9qdQpEzK8lNyjgyJoR4oUnxuzeNSjCYrr8YELQwD/rN2vhj
	8fHdUU4FI0yMObg11WXe0tdH0BfJjzx496vXh4ej16YL59KR2Li7ArSRqFAWrQ5B
	HTYAWUHsxvWwqrAEwhWTSl+gXD5TnnFqZNT7LQv2g6IXzdvclYbg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v1aj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 22:43:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49NMTYg0036077
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 22:43:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh34tua-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 23 Oct 2024 22:43:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbBCkBDinnTLZPVXJD2+GUokpn4F8sJeq0Wy4ccBc16hUmBX9as8res5Or2XXZeNN6ZJ/Owx9BoneDLtpsfkoFDtkkEHczyPNffNLFgAAsxaty2i9v5lJ/ac6yKQP/R3ZwAJlPghA395T5PvtVSVH6NvTC/Nyk3TUlLsWSdpIWHbvpfJVWQ3AVhiQt5Uu2zU6Osg4J3jgpeyQvsRnN9PfmnfwaX6+XMNTJTMwoL/wHGYa5+l4vSXDP1NkLcPEkHjElOvOuVKqJS2pZ4nN8BOns8os9keosA1ETNH2ryBcsaM9z3N+Bp4kSjuJzAlPYcPpJM+Jp17VXD8JpaNqsykTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icHKkuAcRSeXRGpXE9aavzLa6zM0gAtNF/fYKceoscI=;
 b=b/j6JBTGsmdXB24I6/BqkX0G7IpmO/Tubsmd88SOrZqUg8ex9x2QUPfQqArep5S2R9vFsjk+E9CZBiacqbGRcAW3X77YHrGaYV1Wqb36v71qc5T0BRSO1Xb0N/Cf6I7E3w8TkZvdVPI3lm/3CpZ+R1fEKGpEx7mHFfWFZ+q7g2qac65AHJnEfc8DLYMqmXbPMF3ao6yZ7XTHEtNJwfaF9q3x3lPxjLIDlDSdFpN6SmhXE9QyQT74/FgR63hYGsybwLRR5kbqLGSF1E5HRN7WjGV2kH0GPP1ON0AtwM12HPycqz/3dEwsK8zr0XmesUh0bqXFK4+1S69xR9LHhZ5ApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icHKkuAcRSeXRGpXE9aavzLa6zM0gAtNF/fYKceoscI=;
 b=Hkm250qJ8KgEGveE6fXLS//QWdYC+Qlzfgo4DGXyzOb7gphAjepIleantQ6YfYE2zVafMCm77HtYkrmrUQ61LbvbUNSkZETCqS+ZB/JCGNbanhN3TJxlZFeyiW8k7IRE4bhZcUfPnVj2vDoYDBfw/XMYNdO4ize5PhjTwGMluYg=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 22:43:38 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 22:43:38 +0000
Date: Wed, 23 Oct 2024 18:43:32 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v6 07/19] Create the BPF usdt_names and usdt_prids maps
Message-ID: <Zxl8FOFgvJrzUBc3@kvh-deb-bpf.us.oracle.com>
References: <20241016160139.29589-1-eugene.loh@oracle.com>
 <20241016160139.29589-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016160139.29589-2-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P123CA0671.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::11) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b325e8c-5ceb-45e7-ce30-08dcf3b42283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DGF0ksTcrlXo+nBlh9Z4aTrwJw61Zohu3NNg/p9poc+gPYTOswJlni31xl2w?=
 =?us-ascii?Q?K0wmAGm+iP5dBMSrpk8TbSWDj3Ry4b3D+YdQidpMif7sxmkN2ZmJR6+Sqz/p?=
 =?us-ascii?Q?S/570f6DFZlGd6RtqKIR3JC85gocpJ5Ru2bostY/wUo0OKEMO2b3VdhvJ5ny?=
 =?us-ascii?Q?mIBZybfX3BydQyRM4eSoUuJSvl2Hsoj2KkqKOdNPUlbzqQk9zLQqg/rVWNM5?=
 =?us-ascii?Q?notoONt4/HPvg/BFinVGrIGoVfwFMXXIp9bGSwG/8PsR1qIAdluQ+Dr0HZCM?=
 =?us-ascii?Q?SucxCW+QJpV/d5GkM392Yhew2VeWsmNzZRSigFFm67UwLEIWbEKWalUnPv1O?=
 =?us-ascii?Q?VbCDTuEaYDcmcM1WRr92aamPLI+JKfZuB8RZorXATNxda3eqd7f3IBb1DDr7?=
 =?us-ascii?Q?ZlHhGmqXZzlzrKr0J/yrFbPUbuUH6tH7klsDZW754JfGrF4eAqA+d59WwbZR?=
 =?us-ascii?Q?DwMX0IJCr5UrACczFoLcH4j1eVFGsFJc33JzUbt7lJI8Y4pOCHxd4J9x6lyc?=
 =?us-ascii?Q?L2hzwEpR5WmIx/CArj1c6VPcisSHUadrZlXkN2rswQgtK2LmD7bhY7lgBo4w?=
 =?us-ascii?Q?f4aNkz4BpUJLhzLLy824ftHxdprhSW1u2ct0o38tY+IzweO3MKt69ELkewvu?=
 =?us-ascii?Q?DFD97/cOksRsgrv4fBCTVsUCK9rXbIADtaSHIcr3waTdKl1OVSgksvDRjmsJ?=
 =?us-ascii?Q?Xusgi9mNgX4/mQlrxFfwYjvX41X01UIa73O+vFHXIW1oU/eTWvb+ZYxqUi6x?=
 =?us-ascii?Q?G4thyGTw2uotZBIwARxOGbZpwjtH0fD11fRhk/KqTD2ThLvWer3BL4O5/aDI?=
 =?us-ascii?Q?FOZj8kn5ORcLS/073Xq8n+98eghg7vEnoY5K1cUp5DWYtHx8mg9P9PsORJsJ?=
 =?us-ascii?Q?U0IMgh3yOTYv/HcA6R4x7kRzu+p+0bhnr64XU/A7WGR9TxBy4XAfe+2CDWXr?=
 =?us-ascii?Q?uHjbvld5WIibGMOGv6QsifFGj7nAIzrfZbw1DVvHQEWrGq1AsOGmhQlqRqf/?=
 =?us-ascii?Q?sHbGhBJxCf1OeVtIojHSbp/c0gidozY7UufncpvpVZw2tbJyCIZDf+/TRIaQ?=
 =?us-ascii?Q?T6v4wcRR7ayXwdDOzgXEvS9cALXz4X3UYkcX5kYjderXESx3WIXqx3Ev+klG?=
 =?us-ascii?Q?qYF3b4exAP6WhZmGi+Z5llMi+Ftz401PgrsmqwMeuf0MtgsNXfWGZP8+a9ub?=
 =?us-ascii?Q?ybOTvXpAR6qzOOnZ0hpHd2o4AJWJI+77jIl8WO9/AjOheXL+dgdyFhiezV6F?=
 =?us-ascii?Q?F46SOjwayL6+EAyJEJyRC0YVbw9EDS18mCfP4dxH8jmRfHKQwIB3NKTlhwvd?=
 =?us-ascii?Q?vEDyk+tcS1YVLHJd9uEIyPZI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?87xzFwAn+AzDjyTBsz38vkNMnAVBt+hMZWSSCzZ5nnosIQHRGiQ55RvJ2p8Y?=
 =?us-ascii?Q?18BFe4pWJ3SG/knbObr7UO+TZL1fKGbD75gQbWN6wPuaoNWAR2LEPvbFlbZb?=
 =?us-ascii?Q?Ikl2Kcf1X3SzzUDOif8AqDgM+1RQaBOLed9Qms1iQMOAy+etciMUPwVSETAH?=
 =?us-ascii?Q?1KyRb9QtBLkkgRZzySZ5wcO+Km4FbB/nmRnHJKhiTv6w9sVeRpMYBD9EPSnH?=
 =?us-ascii?Q?uSJbRZvmR2OYNKKA28tdGbvZP9wnYMZprQkrn89CvRFH2f7jSBsOsidXt8qY?=
 =?us-ascii?Q?mrWKiOeBMH+7Q1mTZTBrTcgRYgC8cF1bHU1Fq5LVCBt6JEVB3rF/tRy/IC0Y?=
 =?us-ascii?Q?xFbb5bynocTdSJ54J/lr4VdmW0j9AdG9Z1VjAtFwTysQyI2zRnRf2Jda+t5K?=
 =?us-ascii?Q?ZAVCyv507BOfXVwff66AoukpR5KTJ4QCqVj1ysUcMH2SR3HYflWR1Ss72u8e?=
 =?us-ascii?Q?lS3qYiuE7XjjDJgpbOHAbCWed3FZThPoqdim15o1bWXGXFGJYYLJWYyfA72y?=
 =?us-ascii?Q?5G8eJQd3fY8qCSAhNBhWyBBadwB1Yx/oW7Dr5buWs5nb0Veghx68ROZSwpcm?=
 =?us-ascii?Q?VBwW6U0MN2ejT0g41lkmFJbCTrfl6ZNGxepMwT/Mdekh5iuzJWfdUqQV262u?=
 =?us-ascii?Q?42rdRJ4btT01++PneLTAZttncbVqFRrBASN4hMBJHv6N12249C8jEiAo4jxW?=
 =?us-ascii?Q?G2Lw2V2kMSNiiXzvUCtVlGp/utpk+cJsND/qE8MSGJsJxZ2W6BUhh71D1QIZ?=
 =?us-ascii?Q?BgCwyv3S3aJqX9UEfD+5bWVRzsF4OXqFYRrBh5gxwq647c9L4yT9QC18ogBK?=
 =?us-ascii?Q?F1B2paotLA5dBu4wb4Wy/GmzMryiGdg0DLlQnjWioSjiaB74uWJgh6ebn7Yy?=
 =?us-ascii?Q?Qwi5UmXyUrGJxmyXRIBWZoanAXrUi+0Y7vfBW+IcP5T3VWfMa9CCkQ92P2UC?=
 =?us-ascii?Q?t0C9EWusZb9wzf5w8+RxEkv5AEFuG8z5x8yGdlD3I4cQL7+RauLTPcqhSUwC?=
 =?us-ascii?Q?ifKUzZbAwf2ITOVxUYzHP9PjYVjcP2Ko+bivgBcCIOo12FpRmMHZtSTYGRi9?=
 =?us-ascii?Q?mCCCWib0pq8zN5WCURyG325xXV1aKYOG8yhpRCpyTvNSnAJed8lrvje+I8d1?=
 =?us-ascii?Q?RrUm0Y47HCGND8/pZkuNxr2fxOlqaHxSrMx8rjKm0wd8x0/xpdrXGKXVrm4I?=
 =?us-ascii?Q?MQR211B8GNRrYogK/qR7xfQL/wqadPl4jGW3oRWwnV+AVvll/yaa66r9inF6?=
 =?us-ascii?Q?iElJqkAH8UB+jfJwSnHGRtcNTMIeuMF748Lj9DrWGe9wk5CfN6qkIsJnLshE?=
 =?us-ascii?Q?kvSguA45HveZBqaGaVwxnkum19LIEijPNjjXWEZhZMBAgrQL5W99UgShrZnK?=
 =?us-ascii?Q?GYkZHyNsSiYIIjZteQokp5wZT6aH1Oo5qRs/vS9Z8+kYxuMOiQr3Zn71ObiK?=
 =?us-ascii?Q?lCudO/raAexU3VDotUNh1rrTRaqbfUyhxy9s5OjEJmAa74mhu64RmSTiRARK?=
 =?us-ascii?Q?wtl2AA5ayYJF/DIIyhL34zOFLCpmBe7dSOINRql/tzvmHeab70lQVhAMsYB4?=
 =?us-ascii?Q?T+4pYGb8rHUGYK8lXNuKb7o8flRTdOCfJ3Zlix5quoQaFG1K5GOMpMixNq/d?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	62zRRggfQg0XgpUvebkg9W+KA2aJKrKUCTwUtoNPdqu9q0q7jh6dfGkJSYK/1JtTOmOFvbRqoJgSwVLRN3Y/128I0ge0aXCHCZHBKVl9vXVBxgh+wSLw6xd+W6t+SjMGDqKJ0Pwi/Djxg0lPcAlabcgSZzDTOh4/CNTDkpzmQDKTZVdX15nLx46A9GeiTJv9v0XFBb2OyKdQB3cFrf1zMvEhFFNP+XOe1D5V9BiLGLCZY3OoAuUp3jk24hMK/EA9HJ+0MnN166UhHytRODZ8MuOnGKyMwUF67yThCkhzgx+qBfGMiw7GKMeLH2bw1X1aweyQNJJfrjPc5nbqaKCSMZm1N79uzZRJuoAf7ci+7MdXdHo/oRW/KZ7nxK9NTNBAjd7wC3NoUOerTwFPffXHRqM2n7tVom1EuSHngwbw82r1e00EH6I6LHEIREQnP8uaWUus/CxBB0yeO3KPdbR7MPxkqbM/bNHa+CSAy26aSMkLyfMXS0SMLSdtVpWbbJhHZ109+bgM6pmRyDc7PFG0LM+yAGmmud210i5pW299RpvuBGqVgn2pD5BmKODY5K1O7j47XgLioNOqWRa/Xa6f8wjYcVgPPksJjwX6PyoXVS8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b325e8c-5ceb-45e7-ce30-08dcf3b42283
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 22:43:38.2513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xy5Uwkx34gqa8OCGg7ikOx+nRg8R91wc8fM5evEwZFs7wtE5DeDUJXfH1xggHXbIRSU+8ko1P8spZlIHgxpC4SEPz1Rvk6+oiKhdtA+xiqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6798
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_17,2024-10-23_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410230148
X-Proofpoint-GUID: lp-jy-rfsIWGkuEBZJJcI27bZmzWIerU
X-Proofpoint-ORIG-GUID: lp-jy-rfsIWGkuEBZJJcI27bZmzWIerU

On Wed, Oct 16, 2024 at 12:01:37PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> As USDT processes come and go, the set of overlying probes for an
> underlying probe will change.  Hence, we will move to a scheme in
> which an underlying probe program will walk all possible clauses
> that any of its possible overlying probes might call, for each
> overlying probe only executing the clauses that apply, using a
> bitmask.
> 
> In this patch, we create and update the BPF "usdt_prids" map.  This
> is a hash map, where:
> 
>   *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
>         - the PID of the firing process
>         - the PRID of the underlying probe
> 
>   *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
>         - the PRID over the overlying USDT probe
>         - a bit mask indicating which clauses should be called
> 
> As USDT processes start up, we also add new overlying USDT probes,
> whose name elements must be retrievable by prid for the built-in
> variables probeprov, probemod, probefunc, and probename.  While
> those strings are currently in the BPF "strtab" map, that monolithic
> table cannot safely be updated by the consumer while the kernel might
> be reading the map.  Therefore, we introduce a new variable,
> dtp->dt_nprobes, that records the number of probes at the time of
> dtrace_go().  For a prid < dtp->nprobes, get_bvar() uses the existing
> scheme to retrieve probe name elements.  For newer prids, necessarily
> USDT probes, use the new BPF "usdt_names" map instead.
> 
> The number of new USDT probes that can be accommodated at any one time
> is set by the new "nusdtprobes" option.
> 
> The size of the bit mask limits the number of clauses, currently 64,
> an underlying probe might call.  This is relatively easy to extend;
> nevertheless, that work is left for a future patch.
> 
> We also want to be able to add new underlying probes, even after
> dtrace_go() has finished.  Therefore, make dt_bpf_load_prog() callable
> outside of dt_bpf.c and call dt_construct(), dt_link(),
> dt_bpf_load_prog(), and attach() to add any new underlying probes.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... small comment below...

> ---
>  bpf/get_bvar.c                   |  72 ++++---
>  include/dtrace/options_defines.h |   4 +-
>  libdtrace/dt_bpf.c               |  38 +++-
>  libdtrace/dt_bpf.h               |   4 +
>  libdtrace/dt_bpf_maps.h          |   9 +
>  libdtrace/dt_cc.c                |   3 +
>  libdtrace/dt_dlibs.c             |   3 +
>  libdtrace/dt_impl.h              |   5 +-
>  libdtrace/dt_open.c              |   8 +
>  libdtrace/dt_options.c           |   1 +
>  libdtrace/dt_prov_uprobe.c       | 331 ++++++++++++++++++++++++++++++-
>  libdtrace/dt_provider.c          |   1 +
>  libdtrace/dt_provider.h          |   1 +
>  13 files changed, 450 insertions(+), 30 deletions(-)
> 
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index 37f29a591..ceb700bf1 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -22,6 +22,7 @@
>  extern struct bpf_map_def cpuinfo;
>  extern struct bpf_map_def probes;
>  extern struct bpf_map_def state;
> +extern struct bpf_map_def usdt_names;
>  
>  extern uint64_t PC;
>  extern uint64_t STBSZ;
> @@ -29,6 +30,7 @@ extern uint64_t STKSIZ;
>  extern uint64_t BOOTTM;
>  extern uint64_t STACK_OFF;
>  extern uint64_t STACK_SKIP;
> +extern uint64_t NPROBES;
>  
>  #define error(dctx, fault, illval) \
>  	({ \
> @@ -122,32 +124,52 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
>  	case DIF_VAR_PROBEMOD:
>  	case DIF_VAR_PROBEFUNC:
>  	case DIF_VAR_PROBENAME: {
> -		uint32_t	key;
> -		dt_bpf_probe_t	*pinfo;
> -		uint64_t	off;
> -
> -		key = mst->prid;
> -		pinfo = bpf_map_lookup_elem(&probes, &key);
> -		if (pinfo == NULL)
> -			return (uint64_t)dctx->strtab;
> -
> -		switch (id) {
> -		case DIF_VAR_PROBEPROV:
> -			off = pinfo->prv;
> -			break;
> -		case DIF_VAR_PROBEMOD:
> -			off = pinfo->mod;
> -			break;
> -		case DIF_VAR_PROBEFUNC:
> -			off = pinfo->fun;
> -			break;
> -		case DIF_VAR_PROBENAME:
> -			off = pinfo->prb;
> +		uint32_t	key = mst->prid;
> +
> +		if (key < ((uint64_t)&NPROBES)) {
> +			dt_bpf_probe_t	*pinfo;
> +			uint64_t	off;
> +
> +			pinfo = bpf_map_lookup_elem(&probes, &key);
> +			if (pinfo == NULL)
> +				return (uint64_t)dctx->strtab;
> +
> +			switch (id) {
> +			case DIF_VAR_PROBEPROV:
> +				off = pinfo->prv;
> +				break;
> +			case DIF_VAR_PROBEMOD:
> +				off = pinfo->mod;
> +				break;
> +			case DIF_VAR_PROBEFUNC:
> +				off = pinfo->fun;
> +				break;
> +			case DIF_VAR_PROBENAME:
> +				off = pinfo->prb;
> +			}
> +			if (off > (uint64_t)&STBSZ)
> +				return (uint64_t)dctx->strtab;
> +
> +			return (uint64_t)(dctx->strtab + off);
> +		} else {
> +			char *s;
> +
> +			s = bpf_map_lookup_elem(&usdt_names, &key);
> +			if (s == NULL)
> +				return (uint64_t)dctx->strtab;
> +
> +			switch (id) {
> +			case DIF_VAR_PROBENAME:
> +				s += DTRACE_FUNCNAMELEN;
> +			case DIF_VAR_PROBEFUNC:
> +				s += DTRACE_MODNAMELEN;
> +			case DIF_VAR_PROBEMOD:
> +				s += DTRACE_PROVNAMELEN;
> +			case DIF_VAR_PROBEPROV:
> +			}
> +
> +			return (uint64_t)s;
>  		}
> -		if (off > (uint64_t)&STBSZ)
> -			return (uint64_t)dctx->strtab;
> -
> -		return (uint64_t)(dctx->strtab + off);
>  	}
>  	case DIF_VAR_PID: {
>  		uint64_t	val = bpf_get_current_pid_tgid();
> diff --git a/include/dtrace/options_defines.h b/include/dtrace/options_defines.h
> index 80246be8c..7a49b89f2 100644
> --- a/include/dtrace/options_defines.h
> +++ b/include/dtrace/options_defines.h
> @@ -63,7 +63,9 @@
>  #define	DTRACEOPT_SCRATCHSIZE	33	/* max scratch size permitted */
>  #define	DTRACEOPT_LOCKMEM	34	/* max locked memory */
>  #define	DTRACEOPT_PRINTSIZE	35	/* max # bytes printed by print() action */
> -#define	DTRACEOPT_MAX		36	/* number of options */
> +#define	DTRACEOPT_NUSDTPROBES	36	/* max number of (added) USDT probes */
> +
> +#define	DTRACEOPT_MAX		37	/* number of options */
>  
>  #define	DTRACEOPT_UNSET		(dtrace_optval_t)-2	/* unset option */
>  
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 7a36b6187..1024867c9 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -940,6 +940,41 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>  	return 0;
>  }
>  
> +/*
> + * Create the 'usdt_names' and 'usdt_prids' BPF maps.
> + *
> + * 'usdt_names':  a global hash map indexed by PRID and whose value has probe
> + *                name elements at fixed offsets within the value.  This map
> + *                is used for get_bvar() to look up probe name elements for
> + *                any prid that was created after dtrace_go().
> + *
> + * 'usdt_prids':  a global hash map indexed by (pid, underlying probe ID).
> + *                The value is a probe ID for the overlying USDT probe and
> + *                a bit mask indicating which clauses to execute for this pid.
> + *
> + *                For a given (pid, PRID) key, there can be at most one
> + *                overlying USDT probe.
> + */
> +static int
> +gmap_create_usdt(dtrace_hdl_t *dtp)
> +{
> +	size_t nusdtprobes = dtp->dt_options[DTRACEOPT_NUSDTPROBES];
> +
> +	dtp->dt_usdt_namesmap_fd = create_gmap(dtp, "usdt_names", BPF_MAP_TYPE_HASH,
> +	    sizeof(dtrace_id_t), DTRACE_FULLNAMELEN, nusdtprobes);
> +	if (dtp->dt_usdt_namesmap_fd == -1)
> +		return -1;
> +
> +	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
> +	    sizeof(usdt_prids_map_key_t), sizeof(usdt_prids_map_val_t), nusdtprobes);
> +	if (dtp->dt_usdt_pridsmap_fd == -1)
> +		return -1;
> +
> +	dtp->dt_nprobes = dtp->dt_probe_id;
> +
> +	return 0;
> +}
> +
>  /*
>   * Create the 'gvars' BPF map.
>   *
> @@ -1045,6 +1080,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
>  	CREATE_MAP(scratchmem)
>  	CREATE_MAP(strtab)
>  	CREATE_MAP(probes)
> +	CREATE_MAP(usdt)
>  	CREATE_MAP(gvars)
>  	CREATE_MAP(lvars)
>  	CREATE_MAP(dvars)
> @@ -1093,7 +1129,7 @@ dt_bpf_reloc_prog(dtrace_hdl_t *dtp, const dtrace_difo_t *dp)
>   *
>   * Note that DTrace generates BPF programs that are licensed under the GPL.
>   */
> -static int
> +int
>  dt_bpf_load_prog(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  		 const dtrace_difo_t *dp, uint_t cflags)
>  {
> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> index 5716d2320..6518de663 100644
> --- a/libdtrace/dt_bpf.h
> +++ b/libdtrace/dt_bpf.h
> @@ -14,6 +14,7 @@
>  #include <dtrace/difo.h>
>  #include <dt_btf.h>
>  #include <dt_impl.h>
> +#include <dt_probe.h>
>  
>  struct dtrace_hdl;
>  
> @@ -54,6 +55,7 @@ extern "C" {
>  #define DT_CONST_ZERO_OFF		20
>  #define DT_CONST_STACK_OFF		21
>  #define DT_CONST_STACK_SKIP		22
> +#define DT_CONST_NPROBES		23
>  
>  #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
>  #define DT_BPF_LOG_SIZE_SMALL	4096
> @@ -88,6 +90,8 @@ extern int dt_bpf_prog_load(struct dtrace_hdl *, const struct dt_probe *prp,
>  			    size_t sz);
>  extern int dt_bpf_raw_tracepoint_open(const void *tp, int fd);
>  extern int dt_bpf_make_progs(struct dtrace_hdl *, uint_t);
> +extern int dt_bpf_load_prog(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> +			    const dtrace_difo_t *dp, uint_t cflags);
>  extern int dt_bpf_load_progs(struct dtrace_hdl *, uint_t);
>  extern void dt_bpf_init(struct dtrace_hdl *dtp);
>  
> diff --git a/libdtrace/dt_bpf_maps.h b/libdtrace/dt_bpf_maps.h
> index 0dd36b16c..3a42ee5ad 100644
> --- a/libdtrace/dt_bpf_maps.h
> +++ b/libdtrace/dt_bpf_maps.h
> @@ -42,6 +42,15 @@ struct dt_bpf_cpuinfo {
>  	uint64_t	lockstat_stime;	/* lockstat: spin time */
>  };
>  
> +typedef struct usdt_prids_map_key {
> +	int		pid;		/* should be pid_t, unistd.h? */
> +	uint32_t	uprid;		/* should be dtrace_id_t, sys/dtrace_types.h */
> +} usdt_prids_map_key_t;
> +typedef struct usdt_prids_map_val {
> +	uint32_t	prid;		/* should be dtrace_id_t, sys/dtrace_types.h */
> +	long long	mask;
> +} usdt_prids_map_val_t;
> +
>  #ifdef  __cplusplus
>  }
>  #endif
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index 4202771a9..fa16f8e5f 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -1064,6 +1064,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>  				nrp->dofr_data = sizeof(uint64_t)
>  				    * dtp->dt_options[DTRACEOPT_MAXFRAMES];
>  				continue;
> +			case DT_CONST_NPROBES:
> +				nrp->dofr_data = dtp->dt_nprobes;
> +				continue;
>  			case DT_CONST_BOOTTM:
>  				if (boottime == 0 && get_boottime())
>  					return -1;
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index ba4d4abef..07d22afdc 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -71,6 +71,8 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(strtab, DT_IDENT_PTR),
>  	DT_BPF_SYMBOL(tuples, DT_IDENT_PTR),
> +	DT_BPF_SYMBOL(usdt_names, DT_IDENT_PTR),
> +	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
>  
>  	/* BPF internal identifiers */
>  	DT_BPF_SYMBOL_ID(PRID, DT_IDENT_SCALAR, DT_CONST_PRID),
> @@ -95,6 +97,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>  	DT_BPF_SYMBOL_ID(ZERO_OFF, DT_IDENT_SCALAR, DT_CONST_ZERO_OFF),
>  	DT_BPF_SYMBOL_ID(STACK_OFF, DT_IDENT_SCALAR, DT_CONST_STACK_OFF),
>  	DT_BPF_SYMBOL_ID(STACK_SKIP, DT_IDENT_SCALAR, DT_CONST_STACK_SKIP),
> +	DT_BPF_SYMBOL_ID(NPROBES, DT_IDENT_SCALAR, DT_CONST_NPROBES),
>  
>  	/* End-of-list marker */
>  	{ NULL, }
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 340dc1960..36afa4c68 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -319,7 +319,8 @@ struct dtrace_hdl {
>  	 */
>  	struct dt_probe **dt_probes; /* array of probes */
>  	size_t dt_probes_sz;	/* size of array of probes */
> -	uint32_t dt_probe_id;	/* next available probe id */
> +	dtrace_id_t dt_probe_id; /* next available probe id */
> +	dtrace_id_t dt_nprobes;	/* number of probes, at dtrace_go() */
>  
>  	struct dt_probe *dt_error; /* ERROR probe */
>  
> @@ -389,6 +390,8 @@ struct dtrace_hdl {
>  	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
>  	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
>  	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
> +	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
> +	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
>  	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
>  	void *dt_errarg;	/* error handler argument */
>  	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 1f586fc4f..e1972aa82 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -797,6 +797,14 @@ dt_vopen(int version, int flags, int *errp,
>  	dtp->dt_options[DTRACEOPT_SWITCHRATE] = 0;
>  	dtp->dt_options[DTRACEOPT_AGGRATE] = 0;
>  
> +	/*
> +	 * Set the default maximum number of (added) USDT probes.
> +	 */
> +	dtp->dt_options[DTRACEOPT_NUSDTPROBES] = 256;
> +
> +	/*
> +	 * Pre-processor.
> +	 */
>  	dtp->dt_cpp_argv[0] = (char *)strbasename(dtp->dt_cpp_path);
>  
>  	snprintf(isadef, sizeof(isadef), "-D__SUNW_D_%u",
> diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> index ec53358b3..377b396b0 100644
> --- a/libdtrace/dt_options.c
> +++ b/libdtrace/dt_options.c
> @@ -1137,6 +1137,7 @@ static const dt_option_t _dtrace_rtoptions[] = {
>  	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
>  	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
>  	{ "maxframes", dt_opt_runtime, DTRACEOPT_MAXFRAMES },
> +	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
>  	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
>  	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
>  	{ "scratchsize", dt_opt_scratchsize, DTRACEOPT_SCRATCHSIZE },
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index bb172ace2..ceb331719 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -39,6 +39,7 @@
>  #include "dt_probe.h"
>  #include "dt_pid.h"
>  #include "dt_string.h"
> +#include "port.h"
>  
>  /* Provider name for the underlying probes. */
>  static const char	prvname[] = "uprobe";
> @@ -63,6 +64,11 @@ typedef struct list_probe {
>  	dt_probe_t	*probe;
>  } list_probe_t;
>  
> +typedef struct list_key {
> +	dt_list_t		list;
> +	usdt_prids_map_key_t	key;
> +} list_key_t;
> +
>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -82,8 +88,15 @@ static int populate(dtrace_hdl_t *dtp)
>  	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
>  			       &dt_uprobe_is_enabled, &pattr, NULL) == NULL ||
>  	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
> -			       NULL) == NULL ||
> -	    dt_provider_create(dtp, dt_usdt.name, &dt_usdt, &pattr,
> +			       NULL) == NULL)
> +		return -1;			/* errno already set */
> +
> +	return 0;
> +}
> +
> +static int populate_usdt(dtrace_hdl_t *dtp)
> +{
> +	if (dt_provider_create(dtp, dt_usdt.name, &dt_usdt, &pattr,
>  			       NULL) == NULL)
>  		return -1;			/* errno already set */
>  
> @@ -123,6 +136,316 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
>  	free_probe_list(dtp, datap);
>  }
>  
> +/*
> + * Disable an overlying USDT probe.
> + */
> +static void probe_disable(dtrace_hdl_t *dtp, dt_probe_t *prp)
> +{
> +	list_probe_t	*pup;
> +
> +	/* Remove from enablings. */
> +	dt_list_delete(&dtp->dt_enablings, prp);
> +
> +	/* Make it evident from the probe that it is not in enablings. */
> +	((dt_list_t *)prp)->dl_prev = NULL;
> +	((dt_list_t *)prp)->dl_next = NULL;
> +
> +	/* Free up its list of underlying probes. */
> +	while ((pup = dt_list_next(prp->prv_data)) != NULL) {
> +		dt_list_delete(prp->prv_data, pup);
> +		dt_free(dtp, pup);
> +	}
> +	dt_free(dtp, prp->prv_data);
> +	prp->prv_data = NULL;
> +}
> +
> +/*
> + * Clean up stale pids from among the USDT probes.
> + */
> +static int
> +clean_usdt_probes(dtrace_hdl_t *dtp)
> +{
> +	int			fdprids = dtp->dt_usdt_pridsmap_fd;
> +	int			fdnames = dtp->dt_usdt_namesmap_fd;
> +	usdt_prids_map_key_t	key, nxt;
> +	usdt_prids_map_val_t	val;
> +	list_key_t		keys_to_delete, *elem, *elem_next;
> +	dt_probe_t		*prp, *prp_next;
> +
> +	/* Initialize list of usdt_prids keys to delete. */
> +	memset(&keys_to_delete, 0, sizeof(keys_to_delete));
> +
> +	/* Initialize usdt_prids key to a pid/uprid that cannot be found. */
> +	key.pid = 0;
> +	key.uprid = 0;
> +
> +	/* Loop over usdt_prids entries. */
> +	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
> +		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
> +
> +		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
> +			return dt_set_errno(dtp, EDT_BPF);
> +
> +		/* Check if the process is still running. */
> +		if (!Pexists(key.pid)) {
> +			/*
> +			 * Delete the usdt_names entry.
> +			 *
> +			 * Note that a PRID might correspond to multiple
> +			 * sites.  So, as we loop over usdt_prids entries,
> +			 * we might delete the same usdt_names entry
> +			 * multiple times.  That's okay.
> +			 */
> +			dt_bpf_map_delete(fdnames, &val.prid);
> +
> +			/*
> +			 * Delete the usdt_prids entry.
> +			 *
> +			 * Note that we do not want to disrupt the iterator.
> +			 * So we just add the key to a list and will walk
> +			 * the list later for actual deletion.
> +			 */
> +			elem = calloc(1, sizeof(list_key_t));
> +			elem->key.pid = key.pid;
> +			elem->key.uprid = key.uprid;
> +			dt_list_append((dt_list_t *)&keys_to_delete, elem);
> +
> +			continue;
> +		}
> +
> +		/*
> +		 * FIXME.  There might be another case, where the process
> +		 * is still running, but some of its USDT probes are gone?
> +		 * So maybe we have to check for the existence of one of
> +		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
> +		 *     char *prv = ...pdp->prv minus the numerial part;
> +		 *
> +		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
> +		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> +		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
> +		 */
> +	}
> +
> +	/*
> +	 * Delete the usdt_prids keys in our list.
> +	 */
> +	for (elem = dt_list_next(&keys_to_delete); elem != NULL; elem = elem_next) {
> +		elem_next = dt_list_next(elem);
> +
> +		dt_bpf_map_delete(fdprids, &elem->key);
> +		free(elem);
> +	}
> +
> +	/* Clean up enablings. */
> +	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
> +		pid_t		pid;
> +
> +		prp_next = dt_list_next(prp);
> +
> +		/* Make sure it is an overlying USDT probe. */
> +		if (prp->prov->impl != &dt_usdt)
> +			continue;
> +
> +		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> +		/*
> +		 * Nick writes:
> +		 * This is a general problem with running compiler-adjacent things outside
> +		 * compile time. I think we should adjust dt_pid_error() so that it works
> +		 * with NULL pcb and dpr at once, probably by using the code path for
> +		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
> +		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
> +		 * already handle this case.)
> +		 */
> +		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
> +
> +		if (Pexists(pid))
> +			continue;
> +
> +		probe_disable(dtp, prp);
> +	}
> +
> +	return 0;
> +}
> +
> +static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
> +{
> +	dtrace_difo_t   *dp;
> +	int		cflags, fd, rc = -1;
> +	dtrace_optval_t	dest_ok = DTRACEOPT_UNSET;
> +
> +	/*
> +	 * Strictly speaking, we want the value passed in to
> +	 * dtrace_go().  In practice, its flags pertain to
> +	 * compilation and disassembly, which at this stage
> +	 * no longer interest us.
> +	 */
> +	cflags = 0;

This is something we may want to look at later (maybe add a FIXME) because
your assertion that cflags no longer interests us isn't entirely true because
the construction of the trampoline might be something we do want to get debug
output about (e.g. disassembly).

> +
> +	/* Check if the probe is already set up. */
> +	if (prp->difo)
> +		return 0;
> +
> +	/* Make program. */
> +	dp = dt_construct(dtp, prp, cflags, NULL);
> +	if (dp == NULL)
> +		return 0;        // FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
> +	prp->difo = dp;
> +
> +	/* Load program. */
> +	if (dt_link(dtp, prp, dp, NULL) == -1)
> +		return 0;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
> +
> +	dtrace_getopt(dtp, "destructive", &dest_ok);
> +	if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
> +	    dest_ok == DTRACEOPT_UNSET)
> +		return dt_set_errno(dtp, EDT_DESTRUCTIVE);
> +
> +	fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
> +	if (fd == -1)
> +		return 0;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
> +
> +	if (prp->prov->impl->attach)
> +		rc = prp->prov->impl->attach(dtp, prp, fd);
> +
> +	if (rc == -ENOTSUPP) {
> +		char    *s;
> +
> +		close(fd);
> +		if (asprintf(&s, "Failed to enable %s:%s:%s:%s",
> +			      prp->desc->prv, prp->desc->mod,
> +			      prp->desc->fun, prp->desc->prb) == -1)
> +			return dt_set_errno(dtp, EDT_ENABLING_ERR);
> +		dt_handle_rawerr(dtp, s);
> +		free(s);
> +	} else if (rc < 0) {
> +		close(fd);
> +		return dt_set_errno(dtp, EDT_ENABLING_ERR);
> +	}
> +
> +	return 0;
> +}
> +
> +static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
> +{
> +	char				probnam[DTRACE_FULLNAMELEN], *p;
> +	const dtrace_probedesc_t	*pdp = prp->desc;
> +	int				fd = dtp->dt_usdt_namesmap_fd;
> +	pid_t				pid;
> +	list_probe_t			*pup;
> +
> +	/* Add probe name elements to usdt_names map. */
> +	p = probnam;
> +	memset(p, 0, sizeof(probnam));
> +	snprintf(p, DTRACE_PROVNAMELEN, "%s", pdp->prv);
> +	p += DTRACE_PROVNAMELEN;
> +	snprintf(p, DTRACE_MODNAMELEN, "%s", pdp->mod);
> +	p += DTRACE_MODNAMELEN;
> +	snprintf(p, DTRACE_FUNCNAMELEN, "%s", pdp->fun);
> +	p += DTRACE_FUNCNAMELEN;
> +	snprintf(p, DTRACE_NAMELEN, "%s", pdp->prb);
> +	if (dt_bpf_map_update(fd, &pdp->id, probnam) == -1)
> +		assert(0);   // FIXME do something here
> +
> +	/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> +	/*
> +	 * Nick writes:
> +	 * This is a general problem with running compiler-adjacent things outside
> +	 * compile time. I think we should adjust dt_pid_error() so that it works
> +	 * with NULL pcb and dpr at once, probably by using the code path for
> +	 * pcb != NULL and augmenting it so that it passes in NULL for the region and
> +	 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
> +	 * already handle this case.)
> +	 */
> +	pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
> +
> +	/* Even though we just enabled this, check it's still live. */
> +	if (!Pexists(pid)) {
> +		probe_disable(dtp, prp);
> +		dt_bpf_map_delete(fd, &pdp->id);
> +
> +		return 0;
> +	}
> +
> +	/* Add prid and bit mask to usdt_prids map. */
> +	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> +		dt_probe_t		*uprp = pup->probe;
> +		long long		mask = 0, bit = 1;
> +		usdt_prids_map_key_t	key;
> +		usdt_prids_map_val_t	val;
> +		dt_uprobe_t		*upp = uprp->prv_data;
> +
> +		/*
> +		 * For is-enabled probes, the bit mask does not matter.
> +		 * It is possible that we have this underlying probe due to
> +		 * an overlying pid-offset probe and that we will not know
> +		 * until later, when some new pid is created, that we also
> +		 * have an overlying USDT is-enabled probe, but missing this
> +		 * optimization opportunity is okay.
> +		 */
> +		if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
> +			int n;
> +
> +			for (n = 0; n < dtp->dt_stmt_nextid; n++) {
> +				dtrace_stmtdesc_t *stp;
> +
> +				stp = dtp->dt_stmts[n];
> +				if (stp == NULL)
> +					continue;
> +
> +				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
> +				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
> +				    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
> +				    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
> +					mask |= bit;
> +
> +				bit <<= 1;
> +			}
> +		}
> +
> +		key.pid = pid;
> +		key.uprid = uprp->desc->id;
> +
> +		val.prid = prp->desc->id;
> +		val.mask = mask;
> +
> +		// FIXME Check return value, but how should errors be handled?
> +		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Discover new probes.
> + */
> +static int discover(dtrace_hdl_t *dtp)
> +{
> +	int		i;
> +	dt_pcb_t	pcb;
> +
> +	/* Clean up stale pids from among the USDT probes. */
> +	clean_usdt_probes(dtp);
> +
> +	/* Discover new probes, placing them in dt_probes[]. */
> +	/*
> +	 * pcb is only used inside of dt_pid_error() to get:
> +	 *     pcb->pcb_region
> +	 *     pcb->pcb_filetag
> +	 *     pcb->pcb_fileptr
> +	 * While pcb cannot be NULL, these other things apparently can be.
> +	 */
> +	memset(&pcb, 0, sizeof(dt_pcb_t));
> +	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
> +		dtrace_stmtdesc_t *stp;
> +
> +		stp = dtp->dt_stmts[i];
> +		if (stp == NULL)
> +			continue;
> +		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
> +	}
> +
> +	return 0;
> +}
>  
>  /*
>   * Look up or create an underlying (real) probe, corresponding directly to a
> @@ -782,6 +1105,7 @@ dt_provimpl_t	dt_uprobe = {
>  	.probe_info	= &probe_info,
>  	.detach		= &detach,
>  	.probe_destroy	= &probe_destroy_underlying,
> +	.add_probe	= &add_probe_uprobe,
>  };
>  
>  /*
> @@ -816,7 +1140,10 @@ dt_provimpl_t	dt_pid = {
>  dt_provimpl_t	dt_usdt = {
>  	.name		= "usdt",
>  	.prog_type	= BPF_PROG_TYPE_UNSPEC,
> +	.populate	= &populate_usdt,
>  	.provide_probe	= &provide_usdt_probe,
>  	.enable		= &enable_usdt,
>  	.probe_destroy	= &probe_destroy,
> +	.discover	= &discover,
> +	.add_probe	= &add_probe_usdt,
>  };
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 5f9766183..dd17627ba 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -41,6 +41,7 @@ const dt_provimpl_t *dt_providers[] = {
>  	&dt_sdt,
>  	&dt_syscall,
>  	&dt_uprobe,
> +	&dt_usdt,
>  	NULL
>  };
>  
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 384d4fd33..8f143dcea 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -88,6 +88,7 @@ extern dt_provimpl_t dt_sched;
>  extern dt_provimpl_t dt_sdt;
>  extern dt_provimpl_t dt_syscall;
>  extern dt_provimpl_t dt_uprobe;
> +extern dt_provimpl_t dt_usdt;
>  
>  extern const dt_provimpl_t *dt_providers[];
>  
> -- 
> 2.43.5
> 
