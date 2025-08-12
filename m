Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B112F0661
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 22:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755038781; cv=fail; b=OBPSBJryOreCCRI3p8IfxPn0E33ZjGH7+uMcpLQXMM5ISASBu8If69C9aDI5gRUCS/GpUa/fqCOXqfW93Dma7EdSpvRlXKccxQtAMhTXs9QCy3cGvcXSOQ7d4Lu6+DCel2AbYv6/DWt5ylqeN+//BOE61o7K7MDBm+ZEIfMNbVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755038781; c=relaxed/simple;
	bh=9IWM86QjabHSZKP1CRwTKzzJcVdhRWG4s6tqCoCovX0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nb/zekIifhQpU6iZql+/DB3z2m2udp0h9Kfxy+LvVgkPx10C6TUx9AhBwMeEMthmK/JdDZJhQ8em2waWqb02EMIAbcLgyH7CPRbNOj07ddY7Pvabn405AkvMGOuIqiKV0zijazRAtj/6Qz8MdxmBouudXFBcrgKk7ELSjQytvzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=liJtquf1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FkvBL/Vq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="liJtquf1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FkvBL/Vq"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLQq2r025512
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 22:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=uAF1nkymrcBbFJuQvJ8dJjAsf5WWp/p0nNP3ZlTyqnA=; b=
	liJtquf1XqdtAv50GOyAG97iIGNhBeJHuNK55c1yTe0y1SwT2PzPmP5uXgdw4+LJ
	n31B5t4gJdkyVld3xle3/8jePXsJzN1Wy1GPLtj4u0Bnt6o76FDWJOloWkNj/3kA
	K1eKQMqBng+1nUnmUymVed/FrISqc9+DY7OXXtTPVSWc1ALK2zhjc4WCXCX0eiJR
	EIRbHo7CgX4/Xogcr8HaShQjdMMc+TmZgyt9qjjPaYR2mg8zYW0Dp1Tml7roIemv
	Ng5axgsn5TsJnNwgJZZdWj39NQ+y8RphiLCW8mNmQYG+/Q3ioq0Absv/IHpn24nG
	wGva4tab5yPn34+m7y3ixA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4dy1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 22:46:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CMVAth030166
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 22:46:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsak67r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 22:46:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8VUHiEGB5ISgLfGbK6NPjHsaNwH4lPIQgONdODV7/Kmw93/WvQKHwjfIuE6XBEXkZH9tTUYsEr+TsTPaTE8css4B5VKG66v5abuFeuTCO/Im8OfsOl08f10B3Q5Thmq7ktryHcOGMRUnYWyRB7auXRPd/m4iJc4AULJojwWK7xOPsmbFdqG1diVh3R3NH4a3rsE+RmoD0bakCHEW5uFww37qofg3cRALoEtHnpJLpLfJ2LKFvb48rJdfyEu4lDCRk1T9YJYa8+h0WUNgNoj2HzkQgC5hTCykyGzZPQVlzraBckL6pOPlLB1IquHtjxi4GO2mwebQYjwirzM+NYh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAF1nkymrcBbFJuQvJ8dJjAsf5WWp/p0nNP3ZlTyqnA=;
 b=SoZvSzxGesDZzxFnWGl2GrfsuoXME3NvjkasDvWZ4/GR1e0WzdSb/PtVZRE9CwtIad+TMPo+R18dic6mvje6dN3XUQq0NgAIGfdNB6TbzImjYozoTGOa8bDbvc5hA084nNt5HaQDed50mUsQ+NCFiTz7xaIK4CcrN0wAkkR+x27NQWOdse6cW2a52ZsozzJBDyasUd/Z2Aj36F5449mL2kZCK7Xo/R1Eg3Drd5CxMQUC6sJvllAjntek9RY1s/tbh7cYPH1dEewBRfoTjxA57dtwWvQWtZRJb26fcDqAZz3ZwkyXhdcxSE/70wmnUfWzRwmEMNTkuE4wAdGU1R4aoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAF1nkymrcBbFJuQvJ8dJjAsf5WWp/p0nNP3ZlTyqnA=;
 b=FkvBL/VqgCU/tKhz86n7+pwxMIdmXMeO2z039+vYf4DcBtstElZ5n8t3mp/OeHFjTLCZDYhUNmEFoYCKkA54XQsFU8e+GCZ3eOTMq8pNhiyHtYGYJXOLKzEKsPj110YUHKLYfR+qx3A2G9A+TcpROS3X61PF02/5oKyOtmGiH+o=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by PH7PR10MB5854.namprd10.prod.outlook.com (2603:10b6:510:127::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 22:46:15 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 22:46:15 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] Use a consistent type for dtrace_consume()
Date: Tue, 12 Aug 2025 18:46:06 -0400
Message-Id: <20250812224606.16606-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250812224606.16606-1-eugene.loh@oracle.com>
References: <20250812224606.16606-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::16) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|PH7PR10MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: cddc8b73-eedf-48eb-cc81-08ddd9f20b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmN2V2hFeWFaWGpmK2hOTWF6YW5CUE1LZ0ZqYVhHMVZyRE5Xbm9KOW5vWXNo?=
 =?utf-8?B?M3BSdlNoeFd6QjRWR2gxeWRJdHpPdVg4bHJzTXZ1dU5QSXZKaUVsVk56NElz?=
 =?utf-8?B?aHhOLzJ5NVl4dTdSaDBibTJGdDltY0k5T1ppcmE3dHQwaG9pMlFSbHhHSkZS?=
 =?utf-8?B?WXFGK0RJaUpYM1lzcVJHTUN3Uzh4b2tUbFVLSm9zVGZHbVA1YkxNa1Z6UTdM?=
 =?utf-8?B?OWhXWkNRVCs3TGhya09xbkF4dzgvbFJyc3RzcytnODI3NXlMcG5raU1kNnBz?=
 =?utf-8?B?NG5vK0VxSUFFUGNwSkU0M2x1Y284MUhxQTArSldDSG41QkZjQ2ZuN3ZDdE5k?=
 =?utf-8?B?N1U5RkRmNlp6TDJUemxjNHdvdlRpUFh1TzFKK1dmTGMzTE9lSS9PMHZHWVR0?=
 =?utf-8?B?b2VCZUxqOE5hZnhXVmV6enlYRldrVW8vdDZBeTUrOWlQazIyK1kwU0hyNGgw?=
 =?utf-8?B?SElsOG1jT1ExaVIrRzFwbUxlbnVRN3hrSVVXb01hdUlKSms0LzdmNEJYTXdo?=
 =?utf-8?B?YjdUTGNjNUF4TURiTEdKcTgwcWthTkMwZGxlUGxWZVVyR2s5akloRHNKanRu?=
 =?utf-8?B?NWcvb2tsRnpoWjFDOWtFa28zbFJKREsrNlljNTZkTHEyUkJXN3JjOTQxYVlu?=
 =?utf-8?B?ZWFoS1oxbXpYTWpoSlkwOUlwQUswOEZDYVh6M09YMExXTklwZCtpZGJrRWRZ?=
 =?utf-8?B?T1M4YjRaZVpnTHI0NXVQdTIwZjJkRGJaQ0duaTJ5aXRKbm1JSm1OTDdxM0NJ?=
 =?utf-8?B?WVRTVzNiNHZmOHdPVWZvL0U5WkhmVkdzSzNyRWIvdFcrQlY1cjNvc3hGbG1m?=
 =?utf-8?B?RG5LaTdQUi8zZGwyb3FtdTZUQkdFZHVYclMrdTYvTXd1OU9NY2liKy9YdW16?=
 =?utf-8?B?TGtsRWpIbnBVTys1UVBsQTR4VG93UVZ1aklUTExhSVlHeDM0cm9FazhqWmFO?=
 =?utf-8?B?T0xLTktFT3FMVC9FQUwwWHNDVDN3NEkvbVZKOGpuV2t6V21JMVI3WFZ2NTVt?=
 =?utf-8?B?Y0NZenlPT2x5d05SYW9YMkI4MlJ5M0ZlbWFGcFEvMW14aGFQejcrNkhFeEZ4?=
 =?utf-8?B?cm1MZ2VNZmM1WlRzVGZYK0E5K29senNydlEvREdFSjJRNGhtNXBqZUVIMmxL?=
 =?utf-8?B?SmRrSlVHaXRFQXYyQzBMSjZZSzk1NlFoa216UmJvbVlVUTRVZUZPeTZqancr?=
 =?utf-8?B?SzRmN0ZnNlQ5SkI1aWpxNHRjaEs3dXVsSnczODlFTmx2NUt3b3VXenkwR3c1?=
 =?utf-8?B?dytabHpGQ2NuM2F0TVIyN29RblNUa1EzQ3pJUElUeDNzRXZiRXBYQUZ0bUNC?=
 =?utf-8?B?aGZQOW5vbFphYUoyWnNabzV5dXczNmdsK3V4WkxSQVBkVDdpRDBnUjgvV0Fy?=
 =?utf-8?B?ZmI4OW9hakxKeWpFY0xESGJjdCtnQVBwaFVocUdLNnNyNFV2UG9uaVY0Rk5l?=
 =?utf-8?B?bXp4QkFHdUNzQkxjdXB6TE5NdlhKRndGVS9PRlhWZWRLdGtmRVB2MTFuYkcr?=
 =?utf-8?B?dHBMMUVVcVJpU0J0aFVqYWJlUm5aeWhnTmY5U2tIQmJrK3htSUp6dlNUSnVU?=
 =?utf-8?B?enk0OThZMFpTVXROczFodlRoWHdTOGJON3ZadVJWbldwcVZNclJLL0dFV1hJ?=
 =?utf-8?B?dW1FUHRZODRFd0dxTjdiMEIwTUdYdDA5OXo5RllOTVkyTWtSZm50bWRsTHFw?=
 =?utf-8?B?YUp2QTd3YVJqWmdJNHU4dVNpekR2RjRsaE9HMS82aVprcGJHZiswMTJ5YlNO?=
 =?utf-8?B?M0UxaWtDbzRoS0VHY094Y1hmdm16Rko1MlhMSDIvdDIzQ2dtNDBwTFBydnJJ?=
 =?utf-8?B?TUFmbHNqUjZ4d1p2d0wrMGtOTzRBZk5MbEEwem9zWkFJblI5VDRYK1ljd0Rs?=
 =?utf-8?B?U1JCbFhVL2RkRUtSazJydTZhQ010c2FNVmF5WmdzQ0o2ajlINlk3N1Y0MEtY?=
 =?utf-8?Q?7w7d/0mkIoM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TE44dXRqZzB0WENBTDZCWGdUeTI1ZFJ5Y1M3MVNzUTNPZThaMVVNdUtIZkFB?=
 =?utf-8?B?S01LOVJoMkFxYy9NL0NlS282a2VLa0VQYllDODZQd1F2RGdoZktOcm1uU0s4?=
 =?utf-8?B?Si8yMGkzdHdKVlFpa1A2MVdzY01HZ1JEOGRWM2FocjBvKytodldXcStuTkdy?=
 =?utf-8?B?eG5qV1RjWnc0ZkRvU3Iwb21veG1Xc3dtRjFDL2IyaUdXTUN0ME84L2IvajZQ?=
 =?utf-8?B?Yk94aHNaWEttYjA3d2FCQ0VMT283c0VPb3luaE1jSEM3ZFNYODNyeGFOYlVW?=
 =?utf-8?B?a1lIKy8yZGdYOUVQdHlZWDR2cytydFk3TitHc1lUSUpVZFRLY09WQWVtdlE3?=
 =?utf-8?B?dEx2UWxqOHV0azdqQ1lEUTdDYlhyWGRkNkFCZ1lsTHFTVDd1WjNwd0VieDZR?=
 =?utf-8?B?dHNLNzBTalFCU2h2VVFkWkFPbjNkR01JV2RLakV5Tlp4dmZMcDRvT1pVVnRv?=
 =?utf-8?B?cld0YnZMRWFIUHJ6T2JTd1ZwdjdWUEtTbGI3SThDUWs0cHhxMkZGSVRZcU5H?=
 =?utf-8?B?OG1SMUtDNzd0SjRsNURZZVY1cG1mdjN4OTlkOE90U3BRZDV1RElKS3FScUVi?=
 =?utf-8?B?aXFIOElCeUszaVZ0bUJHU3pEQXYvZTViRnNJVXhzNjVvZHdiWVQxTjE2c0Zr?=
 =?utf-8?B?MGlkd2NXdWxOK245Lyt3U0tyajFlclFxNFlnOW9uaWhnbVFyTTJOczhOV0VF?=
 =?utf-8?B?RDBCUXlQWTIxYllxdDBtbXh6NDJZUFBxY0wzcWhKRVdzT1o1cG4wL2tlTE5q?=
 =?utf-8?B?VVZtdlpUYThwblZRQzhrT0J0bHNFbGRtOTZQS1NZRGJKYi8wdGpRaHFXMVN3?=
 =?utf-8?B?WURLR3dyQ3E4OWlhU2QwRVB3SUJoMlZ0aUlaQmNHcHZCSDVFODdmMXpFRTJz?=
 =?utf-8?B?SlFWU1RTaWhxQndzTG5FeVZoVnNRSU0zUzRRYTR3K2NRejN4akVjcmhEUXRG?=
 =?utf-8?B?Nko5S2tUajFoczZnMjB4ZDUrTUVvbk1SSE5nTjZmQnVOUzNaOHVOcmtncHph?=
 =?utf-8?B?Ui9hOUl3Mmg3aGFYRFRWQmNSM0dQRlJTS2NuaWs2VDBGZmlDOWQ4WlQ2NU5n?=
 =?utf-8?B?NmtSYWt5NDgvaitYYVVuQ2Y2Qm1WanBFR1VnT2NmRG80cHR5ZEt1UjcwMHpB?=
 =?utf-8?B?SzhnaGdVUG1iTks1NzVIbmd5SlUzUnNLZi94VHlnb29GUE5mamVVNkdndkYz?=
 =?utf-8?B?SnpjNzNZOWVTaVhpQlR5WXVCN1VIdkwzakVBckNBWWRTY29DWFNqdG9WWW1K?=
 =?utf-8?B?SC9QY2xxRFE5bWxHdTQ1b2JKMEhtOG9zaS9nQ1piRHBmMHhPQVRHVURmWGw0?=
 =?utf-8?B?WnNJcE5Yc0FVbi9LNjczUDZqUjg4YTJiQVR4RUxvMjZpU0cxak1FdWdYQmFO?=
 =?utf-8?B?bHduKy9hZjhqSHNJaWxNRHhCOTVEYzNka2k5WFFMb25lSXJBQjlZMWloT0or?=
 =?utf-8?B?M2l5VWJycGZMK2NEM0UrOW5udUl5T3JxTTBDcmJ3a2h5OERjQlNsZWloRlV4?=
 =?utf-8?B?Rm00SVpRUUdmcU9Tc0ZrN2UwNkUrb3l3eEF1K0RuR2xuOEl4SGxaUk82Z3Zs?=
 =?utf-8?B?T3ZlWm5VV1F2d0RLMU5vaTNvdCtjcVZVY2dpMHNqUW9rQ2w1RE5LTkZOUkQx?=
 =?utf-8?B?VzB1VWhITERnMGZOMTVWZ2ZRMjZjTEFZWmJxTmp1d3c0Ym8rUEQ1dll5Rmxu?=
 =?utf-8?B?TFNSbjBzYUk2OWdSRFdEZ0dJeVFKb0p3cWRPaUJQNUZDeGs5R0N6VWlyQzgw?=
 =?utf-8?B?dWEyVTA5SERKNTZkeEkwTk44MEFMN3pTTGFSUE1Janllb1lKRmRhQkJ3SUxK?=
 =?utf-8?B?UEFKKzE4UXJacUloWUxQQW8yalNDVTlPWTR3Q3JwYzF1Y21mT2JlMitvclhE?=
 =?utf-8?B?VlVPMDJwSlhhWmNMckg1VjdrR2Y3QkszWVFrNmNpTTdMVExNM05HQzBCUWdy?=
 =?utf-8?B?RzRxSTQ0K21abkw5QmtEMWFoR1N3citiYXI2VmhYSFhacWNGUTlxejhyNVNj?=
 =?utf-8?B?MlhlMDR5VTFyY09CVU83YUNiOXBka3hlZGh5YWUrbkFRY0lYeDVVckZoYld3?=
 =?utf-8?B?VDc4WndCMENmOC9XSDdpeXRaZXYzb09WTGp1S3Fid1NiUldNTXM3UXlMNUYw?=
 =?utf-8?Q?sF+5QyLqnmPGsiWHe7SXOvNB8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MUtCqNATyJFol5x7gPYCkucNV5ozRKYEr/cd2j4JgJuBHCiEvVSlpdWwuvm6LWWR/7P7KD7uXqnw3cnGfj7LP8e+vTMT5Mfe+H4h2jGTqMj3xPgCYkRMkVIi4PdvHln0TgaXgzVQeLaJ1+PoaiDDkOWbN8w8Nw0kgaYL1w78d5TmjobofCvhGEcQ3AFLH4OjJkgHOKKNs1bPRQt94wyL4WIVUigMUUDlCQFQM4RDaxJesEBOzCOFliTSAe+uqXIvHRMLtbeYpngjkWPwS7N8YB/MUJ3t+G8TP56OO0Tcfj72GPo5Q/hxApdursMXItEoA1O+QVOR9JdkeHOL28wJ/8ar75K17O5PuxsTBGZpIYM/72/zr30sfgAQWf796fYLMOW7WHHYy0iasbKs30dTmcbvLATwk1++PipoonAqNgqOv1uZKkJlNk3drHg3GtEpFeHh0CCIlCxd1mcTHuta80v8yI+CYEYrm2kJs3SGWMrZC1a2mhJYJtJHGPu7KGsNADlJClxLL+WB3HkqlOo/+BKzKreORVBfWlM7kw/FANnHlcWpjYAIrudqlKTqZGFARzap2bfBoTgCewHqMxEdgj3vmAPj3v3zpC12OfH8hQo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cddc8b73-eedf-48eb-cc81-08ddd9f20b04
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 22:46:14.9714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LptnPoLtZmNTvf77RV4fmeqntW4yV6zWyILpbew4IrSrfWPiBHiwVEnZbjH+Dv1Ots8foZm7qoafvm+VKKZhug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5854
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508120218
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIxOSBTYWx0ZWRfX1uJ/qd7z/hr9
 TQDJofqxEDQ6ZhKQIykiNrY/LyuvlKKCXIh8IxglSxnTBf5ttNLXpb1gXzgbGUuaHNs8qisTdlV
 ZAM7PAWNA0bPr5Y9O2JNjIEPt1Q+TN6UU0PhRJnc+z4NmJ+Yc0g5LRJ3b5AQ1g5t9xAoeE1UXa9
 nyDtMPUyYVqNg/UlXTXpKH/UfxAwCk/r4ri1j3lDLOWc3+nOx51LNvS2gBYzvX5mFcVvwo+sEQy
 LEX8x+vqnTJ49mhu0JXzKJhadgqvDxBvy6HcqslR7DVpTVmzEkntu37IvarLkyF8+48+nUs50wd
 wCdpRS/SOiVs63gp09JS/HPn3Qt6xAgY2GRQ72tgPCEgJcEOFOMeU9r3A7b5IZuGpI6lcOJJNmt
 gP7eOeqTMdu16uFYQjcRCzpY3lbnbxpY80vth1xTawXzH//bjY+My7ZHQzThr94VELy7r9cL
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689bc43a cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=9qhQsmUW0PQbemNESJAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Cw8RtctmtqkwLeJwM0PQerRqjZa-Ze1w
X-Proofpoint-ORIG-GUID: Cw8RtctmtqkwLeJwM0PQerRqjZa-Ze1w

From: Eugene Loh <eugene.loh@oracle.com>

For a long time, the type of dtrace_consume() has been
- int                 according to libdtrace/dtrace.h
- dtrace_workstatus_t according to libdtrace/dt_consume.c

With some recent compilers, however, this triggers the warning (redacted
here):

    libdtrace/dt_consume.c:3041:1: warning: conflicting types
    for ‘dtrace_consume’ due to enum/integer mismatch;
    have ‘dtrace_workstatus_t(...)’ [-Wenum-int-mismatch]
     3041 | dtrace_consume(...)
          | ^~~~~~~~~~~~~~
    In file included from libdtrace/dt_impl.h:14,
                     from libdtrace/dt_consume.c:16:
    libdtrace/dtrace.h:210:12: note: previous declaration of
    ‘dtrace_consume’ with type ‘int(...)’
      210 | extern int dtrace_consume(...)
          |            ^~~~~~~~~~~~~~

which is a nuisance.

Note that dtrace_consume() is called from only one site, where its
value is compared to DTRACE_WORKSTATUS_ERROR, which is an argument
for the dtrace_workstatus_t type.

On the other hand, dtrace_consume() is defined to return a variety
of values, like 0, dt_set_errno(), and dt_consume_cpu(), all of which
are int, but also DTRACE_WORKSTATUS_OKAY, DTRACE_WORKSTATUS_ERROR,
and rval, all of which are dtrace_workstatus_t.  But then rval itself
is set to dtrace_workstatus_t dt_consume_begin() or int
dt_consume_cpu().  So, there is simply no consistency here.

Having the prototype be dtrace_workstatus_t requires some amount
of code refactoring.

Just change the definition to int and clean up the warning.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_consume.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 07b19d498..d9be563d9 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -3037,7 +3037,7 @@ dt_consume_fini(dtrace_hdl_t *dtp)
 	dt_htab_destroy(dtp->dt_spec_bufs);
 }
 
-dtrace_workstatus_t
+int
 dtrace_consume(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pf,
 	       dtrace_consume_rec_f *rf, void *arg)
 {
-- 
2.47.3

